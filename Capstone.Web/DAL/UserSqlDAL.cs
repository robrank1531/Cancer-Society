﻿using Capstone.Web.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Capstone.Web.Models;
using System.Web.Mvc;

namespace Capstone.Web.DAL
{
    public class UserSqlDAL : IUserSqlDAL
    {
        private string connectionString;
        private const string registerUserSql = "INSERT into website_users VALUES (@users_name, @password, @email, @authorization, @salt, @signup)";
        private const string loginUserSql = "SELECT* FROM website_users WHERE users_name = @usersname";
        private const string updatePassword = @"UPDATE website_users SET password = @password, salt = @salt WHERE users_name = @username;";
        private const string getUsers = @"SELECT * FROM website_users WHERE authorization_level = 2;";
        private const string makeAdmin = @"UPDATE website_users SET authorization_level = 3 WHERE users_id = @userId;";

        public UserSqlDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public bool UpdateAuthorization(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(makeAdmin, conn);
                    cmd.Parameters.AddWithValue("@userId", id);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return rowsAffected > 0;
                }

            }
            catch (SqlException ex)
            {
                throw;
            }
        }

        public List<UserModel> GetAllUsers()
        {
            List<UserModel> users = new List<UserModel>();
            try
            {
                
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(getUsers, conn);
                    SqlDataReader results = cmd.ExecuteReader();
                    while (results.Read())
                    {
                        UserModel model = new UserModel();
                        model.AuthorizationLevel = Convert.ToInt32(results["authorization_level"]);
                        model.UserID = Convert.ToInt32(results["users_id"]);
                        model.UserName = Convert.ToString(results["users_name"]);
                        model.Email = Convert.ToString(results["email"]);
                        users.Add(model);
                    }
                }

            }
            catch(SqlException ex)
            {
                throw;
            }
            return users;
        }


        public bool ChangePassword(string password, string salt, string username)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updatePassword, conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@salt", salt);


                    int rowsAffected = cmd.ExecuteNonQuery();

                    return rowsAffected > 0;
                }

            }
            catch (SqlException ex)
            {
                throw;
            }
        }


        public bool RegisterUser(UserModel model)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(registerUserSql, conn);
                    cmd.Parameters.AddWithValue("@users_name", model.UserName);
                    cmd.Parameters.AddWithValue("@password", model.Password);
                    cmd.Parameters.AddWithValue("@email", model.Email);
                    cmd.Parameters.AddWithValue("@authorization", model.AuthorizationLevel);
                    cmd.Parameters.AddWithValue("@salt", model.Salt);
                    cmd.Parameters.AddWithValue("@signup", model.Signup);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return rowsAffected > 0;
                }

            }

            catch (SqlException e)
            {
                throw new NotImplementedException();
            }
        }

        public UserModel GetUser(string username)
        {
            UserModel result = new UserModel();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(loginUserSql, conn);
                    cmd.Parameters.AddWithValue("@usersname", username);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        result.UserID = Convert.ToInt32(reader["users_id"]);
                        result.Email = Convert.ToString(reader["email"]);
                        result.UserName = reader["users_name"].ToString();
                        result.Password = reader["password"].ToString();
                        result.AuthorizationLevel = Int32.Parse(reader["authorization_level"].ToString());
                        result.Salt = Convert.ToString(reader["salt"]);
                    }

                    return result;
                }
            }
            catch (SqlException ex)
            {
                throw;
            }
        }

    }
}