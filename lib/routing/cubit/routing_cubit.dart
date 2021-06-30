import 'package:androiker/routing/app_link.dart';
import 'package:androiker/views/blog/blog_page.dart';
import 'package:androiker/views/coming_soon/coming_soon_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingCubit extends Cubit<AppLink> {
  RoutingCubit() : super(AppLink.initial());

  void navigate({AppLink? appLink}) => emit(appLink ?? state);
  void showcase() {
    emit(AppLink(pageId: kComingSoonPageId));
  }

  void blog() => emit(AppLink(pageId: kBlogPageId));
  void home() => emit(AppLink.initial());
}
