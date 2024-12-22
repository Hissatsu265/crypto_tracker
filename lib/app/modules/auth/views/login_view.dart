import 'package:crypto_tracker/app/modules/auth/controllers/auth_controllers.dart';
import 'package:crypto_tracker/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter password' : null,
              ),
              SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              controller.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                    child: controller.isLoading
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  )),
              TextButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}