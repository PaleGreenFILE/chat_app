import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/widgets/delayed_animation.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login copy.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  AuthServices service = AuthServices();

  bool isLoading = false;
  bool checkedValue = false;
  bool checkboxValue = false;
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
                      "Andemu à Girandulà",
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
                                "Inscription",
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
                                child: Column(
                                  children: [
                                    DelayedAnimation(
                                      delay: 3500,
                                      child: CTextField(
                                        controller: passcontroller,
                                        prefix: const Icon(Icons.vpn_key,
                                            color: Colors.blue),
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hint: 'Entrer votre mot de passe',
                                      ),
                                    ),
                                    const SizedBox(height: 15.0),
                                    FormField<bool>(
                                      builder: (state) {
                                        return Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Checkbox(
                                                    value: checkboxValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        checkboxValue = value!;
                                                        state.didChange(value);
                                                      });
                                                    }),
                                                const Text(
                                                  "I accept all terms and conditions.",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                state.errorText ?? '',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .errorColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                      validator: (value) {
                                        if (!checkboxValue) {
                                          service.errorBox(context,
                                              'Vous devez acceptez les Terms & Conditions');
                                          return;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    DelayedAnimation(
                                      delay: 4500,
                                      child: SizedBox(
                                          width: double.infinity,
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
                                                : const Text('Inscription'),
                                            onPressed: () async {
                                              if (isLoading) return;
                                              setState(() => isLoading = true);
                                              await Future.delayed(
                                                  const Duration(seconds: 2));

                                              if (!checkboxValue &&
                                                  emailcontroller
                                                      .text.isNotEmpty &&
                                                  passcontroller
                                                      .text.isNotEmpty) {
                                                service.errorBox(context,
                                                    'Vous devez acceptez les Terms & Conditions');
                                                setState(
                                                    () => isLoading = false);
                                              } else {
                                                if (emailcontroller
                                                        .text.isEmpty &&
                                                    passcontroller
                                                        .text.isEmpty) {
                                                  setState(
                                                      () => isLoading = false);
                                                  service.errorBox(context,
                                                      'Merci de rentrer un email et un mot de passe !');
                                                } else {
                                                  if (passcontroller.text
                                                          .characters.length <
                                                      6) {
                                                    setState(() =>
                                                        isLoading = false);
                                                    service.errorBox(context,
                                                        'Mot de passe avec 6 charactere Minimum!');
                                                  } else {
                                                    if (emailcontroller
                                                            .text.isEmpty &&
                                                        passcontroller
                                                            .text.isEmpty) {
                                                      setState(() =>
                                                          isLoading = false);
                                                      service.errorBox(context,
                                                          'Merci de rentrer un email et un mot de passe !');
                                                    } else {
                                                      if (emailcontroller.text
                                                              .isNotEmpty &&
                                                          passcontroller.text
                                                              .isNotEmpty) {
                                                        service.succesBox(
                                                            context,
                                                            "Inscription Réussie");
                                                        await Future.delayed(
                                                            const Duration(
                                                                seconds: 3));
                                                        setState(() =>
                                                            isLoading = false);
                                                        service.singUp(
                                                            context,
                                                            namecontroller.text,
                                                            emailcontroller
                                                                .text,
                                                            passcontroller
                                                                .text);

                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SocialPage()));
                                                      } else {
                                                        service.errorBox(
                                                            context,
                                                            "Merci de rentrer un email et un mot de passe ! \n\nVeuillez Réessayer.");
                                                        setState(() =>
                                                            isLoading = false);
                                                      }
                                                    }
                                                  }
                                                }
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
                                                      const SocialPage(),
                                                ),
                                              );
                                            },
                                            child: const Text("Connectez-Vous"))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
