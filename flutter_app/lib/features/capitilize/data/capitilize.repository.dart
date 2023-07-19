import 'package:dio/dio.dart';
import 'package:flutter_app/features/capitilize/domain/capitilize.repository.interface.dart';
import 'package:flutter_app/features/capitilize/domain/capitilized.interface.dart';

class CapitilizeRepository extends ICapitilizeRepository {
  CapitilizeRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ICapitilized> getCapitilizedText({
    required String text,
  }) async {
    final resData = await dio.post(
      'http://localhost:3000/capilize-text',
      data: {
        'text': text,
      },
    );

    return ICapitilized(
      capitilizedText: resData.data.toString(),
    );
  }
}
