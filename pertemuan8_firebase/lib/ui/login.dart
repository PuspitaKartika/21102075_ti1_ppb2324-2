import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modul6/bloc/login/login_cubit.dart';
import 'package:modul6/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  //function untuk login with google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.msg)));
          Navigator.pushNamed(context, '/home');
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.msg)));
        }
        if (state is LoginLoading) {
          const CircularProgressIndicator();
        }
      },
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: ListView(
            children: [
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3D4DE0)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Silahkan masukan e-mail dan password anda",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "e-mail",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: emailEdc,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: passEdc,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(passInvisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passInvisible = !passInvisible;
                      });
                    },
                  ),
                ),
                obscureText: !passInvisible,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<LoginCubit>()
                        .login(email: emailEdc.text, password: passEdc.text);

                    // Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3D4DE0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://img2.pngdownload.id/20190228/qby/kisspng-google-logo-google-account-g-suite-google-images-g-icon-archives-search-png-5c77ad39b77471.9286340315513470017515.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://freepngimg.com/thumb/business/83615-blue-icons-symbol-telephone-computer-logo.png'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D4DE0)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
