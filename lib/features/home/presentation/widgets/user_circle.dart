import 'package:flutter/material.dart';

class UserCircle extends StatelessWidget {
  final String imageUrl;
  final String username;

  const UserCircle({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: size.width / 15,
        ),
        SizedBox(width: size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
            Text(
              username,
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
