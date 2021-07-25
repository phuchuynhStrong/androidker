import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:androiker/routing/bloc/routing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:androiker/core_packages.dart';

class SidebarSettingsItem extends StatelessWidget {
  const SidebarSettingsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutingBloc, RoutingState>(builder: (context, state) {
      final bloc = context.read<RoutingBloc>();
      final currentPageEnum = bloc.getCurrentPageEnum();
      final isActive = currentPageEnum == AppPage.settings;
      return SidebarItem(
        isActive: isActive,
        onPressed: () {
          if (!isActive) {
            BlocProvider.of<RoutingBloc>(context).navigate(
              AppLink(
                pageId: AppPage.settings.name,
              ),
            );
          }
        },
        prefix: const FaIcon(
          FontAwesomeIcons.cogs,
          color: Colors.white,
          size: 16,
        ),
        title: "Settings",
      );
    });
  }
}
