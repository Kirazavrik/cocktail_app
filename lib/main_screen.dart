import 'package:cocktail_app/cocktail_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jjj"),
      ),
      body: Container(
        child: Consumer<CocktailListModel>(
          builder: (context, cocktailListModel, child) {
            return cocktailListModel.isLoading?LinearProgressIndicator():
            ListView.separated(
              itemCount: cocktailListModel.cocktails.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(cocktailListModel.cocktails[index].name);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          },
        )
      ),
    );
  }

}