import 'package:dio/dio.dart';
import 'package:poc_sc_assistant/providers/api/entities/home_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET('homes')
  Future<List<HomeEntity>> fetchHomes();
}
