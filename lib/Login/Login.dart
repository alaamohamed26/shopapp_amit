import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/Layout.dart';
import 'package:shopapp/Login/SignUp.dart';
import 'package:shopapp/component/component.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

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
                        key: formKey,
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
                            DefaultTextForm(context,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: 'Email address',
                              onTap: (){},
                              preIcon: Icons.email_outlined,
                              validate: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            //password form field
                            TextFormField(
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
                                suffix: Icon(Icons.visibility_outlined,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 30.0,
                            ),

                            DefaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  Login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }

                              },
                              text: 'login',
                              isUpperCase: true,
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext context) => SignUp(),
                                    ),
                                  );
                                }, child: Text('Go SignUp')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );

  }
  void Login({required String email, required String password,}) async
  {
    //sending data to login api
    final response = await http.post(
      Uri.parse('https://retail.amit-learning.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{

        'email': email,
        'password': password,

      }),
    );
    if (response.statusCode == 200) {

      print('signed in');
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => Layout()));

      token=jsonDecode(response.body)['token'];


    }
    else {
      throw Exception('Unable to login');





    }
  }

}
