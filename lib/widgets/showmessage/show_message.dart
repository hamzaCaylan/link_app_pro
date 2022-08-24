import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> showerMessage(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => MyAlertWidget(
            title: 'Kayıt Başarı ile alındı',
            undertitle: 'Are you sure to exit app?',
            luttie: 'assets/lotties/ok.json',
            repeat: false,
            onPress: () {
              Navigator.pop(context);
            },
            onPressTwoSee: false,
            onPressTwo: () {},
          ));
}

class MyAlertWidget extends StatefulWidget {
  const MyAlertWidget({
    Key? key,
    required this.title,
    required this.undertitle,
    required this.luttie,
    required this.onPress,
    required this.repeat,
    required this.onPressTwoSee,
    required this.onPressTwo,
  }) : super(key: key);
  final String title;
  final String undertitle;
  final String luttie;
  final VoidCallback onPress;
  final VoidCallback onPressTwo;
  final bool repeat;
  final bool onPressTwoSee;

  @override
  State<MyAlertWidget> createState() => _MyAlertWidgetState();
}

class _MyAlertWidgetState extends State<MyAlertWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AlertDialog(
        backgroundColor: MyCustomerColors.deepWater.withOpacity(0.8),
        content: SizedBox(
          height: 20,
          child: Column(
            children: <Widget>[
              Text(
                widget.undertitle,
                style: TextStyle(color: MyCustomerColors.midasFingerGold.withOpacity(0.9), fontSize: 13),
              ),
            ],
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 140,
            child: Center(
              child: Lottie.asset(
                widget.luttie,
                repeat: widget.repeat,
              ),
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(color: MyCustomerColors.zhebZhuBaiPearl, fontSize: 17),
        ),
        actions: <Widget>[
          (widget.onPressTwoSee) == true
              ? TextButton(
                  onPressed: widget.onPressTwo,
                  child: const Text(
                    'Sil',
                    style: TextStyle(color: MyCustomerColors.midasFingerGold, fontSize: 20),
                  ))
              : const SizedBox(),
          TextButton(
              onPressed: widget.onPress,
              child: Text(
                (widget.onPressTwoSee) == true ? 'Iptal Et..' : 'Tamam',
                style: const TextStyle(color: MyCustomerColors.midasFingerGold, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
/*Container(
          color: MyCustomarColors.deepWater,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 200,
              width: 360,
              color: MyCustomarColors.zhebZhuBaiPearl,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 160,
                      height: 120,
                      child: Lottie.network(
                        widget.luttie,
                        repeat: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: MyCustomarColors.deepWater, fontSize: 17),
                    ),
                  ),
                  Text(
                    widget.undertitle,
                    style: TextStyle(color: MyCustomarColors.deepWater.withOpacity(0.5), fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
        */ 