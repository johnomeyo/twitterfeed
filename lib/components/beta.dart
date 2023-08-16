import 'package:flutter/material.dart';

class PlatformDisplay extends StatelessWidget {
  const PlatformDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;

    String platformName = '';
    switch (platform) {
      case TargetPlatform.android:
        platformName = 'Android';
        break;
      case TargetPlatform.iOS:
        platformName = 'iOS';
        break;
      case TargetPlatform.macOS:
        platformName = 'macOS';
        break;
      case TargetPlatform.windows:
        platformName = 'Windows';
        break;
      case TargetPlatform.linux:
        platformName = 'Linux';
        break;
      case TargetPlatform.fuchsia:
        platformName = 'Fuchsia';
        break;
      default:
        platformName = 'Unknown';
    }

    return Text(
      'Twitter for $platformName',
      style: const TextStyle(color: Colors.blue),
    );
  }
}
