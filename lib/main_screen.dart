import 'package:cocktail_app/CustomSearchDelegate.dart';
import 'package:cocktail_app/cocktail_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Text("jjj"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
            },
          )
        ],
      ),
      body: Container(child: Consumer<CocktailListModel>(
        builder: (context, cocktailListModel, child) {
          return cocktailListModel.isLoading
              ? LinearProgressIndicator()
              : ListView.separated(
                  itemCount: cocktailListModel.cocktails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.15,
                        width: width,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.25,
                              child: Image.network(
                                  cocktailListModel.cocktails[index].thumbnail!),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        cocktailListModel.cocktails[index].name!,
                                      style: TextStyle(fontSize: width * 0.05),
                                    ),
                                    Expanded(
                                      child: Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(cocktailListModel.cocktails[index].ingredient1),
                                                  Text(cocktailListModel.cocktails[index].ingredient2)
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(cocktailListModel.cocktails[index].ingredient3),
                                                  Text(cocktailListModel.cocktails[index].ingredient4)
                                                ],
                                              )
                                            ],
                                          ),
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.only(top: 8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
        },
      )),
    );
  }
}
