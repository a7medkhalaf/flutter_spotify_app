import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_app/features/auth/data/models/user_model.dart';

abstract interface class AuthFirebaseService {
  UserModel? get getCurrentUser;
  Future<UserModel> singIn({
    required String email,
    required String password,
  });
  Future<UserModel> singUp({
    required String name,
    required String email,
    required String password,
  });
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  UserModel? get getCurrentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return UserModel.fromFirebase(FirebaseAuth.instance.currentUser!);
  }

  @override
  Future<UserModel> singIn({
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserModel> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseFirestore.instance.collection('users').add({
      // 'uid': userCredential.user!.uid,
      'name': name,
      'email': email,
    });
    final user = userCredential.user;
    await user!.updateDisplayName(name);
    return UserModel.fromFirebase(userCredential.user!);
  }
}
