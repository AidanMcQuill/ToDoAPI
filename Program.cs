using Microsoft.EntityFrameworkCore;
using System.Configuration;

namespace ToDoAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            // Adding Cors
            builder.Services.AddCors(options =>
            {
                options.AddDefaultPolicy(policy =>
                {
                    policy.WithOrigins("OriginPolicy", "http://todo.aidanmcquillan.com", "http://localhost:3000").AllowAnyMethod().AllowAnyHeader();
                });
            });

            //TODOcontext services
            builder.Services.AddDbContext<ToDoAPI.Models.ToDoContext>(
                options =>
                {
                    options.UseSqlServer(builder.Configuration.GetConnectionString("ToDoDB"));
                    // Connection string from the app settings ^ 
                }
                );
              

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();

            app.UseCors();

            app.Run();
        }
    }
}