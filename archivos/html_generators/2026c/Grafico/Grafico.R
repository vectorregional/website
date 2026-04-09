library(plotly)
library(scales)

# Datos
df <- data.frame(
  categoria = c("Valor agregado (en U$S millones)", "Empleo (en miles)"),
  valor = c(185, 25)
)

# Forzar orden
df$categoria <- factor(
  df$categoria,
  levels = c("Valor agregado (en U$S millones)", "Empleo (en miles)")
)

# Hover custom
hover_text <- c(
  paste0("U$S ", comma(df$valor[1] * 1e6, big.mark = ".", decimal.mark = ",")),
  paste0(comma(df$valor[2] * 1e3, big.mark = ".", decimal.mark = ","), " empleos")
)

fig <- plot_ly(
  data = df,
  x = ~categoria,
  y = ~valor,
  type = "bar",
  marker = list(color = "seagreen"),
  text = ~valor,
  textposition = "outside",
  hovertext = hover_text,
  hovertemplate = "%{hovertext}<extra></extra>"
) %>%
  layout(
    font = list(family = "Nunito, sans-serif", size = 16),
    xaxis = list(
      showticklabels = TRUE,
      showgrid = FALSE,
      zeroline = FALSE,
      showline = FALSE,
      ticks = ""
    ),
    yaxis = list(
      showticklabels = FALSE,
      showgrid = FALSE,
      zeroline = FALSE,
      showline = FALSE
    ),
    showlegend = FALSE
  )

fig <- fig %>%
  layout(
    xaxis = list(
      title = "",   # ← elimina título eje X
      showticklabels = TRUE,
      showgrid = FALSE,
      zeroline = FALSE,
      showline = FALSE,
      ticks = ""
    ),
    yaxis = list(
      title = "",   # ← elimina título eje Y
      showticklabels = FALSE,
      showgrid = FALSE,
      zeroline = FALSE,
      showline = FALSE
    )
  )

fig

saveRDS(fig, "plotly.RDS")
