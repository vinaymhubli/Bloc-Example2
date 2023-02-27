import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalid/bloc/signinbloc.dart';
import 'package:formvalid/bloc/signinevent.dart';
import 'package:formvalid/bloc/signinstate.dart';
import 'package:formvalid/views/sucesspage.dart';
import 'package:formvalid/widget/button.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Credentials',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
                if (state is Signinerrorstate) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return Container();
              }),
              const SizedBox(height: 15),
              TextField(
                  controller: email,
                  onChanged: (val) {
                    BlocProvider.of<SigninBloc>(context)
                        .add(Signincredevent(email.text, password.text));
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                  )),
              TextField(
                  obscureText: true,
                  controller: password,
                  onChanged: (val) {
                    BlocProvider.of<SigninBloc>(context)
                        .add(Signincredevent(email.text, password.text));
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                  )),
              const SizedBox(height: 40.0),
              BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
                return Buttons(
                    color:
                        (state is Signinvalidstate) ? Colors.teal : Colors.blue,
                    text: const Text("signin", style: TextStyle(fontSize: 25)),
                    onpressed: () {
                      if (state is Signinvalidstate) {
                        BlocProvider.of<SigninBloc>(context)
                            .add(Buttonpressevent(email.text, password.text));

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SucessPage()));
                      }
                    });
              })
            ],
          ),
        ));
  }
}
