using ConnectionLesson.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ConnectionLesson.Data
{
  public class ProductDataAccess:DbDataAccess
  {
    public ICollection<Category> GetCategories()
    {
      string script = $"select * from Categories;";
      var command = factory.CreateCommand();
      command.CommandText = script;
      command.Connection = connection;

      var dataReader = command.ExecuteReader();
      List<Category> categories = new List<Category>();

      while (dataReader.Read())
      {
        categories.Add(new Category
        {
          Id = int.Parse(dataReader["id_category"].ToString()),
          CategoryName = dataReader["name"].ToString()
        });
      }
      dataReader.Close();
      command.Dispose();
      return categories;
    }

    public ICollection<Product> GetProductsInCategory(int idCategory)
    {
      string script = $"select id_product,product_name,price from Products where id_category={idCategory};";

      var command = factory.CreateCommand(); ;
      command.CommandText = script;
      command.Connection = connection;

      var dataReader = command.ExecuteReader();
      List<Product> products = new List<Product>();

      while (dataReader.Read())
      {
        products.Add(new Product
        {
          Id = int.Parse(dataReader["id_product"].ToString()),
          Name = dataReader["product_name"].ToString(),
          Price = double.Parse(dataReader["price"].ToString())
        });
      }
      dataReader.Close();
      command.Dispose();
      return products;
    }

    public string  GetInfoAboutProduct(int categoryProduct,int idProduct)
    {
      string info="";
      string script = $"select description from Product_Description where id_category={categoryProduct} and id_product={idProduct};";

      var command = factory.CreateCommand(); ;
      command.CommandText = script;
      command.Connection = connection;

      var dataReader = command.ExecuteReader();

      while (dataReader.Read())
      {
        info = dataReader["description"].ToString();
      };

      dataReader.Close();
      command.Dispose();
      return info;
    }

    public List<Comment> GetCommentsAboutProduct(int categoryProduct, int idProduct)
    {
      string script = $"select * from Comments where id_category={categoryProduct} and id_product={idProduct};";

      var command = factory.CreateCommand(); ;
      command.CommandText = script;
      command.Connection = connection;

      var dataReader = command.ExecuteReader();
      List <Comment> comments = new List<Comment>();
      
      while (dataReader.Read())
      {
        comments.Add( new Comment { 
        IdCategory = int.Parse(dataReader["id_category"].ToString()),
        IdProduct = int.Parse(dataReader["id_product"].ToString()),
        UserName = dataReader["user_name"].ToString(),
        Date =  DateTime.Parse(dataReader["date_time"].ToString()),
        Content = dataReader["comment"].ToString()
        });
      };
      dataReader.Close();
      command.Dispose();
      return comments;
    }

    public void InsertComment(int _categoryProduct, int _idProduct,string _userName,string _comment, DateTime _date)
    {
      string insertScript = "insert into Comments(id_category,id_product,user_name,date_time,comment) values(@idCategory,@idProduct,@userName,@date,@comment);";

      var command = factory.CreateCommand(); 
      command.Connection = connection;
      command.CommandText = insertScript;

      var idCategory = factory.CreateParameter();
      idCategory.DbType = System.Data.DbType.Int32;
      idCategory.ParameterName = "idCategory";
      idCategory.Value = _categoryProduct;
      command.Parameters.Add(idCategory);

      var idProduct = factory.CreateParameter();
      idProduct.DbType = System.Data.DbType.Int32;
      idProduct.ParameterName = "idProduct";
      idProduct.Value = _idProduct;
      command.Parameters.Add(idProduct);

      var userName = factory.CreateParameter();
      userName.DbType = System.Data.DbType.String;
      userName.ParameterName = "userName";
      userName.Value = _userName;
      command.Parameters.Add(userName);

      var comment = factory.CreateParameter();
      comment.DbType = System.Data.DbType.String;
      comment.ParameterName = "comment";
      comment.Value = _comment;
      command.Parameters.Add(comment);

      var date = factory.CreateParameter();
      date.DbType = System.Data.DbType.Date;
      date.ParameterName = "date";
      date.Value = _date;
      command.Parameters.Add(date);

      command.ExecuteNonQuery();
      command.Dispose();
    }

  }
}
