import express from 'express';
import mysql from 'mysql';
import path from 'path';

const PORT = process.env.PORT || 3000;
const app = express();
const __dirname = path.resolve();


   //APP

   app.set('view engine', 'ejs');   
   app.set('views', path.resolve(__dirname, 'views'));

   app.use(express.static(path.resolve(__dirname, 'views')))

   app.use(express.json())
   app.use(express.urlencoded({extended: true}))


app.listen(PORT, () => {
   console.log(`Server connecting ${PORT}`);
});

   //MySQL
const conn = mysql.createConnection({
   port: 3306,
   user: 'root',
   database: 'library_2',
   password: ''
});


conn.connect((err) => {
   if(err){
      throw err;
   }
   console.log('database connect');
});

//DISCIPLINE INDEX
let query = 'SELECT * FROM disciplines';
   conn.query(query, (err, result) => {
      if(err){
         throw err;
      } 

      //INDEX
      app.get('/', (req, res) => {
         res.render('index', {
            cs1: result[0]['Name_Discipline'],
            cs2: result[0]['Genre'],
            cs3: result[0]['Age_limit'],
            cs4: result[0]['Developer'],
            cs5: result[0]['Data_of_issue'],

            dota: result[2]['Name_Discipline'],
            dota2: result[2]['Genre'],
            dota3: result[2]['Age_limit'],
            dota4: result[2]['Developer'],
            dota5: result[2]['Data_of_issue'],

            lol: result[3]['Name_Discipline'],
            lol2: result[3]['Genre'],
            lol3: result[3]['Age_limit'],
            lol4: result[3]['Developer'],
            lol5: result[3]['Data_of_issue']
            
         });
      });
   });


//SELECT 2, PLAYERS


      //PLAYER
      app.get('/player', (req, res) => {
         let query2 = 'SELECT * FROM player';

         conn.query(query2, (err, result) => {
         if(err){
            throw err;
         } 

         res.render('player', {
            array: result
         });
      });

   });


   //Select 3, Organization

   let query3 = 'SELECT * FROM organization';

      //COMANDS
      app.get('/comands', (req, res) => {
         conn.query(query3, (err, result) => {
         if(err){
            throw err;
         } 
         res.render('comands', {
            array: result 
         }); 
      });

   });

   //Select 4, TOURNAMENT

   let query4 = 'SELECT * FROM tournament';

      //TOURNAMENT

      app.get('/tournaments', (req, res) => {
         conn.query(query4, (err, result) => {
         if(err){
            throw err;
         } 
         res.render('tournaments', {
            array: result
         });  
      }); 
   });

      //Select 5, Contracts

      let query5 = 'SELECT * FROM contracts_gamers';

      //Contracts
      app.get('/contracts', (req, res) => {
         conn.query(query5, (err, result) => {
         if(err){
            throw err;
         } 
         res.render('contracts', {
            array: result
         }); 
      });

   });

   //CREATE PLAYER

      app.get('/create', (req, res) => {
         res.render('create', {
            
         });  
      }); 

      app.post('/create', (req, res) => {
         const {FIO, NickName, Birthday} = req.body;

         let queryAdd = `INSERT INTO player (FIO, NickName, Date_of_birthday) VALUES (?,?,?)`;

         conn.query(queryAdd, [FIO, NickName, Birthday], (err, result) => {
            if(err){
               throw err;
            }
            res.redirect('/player');
      }); 
   });

   // CREATE COMANDS

   app.get('/createComand', (req, res) => {
      res.render('createComand', {     
      });  
   }); 

   app.post('/createComand', (req, res) => {
      const {Name, Year, Country, Web_sait} = req.body;

      let queryAdd = `INSERT INTO organization (Name, Year, Country, Web_sait) VALUES (?,?,?,?)`;

      conn.query(queryAdd, [Name, Year, Country, Web_sait], (err, result) => {
         if(err){
            throw err;
         }
         res.redirect('/comands');
   }); 
});

   // CREATE TOURNAMENT

   app.get('/createTounament', (req, res) => {
      res.render('createTounament', {     
      });  
   }); 

   app.post('/createTounament', (req, res) => {
      const {Tournament_Name, Prize, Date_start, Date_end, Organizer, id_game} = req.body;

      let queryAdd = `INSERT INTO tournament (Tournament_Name, Prize, Date_start, Date_end, Organizer, id_game) VALUES (?,?,?,?,?,?)`;

      conn.query(queryAdd, [Tournament_Name, Prize, Date_start, Date_end, Organizer, id_game], (err, result) => {
         if(err){
            throw err;
         }
         res.redirect('/tournaments');
   }); 
});

// CREATE CONTRACTS

   app.get('/createContracts', (req, res) => {
      res.render('createContracts', {     
      });  
   }); 

   app.post('/createContracts', (req, res) => {
      const {id_player, id_organization, date_of_contract} = req.body;

      let queryAdd = `INSERT INTO contracts_gamers (id_player, id_organization, date_of_contract) VALUES (?,?,?)`;

      conn.query(queryAdd, [id_player, id_organization, date_of_contract], (err, result) => {
         if(err){
            throw err;
         }
         res.redirect('/contracts');
      }); 
   });

// DELETE PLAEYER

app.get('/player', (req, res) => {
   res.render('player', {     
   });  

}); 


app.post("/delete/:id", function(req, res){

   const id = req.params.id;
          
   let querydelete = `DELETE FROM player WHERE id=?`;

   conn.query(querydelete, [id], (err, result) => {
      if(err){
         throw err;
      }
      console.log(result);
      res.redirect('/player');
   }); 
 });

 // DELETE COMANDS

app.get('/comands', (req, res) => {
   res.render('comands', {     
   });  

}); 


app.post("/deletes/:id", function(req, res){

   const id = req.params.id;
          
   let querydelete = `DELETE FROM organization WHERE id=?`;

   conn.query(querydelete, [id], (err, result) => {
      if(err){
         throw err;
      }
      console.log(result);
      res.redirect('/comands');
   }); 
 });


  // DELETE TOURNAMENTS

app.get('/tournaments', (req, res) => {
   res.render('tournaments', {     
   });  

}); 


app.post("/deletesq/:id", function(req, res){

   const id = req.params.id;
          
   let querydelete = `DELETE FROM tournament WHERE id=?`;

   conn.query(querydelete, [id], (err, result) => {
      if(err){
         throw err;
      }
      console.log(result);
      res.redirect('/tournaments');
   }); 
 });

   // DELETE CONTRACTS

app.get('/contracts', (req, res) => {
   res.render('contracts', {     
   });  

}); 


app.post("/deleteContr/:id", function(req, res){

   const id = req.params.id;
          
   let querydelete = `DELETE FROM contracts_gamers WHERE id=?`;

   conn.query(querydelete, [id], (err, result) => {
      if(err){
         throw err;
      }
      console.log(result);
      res.redirect('/contracts');
   }); 
 });



// UPDATE PLAYER

app.get('/editPlayer/:id', (req, res) => {

   const id = req.params.id;

   let queryUppdate = `SELECT * FROM player WHERE id=?`;

   conn.query(queryUppdate, [id], (err, result) => {
      if(err){
         throw err;
      }

      res.render('editPlayer', {    
         users: result[0]
      });  
   }); 
}); 

app.post('/editPlayer/:id', (req, res) => {

   const NickName = req.body.NickName;
   const FIO = req.body.FIO;
   const Date_of_birthday = req.body.Date_of_birthday;
   const id = req.params.id;

   let queryUppdated = `UPDATE player SET NickName=?, FIO=?, Date_of_birthday=? WHERE id=?`;

   conn.query(queryUppdated, [NickName, FIO, Date_of_birthday, id], (err, result) => {
      if(err){
         throw err;
      }
      res.redirect('/player');
   }); 
});


// UPDATE COMANNDS

app.get('/editComands/:id', (req, res) => {

   const id = req.params.id;

   let queryUppdate = `SELECT * FROM organization WHERE id=?`;

   conn.query(queryUppdate, [id], (err, result) => {
      if(err){
         throw err;
      }

      res.render('editComands', {    
         data: result[0]
      });  
   }); 
}); 

app.post('/editComands/:id', (req, res) => {

   const Name = req.body.Name;
   const Year = req.body.Year;
   const Country = req.body.Country;
   const Meneger = req.body.Meneger;
   const Web_sait = req.body.Web_sait;
   const id = req.params.id;

   let queryUppdateda = `UPDATE organization SET Name=?, Year=?, Country=?, Meneger=?, Web_sait=? WHERE id=?`;

   conn.query(queryUppdateda, [Name, Year, Country, Meneger, Web_sait, id], (err, result) => {
      if(err){
         throw err;
      }
      res.redirect('/comands');
   }); 
});


// UPDATE TOURNAMENTS

app.get('/editTournament/:id', (req, res) => {

   const id = req.params.id;

   let queryUppdate = `SELECT * FROM tournament WHERE id=?`;

   conn.query(queryUppdate, [id], (err, result) => {
      if(err){
         throw err;
      }

      res.render('editTournament', {    
         data: result[0]
      });  
   }); 
}); 

app.post('/editTournament/:id', (req, res) => {

   const Tournament_Name = req.body.Tournament_Name;
   const Prize = req.body.Prize;
   const Date_start = req.body.Date_start;
   const Date_end = req.body.Date_end;
   const Organizer = req.body.Organizer;
   const id_game  = req.body.id_game;
   const id = req.params.id;

   let queryUppdateda = `UPDATE tournament SET Tournament_Name=?, Prize=?, Date_start=?, Date_end=?, Organizer=?, id_game=? WHERE id=?`;

   conn.query(queryUppdateda, [Tournament_Name, Prize, Date_start, Date_end, Organizer, id_game, id], (err, result) => {
      if(err){
         throw err;
      }
      res.redirect('/tournaments');
   }); 
});

// UPDATE CONTRACTS

app.get('/editContracts/:id', (req, res) => {

   const id = req.params.id;

   let queryUppdate = `SELECT * FROM contracts_gamers WHERE id=?`;

   conn.query(queryUppdate, [id], (err, result) => {
      if(err){
         throw err;
      }

      res.render('editContracts', {    
         data: result[0]
      });  
   }); 
}); 

app.post('/editContracts/:id', (req, res) => {

   const id_player = req.body.id_player;
   const id_organization = req.body.id_organization;
   const date_of_contract = req.body.date_of_contract;
   const id = req.params.id;

   let queryUppdateda = `UPDATE contracts_gamers SET id_player=?, id_organization=?, date_of_contract=? WHERE id=?`;

   conn.query(queryUppdateda, [id_player, id_organization, date_of_contract, id], (err, result) => {
      if(err){
         throw err;
      }
      res.redirect('/contracts');
   }); 
});