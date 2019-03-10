import 'package:flutter/material.dart';
import 'slider_page.dart';
import 'staggeredView_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDemo", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text(index.toString()),
                  ));
                  mapToPage(context, index);
              },
              child: mapToItem(index)
            );
          }),

    );
  }

  void mapToPage(BuildContext context,int index) {
    if(index == 0) {
      print("去slider页面");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SliderPage()));
    }else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>StaggeredViewPage()));
    }
  }

  Widget mapToItem(int index) {
    if (index == 0) {
      Icon icon = Icon(Icons.star);
      return setupItem("slider", icon);
    } else if (index == 1) {
      Icon icon = Icon(Icons.list);
      return setupItem("staggeredGridView", icon);
    }else {
      return setupItem("wait", Icon(Icons.add));
    }
  }

  Widget setupItem(String title, Icon icon) {
    return  Card(
      child: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Padding(padding: EdgeInsets.all(10.0),
              child:Text(title),
            ),

          ],
        ),
      ),
    );
  }
}
