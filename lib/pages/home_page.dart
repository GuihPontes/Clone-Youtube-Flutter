import 'package:flutter/material.dart';
import 'package:youtube/pages/telas/inicio.dart';

import '../controller/ControllerPesquisa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indeceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      Text("Em alta"),
      Text("Inscrições"),
      Text("Biblioteca")
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset("images/logo_appbar.png"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CotrollerPequisa());
              },
              icon: const Icon(Icons.search),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
              color: Colors.grey,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: telas[_indeceAtual],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _indeceAtual,
          onTap: (indice) {
            setState(() {
              _indeceAtual = indice;
            });
          },
          fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ("home")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.whatshot,
                ),
                label: ("Em Alta")),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: ("Incrições")),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: ("Biblioteca")),
          ],
        ));
  }
}
