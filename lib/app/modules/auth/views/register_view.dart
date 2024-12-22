// lib/app/modules/auth/views/register_view.dart
import 'package:crypto_tracker/app/modules/auth/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
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
                              controller.register(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                    child: controller.isLoading
                        ? CircularProgressIndicator()
                        : Text('Register'),
                  )),
              TextButton(
                onPressed: () => Get.back(),
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}