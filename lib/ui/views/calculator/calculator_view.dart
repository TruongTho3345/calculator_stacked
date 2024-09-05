import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculator_viewmodel.dart';

class CalculatorView extends StackedView<CalculatorViewModel> {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CalculatorViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Column(
        children: [
          // I split it into 2 widgets to make it easier to modify
          _buildDisplay(context, viewModel),

          Expanded(child: _buildButtons(context, viewModel)),
        ],
      ),
    );
  }

  // Build the display part (expression and result)
  Widget _buildDisplay(BuildContext context, CalculatorViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            viewModel.expression,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            viewModel.result,
            style: const TextStyle(fontSize: 64, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Build the calculator buttons
  Widget _buildButtons(BuildContext context, CalculatorViewModel viewModel) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildButton(context, 'C',
                  buttonColor: const Color(0xFF636366),
                  action: viewModel.clear),
              _buildButton(context, '÷',
                  buttonColor: const Color(0xFF636366),
                  action: () => viewModel.addToExpression('÷')),
              _buildButton(context, '×',
                  buttonColor: const Color(0xFF636366),
                  action: () => viewModel.addToExpression('×')),
              _buildButton(context, '⌫',
                  buttonColor: const Color(0xFFFFD60A),
                  action: viewModel.delete),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(context, '7',
                              action: () => viewModel.addToExpression('7')),
                          _buildButton(context, '8',
                              action: () => viewModel.addToExpression('8')),
                          _buildButton(context, '9',
                              action: () => viewModel.addToExpression('9')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(context, '4',
                              action: () => viewModel.addToExpression('4')),
                          _buildButton(context, '5',
                              action: () => viewModel.addToExpression('5')),
                          _buildButton(context, '6',
                              action: () => viewModel.addToExpression('6')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(context, '1',
                              action: () => viewModel.addToExpression('1')),
                          _buildButton(context, '2',
                              action: () => viewModel.addToExpression('2')),
                          _buildButton(context, '3',
                              action: () => viewModel.addToExpression('3')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(context, '%',
                              action: () => viewModel.addToExpression('%')),
                          _buildButton(context, '0',
                              action: () => viewModel.addToExpression('0')),
                          _buildButton(context, '.',
                              action: () => viewModel.addToExpression('.')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  _buildButton(context, '-',
                      buttonColor: const Color(0xFFFFD60A),
                      action: () => viewModel.addToExpression('-')),
                  _buildButton(context, '+',
                      buttonColor: const Color(0xFFFFD60A),
                      action: () => viewModel.addToExpression('+')),
                  _buildButton(context, '=',
                      flex: 2,
                      buttonColor: const Color(0xFFFFD60A),
                      action: viewModel.calculate),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label, {
    int flex = 1,
    Color buttonColor = const Color(0xFF2C2C2E),
    VoidCallback? action,
  }) {
    final double buttonWidth = (MediaQuery.sizeOf(context).width) / 4;

    return Flexible(
      flex: flex,
      child: SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: action,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CalculatorViewModel viewModelBuilder(BuildContext context) =>
      CalculatorViewModel();
}
