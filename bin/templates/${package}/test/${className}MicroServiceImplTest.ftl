package ${package}.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.junit.Test;
import ${package}.model.${className}Model;
import ${package}.test.common.BaseTestCase;
import ${package}.service.${className}MicroService;
import com.camelot.openplatform.common.bean.Pager;

/** 
 * <p>Description: [${table.tableDesc} 单元测试类]</p>
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c) ${year} ${website}
 */
public class ${className}MicroServiceImplTest extends BaseTestCase{

	@Resource
	private ${className}MicroService ${classNameLower}MicroService;

	/**
	 * <p>Discription:[${table.tableDesc}分页查询数据]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void queryPage(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model ${classNameLower}Model = new ${className}Model();
		List<${className}Model> list = ${classNameLower}MicroService.queryPage(${classNameLower}Model, new Pager(), null, queryFields);
		for(${className}Model model: list){
			System.out.println(model.getId());
		}
	}

	/**
	 * <p>Discription:[${table.tableDesc}查询数据(不分页)]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void queryList(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model ${classNameLower}Model = new ${className}Model();
		List<${className}Model> list = ${classNameLower}MicroService.queryList(${classNameLower}Model, null, queryFields);
		for(${className}Model model: list){
			System.out.println(model.getId());
		}
	}

	/**
	 * <p>Discription:[${table.tableDesc}查询总条数]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void queryCount(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		Long count = ${classNameLower}MicroService.queryCount(${classNameLower}Model, null);
		System.out.println(count);
	}

	/**
	 * <p>Discription:[根据id查询${table.tableDesc}]</p>
	 * Created on 2017年02月20日
	 * @author:${author}
	 */
	@Test
	public void queryById(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model model = ${classNameLower}MicroService.queryById(1l, queryFields);
		System.out.println(model);
	}

	/**
	 * <p>Discription:[${table.tableDesc}新增]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void save(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		${classNameLower}MicroService.save(${classNameLower}Model);
	}
	
	/**
	 * <p>Discription:[${table.tableDesc}编辑]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void edit(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		${classNameLower}MicroService.edit(${classNameLower}Model);
	}
	
	/**
	 * <p>Discription:[${table.tableDesc}单个删除]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void deleteById(){
		System.out.println(${classNameLower}MicroService.deleteById(1l));
	}
	
	/**
	 * <p>Discription:[${table.tableDesc}批量删除]</p>
	 * Created on ${date}
	 * @author:${author}
	 */
	@Test
	public void deleteByIds(){
		List<Long> ids = new ArrayList<Long>();
		ids.add(1l);
		ids.add(2l);
		System.out.println(${classNameLower}MicroService.deleteByIds(ids));
	}
	
}
