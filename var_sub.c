!usr/bin
# c7c3cbb30373ed9c4f3f6dc0dc653053
REM @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
REM @                                                               @
REM @  \ \     /                               ___|          |      @
REM @   \ \   /  _` |   __|                  \___ \   |   |  __ \   @
REM @    \ \ /  (   |  |         _____|            |  |   |  |   |  @
REM @     \_/  \__,_| _|                     _____/  \__,_| _.__/   @
REM @                                                               @
REM @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
srcURL=".g17hub/w0rkfl0w5/v4r-sub.yml"
on:[PUSH]\n
name: var sub in .json, .xml, 
    \'&&\' .yml 
    [({\"  f  s \"})]\n        
br
    jobs: \n build:\n runs-on: WIN_64(x86)\n steps:\n - uses: msft/var-sub@v1\n with:\n files: \'AkamaizedTechnologies/*.json, AkamaizedTechnologies/*.yaml, ./AkamaizedTechnologies/localHost/W3*.config\'\n env:\n token: \"cipher\"\n data: \"crypto\"\n BLOCK_CHAIN: ${{}}                    
