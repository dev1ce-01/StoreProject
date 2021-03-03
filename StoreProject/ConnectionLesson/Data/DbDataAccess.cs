using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using ConnectionLesson.Services;

namespace ConnectionLesson.Data
{
  public abstract class DbDataAccess : IDisposable
  {

    protected readonly DbProviderFactory factory;
    protected readonly DbConnection connection;
    public DbDataAccess()
    {
      factory = DbProviderFactories.GetFactory("ConnectedLevelProvider");

      connection = factory.CreateConnection();
      connection.ConnectionString = DataAccessConfiguration.Configuration["DataAccessConnectionString"];
      connection.Open();
    }

    public void Dispose()
    {
      connection.Dispose();
    }

    public void ExecuteTransaction(params DbCommand[] commands)
    {
      using (var transaction = connection.BeginTransaction())
      {
        try
        {
          foreach (var command in commands)
          {
            command.Transaction = transaction;
            command.ExecuteNonQuery();
          }
          transaction.Commit();
        }
        catch
        {
          transaction.Rollback();
        }
      }
    }

  }
}
