import 'package:authentication/di/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core_packages.dart';

class HomeNavBarEditorBtn extends StatelessWidget {
  const HomeNavBarEditorBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final theme = Theme.of(context);
    if (userProvider.getUser() != null) {
      return IconButton(
        icon: const FaIcon(FontAwesomeIcons.edit),
        color: theme.colorScheme.onPrimary,
        iconSize: IconSizes.med,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }

    return const SizedBox();
  }
}
