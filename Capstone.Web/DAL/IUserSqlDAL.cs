﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Capstone.Web.Models;
using System.Web.Mvc;

namespace Capstone.Web.DAL
{
    public interface IUserSqlDAL
    {
        
        UserModel GetUser(string username);
        bool ChangePassword(string password, string salt, string username);
        bool RegisterUser(UserModel model);
        bool UpdateAuthorization(int id);
        List<UserModel> GetAllUsers();
    }
}
