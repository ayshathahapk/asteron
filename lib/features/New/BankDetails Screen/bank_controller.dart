import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Models/bank_details_model.dart';
import 'bank_repo.dart';

final bankControllerProvider = Provider(
  (ref) => BankController(bankRepo: ref.watch(bankRepoProvider)),
);
final bankDetailsProvider = StreamProvider(
  (ref) {
    return ref.watch(bankControllerProvider).getBankDetails();
  },
);

class BankController {
  final BankRepo _bankRepo;
  BankController({required BankRepo bankRepo}) : _bankRepo = bankRepo;

  Stream<List<BankDetailsModel?>> getBankDetails() {
    return _bankRepo.getBankDetails();
  }
}
