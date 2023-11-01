<?php
array (
  'on' => 
  array (
    0 => 'push',
  ),
  'jobs' => 
  array (
    'build' => 
    array (
      'runs-on' => 'ubuntu-latest',
      'steps' => 
      array (
        0 => 
        array (
          'uses' => 'actions/checkout@v2.3.2',
        ),
        1 => 
        array (
          'uses' => 'Azure/login@v1 creds ${{}}',
        ),
        2 => 'uses connection-string: ${{}} server-name: plsql-file: "sql_files/*.sql" modules:',
      ),
      'config' => 
      array (
        'wtools' => 
        array (
          'configFile' => 'config/test-local.php',
        ),
      ),
    ),
  ),
)
  ?>
