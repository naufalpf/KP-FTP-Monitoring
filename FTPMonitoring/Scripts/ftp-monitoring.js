$(document).ready(function () {
    for (var i = 1; i <= 3; i++) {
        loadMonitoringLogs(i);
    }
    /*setInterval("autoRefreshMonitoringLogs()", 10000);*/
});

function autoRefreshMonitoringLogs() {
    initMonitoringLogs();
    for (var i = 1; i <= 3; i++) {
        loadMonitoringLogs(i);
    }
}

function initMonitoringLogs() {
    $("#BEIMonitoringLogContainer").html("");
    $("#KPEIMonitoringLogContainer").html("");
    $("#KSEIMonitoringLogContainer").html("");
}

function loadMonitoringLogs(id) {
    var sroId = parseInt(id);
    /*var inpObj = { sroId: sroId };
    var inpParam = JSON.stringify(inpObj);*/
    /*            console.log(inpParam);*/
    $.ajax({
        url: "/FtpMonitor/ListMonitoringLog?sroId=" + sroId,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "JSON",
        success: function (result) {
            renderMonitoringLogView(sroId, result);
        }
    });
}

function loadMonitoringLogDetail(id) {
    var monitoringLogId = parseInt(id);
    return $.ajax({
        url: "/FtpMonitor/GetMonitoringLogDetail?monitoringLogId=" + monitoringLogId,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "JSON",
        async: false,
        success: function (result) {
            return result;
        }
    }).responseText;
}

function renderMonitoringLogView(sroId, monitoringLogCollections) {
    var monitoringLogHTML, masterFileId, fileName, fileStatus, fileDetail;
    $.each(monitoringLogCollections,
        function () {
            $.each(this,
                function (index, value) {
                    if (value.monitoringLogDetailCount > 0) {
                        fileDetail = JSON.parse(loadMonitoringLogDetail(value.monitoringLogId));
                        $.each(fileDetail,
                            function (index, value) {
                                masterFileId = value.fileTemplateId;
                                fileName = value.fileName;
                                fileStatus = value.fileStatus;
                            });

                    } else {
                        masterFileId = value.fileTemplateId;
                        fileName = value.fileTemplateName;
                        fileStatus = "Tidak Ada Proses Monitoring";
                    }
                    if (value.monitoringLogDetailCount > 0) {
                        monitoringLogHTML =
                            " <div class=\"col-md-4\"> " +
                            "    <div class=\"info-box\"> " +
                            "        <span class=\"info-box-icon bg-red\"><i class=\"fa fa-files-o\"></i></span> " +
                            "        <div class=\"info-box-content\" id=\"contentBox\"> " +
                            "            <span class=\"info-box-number\"> " + fileName + " </span> " +
                            "            <span class=\"info-box-text\"> " +
                            "               <div class=\"label label-info\"> " +
                                                fileStatus +
                            "               </div> " +
                            "            </span> " +
                            "            <div class=\"progress\"> " +
                            "               <div class=\"progress-bar progress-bar-red\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 100 %\">" +
                            "                   <span class=\"sr-only\">100% Complete</span> " +
                            "               </div> " +              
                            "            </div> " +      
                            "            <span class=\"info-box-text pt-5\"> " +
                            "               <div class=\"btn bg-olive btn-xs\" onclick=\"showHistoryModal(" + masterFileId + ")\">" +
                            "                   <i class=\"fa fa-history\" style=\"margin-right: 5px;\"></i> Lihat Historis " +
                            "               </div>" +
                            "               <div class=\"btn bg-olive btn-xs\" onclick=\"showMonitoringLogDetailModal(" + value.monitoringLogId + ")\">" +
                            "                   <i class=\"fa fa-desktop\" style=\"margin-right: 5px;\"></i> Lihat Monitoring Aktif " +
                            "               </div>" +
                            "            </span> " +     
                            "        </div> " +
                            "    </div> " +
                            " </div> ";
                    }
                    else {monitoringLogHTML =
                            " <div class=\"col-md-4\"> " +
                            "    <div class=\"info-box\"> " +
                            "        <span class=\"info-box-icon bg-red\"><i class=\"fa fa-files-o\"></i></span> " +
                            "        <div class=\"info-box-content\" id=\"contentBox\"> " +
                            "            <span class=\"info-box-number\"> " + fileName + " </span> " +
                            "            <span class=\"info-box-text\"> " +
                            "               <div class=\"label label-info\"> " +
                                                fileStatus +
                            "               </div> " +
                            "            </span> " +
                            "            <div class=\"progress\"> " +
                            "               <div class=\"progress-bar progress-bar-red\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 100 %\">" +
                            "                   <span class=\"sr-only\">100% Complete</span> " +
                            "               </div> " +              
                            "            </div> " +      
                            "            <span class=\"info-box-text pt-5\"> " +
                            "               <div class=\"btn bg-olive btn-xs\" onclick=\"showHistoryModal(" + masterFileId + ")\">" +
                            "                   <i class=\"fa fa-history\" style=\"margin-right: 5px;\"></i> Lihat Historis " +
                            "               </div>" +
                            "            </span> " +     
                            "        </div> " +
                            "    </div> " +
                            " </div> ";
                    }
                    if (sroId === 1) {
                        $("#BEIMonitoringLogContainer").append(monitoringLogHTML);
                    } else if (sroId === 2) {
                        $("#KPEIMonitoringLogContainer").append(monitoringLogHTML);
                    } else {
                        $("#KSEIMonitoringLogContainer").append(monitoringLogHTML);
                    }
                });
        });
}

$("#monitoringLogDetailModal").on("shown.bs.modal",
    function () {
        $.fn.dataTable.tables({ visible: true, api: true }).columns.adjust();
    });

/* Membuka Modal List Detail Monitoring Log */
function showMonitoringLogDetailModal(monitoringLogId) {
    $("#monitoringLogDetailModal").modal("show");
    loadMonitoringLogDetailData(monitoringLogId);
}

/* Membuat Datatable List Historis FTP Pada Modal List Historis FTP */
function loadMonitoringLogDetailData(monitoringLogId) {
    $("#monitoringLogDetailDatatables").dataTable().fnDestroy();
    $("#monitoringLogDetailDatatables").dataTable({
        scrollY: "300px",
        scrollX: true,
        scrollCollapse: true,
        ajax: {
            "url": "/FtpMonitor/ListMonitoringLogDetail?monitoringLogId=" + monitoringLogId,
            "dataType": "JSON",
            "type": "GET"
        },
        columnDefs: [
            {
                targets: "_all",
                className: "dt-center"
            },
            {
                targets: "_all",
                width: 135
            }
        ],
        fixedColumns: true,
        columns: [
            { data: "FileName" },
            {
                data: "FileModifiedDatetime",
                render: function (data) {
                    return moment(data).format("lll");
                }
            },
            { data: "FileStatus" },
            {
                data: "ETLRunDatetime",
                render: function (data) {
                    return moment(data).format("lll");
                }
            },
            {
                data: "FileName", searchable: false, orderable: false,
                render: function (data) {
                    return " <a href=\"#\" class=\"btn btn-danger btn-xs\" onclick=\"loadFTPTimeline('" + data.toString() + "')\"> " +
                        "    <i class=\"fa fa-info-circle\" style=\"margin-right: 5px;\"></i>Lihat Timeline Perpindahan Data " +
                        " </a> ";
                }
            }
        ]
    });
}

/* Membuka dan Memuat Modal Detail Timeline FTP */
function loadFTPTimeline(inputFileName) {
    var fileName = inputFileName.toString();
    $.ajax({
        url: "/FtpMonitor/GetHistoryMonitoringLogDetail?fileName=" + fileName,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "JSON",
        success: function (result) {

            /* Menghapus Semua Data Timeline Pada Modal Detail Timeline Historis FTP */
            $("#historyTimeline").html("");

            /* Memasukkan Hasil Dari Operasi AJAX Ke Dalam Bentuk Timeline
               Pada Modal Detail Timeline Historis FTP */
            $.each(result, function () {
                $.each(this, function (key, value) {
                    var timelineItem =
                        " <li> " +
                            " <i class=\"fa fa-exchange bg-red\"></i> " +
                            " <div class=\"timeline-item\"> " +
                            " <span class=\"time\"><i class=\"fa fa-clock-o\"></i> " + moment(value.ETLRunDateTime).format("lll") + " </span> " +
                            " <h3 class=\"timeline-header no-border\"> File " + value.FileStatus + " </h3> " +
                            " </div> " +
                            " </li> ";
                    $("#historyTimeline").append(timelineItem);
                });
            });

            $("#historyTimelineModal").find(".modal-title").text("Timeline Perpindahan Data - " + fileName);

            $("#historyTimelineFtpCloseButton").hide();

            $("#timelineFtpCloseButton").show();

            $("#monitoringLogDetailModal").one("hidden.bs.modal", function () {
                $("#historyTimelineModal").modal("show");
            }).modal("hide");
        }
    });
}

function closeFTPTimeline() {

    $("#historyTimelineModal").one("hidden.bs.modal", function () {
        $("#monitoringLogDetailModal").modal("show");
    }).modal("hide");
}