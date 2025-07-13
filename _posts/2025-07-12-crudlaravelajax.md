---
title: crudlaravelajax
date: '2025-07-12 22:29:09'
comments: true
categories: [Programming]
tags: [web-development,desarrollo]
---

 
# Laravel CRUD utilizando AJAX y Blade

##  Step 1: Instalar Laravel 12

Ejecuta el siguiente comando en tu terminal o CMD:

```bash
laravel new laravel-12-crud-ajax
```

---

##  Step 2: Configurar la Base de Datos

Abre el archivo `.env` ubicado en la raíz del proyecto y modifica la configuración de la base de datos según tu entorno:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_12_crud_ajax
DB_USERNAME=root
DB_PASSWORD=root
```

---

##  Step 3: Crear el Modelo y Migración

Un **Modelo** representa una tabla de la base de datos, y una **Migración** permite controlar la estructura de esa tabla.

Ejecuta el siguiente comando:

```bash
php artisan make:model Project --migration
```

Edita el archivo de migración generado en `database/migrations/xxxx_xx_xx_create_projects_table.php` con el siguiente contenido:

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('projects');
    }
};
```

Luego, ejecuta la migración:

```bash
php artisan migrate
```

---

##  Step 4: Crear un Resource Controller

Un **Resource Controller** gestiona automáticamente las operaciones CRUD. Para crearlo, ejecuta:

```bash
php artisan make:controller ProjectController --api
```

Esto generará el archivo `app/Http/Controllers/ProjectController.php`. Ábrelo y agrega lo siguiente:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Project;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::all();
        return response()->json(['projects' => $projects]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'description' => 'required',
        ]);

        $project = new Project();
        $project->name = $request->name;
        $project->description = $request->description;
        $project->save();

        return response()->json(['status' => 'success']);
    }

    public function show(string $id)
    {
        $project = Project::find($id);
        return response()->json(['project' => $project]);
    }

    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|max:255',
            'description' => 'required',
        ]);

        $project = Project::find($id);
        $project->name = $request->name;
        $project->description = $request->description;
        $project->save();

        return response()->json(['status' => 'success']);
    }

    public function destroy(string $id)
    {
        Project::destroy($id);
        return response()->json(['status' => 'success']);
    }
}
```

---

##  Step 5: Registrar las Rutas

Agrega las siguientes rutas en `routes/web.php`:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;

Route::get('/', function () {
    return view('projects');
});

Route::apiResource('projects', ProjectController::class);
```

---

##  Step 6: Crear la Vista Blade

Crea un archivo llamado `projects.blade.php` en `resources/views/`.

Usaremos [Bootstrap](https://getbootstrap.com) para el diseño. A continuación, se incluye una versión inicial de la vista con la estructura HTML básica:

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Laravel Project Manager</title>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="app-url" content="{{ url('/') }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5 mb-3">Laravel Project Manager</h2>
        <div class="card">
            <div class="card-header">
                <button class="btn btn-outline-primary" onclick="createProject()">Create New Project</button>
            </div>
            <div class="card-body">
                <div id="alert-div"></div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th width="240px">Action</th>
                        </tr>
                    </thead>
                    <tbody id="projects-table-body"></tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal de creación/edición -->
    <div class="modal" tabindex="-1" id="form-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Project Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="error-div"></div>
                    <form>
                        <input type="hidden" id="update_id">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-outline-primary mt-3" id="save-project-btn">Save Project</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de vista -->
    <div class="modal" tabindex="-1" id="view-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Project Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <b>Name:</b>
                    <p id="name-info"></p>
                    <b>Description:</b>
                    <p id="description-info"></p>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        showAllProjects();

        function showAllProjects() {
            let url = $('meta[name=app-url]').attr("content") + "/projects";
            $.ajax({
                url: url,
                type: "GET",
                success: function(response) {
                    $("#projects-table-body").html("");
                    let projects = response.projects;
                    for (let i = 0; i < projects.length; i++) {
                        let showBtn = `<button class="btn btn-outline-info" onclick="showProject(${projects[i].id})">Show</button>`;
                        // Agrega aquí más botones si deseas (editar, eliminar, etc.)
                    }
                }
            });
        }
    </script>
</body>
</html>
```


