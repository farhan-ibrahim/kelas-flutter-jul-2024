import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/contact.dart';
import 'package:my_flutter_app/widgets/MyText.dart';

class MyContactCard extends StatelessWidget {
  final Contact contact;
  final Function() onDelete;
  final Function() onPressEdit;

  const MyContactCard({
    required this.contact,
    required this.onDelete,
    required this.onPressEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: const Image(
              image: AssetImage("images/laptop.jpg"),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: "Name: ${contact.name}"),
                MyText(text: "Position: ${contact.position}"),
                if (contact.email != null) ...[
                  MyText(text: "Email: ${contact.email}")
                ],
                if (contact.phone != null) ...[
                  MyText(text: "Phone: ${contact.phone}")
                ],
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: onPressEdit,
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
