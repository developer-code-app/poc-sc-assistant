import 'package:poc_sc_assistant/exceptions/app_exception.dart';
import 'package:poc_sc_assistant/models/home.dart';
import 'package:poc_sc_assistant/providers/api/api_provider.dart';

class HomeRepository {
  HomeRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<Home>> fetchHomes() async {
    return apiProvider.home
        .fetchHomes()
        .then((entities) => entities.map(Home.fromEntity))
        .then((home) => home.toList())
        .onError((error, _) => throw AppException.fromError(error));
  }
}
