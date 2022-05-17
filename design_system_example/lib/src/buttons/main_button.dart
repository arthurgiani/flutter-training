import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.isEnabled,
    required this.isBusy,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final bool isEnabled;
  final bool isBusy;
  final String label;
  final VoidCallback onPressed;

  final borderRadius = const BorderRadius.all(Radius.circular(8));
  final buttonHeight = 56.0;

  factory MainButton.outlined({
    required String label,
    required VoidCallback onPressed,
    required Widget icon,
  }) {
    return _OutlinedMainButton(
      isEnabled: true,
      isBusy: false,
      label: label,
      onPressed: onPressed,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: isEnabled ? theme.primaryColor : theme.disabledColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: (isEnabled && isBusy == false) ? onPressed : null,
        borderRadius: borderRadius,
        child: Container(
          alignment: Alignment.center,
          height: buttonHeight,
          decoration: BoxDecoration(borderRadius: borderRadius),
          width: MediaQuery.of(context).size.width,
          child: isBusy
              ? const CircularProgressIndicator()
              : Text(label, style: theme.textTheme.button),
        ),
      ),
    );
  }
}

class _OutlinedMainButton extends MainButton {
  const _OutlinedMainButton({
    Key? key,
    required bool isEnabled,
    required bool isBusy,
    required String label,
    required VoidCallback onPressed,
    required this.icon,
  }) : super(
          key: key,
          isEnabled: isEnabled,
          isBusy: isBusy,
          label: label,
          onPressed: onPressed,
        );

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Container(
          height: buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style:
                    theme.textTheme.button?.copyWith(color: theme.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
