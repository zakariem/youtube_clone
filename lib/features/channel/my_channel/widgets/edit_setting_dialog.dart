import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/profile_service.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  final String identifier;
  final String initialValue;
  final bool isUsernameField;
  final Future<void> Function(String value) onSave;

  const SettingsDialog({
    super.key,
    required this.identifier,
    required this.initialValue,
    required this.onSave,
    this.isUsernameField = false,
  });

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isValidated = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
  }

  Future<void> _validateUsername(String username) async {
    if (username.isEmpty) {
      setState(() {
        _isValidated = false;
      });
      return;
    }

    try {
      final profileService = ref.read(profileProvider);
      final isValid = await profileService.validateUsername(username);
      setState(() {
        _isValidated = isValid;
      });
    } catch (e) {
      setState(() {
        _isValidated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.identifier,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _controller,
            onChanged: widget.isUsernameField
                ? (value) => _validateUsername(value.trim())
                : null,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: widget.isUsernameField && !_isValidated
                  ? 'Username is already taken'
                  : null,
            ),
          ),
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "CANCEL",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: widget.isUsernameField && !_isValidated
              ? null
              : () async {
                  setState(() {
                    _isSaving = true;
                  });
                  await widget.onSave(_controller.text.trim());
                  setState(() {
                    _isSaving = false;
                  });
                  Navigator.pop(context);
                },
          child: const Text(
            "SAVE",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
