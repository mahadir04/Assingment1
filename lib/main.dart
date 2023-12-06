import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop List'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CardWidget('ACER Nitro-5','nitro-5.jpg',
              'Acer Nitro 5 AN515-44 15.6-inch Full HD Display Ryzen 5 8GB RAM 1TB HDD + 256GB SSD Gaming',1300.5),
          CardWidget('HP-Victus', 'Victus.jpg',
              'HP VICTUS Gaming 15-FA0025 Core i5 12th Gen 15.6 Inch FHD Laptop - Vibe Gaming',1500.6),
          CardWidget('HP-ENVY', 'envy.jpg',
              'HP Envy 16-H1023 Intel Core i9 13th Gen Touchscreen Laptop',1690.6),
          CardWidget('HP-Probook', 'probook.jpg',
              'HP Probook 450 G8 Core i5 11th Gen 512GB SSD 15.6 inch FHD Laptop',1300.6),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String LaptopName;
  final String imageName;
  final String description;
  final double price;

  CardWidget(this.LaptopName,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/images/$imageName',height: 150,width: 100,), // Replace with actual URL
            title: Text(LaptopName),
            subtitle: Text(description),
          ),
          ListTile(
            title: Text('price:$price dollar'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage(LaptopName,imageName,description,price)),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Buy Now'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  final String LaptopName;
  final String imageName;
  final String description;
  final double price;

  SecondPage(this.LaptopName,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: $LaptopName\n',style: TextStyle(fontSize: 25),),
            Image.asset('assets/images/$imageName'),  
            //Text('\nAuthor Name: $authorName'), // Replace with actual author name
            Text('\nShort Description: $description',style: TextStyle(fontSize: 14),),
            Text('\nPrice: \$$price',style: TextStyle(color: Colors.green,fontSize: 18),),
            Text("Choose Payment Method",style:TextStyle(fontSize:25),),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Image.asset(
                    "assets/images/bkash.png",
                    height: 40,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Image.asset(
                    "assets/images/nagad.png",
                    height: 40,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {


                  },
                  child: Image.asset(
                    "assets/images/rocket.png",
                    height: 40,
                  ),
                ),
              ],
            ),
            DropdownButton<String>(
              items: ['RAM', 'GPU', 'CPU'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown selection
              },
              hint: Text('Select an option'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}