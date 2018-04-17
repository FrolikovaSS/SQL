USE [u183189]
GO
SELECT U.UserId, U.UserName, M.Num, Mem.Email
--, R.RoleName 
FROM aspnet_Users as U
JOIN 
(SELECT UIR.UserId
      --,UIR.RoleId
	  , COUNT(R.RoleName) as Num
	
  FROM [dbo].[aspnet_UsersInRoles] as UIR
  LEFT JOIN aspnet_Roles AS R ON R.RoleId = UIR.RoleId
  Group BY UIR.UserId HAVING COUNT(R.RoleName) > 1) as M ON U.UserId = M.UserId
 --LEFT JOIN aspnet_UsersInRoles As UIR ON U.UserId = UIR.UserId
 -- LEFT JOIN aspnet_Roles as R ON R.RoleId = UIR.RoleId
  LEFT JOIN aspnet_Membership as Mem ON Mem.UserId = U.UserId
  Where NUM > 2
 ORDER by UserID
GO


