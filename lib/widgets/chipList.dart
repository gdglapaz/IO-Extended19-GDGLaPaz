import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/models/categoryModel.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class ChipList extends StatelessWidget {

  int sessionId;
  ChipList(this.sessionId);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<CategoryModel>>(
        future: DBProvider.db.getCategoriesBySession(sessionId),
        builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot){

        if(!snapshot.hasData){
          return Container();
        }

        final categories = snapshot.data;

        return Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return chip(categories[index]);
            }
          )
        );
    });
  }

  Widget chip(CategoryModel categoryModel){
    return Container(
      padding: EdgeInsets.only(top: 6.0, right: margin_s, left: margin_s, bottom: margin_xs),
      margin: EdgeInsets.only(top: margin_xs, right: margin_xs, bottom: margin_xs),
      decoration: BoxDecoration(
        color: Color(int.parse(categoryModel.color)),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Text(
        categoryModel.nameTechnology,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: letter_ms
        ),
      ),
    );
  }
}
