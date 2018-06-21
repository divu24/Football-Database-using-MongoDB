

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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <title>Euro 2012</title>
    </head>
    <body>
        <h1>EURO 2012</h1>
        <%!
            MongoClient mongoClient = new MongoClient();
            DB db = mongoClient.getDB("football");
            DBCollection coll = db.getCollection("teams");
            DBCursor cursor;
            String t, fr, g, c;
        %>
        <div class="row">
            <div class="col-xl-6">
        <form action="teams.jsp" method="post">
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="France" value="France" checked>
                <label class="form-check-label" for="France">
                    France
                </label>
            </div> 
            
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="England" value="England" >
                <label class="form-check-label" for="England">
                    England
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Russia" value="Russia" >
                <label class="form-check-label" for="Russia">
                    Russia
                </label>
            </div>
            
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Germany" value="Germany" >
                <label class="form-check-label" for="Germany">
                    Germany
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id=Ireland value="Ireland" >
                <label class="form-check-label" for="Sweden">
                    Ireland
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Poland" value="Poland" >
                <label class="form-check-label" for="Poland">
                    Poland
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Ukraine" value="Ukraine" >
                <label class="form-check-label" for="Ukraine">
                    Ukraine
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Croatia" value="Croatia" >
                <label class="form-check-label" for="Croatia">
                    Croatia
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Czech Republic" value="Czech_Republic" >
                <label class="form-check-label" for="Czech Republic">
                    Czech Republic
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Spain" value="Spain" >
                <label class="form-check-label" for="Spain">
                    Spain
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Netherlands" value="Netherlands" >
                <label class="form-check-label" for="Netherlands">
                    Netherlands
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Denmark" value="Denmark" >
                <label class="form-check-label" for="Denmark">
                    Denmark
                </label>
            </div>
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Italy" value="Italy" >
                <label class="form-check-label" for="Italy">
                    Italy
                </label>
            </div>
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Sweden" value="Sweden" >
                <label class="form-check-label" for="Sweden">
                    Sweden
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Greece" value="Greece" >
                <label class="form-check-label" for="Greece">
                    Greece
                </label>
            </div>
            
            
            <div class="form-check">
                <input class="form-check-input" type="radio" name="teams" id="Portugal" value="Portugal" >
                <label class="form-check-label" for="Portugal">
                    Portugal
                </label>
            </div>
            <button type="submit" class="btn btn-primary">Info</button>
        </form>
            </div>
            <div class="col-xl-6">   
        <%
            String team = request.getParameter("teams");
            session.setAttribute("teams", team);
            System.out.println(team);

        %>
        <%            
            BasicDBObject fieldObject = new BasicDBObject();
            BasicDBObject searchObject = new BasicDBObject();
            searchObject.put("Team", team);
            fieldObject.put("Team", 1);
            fieldObject.put("FIFA ranking", 1);
            fieldObject.put("Group", 1);
            fieldObject.put("Coach", 1);
            fieldObject.put("_id", 0);
            cursor = coll.find(searchObject, fieldObject);

            try {
                while (cursor.hasNext()) {
                    System.out.println(cursor.next());
                        //DBObject o=cursor.next();
                    t = (String) cursor.curr().get("Team");
                    fr = (String) cursor.curr().get("FIFA ranking");
                    g = (String) cursor.curr().get("Group");
                    c = (String) cursor.curr().get("Coach");
                    //System.out.println(t+fr+g+c);
                    //String lvl = (String) o.get("Level") ;
                    /*db.Employee.update(
{"Employeeid" : 1},
{$set: { "EmployeeName" : "NewMartin"}});*/
                }
            } finally {
                cursor.close();
            }
        %>    
        TEAM:
        <div class="alert alert-success" role="alert">
               <%=t%>
        </div>
        FIFA Ranking:
        <div class="alert alert-success" role="alert">
              <%=fr%>
        </div>
        Group:
        <div class="alert alert-success" role="alert">
             <%=g%>
        </div>
        Coach:
        <div class="alert alert-success" role="alert">
             <%=c%>
        </div>
        <div class="row">
        <div class="col-xl-6">
            <form action="player_info.jsp">
            <button type="submit" class="btn btn-outline-secondary">Player Info</button>
            </form>
        </div>
        <div class="col-xl-6">
            <form action="team_stats.jsp">
            <button type="submit" class="btn btn-outline-secondary">Team Statistics</button>
            </form>
        </div>
            </div>
        </div>
        
        </div>
        
        
            
            
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </body>
</html>
