import 'package:flutter/widgets.dart';

class WinJudgment extends StatelessWidget {
  final bool judgment;
  final Widget rightChild;
  final Widget wrongChild;

  const WinJudgment({
    super.key,
    required this.judgment,
    required this.rightChild,
    required this.wrongChild,
  });

  @override
  Widget build(BuildContext context) => judgment ? rightChild : wrongChild;
}
