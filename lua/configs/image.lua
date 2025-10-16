local options = {
  backend = "sixel",
  processor = "magick_cli",
  integrations = {
    markdown = {
      enabled = false,
      -- only_render_image_at_cursor = true,
      -- only_render_image_at_cursor_mode = "inline",
      -- floating_windows = true,
    },
  },
  max_height_window_percentage = 100,
  window_overlap_clear_enabled = true,
  scale_factor = 1.0,
}
return options
