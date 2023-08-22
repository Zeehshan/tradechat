import 'package:formz/formz.dart';

enum FirstTextInputValidationError { empty, shortLenght }

class TextInput extends FormzInput<String, FirstTextInputValidationError> {
  const TextInput.pure([super.value = '']) : super.pure();
  const TextInput.dirty([super.value = '']) : super.dirty();

  @override
  FirstTextInputValidationError? validator(String value) {
    return value.isEmpty
        ? FirstTextInputValidationError.empty
        : value.length < 2
            ? FirstTextInputValidationError.shortLenght
            : null;
  }
}
