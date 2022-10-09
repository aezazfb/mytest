import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';

class BleController {
  final frb = FlutterReactiveBle();
  late StreamSubscription<ConnectionStateUpdate> connection;
  late QualifiedCharacteristic rx;
  RxString status = 'not connected'.obs;
  RxString temperature = ' '.obs;

  void connect() async {
    status.value = 'connecting...';
    connection = frb.connectToDevice(id: '68:76:0B:0D:37:C2').listen((state){
      if (state.connectionState == DeviceConnectionState.connected){
        status.value = 'connected!';

        // get rx
        rx = QualifiedCharacteristic(
            serviceId: Uuid.parse("0000ffe0-0000-1000-8000-00805f9b34fb"),
            characteristicId: Uuid.parse("0000ffe1-0000-1000-8000-00805f9b34fb"),
            deviceId:'68:76:0B:0D:37:C2' );

        // subscribe to rx
        frb.subscribeToCharacteristic(rx).listen((data){
          temperature.value = ascii.decode(data).toString();
        });}});}}