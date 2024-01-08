import 'dart:convert';
import 'package:mobileproject/Message.dart';

import 'function.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String url = '';
  var data;
  String output = 'Initial Output';
  TextEditingController _textEditingController = TextEditingController();
  List<Message> userMessages = [];
  List<Message> botMessages = [Message(sender: 'Bot', text: ' Salut, bienvenue sur ChatBot ! Vas-y, envoie-moi un message. 😄', time:DateFormat.Hm().format(DateTime.now())+' AM' )];

  void _sendMessage(String text) async {
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['Query'];
      userMessages.add(Message(
        sender: 'User',
        text: text,
        time: DateFormat.Hm().format(DateTime.now()) + ' AM',
      ));
      botMessages.add(Message(
        sender: 'Bot',
        text: output,
        time: DateFormat.Hm().format(DateTime.now()) + ' AM',
      ));
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userMessages.length + botMessages.length,
              itemBuilder: (BuildContext context, int index) {
                if (index.isOdd) {
                  final userIndex = index ~/ 2;
                  if (userIndex < userMessages.length) {
                    final message = userMessages[userIndex];
                    return _buildMessageTile(message, true);
                  }
                } else {
                  final botIndex = index ~/ 2;
                  if (botIndex < botMessages.length) {
                    final message = botMessages[botIndex];
                    return _buildMessageTile(message, false);
                  }
                }
                return Container(); // Returns an empty widget if the index is out of range
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom:10),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.purple,
                            )),
                      ),
                      onChanged: (value) {
                        url = 'http://10.0.2.2:5000/api?Query=' + value.toString();
                      },
                    ),
                  ),

                ),
                IconButton(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10),
                  icon: Icon(Icons.send ,size: 35,color: Colors.purple,),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendMessage(_textEditingController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Message message, bool isUserMessage) {
    final bubbleColor = isUserMessage ? Colors.purple[200] : Colors.grey[200];
    final textColor =  Colors.black;
    final align = isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: align,
        children: [
          if (isUserMessage == false)
            Image.asset(
              'images/bot.jpg',
              width: 50,
            ),
          SizedBox(width: 8.0),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(color: textColor, fontSize: 20.0),
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    message.time,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 4.0),

        ],
      ),
    );
  }
}
