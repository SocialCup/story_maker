import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget for displaying footer tools.
///
/// This widget is a part of the UI where the user can interact with footer tools.
/// It is a stateless widget that takes several parameters to control its behavior and appearance.
/// It uses an ElevatedButton to display a done button, and the user can interact with it by tapping on it.
class FooterToolsWidget extends StatelessWidget {
  /// A callback function that is called when the done button is pressed.
  final AsyncCallback onDone;

  /// The child widget of the done button.
  final Widget? doneButtonChild;

  final Color? sendButtonColor;

  /// Indicates whether the widget is in loading state.

  /// Creates an instance of the widget.
  ///
  /// The onDone parameter is required and must not be null.
  /// The doneButtonChild and isLoading parameters are optional.
  const FooterToolsWidget({
    super.key,
    required this.onDone,
    this.doneButtonChild,
    this.sendButtonColor,
  });

  /// Describes the part of the user interface represented by this widget.
  ///
  /// The framework calls this method when this widget is inserted into the tree in a given BuildContext and when the dependencies of this widget change.
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, right: 16, bottom: 15),
        child: doneButtonChild != null ? const SizedBox() : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: onDone,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                backgroundColor: sendButtonColor,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                ),
              ),
              child: doneButtonChild ??
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 4),
                              Text(
                                'Paylaş',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                CupertinoIcons.forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
