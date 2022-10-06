
/*
1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. 
Return actor first name, last name and role. 
*/

select actors.act_fname as Actor_FirstName, actors.act_lname as Actor_LastName, movie_cast.role as Role_name
from actors
join movie_cast
on actors.act_id = movie_cast.act_id
join movie
on movie.mov_id = movie_cast.mov_id
where movie.mov_title = 'Annie Hall';

/*
2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
Return director first name, last name and movie title.
*/

select dir_fname as Director_FirstName, dir_lname as Director_LastName, movie.mov_title as Movie_Title
from director
join movie_direction
on director.dir_id = movie_direction.dir_id
join movie
on movie_direction.mov_id = movie.mov_id
where mov_title = 'Eyes Wide Shut';

/*
3. Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. 
Return director first name, last name and movie title.
*/

select director.dir_fname as Director_FirstName, dir_lname as Director_LastName, movie.mov_title as Movie_title
from director
join movie_direction
on director.dir_id = movie_direction.dir_id
join movie_cast
on movie_direction.mov_id = movie_cast.mov_id
join movie
on movie_cast.mov_id = movie.mov_id
where role = 'Sean Maguire';

/*
4. Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). 
Return actor first name, last name, movie title and release year. 
*/

select actors.act_fname as Actor_FirstName, actors.act_lname as Actor_LastName, movie.mov_title as Movie_Title, movie.mov_year as Release_Year
from actors
join movie_cast
on actors.act_id = movie_cast.act_id
join movie
on movie_cast.mov_id = movie.mov_id
where movie.mov_year not between 1990 and 2000;

/*
5. Write a SQL query to find the directors with the number of genres of movies. 
Group the result set on director first name, last name and generic title. 
Sort the result-set in ascending order by director first name and last name. 
Return director first name, last name and number of genres of movies.
*/

select director.dir_fname as Director_FastName, director.dir_lname as Director_LastNAme, count(gen_title) as Number_Genres_Movies
from director
join movie_direction
on director.dir_id = movie_direction.dir_id
join movie_genres
on movie_direction.mov_id = movie_genres.mov_id
join genres
on movie_genres.gen_id = genres.gen_id
group by director.dir_fname, director.dir_lname, genres.gen_title
order by  director.dir_fname, director.dir_lname ASC;

/* OR---we can use natural join also */
select director.dir_fname as Director_FastName, director.dir_lname as Director_LastNAme, count(gen_title) as Number_Genres_Movies
from director
natural join movie_direction
natural join movie_genres
natural join genres
group by director.dir_fname, director.dir_lname, genres.gen_title
order by  director.dir_fname, director.dir_lname ASC;
