import 'package:articles/model/article.dart';
import 'package:articles/model/article_pagination_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

const _kArticlesCollection = "articles";

class ArticleRepository {
  final FirebaseFirestore? _firebaseFirestore;
  final Logger? logger;

  ArticleRepository({
    FirebaseFirestore? firebaseFirestore,
    this.logger,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<ArticlePaginationResponse?> getArticles() async {
    logger?.i("Prepare to get article from Firestore");
    final snapshot =
        await _firebaseFirestore?.collection(_kArticlesCollection).get();
    final response = ArticlePaginationResponse.fromJson({
      "data": snapshot?.docs
          .map((e) => e.data()
            ..putIfAbsent("id", () => e.id)
            ..update("id", (value) => e.id))
          .toList(),
    });
    logger?.i(response.data);
    return response;
  }

  Future<Article> saveArticle(Article article) async {
    final reference = await _firebaseFirestore
        ?.collection(_kArticlesCollection)
        .add(article.toJson());
    return article.copyWith.call(
      id: reference?.id,
    );
  }
}
