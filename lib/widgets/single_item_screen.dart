
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/create_user_page.dart';

class SinglePageScreen extends StatefulWidget{
  
  var img;
  SinglePageScreen(this.img);

  @override
  State<SinglePageScreen> createState() => _SinglePageScreenState();
}


class _SinglePageScreenState extends State<SinglePageScreen> {
// ignore: non_constant_identifier_names
int CoffeeCount =0;
void incrementCoffee(){
  setState(() {
    CoffeeCount+=1;
  });
}
void decrementCoffee(){
  setState(() {
    if(CoffeeCount>0){
      CoffeeCount--;
    }
  });
}

  
  @override

Widget build(BuildContext context){
  
return Scaffold(
  appBar: AppBar(actions: [], backgroundColor: Color(0xFF212325),
  elevation: 0,
  ),
  backgroundColor: Color(0xFF212325),
  body: SingleChildScrollView(child: SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(padding: 
          // EdgeInsets.only(left: 25),
          // child: InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.arrow_back_ios_new, 
          //   color: Colors.white.withOpacity(0.5),),
            
          // ),
          // ),
          SizedBox(height: 50,),
          Center(
            child: Image.asset("images/${widget.img}.png", width: MediaQuery.of(context).size.width / 1.5,),
          ),
          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.only(left: 25, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BEST COFFEE", style: TextStyle(color: Colors.white.withOpacity(0.5),letterSpacing: 3),),
              SizedBox(height: 25,),
              Text(widget.img,
              style: TextStyle(color: Colors.white, fontSize: 30, letterSpacing: 1),),
               SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    width: 160,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2)
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: decrementCoffee,
                          child: Icon(
                              CupertinoIcons.minus, size:22, color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        
                            Text(CoffeeCount.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),),
                         SizedBox(width: 15),
                         GestureDetector(
                          onTap: incrementCoffee,
                          onLongPress: incrementCoffee,
                           child: Icon(
                              CupertinoIcons.plus, size: 22, color: Colors.white,
                                                 ),
                         ),
                       
                      ],

                    ),
                  ),
                  Text("\$30.50", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),)
                ]
                ),
              ),
              SizedBox(height: 20,),
              Text("Coffee is a major source of antioxidants in the diet. So many benefits",
              style: TextStyle(color: Colors.white.withOpacity(0.3),
              fontSize: 16,
              fontWeight: FontWeight.w500,

              ),
              ),
              SizedBox(height: 20),
              Row(
               children: [
                Text("Volume", style: TextStyle(color: Colors.white, 
                fontWeight: FontWeight.w500, fontSize: 18),),
                SizedBox(width: 15,),
                 Text("60 ml", style: TextStyle(color: Colors.white, 
                fontWeight: FontWeight.w500, fontSize: 18 ),)
               ],
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 54, 56),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white),
                        ),
                        child: Text("Add to Cart", 
                        style: TextStyle(color: Colors.white,
                        fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1
                        ),
                        ),
                        
                      ),
                    ),
                     Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.favorite_outline, size: 35,
                   
                    ),
                      
                    ),
                    
                  ],
                 ),
              )
            ],
          ),
          )
        ],
      ),
      ),
  
  ),
  ),
);
}
}