---
title: Programacion con Visual studio
date: '2024-10-19 11:17:32'
comments: true
categories: [IDEs and Editors]
tags:  [visual-studio, ide, desarrollo]
---



# Elementos o Componentes
 
## TAB CONTROL: 

este objeto contiene tab pages

ejemplo:
![Image](/assets/img/posts/Visual Studio/Pasted image 20241003102155.png)


# Miscelaneo 

## Estructura de archivos de un Formulario
Cuenta con 3 archivos:
- El formulario (la vista GUI)
- El codigo `.Designer`
- El codigo de GUI
![Image](/assets/img/posts/Visual Studio/Pasted image 20241003092524.png)

## Agregar un Data Source


https://learn.microsoft.com/en-us/visualstudio/data-tools/add-new-data-sources?view=vs-2022 


![Image](/assets/img/posts/Visual Studio/Pasted image 20241020122227.png)  

![Image](/assets/img/posts/Visual Studio/Pasted image 20241020122241.png) 


## Instalar extensiones


https://www.youtube.com/watch?v=qhcg4dy43xk 
![Image](/assets/img/posts/Visual Studio/instalar extensiones visual.png)


Install-Package Microsoft.ReportingServices.ReportViewerControl.WinForms 
https://www.youtube.com/watch?v=bOnCfq04TXQ 

  
### Extension para editar reportes rdlc
![Image](/assets/img/posts/Visual Studio/Pasted image 20241019210440.png)  

 
Crear reporte
https://www.youtube.com/watch?v=Yw09Gn9YxnY  

Asegúrate de que tienes instalado el paquete NuGet de `Microsoft.Data.SqlClient`. Puedes hacerlo desde el **Package Manager Console** con el siguiente comando:
 Install-Package Microsoft.Data.SqlClient

## Cadena de conexion


![Image](/assets/img/posts/Visual Studio/Pasted image 20241003093121.png)


 click derecho properties o Alt Enter, luego ve a Settings
 configura el scope a app, type , connection string
 `Data Source=DESKTOP-4IV5QRE\SQLEXPRESS;Initial Catalog=dbventas;Integrated Security=True`
![Image](/assets/img/posts/Visual Studio/Pasted image 20241020122920.png)

# Shortcuts programar con el IDE visual studio
 
-   AutoHide en el SolutionExplorery el pin en caso que lo vayas a usar
- coloca el mouse sobre el tab para ver el nombre completo del archivo
- click derecho : `Go To Definition`
- utiliza minusculas para los objetos y unicamente mayuscula cuando se trate de clases para mejorar la legibilidad


En Visual Studio, para colapsar el código de un método o una clase (es decir, quitar el desplegado), puedes usar el siguiente atajo de teclado:

**Ctrl + M, O** 

Este comando colapsará todos los métodos y clases en el archivo actual. Si solo deseas colapsar un método específico, coloca el cursor dentro de ese método y usa:

**Ctrl + M, M**

Esto colapsará solo el bloque en el que te encuentres.

Si deseas expandir nuevamente, puedes usar los mismos atajos:

- Para expandir todos: **Ctrl + M, O**
- Para expandir un método específico: **Ctrl + M, M** (de nuevo, mientras estés dentro del método).

Espero que te sirva, ¡feliz codificación!


# Conectar Visual studio con SQL SERVER

https://www.youtube.com/watch?v=rNgcVqbBgYA 
![Image](/assets/img/posts/Visual Studio/6.png) 

 
![Image](/assets/img/posts/Visual Studio/7.png)


# SNIPPETS DE CODIGO UTILES

## Abrir otro Formulario
1. Crea un objeto del formulario objetivo
2. utiliza el metodo `.show();`
3. utiliza `this.Hide();`


Ejemplo para abrir a partir del evento de un boton dentro de un formulario de c# : 
```c#
            RegisterForm regForm = new RegisterForm();
            regForm.Show();
            this.Hide();
```


## cargar imagen mediante boton
 
```c#
        private void btnCargar_Click(object sender, EventArgs e)
        {
            OpenFileDialog Dialog = new OpenFileDialog();
            Dialog.Filter = "Archivos de imagen (*.bmp, *.jpg, *.png)|*.bmp;*.jpg;*.png";
            DialogResult Resultado = Dialog.ShowDialog();

            if (Resultado == DialogResult.OK)
            {
                pxImagen.SizeMode = PictureBoxSizeMode.StretchImage;
                pxImagen.Image = Image.FromFile(Dialog.FileName);
                pxImagen.Image = Utilidades.CambiarTamanoImagen(pxImagen.Image, 50, 50);
            }
        }
```

## checkbox intercalar mostrar o esconder password

1. cambia nombreText con el nombre del objeto Text recuperado del toolbox en el campo Name
2. igualmente con el checkbox
	
```
nombreText = nombreCheckBox.Checkes ? '\0' : '*';
```


Ejemplo:
```c#
        private void login_showPass_CheckedChanged(object sender, EventArgs e)
        {
            login_password.PasswordChar = login_showPass.Checked ? '\0' : '*';
        }

```


## codigo login boton mediante evento 
	
```c#
private void login_btn_Click(object sender, EventArgs e) // Método que se ejecuta al hacer clic en el botón de login
{
    // Verifica si los campos de nombre de usuario o contraseña están vacíos
    if(login_username.Text == "" || login_password.Text == "")
    {
        // Muestra un mensaje de error si los campos no están completos
        MessageBox.Show("Por favor, complete los campos", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
    }
    else
    {
        // Verifica si la conexión a la base de datos está cerrada
        if(connect.State == ConnectionState.Closed)
        {
            try
            {
                // Intenta abrir la conexión a la base de datos
                connect.Open();

                // Consulta SQL para seleccionar el usuario con el nombre de usuario y contraseña proporcionados
                string selectData = "SELECT * FROM users WHERE username = @username " + "AND password = @password";

                // Crea un comando SQL con la consulta y la conexión
                using(SqlCommand cmd = new SqlCommand(selectData, connect))
                {
                    // Agrega los parámetros de nombre de usuario y contraseña al comando
                    cmd.Parameters.AddWithValue("@username", login_username.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", login_password.Text.Trim());

                    // Crea un adaptador para llenar un DataTable con los resultados de la consulta
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable table = new DataTable();
                    adapter.Fill(table); // Llena el DataTable con los resultados

                    // Verifica si se encontró al menos un registro
                    if(table.Rows.Count >= 1)
                    {
                        // Muestra un mensaje de éxito si el login es correcto
                        MessageBox.Show("Login successfully!", "Information Message", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Crea una nueva instancia del formulario principal
                        MainForm mForm = new MainForm();
                        mForm.Show(); // Muestra el formulario principal
                        this.Hide(); // Oculta el formulario de login
                    }
                    else
                    {
                        // Muestra un mensaje de error si el usuario o contraseña son incorrectos
                        MessageBox.Show("Usuario o Contrasenia incorrecta", "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                // Captura cualquier excepción y muestra un mensaje de error
                MessageBox.Show("Error: " + ex, "Error Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                // Asegura que la conexión se cierra independientemente de si hubo un error
                connect.Close();
            }
        }
    }
}

```

## condicional boton hacia combox box


Este es otro metodo que suele ser utilizado con frecuencia para interactuar mediante un boton hacia un combo box
```c#
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cbBuscar.Text.Equals("Razón Social"))
            {
                BuscarRazonSocial();
            }
            else if (cbBuscar.Text.Equals("Documento"))
            {
                BuscarNumDocumento();
            }
        }
```


## crear reporte


### Creacion
- Forms

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019212555.png)

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019212646.png) 


![Image](/assets/img/posts/Visual Studio/Pasted image 20241019215307.png) 





### Utilizacion

CTRL ALT X: abrir toolbox

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019211524.png) 


![Image](/assets/img/posts/Visual Studio/Pasted image 20241019211429.png) 


![Image](/assets/img/posts/Visual Studio/Pasted image 20241019211618.png) 

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019211636.png) 
![Image](/assets/img/posts/Visual Studio/Pasted image 20241019211830.png) 




### frm 

nota = reportViewer1 es el nombre del ReportViewer Object dentro del formulario
```c#
        private void FrmReporteTrabajador_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsPrincipal.spmostrar_trabajador' table. You can move, or remove it, as needed.
            try
            {
            // CONFIGURACION PAGINA
                var configuracionPagina = new PageSettings();
                configuracionPagina.Margins.Top = 0;
                configuracionPagina.Margins.Right = 0;
                configuracionPagina.Margins.Bottom = 0;
                configuracionPagina.Margins.Left = 0;
			//ASIGNACION DE LA CONFIGURACION DE PAGINA AL REPORT VIEWER
                reportViewer1.SetPageSettings(configuracionPagina);
                this.spmostrar_trabajadorTableAdapter.Fill(this.dsPrincipal.spmostrar_trabajador);

                this.reportViewer1.RefreshReport(); // creado automatico
            }
            // CATCH REUTILIZABLE
            catch (Exception ex)
            {
                this.reportViewer1.RefreshReport();

                MessageBox.Show(ex.Message);
            }
        }
```


## DataGridView




![Image](/assets/img/posts/Visual Studio/Pasted image 20241019180355.png)

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019180939.png)



![Image](/assets/img/posts/Visual Studio/Pasted image 20241019180957.png)


### Desactivar y Habilitar
Hacemos doble click, habiltamos asi un metodo.
- comparamos el parametro `e` con el metodo .ColumnIndex luego usamos
el objeto DataGridView, el cual se llama dataListado con el metodo .Columns y parametro Eliminar (el nombre de la var) junto a .Index 
luego utilizamos la logica dentro.
en este caso lo 
```c#
        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataListado.Columns["Eliminar"].Index)
            {
                DataGridViewCheckBoxCell ChkEliminar =
                (DataGridViewCheckBoxCell)dataListado.Rows[e.RowIndex].Cells["Eliminar"];

                ChkEliminar.Value = !Convert.ToBoolean(ChkEliminar.Value);
            }
        }
```



## datagridview carga de datos



Objeto DataGridView con el nombre dataListado
![Image](/assets/img/posts/Visual Studio/Pasted image 20241019201817.png)

dentor del codigo de FRM 
```c#
        private void Mostrar()
        {
            dataListado.DataSource = Ntrabajador.Mostrar();
        }
```

Dentro de Negocio :
- Metodo estatico que retorna sin necesidad de instanciar una clase u objeto
```c#
        public static DataTable Mostrar()
        {
            return new Dtrabajador().Mostrar();
        }
```

Dentro de datos:
- 
```c#
        public DataTable Mostrar()
        {
            //Cadena de conexion y DataTable (tabla)
            var resultadoTabla = new DataTable("trabajador"); // reutilizable, pero cambia el parametro
            var conexionSql = new SqlConnection(Utilidades.conexion); // reutilizable
            try
            {
            //aqui remplazalo con el store procedure
                var comandoSql = new SqlCommand("[spmostrar_trabajador]", conexionSql);
                comandoSql.CommandType = CommandType.StoredProcedure; // reutilizable
                SqlDataAdapter SqlDat = new SqlDataAdapter(comandoSql); // reutilizable
                SqlDat.Fill(resultadoTabla); // reutilizable
            }
            catch (Exception) {  resultadoTabla = null; } // reutilizable
            return resultadoTabla; // reutilizable
        }
```

## datagridview Events




![Image](/assets/img/posts/Visual Studio/Pasted image 20241019205938.png)

## doble click datagrid event para editar



todos los datos del datagrid son asignados a los controles de entrada.
- Txt : txt
- combobox : cb
- Fecha : dt

```c#
        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            txtIdCliente.Text = Convert.ToString(dataListado.CurrentRow.Cells["idcliente"].Value);
            txtNombre.Text = Convert.ToString(dataListado.CurrentRow.Cells["nombre"].Value);
            txtApellido.Text = Convert.ToString(dataListado.CurrentRow.Cells["apellidos"].Value);
            cbSexo.Text = Convert.ToString(dataListado.CurrentRow.Cells["sexo"].Value);
            dtFechaNacimineto.Value = Convert.ToDateTime(dataListado.CurrentRow.Cells["fecha_nacimiento"].Value);
            cbTipoDocumento.Text = Convert.ToString(dataListado.CurrentRow.Cells["tipo_documento"].Value);
            txtNumDocumento.Text = Convert.ToString(dataListado.CurrentRow.Cells["num_documento"].Value);
            txtDireccion.Text = Convert.ToString(dataListado.CurrentRow.Cells["direccion"].Value);
            mtxtTelefono.Text = Convert.ToString(dataListado.CurrentRow.Cells["telefono"].Value);
            txtEmail.Text = Convert.ToString(dataListado.CurrentRow.Cells["email"].Value);

            tabControl1.SelectTab(1);
        }
```

## Menu principal


https://www.youtube.com/watch?v=FbRvdjfjtkI  

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019232533.png) 

![Image](/assets/img/posts/Visual Studio/Pasted image 20241019233217.png) 



![Image](/assets/img/posts/Visual Studio/Pasted image 20241020102022.png) 



### Abrir formulario dentro de un mdi container
una vez habilitado, podras referenciarlo para que se habra o muestre un formulario dentro del contenedor que vendria a ser el formulario.
```c#
        private void testttToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            var formulario = new FrmREporteTest();
            formulario.MdiParent = this;
            formulario.Show();
        }
```


Como ordeno mi toolStrip si tengo los siguientes formularios:
- boleta,reserva,habitaciones,tipohabitaicones,cargos,empleados,sucursal,empresahotelera,clientes


## metodo habilitar y deshabilitar

 Al asignarle el valor a esa variable y hacer una referencia de esa misma en el codigo del formulario, puedes utilizar `.ReadOnly` y pasarle un valor booleano.
![Image](/assets/img/posts/Visual Studio/Pasted image 20241019174730.png) 
Controles
- txt : para TextBox
- cb : para ComboBox

Lo mismo, podria implementarse con un metodo, aplicando una logica de habilitar y deshabilitar en funcion de si puedes o no ingresar un valor mediante botones.
```c#
        //Habilitar los controles del formulario
        private void HabilitarControles(bool valor)
        {
            txtNombre.ReadOnly = !valor;
            txtUsuario.ReadOnly = !valor;
            txtPassword.ReadOnly = !valor;
            txtConfirmarPassword.ReadOnly = !valor;
            txtApellido.ReadOnly = !valor;
            txtNumDocumento.ReadOnly = !valor;
            txtDireccion.ReadOnly = !valor;
            mtxtTelefono.ReadOnly = !valor;
            txtEmail.ReadOnly = !valor;
            cbSexo.Enabled = valor;
            cbPerfilUsuario.Enabled = valor;

        }
```


## para probar conexion directamente desde el formulario


```c#
     private string connectionString = "Data Source=DESKTOP-4IV5QRE\\SQLEXPRESS;Initial Catalog=TRAVEL_EASY;Integrated Security=True;TrustServerCertificate=True";
     private void LoadData()
     {
         using (SqlConnection connection = new SqlConnection(connectionString))
         {
             using (SqlCommand command = new SqlCommand("sp_reporte_sucursal", connection))
             {
                 command.CommandType = CommandType.StoredProcedure;

                 try
                 {
                     connection.Open();
                     using (SqlDataReader reader = command.ExecuteReader())
                     {
                         DataTable dataTable = new DataTable();
                         dataTable.Load(reader);
                         dataListado.DataSource = dataTable;
                     }
                 }
                 catch (Exception ex)
                 {
                     MessageBox.Show("Error: " + ex.Message);
                 }
             }
         }
```



## regions


`#region <nombre>`

`#endregion`
- sirve para mejorar la legibilidad
![Image](/assets/img/posts/Visual Studio/Pasted image 20241003085900.png)

## sql connection c sharp


Claro, te explico cómo construir tu propia cadena de conexión para `SqlConnection`. La cadena de conexión proporciona la información necesaria para establecer una conexión con una base de datos. Vamos a desglosar cada parte de la cadena que has proporcionado:

```csharp
SqlConnection connect = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\WINDOWS 10\Documents\employee.mdf;Integrated Security=True;Connect Timeout=30");
```

### Componentes de la Cadena de Conexión

1. **Data Source**:
   - Especifica el servidor de la base de datos al que te estás conectando.
   - `(LocalDB)\MSSQLLocalDB` se refiere a una instancia de SQL Server LocalDB en tu máquina local. Si estás usando un servidor diferente, puede ser algo como `ServerName` o `IP_Address`.

2. **AttachDbFilename**:
   - Indica la ubicación del archivo de base de datos `.mdf` que deseas adjuntar. 
   - Aquí, `C:\Users\WINDOWS 10\Documents\employee.mdf` es la ruta completa del archivo de la base de datos. Asegúrate de que la ruta sea correcta y que el archivo exista.

3. **Integrated Security**:
   - Si se establece en `True`, la conexión utilizará la autenticación de Windows para conectarse a SQL Server.
   - Si deseas usar un nombre de usuario y una contraseña específicos, puedes cambiarlo a `False` y agregar `User ID=yourUsername;Password=yourPassword;` a la cadena.

4. **Connect Timeout**:
   - Especifica el tiempo, en segundos, que el sistema esperará para establecer una conexión antes de generar un error.
   - `30` es un valor común; puedes ajustarlo según tus necesidades.

### Ejemplo de Construcción

Supongamos que quieres construir una cadena de conexión para una base de datos en un servidor SQL Server remoto con autenticación SQL. Aquí tienes un ejemplo:

```csharp
string serverName = "myServer"; // Nombre del servidor o IP
string databaseName = "myDatabase"; // Nombre de la base de datos
string userId = "myUsername"; // Nombre de usuario de SQL
string password = "myPassword"; // Contraseña de SQL

string connectionString = $"Server={serverName};Database={databaseName};User Id={userId};Password={password};Connect Timeout=30;";
SqlConnection connect = new SqlConnection(connectionString);
```

### Consideraciones

- Asegúrate de que el servidor esté accesible desde tu aplicación y que los permisos de usuario sean correctos.
- Siempre valida las rutas y los nombres de las bases de datos.
- Ten en cuenta las configuraciones de seguridad y privilegios.

Si tienes preguntas adicionales o necesitas ayuda con un caso específico, ¡no dudes en preguntar!



# Version mejorada 

```c#
        private string serverName;
        private string databaseName;
        private string userId;
        private string password;
        private SqlConnection connect;

        public Form1()
        {
            InitializeComponent(); // Inicializa los componentes del formulario

            // Asigna valores a las variables
            serverName = "myServer"; // Nombre del servidor o IP
            databaseName = "myDatabase"; // Nombre de la base de datos
            userId = "myUsername"; // Nombre de usuario de SQL
            password = "myPassword"; // Contraseña de SQL

            // Construye la cadena de conexión
            string connectionString = $"Server={serverName};Database={databaseName};User Id={userId};Password={password};Connect Timeout=30;";
            connect = new SqlConnection(connectionString); // Crea la conexión
        }
```


---






# ✔ Estructura programacion en capas

Referencias : References>AddReference
Presentacion -> Negocio -> Datos  
(P -> N -> D )

La elección de por dónde empezar a codificar depende de varios factores, como el tipo de proyecto y tu experiencia. Aquí hay algunas consideraciones:

1. **Capa de Datos**: Si tu proyecto se basa en una base de datos compleja o si necesitas asegurar que los datos sean accesibles y estén bien estructurados, comenzar aquí puede ser útil. Esto te permite establecer las bases antes de construir las demás capas.

2. **Capa de Negocio**: Si tienes claro cómo funcionará la lógica de tu aplicación, empezar por la capa de negocio puede ser beneficioso. Esto te permite definir las reglas y procesos antes de preocuparte por cómo se presentarán los datos al usuario.

3. **Capa de Presentación**: Si estás trabajando en un prototipo o en una aplicación donde la experiencia del usuario es clave, empezar por la capa de presentación puede ser el camino a seguir. Esto te permite obtener feedback temprano y ajustar las otras capas según sea necesario.


 Los patrones de diseño y las arquitecturas de software son conceptos relacionados, pero no son lo mismo.

4. **Patrones de diseño**: Se refieren a soluciones reutilizables a problemas comunes que surgen durante el desarrollo del software, especialmente en el contexto del diseño de clases, objetos, y sus interacciones. Los patrones de diseño son más específicos y se aplican a nivel de detalles en la implementación del sistema, por ejemplo:
   - **Singleton**: Asegura que una clase tenga una única instancia.
   - **Factory Method**: Permite la creación de objetos sin especificar la clase exacta.
   - **Observer**: Define una dependencia de uno a muchos entre objetos, de modo que cuando un objeto cambie de estado, todos sus dependientes sean notificados.

5. **Arquitectura de software**: Se refiere a la estructura general de un sistema, es decir, cómo se organizan los componentes de alto nivel y cómo interactúan entre sí. En este nivel, se toman decisiones sobre la modularidad, escalabilidad, rendimiento, etc. Ejemplos incluyen:
   - **Arquitectura monolítica**: El sistema está compuesto por un solo bloque de código.
   - **Arquitectura de microservicios**: El sistema está dividido en pequeños servicios independientes que se comunican entre sí.
   - **Arquitectura en capas**: El sistema está dividido en capas (por ejemplo, presentación, lógica de negocio, acceso a datos).

### Relación entre patrones de diseño y arquitectura

Los patrones de diseño no son exclusivos de la arquitectura, pero **pueden** aplicarse dentro de una arquitectura para resolver problemas específicos de diseño a un nivel más bajo. Por ejemplo:
- En una **arquitectura de microservicios**, se podrían aplicar patrones de diseño como **Factory Method** para crear instancias de servicios.
- En una **arquitectura en capas**, un patrón como **Dependency Injection** puede ser usado para gestionar la creación y la inyección de dependencias en las distintas capas.

Así que, en resumen:
- **Los patrones de diseño** pueden ser aplicados dentro de una arquitectura para resolver problemas comunes de implementación.
- **Las arquitecturas** proveen la estructura general del sistema y son más abarcativas, mientras que los patrones de diseño se enfocan en soluciones más específicas.

Ambos conceptos son importantes y trabajan juntos para crear sistemas bien estructurados y mantenibles.







En general, muchos desarrolladores prefieren comenzar por la capa de negocio o de datos, ya que estas establecen el fundamento de la aplicación. Sin embargo, si tienes una idea clara de la interfaz de usuario, también es válido empezar desde ahí. ¡Lo más importante es que el enfoque que elijas se adapte a tus necesidades y estilo de trabajo!

1. Ya se lo siguiente
	1. crear formularios
	2. 3 capas
	3. datatable
	4. insercion de datos
	5. crear las 3 capas desde cero
	6. utilizar la clase utilidades para el connection string
	7. crear un formulario principal para abrir los demas formularios
2. Problemas actuales
	8. implementar de la mejor forma (codigo limpio) el proceso de venta de habitaciones
	9. para ello analizare el codigo de venta de productos de otro proyecto
	10. primero debo configurar los connection strings del proyecto que analizare
	11. insertare luego unos datos de prueba
	12. vere como maneja todo el proceso; simulando como se realizaria una venta
	13. extrapolare ese conocimiento a mi caso
	14. intentare automatizarlo con chatgpt construyendo un prompt, como lo hice con la capa de Datos

### Capa datos

- contiene el connection String en `app.config`
10 + 1  (Utilidaes: metodos o mensajes a reutilizar)
- nota : hay 10 tablas en la db


##### metodo mostrar
hace uso de un stored procedure creado en la DB, lo demas es propio del lenguaje
Este seria el codigo que se utilizaria despues de [[Connection string)

```c#
using System;
using System.Data.SqlClient;
namespace CapaDatos
{
    public class Utilidades
    {
        //cadena de conexion
        #region Cadena de Conexion
        public static String conexion = CapaDatos.Properties.Settings.Default.<nombre dado a la columna name en Settings.settings >;
        #endregion
```


##### metodo insertar
- tambien hace uso de stored procedures
- parametro que recibe : el mismo  `D+nombre_clase` ejemplo :  `Dproveedor`

```c#
				// 1. definicion de libreria sql
                SqlCommand COMANDO = new SqlCommand("[nombre_procedimiento_almacenado]", conexionSql);
                COMANDO.CommandType = CommandType.StoredProcedure; //ejecutar un stored proecdure

                // 2: Parametros para el COMANDO (StoreProcedure)
                var propiedad_1_clase = new SqlParameter("@idproveedor", SqlDbType.Int); // que parametro ? : "@nombre_paametro", datatype? : Int
                propiedad_1_clase.Direction = ParameterDirection.Output;
                COMANDO.Parameters.Add(propiedad_1_clase); // agregamos el parametro al 'sp' (stored proecdure)
            ... (repite la 3 lineas de arriba con los parametros restantes)
    
                //3 : Ejecucion del comando,  ejecutar-comando_si... == 1 ? sino_mostrar_mensaje
                respuesta = comandoSql.ExecuteNonQuery() == 1 ? "Ok" : "No se pudo insertar el registro";

```

Lista de data types para el parametro `SqlParameter`

```c#
1 SqlDbType.Int
2 SqlDbType.VarChar

//tambien puedes darle longitud como 3er parametro, ejemplo:
SqlParameter("@razon_social", SqlDbType.VarChar, 50);

```
Ejemplo completo:
```c#
        #region MetodoInsertar
        //Metodo Insertar
        public string Insertar(Dproveedor Proveedor)
        {
            string respuesta = "";
            var conexionSql = new SqlConnection(Utilidades.conexion);
            try
            {
                //Asignar y abrir StringConnection
                conexionSql.Open();
                //Establecer el comando SQL
                SqlCommand comandoSql = new SqlCommand("[spinsertar_proveedor]", conexionSql);
                comandoSql.CommandType = CommandType.StoredProcedure;
                /// ... completar los parametros (como se muestra arriba) ....
                //Ejecucion del comando
                respuesta = comandoSql.ExecuteNonQuery() == 1 ? "Ok" : "No se pudo insertar el registro";
            }
            catch (Exception ex) {  respuesta = ex.Message;  }
            finally {  if (conexionSql.State == ConnectionState.Open) conexionSql.Close(); }
            return respuesta;
        }
        #endregion
```

##### metodo editar
- hace uso de un sp dedicado a utilizar update
- la logica es lo mismo, lo unique cambia es:
`SqlCommand comandoSql = new SqlCommand("[nombre_sp_para_editar]", conexionSql);`
- luego insertas los valores necesarios y ejecuta el sp


### capa negocio
8 + 1 (NbackupBD)

- tiene definido los mismos metodos, que su clase correspondiente en la capa de datos
- hace uso de los metodos definidos en la capa de datos, reduciendo y reutiliazndo asi codigo, favoreciendo el clean code
- cada metodo es estatico, pero retorna el mismo tipo de dato que el correspondient a la capa de Datos
- data type para tablas:  `DataTable` 


### capa presentacion
- contiene el connection String en `app.config`
- compuesto por formularios
- 17 formularios  + 1 (Utilidaes: metodos o mensajes a reutilizar)




#   Trabajadores

## GUI

METODO LOAD
permite la actualizacion constante y esta incorporado en el mismo gui
```c#
        private void FrmTrabajador_Load(object sender, EventArgs e)
        {
            Mostrar();
            HabilitarBotones();
            HabilitarControles(false);
        }
```



Presione nuevo:
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173507.png)
Presione cancelar:
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173517.png)
Presione nuevo pero sin rellenar ningun campo, no salio ningun error:
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173552.png)
Puedo editar luego de elegir un registro del apartado Listado, luego de dar OK, se limpian todos los campos.
- txtIdTrabajador es el TextBox con el label Codigo a la izquierda, es el utilizado en la condicional, debido a que no puede ser escrito por el usuario, este solo puede ser rellenado mediante el doble click
El codigo es:
- Si NO es igual a "" tan solo se habilitan los botones
```c#
            if (!txtIdTrabajador.Text.Equals(""))
            {
                isEditar = true;
                HabilitarBotones();
                HabilitarControles(true);
            }
            else
            {
                Utilidades.MensajeError("Debe seleccionar primero un registro a editar desde la pestaña Listado");
            }
```
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173705.png)
Intentar edtiar sin haber elegido un registro, levanta un mensaje:
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173749.png) 



Al hacer doble click en un registro del apartado Listado, se rellenan los componentes :
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019173642.png)


Los campos obligatorios muestran un mensaje con un icono
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172942.png)
presiona Cancelar, habilita:
Nuevo y Editar
presiona Nuevo, habilita
Guardar y Cancelar
Presiona Guardar sin rellenar datos,
aparece un mensaje

Error, despues del ERror, me elimina todo lo escrito
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172316.png)

En el campo de la derecha se tiene que colocar un usuario nuevo 
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172559.png)


La contrasenia se almacena como un valor hash
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172714.png)

se actualiza en tiempo real a medida que escribo el valor
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172738.png)

Presionar el boton Eliminar, hace que se habilite una nueva columna y el boton eliminar
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172812.png)

Presionar el boton imprimir abre la siguiente ventana con los registros almacenados
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019172852.png)
## Codigo capa presentacion 
no confundas el archivo Designer con el codigo, el designer encapsula la creacion de la GUI con la GUI.





lo que comienza con txt son text fields
lo que comienza con cb son combo box

Por cada boton, checkbox hay una pieza de codigo.
- 7 botones
- 1 metodo limpiar

![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019174240.png) 

![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019174314.png) 


 ```c#
 using CapaNegocio;
using System;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class FrmTrabajador : Form
    {

        private bool isNuevo = false; //Para identificar si se agregara un trabajador
        private bool isEditar = false; //Para identificar si se Editara un trabajador


        public FrmTrabajador()
        {
            InitializeComponent();
            ttMensaje.SetToolTip(cbPerfilUsuario, "Seleccione el perfil que tendrá el usuario");

        }

        private void FrmTrabajador_Load(object sender, EventArgs e)
        {
            Mostrar();
            HabilitarBotones();
            HabilitarControles(false);
        }


        //Limpiar contoles
        private void Limpiar()
        {
            txtIdTrabajador.Clear();
            txtNombre.Clear();
            txtApellido.Clear();
            txtNumDocumento.Clear();
            txtDireccion.Clear();
            txtUsuario.Clear();
            txtPassword.Clear();
            txtConfirmarPassword.Clear();
            mtxtTelefono.Clear();
            txtEmail.Clear();
            txtNombre.Focus();

        }

        //Habilitar los controles del formulario
        private void HabilitarControles(bool valor)
        {
            txtNombre.ReadOnly = !valor;
            txtUsuario.ReadOnly = !valor;
            txtPassword.ReadOnly = !valor;
            txtConfirmarPassword.ReadOnly = !valor;
            txtApellido.ReadOnly = !valor;
            txtNumDocumento.ReadOnly = !valor;
            txtDireccion.ReadOnly = !valor;
            mtxtTelefono.ReadOnly = !valor;
            txtEmail.ReadOnly = !valor;
            cbSexo.Enabled = valor;
            cbPerfilUsuario.Enabled = valor;

        }


        //Habilitar los botones
        private void HabilitarBotones()
        {
            if (isEditar || isNuevo)
            {
                HabilitarControles(true);
                btnNuevo.Enabled = false;
                btnGuardar.Enabled = true;
                btnEditar.Enabled = false;
                btnCancelar.Enabled = true;
            }
            else
            {
                HabilitarControles(false);
                btnNuevo.Enabled = true;
                btnGuardar.Enabled = false;
                btnEditar.Enabled = true;
                btnCancelar.Enabled = false;
            }
        }

        //Ocultar Columnas
        private void OcultarColumnas()
        {
            dataListado.Columns[0].Visible = false;
            dataListado.Columns[1].Visible = false;
            dataListado.Columns[12].Visible = false;
        }
        //Metodo Mostrar Presentaciones
        private void Mostrar()
        {
            dataListado.DataSource = Ntrabajador.Mostrar();
            OcultarColumnas();
            lblTotal.Text = "Total Registros: " + dataListado.Rows.Count;
        }

        //Metodo BuscarNombre
        private void BuscarNombre()
        {
            dataListado.DataSource = Ntrabajador.BuscarNombre(txtBuscar.Text);
            OcultarColumnas();
            lblTotal.Text = "Total Registros: " + dataListado.Rows.Count;
        }

        //Metodo BuscarApellido
        private void BuscarApellido()
        {
            dataListado.DataSource = Ntrabajador.BuscarApellido(txtBuscar.Text);
            OcultarColumnas();
            lblTotal.Text = "Total Registros: " + dataListado.Rows.Count;
        }

        //Metodo BuscarNumDocumento
        private void BuscarNumDocumento()
        {
            dataListado.DataSource = Ntrabajador.BuscarNumDocumento(txtBuscar.Text);
            OcultarColumnas();
            lblTotal.Text = "Total Registros: " + dataListado.Rows.Count;
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cbBuscar.Text.Equals("Nombre"))
            {
                BuscarNombre();
            }
            else if (cbBuscar.Text.Equals("Apellido"))
            {
                BuscarApellido();
            }
            else if (cbBuscar.Text.Equals("Documento"))
            {
                BuscarNumDocumento();
            }
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (cbBuscar.Text.Equals("Nombre"))
            {
                BuscarNombre();
            }
            else if (cbBuscar.Text.Equals("Apellido"))
            {
                BuscarApellido();
            }
            else if (cbBuscar.Text.Equals("Documento"))
            {
                BuscarNumDocumento();
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult opcion =
                    MessageBox.Show("¿Realmente desea eliminar el/los trabajadores seleccionados?",
                    "Sistema de Ventas", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (opcion == DialogResult.Yes)
                {
                    int IdTrabajador = 0;
                    string respuesta = "";

                    foreach (DataGridViewRow fila in dataListado.Rows)
                    {
                        if (Convert.ToBoolean(fila.Cells[0].Value))
                        {
                            IdTrabajador = Convert.ToInt32(fila.Cells[1].Value);
                            respuesta = Ntrabajador.Eliminar(IdTrabajador);

                            if (respuesta.Equals("Ok"))
                            {
                                Utilidades.MensajeOK("El/los proveedor/es se eleminaron correctamente.");
                            }
                            else
                            {
                                Utilidades.MensajeError(respuesta);
                            }
                        }
                    }
                    Mostrar();
                    chkEliminar.Checked = false;

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void chkEliminar_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEliminar.Checked)
            {
                dataListado.Columns[0].Visible = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                dataListado.Columns[0].Visible = false;
                btnEliminar.Enabled = false;
            }
        }

        private void dataListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataListado.Columns["Eliminar"].Index)
            {
                DataGridViewCheckBoxCell ChkEliminar =
                (DataGridViewCheckBoxCell)dataListado.Rows[e.RowIndex].Cells["Eliminar"];

                ChkEliminar.Value = !Convert.ToBoolean(ChkEliminar.Value);
            }
        }

        private void dataListado_DoubleClick(object sender, EventArgs e)
        {
            txtIdTrabajador.Text = Convert.ToString(dataListado.CurrentRow.Cells["idtrabajador"].Value);
            txtNombre.Text = Convert.ToString(dataListado.CurrentRow.Cells["nombre"].Value);
            txtApellido.Text = Convert.ToString(dataListado.CurrentRow.Cells["apellidos"].Value);
            cbSexo.Text = Convert.ToString(dataListado.CurrentRow.Cells["sexo"].Value);
            dtFechaNacimineto.Value = Convert.ToDateTime(dataListado.CurrentRow.Cells["fecha_nac"].Value);
            txtNumDocumento.Text = Convert.ToString(dataListado.CurrentRow.Cells["num_documento"].Value);
            txtDireccion.Text = Convert.ToString(dataListado.CurrentRow.Cells["direccion"].Value);
            mtxtTelefono.Text = Convert.ToString(dataListado.CurrentRow.Cells["telefono"].Value);
            txtEmail.Text = Convert.ToString(dataListado.CurrentRow.Cells["email"].Value);
            cbPerfilUsuario.Text = Convert.ToString(dataListado.CurrentRow.Cells["acceso"].Value);
            txtUsuario.Text = Convert.ToString(dataListado.CurrentRow.Cells["usuario"].Value);
            txtPassword.Text = Convert.ToString(dataListado.CurrentRow.Cells["password"].Value);
            txtConfirmarPassword.Text = Convert.ToString(dataListado.CurrentRow.Cells["password"].Value);

            tabControl1.SelectTab(1);
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            isNuevo = true;
            isEditar = false;
            Limpiar();
            HabilitarBotones();
            HabilitarControles(true);
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string respuesta = "";

                if (txtNombre.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtNombre, "Ingrese el nombre del cliente");
                }
                else if (txtApellido.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtApellido, "Ingrese el apellido del cliente");

                }
                else if (txtNumDocumento.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtNumDocumento, "Ingrese el número de documento");

                }
                else if (txtDireccion.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtDireccion, "Ingrese la dirección del cliente");

                }
                else if (txtUsuario.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtUsuario, "Ingrese el usuario del cliente");

                }
                else if (txtPassword.Text == string.Empty)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtPassword, "Ingrese contraseña del usuario");

                }
                else if (txtConfirmarPassword.Text == string.Empty || txtConfirmarPassword.Text != txtPassword.Text)
                {
                    Utilidades.MensajeError("Falta ingresar algunos datos.");
                    errorIcono.SetError(txtConfirmarPassword, "Ingrese confirme la contraseña del usuario");
                }
                else
                {
                    if (isNuevo)
                    {
                        respuesta = Ntrabajador.Insertar(txtNombre.Text.Trim().ToUpper(), txtApellido.Text.Trim().ToUpper(), cbSexo.Text, dtFechaNacimineto.Value,
                             txtNumDocumento.Text, txtDireccion.Text, mtxtTelefono.Text, txtEmail.Text, cbPerfilUsuario.Text, txtUsuario.Text, txtPassword.Text);
                    }
                    else
                    {
                        respuesta = Ntrabajador.Editar(Convert.ToInt32(txtIdTrabajador.Text), txtNombre.Text.Trim().ToUpper(), txtApellido.Text.Trim().ToUpper(), cbSexo.Text, dtFechaNacimineto.Value,
                             txtNumDocumento.Text, txtDireccion.Text, mtxtTelefono.Text, txtEmail.Text, cbPerfilUsuario.Text, txtUsuario.Text, txtPassword.Text);
                    }

                    if (respuesta.Equals("Ok"))
                    {
                        if (isNuevo)
                        {
                            Utilidades.MensajeOK("El trabajador se agregó correctamente");
                        }
                        else
                        {
                            Utilidades.MensajeOK("La trabajador se editó correctamente");
                        }
                    }
                    else
                    {
                        Utilidades.MensajeError($"No se agrego el trabajador:\n {respuesta}");
                    }
                    isNuevo = false;
                    isEditar = false;
                    HabilitarBotones();
                    Limpiar();
                    Mostrar();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (!txtIdTrabajador.Text.Equals(""))
            {
                isEditar = true;
                HabilitarBotones();
                HabilitarControles(true);
            }
            else
            {
                Utilidades.MensajeError("Debe seleccionar primero un registro a editar desde la pestaña Listado");
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            isNuevo = false;
            isEditar = false;
            HabilitarControles(false);
            HabilitarBotones();
            Limpiar();
        }

        private void btnImprimir_Click(object sender, EventArgs e)
        {
            var formulario = new FrmReporteTrabajador();
            formulario.Show();
        }
    }
}

```
## Codigo capa Negocio

8 metodos
```c#
using CapaDatos;
using System;
using System.Data;

namespace CapaNegocio
{
    public class Ntrabajador
    {

        #region Insertar

        public static string Insertar(string nombre, string apellido, string sexo, DateTime fechaNacimiento,
            string numeroDocumento, string direccion, string telefono, string email, string acceso, string usuario, string password)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                Nombre = nombre,
                Apellido = apellido,
                Sexo = sexo,
                FechaNacimiento = fechaNacimiento,
                NumeroDocumento = numeroDocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                Acceso = acceso,
                Usuario = usuario,
                Password = password
            };

            return Trabajador.Insertar(Trabajador);
        }
        #endregion


        #region Editar
        public static string Editar(int idTrabajador, string nombre, string apellido, string sexo, DateTime fechaNacimiento,
            string numeroDocumento, string direccion, string telefono, string email, string acceso, string usuario, string password)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                IdTrabajador = idTrabajador,
                Nombre = nombre,
                Apellido = apellido,
                Sexo = sexo,
                FechaNacimiento = fechaNacimiento,
                NumeroDocumento = numeroDocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                Acceso = acceso,
                Usuario = usuario,
                Password = password
            };

            return Trabajador.Editar(Trabajador);
        }
        #endregion


        #region Eliminar
        public static string Eliminar(int idTrabajador)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                IdTrabajador = idTrabajador
            };

            return Trabajador.Eliminar(Trabajador);
        }
        #endregion


        #region Mostrar
        public static DataTable Mostrar()
        {
            return new Dtrabajador().Mostrar();
        }
        #endregion


        #region BuscarNombre
        public static DataTable BuscarNombre(string textoBuscar)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                TextoBuscar = textoBuscar
            };

            return Trabajador.BuscarNombre(Trabajador);
        }
        #endregion


        #region BuscarNumDocumento
        public static DataTable BuscarNumDocumento(string textoBuscar)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                TextoBuscar = textoBuscar
            };
            return Trabajador.BuscarNumDocumento(Trabajador);
        }
        #endregion


        #region BuscarApellido
        public static DataTable BuscarApellido(string textoBuscar)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                TextoBuscar = textoBuscar
            };

            return Trabajador.BuscarApellido(Trabajador);
        }
        #endregion


        #region Login
        public static DataTable Login(string usuario, string password)
        {
            Dtrabajador Trabajador = new Dtrabajador()
            {
                Usuario = usuario,
                Password = password

            };

            return Trabajador.Login(Trabajador);
        }
        #endregion
    }
}

```


# Logica Botones

```c#
        private bool isNuevo = false; //Para identificar si se agregara un trabajador
        private bool isEditar = false; //Para identificar si se Editara un trabajador

        private void HabilitarControles(bool valor)
        {
 
            txtNombre.ReadOnly = !valor; //negacion ~ 
            txtUsuario.ReadOnly = !valor;
            txtPassword.ReadOnly = !valor;
            txtConfirmarPassword.ReadOnly = !valor;
            txtApellido.ReadOnly = !valor;
            txtNumDocumento.ReadOnly = !valor;
            txtDireccion.ReadOnly = !valor;
            mtxtTelefono.ReadOnly = !valor;
            txtEmail.ReadOnly = !valor;
            cbSexo.Enabled = valor; // FALSE / TRUE
            cbPerfilUsuario.Enabled = valor; // FALSE / TRUE

        }

        //Habilitar los botones SIN PARAMETROS, CON VAR GLOBAL
        private void HabilitarBotones()
        {
            // isEditar
            // Editar : True 
            // Cancelar : False
            // Nuevo : False
            // Guardar : lo actualiza al final en false, pero no lo usa en su funcionamiento
            
            //isNuevo
            // Guardar : 
            // Editar : False

            if (isEditar || isNuevo)
            {
                HabilitarControles(true);
                btnNuevo.Enabled = false;
                btnGuardar.Enabled = true;
                btnEditar.Enabled = false;
                btnCancelar.Enabled = true;
            }
            else
            {
            // btnCancelar false false
            // 
                HabilitarControles(false);
                btnNuevo.Enabled = true;
                btnGuardar.Enabled = false;
                btnEditar.Enabled = true;
                btnCancelar.Enabled = false;
            }
        }
```

- Para controles:
	- txt : `.ReadOnly` 
	- combo box : `.Enabled` 
- Para Botones
	- `.Enabled` 


# FORMULARIOS REPORTES
![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241019182212.png)


# Clientes


## Presentacion


El siguiente codigo iria en el boton guardar
- txt  .Text.Trim().ToUpper
- fecha .Value
- combo box .Text
De esta manera se lo pasamos a la capa de negocio
```c#
respuesta = Ncliente.Insertar(txtNombre.Text.Trim().ToUpper(), txtApellido.Text.Trim().ToUpper(), cbSexo.Text, dtFechaNacimineto.Value,cbTipoDocumento.Text, txtNumDocumento.Text, txtDireccion.Text, mtxtTelefono.Text, txtEmail.Text);
```

## Negocio
Contiene metodos estaticos 


## Datos

Contiene las propiedades en forma de variables junto a metodos DataTable
- int
- string
- DateTime
Definicion corta de get  y set : `public string Email { get; set; }`
Asi mismo, los metodos de insercion, eliminacion, etc utiliazn codigo del storedprocecudre.
Se utiliza un script Utilidades el cual tiene 56 referencias en todo el proyecto. en su mayoria para obtener la conexion
Utilidades contiene
- conexion string : SQL
- generacion de salt y hash y validacion de este ultimo. : ENCRIPTACION 
	- utiliazdo en el metodo insertar trabajador `parPassword.Value = Utilidades.GenerarHash(Trabajador.Password, Utilidades.GenerarSalt()); `  
- metodo para realizar un backup utilizando un stored procedure : STORED PROCEDURE BACKUP
importa lo siguiente 
```c#
using DevOne.Security.Cryptography.BCrypt;
using System;
using System.Data.SqlClient;
```
 

# Proveedor


## Datos


# UTILIDADES
La capa de negocio no tiene una clase publica  Utilidades
## Utilidades en la capa de datos

![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241020110130.png) 


## utilidades en la capa de presentacion

![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241020111648.png)

# Analisis del funcionamiento de la logica de negocio
- Son 10 las clases que interactuan con el fin de cumplir esto

![Image](/assets/img/posts/Visual Studio/estructuraProgramacion3Capas/Pasted image 20241020180453.png) 

 


# PROMPTS CHATGPT

### Prompts capa datos

CREAR PROPIEDADES CON GETTERS Y SETTERS PARTIENDO DE LA DEFINICION DE LA TABLA : 
- necesitas: pasarle la definicion de la tabla
```c#
creame propiedades siguiente este formato #region Propiedades 

public int IdTrabajador { get; set; } public string Nombre { get; set; } public string Apellido { get; set; } public string Sexo { get; set; } public DateTime FechaNacimiento { get; set; } public string NumeroDocumento { get; set; } public string Direccion { get; set; } public string Telefono { get; set; } public string Email { get; set; } public string Acceso { get; set; } public string Usuario { get; set; } public string Password { get; set; } public string TextoBuscar { get; set; } #endregion

peroo para lo siguiente:  

CREATE TABLE Hotel.Clientes ( ClientesCodigo NCHAR(8) , ClientePaterno nvarchar(50) not null , ClienteMaterno nvarchar(50) not null , ClienteNombres nvarchar(50) not null , ClienteDireccion NVARCHAR(120) NOT NULL , ClienteDNI NCHAR(8) DEFAULT '' , ClienteTelefono NVARCHAR(50) , ClienteTipoDocumento NVARCHAR(50) , ClienteNumeroDocumento NVARCHAR(20) , ClienteEmail NVARCHAR(50) , ClienteEstado NCHAR(1) DEFAULT 'A' , CONSTRAINT ClientesPK PRIMARY KEY (ClientesCodigo) , CONSTRAINT ClientesEstadoCK CHECK (ClienteEstado = 'A' OR ClienteEstado = 'E') )
```


Generar constructor
```c#
ahora dame el constructor siguiendo este formato :

#region Contructores public Dtrabajador() { } public Dtrabajador(int idTabajador, string nombre, string apellido, string sexo, DateTime fechaNacimiento, string numeroDocumento, string direccion, string telefono, string email, string acceso, string usuario, string password, string textoBuscar) { IdTrabajador = idTabajador; Nombre = nombre; Apellido = apellido; Sexo = sexo; FechaNacimiento = fechaNacimiento; NumeroDocumento = numeroDocumento; Direccion = direccion; Telefono = telefono; Email = email; Acceso = acceso; Usuario = usuario; Password = password; TextoBuscar = textoBuscar; } #endregion 


pero con los siguientes atributos : public int IdTrabajador { get; set; } public string Nombre { get; set; } public string Apellido { get; set; } public string Sexo { get; set; } public DateTime FechaNacimiento { get; set; } public string NumeroDocumento { get; set; } public string Direccion { get; set; } public string Telefono { get; set; } public string Email { get; set; } public string Acceso { get; set; } public string Usuario { get; set; } public string Password { get; set; } public string TextoBuscar { get; set; }
```

Crear stored procedure partiendo de definicion de tabla y nombre del sp deseado

```C#
crea un stored procedure llamado spClientesConsultar para la siguiente tabla

CREATE TABLE Hotel.Clientes ( ClientesCodigo NCHAR(8) , ClientePaterno nvarchar(50) not null , ClienteMaterno nvarchar(50) not null , ClienteNombres nvarchar(50) not null , ClienteDireccion NVARCHAR(120) NOT NULL , ClienteDNI NCHAR(8) DEFAULT '' , ClienteTelefono NVARCHAR(50) , ClienteTipoDocumento NVARCHAR(50) , ClienteNumeroDocumento NVARCHAR(20) , ClienteEmail NVARCHAR(50) , ClienteEstado NCHAR(1) DEFAULT 'A' , CONSTRAINT ClientesPK PRIMARY KEY (ClientesCodigo) , CONSTRAINT ClientesEstadoCK CHECK (ClienteEstado = 'A' OR ClienteEstado = 'E') ) 
```


Definicion de variables partiendo de las del procedimiento almacenado

```c#
                Realiza para cada uno de  estas variables de mi procedimiento
                almacenado @ClienteMaterno NVARCHAR(50),
@ClienteNombres NVARCHAR(50),
@ClienteDireccion NVARCHAR(120),
@ClienteDNI NCHAR(8) = '',
@ClienteTelefono NVARCHAR(50) = NULL,
@ClienteTipoDocumento NVARCHAR(50) = NULL,
@ClienteNumeroDocumento NVARCHAR(20) = NULL,
@ClienteEmail NVARCHAR(50) = NULL,
@ClienteEstado NCHAR(1) = 'A' 

                las siguientes 3 lineas:

                var parIDCliente = new SqlParameter("@iDCliente", SqlDbType.Int);
                parIDCliente.Direction = ParameterDirection.Output;
                comandoSql.Parameters.Add(parIDCliente);
``` 


Generar parametros para el metodo insertar utilizando el stored procedure




### prompts capa Negocio

Creacion de metodo insertar utilizando propiedades de la capa  Datos

```c#
     
          Crea el metodo statico string con los siguientes parametros:
      
        public int ClientesDNI { get; set; }
        public string ClientesNombre { get; set; }
        public string ClientesApellido { get; set; }
        public string ClientesCelular { get; set; }
        public char ClientesEstado { get; set; }

          
          que cree un objeto DClientes llamado objClientes con los parametros de la siguiente forma:
          
          Toma como referencia esto: 
               public static string Insertar(string nombre, string apellido, string sexo, DateTime fechaNacimiento,
            string numeroDocumento, string direccion, string telefono, string email, string acceso, string usuario, string password)
        {
            Dtrabajador objTrabajador = new Dtrabajador()
            {
                Nombre = nombre,
                Apellido = apellido,
                Sexo = sexo,
                FechaNacimiento = fechaNacimiento,
                NumeroDocumento = numeroDocumento,
                Direccion = direccion,
                Telefono = telefono,
                Email = email,
                Acceso = acceso,
                Usuario = usuario,
                Password = password
            };

            return objTrabajador.Insertar(objTrabajador);
        }

```



### prompts capa  Presentacion


```c#

ahora utilizando el metodo anterior, adapta estos controles
        
			txtClientesDNI.Clear();
            txtClientesApellido.Clear();
            txtClientesNombre.Clear();
            txtClientesCelular.Clear();


Para llamarlo de esta manera, es decir, dame la siguiente linea adaptada:
    respuesta = NClientes.Insertar(txtClientesDNI.Text.Trim().ToUpper(), txtClientesApellido.Text.Trim().ToUpper(), cbSexo.Text, dtFechaNacimineto.Value,
        cbTipoDocumento.Text, txtClientesNombre.Text, txtClientesCelular.Text, mtxtTelefono.Text, txtEmail.Text);
        
```


 