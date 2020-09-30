import 'package:calculator_flutter/calculator.dart';
import 'package:calculator_flutter/display.dart';
import 'package:calculator_flutter/operation_manager.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devskiller Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(title: 'Calculator'),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Display _display = Display();
  Calculator _calculator = Calculator();
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 4),
                    child: Text(
                      error ?? _display.getValue().toString(),
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('7'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('4'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('1'),
                          ),
                          OperationButton(
                              operation: Operation.REMOVE,
                              onTap: handleTap,
                              key: ValueKey('<-'),
                              backgroundColor: Colors.blueGrey),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('8'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('5'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('2'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('0'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('9'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('6'),
                          ),
                          OperationButton(
                            onTap: handleTap,
                            key: ValueKey('3'),
                          ),
                          OperationButton(
                            operation: Operation.EQUAL,
                            onTap: handleTap,
                            key: ValueKey('='),
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          OperationButton(
                            operation: Operation.DIVIDE,
                            onTap: handleTap,
                            key: ValueKey('÷'),
                            backgroundColor: Colors.blueGrey,
                          ),
                          OperationButton(
                            operation: Operation.MULTIPLY,
                            onTap: handleTap,
                            key: ValueKey('x'),
                            backgroundColor: Colors.blueGrey,
                          ),
                          OperationButton(
                            operation: Operation.SUBTRACT,
                            onTap: handleTap,
                            key: ValueKey('-'),
                            backgroundColor: Colors.blueGrey,
                          ),
                          OperationButton(
                            operation: Operation.ADD,
                            onTap: handleTap,
                            key: ValueKey('+'),
                            backgroundColor: Colors.blueGrey,
                          ),
                          OperationButton(
                            operation: Operation.CLEAR,
                            onTap: handleTap,
                            key: ValueKey('CE'),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ));
  }

  void handleTap(Operation operation, String sign) {
    // TODO: To be implemented
  }

  void handleDigit(int digit) {
    // TODO: To be implemented
  }

  void handleOperation(Operation operation, String sign) {
    // TODO: To be implemented
  }
}

class OperationButton extends StatelessWidget {
  final Function(Operation operation, String sign) onTap;
  final Color backgroundColor;
  final Operation operation;

  const OperationButton({
    this.onTap,
    this.operation = Operation.NONE,
    this.backgroundColor = Colors.blue,
    ValueKey<String> key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: MaterialButton(
            child: Text(
              (key as ValueKey).value,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            color: backgroundColor,
            onPressed: () {
              onTap(operation, (key as ValueKey).value);
            }),
      ),
    );
  }
}
