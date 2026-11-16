@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Auth demo: user with roles'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_AUTHUSERROLE
  provider contract TRANSACTIONAL_QUERY
  as projection on ZI_AUTHUSERROLE
{
  key UserId,
  key RoleId,
  FullName,
  Department,
  RoleDescription,
  ValidFrom,
  ValidTo
}
