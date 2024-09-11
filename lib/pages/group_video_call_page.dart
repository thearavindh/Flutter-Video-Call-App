import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class GroupVideoCallPage extends StatelessWidget {
  const GroupVideoCallPage({Key? key, required this.callID, required this.userName})
      : super(key: key);
  final String callID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1391439772,
      appSign:
      "a7d09819eeb8027d70e4957c51528f5c62ec6eb70270581a22f5d43e23c5058a",
      userID: '${userName}123',
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
