import 'package:febe_frontend/configs/resources.dart';
import 'package:febe_frontend/screens/profile_screen/general_settings.dart';
import 'package:febe_frontend/screens/profile_screen/verify_settings.dart';
import 'package:flutter/material.dart';

import '../../widgets/default_text_input.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [GeneralSettings(), VerifyMyProfileSettings()],
    );
  }
}
