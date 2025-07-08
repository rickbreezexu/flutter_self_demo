// Copyright (c) 2014, the tuple project authors. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// # MutableTuple data structure
///
/// - [MutableTuple2], [MutableTuple3]...
library tuple;

import 'package:quiver/core.dart';

/// Represents a 2-tuple, or pair.
class MutableTuple2<T1, T2> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Creates a new tuple value with the specified items.
  MutableTuple2(this.item1, this.item2);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple2.fromList(List items) {
    if (items.length != 2) {
      throw ArgumentError('items must have length 2');
    }

    return MutableTuple2<T1, T2>(items[0] as T1, items[1] as T2);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple2<T1, T2> withItem1(T1 v) => MutableTuple2<T1, T2>(v, item2);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple2<T1, T2> withItem2(T2 v) => MutableTuple2<T1, T2>(item1, v);

  /// Creates a [List] containing the items of this [MutableTuple2].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2], growable: growable);

  @override
  String toString() => '[$item1, $item2]';

  @override
  bool operator ==(Object other) => other is MutableTuple2 && other.item1 == item1 && other.item2 == item2;

  @override
  int get hashCode => hash2(item1.hashCode, item2.hashCode);
}

/// Represents a 3-tuple, or triple.
class MutableTuple3<T1, T2, T3> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Returns the third item of the tuple
  T3 item3;

  /// Creates a new tuple value with the specified items.
  MutableTuple3(this.item1, this.item2, this.item3);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple3.fromList(List items) {
    if (items.length != 3) {
      throw ArgumentError('items must have length 3');
    }

    return MutableTuple3<T1, T2, T3>(items[0] as T1, items[1] as T2, items[2] as T3);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple3<T1, T2, T3> withItem1(T1 v) => MutableTuple3<T1, T2, T3>(v, item2, item3);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple3<T1, T2, T3> withItem2(T2 v) => MutableTuple3<T1, T2, T3>(item1, v, item3);

  /// Returns a tuple with the third item set to the specified value.
  MutableTuple3<T1, T2, T3> withItem3(T3 v) => MutableTuple3<T1, T2, T3>(item1, item2, v);

  /// Creates a [List] containing the items of this [MutableTuple3].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2, item3], growable: growable);

  @override
  String toString() => '[$item1, $item2, $item3]';

  @override
  bool operator ==(Object other) => other is MutableTuple3 && other.item1 == item1 && other.item2 == item2 && other.item3 == item3;

  @override
  int get hashCode => hash3(item1.hashCode, item2.hashCode, item3.hashCode);
}

/// Represents a 4-tuple, or quadruple.
class MutableTuple4<T1, T2, T3, T4> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Returns the third item of the tuple
  T3 item3;

  /// Returns the fourth item of the tuple
  T4 item4;

  /// Creates a new tuple value with the specified items.
  MutableTuple4(this.item1, this.item2, this.item3, this.item4);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple4.fromList(List items) {
    if (items.length != 4) {
      throw ArgumentError('items must have length 4');
    }

    return MutableTuple4<T1, T2, T3, T4>(items[0] as T1, items[1] as T2, items[2] as T3, items[3] as T4);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple4<T1, T2, T3, T4> withItem1(T1 v) => MutableTuple4<T1, T2, T3, T4>(v, item2, item3, item4);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple4<T1, T2, T3, T4> withItem2(T2 v) => MutableTuple4<T1, T2, T3, T4>(item1, v, item3, item4);

  /// Returns a tuple with the third item set to the specified value.
  MutableTuple4<T1, T2, T3, T4> withItem3(T3 v) => MutableTuple4<T1, T2, T3, T4>(item1, item2, v, item4);

  /// Returns a tuple with the fourth item set to the specified value.
  MutableTuple4<T1, T2, T3, T4> withItem4(T4 v) => MutableTuple4<T1, T2, T3, T4>(item1, item2, item3, v);

  /// Creates a [List] containing the items of this [MutableTuple4].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2, item3, item4], growable: growable);

  @override
  String toString() => '[$item1, $item2, $item3, $item4]';

  @override
  bool operator ==(Object other) => other is MutableTuple4 && other.item1 == item1 && other.item2 == item2 && other.item3 == item3 && other.item4 == item4;

  @override
  int get hashCode => hash4(item1.hashCode, item2.hashCode, item3.hashCode, item4.hashCode);
}

/// Represents a 5-tuple, or quintuple.
class MutableTuple5<T1, T2, T3, T4, T5> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Returns the third item of the tuple
  T3 item3;

  /// Returns the fourth item of the tuple
  T4 item4;

  /// Returns the fifth item of the tuple
  T5 item5;

  /// Creates a new tuple value with the specified items.
  MutableTuple5(this.item1, this.item2, this.item3, this.item4, this.item5);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple5.fromList(List items) {
    if (items.length != 5) {
      throw ArgumentError('items must have length 5');
    }

    return MutableTuple5<T1, T2, T3, T4, T5>(items[0] as T1, items[1] as T2, items[2] as T3, items[3] as T4, items[4] as T5);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple5<T1, T2, T3, T4, T5> withItem1(T1 v) => MutableTuple5<T1, T2, T3, T4, T5>(v, item2, item3, item4, item5);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple5<T1, T2, T3, T4, T5> withItem2(T2 v) => MutableTuple5<T1, T2, T3, T4, T5>(item1, v, item3, item4, item5);

  /// Returns a tuple with the third item set to the specified value.
  MutableTuple5<T1, T2, T3, T4, T5> withItem3(T3 v) => MutableTuple5<T1, T2, T3, T4, T5>(item1, item2, v, item4, item5);

  /// Returns a tuple with the fourth item set to the specified value.
  MutableTuple5<T1, T2, T3, T4, T5> withItem4(T4 v) => MutableTuple5<T1, T2, T3, T4, T5>(item1, item2, item3, v, item5);

  /// Returns a tuple with the fifth item set to the specified value.
  MutableTuple5<T1, T2, T3, T4, T5> withItem5(T5 v) => MutableTuple5<T1, T2, T3, T4, T5>(item1, item2, item3, item4, v);

  /// Creates a [List] containing the items of this [MutableTuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2, item3, item4, item5], growable: growable);

  @override
  String toString() => '[$item1, $item2, $item3, $item4, $item5]';

  @override
  bool operator ==(Object other) => other is MutableTuple5 && other.item1 == item1 && other.item2 == item2 && other.item3 == item3 && other.item4 == item4 && other.item5 == item5;

  @override
  int get hashCode => hashObjects([item1.hashCode, item2.hashCode, item3.hashCode, item4.hashCode, item5.hashCode]);
}

/// Represents a 6-tuple, or sextuple.
class MutableTuple6<T1, T2, T3, T4, T5, T6> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Returns the third item of the tuple
  T3 item3;

  /// Returns the fourth item of the tuple
  T4 item4;

  /// Returns the fifth item of the tuple
  T5 item5;

  /// Returns the sixth item of the tuple
  T6 item6;

  /// Creates a new tuple value with the specified items.
  MutableTuple6(this.item1, this.item2, this.item3, this.item4, this.item5, this.item6);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple6.fromList(List items) {
    if (items.length != 6) {
      throw ArgumentError('items must have length 6');
    }

    return MutableTuple6<T1, T2, T3, T4, T5, T6>(items[0] as T1, items[1] as T2, items[2] as T3, items[3] as T4, items[4] as T5, items[5] as T6);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem1(T1 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(v, item2, item3, item4, item5, item6);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem2(T2 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(item1, v, item3, item4, item5, item6);

  /// Returns a tuple with the third item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem3(T3 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(item1, item2, v, item4, item5, item6);

  /// Returns a tuple with the fourth item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem4(T4 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(item1, item2, item3, v, item5, item6);

  /// Returns a tuple with the fifth item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem5(T5 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(item1, item2, item3, item4, v, item6);

  /// Returns a tuple with the sixth item set to the specified value.
  MutableTuple6<T1, T2, T3, T4, T5, T6> withItem6(T6 v) => MutableTuple6<T1, T2, T3, T4, T5, T6>(item1, item2, item3, item4, item5, v);

  /// Creates a [List] containing the items of this [MutableTuple6].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2, item3, item4, item5, item6], growable: growable);

  @override
  String toString() => '[$item1, $item2, $item3, $item4, $item5, $item6]';

  @override
  bool operator ==(Object other) =>
      other is MutableTuple6 && other.item1 == item1 && other.item2 == item2 && other.item3 == item3 && other.item4 == item4 && other.item5 == item5 && other.item6 == item6;

  @override
  int get hashCode => hashObjects([item1.hashCode, item2.hashCode, item3.hashCode, item4.hashCode, item5.hashCode, item6.hashCode]);
}

/// Represents a 7-tuple, or septuple.
class MutableTuple7<T1, T2, T3, T4, T5, T6, T7> {
  /// Returns the first item of the tuple
  T1 item1;

  /// Returns the second item of the tuple
  T2 item2;

  /// Returns the third item of the tuple
  T3 item3;

  /// Returns the fourth item of the tuple
  T4 item4;

  /// Returns the fifth item of the tuple
  T5 item5;

  /// Returns the sixth item of the tuple
  T6 item6;

  /// Returns the seventh item of the tuple
  T7 item7;

  /// Creates a new tuple value with the specified items.
  MutableTuple7(this.item1, this.item2, this.item3, this.item4, this.item5, this.item6, this.item7);

  /// Create a new tuple value with the specified list [items].
  factory MutableTuple7.fromList(List items) {
    if (items.length != 7) {
      throw ArgumentError('items must have length 7');
    }

    return MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(items[0] as T1, items[1] as T2, items[2] as T3, items[3] as T4, items[4] as T5, items[5] as T6, items[6] as T7);
  }

  /// Returns a tuple with the first item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem1(T1 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(v, item2, item3, item4, item5, item6, item7);

  /// Returns a tuple with the second item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem2(T2 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, v, item3, item4, item5, item6, item7);

  /// Returns a tuple with the third item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem3(T3 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, item2, v, item4, item5, item6, item7);

  /// Returns a tuple with the fourth item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem4(T4 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, item2, item3, v, item5, item6, item7);

  /// Returns a tuple with the fifth item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem5(T5 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, item2, item3, item4, v, item6, item7);

  /// Returns a tuple with the sixth item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem6(T6 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, item2, item3, item4, item5, v, item7);

  /// Returns a tuple with the seventh item set to the specified value.
  MutableTuple7<T1, T2, T3, T4, T5, T6, T7> withItem7(T7 v) => MutableTuple7<T1, T2, T3, T4, T5, T6, T7>(item1, item2, item3, item4, item5, item6, v);

  /// Creates a [List] containing the items of this [MutableTuple7].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) => List.from([item1, item2, item3, item4, item5, item6, item7], growable: growable);

  @override
  String toString() => '[$item1, $item2, $item3, $item4, $item5, $item6, $item7]';

  @override
  bool operator ==(Object other) =>
      other is MutableTuple7 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3 &&
      other.item4 == item4 &&
      other.item5 == item5 &&
      other.item6 == item6 &&
      other.item7 == item7;

  @override
  int get hashCode => hashObjects([item1.hashCode, item2.hashCode, item3.hashCode, item4.hashCode, item5.hashCode, item6.hashCode, item7.hashCode]);
}
