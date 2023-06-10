import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:window_manager/window_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<Color> bgColors = [Colors.orange, Colors.deepOrangeAccent];
  late bool pwdVisible = true;
  final TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 1,
              left: 1,
              child: IconButton(
                onPressed: () {
                  WindowManager.instance.close();
                },
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    FluentIcons.person_24_regular,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                    width: 350,
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w600),
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Icon(FluentIcons.person_24_regular,
                                color: Colors.grey[800]),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(width: 0.5)),
                          label: const Text(
                            "Username",
                            style: TextStyle(
                                letterSpacing: 1.2,
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )),
                    )),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                    width: 350,
                    child: TextField(
                      controller: pwdController,
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w600),
                      textCapitalization: TextCapitalization.characters,
                      obscureText: pwdVisible,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Icon(FluentIcons.lock_closed_24_regular,
                                color: Colors.grey[800]),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  pwdVisible = !pwdVisible;
                                });
                              },
                              icon: pwdVisible
                                  ? Icon(FluentIcons.eye_16_regular,
                                      color: Colors.grey[800])
                                  : Icon(FluentIcons.eye_off_16_regular,
                                      color: Colors.grey[800]),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(width: 0.0)),
                          label: const Text(
                            "Password",
                            style: TextStyle(
                                letterSpacing: 1.2,
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )),
                    )),
                const SizedBox(
                  height: 18,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget your password !",
                    style: TextStyle(letterSpacing: 1.0),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            )
                .animate()
                .fade(duration: const Duration(seconds: 3))
                .slide(duration: const Duration(seconds: 3)),
          ),
        ],
      ),
    );
  }
}
