import 'package:flutter/material.dart';

import '../../models/users/user_model.dart';


class usersScreen extends StatelessWidget {
  List<usermodel> users = [
    usermodel(
      id: 1,
      name: 'yasmen ali',
      phone: '+01212158645',
    ),
    usermodel(
      id: 2,
      name: 'khalid ali',
      phone: '+01264218645',
    ),
    usermodel(
      id: 3,
      name: 'ibrahim ali',
      phone: '+0656232145',
    ),
    usermodel(
      id: 1,
      name: 'yasmen ali',
      phone: '+01212158645',
    ),
    usermodel(
      id: 2,
      name: 'khalid ali',
      phone: '+01264218645',
    ),
    usermodel(
      id: 3,
      name: 'ibrahim ali',
      phone: '+0656232145',
    ),
    usermodel(
      id: 1,
      name: 'yasmen ali',
      phone: '+01212158645',
    ),
    usermodel(
      id: 2,
      name: 'khalid ali',
      phone: '+01264218645',
    ),
    usermodel(
      id: 3,
      name: 'ibrahim ali',
      phone: '+0656232145',
    ),
    usermodel(
      id: 1,
      name: 'yasmen ali',
      phone: '+01212158645',
    ),
    usermodel(
      id: 2,
      name: 'khalid ali',
      phone: '+01264218645',
    ),
    usermodel(
      id: 3,
      name: 'ibrahim ali',
      phone: '+0656232145',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(
          'users ',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildListVeiw(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                  width: double.infinity,
                ),
              ),
          itemCount: users.length),
    );
  }

  buildListVeiw(usermodel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '${user.phone}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
