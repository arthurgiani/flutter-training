import 'package:flutter/foundation.dart';

enum ListStatus {
  initial,
  loadingList,
  loadedList,
  addingItem,
  getStringListerror,
  addItemError
}

class ListState {
  final String error;
  final List<String> items;
  final ListStatus status;

  ListState({
    this.error = '',
    this.items = const [],
    this.status = ListStatus.initial,
  });

  ListState copyWith({
    String? error,
    List<String>? items,
    ListStatus? status,
  }) {
    return ListState(
      error: error ?? this.error,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListState &&
        other.error == error &&
        listEquals(other.items, items) &&
        other.status == status;
  }

  @override
  int get hashCode => error.hashCode ^ items.hashCode ^ status.hashCode;
}
