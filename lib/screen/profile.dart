import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/button/my_button.dart';
import '../widgets/showmessage/show_message.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Container(
            decoration: const BoxDecoration(
                color: MyCustomerColors.opicswallowBlue,
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
                  'email',
                  style: TextStyle(color: MyCustomerColors.midasFingerGold),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          MyButton(
            title: 'Profil Ayar',
            buttonIcon: const Icon(Icons.settings, size: 24.0, color: MyCustomerColors.midasFingerGold),
            buttonColor: MyCustomerColors.benthicBlack,
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => MyAlertWidget(
                  title: '404 error',
                  undertitle: 'Lutfen internet erisimin kotrol edin.',
                  luttie: 'assets/lotties/404.json',
                  repeat: true,
                  onPress: () {
                    Navigator.pop(context);
                  },
                  onPressTwoSee: false,
                  onPressTwo: () {},
                ),
              );
              /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const rsagele(
                      title: 'Kayıt Başarı ile alındı',
                      undertitle: 'Are you sure to exit app?',
                      luttie: 'https://assets3.lottiefiles.com/packages/lf20_0jomt6wm.json',
                    ),
                  ),
                );*/ //
            },
          ),
          MyButton(
            title: 'Paylas',
            buttonIcon: const Icon(Icons.share_arrival_time_rounded, size: 24.0, color: MyCustomerColors.midasFingerGold),
            buttonColor: MyCustomerColors.benthicBlack,
            onPress: () {},
          ),
          MyButton(
            title: 'Oturumu Kapat',
            buttonIcon: const Icon(Icons.exit_to_app_outlined, size: 24.0, color: MyCustomerColors.midasFingerGold),
            buttonColor: MyCustomerColors.benthicBlack,
            onPress: () {},
          ),
          MyButton(
            title: 'Yeniden Baslat',
            buttonIcon: const Icon(Icons.restart_alt, size: 24.0, color: MyCustomerColors.midasFingerGold),
            buttonColor: MyCustomerColors.benthicBlack,
            onPress: () {},
          ),
          const Spacer(
            flex: 2,
          ),
        ],
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