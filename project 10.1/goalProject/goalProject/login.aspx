<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="masterProject.login" %>

<!DOCTYPE html>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
    <style>
        body {
            background-image : url("images/logi.jpg") ;
            background-size : cover ;
             background-repeat: no-repeat;
             height : 420px !important;

        }
        .cont {
             /*width: 360px;
  padding: 8% 0 0;
  margin: auto;*/
             display : flex ;
             align-content : center ; 
             justify-content : center  ;
             align-items : center ;
             align-self  : center ;
             margin : 78px 0px ;
        }
   
        
        .email {
            width: 500px ; 
            background-image : url("images/opacity.png") ;
            display: flex;
            flex-direction :column ;
            justify-content :center ;
            height: 540px;
            align-items: center;
          
            
        }
        #TextBox2 {
          width: 329px;
    background-color: snow;
    color: black;
    opacity: 0.7;
    border: solid 2px double;
    height: 44px;
    font-weight: 500;
            
        }
            #TextBox1 {
            width: 329px;
    background-color: snow;
    color: black;
    opacity: 0.7;
    border: solid 2px double;
    height: 44px;
    font-weight: 500;
             
                      }
            .btn {
              width: 340px;
    background-color: orangered;
    color: white ;
    
    border: solid 2px double;
    height: 44px;
    font-weight: 500;
    font-size : 24px ;
            }
            h1 {
                margin-bottom : 70px ;
                color: orangered; 
                font-size :44px ;
                word-spacing : 5px ;
            }
            
            #Label1, #Label2{
                       font-weight : 700 ;
                       color :orangered ;
            }
        @media (min-width: 0px) and (max-width: 400px) {
            .email {
                width: 308px;
                height: 400px;
            }

            #TextBox1 {
                width: 264px;
            }

            #TextBox2 {
                width: 264px;
            }

            .btn {width: 271px;
            }
            body {
            background-image : url("imgStyle\\login2.jpg") ;
            background-size : cover ;
             background-repeat: no-repeat;
             height: 560px !important;

        }
        }
         @media (min-width: 481px) and (max-width: 768px) {
           
            body {
            background-image : url("imgStyle\\login2.jpg") ;
            background-size : cover ;
             background-repeat: no-repeat;
             height: 628px !important;

        }
        }
    </style>

   </head>
   <body>
    <form id="form1" runat="server">
        <div class="cont">
           
           
            <div class =" email">
                <h1>Sign In</h1>
            
            <asp:TextBox ID="TextBox1" runat="server" placeholder=" Email" ></asp:TextBox>
            <br />
            
          <asp:TextBox ID="TextBox2"  runat="server" placeholder=" Password" TextMode="Password"></asp:TextBox>
            <br />
                    <asp:Button  ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign In " CssClass=" btn"  /> 
                <br />
                <a id="registerId" runat="server" style="text-decoration:none; font-size:1.1rem; display:inline-block;" ><span style="text-decoration:none; color:black;">Don't have accaount ? </span><asp:Label ID="Label2" runat="server" Text="Register now"></asp:Label></a>
                <br />
                   <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
            </div>

        
<br />

         

    </form>
</body>
</html>