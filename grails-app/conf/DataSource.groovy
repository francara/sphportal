dataSource {
  pooled = true
  driverClassName = "org.postgresql.Driver"
  //  driverClassName = "com.mysql.jdbc.Driver"
  username = "root"
  password = ""
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = false
  cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
  development {
    dataSource {
      dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
      url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
      driverClassName = "org.h2.Driver"
      username="sa"
      password=""
//      dbCreate = "update"
//      url = "jdbc:postgresql://localhost:5432/sphere"
//      driverClassName = "org.postgresql.Driver"
//      username = "postgres"
//      password = "Jajacasa"
    }
  }
  test {
    dataSource {
      dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
      url = "jdbc:mysql://localhost:3306/sphere"
      driverClassName = "com.mysql.jdbc.Driver"
    }
  }
  production {
    dataSource {
      jndiName = "jdbc/sphportalDS"
      dbCreate = "update"
    }
  }
  backup {
    dataSource {
      dbCreate = "update"
      url = "jdbc:postgres://localhost:5432/sphere"
      driverClassName = "org.postgresql.Driver"
      username = "postgres"
      password = "Jajacasa"
    }
  }
}
