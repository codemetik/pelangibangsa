<script src="jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                type: 'POST',
                url: "get_provinsi.php",
                cache: false, 
                success: function(msg){
                  $("#provinsi").html(msg);
                }
            });

            $("#provinsi").change(function(){
            var provinsi = $("#provinsi").val();
                $.ajax({
                    type: 'POST',
                    url: "get_kabupaten.php",
                    data: {provinsi: provinsi},
                    cache: false,
                    success: function(msg){
                      $("#kabupaten").html(msg);
                      $("#muatan_2").html(msg);
                      $("#muatan_3").html(msg);
                    }
                });
            });
            
         });
        
        $(document).ready(function() {
            $('#example').DataTable( {
                "scrollY": 200,
                "scrollX": true
            } );
        } );
    </script>
<!-- Jquery Core Js -->
    <script src="../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="../../plugins/node-waves/waves.js"></script>

    <!-- Jquery CountTo Plugin Js -->
    <script src="../../plugins/jquery-countto/jquery.countTo.js"></script>

    <!-- Morris Plugin Js -->
    <script src="../../plugins/raphael/raphael.min.js"></script>
    <script src="../../plugins/morrisjs/morris.js"></script>

    <!-- ChartJs -->
    <script src="../../plugins/chartjs/Chart.bundle.js"></script>

    <!-- Flot Charts Plugin Js -->
    <!-- <script src="../../plugins/flot-charts/jquery.flot.js"></script>
    <script src="../../plugins/flot-charts/jquery.flot.resize.js"></script>
    <script src="../../plugins/flot-charts/jquery.flot.pie.js"></script>
    <script src="../../plugins/flot-charts/jquery.flot.categories.js"></script>
    <script src="../../plugins/flot-charts/jquery.flot.time.js"></script> -->

    <!-- Sparkline Chart Plugin Js -->
    <script src="../../plugins/jquery-sparkline/jquery.sparkline.js"></script>

    <!-- Custom Js -->
    <script src="../../js/admin.js"></script>
    <script src="../../js/pages/forms/basic-form-elements.js"></script>
    <!-- <script src="../../js/pages/index.js"></script> -->

    <!-- Demo Js -->
    <script src="../../js/demo.js"></script>
    <!-- Dropzone Plugin Js -->
    <script src="../../plugins/dropzone/dropzone.js"></script>
    <!-- <script src="../../js/pages/forms/advanced-form-elements.js"></script> -->
    <!-- Multi Select Plugin Js -->
    <script src="../../plugins/multi-select/js/jquery.multi-select.js"></script>

    <script src="../../plugins/jquery-datatable/jquery.dataTables.js"></script>

    <!-- Custom Js -->
    <script src="../../js/pages/ui/tooltips-popovers.js"></script>
</body>

</html>
