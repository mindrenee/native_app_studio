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
            
        }
        
        function getScores() {
            // Print all codes in database
            $stmt = $this->db->prepare("SELECT * FROM  highscore ORDER BY score DESC LIMIT 10");
            $stmt->execute();
            $stmt->bind_result($id, $name, $score);
            while ($stmt->fetch()) {
                echo "$name $score ";
            }
            $stmt->close();
        }
    }
    
    // This is the first thing that gets called when this page is loaded
    $api = new highscoreAPI;
    $api->insertScore();
    $api->getScores();
    
    ?>