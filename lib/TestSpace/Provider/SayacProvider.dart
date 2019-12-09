import 'package:flutter/widgets.dart';

class SayacProvider with ChangeNotifier{
  int sayi= 0;

void arttir(){
  sayi++;
  notifyListeners();
}
void azalt(){
  sayi--;
  notifyListeners();
}
}