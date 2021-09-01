import 'package:androiker/core_packages.dart';
import 'package:androiker/di/component/article_component.dart';
import 'package:androiker/di/component/auth_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

class DraftsListPage extends StatelessWidget {
  const DraftsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AndroidkerScaffold(
      body: BlocProvider<DraftsListBloc>(
        create: (context) => DraftsListBloc(
          articleRepository:
              context.read<ArticleComponent>().module?.repository,
        ),
        child: const Expanded(child: DraftsListContent()),
      ),
    );
  }
}

class DraftsListContent extends StatelessWidget {
  const DraftsListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<DraftsListBloc>();
    return BlocBuilder<DraftsListBloc, DraftsListState>(
      builder: (context, state) {
        if (state.isFetching) {
          return Center(
            child: SizedBox.fromSize(
              size: Size.square(24.0),
              child: CircularProgressIndicator(
                color: theme.colorScheme.onBackground,
                strokeWidth: 1.0,
              ),
            ),
          );
        }

        if (state.fetched && state.data.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: Insets.lg,
                  ),
                  child: Text(
                    "No draft found",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => theme.colorScheme.secondary),
                  ),
                  onPressed: () {
                    bloc.onCreateDraft(context);
                  },
                  child: Text(
                    "Create",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StyledHeader(
              header: "Drafts",
            ),
            const StyledSubHeader(
              subHeader: "Saved your work in progress",
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.data.length,
                shrinkWrap: true,
                itemBuilder: (context, pos) {
                  final draft = state.data[pos];
                  return Card(
                    child: InkWell(
                      onTap: () => bloc.onEditDraft(context, draft),
                      child: Padding(
                        padding: EdgeInsets.all(Insets.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: Insets.sm,
                              ),
                              child: Text(
                                draft.title ?? "N/A",
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
