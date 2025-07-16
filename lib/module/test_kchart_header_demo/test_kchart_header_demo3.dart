import 'package:flutter/material.dart';
import 'package:flutter_self_demo/common/widget/win_judgement.dart';

class TestKchartHeaderDemo3 extends StatefulWidget {
  const TestKchartHeaderDemo3({super.key});
  @override
  State<TestKchartHeaderDemo3> createState() => _TestKchartHeaderDemo3State();
}

class _TestKchartHeaderDemo3State extends State<TestKchartHeaderDemo3> {
  final TextEditingController _controller = TextEditingController(text: '0.60');
  bool _showPopup = false;

  final List<double> numbers = [
    for (double i = 0.6; i <= 1.5; i += 0.1) double.parse(i.toStringAsFixed(1))
  ];
  double? _selectedValue;

  void _togglePopup() {
    final RenderBox textBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    // final RenderBox stackBox =
    //     _stackKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox containerBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    final Offset textOffset = textBox.localToGlobal(Offset.zero);
    final double containerBottomY =
        containerBox.localToGlobal(Offset.zero).dy + containerBox.size.height;
    // final Offset offsetInStack = textOffset - stackOffset;
    print("textBox.size.width:${textBox.size.width}");
    final double textCenterX = textBox.localToGlobal(Offset.zero).dx + textBox.size.width/2;
    setState(() {
      // _popupOffset = offsetInStack;
      _popupOffset = Offset(textCenterX - 60, containerBottomY - 10);
      //  = textOffset(textOffset.dx+ 40 - 60,0);
      _showPopup = !_showPopup;
    });
  }

  final GlobalKey _textFieldKey = GlobalKey(); // 用于获取 TextField 位置
  final GlobalKey _containerKey = GlobalKey();

  Offset? _popupOffset; // 弹窗位置
  Widget mainBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Divider(height: 1),
        Container(
          key: _containerKey,
          color: Colors.yellow,
          height: 52,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              GestureDetector(
                onTap: _togglePopup,
                child: CircleTriangleIcon(
                  circleColor: Color(0xFFD9D9D9),
                  size: 20,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: _togglePopup,
                child: Container(
                  key: _textFieldKey,
                  width: 80,
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: _togglePopup,
                child: CircleTriangleIcon(
                  circleColor: Color(0xFFFF4444),
                  size: 20,
                ),
              ),
              SizedBox(width: 70),
              sellBuyBox()
            ],
          ),
        ),
        Divider(height: 1),
        // 气泡弹窗
        // if (_showPopup),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        mainBody(context),
        if (_showPopup && _popupOffset != null)
          Positioned(
            left: _popupOffset!.dx,
            top: _popupOffset!.dy,
            // top: _popupOffset!.dy - 10 - 160, // 上移箭头高度+弹窗
            child: Column(
              children: [
                CustomPaint(
                  size: Size(20, 10),
                  painter: UpwardArrowPainter(),
                ),
                bubbleSelector(numbers, context),
              ],
            ),
          ),
      ]),
    );
  }
}

class CircleTriangleIcon extends StatelessWidget {
  final double size;
  final Color circleColor;
  final Color triangleColor;
  final double strokeWidth;
  final double triangleSize;

  const CircleTriangleIcon({
    super.key,
    this.size = 50.0,
    this.circleColor = Colors.grey,
    this.triangleColor = Colors.black,
    this.strokeWidth = 1.0,
    this.triangleSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 圆环
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: circleColor,
                width: strokeWidth,
              ),
            ),
          ),
          // 三角形
          Icon(
            Icons.keyboard_arrow_up,
            size: triangleSize,
            color: triangleColor,
          ),
        ],
      ),
    );
  }
}

// Widget 1: SELL/BUY boxes with diagonal seam
Widget sellBuyBox() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipPath(
        clipper: LeftBoxClipper(),
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('BUY', style: TextStyle(color: Colors.white, fontSize: 10)),
              RichText(
                text: TextSpan(
                  text: '0.62',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(
                      text: '99',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: Offset(1, -4),
                        child: Text('2', style: TextStyle(fontSize: 12)),
                      ),
                    )
                  ],
                ),
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
Widget bubbleSelector(List<double> numbers, BuildContext context) {
  print("bubbleSelector 接收到的context:$bubbleSelector");
  return Container(
    width: 120,
    padding: EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      // border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black26,
      //     blurRadius: 6,
      //     offset: Offset(0, 2),
      //   )
      // ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
            children:
                numbers.map((e) => Center(child: Text(e.toString()))).toList(),
          ),
        )
      ],
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
