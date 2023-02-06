
import 'package:copy/widgets/single_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class ItemsWidget extends StatelessWidget {
   
   List img = [
    // 'Latte',
    // 'Espresso',
    // 'Cold Coffee',
    // 'Black Coffee'
   ];

  ItemsWidget({super.key, required this.img});
 
   @override
   Widget build(BuildContext context) {
     return GridView.count(
      physics: const  NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150/195),
      children: [
        for(int i = 0; i< img.length; i++)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF212325),
          boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4), 
            spreadRadius: 1, 
            blurRadius: 8,
          ),
          ],
          ),
          
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SinglePageScreen(img[i])));
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset('images/${img[i]}.png',
                  width: 120, height: 120 ,fit: BoxFit.contain,
                  ),
                ),
              
              ),
              Padding(padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${img[i]}', style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 8,),
                   const  Text('Best Coffee', style: TextStyle(
                      color: Colors.white60, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),

              ),
              ),
              Padding(
                
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("\$30", 
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: const Color(0xFFE57734),
                        borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          size: 20, color: Colors.white,
                          
                        ),
                      )
                      
                    ],
                ),
              ),
            ],
          ),
        ),
      ],

     );
   }
 }