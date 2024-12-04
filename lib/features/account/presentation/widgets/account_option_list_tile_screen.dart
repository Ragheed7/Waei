import 'package:flutter/material.dart';

class AccountOptionListTileScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountOptionListTileScreen({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(icon, size: 24.0),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
