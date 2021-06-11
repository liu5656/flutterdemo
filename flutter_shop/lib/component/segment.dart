import 'package:flutter/material.dart';

class SegmentProtocol {
  String title;
}

class Segment extends StatefulWidget {
  final indexCallback;
  List<SegmentProtocol> items = [];
  Segment({Key key, this.items, this.indexCallback}) : super(key: key);

  @override
  _SegmentState createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: Colors.white,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
            childAspectRatio: 0.5,
            ),
        itemBuilder: (context, index) {
          return  Center(
              child: FlatButton(
              color: Colors.red,
                child: Text(
              "$index" + widget.items[index].title,
              style: TextStyle(color: Colors.black, fontSize: 15)),
              onPressed: (){
                widget.indexCallback(widget.items[index], index);
              },
            ),
          );
        },
      ),
    );
  }
}
