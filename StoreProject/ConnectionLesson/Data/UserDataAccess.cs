using ConnectionLesson.Models;
using System.Collections.Generic;
using System;
using System.Data.Common;

namespace ConnectionLesson.Data
{
  public class UserDataAccess : DbDataAccess
  {
    public bool UserVerification(string userLogin)  // Проверка наличие пользователя в базе
    {
      string script = $"select user_name from Users;";
      var command = factory.CreateCommand();
      command.CommandText = script;
      command.Connection = connection;

      using (var dataReader = command.ExecuteReader())
      {
        while (dataReader.Read())
        {
          if (userLogin == dataReader["user_name"].ToString())
          {
            return true;
          };
        }
        return false;
      }
    }

    public bool UserAutentication(string login, string password) //Авторизация пользователя
    {
      string selectScript = $"select * from Users;";
      var command = factory.CreateCommand();
      command.CommandText = selectScript;
      command.Connection = connection;

      var dataReader = command.ExecuteReader();

      while (dataReader.Read())
      {
        if (login == dataReader["user_name"].ToString() && password == dataReader["password"].ToString())
        {
          return true;
        }
      }
      return false;
    }

    public void Insert(User user) // Добавление пользователя
    {

      string insertScript = "insert into Users(user_name,password) values(@Login,@Password);";

      using (var transaction = connection.BeginTransaction())
      using (var command = factory.CreateCommand())
      {
        try
        {
          command.Connection = connection;
          command.CommandText = insertScript;

          command.Transaction = transaction;
          var loginParameter = factory.CreateParameter();
          loginParameter.DbType = System.Data.DbType.String;
          loginParameter.ParameterName = "Login";
          loginParameter.Value = user.Login;

          command.Parameters.Add(loginParameter);

          var passwordParameter = factory.CreateParameter();
          passwordParameter.DbType = System.Data.DbType.String;
          passwordParameter.ParameterName = "Password";
          passwordParameter.Value = user.Password;

          command.Parameters.Add(passwordParameter);
          command.ExecuteNonQuery();
          transaction.Commit();
        }
        catch (DbException ex)
        {
          Console.WriteLine(ex.Message);
          transaction.Rollback();
        }
      }
    }

  }
}
