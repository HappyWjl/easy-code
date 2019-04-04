package ${package}.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ${package}.dto.${className}DTO;
import ${package}.service.${className}Service;
import com.camelot.openplatform.common.Pager;
import com.camelot.openplatform.common.DataGrid;
import com.camelot.openplatform.common.ExecuteResult;

/** 
 * Description: [描述该类概要功能介绍]
 * Created on ${date}
 * @author  <a href="mailto: ${email}">${author}</a>
 * @version 1.0 
 * Copyright (c) ${year} ${website}
 */
@Controller
@RequestMapping("/sellcenter/${classNameLower}")
public class ${className}Controller {
	private Logger logger = Logger.getLogger(this.getClass());
	@Resource
	private ${className}Service ${classNameLower}Service;
	
	
	/**
	 * <p>Discription:[分页查询XXXX集合数据]</p>
	 * Created on ${date}
	 * @param 
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/find${classNameLower}sByPage")
	public String find${classNameLower}sByPage(${className}DTO ${classNameLower}DTO,Pager pager,Model model){
		ExecuteResult<DataGrid<${className}DTO>> er = this.${classNameLower}Service.queryPage(${classNameLower}DTO,pager);
		//执行结果
		String message = "";
		//判断是否发生异常
		if(er.isSuccess()){
			DataGrid<${className}DTO> dg = er.getResult();
			if(dg != null){
				//将查询出的列表、总数量封装到分页实体中供页面使用
				pager.setRecords(dg.getRows());
				pager.setTotalCount(dg.getTotal().intValue());
			}
		}else{
			message = er.getErrorMessages().get(0);
		}
		model.addAttribute("pager", pager);
		model.addAttribute("message", message);
		model.addAttribute("${classNameLower}DTO", ${classNameLower}DTO);
		return "/${classNameLower}/${classNameLower}List";
	}
	
	
	/**
	 * <p>Discription:[跳转到XXX新增页面]</p>
	 * Created on ${date}
	 * @param 
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/toSave")
	public String toSave(Model model){
		return "";
	}
	
	
	
	/**
	 * <p>Discription:[新增XXXX]</p>
	 * Created on ${date}
	 * @param 
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/save")
	public String save(Model model,${className}DTO ${classNameLower}DTO){
		ExecuteResult<Boolean> result = this.${classNameLower}Service.save(${classNameLower}DTO);
		//执行结果
		String message = "";
		//判断是否发生异常
		if(!result.isSuccess()){
			message = result.getErrorMessages().get(0);
		}
		model.addAttribute("message", message);
		return "";
	}
	
	/**
	 * <p>Discription:[跳转到XXX编辑页面]</p>
	 * Created on ${date}
	 * @param 
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/toEdit")
	public String toEdit(${className}DTO ${classNameLower}DTO,Model model){
		ExecuteResult<${className}DTO> result = this.${classNameLower}Service.query${className}DTOByCondition(${classNameLower}DTO);
		//执行结果
		String message = "";
		//判断是否发生异常
		if(result.isSuccess()){
			${classNameLower}DTO = result.getResult();
		}else{
			message = result.getErrorMessages().get(0);
		}
		model.addAttribute("${classNameLower}DTO", ${classNameLower}DTO);
		model.addAttribute("message", message);
		return "";
	}
	
	/**
	 * <p>Discription:[新增XXXX]</p>
	 * Created on ${date}
	 * @param 
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/edit")
	public String edit(${className}DTO ${classNameLower}DTO,Model model){
		ExecuteResult<Boolean> result = this.${classNameLower}Service.edit(${classNameLower}DTO);
		//执行结果
		String message = "";
		//判断是否发生异常
		if(!result.isSuccess()){
			message = result.getErrorMessages().get(0);
		}
		model.addAttribute("message", message);
		return "";
	}
	
	
	/**
	 * <p>Discription:[删除XXXX]</p>
	 * Created on ${date}
	 * @param ids需要删除的数据id集合
	 * @return
	 * @author:中文名字
	 */
	@RequestMapping("/del${className}")
	@ResponseBody
	public Map<String,String> del${className}(String[] ids,Model model){
		Map<String,String> mapResult = new HashMap<String,String>();
		//存放执行结果
		String message = "";
		if(ids != null && ids.length > 0){
			//将需要删除的XXXX实体id存放到对应的dto中
			${className}DTO ${classNameLower}DTO;
			List<${className}DTO> ${classNameLower}DTOList = new ArrayList<${className}DTO>();
			for(String id : ids){
				${classNameLower}DTO = new ${className}DTO();
				${classNameLower}DTO.setId(new Long(id));
				${classNameLower}DTOList.add(${classNameLower}DTO);
			}
			//删除XXXX
			ExecuteResult<Boolean> result = this.${classNameLower}Service.delete(${classNameLower}DTOList);
			if(!result.isSuccess()){
				message = result.getErrorMessages().get(0);
			}
		}else{
			message = "没有要删除的项!";
		}
		mapResult.put("message",message);
		return mapResult;
	}
	
}
