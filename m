Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A9937DE91
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725779; cv=fail; b=U6OqlsWxDSywB4ieuG53GlIX6IMawj84QNbtkh+B3CWATbMkb5ytiMSP4wzjyF/1WsPgE06G434N5mI4wN3sKaIG9DC7v8o33Eh1LLocXrV5zFhV1aiSvA12X2zN8NLwYfEmuFBymL52jweZfeebCvoN5VdgT6eF/cD7g7452po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725779; c=relaxed/simple;
	bh=mjxqvSd9nwSbdc3fPfLROcl9fgyghmrNINzXu/qZusU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Osx29gD02ymhYRbmE+kRy3E5a0HD1j0RGmnOgYyFUipDqkCx6nm0SfYeyn1TlLIZoxpie8EdZcR0MmH+NHSgm+uxHisc89Flj3Rrw35d9PvZ+oUz1wZsr2ViiBQAbTPdk764/el/ObG/MULHFwgu/QkAYwJ49KL217+UWAoqAC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C8ZqcLAR; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C8ZqcLAR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icRdVKy27MySQJHgwosYpDkvkaNqqwW4AkDockFq3mC8dTygapCkdR12puT9GGPVA1WgLT29kKamRuGADWqp0hIVFB/tJWg4neHmhz09/4jeidRpNX+5en4Dgz8q18+E5QTV+t1Xo61AXU6rBvI81/H826X5j4Ofy46O7TuzdrdsVbWTt3ORXmdwa1H5plZ6opmVJEnIF5fTIdSbBtPkEdm/bPbzjnZo0oW4WBJ0Owe09lCOBAJHirWVruviMftQEkhBgrJGWjWGziK0q+wcp2LPjfYPlwMPPczrFMe7Fy6q1YvKs7GAL8JjJo2ExYj0t79bmXJZRFV190Smq0w9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNsZ19C7cBP2qXF0GgQcUh0AaMNnFUVg00wTNjpoO9E=;
 b=s0L91YBj/hMA041WNECFCbaqhy3cCAYSaHeuvAey355TLPZdua4ga+reRaZbcUwLN2IHR9+jtDz2DznAqglnAfCBF1wfdC0sE2T+wq2QFe1OCKZTiuRDhM7A8eh0XNqWxe/sJl+90t4OsQd8J1B2tdgdlh4myfiU59godNISAE7WcRpaYZXp9s9kat+RfwmF02IuQEee0o2llpBw3FAFMc5fvEmQq6icm65L7OkVAVWpyjH4QUzrwrBoyqUx8Ma6xU1I2tbZthj4oWqXPJ73X8Q134ApRiHvVU+qQjMitRCNqyoRkxVczCP9+X+hIMYhta7aGv+eqWxqbmH11UITAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNsZ19C7cBP2qXF0GgQcUh0AaMNnFUVg00wTNjpoO9E=;
 b=C8ZqcLARkEctTRJ4gcio7HNSUlyLWh1Ymd+ZY+uASerXFmE8tGJyhw04zKgViVSlugfsM7w7hmfgZnpr9h5lQ7emgdvp6Gkr77K9Wbt8jOH668DIvlkz5MrUTodQEFydq03/guDLKhRccRskeuV3G3DtbHWYdVlc/Xzzfl1mJt2pqR0XB1DGaEr3D5Ssho3jlXiyczxzjUtvSO0oFFZmYcugiq5hxQUwGo/luWmWaf24uxhPvCGqk7oUDL/COAvbuSAuSj3VrnHugLj5BVDDZEC5w1xGD7GJ64VYYimgs8hh4jlXbjstWegH8xVrv1OET9/RXse9NDIa7KeMjKwP6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV2PR04MB12583.eurprd04.prod.outlook.com (2603:10a6:150:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 05:36:13 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 05:36:13 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8dxl-evk: Use audio-graph-card2 for wm8960-2 and wm8960-3
Date: Tue, 17 Mar 2026 13:37:38 +0800
Message-Id: <20260317053738.578187-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV2PR04MB12583:EE_
X-MS-Office365-Filtering-Correlation-Id: 07974fa3-b1eb-43da-dbb2-08de83e719cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZJn7yk1ZuQzV2VyVoR3B8E7TMbwYwt5it/dbOmJjv1eEiwyHFCnxxSCLmTe2xi6ZNhJMU5mfmkrAxPAmZxkuVCKPilCr+ovmKQXymQi2XkUPpnQSdnRK1dRMQUEcaZ/Q6DPi7rJmRYhQWQwVuVb8iY7Xz52mcv+c5V1Nr1AdNkMtK138TUztmAomtUp7iFAZaT0Oo6dAN5XUIzr3Q77ZQmBPnOPF82PLu8RLXciyo2+TOGrUJQ/bsQuEzTplL128sooqY2q1CQZfG+XIIEge9AEiLUF7+okTa1RNIAdikKFzbOngYPKMrB14z+NoKHKZn/kK/jcmy/euFbwmj0oCi42WSlh10RI/S1s6s7tmVp+Ag1LLMSDjP2RhblVEKLZex5b7NK923MDemZCxz1nMVM0uXQ+AwTQlpqeJCw3t94i7JWCd4tsLuCYqPABouGlpIjf9HGyzG1JdMf466v/lv8yhzxSxfy9r9zvisnnqXSyxzD5ePRO760SyREHkDoisjVNBQHe115Hq7cLmX1d3iLz+rfI1EY7ybLLgH5zoTVmyTFEFFApHetgjT27zXHapocUbouPU7Q7ddnd0CrZlhZyKuPFZ5lLgHrdolBLcuHx6aapw9Ilr6ngtqrbpvE+aEl0vjvh/MCKQWnzvVgXpbh0HMByL5il59Uy9rrJm5YLiEFaD+Q1awxWM80cbjSrC+kOx3jWF8RNgMAuTzYsTYU4Ske5h/gpAG66wU5OEoNBJ4WVMX7YhJ0gp6TfgpiZ90RyoBFdHvX4AkKDkJcExyi+yBzYeT40e6+JrlpNebVES3Z3j6S2heDAcOALfet4w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zHlSFCPI/t6gNUlkDvK1t+4/1XGzNHo1y6PQ2UN50jint246gM3RIIM2OJiY?=
 =?us-ascii?Q?Cf7KaGsHF6Bk3aB8UVCAlRSBOxiHilSVjvQ7kqQgc3Tc2Hqu7QPl/6b+F3O2?=
 =?us-ascii?Q?SGM30pOZA78KIAFTcLl1ChDRDDLVwyPsOF9yw7kany48kGcRyLrgd3yZIGH2?=
 =?us-ascii?Q?ZUBsGtgb+V8a42wdNUJpbGbT0flthcZbCEky1bcZTncFGW4RIl5c2O2r6Tkn?=
 =?us-ascii?Q?5oDNB8vEaJYW2U8iiZsr/U8K6stCQDUPYVljtIX2FoWcPF94dWaCgzOrK5oH?=
 =?us-ascii?Q?Jb8MqMG+kARu9Ld3zxr4jVQdPQ6BhDZCMA5f6VeHH3xLwnLuqmOd+q6hmY2d?=
 =?us-ascii?Q?FfhZlbH6lyXdvkCNQ+kBJaLAwWor8EZZDKZwp1Q3Opsy3N4TdwYFPT+9nkEU?=
 =?us-ascii?Q?qNgv7dd6i0N8fOB1p6TTRwuciCTfggGg+RRyMGWyYybULV4qXN2f7AGduNjr?=
 =?us-ascii?Q?Xl4dDQsDcCYchrh5s3c35bFib4eRi67vxGhW3hr4+6JGmBvbmIQe2B2i7Awx?=
 =?us-ascii?Q?6vPYOA/eEsSfF5mKkZB6ExoDXwolHr1zrh4lZY2FmDEYbMem2V6JXOPE6hCs?=
 =?us-ascii?Q?sSbCl7YCp4URMCan2NDif2qlyu/j9NI33Zqz1vMKnkW4prtnqyxSuCo41E01?=
 =?us-ascii?Q?NpcEJehKpSrlzxiQmJnEjM95wn3bXXw2s6rdq5hVZoaAYJBdbWbpTbAwLjQp?=
 =?us-ascii?Q?niC8J0c4FC7sUbDW2T4KJhimYJhur+JD+/CiKcfFWAQoekrfRWqoZnFJ8VcV?=
 =?us-ascii?Q?LueLC/72Q5P2fRHcF9yUBcuRWnTqcsg2PUwt3w0KGSVaLEv7P7PP6f/CIUhd?=
 =?us-ascii?Q?+12bzIT6wRmRYLvExPT1atikno+2k/9NZ8SrtJ5wbGnZgqaWHCz9e3p06w4R?=
 =?us-ascii?Q?t5gyvC4KO3u3tZhnC2/NKOXyxdk/2Ryv6ERhSoAXyKryrGXLEzfoTDn8wj1B?=
 =?us-ascii?Q?/tI6ZK+Ex+sH8SlBua2n0T39XsvzydkOxJnLIp0n7LpQAWQ5cujDUrQwHqkT?=
 =?us-ascii?Q?OsWSVpOrb+MCGyLRDj7cOaXSjgHkE/ZFZWFq+/QfNoMKIU9ktz0vSDJebESk?=
 =?us-ascii?Q?/8w6Vu46Aa/v57kt05Y9V9SfpGXN5jZNLA08AsmwGAiqQltw/b6fs7tKTOOZ?=
 =?us-ascii?Q?4KcifOgl6l5OXxcY8qySKkd3Ej1v7cPzOld1rdJMgzD3aiW/73pY72RTchmD?=
 =?us-ascii?Q?Og7TcvK/ONWBNcfo7iKQsY0iMpypoAG1DGB/xJhO9+x90ZmZkjAh+mw692qO?=
 =?us-ascii?Q?mtjS3mGhV2aJEfeTxADFE5PvYxWG39bNETALa0MsCm+PxgLOgDrzvapvcfd7?=
 =?us-ascii?Q?fDskWyTVRcKsFMmTnT/J3ZJ2f2LkV33YDrH6ygI5r6hFjfIFEKbwzEnVGZua?=
 =?us-ascii?Q?hlHR796nmnrkq4jc7U39JZIn3SoNJyiBTI0uuAWWxunM/1HCpkP03t0KBfrX?=
 =?us-ascii?Q?vdCYKbNaEM60B0e79E0zNaGsDGZWotlxRA1cL6Jd19pbfzCB05Bew8+UIY6F?=
 =?us-ascii?Q?P8x2QCGUyvXEkMN9bIvhbjCdKAEJfXeIVUIPauCM5ahqfGgvA6sILrDxZvPx?=
 =?us-ascii?Q?IATJwF7OCnicgMMcJdM2/8JD6jtDzoWrcMQPycRk8hMD6iLnKfTXoMeTQOk0?=
 =?us-ascii?Q?Lm+98Oj1+sDN3w1B5E9P6k7o5CMMICqtvs0gSbfsZdrAABsJ9nb1tjYBTArM?=
 =?us-ascii?Q?nAxpI0UnE92amyYaLPON9/TD7bSCzcXvG9k0Kpsa8UY1TNhRx6PQUeuG+RQH?=
 =?us-ascii?Q?mIWgMXUMJg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07974fa3-b1eb-43da-dbb2-08de83e719cd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:36:12.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bAs3wFyv1zZVvQ4k7Yv0J32Tifbu5ZUpvBxu1JZSO8cflzFZxgyVg6g/GBnPO8fI+bxXZDYBMcy0QDYrU7UEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12583

The sound card wm8960-2 and wm8960-3 only support capture mode for the
reason of connection on the EVK board. But fsl-asoc-card don't support
capture_only setting, the sound card creation will fail.

fsl-sai 59060000.sai: Missing dma channel for stream: 0
fsl-sai 59060000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59060000.sai
fsl-sai 59070000.sai: Missing dma channel for stream: 0
fsl-sai 59070000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59070000.sai

so switch to use audio-graph-card2 which supports 'capture_only'
property for wm8960-2 and wm8960-3 cards.

Fixes: b41c45eb990a ("arm64: dts: imx8dxl-evk: add audio nodes")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 114 ++++++++++++++----
 1 file changed, 90 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..bc62ae5ca812 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -259,33 +259,37 @@ sound-wm8960-1 {
 	};
 
 	sound-wm8960-2 {
-		compatible = "fsl,imx-audio-wm8960";
-		model = "wm8960-audio-2";
-		audio-cpu = <&sai2>;
-		audio-codec = <&wm8960_2>;
-		audio-routing = "Headphone Jack", "HP_L",
-				"Headphone Jack", "HP_R",
-				"Ext Spk", "SPK_LP",
-				"Ext Spk", "SPK_LN",
-				"Ext Spk", "SPK_RP",
-				"Ext Spk", "SPK_RN",
-				"LINPUT1", "Mic Jack",
-				"Mic Jack", "MICB";
+		compatible = "audio-graph-card2";
+		label = "wm8960-audio-2";
+		links = <&sai2_port2>;
+		routing = "Headphones", "HP_L",
+			"Headphones", "HP_R",
+			"Ext Spk", "SPK_LP",
+			"Ext Spk", "SPK_LN",
+			"Ext Spk", "SPK_RP",
+			"Ext Spk", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"Mic Jack", "MICB";
+		widgets = "Headphone", "Headphones",
+			"Speaker", "Ext Spk",
+			"Microphone", "Mic Jack";
 	};
 
 	sound-wm8960-3 {
-		compatible = "fsl,imx-audio-wm8960";
-		model = "wm8960-audio-3";
-		audio-cpu = <&sai3>;
-		audio-codec = <&wm8960_3>;
-		audio-routing = "Headphone Jack", "HP_L",
-				"Headphone Jack", "HP_R",
-				"Ext Spk", "SPK_LP",
-				"Ext Spk", "SPK_LN",
-				"Ext Spk", "SPK_RP",
-				"Ext Spk", "SPK_RN",
-				"LINPUT1", "Mic Jack",
-				"Mic Jack", "MICB";
+		compatible = "audio-graph-card2";
+		label = "wm8960-audio-3";
+		links = <&sai3_port2>;
+		routing = "Headphones", "HP_L",
+			"Headphones", "HP_R",
+			"Ext Spk", "SPK_LP",
+			"Ext Spk", "SPK_LN",
+			"Ext Spk", "SPK_RP",
+			"Ext Spk", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"Mic Jack", "MICB";
+		widgets = "Headphone", "Headphones",
+			"Speaker", "Ext Spk",
+			"Microphone", "Mic Jack";
 	};
 };
 
@@ -481,6 +485,16 @@ wm8960_2: audio-codec@1a {
 				DCVDD-supply = <&reg_audio_1v8>;
 				SPKVDD1-supply = <&reg_audio_5v>;
 				SPKVDD2-supply = <&reg_audio_5v>;
+
+				port {
+					capture-only;
+
+					wm8960_2_ep: endpoint {
+						bitclock-master;
+						frame-master;
+						remote-endpoint = <&sai2_endpoint2>;
+					};
+				};
 			};
 		};
 
@@ -510,6 +524,16 @@ wm8960_3: audio-codec@1a {
 				DCVDD-supply = <&reg_audio_1v8>;
 				SPKVDD1-supply = <&reg_audio_5v>;
 				SPKVDD2-supply = <&reg_audio_5v>;
+
+				port {
+					capture-only;
+
+					wm8960_3_ep: endpoint {
+						bitclock-master;
+						frame-master;
+						remote-endpoint = <&sai3_endpoint2>;
+					};
+				};
 			};
 		};
 
@@ -700,6 +724,27 @@ &sai2 {
 	pinctrl-0 = <&pinctrl_sai2>;
 	fsl,sai-asynchronous;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai2_port1: port@1 {
+			reg = <1>;
+			endpoint { /* not used */ };
+		};
+
+		sai2_port2: port@2 {
+			reg = <2>;
+			capture-only;
+
+			sai2_endpoint2: endpoint {
+				dai-format = "i2s";
+				remote-endpoint = <&wm8960_2_ep>;
+				system-clock-direction-out;
+			};
+		};
+	};
 };
 
 &sai3 {
@@ -712,6 +757,27 @@ &sai3 {
 	pinctrl-0 = <&pinctrl_sai3>;
 	fsl,sai-asynchronous;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai3_port1: port@1 {
+			reg = <1>;
+			endpoint { /* not used */ };
+		};
+
+		sai3_port2: port@2 {
+			reg = <2>;
+			capture-only;
+
+			sai3_endpoint2: endpoint {
+				dai-format = "i2s";
+				remote-endpoint = <&wm8960_3_ep>;
+				system-clock-direction-out;
+			};
+		};
+	};
 };
 
 &thermal_zones {
-- 
2.34.1

