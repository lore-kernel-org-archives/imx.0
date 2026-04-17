Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF443B4EBC
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423621; cv=fail; b=YQa3hym/KadmjwG3dfSlJ/YfhsWdaEoRC8QC7rfObxi3kyiixQlMTjAKNJ1RhImHqEngI1e3rZT6qft7PjtFjv6ZRX/AFBxNfjKK2tcopLKQggay/hJyKzFaWfbSfT0tuxL3nziALE/0qUuCOSINhuWSjz6XGTB8LvkhF5HR76U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423621; c=relaxed/simple;
	bh=5GZoRTxiC4JXeWCjY8TM6IvS5IwJJOeY/bUwoDLnfP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IlNhMLWQ+UAEfmvC/cI9HYfErm1IaBw8i2zLFRirEZ5gtvmRnCCB6/geFc8RUTtyg8hzZFkoLj1OUIEdNtyjJtFoT4RK0DIUIXvCiNvq5XKJodXo3NsioBF1UsCSDDFPDYhYOJGtHn0KOknR1WK3iLttdxEcEaIVSpFxanJmQCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CuovoeeT; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CuovoeeT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1AfG+QV4KDeKeG9YtHfYg7hOCZ+imxwmYk9QKJxz5XQQL6WYVPq7SYeC8t4jEr/zAY0lDAGuhdjtxs0e/duZL0lCffO79zirPUFLWFbX7Ny/5gyl6on+K4ImU1qdKQx00j9pzC/A4uu3t6J+g/tDEB73HehBu+b9Auz1IgXm3fUtXd7guTHc2wdWKwhbyCft1ALQjhNMJYsU/nM+h2Zjrl8f4eA7Acj2NRGlr2Z6EI/D+aPcc7jnvuElPqXYuXl71FChXliDEwqH++8nwuXpIZlWasGAy0juM7JRhzmxXxcrJapAQS+mFgWCx9YVdhKkG0U9qPCVkNtwASNijy5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcUBPpwovhhNKZSdBV/PdOWqewJguoYk5HVG9y9Zr5s=;
 b=E3rC69sDKypgqrOQU04dRoGOy0dC0NlT99q6jMbJY0shWC3VbFLwgqGIy4VaqVz77SU969DjiKApt3U5nDWr6p7vwzei2qcBtso5CSXjZf7PYwF1w0anenWjML6WooMqTfk63RjJkhe2eqJvvuI9//eN7REpPjq9Y+8htSJYICXjUCYLnXhgjKx5nUSq6InXgI3OT/7tqkDheVCh2fihPrsjhd+mqzcZhv4knZr9UD9Fe36cHOt9Q0OHjOPYbw7XDDmBQwykHU7hwSWBamZoZri5pfPWpX4YG5k3YslOk4Wie3UT25fBNxM7dT6RkqxX5ZppyicdflaJNIDmnzu03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcUBPpwovhhNKZSdBV/PdOWqewJguoYk5HVG9y9Zr5s=;
 b=CuovoeeTnzor7b0WqC/AIFEW0DFpr1pqp1rUSBJfw2JJCSF24D8B6wzECzwzc9R+JGSd5n348DCFjLNHOs8IBMzGtdt8uSW13khLCfWMi2wXSFGGrx+bzAh5Rg/tE/n9DtH/SWDvVEIgpDNFhqnFVy5Krio5UkYshQcoV5W2hYE6egGD4MMSSvSNKHfxoQmgb3W+KVWMvnkpySXDEvaTzYyaqJboYbNdgglw/UOL/21ByVzUuJJTdd3GDHxmSnXYg4iuMLREgAhz4UtAsbvGy3od+3bU1Eoqx0spjLImgsc2C0whzjw0tdanfgPyMXtOr8/epUTo0uW462XSiPHxfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DU4PR04MB12276.eurprd04.prod.outlook.com (2603:10a6:10:629::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:00:17 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:00:17 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	martin.kepplinger@puri.sm
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Date: Fri, 17 Apr 2026 19:01:59 +0800
Message-Id: <20260417110200.753678-2-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260417110200.753678-1-robby.cai@nxp.com>
References: <20260417110200.753678-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DU4PR04MB12276:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fb25ca-5c8a-4f24-a6a1-08de9c708247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	N5C2tyNWb4in4lbFKoJrYG7vhKa6naf5e1bXnhxdAF5YwCpttaC9JgFACn/HGtFZM319gtOLLpmRoHH94pBoBlY1cEawxR+5EcW53EIAE6mN+MxBdWWDF9xdnPy0juX6WlH2DEMOltZ9k8GLlR5CpCqsnNVdaoXBsbul+tBC6AycdSj0cduwBjDHAVgKFpFKh/i91xyYJeiVPk0daJwjuuO7Z4aHbX3qlZQlLQPJ8bc4aO+1qipHjwh+8w832DMdg8qVqVq5OvVjsD2+XeGEyJfdSzm5AxkqsHNbnXU3cFe4BgVWOHp5GI1Sic2MgCEilo14GQw6VS6SOR7ESevMzPBR81QPzub/8ZtNvDRA75k3bF7ZKv7RYJxzhe1oi9rlLDscO72CA+NHCcZKR4wx+pqmPgDX9WXCGDkLpvMdjsCz1EjjqY4h1PHW2hGQSTCgfWFwtQesIKAJJcABw5DOL9SSOEJ9aSDLXlPVPKB7njyBaYpGdU7lhdOUo+Kr5DDjXkjhRKNlBiEzIEhU/+0RWiaHvqohZNPoIJwtSckbZCdZtaYDQBr6p8ohfOwgMS7/jG4c+RvhheTWmUMeK2E/bVH/vD6EO+ZefcS4OCl8JSWbhtda37d7B5qnXdvuI1vKNAJaB+c8VKyPMD9dNnmbKJl3U28uNgWfNilYFczNi79NBp2/LRJ0vPKTUDtikqO0h6psT9Qxpp8rciwRdQlao8jbsDau9EAT4YV9O3m9tuJRCZcIreFOPee5UU4ZzS91xRrzgamALqIgyh6/C/DvostDUUupqH8wnF14kjgnRNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S5OCBAyADGtYhikWUwedGBhXYgNumw4tYl+JqEkobBLMeu3F+FssIwjGk81e?=
 =?us-ascii?Q?oxGraPU3TtgpISOchQiYVYuYu+Ol7ndBH3uzgvQdLMZPNF8f3FTlwH8yD4Ez?=
 =?us-ascii?Q?EOncleYMSDi+gkBdTlzff9v5BmheG/PnGHg+mOjTo8PsZXxU+gu/3Sj/6R4C?=
 =?us-ascii?Q?Mm67gJIq1yE8nPNZxN4FXHb/YTtSSNsJf17hIvvQC3AIcCInKIYwd0zYl/k2?=
 =?us-ascii?Q?Wz3e4n9W5X/IlQWjMRmrNVVlTJ2N/sFH0qBTHiLZeF/2evanYwUV/yP1Rglv?=
 =?us-ascii?Q?iS5HQoWxdmRhqehnD0qi6Tl7S/NT/c0aa1+Zd7zn/C6AeHzHfoKPc0ipO/W/?=
 =?us-ascii?Q?6kKDDxSKMlARjIhL20WKwJtZqwf0VdFLQawahuAvyl2t1trSAmHISTxMy2Dv?=
 =?us-ascii?Q?o8d3NahmqE4hAsE4ojI4mC4v6ElSwHlQ9zphCThehZfu/DbaW0df7zEakIZx?=
 =?us-ascii?Q?Fw+LFjBHDqKcx73xIGWDZ14Y8+0I8Y+s9q4u5lsCHe1vi3qeItlBYsl56v6P?=
 =?us-ascii?Q?TPfLqmI62jtn/1/V/4z0PK0MR5jsCYf8oGTHB/pHrWcrGjcOS2+dMlQZdQDI?=
 =?us-ascii?Q?Ruan/fKq/6O8U2MJTcVTVyLXPdBZDBvQZ5G0M9291Dv1QgT2OC5EfWPvO4Wr?=
 =?us-ascii?Q?shAXLzdp3QoaZgv8dqisyQDICFmX3J6eLMxKho65x4AafgoZmiM1wc4NXMC/?=
 =?us-ascii?Q?nYSEb9ufggHmmoH2iBsaSwx2lmU+PfUgtZGktYJBcGc8LKlmW2KEw9wcVcFV?=
 =?us-ascii?Q?ApnWDETKySlWQqNaj5aqN7RPBZcQqzjDVwwDHsroty/Ow9uZG23j86lKLAQs?=
 =?us-ascii?Q?vO/cEosoB1LestJnpiwn714ykwjaar6wablCrMBP3jjsYVmXBQLjXWbpleZf?=
 =?us-ascii?Q?fqN8l9ashVf91O5UQ3xiKjAWyavIQtUjNSSbB7VeTXyCvs8H1DliiGKuVbiX?=
 =?us-ascii?Q?gcJKYiK/gL6WQintIpyzYt22nc8PLd1sC/iazcvmc2sSo/fEGtw5b1nzBoIb?=
 =?us-ascii?Q?UnR2TtonGn6gS7F5qSwX3xNoM1Qilf6ojOZiBEj5cQj/6NwqFXvyvsXeCvwA?=
 =?us-ascii?Q?7K5PskLqio3yhkwd6qpy7d74bhbgkhh0SLyj0/p1E0DvacMc0NSQWc59f+PX?=
 =?us-ascii?Q?Wom5p+l2kdW5R4w1PxtwwiKFA7WR59Yypo74xo6bdGM6hJRaJR4yASgJDS1T?=
 =?us-ascii?Q?FJf48u72mmwv6xe1zd6U/UdahUW9jdJeSOdxYBBNbizhmW+vCKSp08TjiM3q?=
 =?us-ascii?Q?5YyHnrHKaYN1Px2sWZGw1oBG8thxMgM5+12O2QKzfD9HHv8fqphbH+EdMF5N?=
 =?us-ascii?Q?yyQ5T+A3/ExmMX8VGp50UuPrhDE2xLY/b0SV76E1heleUY0jrHKGEWtwPNLd?=
 =?us-ascii?Q?bZyFpnjQI5sFaBf5pCI4E5Fhtr2QPe010BAGjs+MJRTGdZTk4GcvxWoQJ8MP?=
 =?us-ascii?Q?ZxYMR084xPgJg8B7bp0cu6dZ8gpQwdlLhK89DPX3SLdMn8gpuLu+28qYeKpt?=
 =?us-ascii?Q?YoEKWFYI4w9l9wg5kbS95msD4pl0dLbjB1cBnsNyseEf9C+hvGJLVkT/Ldoz?=
 =?us-ascii?Q?/zmZLgSYFD0rYemJ1cADzaEOEACQx7S+2mnmT7PSXfWufWxQNmAxrWhf3VUS?=
 =?us-ascii?Q?h9BLel8CvDcBkKppYZa01z3Ul4oWPGP0O3vBOCl2mfkfellqlL9fBBwMs6d1?=
 =?us-ascii?Q?FZRRhdyGOpNbbbkujVRxA1wRUoM8pkGSDuTI1u9L3J9wQHK3iaYkBX43pKI6?=
 =?us-ascii?Q?Fzr1UdzZyA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fb25ca-5c8a-4f24-a6a1-08de9c708247
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:00:17.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhoofpEYIWj0ig2blIEHDQulauqICO6+Pq5mq7I7+oiPcfumjDeo4K1E3K3oCXJoQXfW5A76FzwreMEc2XO6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12276

CSI capture may intermittently fail due to mismatched clock rates. The
previous configuration violated the timing requirement stated in the
i.MX8MQ Reference Manual:

  "The frequency of clk must be exactly equal to or greater than the RX
   byte clock coming from the RX DPHY."

Update the clock configuration to ensure that the CSI core clock rate is
equal to or greater than the incoming DPHY byte clock. The updated clock
ratios are consistent with those used in NXP's downstream BSP.

Fixes: bcadd5f66c2a ("arm64: dts: imx8mq: add mipi csi phy and csi bridge descriptions")
Cc: stable@vger.kernel.org
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a25e219832c..165716d08e64 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1377,7 +1377,7 @@ mipi_csi1: csi@30a70000 {
 				assigned-clocks = <&clk IMX8MQ_CLK_CSI1_CORE>,
 				    <&clk IMX8MQ_CLK_CSI1_PHY_REF>,
 				    <&clk IMX8MQ_CLK_CSI1_ESC>;
-				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
+				assigned-clock-rates = <133000000>, <100000000>, <66000000>;
 				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
 					<&clk IMX8MQ_SYS2_PLL_1000M>,
 					<&clk IMX8MQ_SYS1_PLL_800M>;
@@ -1429,7 +1429,7 @@ mipi_csi2: csi@30b60000 {
 				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
 				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
 				    <&clk IMX8MQ_CLK_CSI2_ESC>;
-				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
+				assigned-clock-rates = <133000000>, <100000000>, <66000000>;
 				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
 					<&clk IMX8MQ_SYS2_PLL_1000M>,
 					<&clk IMX8MQ_SYS1_PLL_800M>;
-- 
2.37.1

