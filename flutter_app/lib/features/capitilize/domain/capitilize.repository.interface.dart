import 'package:flutter_app/features/capitilize/domain/capitilized.interface.dart';

abstract class ICapitilizeRepository {
  Future<ICapitilized> getCapitilizedText({
    required String text,
  });
}
