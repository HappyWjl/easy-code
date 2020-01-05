package com.easy.autocoding;

import com.easy.autocoding.common.Column;
import com.easy.autocoding.common.Table;
import com.easy.autocoding.utils.CamelCaseUtils;
import com.easy.autocoding.utils.FileHelper;
import com.mysql.jdbc.StringUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.log4j.Logger;

import javax.swing.filechooser.FileSystemView;
import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

public class EasyCodeApplication {

    private Logger logger = Logger.getLogger(this.getClass());
    private Properties properties;

    /**
     * 读取配置文件
     *
     * @throws Exception
     */
    public EasyCodeApplication() throws Exception {
        properties = new Properties();
        String fileDir = this.getClass().getClassLoader().getResource("generator.xml").getFile();
        properties.loadFromXML(new FileInputStream(fileDir));
    }

    /**
     * 解析数据表
     *
     * @param tableName
     * @return
     * @throws Exception
     */
    public Table parseTable(String tableName) throws Exception {
        String driverName = properties.getProperty("jdbc.driver");
        String userName = properties.getProperty("jdbc.username");
        String userPwd = properties.getProperty("jdbc.password");
        String dbURL = properties.getProperty("jdbc.url");

        String catalog = properties.getProperty("jdbc.catalog");
        String schema = properties.getProperty("jdbc.schema");
        schema = schema == null ? "%" : schema;
        String column = "%";

        logger.debug("driver>>" + driverName);
        logger.debug("url>>" + dbURL);
        logger.debug("name>>" + userName);
        logger.debug("password>>" + userPwd);
        logger.debug("catalog>>" + catalog);
        logger.debug("schema>>" + schema);

        Class.forName(driverName);
        Connection conn = java.sql.DriverManager.getConnection(dbURL, userName, userPwd);
        DatabaseMetaData dmd = conn.getMetaData();

        ResultSet rs = dmd.getColumns(catalog, schema, tableName, column);
        List<Column> columns = new ArrayList<Column>();
        while (rs.next()) {
            Column c = new Column();

            c.setLabel(rs.getString("REMARKS"));

            String name = rs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);

            String dbType = rs.getString("TYPE_NAME");

            int columnSize = rs.getInt("COLUMN_SIZE");
            if (dbType.equals("TINYINT") && columnSize > 1) {
                c.setType("Integer");
            } else if (dbType.equals("TINYINT") && columnSize == 1) {
                c.setType("Boolean");
            } else {
                String type = properties.getProperty(dbType);
                c.setType(type == null ? "String" : type);
            }
            c.setDbType(dbType);

            c.setLength(rs.getInt("COLUMN_SIZE"));
            c.setDecimalDigits(rs.getInt("DECIMAL_DIGITS"));
            c.setNullable(rs.getBoolean("NULLABLE"));
            columns.add(c);
        }

        List<Column> pkColumns = new ArrayList<Column>();
        ResultSet pkrs = dmd.getPrimaryKeys(catalog, schema, tableName);
        while (pkrs.next()) {
            Column c = new Column();
            String name = pkrs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);
            pkColumns.add(c);
        }

        conn.close();

        Table t = new Table();

        String prefiex = properties.getProperty("tableRemovePrefixes");
        String name = tableName;
        if (prefiex != null && !"".equals(prefiex)) {
            name = tableName.split(prefiex)[0];
        }
        t.setName(CamelCaseUtils.toCamelCase(name));
        t.setDbName(tableName);
        t.setColumns(columns);
        t.setPkColumns(pkColumns);
        return t;
    }

    /**
     * <p>Discription:[生成映射文件和实体类]</p>
     * Created on 2019年4月4日
     *
     * @param tableName       要声称映射文件和实体类的表名称
     * @param tableDescAndCat 表描述
     * @throws Exception
     */
    public void gen(String tableName, String tableDescAndCat, String id, String modelId) throws Exception {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_21);

        String outRoot = properties.getProperty("outRoot");

        //当输出地址为null时，文件放到桌面
        if (StringUtils.isNullOrEmpty(outRoot)) {
            File desktopDir = FileSystemView.getFileSystemView() .getHomeDirectory();
            outRoot = desktopDir.getAbsolutePath() + "/Desktop/EasyCodeDemo";
        }

        String basePackage = properties.getProperty("basePackage");
        //获取当前日期
        SimpleDateFormat sm_date = new SimpleDateFormat("yyyy年MM月dd日");
        SimpleDateFormat sm_year = new SimpleDateFormat("yyyy年");

        //将首字母转为大写
        StringBuffer buffer = new StringBuffer();
        String namePart1 = modelId.substring(0, 1).toUpperCase();
        String namePart2 = modelId.substring(1);
        buffer.append(namePart1 + namePart2);

        System.out.println(buffer);

        Map<String, Object> root = new HashMap<String, Object>();
        Table t = this.parseTable(tableName);
        t.setTableDesc(tableDescAndCat.split("_")[0]);
        root.put("table", t);
        root.put("className", t.getNameUpper());
        root.put("classNameLower", t.getName());
        root.put("primaryKey", id);
        root.put("modelId", modelId);
        root.put("modelIdFirstUpper", buffer);
        root.put("package", basePackage);
        root.put("date", sm_date.format(new Date()));
        root.put("year", sm_year.format(new Date()));

        root.put("author", "Happy王子乐");
        root.put("email", "820155406@qq.com");
        root.put("website", "得码网");

        String templateDir = this.getClass().getClassLoader().getResource("templates").getPath();

        File tdf = new File(templateDir);
        List<File> files = FileHelper.findAllFile(tdf);

        for (File f : files) {
            String parentDir = "";
            if (f.getParentFile().compareTo(tdf) != 0) {
                parentDir = f.getParent().split("templates")[1];
            }
            cfg.setClassForTemplateLoading(this.getClass(), "/templates" + parentDir);

            Template template = cfg.getTemplate(f.getName());
            template.setEncoding("UTF-8");
            String parentFileDir = FileHelper.genFileDir(parentDir, root);
            parentFileDir = parentFileDir.replace(".", "/");
            String file = FileHelper.genFileDir(f.getName(), root).replace(".ftl", ".java");
            System.out.println(file);

            File newFile = FileHelper.makeFile(outRoot + parentFileDir + "/" + file);
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(newFile), "UTF-8"));
            template.process(root, out);
            logger.debug("已生成文件：" + outRoot + parentFileDir + "/" + file);
        }
    }

    public static void main(String[] args) throws Exception {
        long time = System.currentTimeMillis();
        EasyCodeApplication g = new EasyCodeApplication();
        Map<String, String> map = new HashMap<String, String>();
        map.put("tb_classify", "商品类型表");

        Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> e = it.next();
            //设置数据库主键字段
            g.gen(e.getKey(), e.getValue(), "id", "id");
        }
        System.out.println("-------------------模版文件生成完毕，时间：" + (System.currentTimeMillis() - time) + "毫秒 ----------------!!!");
    }

}
