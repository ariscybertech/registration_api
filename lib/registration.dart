import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController username = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  register(String username, name, lastname, surname, phone, password) async {
    Map data = {
      'username': username,
      'name': name,
      'lastname': lastname,
      'surname': surname,
      'phone': phone,
      'password': password
    };
    print(data);

    String body = json.encode(data);
    var url = 'https://py.dwed.biz/v1.0/api/account/create/';
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              TextFormField(
              controller: username,
              decoration: InputDecoration(
                hintText: 'Username'
              ),
            ),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'First Name'
              ),
            ),
            TextFormField(
              controller: lastname,
              decoration: InputDecoration(
                hintText: 'Last Name'
              ),
            ),
            TextFormField(
              controller: surname,
              decoration: InputDecoration(
                hintText: 'Surname'
              ),
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                hintText: 'Phone'
              ),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
              ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                  register(username.text, name.text, lastname.text, surname.text,
                      phone.text, password.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
