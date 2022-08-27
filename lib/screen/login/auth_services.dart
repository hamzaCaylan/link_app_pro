import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    email = email;
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createPerson(
    String email,
    String password,
    String name,
    String lastName,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    Map<String, dynamic> demoData = {
      "Kullanıcı Adı": name,
      "Kullanıcı Soyadı": lastName,
      "Kullanıcı Email": email,
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('Doc-MAK.USER').doc("User").collection(user.user!.uid);
    collectionReference.add(demoData);

    return user.user;
  }
}
