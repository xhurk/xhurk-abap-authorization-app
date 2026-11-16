@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Auth demo: user with roles'
define root view entity ZI_AuthUserRole
  as select from zauth_user_role as ur
    inner join   zauth_user      as u  on u.user_id = ur.user_id
    inner join   zauth_role      as r  on r.role_id = ur.role_id
{
  key ur.user_id   as UserId,
  key ur.role_id   as RoleId,
      u.full_name  as FullName,
      u.department as Department,
      r.description as RoleDescription,
      ur.valid_from as ValidFrom,
      ur.valid_to   as ValidTo
}
