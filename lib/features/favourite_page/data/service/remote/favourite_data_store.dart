import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavouriteDataSource {
  final _db = FirebaseFirestore.instance;
  String _getUserId() => FirebaseAuth.instance.currentUser?.uid ?? "";

  Future<bool> addFavourite(String contentId, Map<String, dynamic> data) async {
    try {
      await _db
          .collection(storeCollectionFavourites)
          .doc(_getUserId())
          .collection(storeCollectionItems)
          .doc("item_$contentId")
          .set(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFavourite(String contentId) async {
    try {
      await _db
          .collection(storeCollectionFavourites)
          .doc(_getUserId())
          .collection(storeCollectionItems)
          .doc('item_$contentId')
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isFavourite(String contentId) async {
    try {
      final userId = _getUserId();
      if (userId.isEmpty) return false;
      final item = await _db
          .collection(storeCollectionFavourites)
          .doc(_getUserId())
          .collection(storeCollectionItems)
          .doc("item_$contentId")
          .get();
      return item.exists;
    } catch (e) {
      return false;
    }
  }

  Stream<List<ContentItem>> watchAllFavourites() {
    final userId = _getUserId();
    return _db
        .collection(storeCollectionFavourites)
        .doc(userId)
        .collection(storeCollectionItems)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return ContentItem.fromJson(data);
          }).toList(),
        );
  }

  Future<List<ContentItem>> getAllFavourites() async {
    try {
      final userId = _getUserId();
      final snapshot = await _db
          .collection(storeCollectionFavourites)
          .doc(userId)
          .collection(storeCollectionItems)
          .get();

      final items = snapshot.docs.map((doc) {
        final data = doc.data();
        return ContentItem.fromJson(data);
      }).toList();

      return items;
    } catch (e) {
      return [];
    }
  }
}
