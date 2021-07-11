import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingCubit extends Cubit<AppLink> {
  RoutingCubit() : super(AppLink.initial());

  void navigate({AppLink? appLink}) => emit(appLink ?? state);
  void showcase() {
    emit(AppLink(pageId: AppPage.showcase.name));
  }

  void blog() => emit(AppLink(pageId: AppPage.blog.name));
  void home() => emit(AppLink(pageId: AppPage.home.name));
}
