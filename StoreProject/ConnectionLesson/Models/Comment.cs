using System;
using System.Collections.Generic;
using System.Text;

namespace ConnectionLesson.Models
{
  public class Comment
  {
    public int IdCategory { get; set; }
    public int IdProduct { get;set;}
    public string UserName { get;set;}
    public DateTime Date {get;set;}
    public string Content { get;set;}
  }
}
