import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavouriteDataSource {
  final _db = FirebaseFirestore.instance;
  String _getUserId() => FirebaseAuth.instance.currentUser!.uid;

  Future<bool> addFavourite(String contentId, Map<String, dynamic> data) async {
    try {
      await _db
          .collection(storeCollectionUsers)
          .doc(_getUserId())
          .collection(storeCollectionFavourites)
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
    final item = await _db
        .collection(storeCollectionFavourites)
        .doc(_getUserId())
        .collection(storeCollectionItems)
        .doc("item_$contentId")
        .get();
    return item.exists;
  }

  Future<List<ContentItem>> getAllFavourites() async {
    final data = _db
        .collection(storeCollectionFavourites)
        .doc(_getUserId())
        .collection(storeCollectionItems)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return ContentItem.fromJson(data);
          }).toList(),
        );
    return await data.last;
  }
}
