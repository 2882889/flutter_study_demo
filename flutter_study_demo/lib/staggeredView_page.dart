import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StaggeredViewPageState();
  }
}


class _StaggeredViewPageState extends State<StaggeredViewPage> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("staggeredTitle",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            staggeredTiles: [
              //section1
              StaggeredTile.count(4, 1),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),

              //section2
              StaggeredTile.count(4, 1),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),

              //section3
              StaggeredTile.count(4, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),


            ],
            children: <Widget>[
              captionText("这个是section1的title", "这个是section1的subTiele"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),

              captionText("这个是section2的title", "这个是section2的subTiele"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),

              captionText("这个是section3的title", "这个是section3的subTiele"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
              photoImageWidget("http://5b0988e595225.cdn.sohucs.com/images/20181007/19a4d1ee4a24456c9843262865642b44.jpeg"),
            ],

          ),
      ),
      )
    );
  }

  Widget photoImageWidget(String imageUrl) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.fill
        ),
      ),
    );
  }

  Widget captionText(String titleText, String subTitleText) {
    return Padding(padding: EdgeInsets.all(8.0),
      child: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(titleText,style: TextStyle(color: Colors.black,fontSize: 24.0),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(subTitleText,style: TextStyle(color: Colors.blueGrey,fontSize: 16.0),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
注意：

1.点击事件可以添加到每个子item上

优点：
StaggeredGridView 可以满足大部分的首页布局，写起了也还算方便

缺点：
这个只是单纯的布局，如果有了请求回来的数据，那么数据的，逻辑估计会很多

每个item的宽度都是通过屏幕宽度和个数，间距算出来的，而高度和宽度一样，
这么做虽然保证了所有屏幕尺寸都适用，但是对于抠像素的设计不好交代

虽然是说缺点，但是有可能是自己技术没到
 */
