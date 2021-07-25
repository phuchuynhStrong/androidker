import 'package:androiker/core_packages.dart';
import 'package:androiker/di/component/article_component.dart';
import 'package:androiker/views/blog/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

const kBlogPageId = 'blog';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<BlogPageBloc>(
      create: (context) => BlogPageBloc(
        articleRepository: context.read<ArticleComponent>().module?.repository,
      ),
      child: AndroidkerScaffold(
        windowTitleText: "Blog",
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StyledHeader(
                header: "Blog",
              ),
              const StyledSubHeader(
                subHeader:
                    "Sharing knowledge is a good way to improve yourself",
              ),
              Expanded(
                child: BlocBuilder<BlogPageBloc, BlogPageState>(
                  builder: (context, state) {
                    if (state.isFetching) {
                      return Container();
                    }

                    if (state.fetched && state.data.isEmpty) {
                      return Center(
                        child: Text(
                          "No Posts Yet.",
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (context, pos) {
                        final article = state.data[pos];
                        Logger().i(article);
                        return BlogItem(
                          article: article,
                          onPressed: () {
                            context
                                .read<BlogPageBloc>()
                                .onArticleItemPressed(article);
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
