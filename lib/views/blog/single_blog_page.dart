import 'dart:convert';
import 'dart:math';

import 'package:androiker/di/component/article_component.dart';
import 'package:androiker/styled_widgets/androidker_scaffold.dart';
import 'package:articles/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/widgets/simple_viewer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';
import 'bloc/bloc.dart';
import 'bloc/state.dart';

class SingleBlogPageScreen extends StatelessWidget {
  final String id;
  const SingleBlogPageScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<SingleBlogPageBloc>(
      create: (context) => SingleBlogPageBloc(
        id: id,
        articleRepository: context.read<ArticleComponent>().module?.repository,
      ),
      child: BlocBuilder<SingleBlogPageBloc, SingleBlogPageState>(
        builder: (context, state) {
          if (state.isFetching) {
            return Container();
          }

          if (state.fetched) {
            return SingleBlogPageWidget(
              article: state.data!,
            );
          }

          return Center(
            child: Text(
              "Can't load article.",
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground,
              ),
            ),
          );
        },
      ),
    );
  }
}

class SingleBlogPageWidget extends StatefulWidget {
  final Article article;
  const SingleBlogPageWidget({Key? key, required this.article})
      : super(key: key);

  @override
  _SingleBlogPageWidgetState createState() => _SingleBlogPageWidgetState();
}

class _SingleBlogPageWidgetState extends State<SingleBlogPageWidget> {
  late final quill.QuillController controller;

  @override
  void initState() {
    controller = quill.QuillController(
      document: quill.Document.fromJson(jsonDecode(widget.article.content!)),
      selection: const TextSelection.collapsed(offset: 0),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final viewerWidth = min(screenWidth, 600.0);
    return AndroidkerScaffold(
      windowTitleText: widget.article.title,
      body: Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Insets.xl,
          ),
          child: Container(
            width: screenWidth,
            alignment: Alignment.center,
            child: SizedBox(
              width: viewerWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Insets.lg,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.article.title ?? "Title",
                            maxLines: 5,
                            style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Insets.xl,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Posted on Aug 28, 2021",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: QuillSimpleViewer(
                      controller: controller,
                      readOnly: true,
                      embedBuilder: defaultEmbedBuilderWeb,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultEmbedBuilderWeb(
      BuildContext context, quill.Embed node, bool readOnly) {
    switch (node.value.type) {
      case 'image':
        final String imageUrl = node.value.data;
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: Insets.lg,
          ),
          child: Image.network(imageUrl),
        );

      default:
        throw UnimplementedError(
          'Embeddable type "${node.value.type}" is not supported by default '
          'embed builder of QuillEditor. You must pass your own builder function '
          'to embedBuilder property of QuillEditor or QuillField widgets.',
        );
    }
  }
}
