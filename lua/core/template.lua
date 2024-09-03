-- 新建.c,.h,.sh,.java文件，自动插入文件头
vim.cmd([[
  autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":lua SetTitle()"
]])

-- 定义函数SetTitle，自动插入文件头
function SetTitle()
    -- 如果文件类型为.sh文件
    if vim.fn.expand("%:e") == 'sh' then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/bin/bash", ""})
    elseif vim.fn.expand("%:e") == 'py' then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/usr/bin/env python", "# coding=utf-8", ""})
    elseif vim.fn.expand("%:e") == 'rb' then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/usr/bin/env ruby", "# encoding: utf-8", ""})
    else
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "/*************************************************************************",
            "      > File Name: " .. vim.fn.expand("%"),
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
            "#define TEST_BEGINS(x) namespace x {",
            "#define TEST_ENDS(x) } // end of namespace x",
            "using namespace std;",
            ""
        })
    end

    if vim.fn.expand("%:e") == 'cc' then
        vim.api.nvim_buf_set_lines(0, -1, -1, false, {
            "#include <iostream>",
            "",
            "using namespace std;",
            ""
        })
    end

    if vim.fn.expand("%:e") == 'c' then
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

    --if vim.fn.expand("%:e") == 'py' then
    --    vim.api.nvim_buf_set_lines(0, 0, -1, false, {"#!/usr/bin/env python", "# coding=utf-8", ""})
    --end

    if vim.fn.expand("%:e") == 'java' then
        vim.api.nvim_buf_set_lines(0, -1, -1, false, {"public class " .. vim.fn.expand("%:r"), ""})
    end


    -- 新建文件后，自动定位到文件末尾
    vim.cmd("normal G")
end

vim.cmd([[autocmd BufNewFile * normal G]])

