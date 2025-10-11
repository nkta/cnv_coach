import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceDictationTextField extends StatefulWidget {
  const VoiceDictationTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.decoration = const InputDecoration(),
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.localeId,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlignVertical,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final InputDecoration decoration;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final String? localeId;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;

  @override
  State<VoiceDictationTextField> createState() => _VoiceDictationTextFieldState();
}

class _VoiceDictationTextFieldState extends State<VoiceDictationTextField> {
  late final stt.SpeechToText _speechToText;
  bool _isListening = false;
  String _dictationBaseText = '';

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
  }

  @override
  void dispose() {
    _speechToText.cancel();
    super.dispose();
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speechToText.stop();
      if (mounted) {
        setState(() {
          _isListening = false;
        });
      }
      return;
    }

    final available = await _speechToText.initialize(
      onStatus: _handleStatus,
      onError: _handleError,
    );

    if (!available) {
      _showSnackBar('La reconnaissance vocale n\'est pas disponible sur cet appareil.');
      return;
    }

    final systemLocale = await _speechToText.systemLocale();
    final localeId = widget.localeId ?? systemLocale?.localeId ?? 'fr_FR';

    _dictationBaseText = widget.controller.text;
    if (_dictationBaseText.isNotEmpty && !_dictationBaseText.endsWith(' ')) {
      _dictationBaseText = '$_dictationBaseText ';
    }

    final listened = await _speechToText.listen(
      onResult: _onSpeechResult,
      listenMode: stt.ListenMode.dictation,
      partialResults: true,
      localeId: localeId,
    );

    if (!listened) {
      _showSnackBar('Impossible de démarrer la dictée vocale.');
      return;
    }

    FocusScope.of(context).unfocus();

    if (mounted) {
      setState(() {
        _isListening = true;
      });
    }
  }

  void _onSpeechResult(stt.SpeechRecognitionResult result) {
    final recognized = result.recognizedWords.trimLeft();
    final updatedText = recognized.isEmpty
        ? _dictationBaseText.trimRight()
        : '$_dictationBaseText$recognized';

    widget.controller.value = widget.controller.value.copyWith(
      text: updatedText,
      selection: TextSelection.collapsed(offset: updatedText.length),
      composing: TextRange.empty,
    );

    widget.onChanged(updatedText);
  }

  void _handleStatus(String status) {
    if (status == 'done' || status == 'notListening') {
      if (mounted) {
        setState(() {
          _isListening = false;
        });
      }
    }
  }

  void _handleError(stt.SpeechRecognitionError error) {
    if (mounted) {
      setState(() {
        _isListening = false;
      });
    }
    _showSnackBar('Erreur de dictée : ${error.errorMsg}');
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            expands: widget.expands,
            maxLines: widget.expands ? null : widget.maxLines,
            minLines: widget.expands ? null : widget.minLines,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            textAlignVertical: widget.textAlignVertical,
            decoration: widget.decoration,
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: FloatingActionButton.small(
            heroTag: null,
            onPressed: _toggleListening,
            child: Icon(_isListening ? Icons.stop : Icons.mic),
          ),
        ),
      ],
    );
  }
}
