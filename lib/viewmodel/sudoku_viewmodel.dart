import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SudokuViewModel extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  List<List<int>>? ans;

  Future<List<List<int>>?> solve(s, {Function? func}) async {
    var S = List.generate(9, (_) => List.generate(9, (_) => 0));
    for (int i=0; i<9; i++) {
      for (int j=0; j<9; ++j) {
        S[i][j] = s[i][j];
      }
    }
    solveSudoku(S, 0, 0);
    if (ans != null) return ans;
    else return null;
  }
  void solveSudoku(List<List<int>> S, int x, int y){
    if(y == 9){
        if(x == 8){
          ans = List.generate(9, (_) => List.generate(9, (_) => 0));
          for (int i=0; i<9; i++) {
            for (int j=0; j<9; ++j) {
              ans![i][j] = S[i][j];
            }
          }
        } else {
            solveSudoku(S, x+1,0);
        }
    } else if(S[x][y] == 0){
        for (int k = 1; k <=9; k++){
            if(checkValid(S,x,y,k)){
                S[x][y] = k;
                solveSudoku(S, x, y+1);
                S[x][y] = 0;
            }
        }
    } else {
        solveSudoku(S,x,y+1);
    }
  }

  bool checkValid(List<List<int>> S, int x, int y, int k){
    for(int i = 0; i <9 ; i++){
        if(S[x][i] == k) return false;
    }
    for(int i = 0; i <9 ; i++){
        if(S[i][y] == k) return false;
    }
    int a = (x/3) as int, b = (y/3) as int;
    for(int i = 3*a; i < 3*a+3; i++){
        for(int j = 3*b; j < 3*b+3; j++){
            if(S[i][j] == k) return false;
        }
    }
    return true;
  }
}
