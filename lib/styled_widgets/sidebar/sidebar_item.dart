import 'package:flutter/material.dart';

import '../../core_packages.dart';

class SidebarItem extends StatelessWidget {
  final Widget? prefix;
  final String? title;
  final VoidCallback? onPressed;
  const SidebarItem({Key? key, this.prefix, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        padding: EdgeInsets.all(Insets.lg),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: Corners.mdBorder,
        ),
        child: Row(
          children: [
            SizedBox.fromSize(
              size: const Size.square(16),
              child: prefix ?? Container(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: Insets.lg,
                ),
                child: Text(
                  title ?? "-",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
