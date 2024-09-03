import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Core/app_export.dart';
import '../../../Models/commodities_model.dart';
import '../../../Models/news_model.dart';
import '../../../Models/spread_document_model.dart';

final liveRepositoryNewProvider = Provider(
  (ref) => LiveRepositoryNew(firestore: ref.watch(firestoreProvider)),
);

class LiveRepositoryNew {
  final FirebaseFirestore _firestore;
  LiveRepositoryNew({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<SpreadDocumentModel> getSpread() async {
    print("start");
    DocumentSnapshot result = await _firestore
        .collection(FirebaseConstants.user)
        .doc(FirebaseConstants.userDoc)
        .collection(FirebaseConstants.spread)
        .doc(FirebaseConstants.spreadDocument)
        .get();
    print(result.data());
    print("end");

    final spread =
        SpreadDocumentModel.fromMap(result.data() as Map<String, dynamic>);
    return spread;
  }

  Stream<List<CommoditiesModel>> commodities() {
    return _firestore
        .collection(FirebaseConstants.user)
        .doc(FirebaseConstants.userDoc)
        .collection(FirebaseConstants.commodities)
        .orderBy("timestamp", descending: false)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (e) {
              CommoditiesModel res = CommoditiesModel.fromMap(e.data());
              return res;
            },
          ).toList(),
        );
  }

  Stream<NewsModel?> getNews() {
    return _firestore
        .collection(FirebaseConstants.user)
        .doc(FirebaseConstants.userDoc)
        .collection(FirebaseConstants.news)
        .doc("46CwFIKoz3jZnmh1hE15")
        .snapshots()
        .map((event) {
      if (event.exists) {
        return NewsModel.fromMap(event.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    });
  }
}
