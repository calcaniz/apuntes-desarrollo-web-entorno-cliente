<style>
  #print-site-cover-page {
    margin: 0 !important;
    padding: 0 !important;
  }

  #print-site-cover-page .portada-pdf {
    position: relative;
    box-sizing: border-box;
    width: 100%;
    height: 245mm;
    margin: 0 !important;
    padding: 10mm 0 0;
    overflow: hidden;
    background: #ffffff;
    color: #111111;
    font-family: "Roboto", "Arial", sans-serif;
    text-align: center;
  }
  
  #print-site-cover-page .portada-modulo,
  #print-site-cover-page .portada-codigo,
  #print-site-cover-page .portada-titulo,
  #print-site-cover-page .portada-curso {
    box-sizing: border-box;
    width: 100%;
    margin-left: 0 !important;
    margin-right: 0 !important;
    padding-left: 12mm;
    padding-right: 12mm;
    text-align: center !important;
  }
  #print-site-cover-page .portada-logo-centro {
    display: block;
    width: 48%;
    height: auto;
    margin: 0 auto 14mm;
  }

  #print-site-cover-page .portada-modulo {
    margin: 0 0 5mm;
    color: #777777;
    font-size: 20pt;
    font-weight: 400;
    line-height: 1.2;
  }

  #print-site-cover-page .portada-codigo {
    margin: 0 0 5mm;
    color: #f36c21;
    font-size: 25pt;
    font-weight: 700;
    line-height: 1;
  }

  #print-site-cover-page .portada-titulo {
    margin: 0 0 3mm;
    color: #111111;
    font-size: 13pt;
    font-weight: 400;
    line-height: 1.3;
  }

  #print-site-cover-page .portada-curso {
    margin: 0;
    color: #f36c21;
    font-size: 9.5pt;
    font-weight: 400;
    line-height: 1;
  }

  #print-site-cover-page .portada-niveles {
    display: block;
    width: 76%;
    height: auto;
    margin: 21mm auto 0;
  }

  #print-site-cover-page .portada-instituciones {
    position: absolute;
    bottom: 3mm;
    left: 8mm;
    width: 39%;
    height: auto;
  }


</style>

<div class="portada-pdf">
  <img
    class="portada-logo-centro"
    src="../assets/images/logo-portada.png"
    alt="IES Mestre Ramon Esteve"
  >

  <p class="portada-modulo">{{ config.extra.pdf.modulo }}</p>
  <p class="portada-codigo">{{ config.extra.pdf.codigo_up }}</p>
  <p class="portada-titulo">{{ config.extra.pdf.titulo_up }}</p>
  <p class="portada-curso">CURSO {{ config.extra.pdf.curso }}</p>

  <img
    class="portada-niveles"
    src="../assets/images/niveles-educativos.png"
    alt=""
  >

  <img
    class="portada-instituciones"
    src="../assets/images/logos-institucionales.png"
    alt=""
  >
</div>
