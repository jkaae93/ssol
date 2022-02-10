/*
  Copyright 2021 Celine Jeon

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 */

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ssolcaffold extends StatefulWidget {
  final String? title;
  final Widget body;
  final PreferredSizeWidget? appbar;
  const Ssolcaffold({Key? key, this.title, required this.body, this.appbar}) : super(key: key);

  @override
  _SsolcaffoldState createState() => _SsolcaffoldState();
}

class _SsolcaffoldState<T extends Ssolcaffold> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.appbar ?? (widget.title != null ? TitleAppbar(title: widget.title!) : null),
      extendBody: true,
      body: widget.body,
    );
  }
}

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TitleAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const TitleAppbar({Key? key, this.title = ''}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ssolRefresh extends StatefulWidget {
  final String title;
  final Function onNextRequest;
  final Function onRefreshRequest;
  final Widget? topper;
  final Widget? pinned;
  final Widget? fotter;
  const ssolRefresh({Key? key, required this.onNextRequest, required this.onRefreshRequest, this.title = '', this.topper, this.pinned, this.fotter}) : super(key: key);

  @override
  _ssolRefreshState createState() => _ssolRefreshState();
}

class _ssolRefreshState extends State<ssolRefresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: Text(widget.title)),
      body: NotificationListener(
        onNotification: (noti) {
          if (noti is ScrollEndNotification) {
            widget.onNextRequest();
          }
          return true;
        },
        child: Scaffold(
          body: CustomRefreshIndicator(
            onRefresh: () => Future.sync(() => widget.onRefreshRequest()),
            builder: (context, child, controller) {
              return CustomScrollView(
                slivers: [
                  if (widget.topper != null) widget.topper!,
                  if (widget.pinned != null) SliverAppBar(pinned: true, flexibleSpace: widget.pinned),
                  if (widget.fotter != null) widget.fotter!,
                ],
              );
            },
            child: Container(),
          ),
        ),
      ),
    );
  }
}
