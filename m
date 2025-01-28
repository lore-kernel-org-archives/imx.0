Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908701F471A
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 21:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098996; cv=fail; b=VOnh9FdGSVkR+GVduB7d1iAhOka47iYzGn42wi1L6zE1OXbn63sEYXNAKDyyU5RGv7TFqBV8MCyX08pUrZLmtEOU8EsGpZam05uQm2XAkB+WixGVOOJnLbjWke3ogGFn6rHbFxZIK/R10xtuPlOshZnN49/9LUAhCibb5p7UoZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098996; c=relaxed/simple;
	bh=igaWD7ZT3giDAIg327DB3PZ9eeqIR4ePQssicKM7Qls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M6QpMBeWj3AnQP34wfiTUqbqwfAFv9DM7T51QvGa5+O2U7Le5cg+XhBEaYjwcpr8fu5kuQn7dm0OP/PlVl3xsIfJfZlidMzWi8UVy58bi5sc5ZFShvJPV14rm6gUezzW+8G+UrMIJhtBfBsXL8us5nmAUN47Y37zPBxrURQ2JZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QPEiHbhh; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QPEiHbhh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ+vm3RklPz3xPwdm+1lL4ox321xqK8pxzFMg7OlL+/6RB4vtgEI66Tic8k8yx+N5jezp2njR/zH891QTGb0GiE2Z3+Xa6RRKQGrW0XQWm/Y3kV4rTEvJyMB9OzDDyV866DbUK+QGuTYLGzDanma1QGDyOfGKVYYAOLABhKqTgpLLXdT10gcpHFuS3BOjZZRjJMMIOPrBu6qHmGCo7JQR5e+Iq3xaWmj1J1p/vUkxYT2iKJe4pCPdHiCQae0fNQWpuveSvSnabYi3f0RdVtd+ihesDhZ8hVbWbw/4q86/mmmxs7lozddti4cOWzoVQdFKLGIaUEdF8Go7wyJtsfBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGI0CmflymKVCszqc9jlha2wPHKOGVMSN/sbvaEJQQs=;
 b=BTxqRLLhiO46WcnIMk3JYBR0KaM21zEn+UCcgEhENRx7tZJ+XUT0LkYG8QGnDB/xCvuUlqY/BDOI6bBbpzt3gSysb6FwwrEMlDvvU4bM9BXRhUTYr/YSNmTQuPw0N97TgW+kyq2ynuRWziod8h8Q/ketgGu521mjBF+KBeZf8DCW/N3zbqiyLA83cB7WiKopbrPmxNkSqK/O00Sk3INAPUqHB9tFHUOgwUcC2SUuv4WKruKX2HRJE/kZiLOlQZZ+B1ukNxTi0CTh52uQhW1nl+5qL8T+7a9ZKSpzYwXUEOL/pV7GDSLxrVDlLEcutuIlATDO0JUy8qrA83QGPKygiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGI0CmflymKVCszqc9jlha2wPHKOGVMSN/sbvaEJQQs=;
 b=QPEiHbhhV4Lw/LKofn4Epqbuvgs+wYxQwWknO2LPl6RqmySRwOZIUl69Tklj3tdOxSLDOe1YsxlBaBSpYtRrKb4K1F1GIFyTbZVVwG/1wqjzFW6cufVmeYDc84+6GyqF1ha1fYt6yk5pys+YjvvFcxSHtYNYDHrLDSJ5kLBFqj7NRIMnfueJQCodMdKC83/V3nmWSx2Hp3HAAOK8aYYKQq4wOMV9upo3+LIsv+/jqWcNIi7hl67hj6LMhblDstidvyUrvpUHTXilg/Xq6GPQZalYF+V/RgFQjpWjLXq++7uvLO9/BfLfCWoOPgM1odE+uuHteJohi1EM9mn1kMCtGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 21:16:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:16:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	hongxing.zhu@nxp.com
Subject: [PATCH 5/5] arm64: dts: imx95: add ref clock for pcie nodes
Date: Tue, 28 Jan 2025 16:15:59 -0500
Message-Id: <20250128211559.1582598-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128211559.1582598-1-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9111b778-5f5a-420d-b57b-08dd3fe109a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtVvDjfhSLEXayBrl+xZ/fNJdsdMYmBOGXi1bKVAivp3ze5JPmQN4GD/opbs?=
 =?us-ascii?Q?I80GPI1enLMuhBos8IkAFS1m3ksj8Mu6ThopBxpPFoe91ntLq/PILuFiPWn9?=
 =?us-ascii?Q?MyoKbzDL5cdk5esl81LSXygMKO0U/2jnpaxS994g360V/FD+oZ+XQCuw4087?=
 =?us-ascii?Q?8AH6emf5BqzrdR+wHQI9Xj5b4c9531slY1PuBaSLVUgURI0S+3ebZRpI4bQv?=
 =?us-ascii?Q?YOHDqAF1awpcZ7Zpf3dKnexTZx1SlkctfIljYDwcKkiCLAv84g+UyyBmPDE2?=
 =?us-ascii?Q?DBGEvec1R5Bd/m795LZUgZc2L89kDd6fdYo805ue0QghAL9lPJktoqw1wEJD?=
 =?us-ascii?Q?xR62IV8nYZy48PWS27M6XSKgKJrS3HDsUXrk1IY/Qjh01QSSDbztxoXivXPP?=
 =?us-ascii?Q?+hTDdFbW7AL/A76MNfizEJN9ovtP6oJu5yIjAOy3L4Bik4czNhbH916Gtqvz?=
 =?us-ascii?Q?SvDMCaSdlI1wPfR9/hgkcNrPiFgqNxSIol9rvX4mwrMOTxLzI0kRa7HAo5p3?=
 =?us-ascii?Q?ikg2euin1YNRXfwG1s6wl5O8FdJqd2k9J985LFIOKVJeporcVNZf4lSR/Kpb?=
 =?us-ascii?Q?CMUIEneX7kpvw00RIaFrqgnPxhuQZlRyJEidy7YGtTp6pYiNOtPAP+Ja6PeP?=
 =?us-ascii?Q?tdbzV/DyRhS8U9WMgvBiQu3vi/1T28B8TLI9HQXP6vMeYPpEXgJ2R5CSjKO1?=
 =?us-ascii?Q?UyG9rQmMzD2zALc02zXPYS5kIat3tTb1Yjkad6FIzHI4Fq/QT9rlI0l4wxtP?=
 =?us-ascii?Q?pSaMMkAVoDeoz0P6uWXFvAXZ9jDS1YXXWSzg8PdAStKnjkgVcFUOTM86dCB9?=
 =?us-ascii?Q?P5Ggfbb/AObC8zMKDCi1D2t227P1zBZBYrOdgkG7VwQLGqvljloZl3ZCj5aD?=
 =?us-ascii?Q?sQkeihsr4JV4h+s+aGYMxeBHUgo4bib/RoUyeQBCZ40woPW5yytVSgB3Blbo?=
 =?us-ascii?Q?tmJY5iuXuySnaUiNmWUxGQ9oxUzW3KSOJBR7FRM9OkaUEwnx+ObVJjmA9/S8?=
 =?us-ascii?Q?JkdqhdKiP+no9J+uXlWCsCF9TrumZBhzGY0TDInsQ2U0WKJipLWZ8n5pYtea?=
 =?us-ascii?Q?WCKDI4j+30KKEOE5iUJoE21gKxMy+QOBnbWWnLBmuqYVYLspBZlZtUfJ1DfW?=
 =?us-ascii?Q?+HoHuh28pAW5kZ+X44gVleIZZlYngu1PReJdbw0/etcUv4tZD2IwCZIm4HnZ?=
 =?us-ascii?Q?7how554L2H8PbGw35EI8ViJC1lMM8RBPEgZBLsNR4HRN6PXqtreKjwEAd4Oz?=
 =?us-ascii?Q?jsTcOZ4bdRYkjh3QY7VqYkfHyUAmwbo6kYKP1UoZw7xAaMQNyT2PmJyoeCjl?=
 =?us-ascii?Q?WQNqhvBQW9LhXDGMjDuPAG7PYKC9gOJQvDcZ7Ww82WJ6fajNVvQrqHf8ALhy?=
 =?us-ascii?Q?0wmQL6Fna/VCUcgH7tMTILJOImuDlZrumqkEJFkAKyOl773J9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aWqr0bi/9PhFvcFpSbY+RBmQ98BF2OW2iztLH64YJyVdj7nXjiemHkbY+Hcs?=
 =?us-ascii?Q?N7nGBlltahg3AJtWRDPkqWq45OeK+gf68iAB4ekBWWZBUpbreeg2IVe1luV0?=
 =?us-ascii?Q?eeruinJIElgZbuArE9CF4vBB8Vb/AzegWj030Rt9gpdPx54aL8RC0D2Wt6WO?=
 =?us-ascii?Q?XEvN487MHbN4jy6qkfwDEHCBvsf+vGNUMEkvgvs3C6200pWGXzShBXxj9pRp?=
 =?us-ascii?Q?0P7bMk1q127OrgdFmsVRfUPiqyIJepYzc/WUJqPx13vgBd5BQmN2uz85NMhD?=
 =?us-ascii?Q?cdgOeSo2fYNWei4tsveOlwcEa3wRlSSaa0BKokVG3Zk741kExNHbyycppA7i?=
 =?us-ascii?Q?rNuHR9bos/acz3bwAELWHJD1Fda+6pFzGPr0j+PpW/xWk8mcfiYQ/dG/dERv?=
 =?us-ascii?Q?RdNwadSejticfTOX9L+uUtfX2/f2hFSLQ9o57b0GgLvsu+CfnO2gzprgkpr9?=
 =?us-ascii?Q?G6TG96gK0N/w/FvXeV/fF6CIopkq3NEQDo1/ozw71G4LXWeWARkOdeGoBvt7?=
 =?us-ascii?Q?KwO7I+s3pymsYCCTZ+1nfwYgTmdbKmUPwGblWmEiqDQbfk35nVatk54t5z4H?=
 =?us-ascii?Q?YUxoHDVGKU3gZ1kqVuwZNfm1G19MK0jKanxmFJciZoaqpWpk4zQf2YEwAExd?=
 =?us-ascii?Q?iFkLdvU1VDyLW2ltD4CHq8i5bpuFv2Q1U0AKGYskaFZoouOefbnEHC1tpJSl?=
 =?us-ascii?Q?iCQuf/JT1lbgG1FhQ+GgIeCK16TkJ/dsrY0Uc0xy/Usl9QBBNbTAlJRv1T3i?=
 =?us-ascii?Q?p5HZ0r+PU7X2OB3B7B6U2iu31o5htKYswH3MQD8YUdlYgHbCp05/Rb4L81dD?=
 =?us-ascii?Q?prDVlBwvzOGZAqhRObFNASRqugC/Y8lQURtImdBjk9CZ6PDiZVFi4pnbxgsW?=
 =?us-ascii?Q?udqn5+UczISap9umtO36W6a4gXUPmlPfOWn93VDjEyqI8wgo62LgwPZVBTrG?=
 =?us-ascii?Q?BIzPcBNgwOxFJEBdRLEWxNC960ZrUYy4pijlkugX8O8dcnoub5J24nuKcDds?=
 =?us-ascii?Q?lTJEfZw0sipAVzMWdMSyQxJSZqiwJtmsJGR5at6bPrkdbGeqN5N4mN7lglse?=
 =?us-ascii?Q?vKMbCBs42ePbNGrxXG9q8oyWF8SiP0oSZBHHYQaLT3Dc9NSKWEh0eiPpHhTL?=
 =?us-ascii?Q?ZMSMrX36pDuvkyblXa/ayikBpDMktilAazEBV0CFJGpgvOHOQuCOgM+tR/Mv?=
 =?us-ascii?Q?tqGs2FbQgJuZD8ZeptMGc4ncVWdLgPyp0uh/SSzbilskRllyV5YTPc2ELB0E?=
 =?us-ascii?Q?40VHtzMQlWN4bz+VLvBAm5NpGPxSxi17rY/wtvE56KowQD/rqc9NbZ+n/tFH?=
 =?us-ascii?Q?LZAKxzlEi/gaG1u5sKCyo+wl+WZlCKrC7K10Mpb/xf+BVfOe3mln6CV5ZtgM?=
 =?us-ascii?Q?GprBtEuU1rtB/YJlMS9eqRjvjfDu44XQyOmv+ApxpHEtvLXE+vw4AnU9qyev?=
 =?us-ascii?Q?NowpLzinDkNscPRREk9C50oHu4bcANPbRPjnCEsL4JZiGxazsM/7JrboXcbW?=
 =?us-ascii?Q?jOhfL3jZseZW4MRdhZ7Ga48dFlOM+riiN6epolpsVB1fgACT0SyMr+b6NpBh?=
 =?us-ascii?Q?zubp7R2VYo2tpQ3p25I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9111b778-5f5a-420d-b57b-08dd3fe109a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:16:31.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EZEoPid6wKRIMVc0DW22fGoQCRpcUZHRranQCPyyYaDjskwPh8W6Upe7FgkQgqeJ7H6qVm/jxT3WnFF+xie9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 2cebeda43a52d..f0dc8be2abffa 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1537,6 +1537,14 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			clocks = <&dummy>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
@@ -1564,8 +1572,9 @@ pcie0: pcie@4c300000 {
 			clocks = <&scmi_clk IMX95_CLK_HSIO>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					 <&scmi_clk IMX95_CLK_HSIOPLL>,
 					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
@@ -1637,8 +1646,9 @@ pcie1: pcie@4c380000 {
 			clocks = <&scmi_clk IMX95_CLK_HSIO>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
 			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 					 <&scmi_clk IMX95_CLK_HSIOPLL>,
 					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-- 
2.34.1

