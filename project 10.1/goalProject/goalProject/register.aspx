<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="masterProject.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
     <meta charset="utf-8" />
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
<style>
    body{
        background-image : url("images/rigeste.jpg") ;
        background-repeat :no-repeat ;
        background-size : cover ;
    }
    .cont{
           width: 500px;
  padding: 4% 0 0;
  margin: auto;
    }
    .reg{
                      width: 550px ; 
            background-image : url("images/opacity.jpg") ;
              display: flex;
            flex-direction :column ;
            justify-content :center ;
            height: 580px;
            align-items: center;
          
    }
    .txt {
        width: 380px;
            height: 45px ;
            background-color :snow ;
            color : orangered ;
            opacity : 0.7 ;
            border : solid 2px double ;
            font-weight : 400 ;
            padding : 0px 5px ;
            
    }
    .btn {
                width : 398px ;
                height : 48px ;
                background-color : orangered ; 
                color :aliceblue ; 
                border : none ;
                font-weight : 400 ;
                font-size : 24px ;
                 font-family : Bahnschrift ;
            }
    #Label1 {
        font-family:Bahnschrift;
    }
    #Label2{
        font-family:Bahnschrift;
        font-size:1.5rem;
        color:#f24726;
    }
      h1 {
                margin-bottom : 45PX ;
                color: orangered; 
                font-family : Bahnschrift ;
                font-size :27px ;
                word-spacing : 5px ;
            }
      #FileUpload1{
  margin-right: 20px;
  border: none;
  background-color:white ;
  padding: 11px 20px;
  color: black;
  cursor: pointer;
  width :354px ;
   height : 25px !important;
   opacity : 0.7 ;
  transition: background .2s ease-in-out;
   border : solid 2px double  ;
}

input[type=file]::file-selector-button:hover {
  background-color:orangered ;
}


  /* -----------------media-------------------*/
    @media (min-width: 1px) and (max-width: 481px) {
        .reg {
            width: 557px;
            background-image: none;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 1408px;
            align-items: center;
        }
    }

         
            /* -----------------media-------------------*/
    @media only screen and (max-width: 600px) {
        .reg {
            background-image: url(images/opacity.jpg);
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 682px;
            align-items: center;
            width: 570px;
            margin: 0;
            padding: 0;
            padding-top: 40%;
        }


        .txt {
            width: 442px;
            height: 82px;
            background-color: snow;
            color: orangered;
            opacity: 0.7;
            border: solid 2px double;
            font-weight: 400;
            padding: 0px 5px;
            font-size: 26px;
        }

        body {
            background-image: url(images/rigester.jpg);
            background-repeat: no-repeat;
            background-size: auto;
        }

           .btn {
            width: 457px;
            height: 83px;
            background-color: orangered;
            color: aliceblue;
            border: none;
            font-weight: 400;
            font-size: 24px;
            font-family: Bahnschrift;
        }

    }
                      
        
     
      
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cont">
            <div class="reg">
            
                <h1>REGISTERATION</h1>

            <asp:TextBox ID="TextBox1" runat="server" placeholder=" First Name " CssClass="txt"></asp:TextBox>
            <br />
             <asp:TextBox ID="TextBox4" runat="server" placeholder=" Last Name"  CssClass="txt"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder=" Email"  CssClass="txt"></asp:TextBox>
            <br />
           
            <asp:TextBox  ID="TextBox3" runat="server" TextMode="Password" placeholder=" Password"  CssClass="txt"></asp:TextBox>
             <br />
           
            <asp:TextBox  ID="TextBox6" runat="server" TextMode="Password" placeholder="Confirm Password"  CssClass="txt"></asp:TextBox>
            <br />
            <asp:TextBox  ID="TextBox5" runat="server"  placeholder=" Phone"  CssClass="txt"></asp:TextBox>

               
            <br /> 

            <asp:Button ID="btnUpload" Text="Register" runat="server" OnClick="UploadFile"   CssClass="btn"/>
                <br />
                 <a href="login.aspx" style="text-decoration:none; font-size:1.8rem;"><asp:Label  ID="Label2" runat="server" Text="sign in"></asp:Label></a>
            <br />
            <asp:Label ID="Label1" ForeColor="White"  runat="server" Font-Bold="False" Font-Size="Larger" BackColor="#FF6640" Font-Underline="False" ></asp:Label>
                </div>
        </div>
    </form>
</body>
</html>