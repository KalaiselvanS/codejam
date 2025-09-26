-- dbo.application_t
CREATE TABLE dbo.application_t
(
    appl_cd                     CHAR(8) NOT NULL,
    appl_nm                     VARCHAR(100) NOT NULL,
    appl_page_view_nm           VARCHAR(50),
    appl_ques_view_nm           VARCHAR(50),
    appl_msg_view_nm            VARCHAR(50),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_application_t PRIMARY KEY (appl_cd)
)
/

-- dbo.category_t
-- Make appl_cd as part of primary key
CREATE TABLE dbo.category_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    cat_nm                      VARCHAR(60) NOT NULL,
    cat_dsc                     VARCHAR(400) NOT NULL,
    is_active_ind               CHAR(1),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    is_deleted_ind              CHAR(1),
    CONSTRAINT pk_category_t PRIMARY KEY (appl_cd, cat_id),
    CONSTRAINT fk_appl2 FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd)
)
/

-- dbo.data_element_type_t
CREATE TABLE dbo.data_element_type_t
(
    data_elem_typ_cd            CHAR(8) NOT NULL,
    data_elem_typ_dsc           VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_data_element_type_t PRIMARY KEY (data_elem_typ_cd)
)
/

-- dbo.data_element_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify foreign key constraint fk_catg2 for appl_cd of application_t
CREATE TABLE dbo.data_element_t
(
    appl_cd                     CHAR(8) NOT NULL,
    data_ele_id                 INT NOT NULL,
    cat_id                      INT NOT NULL,
    data_elem_typ_cd            CHAR(8) NOT NULL,
    data_ele_nm                 VARCHAR(50) NOT NULL,
    data_ele_dsc                VARCHAR(400) NOT NULL,
    data_ele_array_ind          CHAR(1),
    data_ele_prec_num           SMALLINT,
    data_ele_vlu_txt            VARCHAR(100),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    data_ele_operator_ind       CHAR(1),
    CONSTRAINT pk_data_element_t PRIMARY KEY (appl_cd, data_ele_id),
    CONSTRAINT fk_catg2 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_dteltp1 FOREIGN KEY (data_elem_typ_cd) REFERENCES dbo.data_element_type_t (data_elem_typ_cd)
)
/


-- dbo.operation_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_oper_data_ele_t by adding appl_cd
CREATE TABLE dbo.operation_t
(
    appl_cd                     CHAR(8) NOT NULL,
    oper_data_ele_id            INT NOT NULL,
    oper_api_java_nm            VARCHAR(100),
    oper_api_meth_nm            VARCHAR(100),
    oper_full_view_txt          VARCHAR(4000),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_oper_data_ele_t PRIMARY KEY (appl_cd, oper_data_ele_id),
    CONSTRAINT fk_oper_data_ele_t FOREIGN KEY (appl_cd, oper_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id)
)
/

-- dbo.rule_object_type_t
CREATE TABLE dbo.rule_object_type_t
(
    rlobj_typ_cd                CHAR(8) NOT NULL,
    rlobj_typ_dsc               VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_object_type_t PRIMARY KEY (rlobj_typ_cd)
)
/

-- dbo.oper_data_map_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_oper_data_ele_map_t by adding appl_cd
-- Modify Foreign Key constraint fk_oper_data_ele_parm_t by adding appl_cd
CREATE TABLE dbo.oper_data_map_t
(
    appl_cd                     CHAR(8) NOT NULL,
    oper_data_ele_id            INT NOT NULL,
    oper_dtmap_seq_num          SMALLINT NOT NULL,
    parm_data_ele_id            INT,
    parm_data_value             VARCHAR(250),
    parm_data_typ_cd            CHAR(8),
    parm_valu_typ_cd            CHAR(8),
    oper_dtmap_parm_nm          VARCHAR(250) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_oper_data_map_t PRIMARY KEY (appl_cd, oper_data_ele_id, oper_dtmap_seq_num),
    CONSTRAINT fk_oper_data_ele_map_t FOREIGN KEY (appl_cd, oper_data_ele_id) REFERENCES dbo.operation_t (appl_cd, oper_data_ele_id),
    CONSTRAINT fk_oper_data_ele_parm_t FOREIGN KEY (appl_cd, parm_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_parm_data_typ_cd FOREIGN KEY (parm_data_typ_cd) REFERENCES dbo.data_element_type_t (data_elem_typ_cd),
    CONSTRAINT fk_parm_valu_typ_cd FOREIGN KEY (parm_valu_typ_cd) REFERENCES dbo.rule_object_type_t (rlobj_typ_cd)
)
/


-- dbo.compare_type_t
CREATE TABLE dbo.compare_type_t
(
    cmpr_typ_cd                 CHAR(8) NOT NULL,
    cmpr_typ_dsc                VARCHAR(60) NOT NULL,
    cmpr_typ_use_cd             CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_compare_type_t PRIMARY KEY (cmpr_typ_cd)
)
/


-- dbo.appl_data_source_t
CREATE TABLE dbo.appl_data_source_t
(
    appl_cd                     CHAR(8) NOT NULL,
    appl_data_src_cd            CHAR(8) NOT NULL,
    appl_data_src_nm            VARCHAR(100) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_appl_data_source_t PRIMARY KEY (appl_cd, appl_data_src_cd),
    CONSTRAINT fk_appl1 FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd)
)
/


-- dbo.appl_table_t
CREATE TABLE dbo.appl_table_t
(
    appl_cd                     CHAR(8) NOT NULL,
    appl_data_src_cd            CHAR(8) NOT NULL,
    appl_tbl_nm                 CHAR(40) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_appl_table_t PRIMARY KEY (appl_cd, appl_data_src_cd, appl_tbl_nm),
    CONSTRAINT fk_appds1 FOREIGN KEY (appl_cd, appl_data_src_cd) REFERENCES dbo.appl_data_source_t (appl_cd, appl_data_src_cd)
)
/


-- dbo.condition_type_t
CREATE TABLE dbo.condition_type_t
(
    cond_typ_cd                 CHAR(8) NOT NULL,
    cond_typ_dsc                VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_condition_type_t PRIMARY KEY (cond_typ_cd)
)
/

-- dbo.condition_t
-- Change appl_cd to cond_appl_cd
-- Make use of appl_cd in primary key
-- Modify foreign key constraint fk_catg5 for appl_cd of application_t
-- Modify foreign key constraint fk_aptbl2 for cond_appl_cd
CREATE TABLE dbo.condition_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cond_id                     INT NOT NULL,
    cond_typ_cd                 CHAR(8) NOT NULL,
    cond_appl_cd                CHAR(8),
    appl_data_src_cd            CHAR(8),
    appl_tbl_nm                 CHAR(40),
    cat_id                      INT NOT NULL,
    cond_nm                     VARCHAR(100) NOT NULL,
    cond_dsc                    VARCHAR(400),
    cond_api_hshmap_ind         CHAR(1),
    cond_api_java_nm            VARCHAR(100),
    cond_api_meth_nm            VARCHAR(100),
    cond_cche_data_ind          CHAR(1),
    cond_full_view_txt          VARCHAR(4000),
    is_active_ind               CHAR(1),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_condition_t PRIMARY KEY (appl_cd, cond_id),
    CONSTRAINT fk_aptbl2 FOREIGN KEY (cond_appl_cd, appl_data_src_cd, appl_tbl_nm) REFERENCES dbo.appl_table_t (appl_cd, appl_data_src_cd, appl_tbl_nm),
    CONSTRAINT fk_catg5 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_cndtp1 FOREIGN KEY (cond_typ_cd) REFERENCES dbo.condition_type_t (cond_typ_cd)
)
/

-- dbo.rule_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_catg1 for appl_cd
CREATE TABLE dbo.rule_t
(
    appl_cd                     CHAR(8) NOT NULL,
    rule_id                     INT NOT NULL,
    cat_id                      INT NOT NULL,
    rule_nm                     VARCHAR(100) NOT NULL,
    rule_dsc                    VARCHAR(400) NOT NULL,
    rule_eff_dt                 dbo.dom_lst_upd_dtm NOT NULL,
    rule_expy_dt                dbo.dom_lst_upd_dtm,
    is_draft_ind                CHAR(1),
    is_active_ind               CHAR(1) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_t PRIMARY KEY (appl_cd, rule_id),
    CONSTRAINT fk_catg1 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id)
)
/

-- dbo.rule_section_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_cond3 for appl_cd
-- Modify Foreign Key constraint fk_rule1 for appl_cd
CREATE TABLE dbo.rule_section_t
(
    appl_cd                     CHAR(8) NOT NULL,
    rule_id                     INT NOT NULL,
    rule_sect_seq_num           SMALLINT NOT NULL,
    cond_id                     INT NOT NULL,
    cmpr_typ_cd                 CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_section_t PRIMARY KEY (appl_cd, rule_id, rule_sect_seq_num),
    CONSTRAINT fk_cmpr4 FOREIGN KEY (cmpr_typ_cd) REFERENCES dbo.compare_type_t (cmpr_typ_cd),
    CONSTRAINT fk_cond3 FOREIGN KEY (appl_cd, cond_id) REFERENCES dbo.condition_t (appl_cd, cond_id),
    CONSTRAINT fk_rule1 FOREIGN KEY (appl_cd, rule_id) REFERENCES dbo.rule_t (appl_cd, rule_id)
)
/

-- dbo.cat_data_mapping_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Modify Foreign key constraint fk_catg7 for appl_cd of application_t
CREATE TABLE dbo.cat_data_mapping_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    dtmap_id                    INT NOT NULL,
    dtmap_class_nm              VARCHAR(250) NOT NULL,
    dtmap_subcls1_nm            VARCHAR(250),
    dtmap_subcls2_nm            VARCHAR(250),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_cat_data_mapping_t PRIMARY KEY (appl_cd, cat_id, dtmap_id),
    CONSTRAINT fk_catg7 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id)
)
/

-- dbo.data_mapping_member_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_dtele11 by adding appl_cd with data_ele_id
-- Modify Foreign Key constraint fk_dtmap1 by adding appl_cd
CREATE TABLE dbo.data_mapping_member_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    dtmap_id                    INT NOT NULL,
    data_ele_id                 INT NOT NULL,
    dtmap_mbr_nm                VARCHAR(250) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_data_mapping_member_t PRIMARY KEY (appl_cd, cat_id, dtmap_id, data_ele_id),
    CONSTRAINT fk_dtele11 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_dtmap1 FOREIGN KEY (appl_cd, cat_id, dtmap_id) REFERENCES dbo.cat_data_mapping_t (appl_cd, cat_id, dtmap_id)
)
/

-- dbo.user_role_t
CREATE TABLE dbo.user_role_t
(
    user_role_cd                CHAR(8) NOT NULL,
    user_role_dsc               VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_user_role_t PRIMARY KEY (user_role_cd)
)
/

-- dbo.category_user_role_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Modify Foreign key constraint fk_catg6 for appl_cd of application_t
CREATE TABLE dbo.category_user_role_t
(
    appl_cd                     CHAR(8) NOT NULL,
    user_role_cd                CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_category_user_role_t PRIMARY KEY (appl_cd, user_role_cd, cat_id),
    CONSTRAINT fk_catg6 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_usrole16 FOREIGN KEY (user_role_cd) REFERENCES dbo.user_role_t (user_role_cd)
)
/

-- dbo.rule_engine_user_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Add Foreign Key constraint fk_rule_eut_appl_cd for appl_cd
CREATE TABLE dbo.rule_engine_user_t
(
    appl_cd                     CHAR(8) NOT NULL,
    emple_id                    CHAR(11) NOT NULL,
    user_role_cd                CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_engine_user_t PRIMARY KEY (appl_cd, emple_id, user_role_cd),
    CONSTRAINT fk_rule_eut_appl_cd FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd),
    CONSTRAINT fk_usrole2 FOREIGN KEY (user_role_cd) REFERENCES dbo.user_role_t (user_role_cd)
)
/

-- dbo.event_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Add foreign key constraint fk_event_appl_cd for appl_cd of application_t
CREATE TABLE dbo.event_t
(
    appl_cd                     CHAR(8) NOT NULL,
    event_cd                    CHAR(8) NOT NULL,
    event_dsc                   VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_event_t PRIMARY KEY (appl_cd, event_cd),
    CONSTRAINT fk_event_appl_cd FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd)
)
/

-- dbo.event_test_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_evnt3 by adding appl_cd
CREATE TABLE dbo.event_test_t
(
    appl_cd                     CHAR(8) NOT NULL,
    evtest_id                   INT NOT NULL,
    event_cd                    CHAR(8) NOT NULL,
    evtest_nm                   VARCHAR(60) NOT NULL,
    evtest_dsc                  VARCHAR(400),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_event_test_t PRIMARY KEY (appl_cd, evtest_id),
    CONSTRAINT fk_evnt3 FOREIGN KEY (appl_cd, event_cd) REFERENCES dbo.event_t (appl_cd, event_cd)
)
/

-- dbo.permission_type_t
CREATE TABLE dbo.permission_type_t
(
    prmsn_typ_cd                CHAR(8) NOT NULL,
    prmsn_typ_dsc               VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_permission_type_t PRIMARY KEY (prmsn_typ_cd)
)
/

-- dbo.category_permission_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Modify Foreign key constraint fk_ctrol1 for appl_cd of application_t
CREATE TABLE dbo.category_permission_t
(
    appl_cd                     CHAR(8) NOT NULL,
    user_role_cd                CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    prmsn_typ_cd                CHAR(8) NOT NULL,
    prmsn_sel_ind               CHAR(1),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_category_permission_t PRIMARY KEY (appl_cd, user_role_cd, cat_id, prmsn_typ_cd),
    CONSTRAINT fk_ctrol1 FOREIGN KEY (appl_cd, user_role_cd, cat_id) REFERENCES dbo.category_user_role_t (appl_cd, user_role_cd, cat_id),
    CONSTRAINT fk_prmsn1 FOREIGN KEY (prmsn_typ_cd) REFERENCES dbo.permission_type_t (prmsn_typ_cd)
)
/

-- dbo.operator_type_t
CREATE TABLE dbo.operator_type_t
(
    oper_typ_cd                 CHAR(8) NOT NULL,
    oper_typ_dsc                VARCHAR(60) NOT NULL,
    oper_use_cd                 CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_operator_type_t PRIMARY KEY (oper_typ_cd)
)
/

-- dbo.object_type_t
CREATE TABLE dbo.object_type_t
(
    obj_typ_cd                  CHAR(8) NOT NULL,
    obj_typ_dsc                 VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_object_type_t PRIMARY KEY (obj_typ_cd)
)
/

-- dbo.category_field_audit_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Make cat_id as part of primary key
-- Modify Foreign key constraint fk_catg8 for appl_cd of application_t
CREATE TABLE dbo.category_field_audit_t
(
    appl_cd                     CHAR(8) NOT NULL,
    fldaud_id                   INT NOT NULL,
    obj_typ_cd                  CHAR(8) NOT NULL,
    cat_id                      INT NOT NULL,
    fldaud_obj_id               INT NOT NULL,
    fldaud_bfor_vlu_txt         VARCHAR(2000) NOT NULL,
    fldaud_aftr_vlu_txt         VARCHAR(2000) NOT NULL,
    fldaud_updt_dtm             dbo.dom_lst_upd_dtm NOT NULL,
    fldaud_updt_user_nm         VARCHAR(110) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_category_field_audit_t PRIMARY KEY (appl_cd, fldaud_id, cat_id),
    CONSTRAINT fk_catg8 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_objtp1 FOREIGN KEY (obj_typ_cd) REFERENCES dbo.object_type_t (obj_typ_cd)
)
/

-- dbo.log_level_t
CREATE TABLE dbo.log_level_t
(
    log_lvl_cd                  CHAR(8) NOT NULL,
    log_lvl_dsc                 VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_log_level_t PRIMARY KEY (log_lvl_cd)
)
/

-- dbo.rule_set_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_catg4 for appl_cd
-- Modify Foreign Key constraint fk_evnt1 for appl_cd
CREATE TABLE dbo.rule_set_t
(
    appl_cd                     CHAR(8) NOT NULL,
    rule_set_id                 INT NOT NULL,
    cat_id                      INT NOT NULL,
    log_lvl_cd                  CHAR(8),
    event_cd                    CHAR(8),
    rule_set_nm                 VARCHAR(100) NOT NULL,
    rule_set_dsc                VARCHAR(400) NOT NULL,
    rule_set_eff_dt             dbo.dom_lst_upd_dtm NOT NULL,
    rule_set_expy_dt            dbo.dom_lst_upd_dtm,
    rule_set_brkflow_ind        CHAR(1),
    rule_set_excp_msg_txt       VARCHAR(2000),
    is_draft_ind                CHAR(1),
    is_active_ind               CHAR(1),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_set_t PRIMARY KEY (appl_cd, rule_set_id),
    CONSTRAINT fk_catg4 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_evnt1 FOREIGN KEY (appl_cd, event_cd) REFERENCES dbo.event_t (appl_cd, event_cd),
    CONSTRAINT fk_loglv1 FOREIGN KEY (log_lvl_cd) REFERENCES dbo.log_level_t (log_lvl_cd)
)
/

-- dbo.rule_set_rules_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_rlset1 for appl_cd
-- Modify Foreign Key constraint fk_rlset3 for appl_cd
-- Modify Foreign Key constraint fk_rule2 for appl_cd
CREATE TABLE dbo.rule_set_rules_t
(
    appl_cd                     CHAR(8) NOT NULL,
    rule_set_id                 INT NOT NULL,
    rule_set_rule_seq_num       SMALLINT NOT NULL,
    rule_rule_set_id            INT,
    rule_id                     INT,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_set_rules_t PRIMARY KEY (appl_cd, rule_set_id, rule_set_rule_seq_num),
    CONSTRAINT fk_rlset1 FOREIGN KEY (appl_cd, rule_set_id) REFERENCES dbo.rule_set_t (appl_cd, rule_set_id),
    CONSTRAINT fk_rlset3 FOREIGN KEY (appl_cd, rule_rule_set_id) REFERENCES dbo.rule_set_t (appl_cd, rule_set_id),
    CONSTRAINT fk_rule2 FOREIGN KEY (appl_cd, rule_id) REFERENCES dbo.rule_t (appl_cd, rule_id)
)
/

-- dbo.property_cat_t
CREATE TABLE dbo.property_cat_t
(
    prop_cat_cd                 CHAR(8) NOT NULL,
    prop_cat_dsc                VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_property_cat_t PRIMARY KEY (prop_cat_cd)
)
/

-- dbo.property_t
CREATE TABLE dbo.property_t
(
    prop_nm                     CHAR(15) NOT NULL,
    prop_cat_cd                 CHAR(8) NOT NULL,
    prop_vlu_txt                VARCHAR(255) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_property_t PRIMARY KEY (prop_nm),
    CONSTRAINT fk_prop1 FOREIGN KEY (prop_cat_cd) REFERENCES dbo.property_cat_t (prop_cat_cd)
)
/

-- dbo.system_condition_t
CREATE TABLE dbo.system_condition_t
(
    syst_cond_cd                CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_system_condition_t PRIMARY KEY (syst_cond_cd)
)
/

-- dbo.elem_action_type_t
CREATE TABLE dbo.elem_action_type_t
(
    ele_actn_typ_cd             CHAR(8) NOT NULL,
    ele_actn_typ_dsc            VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_elem_action_type_t PRIMARY KEY (ele_actn_typ_cd)
)
/

-- dbo.response_type_t
CREATE TABLE dbo.response_type_t
(
    resp_typ_cd                 CHAR(8) NOT NULL,
    resp_typ_dsc                VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_response_type_t PRIMARY KEY (resp_typ_cd)
)
/

-- dbo.response_t
-- Change appl_cd to resp_appl_cd
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_catg3 for appl_cd
-- Modify Foreign Key constraint fk_aptbl1 by giving resp_appl_cd instead of appl_cd
-- Modify Foreign Key constraint fk_dtele1 for appl_cd
-- Modify Foreign Key constraint fk_rlset2 for appl_cd
CREATE TABLE dbo.response_t
(
    appl_cd                     CHAR(8) NOT NULL,
    resp_id                     INT NOT NULL,
    ele_actn_typ_cd             CHAR(8),
    data_ele_id                 INT,
    resp_typ_cd                 CHAR(8) NOT NULL,
    rule_set_id                 INT,
    cat_id                      INT NOT NULL,
    resp_appl_cd                CHAR(8),
    appl_data_src_cd            CHAR(8),
    appl_tbl_nm                 CHAR(40),
    resp_nm                     VARCHAR(100) NOT NULL,
    resp_dsc                    VARCHAR(400) NOT NULL,
    resp_msg_id                 CHAR(8),
    resp_scrn_id                INT,
    resp_fld_id                 INT,
    resp_api_hshmap_ind         CHAR(1),
    resp_api_java_nm            VARCHAR(250),
    resp_api_meth_nm            VARCHAR(100),
    resp_cche_data_ind          CHAR(1),
    resp_full_view_txt          VARCHAR(4000),
    is_active_ind               CHAR(1),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_response_t PRIMARY KEY (appl_cd, resp_id),
    CONSTRAINT fk_actntp1 FOREIGN KEY (ele_actn_typ_cd) REFERENCES dbo.elem_action_type_t (ele_actn_typ_cd),
    CONSTRAINT fk_aptbl1 FOREIGN KEY (resp_appl_cd, appl_data_src_cd, appl_tbl_nm) REFERENCES dbo.appl_table_t (appl_cd, appl_data_src_cd, appl_tbl_nm),
    CONSTRAINT fk_catg3 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),
    CONSTRAINT fk_dtele1 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_rlset2 FOREIGN KEY (appl_cd, rule_set_id) REFERENCES dbo.rule_set_t (appl_cd, rule_set_id),
    CONSTRAINT fk_rsptp1 FOREIGN KEY (resp_typ_cd) REFERENCES dbo.response_type_t (resp_typ_cd)
)
/

-- dbo.resp_data_map_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_resp2 by adding appl_cd
-- Modify Foreign Key constraint fk_dtele2 by adding appl_cd
CREATE TABLE dbo.resp_data_map_t
(
    appl_cd                     CHAR(8) NOT NULL,
    resp_id                     INT NOT NULL,
    resp_dtmap_seq_num          SMALLINT NOT NULL,
    data_ele_id                 INT NOT NULL,
    resp_dtmap_dest_nm          VARCHAR(250),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_resp_data_map_t PRIMARY KEY (appl_cd, resp_id, resp_dtmap_seq_num),
    CONSTRAINT fk_dtele2 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_resp2 FOREIGN KEY (appl_cd, resp_id) REFERENCES dbo.response_t (appl_cd, resp_id)
)
/

-- dbo.variable_object_type_t
CREATE TABLE dbo.variable_object_type_t
(
    vobj_typ_cd                 CHAR(8) NOT NULL,
    vobj_typ_dsc                VARCHAR(60) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_variable_object_type_t PRIMARY KEY (vobj_typ_cd)
)
/

-- dbo.condition_detail_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Modify Foreign key constraint fk_cond1 for appl_cd of application_t
-- Modify Foreign key constraint fk_cndtl1 for appl_cd of application_t
-- Modify Foreign key constraint fk_cond1 for appl_cd of application_t
-- Modify Foreign key constraint fk_dtele7l for appl_cd of application_t
-- Modify Foreign key constraint fk_dtele8r for appl_cd of application_t
CREATE TABLE dbo.condition_detail_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cond_id                     INT NOT NULL,
    cond_dtl_seq_num            SMALLINT NOT NULL,
    vobj_typ_cd                 CHAR(8),
    rlobj_typ_cd                CHAR(8),
    left_cond_id                INT,
    left_data_ele_id            INT,
    rght_data_ele_id            INT,
    cmpr_typ_cd                 CHAR(8),
    oper_typ_cd                 CHAR(8),
    cond_cmpr_typ_cd            CHAR(8),
    cond_dtl_open_paren_txt     CHAR(8),
    cond_dtl_close_paren_txt    CHAR(8),
    cond_dtl_vlu_txt            VARCHAR(100),
    cond_dtl_col_nm             VARCHAR(50),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_condition_detail_t PRIMARY KEY (appl_cd, cond_id, cond_dtl_seq_num),
    CONSTRAINT fk_cmpr2 FOREIGN KEY (cmpr_typ_cd) REFERENCES dbo.compare_type_t (cmpr_typ_cd),
    CONSTRAINT fk_cmpr3 FOREIGN KEY (cond_cmpr_typ_cd) REFERENCES dbo.compare_type_t (cmpr_typ_cd),
    CONSTRAINT fk_cndtl1 FOREIGN KEY (appl_cd, left_cond_id) REFERENCES dbo.condition_t (appl_cd, cond_id),
    CONSTRAINT fk_cond1 FOREIGN KEY (appl_cd, cond_id) REFERENCES dbo.condition_t (appl_cd, cond_id),
    CONSTRAINT fk_dtele7l FOREIGN KEY (appl_cd, left_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_dtele8r FOREIGN KEY (appl_cd, rght_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_oper4 FOREIGN KEY (oper_typ_cd) REFERENCES dbo.operator_type_t (oper_typ_cd),
    CONSTRAINT fk_rlobj2r FOREIGN KEY (rlobj_typ_cd) REFERENCES dbo.rule_object_type_t (rlobj_typ_cd),
    CONSTRAINT fk_vobj1 FOREIGN KEY (vobj_typ_cd) REFERENCES dbo.variable_object_type_t (vobj_typ_cd)
)
/

-- dbo.response_detail_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_dtele3l by adding appl_cd
-- Modify Foreign Key constraint fk_dtele4r by adding appl_cd
-- Modify Foreign Key constraint fk_resp4 by adding appl_cd
CREATE TABLE dbo.response_detail_t
(
    appl_cd                     CHAR(8) NOT NULL,
    resp_id                     INT NOT NULL,
    resp_dtl_seq_num            SMALLINT NOT NULL,
    cmpr_typ_cd                 CHAR(8),
    cond_oper_typ_cd            CHAR(8),
    left_data_ele_id            INT,
    rlobj_typ_cd                CHAR(8),
    rght_data_ele_id            INT,
    resp_dtl_open_paren_txt     CHAR(8),
    resp_dtl_close_paren_txt    CHAR(8),
    resp_dtl_col_nm             VARCHAR(50),
    resp_dtl_vlu_txt            VARCHAR(100),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_response_detail_t PRIMARY KEY (appl_cd, resp_id, resp_dtl_seq_num),
    CONSTRAINT fk_cmpr1 FOREIGN KEY (cmpr_typ_cd) REFERENCES dbo.compare_type_t (cmpr_typ_cd),
    CONSTRAINT fk_dtele3l FOREIGN KEY (appl_cd, left_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_dtele4r FOREIGN KEY (appl_cd, rght_data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_oper5 FOREIGN KEY (cond_oper_typ_cd) REFERENCES dbo.operator_type_t (oper_typ_cd),
    CONSTRAINT fk_resp4 FOREIGN KEY (appl_cd, resp_id) REFERENCES dbo.response_t (appl_cd, resp_id),
    CONSTRAINT fk_rlobj1r FOREIGN KEY (rlobj_typ_cd) REFERENCES dbo.rule_object_type_t (rlobj_typ_cd)
)
/

-- dbo.appl_api_filter_t
CREATE TABLE dbo.appl_api_filter_t
(
    appl_cd                     CHAR(8) NOT NULL,
    appl_api_filter_seq_num     SMALLINT NOT NULL,
    appl_api_filter_txt         VARCHAR(100) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    appl_api_filter_jar_nm      VARCHAR(100),
    CONSTRAINT pk_appl_api_filter_t PRIMARY KEY (appl_cd, appl_api_filter_seq_num),
    CONSTRAINT fk_appl3 FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd)
)
/

-- dbo.rule_section_resp_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_rlsect1 for appl_cd
-- Modify Foreign Key constraint fk_rlsect2 for appl_cd
-- Modify Foreign Key constraint fk_resp5 for appl_cd
CREATE TABLE dbo.rule_section_resp_t
(
    appl_cd                     CHAR(8) NOT NULL,
    rule_id                     INT NOT NULL,
    rule_sect_seq_num           SMALLINT NOT NULL,
    rlsect_resp_seq_num         SMALLINT NOT NULL,
    next_rule_sect_seq_num      SMALLINT,
    syst_cond_cd                CHAR(8),
    resp_id                     INT,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_rule_section_resp_t PRIMARY KEY (appl_cd, rule_id, rule_sect_seq_num, rlsect_resp_seq_num),
    CONSTRAINT fk_resp5 FOREIGN KEY (appl_cd, resp_id) REFERENCES dbo.response_t (appl_cd, resp_id),
    CONSTRAINT fk_rlsect1 FOREIGN KEY (appl_cd, rule_id, rule_sect_seq_num) REFERENCES dbo.rule_section_t (appl_cd, rule_id, rule_sect_seq_num),
    CONSTRAINT fk_rlsect2 FOREIGN KEY (appl_cd, rule_id, next_rule_sect_seq_num) REFERENCES dbo.rule_section_t (appl_cd, rule_id, rule_sect_seq_num),
    CONSTRAINT fk_syscd1 FOREIGN KEY (syst_cond_cd) REFERENCES dbo.system_condition_t (syst_cond_cd)
)
/

-- dbo.tbl_control
-- Add appl_cd column
-- Modify Primary Key pk_tbl_control by adding appl_cd
-- Added Foreign Key fk_appl5 by adding appl_cd
CREATE TABLE dbo.tbl_control
(
    appl_cd                     CHAR(8) NOT NULL,
    maxid                       INT,
    objectname                  CHAR(50) NOT NULL,
    createddate                 dbo.dom_lst_upd_dtm,
    modifieddate                dbo.dom_lst_upd_dtm,
    createdby                   VARCHAR(20),
    modifiedby                  VARCHAR(20),
    CONSTRAINT pk_tbl_control PRIMARY KEY (appl_cd, objectname),
    CONSTRAINT fk_appl5 FOREIGN KEY (appl_cd) REFERENCES dbo.application_t (appl_cd)
)
/

-- dbo.event_test_data_map_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_dtele12 by adding appl_cd
-- Modify Foreign key constraint fk_ctest1 by adding appl_cd
CREATE TABLE dbo.event_test_data_map_t
(
    appl_cd                     CHAR(8) NOT NULL,
    evtest_id                   INT NOT NULL,
    data_ele_id                 INT NOT NULL,
    test_vlu_seq_num            SMALLINT NOT NULL,
    test_vlu_txt                VARCHAR(100),
    test_api_java_nm            VARCHAR(250),
    test_api_meth_nm            VARCHAR(100),
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_event_test_data_map_t PRIMARY KEY (appl_cd, evtest_id, data_ele_id, test_vlu_seq_num),
    CONSTRAINT fk_ctest1 FOREIGN KEY (appl_cd, evtest_id) REFERENCES dbo.event_test_t (appl_cd, evtest_id),
    CONSTRAINT fk_dtele12 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id)
)
/

-- dbo.cond_data_map_t
-- Add appl_cd column
-- Make appl_cd as part of primary key
-- Modify Foreign key constraint fk_cond2 for appl_cd of application_t
-- Modify Foreign key constraint fk_dtele6 for appl_cd of application_t
CREATE TABLE dbo.cond_data_map_t
(
    appl_cd                     CHAR(8) NOT NULL,
    cond_id                     INT NOT NULL,
    cond_dtmap_seq_num          SMALLINT NOT NULL,
    data_ele_id                 INT NOT NULL,
    cond_dtmap_parm_nm          VARCHAR(250) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_cond_data_map_t PRIMARY KEY (appl_cd, cond_id, cond_dtmap_seq_num),
    CONSTRAINT fk_cond2 FOREIGN KEY (appl_cd, cond_id) REFERENCES dbo.condition_t (appl_cd, cond_id),
    CONSTRAINT fk_dtele6 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id)
)
/

-- dbo.event_mand_data_element_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify Foreign Key constraint fk_dtele10 by adding appl_cd
-- Modify Foreign Key constraint fk_evnt2 by adding appl_cd

CREATE TABLE dbo.event_mand_data_element_t
(
    appl_cd                     CHAR(8) NOT NULL,
    data_ele_id                 INT NOT NULL,
    event_cd                    CHAR(8) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_event_mand_data_element_t PRIMARY KEY (appl_cd, data_ele_id, event_cd),
    CONSTRAINT fk_dtele10 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id),
    CONSTRAINT fk_evnt2 FOREIGN KEY (appl_cd, event_cd) REFERENCES dbo.event_t (appl_cd, event_cd)
)
/

-- dbo.data_element_array_t
-- Add appl_cd column
-- Make use of appl_cd in primary key
-- Modify foreign key constraint fk_dtele5 for appl_cd of application_t
CREATE TABLE dbo.data_element_array_t
(
    appl_cd                     CHAR(8) NOT NULL,
    data_ele_id                 INT NOT NULL,
    data_ele_array_seq_num      SMALLINT NOT NULL,
    data_ele_array_vlu_txt      VARCHAR(100) NOT NULL,
    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,
    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,
    CONSTRAINT pk_data_element_array_t PRIMARY KEY (appl_cd, data_ele_id, data_ele_array_seq_num),
    CONSTRAINT fk_dtele5 FOREIGN KEY (appl_cd, data_ele_id) REFERENCES dbo.data_element_t (appl_cd, data_ele_id)
)
/
