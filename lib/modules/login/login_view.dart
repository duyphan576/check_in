import 'dart:convert';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/home/home_view.dart';
import 'package:check_in/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends StatelessWidget {
  final TextEditingController code = TextEditingController();
  final TextEditingController password = TextEditingController();
  GetStorage data = GetStorage();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _connect = GetConnect();
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/images/OIG.jpg'),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 55,
                    child: TextFormField(
                      controller: code,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: "Student ID",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  const Icon(Icons.password),
                  const SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 55,
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () async {
                  String url = '${Api.baseUrl}${Api.loginApi.login}';
                  final respone = await _connect.post(url,
                      {"code": "${code.text}", "password": "${password.text}"});
                  data.write("token", "${respone.body["access_token"]}");
                  url = '${Api.baseUrl}${Api.loginApi.me}';
                  var token = data.read("token");
                  final user = await _connect.get(
                    url,
                    headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      'Authorization': 'Bearer $token'
                    },
                  );
                  data.write("userData", user.body);
                  Students students = Students.fromJson(data.read("userData"));
                  print(students.code);

                  if (students.code != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeView(
                                  students: students,
                                  token: token,
                                )),
                        (route) => false);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // gradient: gradientButtonColors(),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
