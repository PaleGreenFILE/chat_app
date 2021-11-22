// ignore_for_file: avoid_types_as_parameter_names, avoid_print, file_names

import 'package:chat_app/config/function.dart';
import 'package:chat_app/pages/register.dart';
import 'package:chat_app/pages/reset_pass.dart';
import 'package:chat_app/pages/welcome_page.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/widgets/delayed_animation.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';

// ignore: must_be_immutable
class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  AuthServices service = AuthServices();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1500,
              child: SizedBox(
                height: 100,
                child: Image.asset('images/corse.png'),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      "Rencontrons Nous !",
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Inscrivez vous , venez decouvrir nos sorties collectif, nos voyages & Rencontrez de Nouvelle Personne !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    DelayedAnimation(
                      delay: 3000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DelayedAnimation(
                              delay: 3500,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      DelayedAnimation(
                                          delay: 3000,
                                          child: CTextField(
                                            controller: emailcontroller,
                                            prefix: const Icon(Icons.email,
                                                color: Colors.blue),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            hint: 'Entrer votre email',
                                          )),
                                    ],
                                  ))),
                          DelayedAnimation(
                            delay: 4000,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 20,
                                ),
                                child: Column(children: [
                                  DelayedAnimation(
                                    delay: 3500,
                                    child: CTextField(
                                      controller: passcontroller,
                                      prefix: const Icon(Icons.vpn_key,
                                          color: Colors.blue),
                                      obscureText: true,
                                      keyboardType: TextInputType.emailAddress,
                                      hint: 'Entrer votre mot de passe',
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      DelayedAnimation(
                                        delay: 3800,
                                        child: TextButton(
                                          child: const Text(
                                              " Mot de passe oublié ?",
                                              style: TextStyle(
                                                  color: Colors.lightBlue)),
                                          onPressed: () {
                                            navigateToNextPage(
                                                context, const ResetPassPage());
                                          },
                                        ),
                                      ),
                                      DelayedAnimation(
                                        delay: 4400,
                                        child: SizedBox(
                                            width: width,
                                            height: 50,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  shape: const StadiumBorder(),
                                                  padding:
                                                      const EdgeInsets.all(10)),
                                              child: isLoading
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        CircularProgressIndicator(
                                                            color: Colors.blue),
                                                        SizedBox(width: 24),
                                                        Text('Un Instant...'),
                                                      ],
                                                    )
                                                  : const Text('Se Connecter'),
                                              onPressed: () async {
                                                if (isLoading) return;
                                                setState(
                                                    () => isLoading = true);
                                                await Future.delayed(
                                                    const Duration(seconds: 2));

                                                if (emailcontroller
                                                        .text.isNotEmpty &&
                                                    passcontroller
                                                        .text.isNotEmpty) {
                                                  setState(
                                                      () => isLoading = false);
                                                  service.singIn(
                                                      context,
                                                      emailcontroller.text,
                                                      passcontroller.text);
                                                } else {
                                                  service.errorBox(context,
                                                      "Merci de rentrer un email et un mot de passe Valide ! \n\nVeuillez Réessayer.");
                                                  setState(
                                                      () => isLoading = false);
                                                }
                                              },
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Avez-vous un compte ?"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Register(),
                                                  ),
                                                );
                                              },
                                              child: const Text("Inscription"))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text("SigIn with"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ])),
                          ),
                          DelayedAnimation(
                            delay: 4800,
                            child: SizedBox(
                              width: width,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignInButton.mini(
                                      buttonType: ButtonType.googleDark,
                                      buttonSize: ButtonSize.large,
                                      btnColor: Colors.white,
                                      onPressed: () async {
                                        AuthServices().signInWithGoogle(
                                            context, emailcontroller.text);
                                        print('login');
                                      }),
                                  SignInButton.mini(
                                      buttonType: ButtonType.instagram,
                                      buttonSize: ButtonSize.large,
                                      btnColor: Colors.white,
                                      onPressed: () {
                                        print('click');
                                      }),
                                  SignInButton.mini(
                                      buttonType: ButtonType.facebook,
                                      buttonSize: ButtonSize.large,
                                      btnColor: Colors.white,
                                      onPressed: () {
                                        print('click');
                                      }),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
