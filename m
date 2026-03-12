Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4C382385
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 03:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287276; cv=fail; b=oJtXutbt0WVlGn0zdu2WzyRp8tlQdZZJ80+eKCC6fLZRZDcg9HOBRle7vKETIrSZbganHfBnjBRPK9icC1Gdrw3HcW876txXWX5IZKbYRh4F2g4zdjtbvJUSWu92uHrqZWUfpHN2Urtt+YQr2VQVXUHDRYJjZzxnBRShd8iHASI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287276; c=relaxed/simple;
	bh=7ieHq3dpkH0KbMmZoUlPBssY0k6/LFh4WdICKIRKNwE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G35WEaHVwEk3QZHlGmBtVzRMsKoKjpBpdjhqOcCm/6IntmnFDFjyMTZv2ahxMExH3ZP/6/wQnco8hb8OSImHoKWGtd56mzrA+SuQ9zSDHLumQC7y0UI+fAHAZgF98lm++sQtaoW0TX4qX0ROvobdt+sFutELgJ81+8DhHtfk8JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XIgIJNs1; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XIgIJNs1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSjYiP9+pAACnpDKuMZjPs7g4Apvl9te6r/dW1zV/Vgns3Qd2pmdav77FGsB3OVyjxTtlwEIW7ut+9W5pYoVUVTrJ9qblc8X7tIDoonaEFlQE2Dg5ORySpCQlkGSMd08zsph+J+deIUhKcjlZrHdcW3GqV/SB7mrCe0hTbk00/w0CE2T+FN0jOPUKhILm4qDCzjU4QtFski/ti8WarQ/9d/0nMjX93ddxbeky0LCa6tn9ECteJxSu/j/6ZzAJOriFgaznmSLrvAU+B12BC0S80XVXmmTab9ULNMiApd8Lp92oNvLg7+vM9ojQ3OGEmwJvML7GqRKw07vwVbdjVluOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJxwRWVDjwLN4p55EazUwBCObtIgbaaJV/TsxWF4c3A=;
 b=bzLlc8HgdThMJCxpcFy0dWnz3AdjEq+wbyBhE4jbCR6vNRB38T+y1RnzuqTXg4MjqVB1ALKMRYmELulK1lp18z+x1jgfQgnU2tunVpK2Th7NXoopkf1xa6iG1doIGRhssPrMA/Y6YcNMz9jL2Zl2oFjhzdzk/KIR5jPKevM8/HNJULQHYAkywK3iPS8aTth2jLWFULYf2XESlSnMu1ZY6/EAp635fFjrKkcTX+HiBKuNYXUrhszPsbvCibQ372PgtWwSfAhsAhJu+NpARmLcnoL3kuK3Iw/TXwX+UOF/qg6BB/1jpvZ1o+3R4nzDSI1aohEVzqeP+MnU4oF/lqO13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJxwRWVDjwLN4p55EazUwBCObtIgbaaJV/TsxWF4c3A=;
 b=XIgIJNs1W1uxM3cE7b2wp3LrhilG/4zb8Ina0Gs1Da6JqTJabzUh5vDNPrDIzdGqriD+rbugJRsekFvaLpZJ49jglcbpewxgmiKTnDbdTZyF2LDAw8viHzMbewJt69O/TtnDa+g51wk84Otj9nhHepPlWqJ7U/WEinN4GBk1N4mDrgXNaEN/bnaIvuNeMzpkP5wpEBj1ndMlitWkhns2gz0PTi6KfXlWqJb21ALpVNKJsY/jO1Iehxslv/NrirAJHkhw4naTUvJ0U4+WLqPUDe65sIn+2/Onz0PGUatK6i7yQD4oy6aX4XGPSvehFzl5NBpOvaul9nJlFAbpf2EyzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:47:47 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 03:47:49 +0000
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
Subject: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
Date: Thu, 12 Mar 2026 11:49:09 +0800
Message-Id: <20260312034912.4007057-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 384691ec-66b9-41c4-b281-08de7fea2133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	u2A5RCymZj1dCxd+KBSgvQFN0EP3w0XfvPuoimd8DIfWDPILLWshSVuo2LNO1rCrhTNEuHVQjDUC+2t23dP74yChsz1FrW+PMwR9ADx6hD9UBQ4IgQrNMDnLHh3SQACSTE2qJ1xBf8SZ8ja580cAGjBHybjRvwLrDkQBSicEF9C96b4PFCoJBduZL9CO9f0cpJblsB4Bfu96QuM77Xq6CcPWHp4eZgSKWLIJFujNmXHpRYnLE1AD+Axn6u8S+QbFOldTjhK1lEx1MFRfMXUe2jSilPPpup9wWtZFCZqriXiDy0axcfcMPulxLhgQdGIyQCMN1WN2xcFwGuYTNn0e+VSgyn1DZkoncHQnXCaj+VgWn/O7XnY/8kjHKIcdJyw9I3yZ+97cwF80/9P+kOpsiXdrjs242MgeV0uZd+sNlbReakkC4dQydUS8Unj8M46lGE9EQVj1gADAi8XeftbXvRHc8Se3T0DHOzhCfkE2BhK3+2KG6fwFKU4KAXg/USiEJ2tYMCVVqXVqOoyOcyxVxIGwIEsVT7LiV54TRx9Ms2vPSEp6JMdrlYKIS6mzVPLcrKQ/M9JCjuaj1YHuiiCWaZ84fW0w6bC5oRyTVofxu+JmWUa35Qj61B+7CEy1JJST0ru24w3rxCTO3wpFJ6H8IyrjcC8UrTH3T2tva3Ztnfn92UOQIuQpL5tu2N+98rQz2ym4R6C6XIExf0AkKRVbo5RHtgMbLsBMY3kAAiGR4xAV1XzfxsOu40moBIp/oyDLaIugcMByvdWLDq2ctWalWR2WRm3kpbfzBUa9dCwCe3pRnV6zHxlM+uk893mDAzh1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sMmhTbGcGpmYsMOcELUv1PT9zpExbLGzB5Lc92i+VqRpDc4Btybaj92sGEO5?=
 =?us-ascii?Q?GPdQgZxB5iaiOplrjyYio6H9zNW4J2OSKb0oLthF3yv9ZU3pI63YfJirI5ik?=
 =?us-ascii?Q?UGz2Ht8YQP45RwQdsTdT0EN/EG8goAveA95hv8ruMZLnO87kGmLWxCg7T5/4?=
 =?us-ascii?Q?D/EAG51GKYp4nA6EQAGN1mRpQGdCfL1Ziag+fChzB/mKMC/gIwcLxpDQ4GCD?=
 =?us-ascii?Q?tvMO9tH6ubnsTOFWUZ8vaiG0U412HqPoWSWwYiWwJeCsIAJJOySChT7Gs4cj?=
 =?us-ascii?Q?FpTboMI7xDgV0wDL8UpT6xTg1rNfDF5jHgh/o4go7LHNU7SqNQRO9IXNxeSc?=
 =?us-ascii?Q?lDk/kjWd0ayJimi9zHZd9VDcH8GxiO0e12yh82oJdzRRhKcQyzrgV/mBqBgO?=
 =?us-ascii?Q?kUZzkH2/gy8mHEztLYvVW/OJT6f6R78j0vfDP2ALxRXGqQHjy8+zVBbgz+4k?=
 =?us-ascii?Q?1KHwVIZEo95j3YWKPQEL+CDu8a/EGr9sF0fqNXKkstakV6DLXaW4XeihHUp+?=
 =?us-ascii?Q?HzWbSjid4YZCvqpPdUy/6d+mJk+4Cw8vvjAQd0PduKzG4cGOGOXSkDLHoWxL?=
 =?us-ascii?Q?3pnwMWDS/LoeAHc8xcSq84JxERcxSwlTp6Io2Iizr53X9Gr5bBjm/L5C74JH?=
 =?us-ascii?Q?itiXBmE5dtzSeFiw2z0zSfEPM8eawpTA9yrtKAomnAgH2NdsgUJ1yQzbGdWL?=
 =?us-ascii?Q?vKRxalpP7zLBRAxFAVmu6gKWF4bVAZlHM65an/kcTLYW1JZymEpH1bMl/o2P?=
 =?us-ascii?Q?4kPXRFbeW0+Cbx6pn4GDlg++0C/4ZTjpx6UOtz39CiKY/1c/ZOyvqe6a6tgb?=
 =?us-ascii?Q?k78pjxsbXQuSe0Kr9eSdRTh4zCHHJHECFwYF8ZKlOGVuft2hNEYgoDrzPpoL?=
 =?us-ascii?Q?lHNE6KL7og9JuIcd+j7np/0oc9n9JAficje0E6p2uWhf0Vn41CeHztyvnBb5?=
 =?us-ascii?Q?izbXwEanCu8+0vP9k8urYPAMnARL86xaoHR2YHFcCt9EXZuG8qbbCr0+TSKV?=
 =?us-ascii?Q?N0vWt/LT5a4KsYjB6vLWwJG7+0x5msn/uSXjBu3sa4Iyj0kjtOb6CTGdjMBF?=
 =?us-ascii?Q?orKkODohMeDsuMmN0CPbdfBrOhZbrPT06UAQ+oi3pG5fyw4glhdXUgCU4asF?=
 =?us-ascii?Q?zeqpbURLD3plenuQGdCdisen0h0JFkvT5lvi/R2TabCXF7luN+35Dad1NG+F?=
 =?us-ascii?Q?sHUWzKCWhS6jRszY8kZ7U9lTS3KZxRo2hzJblVVS6yIhyFHgcp2BkEp0TglU?=
 =?us-ascii?Q?kbwchHr1CLe/DbvuwPW9hSkayp6LdSDonD1eW50K7HIFmJfBzHmEH2qw7gYE?=
 =?us-ascii?Q?OgPfhMhYwcwYaA3xk9dvowqpB3gtuVmfnsWhFP62G6n+TWrqyzBZdKxECM8w?=
 =?us-ascii?Q?PPZhyg0Eo1Q0f54VpKg03n2SQixVoWPv2o300ZIImXF7/j3ZtXPISwJ6KaV0?=
 =?us-ascii?Q?vUoZ+edIx32UDP+VyW+9g+lVuZPvkzQWz8mFZBBtjgUILVGHyHrklUlWF8dH?=
 =?us-ascii?Q?b2/n+fPPdloIioAadVRnUk4TtS3vzFdTR+1Nggrbjrq66p3lySOLIhtkmsVv?=
 =?us-ascii?Q?UByeCTqSACi6UBYsee8mVBqpZRveHQRDXPHnuIvBkSMbov7d2WAeRJ2WBuEA?=
 =?us-ascii?Q?VOHtstkEuMnQsAqvOWNUblUwc74nVWqHKVha8HgCwjbHVV9tNC8WkaIgX8Si?=
 =?us-ascii?Q?1WxHNXwunNoWB/26D6OV5jSu8wZw7akLnCFrbVYpXjYIQlWCsi3H9X6WO3UV?=
 =?us-ascii?Q?EFehDsr6/A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384691ec-66b9-41c4-b281-08de7fea2133
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:47:49.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9j/bstaWDHk3tv6SObQIqWUvQJriKYy+LexmhugCCiHzzkgLSzy0gNDfxDAlsMmLakqWl/rKAdJVePoRroEUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 0f86b5626cdd..5787c12e788f 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
 			};
 		};
 
+		aips5: bus@43000000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0 0x43000000 0 0x800000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x43000000 0x0 0x43000000 0x800000>;
+
+			asrc1: asrc@43000000 {
+				compatible = "fsl,imx952-asrc";
+				reg = <0x43000000 0x10000>;
+				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX952_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX952_CLK_ASRC1>,
+					 <&scmi_clk IMX952_CLK_ASRC2>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "mem", "ipg",
+					      "asrck_0", "asrck_1", "asrck_2", "asrck_3",
+					      "asrck_4", "asrck_5", "asrck_6", "asrck_7",
+					      "asrck_8", "asrck_9", "asrck_a", "asrck_b",
+					      "asrck_c", "asrck_d", "asrck_e", "asrck_f",
+					      "spba";
+				dmas = <&edma2 97 0 0>, <&edma2 98 0 0>, <&edma2 99 0 0>,
+				       <&edma2 100 0 1>, <&edma2 101 0 1>, <&edma2 102 0 1>;
+				dma-names = "rxa", "rxb", "rxc",
+					    "txa", "txb", "txc";
+				#sound-dai-cells = <0>;
+				fsl,asrc-rate  = <8000>;
+				fsl,asrc-width = <16>;
+				status = "disabled";
+			};
+
+			asrc2: asrc@430f0000 {
+				compatible = "fsl,imx952-asrc";
+				reg = <0x430f0000 0x10000>;
+				interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX952_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX952_CLK_ASRC1>,
+					 <&scmi_clk IMX952_CLK_ASRC2>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "mem", "ipg",
+					      "asrck_0", "asrck_1", "asrck_2", "asrck_3",
+					      "asrck_4", "asrck_5", "asrck_6", "asrck_7",
+					      "asrck_8", "asrck_9", "asrck_a", "asrck_b",
+					      "asrck_c", "asrck_d", "asrck_e", "asrck_f",
+					      "spba";
+				dmas = <&edma2 103 0 0>, <&edma2 104 0 0>, <&edma2 105 0 0>,
+				       <&edma2 106 0 1>, <&edma2 107 0 1>, <&edma2 108 0 1>;
+				dma-names = "rxa", "rxb", "rxc",
+					    "txa", "txb", "txc";
+				#sound-dai-cells = <0>;
+				fsl,asrc-rate  = <8000>;
+				fsl,asrc-width = <16>;
+				status = "disabled";
+			};
+
+			amix: amix@431f0000 {
+				compatible = "fsl,imx952-audmix";
+				reg = <0x431f0000 0x10000>;
+				clocks = <&scmi_clk IMX952_CLK_AUDMIX1>;
+				clock-names = "ipg";
+				status = "disabled";
+			};
+
+			sai3: sai@433e0000 {
+				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+				reg = <0x433e0000 0x10000>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>, <&clk_dummy>,
+					 <&scmi_clk IMX952_CLK_SAI3>, <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			sai4: sai@433f0000 {
+				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+				reg = <0x433f0000 0x10000>;
+				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>, <&clk_dummy>,
+					 <&scmi_clk IMX952_CLK_SAI4>, <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 68 0 FSL_EDMA_RX>, <&edma2 67 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			sai5: sai@43400000 {
+				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+				reg = <0x43400000 0x10000>;
+				interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>, <&clk_dummy>,
+					 <&scmi_clk IMX952_CLK_SAI5>, <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 70 0 FSL_EDMA_RX>, <&edma2 69 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			sai6: sai@43410000 {
+				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+				reg = <0x43410000 0x10000>;
+				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>, <&clk_dummy>,
+					 <&scmi_clk IMX952_CLK_SAI3>, <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 96 0 FSL_EDMA_RX>, <&edma2 95 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		gpio2: gpio@43810000 {
 			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
 			reg = <0x0 0x43810000 0x0 0x1000>;
@@ -1062,6 +1212,40 @@ flexcan1: can@443a0000 {
 				status = "disabled";
 			};
 
+			sai1: sai@443b0000 {
+				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+				reg = <0x443b0000 0x10000>;
+				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
+					 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
+					 <&clk_dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			micfil: micfil@44520000 {
+				compatible = "fsl,imx943-micfil";
+				reg = <0x44520000 0x10000>;
+				interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSAON>,
+					 <&scmi_clk IMX952_CLK_PDM>,
+					 <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+					 <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+					 <&clk_dummy>;
+				clock-names = "ipg_clk", "ipg_clk_app",
+					      "pll8k", "pll11k", "clkext3";
+				dmas = <&edma1 6 0 5>;
+				dma-names = "rx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
 			adc1: adc@44530000 {
 				compatible = "nxp,imx93-adc";
 				reg = <0x44530000 0x10000>;
@@ -1281,5 +1465,20 @@ usbmisc2: usbmisc@4c200200 {
 			reg = <0x0 0x4c200200 0x0 0x200>,
 			      <0x0 0x4c010014 0x0 0x4>;
 		};
+
+		sai2: sai@4c880000 {
+			compatible = "fsl,imx952-sai", "fsl,imx95-sai";
+			reg = <0x0 0x4c880000 0x0 0x10000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX952_CLK_BUSNETCMIX>, <&clk_dummy>,
+				 <&scmi_clk IMX952_CLK_SAI2>, <&clk_dummy>,
+				 <&clk_dummy>;
+			clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+			dmas = <&edma2 59 0 FSL_EDMA_RX>, <&edma2 58 0 0>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			power-domains = <&scmi_devpd IMX952_PD_NETC>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1

