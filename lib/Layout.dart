import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Cubit/Cubit.dart';
import 'package:shopapp/Cubit/States.dart';
class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => ShopCubit(),
        child: BlocConsumer<ShopCubit,ShopStates>(
            listener:(context,state){} ,
            builder: (context,state) {
              ShopCubit cubit = ShopCubit.get(context);
              return Scaffold(
                body: cubit.MainScreens[cubit.index],

                bottomNavigationBar: BottomNavigationBar(
                  unselectedItemColor: Colors.black54,
                  selectedItemColor: Colors.red,
                  elevation: 20.0,
                  items:
                  cubit.bottomItems,
                  currentIndex: cubit.index,
                  onTap: (index){
                    cubit.changeIndex(index);
                  },


                ),

              );
            }));
  }
}
