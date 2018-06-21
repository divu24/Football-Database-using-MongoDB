<%-- 
    Document   : groups
    Created on : May 12, 2018, 7:31:21 PM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        
        <title>Groups </title>
        <style type="text/css">
            .horizontal { display: inline; background-color: whitesmoke; }
        </style>
    </head>
    <body>
        <%!
            MongoClient mb = new MongoClient();
        MongoDatabase md = mb.getDatabase("football");
        MongoCollection mc = md.getCollection("groups");
        FindIterable<Document> fi;
        Iterator<Document>  it;
        Document doc;            
        %>
        
        <div class="row">
            
                
               
                
               
                
        <%            
            
        fi=mc.find();
        it=fi.iterator();
        Document t;
        ArrayList list1, list2, list3, list4;
        while(it.hasNext())
                        {

                            //System.out.println(it.next());
                            t=it.next();
                            //System.out.println(t.get("Group A"));
                            list1=(ArrayList)t.get("Group A");
                            list2=(ArrayList)t.get("Group B");
                            list3=(ArrayList)t.get("Group C");
                            list4=(ArrayList)t.get("Group D");
                            System.out.println(list1.get(0)); 
        %>
        <div class="col-xl-3">
        <div class="card-body">
            <div class="shadow p-3 mb-5 bg-white rounded"><h4>Group A</h4></div>
              
     
      <div class="alert alert-warning" role="alert"><%=list1.get(0)%></div>
      <div class="alert alert-warning" role="alert"><%=list1.get(1)%></div>
      <div class="alert alert-warning" role="alert"><%=list1.get(2)%></div>
      <div class="alert alert-warning" role="alert"><%=list1.get(3)%></div>
    </div>           
       </div>
        <%
                             list2=(ArrayList)t.get("Group B");
                            System.out.println(list2.get(0)); 
        %>
       <div class="col-xl-3">
        <div class="card-body">
            <div class="shadow p-3 mb-5 bg-white rounded"><h4>Group B</h4></div>
     
      <div class="alert alert-primary" role="alert"><%=list2.get(0)%></div>
      <div class="alert alert-primary" role="alert"><%=list2.get(1)%></div>
      <div class="alert alert-primary" role="alert"><%=list2.get(2)%></div>
      <div class="alert alert-primary" role="alert"><%=list2.get(3)%></div>
    </div>  
    </div>
    
     <%
                             list3=(ArrayList)t.get("Group C");
                            System.out.println(list3.get(0)); 
        %>
       <div class="col-xl-3">
        <div class="card-body">
            <div class="shadow p-3 mb-5 bg-white rounded"><h4>Group C</h4></div>
     
      <div class="alert alert-success" role="alert"><%=list3.get(0)%></div>
      <div class="alert alert-success" role="alert"><%=list3.get(1)%></div>
      <div class="alert alert-success" role="alert"><%=list3.get(2)%></div>
      <div class="alert alert-success" role="alert"><%=list3.get(3)%></div>
    </div>  
    </div>
     <%
                             list4=(ArrayList)t.get("Group D");
                            System.out.println(list4.get(0)); 
        %>
       <div class="col-xl-3">
        <div class="card-body">
            <div class="shadow p-3 mb-5 bg-white rounded"><h4>Group D</h4></div>
     
      <div class="alert alert-secondary" role="alert"><%=list4.get(0)%></div>
      <div class="alert alert-secondary" role="alert"><%=list4.get(1)%></div>
      <div class="alert alert-secondary" role="alert"><%=list4.get(2)%></div>
      <div class="alert alert-secondary" role="alert"><%=list4.get(3)%></div>
    </div>  
        </div>         
         <%               
                }
        %>    
    </div>

       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
          
    </body>
</html>