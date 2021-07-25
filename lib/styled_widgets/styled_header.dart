import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class StyledHeader extends StatelessWidget {
  final String? header;
  const StyledHeader({Key? key, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: Insets.xl,
        bottom: Insets.sm,
      ),
      child: Text(
        header ?? "-",
        style: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.onBackground,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
