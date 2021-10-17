import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/Categories/CategoryModel.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List? listOfCategoryMaps;
  List listOfCategories=[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3/2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10
          ),
          itemCount: listOfCategories.length,

          itemBuilder: (BuildContext context, index){
            return Padding(padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          //box background
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3.0,
                                  blurRadius: 5.0)
                            ]
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children:<Widget> [
                            CircularProgressIndicator(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(listOfCategories[index].image,
                                width: 170,
                                height: 200.0,
                                fit: BoxFit.fill,),
                            ),
                            Text(
                              listOfCategories[index].name,style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black38,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                            )
                          ],
                        ),

                      ))
                ],
              ),


            );
          }

      ),
    );
  }
  Future <void>  fetchData() async {
    final  response = await http.get(Uri.parse(
        'https://retail.amit-learning.com/api/categories'));
    if (response.statusCode == 200) {

      listOfCategoryMaps = jsonDecode(response.body)['categories'];

      setState(() {
        for (int i = 0; i < listOfCategoryMaps!.length; i++) {
          listOfCategories.add(CategoryModel(
              listOfCategoryMaps![i]['id'],
              listOfCategoryMaps![i]['name'],
              listOfCategoryMaps![i]['avatar']));
        }
      });
    }
    else{
      throw Exception('ERROR');}
  }

  @override
  void initState() {
    fetchData();

  }


}

