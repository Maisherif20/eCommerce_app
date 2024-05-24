import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data_layer/model/BrandsResponse/BrandResponse.dart';
import 'package:ecommerce/data_layer/model/addTowishList/WishListResponse.dart';
import 'package:ecommerce/data_layer/model/addressResponse/AddressResponse.dart';
import 'package:ecommerce/data_layer/model/auth_Response/AuthResponse.dart';
import 'package:ecommerce/data_layer/model/cartResponse/CartResponse.dart';
import 'package:ecommerce/data_layer/model/categoriesResponse/CategoryResponse.dart';
import 'package:ecommerce/data_layer/model/getCartResponse/GetCartResponse.dart';
import 'package:ecommerce/data_layer/model/productResponse/ProductResponse.dart';
import 'package:ecommerce/domain_layer/Reposatory/productRepository.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManager {
  static const baseUrl = "ecommerce.routemisr.com";
  Future<CategoryResponse> getCatogries() async {
    var url = Uri.https(baseUrl, "/api/v1/categories");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    CategoryResponse categoryResponse = CategoryResponse.fromJson(json);
    return categoryResponse;
  }

  Future<BrandResponse> getBrands() async {
    var url = Uri.https(baseUrl, "/api/v1/brands");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    BrandResponse brandResponse = BrandResponse.fromJson(json);
    return brandResponse;
  }

  Future<ProductResponse> getProducts(
      ProductSort? sortBy, String? categoryId) async {
    var url = categoryId == null || categoryId.isEmpty
        ? Uri.https(baseUrl, "/api/v1/products", {
            'sort': sortBy,
          })
        : Uri.https(baseUrl, "/api/v1/products", {
            'sort': sortBy,
            "category[in]": categoryId,
          });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }

  Future<AuthResponse> signUp(
      {required String email,
      required String password,
      required String mobileNum,
      required String name}) async {
    var uri = Uri.https(baseUrl, "/api/v1/auth/signup");
    var response = await http.post(uri, body: {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": mobileNum,
    });
    var json = jsonDecode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<AuthResponse> signIn(
      {required String email, required String password}) async {
    var uri = Uri.https(baseUrl, "/api/v1/auth/signin");
    var response =
        await http.post(uri, body: {"email": email, "password": password});
    var json = jsonDecode(response.body); //String to json
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<AuthResponse> updateUserNameAndPhone(
      {required String name, required String mobileNum}) async {
    var uri = Uri.https(baseUrl, "/api/v1/users/updateMe/");
    var response = await http.put(uri, body: {
      "name": name,
      // "email": email,
      "phone": mobileNum,
    }, headers: {
      "token": PrefsHelper.getToken()
    });
    var json = jsonDecode(response.body); //String to json
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<AuthResponse> updateUserEmail({required String email}) async {
    var uri = Uri.https(baseUrl, "/api/v1/users/updateMe/");
    var response = await http.put(uri, body: {
      // "name": name
      "email": email
      // "phone": mobileNum,
    }, headers: {
      "token": PrefsHelper.getToken()
    });
    var json = jsonDecode(response.body); //String to json
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<AddressResponse> addAddress(
      {required String name,
      required String homeDetails,
      required String phone,
      required String city}) async {
    var uri = Uri.https(baseUrl, "/api/v1/addresses");
    var response = await http.post(uri, body: {
      "name": name,
      "details": homeDetails,
      "phone": phone,
      "city": city,
    }, headers: {
      "token": PrefsHelper.getToken()
    });
    var json = jsonDecode(response.body); //String to json
    AddressResponse addressResponse = AddressResponse.fromJson(json);
    return addressResponse;
  }

  Future<AddressResponse> getUserAddress() async {
    var url = Uri.https(
        baseUrl, "/api/v1/addresses", {"token": PrefsHelper.getToken()});
    var response =
        await http.get(url, headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body);
    AddressResponse addressResponse = AddressResponse.fromJson(json);
    return addressResponse;
  }

  Future<AuthResponse> updateUserPassword(
      {required String current,
      required String password,
      required String rePassword}) async {
    var uri = Uri.https(baseUrl, "/api/v1/users/changeMyPassword");
    var response = await http.put(uri, body: {
      "currentPassword": current,
      "password": password,
      "rePassword": rePassword
    }, headers: {
      "token": PrefsHelper.getToken()
    });
    var json = jsonDecode(response.body); //String to json
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<WishListResponse> addToWishList({required String productId}) async {
    var uri = Uri.https(baseUrl, "/api/v1/wishlist");
    var response = await http.post(uri,
        body: {"productId": productId},
        headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body); //String to json
    WishListResponse wishListResponse = WishListResponse.fromJson(json);
    return wishListResponse;
  }
  Future<ProductResponse> getUserWishList() async {
    var url = Uri.https(
        baseUrl, "/api/v1/wishlist", {"token": PrefsHelper.getToken()});
    var response =
    await http.get(url, headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }
  Future<ProductResponse> deleteProductFromWishList(String productId) async {
    var url = Uri.https(
        baseUrl, "/api/v1/wishlist/$productId");
    var response =
    await http.delete(url,headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }
  Future<CartResponse> addToCart({required String productId}) async {
    var uri = Uri.https(baseUrl, "/api/v1/cart");
    var response = await http.post(uri,
        body: {"productId": productId},
        headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body); //String to json
    CartResponse cartResponse = CartResponse.fromJson(json);
    return cartResponse;
  }
  Future<GetCartResponse> getCart() async {
    var url = Uri.https(baseUrl, "/api/v1/cart", {"token": PrefsHelper.getToken()});
    var response = await http.get(url , headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body);
    GetCartResponse getCartResponse = GetCartResponse.fromJson(json);
    return getCartResponse;
  }
  Future<CartResponse> deleteFromCart(String productId) async {
    var url = Uri.https(
        baseUrl, "/api/v1/cart/$productId");
    var response =
    await http.delete(url,headers: {"token": PrefsHelper.getToken()});
    var json = jsonDecode(response.body);
    CartResponse cartResponse = CartResponse.fromJson(json);
    return cartResponse;
  }
}
