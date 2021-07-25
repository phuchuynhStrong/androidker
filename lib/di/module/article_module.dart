import 'package:androiker/core_packages.dart';
import 'package:articles/di/article_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ArticleModule {
  late final ArticleRepository? repository;

  ArticleModule({@required FirebaseFirestore? firestore, Logger? logger}) {
    repository =
        ArticleRepository(firebaseFirestore: firestore, logger: logger);
  }
}
