import 'package:flutter/material.dart';
import 'package:flutter_self_demo/module/test_ani_one/test_ani_one_data.dart';

class TestAniOne extends StatefulWidget {
  const TestAniOne({super.key});

  @override
  State<TestAniOne> createState() => _TestAniOneState();
}

class _TestAniOneState extends State<TestAniOne>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> dataList = TestAniOneData.dataList;
  bool _isEditing = false;
  final Set<int> _selectedIndices = {};
  // late final AnimationController _editCtrl;

  @override
  void initState() {
    super.initState();
    // _editCtrl = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300),
    // );
  }

  @override
  void dispose() {
    // _editCtrl.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      // if (_isEditing) {
      //   _editCtrl.forward();
      // } else {
      //   _editCtrl.reverse();
      //   _selectedIndices.clear();
      // }
    });
  }

  void _onItemTap(int index) {
    if (_isEditing) {
      setState(() {
        if (_selectedIndices.contains(index)) {
          _selectedIndices.remove(index);
        } else {
          _selectedIndices.add(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? '选择 (${_selectedIndices.length})' : '报价列表'),
        actions: [
          IconButton(
            // icon: AnimatedIcon(
            //   icon: AnimatedIcons.menu_close,
            //   progress: _editCtrl,
            // ),
            icon: _isEditing
                ? Icon(Icons.accessible_forward)
                : Icon(Icons.accessible_rounded),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: dataList.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Colors.grey),
        itemBuilder: (context, index) {
          final item = dataList[index];
          final selected = _selectedIndices.contains(index);

          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: selected ? Colors.blue.withOpacity(0.1) : Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: _isEditing ? 4 : 12,
                vertical: 10,
              ),
              child: Row(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, anim) =>
                          ScaleTransition(scale: anim, child: child),
                      child: _isEditing
                          ? ClipRect(
                              child: Checkbox(
                                key: const ValueKey("checkbox"),
                                value: selected,
                                onChanged: (_) => _onItemTap(index),
                              ),
                            )
                          : const SizedBox.shrink(key: ValueKey("empty")),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['symbol'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('${item['time']}  量 ${item['volume']}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${item['sell']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                        const SizedBox(height: 4),
                        Text('最低: ${item['low']}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${item['buy']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                        const SizedBox(height: 4),
                        Text('最高: ${item['high']}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _isEditing
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: _selectedIndices.isEmpty
                          ? null
                          : () {
                              // 删除逻辑
                            },
                      child: const Text('删除'),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _toggleEdit,
                      child: const Text('完成'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
