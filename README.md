## This is an TO-DO list with Rails.
<hr>

### For run this project is necessary to have:
<table>
    <tr>
        <td>Language/Interpreter</td>
        <td>Version</td>
    </tr>
    <tr>
        <td>Ruby</td>
        <td>3.0.0</td>
    </tr>
    <tr>
        <td>Rails</td>
        <td>6.1.3</td>
    </tr>
</table>

<table>
    <tr>
        <td>Database</td>
        <td>Version</td>
    </tr>
    <tr>
        <td>Postgres</td>
        <td>13</td>
    </tr>
</table>
<br>
<hr>

### After the step above, in your terminal run this commands 
<br>

#### Clone the project
```
git@github.com:vinicius-vph/task-list-with-rails.git
```

#### Enter the project directory
```
cd task-list-with-rails
```

#### Install ruby and rails dependencies 
```
bundle install
```

#### Install js dependencies 
```
yarn install
```

#### Create or run database
- If you have docker in your pc and want create a new container with postgres image exclusive for this project, run this command 
```
docker run --name teste-postgres -e POSTGRES_USER=test -e POSTGRES_PASSWORD=test -p 5432:5432 -d postgres
```

#### Create tables in database 
```
rails db:migrate
```

### Credentials of the project

- configure the user and password for CRUD the application

```bash
# delete the file config/credentials.yml.enc
rm config/credentials.yml.enc

# run the command for create credentials e master key files using VS Code (if you use another editor change 'code' for he)
EDITOR="code --wait" bin/rails credentials:edit
```

- in your editor create the fields below using your personal datas on `your_name` and `your_password` 
```yml
authenticate:
  name: your_name
  password: your_password
```

- Save and close the file `config/credentials.yml.enc`.

<br>

#### Run the project local
```
rails s
```
Open in your browser the address <a href="http://localhost:3000">http://localhost:3000</a>
<br>
For see in production <a href="https://vini-rails-task-list.herokuapp.com/">https://vini-rails-task-list.herokuapp.com/</a>