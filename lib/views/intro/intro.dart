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

import 'package:ssol/providers/storage_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssol/styles/widgets.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  dynamic a;

  @override
  Widget build(BuildContext context) {
    return Ssolcaffold(
      title: 'Intro',
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<StorageProvider>(
                builder: (context, storage, widgets) {
                  if (storage.isInit) {
                    return const Text("This is intro page. compleat storage init");
                  } else {
                    return const Text("This is intro page. before the storage init");
                  }
                },
              ),
              const Expanded(child: Text("ddd")),
            ],
          ),
        ],
      ),
    );
  }
}
