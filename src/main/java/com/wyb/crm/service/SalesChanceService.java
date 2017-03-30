package com.wyb.crm.service;

import com.wyb.crm.entity.SalesChance;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/23.
 */
public interface SalesChanceService {
    /**
     * 获取营销机会
     * @return
     */
    public List<SalesChance> getSalesChanceList();

    /**
     * 查询销售机会
     */
    public SalesChance getSalesChanceById(Map<String,Object> map);
    /**
     *  新建销售机会
     */
    public void insertSalesChance(Map<String,Object> map);

    /**
     * 修改销售机会
     * @param map
     */
    public void updateSalesChance(Map<String,Object> map);

    /**
     * 删除销售机会
     * @param map
     */
    public void deleteSalesChance(Map<String,Object> map);

    /**
     * 指派销售任务
     * @param map
     */
    public void designeeSalesChance(Map<String,Object> map);

    public List<SalesChance> getSalesChancePlan();
}
