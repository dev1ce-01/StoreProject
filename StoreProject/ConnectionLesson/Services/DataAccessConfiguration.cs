using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;

namespace ConnectionLesson.Services
{
  public static class DataAccessConfiguration
  {
    public static IConfiguration Configuration { get;private set;}
    //static DataAccessConfiguration()
    //{
    //  DbProviderFactories.RegisterFactory("ConnectedLevelProvider", SqlClientFactory.Instance);
    //}
    public static void Init()
    {
      //if(DbProviderFactories.GetFactory("ConnectedLevelProvider") == null) 
      //{
        DbProviderFactories.RegisterFactory("ConnectedLevelProvider", SqlClientFactory.Instance);
      //};
      if (Configuration == null)
      {
        var ConfigurationBuilder = new ConfigurationBuilder();
        Configuration = ConfigurationBuilder.AddJsonFile("appSettings.json").Build();
      }
    }

  }
}
