import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchText = TextEditingController();
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              _buildTextSearch(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
            height: 75,
            color: Colors.grey.shade200,
            child: TextField(
              onTap: () {
                setState(() {
                  onTap = true;
                });
              },
              controller: searchText,
              style: TextStyle(fontSize: 28),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                fillColor: Colors.white,
                focusColor: Colors.white,
                filled: true,
                suffixIcon: searchText.text == ''
                    ? Container(
                        width: 1,
                        height: 1,
                      )
                    : InkWell(
                        child: Icon(
                          Icons.close,
                          size: 30,
                        ),
                        onTap: () {
                          setState(() {
                            onTap=false;
                            searchText.text = '';

                          });
                        },
                      ),
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 18),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        Container(
          color: Colors.amber,
          height: 40,
          width: onTap == false ? 0 : 40,
        ),
      ],
    );
  }
}
