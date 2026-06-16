Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8993942188F
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607005; cv=fail; b=YDtbCPHzgtiritUzd6oExFm7zegYLR9LIHu2xwkArxTWWwJvk7gwDjdRDnkRbOcekjvmlPc4qKkJKjHzvvZUOA6JbTn170pJKZfnt4VUef8oyWW1ToQMNo+3SsxIk7VKnmA5VvVhdCpjbN3gnH7/xh90uJMSQL1dZWOrD7CsSBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607005; c=relaxed/simple;
	bh=ELE3uADx8XqOxJaW0vImQpmhsv2iLEPyNT3wjBKDG4o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FVuet2AGPkxPgFAyyyKCSCA6yCwPXEACxRR4J3+dZRD46RLv4+iv4K6NQDaAuWyTKOmO+ROS1Do/KGBhZDt6CvnLdHYbEi6PV58SqymP9lTDxrJTHjAJrSHmD24+CsvSYAiPanEhS4S4vyoTHmjrTvzhb6ZIaml8RmI8Rz7ugd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K8OvnapS; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K8OvnapS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms384eTgFWlB24ixgY3Bxou1wxKhXRKMuz4k9AHBDuJx1UUpDGmbJg8MNtobdfCLNQRjTD7n6KdG9UplngAmpArP/JvXkG6A1yeNrHtVyGeIM4cTpdvzde71jbHYsEuz8gLR9XTt9dsraEJkfwa1l01+5njjF37PrF95U6UMZ4PYetu564aYvq5QQ12gpAGIanIhm3i5NpYOeTgEYT5yRAxemE8uHzQneyr6mZ+LLM7Vk9DF8khyxPvYzcJjmls56Ktn6+nXq7DM9Sv5DVduIptKc/Q0hAVs28s1G3GB30hZsbZWhpdCoo1QE9W0u8SZ19hbOnY4vRJBMCI4N3YKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RNlqxO/pkU0P5d4KkDLNTiJ4VgnEs69XerxqiQIiPw=;
 b=NxFpUgYgbv2zCAW63ok8NpRJPJOxw5QuaUiqCnWfkNC7F0/vtzrOECh+cxtV3mwH2in+GxYiTX118QuxKYXaQ6qoBUJamgDQcwxuT3Poh6tECbBdQyYUroz1WooorlXxAfO6hqLoin1Gm5Y3sH3Lw6fOaymwQQoxNmqEV1EBMYKyzqxPyVUyKGYBuyGI9C7QIgvQzoHcUN7WqFF7ONAL1gctFvtk4EayNOPQjlHNLJtcw+AIYcbqWLZmhjTy/rJW/Peh4QAoPxPKuxhL45Yz/M/VNpZsWHeyqlp2atgKi/4419c3AWpJtmDSK31gVhq3KlmiC0Th++RiiMuvMJQphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RNlqxO/pkU0P5d4KkDLNTiJ4VgnEs69XerxqiQIiPw=;
 b=K8OvnapSrGFaXjPIyFv5PNm0AaV44cinzGU2r+t80yZGVa1dAhIwTAynOWxNuvGXkOeCd8Khs5+3kiRHdBC9gp/jz6W/ek9yFCMWkEdLY43+VoM90VkrdsexB48mSAZXFTNJ8ZtleT7nErqIhUB6JGk+uDgSWQ/lOFjNCmNsTHBjuatpHyaHWZmpNSKSlb/O1tsKvLBfp1IaBWi11FsUgb85zabBdduj20mth3qJ5CN+W3eNDBu3jsZQ5K5TYX3pogmGn4eshy8hBGZ3KybbYyqZhCAuRxGJPMVtFBhaaA6leM92eWn4w3gMeK8GMltOz/mK9hKLneGEMENoaOI5KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:49:58 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:49:58 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V1] arm64: dts: imx8mq-evk: add uart3 and bluetooth node
Date: Tue, 16 Jun 2026 18:52:00 +0800
Message-ID: <20260616105201.3214395-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de590f3-ddf2-4d44-0428-08decb9501fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|19092799006|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	UcbajtdrQf5EBkSLeX/t9dPYRcf/FsZSVyiyXmIUUrmgtxdvSYLRgpOeu4B992GVqyGvsjDZLsF4wqn+p43hY4dLphFKDNj/P4EdLxn6qUwM8FtqOiN7igtxq1WWEujZZhDzW8sQ/t4YlTauN3Gpe9J5K7Mpl6Q97dd2n/cyMRWaYm+ACO5wc7KsD3QMlGQdQru9jqfuw4OLaxt0aP31aW1T1psdgVHXPLPn1eWRShDg4uQ5M9dgCMbqStfk+Tguz6M3YOHB9W99N2HmL2VgAn7Ygfw4TvW0RDOvWyMCLAG2JIdr7uYG2Sq8KAS7L5Y2ZfEwlgJIGjRce9fv5nOWhItDYqyPDpUpQ2knDR79tj/4g2XnGW00RLuOBWo/cDgWMbKYh160vV9byAjtxSGmAZzpHIE9sdKmuSuf4bekvdM46INMxiziaxloo6jdjdFJuo84y8XOB3uF/ElpmHOuiBs1Mst5OcJC+DbXcfwyxYO8K7cwteA7zXTXqi4JxUXaFhAZxHnxWadqcKux36Awj6w6VCi9/dfNU5Zrl7IdkhCy54t2xCAkyB7hPaqF8bQYigV5LlAZwtQxND3B7j6nqHUIhd+tqioiBrXSl4DRW+4Lahi5ZsXQdPDPop9oxdWoJNwsy7Nf0oSAaJE+4HnH6+A0fVGOdQIzOgY0tQscY5ON1WSUF/7e1u+9g/rlJXS2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z+h/0tbU1DqPcDsyc8QU/lN9SD+SA7Isz8HP0fTbKk8g4ft00yERt0MGAuia?=
 =?us-ascii?Q?3SHk5jfUI/5BaqtVCQrNgfx9dNRdSnZuH8F9an0gLn52q6BhOD45ZiNOtzK6?=
 =?us-ascii?Q?TmygcqQt+nXL4B6CHjaLEg9YlxCf+gD9q5ThR/0T3cY+zAGJY80QC8j0BkVW?=
 =?us-ascii?Q?MWISfQb5wXXRmUkrICu5/1p5SkQkTwxGm4v5GDoFCvycIunyxej3fwyYn+aC?=
 =?us-ascii?Q?OrZYyLAOu6GlMfgD09lfeI5rEHBzWATxFIqDRKeYmrfSaOMoLEE2aKD1hgK0?=
 =?us-ascii?Q?vJmilsDPD+5zuzy6/5K00QS7lK9DrELuWJRkXtr39CuH+ngOw8seX+BvwoEA?=
 =?us-ascii?Q?7qzY/2rqX6XhcY0wSAEVIP3/GFLZYdV9KaMuKW0l8vHImtg4VhwjreggCoUQ?=
 =?us-ascii?Q?Aea2bx5MtBK4t84dkS9u8vr1zEI+uMjo1WBqG/0HZCYkWCzCWQbUWJF68k1X?=
 =?us-ascii?Q?RAL0/z9PfCb/8ZFvh2HLak3Fw0GF/nPhKSOTtXZzSmtbhvgUJ85PkCvIC7mm?=
 =?us-ascii?Q?YpeMXsLRPN7p9A0xc11FH6JLpqfwp3l5KKGsfkBd7lED73hKVUyhqSZe21K9?=
 =?us-ascii?Q?Y/wQsbpxqmYaPjEJ0eZilmi4inLoquLGteJx9sUyA/UN5panYsEYmd0DEh1Q?=
 =?us-ascii?Q?bibG9ocC2dDV9TMu1ORoaFyj7pbpP7Eb8f2fHV5n1WnrY8kc/gipzf4ibxHs?=
 =?us-ascii?Q?eBjUPx86MwQCIE5LEhNO0/b92Vs1UGBpeQS5wO+EbSPaJ4lTI1QE8wHA1UGC?=
 =?us-ascii?Q?QodE7EyK6fbC5ZwF6CecoqE9zAyiMSRge02k4Dl9Lnj10T9AqYp2MeuEu8zM?=
 =?us-ascii?Q?z0cGdup3Kff2MDHksZzkvJe76bKSEyrZZnpQBJ9OoWfMuYRw4tRif6Mx+v6d?=
 =?us-ascii?Q?aSOYMwqQcN6Kcu/7rHuXgdvDLt6Mx22mlDaVnXn5QzYCuGbiUXyBwNjlKP8J?=
 =?us-ascii?Q?hSfs7OqnMZIjNFtdqi0YpwrYJo31Tb66XZCTG+gJ3WEV+4DEzx1WNbrGyaJ1?=
 =?us-ascii?Q?Fw3XLkVM5YJbxEq5Q8Yuk1FCX3GrOjkSoX55AYertn1u+M6ZLiaR+nDnEyhE?=
 =?us-ascii?Q?q/NoJgBeW6NbuWY6mWSe6yF/NTc+11ksl4WoR2uWAU80Vp1dCLl07uv8CKX4?=
 =?us-ascii?Q?anCr0ws1M8PY2BXc8WFJInjDeyeuutoSwMwZtkDsislx4x91Au0eP5sxQA0u?=
 =?us-ascii?Q?W0hwE1z6i+tiYQbyS2+lbMEH/ZCvIPI4feoWD13EJQH0O3cnnSbFK3IuE7s8?=
 =?us-ascii?Q?AyKsyLWxpnm6/xrwaPh3kVv/tsZHk5tC1PawlGcp2u03J7kc0ehm+vX8sZbf?=
 =?us-ascii?Q?NRl8J/cfxD7AKp5lz9s1OiouzaXfqCGR40kKIqQbbpJvims6aP5OME91J18a?=
 =?us-ascii?Q?XiWKLRkO8KXtDqxi62GKjg4msJI34wwam9z6UZJmXvJ4VazD7nGd/eNBrCfl?=
 =?us-ascii?Q?vwhRecKDtMpkGX9wpwA7iIWQlY9VWaM/sMbexjMlpIqlP/t0y4mMLEHZ8NOe?=
 =?us-ascii?Q?Fn+PAVJfwseilyCiE86U1ZCrSP9Z6kuclZ57eDygqvT6Lgnsi1kzTAFii0DJ?=
 =?us-ascii?Q?g594+9dbr7WAJr97qKpQkLFcRfU1hwiqkoPJPBSJTWIa4+vf32iGQ7MeCxMR?=
 =?us-ascii?Q?Ng8tI5g+XByFkHi4R4DO9nyPNLfAFICp6j6VuyBO+S9Qxar/xiAXzFxKXEEF?=
 =?us-ascii?Q?C8jMRYUtPz/IN7X+DAM2gyTQSXKqc1FOKJf+fLq7VtDmSTTHUFnR2NejnXeF?=
 =?us-ascii?Q?hhjVSDT/QE8cGc8qEpIbXK4QasxCNoo2tSVn3pY7JhOsdJYoN6sp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de590f3-ddf2-4d44-0428-08decb9501fa
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:49:58.2941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jd8FzCCqZn4YgHfLAZd5rMcSMSd7s+JW0h7PPwfBaZXPeail6DC0vgfCI/D02IbVIQjUpNR3KQCzrFYJ9lxOhiQOLAp0+MJBcaBSMCOBFFUqLaEOOrBToljOfrw19GY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500

From: Sherry Sun <sherry.sun@nxp.com>

Add uart3 and bluetooth node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index e7d87ea81b69..b9b03416aa39 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -498,6 +498,19 @@ &uart1 {
 	status = "okay";
 };
 
+&uart3 { /* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clk IMX8MQ_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &usb3_phy1 {
 	status = "okay";
 };
@@ -657,6 +670,15 @@ MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX		0x49
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_UART3_TXD_UART3_DCE_TX		0x49
+			MX8MQ_IOMUXC_UART3_RXD_UART3_DCE_RX		0x49
+			MX8MQ_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x49
+			MX8MQ_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x49
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_SD1_CLK_USDHC1_CLK			0x83

base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
-- 
2.50.1

