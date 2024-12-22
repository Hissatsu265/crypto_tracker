import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.30:5000/auth',
  ));

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(String email, String password) async {
    try {
      await _dio.post('/register', data: {
        'email': email,
        'password': password,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String token) async {
    try {
      final response = await _dio.get(
        '/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }
}