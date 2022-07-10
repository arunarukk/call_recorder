import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';
import 'package:record/record.dart';

import '../main.dart';

class DialerButton extends StatefulWidget {
  final String number;
  final Color color;
  const DialerButton({
    Key? key,
    required this.number,
    required this.color,
  }) : super(key: key);

  @override
  State<DialerButton> createState() => _DialerButtonState();
}

class _DialerButtonState extends State<DialerButton> {
  PhoneStateStatus status = PhoneStateStatus.NOTHING;
  bool granted = false;

  Future requestPermission() async {
    var status = await Permission.phone.request();
    switch (status) {
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        return false;
      case PermissionStatus.granted:
        return true;
    }
  }

  setStream() {
    PhoneState.phoneStateStream.listen((event) {
      setState(() {
        if (event != null) {
          status = event;
        }
      });
    });
  }

  @override
  void initState() {
    setStream();
    super.initState();
    if (Platform.isIOS) setStream();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final record = Record();
        bool isRecording = await record.isRecording();
        if (widget.number == 'Call') {
          if (phoneNumberControl.text.isNotEmpty) {
            _callNumber(phoneNumberControl.text);

            if (await record.hasPermission()) {
              final date = DateTime.now();
              String name = 'no_name';
              if (nameControl.text.isNotEmpty) {
                name = nameControl.text;
              }
              String recordName = '${name}_${phoneNumberControl.text}_$date';

              await record.start(
                path: '/storage/emulated/0/Download/$recordName.m4a',
                encoder: AudioEncoder.aacLc,
                bitRate: 128000,
                samplingRate: 44100,
              );
              bool temp = await requestPermission();
              setState(() {
                granted = temp;
                if (granted) {
                  setStream();
                }
              });
            }
          }
        } else if (widget.number == 'Remove') {
          debugPrint(isRecording.toString());
          phoneNumberControl.clear();
          await record.stop();
        } else {
          phoneNumberControl.text = phoneNumberControl.text + widget.number;
        }

        debugPrint(isRecording.toString());
      },
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(color: Colors.black),
            BoxShadow(
              color: widget.color,
              blurRadius: 10.0,
              spreadRadius: -6,
            ),
          ],
        ),
        child: SizedBox(
          child: Center(
            child: Text(
              widget.number,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}
