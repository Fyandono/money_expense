import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

TextInputType keyboardTypeInt = defaultTargetPlatform == TargetPlatform.iOS
    ? const TextInputType.numberWithOptions(signed: true)
    : TextInputType.number;