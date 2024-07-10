Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A62195F2D
	for <imx@lists.linux.dev>; Wed, 10 Jul 2024 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720642144; cv=fail; b=lVdDkV39rPVydhyVEkXqTRjk9m0Jt3TI7ZFC0JumaVZ4hh7VBkNwtVTKNNWqEfcwPqpb/kiljGy1jqYivwh1OSX3l9kPBZlURVvsIjaozdEGGhyAjFXV3bzAaUcWJO/mGeN/pS4KV7EdNV5pVMxCrvu3lJCgmTM3EOy2Ou3ZF20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720642144; c=relaxed/simple;
	bh=q9GDTuM9wa2zLXtBnMJwz7v98wZ3KEvN+EYzYaXkcbM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lLCZc/sbxeFW7+Mqo9oc41OiaYbHcPlqXqPq/3K86N3OT3ASoIn9qMbJRZmMGn5P76bTwJMut4V3qqV1lsRRpP6yqPyDrT6aKrdMVJN0nJDpRptdJ9jRCWAcdeBbLuSlz9jQ8PMgmtrfp886aH3AjdoubQSxXn4M6Ko16sZin34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=E23rDAYY; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E23rDAYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZmqWQdFvDW6kaEUmIfSGjBNkF0+dlADU8XsLR8ivDLAL7tx1zod5UiXsNZafc9hne3X3Vzm9DB0QK2fcMoB/zMssUu1aUpIy4cW+YDL0U+mn8aVvjZ+N2rZlRpITKFhHIIFHNXYM6qZX7FJDE1WtSAk9BVfiMuVPoofN6jTeLz0CBdeXN9s37lmnGFjtZW0oCnAE9q3f42myq5aNKXKUvvO0mk9hhSZQnTp0+L19JCnH5GAYb9/NR2+rEYAewFaPCYiYxBxSUmZjYWsdIN6GsYat0xzR3m1Nk+lt9U0UicCnwtIGX6l7cCUsPfsptC276sCfWsreQZEvWPvNc7mSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ72/roGC10exdUGK1uz/sjXKKYnojAtLy/As3Ylsd0=;
 b=IDcVQrWXM4tV53wWx3C6RjYwQfmzEwI7U/xa0dBBrJEWBbAwZkuP7J3Gci7klZJCwjeRjKbFQv3jhWCTg0zI0l7/LBklbsGxXXi08vv2K2LoawTzhf1LPo6XB345iEHKPvMpMiO0jCqMNWLbH7Yoslh9KIdFSdULx+biC+mrVkY90L0qfDLVTwmmvbAoFvd6zKLU1YfC/P1wHayZzzXJ7VMS1MObxNhDJkXRw3I0riO+ucv71h5b8rCcQ2oKHJhsgRRsOMDN7oBGcYeCFj+1WJcNKJ2llpt0VL4A5FUMfz4DGeud6woxe2CnNDQfeC1EYviCuPIbNBtT9t2speBO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ72/roGC10exdUGK1uz/sjXKKYnojAtLy/As3Ylsd0=;
 b=E23rDAYY0DW2vdkmPLz3dYmEP+vJpPLHdEd+4+nQEMCGf36T8ivJEEqaXHFm2PUhvoXx31fF+jUuflPHlkeza4Agr/anMvP7yOjN7dYkPtQeEQJ7yr6XcktpYfdVCVkvOZBD0LVYZ6hCV9N4rqVVk9HZMtpjLJDVwgiVi0jfQXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by GV1PR04MB10725.eurprd04.prod.outlook.com (2603:10a6:150:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 20:08:58 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::4fa4:48:95fd:4fb0%4]) with mapi id 15.20.7698.025; Wed, 10 Jul 2024
 20:08:58 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] arm64: dts: imx93: update default value for snps,clk-csr
Date: Wed, 10 Jul 2024 15:08:33 -0500
Message-Id: <20240710200833.153521-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To GV1PR04MB9183.eurprd04.prod.outlook.com
 (2603:10a6:150:27::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|GV1PR04MB10725:EE_
X-MS-Office365-Filtering-Correlation-Id: a24236a6-468e-4f0c-a9df-08dca11c21ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nh+fUxsMNuyGYebM/KyrPfyg+jzdBf74dBOEWrH4DBXJns9EHafKUNHqgeqx?=
 =?us-ascii?Q?IprMAF4H/UBAnAWf28Fo5AveKUZCb3ysQVFBBBhits/B5C2hKAC4pKBWmk+r?=
 =?us-ascii?Q?sIKVsZp1hyog50pkL8jDTFIy5h2/oVxQWYEAMKWwwmAnTZ70YKXGXlQvINqV?=
 =?us-ascii?Q?U+TWamyjwQ4yIrjUdyyJLT5EvELDo5J06Wh8lRxBxauLx7dE0tod4DtykHoa?=
 =?us-ascii?Q?5zpSgXrbN2OIWUP9k2h7tWnFTFq9UCTYt5usowVeorjGq0zu1bR966mOSM2y?=
 =?us-ascii?Q?EIpFp3ddbJ3dxtKa4AzLYjcI0Fj6PNPpQC2SUmgmd9k9YPvjSScHA3QjBJAM?=
 =?us-ascii?Q?UDCh98VDNsfQKzddZu+4OuP0LtOEmwLTLxlls6xtGa3qLSe9DXnPNm/0ZPj4?=
 =?us-ascii?Q?GrykeuEhNLJBAoRjI6Mblg60u4ETvZKvbzUmY06BZwmesmi8WGxchnxHkk5F?=
 =?us-ascii?Q?gB8plscAqxlbsLCej1KBCdiihP+BFDgQxqUAD1PL1fRZPwrh4vtQwwczx5MA?=
 =?us-ascii?Q?LyxLMoVYhRuQsYcoEWV2NNUEaY8r8LpIWH818YrznJKvmzNWSaD9SjtupwJX?=
 =?us-ascii?Q?pbV3rLWqlpMmGqK9ApTpLtpr/erK+YfTzLPwObkSLajM8cBKmTLV5ZU6hUzy?=
 =?us-ascii?Q?h/IxKdgNoVid/jpwZjkun7M+nX/QHyBJBE8t8e1dwpW3XKylhTjHRl7bVYfQ?=
 =?us-ascii?Q?yzcj2ZGFdbRLSHbHmgl3Sh1HLNQkVUaU5OKOOE1v3kjfnhCHuWthrn3Sin3+?=
 =?us-ascii?Q?ql8lH0YGs168VhjcZmY9NPKWpNpOg8hFw8t/BSHt7iYw87vYB9QvhpNUtqoa?=
 =?us-ascii?Q?kAd96hzVrunu6oY8tm7ikm7170ZRV9Zlm9fnQ+XgiMncS4+i8loBon65WR0n?=
 =?us-ascii?Q?kMnmKjN/WZmqv1CO8h4icGeUeEYZYDuvwDwznH7sM4NetuSAqj2JgaDzoDYv?=
 =?us-ascii?Q?SgjcrpP1mB5zo2OOb5WsLE5/rbbSFZCy9f3+8aF0UdkADwc2dJ1jB674BEQA?=
 =?us-ascii?Q?jtJTCohEVUI1q7/ZGSPwXX0kq/w9LnxzmDBeueBzU2hp72tbfb8mQWGPvEKQ?=
 =?us-ascii?Q?ensswS9DLZ5kMPxhv9Jug8BO6cxeKtl+iia3beb+wWGXe5LgpmbcUyunda6L?=
 =?us-ascii?Q?lMcZyXsypbTZQ8UE0ufgfFMn5wZA1stjzym2qBXQ5WGYIvWIF8dX1RTYSVFP?=
 =?us-ascii?Q?B75NQC5wnMEqVszkLwrmUAqQsugYk5aKRQNZVeywybn4KXeDTD0ywIymxPoe?=
 =?us-ascii?Q?SrQBeOxS6kRhoiyAGU9d3ZZVzgEZwttS4/AY3HOE2ked1og9xDW07SD6thYn?=
 =?us-ascii?Q?pI99TfCO5AeqqlGU6UhTNviHpeYZjXnuBBAgzpZ+/7qBVHjbrMo65wpMScpd?=
 =?us-ascii?Q?6FhLvwT8k9kPefUnAkw3zZFIu8s7H5j1e/uWPcYTWFRLiT+zvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XmMkEpfpbOGec4I2TdNhMpcBrwcHiBGmpyC1u2DoTAnAkI6OH8eFDhsY21rD?=
 =?us-ascii?Q?brz27JMjZbfdsflspWnQCCO5+LVkv1wJXUUPabYtb7Cdwry7CEp6PZuVceds?=
 =?us-ascii?Q?EtwxzmF8KIB9WPaM4IAOSlm1sfmksqgrkxyTiy3JWwRWvRdmVeYT1seKd1WJ?=
 =?us-ascii?Q?Fnb9JVbRmOt3CDRVYNUYmpkKn+eK70WGqXDUoUsGcVbCyxlHg/D/jfVGRibL?=
 =?us-ascii?Q?GpH1gOg0hOr+WEXYM+JLWTZAB2/BkRjKjWVE+CMlUeNHzPSK5fEM1EXI5pV3?=
 =?us-ascii?Q?u3sDQ66MxjBPlYf8BOX0RXecsJVd3IM89pedR+wh66gZ0ZELG+4E5SZ7DFcA?=
 =?us-ascii?Q?X2G7qtS4ERdAq5cAMIIi16QwuDBdfSoo/J9SS+Ze4Ifz/9uwd2YHjD2sZtfq?=
 =?us-ascii?Q?1AeLjf4jtWc29cWAYhEZZ3XzuPl56zTx2zu2mUywyJ9+ztPXBpt9oEqGgusu?=
 =?us-ascii?Q?0+YY9rc7JZchY0Tj9fVrhqdRQa9ZRQxhTgupm6lMNwEyYUuCGCxIpmhjKD2V?=
 =?us-ascii?Q?Y+MGquMKsBlIJb8RiK7p0T5w5UAd9S3/HxKPPAUs6x1bsyOMyeb7xiL1H2fB?=
 =?us-ascii?Q?O0ij5G7Fx4pjabbhfnNOJpVS1FbIfZWILxwI+PW2IaW1/n6jpKiGn2yR+TVU?=
 =?us-ascii?Q?/5BOARzB53Wsuq1eBpLXbgzp3XwekeQJGvwQkHWcDeY0WgdCU1oGrM6bmXVY?=
 =?us-ascii?Q?fjgmIrRLvqdF0jUTj610T/Lq/XTZw8EGbsxcbFtLkCoUiav33XtgPoUE0AvH?=
 =?us-ascii?Q?WoKQSvb7IIuewCZebavsOcIXH2qqOWd8xc5ZAJasPICAW/k2hVeKdsovlmAD?=
 =?us-ascii?Q?1lus4eR5k7IDPlQ/SEZpOi3o/DJVEmiYWW80Zizp8K7lqLFjoAbopziaqD1s?=
 =?us-ascii?Q?l8sFs8/5NXd3zdcEskIv062oAnt1gtIBGUiUvD7gF44dZfERznPdXW4LKe5L?=
 =?us-ascii?Q?kMCryrqitPhzrQoX8e73FjIsKlApz752izC4YNYnjn+/QiD8aZAPG/wW2E+s?=
 =?us-ascii?Q?0p8r1cYfjrs3GDElK4KNR/vJbSHGpb9sd0WHNtMzvgdYoy4nOXqrlKC31Unl?=
 =?us-ascii?Q?eSobx+m2uImLTLYYq67130pJlVpZcwTqvBas//lpkSBzegNnv/64rSOjFnfK?=
 =?us-ascii?Q?bmztFrOHAvEn66atkONC9IiYbnPDN2grL5UFHmwE/jOd9+eP59YEWGm1pGOV?=
 =?us-ascii?Q?xwkzOC3u2/0KdxC2xB1umg8EdVrF9adXHn6toCfdWbknaNXSxvJfjuru/1QE?=
 =?us-ascii?Q?zO8Y1uBKjk88XhYBJ2nkRrptO4C7XWzFUiT8I6wvmo96e6ynsw7yWMLW3dz2?=
 =?us-ascii?Q?15FaGbX4gVKI5STcxTHMBattXZScQzInNXpHjd7SqUOvvPnh7e3WbqYzxBL6?=
 =?us-ascii?Q?4EVTp6w611FIcaOD3VJ0sAnRriwmLPW3SR33vdE0THj5DdH9V3BlPkz5wizl?=
 =?us-ascii?Q?ciP3qXbzHCRvNWaeGpWkoMx0uoKydcaD7845NLOaE4QX2Q5bAKmexSPSG4QK?=
 =?us-ascii?Q?eOMvBuT7NrIXzxEPxvv7eP34MeEuD02tb8xiPc2rA17haR0l6OWEfs+Cmfav?=
 =?us-ascii?Q?tLy1j5VmGo05JBsTDpYtO57GcyhZILqNjHwMbPCl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24236a6-468e-4f0c-a9df-08dca11c21ca
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 20:08:58.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUP9SG1HuiXDDHI5D4DvxP/rVz2E1+W8PJAiHFuaCqQRERf+6acLTlOOZP0eGLrcf0zN00mBvscQqe0EmD0oAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10725

For the i.MX93 SoC, the clock rate for the IP of STMMAC EQOS is 315 MHz.
According to the following mapping table from the i.MX93 reference manual,
this clock rate corresponds to a CSR value of 6.

 0100: CSR clock = 150-250 MHz; MDC clock = CSR clock/102
 0101: CSR clock = 250-300 MHz; MDC clock = CSR clock/124
 0110: CSR clock = 300-500 MHz; MDC clock = CSR clock/204
 0111: CSR clock = 500-800 MHz; MDC clock = CSR clock/324

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 4a3f42355cb8..a0993022c102 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1105,7 +1105,7 @@ eqos: ethernet@428a0000 {
 							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
 				assigned-clock-rates = <100000000>, <250000000>;
 				intf_mode = <&wakeupmix_gpr 0x28>;
-				snps,clk-csr = <0>;
+				snps,clk-csr = <6>;
 				nvmem-cells = <&eth_mac2>;
 				nvmem-cell-names = "mac-address";
 				status = "disabled";
-- 
2.34.1

