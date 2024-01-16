import 'package:flutter/material.dart';

import '../../../Data/UserListModel.dart';

class userdetail extends StatelessWidget {
  const userdetail({
    super.key,
    required this.userlistmodel,
  });

  final UserListModel userlistmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 209, 209, 207)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.network(userlistmodel.avatar),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(userlistmodel.firstName),
            Text(userlistmodel.lastName),
            Text(userlistmodel.email),
          ],
        )
      ]),
    );
  }
}