<%-- 
    Document   : matches
    Created on : May 18, 2018, 10:36:36 AM
    Author     : Divya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.MongoClient,
        com.mongodb.client.MongoCollection,
        com.mongodb.client.MongoDatabase,
        static com.mongodb.client.model.Filters.*,
        com.mongodb.client.model.CreateCollectionOptions,
        com.mongodb.client.model.ValidationOptions,
        org.bson.Document,
        com.mongodb.BasicDBObject,
        com.mongodb.DB,
        com.mongodb.DBCollection,
        com.mongodb.DBCursor,
        com.mongodb.DBObject,
        com.mongodb.client.MongoCursor,
        com.mongodb.client.model.Projections,
        com.mongodb.client.model.Indexes,
        com.mongodb.client.model.IndexOptions,
        com.mongodb.client.model.Filters,
        java.util.Arrays,
        java.util.Scanner,
        java.util.Iterator ,
        java.util.ArrayList"

        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        
        <title>Matches </title>
        <style type="text/css">
            .horizontal { display: inline; background-color: whitesmoke; }
        </style>
    </head>
    <body>
        <%!
            MongoClient mb = new MongoClient();
        MongoDatabase md = mb.getDatabase("football");
        MongoCollection mc = md.getCollection("matches");
        FindIterable<Document> fi;
        Iterator<Document>  it;
        Document doc;            
        %>
        
        <div class="row">
            
        <%            
            
        fi=mc.find();
        it=fi.iterator();
        Document t;
        ArrayList list1, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11;
        while(it.hasNext())
                        {

                            //System.out.println(it.next());
                            t=it.next();
                            //System.out.println(t.get("Group A"));
                            list1=(ArrayList)t.get("match_num");
                            list2=(ArrayList)t.get("round/group");
                            list3=(ArrayList)t.get("matchday");
                            list4=(ArrayList)t.get("date");
                            list5=(ArrayList)t.get("time");
                            list6=(ArrayList)t.get("stadium");
                            list7=(ArrayList)t.get("where");
                            list8=(ArrayList)t.get("home");
                            list9=(ArrayList)t.get("home_score");
                            list10=(ArrayList)t.get("away");
                            list11=(ArrayList)t.get("away_score");
                            
                            System.out.println(list1.get(0)); 
        %>
        <div class="container">
            <div class="card-body">
              <center><div class="shadow p-3 mb-5 bg-white rounded"><h2>
                Matches
                      </h2></div></center>
            </div>
  <table class="table">
      <thead class="thead-light">
    
      <tr>
        
        <th scope="col">Match Number</th>
        <th scope="col">Group</th>
        <th scope="col">Day of the Match</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Stadium</th>
        <th scope="col">Where</th>
        <th scope="col">Home</th>
        <th scope="col">Home Score</th>
        <th scope="col">Away</th>
        <th scope="col">Away Score</th>
      </tr>
    </thead>
    <table class="table table-striped">
    <tbody>
        <%for(int i=0; i<31; i++)
        {
        %>
      <tr >
        <div><td ><%=list1.get(i) %></td></div>
        <div><td><%=list2.get(i) %></td></div>
        <td><%=list3.get(i) %></td>
        <td><%=list4.get(i) %></td>
        <td><%=list5.get(i) %></td>
        <td><%=list6.get(i) %></td>
        <td><%=list7.get(i) %></td>
        <td><%=list8.get(i) %></td>
        <td><%=list9.get(i) %></td>
        <td><%=list10.get(i) %></td>
        <td><%=list11.get(i) %></td>
      </tr>      
      <%}%>
    </tbody>
    </table>
  </table>
</div>

      
        
         <%               
         break;       }
        %>    
    </div>
    
        
        
        
        
        
        
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
          
    </body>
</html>