CLASS zcl_auth_demo_data DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_auth_demo_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zauth_user.
    DELETE FROM zauth_role.
    DELETE FROM zauth_user_role.
    DELETE FROM zauth_role_auth.

    INSERT zauth_user FROM TABLE @( VALUE #(
      ( user_id = 'ANNA'  full_name = 'Anna Novak'  department = 'HR'    )
      ( user_id = 'PETR'  full_name = 'Petr Svoboda' department = 'LOGIS' )
      ( user_id = 'EVA'   full_name = 'Eva Dvorak'  department = 'HR'    ) ) ).

    INSERT zauth_role FROM TABLE @( VALUE #(
      ( role_id = 'Z_HR_DISPLAY' description = 'HR display' )
      ( role_id = 'Z_HR_ADMIN'   description = 'HR administration' )
      ( role_id = 'Z_MM_BUYER'   description = 'Purchasing' ) ) ).

    INSERT zauth_user_role FROM TABLE @( VALUE #(
      ( user_id = 'ANNA' role_id = 'Z_HR_ADMIN'   valid_from = '20260101' valid_to = '99991231' )
      ( user_id = 'EVA'  role_id = 'Z_HR_DISPLAY' valid_from = '20260101' valid_to = '99991231' )
      ( user_id = 'PETR' role_id = 'Z_MM_BUYER'   valid_from = '20260101' valid_to = '99991231' ) ) ).

    INSERT zauth_role_auth FROM TABLE @( VALUE #(
      ( role_id = 'Z_HR_DISPLAY' auth_object = 'P_ORGIN' field_name = 'INFTY' value_low = '0001' )
      ( role_id = 'Z_HR_DISPLAY' auth_object = 'P_ORGIN' field_name = 'AUTHC' value_low = 'R' )
      ( role_id = 'Z_HR_ADMIN'   auth_object = 'P_ORGIN' field_name = 'INFTY' value_low = '0001' )
      ( role_id = 'Z_HR_ADMIN'   auth_object = 'P_ORGIN' field_name = 'AUTHC' value_low = 'W' )
      ( role_id = 'Z_MM_BUYER'   auth_object = 'M_BEST_BSA' field_name = 'ACTVT' value_low = '01' ) ) ).

    out->write( 'Demo data created.' ).
  ENDMETHOD.
ENDCLASS.
