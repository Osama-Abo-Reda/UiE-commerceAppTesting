import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/shop_app_model.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../modules/products/products_screen.dart';
import '../../modules/products/cateogries_screen.dart';
import '../../modules/products/favorites_screen.dart';
import '../../modules/products/settings_screen.dart';
import '../../models/home_model.dart';
import '../components/constants.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  // Visibility Password =========
  bool isPasswordShow = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  } // =========

  // Login logic =========
  ShopLoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoadingState());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data?.name);
      emit(ShopSuccessState(loginModel!));
    }).catchError((onError) {
      print(onError);
      emit(ShopFailureState(onError.toString()));
    });
  } // =========

// Change Bottom Nav
  int currentIndex = 0;
  List<Widget> bottomScreens = const [
    ProductsScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.status);
      print(homeModel!.data!.banners[0].id);
      emit(ShopSuccessHomeDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorHomeDataState());
    });
  }
}
