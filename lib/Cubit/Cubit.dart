import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Cart/Cart.dart';
import 'package:shopapp/Cart/Model.dart';
import 'package:shopapp/Categories/Categories.dart';
import 'package:shopapp/Cubit/States.dart';
import 'package:shopapp/Home/HomePage.dart';
import 'package:shopapp/Menu/Menu.dart';


class ShopCubit extends Cubit<ShopStates> {
  // call Super constructor with initial State
  ShopCubit() : super(InitialState());

  // create get method that return Object of TODO Cubit
  static ShopCubit get(context) => BlocProvider.of(context);

  int total = 0;
  int index = 0;
  static List<ModelCart> cartData = [];

  List<Widget>MainScreens=[
    HomePage(),
    Categories(),
    Cart(),
    Menu()
  ];
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home'),

    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Categories'),

    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Cart'),

    BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        label: 'Menu'),
  ];

  //Actions
  void changeIndex(int newIndex){
    index = newIndex;
    emit(BottomNavigationBarItemChanged());
  }
  TextDirection appDirection = TextDirection.ltr;



  void clearCart(){
    cartData.clear();

    emit(ClearCartState());
  }
  void insertToCart(ModelCart model){
    cartData.add(model);
    cartData.forEach((element) {
      print(element.name);
    });
    emit(AddedToCartState());
  }

  void updateCartItemCount(int index , String sign){
    int old = ShopCubit.cartData[index].count;
    if(sign == '+'){
      cartData[index].updateCount(old+1);
    }else {
      cartData[index].updateCount(old-1);
    }

    emit(AddedToCartState());
  }



}



