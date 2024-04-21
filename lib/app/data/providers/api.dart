import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:painel_hortifrutti/app/core/errors/exception_handlers.dart';
import 'package:painel_hortifrutti/app/data/models/address_model.dart';
import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/data/models/category_request_model.dart';
import 'package:painel_hortifrutti/app/data/models/city_model.dart';
import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/data/models/order_request_model.dart';
import 'package:painel_hortifrutti/app/data/models/product_model.dart';
import 'package:painel_hortifrutti/app/data/models/store_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_address_request_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_login_request_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_login_response_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_model.dart';
import 'package:painel_hortifrutti/app/data/models/user_profile_request_model.dart';
import 'package:painel_hortifrutti/app/data/services/storage/storage_service.dart';
import 'package:get/get.dart';

class Api extends GetxService {
  final _baseUrl = "http://192.168.0.40:3333/"; //home
  late Dio _dio;

  @override
  void onInit() {
    // httpClient.baseUrl =
    // "https://dev.hortifruti.174.138.42.25.getmoss.site/"; //site
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 16000),
      receiveTimeout: const Duration(milliseconds: 16000),
      sendTimeout: const Duration(milliseconds: 16000),
    ));
    _dio.interceptors.add(AppInterceptors(_dio));

    // httpClient.addRequestModifier((Request request) {
    //   request.headers['Accept'] = 'application/json';
    //   request.headers['Content-Type'] = 'application/json';

    //   return request;
    // });

    // httpClient.addAuthenticator((Request request) {
    //   var token = _storageService.token;
    //   var headers = {'Authorization': "Bearer $token"};
    //   request.headers.addAll(headers);

    //   return request;
    // });
    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    var response = await _dio.get('cidades');
    List<CityModel> data = [];
    for (var city in response.data) {
      data.add(
        CityModel.fromJson(city),
      );
    }
    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = await _dio.post(
      'login',
      data: jsonEncode(data),
    );

    return UserLoginResponseModel.fromJson(response.data);
  }

  Future<UserModel> register(UserProfileRequestModel data) async {
    var response = await _dio.post(
      'cliente/cadastro',
      data: jsonEncode(data),
    );

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> getUser() async {
    var response = await _dio.get('auth/me');

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> putUser(UserProfileRequestModel data) async {
    var response = await _dio.put('cliente', data: jsonEncode(data));
    return UserModel.fromJson(response.data);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    var response = await _dio.get('enderecos');

    List<AddressModel> data = [];
    for (var address in response.data) {
      data.add(
        AddressModel.fromJson(address),
      );
    }
    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    (
      await _dio.post(
        'enderecos',
        data: jsonEncode(data),
      ),
    );
  }

  Future<void> putAddress(UserAddressRequestModel data) async {
    (await _dio.put('enderecos/${data.id}', data: jsonEncode(data)));
  }

  Future<void> deleteAddress(int id) async {
    (await _dio.delete('enderecos/$id'));
  }

  Future<List<StoreModel>> getStores(int cityId) async {
    var response = (await _dio.get('cidades/$cityId/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.data) {
      data.add(
        StoreModel.fromJson(store),
      );
    }
    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = await _dio.get('estabelecimentos/$id');
    return StoreModel.fromJson(response.data);
  }

  //PRODUTOS
  Future<List<ProductModel>> getProducts(int categoryId) async {
    var response =
        await _dio.get('estabelecimento/produtos?categoria_id=$categoryId');
    List<ProductModel> data = [];
    for (var product in response.data) {
      data.add(
        ProductModel.fromJson(product),
      );
    }
    return data;
  }

  //pedidos
  Future postOrder(OrderRequestModel data) async {
    (
      await _dio.post(
        'pedidos',
        data: jsonEncode(data),
      ),
    );
  }

  Future<List<OrderModel>> getOrders() async {
    var response = await _dio.get('estabelecimento/pedidos');
    List<OrderModel> data = [];
    for (var order in response.data) {
      data.add(OrderModel.fromJson(order));
    }

    return data;
  }

  Future<List<CategoryModel>> getCategories() async {
    var response = await _dio.get('estabelecimento/categorias');
    List<CategoryModel> data = [];
    for (var order in response.data) {
      data.add(CategoryModel.fromJson(order));
    }

    return data;
  }

  Future<CategoryModel> postCategory(CategoryRequestModel data) async {
    var response =
        await _dio.post('estabelecimento/categorias', data: jsonEncode(data));
    return CategoryModel.fromJson(response.data);
  }

  Future<OrderModel> getOrder(String id) async {
    var response = await _dio.get('pedidos/$id');

    return OrderModel.fromJson(response.data);
  }

  Future<void> postOrderStatus(String id, int statusId) async {
    await _dio.post(
      'pedidos/$id/statuses',
      data: jsonEncode({'status_id': statusId}),
    );
  }

//   Response  (Response response) {
//     print( response.dataString);
//     switch (response.statusCode) {
//       case 200:
//       case 202:
//       case 204:
//         return response;
//       case 422:
//         throw  response.data['errors'].first['message'];
//       default:
//         throw 'Ocorreu um erro';
//     }
//   }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final _storageService = Get.find<StorageService>();

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var accessToken = _storageService.token;
    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 422:
            throw UnprocessableEntity(err.requestOptions, err.response);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType
            .badCertificate: // Adicionando o caso para DioExceptionType.badCertificate
        throw BadCertificateException(err.requestOptions);
      default: // Caso padrão para lidar com outros tipos de exceções
        throw DioErrorException(err.requestOptions, err.type);
    }
    return handler.next(err);
  }
}
