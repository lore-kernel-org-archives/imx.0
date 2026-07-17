Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311BB3F824D
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290026; cv=fail; b=QtTwugjr2y+7iWvTctQrL3URN87OliwSbNP+/dhYzZuvx2Nb6NdFDQ3Z+E9q/KlLS/i4/QLF9Nu33QoHDha0WJk354O3148jODGclu0QiTXKkHKT2GN0IO335AP6vGzDb98ksf+BVC0fecybW5Czq0dvpaG9MBoKUmgJp0ljUyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290026; c=relaxed/simple;
	bh=TQvLNVwr5aYzHt4j1RwQfDoGBc+JleIBW1tSWWxvaGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KEcY3kpX55ANwoVimlNF16+xPVVhm4PSQdTs4BeICu8CxfRRpMcqwCOrTJHmezyh/IgtpAZEIVpPQCpz/5d3YmE/R/OkYArI5UnyFZzFLWHEsIY+J6VZ4I6AO4FuEIvZBo+RUKjQeCRqKJr6r5c3ks2T+ZdDgsL1eHC0vvABbq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OVGve37Z; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OVGve37Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9SMF6ERx/FdVszZdELF9Rz0ev6SY3f26kjhEM3XAh35HYd2I5Hlc3CH68Kv5J96D0BhXAKth0fNsX6B5ZztPswawSyz+mTduBqfo5S0i3G8b5yBFo7sDdmYuuBH7FKePAb3kxxIWyOSpYKKcayxud6Nfe/BDrv3oibzM8GYDFYFcDJ8wG1tkGgC4tFzbm7XSiV5S6iJm+Ryotuwc+3z0Mzs2BYwFwLcwgWFmW9rNoY0SOc/jrwBdmyahuruXJ67EJz/+rvooZvjvF8T0nU16dY9VZx2rbdT64pCtNAxhxLNxawHv+ROdPjLNdU243Djzjt16axVCIaBI0TL+EhI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5xrnlKZjTXUrCsBr7IILrOwmRNEhNnMmME9HnRh94E=;
 b=FfFcGlQzKujCXgGfRAhCQMAXXHl4S0/JTT3Y1H4DOgEp2N4pUhuxUmfajXYTBGcF/oCquFDImZk1VJHKdTGta95XFtRxuk9oK71Y+fN6SZ8/908J5ttrN2jSI9nGKr0ka6cekcnEYAPVwgWMsqldUD3khsoeRDPSmqGW/qIytRRf/ajJN+mLcAbMqUfeCx7b2x4t7eP2Em+R+f6+BGgKs7HrtCHmlgiwDHQK0k7Npy+4f2xj3NVGaoYBaEseDhkTlJNFQ2KLpgW9vVmXyBYI5WBIHWnpLZU8t9aEFyAf/ckg3pI+pl7j/lFl4bxhQ88NOFv/SW55TL+ZaKM00OO9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5xrnlKZjTXUrCsBr7IILrOwmRNEhNnMmME9HnRh94E=;
 b=OVGve37ZhHzNhs9xz0pk5TTWG8oFWPPiRoQPGnDCJdUnvXuqKoe1JY3xVdGGuY5bqYk2+l1RgkmqCZEzObTsFyAhlTPBOJb6tFwpgII6GVfesVR3Eqg2Os86cpqi5pj9kLqkIfM5eRBU4TfWxKNKyoOUeXu0GXo5Y77h+r71FL+D+gFVdMXJSfZR7pKuPmBGmDsM5nF8NEYPK9tITeTSPYiIRNRx+Ut1F7eew4D7Z0ibtvLncgBoUdliCnRPZDwjqtULXQ1U5zSDhR/WPr4gJsVyh4A2eFyv2bxCaRMh2KKyukvayJdyiS+pF55dXsYSlR0ykbFl63mowTsqfRuumw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:07:01 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:01 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 06/11] arm64: dts: lx2160a: transition to device-specific SerDes compatible strings
Date: Fri, 17 Jul 2026 15:06:30 +0300
Message-Id: <20260717120635.2118610-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a33af74-12b4-4460-c12f-08dee3fbe86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2LJTC3wSWRuHubxt5bZfWZp41hVFRZpbtMjgRBe0fWTPqo8uh7PQPWIwzt/8veN8JgfbW+pLXQ3stE9POKRPvRw54h9eB2eaLAM8hW16HbKaw2pSwX4/Dpn1Q7N80IymMcCbIjyGcrTkVIKJg95Ki3t3xsqHxOY4SYDTcxkmYdpVeNkaCkon72K9mQhPCLQCw6GG/tEdylA4mnqYxj9MOYsTPWEI5lPZAI2X81+aYu0DeGA8tDXpBzOcdYmIqwiCgp8EPj8Y9LMmzXgFr3fqxkRaf7PLzKDDAyPi80HFEr+xxeuSqINJ0pwKsTYWXF6qWy6ZZ2fct+f8FTe2nZxjzV9JOYH0z2oQHJICbhOkw/qg/pCSBdrWoZowECrBNH9U16/lVIihYNdZ/7Ys+MX2eAc1aUeQxqTxZycPxJEoQMd8yjll4sy/3S3yAxnOl4rFfKoiur+kOJRSk4jeLnZLR3BuUbIEgANyMg5G8SRsu6Jz45fZ+4BJwhab5YFahI/2KqI0wImQFvpFrKAfvDQwrBWYSpempYY3EgaCJmwl/weATuTk653YrNvGwMtNXqu9Bb7D7G34BzcaTOwcpXkXR0OTSmbjpvT5srO2PLBH64abgd3ZDavw/aEbCi/VOfgZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ueT7jK+BSji/iV9fu1dbdCwWXQo1t+ks61Y7TSq6GIsnigfkGI7ZTd39cCCk?=
 =?us-ascii?Q?x3ViYFFmJXcPI4un9NYnt9sgodZ1jAcaaHtqIy4IZg/bOZggb/iFDIeD5Wc5?=
 =?us-ascii?Q?n/lY6pxXJPI70up5R5waYd+ukAPHZUV3yTRagpexmaQtSQ88/dNZ+Ij8ckU0?=
 =?us-ascii?Q?nI5riEtboJsouNYs7qjbUqHS1cAdd5OAqx3uHIrtu/TBwgdNVMQXVuxtPekj?=
 =?us-ascii?Q?c3kpa588tVgejlSIxz3Y/Y+NwFIEsVvuhwK3rwBsAy0UZl4mHSGU4vjg7yI6?=
 =?us-ascii?Q?LQ4N92nU8EOfS3pOhw2jl7M5BtfT6bhFcT8UyKeGDGHISQaCk9xxEXil3VZs?=
 =?us-ascii?Q?Nh2qTmQ+A8vpASlP/J8XZhLJAnq4tt16HsigIr8V84GcAZUwFY5bjADKXcjp?=
 =?us-ascii?Q?m0bz0iTHWc1bc+b+Gcm5fwMzg7fV5iZ2BwOc5QZqMHzDRXxHw7aV4bLyPtcn?=
 =?us-ascii?Q?iv0lZ+S0cRlIXQlf4ZfcrE60inFcAD+EYitu//d7rzOHiWOIDbZg3ffOqmhR?=
 =?us-ascii?Q?/AozTwQ/hH6J/j0zN4l3wZ/BfVcVyP6mgw8Yb8pwVnvnZ63CfbyyCAHxZd7l?=
 =?us-ascii?Q?OlYgnIG1Xogt7Lou95nInGxJ3jsNOGg13KV/MAuGzY6LTdRs2fWFVdGZZCEh?=
 =?us-ascii?Q?yeCvF2Yo2EHE+esQP2LICBa3PntVhGsxA2R1Owrk7FC0bxrftlrFfKYDhtrH?=
 =?us-ascii?Q?LpwaRar6npWkw9zkLzHHFfh8kgbHFMGuihgwc8nNOzAUMqE+d5sOBvIyA7Wl?=
 =?us-ascii?Q?jT83JPY3A6I4rkgjBQkOhFF0eTelx/wcWfC4TZ0RDx4gPGEH0408oqUH7Vnb?=
 =?us-ascii?Q?q6TX8GmGPr+r/7p2FEDb8irz1xCvghP+O7VllTcCt6hSByGjHItzxdLMVsPp?=
 =?us-ascii?Q?/Powo4ot7/byeu0twwWMYkrYiHNliogcSLLgVbSh0uQBBYMjGbj723ySkxwi?=
 =?us-ascii?Q?+pwNad0zNT4CAPi7iECxR6OS6peEhL5HycF0cutNTDly6wx63GSzWHUjHSNI?=
 =?us-ascii?Q?vKIpYQrejvKxZM6wDmPpCh7smmdoCvxPiFIhq3Vy5T5/w7P+4JCmQXzsoY+r?=
 =?us-ascii?Q?7uGBwFC17kK29GW9Dw/Lfcl2wMNN9ICSVg2+hSmjbOqz6CndUOhFWCcZIJDe?=
 =?us-ascii?Q?AgSYA7jzAdH7o6yLcCRBmWKLDcdnw7kGI2rapNQuFq1wgRxmxU40qVkVGpvl?=
 =?us-ascii?Q?mA2Yco7AhMGnt5QFTePVsDUXMLpVV9U6vjKQ9wjsBb1AFoH/wOfFxu+pDshW?=
 =?us-ascii?Q?8+IB2/u21O0vs9n5t5WDepVFNXM+cOZEhzWVU7ylGwKGugGpeixOL5oFJ+C2?=
 =?us-ascii?Q?lX8ZDvNl3E6IPkCDfoaL91e3iyN3QHyeBklpSPO4Al1vnKVoskwXTpLelUVw?=
 =?us-ascii?Q?+43VYrn4iVF4VuQq2SFOPthyqYhLngsjryO/+DkMBkCh6UHmEH1I2mKSqmwH?=
 =?us-ascii?Q?FYkHygM+MpsPm0/7Tcw/sPIIV1dQ9FFuWKA+8gElEATHXpyuY5m2nSmeI1yI?=
 =?us-ascii?Q?u2o35MKpErsGPSfOJg92uDaBPaJ5Ml3dVBahR0VqxOJoAZEAv2NfaL7VZkKB?=
 =?us-ascii?Q?Mq6n7vSPVcectKqcGyVJYLvbsrwnMsxQfUy5peLccfw+F1tIZZYJiO9rH9SX?=
 =?us-ascii?Q?zxqUM9jyAiHTL/Df3oodmRVWt8WljKLvsuuksIxmFz0bDsadRoV29UOh2TsQ?=
 =?us-ascii?Q?GOLZGAjL8zMH64op1uCF6rtZOswwTpq5aIaa7fvqqdz+9x4EYJezDQUSxmZD?=
 =?us-ascii?Q?fSVxeogXlA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a33af74-12b4-4460-c12f-08dee3fbe86a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:00.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx2o9hQfFEnHXfYcwPPaEU6rzQw3zBmQG5Em+gf9SlVPxSlwBMmnbxlFo9jgEwYgKrDaDbJE6FW/xPzelP2aHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
instance is present in the compatible string, to allow reliable per-lane
capability detection and per-lane customization of electrical properties.

The modern bindings are backward-incompatible with old kernels, due
to the consumer phandles being either in one form or in another, as
explained here:
https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/

Also mark the serdes_1 node as disabled by default since any dts using
it enables it explicitly now.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- Split the enabling of serdes_1 into a separate patch
- Split the LX2162A changes to another patch
- Move the status property to be the last for serdes_3
- Move the changes to the new fsl-lx2160a-serdes.dtsi file

Changes in v2:
- Enable serdes_1 on all board DTs that has consumers for it.
- Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
- Remove paragraph from commit message which mentioned some consumer
changes that are no longer needed nor part of the commit.
---
 .../dts/freescale/fsl-lx2160a-serdes.dtsi     | 150 +++++++++++++++++-
 1 file changed, 148 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
index 307824eda6d6..d482920f4d17 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
@@ -6,16 +6,162 @@
 // Copyright 2026 NXP
 
 &soc {
+	/* Note on the interpretation of SerDes lane numbering from
+	 * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
+	 * The letters (A-H) correspond to logical lane numbers in the
+	 * SerDes register map (lane A's registers start with LNAGCR0),
+	 * while the numbers (0-7) correspond to physical lanes as
+	 * routed to pins.  SerDes block #1 is flipped in the LX2160A
+	 * floorplan (logical lane A goes to physical lane 7's pins),
+	 * while SerDes blocks #2 and #3 are not.  The lanes below are
+	 * listed right to left when looking at that table.
+	 * Both the numbers and the letters are according to the logical
+	 * numbering scheme, and do not account for the flipping.
+	 */
 	serdes_1: phy@1ea0000 {
-		compatible = "fsl,lynx-28g";
+		compatible = "fsl,lx2160a-serdes1", "fsl,lynx-28g";
 		reg = <0x0 0x1ea0000 0x0 0x1e30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#phy-cells = <1>;
+		status = "disabled";
+
+		serdes_1_lane_a: phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_b: phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_c: phy@2 {
+			reg = <2>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_d: phy@3 {
+			reg = <3>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_e: phy@4 {
+			reg = <4>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_f: phy@5 {
+			reg = <5>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_g: phy@6 {
+			reg = <6>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_h: phy@7 {
+			reg = <7>;
+			#phy-cells = <0>;
+		};
 	};
 
 	serdes_2: phy@1eb0000 {
-		compatible = "fsl,lynx-28g";
+		compatible = "fsl,lx2160a-serdes2", "fsl,lynx-28g";
 		reg = <0x0 0x1eb0000 0x0 0x1e30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#phy-cells = <1>;
 		status = "disabled";
+
+		serdes_2_lane_a: phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_b: phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_c: phy@2 {
+			reg = <2>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_d: phy@3 {
+			reg = <3>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_e: phy@4 {
+			reg = <4>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_f: phy@5 {
+			reg = <5>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_g: phy@6 {
+			reg = <6>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_h: phy@7 {
+			reg = <7>;
+			#phy-cells = <0>;
+		};
+	};
+
+	serdes_3: phy@1ec0000 {
+		compatible = "fsl,lx2160a-serdes3";
+		reg = <0x0 0x1ec0000 0x0 0x1e30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#phy-cells = <1>;
+		status = "disabled";
+
+		serdes_3_lane_a: phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_b: phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_c: phy@2 {
+			reg = <2>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_d: phy@3 {
+			reg = <3>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_e: phy@4 {
+			reg = <4>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_f: phy@5 {
+			reg = <5>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_g: phy@6 {
+			reg = <6>;
+			#phy-cells = <0>;
+		};
+
+		serdes_3_lane_h: phy@7 {
+			reg = <7>;
+			#phy-cells = <0>;
+		};
 	};
 };
-- 
2.25.1

