import 'dart:math';

class Calculator {
  Calculator({required this.data});

  final Map data;
  late double _bmi;

  void printer() {
    print(bmi());
  }

  String bmi() {
    _bmi = data["weight"] / pow(data["height"] / 100, 2);
    print(data["weight"]);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return "Motay Kam Khaya kar !";
    } else if (_bmi >= 18.5) {
      return "Apki Body perfectly healthy ha";
    } else {
      return "Ghar pa khana ni milta ?";
    }
  }
}
