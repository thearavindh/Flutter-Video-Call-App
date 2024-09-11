import 'package:flutter/material.dart';
import 'package:flutter_app/pages/group_voice_call_page.dart';
import 'package:flutter_app/pages/video_call_page.dart';
import 'package:flutter_app/pages/voice_call_page.dart';

import '../components/components.dart';
import '../pages/group_video_call_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final Color color = const Color(0xFFa2d2ff);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Flutter Demo Video Call'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: userNameController,
                  validationMessage: 'Please enter user name',
                  hintText: 'name',
                  labelText: 'User name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: idController,
                  validationMessage: 'Please enter user ID',
                  hintText: 'ID',
                  labelText: 'User ID',
                ),
                const SizedBox(
                  height: 50,
                ),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    //mainAxisExtent: 100,
                    //childAspectRatio: 1,
                  ),
                  children: [
                    CustomCallButton(
                      text: "Voice Call",
                      icon: Icons.call,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VoiceCallPage(
                                callID: idController.text,
                                userName: userNameController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    CustomCallButton(
                      text: "video Call",
                      icon: Icons.videocam_rounded,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VideoCallPage(
                                callID: idController.text,
                                userName: userNameController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    CustomCallButton(
                      text: "Group Voice Call",
                      icon: Icons.add_call,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GroupVoiceCallPage(
                                callID: idController.text,
                                userName: userNameController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    CustomCallButton(
                      text: "Group Video Call",
                      icon: Icons.video_call,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GroupVideoCallPage(
                                callID: idController.text,
                                userName: userNameController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
