import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Products extends StatefulWidget {
 
  Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
   List<String> Terms = [
  "expresso",
  "cappuccino",
  "americano",
  "latte",
  "iceCofee",
  "turkish"
];
  final _img = Image.asset("images/bg.png");
  double _expandedHeight = 200;
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
            backgroundColor: Color.fromARGB(255, 219, 163, 34),
            automaticallyImplyLeading: false,
           
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: _expandedHeight,
             actions: [
              IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate(),);
              }, icon: Icon(Icons.search))
            ],
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
                // return Container(
                //   color: index.isOdd ? Colors.white : Colors.black12,
                //   height: 50.0,
                //   child: 

                return
                  Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    child: Column(
                       children: [
                      
                        
                           for(int i = 0; i<Terms.length; i++)
                          Text(Terms[i], textScaleFactor: 2),
                          
                    
                       ],
                    ),
                  );
               // );
              },
              childCount: 12,
            ),
          ),
          
          
        ],
      ),);
  }
}

class CustomSearchDelegate extends SearchDelegate{
List<String> SearchTerms = [
  "expresso",
  "cappuccino",
  "americano",
  "latte",
  "iceCofee",
  "turkish"
];
   @override
   List<Widget> buildActions(BuildContext context){
    return [IconButton(onPressed: (){
      query = "";
    }, icon: Icon(Icons.clear))];
   }

   @override
   Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back),);
   }

   @override
   Widget buildResults(BuildContext context){
    List<String> MatchQuery = [];
    for(var coffee in SearchTerms){
      if(coffee.toLowerCase().contains(query.toLowerCase())){
          MatchQuery.add(coffee);
      }
    }
    return ListView.builder(
      itemCount: MatchQuery.length,
      itemBuilder: ((context, index) {
        var result = MatchQuery[index];
        return ListTile(title: Text(result),);
      }),
      
    ); 
   }

   Widget buildSuggestions(BuildContext context){
    List<String> MatchQuery = [];
    for(var coffee in SearchTerms){
      if(coffee.toLowerCase().contains(query.toLowerCase())){
          MatchQuery.add(coffee);
      }
    }
     return ListView.builder(
      itemCount: MatchQuery.length,
      itemBuilder: ((context, index) {
        var result = MatchQuery[index];
        return ListTile(title: Text(result),);
      }),
      
    ); 
   }

  
}