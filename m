Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97D33C534
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906156; cv=fail; b=axx8BKrUzjsUlBsBmZwal5LpKPtuif1/JvHDp5wE9KonWiPkTy1uLkJzcGGs2bi7smHDVJ1hQarif7UxwE/2QkGI87wrzbtL+2EWLVxZqH4wKQfdcJjJJr9hMvS+TpWtPHtagBWE6Y+fl9wK9F1AZcnTeWzcRQueGG/ZlZIH4+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906156; c=relaxed/simple;
	bh=xsDd9XDX58+74S58Q9/ybjqgKh4VvjBKttHP1liN5bA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JGXPznpn6Za7AkQK47irrkZ7CEmrHMShrIdEN1bwO/tvv3GQj02j07H5wZLCSckYdXJ1JGwzhLhrVt6sMl5nl/N7udyaoNMc9f/icLz9Id8YwCCJftILtpK93qAoLEJDXIML1kMXn9lPOplvgBQVjVthNgC+bMyTayfUw1fELn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zgi/brpD; arc=fail smtp.client-ip=52.101.84.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zgi/brpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKF/mJVmCngurhAuJiRzwRSrvkJzR2sh9Hl6YeF4hAeEJ1K1jgS4s72eGnL05jnUnmdoD3Mrdvl5a5R/Ou+4Lx7tCcQT8se6dOc++ymFhGFnTWsJu4f2nNandG688CEr6v117JuHl0Pdhsw5CnoHT31s780XbTaxEUddSsUO50ZIb4LvRwbdDEyxQ17FrGqBQ5EpsigMbIoZpEf3QpnBjGI9hGI8G1fzphw+M5Ex8STPRs5LOaz8KUDiP53/tXxv1lyIk6TicT6ZQxdWFbFGr1NFAKGdjRNT+zO+wfSuLuE9mv+0OG+kTHpUbvkDW6GdRKrnOnfO+bWEQt4TNI09YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9TmhMRjwZRS1FRIjVzhiULV3MIow1OZPtiDqB3g8j0=;
 b=m64qzkYDWV61vMqLRBisxZorXk5ziK1J3gvBAl47ASAwr6aHgSAdnijaioRyDOJz8cXH+akNv1cuLDDgg/mqa1ONJwY/LVxFYmI+RrUiNaIhtwbayZt2iXkdm2GSBBsr0LoGVm76ABpRbCaJx6MKngd0e9qiLIRJF37eL4Oxu990OR+tDbuiwnonIf50FtJqlAvD2O51Z/POj6B/AQfdM9nlfiB7/pKUkiol02bpUBSxXCaIY1dutBvupL3gBeNYTjnheEGt5JFeTHwYrQqc6+sAW0gFo/02S4EVkFQD7FVUpsyUrF8WKv9pFhIPO0ytvaGZmd6f1zeEOauCpyZveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9TmhMRjwZRS1FRIjVzhiULV3MIow1OZPtiDqB3g8j0=;
 b=Zgi/brpDIr2TMXvnbBT6h3klWg9XGbVYIrA8g5r6vNVFhTbs/UPDsc4NLptwT8LpsQl2pWxax/iTL6zyC8MUfi+aP6LXPzp0oFOuJ4KpFyesvfc++y/s+0GQ/5o+FM0OfK8Ou18FzrcZ9W5fUk8grDFiKPcVp3fjTKr3S3SwmROA35y1VfzXZUBZCRd+iC64HT9mIMlqehnJ2pw+ztlvn0+9EYhpcCbVY8hzLVOU8yFQGGsPiviaH48Zd0HOylI7c1oXVmCAQB+Rr5ny04ZcbjTPvIKRxsJyoudNW+/oVPT7Z+0qE8iTUEDjTq2Hj64pYUmICBiGLMqscFetvtJIJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAWPR04MB9885.eurprd04.prod.outlook.com
 (2603:10a6:102:391::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:49:11 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:49:10 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx95-19x19-evk: enable lpuart5 for Bluetooth support
Date: Tue, 20 Jan 2026 18:48:42 +0800
Message-Id: <20260120104842.2025697-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAWPR04MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: ce45f79b-584e-47a2-b0b1-08de58118b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ut8zAXNFXcaCaP8mpw0qxlCZXuFz4g8uo1Q8dvSBM013+CO6RyIV7McN2Vp7?=
 =?us-ascii?Q?IRoLMkJEblXFYAln2zjxM65ZcFHOWn47qzKH4QeSR7nUE5KNrZKUXo1uaGsI?=
 =?us-ascii?Q?fUHfaa+HqliykyN23YWlIjcYvE5Y6cEezAxaD5Wv1iZTNp7AA/P7WgxDI333?=
 =?us-ascii?Q?A0MRDS3oqtSQd/VVa8EogVIuJX6VFqLrcOuH0mu8UCAiqN412XfYJItBzy9e?=
 =?us-ascii?Q?/k5MeEwEyYggF04jLgF3Ne6B59g3pz6XZ7w6TXtTBOOaHLES4vXMrFfQVZOF?=
 =?us-ascii?Q?9KhSvFDLvALx8FeyOHektqWCfCO3FoNPbKK/yK//KEtnYq679GWHWjgsB9GH?=
 =?us-ascii?Q?QvbeCRqrJaK5PDL1l7qEWnvfGqdC7mLzGQgpy4or8T5Pjxtl+DbHayvYCV6W?=
 =?us-ascii?Q?8SqFCkFjrRW8G/LAayfe0gYcfbMzsiYzOvfjiWJhNg6CwSvYOFT0f14JHJ2n?=
 =?us-ascii?Q?xCorT+8lMaXBjpZhrV1xI9l/zuWWj4XWNaO/3mJxUeaQxA43Ki+Z6pRzkpvi?=
 =?us-ascii?Q?5eZEnoeHfzQbniHoKpoLsO8IQUFiXdrmSa91vhsq7cN4xxwIVjSct3d7+bDV?=
 =?us-ascii?Q?NW0DKwOJcYiIYPTOA7BPGXbUo1GuDl2cfuXqjSKGSVX9KIQINaJ47MSKbbv6?=
 =?us-ascii?Q?kPBJbTBiV5u5C5BnYvl66IzoTaTKkGdw6OlqzwUGgjVVO/tf2QrLlU3ZJmqD?=
 =?us-ascii?Q?M7j2F9q6Zl7t1av5asUrv7+JHhOBK/mW274u/ibZSPgM8efTrlCDHlqLNU2f?=
 =?us-ascii?Q?6fFIYkophKSi1+/Ajge745zqBpYz9lUxVuHy5QG5dI4T9SbfLPJ0GTy9TbIJ?=
 =?us-ascii?Q?QRFXw3Fd4H7IGO1QO2IMCI3++E7ee0LK7NQlzANNYn05sX+h1YOxNCc21BSj?=
 =?us-ascii?Q?ieQN/Jy3HqGGt9Nit5AbudnDqQHZlsvVGntYpxty1rEh9clVm+kVd2pwt4MJ?=
 =?us-ascii?Q?Fvcs6RvKqfZ5Txaxm6cDknSh7bFRpe6rz5MT49+nw8pySS00/yiqhbHfKHN5?=
 =?us-ascii?Q?aeTT6mmjtZC8M62gu5Jr3CZSMSOseO3ZTMCHnfv6PdsB+NxRDz0OVkSjgwT9?=
 =?us-ascii?Q?qlh9ZEB2pV+/dw+wE9M1lme8bRCsz3E+IHznyMp1h/rz4zSTUxyJDGdS0Mkp?=
 =?us-ascii?Q?v6ea48PKZGmvECpz1Ivd7rMfXm0s0LgZ4S/oQrIiH+GDO9Fgr3vyvRNVoLbw?=
 =?us-ascii?Q?Lof0lKscc1lgKWoxADK7uGuNTovPNTuXJCW0rwOFZztL3iJkhRg3wZjVlOEa?=
 =?us-ascii?Q?8tKshCDeRSrF1iOLdtshP474T4Utw4O8/b1xm+ZNbpfvUZU8lUD6FuzmmK5M?=
 =?us-ascii?Q?j8Mld9vmBKMH8LAqLEsSaVCnUeklu87F9WNzTYm/aZOokUS/rUg7ehMo+swn?=
 =?us-ascii?Q?8j2AnaaSAr2LG6TKz/4az3qTq9tCdvp+EFDDSszUAUtgndEsLWIT9VJKvpKn?=
 =?us-ascii?Q?77spUmLXd4BP82uw3jEDm0LOAY6MCLxoK9RGSnxLHQRJcrVmacw6iQggtEGJ?=
 =?us-ascii?Q?R0u5Qzd5d5mQcrkE/BVb/JFI3A0S1hA4ofhnFbrk2/PYJwJ2F8oI8a/dm3B6?=
 =?us-ascii?Q?xqd6z1z5Zv/rsoTOGu4kEr1NndNTrH7lzWrKr2WGgXCJWjMReqFSCR3scUau?=
 =?us-ascii?Q?HGF4ZnuQsJsL9UeeD6NFnyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dtrlqy+0vgfK1NZA5vz5+Jjt9QJNtKLyXUaLD0rqkqD3GkaCV+7diyU5bmr5?=
 =?us-ascii?Q?Od2gnl9syeaIjSwcQPb1c8s6b6XvU+0hCi9zujTHU3Js55GnCk+uvOHbyy9+?=
 =?us-ascii?Q?U0PUqF0ugp24rT9Asz9qx6M1YW/LuB/HU+iXHrKwrfgicT7bfvq0uXuBRbeJ?=
 =?us-ascii?Q?0LSM+D+HG4jZ1coqHKI6mTKOBt7rknYJHd5+yXCxyhVVP/+gAOf5U4v8RkU1?=
 =?us-ascii?Q?otroXX1zNsJaL4k/RM9+wKfFD440lbMvV4Ju5VZkpLVYU42fw45wQPT7AJeJ?=
 =?us-ascii?Q?Tjls+4iLFpmzEegsVjZC2fGWgrvty4MLw4+qvzH4I4XPFG7XPio5t6aYZjm9?=
 =?us-ascii?Q?zf8G7dXCGFp3mWFiXTSV4uK7AKpEU2nuUKAtOagdHK+hZU2Rv7QgsT2fsFHm?=
 =?us-ascii?Q?l5N6DyWujpfvvtQ1ethIdyTAzrBCEEsHSryZtavFZwBNFd0cnLo8DxBet1Ct?=
 =?us-ascii?Q?FlcfeDLglJOj+aVY7fXpUiJLO4KuJ49DyFxkm6JBEZ5B8goruCi+NBORGk90?=
 =?us-ascii?Q?sXZ53QaJ3ibJ3I3A8LcvfpmoKhWEzHD9O90nQqGqxXUzNcYmRNeiaZLzHRdR?=
 =?us-ascii?Q?UTTyK8IGiPKSmABrNILUlh6dw5QxrGyWp7QLGnflapf4hJ/Txljcdxt8119Z?=
 =?us-ascii?Q?WfplXSxPO7ujrauT40gtt1EANhM6MmFmyBKHGRkNhzVLgadfy2d1AX5BGA06?=
 =?us-ascii?Q?dUIP2Ba37qcaJZ4bdl1oTGLogTWqdYvycW5o+HKNealutdrIho01/xlIs8Fy?=
 =?us-ascii?Q?XdEUAHOyYyMuBz50JBDdN6UNQ5UBpBXn6vCRrkL6taCYXrBJWCkp/UaSCFxE?=
 =?us-ascii?Q?KH6PaCFzEExTg1GfsQC34CbDsvTEYWw1nG6Hex8Yg7IsjPeQHcffbe4Ynira?=
 =?us-ascii?Q?Qjy5bbCS6JwGlSdfGRz1kDodJqCx4H3p9Zg53rGCug7BF578p8JEVCjT8Zxm?=
 =?us-ascii?Q?RZBMKrdQImrOM0lKVb3xqpHHYGvlL9V/bh1AohxoE1OW9iZGZKP6icXBqxRi?=
 =?us-ascii?Q?zn3dM0vPWhrwyCP+r0aQqFrAJfvuACelY9NTfz+oZ0lypGG4TQQ82UX5FbiE?=
 =?us-ascii?Q?Dx0AL7QfSZ1KmMTZQT1o9gvCIfRkag1CgMUDDPSL8wFY2g5m0EciNK9wFk+S?=
 =?us-ascii?Q?bQeKVv3MINOyl72JLAdi7SSJNxeGDU/6+LleRJgvEi1+u3oU3chlKPODGfQ8?=
 =?us-ascii?Q?cXBf3EnPGASemn1OU9xIqRlHXH7zXr+TLBr7nqtqMQfzF9gcRnXsGMJY1HQ3?=
 =?us-ascii?Q?SEFrDJmvAkUg5pyAsxzpUnejdb62IS2a94oepWZmhgO6GUhVDMrFdWYCrIkK?=
 =?us-ascii?Q?x5RzrKXatds+4l3p9STF/K51dN/O2gQ5uq01EBlkZl8mL2U5/sAD6rvV7Smh?=
 =?us-ascii?Q?mCZ7nPVA7J+sRh/EQA6lfVFAJQbzzn8J5VanebZ3hPKvvkYJEddoVMVKa8cX?=
 =?us-ascii?Q?Ex312dN1HI3006K6QMEMlCKFGHn6hxcFT/x4nql/EmFpcMCI9dx0564r/16L?=
 =?us-ascii?Q?JN3ftf90bDBG8uMx8b2yOjutnV3ApUnxWZk+C/SAUEb83q49OP6wrDV1YY1Y?=
 =?us-ascii?Q?9YyLtMB1ZZYCKK/8JezbH/lVHmyJQJSvu3Xda1aXiYsdgMwIcydzR9CBpYqF?=
 =?us-ascii?Q?oy6+nbfIKphJ7ITyiL3cLTjUlP53In3XdZo14oIt9SkIm8tGTB6GUnIg5NQG?=
 =?us-ascii?Q?E19SY15RCkRKa8O6MZAW4mgibRj1+xOnN0ZoROi2GVR9CykYdrTCL3hrZ9+o?=
 =?us-ascii?Q?NYHVyHB/Hg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce45f79b-584e-47a2-b0b1-08de58118b2b
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:49:10.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLMAUXJNsGZxjFyS4CihU/pvkY8KUqsNlXu7CT/0Q66AfVGY+ZsunsAq+wsObRts+nj/UtEOcv68GwR+eogZLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9885

Enable lpuart5 on imx95-19x19-evk board for Bluetooth support.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 7d16778f8d49..7bcf6254b01d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -475,7 +475,7 @@ &lpuart1 {
 &lpuart5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5>;
-	status = "disabled";
+	status = "okay";
 
 	bluetooth {
 		compatible = "nxp,88w8987-bt";
-- 
2.37.1

