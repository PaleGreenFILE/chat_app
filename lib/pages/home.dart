// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:chat_app/config/function.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/pages/chat.dart';
import 'package:chat_app/pages/drawer_pages/invite_friends.dart';
import 'package:chat_app/pages/drawer_pages/logout.dart';
import 'package:chat_app/pages/drawer_pages/settings.dart';
import 'package:chat_app/pages/drawer_pages/updates.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_pages/UserProfile.dart';
import 'drawer_pages/contact.dart';
import 'drawer_pages/notification.dart';

const dGreen = Color(0xFF2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.name}) : super(key: key);
  final CUser? name;

  AuthServices service = AuthServices();

  List<Tab> tabs = [
    const Tab(child: Text("Message")),
    const Tab(child: Text("Nos Sorties")),
    const Tab(child: Text("Nos Partenaires")),
    const Tab(child: Text("Planning 2022")),
    const Tab(child: Text("Photos")),
  ];

  List<Widget> tabsContent = [
    MessageSection(),
    const Sorties(),
    const Partenaires(),
    const Planning(),
    const Photos(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.indigo,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Center(
            child: Text("Andemu à Girandulà "),
          ),
          backgroundColor: Colors.indigo[800],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
        ),
        body: TabBarView(
          children: tabsContent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo[800],
          child: const Icon(
            Icons.edit,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(vertical: 20);

  NavigationDrawerWidget({Key? key, this.name}) : super(key: key);
  final CUser? name;
  AuthServices service = AuthServices();

  @override
  Widget build(BuildContext context) {
    const name = "users";
    const email = 'email';
    const urlImage = '';

    return Drawer(
      child: Material(
        color: Colors.indigo[800],
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserProfile(
                  name: name,
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuITem(
                    text: 'Message',
                    icon: Icons.message,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 10),
                  buildMenuITem(
                    text: 'Contact',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 10),
                  buildMenuITem(
                    text: 'Inviter des amis',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 10),
                  buildMenuITem(
                    text: 'Updates',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  buildMenuITem(
                    text: 'Paramètres',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 10),
                  buildMenuITem(
                    text: 'Se Déconnecter',
                    icon: Icons.logout,
                    onClicked: () => AuthServices().signOut(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 30)),
            child: Row(
              children: [
                const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/a-/AOh14Giiy8BWazIyoIb4VcQnfgQOyFKlbi8RTnnEOW_skw=s96-c")),
                const SizedBox(width: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (Text(
                      " ${AuthServices().user.displayName}",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    )),
                    const SizedBox(width: 4),
                    Text(
                      " ${AuthServices().user.email}",
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                    child:
                        Icon(Icons.add_comment_outlined, color: Colors.white))
              ],
            )),
      );
}

Widget buildMenuITem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Colors.white;
  const hoveColor = Colors.deepPurple;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoveColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Contacts(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Friends(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Notifications(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Updates(),
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Settings(),
      ));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Logout(),
      ));
      break;
  }
}

class FavoriteSection extends StatelessWidget {
  FavoriteSection({Key? key}) : super(key: key);

  final List FavoriteContact = [
    {'name': "Charly", 'profile': 'images/corse.png'},
    {'name': "Chris", 'profile': 'images/logoandemu.png'},
    {'name': "Patrice", 'profile': 'images/google.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          color: dGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Favorite Contacts",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: FavoriteContact.map((favorite) {
                  return Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: dWhite,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(favorite['profile']),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          favorite["name"],
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageSection extends StatelessWidget {
  MessageSection({Key? key}) : super(key: key);
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CUser>>(
        stream: DBServices().getDiscussionUser,
        builder: (_, s) {
          if (s.hasData) {
            final users = s.data;
            return users!.isEmpty
                ? const Text("Aucune discussion")
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (ctx, i) {
                      final user = users[i];
                      return ListTile(
                        onTap: () {
                          navigateToNextPage(
                              context,
                              ChatPage(
                                user: user,
                              ));
                        },
                        leading: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.withOpacity(.5)),
                          child: const Icon(Icons.person),
                        ),
                        title: Text(
                          user.name!,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          user.email!,
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class Photos extends StatelessWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class Planning extends StatelessWidget {
  const Planning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class Partenaires extends StatelessWidget {
  const Partenaires({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

class Sorties extends StatelessWidget {
  const Sorties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}
