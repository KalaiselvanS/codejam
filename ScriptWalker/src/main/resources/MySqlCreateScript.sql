CREATE TABLE `exceptions` (
  `excep_cd` varchar(20) NOT NULL,
  `excep_msg` mediumtext NOT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`excep_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `visa_type` (
  `Visa_typ_cd` varchar(8) NOT NULL,
  `Visa_typ_dsc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`Visa_typ_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mand_priority` (
  `mand_priority_id` int(11) NOT NULL,
  `mand_priority_desc` varchar(20) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mand_priority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `adr_typ` (
  `adrt_cd` varchar(8) NOT NULL,
  `adrt_dsc` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`adrt_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL,
  `agent_cd` char(10) NOT NULL,
  `agent_frst_nm` varchar(50) DEFAULT NULL,
  `agent_last_nm` varchar(50) DEFAULT NULL,
  `agnt_ssn` varchar(12) DEFAULT NULL,
  `agnt_dob` datetime DEFAULT NULL,
  `agnt_phone` varchar(22) DEFAULT NULL,
  `agnt_street` varchar(100) DEFAULT NULL,
  `agnt_city` varchar(100) DEFAULT NULL,
  `agnt_state` char(2) DEFAULT NULL,
  `agnt_zip` varchar(10) DEFAULT NULL,
  `agnt_email` varchar(100) DEFAULT NULL,
  `agnt_npn` varchar(10) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `office_cd` int(11) DEFAULT NULL,
  `agent_type` varchar(10) DEFAULT NULL,
  `agent_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `reqt_category` (
  `reqt_cat_cd` varchar(8) NOT NULL,
  `reqt_cat_dsc` varchar(200) NOT NULL,
  `reqt_cat_sort_num` smallint(6) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`reqt_cat_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `tbl_control` (
  `MAXID` int(11) DEFAULT NULL,
  `OBJECTNAME` varchar(50) NOT NULL,
  `CREATEDDATE` datetime DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `CREATEDBY` varchar(20) DEFAULT NULL,
  `MODIFIEDBY` varchar(20) DEFAULT NULL,
  `REGION_CD` varchar(20) DEFAULT NULL,
  `TBL_CONTROL_ID` int(11) NOT NULL,
  PRIMARY KEY (`TBL_CONTROL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `bene_category` (
  `bene_cat_id` int(11) NOT NULL,
  `bene_cat_nm` varchar(50) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bene_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `bene_typ` (
  `bene_typ_cd` varchar(8) NOT NULL,
  `bene_typ_nm` varchar(20) DEFAULT NULL,
  `bene_sort_num` smallint(6) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bene_typ_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `best_time_to_call` (
  `bst_time_to_call_cd` varchar(8) NOT NULL,
  `bst_time_to_call_desc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`bst_time_to_call_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `best_place_to_call` (
  `bst_plce_to_call_cd` varchar(8) NOT NULL,
  `bst_plce_to_call_nm` varchar(20) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`bst_plce_to_call_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `inforce_pending_option` (
  `inf_pend_cd` varchar(8) NOT NULL,
  `inf_pend_desc` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`inf_pend_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `ins_income_details` (
  `ins_income_quest_id` int(11) NOT NULL,
  `ins_quest_desc` varchar(250) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ins_income_quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `tab` (
  `tab_id` int(11) NOT NULL,
  `tab_nm` varchar(50) NOT NULL,
  `tab_desc` varchar(250) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `gender` (
  `gndr_cd` char(1) NOT NULL,
  `gndr` varchar(10) NOT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`gndr_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `inforce_exchange_type` (
  `ex_type_id` int(11) NOT NULL,
  `ex_type` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`ex_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `inforce_status` (
  `statusId` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `teams` (
  `teamid` int(11) NOT NULL,
  `teamname` varchar(100) NOT NULL,
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `parent_team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`teamid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_group` (
  `case_grp_num` int(11) NOT NULL,
  `case_grp_desc` varchar(250) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`case_grp_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mib_ecg_sub_type` (
  `ecg_id` int(11) NOT NULL,
  `ecg_cd` varchar(20) NOT NULL,
  `ecg_cd_tranin` varchar(100) DEFAULT NULL,
  `cd_usg_strting_dt` datetime NOT NULL,
  `cd_usg_ending_dt` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ecg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `tobacco_use` (
  `tob_use_cd` varchar(8) NOT NULL,
  `tob_use_dsc` varchar(20) DEFAULT NULL,
  `tob_use_sort_num` char(2) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tob_use_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_role` (
  `case_role_cd` varchar(8) NOT NULL,
  `case_role_dsc` varchar(20) NOT NULL,
  `sort_order` smallint(6) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`case_role_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_status` (
  `case_stat_cd` varchar(8) NOT NULL,
  `case_stat_dsc` varchar(40) NOT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `is_final_ind` char(1) DEFAULT NULL,
  PRIMARY KEY (`case_stat_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `usercompany` (
  `userid` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`userid`,`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_type` (
  `case_typ_cd` varchar(8) NOT NULL,
  `case_typ_dsc` varchar(20) DEFAULT NULL,
  `case_sort_num` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`case_typ_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `line_of_busin` (
  `lin_of_busin_cd` varchar(8) NOT NULL,
  `lin_of_busin_dsc` varchar(250) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(8) NOT NULL,
  PRIMARY KEY (`lin_of_busin_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `level_year` (
  `level_year_id` int(11) NOT NULL,
  `level_year_value` int(11) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `userrole` (
  `role_cd` varchar(8) NOT NULL,
  `sl_role_dsc` varchar(100) NOT NULL,
  `is_work_alloc_ind` char(1) NOT NULL,
  `can_case_trn_to` char(1) DEFAULT NULL,
  `can_refer_case_to` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`role_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `interest_rate` (
  `interest_rate_id` int(11) NOT NULL,
  `interest_rate_value` int(11) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `name_prefix` (
  `nm_pfx_cd` varchar(8) NOT NULL,
  `nm_pfx_dsc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nm_pfx_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `name_suffix` (
  `nm_sfx_cd` varchar(8) NOT NULL,
  `nm_sfx_dsc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nm_sfx_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `uw_decision` (
  `uw_decn_cd` varchar(8) NOT NULL,
  `uw_decn_nm` varchar(20) NOT NULL,
  `uw_decn_desc` varchar(250) DEFAULT NULL,
  `uw_decn_sort_num` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  PRIMARY KEY (`uw_decn_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `occupation` (
  `occ_typ_cd` varchar(8) NOT NULL,
  `occ_typ_dsc` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`occ_typ_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `button_info` (
  `button_id` int(11) NOT NULL,
  `button_disp_nm` varchar(100) DEFAULT NULL,
  `js_func_nm` varchar(100) DEFAULT NULL,
  `alignment` varchar(50) DEFAULT NULL,
  `lst_updt_user_id` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `button_nm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient_inforce_ques` (
  `cpcli_id` int(11) NOT NULL,
  `replacement_ind` char(1) DEFAULT NULL,
  `inforce_app_ind` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `tax_certification` (
  `tax_cert_id` int(11) NOT NULL,
  `tax_cert_desc` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`tax_cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `communication_frequency` (
  `com_freq_cd` varchar(8) NOT NULL,
  `com_freq_dsc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`com_freq_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `workitem` (
  `workitemid` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `isLinkReqd` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `is_duplicate_ind` char(1) DEFAULT NULL,
  `is_initator_ind` char(1) DEFAULT NULL,
  `priority_cd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`workitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `ctry` (
  `ctry_cd` char(3) NOT NULL,
  `ctry_nm` varchar(50) DEFAULT NULL,
  `ctry_sort_num` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `ctr_acord_cd` int(11) DEFAULT NULL,
  PRIMARY KEY (`ctry_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `plan_di_occp_class` (
  `plan_di_occp_class_id` int(11) NOT NULL,
  `plan_di_occp_class_nm` varchar(100) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`plan_di_occp_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `distrib_contact_person` (
  `ctct_id` int(11) NOT NULL,
  `ctct_last_nm` varchar(20) DEFAULT NULL,
  `ctct_frst_nm` varchar(20) DEFAULT NULL,
  `ctct_phon_num` varchar(20) DEFAULT NULL,
  `ctct_fax_num` varchar(20) DEFAULT NULL,
  `ctct_email_txt` varchar(20) DEFAULT NULL,
  `ctct_sales_ofc_nm` varchar(20) DEFAULT NULL,
  `ctct_sales_ofc_num` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ctct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `plan_rate_class` (
  `plan_rate_class_id` int(11) NOT NULL,
  `plan_rate_class_nm` varchar(100) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`plan_rate_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pref_class` (
  `pref_cls_id` int(11) NOT NULL,
  `pref_cls_nm` varchar(50) NOT NULL,
  `pref_cls_desc` varchar(250) DEFAULT NULL,
  `is_active_ind` char(1) NOT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  PRIMARY KEY (`pref_cls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `prioritycolor` (
  `priority_cd` varchar(8) NOT NULL,
  `color_nm` varchar(100) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`priority_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `employer` (
  `employer_id` int(11) NOT NULL,
  `tin` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `group_num` varchar(100) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `country` char(3) DEFAULT NULL,
  `zip1` int(11) DEFAULT NULL,
  `zip2` int(11) DEFAULT NULL,
  `prod_nm` varchar(100) DEFAULT NULL,
  `prod_type` varchar(50) DEFAULT NULL,
  `comp_nm` varchar(100) DEFAULT NULL,
  `uw_type` varchar(10) DEFAULT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`employer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `inf_contact_category` (
  `cntct_catgry_id` int(11) NOT NULL,
  `cntct_catgry_dsc` varchar(50) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`cntct_catgry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `project_classes` (
  `class_iden_cd` varchar(10) NOT NULL,
  `project_cd` varchar(4) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `lst_updt_user_id` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`class_iden_cd`,`project_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `inf_contact_type` (
  `contact_type_id` int(11) NOT NULL,
  `contact_typ_dsc` varchar(50) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`contact_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mib_code` (
  `mib_cd_id` int(11) NOT NULL,
  `mib_cd` int(11) NOT NULL,
  `mib_cd_tranln` varchar(200) DEFAULT NULL,
  `cd_usg_strting_dt` datetime NOT NULL,
  `cd_usg_ending_dt` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`mib_cd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mib_modfrdegree_cd` (
  `mdfr_degree_id` int(11) NOT NULL,
  `mdfr_degree_cd` char(1) NOT NULL,
  `mdfr_degree_tranln` varchar(200) DEFAULT NULL,
  `cd_usg_strting_dt` datetime NOT NULL,
  `cd_usg_ending_dt` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`mdfr_degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `company` (
  `comp_id` int(11) NOT NULL,
  `comp_cd` varchar(8) NOT NULL,
  `comp_full_nm` varchar(100) NOT NULL,
  `archiving_days` int(11) DEFAULT NULL,
  `archiving_path` varchar(100) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `parent_comp_id` int(11) DEFAULT NULL,
  `setup_allow_ind` char(1) DEFAULT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mdc_response` (
  `mdc_response_id` int(11) NOT NULL,
  `mdc_response_nm` varchar(100) NOT NULL,
  `bre_event_cd` char(8) NOT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`mdc_response_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `app_case_details` (
  `case_id` int(11) NOT NULL,
  `premium_typ_id` int(11) DEFAULT NULL,
  `premium_amt` decimal(19,2) DEFAULT NULL,
  `unsheduled_prem_amt` decimal(19,2) DEFAULT NULL,
  `pri_prog_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `inf_suboff_num` varchar(50) DEFAULT NULL,
  `dist_chan_id` int(11) DEFAULT NULL,
  `inf_typ_id` int(11) DEFAULT NULL,
  `inf_pri_id` int(11) DEFAULT NULL,
  `inf_pri_rea_chg_id` int(11) DEFAULT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `case_details_id` int(11) NOT NULL,
  `prirty_man_chg_ind` char(1) DEFAULT NULL,
  `mail_sent_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`case_details_id`),
  KEY `fk_app_case_details_app_case` (`case_id`),
  KEY `fk_app_case_details_dist_channel` (`dist_chan_id`),
  KEY `fk_app_case_details_inf_pri_rea_change` (`inf_pri_rea_chg_id`),
  KEY `fk_app_case_details_inf_priority` (`inf_pri_id`),
  KEY `fk_app_case_details_informal_type` (`inf_typ_id`),
  KEY `fk_app_case_details_off_dist_channel` (`office_id`),
  KEY `fk_app_case_details_premium_type` (`premium_typ_id`),
  KEY `fk_app_case_details_priority_program` (`pri_prog_id`),
  CONSTRAINT `fk_app_case_details_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_dist_channel` FOREIGN KEY (`dist_chan_id`) REFERENCES `dist_channel` (`dist_chan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_informal_type` FOREIGN KEY (`inf_typ_id`) REFERENCES `informal_type` (`inf_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_inf_priority` FOREIGN KEY (`inf_pri_id`) REFERENCES `inf_priority` (`inf_pri_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_inf_pri_rea_change` FOREIGN KEY (`inf_pri_rea_chg_id`) REFERENCES `inf_pri_rea_change` (`inf_pri_rea_chg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_off_dist_channel` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_premium_type` FOREIGN KEY (`premium_typ_id`) REFERENCES `premium_type` (`premium_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_details_priority_program` FOREIGN KEY (`pri_prog_id`) REFERENCES `priority_program` (`pri_prog_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient` (
  `pcli_id` int(11) NOT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `adrt_cd` varchar(8) DEFAULT NULL,
  `lin_of_busin_cd` varchar(8) DEFAULT NULL,
  `pcli_typ_cd` varchar(8) DEFAULT NULL,
  `brth_stpr_cd` char(2) DEFAULT NULL,
  `nm_sfx_cd` varchar(8) DEFAULT NULL,
  `occ_typ_cd` varchar(8) DEFAULT NULL,
  `dlic_stpr_cd` char(2) DEFAULT NULL,
  `nm_pfx_cd` varchar(8) DEFAULT NULL,
  `pcli_full_nm` varchar(110) DEFAULT NULL,
  `pcli_frst_nm` varchar(110) DEFAULT NULL,
  `pcli_mid_nm` varchar(20) DEFAULT NULL,
  `pcli_last_nm` varchar(20) DEFAULT NULL,
  `pcli_tin_num` char(11) DEFAULT NULL,
  `pcli_birth_dt` datetime DEFAULT NULL,
  `gndr_cd` char(1) DEFAULT NULL,
  `pcli_us_ctzn_ind` char(1) DEFAULT NULL,
  `pcli_grncd_visa_ind` char(1) DEFAULT NULL,
  `pcli_perm_usres_ind` char(1) DEFAULT NULL,
  `visa_typ_cd` varchar(8) DEFAULT NULL,
  `pcli_usres_yrs_num` smallint(6) DEFAULT NULL,
  `pcli_dlic_num` varchar(20) DEFAULT NULL,
  `pcli_tin_cert_ind` char(1) DEFAULT NULL,
  `pcli_email_addr_txt` varchar(250) DEFAULT NULL,
  `pcli_dlic_prvd_ind` char(1) DEFAULT NULL,
  `ctry_cd` char(3) DEFAULT NULL,
  `pcli_Res_US` char(1) DEFAULT NULL,
  `employer_nm` varchar(200) DEFAULT NULL,
  `occupation_nm` varchar(200) DEFAULT NULL,
  `othr_brth_ctry_nm` varchar(25) DEFAULT NULL,
  `othr_res_ctry_nm` varchar(25) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `tobacco_use` char(1) DEFAULT NULL,
  `pclI_othr_ctry_nm` varchar(25) DEFAULT NULL,
  `othr_brth_stpr_nm` varchar(25) DEFAULT NULL,
  `last_exam_date` datetime DEFAULT NULL,
  `testColumn` varchar(50) DEFAULT NULL,
  `tax_id` varchar(20) DEFAULT NULL,
  `owner_comments` mediumtext,
  `owner_payer_ind` char(1) DEFAULT NULL,
  `feet` smallint(6) DEFAULT NULL,
  `inches` smallint(6) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `client_syskey` varchar(100) DEFAULT NULL,
  `pcli_othr_stpr_cd` varchar(100) DEFAULT NULL,
  `tax_cert_id` int(11) DEFAULT NULL,
  `tob_use_cd` varchar(8) DEFAULT NULL,
  `pcli_source` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`pcli_id`),
  KEY `fk__pclient__adrt_cd__3e1e0538` (`adrt_cd`),
  KEY `fk__pclient__brth_st__634f89e7` (`brth_stpr_cd`),
  KEY `fk__pclient__dlic_st__6537d259` (`dlic_stpr_cd`),
  KEY `fk__pclient__nm_pfx___662bf692` (`nm_pfx_cd`),
  KEY `fk__pclient__nm_sfx___67201acb` (`nm_sfx_cd`),
  KEY `fk__pclient__occ_typ__68143f04` (`occ_typ_cd`),
  KEY `fk__pclient__pcli_ty__6908633d` (`pcli_typ_cd`),
  KEY `fk_pclient_gender` (`gndr_cd`),
  KEY `fk_pclient_tax_certification` (`tax_cert_id`),
  KEY `fk_pclient_visa_type` (`visa_typ_cd`),
  CONSTRAINT `fk_pclient_gender` FOREIGN KEY (`gndr_cd`) REFERENCES `gender` (`gndr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pclient_tax_certification` FOREIGN KEY (`tax_cert_id`) REFERENCES `tax_certification` (`tax_cert_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pclient_visa_type` FOREIGN KEY (`visa_typ_cd`) REFERENCES `visa_type` (`Visa_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__adrt_cd__3e1e0538` FOREIGN KEY (`adrt_cd`) REFERENCES `adr_typ` (`adrt_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__brth_st__634f89e7` FOREIGN KEY (`brth_stpr_cd`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__dlic_st__6537d259` FOREIGN KEY (`dlic_stpr_cd`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__nm_pfx___662bf692` FOREIGN KEY (`nm_pfx_cd`) REFERENCES `name_prefix` (`nm_pfx_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__nm_sfx___67201acb` FOREIGN KEY (`nm_sfx_cd`) REFERENCES `name_suffix` (`nm_sfx_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__occ_typ__68143f04` FOREIGN KEY (`occ_typ_cd`) REFERENCES `occupation` (`occ_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient__pcli_ty__6908633d` FOREIGN KEY (`pcli_typ_cd`) REFERENCES `pclient_type` (`pcli_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `feature_set_resp` (
  `feat_set_id` int(11) NOT NULL,
  `feat_id` int(11) NOT NULL,
  `feat_dspl_cd` varchar(8) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  PRIMARY KEY (`feat_id`,`feat_dspl_cd`,`feat_set_id`),
  CONSTRAINT `fk_feature_set_resp_feature_resp` FOREIGN KEY (`feat_id`, `feat_dspl_cd`) REFERENCES `feature_resp` (`feat_id`, `feat_dspl_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `time_service_goal` (
  `case_typ_cd` varchar(8) NOT NULL,
  `inf_typ_id` int(11) NOT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`case_typ_cd`,`inf_typ_id`),
  KEY `fk_time_service_goal_informal_type` (`inf_typ_id`),
  CONSTRAINT `fk_time_service_goal_case_type` FOREIGN KEY (`case_typ_cd`) REFERENCES `case_type` (`case_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_time_service_goal_informal_type` FOREIGN KEY (`inf_typ_id`) REFERENCES `informal_type` (`inf_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mand_validations` (
  `case_typ_cd` varchar(8) NOT NULL,
  `fld_bank_uni_id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `man_field_message` varchar(200) DEFAULT NULL,
  `is_active_ind` char(1) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `mand_field_id` int(11) NOT NULL,
  `mand_priority_id` int(11) DEFAULT NULL,
  `tab_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`case_typ_cd`,`fld_bank_uni_id`,`comp_id`),
  KEY `fk__mand_vali__comp___3f51553c` (`comp_id`),
  KEY `fk__mand_vali__fld_b__797df6d1` (`fld_bank_uni_id`),
  KEY `fk__mand_vali__rule___7a721b0a` (`rule_id`),
  CONSTRAINT `fk_mand_validations_case_type` FOREIGN KEY (`case_typ_cd`) REFERENCES `case_type` (`case_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__mand_vali__comp___3f51553c` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__mand_vali__fld_b__797df6d1` FOREIGN KEY (`fld_bank_uni_id`) REFERENCES `field_bank` (`fld_bank_uni_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__mand_vali__rule___7a721b0a` FOREIGN KEY (`rule_id`) REFERENCES `rule_master` (`rule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `field_bank` (
  `fld_bank_uni_id` int(11) NOT NULL,
  `field_bank_typid` int(11) NOT NULL,
  `fld_nm` varchar(50) NOT NULL,
  `fld_disp_nm` varchar(50) NOT NULL,
  `fld_desc` varchar(250) DEFAULT NULL,
  `datatypeid` int(11) NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fld_bank_uni_id`),
  KEY `fk_field_bank_field_bank_modtyp` (`field_bank_typid`),
  CONSTRAINT `fk_field_bank_field_bank_modtyp` FOREIGN KEY (`field_bank_typid`) REFERENCES `field_bank_modtyp` (`field_bank_typid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient_address` (
  `pcli_id` int(11) NOT NULL,
  `pcladr_seq_num` int(11) NOT NULL,
  `adrt_cd` varchar(8) DEFAULT NULL,
  `stpr_cd` char(2) DEFAULT NULL,
  `ctry_cd` char(3) DEFAULT NULL,
  `pcladr_ln_one_txt` varchar(110) DEFAULT NULL,
  `pcladr_ln_two_txt` varchar(110) DEFAULT NULL,
  `pcladr_ln_three_txt` varchar(110) DEFAULT NULL,
  `pcladr_cnty_nm` varchar(20) DEFAULT NULL,
  `pcladr_city_nm` varchar(20) DEFAULT NULL,
  `pcladr_for_st_nm` varchar(20) DEFAULT NULL,
  `pcladr_zip_cd` varchar(20) DEFAULT NULL,
  `pcladr_zip_plus4_cd` varchar(4) DEFAULT NULL,
  `othr_ctry_nm` varchar(25) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `pcl_adr_ln_four_txt` varchar(110) DEFAULT NULL,
  `addr_typ_cd` char(2) DEFAULT NULL,
  `Pcl_oth_addr_stnm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pcli_id`,`pcladr_seq_num`),
  KEY `fk__pclient_a__adrt___22fffaa8` (`adrt_cd`),
  KEY `fk__pclient_a__ctry___0e7913b7` (`ctry_cd`),
  KEY `fk__pclient_a__stpr___6dcd185a` (`stpr_cd`),
  CONSTRAINT `fk__pclient_a__adrt___22fffaa8` FOREIGN KEY (`adrt_cd`) REFERENCES `adr_typ` (`adrt_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient_a__ctry___0e7913b7` FOREIGN KEY (`ctry_cd`) REFERENCES `ctry` (`ctry_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient_a__pcli___6cd8f421` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient_a__stpr___6dcd185a` FOREIGN KEY (`stpr_cd`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `relationship_typ` (
  `relation_cd` varchar(8) NOT NULL,
  `relationship_cd` char(2) NOT NULL,
  `relationship_nm` varchar(20) DEFAULT NULL,
  `rel_sort_num` int(11) DEFAULT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`relation_cd`,`relationship_cd`),
  KEY `fk_relationship_typ_company` (`comp_id`),
  KEY `fk_relationship_typ_relationship` (`relationship_cd`),
  CONSTRAINT `fk_relationship_typ_company` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_relationship_typ_relationship` FOREIGN KEY (`relationship_cd`) REFERENCES `relationship` (`relationship_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_agent` (
  `case_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `csdstr_shr_pct` int(11) DEFAULT NULL,
  `agnt_sort_num` smallint(6) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(30) NOT NULL,
  `case_agnt_cd` varchar(10) DEFAULT NULL,
  `agnt_phone` varchar(22) DEFAULT NULL,
  `agnt_email` varchar(100) DEFAULT NULL,
  `com_freq_cd` varchar(8) DEFAULT NULL,
  `com_mode_cd` varchar(8) DEFAULT NULL,
  `agnt_fax_num` varchar(20) DEFAULT NULL,
  `agnt_npn` varchar(10) DEFAULT NULL,
  `office_cd` int(11) DEFAULT NULL,
  `agent_type` varchar(10) DEFAULT NULL,
  `agent_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`case_id`,`agent_id`),
  KEY `fk_case_agent_agent` (`agent_id`),
  CONSTRAINT `fk_case_agent_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_agen__case___0f2e0c25` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `requirement` (
  `reqt_id` int(11) NOT NULL,
  `coll_meth_cd` varchar(8) NOT NULL,
  `reqt_nm` varchar(50) NOT NULL,
  `reqt_disp_nm` varchar(50) DEFAULT NULL,
  `reqt_cat_cd` varchar(8) NOT NULL,
  `lvl_cd` varchar(8) DEFAULT NULL,
  `reqt_typ_cd` varchar(8) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `form_st_typ_cd` varchar(8) DEFAULT NULL,
  `nbreqt_fwp_days_num` int(11) DEFAULT NULL,
  `nbreqt_sort_num` int(11) NOT NULL DEFAULT '0',
  `nbreqt_man_gen_ind` char(1) NOT NULL,
  `nbreqt_mult_gen_ind` char(1) DEFAULT NULL,
  `nbreqt_com_field_ind` char(1) DEFAULT NULL,
  `is_deft_reqt_ind` char(1) DEFAULT NULL,
  `is_auto_ord_ind` char(1) DEFAULT NULL,
  `reqt_dflt_unnec_waiv_ind` char(1) DEFAULT NULL,
  `is_repentrd_ind` smallint(6) NOT NULL,
  `is_service_prov_ind` char(1) DEFAULT 'N',
  `is_prov_info_ind` char(1) DEFAULT NULL,
  `valid_days` int(11) DEFAULT NULL,
  `is_active_ind` char(1) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `fee_ind` varchar(1) DEFAULT NULL,
  `expiry_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`reqt_id`),
  KEY `fk__requireme__coll___56f3d4a3` (`coll_meth_cd`),
  KEY `fk__requireme__comp___57e7f8dc` (`comp_id`),
  KEY `fk__requireme__form___58dc1d15` (`form_st_typ_cd`),
  KEY `fk__requireme__lvl_c__59d0414e` (`lvl_cd`),
  KEY `fk__requireme__reqt___5ac46587` (`reqt_cat_cd`),
  KEY `fk__requireme__reqt___5bb889c0` (`reqt_typ_cd`),
  KEY `fk__requireme__vendo__5da0d232` (`vendor_id`),
  CONSTRAINT `fk__requireme__coll___56f3d4a3` FOREIGN KEY (`coll_meth_cd`) REFERENCES `collection_method` (`coll_meth_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__comp___57e7f8dc` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__form___58dc1d15` FOREIGN KEY (`form_st_typ_cd`) REFERENCES `form_state_type` (`form_st_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__lvl_c__59d0414e` FOREIGN KEY (`lvl_cd`) REFERENCES `reqt_level` (`lvl_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__reqt___5ac46587` FOREIGN KEY (`reqt_cat_cd`) REFERENCES `reqt_category` (`reqt_cat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__reqt___5bb889c0` FOREIGN KEY (`reqt_typ_cd`) REFERENCES `reqt_type` (`reqt_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__reqt___5cacadf9` FOREIGN KEY (`reqt_id`) REFERENCES `requirement` (`reqt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__requireme__vendo__5da0d232` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_reqt` (
  `case_reqt_id` int(11) NOT NULL,
  `reqt_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `case_reqt_dsc` varchar(200) DEFAULT NULL,
  `pcli_id` int(11) DEFAULT NULL,
  `case_reqt_uni_id` int(11) DEFAULT NULL,
  `reqt_stat_cd` varchar(8) DEFAULT NULL,
  `coll_meth_cd` varchar(8) DEFAULT NULL,
  `reqt_cat_cd` varchar(8) DEFAULT NULL,
  `gen_catpro_cd` varchar(8) DEFAULT NULL,
  `reqt_ord_dt` datetime DEFAULT NULL,
  `reqt_recd_dt` datetime DEFAULT NULL,
  `reqt_fwp_dt` datetime DEFAULT NULL,
  `reqt_rvwd_dt` datetime DEFAULT NULL,
  `reqt_dflt_unnec_waiv_ind` char(1) DEFAULT NULL,
  `case_clnt_doctr_id` int(11) DEFAULT NULL,
  `provd_ord_num` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `vendor_mgmt_id` int(11) DEFAULT NULL,
  `collection_dt` datetime DEFAULT NULL,
  `response_status` varchar(50) DEFAULT NULL,
  `tax_yr` int(11) DEFAULT NULL,
  `status_ind` char(1) DEFAULT NULL,
  PRIMARY KEY (`case_reqt_id`),
  KEY `fk__case_reqt__gen_c__615232dc` (`gen_catpro_cd`),
  KEY `fk__case_reqt__reqt___633a7b4e` (`reqt_id`),
  KEY `fk__case_reqt__reqt___642e9f87` (`reqt_stat_cd`),
  KEY `fk__case_reqt__reqt___6522c3c0` (`reqt_cat_cd`),
  KEY `fk_case_reqt_app_case` (`case_id`),
  KEY `fk_case_reqt_collection_method` (`coll_meth_cd`),
  KEY `fk_case_reqt_pclient` (`pcli_id`),
  KEY `fk_case_reqt_vendor_mgmt` (`vendor_mgmt_id`),
  CONSTRAINT `fk_case_reqt_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_reqt_collection_method` FOREIGN KEY (`coll_meth_cd`) REFERENCES `collection_method` (`coll_meth_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_reqt_pclient` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_reqt_vendor_mgmt` FOREIGN KEY (`vendor_mgmt_id`) REFERENCES `vendor_mgmt` (`vendor_mgmt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_reqt__gen_c__615232dc` FOREIGN KEY (`gen_catpro_cd`) REFERENCES `gen_from_cat` (`gen_catpro_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_reqt__reqt___633a7b4e` FOREIGN KEY (`reqt_id`) REFERENCES `requirement` (`reqt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_reqt__reqt___642e9f87` FOREIGN KEY (`reqt_stat_cd`) REFERENCES `reqt_status` (`reqt_stat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_reqt__reqt___6522c3c0` FOREIGN KEY (`reqt_cat_cd`) REFERENCES `reqt_category` (`reqt_cat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `office_num` varchar(50) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `office_type_id` int(11) DEFAULT NULL,
  `accept_informal` char(1) DEFAULT NULL,
  `delaware_valley` char(1) DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  KEY `fk_office_office_type` (`office_type_id`),
  CONSTRAINT `fk_office_office_type` FOREIGN KEY (`office_type_id`) REFERENCES `office_type` (`office_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_pur_need_type` (
  `case_pur_need_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `pur_need_typ_id` int(11) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`case_pur_need_id`),
  KEY `fk_case_pur_need_type_adm_pur_need_type` (`pur_need_typ_id`),
  KEY `fk_case_pur_need_type_app_case` (`case_id`),
  CONSTRAINT `fk_case_pur_need_type_adm_pur_need_type` FOREIGN KEY (`pur_need_typ_id`) REFERENCES `adm_pur_need_type` (`pur_need_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_pur_need_type_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `policy_search` (
  `case_id` int(11) NOT NULL,
  `pcli_id` int(11) NOT NULL,
  `policy_number` varchar(20) NOT NULL,
  `policy_eff_date` datetime DEFAULT NULL,
  `policy_issue_date` datetime DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `policy_status` varchar(50) DEFAULT NULL,
  `policy_value` decimal(18,2) DEFAULT NULL,
  `reins_ind` varchar(1) DEFAULT NULL,
  `reins_desc` mediumtext,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`case_id`,`pcli_id`,`policy_number`),
  KEY `fk_policy_search_pclient` (`pcli_id`),
  CONSTRAINT `fk_policy_search_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_policy_search_pclient` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_mand_validation` (
  `case_mand_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `mand_field_id` int(11) NOT NULL,
  `cpcli_id` int(11) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`case_mand_id`),
  KEY `fk_case_mand_validation_app_case` (`case_id`),
  KEY `fk_case_mand_validation_case_pclient_assoc` (`cpcli_id`),
  CONSTRAINT `fk_case_mand_validation_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_mand_validation_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_bene_instruct` (
  `case_id` int(11) NOT NULL,
  `bene_instruct` mediumtext NOT NULL,
  `first_nm` varchar(50) DEFAULT NULL,
  `last_nm` varchar(50) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  CONSTRAINT `fk__case_bene__case___77e09279` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_bene` (
  `bene_uni_num` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `first_nm` varchar(50) DEFAULT NULL,
  `last_nm` varchar(50) DEFAULT NULL,
  `bene_type` varchar(20) DEFAULT NULL,
  `bene_nm` varchar(20) DEFAULT NULL,
  `relation_cd` char(8) DEFAULT NULL,
  `bene_shr_percen` decimal(5,2) DEFAULT NULL,
  `Revocable_Cd` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `DOB` varchar(12) DEFAULT NULL,
  `bene_tin_nm` varchar(11) DEFAULT NULL,
  `bene_mid_nm` varchar(20) DEFAULT NULL,
  `bene_trust_page_ind` char(1) DEFAULT NULL,
  `bene_cat_id` int(11) DEFAULT NULL,
  `client_syskey` varchar(100) DEFAULT NULL,
  `tax_id` varchar(50) DEFAULT NULL,
  `bene_addr1` varchar(50) DEFAULT NULL,
  `bene_addr2` varchar(50) DEFAULT NULL,
  `bene_ctry_cd` char(3) DEFAULT NULL,
  `bene_city_nm` varchar(50) DEFAULT NULL,
  `bene_stpr_cd` char(2) DEFAULT NULL,
  `bene_zip_cd` varchar(5) DEFAULT NULL,
  `bene_zip_plus_cd` varchar(4) DEFAULT NULL,
  `bene_phone_num` varchar(20) DEFAULT NULL,
  `bene_emailid` varchar(150) DEFAULT NULL,
  `bene_tax_cert_id` int(11) DEFAULT NULL,
  `bene_othr_ctry` varchar(50) DEFAULT NULL,
  `bene_othr_state` varchar(50) DEFAULT NULL,
  `bene_relation_desc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bene_uni_num`),
  KEY `fk__case_bene__case___731bdd5c` (`case_id`),
  KEY `fk_case_bene_bene_category` (`bene_cat_id`),
  KEY `fk_case_bene_revocable` (`Revocable_Cd`),
  KEY `fk_case_bene_tax_certification` (`bene_tax_cert_id`),
  CONSTRAINT `fk_case_bene_bene_category` FOREIGN KEY (`bene_cat_id`) REFERENCES `bene_category` (`bene_cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_bene_revocable` FOREIGN KEY (`Revocable_Cd`) REFERENCES `revocable` (`Revocable_Cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_bene_tax_certification` FOREIGN KEY (`bene_tax_cert_id`) REFERENCES `tax_certification` (`tax_cert_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_bene__case___731bdd5c` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_cmnt` (
  `ccmnt_seq_num` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `ccmnt_cat_cd` varchar(8) DEFAULT NULL,
  `ccmnt_typ_cd` varchar(8) DEFAULT NULL,
  `cpcli_id` int(11) DEFAULT NULL,
  `case_reqt_uni_id` int(11) DEFAULT NULL,
  `ccmnt_txt` mediumtext,
  `cmnt_accs_typ_cd` varchar(8) DEFAULT NULL,
  `ccmnt_sys_gen_ind` char(1) DEFAULT NULL,
  `ccmnt_user_full_nm` varchar(100) DEFAULT NULL,
  `ccmnt_cre_dt` datetime DEFAULT NULL,
  `doc_type_id` varchar(50) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_user_id` varchar(20) NOT NULL,
  `comment_id2` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `ix_case_cmnt_autoinc` (`ccmnt_seq_num`),
  KEY `fk_case_cmnt_app_case` (`case_id`),
  KEY `fk_case_cmnt_case_pclient_assoc` (`cpcli_id`),
  KEY `fk_case_cmnt_cmnt_access_types` (`cmnt_accs_typ_cd`),
  CONSTRAINT `fk_case_cmnt_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_cmnt_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_cmnt_cmnt_access_types` FOREIGN KEY (`cmnt_accs_typ_cd`) REFERENCES `cmnt_access_types` (`cmnt_accs_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1
;
CREATE TABLE `case_coverage` (
  `case_coverage_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `pcli_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `pcov_seq_num` int(11) DEFAULT NULL,
  `ccvg_face_amt` varchar(15) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `interest_rate` int(11) DEFAULT NULL,
  `level_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`case_coverage_id`),
  KEY `fk_case_coverage_app_case` (`case_id`),
  KEY `fk_case_coverage_pclient` (`pcli_id`),
  CONSTRAINT `fk_case_coverage_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_coverage_pclient` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_distrib_contact` (
  `case_id` int(11) NOT NULL,
  `ctct_id` int(11) NOT NULL,
  `com_freq_cd` varchar(8) DEFAULT NULL,
  `com_mode_cd` varchar(8) DEFAULT NULL,
  `csdrb_ctct_sort_num` smallint(6) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `contact_type_id` int(11) DEFAULT NULL,
  `cntct_catgry_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`case_id`,`ctct_id`),
  KEY `fk__case_dist__com_f__6da22fd1` (`com_freq_cd`),
  KEY `fk__case_dist__com_m__6e96540a` (`com_mode_cd`),
  KEY `fk__case_dist__ctct___6f8a7843` (`ctct_id`),
  CONSTRAINT `fk__case_dist__case___097532cf` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_dist__com_f__6da22fd1` FOREIGN KEY (`com_freq_cd`) REFERENCES `communication_frequency` (`com_freq_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_dist__com_m__6e96540a` FOREIGN KEY (`com_mode_cd`) REFERENCES `communication_mode` (`com_mode_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_dist__ctct___6f8a7843` FOREIGN KEY (`ctct_id`) REFERENCES `distrib_contact_person` (`ctct_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_pclient_assoc` (
  `cpcli_id` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `case_role_cd` varchar(8) DEFAULT NULL,
  `pcli_id` int(11) DEFAULT NULL,
  `pclrel_typ_cd` varchar(8) DEFAULT NULL,
  `cpcli_age_num` smallint(6) DEFAULT NULL,
  `cpcli_phn_auth_subm_ind` char(1) DEFAULT NULL,
  `cpcli_thd_prty_auth_ind` char(1) DEFAULT NULL,
  `cpcli_same_ownr_ind` char(1) DEFAULT NULL,
  `cpcli_same_payr_ind` char(1) DEFAULT NULL,
  `is_prim_contact_ind` char(1) DEFAULT NULL,
  `isany_ins_curr_inforapp_ind` char(1) DEFAULT NULL,
  `state_spec_repl_form_sub_ind` char(1) DEFAULT NULL,
  `bst_plce_to_call_cd` varchar(8) DEFAULT NULL,
  `bst_time_to_call_cd` varchar(8) DEFAULT NULL,
  `cln_shr_percen` decimal(5,2) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `cpcli_hgt_ft` char(3) DEFAULT NULL,
  `cplci_hgt_in` char(3) DEFAULT NULL,
  `cpcli_wght` char(5) DEFAULT NULL,
  `cplci_wght_lstyr` char(5) DEFAULT NULL,
  `pclrel_othr_dsc` varchar(20) DEFAULT NULL,
  `insured_address_ind` char(1) DEFAULT NULL,
  `related_to` int(11) DEFAULT NULL,
  `owner_payer_ind` char(1) DEFAULT NULL,
  `plan_pref_cls_id` int(11) DEFAULT NULL,
  `tob_use_cd` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`cpcli_id`),
  KEY `fk__case_pcli__bst_p__0f63164f` (`bst_plce_to_call_cd`),
  KEY `fk__case_pcli__bst_t__10573a88` (`bst_time_to_call_cd`),
  KEY `fk__case_pcli__case___55016a90` (`case_id`),
  KEY `fk__case_pcli__case___55f58ec9` (`case_role_cd`),
  KEY `fk__case_pcli__pcli___1333a733` (`pcli_id`),
  CONSTRAINT `fk__case_pcli__bst_p__0f63164f` FOREIGN KEY (`bst_plce_to_call_cd`) REFERENCES `best_place_to_call` (`bst_plce_to_call_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_pcli__bst_t__10573a88` FOREIGN KEY (`bst_time_to_call_cd`) REFERENCES `best_time_to_call` (`bst_time_to_call_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_pcli__case___55016a90` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_pcli__case___55f58ec9` FOREIGN KEY (`case_role_cd`) REFERENCES `case_role` (`case_role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_pcli__pcli___1333a733` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_uw_decn` (
  `case_uw_decn_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `spec_instruct_txt` mediumtext,
  `uw_decn_cd` varchar(8) DEFAULT NULL,
  `uw_reasn_cd` varchar(8) DEFAULT NULL,
  `uw_decn_man_upd_ind` char(1) DEFAULT NULL,
  `issue_by_dt` datetime DEFAULT NULL,
  `plce_by_dt_opt` char(8) DEFAULT NULL,
  `place_by_dt` datetime DEFAULT NULL,
  `ApprovedAmount` decimal(18,0) DEFAULT NULL,
  `is_amnt_cov_justf` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `cosigneeId` int(11) DEFAULT NULL,
  `reasn_for_overrde` varchar(255) DEFAULT NULL,
  `uwchng_appramt_ind` char(1) DEFAULT NULL,
  `effective_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`case_uw_decn_id`),
  KEY `fk_case_uw_decn_app_case` (`case_id`),
  KEY `fk_case_uw_decn_uw_reason` (`uw_reasn_cd`),
  CONSTRAINT `fk_case_uw_decn_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_case_uw_decn_uw_reason` FOREIGN KEY (`uw_reasn_cd`) REFERENCES `uw_reason` (`uw_reasn_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `caseuser` (
  `case_userid` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `role_cd` varchar(8) NOT NULL,
  `from_userid` int(11) DEFAULT NULL,
  `assgn_userid` int(11) NOT NULL,
  `assgn_dtm` datetime NOT NULL,
  `case_user_role_cd` varchar(8) DEFAULT NULL,
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`case_userid`),
  KEY `fk_caseuser_app_case` (`case_id`),
  KEY `fk_caseuser_case_user_role` (`case_user_role_cd`),
  KEY `fk_caseuser_role` (`role_cd`),
  KEY `fk_caseuser_users` (`assgn_userid`),
  KEY `fk_caseuser_users1` (`from_userid`),
  CONSTRAINT `fk_caseuser_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caseuser_case_user_role` FOREIGN KEY (`case_user_role_cd`) REFERENCES `case_user_role` (`case_user_role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caseuser_role` FOREIGN KEY (`role_cd`) REFERENCES `userrole` (`role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caseuser_users` FOREIGN KEY (`assgn_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caseuser_users1` FOREIGN KEY (`from_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `workbasket` (
  `workbasketid` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `assigned_dtm` datetime NOT NULL,
  `completed_dtm` datetime DEFAULT NULL,
  `workitemid` int(11) NOT NULL,
  `workheirarchy` varchar(50) DEFAULT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(50) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `priority_cd` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`workbasketid`),
  KEY `fk_workbasket_app_case` (`case_id`),
  KEY `fk_workbasket_prioritycolor` (`priority_cd`),
  KEY `fk_workbasket_users` (`userid`),
  KEY `fk_workbasket_workitem` (`workitemid`),
  CONSTRAINT `fk_workbasket_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_workbasket_prioritycolor` FOREIGN KEY (`priority_cd`) REFERENCES `prioritycolor` (`priority_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_workbasket_users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_workbasket_workitem` FOREIGN KEY (`workitemid`) REFERENCES `workitem` (`workitemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mm_case_agent` (
  `case_agent_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `agent_typ` int(11) NOT NULL,
  `agent_class` int(11) NOT NULL,
  `first_nm` varchar(20) DEFAULT NULL,
  `last_nm` varchar(20) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `agency` varchar(30) DEFAULT NULL,
  `frst_year_comm` int(11) DEFAULT NULL,
  `renewal_comm` int(11) DEFAULT NULL,
  `split_percent` int(11) DEFAULT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `partner_typ` char(3) DEFAULT NULL,
  PRIMARY KEY (`case_agent_id`),
  KEY `fk_mm_case_agent_app_case` (`case_id`),
  CONSTRAINT `fk_mm_case_agent_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `busi_partner_dtls` (
  `busi_partner_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `faceamount` decimal(19,2) DEFAULT NULL,
  `share_per` int(11) DEFAULT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`busi_partner_id`),
  KEY `fk_busi_partner_dtls_app_case` (`case_id`),
  CONSTRAINT `fk_busi_partner_dtls_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mm_app_case` (
  `case_id` int(11) NOT NULL,
  `pcli_res_st` char(2) DEFAULT NULL,
  `pcli_work_st` char(2) DEFAULT NULL,
  `own_res_st` char(2) DEFAULT NULL,
  `replacement_ind` char(1) DEFAULT NULL,
  `save_age_pol_ind` char(1) DEFAULT NULL,
  `save_age_pol_dt` datetime DEFAULT NULL,
  `money_pur_opt` char(1) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `illust_confirm_ind` char(1) DEFAULT NULL,
  `divdnd_optn_id` int(11) DEFAULT NULL,
  `susp_process_ind` char(1) DEFAULT NULL,
  `pcli_oth_res_st` varchar(50) DEFAULT NULL,
  `pcli_oth_work_st` varchar(50) DEFAULT NULL,
  `own_oth_res_st` varchar(50) DEFAULT NULL,
  `buss_pkg_status` varchar(10) DEFAULT NULL,
  `buss_pkg_stat_dtm` datetime DEFAULT NULL,
  `money_ind` char(1) DEFAULT NULL,
  `buss_pkg_count` int(11) DEFAULT NULL,
  `fin_activity_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `fk_mm_app_case_adm_dividend_optn` (`divdnd_optn_id`),
  KEY `fk_mm_app_case_state` (`pcli_res_st`),
  KEY `fk_mm_app_case_state_res_st` (`own_res_st`),
  KEY `fk_mm_app_case_state_work_st` (`pcli_work_st`),
  CONSTRAINT `fk_mm_app_case_adm_dividend_optn` FOREIGN KEY (`divdnd_optn_id`) REFERENCES `adm_dividend_optn` (`divdnd_optn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mm_app_case_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mm_app_case_state` FOREIGN KEY (`pcli_res_st`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mm_app_case_state_res_st` FOREIGN KEY (`own_res_st`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mm_app_case_state_work_st` FOREIGN KEY (`pcli_work_st`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `refer_case` (
  `refer_case_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `referee_user` int(11) NOT NULL,
  `referred_user` int(11) NOT NULL,
  `refered_dt` datetime NOT NULL,
  `chain_no` int(11) DEFAULT NULL,
  `transfer_typ_cd` varchar(8) NOT NULL,
  `is_chain_active` char(1) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`refer_case_id`),
  KEY `fk_refer_case_app_case` (`case_id`),
  KEY `fk_refer_case_transfer_type` (`transfer_typ_cd`),
  KEY `fk_refer_case_users` (`referee_user`),
  KEY `fk_refer_case_users1` (`referred_user`),
  CONSTRAINT `fk_refer_case_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_refer_case_transfer_type` FOREIGN KEY (`transfer_typ_cd`) REFERENCES `transfer_type` (`transfer_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_refer_case_users` FOREIGN KEY (`referee_user`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_refer_case_users1` FOREIGN KEY (`referred_user`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `app_case` (
  `case_id` int(11) NOT NULL,
  `case_ref_num` varchar(20) DEFAULT NULL,
  `case_typ_cd` varchar(8) DEFAULT NULL,
  `stpr_cd` char(2) DEFAULT NULL,
  `ctry_cd` char(3) DEFAULT NULL,
  `nbprod_id` int(11) DEFAULT NULL,
  `lin_of_busin_cd` varchar(8) DEFAULT NULL,
  `case_stat_cd` varchar(8) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `case_grp_num` int(11) DEFAULT NULL,
  `case_app_ref_num` varchar(40) DEFAULT NULL,
  `case_app_entr_dt` datetime DEFAULT NULL,
  `case_app_recd_dt` datetime DEFAULT NULL,
  `case_app_sign_dt` datetime DEFAULT NULL,
  `case_base_face_amt` decimal(19,2) DEFAULT NULL,
  `case_edit_user_id` varchar(20) DEFAULT NULL,
  `case_cre_user_id` varchar(20) DEFAULT NULL,
  `rstrctd_view_ind` char(1) DEFAULT 'N',
  `is_insurance_inforce` char(1) DEFAULT NULL,
  `priority_cd` varchar(8) DEFAULT NULL,
  `pmt_fndg_mode` char(8) DEFAULT NULL,
  `chq_amt` decimal(9,2) DEFAULT NULL,
  `tlia_qres1` char(1) DEFAULT NULL,
  `tlia_qres2` char(1) DEFAULT NULL,
  `pmt_type` varchar(2) DEFAULT NULL,
  `oques1` char(1) DEFAULT NULL,
  `oques2` char(1) DEFAULT NULL,
  `oqresp1` mediumtext,
  `oqresp2` mediumtext,
  `base_case_num` varchar(8) DEFAULT NULL,
  `app_status` varchar(50) DEFAULT NULL,
  `altaddpolicy` varchar(10) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `part_b` char(1) DEFAULT NULL,
  `term_conversion` char(1) DEFAULT NULL,
  `uw_class` int(11) DEFAULT NULL,
  `field_risk_class` int(11) DEFAULT NULL,
  `qualty_chk_status` varchar(50) DEFAULT NULL,
  `prioriry_color` varchar(8) DEFAULT NULL,
  `is_mec_case` char(1) DEFAULT NULL,
  `tot_prem_amt` decimal(18,2) DEFAULT NULL,
  `plan_rate_class_id` int(11) DEFAULT NULL,
  `gndr_cd` char(1) DEFAULT NULL,
  `policy_fee` decimal(12,2) DEFAULT NULL,
  `plan_di_occp_class_id` int(11) DEFAULT NULL,
  `is_single_premium` char(1) DEFAULT NULL,
  `sinle_premium_amt` decimal(12,2) DEFAULT NULL,
  `case_locked_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `fk__app_case__case_g__161013de` (`case_grp_num`),
  KEY `fk__app_case__case_s__19e0a4c2` (`case_stat_cd`),
  KEY `fk__app_case__case_t__18ec8089` (`case_typ_cd`),
  KEY `fk__app_case__nbprod__1db135a6` (`nbprod_id`),
  KEY `fk__app_case__plan_i__1ad4c8fb` (`plan_id`),
  KEY `fk__app_case__stpr_c__17f85c50` (`stpr_cd`),
  KEY `fk_app_case_company` (`comp_id`),
  KEY `fk_app_case_ctry` (`ctry_cd`),
  KEY `fk_app_case_gender` (`gndr_cd`),
  KEY `fk_app_case_plan_di_occp_class` (`plan_di_occp_class_id`),
  KEY `fk_app_case_plan_rate_class` (`plan_rate_class_id`),
  KEY `fk_app_case_prioritycolor` (`priority_cd`),
  CONSTRAINT `fk_app_case_company` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_ctry` FOREIGN KEY (`ctry_cd`) REFERENCES `ctry` (`ctry_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_gender` FOREIGN KEY (`gndr_cd`) REFERENCES `gender` (`gndr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_plan_di_occp_class` FOREIGN KEY (`plan_di_occp_class_id`) REFERENCES `plan_di_occp_class` (`plan_di_occp_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_plan_rate_class` FOREIGN KEY (`plan_rate_class_id`) REFERENCES `plan_rate_class` (`plan_rate_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_case_prioritycolor` FOREIGN KEY (`priority_cd`) REFERENCES `prioritycolor` (`priority_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__case_g__161013de` FOREIGN KEY (`case_grp_num`) REFERENCES `case_group` (`case_grp_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__case_s__19e0a4c2` FOREIGN KEY (`case_stat_cd`) REFERENCES `case_status` (`case_stat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__case_t__18ec8089` FOREIGN KEY (`case_typ_cd`) REFERENCES `case_type` (`case_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__nbprod__1db135a6` FOREIGN KEY (`nbprod_id`) REFERENCES `base_prod` (`nbprod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__plan_i__1ad4c8fb` FOREIGN KEY (`plan_id`) REFERENCES `base_plan` (`plan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__app_case__stpr_c__17f85c50` FOREIGN KEY (`stpr_cd`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `usercompanyplan` (
  `userid` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `nbprod_id` int(11) NOT NULL,
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`userid`,`comp_id`,`nbprod_id`),
  KEY `fk_usercompanyplan_base_prod` (`nbprod_id`),
  KEY `fk_usercompanyplan_company` (`comp_id`),
  CONSTRAINT `fk_usercompanyplan_base_prod` FOREIGN KEY (`nbprod_id`) REFERENCES `base_prod` (`nbprod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usercompanyplan_company` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usercompanyplan_users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `policy_num_range` (
  `nbprod_id` int(11) NOT NULL,
  `min_range` varchar(50) DEFAULT NULL,
  `max_range` varchar(50) DEFAULT NULL,
  `current_pol_no` varchar(50) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`nbprod_id`),
  CONSTRAINT `fk_policy_num_range_base_prod` FOREIGN KEY (`nbprod_id`) REFERENCES `base_prod` (`nbprod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `plan_pref_class` (
  `plan_pref_cls_id` int(11) NOT NULL,
  `pref_cls_id` int(11) NOT NULL,
  `nbprod_id` int(11) NOT NULL,
  `pref_sort_num` int(11) DEFAULT NULL,
  `uw_decn_cd` varchar(8) DEFAULT NULL,
  `max_points` int(11) DEFAULT NULL,
  `min_points` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `Is_display` char(1) DEFAULT NULL,
  PRIMARY KEY (`plan_pref_cls_id`),
  KEY `fk__plan_pref__pref___786aa25e` (`pref_cls_id`),
  KEY `fk_plan_pref_class_base_prod` (`nbprod_id`),
  KEY `fk_pref_class_rule_master` (`rule_id`),
  CONSTRAINT `fk_plan_pref_class_base_prod` FOREIGN KEY (`nbprod_id`) REFERENCES `base_prod` (`nbprod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pref_class_rule_master` FOREIGN KEY (`rule_id`) REFERENCES `rule_master` (`rule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__plan_pref__pref___786aa25e` FOREIGN KEY (`pref_cls_id`) REFERENCES `pref_class` (`pref_cls_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `state_baseprod_rule` (
  `stpr_cd` char(2) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `st_prod_eff_dt` datetime DEFAULT NULL,
  `st_prod_expy_dt` datetime DEFAULT NULL,
  `prod_min_age_num` smallint(6) DEFAULT NULL,
  `prod_max_age_num` smallint(6) DEFAULT NULL,
  `prod_min_face_amt` float DEFAULT NULL,
  `prod_max_face_amt` float DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  PRIMARY KEY (`stpr_cd`,`prod_id`),
  KEY `fk_state_baseprod_rule_base_prod` (`prod_id`),
  CONSTRAINT `fk_state_baseprod_rule_base_prod` FOREIGN KEY (`prod_id`) REFERENCES `base_products` (`prod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_baseprod_rule_state` FOREIGN KEY (`stpr_cd`) REFERENCES `state` (`stpr_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `case_ins_income_details` (
  `cpcli_id` int(11) NOT NULL,
  `ins_income_quest_id` int(11) NOT NULL,
  `ins_amt` decimal(19,2) DEFAULT NULL,
  `is_decl_ind` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cpcli_id`,`ins_income_quest_id`),
  KEY `fk__case_ins___ins_i__04859529` (`ins_income_quest_id`),
  CONSTRAINT `fk__case_ins___cpcli__0b92856b` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__case_ins___ins_i__04859529` FOREIGN KEY (`ins_income_quest_id`) REFERENCES `ins_income_details` (`ins_income_quest_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `wc_role_assoc` (
  `work_category_id` int(11) NOT NULL,
  `role_cd` varchar(8) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`work_category_id`,`role_cd`),
  KEY `fk_wc_role_assoc_userrole` (`role_cd`),
  CONSTRAINT `fk_wc_role_assoc_userrole` FOREIGN KEY (`role_cd`) REFERENCES `userrole` (`role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wc_role_assoc_work_category` FOREIGN KEY (`work_category_id`) REFERENCES `work_category` (`work_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient_inf_det` (
  `pclient_inf_detid` int(11) NOT NULL,
  `cpcli_id` int(11) DEFAULT NULL,
  `inf_repl_ind` char(10) DEFAULT NULL,
  `company_nm` varchar(100) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `issue_yr` int(11) DEFAULT NULL,
  `policy_num` varchar(50) DEFAULT NULL,
  `is_pers_busin` varchar(100) DEFAULT NULL,
  `lin_of_busin_cd` varchar(100) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `replacement_ind` char(1) DEFAULT NULL,
  `val_1035_ind` char(1) DEFAULT NULL,
  `adb_amount` decimal(15,2) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `type_1035` char(1) DEFAULT NULL,
  PRIMARY KEY (`pclient_inf_detid`),
  KEY `fk_pclient_inf_det_case_pclient_assoc` (`cpcli_id`),
  KEY `fk_pclient_inf_det_inforce_status` (`statusid`),
  CONSTRAINT `fk_pclient_inf_det_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pclient_inf_det_inforce_status` FOREIGN KEY (`statusid`) REFERENCES `inforce_status` (`statusId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mm_case_pclient_assoc` (
  `cpcli_id` int(11) NOT NULL,
  `time_to_call_place` varchar(100) DEFAULT NULL,
  `fami_his_details` varchar(150) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `total_face_amt_co` decimal(19,2) DEFAULT NULL,
  `inf_owner_nm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpcli_id`),
  CONSTRAINT `fk_mm_case_pclient_assoc_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient_inforce` (
  `inforce_id` int(11) NOT NULL,
  `cpcli_id` int(11) NOT NULL,
  `comp_name` varchar(255) NOT NULL,
  `Prod_typ` varchar(100) NOT NULL,
  `pol_num` char(10) NOT NULL,
  `pol_amt` decimal(18,0) DEFAULT NULL,
  `death_benefit` varchar(100) NOT NULL,
  `status_cd` varchar(8) NOT NULL,
  `intend_to_replace_ind` char(1) NOT NULL,
  `inf_pend_cd` varchar(8) DEFAULT NULL,
  `is_1035_exchange` char(1) DEFAULT NULL,
  `exchange_typ` char(1) DEFAULT NULL,
  `is_mec_ind` char(1) DEFAULT NULL,
  `risk_class` varchar(100) DEFAULT NULL,
  `all_state_forms_submitted_ind` char(1) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`inforce_id`),
  KEY `fk_pclient_inforce_case_pclient_assoc` (`cpcli_id`),
  CONSTRAINT `fk_pclient_inforce_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `cpcli_bp_pul_inf` (
  `bp_pul_inf` int(11) NOT NULL,
  `cpcli_id` int(11) NOT NULL,
  `reading_info` varchar(30) DEFAULT NULL,
  `reading_num` int(11) DEFAULT NULL,
  `bp_typ_id` int(11) DEFAULT NULL,
  `pulse_opt_id` int(11) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `is_bp_pulse_info` char(1) NOT NULL,
  PRIMARY KEY (`bp_pul_inf`),
  KEY `fk_cpcli_bp_pul_inf_adm_bp_typ` (`bp_typ_id`),
  KEY `fk_cpcli_bp_pul_inf_adm_pulse_opt` (`pulse_opt_id`),
  KEY `fk_cpcli_bp_pul_inf_case_pclient_assoc` (`cpcli_id`),
  CONSTRAINT `fk_cpcli_bp_pul_inf_adm_bp_typ` FOREIGN KEY (`bp_typ_id`) REFERENCES `adm_bp_typ` (`bp_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpcli_bp_pul_inf_adm_pulse_opt` FOREIGN KEY (`pulse_opt_id`) REFERENCES `adm_pulse_opt` (`pulse_opt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpcli_bp_pul_inf_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `cpcli_heart_inf` (
  `heart_inf_id` int(11) NOT NULL,
  `cpcli_id` int(11) NOT NULL,
  `pulse_grade_id` int(11) DEFAULT NULL,
  `bp_typ_id` int(11) DEFAULT NULL,
  `lst_updt_usrid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`heart_inf_id`),
  KEY `fk_cpcli_heart_inf_adm_bp_typ` (`bp_typ_id`),
  KEY `fk_cpcli_heart_inf_adm_pulse_grade` (`pulse_grade_id`),
  KEY `fk_cpcli_heart_inf_case_pclient_assoc` (`cpcli_id`),
  CONSTRAINT `fk_cpcli_heart_inf_adm_bp_typ` FOREIGN KEY (`bp_typ_id`) REFERENCES `adm_bp_typ` (`bp_typ_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpcli_heart_inf_adm_pulse_grade` FOREIGN KEY (`pulse_grade_id`) REFERENCES `adm_pulse_grade` (`pulse_grade_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cpcli_heart_inf_case_pclient_assoc` FOREIGN KEY (`cpcli_id`) REFERENCES `case_pclient_assoc` (`cpcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `pclient_phone` (
  `pcli_id` int(11) NOT NULL,
  `phn_typ_cd` varchar(8) NOT NULL,
  `tm_zone_cd` varchar(8) DEFAULT NULL,
  `pclphn_num` varchar(22) DEFAULT NULL,
  `pclphn_extn_num` varchar(10) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`pcli_id`,`phn_typ_cd`),
  KEY `fk__pclient_p__phn_t__6b2fd77a` (`phn_typ_cd`),
  KEY `fk__pclient_p__tm_zo__6c23fbb3` (`tm_zone_cd`),
  CONSTRAINT `fk__pclient_p__pcli___719da93e` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient_p__phn_t__6b2fd77a` FOREIGN KEY (`phn_typ_cd`) REFERENCES `phn_typ` (`phn_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__pclient_p__tm_zo__6c23fbb3` FOREIGN KEY (`tm_zone_cd`) REFERENCES `time_zone` (`tm_zone_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `button_case_type` (
  `button_id` int(11) NOT NULL,
  `case_typ_cd` varchar(8) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`button_id`,`case_typ_cd`),
  KEY `fk_button_case_type_case_type` (`case_typ_cd`),
  CONSTRAINT `fk_button_case_type_button_info` FOREIGN KEY (`button_id`) REFERENCES `button_info` (`button_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_button_case_type_case_type` FOREIGN KEY (`case_typ_cd`) REFERENCES `case_type` (`case_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `button_roles` (
  `button_id` int(11) NOT NULL,
  `role_cd` varchar(8) NOT NULL,
  `sort_order` smallint(6) DEFAULT NULL,
  `lst_updt_user_id` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `case_stat_cd` varchar(8) NOT NULL,
  PRIMARY KEY (`button_id`,`role_cd`,`case_stat_cd`),
  KEY `fk_button_roles_userrole` (`role_cd`),
  CONSTRAINT `fk_button_roles_button_info` FOREIGN KEY (`button_id`) REFERENCES `button_info` (`button_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_button_roles_userrole` FOREIGN KEY (`role_cd`) REFERENCES `userrole` (`role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `ext` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `role_cd` varchar(8) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `weightagefactor` smallint(6) NOT NULL,
  `isavailable` char(1) NOT NULL,
  `isactive` char(1) NOT NULL,
  `maxcapacity` smallint(6) NOT NULL,
  `minage` smallint(6) NOT NULL,
  `maxage` smallint(6) NOT NULL,
  `minfaceamount` decimal(18,0) DEFAULT NULL,
  `maxfaceamount` decimal(18,0) DEFAULT NULL,
  `isDefaultUnderwriter` char(1) DEFAULT NULL,
  `isDefaultCaseManager` char(1) DEFAULT NULL,
  `portal_id` varchar(50) DEFAULT NULL,
  `no_of_cases` int(11) DEFAULT '0',
  `lst_allocated_dtm` datetime DEFAULT NULL,
  `employment_typ` varchar(100) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `alloc_per` int(11) DEFAULT NULL,
  `lst_updt_usrid` varchar(50) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `case_create_ind` char(1) DEFAULT NULL,
  `maxapprovalamt` decimal(18,0) DEFAULT NULL,
  `alphabet_info` varchar(50) DEFAULT NULL,
  `designation_desc` varchar(100) DEFAULT NULL,
  `default_user_ind` char(1) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `fk_users_portal` (`portal_id`),
  KEY `fk_users_role` (`role_cd`),
  CONSTRAINT `fk_users_portal` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`portal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_cd`) REFERENCES `userrole` (`role_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `user_vacation` (
  `user_vac_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `vac_strt_dtm` datetime DEFAULT NULL,
  `vac_end_dtm` datetime DEFAULT NULL,
  `backupuser` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_user_id` varchar(20) NOT NULL,
  `is_active` char(1) NOT NULL,
  PRIMARY KEY (`user_vac_id`),
  KEY `fk_user_vacation_users` (`userid`),
  CONSTRAINT `fk_user_vacation_users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `cmnt_seq_num` int(11) NOT NULL,
  `cmnt_cat_cd` varchar(8) DEFAULT NULL,
  `cmnt_typ_cd` varchar(8) DEFAULT NULL,
  `cmnt_txt` mediumtext,
  `cmnt_accs_typ_cd` varchar(8) DEFAULT NULL,
  `cmnt_sys_gen_ind` char(1) DEFAULT NULL,
  `cmnt_user_full_nm` varchar(100) DEFAULT NULL,
  `cmnt_cre_dt` datetime DEFAULT NULL,
  `doc_type_id` varchar(50) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_user_id` varchar(20) NOT NULL,
  `cmnt_save_typ_id` int(11) DEFAULT NULL,
  `cmnt_sub_cat_id` int(11) DEFAULT NULL,
  `note_level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comments_access_types` (`cmnt_accs_typ_cd`),
  CONSTRAINT `fk_comments_access_types` FOREIGN KEY (`cmnt_accs_typ_cd`) REFERENCES `cmnt_access_types` (`cmnt_accs_typ_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `comments_attachments` (
  `comments_attachment_cd` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `upload_file_name` varchar(255) DEFAULT NULL,
  `lst_upd_user_cd` varchar(20) DEFAULT NULL,
  `lst_upd_dt` datetime DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  PRIMARY KEY (`comments_attachment_cd`),
  KEY `fk_comments_attachments_comments` (`comment_id`),
  CONSTRAINT `fk_comments_attachments_comments` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `communication_mode` (
  `com_mode_cd` varchar(8) NOT NULL,
  `com_freq_cd` varchar(8) DEFAULT NULL,
  `com_mode_dsc` varchar(20) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  `lst_updt_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`com_mode_cd`),
  KEY `fk__communica__com_f__371114f6` (`com_freq_cd`),
  CONSTRAINT `fk__communica__com_f__371114f6` FOREIGN KEY (`com_freq_cd`) REFERENCES `communication_frequency` (`com_freq_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `state` (
  `stpr_cd` char(2) NOT NULL,
  `ctry_cd` char(3) NOT NULL,
  `stpr_desc` varchar(50) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_userid` varchar(30) DEFAULT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `stpr_acord_cd` int(11) DEFAULT NULL,
  PRIMARY KEY (`stpr_cd`),
  KEY `fk__state__ctry_cd__392445f1` (`ctry_cd`),
  CONSTRAINT `fk__state__ctry_cd__392445f1` FOREIGN KEY (`ctry_cd`) REFERENCES `ctry` (`ctry_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `plan_feature_resp` (
  `plan_feat_id` int(11) NOT NULL,
  `plan_feat_dspl_cd` varchar(8) NOT NULL,
  `plan_feat_dspl_txt` varchar(250) DEFAULT NULL,
  `plan_feat_seq_num` smallint(6) DEFAULT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`plan_feat_id`,`plan_feat_dspl_cd`),
  CONSTRAINT `fk__plan_feat__plan___0b1d841f` FOREIGN KEY (`plan_feat_id`) REFERENCES `plan_feature` (`plan_feat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mm_enterprise_val` (
  `si_interface_id` int(11) NOT NULL,
  `tag_nm` varchar(50) NOT NULL,
  `enterprise_cd` varchar(20) NOT NULL,
  `enterprise_val` varchar(50) NOT NULL,
  `tag_desc` varchar(100) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  PRIMARY KEY (`enterprise_id`),
  KEY `fk_mm_enterprise_val_si_interface` (`si_interface_id`),
  CONSTRAINT `fk_mm_enterprise_val_si_interface` FOREIGN KEY (`si_interface_id`) REFERENCES `si_interface` (`si_interface_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `employer_det` (
  `emp_det_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `occ_class` varchar(50) NOT NULL,
  `multi_factor` int(11) NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`emp_det_id`),
  KEY `fk_employer_det_employer` (`employer_id`),
  CONSTRAINT `fk_employer_det_employer` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`employer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mib_combined_codes` (
  `combined_cd_id` int(11) NOT NULL,
  `combined_cd` varchar(20) NOT NULL,
  `mib_cd` int(11) NOT NULL,
  `mdfr_degree_cd` char(1) NOT NULL,
  `source_cd` char(1) NOT NULL,
  `time_cd` char(1) NOT NULL,
  `cd_usg_strting_dt` datetime NOT NULL,
  `cd_usg_ending_dt` datetime NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_userid` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`combined_cd_id`),
  CONSTRAINT `fk_mib_combined_codes_mib_code` FOREIGN KEY (`combined_cd_id`) REFERENCES `mib_code` (`mib_cd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mib_combined_codes_mib_modfrdegree_cd` FOREIGN KEY (`combined_cd_id`) REFERENCES `mib_modfrdegree_cd` (`mdfr_degree_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mib_combined_codes_mib_source_codes` FOREIGN KEY (`combined_cd_id`) REFERENCES `mib_source_codes` (`mib_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mib_combined_codes_mib_time_codes` FOREIGN KEY (`combined_cd_id`) REFERENCES `mib_time_codes` (`time_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `property` (
  `prop_cat_cd` char(50) NOT NULL,
  `prop_nm` varchar(50) NOT NULL,
  `prop_vlu_txt` mediumtext NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_dtm` datetime NOT NULL,
  `lst_updt_userid` varchar(20) NOT NULL,
  PRIMARY KEY (`prop_cat_cd`,`prop_nm`),
  CONSTRAINT `fk_property_property_cat` FOREIGN KEY (`prop_cat_cd`) REFERENCES `property_cat` (`prop_cat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `si_property` (
  `prop_cat_cd` char(50) NOT NULL,
  `prop_nm` varchar(50) NOT NULL,
  `prop_vlu_txt` varchar(100) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`prop_cat_cd`,`prop_nm`),
  CONSTRAINT `fk_si_property_property_cat` FOREIGN KEY (`prop_cat_cd`) REFERENCES `property_cat` (`prop_cat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `base_plan` (
  `plan_id` int(11) NOT NULL,
  `plan_cd` varchar(15) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `fk_base_plan_company` (`comp_id`),
  CONSTRAINT `fk_base_plan_company` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `base_prod` (
  `nbprod_id` int(11) NOT NULL,
  `prod_cd` varchar(8) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `is_deleted_ind` char(1) DEFAULT 'N',
  `lst_updt_dtm` datetime DEFAULT NULL,
  `lst_updt_userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nbprod_id`),
  KEY `fk_base_prod_company` (`comp_id`),
  CONSTRAINT `fk_base_prod_company` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `event_mdc` (
  `eventruleresponseid` int(11) NOT NULL,
  `mdc_response_id` int(11) NOT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  PRIMARY KEY (`eventruleresponseid`,`mdc_response_id`),
  KEY `fk_event_mdc_mdc_response` (`mdc_response_id`),
  CONSTRAINT `fk_event_mdc_eventruleresponse` FOREIGN KEY (`eventruleresponseid`) REFERENCES `eventruleresponse` (`eventruleresponseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_mdc_mdc_response` FOREIGN KEY (`mdc_response_id`) REFERENCES `mdc_response` (`mdc_response_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
CREATE TABLE `mdc_attribute` (
  `mdc_attribute_id` int(11) NOT NULL,
  `mdc_attribute_nm` varchar(100) NOT NULL,
  `is_deleted_ind` char(1) NOT NULL DEFAULT 'N',
  `lst_updt_user_id` varchar(20) NOT NULL,
  `lst_updt_dtm` datetime NOT NULL,
  `eventid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mdc_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;
