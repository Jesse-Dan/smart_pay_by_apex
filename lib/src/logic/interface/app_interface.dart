import '../../views/utils/enums.dart';

abstract class AppInterface {
  Future<(Map<String, dynamic>?, ResponseType, String)> getSecret();
}
