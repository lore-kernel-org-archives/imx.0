Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31C3DD847
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084952; cv=fail; b=WsN3439koXyfHCprs8UeEigRMduRSk6k/259OKdIJmmLMOEeasy6o2Xw9G9vV5bQoUDnAp7KlWpOV8DGINSbEUw77gfyqDuxGirI8O/huc9EN6MsMLl7jPVULVXgBArtT3H1EZKmNGir0LTl66AlSVsDmXZPZ8bEVGSBC3lt8Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084952; c=relaxed/simple;
	bh=vZ3wfJfdiW3zqH0+sxV1y+rNVzjTeVQ9GmSjVeB6c3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WpdfTGDK9oFWg32AxmXSFd5JzUkOHCHm+1PliPb1hRyMsy1eVt1x+1ay46BwoCI+A9/y0DlWtSFdkkrnLicQDgSbjiR7wH+0jJnQwPg5C12+jcdnDiwghmbAXybkWQxVcauxSfb1tNH+64K6Jn2LyEaVwZrVngLH/+xz8Sca9jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tisNEa/w; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tisNEa/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pflNMGtWiPwXsjy1B04CZ++hgHDI6ykVQETAZdH0sYHhG1RBDJ+MMXVFcqj6pX1HJQT0Ug7WvWIrlJfOv5YyQgTNEs9Tz6ZuOL+IbhCQSA/4oa2lt2Jai02AP2sG7iqil3uUd1215ojPYX12rbJ0OK1vgilj5z6slXKxQ+5rsuDqyaqTJkSLnBk2LCkv81pOFU9jfJjKDTziojwjnqSEO9zoAO+764cM5EQ8y0FXS/Keuk1iRDeJTxuBtycVbOkibfR71LshuAeDvRnrXiL5QcXZAIetpX/xHxpm6Ea7qo/2sj+y2z3ZWWTswfhJVnFg/h5o+LVygdPjrEoDjTXeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3PHvNAkLfyzKLYXg/H9ItO5otO3ceYN3s7CBn5sO7M=;
 b=jiAdpEXKV2wOucvBVOonrXeEChe1XA+wx25c60JkjOt1Z488fUT1fW4VVlEYqj66GxY33vebBEiwpARCAYvr4T4gFFGf/d1FKt7cTUM41CHPEUzBVlS9DgY6+eQqafCCUMHO920i9DwVjnHm8DnuQU4ww8yYbXWl1gpyNZIjur4KuAvupCz4SUOpFNciRlbE9M5StyJXpAg+8XbSr5kYLGjgchi6hezVzGJI5nXW2XXlSGt4plR76iaO8GTYoN9h3gDKmRcCHsQ29qrvxSsDMftI/RiweIzp5Yk5LVsRPRcMscCA+XsuxWxcVfU4u2ErDRJE947rex/b5aqsvIwluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3PHvNAkLfyzKLYXg/H9ItO5otO3ceYN3s7CBn5sO7M=;
 b=tisNEa/wq/cnvqcoRH/k2ySOOxPNTiQV1/qh6XmZlvR/nAJVqD2vS/JcC2v/A13As6GWz0cfhlUUe/LimzC4t17Hypbpq3udk/rjS8lo7BD3VunPulhtn8rn8Z4I9WcUNBoiC9SLALf4vFqFAzoGzeBNKjsoRzfqnvcGa69whSb8V+woEQLW9/xNsJBayKJX5d9m+qpYznJEGvmal0wEx18NgcTFCGnS7qCGDR5cTS0/+qT7iW3WJ+CnPaN5y8ZcWYIbFUKZUCSIMEeEbwHCx7lgv2tDwm5eqQZNqWWHY4rbryysmyJu+EQEwF0uh1vNnYypLDUzirKjl4oCKuekfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:15:40 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:15:39 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
Date: Mon, 18 May 2026 08:15:22 +0200
Message-Id: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::6) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: fe33af13-96f9-4f6b-d9bc-08deb4a4de9d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|366016|3023799003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 xnv5jMoFSjZCHHDpEyUC4XKKPJGKESqvhLAr8DtYQds/FmYnUMZGvhGudVkj2aT9rw2svxetm2Ea2r5aWKepEJJT6OiM4jWplJCB9FO0MQUlc1JClw62yq8Sc8NDOreZe2r8Xvsfjg9u0xlemb4wEsFc81VPSPp5tZ4EEwJBAHapG0RNm4rPecqW2dRfgus56KRMbjOC7Z9DRwXU6mFUNqnDPUZLv7DrgkuewiVhfh5jakOv76MNCT8RzJG6gCyFvf/Bn2Pp+7ii726nIV4c9CA2gEE3Am9pVrKlaO0f6TY9O3VoRYOoEDZ/+MCrPc0I7jPD4hCoKinGUyNOQfsOO4nRYu9gUwgpaD5zVKN2wJpdRq0KCyfO/eeJwUyorwR/VdE883BEq0Cgfn/T62a4PiMV4UFUYsor/WNet/7KWT588kpKKhWwZYSS6YD8KQ4kCLN6zQBNBbA4hGqJX1BappTAsXpObThRHivsc77fUzre2AoZa30Ho4IC7lqL+EFC9nQ/ztBw+QfzLCHsOmm+OyBqTp5/GExdne/fe5XJLA6MLOB2G6dBgPcRvdlu+u03FCn+pqD+lFfSjPlYZpfWfesnIBiO0YbGS5s4iF/cZFLZi5zPBJ28xqVyIJf6vVGnrZciLKXNwV0I4+kQrTsrP303xzbegThxAXJvXUfffeIth+YY7c5/06+y7Br+d4eN
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(3023799003)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?R2FTcHpIRzFaY3R2cldqcmFpNXBSUkc0T0tBeTU3N2xGT01WcXpBbHdZMVBT?=
 =?utf-8?B?eWwybWtwQjNoWjhaaXdmRTh2QS9pR04vNWF1THZCYTNRbGFyU3orem9LNk91?=
 =?utf-8?B?MXRReFJNU1RSTGo3UlIyODIzMDllUlQ1ZFlJaXE5VHlCbDhrcEx1VGJqRE9M?=
 =?utf-8?B?bmQ0NGgxOGJRQi9DVWxTWW1QRFJ4c1NEUDhKWXRTYnRQMkxuYlpZNnBmZkEz?=
 =?utf-8?B?dW1UVlBibVkyN3B0TmpldGpwV04zOEhQT0RWVDNsckhBeEh2eVNRdkpHYURN?=
 =?utf-8?B?OXlwYmpUQkZkV1JwK2d6TGh1a0kwMDFHNi8zRHYwYTdXUmc2MHBQWGhMYnVH?=
 =?utf-8?B?OHNlQkJlMWRnNFJZekZlaUI5ZEplMHJ0T0kweVJ3bTV5ZHRtUHB1TURiMUEv?=
 =?utf-8?B?YmQybzdyT2R3aGlIQmNaK09VeUJEREtXU3VyTFFPTVRpeTFOMW1hb0FJeUlm?=
 =?utf-8?B?UkNtTU0xSnlpZmVra1RoMzlCb200RXRLYXk2Z3M4M2QrOFhTcTlaYzBnb21u?=
 =?utf-8?B?T3BDcEhMdS9mRFNUbFcwU1MvSTdib0RLVVZXN2Zlc3greUEvS1JKeUpYaERR?=
 =?utf-8?B?eHJqLzdMMVNSanIwK1lvQUxsYXNCVHFIRy9jcUdSU3l0aDBBSWxLa0JtdzhV?=
 =?utf-8?B?U1pRcXdOOWlyYXExNmdCZ3gvNlgxVGFvaDNXbXhJYkJOcDZBTXdlaytGV3Ux?=
 =?utf-8?B?Y1FyNUdZTUg0RWsxb2g2K2liRVVjOGNxN0xNcFR6YkxFTHJSMXRjMHB2T3l2?=
 =?utf-8?B?Vk9lK2Q4ZXgxVTFRU21DV2tNUVUrTTRXSHVtdWMzWDlsaXphMVVkUGl6VnZs?=
 =?utf-8?B?M2xVUldkVEFsQlJVc1g1WjJsRUVrYnh4M3NRc09SNmFZd3JQWkRTdVZ4MERs?=
 =?utf-8?B?T1FlUEt3N25uSVpTckY3RzBpSWZMc0lrU3AzQk9RcU9JZ2R3citoSmNXS2I2?=
 =?utf-8?B?RmpaZWk0Z2crL3pHVURVVkd2aGtpVlpJa0pmRk8wdEhNb0ovZ1l6cXRMdm4y?=
 =?utf-8?B?VFdpQjFwb2tBdk1qU1A1Vk9DRVl1dVBKS2V5a0NHc3pOcEZKL3o2NzNudmFm?=
 =?utf-8?B?aEI0TkN6a3Q0RlpBVlhSbFd4VjR2UWwrMXcxT1NXVElyZVZLaGh6ZTdqbmtH?=
 =?utf-8?B?M05wU21rK0VLL0ZzLzJGaHUwbUtETmVVUFg5U2ViS1ZMbFkxK2JFTURqZEV5?=
 =?utf-8?B?OEd1eFYzMDFjTGNXZ0RieUNKeUgyTFpCMk9tUHdCSG9ua0NrQ2NaSWJ0aFRm?=
 =?utf-8?B?RG1Xd3VqMjlhUTVKUlpEMXREc3J0WVM2ZWdtbHZLZk5KYlpJREdPM2MrdjlH?=
 =?utf-8?B?bmp5OFVDZ25IRExSSVZBKzRIRmdoZkRmVFovNmFwclRiODlQWk55UTFJQlpS?=
 =?utf-8?B?V0JtSzRRZVRtNktKYUt6NXJJeHpYSHVQL1pUS24zQUxlYmNNYUgvUHJxSEhM?=
 =?utf-8?B?bEVSdFoydVNQZDJrRlQ2ZGlWZUxTaGFNM1NwTC9NU3RIYXUyenIzSXFoOWdY?=
 =?utf-8?B?cXExbXU3bnkvMXoxWFgraFNHNUdpOXpnYk9HUG8vV2l5QTN6WGEzZ3J5Ni81?=
 =?utf-8?B?V1ZiNXBla1B6bzNRVUJHSG5hbU1ocmdUU1JvWmJnMlZRMG92NVhwQ285Qi9y?=
 =?utf-8?B?MkY2NUw1VkFhbG11S3BmVWUvR01tekgrSnM0RmVKQUMyd3BwdituTmhSUkQy?=
 =?utf-8?B?M1JiUGRzOHplTktidVFzL1VZTEQ2R0NVdW9FZmVkWWM1bk1VV3NqUkgwT2J3?=
 =?utf-8?B?SUVaSElxNTBoczN3eUREdGpxV2pMaGJzQ1R5T2ZwdDJZTmkvNHpVUU8zRDJ6?=
 =?utf-8?B?V0RmcDl6UlRWQUNvLzV4K1pSZnRaa1VCc1F6WWR3UXA2aWF5ZjF0WDlEOCtj?=
 =?utf-8?B?UnJNVFRqTHlGRVhuSStob3VabHBOMWdIVktHZTBLK0RWUDM0NlN1Mk1laGNT?=
 =?utf-8?B?ZVg2WktldUxCajRiRWR5dXhZYzJTYUhMN1JDQVVCMFJJeHRMY3VYeWJDUFU3?=
 =?utf-8?B?Vjh4b21XVzFUVTkxamxlQm5Bay83WmRoTTFlellmSmloR2JlakFHSkorVmwv?=
 =?utf-8?B?blMwK0hnVDFSRUpxRjBBS0VJUmRJenIvaldZa2pXTG1lVkJsZklsRGNrRVU0?=
 =?utf-8?B?WlB5Y05udXFFU2o2QVFmaWlSbGs0M2I0ckNxUnAvMUY0MTFyRWdKSVJTZzh2?=
 =?utf-8?B?NUg2dWlMMWxmOXhCNUEyc0xkQkR1czg1MXNSUkIyVmJEdkFGOExkUGo2dFoy?=
 =?utf-8?B?akVoZWRpaVY5ZWFBTVd3bGU3VEpTdXI4MjY1N2MyRm9NNDN5b0plY0M2ZGFX?=
 =?utf-8?B?Wng4WUFwbm0zVzRkc3c0TUt0ZHdya3d4a3VDdklSNTZMKzYzRDF0REpzN3pl?=
 =?utf-8?Q?v1HtVxmf38kgTxxRRBOJ5sNzrIauAGEy4sd20?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe33af13-96f9-4f6b-d9bc-08deb4a4de9d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:15:38.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1i1jMZgc9Wrm/46QnA6jKhZwaZVkpKz/IGEj1KTtVGf7/u4XoazfigHrpKG3aK1MiKXCJgWLjtlUvEHiOZptUqf+tb5Sxj6MeLiMquZKmxgVfv3gIUKEW4JkyiIafy7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966

Add the usbphynop node and the usbotg pinctrl
support for the S32G2 and S32G3 SoCs.

This enables the USB controller to reference the
generic PHY and use the required pinmux for USB OTG ops.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 53 ++++++++++++++++++-
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 53 ++++++++++++++++++-
 2 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..d096744cdb0f 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,12 +1,19 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
  *          Larisa Grigore <larisa.grigore@nxp.com>
  */
 
+/ {
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+};
+
 &pinctrl {
 	can0_pins: can0-pins {
 		can0-grp0 {
@@ -245,6 +252,39 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	usbotg_pins: usbotg_pins {
+		usbotg_grp0 {
+			pinmux = <0x3802>, <0x3812>,
+				<0x3822>, <0x3832>,
+				<0x3842>, <0x3852>,
+				<0x3862>, <0x3872>,
+				<0x37f2>, <0x3882>,
+				<0x3892>;
+		};
+
+		usbotg_grp1 {
+			pinmux = <0x3e1>, <0x3f1>,
+				<0x401>, <0x411>,
+				<0xbc1>, <0xbd1>,
+				<0xbe1>, <0x701>;
+			output-enable;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg_grp2 {
+			pinmux = <0xb80>, <0xb90>, <0xbb0>;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg_grp3 {
+			pinmux = <0xba1>;
+			output-enable;
+			slew-rate = <208>;
+		};
+	};
 };
 
 &can0 {
@@ -304,3 +344,14 @@ &spi5 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbmisc {
+	status = "okay";
+};
+
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbotg_pins>;
+	fsl,usbphy = <&usbphynop>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index 979868f6d2c5..b756bcf6469d 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -1,12 +1,19 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
  *          Larisa Grigore <larisa.grigore@nxp.com>
  */
 
+/ {
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+};
+
 &pinctrl {
 	can0_pins: can0-pins {
 		can0-grp0 {
@@ -199,6 +206,39 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	usbotg_pins: usbotg_pins {
+		usbotg_grp0 {
+			pinmux = <0x3802>, <0x3812>,
+				<0x3822>, <0x3832>,
+				<0x3842>, <0x3852>,
+				<0x3862>, <0x3872>,
+				<0x37f2>, <0x3882>,
+				<0x3892>;
+		};
+
+		usbotg_grp1 {
+			pinmux = <0x3e1>, <0x3f1>,
+				<0x401>, <0x411>,
+				<0xbc1>, <0xbd1>,
+				<0xbe1>, <0x701>;
+			output-enable;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg_grp2 {
+			pinmux = <0xb80>, <0xb90>, <0xbb0>;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg_grp3 {
+			pinmux = <0xba1>;
+			output-enable;
+			slew-rate = <208>;
+		};
+	};
 };
 
 &can0 {
@@ -257,3 +297,14 @@ &i2c4 {
 	pinctrl-1 = <&i2c4_gpio_pins>;
 	status = "okay";
 };
+
+&usbmisc {
+	status = "okay";
+};
+
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbotg_pins>;
+	fsl,usbphy = <&usbphynop>;
+	status = "okay";
+};
-- 
2.34.1

