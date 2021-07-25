import 'package:androiker/core_packages.dart';
import 'package:articles/model/article.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  final Article? article;
  final VoidCallback? onPressed;
  const BlogItem({Key? key, this.article, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (article == null) {
      return const SizedBox();
    }

    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: Insets.lg,
        ),
        padding: EdgeInsets.all(Insets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: Insets.sm,
              ),
              child: Text(
                article?.title ?? "Title",
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ),
            Text(
              article?.author ?? "Unknown",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
