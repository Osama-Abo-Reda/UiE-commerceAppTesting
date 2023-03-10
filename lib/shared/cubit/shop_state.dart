part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopChangePasswordVisibilityState extends ShopState {}

// Login States =========
class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {
  final ShopLoginModel loginModel;

  ShopSuccessState(this.loginModel);
}

class ShopFailureState extends ShopState {
  final String error;
  ShopFailureState(this.error);
} // =========

class ShopChangeBottomNavState extends ShopState {}

// Get Home Data Model
class ShopLoadingHomeDataState extends ShopState {}

class ShopSuccessHomeDataState extends ShopState {}

class ShopErrorHomeDataState extends ShopState {}
