import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
      startActionPane: const ActionPane(
        motion: DrawerMotion(),
        children: [SlidableDelete()],
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
            width: 350, //double.infinity,
            height: url.toString() == '' || url.toString() == 'null' ? 135 : 220,
            child: Padding(
              padding: padingallten(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  url.toString() == '' || url.toString() == 'null' ? const DontImageCart() : ImageCart(image: image),
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
      color: MyCustomarColors.opicswallowBlue,
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
        style: const TextStyle(color: MyCustomarColors.zhebZhuBaiPearl, fontSize: 13),
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
        style: const TextStyle(color: MyCustomarColors.midasFingerGold, fontSize: 16),
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
        width: 360,
        height: 150,
        child: Image.network(
          (image),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DontImageCart extends StatelessWidget {
  const DontImageCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyCustomarColors.deepWater,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black26.withOpacity(0.2), BlendMode.dstATop),
          image: AssetImage(dontimageicon),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
          child: SizedBox(
        width: 270,
        height: 70,
        child: Center(
          child: Text(
            dontimage,
            style: dontimagestyle(),
          ),
        ),
      )),
    );
  }

  TextStyle dontimagestyle() {
    return const TextStyle(color: MyCustomarColors.midasFingerGold, fontSize: 15);
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
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: MyCustomarColors.midasFingerGold,
                  title: Container(
                    height: 90,
                    width: 300,
                    color: MyCustomarColors.zhebZhuBaiPearl,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.delete_sweep,
                          size: 35,
                          color: MyCustomarColors.carnelian,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Link Baslik',
                              style: TextStyle(color: MyCustomarColors.swallowBlue, fontSize: 15),
                            ),
                          ),
                        ),
                        Text(
                          "Adlı yayın silinsin mi?",
                          style: TextStyle(color: Colors.black38, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  //content: Text("data"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          // snapshot.data!.docs[index].reference.delete().whenComplete(() => Navigator.pop(context));
                        },
                        child: const Text(
                          'Evet.',
                          style: TextStyle(color: MyCustomarColors.carnelian, fontSize: 18),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Hayır',
                          style: TextStyle(color: MyCustomarColors.swallowBlue, fontSize: 18),
                        )),
                  ],
                ));
      },
      backgroundColor: const Color(0xFFB41A19),
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Delete',
    );
  }
}
