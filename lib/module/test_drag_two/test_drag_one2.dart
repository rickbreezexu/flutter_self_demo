import 'package:flutter/material.dart';

class TestDragOne2 extends StatefulWidget {
  const TestDragOne2({super.key});

  @override
  State<TestDragOne2> createState() => _TestDragOne2State();
}

class _TestDragOne2State extends State<TestDragOne2> {
  bool _enableReorder = true;
  final List<String> _items = List.generate(10, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('可拖拽列表示例'),
        actions: [
          Row(
            children: [
              const Text('Enable Drag'),
              Switch(
                value: _enableReorder,
                onChanged: (v) => setState(() => _enableReorder = v),
              ),
            ],
          ),
        ],
      ),
      body: _enableReorder ? _buildReorderableList() : _buildPlainList(),
    );
  }

  /// 可拖拽列表，长按任何位置即可拖拽，拖拽时放大并带阴影，其余条目自动让开
  Widget _buildReorderableList() {
    return ReorderableListView.builder(
      itemCount: _items.length,
      onReorder: _onReorder,
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        return Transform.scale(
          scale: 1.05,
          child: Material(
            elevation: 6,
            color: Colors.transparent,
            child: child,
          ),
        );
      },
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        return Padding(
          key: ValueKey(_items[index]),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ReorderableDelayedDragStartListener(
            index: index,
            child: _buildTile(_items[index]),
          ),
        );
      },
    );
  }

  /// 普通列表样式，与可拖拽时一致
  Widget _buildPlainList() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: _buildTile(_items[index], showHandle: false),
        );
      },
    );
  }

  /// 列表项样式
  Widget _buildTile(String text, {bool showHandle = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          if (showHandle) const Icon(Icons.drag_handle),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }
}
