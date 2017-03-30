package com.wyb.crm.service.impl;

import com.wyb.crm.entity.SalesChance;
import com.wyb.crm.service.SalesChanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/23.
 */
@Service
public class SalesChanceImpl implements SalesChanceService {
    @Autowired
    private SalesChanceService salesChanceService;
    public List<SalesChance> getSalesChanceList() {
        return salesChanceService.getSalesChanceList();
    }

    public SalesChance getSalesChanceById(Map<String, Object> map) {
        return salesChanceService.getSalesChanceById(map);
    }

    public void insertSalesChance(Map<String, Object> map) {
        salesChanceService.insertSalesChance(map);
    }

    public void updateSalesChance(Map<String, Object> map) {
        salesChanceService.updateSalesChance(map);
    }

    public void deleteSalesChance(Map<String, Object> map) {
        salesChanceService.deleteSalesChance(map);
    }

    public void designeeSalesChance(Map<String, Object> map) {
        salesChanceService.designeeSalesChance(map);
    }

    public List<SalesChance> getSalesChancePlan() {
        return salesChanceService.getSalesChancePlan();
    }
}
