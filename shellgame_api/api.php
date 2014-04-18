<?php
    
    class highscoreAPI {
        private $db;
        
        // Constructor - open DB connection
        function __construct() {
            $this->db = new mysqli('localhost', 'root', 'pietjepuk', 'highscoreapp');
            //$this->db->autocommit(FALSE);
        }
        
        // Destructor - close DB connection
        function __destruct() {
            $this->db->close();
        }
        
        function insertScore() {
            // check parameters
            if (isset($_POST["name"]) && isset($_POST["score"])) {
                
                // Put parameters into local variables
                $name = $_POST["name"];
                $score = $_POST["score"];
                
                $stmt = $this->db->prepare("INSERT INTO highscore (name, score) VALUES (?, ?)");
                $stmt->bind_param("si", $name, $score);
                $stmt->execute();
                $stmt->close();
                
            }
            echo 'Name: ', $name ,'</br>';
            echo 'Score: ', $score, '</br>';
            
        }
        
        function getScores() {
            // Print all codes in database
            $stmt = $this->db->prepare('SELECT id, name, score FROM highscore');
            $stmt->execute();
            $stmt->bind_result($id, $name, $score);
            while ($stmt->fetch()) {
                echo "Name: $name scored: $score </br>";
            }
            $stmt->close();
        }
    }
    
    // This is the first thing that gets called when this page is loaded
    $api = new highscoreAPI;
    $api->insertScore();
    $api->getScores();
    
    ?>