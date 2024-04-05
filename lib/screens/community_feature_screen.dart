import 'package:flutter/material.dart';

class CommunityFeatureScreen extends StatefulWidget {
  @override
  _CommunityFeatureScreenState createState() => _CommunityFeatureScreenState();
}

class _CommunityFeatureScreenState extends State<CommunityFeatureScreen> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Declare a FocusNode

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose(); // Dispose the FocusNode to avoid memory leaks
    super.dispose();
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _textController.clear();
      setState(() {
        _messages.insert(0, text);
      });
      _focusNode
          .requestFocus(); // Request focus back to the text field after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community Chat"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/chat_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, int index) =>
                    ChatMessage(messageText: _messages[index]),
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: _buildTextComposer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                focusNode: _focusNode, // Use the FocusNode here
                onSubmitted: (String text) {
                  _handleSubmitted(text);
                },
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.deepPurple),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String messageText;

  const ChatMessage({Key? key, required this.messageText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
                child: Text(messageText.isNotEmpty ? messageText[0] : 'U')),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Username", // Ideally, this would be replaced with the actual user's name or identifier
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(messageText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
