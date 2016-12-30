package com.wgh.dao;

import commerce.goods;

import com.wgh.DB.MD5;
import com.wgh.DB.chStr;
import com.wgh.DB.connDB;

public class GoodsDaoImpl
    implements GoodsDao {
   connDB conn = new connDB();
   chStr chStr = new chStr();
   // MD5 md = new MD5();
  public int insert(goods g) {
    int ret = -1;
    try {
      String sql = "Insert into tb_goods (goodsTypeID,goodsName,goodsType,goodsIntroduce,goodsPrice,goodsNowPrice,goodsPicture,isNew,isSale,goodsPicture1,goodsPicture2,goodsPicture3,goodsPicture4,goodsPicture5,goodsPicture6) values(" +
          g.getGoodsTypeID() + ",'" + chStr.chStr(g.getGoodsName()) + "','" + chStr.chStr(g.getGoodsType()) + "','" +
          chStr.chStr(g.getGoodsIntroduce()) + "'," + g.getGoodsPrice() + "," +
          g.getGoodsPrice() + ",'" + chStr.chStr(g.getGoodsPicture()) + "'," +
          g.getIsNew() + "," + g.getIsSale() + ",'" + chStr.chStr(g.getGoodsPicture1()) + "','" + chStr.chStr(g.getGoodsPicture2()) + "','" + chStr.chStr(g.getGoodsPicture3()) + "','" + chStr.chStr(g.getGoodsPicture4()) + "','" + chStr.chStr(g.getGoodsPicture5()) + "','" + chStr.chStr(g.getGoodsPicture6()) + "')";

      ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  public int update(goods g) {
    int ret = -1;
    try {
     String sql = "update tb_Goods set goodsTypeID=" +g.getGoodsTypeID() +
         ",GoodsName='" + chStr.chStr(g.getGoodsName()) + "',goodsType='" + chStr.chStr(g.getGoodsType()) + "',goodsIntroduce='" +
        chStr.chStr(g.getGoodsIntroduce()) + "',goodsPrice=" + g.getGoodsPrice() +
         ",goodsNowprice=" + g.getGoodsNowPrice() +",goodsPicture='" + chStr.chStr(g.getGoodsPicture())+ "',isNew=" +
         g.getIsNew() + ",issale=" + g.getIsSale() + ",goodsPicture1='" + chStr.chStr(g.getGoodsPicture1())+ "',goodsPicture2='" + chStr.chStr(g.getGoodsPicture2())+ "',goodsPicture3='" + chStr.chStr(g.getGoodsPicture3())+ "',goodsPicture4='" + chStr.chStr(g.getGoodsPicture4())+ "',goodsPicture5='" + chStr.chStr(g.getGoodsPicture5())+ "',goodsPicture6='" + chStr.chStr(g.getGoodsPicture6())+ "' where goodsID=" + g.getGoodsID();
     ret = conn.executeUpdate(sql);
   }
   catch (Exception e) {
     ret = 0;
   }
   conn.close();
   return ret;
 }


  public int delete(goods g) {
    int ret=-1;
    try{
      String sql="Delete from tb_goods where goodsID="+g.getGoodsID();
      ret=conn.executeUpdate(sql);
    }catch(Exception e){
      ret=0;
    }
    conn.close();
    return ret;

  }

}
