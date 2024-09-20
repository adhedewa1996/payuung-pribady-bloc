import 'package:example/app/commons/models/news_models.dart';
import 'package:example/app/commons/utils/constants.dart';
import 'package:example/app/core/lifecycle/lifecycle_controller.dart';
import 'package:example/app/core/network/network_implementation.dart';
import 'package:example/app/core/network/network_seal.dart';
import 'package:example/app/modules/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends LifecycleController with HomeRepository {
  String title = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry';
  String description = 'Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.';

  final newsList = <DatumDatum>[].obs;
  final progress = ProgressLoadingType.loading.obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void updateProgressNews(ProgressLoadingType value) {
    progress.value = value;
  }

  Future<void> fetch() async {
    await singleApi(
      repo: () => repoGetHeadline(),
      progressOnInitAndRecall: () {},
      result: (result) {
        switch (result) {
          case Success():
            final data = NewsModel.fromJson(result.value);
            if (data.data?.isEmpty ?? false) {
              updateProgressNews(ProgressLoadingType.empty);
            } else {
              newsList.addAll(data.data?.first.data ?? <DatumDatum>[]);
              updateProgressNews(ProgressLoadingType.success);
            }
          case Failure():
            updateProgressNews(ProgressLoadingType.failed);
        }
      },
    );
  }
}
