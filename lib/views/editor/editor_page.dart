import 'dart:convert';

import 'package:androiker/core_packages.dart';
import 'package:androiker/di/component/article_component.dart';
import 'package:articles/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

class EditorPage extends StatelessWidget {
  final String? draftId;
  const EditorPage({Key? key, this.draftId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditorPageBloc>(
      create: (context) => EditorPageBloc(
        id: draftId,
        articleRepository: context.read<ArticleComponent>().module?.repository,
      ),
      child: BlocBuilder<EditorPageBloc, EditorPageState>(
        builder: (context, state) {
          if (draftId == null) {
            return EditorPageWidget(state: state);
          }

          if (draftId != null && state.executed && state.data != null) {
            return EditorPageWidget(state: state);
          }

          return Container();
        },
      ),
    );
  }
}

class EditorPageWidget extends StatefulWidget {
  final EditorPageState? state;
  const EditorPageWidget({Key? key, this.state}) : super(key: key);

  @override
  _EditorPageWidgetState createState() => _EditorPageWidgetState();
}

class _EditorPageWidgetState extends State<EditorPageWidget> {
  late final QuillController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.state?.data == null) {
      _controller = QuillController.basic();
    } else {
      _controller = QuillController(
        document: Document.fromJson(jsonDecode(widget.state!.data!.content!)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<EditorPageBloc>();
    final isSaving = bloc.isSaving();
    return AndroidkerScaffold(
      windowTitleText: "Editor",
      body: TextSelectionTheme(
        data: TextSelectionTheme.of(context).copyWith(
          cursorColor: theme.colorScheme.onBackground,
          selectionColor: theme.colorScheme.secondary,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StyledHeader(
                header: "Create a new post",
              ),
              const StyledSubHeader(
                subHeader: "Take your time",
              ),
              Expanded(
                child: EditorWindow(
                  quillController: _controller,
                  focusNode: _focusNode,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: Insets.lg,
                ),
                child: Row(
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(Insets.lg)),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            width: 2.0,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => const RoundedRectangleBorder(
                            borderRadius: Corners.mdBorder,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!isSaving) ...[
                            Container(
                              margin: EdgeInsets.only(
                                right: Insets.lg,
                              ),
                              child: Icon(
                                Icons.save,
                                size: IconSizes.med,
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Save draft",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  height: 24 / 18,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                            )
                          ],
                          if (isSaving) ...[
                            SizedBox.fromSize(
                              size: const Size.square(24),
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.onBackground,
                                strokeWidth: 1,
                              ),
                            ),
                          ]
                        ],
                      ),
                      onPressed: () {
                        Article data;
                        if (widget.state?.data != null) {
                          data = widget.state!.data!.copyWith.call(
                            content: jsonEncode(
                                _controller.document.toDelta().toJson()),
                          );
                        } else {
                          data = Article(
                            title: "Test 2",
                            author: "Androidker",
                            content: jsonEncode(
                                _controller.document.toDelta().toJson()),
                          );
                        }
                        bloc.saveArticle(data);
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(Insets.lg)),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            width: 2.0,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => const RoundedRectangleBorder(
                            borderRadius: Corners.mdBorder,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!isSaving) ...[
                            Container(
                              margin: EdgeInsets.only(
                                right: Insets.lg,
                              ),
                              child: Icon(
                                Icons.public,
                                size: IconSizes.med,
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Publish",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  height: 24 / 18,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                            )
                          ],
                          if (isSaving) ...[
                            SizedBox.fromSize(
                              size: const Size.square(24),
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.onBackground,
                                strokeWidth: 1,
                              ),
                            ),
                          ]
                        ],
                      ),
                      onPressed: () {
                        Article data;
                        if (widget.state?.data != null) {
                          data = widget.state!.data!.copyWith.call(
                            content: jsonEncode(
                                _controller.document.toDelta().toJson()),
                          );
                        } else {
                          data = Article(
                            title: "Test",
                            author: "Androidker",
                            content: jsonEncode(
                                _controller.document.toDelta().toJson()),
                          );
                        }
                        bloc.publishArticle(data.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditorWindow extends StatelessWidget {
  final QuillController? quillController;
  final FocusNode? focusNode;
  const EditorWindow({Key? key, this.quillController, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(Insets.lg),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onBackground,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuillToolbar.basic(
            controller: quillController!,
            webImagePickImpl: (val) {
              return Future.value(
                  "https://images.unsplash.com/photo-1626988006385-e5eec658f8f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80");
            },
            onImagePickCallback: (file) {
              return Future.value(
                  "https://images.unsplash.com/photo-1626988006385-e5eec658f8f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80");
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: Insets.lg,
            ),
            width: double.infinity,
            height: 0.5,
            color: theme.colorScheme.onBackground.withOpacity(0.5),
          ),
          Expanded(
            child: QuillEditor(
              controller: quillController!,
              scrollController: ScrollController(),
              scrollable: true,
              focusNode: focusNode!,
              autoFocus: false,
              readOnly: false,
              placeholder: 'Add content',
              expands: false,
              padding: EdgeInsets.zero,
              embedBuilder: defaultEmbedBuilderWeb,
            ),
          ),
        ],
      ),
    );
  }
}

Widget defaultEmbedBuilderWeb(BuildContext context, Embed node, bool readOnly) {
  switch (node.value.type) {
    case 'image':
      final String imageUrl = node.value.data;
      return Image.network(imageUrl);

    default:
      throw UnimplementedError(
        'Embeddable type "${node.value.type}" is not supported by default '
        'embed builder of QuillEditor. You must pass your own builder function '
        'to embedBuilder property of QuillEditor or QuillField widgets.',
      );
  }
}
