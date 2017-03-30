package com.wyb.crm.service;

import com.wyb.crm.entity.SalesChance;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/23.
 */
public interface SalesChanceService {
    /**
     * ��ȡӪ������
     * @return
     */
    public List<SalesChance> getSalesChanceList();

    /**
     * ��ѯ���ۻ���
     */
    public SalesChance getSalesChanceById(Map<String,Object> map);
    /**
     *  �½����ۻ���
     */
    public void insertSalesChance(Map<String,Object> map);

    /**
     * �޸����ۻ���
     * @param map
     */
    public void updateSalesChance(Map<String,Object> map);

    /**
     * ɾ�����ۻ���
     * @param map
     */
    public void deleteSalesChance(Map<String,Object> map);

    /**
     * ָ����������
     * @param map
     */
    public void designeeSalesChance(Map<String,Object> map);

    public List<SalesChance> getSalesChancePlan();
}
