Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A717BEA0
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336340; cv=fail; b=DiyqRd4j1cJwELve9z6CNjg762IdCPEs1AOhxThKOmEgZUIKprJCt+cWtP4ZYl+aYLktpu8Gi3EEJetANDVLZhftmwlLqox+mdbDGPAJrYiq70IwfomRvBce6RTRm7m0x8LySMT66Ntnh1D3CB3m0lqzBE0YuGQxarcpOmPqonI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336340; c=relaxed/simple;
	bh=zqEGYEOuuAjCHqFFO59IbgRvJj+ynJVbtlGnMe3zATs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=heUXT7X/HKohXbjcanrsAxe8upGYyT4B2FhHQnsbhI97TINWnnX9SLrAkIlo/2GF7AlK4mjpS0d6OV8fK67mGhkBhiRZpg1YCDRJGwcEnN3maTD/ln5jvtxMwUCxg/1Pnvi46kEDbHbq5hju674MtOpogpJSnu/evqUvw+j5z5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UtC3vhGU; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UtC3vhGU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7syrjC3mBLXLnMTEMi5TRsPpFIgPxy2N8+ygTvUIf3XCnfNnUVjiRH/0kACgcBd3ox1n31opPhRVfsNoTgUkah+ZDssu1GBspS6KrILxQgbAeRqfp0RJF8RTg428RzMr86vRB3S2o8Or0X+qrHOFMQdHkrr7E4LK+jMmwj/FeFF32vU+ZqvsiIdX5pT8zsPF16GzrMteJuw0oZcQYRiwTiM1bzUIl4+cG7js6pO7CFFBrVIO1TcjM1UooTSCekXFy9K0Am6Jun8MFSdfsbPKjxtYFV9r0LaSaE+Yr/B5rzTY51TksOh2ifPG8RA5fZsBAH7h0+Lrtc/X9U9Xq+aCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xb6bANbj9XgrbLBHQ35hMsmWxLG+xkNMf3hKS2p50A8=;
 b=uOK943nP4Gs5+L6VQ2jWqrSVn0P/vGYKyAXzS8xSy66q22n+NyAbH2/Q72CC3g8lty02L0XR7Sbtl/E+jR176g8i0yHMLtYf3LiqKCesrOS+UcQZ+GTqMXF89yCr7WsBrv5bbOef9cwOgO360wsVchFESG4HgGhDtwHT/cvWBv5Ll9ZZ9CgbWsE6OElryRujmH1aP1eyY6GHCgV+yj+pVACO34wS8CJMiRrkXQMBEdIrAzK0rGRQcr2HCnPOAITI7U1ZCkEBQ+5sFuQrihpv0gwQrWcIWRb8OCwld2yNx8OaTYGuaNjEd8sIPUVJStneMF0vsAoKcTw8rpAdcb8gNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xb6bANbj9XgrbLBHQ35hMsmWxLG+xkNMf3hKS2p50A8=;
 b=UtC3vhGUhn21zVdL/0Zm9dylbLZwnevEpfOkKU83COsacYhWrsQcUdhaRykHBSZrAibCG5I6x+cui8y0w9FJoK3RC3lGy6aGMyFIQFucf8nLm/Cck0EMF+mMyStAiD74stFNYpyAjiuGAfP+UD0LNGLdOmWaTqWs0UqvRWBhKC9HlTjdwA48T1obwHgYOanpuEwkufegWbDmT0VT91SKSFNvnGjDTM1VEsOqJVXNyHC5hz1XSWofQvhnp/fmJ2y5M78SOV327EESjBCkEhUTg6Msq1evLhGp/LtpK3MlTTPBrdbre66Rx8baWMpTXAcDfkKaxxcNdGFviD1hkLxmKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 26 Sep
 2024 07:38:57 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 07:38:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
Date: Thu, 26 Sep 2024 15:39:48 +0800
Message-Id: <20240926073951.783869-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c74f53-d8c5-4afe-a598-08dcddfe4766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcuj3p1WrIdOsvzUWP5LoD63Ocnk9n0m1RU+gq+H8hTzQ/XhhYc/lGSB2Jrg?=
 =?us-ascii?Q?2EpLL8xSXD1lejQdqGHgtXiUcbO9ex4llCu9S1GpziSxW9C+IMBcPLPuApp2?=
 =?us-ascii?Q?2VecJnYRfPz9sEzKik6jLgzdsHBfBFYomIV6Y1PZbNRGg25N4XkulKKYHr4G?=
 =?us-ascii?Q?zd2vsP3Rg/dXjpYjSsTqkxMakqU2zGUUXcxv/1+ZYK3g2A/VH9D+hcSMcMTd?=
 =?us-ascii?Q?ZmH8bDMVe1sGqMx/mW3P3maKjh75aj+3a2JoPMwWaDzxpN/w7xcg5of+Vex2?=
 =?us-ascii?Q?ieVTvQHoC0Vuv445T63i30G0fbrpZgVdsMbg1WO7JnVKrUOXU9aVXEX5oO8k?=
 =?us-ascii?Q?Z7fo9E+sHxfZRZhRF6iTqmxfUOLnsY5Q65JmhUy0pt3CsbZEcJKM9KEa51cJ?=
 =?us-ascii?Q?kXO2pzsv4AS8atR3iwoMu9f9EvB3x1Ihz8jwuHdN1pXmi/rWBTss6vcMES88?=
 =?us-ascii?Q?UPTbDPzAlRspZXXLaO2lM4reLV0grlvvJFFf8aVOnd429ZEVqJoTNV0HBZfO?=
 =?us-ascii?Q?84JbfIPlpGVsWJhn25yW/p9ohsz97QU9j/Qje/2JoEIdRUgMDgwFtyX6oiXj?=
 =?us-ascii?Q?lzxxvWvj609wd1kyAL6MWUMqgt8Owlva1dV5+Pxnx7vH4M28Jrh1W0o9VUtM?=
 =?us-ascii?Q?lRSq6+xfZ9lB0NFUqtCSNd2NnvWz7uVO7No4u+8kKWQz1LUTtwhclO84/PES?=
 =?us-ascii?Q?VhWqB4qLD+HzSATPtVYs633uYKLlo9Me/khJGBOTgJ44RGZxM1ok+ahB0XKZ?=
 =?us-ascii?Q?HrkoSCzAk92O5jdabQExA4/1EDLtGB8En9Ys3hr6tpmQ41Lxuj90CmwfHF0l?=
 =?us-ascii?Q?DNBIK1O+7+Ix2XnTjEv957UDqieV4N84JlK/DbWaqZ0jWlBUtL7I6RnbW6m4?=
 =?us-ascii?Q?cdGLfewXZ0ddy+k7gJYliyvBL+s2uA/mvdMr7JipdQzK2ST8PQgzIztxyhSX?=
 =?us-ascii?Q?RlCqnBC5EEwR+P0+auQoGHDv7PgOTnJsUa8jqctETQjIMSaB+ZBPYuvO4jVb?=
 =?us-ascii?Q?l3S7900B8t9Bi0nBqXJBy0QsBQuPtRGB9zQ/yobgx1Vr0k80CpPVNgxEDBDB?=
 =?us-ascii?Q?J5wU57MbQCioIdIzDmCSJwnco+VBNXCtky/SLBYCTKFJGejATgBpJ2yfloFI?=
 =?us-ascii?Q?6+gOZUl83T8w7jqAWkYmzDCIBGnVvtLzOXmE0ZJU7mciEhRNj1lZFVaJ3Ayz?=
 =?us-ascii?Q?hdM+tBuuA2sjYCUFUMy0RAh8X4JYXrFRp1RHhATcwSRdGPgJRTb7A7MlLzu3?=
 =?us-ascii?Q?2G9j8m4/NprdfepLRs7kNr0+4HaCb2ugXo1OyqjFwWQ2bxOZF5oD8O7FYHzk?=
 =?us-ascii?Q?FJBeSONFyJO17YcLCAfK/hWg6wJa/X2OhqxqLTq/z5K2xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FW5MIddG5qVYYyzb5ZRpgq4WbIylBG9V0LngbMpd53WEZuDMkyvblOmKL3WZ?=
 =?us-ascii?Q?pAOt722qBIbjQwtQfqWy7VnoOaG12w31OnBiMO2n6iQr1J9a/pap+YxHHS9m?=
 =?us-ascii?Q?mwOJgnvpqpQX+Wx+llLAeLu97eknKwHANeIvCdm+u1+3bdNR4cCUlhohIC/a?=
 =?us-ascii?Q?9rTgDhxOEmdF0ZRQGVAC41fgBiGb89wFNLufgKuGe1cXOzl/9sYstfocfhvq?=
 =?us-ascii?Q?hMuMK52B7jvEIme7RkBtNQ7RIwYJO9zt4BZEdot1fLO/kPcGxpM9MawKqsh/?=
 =?us-ascii?Q?CqfI2USi9A+Y7/X9nGo6diO0QrgSfnMpaIkRUQCdKPNBH2UNTqB+Euit6bOT?=
 =?us-ascii?Q?ajGFjbA13KTOAbT5lsPFoBMgWLxfpbY8BQ/SFQlbguqR7US/EUKybaJgpjnC?=
 =?us-ascii?Q?FxEdkv1RP1d5qGoj1HQCrqRn2mkBlNpYnYxfr4O3/iGAHil6uUhJDUycQBML?=
 =?us-ascii?Q?qpBmJMWSrxIxm3LL2kiP1of9HGlwkqBlBsFAlmSUjVkcp3/5MzY/B/lkzsY3?=
 =?us-ascii?Q?EGMVXSMCZKZASdDwNRLeNRoLfXgjH3tsSMhMDFObyeRMZSEgguKAc1Y390oc?=
 =?us-ascii?Q?vhAvJUOBjj5QgWTxHKd6RexBWUiLt5zou7FIAuFAT3MF4+coBwck9JKgzSsf?=
 =?us-ascii?Q?lolDj215q9uGbqSd1b4kfOnuziPfeWQZvyQzcNXwBeYYOFtRUSf0eEWyEZzJ?=
 =?us-ascii?Q?9nb7L4fNgQVCFGYQVP44FkK/T6IrUREAhyGz2OX+XS5yf9aDPMx0MQE9UtYw?=
 =?us-ascii?Q?6JABurg6wgZODnytTYbAn4eKvQUnZzEUat5HJrr5WP/R1+cuw+4tIlbDvCzl?=
 =?us-ascii?Q?fQlfXq4nPicUpIuKLiL4oy4+RfKwmLS2sHI3GVdZ19XC/zO9QwWcmVI6Yks1?=
 =?us-ascii?Q?5VzIhiMte4Sl+yyJKarkLA8thtAALyXvR5nVNgIeQ15259C+mQgcC+8jWkcq?=
 =?us-ascii?Q?L870Dcqqa6hZti0isLxYuL2TiOOnQxO1vwbVq/zQF2+N4ykpdhtzEoqpNlEF?=
 =?us-ascii?Q?0vU72oWdUNXogh6BaZXA0SoemnGpw+2dIlNrxqRG/yOo/wz9FnTyMJgI7Fs/?=
 =?us-ascii?Q?cbbainwQc8GTDeXpCsZWEwpy+3ocJQJ4EGfSa/1VmDeOcl1aAy65cNiL+WIk?=
 =?us-ascii?Q?EoQVBMNmVcOEfnuw+qNKKGFBU+q1d3FQh+ZIvlSoy7laF29LLisuo5Yr4/y/?=
 =?us-ascii?Q?wrB+5GYXg7vDkKrTTB3DmGjQVcXJwa0ovPbo2ecj3GjiC1+rV+2YMrmZxN4y?=
 =?us-ascii?Q?EOCZr1Yp0kQ+8JLVmV8rPmfBCNyHLxYLqkeyvfPd1hJal4ILVYloTyriuj0H?=
 =?us-ascii?Q?IXj7Oh98LPQ0SapKLOclPwzg5khIaHr8P4cmD7TMEkCeH8xGW87MO6azxKBZ?=
 =?us-ascii?Q?kuCRjWvufuygAc1ld+ZuyDP9xqUm8ZvgCVBPfwlg+1o4ZJ6xVnqkFhI1edRm?=
 =?us-ascii?Q?pSCr/ePxokWl4gBgGkuf77I6CpqpmnuQulUXoGHIH59cSbp/yP6tqRyuAULE?=
 =?us-ascii?Q?rFcVQ06OZ2u1L36CbjumdcZUBTPyY+EsDFLJNGKHA7ycdbJ9/Jvacy2VeUmr?=
 =?us-ascii?Q?poSF/FQLyJ9JY3PMnM8TifV/ejjgC2BXq86IYy4D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c74f53-d8c5-4afe-a598-08dcddfe4766
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:38:57.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mx/YMztHryEU7QCDmJ7V3Y+MTdd1OwjMEsrtwdq7PXU7LK7vH+rf60wqcChd4hxSo/KIMlFm58alkeiDKQkPaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763

Make fsl,imx8dxl-usbphy compatible with fsl,imx7ulp-usbphy to fix below
warning:

/home/nxf75279/work/linux-next/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
index 1e02b04494e9..9b114bed084b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
@@ -138,6 +138,10 @@ &gpmi {
 	interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&usbphy1 {
+	compatible = "fsl,imx8dxl-usbphy", "fsl,imx7ulp-usbphy";
+};
+
 &usdhc1 {
 	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
 	interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

