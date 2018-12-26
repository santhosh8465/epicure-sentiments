<!DOCTYPE html>
<html>
    <head>
		<link rel="stylesheet" href="./main.css">
        <link rel="stylesheet" href="./w3.css">    
    </head>
    <body>
        <div id="center_maker" class="w3-card-8">
			<img src="./collagemy.jpg" id="img1" class="w3-border w3-padding" alt="img">
           <ul class="w3-navbar w3-green">
			  <li><a class="w3-padding-hor-32" href="index.html">Home</a></li>
			  <li><a class="w3-padding-hor-32" href="about.html">About</a></li>
			  <li><a class="w3-padding-hor-32" href="index1.php">Opinion Portal</a></li>
               <li><a class="w3-padding-hor-32" href="display_reviews.php">Data</a></li>
			   <li><a class="w3-padding-hor-32" href="analysis.html">Analysis</a></li>
			    <li><a class="w3-padding-hor-32" href="report.html">Report</a></li>
				<li><a class="w3-padding-hor-32" href="contactus.html">ContactUs</a></li>
			</ul>
			<div id="content" class="w3-card-8">
            <table class="w3-table w3-bordered">
            <tr>
                <th>Reviews</th>
                <th>Polarity</th>
            </tr>
            <?php
                require_once  './connectdb.php';
                connectdb(); 
                $sql="select * from reviews;";
                $result = $conn->query($sql);
                 if ($result->num_rows > 0){
                      while($row = $result->fetch_assoc()){
                          echo "<tr>";
                           $reviews=$row['review'];
                           $polarity=$row['polarity'];
                          echo "<td>$reviews</td>";
                          echo "<td>$polarity</td>";
                          echo "</tr>";
                      }
                 }

            ?>
            </table>
            </div>
            
            <div id="footer" class="w3-green">
                copyright&copy;epicuresentiments2016
            </div>
        </div>
    </body>
</html>