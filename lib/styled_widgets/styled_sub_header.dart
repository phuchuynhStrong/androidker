import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class StyledSubHeader extends StatelessWidget {
  final String? subHeader;
  const StyledSubHeader({Key? key, this.subHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: Insets.lg,
      ),
      child: Text(
        subHeader ?? "-",
        style: GoogleFonts.montserrat(
          fontSize: 15,
          color: theme.colorScheme.onBackground.withOpacity(0.7),
        ),
      ),
    );
  }
}
