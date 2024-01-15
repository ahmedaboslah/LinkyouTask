import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButton extends StatelessWidget {
   LoginButton({
    super.key,
  });


Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {}
    
    }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: signInWithGoogle,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Align(
          alignment: Alignment.center,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 30,child: Image.asset('assets/google.jpg')),
            const SizedBox(width: 10,),
            const Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ],)
        ),
      ),
    );
  }
}
