import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import '../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../showmessage/show_message.dart';

String dontimage = 'Kayitli resim bulunamadi';
String dontimageicon = 'assets/images/link.png';

class Linkcard extends StatelessWidget {
  const Linkcard({Key? key, required this.title, required this.url, required this.image}) : super(key: key);
  final String title;
  final String url;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableDelete(
            title: title,
          )
        ],
      ),
      endActionPane: const ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableShare(),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          var data = url;
          //   if(await canLaunch(data)){
          if (data != "Kayıt Yok") {
            // ignore: deprecated_member_use
            await launch(data);
          }
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => new PlayerDetail(playersdat: playersdata,)),);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: linkcarddecor(),
            width: MediaQuery.of(context).size.width, //double.infinity,
            height: image.toString() == 'Veri Yok' ? 150 : 220,
            child: Padding(
              padding: padingallten(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image.toString() == 'Veri Yok' ? const DontImageCart() : ImageCart(image: image),
                  Linkcarttitle(title: title),
                  const SizedBox(
                    height: 4,
                  ),
                  Linkcarturl(url: url),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets padingallten() {
    return const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10);
  }

  BoxDecoration linkcarddecor() {
    return BoxDecoration(
      color: MyCustomerColors.opicswallowBlue,
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}

class Linkcarturl extends StatelessWidget {
  const Linkcarturl({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        url,
        style: const TextStyle(color: MyCustomerColors.zhebZhuBaiPearl, fontSize: 13),
      ),
    ));
  }
}

class Linkcarttitle extends StatelessWidget {
  const Linkcarttitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: const TextStyle(color: MyCustomerColors.midasFingerGold, fontSize: 16),
      ),
    ));
  }
}

class ImageCart extends StatelessWidget {
  const ImageCart({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Image.network(
          (image),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Lottie.asset(
                'assets/lotties/link.json',
                repeat: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
/*
CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
              )
*/

class DontImageCart extends StatelessWidget {
  const DontImageCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyCustomerColors.deepWater,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black26.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage(dontimageicon),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Column(
          children: [
            SizedBox(height: 60, child: Lottie.asset('assets/lotties/link.json')),
            Center(
              child: Text(
                dontimage,
                style: dontimagestyle(),
              ),
            ),
          ],
        ),
      )),
    );
  }

  TextStyle dontimagestyle() {
    return const TextStyle(color: MyCustomerColors.midasFingerGold, fontSize: 15);
  }
}

class SlidableShare extends StatelessWidget {
  const SlidableShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        // Share.share('Link Baslik' + " " + 'Link URL');
      },
      backgroundColor: const Color(0xff154467),
      foregroundColor: Colors.white,
      icon: Icons.share,
      label: 'Share',
    );
  }
}

class SlidableDelete extends StatelessWidget {
  const SlidableDelete({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (context) => MyAlertWidget(
            title: title,
            undertitle: 'Adlı yayın silinsin mi?',
            luttie: 'assets/lotties/deletequ.json',
            repeat: true,
            onPress: () {
              Navigator.pop(context);
            },
            onPressTwoSee: true,
            onPressTwo: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => MyAlertWidget(
                  title: title,
                  undertitle: 'Link silindi.',
                  luttie: 'assets/lotties/delete.json',
                  repeat: false,
                  onPress: () {
                    Navigator.pop(context);
                  },
                  onPressTwoSee: false,
                  onPressTwo: () {},
                ),
              );
            },
          ),
        );
      },
      backgroundColor: const Color(0xFFB41A19),
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Delete',
    );
  }
}
