import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import '../../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../main.dart';
import '../showmessage/show_message.dart';

String dontimageicon = 'assets/images/link.png';

class Linkcard extends StatelessWidget {
  const Linkcard({Key? key, required this.title, required this.url, required this.image, required this.id}) : super(key: key);
  final String title;
  final String url;
  final String image;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableDelete(
            title: title,
            id: id,
            refFireBase: FirebaseFirestore.instance.collection('Link').doc(emaill).collection('Link'),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableShare(
            title: url,
          ),
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
                  image.toString() == 'Veri Yok'
                      ? const DontImageCart(
                          iconrepead: true,
                          title: 'Kayitli resim bulunamadi',
                        )
                      : ImageCart(image: image),
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

class DontImageCart extends StatelessWidget {
  const DontImageCart({Key? key, required this.iconrepead, required this.title}) : super(key: key);
  final bool iconrepead;
  final String title;

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
            SizedBox(
              height: 60,
              child: Lottie.asset(
                'assets/lotties/link.json',
                repeat: iconrepead,
              ),
            ),
            Center(
              child: Text(
                title,
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
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        Share.share(title);
      },
      backgroundColor: const Color(0xff154467),
      foregroundColor: Colors.white,
      icon: Icons.share,
      label: 'Share',
    );
  }
}

// ignore: must_be_immutable
class SlidableDelete extends StatelessWidget {
  const SlidableDelete({
    super.key,
    required this.title,
    required this.id,
    required this.refFireBase,
  });
  final String title;
  final String id;
  final CollectionReference refFireBase;

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
              refFireBase
                  .doc(id) // <-- Doc ID to be deleted.
                  .delete();
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
