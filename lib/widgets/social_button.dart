import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isGoogle;

  const SocialSignInButton(
      {super.key,
        required this.icon,
        required this.text,
        required this.isGoogle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: isGoogle ? Colors.red : Colors.blue),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.black),
    );
  }
}
