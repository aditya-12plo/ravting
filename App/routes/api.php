<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::group(['prefix' => 'clients'], function () {
    Route::post('loginapi', 'TestController@login');
    Route::post('test', 'TestController@test');
    Route::get('logoutapi', 'TestController@logout');
});



Route::post('/login', 'WebService\LoginController@LoginUser')->middleware('cors','clientAuth');
Route::post('/auto-login', 'WebService\LoginController@AutoLoginUser')->middleware('cors', 'clientAuth');
Route::post('/logout', 'WebService\LoginController@UserLogout')->middleware('cors', 'checkAuth');
Route::post('/list-tenant', 'WebService\LoginController@ListTenant')->middleware('cors', 'checkAuth');
Route::post('/update-ids', 'WebService\LoginController@updatePlayerIDS')->middleware('cors', 'checkAuth');
Route::post('/update-name', 'WebService\LoginController@ProfileChangeName')->middleware('cors', 'checkAuth');
Route::post('/update-pass', 'WebService\LoginController@ChangePassword')->middleware('cors', 'checkAuth');

Route::post('/notif', 'WebService\LoginController@sendToAll')->middleware('cors');
Route::post('/getting-notif', 'WebService\NotificationController@GettingListNotification')->middleware('cors', 'checkAuth');

//for tenant
Route::post('/tenant-list-project', 'WebService\ProjectController@ListProjectTenant')->middleware('cors', 'checkAuth');
Route::post('/tenant-view-project', 'WebService\ProjectController@ViewProjectTenant')->middleware('cors', 'checkAuth');
Route::post('/tenant-upload-file', 'WebService\ProjectController@UploadFilePDF')->middleware('cors');
Route::post('/tenant-submit-project', 'WebService\ProjectController@TenantSubmitProject')->middleware('cors');
Route::post('/tenant-proses-project', 'WebService\ProsesController@ListProsesTenant')->middleware('cors', 'checkAuth');

//for karyawan 
Route::post('/karyawan-list-project', 'WebService\ProjectController@ListProjectKaryawan')->middleware('cors', 'checkAuth');
Route::post('/karyawan-list-regional', 'WebService\ProjectController@ListProjectByRegional')->middleware('cors', 'checkAuth');
Route::post('/karyawan-add-project', 'WebService\ProjectController@AddProject')->middleware('cors','checkAuth');
Route::post('/karyawan-update-project', 'WebService\ProjectController@UpdateProject')->middleware('cors', 'checkAuth');
Route::post('/karyawan-delete-project', 'WebService\ProjectController@DeleteProject')->middleware('cors', 'checkAuth');

Route::post('/karyawan-area-reviewer', 'WebService\ProsesController@ListAreaReviewer')->middleware('cors', 'checkAuth');
Route::post('/karyawan-area-waspang-approve', 'WebService\ProsesController@ApprovalAreaWaspang')->middleware('cors');
Route::post('/karyawan-area-project-manager', 'WebService\ProsesController@ListProjectManagerArea')->middleware('cors');
Route::post('/karyawan-area-pm-approve', 'WebService\ProsesController@ApprovalAreaPM')->middleware('cors', 'checkAuth');
Route::post('/karyawan-area-manager', 'WebService\ProsesController@ListManagerArea')->middleware('cors', 'checkAuth');
Route::post('/karyawan-area-manager-approve', 'WebService\ProsesController@ApprovalAreaManager')->middleware('cors', 'checkAuth');

Route::post('/karyawan-ubis-reviewer', 'WebService\UbisController@UbisListReview')->middleware('cors', 'checkAuth');
Route::post('/karyawan-ubis-waspang-approve', 'WebService\UbisController@ApprovalUbisWaspang')->middleware('cors', 'checkAuth');
Route::post('/karyawan-ubis-general-manager', 'WebService\UbisController@UbisListGM')->middleware('cors', 'checkAuth');
Route::post('/karyawan-ubis-gm-approve', 'WebService\UbisController@ApprovalUbisGM')->middleware('cors', 'checkAuth');
Route::post('/karyawan-ubis-egm-approve', 'WebService\UbisController@ApprovalUbisEGM')->middleware('cors', 'checkAuth');
Route::post('/karyawan-bod-approve', 'WebService\UbisController@ApprovalBOD')->middleware('cors', 'checkAuth');

Route::post('/karyawan-pro-reviewer-approve', 'WebService\ProcurementController@ApprovalProcurementReviewer')->middleware('cors', 'checkAuth');
Route::post('/karyawan-pro-appr-approve', 'WebService\ProcurementController@ApprovalProcurementAppr')->middleware('cors', 'checkAuth');

Route::post('/list-biaya', 'WebService\BiayaController@ListBiayaStandard')->middleware('cors', 'checkAuth');
Route::post('/insert-biaya', 'WebService\BiayaController@InsertBiayaStandard')->middleware('cors');
Route::post('/update-biaya', 'WebService\BiayaController@UpdateBiayaStandard')->middleware('cors');
Route::post('/delete-biaya', 'WebService\BiayaController@DeleteBiayaStandard')->middleware('cors', 'checkAuth');

Route::post('/getting-project', 'WebService\ProjectController@GettingListProject')->middleware('cors');
Route::post('/cluster-tower', 'WebService\ProjectController@GettingTowerClusterByRegional')->middleware('cors');
Route::post('/approve-proses', 'WebService\ApprovalController@ApprovalProses')->middleware('cors');

Route::post('/dashboard-index', 'WebService\Dashboard@index')->middleware('cors');
Route::post('/dashboard-simulasi', 'WebService\Dashboard@SimulasiCapex')->middleware('cors');
Route::post('/dashboard-tahun', 'WebService\Dashboard@SelectTahunInfra')->middleware('cors');
Route::post('/dashboard-average', 'WebService\Dashboard@GettingAverage')->middleware('cors');

Route::get('/hanya-test', 'WebService\ApprovalController@TestCtrl');

