import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //get list of messages
  var _msgList = [
    {
      'time': '5.15pm',
      'user': 'David',
      'msgText':
          'Seriously?? Fine I\'ll get 3 pieces of fried chicken with a pepsi zero. And a large cheesy wedges. And a fries. And a zinger burger. And a mashed potato.'
    },
    {
      'time': '5.11pm',
      'user': 'Victoria',
      'msgText':
          'You have a great mind because you\'re our son. And because you wanna eat KFC'
    },
    {
      'time': '5.10pm',
      'user': 'Romeo',
      'msgText': 'Hehehe great minds think alike. What can I say?'
    },
    {
      'time': '5.10pm',
      'user': 'David',
      'msgText': 'Oh man... not you too honey'
    },
    {
      'time': '5.07pm',
      'user': 'Victoria',
      'msgText': 'But... KFC is finger licking good!'
    },
    {
      'time': '5.06pm',
      'user': 'David',
      'msgText': 'You\'ve been eating too much fast food!'
    },
    {
      'time': '5.05pm',
      'user': 'Romeo',
      'msgText': 'Can we have KFC please...?'
    },
    {
      'time': '5.05pm',
      'user': 'Romeo',
      'msgText': 'Hello!! What\'s for dinner tonight?'
    },
  ];

  //build each message bubble based on index
  _buildMessage(int index) {
    return Container(
      //a bunch of conditions to differentiate display user's messages from others
      margin: _msgList[index]['user'] == 'David'
          ? EdgeInsets.only(top: 6, bottom: 6, left: 100, right: 8)
          : EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 100),
      decoration: BoxDecoration(
        color: _msgList[index]['user'] == 'David'
            ? Color(0xFFA57F00)
            : Color(0xFF656257),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: _msgList[index]['user'] == 'David'
              ? Radius.circular(18)
              : Radius.circular(0),
          bottomRight: _msgList[index]['user'] == 'David'
              ? Radius.circular(0)
              : Radius.circular(18),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

      //no need to display username if sent by user
      child: _msgList[index]['user'] == 'David'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Text(
                      _msgList[index]['time'],
                      style: TextStyle(
                        color: Color(0xFFEEE9D9),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Text(
                  _msgList[index]['msgText'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      _msgList[index]['user'],
                      style: TextStyle(
                        color: Color(0xFFEEE9D9),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      _msgList[index]['time'],
                      style: TextStyle(
                        color: Color(0xFFEEE9D9),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Text(
                  _msgList[index]['msgText'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
    );
  }

  //returns container for inputting message
  _inputBar() {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
        right: 5,
        left: 5,
        bottom: 2,
      ),
      color: Color(0xFF2C2200),
      child: Row(
        children: <Widget>[
          //camera button
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Color(0xFFFFC400),
            ),
            onPressed: null,
          ),
          //text field for typing...
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                fontSize: 17,
              ),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Color(0xFFEEE9D9),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 7.0, top: 7.0),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          //send button
          IconButton(
            icon: Icon(
              Icons.send,
              color: Color(0xFFFFC400),
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //container for scrolling chat messages
        Expanded(
          child: Container(
            color: Color(0xFFEEE9D9),
            child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(8),
                //number of messages
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  //build each message bubble by passing index
                  return _buildMessage(index);
                }),
          ),
        ),
        //container for inputting messages
        _inputBar(),
      ],
    );
  }
}
