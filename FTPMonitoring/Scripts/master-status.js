$(document).ready(function () {
    listMasterStatus();
});

/* Fungsi Untuk Memanggil Datatable Master Status */
function listMasterStatus() {
    $("#MasterStatusDatatables").dataTable({
        language: {
            searchPlaceholder: "Cari Nama Status"
        },
        ajax: {
            "url": "/MasterStatus/ListStatus",
            "dataType": "JSON",
            "type": "GET"
        },
        columns: [
            { data: "Id", searchable: false },
            { data: "Name" },
            { data: "PatternExtensionName" },
            {
                data: "Id", searchable: false, orderable: false,
                render: function (data) {
                    return "<a href=\"#\" class=\"btn bg-olive\" style=\"margin-right:10px;\" onclick=\"getMasterStatus(1, " + data + ")\">" +
                        "<i class=\"fa fa-edit\" style=\"margin-right: 5px;\"></i>Ubah" +
                        "</a>" +
                        "<a href=\"#\" class=\"btn btn-info\" style=\"margin-right:10px;\" onclick=\"getMasterStatus(2, " + data + ")\">" +
                        "<i class=\"fa fa-info\" style=\"margin-right: 5px;\"></i>Lihat" +
                        "</a>" +
                        "<a href=\"#\" class=\"btn btn-danger\" onclick=\"getMasterStatus(3, " + data + ")\">" +
                        "<i class=\"fa fa-trash-o\" style=\"margin-right: 5px;\"></i>Hapus" +
                        "</a>";
                }
            }
        ]
    });
}

/* Fungsi Untuk Menambahkan Data Master Status */
function addMasterStatus() {
    var form = $("#MasterStatusForm");

    /* Variabel Untuk Menyimpan CSRF Token */
    var token = $('input[name="__RequestVerificationToken"]', form).val();

    /* Variabel Dalam Bentuk Objek Untuk Menyimpan Hasil Input Dari User
    * Terkait Data Master Status Yang Akan Ditambahkan
    */
    var statusObj = {
        "Name": $("#name").val(),           // Index Untuk Menyimpan Nama Status
        "PatternExtensionId": $("#patternExtensionSelector").val()    // Index Untuk Menyimpan Pattern Extension Yang Bersangkutan Dari Status
    };

    /* Operasi AJAX Untuk Create Master Status */
    $.ajax({
        url: "/MasterStatus/Create",
        data: {
            __RequestVerificationToken: token,
            masterStatus: statusObj
        },
        type: "POST",
        dataType: "JSON",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (result) {
            /* Jika Berhasil Melewati Validasi ModelState */
            if (result.status === true) {
                /* Menutup Utility Modal */
                $("#MasterStatusModal").modal("hide");

                /* Menghapus Datatable Master Status Untuk Persiapan Reset Datatable */
                $('#MasterStatusDatatables').dataTable().fnDestroy();

                /* Menampilkan Kembali Datatable Master Status Dengan Data Yang Baru Ditambahkan  */
                listMasterStatus();

                /* Menampilkan Notifikasi Bahwa Data Berhasil Ditambahkan */
                toastr.success("Penambahan Data Master Status Berhasil !",
                    "Master Status dengan nama " + statusObj.name + " berhasil ditambahkan.");
            }
            /* Jika Tidak Berhasil Melewati Validasi ModelState */
            else {
                /* Menampilkan Error Dari Hasil Validasi ModelState */
                showErrorNotification(result.errors);
            }
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

/* Fungsi Untuk Merubah Sebuah Data Master Status */
function updateMasterStatus() {
    var form = $("#MasterStatusForm");

    /* Variabel Untuk Menyimpan CSRF Token */
    var token = $('input[name="__RequestVerificationToken"]', form).val();

    /* Variabel Dalam Bentuk Objek Untuk Menyimpan Hasil Input Dari User
     * Terkait Data Master Template File Yang Akan Dirubah 
     */
    var statusObj = {
        "Id": $("#id").val(),
        "Name": $("#name").val(),
        "PatternExtensionId": $("#patternExtensionSelector").val()
    };

    /* Operasi AJAX Untuk Update Master Status */
    $.ajax({
        url: "/MasterStatus/Update",
        data: {
            __RequestVerificationToken: token,
            masterStatus: statusObj
        },
        type: "POST",
        dataType: "JSON",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (result) {

            /* Jika Berhasil Melewati Validasi ModelState */
            if (result.status === true) {

                /* Menutup Utility Modal */
                $("#MasterStatusModal").modal("hide");

                /* Menghapus Datatable Master Status Untuk Persiapan Reset Datatable */
                $("#MasterStatusDatatables").dataTable().fnDestroy();

                /* Menampilkan Kembali Datatable Master Status Dengan Data Yang Baru Dirubah  */
                listMasterStatus();

                /* Menampilkan Notifikasi Bahwa Data Berhasil Dirubah */
                toastr.success("Penyuntingan Data Master Status Berhasil !",
                    "Master Status dengan nama " + statusObj.Name + " berhasil dirubah.");

            }
            /* Jika Tidak Berhasil Melewati Validasi ModelState */
            else {

                /* Menampilkan Error Dari Hasil Validasi ModelState */
                showErrorNotification(result.errors);

            }
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

/* Fungsi Untuk Memanggil Modal Utility Untuk Kebutuhan RUD(Read, Update, Delete) Dari Master Status */
function getMasterStatus(type, id) {

    /* Mengosongkan PatternExtension Selector pada Modal Utility */
    $("#patternExtensionSelector").find("option").remove().end();

    /* Mengisi PatternExtension Selector pada Modal Utility */
    appendSelectOptionPatternExtensionId();

    /* Operasi AJAX Memanggil Modal Utility Sesuai Dengan Kebutuhan RUD(Read, Update, Delete) Dari Master Status */
    $.ajax({
        url: "/MasterStatus/GetStatus?statId=" + id,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "JSON",
        success: function (result) {
            $.each(result, function (index, value) {
                $("#id").val(value.Id);
                $("#name").val(value.Name);
                $("#patternExtensionSelector").val(value.PatternExtensionId);
            });

            /* Munculkan Utility Modal */
            $("#MasterStatusModal").modal("show");

            /* Jika Type = 1 Maka Utility Modal Ditampilkan Untuk Operasi Update Dari Sebuah Data Master Status */
            if (type === 1) {
                /* Panggil Fungsi Untuk Mengaktifkan Semua Form Field */
                enabledFormAllField();

                /* Mengganti Judul Dari Utility Modal */
                $("#modalTitle").text("Formulir Penyuntingan Data Master Status");

                /* Menampilkan Tombol Update */
                $("#btnUpdate").show();

                /* Menghilangkan Tombol Delete */
                $("#btnDelete").hide();

                /* Menghilangkan Tombol Add */
                $("#btnAdd").hide();
            }
            /* Jika Type = 2 Maka Utility Modal Ditampilkan Untuk Operasi Read Detail Dari Sebuah Data Master Status */
            else if (type === 2) {
                /* Panggil Fungsi Untuk Menonaktifkan Semua Form Field */
                disabledFormAllField();

                /* Mengganti Judul Dari Utility Modal */
                $("#modalTitle").text("Detail Data Master Status");

                /* Menghilangkan Tombol Update */
                $("#btnUpdate").hide();

                /* Menghilangkan Tombol Delete */
                $("#btnDelete").hide();

                /* Menghilangkan Tombol Add */
                $("#btnAdd").hide();
            }
            /* Jika Type = 3 Maka Utility Modal Ditampilkan Untuk Operasi Delete Dari Sebuah Data Master Status */
            else {
                /* Panggil Fungsi Untuk Menonaktifkan Semua Form Field */
                disabledFormAllField();

                /* Mengganti Judul Dari Utility Modal */
                $("#modalTitle").text("Apakah Anda Yakin Ingin Menghapus Data Master Status Ini ?");

                /* Menghilangkan Tombol Update */
                $("#btnUpdate").hide();

                /* Menampilkan Tombol Delete */
                $("#btnDelete").show();

                /* Menghilangkan Tombol Add */
                $("#btnAdd").hide();
            }

        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
    return false;
}

/* Fungsi Untuk Menghapus Sebuah Data Dari Master Status */
function deleteMasterStatus() {
    var form = $("#MasterStatusForm");

    /* Variabel Untuk Menyimpan CSRF Token */
    var token = $('input[name="__RequestVerificationToken"]', form).val();

    /* Variabel Untuk Menyimpan Status Id Yang Ingin Dihapus */
    var statId = $("#id").val();

    /* Variabel Untuk Menyimpan Status Name Yang Ingin Dihapus */
    var statName = $("#name").val();

    /* Operasi AJAX Untuk Delete Master Status */
    $.ajax({
        url: "/MasterStatus/Delete",
        data: {
            __RequestVerificationToken: token,
            statId: statId
        },
        type: "POST",
        dataType: "JSON",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (result) {
            /* Jika Berhasil Melewati Validasi ModelState */
            if (result.status) {

                /* Menutup Utility Modal */
                $("#MasterStatusModal").modal("hide");

                /* Menghapus Datatable Master Status Untuk Persiapan Reset Datatable */
                $("#MasterStatusDatatables").dataTable().fnDestroy();

                /* Menampilkan Kembali Datatable Master Status Dengan Data Yang Baru Dihapus  */
                listMasterStatus();

                /* Menampilkan Notifikasi Bahwa Data Berhasil Dihapus */
                toastr.success("Data Master Status Berhasil Dihapus !",
                    "Master Status dengan nama " + statName + " berhasil dihapus.");
            }
        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    });
}

/* Fungsi Untuk Menyiapkan Utility Modal Untuk Proses Create Sebuah Data Master Status Baru */
function clearTextBox() {

    /* Mengganti Judul Utility Modal */
    $("#modalTitle").text("Formulir Penambahan Data Master Status");

    /* Mengosongkan Field Id */
    $("#id").val("");

    /* Mengosongkan Field Nama */
    $("#name").val("");

    /* Mengosongkan Field SRO Selector */
    $("#patternExtensionSelector").find("option").remove().end();

    /* Menghilangkan Tombol Update */
    $("#btnUpdate").hide();

    /* Menghilangkan Tombol Delete */
    $("#btnDelete").hide();

    /* Menampilkan Tombol Add */
    $("#btnAdd").show();

    /* Mengaktifkan Semua Form Field Yang Ada Pada Utility Modal */
    enabledFormAllField();

    /* Mengisi Option Pada Pattern Extension Selector */
    appendSelectOptionPatternExtensionId();
}

/* Fungsi Untuk Mengisi Pattern Extension Selector Dengan Option Yang Diambil Dari Tabel Master Pattern Extension Pada DB */
function appendSelectOptionPatternExtensionId() {
    $.ajax({
        url: "/MasterPatternExtension/ListPatternExtension",
        type: "GET",
        dataType: "JSON",
        success: function (result) {
            $.each(result, function (key, value) {
                $.each(this, function (key, value) {
                    $("#patternExtensionSelector").append($("<option></option>").attr("value", value.Id).text(value.Name));
                });
            });
        }
    });
}

/* Fungsi Untuk Menonaktifkan Semua Form Field Yang Ada Pada Utility Modal */
function disabledFormAllField() {
    $("#name").attr("disabled", "disabled");
    $("#patternExtensionSelector").attr("disabled", "disabled");
}

/* Fungsi Untuk Mengaktifkan Semua Form Field Yang Ada Pada Utility Modal */
function enabledFormAllField() {
    $("#name").removeAttr("disabled");
    $("#patternExtensionSelector").removeAttr("disabled");
}

/* Fungsi Untuk Menampilkan Error Message Dari ModelState Validation */
function showErrorNotification(errors) {
    $.each(errors, function (key, value) {
        var errorMsg = $("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">" +
            "<button type= \"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
            "<strong>Whoops!</strong> " + value +
            "</div>").hide().fadeIn(500);
        $("#errorMessage").append(errorMsg);
    });
}