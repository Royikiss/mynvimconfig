require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,  -- 当设置为 true 时，请使用建议的键绑定。如果您设置为，则需要将键绑定在钩子中
    smart_history = true,   -- 如果设置为 true，请使用输入中的字符串作为搜索词，然后在浏览历史记录时，仅显示以该词开头的条目。想象一下在你的命令历史记录中，只需输入字符串并按下即可开始查找它。
    prompt = '❯ '           -- 输入提醒字符
  },
  popup = {
    position = {
      row = '10%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'rounded',
      text = {
        top = "Cmd-line",   -- top 顶部边框文本
                            -- top_align 上边框文本对齐方式
                            -- bottom 底部边框文本
                            -- bottom_align 底部边框文本对齐方式
      }
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      -- code
    end
  }
})
