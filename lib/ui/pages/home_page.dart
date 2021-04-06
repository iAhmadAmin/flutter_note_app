import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/pages/add_note_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:flutter_note_app/ui/widgets/icon_button.dart';
import 'package:flutter_note_app/ui/widgets/note_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3B3B3B),
        onPressed: () {
          Get.to(AddNotePage());
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 16,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notes",
            style: titleTextStyle,
          ),
          MyIconButton(
            onTap: () {},
            icon: Icons.search,
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StaggeredGridView.countBuilder(
          primary: false,
          crossAxisCount: 4,
          itemCount: notesList.length,
          // staggeredTiles:
          //     notesList.map((e) => StaggeredTile.extent(2, 100)).toList(),
          // children: notesList.map((e) => NoteTile(note: e)).toList(),
          itemBuilder: (context, index) {
            return NoteTile(note: notesList[index]);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),

          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ),
      ),
    );
  }

  List<int> _getCount({@required int index}) {
    int noOfColumn;
    int noOfRow;
    if ((index + 1) % 3 == 0 && index != 5) {
      noOfColumn = 4;
      noOfRow = 2;
    } else if ((index + 1) % 4 == 0 && index != 7) {
      noOfColumn = 2;
      noOfRow = 3;
    } else {
      noOfColumn = 2;
      noOfRow = 2;
    }
    return [noOfColumn, noOfRow];
  }
}
