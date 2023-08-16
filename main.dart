import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget
{
  MyHomePage({super.key});

  List<Product> products = [
    Product(
        price: 344.99,
        description: '+201 recommendations',
        title: 'Nikon 600D Mirrorless',
        thumbnail: 'https://m.media-amazon.com/images/I/91KypOuC64L.jpg'
    ),
    Product(
        price: 199.99,
        description: '+184 recommendations',
        title: 'Smart Wrist Watch',
        thumbnail: 'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/43/201127/1.jpg?4786'
    ),
    Product(
        price: 299.99,
        description: '+410 recommendations',
        title: 'Echo Dot Kids Edition',
        thumbnail: 'https://api.time.com/wp-content/uploads/2018/04/amazon-echo-dot-kids-edition.jpg'
    ),
    Product(
        price: 349.49,
        description: '+474 recommendations',
        title: 'Amazon Echo Look',
        thumbnail: 'https://cdn.geekwire.com/wp-content/uploads/2017/04/Echo-Look-Standing-Left-1260x1260.jpg'
    ),
    Product(
        price: 349.49,
        description: '+474 recommendations',
        title: 'Amazon Echo Look',
        thumbnail: 'https://m.media-amazon.com/images/I/51EVETDOOeL._AC_UF1000,1000_QL80_.jpg'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: const Text('Products',
          style: TextStyle(fontSize: 30),
        )),
      ),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute (
                    builder: (BuildContext context) => MyPage2(
                      sendPrice: products[index].price.toString(),
                    ),
                  ),
                  );
                },
                child: TextAndIcon(
                  product: products[index],
                ),
              );
            },
          )
      ),
    );
  }
}

class TextAndIcon extends StatelessWidget {
  final Product product;
  const TextAndIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          borderRadius:BorderRadius.circular(20) ),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage( image: NetworkImage(product.thumbnail
                )
                )
            ),
            margin: const EdgeInsets.all(20),
          ),
          Column(
            children: [
              Text(product.title,
                  style: const TextStyle(fontSize: 24, color: Colors.black)
              ),
              Row(
                children: [
                  const Icon(Icons.attach_money_outlined, color: Colors.purple,),
                  Text(product.price.toString(),
                      style: const TextStyle(fontSize: 22, color: Colors.purple)),
                ],
              ),
              Row(
                children: [
                  Image.network('https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp',
                      width: 50),
                  Text(product.description,
                      style: const TextStyle(fontSize: 18, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  String title;
  double price;
  String description;
  String thumbnail;

  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.thumbnail,
  });

}

class MyPage2 extends StatefulWidget {
  final String sendPrice;
  const MyPage2({super.key, required this.sendPrice});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  late final String sendPrice;
  double sum = 0;

  void getSum() {
    setState(() {
      sum = double.parse(sendPrice) + 5;
    });
  }

  @override
  void initState() {
    sendPrice = widget.sendPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('The price is : $sendPrice',
                  style: TextStyle(fontSize: 30)
              ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  ' Price after clicking: $sum',
                  style: TextStyle(fontSize: 30)
              ),
            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              alignment: Alignment.center,
              maximumSize: Size(200,100),
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              getSum();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add 5', style: TextStyle(fontSize: 30)),
              ],
            ),
          )

        ],

      ),
    );
  }
}






