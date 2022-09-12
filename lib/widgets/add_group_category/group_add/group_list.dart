import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../category/category_constants.dart';
import '../../link_listview/link_list_home.dart';
import '../../linkcard/linkcard.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  var refFireBase = FirebaseFirestore.instance.collection('Grup').where("id", isEqualTo: 'iC938cHR3HEqEHih3wey');
  // ignore: prefer_typing_uninitialized_variables
  var id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CategoryColors.benthicBlack,
        title: const Text('Gruplar'),
      ),
      body: Container(
        color: CategoryColors.benthicBlack,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/00.webp'), fit: BoxFit.cover)),
            ),
            StreamBuilder(
              stream: refFireBase.snapshots(), //
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  // ignore: prefer_is_empty
                  if (snapshot.data?.docs.length == 0) {
                    return const SizedBox();
                  } else {
                    return ListView.builder(
                      //  scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var group = snapshot.data?.docs[index];
                        var grouptitle = group!['Group title'].toString();
                        id = group['id'].toString();
                        return Slidable(
                          key: UniqueKey(),
                          startActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableDelete(
                                title: 'title',
                                id: 'id',
                              )
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableShare(
                                title: id,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: CategoryColors.opicswallowBlue,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              width: MediaQuery.of(context).size.width, //double.infinity,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const DontImageCart(
                                      iconrepead: true,
                                      title: 'Varsayilan ikon',
                                    ),
                                    Linkcarttitle(title: grouptitle),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Linkcarturl(url: 'Grup ID ' + id),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        //
                      },
                    );
                  }
                } else {
                  return const LoadingSpacee();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
