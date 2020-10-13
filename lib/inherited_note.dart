import 'package:flutter/material.dart';

//INHERITED NOTE CLASS
class InheritedNote extends InheritedWidget {
  final notes = [
    {
      'title': 'The Server Hidden in the Desert',
      'content': 'إInshaa Allah'
    },

    {
    'title': 'The Server Hidden in the Church',
    'content': 'Solus Christus'
    },

    {
    'title': 'The Server Hidden in the Cathedral',
    'content': 'Ad majórem Dei glóriam'
    }
  ];

  InheritedNote(Widget child) : super(child: child);

  static InheritedNote of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedNote>());
  }

  @override
  bool updateShouldNotify(InheritedNote oldWidget) {
    return oldWidget.notes != notes;
  }
}
