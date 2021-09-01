import 'package:articles/model/article.dart';
import 'package:articles/model/article_pagination_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

const _kArticlesCollection = "articles";
const _kDraftsCollection = "drafts";

enum ArticleType {
  draft,
  published,
}

class ArticleRepository {
  final FirebaseFirestore? _firebaseFirestore;
  final Logger? logger;

  ArticleRepository({
    FirebaseFirestore? firebaseFirestore,
    this.logger,
  }) : _firebaseFirestore = firebaseFirestore;

  String getCollectionPath(ArticleType type) {
    String path;
    switch (type) {
      case ArticleType.draft:
        path = _kDraftsCollection;
        break;
      case ArticleType.published:
        path = _kArticlesCollection;
        break;
      default:
        path = _kArticlesCollection;
        break;
    }
    return path;
  }

  Future<ArticlePaginationResponse?> getArticles({
    ArticleType articleType = ArticleType.published,
  }) async {
    logger?.i("Prepare to get article from Firestore");
    final snapshot = await _firebaseFirestore
        ?.collection(getCollectionPath(articleType))
        .get();
    final response = ArticlePaginationResponse.fromJson({
      "data": snapshot?.docs
          .map((e) => e.data()
            ..update("id", (_) => e.id)
            ..update("id", (_) => e.id)
            ..update("isDraft", (_) => articleType == ArticleType.draft))
          .toList(),
    });
    logger?.i(response.data);
    return response;
  }

  Future<Article> saveArticle(Article article) async {
    if (article.id == null) {
      final draft = article.copyWith.call(
        isDraft: true,
      );
      final reference = await _firebaseFirestore
          ?.collection(_kDraftsCollection)
          .add(article.toJson());
      return draft.copyWith.call(
        id: reference?.id,
      );
    }

    await _firebaseFirestore
        ?.collection(_kDraftsCollection)
        .doc(article.id)
        .update(article.toJson());

    return article;
  }

  Future<Article> getArticle(
    String? id, {
    ArticleType articleType = ArticleType.published,
  }) async {
    assert(id != null);
    logger?.i("Prepare to get article from Firestore");
    final snapshot = await _firebaseFirestore
        ?.collection(getCollectionPath(articleType))
        .get();
    final response = snapshot?.docs
        .where((item) => item.id == id)
        .map((item) => item.data()
          ..update("id", (_) => id)
          ..update("isDraft", (_) => articleType == ArticleType.draft))
        .toList();
    if (response == null || response.isEmpty) {
      throw Exception("Article not found");
    }
    return Article.fromJson(response.first);
  }

  Future<bool> publishArticle(String? id) async {
    assert(id != null);
    logger?.i("Prepare to publish article");
    final article = await getArticle(id, articleType: ArticleType.draft);
    return await _firebaseFirestore!
        .collection(getCollectionPath(ArticleType.draft))
        .doc(id)
        .delete()
        .then(
          (abc) => _firebaseFirestore!
              .collection(getCollectionPath(ArticleType.published))
              .add(
                article.toJson(),
              ),
        )
        .then((value) => true)
        .catchError(
      (error) {
        logger?.e(error.toString());
        return false;
      },
    );
  }
}
