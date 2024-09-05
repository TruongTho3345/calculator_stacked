import 'package:stacked/stacked.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends BaseViewModel {
  String _expression = '';
  String _result = '';

  String get expression => _expression;

  String get result => _result;

  void addToExpression(String value) {
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '';
    notifyListeners();
  }

  void delete() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  void calculate() {
    Parser parser = Parser();
    ContextModel cm = ContextModel();

    try {
      Expression exp = parser.parse(_expression);
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _result = eval.toString();
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }
}
