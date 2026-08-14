Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAB40DB36
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692148; cv=fail; b=TuwwBqocLZD/11FkVR4mm5AVAFgtH593zwoUqyimK4gO7/u0mH04D1lFR3gRJpr9BNh4mATXl+f7Q1KQ4mj+xvdh5yY6XMSMdTWmoS4tJk+o/IhcGlGQxAlyXQnYfzGN6wx7oXc4pkhtAXJLt0JYqh+lkPop4BGLyJdDjZoCvNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692148; c=relaxed/simple;
	bh=Rk1WesCOTk2tmWme+nGyAiLfmFu2IxK3Z0m0PCS2vzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbcCgsHzO58a71o3N45Vz/QxkvzARcSkSkayrpsrcQqBoqVeiPbtZxyjMpSgkK3fECAfrh0+7dYmEQyjAiFKrMGw5mlvMZXlQ6YYL7FHMdySy1XD5wvU8iwSjrdtxh30DsMPsyhXk5AwKF9X3pjo/EQ2Xvys97ghme8yZ7OkyRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fXIfzfa/; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fXIfzfa/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYGzfbyxwovlBBwzrMFRzo2PcS1+0aNywgoRgS6elucECUL/9zdBBtOkasXwdSsJJz1D2zODRQLy42uZdAd0P0jxCbOSMdk+sXVN7ymY2Wtmc6+E5bLGKrRXTZuQGqXRK5cDs5ulYXz+MDPLXg25UECCOKY5kJ0W1mJWdQowEJk0c4J4NoxPy5uQdsahl2FdMQqGQGJ8qj3VgtB2Pnzza97OhvOXjxEElUmv7S6/izEVVSc9FEqDwa4A7foB1xU3Wzdw8BJndIr7pJMj1PC0n9XtXXBMSImk/2JQDRY2qJ2dJcoh1knZc0sBFhrxCSJvA7xHzOy92l20j3xFsiWaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3QI8ByqzmFqg8hUkaJMpDxh/ODurT9Mb6LOj1Jasu4=;
 b=MQbsPG9/O5pmv2HJDy0f8sfdUwG54SecwtCajoTGuC6lPpyXjAMAfYwnuiQEDKLjRXfON1QCmXTpiI9TLI6ZKe/ZNUm1kEAQ25ALZTe2lUtxTJ9U6vv3cwYHxy/vIkbLX/rhAUq7p3nwA5N4c1W6HFsuJKIjavWheAte9z/1EiELSBj48Pfi5QRMIka/o42dXnelWvCmP/Ei+2TLe5OHgAII1qJV0q9Cm5idaqky/PDOZQGsVBHbRu9sy9b6oPm/IogZqIMCxh7J2kjRidge9abFSV87ay4l4dBBgVVIvh9L49bBfHClsoVGG1/efr91DypVpyisHhltHH32xTUDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3QI8ByqzmFqg8hUkaJMpDxh/ODurT9Mb6LOj1Jasu4=;
 b=fXIfzfa/m2Tlhxs9elxIuah877pSo5EQWgMLNH/6HKGxiiokdwTrQSKKeWoSLmt5xulvPOC6Sve1nuxXN7YZrBL6EFu3a+kXFaF+LOlWGyIdVi1w11RPLQqBLaZFFeDT+FlQOP36vaZR1/GCIBGukr/y/NZnW21ZlB5SkdRkKAzk6SzfdjqLydUrGtwSFYAPZslJwjZkzbZ7q6E0FHKu9HrNNWze6GUm5VlS4CFVEOPr8wrn/DaVyNQ9WgHhgUjppBz0/NluN7/lqgF1NfpxRR87hG0DnGnZQKmTPwsX7+YuVl5u6tu3nL1O/VnAMOUN32OUvhtDU9G/SXDKq2t+lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:22:23 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:22:23 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] arm64: dts: imx952-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:20 +0900
Message-ID: <20260814072022.4064009-17-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0118.KORP216.PROD.OUTLOOK.COM (2603:1096:101::15)
 To GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d052803-4946-4c20-a6b8-08def9d4c87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5c5WB/rgLUPEWSvtqKWJ3UbHYY6uV3FcSzPlDQgioNeqpExVDbmVQ5vXyDgFFqnM/BOVEp2BQgJ0/1D1O4KXCvzNPuRSGGPFsybN1OQzR/4BbnABkNIMLslKbIPxJcIOXKECd8gRfE2c+08mHqV4HwhAxKiGrtFIfvBzTokCv48hucI6GF59QLUPS8kHwyZ7JQJpiLU5Zh3HkcpcV5E9U4zmXCRlXaDFGsQgjg/cdcan+S/dgc+USrQ4bi5lBoD9/SEfyb8uy7JK1XqrMRMxmrOdkt8AyQ1Ir/+Zj6Y7nIyPQEiePvyBDT3A+67kCsw9YJ7AG0C9AkMdf7NPgLqfvQ8JcBzP2hoAV8+EAg9L4eJrq6D2NsoMcGYP0KaPlKLiGKBh3718KJaI7BPPG6I3FIBHQ7SD2bN6NMI1U2sp5ZS2VBn9ZPMR08g5rcC6+LkiynOPoRchHrXMfpyJ/6vq3ohYYvSQjFHhEjz0eg7+DuMp/9ljzQLHiZH0jIggNN0ccuiI0vS50oGluHeSVRZJJM+C26bOQ16x6Fn+5yJ8Eyr9pIRPz7USgja4zvPt6MPr5ZKZP+2zTHNHCVc7uMBvUepzpeSu+ymGP6CqD3HR0E73dKBBkzP6IxpoG30S+kjeZUdbruxFpHxrnovmsQS3mVZtUCjXzhdWS/VqRw2q5Ao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZgsnrHkNFnnaBmGqKZLdIaSE71TO4e9IxPa0iYfaeen/f267/0Gkh0XNq/fn?=
 =?us-ascii?Q?P6vak+BF12rY7tylElg2FsiYV7xoVsG5I4hHq2dwgOl+8BP4LtoccfRAG9+o?=
 =?us-ascii?Q?9MJX+6tNbKdnEFiu1euWlcim3dWHbNdfkhbvinASQI+JLTktIsZ1QArAPjO9?=
 =?us-ascii?Q?xG43qHIuLqFCCBVz6ERG2+j/CNKOQHUYGu73ZMZd1uEQPHlAjMJjYQPgsDhh?=
 =?us-ascii?Q?Z67lxCUakTrWuB9DK2GlWzluvWjemMe0TQg15QqZ0Ohzctn5JcGsiioHQ5aK?=
 =?us-ascii?Q?5b3x4rTkCYAimHDfqxZAk/TNSsYYw00UjpK1Kq06NXqpEwnrvtujqJBHmrkO?=
 =?us-ascii?Q?CeDdCjkGKBrvxsGGLY6dQSgROffGla/gtvUuKCcgzMN4c6sJVS7kRI00fDba?=
 =?us-ascii?Q?DRk9CZii5UArOItVi6e2Yiqh4TwnSWaZzTL0RgqQ7TV8AgKYpTYsGw5riHsH?=
 =?us-ascii?Q?2q5qpeLIhHLQTCI6tHvyxvvy5eMbCjroiwZmzXDKbia313gCZtwsGDAx2wD2?=
 =?us-ascii?Q?zbw0yVmR2ZwZf/f4J62WIODC6V1e/Ue6gSmdmatOQ91QiyDzSxRlngOCbt5o?=
 =?us-ascii?Q?aRgAraEXwgjhw5kzijH3JpH2YM17S+d5wPkpPl4PLZk0u4BNwllVeC/Vurza?=
 =?us-ascii?Q?+ooCDit8atRGgARS4LovyEQdvnzfXeEG1ycg1gmWPywYNbAr1rO4noY6HEtO?=
 =?us-ascii?Q?OWVZ14R4Ge9TD2vg5o7NGICsWwimBMf724N6rBp47HGjbhkLjSrTi43+EAO6?=
 =?us-ascii?Q?JscpeP+BeXzLkSlWn2ypgFGe6eBkzmmwjsiv9e8e7S9YstTZ33kOG+//MeRR?=
 =?us-ascii?Q?LWJ+rq4xLDg6wehkQD3Zj0k5J2EuNSC8EzemPX0oE+0XCkxjeXwErX1E1llE?=
 =?us-ascii?Q?AdIMoTQ8Ouh2jK+MwHzkCk2GlBx1y6gEkbBMWUj95M/+43BhaSPS44AOGXBr?=
 =?us-ascii?Q?IKXCF2/GZyZ8xlxqRFGiGiloO1DLYe1Kp2yAtt5IuPEDX+UYhiMWePj5A2F9?=
 =?us-ascii?Q?wyQIeQQz5TYfdDNzYM96b/d6KhMAyiQkgyRu/JXXPX82daD89TLAvSq4JvWq?=
 =?us-ascii?Q?D0Gci4MCSa2bt1a0XbL7YOczx1RhNGakQGkbnZCE8MJ0IMJjskbIfiyB35GK?=
 =?us-ascii?Q?AcB7al2jaQ9x9q1/scsF291kbuwzRG13q4vEnZeyx5qHKXR+f3/pv9OuqCMB?=
 =?us-ascii?Q?OtZ8u18souHEPS4RVrBJWqC2MQ/YhNt+eKxBkm10QJHU3ZmYy+4qt15vTfsX?=
 =?us-ascii?Q?8Spv/24n4tQGqpDHlT6FBBvxaYT+MKP45tdwHiHHTVgp4kHs0Zu5TmQJQylE?=
 =?us-ascii?Q?N+0qMP5tUSo3bn1WqD9MNU4QDjegO7gJSRYmVeU0lZqC+28lPbq00Zxy9oTu?=
 =?us-ascii?Q?8RuXqPx3aKCKoTOyxrRZFxydamKcfpfzintcHpPgqoMqnUpeCKiPXZZ9D0k/?=
 =?us-ascii?Q?qyZenjNM0ofEnmkVNv3bSRmUuoaBpa9GzC+a4G54UPQuAP+ZYDyHfrY8+Odw?=
 =?us-ascii?Q?qr4Okd6s1U+6CFZKC2uuM5mnbDVscNkFwMIOW6GK9El08cDIQVPi0bUnM19m?=
 =?us-ascii?Q?+L+nzudVK0FmiLkJFOwVtKfqb5ixW5fNlXJ9SYJHvuRQWGLPJp7NjSefBUXH?=
 =?us-ascii?Q?QheSNVNmO3uwDtXE+VdoPBDzT/l4XhHcWcaV8ahY5QyO6aIJMb2bqwTjBPvN?=
 =?us-ascii?Q?M1vWMRkHQEx8nOuaNwthq8tMqODq3KpKEk07GDTxJZX8Nev9AckPxh91BjK4?=
 =?us-ascii?Q?PF7LhzVuNUGaKnR3pK27yGgvhlwQkRKfE8CCpk1fdEV0o3Wu4gTv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d052803-4946-4c20-a6b8-08def9d4c87d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:22:22.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCjxDfcPUMp1g2VW1V4x2CH7/HWzOALMBKU9KzF6d/yefgum5+zfvp+m4m2Fnv3ub0FE9kWOOcimWun0Xk+5slkQQdYDa1x37+Qlf4fIAzvMgrWwRRYL1QGC3hie5Du5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index e9d735dc2a51..522c6cb9abf2 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -231,7 +231,7 @@ &mu7 1 1
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
 		simple-audio-card,bitclock-master = <&btcpu>;
@@ -503,7 +503,7 @@ &lpspi7 {
 	status = "okay";
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
@@ -519,11 +519,21 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_enable>;
+	pinctrl-names = "default";
+};
+
 &mu7 {
 	status = "okay";
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
@@ -704,6 +714,13 @@ IMX952_PAD_GPIO_IO07__WAKEUPMIX_TOP_LPSPI7_SCK		0x39e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX952_PAD_PDM_CLK__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX952_PAD_PDM_BIT_STREAM0__AONMIX_TOP_MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e
-- 
2.50.1

