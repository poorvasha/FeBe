import 'package:flutter/material.dart';

class ProfileOption {
  final String title;
  final Widget icon;
  final String? url;
  final Function onTapped;

  ProfileOption(this.title, this.icon, this.url, this.onTapped);
}
