import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow , scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245)),

      home: HomePage(),

    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      appBar: AppBar(title:Text("Flash"),
      backgroundColor: Colors.blue,

       shape: const RoundedRectangleBorder(
        borderRadius:BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        ),
      ),
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bulbcard(),
            
          ],
        ),
      ),
    );
  }
}

class bulbcard extends StatefulWidget {
  bulbcard({super.key});

  @override
  State<bulbcard> createState() => _bulbcardState();
}

class _bulbcardState extends State<bulbcard> {
  var onPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(
                onPressed ? Icons.flash_on : Icons.flash_off,
                size: 100,
                color: onPressed ? Colors.blue : Colors.grey,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      onPressed = !onPressed;
                    });
                    if (onPressed == false) {
                      TorchLight.disableTorch();
                    } else {
                      TorchLight.enableTorch();
                    }
                  },
                  child: Text(onPressed ? "OFF" : "ON"))
            ],
          ),
        ),
      ),
    );
  }
}
