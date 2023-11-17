CursoRopen::change_rmd_yaml(
  "README.Rmd",
  params = list(
    turma = Sys.getenv("TURMA"),
    nome_curso = Sys.getenv("NOME_CURSO"),
    download_material = Sys.getenv("DOWNLOAD_MATERIAL")
  ),
  new_path = "README.Rmd"
)

rmarkdown::render(
  input = "README.Rmd",
  output_format = "github_document",
  clean = TRUE,
  output_file = "README.md"
)
