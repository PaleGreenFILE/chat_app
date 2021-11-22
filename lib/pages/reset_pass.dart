// ignore_for_file: avoid_types_as_parameter_names

import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/widgets/delayed_animation.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login copy.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);
  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  AuthServices service = AuthServices();
  TextEditingController emailcontroller = TextEditingController();
  bool isLoading = false;
  String msg = "";
  @override
  Widget build(BuildContext context) {
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
                builder: (context) => const SocialPage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          DelayedAnimation(
            delay: 1500,
            child: SizedBox(
              height: 220,
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
                    "Reinitialisation du mot de passe !",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Cette page vous permet de Reinitialiser votre mot de passe !",
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
                                    keyboardType: TextInputType.emailAddress,
                                    hint: 'Entrer votre email',
                                  )),
                            ],
                          ))),
                  DelayedAnimation(
                    delay: 4500,
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.all(10)),
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(
                                          color: Colors.blue),
                                      SizedBox(width: 24),
                                      Text('Un Instant...'),
                                    ],
                                  )
                                : const Text('Envoyer'),
                            onPressed: () async {
                              if (isLoading) return;
                              setState(() => isLoading = true);
                              await Future.delayed(const Duration(seconds: 2));

                              if (emailcontroller.text.isEmpty) {
                                setState(() => isLoading = false);
                                service.errorBox(
                                    context, "Merci de rentrer un email !");
                              } else {
                                if (emailcontroller.text.isNotEmpty) {
                                  service.errorBox(context,
                                      "Merci de verifier votre boite mail, un lien pour réinitialiser votre mot de passe vous à été envoyer!\n\nRetourner à la Connexion.");
                                  service.resetpassword(
                                      context, emailcontroller.text);
                                  setState(() => isLoading = false);
                                  await Future.delayed(
                                      const Duration(seconds: 4));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SocialPage(),
                                    ),
                                  );
                                }
                              }
                            })),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Retour à la"),
                      const SizedBox(
                        width: 0,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SocialPage(),
                              ),
                            );
                          },
                          child: const Text("Connexion"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
