Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B63F54CA
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285812; cv=fail; b=OHAFF2kKd4U44Ozp0f00iiJa54ddkKofNL3V5rmKIip4uKgUzAjAFClIsnDmaB06VYQzm4MTE3/weJOdGdcbi/6+0rAb2xwxO+bO6Vhujx8jN5sKz5RjW4taS+3f2Tb8ilK953rduSZS86C9JoQ21jwgrIzSd/SLfmvsNwdEILU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285812; c=relaxed/simple;
	bh=rXCz+RjRryPw6okSsLS2gT1n2zw3GWgVY8tsmT6TdRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Vu4THkS/ojvgoYp57lzAlsLJuvrGCEl9fjtqTZM0oT4MscMCktclSjgZvM8B0/xyszFxTpkcPvHaFWJ35elAxh+ynrSjYMUYTz6rBhgVGl6mOw86dy513nK7iPAFErQzsZZDAB3WsiLb3bMxZGBgEyYWvME5QaR94w5RqExsCaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EGUnVjfq; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EGUnVjfq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aj0/kewCbp4Mg8YgjMzsn+iOreuu0c35xyctVIA+sqhxyHMMtGq0bjc2j4fNaUTtEXK+rRIFjXn3IzQ2w2kbWOCiS1y5PTaYdqjV8bclHJ/H6s48ldGIei2onMGZJXEL+g4ULcf5/c+oTBrIOlHzeMoLlohd692eb6JFFjVv/95WPnivWAoivXSRAzxYsbvpsOcgGOhTjIApU0P93oZofnLFVqE7lUtEksbELxtCE6YfVdo07J/RiD6ESBkas4DEscYvi1SKKpYhLFxDM8EeZTJM/Y966u16JGzEPDFi2Db3rtkNYh2WSTnCvDVeotANoN7MVIC1gCcijkb0o5SHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=gGm59dETIayfAsF8ce3cr0eKXhU3xxbBCyF2zPwLgSNN13h1zV117CErfeWaHFRr/r5P93jsgJ0Zv6T/e6JJIh1odkTLqwCKd9XWaMSVa1MGZMIFQD8v6bD3DMOYibFM3cfSCqg/lwfXShbXa8a3rjo4ESx/XVy7466IpyLR2FE9CQoPjhT4iMN9mVEKVg7/lJqCGZHvdnRy0QL7QEEyKjShmN6p3JCxjneVwCplDCy0erAM38iUNZICGBvwU1l4ze8oRx7hwv8soam9zLXpP5jnqKyLXHVPtxM6LQC+QkpxcIgjMgHuG+I3YoPIu/rrDiluhGhkeauqSPXogsir1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=EGUnVjfqpLj69ILwkqOqmmPby1seqIQvY5uJa8nuD+q6J9AM55r9MV1eB0OBG2hbaVhJ2PZCv1xoa7TbWsuxErjCae+YWUBse8cANLsitEkuCxpQnmIOMxolhZJOGZ0XKizjHZ4TP8vtLpwP3IZxaZQLX24mznmnabXtpw3NG8tCC55jqKeKmhXx0J0qSjt4wcBdo9aBIyvCoDpCNY75asxCoQEMiNuWs+Pp0LZk38gSj+RQyKpvNzuT28QLPTyngIWT76X6X2ukplLsNBG/dU4+i6ko7CKJHEcMD6lo08sQdtKsbmrk/DPvYchxBJ/C/Qlew3BabQo6gczdYskhww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI2PR04MB10224.eurprd04.prod.outlook.com (2603:10a6:800:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 10:55:54 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:55:54 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 17 Jul 2026 17:15:38 +0530
Subject: [PATCH v28 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx-se-if-v28-7-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
In-Reply-To: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288732; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=hnPFsRK9/RoyluFDiCjFX7uqhb3SO3ctyv+6dqueb4c=;
 b=k9nxcbt5+zAbGHn3RsETTmYwSwQLsjuqvkK/9kNl5VgsopCG69Z9AeeKu56Phy0m1o/w8fbN5
 DO1lt04TN6JCtOMoUOhri/TfsO60ql56KzfUY3wMPL0HQp1KixeKaW7
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::9) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: 35eb2a0e-5a41-43de-263b-08dee3f1f912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|7416014|10067099003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	xNm4HDf4Wo57d5qqJ52l8Q3KtdIRlQ1QLMYQfmFmbKFtaOLtTCMpmCVHlo0jGh5h6N2hemgYqJsz+AnByiLJQJ3Vdzbd6mXUZdpYfN3ovH6svj6SMprC6eSTKFG6bS3hewS7fCdEaHtKEzhvxTvIP7ABQBB6YT27tISlXIf+5+tnbdkfON7yMKhg2VhcKUwApfjUeRRHBE6S4Y4qouAEQD5M3VvNNhaJyVn8VTVF+2KyTX3U/wBIMYkhbrAdl4Y3aNTaLuAMkuR72asS2I6T248rYX5Uk2Cobl/keNS7OFhaCU2eaYP/0ULpcifI2afSbN9o4MPh/rAikF8NmvMbV7Tth760eVdUtlA/XI47NgNkY5vg5AOTGpdew13udlzGvzHqmYep5E10yh5qfrCeI23DtA/D4K9jJ0arsN5af+tADhH01PM8keZtFTtuDyPBK3dxZEZ1u/FXm++6Sp6nyGb39waVT0vu/sE4fDDY9ioOlvg9Ja76kn/rVt+F6Nr4WYPKYSF6F1qHG3bUuf3jqsQy4AZhuBgSysXOFsyLo6hGY27Xzo1jl9yft8evqWrwOt0AfmzWRVMscxMiTR6kelxryXqyTdHU31J7GRvkRVmk9lQWCSdOZPHAqcbzsEnln0ATOuIgsqJ/HCkaGxwNe1VAnmmpCzMcmIIKcwgFbWVmeCweVafbyoE3uiwZhJIjnwLPPyERXaYIbnToG7759g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(7416014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5EQ3A3dGJ4aXVkSUVLS2tVdmxlUjNqRVVCVnRjcUVCZ0N5aTY0WFBsS25E?=
 =?utf-8?B?Z1pYMDR2N0x4czJTSy9ob2cvbGo5YzFzWi9vSlhTVHZvanhuWXlvWUFWUG5S?=
 =?utf-8?B?aGxjelZ2OHRIOXlJM0p1dlRpQXdyK2F2cnY4UXppT1lkT2RwNWZIU0ZJR3hZ?=
 =?utf-8?B?Y3BzRkFKdWluR3FQTktKM1NJUE5aY2llSlNpdVgvRThiQ3hRdURXajBiLzVT?=
 =?utf-8?B?WGR1N1p6UE1JNWE0V3FtNFg3YmJ2UTZVazV5REhBTEttc3g5MkdRcUhldVo0?=
 =?utf-8?B?MDJJTWRUU0NndGNjQ2IvdThkK3FDTjZxbEcyVXRIbFBYeWJsRVp0M2FCZlVj?=
 =?utf-8?B?VWkxVkYvb0VBc1hzb00vWGUrV09NWktMSXpSZ2ZlYXhMQnBXTlEwR0dTakVu?=
 =?utf-8?B?K1U4QnVvUkd6TEJnc3p3REhHZGFXQ0tDRFdrbStVNnZUYitySzBWNFJ3eHFp?=
 =?utf-8?B?akFQd20xTy9OMG1OZUNzL0FzNTR1eXZ3NU9qS3NYdnFTSU5JRnk5UGFjYXAr?=
 =?utf-8?B?QkFaN0swUFM0YVk1ajFSSEE3REx5VmpWVnVpLzlDbUYrVG1raWVIZWI2cEF3?=
 =?utf-8?B?RDMxdm9lTTFJY0NIOWNSMTRqVmFtK1lMZEVLTi9Kb01PSGs5SHpiR3BRemI5?=
 =?utf-8?B?UGowdkI5aGppTFozRHlhMVBTcWpLL2gyRGhkc1E4RURqQWFjazZ0aURsTGdR?=
 =?utf-8?B?SU1HOVRtVU9vKy9GcjBRaWY3cjVHblhPdk95VGF5c25DcThpRnlGa2JIWkd3?=
 =?utf-8?B?SXE1SDFoQkFsWlNMcGlIM0FJV0Z5cHdBZ3UrN0o5YjNRb2hmOXgrNzJubzg0?=
 =?utf-8?B?WWVZMndqbzZOUm9zZy92MjlVdUJRMzhmY0xrUkt5UEVxZUhKcEpvSEJPdG1E?=
 =?utf-8?B?UjZWVmNTK3dCQ3kzYjJJVkdySE1NSWU1a24yK1EvcE1ja0NMc0JrcU0yMmtv?=
 =?utf-8?B?ejFFcXRJN2RGRE5HaTJhdHZOeVU0K1hXeFBFMElabkZzczk1b2dNV3BPbmY0?=
 =?utf-8?B?V05wUjVNa0lKdC8vTDYyU0RPMStJcStZTzNsZUs3dURoVGY0V3lrcEJITXkw?=
 =?utf-8?B?STUxZi9HS09ZeFJHQXlyZW5iQkxqcUwwZWhGanhVRzJIeUdQSC9ZWndaSXNx?=
 =?utf-8?B?ZkZKcEZCa0RiR0txY1NUWWJMQlBOVVgrM0lwbHRyN3I1SXRoRjA5SU9YSFVk?=
 =?utf-8?B?TEtxTmJtL05kdVFoMmJrWWNZTXN0ZmVpWlVkejJ6YUp5UHViT0NjOEpVbEd3?=
 =?utf-8?B?SDg5aHVEV0Npa0NIKzV3WCtRQjJJWHVkTzJ3VS9YdklQNnI4cjg5UklkY2oz?=
 =?utf-8?B?YlJYUlFlTStyV3RrVi9XeVFkQWkzVC9sWG9zNlM1LzhzajY5c0swM1Rvc3dV?=
 =?utf-8?B?aHdKYTFMRG1Ec1RSWjRQbk1xQWlLV3oyNkFRNUpoYnBBazFVNlVvbHF0NFgx?=
 =?utf-8?B?N1dzZmo2UUtESjRYUUprM05ITko3SkpxN2hOZ0RCby9abzVyWVpUZ0Z6N2NO?=
 =?utf-8?B?VFZOR0pCYTZxSWQ3ZW03aGVOelBXbmp1WHQyU3dvM0ZnSm9BQ1QxS1BHbU0w?=
 =?utf-8?B?VFAzeGloOXR4QjFIZnBoWmd5ZEYyT3NlcU40STZISTQ3QW1Ock1jcDIraStT?=
 =?utf-8?B?NGYzZ2RHSi85WGlvOG5kaG1CMzMvTk8rWHRibEs2K3l6Y2M0VlQ5TXFpS2lQ?=
 =?utf-8?B?Y2I4eG1Lb0s3S0dpc3U1SVR6L2F5YmJjVXNlbVhpcFFtMkJmQlpxdVZEVnh3?=
 =?utf-8?B?cjVYWEhva2RJZTV2dHhzZ2hSVDF1K0NGTTJNeDQ1V0t2aW5hZ0NQMlJuWjBw?=
 =?utf-8?B?LzlZRlFWZmpkRllBSDhPaFF6azAyekZyRGY3WjB1QXEzWHJtTjd5QjBybVp6?=
 =?utf-8?B?YU10UzNMQ2NUWDN3dVdwKytPZFZralhyTGpMY3dZVDVTWWF3RlhtU3BzNUhk?=
 =?utf-8?B?Vk9jc1NCVnFiZjJjemVqNEdVYXJKOG9OM0EzNDU4dml2L1h5NEdDTDhqTkxU?=
 =?utf-8?B?KzBsM1ZZbDM4QVh1UzFxVVk0b3UzUXpxNElYV2w2U28yd2wySFE2UW0xOG5O?=
 =?utf-8?B?dDQ5Nzl1dlJXUW1DS0dUTGZSZmcyWUhmQk55K2orNDJZdEpxVE80UEVrRHY1?=
 =?utf-8?B?SUxnQ1hzaVhLSnd5RFFucEh5UjU1aHhYUWpXSkhVYTRDSXV4RjhjTndLQnJ5?=
 =?utf-8?B?aVZUS2xKZytSL3M3eG03V0lRSFlldzdqRG82bnMrOU1yRjdReU9Eb0Q1dzh2?=
 =?utf-8?B?R0lTam9iSW9pL1JXbXpDRWlLNENoeURmdlFhbUJNWEZwaVZwVm5oTFpTaWg5?=
 =?utf-8?B?cWlyMlNJUEpaR3VTODVwRDRSOFdYUkxuaVVTWHo2RHRNVXJJcG92ZU5YdlA4?=
 =?utf-8?Q?ODUSW/v/9l4O2W4zNNkTGEVFU59S0iKGwvWgi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eb2a0e-5a41-43de-263b-08dee3f1f912
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:55:53.9845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T09F/2Uz6nXNMbSAtGuGABWXO7iTo9cf/wU5zgrmjMBQvuiuVAimt36nVTY+Be58Lb/ZfzqvsNcdFDZ8/6SI+QQc6ysw7826kiMPYkjQ46q9XarC2x4F0fn5t1gtTcan
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..16399d921e04 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

