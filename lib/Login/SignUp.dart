import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/Layout.dart';
import 'package:shopapp/component/component.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var signUpKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: signUpKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/logo.jpg'),
                              height: 125.0,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            DefaultTextForm(
                              context,
                              controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              label: 'Name',
                              onTap: () {},
                              preIcon: Icons.drive_file_rename_outline,
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'The name field is required';
                                } else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            DefaultTextForm(
                              context,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: 'Email address',
                              onTap: () {},
                              preIcon: Icons.email_outlined,
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {

                                  return 'Please enter some text';


                                } else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            //password form field

                            SizedBox(
                              height: 60,
                              width: 500,
                              child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }

                                    else
                                      return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: isPassword,

                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Type your password',
                                      prefixIcon: Icon(Icons.lock),
                                      suffix:  Icon(Icons.visibility_outlined),

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25.0)
                                      )
                                  )),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            DefaultButton(
                              function: () {
                                if (signUpKey.currentState!.validate()) {

                                  SignUp(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'SignUp',
                              isUpperCase: true,
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Go Login')),
                              ],
                            ),
                          ],
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

  void SignUp(
      {required String email,
        required String password,
        required String name}) async {

    final response = await http.post(
      Uri.parse('https://retail.amit-learning.com/api/register'),

      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {

      token = jsonDecode(response.body)["token"];
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) =>  Layout()));

    } else {
      throw Exception('unable to send your data');
    }
  }
}
