#include <vector>
#include <iomanip>
#include <iostream>
#include <cmath>
#include <Turtlebot.hpp>
#include <sensor_msgs/msg/imu.hpp>

using namespace std;


// check if the robot is on the floor
bool Turtlebot::checkWheelDrop(){
	if (kobuki->isRightWheelDrop() || kobuki->isLeftWheelDrop()) {		
		//delete kobuki;
		//cout << " Wheel Drop" << endl;
		return false;
		//abort();
	}
	return true;
}


// オイラー角からクオータニオンへ変換
geometry_msgs::msg::Quaternion Turtlebot::translateCoordinate(double x, double y, double z){
	auto quaternion = geometry_msgs::msg::Quaternion();
	quaternion.w = cos(x/2)*cos(y/2)*cos(z/2) + sin(x/2)*sin(y/2)*sin(z/2);
	quaternion.x = sin(x/2)*cos(y/2)*cos(z/2) - cos(x/2)*sin(y/2)*sin(z/2);
	quaternion.y = cos(x/2)*sin(y/2)*cos(z/2) + sin(x/2)*cos(y/2)*sin(z/2);
	quaternion.z = cos(x/2)*cos(y/2)*sin(z/2) - sin(x/2)*sin(y/2)*cos(z/2);

	return quaternion;
}


// 速度制御
void Turtlebot::controleByVelocity(geometry_msgs::msg::Twist::SharedPtr msg) {
	checkWheelDrop();
	kobuki->setTargetVelocity(msg->linear.x, msg->angular.z);
}


// オドメトリのブロードキャスト
void Turtlebot::publishOdometry() {
    if (checkWheelDrop()){
	    auto odom_msg = nav_msgs::msg::Odometry();

	    kobuki->getPose(&N_position_x, &N_position_y, &N_orientation_theta);

	    // calculate delata time
	    now_time = chrono::system_clock::now();
	    auto delta_seconds = chrono::duration_cast<chrono::seconds>(now_time - base_time);
	    auto delta_milliseconds = chrono::duration_cast<chrono::milliseconds>(now_time - base_time);

	    millisec = delta_milliseconds.count() - delta_seconds.count()*1000;

	    odom_msg.child_frame_id = "base_footprint";
	    odom_msg.header.frame_id = "odom";
	    odom_msg.header.stamp.sec = delta_seconds.count();
	    odom_msg.header.stamp.nanosec = millisec;
	    odom_msg.pose.pose.position.x = N_position_x;
	    odom_msg.pose.pose.position.y = N_position_y;
	    odom_msg.pose.pose.orientation = translateCoordinate(0.0, 0.0, N_orientation_theta);

		odom_msg.twist.twist.linear.x = calculateVelocity(N_position_x, O_position_x, 0.02);
		odom_msg.twist.twist.linear.y = calculateVelocity(N_position_y, O_position_y, 0.02);

		odom_msg.twist.twist.angular.z = calculateVelocity(N_orientation_theta, O_orientation_theta, 0.02);

	    O_position_x = N_position_x;
	    O_position_y = N_position_y;
	    O_orientation_theta = N_orientation_theta;

	    odom->publish(odom_msg);
    }
    else{
    cout<< "can't publish odom";
}
}

void Turtlebot::publishJointStates() {
	auto right_encoder = kobuki->getRightMotorEncoder();
	auto right_rev_count = floor(right_encoder/2578.33);
	right_encoder = (right_encoder - right_rev_count*2578);
	auto right_wheel_degree = (right_encoder * 0.13962526131);
	auto right_wheel_radians = (right_wheel_degree * 3.141592653589793) / 180.0;

	cout << right_wheel_radians << endl;
	
	auto left_encoder = kobuki->getLeftMotorEncoder();
	auto left_rev_count = floor(left_encoder/2578.33);
	left_encoder = (left_encoder - left_rev_count*2578);
	auto left_wheel_degree = (left_encoder * 0.13962526131);
	auto left_wheel_radians = (left_wheel_degree * 3.141592653589793) / 180.0;

	cout << left_wheel_radians << endl;

	now_time = chrono::system_clock::now();
	auto delta_seconds = chrono::duration_cast<chrono::seconds>(now_time - base_time);
	auto delta_milliseconds = chrono::duration_cast<chrono::milliseconds>(now_time - base_time);

	auto joint_state_msg = sensor_msgs::msg::JointState();
	joint_state_msg.header.frame_id      = "joint_state";
	joint_state_msg.header.stamp.sec     = delta_seconds.count();
	joint_state_msg.header.stamp.nanosec = millisec;

	joint_state_msg.name.push_back("left_wheel");
	joint_state_msg.name.push_back("right_wheel");
	joint_state_msg.position.push_back(left_wheel_radians);
	joint_state_msg.position.push_back(right_wheel_radians);
	joint_state_msg.velocity.push_back(0.0);
	joint_state_msg.velocity.push_back(0.0);
	joint_state_msg.effort.push_back(0);
	joint_state_msg.effort.push_back(0);

	joint_state->publish(joint_state_msg);
}

void Turtlebot::publishBatteryState() {
	auto battery_msg = sensor_msgs::msg::BatteryState();

	now_time = chrono::system_clock::now();
	auto delta_seconds = chrono::duration_cast<chrono::seconds>(now_time - base_time);
	auto delta_milliseconds = chrono::duration_cast<chrono::milliseconds>(now_time - base_time);

	millisec = delta_milliseconds.count() - delta_seconds.count()*1000;

	battery_msg.header.frame_id      = "battery_level";
	battery_msg.header.stamp.sec     = delta_seconds.count();
	battery_msg.header.stamp.nanosec = millisec;
	battery_msg.voltage = kobuki->getBatteryVoltage();

	battery_state->publish(battery_msg);

}

// 速度計算
double Turtlebot::calculateVelocity(double N_position, double O_position, float time){
	return (O_position - N_position)/time;
}


// 回転慣性値のブロードキャスト
void Turtlebot::publishInertial() {
	auto imu_msg = sensor_msgs::msg::Imu();

	now_time = chrono::system_clock::now();
	auto delta_seconds = chrono::duration_cast<chrono::seconds>(now_time - base_time);
	auto delta_milliseconds = chrono::duration_cast<chrono::milliseconds>(now_time - base_time);

	millisec = delta_milliseconds.count() - delta_seconds.count()*1000;

	imu_msg.header.frame_id      = "imu";
	imu_msg.header.stamp.sec     = delta_seconds.count();
	imu_msg.header.stamp.nanosec = millisec;

	imu_msg.orientation = translateCoordinate(0, 0, kobuki->getInertialAngle());

	imu_msg.angular_velocity.x = 0.0;
	imu_msg.angular_velocity.y = 0.0;

	double InertialAngleRate = kobuki->getInertialAngleRate()/60000;
	bool flag = (int)InertialAngleRate;

	//if ( flag ) {
	//	cout << InertialAngleRate << endl;
	//} else {
	//	cout << -InertialAngleRate << endl;
	//}

	imu_msg.angular_velocity.z = kobuki->getInertialAngleRate();

	inertial->publish(imu_msg);
}