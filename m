Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE9A1A9F83
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538143; cv=fail; b=PNbAs3OiRTkdokbDFS9sOyfk/ra00uRS+cFB7QgiJ0Gb7l/9g2HdTlofLkk+W/jjzYEz4/Tn7Ar1PH636/v58XBiAHqp4963wvjQRO/jITlvgZemKe+xZuCFDh1Ia5htzZyVOTEHR0SiqH+a/8zLhuPbNDznn23fobMywqxnURc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538143; c=relaxed/simple;
	bh=/PkDdwhdaWt630vt/4DcRC7/rSysho3AQnSqdAEv0Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bn9acY9W+82TkxWdQChUm9zML82UUaUaUicwSqLHfwqrxm8LhBrB98CpakPuXf0dS4shpUK84t7z6XrZ4EJi8A8R7Ghc0oyGGR+Twdt5VthoQY71sd8XQS2Tzhy027C/h8Ehy5HRlptQC/+ymNfarLkk6s3+Wzrs6vgYF1Pwat4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TmvK0Zhr; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TmvK0Zhr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXNXtZhwDwLsrn8Yt663m9Q0OxGO5VNASLpBLAXQmEAdZVzawlxhhIoo5ROml6C1PgNBmBiNd5haQiLKVTHNLt/hPt6q9mKjOHNyeCrDGwNH5aKMnXYsdyT3ClxBVPUP0yYyMHkMHZYLcFxTYtiNKP0KzdNXYZ+ELCTyswOqtX2HXAnSqsu6Hct6ldEZ1VZ3SqbOojPLsFYz11aYD5Nh7yqp8N6ZymTHNy7l5sXO3+ffqiuW/Th4hoXkpGjes1aYEDuQS0iOoVpBp5U52stZF4+V44ZuAZS174Zzg/pz//unlLOAU7MmQNKT5jetwSFOo/PTQ4O87QBwW5+/uQRoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BnQKkBotiT/OUWFXjd5SkWhKvaLmVMKLeOpeoVIHcw=;
 b=frgarSlMljkE4+ZElRsUxHJTP2Hiq2cThDskDkKZaaAj449oz6kSzTfpVAUPlcxAD05PfVqMmwhiOTruD1wt+tURbaFP++svVTF6Kjp8JyjXYaJ3+fgtj0+vLC1YKRydm1q5lIpxt22hvdKsJ5VFQMwwSMPjfOUn28fyXRrZQfmSMLaSw6PXsMn+GCN4s3BkTCv4AlhnfuzM0yd7lKsqUREYnlEc7cVctLSNTghzb9Huf6ZLg3XgjpDMc6TSsf5oVcMOiyIcrDhdk4qJSdue/ijFTMBclcqdG+/BBH+ZGGb3wkZkdTOpYthMn1gOCMIiIZUhrvTXSuWTED2NBKqZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BnQKkBotiT/OUWFXjd5SkWhKvaLmVMKLeOpeoVIHcw=;
 b=TmvK0Zhr2/wkESFRI6BfcjL1tCsS8ozEziaTZNLqALbW1P3OaMDuxneALfP0ku3XB0dC2P6QQIUUxTVEsx+TJGGf3nyPIJFdmqZvYKHTdeUN6eSbwQN5rnAHVpZxtowQV+PTiqqT+h7zmmWMjUU3j3jX2JNUyffDe/pCYDjQYCSG+ab7Ndzgr3qaHPAjIZiDNvHouW8VMBJiLMVr1Ojl2KKpFeJZzshZTZML2AKzfKNO7ZPB1yPhBJ766fuwMUOB+vtUeNIJGTaPmFgFV9AM2jpaaanEnQgOhEBPe5SF7IfTWTCzSffmS/5v2iYvTDzEqeWQh4LevN2EH9+hBOXaCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:22:19 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:22:19 +0000
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
Subject: [PATCH v3 16/17] arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:19 +0900
Message-ID: <20260824022020.2812810-17-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6b86c8-b714-4fa9-4eb8-08df0186856e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mevmk88BbjLEiSiGrgolodG33GBESlZGew8ZGM5/TucPGDDXH0aia4otnqQz2tIei3UjdZ9uEVtHY83k0dBr4Cvt7f+nIZ8r/7hColci5F9g18itii5uWZHUmM6HyCNIhEku8k/YhovCSbvQ43PECtqWv56Bt/KocYLgycJf7YCNKfKp73WBuInkpvhyXq/m4ta/3EExR5ivocmmLT8wrsrrgFR9tTdHOkfK+eLqgslt5Zdo9xqrNdLijWfLNiyzYPszzZ1OzgK5q799zEWPn/kSvIVTzFwZZ5wxXHARAtZGeB/5aIYlY+xBFDXB9qLBNTSvS96A+ORq5xamw7NZTUUUZT7ymfSK0veu11YM4pf+jU+ucTtbqGcgOOXOxwKfbWdXVbYmVwpujavSTuXWKaGpUyckFa4s+1UGOxkKyqezSaEUDYW7rFoZCH/h3UJmtzJwRcHZ14PApic9dHMSNM1RL5U/UDVjG2CpLpe20Os+GCgrRw0XrzgKzfgcosThlRVCsQlnE/UNfFj7/OjAovesAz5Easbb93DCAiWQxB3z8F2aBSc5fmK0hoEkwlYANGWxd5npFCQRATJnNvkdU3m/9ZA9aLZUnWK18Nbdu80ctcwk2qbFtsR2QIoZp/pquq7m+reU7/IkI05hZJ5hdYmiF4u5rfGeMFBO1fNnl/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oaTcBbfiaeKsu/jS6GqqlUQaddshSR15kNIXVbBw5+NIt2JuPT/K0D1myLx6?=
 =?us-ascii?Q?Fev7rbubkUKHApfmT3wqRxYfIOWn0bCfis1zhIZiLZfAANbnKTwZUdw8cTyc?=
 =?us-ascii?Q?OtTQlIeOWfq03LWYzyxq3YNFlApPhMGwkc5sxenryGHjzHkmH2XR2oqeRWex?=
 =?us-ascii?Q?Jv1kL1FO0frOvIE1CkU3RKe6URL8+rL6blx2FE6c4E4/n4JFqpfJjVnNXKsl?=
 =?us-ascii?Q?Q2DwHXkVFFAOVC/INfapMasCHkR31NKpQxCCTVZw07rr6D9+p4+VlSWQA0Wv?=
 =?us-ascii?Q?FBWFmh2c4UpD8lH7aY/bsPle4T/MmrKBA491+LSH2eEhzC1tvlqyj40bkrTs?=
 =?us-ascii?Q?6qy0Hhv7W4vdCC+Uvrnza0UI04c7fb6VzB4AeYosPL5bKWH2y2oTGy6nj/Kt?=
 =?us-ascii?Q?BNeIDl3H6HWtAQZbRFA9RBUvUP6hma/Rt5gYt/G4dU7rVXh9zi/z/yXshmip?=
 =?us-ascii?Q?lfMSd0A/YA2+d8sUfmMGIdd9X6Az4M/LPM9NW3Jpp6rC/qLTG1Hu+e9rHljl?=
 =?us-ascii?Q?TX1nS308pv90aNXyiupxt7oL5tBNOba37kPwruAWBz8FG8jFpzEn0k8uko1t?=
 =?us-ascii?Q?FtKouqXsarY1jsz+vsYmo07utF+s4/frIbasG4pU2k5Bqpx6LDrwWIAzoEDs?=
 =?us-ascii?Q?9R6V6Pp4VbdXNnWOoo8DqfKWc1TXKFY4A8LThswtqaoXe4XRHmanjd/HqNG6?=
 =?us-ascii?Q?2TdDUH8e02xYGc4gjaQKhyVWCfb64OstfRYyPDwThrqexSQwohN5NX4TR9Fc?=
 =?us-ascii?Q?x9etI48K6v/cdbJCDi/phRHNBbsIuFAwkIxDvWhE/PwNnQWxvMiMdh6gfnuv?=
 =?us-ascii?Q?wWn+pQDUBBxO5+q098cwgrRmZ0PzajthQ61kooT9nCaK7H+XUWfZV6XUcxhb?=
 =?us-ascii?Q?CB9/PyCAxvMifJif/Hvn41fu/3BXd45nQ5O230D93DprnMNv0Z7uZEthfuI3?=
 =?us-ascii?Q?s3GeZCtCL7k8v7T/7K/eiL6s2w+OevncPyWFl+pSVDNYNEHjyDy+V0Op8zJW?=
 =?us-ascii?Q?BGQlV+b4DBjHAHbd2BrWMfCm+jWW6nAqiFtYnX8NyeA3WXbLJLg6I2Rdyybs?=
 =?us-ascii?Q?4hvdAXQmbx0nILLlo8yQ4Vr2JNyLmdJ+2DCfMfKBhDzSbuWUKgtNWTyYr/r2?=
 =?us-ascii?Q?lMthy1fsGGAKNJmyjr77acg7gCScXvVvZd3qLUu96El3A90SYGLfmr5Bqwap?=
 =?us-ascii?Q?/N+SjnGDfLJmuRUphoQi3PvJTO29EYP+4at+n58mZrvK5wFby5abb/78Tx0d?=
 =?us-ascii?Q?ju+9AH4ulZeFZKWNOt3+XDFjKONVWlXzqEHKIDsuv6Fu/KeQPWcydFq4qh+X?=
 =?us-ascii?Q?gMmwa4fmxJb+OTQFjdjBQjLvO+ZslEc+Ca2dWKtO0H/BivfWKG70UQaoUXR0?=
 =?us-ascii?Q?QCZvxtsKVMvUH+4Cp4twg5cdNNEpaizvMBYPsFt3VpWpF7Y5d+QDRP5vP7Rk?=
 =?us-ascii?Q?f5FwM8NMYivqL0eX6Xo+jdfJYgp0OJNzAJAt7H9eLXeUHZJ1cD9yuI+uWRLo?=
 =?us-ascii?Q?mR+9Q8nBGBDNgiW3TeX/w02TpiWdCnUrjaJ9I8Ir15ujMVzn5AkgiiR+8Grw?=
 =?us-ascii?Q?JtEjFlkbxPFxKPJhtTZsKD0mferv9A0zwM7iEuAP7t6XaAlfCKskRML8OSi8?=
 =?us-ascii?Q?iOVozhOnJOxbjqtJ328kNxD/0q0If0WBARkk7btQrI6K550dwnGOZ25dYl7g?=
 =?us-ascii?Q?v3sjZK3nvB4T+XcESAgv63y7lKT8eWwIiClwIFMvK0zyO6avC1HnrrOlroHJ?=
 =?us-ascii?Q?UcNpdXeVkale0YZTfwK/HpE60nsbBCIkx/MAx4kapNq0xDI/mzKE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6b86c8-b714-4fa9-4eb8-08df0186856e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:22:18.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqAPlhAnGH5TO0Tpbp9mARZIjU66PvHaG+ys/2ul5Ry8JwuX++eXjRtHvb7brZ6KkQ1yZbMbHZ0sX3lyyMm7pYwmKwl0YGxDBxLGlg1Bozvz5ISCL1G4F7ZK3wxTczOu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index e9d735dc2a51..047dfde20718 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -43,6 +43,12 @@ aliases {
 		spi6 = &lpspi7;
 	};
 
+	amp_mqs1: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "MQS AMP";
+		VCC-supply = <&reg_3p3v>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -231,7 +237,7 @@ &mu7 1 1
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
 		simple-audio-card,bitclock-master = <&btcpu>;
@@ -503,7 +509,7 @@ &lpspi7 {
 	status = "okay";
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
@@ -519,11 +525,21 @@ &micfil {
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
@@ -704,6 +720,13 @@ IMX952_PAD_GPIO_IO07__WAKEUPMIX_TOP_LPSPI7_SCK		0x39e
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

