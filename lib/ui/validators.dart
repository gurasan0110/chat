String? emailValidator(String? email) {
  final trimmedEmail = email?.trim();

  if (trimmedEmail == null || trimmedEmail.isEmpty) {
    return 'Email is required';
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegex.hasMatch(trimmedEmail)) {
    return 'Please enter a valid email address';
  }

  return null;
}

String? passwordValidator(String? password) {
  final trimmedPassword = password?.trim();

  if (trimmedPassword == null || trimmedPassword.isEmpty) {
    return 'Password is required';
  }

  if (trimmedPassword.length < 6) {
    return 'Password must be at least 6 characters long';
  }

  return null;
}
