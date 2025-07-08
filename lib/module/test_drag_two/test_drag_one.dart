import 'package:flutter/material.dart';



class TestDragOne extends StatefulWidget {
  const TestDragOne({super.key});

  @override
  State<TestDragOne> createState() => _TestDragOneState();
}

class _TestDragOneState extends State<TestDragOne> {
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
      body: _enableReorder
          ? ReorderableListView.builder(
              itemCount: _items.length,
              onReorder: _onReorder,
              proxyDecorator: _proxyDecorator,
              buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                return _buildDraggableTile(context, index);
              },
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (c, i) => _buildPlainTile(i),
            ),
    );
  }

  Widget _buildDraggableTile(BuildContext context, int index) {
    // 计算卡片宽度：屏幕宽度减去水平 margin
    final double cardWidth = MediaQuery.of(context).size.width - 32;
    return LongPressDraggable<int>(
      key: ValueKey(_items[index]),
      data: index,
      feedback: Material(
        elevation: 6,
        color: Colors.transparent,
        child: SizedBox(
          width: cardWidth,
          child: _buildTileContent(index, isDragging: true),
        ),
      ),
      child: DragTarget<int>(
        onWillAccept: (from) => from != index,
        onAccept: (from) {
          setState(() {
            final item = _items.removeAt(from);
            _items.insert(index, item);
          });
        },
        builder: (ctx, cand, rej) => SizedBox(
          width: cardWidth,
          child: _buildTileContent(index),
        ),
      ),
    );
  }

  Widget _buildPlainTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: _buildTileContent(index, enableHandle: false),
    );
  }

  Widget _buildTileContent(int index,
      {bool isDragging = false, bool enableHandle = true}) {
    return Container(
      key: ValueKey(_items[index]),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isDragging
            ? [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_items[index]),
          if (enableHandle)
            ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons.drag_handle),
            ),
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

  Widget _proxyDecorator(
      Widget child, int index, Animation<double> animation) {
    return Material(
      elevation: 6,
      color: Colors.transparent,
      child: child,
    );
  }
}
