# Remove all triggers for the tables in roskilde_daycare

-- child triggers
Drop trigger roskilde_daycare.rd_child_insert;
Drop trigger roskilde_daycare.rd_child_update;
Drop trigger roskilde_daycare.rd_child_delete;

-- parent triggers
Drop trigger roskilde_daycare.rd_parent_insert;
Drop trigger roskilde_daycare.rd_parent_update;
Drop trigger roskilde_daycare.rd_parent_delete;

-- employee triggers
Drop trigger roskilde_daycare.rd_employee_insert;
Drop trigger roskilde_daycare.rd_employee_update;
Drop trigger roskilde_daycare.rd_employee_delete;

-- group triggers
Drop trigger roskilde_daycare.rd_group_insert;
Drop trigger roskilde_daycare.rd_group_update;
Drop trigger roskilde_daycare.rd_group_delete;

-- schedule triggers
Drop trigger roskilde_daycare.rd_schedule_insert;
Drop trigger roskilde_daycare.rd_schedule_update;
Drop trigger roskilde_daycare.rd_schedule_delete;

-- address triggers
Drop trigger roskilde_daycare.rd_address_insert;
Drop trigger roskilde_daycare.rd_address_update;
Drop trigger roskilde_daycare.rd_address_delete;

-- phone triggers
Drop trigger roskilde_daycare.rd_phone_insert;
Drop trigger roskilde_daycare.rd_phone_update;
Drop trigger roskilde_daycare.rd_phone_delete;

-- user triggers
Drop trigger roskilde_daycare.rd_user_insert;
Drop trigger roskilde_daycare.rd_user_update;
Drop trigger roskilde_daycare.rd_user_delete;