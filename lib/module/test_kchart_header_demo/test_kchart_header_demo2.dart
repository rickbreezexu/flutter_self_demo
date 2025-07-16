import 'package:flutter/material.dart';

class TestKchartHeaderDemo2 extends StatefulWidget {
  const TestKchartHeaderDemo2({super.key});
  @override
  State<TestKchartHeaderDemo2> createState() => _TestKchartHeaderDemo2State();
}

class _TestKchartHeaderDemo2State extends State<TestKchartHeaderDemo2> {
  final TextEditingController _controller =
      TextEditingController(text: '0.60');
  bool _showPopup = false;
  final List<double> values = [
    for (double i = 0.6; i <= 1.5; i += 0.1) double.parse(i.toStringAsFixed(1))
  ];
  double? _selectedValue;
  
  void _togglePopup() {
    setState(() => _showPopup = !_showPopup);
  }
  
  void _selectValue(double value) {
    setState(() {
      _controller.text = value.toStringAsFixed(2);
      _showPopup = false;
    });
  }
  
  void _addValue(double increment) {
    double currentValue = double.tryParse(_controller.text) ?? 0.60;
    double newValue = currentValue + increment;
    setState(() {
      _controller.text = newValue.toStringAsFixed(2);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Divider(height: 1),
          Container(
            color: Colors.white,
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
          if (_showPopup) ...[
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  width: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 顶部三个蓝色数字
                      Row(
                        children: [
                          _buildBlueText('+0.1', 0.1),
                          SizedBox(width: 30),
                          _buildBlueText('+1', 1.0),
                          SizedBox(width: 30),
                          _buildBlueText('+10', 10.0),
                        ],
                      ),
                      SizedBox(height: 12),
                      // 数值列表
                      Container(
                        height: 200,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8,
                              childAspectRatio: 3,
                            ),
                            itemCount: values.length,
                            itemBuilder: (context, index) {
                              double value = values[index];
                              return _buildValueItem(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 气泡箭头
                Positioned(
                  top: -6,
                  left: 95,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    transform: Matrix4.identity()..rotateZ(-3.14159 / 4),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildBlueText(String text, double value) {
    return GestureDetector(
      onTap: () => _addValue(value),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  
  Widget _buildValueItem(double value) {
    double currentValue = double.tryParse(_controller.text) ?? 0.60;
    bool isCurrentValue = (currentValue - value).abs() < 0.01;
    
    return GestureDetector(
      onTap: () => _selectValue(value),
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentValue ? Colors.grey[300] : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          value.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical:1),
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
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              children: numbers.map((e) => Center(child: Text(e.toString()))).toList(),
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
