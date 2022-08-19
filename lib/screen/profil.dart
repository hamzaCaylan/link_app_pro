import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/button/my_button.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  /*final AuthService _authService = AuthService();

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', '');
    prefs.setString('password', '');
    print('kullaniciyi SILDIM');
    setState(() {
      emaill = '';
      password = '';
      showSpinner = false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyCustomarColors.opicswallowBlue,
      body: Container(
        color: MyCustomarColors.benthicBlack,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/00.webp'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 360,
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: MyCustomarColors.opicswallowBlue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    width: 180,
                    height: 200,
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.network(
                          'https://www.awicons.com/free-icons/download/application-icons/dragon-soft-icons-by-artua.com/png/512/User.png',
                          height: 150,
                          width: 150,
                        ),
                        const Spacer(),
                        const Text(
                          'emaill',
                          style: TextStyle(
                              color: MyCustomarColors.midasFingerGold),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  AnaPage(
                    title: 'Profil Ayar',
                    buttomIcon: const Icon(Icons.settings,
                        size: 24.0, color: MyCustomarColors.midasFingerGold),
                    buttomColor: MyCustomarColors.benthicBlack,
                    onPress: () {},
                  ),
                  AnaPage(
                    title: 'Paylas',
                    buttomIcon: const Icon(Icons.share_arrival_time_rounded,
                        size: 24.0, color: MyCustomarColors.midasFingerGold),
                    buttomColor: MyCustomarColors.benthicBlack,
                    onPress: () {},
                  ),
                  AnaPage(
                    title: 'Oturumu Kapat',
                    buttomIcon: const Icon(Icons.exit_to_app_outlined,
                        size: 24.0, color: MyCustomarColors.midasFingerGold),
                    buttomColor: MyCustomarColors.benthicBlack,
                    onPress: () {},
                  ),
                  AnaPage(
                    title: 'Yeniden Baslat',
                    buttomIcon: const Icon(Icons.restart_alt,
                        size: 24.0, color: MyCustomarColors.midasFingerGold),
                    buttomColor: MyCustomarColors.benthicBlack,
                    onPress: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: const Link_pp_buttom_style(),
                                height: 60,
                                width: 320,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.settings,
                                          size: 24.0, color: yellow_low),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Profil ayar bos',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: const Link_pp_buttom_style(),
                                height: 60,
                                width: 320,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.share_arrival_time_rounded,
                                          size: 24.0, color: yellow_low),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Paylasim bos',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                              )),
                          TextButton(
                              onPressed: () {
                                passwordController.clear();
                                _authService.signOut();
                                logout();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MyApp()));
                                //SystemNavigator.pop();
                                // exit(0);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: koyutema2,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(60.0),
                                        bottomRight: Radius.circular(15.0),
                                        topRight: Radius.circular(60.0))),
                                height: 60,
                                width: 320,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.exit_to_app,
                                          size: 24.0, color: yellow_low),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Oturumu Kapat',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                              )),
                          TextButton(
                              onPressed: () {
                                passwordController.clear();
                                _authService.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MyApp()));
                                //SystemNavigator.pop();
                                // exit(0);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: koyutema2,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(60.0),
                                        bottomRight: Radius.circular(15.0),
                                        topRight: Radius.circular(60.0))),
                                height: 60,
                                width: 320,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.fullscreen_exit,
                                          size: 24.0, color: yellow_low),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Ana Ekrana Kapat',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox.fromSize(
                                size: const Size(56, 56),
                                child: ClipOval(
                                  child: Material(
                                    color: yellow_low,
                                    child: InkWell(
                                      splashColor: Colors.green,
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Icon(
                                            Icons.gamepad,
                                            size: 40.0,
                                          ), // <-- Icon
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              SizedBox.fromSize(
                                size: const Size(56, 56),
                                child: ClipOval(
                                  child: Material(
                                    color: yellow_low,
                                    child: InkWell(
                                      splashColor: Colors.green,
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Icon(
                                            Icons.gamepad_outlined,
                                            size: 40.0,
                                            color: green_lght,
                                          ), // <-- Icon
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                         */