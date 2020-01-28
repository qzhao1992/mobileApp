class ComputeObject{
  double num1;
  double num2;
  String optype;
  int inputScale;

  ComputeObject(this.num1, this.num2, this.optype, this.inputScale);


  //optype
  static const OP_ADD = 'ADD';
  static const OP_MUL = 'MULTIPY';

  //inputScale
  static const x1 = 1;
  static const x10 = 10;
  static const x100 = 100;

}