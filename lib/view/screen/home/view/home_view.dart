import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';
import 'package:login/viewmodel/sudoku_viewmodel.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  var s = List.generate(9, (_) => List.generate(9, (_) => 0));
  var _textController =
      List.generate(9, (_) => List.generate(9, (_) => TextEditingController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
            child: GetBuilder<SudokuViewModel>(
          builder: (sudokuViewModel) => SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 360.0,
                height: 500.0,
                child: netView(),
              ),
              Positioned(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: _navigateBack,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: _solve,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Solve",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        )
                      ]))
            ],
          )),
        )));
  }

  void _solve() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    Get.find<SudokuViewModel>().solve(s).then((value) => {
      Get.back(),
      if (value != null) {
        this.setState(() {
          s = value;
        })
      }
    });
  }

  void _navigateBack() {
    final navigator = Get.find<NavigationPageController>();
    navigator.changeActivePage(PageConstant.LOGIN_PAGE);
  }

  Widget netView() {
    var listWid = <Widget>[];
    for (int i = 0; i < 9; ++i) {
      listWid.add(Container(
          padding: EdgeInsets.all(4.0),
          width: 40.0,
          child: ListView.builder(
              itemCount: 9,
              itemBuilder: (BuildContext context, int position) {
                return initGrid(i, position);
              })));
    }
    return Row(
      children: listWid,
    );
  }

  Widget initGrid(int col, int pos) {
    return TextField(
        controller: _textController[pos][col]
          ..text = s[pos][col] == 0 ? "" : s[pos][col].toString(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onEditingComplete: () =>
            _updateData(_textController[pos][col].text, pos, col));
  }

  void _updateData(String? text, int row, int col) {
    FocusScope.of(context).requestFocus(FocusNode());
    _textController[row][col].clear();
    if (text != null && text.isNotEmpty) {
      setState(() {
        s[row][col] = int.parse(text);
      });
    }
  }
}
