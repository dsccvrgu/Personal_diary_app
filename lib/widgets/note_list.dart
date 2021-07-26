import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/note.dart';

class noteList extends StatelessWidget {
  
  final List<note> notes;
  final Function deleteTx;

  
  noteList(this.notes, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Notes added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return  Container(
                child: Card(
                  color: Colors.green,
                  shadowColor: Colors.green,
                  elevation: 5,
                  child:Column(
                  
                  children: <Widget>[
                    Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text('#'),
                              ),
                            ),
                          ),
                          title: Text(
                            notes[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(notes[index].date),
                          ),
                          trailing: MediaQuery.of(context).size.width > 460
                              ? FlatButton.icon(
                                  textColor: Colors.red, 
                                  icon: Icon(Icons.delete),
                                  label: Text('Delete'),
                                  onPressed: () => deleteTx(notes[index].id),
                                )
                              : IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context).errorColor,
                                  onPressed: () => deleteTx(notes[index].id),
                                ),
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(notes[index].textNote, style: TextStyle(color: Colors.white),),)
                  ],
                  
                ),
                ),
              );
            },
            itemCount: notes.length,
            
          );
  }
}
