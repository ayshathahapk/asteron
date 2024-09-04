import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Core/Utils/firebase_constants.dart';
import '../../../Core/Utils/firebase_provider.dart';
import '../../Models/bank_details_model.dart';

final bankRepoProvider = Provider(
  (ref) => BankRepo(firestore: ref.watch(firestoreProvider)),
);

class BankRepo {
  final FirebaseFirestore _firestore;
  BankRepo({required FirebaseFirestore firestore}) : _firestore = firestore;

  Stream<List<BankDetailsModel?>> getBankDetails() {
    return _firestore
        .collection(FirebaseConstants.user)
        .doc(FirebaseConstants.userDoc)
        .collection(FirebaseConstants.bank)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (e) {
              if(e.exists){
                BankDetailsModel res = BankDetailsModel.fromMap(e.data());
                return res;
              }else{
                return null;
              }
            },
          ).toList(),
        );
  }
}
