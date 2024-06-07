import 'package:authorization_app/validations/user_data_validation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? registeredPhone = prefs.getString('phoneNumber');
      String? registeredPassword = prefs.getString('password');

      if (_phoneController.text == registeredPhone &&
          _passwordController.text == registeredPassword) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Неверный номер телефона или пароль')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Номер телефона'),
                  validator: validatePhoneNumber,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Пароль'),
                  validator: validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Логин'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/регистрация');
                  },
                  child: const Text('Регистрация'),
                ),
              ],
            )),
      ),
    );
  }
}
