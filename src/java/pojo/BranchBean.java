/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;

/**
 *
 * @author Prasad
 */
public class BranchBean {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public String getBranch_address() {
        return branch_address;
    }

    public void setBranch_address(String branch_address) {
        this.branch_address = branch_address;
    }

    public int getSubadmin_Id() {
        return subadmin_Id;
    }

    public void setSubadmin_Id(int subadmin_Id) {
        this.subadmin_Id = subadmin_Id;
    }
    int id,subadmin_Id;
    String branch_name,branch_address;
}
