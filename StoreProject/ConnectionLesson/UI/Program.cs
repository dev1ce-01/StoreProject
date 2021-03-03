using ConnectionLesson.Data;
using ConnectionLesson.Models;
using ConnectionLesson.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace ConnectionLesson.UI
{
  class Program
  {
    static void Main(string[] args)
    {
      InitConfigutation();

      Console.ForegroundColor = ConsoleColor.Green;
      Console.WriteLine("\tДобро пожаловать в магазин по Электротехнике!");
      Console.WriteLine("\t----------------------------------------------\n");
      Console.ResetColor();
      while (true)
      {
        Console.WriteLine("1.Регистрация");
        Console.WriteLine("2.Войти");
        Console.WriteLine("0.Выход\n");
        Console.Write("Выберите действие:");
        switch (Console.ReadLine())
        {
          case "1":
            Console.Clear();

            using (UserDataAccess connection = new UserDataAccess())
            {
              while (true)
              {
                Console.Write("Введите имя пользователя:");
                string login = Console.ReadLine();
                if (connection.UserVerification(login))
                {
                  Console.WriteLine("Пользователь с таким именем существует!\n");

                }
                else if (string.IsNullOrWhiteSpace(login))
                {
                  Console.WriteLine("Имя пользователя не может быть пустым!\n");
                }
                else
                {
                  Console.Clear();
                  while (true)
                  {
                    Console.Write("Введите пароль:");
                    string password = Console.ReadLine();
                    password = password.Trim(' ');
                    if (string.IsNullOrWhiteSpace(password))
                    {
                      Console.WriteLine("Пароль не может быть пустым!\n");
                    }
                    else if (password.Length < 6)
                    {
                      Console.WriteLine("Пароль не может иметь меньше 6 символов!\n");
                    }
                    else if(password.Contains(' '))
                    {
                      Console.WriteLine("Пароль не может содержать пустой символ!");
                    }
                    else
                    {
                      Console.Clear();
                      Console.Write("Введите ваш номер телефона(пример:77XXXXXXXXX):");
                      var smsService = new TwillioMessageSender();
                      smsService.MobileNumber = Console.ReadLine();

                      while (true)
                      {
                        Console.Write("Вводите СМС-код отправленный на телефон:");
                        if (smsService.SendMessage() == Console.ReadLine())
                        {
                          var newUser = new User()
                          {
                            Login = login,
                            Password = password
                          };
                          connection.Insert(newUser);
                          Console.Clear();
                          Console.WriteLine("Вы успешно зарегистрированы!\n");
                          break;
                        }
                        else
                        {
                          Console.WriteLine("Неправильно указан код! Введите заново");
                        }
                      }
                      break;
                    }
                  }
                }
                break;
              };
            }; 
            break;
          case "2":

            Console.Clear();
            Console.Write("Введите имя пользователя:");
            string userName = Console.ReadLine();
            Console.Write("Введите пароль:");
            string userPassword = Console.ReadLine();

            using (UserDataAccess connection = new UserDataAccess())
            {
              // Проверка пользователя В БД
              if (connection.UserAutentication(userName, userPassword))
              {
                Console.Clear();
                Console.WriteLine("Авторизация успешно завершилось");
              }
              else
              {
                Console.WriteLine("\nДанные не совпадает!");
                Console.WriteLine("Нажмите Enter чтобы вернутся в меню");
                Console.ReadLine();
                Console.Clear();
                break;
              }
            }

            using (ProductDataAccess connection = new ProductDataAccess())
            {
              while (true)
              {
                while (true)
                {
                  Console.ForegroundColor = ConsoleColor.Yellow;
                  Console.WriteLine("Категория товаров\n");
                  Console.ResetColor();
                  var categories = connection.GetCategories();
                  foreach (var category in categories)
                  {
                    Console.WriteLine($"{category.Id}.{category.CategoryName}");
                  };
                  Console.WriteLine("0.Выйти");
                  Console.Write("\n\nВыберите категорию:");
                  if (int.TryParse(Console.ReadLine(), out int numberCategory))
                  {
                    if (numberCategory >= 1 && numberCategory <= categories.Count)
                    {
                      Console.Clear();

                          while (true)
                          {//Вывод продуктов категория
                            var productsInCategory = connection.GetProductsInCategory(numberCategory);
                            foreach (var product in productsInCategory)
                            {
                              Console.WriteLine($"{product.Id}.{product.Name}\r\t\t\t\t\t\t{product.Price}");
                            };
                            Console.WriteLine("\n0.Назад");
                            Console.Write("\nВыберите товар:");

                            if (int.TryParse(Console.ReadLine(), out int numberProduct))
                            {
                              if (numberProduct >= 1 && numberProduct <= productsInCategory.Count)
                              {
                                //Вывод характеристики
                                Console.Clear();
                                Console.ForegroundColor = ConsoleColor.Yellow;
                                Console.WriteLine("\tИнформация о товаре.\n");
                                Console.ResetColor();
                                Console.WriteLine(connection.GetInfoAboutProduct(numberCategory, numberProduct));
                                foreach (var product in productsInCategory)
                                {
                                  if (product.Id == numberProduct)
                                  {
                                Console.ForegroundColor = ConsoleColor.DarkYellow;
                                Console.Write($"Цена:");
                                Console.ResetColor();
                                Console.WriteLine(product.Price);
                                    break;
                                  }

                                };

                                List<Comment> comments = connection.GetCommentsAboutProduct(numberCategory, numberProduct);
                                int i = 0;
                                Console.ForegroundColor = ConsoleColor.Yellow;
                                Console.WriteLine("\n\tКомментарий покупателей:");
                                Console.ResetColor();
                                foreach (var comment in comments)
                                {
                                  Console.WriteLine($"{++i})Имя пользователя:{comment.UserName}\nДата:{comment.Date}\nТекст:{comment.Content}\n");
                                }

                                Console.WriteLine();

                                  while (true)
                                  {
                                    Console.WriteLine("1.Купить товар");
                                    Console.WriteLine("2.Оставить комментарий");
                                    Console.WriteLine("0.Назад\n");
                                    Console.Write("Ваш выбор:");
                                    string choice = Console.ReadLine();
                                    if (choice == "1")
                                    {
                                      Console.Clear();
                                      Console.WriteLine("Товар куплен(QIWI).Спасибо за покупку.");
                                      Console.WriteLine("Нажмите Enter чтобы вернутся в меню.");
                                      Console.ReadLine();
                                      Console.Clear();
                                      break;
                                    }
                                    else if (choice == "2")
                                    {Console.Clear();
                                      Console.Write("Комментарий: ");
                                      string content;
                                      content = Console.ReadLine();
                                      if (string.IsNullOrWhiteSpace(content))
                                      {
                                        Console.Clear(); break;
                                      }

                                      connection.InsertComment(numberCategory, numberProduct,userName,content,DateTime.Now);
                                      Console.Clear(); break;
                                    }else if(choice == "0")
                                    {
                                      Console.Clear();
                                      break;
                                    }
                                    else
                                    {
                                      Console.WriteLine("Неправильный ввод!Повторите выбор.\n");
                                    }
                                  }
                                continue;
                              }
                              else if (numberProduct == 0)
                              {
                                Console.Clear();
                                break;
                              }
                              else
                              {
                                Console.Clear();
                                continue;
                              }
                            }
                            else
                            {
                              Console.Clear();
                              continue;
                            }
                          }
                    }
                    else if (numberCategory == 0)
                    {
                      Console.Clear();
                      break;
                    }
                    else
                    {
                      Console.Clear();
                    }
                  }
                  else
                  {
                    Console.Clear();
                  }
                }
                break;
              }
            }
            break;
          case "0":
            return;
        }
      }
    }

    private static void InitConfigutation()
    {
      DataAccessConfiguration.Init();
    }
  }
}
