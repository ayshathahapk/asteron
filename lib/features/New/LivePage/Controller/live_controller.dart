import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Models/commodities_model.dart';
import '../../../Models/news_model.dart';
import '../../../Models/spot_rate_model.dart';
import '../../../Models/spread_document_model.dart';
import '../Repository/live_repository_new.dart';

final liveControllerP = NotifierProvider<LiveController, bool>(
  () => LiveController(),
);
final spotRateProvider = FutureProvider(
  (ref) {
    return ref.watch(liveControllerP.notifier).getSpotRate();
  },
);

class LiveController extends Notifier<bool> {
  LiveRepositoryNew _repositoryNew() {
    return ref.read(liveRepoNewProvider);
  }

  @override
  bool build() {
    // TODO: implement build
    return false;
  }

  Future<SpotRateModel?> getSpotRate() async {
    SpotRateModel? spotRateModel;
    final res = await _repositoryNew().getSpotRate();
    res.fold(
      (l) {
        print("###ERROR###");
        print(l.message);
      },
      (r) {
        spotRateModel = r;
      },
    );
    return spotRateModel;
  }
}
