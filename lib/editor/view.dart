import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'package:highlight/languages/markdown.dart';
import 'package:flutter_highlight/themes/github.dart';

import 'index.dart';

// ignore: must_be_immutable
class EditorPage extends GetView<EditorController> {
  EditorPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return CodeField(
      // expands: true,
      lineNumberStyle: const LineNumberStyle(textStyle: TextStyle(color: Colors.transparent)),
      minLines: 100,
      wrap: true,
      controller: _codeController!,
      textStyle: const TextStyle(fontFamily: 'SourceCode'),
    );
  }

  CodeController? _codeController;

  final _schollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(
      init: EditorController(),
      id: "editor",
      initState: (c) {
        _codeController = CodeController(
          text: c.controller?.markdwonText,
          language: markdown,
          theme: githubTheme,
        )..addListener(() {
            c.controller!.setText(_codeController?.text);
          });
      },
      dispose: (_) {
        _codeController?.dispose();
      },
      builder: (c) {
        return Scaffold(
          appBar: AppBar(title: const Text("Markdown Editor")),
          body: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _schollController,
                    child: _buildView(),
                  ),
                ),
                Expanded(
                  child: Markdown(
                    controller: _schollController,
                    selectable: true,
                    data: _codeController?.text ?? '3333',
                    // data: c.markdwonText,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
