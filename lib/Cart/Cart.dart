import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Cubit/Cubit.dart';
import 'package:shopapp/Cubit/States.dart';
import 'package:shopapp/component/component.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProduct;
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            ShopCubit cubit = ShopCubit.get(context);
            print(ShopCubit.cartData.toString());

            print(cartProduct);

            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView.builder(
                    itemCount: ShopCubit.cartData.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        //height: 100,
                        //  width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(ShopCubit.cartData[index].image,
                                  width: 100, height: 100),
                              SizedBox(
                                width: 1.0,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 200,
                                child: Column(
                                  children: [
                                    Text(ShopCubit.cartData[index].title,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                        )),
                                    Text(ShopCubit.cartData[index].name,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black)),
                                    SizedBox(
                                      height: 45.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ShopCubit.cartData[index].price
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.5,
                                        ),
                                        Text(
                                          'EGP',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                if (ShopCubit
                                                        .cartData[index].count >
                                                    1) {
                                                  ShopCubit.get(context)
                                                      .updateCartItemCount(
                                                          index, "-");
                                                }
                                              },
                                              icon: Icon(Icons.remove),
                                              color: Colors.white,
                                              iconSize: 20,
                                              padding: EdgeInsets.only(),
                                            )),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          ShopCubit.cartData[index].count
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 7.0,
                                        ),
                                        Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                ShopCubit.get(context)
                                                    .updateCartItemCount(
                                                        index, "+");
                                              },
                                              icon: Icon(Icons.add),
                                              color: Colors.white,
                                              iconSize: 20,
                                              padding: EdgeInsets.only(),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 190,
                    child: DefaultButton(
                        function: () {
                          cubit.clearCart();
                        },
                        text: "Clear Cart"),
                  ),
                  trailing: SizedBox(
                    height: 50,
                    width: 190,
                    child: DefaultButton(
                        function: () {
                          cubit.clearCart();
                        },
                        text: "Check Out"),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
