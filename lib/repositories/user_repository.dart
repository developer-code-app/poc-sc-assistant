import 'package:poc_sc_assistant/exceptions/app_exception.dart';
import 'package:poc_sc_assistant/models/user_profile.dart';
import 'package:poc_sc_assistant/providers/api/api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<UserProfile> fetchProfile() async {
    return apiProvider.user
        .fetchProfile()
        .then(UserProfile.fromEntity)
        .onError((error, _) => throw AppException.fromError(error));
  }
}
