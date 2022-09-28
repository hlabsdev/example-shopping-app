import 'package:assigame_market/data/storages/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://assigame-market.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///Login with email and password
  @POST("/auth/login")
  Future<User> login(
    @Field() String email,
    @Field() String password,
  );

  ///The bearerToken must be preceded by [Bearer ]. Note that there is a space after the word "bearer", the token string
  @GET("/auth/user")
  Future<User> getCurrentUser(
    @Header("Authorization") String bearerToken,
  );

  // TODO: For the few next methods, Don't forget to change List<String>> here in to the appropriate data format (Create new model from response json)
  ///Here you get all the categories in database
  @GET("/categories")
  Future<List<String>> getCategories(
    @Header("Authorization") String bearerToken,
    @Query("page") String page,
  );

  ///Here you get all products of the selected category
  @GET("/categories/{id}")
  Future<List<String>> getCategory(
    @Header("Authorization") String bearerToken,
    @Path() String id,
    @Query("page") String page,
  );

  ///Here you get all the products in database
  @GET("/products")
  Future<List<String>> getProducts(
    @Header("Authorization") String bearerToken,
    @Query("page") String page,
  );

  ///Here you get the details of the selected product
  @GET("/products/{id}")
  Future<List<String>> getProduct(
    @Header("Authorization") String bearerToken,
    @Path() String id,
    @Query("page") String page,
  );

/*Here are the deserilization functions, can be used
       to convert network models into storage models*/

/*
  Category deserializeCategory(Map<String, dynamic> json) => Category.fromJson(json);

  List<Category> deserializeCategoryList(List<Map<String, dynamic>> json) =>
      json.map((e) => {
        categoryResp = CategoryList.fromJson(e);
        category = new Category(
          ...
      );
        return ;
      }).toList();

  Map<String, dynamic> serializeCategory(Category object) => object.toJson();

  List<Map<String, dynamic>> serializeCategoryList(List<Category> objects) =>
      objects.map((e) => e.toJson()).toList();
  */
}
