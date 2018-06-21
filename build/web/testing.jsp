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
        java.util.ArrayList,
        java.util.Collections"

        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        
        <title>Stats </title>
        <style type="text/css">
            .horizontal { display: inline; background-color: whitesmoke; }
        </style>
    </head>
    <body>
        <%!
            MongoClient mb = new MongoClient();
        MongoDatabase md = mb.getDatabase("football");
        MongoCollection mc = md.getCollection("teams_stats");
        FindIterable<Document> fi;
        Iterator<Document>  it;
        Document doc;      
        ArrayList <String>list;
        ArrayList<Integer> intlist;
        %>
        
        <div id="stats">
            <h2>Goals</h2>
        <table class="table">
    <thead>
      <tr>
        
        
        <th>Maximum</th>
        <th>Team</th>
        <th>Minimum</th>
        <th>Team</th>
      </tr>
  
    </thead>
    <tbody>    
         <%
             fi=mc.find();
        it=fi.iterator();
        ArrayList team;
        Document t;
        //Document t;
        //ArrayList list1, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11;
        while(it.hasNext())
                        {

                            //System.out.println(it.next());
                            t=it.next();
                            System.out.println(t);
                            Integer j,k;
                            System.out.println("chava");
                            team=(ArrayList) t.get("Team");
                            System.out.println(team);
                            //System.out.println(t.get("Group A"));
                            //list.clear();
                            list= (ArrayList) t.get("Goals");
                            System.out.println(list);
                            intlist.clear();
                            for(String s : list) intlist.add(Integer.valueOf(s));
                            
                                
                                //intlist.add(Integer.valueOf(s));
                            
                            
                            
                            System.out.println(intlist);
                            j= Collections.max(intlist);
                            k= Collections.min(intlist);
                            System.out.println(intlist.indexOf(j));
                            System.out.println(list.get(0)); 
        
         %>   
         
        
      <tr >
        <td ><%=j%></td>
        <td><%=team.get(intlist.indexOf(j))%></td>
        <td><%=k%></td>
        <td><%=team.get(intlist.indexOf(k))%></td>
      </tr>      
      <%}%>
    </tbody>
  </table>  
    </div>
        </div> 
        
        
        
        
        
        
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
          
    </body>
</html>