import VueRouter from 'vue-router';


let routes=[
{
	path:'/',
	component:require('./components/Home')
},
{
	path:'/KProfile',
	component:require('./components/AdministratorProfile')
},
{
	path:'/kProjectUpload',
	component:require('./components/UploadProject')
},
{
	path:'/KProjectEdit',
	component:require('./components/EditProject')
},
{
	path:'/KStandartImplementation',
	component:require('./components/procurement/StandartImplementation')
},
{
	path:'/KListUser',
	component:require('./components/UserList')
},

{
	path:'/KListUserLog',
	component:require('./components/UserLog')
},



/*  manager area  */
{
	path:'/AProjectListMA',
	component:require('./components/ListNewProjectMA')
},
{
	path:'/KProjectRejectMA',
	component:require('./components/ProjectRejectMA')
},
{
	path:'/AProjectRepairMA',
	component:require('./components/ListRepairMA')
},
{
	path:'/AProjectStatusMA',
	component:require('./components/ListStatusProjectMA')
},
{
	path:'/KProjectFinalMA',
	component:require('./components/ProjectFinalMA')
},
/*  manager area  */






/*general manager area */
{
	path:'/AProjectReviwerPMA',
	component:require('./components/AreaPM')
},
{
	path:'/AProjectRepairPMA',
	component:require('./components/ListRepairPM')
},
{
	path:'/AProjectStatus',
	component:require('./components/ListStatusProjectMA')
},

/*general manager area */



/* procurement */

{
	path:'/AProjectRepairSP',
	component:require('./components/ListRepairSP')
},

{
	path:'/AProjectSPPO',
	component:require('./components/ReviwerSPpo')
},

{
	path:'/AProjectStatusK',
	component:require('./components/ListStatusProjectAll')
},
{
	path:'/AProjectReviwerSP',
	component:require('./components/ReviwerSP')
},
{
	path:'/AProjectListK',
	component:require('./components/ListNewProjectAll')
},

{
	path:'/KProjectReject',
	component:require('./components/ProjectReject')
},
{
	path:'/KProjectFinal',
	component:require('./components/ProjectFinal')
},
{
	path:'/AProjectReviwerMP',
	component:require('./components/ReviwerMP')
},
/* procurement */



/* ubis */
{
	path:'/AProjectReviwerMU',
	component:require('./components/ReviwerMU')
},
{
	path:'/AProjectRepairMU',
	component:require('./components/ListRepairMU')
},
{
	path:'/AProjectReviwerGMU',
	component:require('./components/ReviwerGMU')
},
{
	path:'/AProjectRepairGMU',
	component:require('./components/ListRepairGMU')
},
{
	path:'/AProjectReviwerEGMU',
	component:require('./components/ReviwerEGMU')
},
{
	path:'/AProjectReviwerEGMUUNTAPPED',
	component:require('./components/ReviwerEGMUUNTAPPED')
},
{
	path:'/AProjectRepairEGMU',
	component:require('./components/ListRepairEGMU')
},
/* ubis */

/* director */
{
	path:'/AProjectReviwerBOD',
	component:require('./components/ReviwerBOD')
},

{
	path:'/AProjectReviwerBODUNTAPPED',
	component:require('./components/ReviwerBODUNTAPPED')
},

/* OFFICER PSC */
{
	path:'/AProjectReviwerNoPR',
	component:require('./components/ReviwerPSC')
},

/* OFFICER PSC */
{
	path:'/ProjectAVGB2S/:tahun',
	component:require('./components/AvgBarB2S')
},
{
	path:'/ProjectAVGUntp/:tahun',
	component:require('./components/AvgBarUNTP')
},
/* grafik */



/* //for employee url// */

{
	path:'*',
	component:require('./components/404')
},
{
	path:'/page-not-found',
	component:require('./components/404')
},
{
	path:'/server-error',
	component:require('./components/500')
}
];

export default new VueRouter({
	routes,
	linkActiveClass: 'active'
});