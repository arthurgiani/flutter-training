import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.isEnabled,
    required this.isBusy,
    this.label,
    required this.onPressed,
  }) : super(key: key);

  const factory MainButton.outlined({
    required IconData icon,
    required VoidCallback onPressed,
    required String label,
  }) = _MainOutlinedButton;

  final bool isEnabled;
  final bool isBusy;
  final String? label;
  final VoidCallback onPressed;

  final borderRadius = const BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: isEnabled ? theme.primaryColor : theme.disabledColor,
      elevation: 5,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: (isEnabled && isBusy == false) ? onPressed : null,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(borderRadius: borderRadius),
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: isBusy
              ? CircularProgressIndicator(color: theme.textTheme.button!.color)
              : Text(label ?? '', style: theme.textTheme.button),
        ),
      ),
    );
  }
}

class _MainOutlinedButton extends MainButton {
  const _MainOutlinedButton({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    required this.icon,
  }) : super(
          key: key,
          isEnabled: true,
          isBusy: false,
          label: label,
          onPressed: onPressed,
        );

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: borderRadius,
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: theme.primaryColor),
          borderRadius: borderRadius,
        ),
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              label!,
              style: theme.outlinedButtonTheme.style?.textStyle?.resolve({}),
            )
          ],
        ),
      ),
    );
  }
}
