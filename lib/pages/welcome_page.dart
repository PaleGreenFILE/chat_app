import 'package:chat_app/widgets/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login copy.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 85,
            horizontal: 40,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: SizedBox(
                  height: 190,
                  child: Image.asset('images/sky.jpg'),
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: SizedBox(
                  height: 300,
                  child: Image.asset('images/LOGO.png'),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    "Bienvenue sur votre 1 ére application de Rencontre Collectif en Corse",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(10)),
                    child: const Text('Se Connecter'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
