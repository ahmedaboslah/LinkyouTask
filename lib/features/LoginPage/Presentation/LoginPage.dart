
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkyoutask/core/Service/ApiService.dart';
import 'package:linkyoutask/features/UsersListPage/presentation/View/UserListPage.dart';
import 'package:sign_in_button/sign_in_button.dart';


class LoginPage extends StatefulWidget {
   LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final FirebaseAuth _auth=FirebaseAuth.instance;
User? _user;
bool index=false;
@override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) { 
      setState(() {
        _user= event;
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: index ? UserListPage(): _googlesigninbutton(),
    );   
  }
  Widget _googlesigninbutton(){
    return Center(
      child:  SizedBox(
        height: 50,
        child: SignInButton(Buttons.google,text: 'Login',onPressed: _handleGoogleSignin, ),
      ),
    );
  } 
  void _handleGoogleSignin(){
    
    try{
     GoogleAuthProvider _googleauthprovider=GoogleAuthProvider();
     _auth.signInWithProvider(_googleauthprovider);
     ApiService().postData(_user!.email.toString());
    }catch(e){
      
    }
    setState(() {
      index=!index;
    });
  }
}
