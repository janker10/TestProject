<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TestProject.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-decoration: underline;
            width: 516px;
        }
        .auto-style4 {
            color: #C0C0C0;
        }
        .auto-style5 {
            height: 22px;
        }
        .auto-style6 {
        }
        .auto-style9 {
            height: 23px;
        }
        .auto-style10 {
            width: 516px;
        }
        .auto-style11 {
            height: 23px;
            width: 516px;
        }
        .auto-style12 {
            height: 22px;
            width: 516px;
        }
        .auto-style13 {
            width: 516px;
            height: 26px;
        }
        .auto-style14 {
            height: 26px;
        }
        .auto-style15 {
            margin-bottom: 0px;
        }
        .auto-style16 {
            background-color: #C0C0C0;
        }
        .auto-style17 {
            width: 516px;
            background-color: #C0C0C0;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="/resources/demos/style.css"/>
    <script src="Scripts/jquery-3.6.0.min.js"></script>

    <script src="Scripts/jquery-3.6.0.js"></script>
    <script src="Scripts/jquery-ui-1.13.1.min.js"></script>
    <script src="Scripts/jquery.mask.js"></script>
    <script src="Scripts/inputmask/inputmask.min.js"></script>
    <script type='text/javascript'>
     $(document).ready(function () {
         $("#txtPhoneNumber").mask("(999) 999-9999");
         $('#txtHireDate').datepicker(
             {
                 dateFormat: 'mm/dd/yy',
                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:2100'
             });
     });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2"><strong>Web Form Test Project</strong></td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Employee information</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style11">ID</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtId" runat="server" Width="165px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">First Name</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" Width="167px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Last Name</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtLastName" runat="server" Width="168px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Phone <span class="auto-style4">(###) ###-####</span></td>
                <td>                            
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>                                  
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Zip Code</td>
                <td>
                    <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Hire Date</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtHireDate"  runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestProjectConn %>" SelectCommand="SELECT EmployeeID, EmployeeFirstName, EmployeeLastName, EmployeePhone, EmployeeZip, HireDate 
FROM Employees 
where 
(
(employeeLastName like '%'+ISNULL(@LastName,'')+'%')
and
(
(ISNULL(employeePhone,'') like '%'+ISNULL(@Phone,'')+'%') 
)

)
ORDER BY HireDate" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearchLastName" DefaultValue="%" Name="LastName" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtSearchPhone" DefaultValue="%" Name="Phone" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" OnClick="Button1_Click" Text="Add" style="height: 26px" Width="50px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style17">Last Name:
                    <asp:TextBox ID="txtSearchLastName" runat="server" CssClass="auto-style15" Width="102px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; Employee Phone:
                    <asp:TextBox ID="txtSearchPhone" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Button ID="btnSearch" runat="server" OnClick="Button1_Click1" Text="Search" Width="60px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Width="931px">
                        <Columns>
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" />
                            <asp:BoundField DataField="EmployeeFirstName" HeaderText="EmployeeFirstName" SortExpression="EmployeeFirstName" />
                            <asp:BoundField DataField="EmployeeLastName" HeaderText="EmployeeLastName" SortExpression="EmployeeLastName" />
                            <asp:BoundField DataField="EmployeePhone" HeaderText="EmployeePhone" SortExpression="EmployeePhone" />
                            <asp:BoundField DataField="EmployeeZip" HeaderText="EmployeeZip" SortExpression="EmployeeZip"  />
                            <asp:BoundField DataField="HireDate"  HeaderText="HireDate" SortExpression="HireDate" DataFormatString="{0:MM/dd/yyyy}" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="2">&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
