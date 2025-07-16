import 'package:flutter/material.dart';

class TestKchartHeaderDemo extends StatefulWidget {
  const TestKchartHeaderDemo({super.key});

  @override
  State<TestKchartHeaderDemo> createState() => _TestKchartHeaderDemoState();
}

class _TestKchartHeaderDemoState extends State<TestKchartHeaderDemo> {
  final GlobalKey _buyPriceKey = GlobalKey();
  OverlayEntry? _popup;

  final List<double> _options = [
    0.6,
    0.7,
    0.8,
    0.9,
    1.0,
    1.1,
    1.2,
    1.3,
    1.4,
    1.5
  ];

  void _showPopup() {
    final RenderBox renderBox =
        _buyPriceKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _popup = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy - 220,
        left: offset.dx + size.width / 2 - 100,
        child: bubbleSelector(_options),
      ),
    );
    Overlay.of(context).insert(_popup!);
  }

  void _hidePopup() {
    _popup?.remove();
    _popup = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: sellBuyBoxWithPopup(_showPopup, _buyPriceKey));
  }
}

Widget sellBuyBoxWithPopup(VoidCallback onTapArrow, GlobalKey buyPriceKey) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipPath(
        clipper: LeftBoxClipper(),
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELL', style: TextStyle(color: Colors.white, fontSize: 10)),
              RichText(
                text: TextSpan(
                  text: '0.62',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(
                      text: '97',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: Offset(1, -4),
                        child: Text('8', style: TextStyle(fontSize: 12)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      ClipPath(
        clipper: RightBoxClipper(),
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('BUY', style: TextStyle(color: Colors.white, fontSize: 10)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    key: buyPriceKey,
                    text: TextSpan(
                      text: '0.62',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: '99',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: Offset(1, -4),
                            child: Text('2', style: TextStyle(fontSize: 12)),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapArrow,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.arrow_drop_up,
                          color: Colors.white, size: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    ],
  );
}

class LeftBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 8, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(8, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Widget 2: Bubble selector
Widget bubbleSelector(List<double> numbers) {
  return Material(
    color: Colors.transparent,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            size: Size(20, 10),
            painter: UpwardArrowPainter(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: [
                Text('+0.1', style: TextStyle(color: Colors.blue)),
                Text('+1', style: TextStyle(color: Colors.blue)),
                Text('+10', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2.4,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shrinkWrap: true,
              children: numbers
                  .map((e) => Center(child: Text(e.toString())))
                  .toList(),
            ),
          )
        ],
      ),
    ),
  );
}

class UpwardArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black26, 2, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
