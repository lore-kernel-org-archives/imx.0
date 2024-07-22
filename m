Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADADDA8
	for <imx@lists.linux.dev>; Mon, 22 Jul 2024 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721616936; cv=fail; b=bFScd0bB030fXa2lXkgYgyDqzawKuPEsRS0lk1EvyPDlZD/jIycdwtyEYhPOVqASE5dobACcGufhA1qq2uggoQ2BP9c3+NhD7lqG1kWPaHiTu6c9qjEFoBoTYA5ZyoGaIEBkp4c1izV+HFs5HpigCOTeRjoWeCSbLH2WYU/qusk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721616936; c=relaxed/simple;
	bh=7fh9bjWBKBcEF3+I4k5pvTea3GpKhq+Waa+FA4LLq4o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dhFlLMooC3QxvNwxXtliAzupk2igImAFRMeJiQYnEZqnZHqbMpuCA5IReD4iNEbQWTF5xIRMUixBA+e2yPuGdPYxD8cGBVnmeoDGYDI5/liqmntWNviaeU/22srcAI3rBTrYLjwC+q2HHAui78HHGF16iKG2WQ1+49bCPxDWVrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=qil0W4oQ; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qil0W4oQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQsnMstH+3zsrX7mV7hkpVfmZQlRYcwopCtaU7+tn+OOOAz3xvJsqxzoShryAl8bHusMeBVHJtpLNWjwpOTULFkzz8+G5tRqseIIkgR9RO30QVcwjeLsxcoApWFTrWeyaHC2Hh7slU39lDFmehgVdid9a+WkARa2A9yLXw3Hka9kcHppYXAx0W4gmpOYu1/u0iH3tc/pOxqYCqclXYzE7URStefVQHrok16LGlVNEGGSVRcKEEoUHbjuZLts6TS0RqSMk7mu88JvcixotMf45HmOv9O9sY6GL7IilscFPv8gy+R+T8oCDI+wuRsOwN2sOiL8zxL2zqqAqei/3THXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p67bDUrm1ZxGlUskNkUAo5NGSgAoul7xDFqYz2uIx1I=;
 b=dxE/+8ol6Mj2KKeGfgP5dJR53i7POeNDlVQull8RuVOPXBW7xqYnp62WvROkYBTKUkA/FDZTPe+IMqsb9EqW6k21exQM6km20iajHOslVFCY/jS2n+YlVEou7DrGgbvenU4NF3fDTo+M/z7eeOoJj6X2v9rX2r8Iiw5KumfVKWBIDm60ZXQ67p2O9TsmimOwODBKgK7XrjFar/VZupi1NCKsssYgW9VgU81YrUA5y9Ig28dbhPjf3veC0EbiZStI28BYyJOYa1ThEFnQJcRQ837Syv2X6xOBfq6Qjzht9gc12xref8p6xjxFnPz2gu2D/hizMunEdVOMzQUM/j5qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p67bDUrm1ZxGlUskNkUAo5NGSgAoul7xDFqYz2uIx1I=;
 b=qil0W4oQrlF8WTQZOyPNww6x71iQA1mfHAOkXAUQW/BV9MUUlGQbkbidTFnaAioDhlIoPKh7uONa8PxY/Bg25y+hFHJ10E/cdx/oumUtC9fa4XzP9yJQre34LvZL7Dc7OEqhlvQG/5KALGzmqNL3KVYU8swoc4mA2fYOHYqC75c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 02:55:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 02:55:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH 1/2] ARM: dts: imx53-qsb-hdmi: Do not disable TVE
Date: Mon, 22 Jul 2024 11:04:12 +0800
Message-Id: <20240722030413.3456203-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be39b4d-7783-411c-79b6-08dca9f9bf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7kY9opTbsTF/S36OpHgIgudeETHRAZwE8P3D3sNZUPasJpIQW3XHM0cTHplw?=
 =?us-ascii?Q?4wYhq0jxD3E7CYIgw0cHjtXwpXadatlE37oHKcGOet4fXBZFkSF090B5PTc+?=
 =?us-ascii?Q?Aoo3IF2CyDzm77AUc2DyIvO+t4uqje0WxwOp/qxT4YDiwBSrxCCIEuMM42ms?=
 =?us-ascii?Q?ttpBMXJGWKXQrDyEC/oiRKEH5xsa4lOSTUkCxw12jVl9+H32/5gtwG2eBrG9?=
 =?us-ascii?Q?LXHnL4hUjxXD0XI2v2Hc1Aj3ZALelZJq05jihdeGrXmkIKXpSNKbl8ow6u7p?=
 =?us-ascii?Q?bEvd71Pxaqw1GNHpD5BKSNMA1cYlXY8L8kOdfKhVqs/bAKv9RGlzIXG6l2m6?=
 =?us-ascii?Q?luZYJxAivAz2PXcx4X1YX07fgWeCAKCXMLPXFUI2BHBShwbMFujFziwlcaT+?=
 =?us-ascii?Q?ekQ8lbv098hss/JYmVJXi+2NsPr9eqrRnehusAGEYoncSD2KL4YoNfL7rjc9?=
 =?us-ascii?Q?XJkue5hn3Ef7t6fSwByLMXB5nQRAHBjos1rMFR+FITw1eNDW7XKUFtUIFZDz?=
 =?us-ascii?Q?N7wNZtIB+sm5h34eXvX6QQKvOGdS4mhq/jMNuZa4Zslzaoab+48nIgrPqMRP?=
 =?us-ascii?Q?QUQCgl4u4yEBvB35TYfv4SVuuAe4SE1mhPyPOWLwWdhclmrX6zYqTALHGrN0?=
 =?us-ascii?Q?9sggXRdydma/s5ujxrgo5L/jKCDgm8Tmglgbnx2MDRJMDv8zUE9KJ57Dtsya?=
 =?us-ascii?Q?4G5nSMsMccCqTKYQrUvRQrfpzRmW3B2DoZNO52gvD7fSwGKGqAvBKLaDI0UO?=
 =?us-ascii?Q?fyP/uYSexN4VeeFYIAW6docw5YQbi4p+jbPb4hvWQWhUgsujZ4IrvLGJ8XvQ?=
 =?us-ascii?Q?5zMDEgQIzjGO70o4OO0Xp/LOLK7qAZ2+Ww/o/PawBK76FodEOGCTU2ItljVh?=
 =?us-ascii?Q?3BMXmu4bGFolUBs1VBnx17aaw20asbRgLrVo7WGIFh4LhIhin8ve+Cedz0oj?=
 =?us-ascii?Q?Vz2Xipt+rc9DWIvJX/tiAadUWfXmIfFpFZ8ExjzYAtrAjNR32wVyrWtWI2XY?=
 =?us-ascii?Q?DAwnfKHPSqzz0ZHT1aOfqPIhCOmPQ/AQKXihrXWhymn6wEiYUcxcHbDq+jJP?=
 =?us-ascii?Q?GX+3tcr5ghHFi9uDoZDAoXw2y6hkCQhXlXsfnFKTIkmg98ORZPs10mvmB9jw?=
 =?us-ascii?Q?Opt7SsonIpp3ee6hme5v/ZfLB5eeClbJZrU6je5qAfzUdPjNSykPghhkrl4Y?=
 =?us-ascii?Q?ueziekiX67yT3aFFHhxjv2Tt5ure5Dg+qq4RhmVo+s8c8v6KOiWAzvuQ1dMC?=
 =?us-ascii?Q?DAvmwaZObyjJXX8MlH/82z8B9x5r1stCx48ffSWYYa1sBImW/rfZTN7c4+x/?=
 =?us-ascii?Q?njRR8lTxXAgvb2FsS6evYxib/t+s31vBcQUwrUoHHAzIKKrZDWjcMdytxfSw?=
 =?us-ascii?Q?8K5kkB/WEYCz5lEbZXVYAQ61pSMSxZwQTv9ZRKIKPgg/z43WqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pvHlmBI3th16WUtSZFabaX/Bzx6PId4Lk9SNLVYQtot5dmO5qUPWDHXQuTqb?=
 =?us-ascii?Q?FIm9yQOKFSECx78ZbT5c7MJoEfT4YNVBXGC2iE9vA8qSwimcEnIOTrgh5McW?=
 =?us-ascii?Q?u0hI/2/jvG20G8H63Ct+PCa84kioORyTjClhsHo9MOSFyRM7NxiTV4V5mIGP?=
 =?us-ascii?Q?BsROq74P0953G8EPE1QaFwdCp6THK0Fq824Jhob4u9ssJKNT4HKPf8BfAzMZ?=
 =?us-ascii?Q?uHaasqWwWRd3eTspV1rk8RI0xdPk+WTTKQimoAl/Q2oWvwjTrsC5dcDkawQr?=
 =?us-ascii?Q?KaIC/LfRZiKTc5M+snkYPzoIhaU5/RKHWZ1vF6qyQGdI2M8Rdt2fMzwGxeb/?=
 =?us-ascii?Q?VzoG22vnuf8LhFoWUrQkZ+Z6Ph6NTz5lWKCPq291Ka+UWI5qoRx7sVICyViq?=
 =?us-ascii?Q?qvnFzSlt+vdkYJUF/irgZ5XOIa++svYhKWyvrKq2gq5Dc1LniOBoqsJ1HsIQ?=
 =?us-ascii?Q?TaQ28XfOu1pLW6gm9amGVeaOnBZ1BMEnjSqlbkQQWRHZeNLUDNAu4ig+93sJ?=
 =?us-ascii?Q?YSiaj+LYGMRFs5Ibm/AtMGxYvnHmCLhxTK01WL2wHIAeNKsrBAh8EFxqjSOo?=
 =?us-ascii?Q?gSNZqFpi37vclKfQ+UX+NRqFQjpQbdUAu6SLHUYZo1PDkka9nKSaNVzGE1Us?=
 =?us-ascii?Q?wPQ/hdZPsx4+YxKNmi34p37jjTVWhVE64mvmbT+EehqBCSgaTAQHx/5QayvC?=
 =?us-ascii?Q?6jfTE6wRyiShZC07Xtc1B8vsoBcqrkCIjTGiEnM3Z+HbEHYtfN1h7UyYGRim?=
 =?us-ascii?Q?7SkPZIvVFTY173ByHl6wsJ5INfoLYA/bQ+8x5Z32ziJIzvFCZdtkSz1+du5t?=
 =?us-ascii?Q?d2C04UQKYYGn41g50bBn9zrky+xV6LxIc1F6d7x/x/WtggY4xtUHjxvG8FVX?=
 =?us-ascii?Q?oYJOWfqU32pLSdIaBQCtaiN+ftHuxX0n5NHe3qdFFtSDPTKpTJhaUu/jP5YO?=
 =?us-ascii?Q?aonnwKrSTcmXVJMpAscZk68bI5vSOV4fsdJsyYas3thJxujMH19GB0MfuG5S?=
 =?us-ascii?Q?ZMqbSbbpQfos/V0Hid2Rg0KUMtI3/vo0o2Db0IvDoJPCIGVv776YJm0EEVhG?=
 =?us-ascii?Q?+76HmqhJUbPgDotfSR8Hl2a1SPYlk+DXDHfJ6TyF2sMAdiUPAQXM/T4ZiFHy?=
 =?us-ascii?Q?ciMHS6DAMjnpdksgk7tE5sh4pk1JbhY8w6m9RtUXyMpqDlI3XKAp/+FL/Emq?=
 =?us-ascii?Q?94Cvp1SgrhOHyYt5S5D3pAiCVKX3IiQcItlOGGBETlc39eZ0kk+zrcWB1pwK?=
 =?us-ascii?Q?Un/OTywFC0Zf0oHGrUQYyAwBha810YOCaw2y8ZRSRZJcw2r5BOnryDsus6ya?=
 =?us-ascii?Q?zyfa/ExVf7Vf/yMjScKQ4BqyNTpptfH0vWGh9jOhmn28GjC3Z8UYKc3HQZOq?=
 =?us-ascii?Q?HhXV+Ifu6E/JyvZZWwfz+RknHLvquFO/YU8Bor8LHPhjGKTYfYBE1tkVgjNn?=
 =?us-ascii?Q?hG6mYLDYpPkms78LMxyciTKTnjZh5horY5C4ZpR5DRZ6bXpWqSF/u3x3TFDU?=
 =?us-ascii?Q?5PKQs8/c/BLmnYKNiFqJFINl/RGK9BKk6Ul7mo4+I3tIWOB5jI8UCNK6aZQ0?=
 =?us-ascii?Q?JvAn5J3qnhU4LjzVh7pjQ16crehA7NAAktnjnwwM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be39b4d-7783-411c-79b6-08dca9f9bf38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 02:55:30.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9u3KC7avtTJSaDoGDhk00K8Ge8EhZEgPOA32/TJyogwTDvIXqUeal+qabND0n7B7Ph4SmWEVvcifcU5z+Mi9Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290

SII9022 and TVE are connected with IPU DI0 and IPU DI1 respectively, so
they are in two different display pipelines and may run simultaneously.
Keep TVE being enabled as imx53-qsb-common.dtsi does by not setting it's
status property to "disabled".

Fixes: eeb403df953f ("ARM: dts: imx53-qsb: add support for the HDMI expander")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
index 151e9cee3c87..dbd9065b8bb4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
@@ -83,7 +83,3 @@ sii9022_out: endpoint {
 &panel_dpi {
 	status = "disabled";
 };
-
-&tve {
-	status = "disabled";
-};
-- 
2.34.1

