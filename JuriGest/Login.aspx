<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="JuriGest.Login" %>

<!DOCTYPE html>
<html lang="ar">

<head dir="rtl">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>منظومة التصرف في ملفات الإئتمان والتصفية - الدخول</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <form runat="server">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                                <img src="img/Accueil1.png" height="450px" width="500px" />
                            </div>
                            
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">مرحبا في منظومة التصرف في ملفات الإئتمان والتصفية</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                    
                                <asp:TextBox ID="txtLogin" class="form-control form-control-user text-right" aria-describedby="emailHelp"
                                                placeholder="المعرف..." runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
       
                    <asp:TextBox ID="txtPass" type="password" class="form-control form-control-user text-right" placeholder="كلمة السر" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                
                                            </div>
                                        </div>
                                     
                                <asp:Button class="btn btn-primary btn-user btn-block"   ID="btnOK" runat="server" Text="تثبيت" />
                                        <hr>
                                       
                                       
                                    </form>
                                    <hr>
                                    
                                </div>
                            </div>
                        </div>
                    </form>

                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>