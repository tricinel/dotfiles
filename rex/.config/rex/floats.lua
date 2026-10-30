local terminal = "com.superlogical.terminal"

-- Best effort: SSH and ambiguous reports may resolve to a local directory, not the remote one.
local function focused_cwd(ctx)
  local pwd = rex.block.call(terminal, "pwd", { block_id = ctx.block_id })
  if pwd and pwd.pwd then
    local host, path = pwd.pwd:match("^file://([^/]*)(/.*)$")
    if host then
      host = host:lower()
      local local_report = host == "" or host == "localhost"
      if not local_report then
        local hostname = rex.exec({ "hostname" })
        if hostname and hostname.ok then
          local local_host = hostname.stdout:match("^%s*(.-)%s*$"):lower()
          local_report = host == local_host or host == local_host:match("^[^.]+")
        end
      end
      if local_report then
        return (path:gsub("%%(%x%x)", function(hex)
          return string.char(tonumber(hex, 16))
        end))
      end
    elseif not pwd.pwd:match("^file://") then
      return pwd.pwd
    end
  end
  local proc = rex.block.call(terminal, "process", { block_id = ctx.block_id })
  return proc and proc.foreground and proc.foreground.cwd
end

local function float(name, title, keywords, command)
  rex.action({
    name = name,
    title = title,
    keywords = keywords,
    run = function(ctx)
      local _, err = rex.session.new_layer({
        -- x, y, w, h as fractions of the window
        bounds = { 0.05, 0.05, 0.9, 0.9 },
        layout = rex.layout.block({
          flavor = terminal .. ".shell",
          options = { command = command, cwd = focused_cwd(ctx) },
        }),
        focus = true,
      })
      if err then
        error(err)
      end
    end,
  })
end

float("scratch_float", "Scratch Terminal", "scratch terminal float")
float("lazygit_float", "Lazygit", "git lazygit float", { "lazygit" })
