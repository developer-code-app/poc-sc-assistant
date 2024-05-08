import 'package:dio/dio.dart';
import 'package:poc_sc_assistant/providers/api/entities/user_profile_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('user/profile')
  Future<UserProfileEntity> fetchProfile();
}
