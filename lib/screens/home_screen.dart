
import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../widgets/items_widget.dart';




class HomeScreen  extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  final controllerOnew = TextField();
  var img = [
              'Latte',
    'Espresso',
    'Cold Coffee',
    'Black Coffee'
            ];
  late TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
      
  }

  _handleTabSelection(){
    if(_tabController.indexIsChanging){
        setState(() {
          
        });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.notifications, size: 35,),
        )
      ],
      
    ),
     drawer: DrawerHome(),
      backgroundColor: Color.fromARGB(255, 137, 135, 135).withOpacity(.2),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.only(top: 15),
        child: ListView(
          children: [
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text('It`s a great time for Coffee', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,

            ),),


          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 50,54,56),
              borderRadius: BorderRadius.circular(15),
            ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
      
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText: "Find your coffee",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.white.withOpacity(0.5),
                    )
                ),
            ),
          ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFFE57734),
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            indicator: const UnderlineTabIndicator(borderSide: BorderSide(
              width: 2.5,
              color: Color(0xFFE57734),
            ),
            insets: EdgeInsets.symmetric(horizontal: 16),
            ),
            labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            tabs: const [
              Tab(text: "Hot coffee",),
               Tab(text: "Cold coffee",),
                Tab(text: "Cappuccino",),
                 Tab(text: "Americano",),
            ],
            
            
            ),
            SizedBox(height: 10,),
            
            Center(
              child: [
                ItemsWidget(img: img),
                //  ItemsWidget(img: img),
                //   ItemsWidget(img:img),
                  //  ItemsWidget(img:img ),
                
              ][_tabController.index],
            ),
          
          ],
          
        ),
        ),
        
      ),
           
        
    );
    
  }
}