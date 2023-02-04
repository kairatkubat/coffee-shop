import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Products extends StatefulWidget {
  
  Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _img = Image.asset("images/bg.png");
   bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
        slivers: <Widget>[
          
          SliverAppBar(
           systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blueGrey),
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 290.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Products'),
              background: FlutterLogo(),
            )
            
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 50.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),);
  }
}