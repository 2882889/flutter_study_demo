import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //表情icon 需要在pubspec中添加font_awesome_flutter: 8.4.0

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  String tipString = "还可以做的更好";
  IconData scoreImage = FontAwesomeIcons.sadTear;
  Color scoreImageColor = Colors.red;
  double sliderCurrentValue = 0.0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.grey,), onPressed: (){
          Navigator.pop(context);
        }),
        backgroundColor: Colors.white70,
        title: Text("Slider"),
      ),
      body: Container(
        color: Colors.yellow,
        width: double.infinity, //设置宽度撑满屏幕
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Text(
                  "1.滚动滑块选择你的评分",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14, //设置阴影宽度
                  borderRadius: BorderRadius.circular(24), //设置圆角
                  shadowColor: Color(0x802196F3),
                  child: Container(
                    width: 350.0,
                    height: 450.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            tipString,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              child: Icon(
                                scoreImage,
                                color: scoreImageColor,
                                size: 100.0,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                child: Slider(
                                    value: sliderCurrentValue,
                                    min: 0.0,//设置最小值
                                    max: 5.0,//设置最大值
                                    divisions: 5,//滑动的颗粒度
                                    activeColor: Color(0xFFFF520D),//选中颜色
                                    inactiveColor: Colors.green,//未选择颜色
                                    label: '$sliderCurrentValue',
                                    onChanged: (double newValue){
                                        changeImage(newValue);
                                    })
                            )
                        ),
                        //带主题的slider
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
//                activeTickMarkColor:Colors.yellowAccent,
                            activeTrackColor: Colors.yellowAccent, //实际进度的颜色
//                inactiveTickMarkColor:Colors.black
                            thumbColor: Colors.black, //滑块中心的颜色
                            inactiveTrackColor: Colors.red, //默认进度条的颜色
                            valueIndicatorColor: Colors.blue, //提示进度的气派的背景色
                            valueIndicatorTextStyle: new TextStyle(
                              //提示气泡里面文字的样式
                              color: Colors.white,
                            ),
                            inactiveTickMarkColor:
                                Colors.blue, //divisions对进度线分割后 断续线中间间隔的颜色
                            overlayColor: Colors.pink, //滑块边缘颜色
                          ),
                          child: Container(
                            width: 340.0,
                            child: Row(
                              children: <Widget>[
                                Text('0'),
                                Expanded(
                                  flex: 1,
                                  child: Slider(
                                    value: sliderCurrentValue,
                                    label: '$sliderCurrentValue',
                                    divisions: 5,
                                    onChanged: (double sliderValue) {
                                      changeImage(sliderValue);
                                    },
                                    min: 0.0,
                                    max: 5.0,
                                  ),
                                ),
                                Text('5'),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                child: Text(
                              "你的评分是：$sliderCurrentValue",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ))),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: Color(0xFFFF520D),
                                    child: Text(
                                      "提交",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      (scaffoldKey.currentState as ScaffoldState).showSnackBar(SnackBar(content: Text(
                                          "你提交的分数是：$sliderCurrentValue")));
                                    }))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeImage(double sliderValue) {
    setState(() {
      sliderCurrentValue = sliderValue;
      if (sliderCurrentValue >= 0.0 && sliderCurrentValue <= 1.0) {
        scoreImage = FontAwesomeIcons.sadTear;
        scoreImageColor = Colors.red;
        tipString = "做的太糟糕的";
      } else if (sliderCurrentValue > 1.0 && sliderCurrentValue <= 2.0) {
        scoreImage = FontAwesomeIcons.frown;
        scoreImageColor = Colors.yellow;
        tipString = "做的一般般";
      } else if (sliderCurrentValue > 2.0 && sliderCurrentValue <= 3.0) {
        scoreImage = FontAwesomeIcons.meh;
        scoreImageColor = Colors.amber;
        tipString = "做的还可以";
      } else if (sliderCurrentValue > 3.0 && sliderCurrentValue <= 4.0) {
        scoreImage = FontAwesomeIcons.smile;
        scoreImageColor = Colors.green;
        tipString = "做的非常好";
      } else if (sliderCurrentValue > 4.0 && sliderCurrentValue <= 5.0) {
        scoreImage = FontAwesomeIcons.laugh;
        scoreImageColor = Color(0xFFFF520D);
        tipString = "做的太好了";
      }
    });
  }
}


/*
缺点：

1.虽然实现了slider但是可以看出，整个的样式是MD的，如果要定制自己的样式，还是比较困难的，比如进度条的加宽，滑块的自定义样式

2.代码的可读性不高，嵌套太多，虽然页面widget的层级很清楚，但是逻辑添加困难，

注意：

多使用 Container去包裹子widget，个人觉得还是一个好习惯，虽然已经嵌套很多了，但是感觉不差这一层


 */
