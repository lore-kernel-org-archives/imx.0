Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FA3A6B9D
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485285; cv=fail; b=lhjaZ2HydAMbvkzJPQ1fejSunyqbsqXQJ2qfNOGHxuHIcC528CfqQnDETyxamlY3+ml0zfMm9t1y40cbsg8aGw6JMfXNnUJp5EOl1Jhn48+x/iXUyiFwtQSLxB65OOW1YrtO+BRvZzTMG4Rn3sqLORS3jVwM/jDuiXs3b31sF1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485285; c=relaxed/simple;
	bh=thn6bvns0/iC04Xy9CTmESNt4iZmKjMh7OUz/CxNPzk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MY694TE2lLe6xJNQYQT3IMiqfLOhGbX1Ul4kGjRVSDHJ8yja+FYNUfi9UqMzaTVY93lySuGmn9lkcFBVyyg/I+xjbxPWypLJooGdUq7kOWeC3eh0xmIbIb+hCGs/wthCBYM4T/CsvVlvsX1QW2j6CFLHjWM1texq/LWEPVk4IjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j64UVZ8L; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j64UVZ8L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so8E81h8SE+SCl/iRfqrImSCMjBVDZ4MtWttMx9Nfj5HjfFn4hTRQV79fDOc+91YQAM0By0qTOjCBjnpzY15odF8wUKvdBH4Ycq5P5eQAFziUKVMLOZ+udU7snH8JzJL84UUi64JGrHb6W4HYzC2kTyaUvYsOvUT2c59sx8VI2vY4/N6frm6i3q1Lf9/omAzzAcuzIEKKGU+ZZTUeuUSq74FajtqWs1kpnPXmqWa9RAezmJeOUqwg/o+yzrd+VVcnkGBu2pgQ7gmUNTY9M7i9p6G+VTr4jB5GJHckkwprH39RW9ipmWRy426lLwp3o/ZsncF6RcO5a+od1bmukCFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn5kupWeQq5/WINXkxwflWJMYYz/EjDJ15xIkZoJU6I=;
 b=WR6U+WLDfAYoWBHrEdHqiuspN3yvyAx8mfqTiCLF4PNF4cNSM8s/iqyoZg6gqCEwLHhqQ2qZkkssOYz7it4+RRx8O6dvK9up1y/VOMtg6HSNsDnul+OxMZY+9T1y2QGbnCuHLCa6ifTpG073CaoBm98KqYKYCfhlGo94atOLmrAf2dt1CWqChEik0SfXAdml4c71JrrAdit+R8NK9brLqTFbDJ7aXc/SV/oCWuDiZqb2koJikM5s8tJ5PxbWUbokhpWzOxD4xg8zr29HUZAItwDaIHK4NvkEnLCZWfhRcY5iuN5cN71nWWe7ua+oFN0UBi5jLVEFK2UwDlr7x+/uNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn5kupWeQq5/WINXkxwflWJMYYz/EjDJ15xIkZoJU6I=;
 b=j64UVZ8LY6NFmvuP62h2Iee8KOCmluAQtriNdjMfwjBQKM9SYklpFI+qUXc1fW1hS8h5zjufUb98RXsatMWjmctFp3ZoRiZnNtoMpVw64+Xm6hdRrHjq9gVeLRe4PbyEmZMjyDn9aHp8rBD4xJM/d+cW6aOxaImfOl7bZ7u7kPwSJNlIZhA/ypqLPUhEtOmyWZLySTvIgo1kqk3AWOX47Q91x4z9PtWBkdHYz42w/FTCzOnNXaHohLV/gqIdO1WD8tb6qBganjMdvKsUn+F3CgADS62bIeDOvkgbodh06loARCSJydRvrcN0WSenD7KZO+hYKami+E+Egyjog8sJwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8657.eurprd04.prod.outlook.com (2603:10a6:20b:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:08:02 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:08:02 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 31 Jul 2026 16:11:22 +0800
Subject: [PATCH v8 4/6] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-imx8mp-usb-phy-improvement-v8-4-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485487; l=3839;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=NI73wlLOP4x40cNo+d7vMqjgYxwbUt1XIp+Ye7Mm+So=;
 b=2lOD00Z7jB0Ml8G/pqji6SSIyCdHIGslGXv5cZeAwoojZjJXcMPWEI0lXOlqKhON98Igk16YQ
 vxOnfhH/ifeDYRvcU+SPEGXrIGP4n+2OxB2X6c9QIIqgOdTvW8M2gUm
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cce083b-46dc-41ae-871b-08deeedad74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GmbR63/DDiJ2WIhJBqOvKOiKwtkfseJG4JHBEgFCJWeaDHWxdNf9o3MzH+dv5N0AyAyluC7EQhoAYtnp4INNCFItLxa9zP3pEfQmO96ywDcO/xJ7qRZk4QsvA+CEzrbgJ8MCjUSodytSpTwZYtPmmtuOt5KpvgKEP+1BuH/v694ZowAtjpsGkScfEhzVj8+uWxje+r8GXfD3apuMhGSk4XvFMhtT9VChRw5q/lfSAMLtTsHOYfyEtR/naoCrajewHOBk05jqggM7wSGqSxExV/PX8F8qdPNML8Q6FgcMR9T8eRmkBXpOPE/bVdmiGah1wtzuU+cJBxm3tPn5mqxkCDt/3ZNwp6gk3DgDl+CZtnC3DpLdo/q8o3KT1QsGKTsedyp3uuA63CZM1JN3KGCBDE8icjT7+VPxjPtzqhsUm0rkSN/KBOIaYhWd++p6QUC1YT5D7scIt3jXMJCeX9qQJzNSgrpDOAD6wQADzsQyFomKt4ErLjk8ZyzRgV+QHMUysU46xiQKY8FRnvu/ZIbBc1V+S1vPUMXMxHLAtTEkc5tSMudc4OJ1xnDrd4R4FGtLjczRv2gt9K67uXxU/ffpXRW8vFXIW5GaTpp+gpZP6FeegNtVzBxsxcYL8EOu5wBUKpi3H7F45YHvrVKeVjohDbeMIZsJrQryrJ3/qza3m1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WStaaXBvVG85SklVKzBNcURzSEpjaklmZjVpVVhEc3R6K3ZKa1Z0RG1YVGhK?=
 =?utf-8?B?MmJkMlBYem1tais4VnZQaDM5WDBVMUNwMThiQkFMcStpRG5UeU1QOHcwMkJa?=
 =?utf-8?B?MVcrTVh4OHh4SnJsK1lBZGdWQm5tWFFMTVJhY3lUV01yMVZCc0R5bEo3YkYr?=
 =?utf-8?B?dHJwZ2k0aXB5QWxkSTN6cnd3cmRUY1ZCbHAxbWpKK2g2R21sdXdFa0NySWQ2?=
 =?utf-8?B?cW9zK1gwZlBSZUdCMWltRVZsajFUMGM3SCtxd2FlMjJYbkJBNythZnBTUU83?=
 =?utf-8?B?Q29WVlZodzZuTGNheXRuRHlBb3ZrcnlVcjNqYmFJZFFXaFBaUGdFMk1QOTlV?=
 =?utf-8?B?NTdDd3N5RDZpVkdvYkg5TGp5U2Y0SFhIVXlxbllwN1dMOGhTa0RzN2JRaTVm?=
 =?utf-8?B?eGtLZmpNN1hTSllma3ZzbE1Mem5sc0ZqWnpnQlZMVzF4ei9jUE51V1NobXJG?=
 =?utf-8?B?WlQrMVFOWERmU2N2V3RQSFZpdFEzeTlPRXVxdFhGandZbFFtV3VSd1RMSDY5?=
 =?utf-8?B?c0dTUDIzY2xnRFU2ZzdZbGhKS2Z1NEJXa3RRMjBDS1NrLzNvWERuWTJXRWcx?=
 =?utf-8?B?eVVhTjZJeDJQYy9IMXFqakVCYjNnSFNiQWhKRGU0MWVCRHBtU1BrdXhVWEdO?=
 =?utf-8?B?azdyZEI4RTJXdEVDK0taUi9qai9uWnY3QklEQjVxTGFGajBZQ2xRZkZCcnFh?=
 =?utf-8?B?dXdvUVJHcnE1WFJjaUNYbnhJN1VVSkdVMjJqZlhMY0ZETjgxa09iSDRzV1FL?=
 =?utf-8?B?ajhRZlRWWVBYclpvblRQL29qMUJ4Q3JIWjZpamUzanhHdG5ENGVTVHBwZGpz?=
 =?utf-8?B?ZXFJQzY5bXdGSERvS1ViQW1hVzFsczNZdmgrMkNlTnBHd1RKU09YZjhxdXBF?=
 =?utf-8?B?RmNKQThZZjVOR2hXaG9MZ1dmajRKbVVUblJFUUhUNkVNcmpMVWdkZm9rT3Nn?=
 =?utf-8?B?bnN0a0VxSlUxUEg5U1l2WmdvaDl4Ym9DWExjWEJJSUJkYjVNVXZPUjZLZENE?=
 =?utf-8?B?UVFuWEd2WTRhODl6cWllcmZvemNYbFVLdmtJWXRxSkVaZXlDZkkweG11Y24v?=
 =?utf-8?B?Qkh6U0x3RkZUSnF4eDR1eGlibTByOHVyQVZsZjN1NDhYZjNKaW9yNEErSkFo?=
 =?utf-8?B?ODlLVnJXdEE0d2dSTkpPM0ZCNys5QWVSdWRTNXY1NzE5TmVmTEtMR3c2R3Qv?=
 =?utf-8?B?ZXkrdjVJVmpnTzBuMjcvM3docnNoeDRJdE1lNm5UWTQvTXZxTHhBVy9TREpz?=
 =?utf-8?B?ZTNSYzNWeHFIODgxSlZxTGtkWCtrMk1rZE1KUzltb2VxT3ljT2xrZGI4ODhH?=
 =?utf-8?B?WkVBOTdxVGQzemEzYTVLREhNWHNqTndMRFQ3cE9BY1NjME8xQ3ZpdFFTWDIr?=
 =?utf-8?B?V2VlTmZHemZnWjlxbW4rWFYzeUJVUkR5K0FBWDQvZUI1NVNwdklKNzMyUW9K?=
 =?utf-8?B?KzBIUnZ3WGl4Tm03aXduSDd3T0Y1dldQdFZRaTdXU2dSQ29vWlZic2xmRHMy?=
 =?utf-8?B?Q2t1Rmdxd1h5WVpaMjBWRktGS2ZjTFpuY1N5MUtxY3lhSHZFTXVwYXY2WDY0?=
 =?utf-8?B?U25iNTBqSHpPanFLTjF6VFpRaTdYcjJTUWczM2VvdHFlRCtJQUE1K0hOblFJ?=
 =?utf-8?B?QWxtenFHY1FFSE93QUZqTEFIdzlzK21TbEp6c3pVU2JDRlZZMHFVa0Nabk9r?=
 =?utf-8?B?ZTVxaHZXSldjR1ZIZE83U2t1SHJaY1pIbCtjUlN2MW1kM1VpRS8zYU1YTTRm?=
 =?utf-8?B?eGc3MmNRUzJuNkFYY25iQzAzWG5QNE5IZk9FS3lBdG9PZXFSSEhXRWJsNXJN?=
 =?utf-8?B?bklmZHBlSjk5WEJ5WUlFdDdLWFRKdmpKWHI3RkllTWtiZ2ZlVWk0bk9VTVJI?=
 =?utf-8?B?bjR0OGRBVFRVSG5JdElJUzQzVW0rcXpQdTlsUTNBdmRmanVzSGlCZ0tQaG1p?=
 =?utf-8?B?RzhwaFFxVm1DQjNLK25iWjFYYUhrMmZtRzVQZmgyNjhhYUVoZ0JwazVZYTFs?=
 =?utf-8?B?UmJaR1M3TU9USjhLRVFrYWloR2RqSU9oUXN6TENFWXhGdlJJbU5MQzF6ZDJV?=
 =?utf-8?B?b3VRNjNjOWNMV05YU3hhWWxZamlXN3V3S3ZHcFRsWmg4cXRpS1c4c0RvRWVH?=
 =?utf-8?B?VVBxRjU1cndYUWV5djZscEtWMnRyQ1RoMFNjb29XUkNrZy81c1kwUE84ZzN5?=
 =?utf-8?B?R3pZUldseUk0cEhrQ1BoSkJmZXp1NXhFQUZFSkdMbUxxM3N3MGJjVzl6clkz?=
 =?utf-8?B?M3RUcnZHQnBIamErOGZ0Y2hUNFlnV0NWTnNqaXhVbGp2cGorenFubEFqU1BE?=
 =?utf-8?B?b3Y3ZVVSMXl3d1dMYVp3aUpXK1ZlRWFXN0s2bGZEcnlOUWc1WVBub1BXakRY?=
 =?utf-8?Q?khcYG4TkixedzC0EKtPKv2KHlI3jZLXGfDb8H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cce083b-46dc-41ae-871b-08deeedad74c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:08:01.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0SO7Ve4p/euOKWoxjHtzPkRdwt1MBYpi9mfxdK7+u36l0ZyTjz4p2Lz+0Edx2JR9+tiN2oeUWe/lgM7cdrCcKhOixgXsMXqsrbSqHYD7QXqFjwRxRQ4uXAjnrW+xJOe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8657

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v8:
 - add select REGMAP_MMIO in Kconfig
Changes in v7:
 - no changes
Changes in v6:
 - no changes
Changes in v5:
 - add Rb tag
Changes in v4:
 - improve commit message as Haibo's suggestion
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/Kconfig              |  1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 5bf3864fbe64..7e027755dd8e 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -7,6 +7,7 @@ config PHY_FSL_IMX8MQ_USB
 	depends on OF && HAS_IOMEM
 	depends on TYPEC || TYPEC=n
 	select GENERIC_PHY
+	select REGMAP_MMIO
 	default ARCH_MXC && ARM64
 
 config PHY_MIXEL_LVDS_PHY
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 42de2cff4d5f..e03f9dafd69e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
 #include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
@@ -56,6 +57,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
 
+static const struct regmap_config imx_cr_regmap_config = {
+	.name = "cr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7,
+};
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	imx_phy->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(imx_phy->vbus))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
@@ -757,6 +776,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -778,6 +800,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1

