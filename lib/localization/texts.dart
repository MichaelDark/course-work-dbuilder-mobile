class Texts {
  static String locale = 'ua';

  Texts();

  String get login => locale == 'en' ? 'Login' : 'Логін';
  String get register => locale == 'en' ? 'Register' : 'Реєстрація';
  String get company => locale == 'en' ? 'Company' : 'Компанія';
  String get id => locale == 'en' ? 'Id' : 'Ідентифікатор';
  String get title => locale == 'en' ? 'Name' : 'Назва';
  String get delete => locale == 'en' ? 'Delete' : 'Видалити';
  String get createCompany =>
      locale == 'en' ? 'Create company' : 'Створити компанію';
  String get userName => locale == 'en' ? 'Username' : 'Логін';
  String get name => locale == 'en' ? 'Name' : 'Ім\'я';
  String get surname => locale == 'en' ? 'Surname' : 'Прізвище';
  String get userInfo =>
      locale == 'en' ? 'User Info' : 'Інформація Користувача';
  String get nextLocale => locale == 'en' ? 'УКР' : 'ENG';
  String get logout => locale == 'en' ? 'Logout' : 'Вийти';
  String get building => locale == 'en' ? 'Building' : 'Будівля';
  String get createBuilding =>
      locale == 'en' ? 'Create building' : 'Створити будівлю';
  String get description => locale == 'en' ? 'Description' : 'Опис';
  String get taskCount => locale == 'en' ? 'Task Count' : 'Кількість завдань';
  String get createdAt => locale == 'en' ? 'Created at' : 'Дата створення';
  String get details => locale == 'en' ? 'Details' : 'Детальніше';
  String get dueDate => locale == 'en' ? 'Due Date' : 'Срок';
  String get createTask => locale == 'en'
      ? 'Create Building Task'
      : 'Створити завдання для перевірки';
  String get buildingTask =>
      locale == 'en' ? 'Building Task' : 'Завдання для перевірки';
  String get createNumberCriteria =>
      locale == 'en' ? 'Create Number Criteria' : 'Створити Числовий Критерій';
  String get numberCriteria =>
      locale == 'en' ? 'Number Criteria' : 'Числовий Критерій';
  String get numberCriterion =>
      locale == 'en' ? 'Number Criterion' : 'Числові Критерії';
  String get maxValue => locale == 'en' ? 'Max' : 'Максимум';
  String get minValue => locale == 'en' ? 'Min' : 'Мінімум';
  String get addNumberValue =>
      locale == 'en' ? 'Add Number Value' : 'Додати числове значення';
  String get addNumberValueManually => locale == 'en'
      ? 'Add Number Value Manually'
      : 'Додати числове значення вручну';
  String get create => locale == 'en' ? 'Create' : 'Створити';
  String get chooseCriteria =>
      locale == 'en' ? 'Choose Criteria' : 'Виберіть критерій';
  String get enterValue => locale == 'en' ? 'Enter Value' : 'Введіть значення';
  String get registrationError =>
      locale == 'en' ? 'Registration Error' : 'Помилка реєстрації';

  void changeLocale() {
    if (locale == 'en') {
      locale = "ua";
    } else {
      locale = "en";
    }
  }
}
