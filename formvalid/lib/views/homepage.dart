import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalid/bloc/signinbloc.dart';
import 'package:formvalid/views/formpage.dart';
import 'package:formvalid/widget/button.dart';

class FormHome extends StatelessWidget {
  const FormHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 180),
            const Text(
              "Welcome..",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 42.0,
            ),
            Buttons(
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: ((context) => SigninBloc()),
                          child: const Formpage())));
                },
                color: Colors.blue,
                text: const Text(
                  "login",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
