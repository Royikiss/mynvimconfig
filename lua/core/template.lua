-- 新建.c,.h,.sh,.java文件，自动插入文件头
vim.cmd([[
  autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":lua SetTitle()"
]])

-- 定义函数SetTitle，自动插入文件头
function SetTitle()
  -- 如果文件类型为.sh文件
  if vim.bo.filetype == 'sh' then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/bin/bash", ""})
  elseif vim.bo.filetype == 'python' then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/usr/bin/env python", "# coding=utf-8", ""})
  elseif vim.bo.filetype == 'ruby' then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/usr/bin/env ruby", "# encoding: utf-8", ""})
  else
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "/*************************************************************************",
      "        > File Name: " .. vim.fn.expand("%"),
      "      > Author:Royi",
      "      > Mail:royi990001@gmail.com",
      "      > Created Time: " .. os.date("%c"),
      "      > Describe:",
      " ************************************************************************/",
      ""
    })
  end

  if vim.fn.expand("%:e") == 'cpp' then
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
      "#include <iostream>",
      "#include <algorithm>",
      "#include <list>",
      "#include <vector>",
      "#include <queue>",
      "#include <stack>",
      "#include <set>",
      "#include <map>",
      "#include <cstdio>",
      "#include <cstdlib>",
      "#include <ctype.h>",
      "#include <cmath>",
      "#include <string>",
      "#include <sstream>",
      "#include <functional>",
      "",
      "using namespace std;",
      ""
    })
  end

  if vim.bo.filetype == 'cc' then
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
      "#include <iostream>",
      "",
      "using namespace std;",
      ""
    })
  end

  if vim.bo.filetype == 'c' then
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
      "#include <stdio.h>",
      "#include <stdlib.h>",
      "#include <math.h>",
      "#include <string.h>",
      "#include <time.h>",
      ""
    })
  end

  if vim.fn.expand("%:e") == 'h' then
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
      "#ifndef _" .. string.upper(vim.fn.expand("%:r")) .. "_H__",
      "#define _" .. string.upper(vim.fn.expand("%:r")) .. "_H__",
      "#endif"
    })
  end

  if vim.bo.filetype == 'java' then
    vim.api.nvim_buf_set_lines(0, -1, -1, false, {"public class " .. vim.fn.expand("%:r"), ""})
  end

  -- 新建文件后，自动定位到文件末尾
  vim.cmd("normal G")
end

vim.cmd([[autocmd BufNewFile * normal G]])

