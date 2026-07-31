Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFAB419FB2
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493140; cv=fail; b=WWyC8QpaDgJRVAX2u4cpGVFF/JGofZhAQmFfOnzBQvmGQ1BEdddZCdVz+RkudH7n1oOBMvu6azB3M8z5A0Jd2SMfcTYf2bZdKhLLs8j6hzwb+129bM+Yp0W2a4Q0nC7G3dG4m1JXMvPVHm4DymIcmhakACKd5o9e2EB2VlxQ+Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493140; c=relaxed/simple;
	bh=DMM+tfVkx55nbCXUS+uxIUhIxtJRWo4DAmP5exQHbVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T6Y1ikoqvPgIZC5Utrm6qTCce/adLUOGllYXFKFl6gdgRFyCgj29Ive48AHeK4I4gjys+M8vgp82tBk9ZedniJrF31iOLioq15TOFdJDqRZin1pYmLUh3NBCSsG/smb1YHbOJik4uI1rJybRqgmVnJ0R4hTr6RLWH+5rDwNkuiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iQcCWr59; arc=fail smtp.client-ip=52.101.72.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iQcCWr59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st3KbqZ7HsX2XfXx9jLNs4ti2UkHb2t8SjY4lK8j1ogM2I8SP2nNJghLkfTU3crrOI/ToVnBWoWPt43L+kzMtPaK8DNvk4gW5GbhJHPqG+YdoBbxxfyWpzQohNtTYW5LcmhCksBic6mw23EfkjPqcPnEKA+e5DJIgtSZ5NJ9JozkLwTdpMsJLuY2QHvu209cVNPf1kqIN7RBiXvHHo5iFwggUUCNsBSzf5AgETa3EtVNP2DMjjEBgCGaeKWOxf04QyorLLZmCQ2zO+hjTPdXdKDlOV6h2dKB1FLa68YdnhQm4wZsjYErj3bAWng0c0i079tXGcBlCSoKJiBxwn6o1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxWTNgLx77woEz2rZDymkcqbzQf534k+k/AY57zjGyU=;
 b=ROnmGTnE0YkR84TXAcjbS1GOcIYTXf9xTJpZr3zfF539FDo8dOYykEwWj925FPxqYCMIqXxPALZI5W/qUNN1GlA9txIm64/TFx87myQqnDhg/WVnnJAMw6IM+9AO1FhuGVnSBCFe5vdTW80Gg7ilL4amc6YcODMMgWslSD9HhBiGMmcxuaD2CPwXD1SO5Jm/Po3MNuZyNrOr1j2kMVCphtHnPbeR8mQPfvB0Zd/zxiFal7zJmH2o+vkCIHV4t+KzLzSwJ0f7zRISXKqNDSX+DAU+tVCmqgpNnCNvR/xc5Wsx/PF4IzxOjuRCEC08NUseLPDI2fOHuZi1neIhiA27vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxWTNgLx77woEz2rZDymkcqbzQf534k+k/AY57zjGyU=;
 b=iQcCWr59I/eWaXxZ0RU3Ca/7RGhQnaboNjKs5VRwzCJGTyRMVnzK4sWozCX2+NkizCZYE3dSrcHB3BV0sBX669qqPr9dT2jbLLv4kNu1ezTYHuMVERTxbowd6AgqisJDYmAIRWMzZuK5H1LG4iAYWGwGpUZ2gpg8mw7889s+uyuvshhVykch4fs4pNNln5pU0PxhHa3sEMHrp1fWo+7onplBTho6eVrdoWnx4JOpIO7wmQ471NEDsAxP4MWBJzHD+zqjgeJSt+I50p015ZO3efDqJZkDIfkGLXq9IflLye5D/iQ6VWIGs+BaKyq3ptCuspRHNQLbe4qgyOsb0b82dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:18:30 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:18:30 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 31 Jul 2026 18:21:45 +0800
Subject: [PATCH v2 3/3] arm64: dts: imx8mq-evk: add
 regulator-off-in-suspend for VGEN1/VGEN6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-regulator-pf01-v2-3-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c04abe2-00ad-4c92-cbb7-08deeeed1181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	HqzlqxXugWe9PTLR4spmKtcET8Pl+xQwg9qSs00Ft/UBXFakxtUS4kCTXfSW7Pg7PFts/be7kKbs4TctFEofWqQn9mIZc/40oGAxK2ATXvvh2c71FPuT54R5Ks7kRzaRZ877uij/Br+3KQPyTrbVIjrCrUFoTLlInfYDBMEF0XLP240cMMFlER7UYzW3/fa9sCGfIf9MDLCpa24TyK4AXw6uER7BZJoFs7eHW9iNOgTzI45JlPCXAKOXcmJcxL9G7vN3ql6Xx9HT23yPRFivZlK3nqgBR/71LpCR7c6/OmfnuuKNi2Plmpop/QpMw1kLswtptpb4W0xC5SVjIgpZ2zVlwiDeajjHA4DusVqVNCgK6u4JDVdzd2KK2kkJ790J6zPWK8KY08f8KQ0PDtpbgBtg4zuGPG3iq/tTv33bdTjhGGi/uf7SF8UEegnF79bjsniwrcextgE1+GMDgj7Q3+YWlBUoorwwNo/qXgmlDgK4oAeXemqPjo8d7U3x+4y74ciysosWTODJHP78AEILgdE/teRxgsTkvh9/LpcJ7v6e9Olzibbuwd07VcrHCdH2Ne1gEsfOarRGqja/1NPpftHutARYYgGZd63bU5FKiJrmSfYPyzpa+y86YOm7jFTXJvUT5PSNbRZl4ck+lTANGBFyOBPXANuBbllmHSkd6Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUlrS01UaTRnNjJBWUUvVlowVjh3NDFVMHdlSnlsZGFsWDdkZFdZTlJTWWlE?=
 =?utf-8?B?U3NlcG00dFZwNnZVZGdyYWJXVHZwd2k2aDRHWWR3YzhkWmwxU2VDRHptMVpO?=
 =?utf-8?B?ZWlJTmltNUx3NnBYeVhoZUhqeEU4Znh6b0ZVd29MWW1yQW5TUWZpY09qZ1RO?=
 =?utf-8?B?aE1zUm96R3M0U2tNeXRUMlBwcDNUa1dwSnA3NHZpZkVBS2IyTlozOFhWZDh6?=
 =?utf-8?B?OVBaUG5oSmxJVDYzeHBNUmc2VXZ1NHJZUUxvSVJZRTRNaDVyM3J0WFlLUXJP?=
 =?utf-8?B?WUcxc2JRM0FaeURpdmtnOGFNMC80amh2VklZaGx4WWJTSDMvMGl0MFovc3M1?=
 =?utf-8?B?SitEaWRKTnJHS0k3QW00Qm9rV0JWTG9oSTc1UjRiVUpBUFptZ1BCVUtZY1hU?=
 =?utf-8?B?OUI1WlJjQUlkRUp2U0FiWU1KaGFud1crbVlxWEdvbWEvRUJVQzNlMUw1aHB6?=
 =?utf-8?B?R2xGTUtXWjhPcWs4QWxpTjhBWWxJNHpHb2FDRzdyS1FjbmFzd2hFWm0rZklv?=
 =?utf-8?B?Yjh1WUdQM2tuZERHeWE1Y2lrdlNrSG5OZmRWdzR0c0hUUXVCVzVQdFhiWS93?=
 =?utf-8?B?T3MzcVNoTEF1U3VreHlzSmxITWM2aTd0dXRPWEUzL1VNNnFFT3FKbDV2ZFZS?=
 =?utf-8?B?NUozamkyY08xcVF0S0ZLcDQ4dmFneXV5ZWJtNFkrQSswazJwWjE0T0NhY3pR?=
 =?utf-8?B?VXJ5Qjh2RUFwc1RRaWlhY3FlTWg4ZmZvdHRLYnlGdDk2bFpBSjVCOFRMdG5o?=
 =?utf-8?B?alREbUthVTBCQ0dPUEI1TW1meTU2dTNWckw1YlZ3Y21qNnVib0JRMDBCazda?=
 =?utf-8?B?SE5uSExsSGtYOTkwQ0pCOEpIZnp1SVVDWFNBM21WUyszOU55Z0lsTkVNMjdT?=
 =?utf-8?B?Z0gwY2djVEJyMjkvT2tWTG9nY09tLzFKSmZDMCtjeEV0UWtRdmlSRmRUZ2dP?=
 =?utf-8?B?Ymw0aHp5NWJnV3VjRlgxc2tiNmJYNHpSeDUxQ1Ewek9pWXZISlRZTmlsazFO?=
 =?utf-8?B?OFdORXZjdm5rKzY2ZEt6bjA2ZWUvTWM4NlI3R3IyRGxrcmlYSys4YkY0Mitw?=
 =?utf-8?B?WmRKRkM5TGRtTmlZdmZGTlJnVlJQY3VQS0h3c1EyUEgwZnNzRmlWUmdkVElq?=
 =?utf-8?B?UkttR1lRTXBDSjdqOXVrVU9FMkZEQTZZZW1TNG5mL1F1WXN6ZWRqZlNnUi9n?=
 =?utf-8?B?Z3JvcW4xbnpoYkU2NklneXl5cnJMWHBYclpyRi9pVTg2SDIvZnp0TEhscHdO?=
 =?utf-8?B?bDFFZzB3cEZiTnFZOXZpcm1QOUYzN2x2T1V5K1NNZXVtTnB0RjFTTVZ1QnB0?=
 =?utf-8?B?TGVxWE5HTkRNNFZVVjNmOElOZlo1TGh3d0tlTFREU1I5c0dGMC9Ld0VXUHBL?=
 =?utf-8?B?eHFDZENSQi9TT3pOT2pJelJTZXQvcDE2TkRMS3lieGh0VTNFL1J2Q3FkNUJw?=
 =?utf-8?B?Q0tuRUZJT2R3MVBuei90aWRPUTkvdE5jaEVBY1hHSjZhSURnOWF3Rk44Sk9v?=
 =?utf-8?B?QUIxV2ZPd1ZENHlSQVoyT1J5ZVUya2s3Z05nQ1hraGNwY2x3cUd3N0o5S2lX?=
 =?utf-8?B?L2Y0RW1GaWwyM1IvVnhna0tLZjAwREFJL29iQ1NaRXoxRHZDTVVBWmpzMGlE?=
 =?utf-8?B?K0FXZlNhZ1F0SFl3MytKaCtOeW5BUWhwTmZ5eXNoZS9VUVF2dklKUTR0TmtN?=
 =?utf-8?B?MnJ2YW1URjRmWTdmUUo4eGZHazRqeWdjM2syV1M4MVFSLzVScGJHa1ZseE51?=
 =?utf-8?B?a2hUQzFseHVZVjNra0xZUWFJVXo4Zis1S2dTUWZTV1FjOFV2WjFFZUhKbDJO?=
 =?utf-8?B?SU1BTldlN3VacmtQT2M1QlpoblYxYWswVllqb2kyR3h2YU9BMWhTZnhwYm9R?=
 =?utf-8?B?NVJiRUZjWWtkQ3pzQWxUa1FkYURVOU5CSTVEeW5wa3JCdTZsZ2syaS81NVFj?=
 =?utf-8?B?MC9LMGp1d3ZqcVFSeCtQaGk1cEdMNGdJSE9oM1RtVWptRWVrYk9pZUhCdXZl?=
 =?utf-8?B?TkNxTWRnNEZ5T29uTVUxRDZFd3VWK2N4a0QzZUxTQzQ5KzNqUDd6TzZ0ckUz?=
 =?utf-8?B?UFRMS01FVnFZYUZlQTZzTVBId0JrZjYzUFRMa1ZwS0J0a1pEbDZqcjZ3L1Rm?=
 =?utf-8?B?cnZHNHRKYXUvZjhQMUxQaEtjdWVCMWQ0ekpzNmdxUS9ZaE1xM3lyYXU1Tjlv?=
 =?utf-8?B?UzlvdGlTNUhKZm0xYUZXbko0K0xLVEE3ZW1ucE01K2piQXFVMDZ3RUtkd1Jr?=
 =?utf-8?B?NnBjMU84R2tDVzBPaG4vYWFLVFlnZ3pTM1VxVm9BOEtoN0h3UTBXTXJtc1d1?=
 =?utf-8?B?WWRaUDF5WU0wU3NiRmlvNWtNTzhJWHdiU2psdm5lbGk0d3Zud25oODk3dlJh?=
 =?utf-8?Q?TFGOxkKRG8LmOz/8P7fwS0SJbdWjGtl02Sm0j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c04abe2-00ad-4c92-cbb7-08deeeed1181
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:18:30.4607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfZY8CmGYjTRdAmNftNzJX2V+e+Pa+DBC6Mu5s087JngRmdsXN2O4+Qn3IRDaWy5S5dm5ZE59N4kfKObYKH3pQRfZrciVup+WlV+RG91OjA9FLRvjcXMBIPZEHL4QTwu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179

VGEN1 and VGEN6 have no consumers and are not always-on. Mark them as
regulator-off-in-suspend to disable them properly during suspend and
reduce power consumption.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
- The patch is aimed at reducing power consumption during suspend. It is
not related to the race condition. So remove the redundant wording so the
commit message is clearer.
- Link to v1: https://patch.msgid.link/20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 5ea04703ddd7..fc0303e44433 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -299,6 +299,9 @@ vref_reg: vrefddr {
 			vgen1_reg: vgen1 {
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1550000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			vgen2_reg: vgen2 {
@@ -328,6 +331,9 @@ vgen5_reg: vgen5 {
 			vgen6_reg: vgen6 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 		};
 	};

-- 
2.34.1

