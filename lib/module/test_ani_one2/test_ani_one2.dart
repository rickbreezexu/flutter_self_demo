import 'package:flutter/material.dart';
import 'package:flutter_self_demo/common/utils/mutable_tuple.dart';

class ItemData {
  final String title;
  final String subtitle;
  final IconData icon;

  ItemData(this.title, this.subtitle, this.icon);
}

class TestAniOne2 extends StatefulWidget {
  const TestAniOne2({Key? key}) : super(key: key);

  @override
  State<TestAniOne2> createState() => _TestAniOne2State();
}

class _TestAniOne2State extends State<TestAniOne2> {
  bool isSelectedAll = false;
  List<MutableTuple2<ItemData, bool>> dataList = [
    MutableTuple2(ItemData('Title 1', 'Subtitle 1', Icons.ac_unit), false),
    MutableTuple2(ItemData('Title 2', 'Subtitle 2', Icons.cabin), false),
    MutableTuple2(ItemData('Title 3', 'Subtitle 3', Icons.access_alarm), false),
    MutableTuple2(
        ItemData('Title 4', 'Subtitle 4', Icons.accessibility_new), false),
  ];

  // //判断是否全选
  // bool get judgeAllSelected => tradeDataModelList.every(
  //       (e) => e.isSelected ?? false,
  //     );


  //都返回true 才会返回
  updateAllSelected() {
    setState(() {
      isSelectedAll = dataList.every((e) => e.item2);
    });
  }

  void onTapAllSelected() {
    setState(() {
      isSelectedAll = !isSelectedAll;
      for (var tuple in dataList) {
        tuple.item2 = isSelectedAll;
      }
    });
  }

  void toggleSelection(int index) {
    setState(() {
      dataList[index].item2 = !dataList[index].item2;
      updateAllSelected();
    });
  }

  void deleteItem(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("确认删除？"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("取消"),
          ),
          TextButton(
            onPressed: () {
              setState(() => dataList.removeAt(index));
              Navigator.pop(ctx);
            },
            child: const Text("确认"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable List with Selection'),
        actions: [
          IconButton(
            icon: Icon(isSelectedAll
                ? Icons.check_box
                : Icons.check_box_outline_blank),
            onPressed: onTapAllSelected,
          )
        ],
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = dataList.removeAt(oldIndex);
            dataList.insert(newIndex, item);
          });
        },
        children: List.generate(dataList.length, (index) {
          final tuple = dataList[index];
          return ListTile(
            key: ValueKey(tuple.item1.title),
            leading: Icon(tuple.item1.icon),
            title: Text(tuple.item1.title),
            subtitle: Text(tuple.item1.subtitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () => deleteItem(index),
                ),
                Checkbox(
                  value: tuple.item2,
                  onChanged: (_) => toggleSelection(index),
                ),
              ],
            ),
            onTap: () => toggleSelection(index),
          );
        }),
      ),
    );
  }
}
