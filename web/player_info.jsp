

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        java.util.Scanner"
        %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <title>EURO 2012</title>
    </head>
    <body>
        <div class="row">
            <div class="col-xl-11">
        <h1>EURO 2012</h1>
            </div>
            <div class="col-xl-1">
         <form action="main.jsp">
              <button type="submit" class="btn btn-primary btn-lg">Home</button> 
        </form>
                </div>
        </div>
        <%!
            //HttpSession session;
            MongoClient mongoClient = new MongoClient();
            DB db = mongoClient.getDB("football");

            DBCursor cursor;
            String n, p, c, g, cl, l, d;
        %>
        <div class="accordion" id="accordionExample">
        <%
            String temp = (String) session.getAttribute("teams");
            System.out.println(temp);
            DBCollection coll = db.getCollection(temp);
            BasicDBObject fieldObject = new BasicDBObject();
            BasicDBObject searchObject = new BasicDBObject();
            //searchObject.put("Team", team);
            fieldObject.put("name", 1);
            fieldObject.put("position", 1);
            fieldObject.put("caps", 1);
            fieldObject.put("goals for country", 1);
            fieldObject.put("club", 1);
            fieldObject.put("league", 1);
            fieldObject.put("date of birth", 1);
            fieldObject.put("_id", 0);
            cursor = coll.find(searchObject, fieldObject);

            try {
                while (cursor.hasNext()) {
                    System.out.println(cursor.next());
                    //DBObject o=cursor.next();
                    n = (String) cursor.curr().get("name");
                    p = (String) cursor.curr().get("position");
                    c = (String) cursor.curr().get("caps");
                    g = (String) cursor.curr().get("goals for country");
                    cl = (String) cursor.curr().get("club");
                    l = (String) cursor.curr().get("league");
                    d = (String) cursor.curr().get("date of birth");

                    //cursor.next();
                    //System.out.println(t + fr + g + c);
                    //String lvl = (String) o.get("Level") ;
                    /*db.products.insert( { item: "card", qty: 15 } )*/
        %>
            
            <div class="card">
                <div class="card-header" id="<%=n+"one"%>" >
                    <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="<%="#"+n%>" aria-expanded="false" aria-controls="<%=n%>">
                            Name: <%=n%>
                        </button>
                    </h5>
                </div>

                <div id="<%=n%>" class="collapse show" aria-labelledby="<%=n+"one"%>" data-parent="#accordionExample">
                    <div class="card-body">
                        Position: <h6><%=p%></h6>
                        Caps: <h6><%=c%></h6>
                        Goals For Country: <h6><%=g%></h6>
                        Club: <h6><%=cl%></h6>
                        League: <h6><%=l%></h6>
                        Date Of Birth: <h6><%=d%></h6>
                    </div>
                </div>
            </div>
           

        <%

                }
            } finally {
                cursor.close();
            }
        %>    
        </div> 



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </body>
</html>
