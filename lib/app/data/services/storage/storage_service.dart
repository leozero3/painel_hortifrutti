import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum StorageKey { token }

class StorageService extends GetxService {
  final box = GetStorage();
  final _token = RxnString();
  String? get token => _token.value;

  @override
  void onInit() {
    _token.value = box.read('${StorageKey.token}');
    box.listenKey(
      StorageKey.token.toString(),
      (value) => _token.value = value,
    );

    super.onInit();
  }

  Future<void> saveToken(String token) async {
    return box.write('${StorageKey.token.toString()}', token);
  }

  Future<void> removeToken() async {
    return box.remove('${StorageKey.token.toString()}');
  }
}
