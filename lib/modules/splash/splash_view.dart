import 'package:check_in/modules/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  void initState() {
    //we use future to go from one screen to other via duration time
    Future.delayed(Duration(seconds: 5), () {
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      Get.to(LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      // Using Get.off instead of Get.to to remove the splash screen from the navigation stack
      Get.off(() => LoginView());
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Student',
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text('Check In',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  Image.asset(
                    'assets/images/OIG.jpg',
                    //25% of height & 50% of width
                    height: 25.h,
                    width: 50.w,
                  ),
                ],
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
