import 'package:flutter/material.dart';

part 'loader_mixin.dart';
part 'sender_mixin.dart';

enum NetworkProcessState { Idle, Loading, Success, Error }

@optionalTypeArgs
abstract class NetworkingState<T extends StatefulWidget> extends State<T> {
  @override
  @mustCallSuper
  void initState() {
    super.initState();
    if (this is LoaderMixin && (this as LoaderMixin).preloadOnInit) {
      (this as LoaderMixin).loadData();
    }
  }

  void _trySetState() {
    if (mounted) setState(() {});
  }
}
