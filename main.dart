import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';
//import 'package:mqtt_client/mqtt_client.dart';

void main() => runApp(MyApp());

/*
enum MqttCurrentConnectionState {
	IDLE,
	CONNECTING,
	CONNECTED,
	DISCONNECTED,
	ERROR_WHEN_CONNECTING
}
enum MqttSubscriptionState {
	IDLE,
	SUBSCRIBED
}

class MQTTClientWrapper {
	MqttClient client;

	MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
	MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

	final VoidCallback onConnectedCallback;
	final Function(String) onMessageReceived;

	void _setupMqttClient() {
		client = MqttClient.withPort('test.mosquitto.org', '#', 1883);
		client.logging(on: false);
		client.keepAlivePeriod = 20;
		client.onDisconnected = _onDisconnected;
		client.onConnected = _onConnected;
		client.onSubscribed = _onSubscribed;
	}

	Future<void> _connectClient() async {
		// try to connect to server
		try {
			print('MQTTClientWrapper::Mosquitto client connecting....');
			connectionState = MqttCurrentConnectionState.CONNECTING;
			await client.connect();
		} on Exception catch (e) { // stop trying to connect if we get an error
			print('MQTTClientWrapper::client exception - $e');
			connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
			client.disconnect();
		}
		if (client.connectionStatus.state == MqttConnectionState.connected) { // if connection successful
			connectionState = MqttCurrentConnectionState.CONNECTED;
			print('MQTTClientWrapper::Mosquitto client connected');
		} else { // connection fails
			print('MQTTClientWrapper::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
			connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
			client.disconnect();
		}
	}



	// subscribe to topic and listen for messages
	void _subscribeToTopic(String topicName) {

		print('MQTTClientWrapper::Subscribing to the $topicName topic');

		client.subscribe(topicName, MqttQos.atMostOnce);

		client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
			final MqttPublishMessage recMess = c[0].payload;
			final String newLocationJson =  MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
			print("MQTTClientWrapper::GOT A NEW MESSAGE $newLocationJson");
		});
		onMessageReceived(newLocationJson);

		MqttPublishPayload.bytesToStringAsString(messageBytes);
	}
}*/

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(
				primarySwatch: Colors.green,
			),
			home: Home(title: 'Smart Shelf'),
		);
	}
}

class Home extends StatefulWidget {
	Home({Key key, this.title}) : super(key: key);
	final String title;

	@override
	HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

//	final db = FirebaseDatabase.instance.reference();

	@override
	Widget build(BuildContext context) {

		return Scaffold(

			appBar: AppBar(
				centerTitle: true,
				title: Text(widget.title),
			),
			body: Center(
				child: Padding(
					padding: EdgeInsets.all(16),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Text('Verify your identity',
								style: TextStyle(
									fontSize: 24
								),
							),
							TextField(
								decoration: InputDecoration(
									hintText: 'Username',
									border: OutlineInputBorder(
										borderRadius: BorderRadius.all(
											Radius.circular(60)
										)
									),
								),
							),
							TextField(
								decoration: InputDecoration(
									hintText: 'Password',
									border: OutlineInputBorder(
										borderRadius: BorderRadius.all(
											Radius.circular(60)
										)
									),
								),
							),
							RaisedButton(
								onPressed: () {
//								db.collection("users").document("Hm14STjRzqaZOwIndEV3").setData({"Peter Griffin":1});

									setState(() {

									});
								},
								child: Text("Verify and take item"),
								shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
							),
						],
					),
				)
			),
		);
	}

	void createRecord() {
//		db.collection("users").document("user").setData({"no":5});
//		db.child("Peter Griffin").child();
		FirebaseDatabase.instance.reference().child("Peter Griffin").set({"Peter Griffin":1});
	}
}

class User {
	String name;
	int cupsBorrowed;

	User(this.name, this.cupsBorrowed);

}