Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE63A4520
	for <imx@lists.linux.dev>; Fri, 29 May 2026 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040086; cv=fail; b=o9eZhYjDMGlKC/80/xNsUx3lCdxTnPUtNwyrfy1MtP4WBSm9GCwlcsbSw76KU3mgaaJ1dbEMv4HI8zcsHgrHJpz3wboyjAYjQtcBg8Pa5TeEhG92p1EYSbF8vf15C/Cdrk9YLdE75wo89A0k6BHfquZW72v8MxE8apHL2GHgy9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040086; c=relaxed/simple;
	bh=jOqpv1C7oNCnvlp9viAtYGfYooFW8/Fcw6q/ibqOym0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SCO2Y/Z7ihO37tYFfkXw/vEoW88LLSZU4hVKEYYg1gr2KSmiCwEr0wVShmu+GInt3s4vUOu0TsWfri/D2IBRa9zHCxt/Z9oEUHO8qlwHluElLxK1d7kBB7qSavwlE83OucWNzoIysbx4niFlbCDnrP5pz8a+gaLIpRcLVM3KyqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mguLHqoP; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mguLHqoP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp/MZbOzAHRy3aunXvkXvagO/C3Id3xXbftyseQgNG/tNCiJI2Rzc4vuckcLBwNEUYY4bk/v9VJJPezM0BN7J0n7alpznod2gpPyYlI1bdfca/vgM2VP3JHdAeZhrHOC6Y7ycNfCUt3QHJ5sqsT5Ii/YsyY+6shtn7bIZVrTb/xs5sYzye6WbHWVl0cCTwWqmbrVqqnqjTJzZKiyI5ybaS+xxLs/TC0DtNWYsW/UJCDKf889NKXlb2PBEp5h9U8odnq5rLhFgTXgjTdBfUOenWq0iY1KDKSuZO22lzhXk4pYfdjkKyhfLyU97Hj583ozSpbdN8HG6yCpmbFrKUdv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zumOZ1Az5ZZxaRCLqasySZT8bSjmNRukHcSR1tw6t1o=;
 b=e/R2R18YwjHgOQZb/gzIBfBfdHSXuwGc00zEEWBg39Wjz376Ut3m6fXLJzrjVtMcmSNyDhQP0WkWYOuidZyYx/3KFt2bZ2NFx3WFJOcA/LPvH2vpU8Ty8PQPq+HJYktdWonxQfTBb+gXbUDyQyiN4+8zaNrUV6GWk2yEr1+hAQFo7hKAx3jFYoLr5+LA8Q82oNlWT/AHT/sadY27jI/t1XaphoN4LkOgO4dRgnMmOggTI2cZLvbhYFpbMCpmdDpjoYNLIh01Xsb5Y8/vVVSw7wjX1Y8sT6DP1uVh2xxkgSDJQa9ssDyXrx56D4HCBT2S/OKjFlNuhbPKkZ4dcQoOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zumOZ1Az5ZZxaRCLqasySZT8bSjmNRukHcSR1tw6t1o=;
 b=mguLHqoPd8A2l25erJFmW2mOk5PAD2lVbDYMI643b+OAiIROgG+GT4QFB9p7FMwyn6ED69/5Un5OL2xXQmrMuJeWMPdsKhvcftBVhpFODqCwdiTFzp15XJskAhQ60u1vqloA2PWRFw+bRGSt//4lXr7S3r6S13Ul5TOpvGeC9PqDz5WtgLEZhQkNM78wQM539101kuF4tuU8eZKIPbrxO2Tg8nv8Db8WkJcWkbBg/yS3D5F69X0+9ItyaRX9jUh4AMfMCIX7bOlHaud3lHoOr9yC2ko4Io6q8UmIyqsKg9N1HK7vNt1bgqGcy5Mfw56fmgm9NmoBeByFNX5ZmuQxZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:34:40 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:34:40 +0000
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
Subject: [PATCH v4 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
Date: Fri, 29 May 2026 09:34:36 +0200
Message-Id: <20260529073436.1767786-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: bd865354-6101-45dd-a566-08debd54bea0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 N0pv7fxINh7BDrYWUSaDf2RtAoGqayuvTO+HVLVUwy3IEjdfTUuXvd87omrL6vK7AhZkp1Asfe8BkEWea7ZZJF7lmL25SdUUNmzA8sUdOL15t9N8bzxGpps3L22LSyoJwrkXJAWOJs60Ro1Vm1cZm6CeO70vzogG1c+VvVkEGL5MchFyIGm8Zb7tQ9Qnl6iiboS9WZxw57C++LPcx8gCkt8Cz1PiLqsQjHbKSRdmzoBFK2uB8WwdHrPocitD5Au/wn7+dMIFLEhnWFc6lvYNZ295M3up/Vsu1m+GvsPYZunEhMfMmP/TeS3a7Zy80RbLtXBRVUETvhSBP0HKTUDjkrS0z1qTCASs8/Jqof7qOiNm7BMpUjNLZhY8QxDyVmGm7rf38HqRPpKabIbUeHTf9+uBGmODOjpskA7OY+U1LCmvlzl6PMRcMhCl/qciFzSmqOQwIOW/cQhAP4lOyY3GGLJ0uP9XeY8dO2sRarO7BEczXGWTMHmU9IA8rnpwGFTYG/B7WXb3PeV5X1gRJAKdaHWMnmDl52JITLNpdTZbNx9RT9poYifgpnLMABOmq4ixCvIARGStu0xZt9uXNez/NqiR5U0s1zTfDQRhCIPM+z1ULqLD3yJqPvV9tVKOtgI/Jhu3wotZmQlswUIQdt9q9CnBOUaJivuWM2CPEntdn0ce/zNFSbDP1coz+wmWw7Bs
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QTBySUw5alFiMHB2R1g4NnRUUVROZzJET20wZXBzL2VFVGRybzNPaFR4ajdV?=
 =?utf-8?B?TytDYnBsVW41T3RWTzYwZ2ZVcWk0YUNMZkFmcUlLNGJpR1V4b01sbktQVnV2?=
 =?utf-8?B?Q3dSVDhrQXhBcDZkVGtlZFNHajFJWWNsYk9JOTMzZDJnWE41Mzk4bjJXQ3JR?=
 =?utf-8?B?MXVZY2QxRzc1a2xVWTh1VkJ2Y0o2NDBHbXZZYkwyZVY3d21rYnh3UW42TUNp?=
 =?utf-8?B?U2RmVXovTnY3S2FmbDFCQmhLL0NBK1RVeFJkRWtHaVNGL284TGdpS21oODM3?=
 =?utf-8?B?WmgzNVRNQnV4cTByU3liVFpGWG4rQ2RoL1dWTUI0TDR5c1Zha0xCK3dlVVlk?=
 =?utf-8?B?TDkySW1ibWk3UHFCWEQ3RU5nbjhYZVJ1ZnFJeEw4Y3FLQjBmVTR1YzRmYlBR?=
 =?utf-8?B?c083bjBueGR1ZXV4SXVJNTZwNlZCN1E0QnkyU2VISE1yanI4SkwyRTczL1Y1?=
 =?utf-8?B?L0pzZVpFTm9vUm9VVmZTTEhTNmRZd3dmYmFHUU03cE5tYTV0aUthdlhoZmpz?=
 =?utf-8?B?Ti9GbnFadjNVelJRckRzcDJZTC9hTWwvcEo3RURDU3prWCtOQ2phRDhYaTRH?=
 =?utf-8?B?K3RINFl1MEdGRVZLcGdETHpod3IzRCtRbEpuSGtLa1ZaanU4d2p4QUJNZTBO?=
 =?utf-8?B?dFBzVTFTb0hDSHZBTXBBRlRmWU84d2lvMGRYTFN6YzMwL0w4UVFSaXR1V2tJ?=
 =?utf-8?B?L052ZVM3WFB5QTJ5NHF4a3VXdWtwZFBsVTJpV29hYnFnclFwUXhiYzc0Tzdi?=
 =?utf-8?B?ejE1cGE5dmszbTNQNHZ0RmNEdTJvK2xYOW90R2tsTE5IZGxXd3RPa1pXeFRh?=
 =?utf-8?B?dDNWNjNsUmkvd044RjQvYzVxdlRYRHo2OFduQzMxSDMzamFDdFc3Z1k1aU9n?=
 =?utf-8?B?UUh0MVNsS3dKVUljVkUwSzVjU3RNQWJNQWRNMUVCS3ZtbWEzSTNtSldEbndj?=
 =?utf-8?B?a0xGSjh4VE15bS90RDBveTE0WmV4ckNQeG85bTNuWU8vb3gwTUp0UTRXVHNI?=
 =?utf-8?B?Y0JwSHZLTnZoZTNRRkFHdTZ2RGh4K1p0a2huRkFXT21QWjFTSkxJbjUyUHd0?=
 =?utf-8?B?OGZYSnRCOWtqNmU4MzUrOTdjTG1laEEzSExFWVdoeGphcW1oWFJqTmxSUkl5?=
 =?utf-8?B?VkR1RHRjUDVVVU5RQlhJRTN1azdkR2xtZTZ1ekJ5cUtYMDdMR2EyaE9KdXl1?=
 =?utf-8?B?TXA2T1Z2TU82Q09JdXJDRDdTekNZYTZDNzJsSzM0YktVaEQ3VFNpZ1R3NitQ?=
 =?utf-8?B?YW93WTdsdW9JL3kyNlZoUWJUanJ6UHRiUW1FUWVWRSt6elovUWhRa0ZRckN3?=
 =?utf-8?B?WHNnSlZFZHdrb2Fnbk1KR1VQOWhrQ3A4eW41enFEQkgrY1B5U0ZTYnVPV2U1?=
 =?utf-8?B?RDF4UkZGczBuUXYxZ01zZnpqMGRTTWtCS1lsWkhsaE9sSmlzNHkvS0NWK0xQ?=
 =?utf-8?B?TDlvdHFFdTM5SnF5Q3p4TGh0VU4vZ3MvT2x0MHNjQ3MxM1BHMEdYUmQwdlo4?=
 =?utf-8?B?VVp6MjZydkZXbEVtQUJQa1VsdkxBVGZHbzFlK0pIbHNGUGg5S05rbVVPV20v?=
 =?utf-8?B?ZnF3OTgyZlFhU1pkNDYxNzFyd3luc3VNdXZhamVwTG9pNGc3YW5ZeG5sVlNI?=
 =?utf-8?B?bGxQV1plNjBWQVRCaXNuNE5VeE9yRHpId2QwSjdaZnhLYkxUQ1J1Njh2Mkx0?=
 =?utf-8?B?WjYrUUJwQUZMcXZZTlRzRUphMDdJbEJRRk1NVm92c292UThrWXAvbnpwZ2xo?=
 =?utf-8?B?NjVOaDJkYnZpeWFQU1pCZ0MwVklLanBjNEZsSENDbUJwQitlQThsNStiWUJS?=
 =?utf-8?B?SXJpdVA1MVc5c0tTZ1AyUlRnK3lYMmRFNVdldW1NeGlFSnhmQUVWRG8rZnNi?=
 =?utf-8?B?MkxlK0p3aEhhdG4zekJRS0luUnBXWWJUUWtuWHI4TGNqRTdOaUhhdk5rWFV3?=
 =?utf-8?B?NTIrOGRxT2ZPL1VhRTdySVNOOWRBMlc3Sm5RVjQrT2kvV2pSSklvRml0bG5H?=
 =?utf-8?B?YitEVEJtWlBXOC94RGZQY3Y0UVdWc2JLL2NZeXc5YWF4QmZNZmt0cUcwcmZ6?=
 =?utf-8?B?bCs4NTVkczE2MU5GSkdCNGdRZWpvbDJaeVVkbmJ2ekk3dmhGWGFZUUVLV2tV?=
 =?utf-8?B?eVFzRXE5bGYrdEpxZHFJQjloY3FzVDAxVm5LQ0l5QklrdnhsN0JZNHpqb09N?=
 =?utf-8?B?WEt3Qm1KVWY1NERRcmQ1bi9uQkVDTEk1Qmt0aG5rQkNpQTVRQTRjUytObDFT?=
 =?utf-8?B?OHp2YVI5SDI2TXpGbGJibm1DOVUzaTlXczRLa3BzMTdBbmYyeDRTWUQ1MWQ5?=
 =?utf-8?B?UEhCeDZMbEVyOWtSRlQ1Yk4relIrK3NlVm9oclE3UzJTNnlabTFBRjBQV2VN?=
 =?utf-8?Q?WyD0HdxM2ukTRMcz0AwKvEYmGksiTdZprDAFr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd865354-6101-45dd-a566-08debd54bea0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:34:40.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUgDIhh5k8RgZi98/lWwtxrvhGz8xy6db1daFVo774ojyjLvTq7nmBC7LC4ZqRfm3RRHLCDgRqf4p6usNlSKWe8SjKpkKy3fYnRrRF7v3olKfmJ+KGsuj5AsmW8n4X6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938

Add PWM0 and PWM1 for S32G2 and S32G3 SoCs

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..907cf74e61f3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..a4a9e21d1361 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..be7b645afa2d 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -245,6 +245,70 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	ftm0_pins: ftm0-pins {
+		ftm0-grp0 {
+			pinmux = <0x2912>;
+		};
+
+		ftm0-grp1 {
+			pinmux = <0x122>,
+				 <0xb42>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp2 {
+			pinmux = <0xb13>,
+				 <0xb53>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp3 {
+			pinmux = <0x2904>;
+		};
+
+		ftm0-grp4 {
+			pinmux = <0x2925>;
+		};
+
+		ftm0-grp5 {
+			pinmux = <0x2936>;
+		};
+	};
+
+	ftm1_pins: ftm1-pins {
+		ftm1-grp0 {
+			pinmux = <0x1d3>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp1 {
+			pinmux = <0x29b4>;
+		};
+
+		ftm1-grp2 {
+			pinmux = <0x29c3>;
+		};
+
+		ftm1-grp3 {
+			pinmux = <0x1f4>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp4 {
+			pinmux = <0x202>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp5 {
+			pinmux = <0x29d2>;
+		};
+	};
 };
 
 &can0 {
@@ -293,6 +357,18 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm0_pins>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm1_pins>;
+	status = "okay";
+};
+
 &spi1 {
 	pinctrl-0 = <&dspi1_pins>;
 	pinctrl-names = "default";
-- 
2.34.1

