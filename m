Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367FE2D2488
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258101; cv=fail; b=YL016UAhz9OQhpf5NLxIdSHXOVrvaO3APGoeXf3gahyOtEENWmy830zHgFTjT2YD6bPlIaUuNffp1xsktvRsLBLedutjadMr0LkUDjgcrXN03ol/5Qr6R69SLD8357b6Uq0RI60w/5rz6p8z9QtC+No8ADneu1nJh8N+0T54JX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258101; c=relaxed/simple;
	bh=klVBz7MYgJkgh0CzOF6nNHIG7I+cwvY++EIqnAEDYFA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RoftZaIOdZ540j3G/YMi5WKw/VFImYK4VO6g498NLph3bh608n3fXOuKBlRYrLfcdMWfKBcNnbpg9Q6wShU7cDs21A6Jhsur463AN6bO18DQG3FmGJ9cNi7JTAJVC8X3eUkcb3hQMamfXWMV2xkr7sO+qqJl5pMC3bUjEO1m/8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hEJupZ2A; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hEJupZ2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9pCgTTBFYOCQIY+/aLg95GxAu5eXLdThVj8QuVQI6oOG/YD35iPr6SErSfclQzrqzU47PwqQor4FGTQ4JFWdeUh+/3CDcFpmy6IXdO0UwRKprKyhKKcAA1zw9/ltcoXwnQh6ly/eccJGb8SzxINO330OzQgRC+MLCFjI8xKlm/C5YMkX447meXIiMY5Qy3wY3YzP0/ZYXgNGylyQDD7F2AcKXmOx5FkPkaHF2DxEzsLY8nwbTYxxSG+OkSJa3To8wC939rs1Kl6QAOVN0ZwR4Uiv6fnPfjKKxPfPduuAwYKvxh8vlXvIK9ltvuKhIh0MtCI24xemKN6lxdq7Q5giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx5OAVoRNfgznJmzVqbkcLZPjEpaCCYtiI0yjPvJRO0=;
 b=rgzhqd4+YADVEdzO1GHTmIVY7bOI6kJnvfGXtlmcYWa2q6z+QGffjEIGJ6c9i2D2fya6MKai9XUuG3ZXHdOhy3ROCBy1qwWC15UQJ2WE9AcyDnrhLY1DlCPWEcOW4REHJ2kG11qhGas56vN+lhB7x1yk6W3bDr9P6yUN4jXHgaFWSsIAiDrLM98ZAcDmQUQvH6+teUf5H5As0sd34diIT1rcNTB0QoNC4JUod3CUSYPeLNPW8a3TI0GbcM1R1faQRAwtqIu8wTYIjaQRWoYv3EUqFvOwDqdieuo61tN4H+1vOQwSTX0j796LKwnHzYpw16NeA6GsPXZLCYG5AJ4qIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx5OAVoRNfgznJmzVqbkcLZPjEpaCCYtiI0yjPvJRO0=;
 b=hEJupZ2ABHczapTmeb1v1xtN8pADHQp4X4YggNlkDtuZmxETUV8JUEFohmYeJyQ4hWTlLWLZrXwRxWibmnlIgYQlVnq/ZM7KqLAYtm5YWn+cUMTCFfEFvIdQGSPewDBOFDiOE7+ep9DnKGn5QXy10ZyfkqN1PYuAlmDhnwoNnnRAqIR1xA2W/dBUmMWLhBGfiAo40nZohH0d4Iphz0cAJJr0OtqxxQ6L244JCKJN4nTDDP5UtMG6zEIVY6qlvglJMTfWq++enWQO1Embqwfn7Sk/rkegeETj4ZFg3/Ki7r9wxwiNrK3UrNnAf/tyXfF8bzkMZmUWowNGNyIWs/EaDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11022.eurprd04.prod.outlook.com (2603:10a6:800:25e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:41:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 19:41:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v2 1/1] ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif
Date: Wed, 11 Mar 2026 15:41:11 -0400
Message-ID: <20260311194111.2918037-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:806:126::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11022:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e8b93f-645c-4465-ea5a-08de7fa632f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|19092799006|366016|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	WxpLzZHJQ+eb7sXh4Gik1jqxXRgkxGNGSJrINljXjZh88WWMdDoHCe5AN0em65sWtJh9kd72cXV0qLVs6rb63xaubhNAzOuoK+fKcnArvMTlk32BK5nwJBcD75Pn3nXLZaTz1fJqghrigAe5Per4Ul4L4g19VRBUIBUTwbvTnFuDjLBRfaPdt4D3eZTaVeFUuphoCjlCThw14NCf1jPvOEf1vItOEMv6bcDRsHVhOFprBpspHNH8TvWtYi6BxCGaORyfKFFeOr2XM+l2H6KlAfXoAA/eE8ZP6XKgD1dmYC/O5TN5TpA7Aa/eFr8LeJLPh/kCcv6Qi3P2v1YUoJIgVF5PNLaiY/PsuGFND8O3bQCWrRZdMMzt2Tq6QjwVUALiFHvGVE+NV5cmbYbKO9sFoHEN2vHCILOqnPbp3hCHMU1Vv0kxSo+nOdU7H+vMAAohWN5yJzrCyEelpfpEwXbhRv6LPOkx5Re37RGQc4YSzHwqj79aCuBoywi5JQK8TlrL8E6Td9FW+LSeTW1Je4hVrE37GoyxppJetTP//WPC2YlvewNKfsMug95K1ZuZZkpGdTLPWAfG7XujxFUa/yKvIaF+5ynBywAolv5Dvv7Uu5/kgRg5a74WCxvy/JHgCanYhzW2Syg+29XqtuOylDFRc5vFIZ+XFQ/RSg8zA5XQWvBcqFZzLOZkK0aqshGWL7ZUYykbE17V1XY7FtqdzkfpfjgHhPxliCfunHWblcTMLH6kl0hjGvnDN0uj0IA+5yw4RUWdRSuIYzi1KxvSDZGCSiy12cji5c0q5Zmn7Zc7Kw+06Iwhjqw7bNzhPJAR9koG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(19092799006)(366016)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yv3rVSycnRiFmt/K9PAENTlCEu3BXzX2G+I1BtXLCzLBbMNoXDehn1fR42EI?=
 =?us-ascii?Q?YjchnrAtxv5bJrpgzU0C+7OnwVatFlTSBDigKINti+lxAHyJzmNMNbwC4NBD?=
 =?us-ascii?Q?MjkZ/Meyk8SoB22ziTLOO2T1xtMbKl/txUnoQfF6p36nyr3VfDcg1KMdQbfX?=
 =?us-ascii?Q?1TA6etbWm0a5suWK5A1DeeWXr9vRzkBCJHEmS4j8lGKQ8X7gKkc1SXDeg+nC?=
 =?us-ascii?Q?BQ+UGAdRC45LyI78IFkWUEsTOmDYQ9jx1kEZLJBTGtZvCaKijPVEKFbMw11c?=
 =?us-ascii?Q?fOoC/tfRHh4FhQKE54J4usl9fsEqz2u56TaqC8qCfiIYeZO8T5a8L8/TTm3e?=
 =?us-ascii?Q?Q2xyNMO0gu/87i2gwNml0Hky13cxipxdXpbuBQdlQAxz+8D4y92C4Q5Cm3p0?=
 =?us-ascii?Q?lQfKNFpmSjhVb2HohLTs2JRod+EFr1f6HpKowqpoQMLwdDq+sVHxpwoVEuRY?=
 =?us-ascii?Q?TaNHKsJHhKtnX/XLkCKj64b1+6JEa+12HosfEcH7hpIY5lBNo8O251uu4HMx?=
 =?us-ascii?Q?KrS3Yd4OHxSPYVtw28NeqDuVBSqMBJQxj/OSMOQt9cyCcrA5ePBDPKKkDhBb?=
 =?us-ascii?Q?Qz78NAYYJxcngm9yk8bCVcXf8n62qep+eKUyi4Rcx5VJfiHO7j9Jqlp/hxig?=
 =?us-ascii?Q?d1WPYx/k6w1n76aBiRF92hbq7m34B7oHR+TVkZtxeFBKUOA8C/8Ibo3YvUu/?=
 =?us-ascii?Q?F0xpdDr7l3PQI3eF89zg16qzdaUCdL/1CG8ILdlb25U0jT4JQ1QySRpmXuFo?=
 =?us-ascii?Q?HBZFrfNt4nqqdFU3/mWV43bbgisL3/uZlQB5Wm6DfAHHMsod5Pv3OpSUVeMu?=
 =?us-ascii?Q?W73lUSQtNZRfg0P8xum3j7H/ZKrZn9qw34d4XXB+8ukZuhBLEg011L1Xcb8L?=
 =?us-ascii?Q?IEqMdk+dRssU8ePMwDNxBA9sXt1Ln6qgRCq5b3e0Cb2uoFiLAj+bAYJ1CA8t?=
 =?us-ascii?Q?tWo0sUXc893qO+Bqt7gQnvhAcdys3aM0xfUQF8Rjgl+fQvaqpccH+PJVQo3j?=
 =?us-ascii?Q?q+yMUbP+8qVZKZydqxK4Zpmm4GvV4aNhVD8hF2BybZtZ0NFAQx8U28jDWpnT?=
 =?us-ascii?Q?QuNv2AcXetGyGsueAz+Wd6bpD2STaH/jb5BZywn06ElAxG2VSJnxrPr06gYS?=
 =?us-ascii?Q?uVNc0lnJBNrznWwQxIDIv+Lyg/FAOtmPjq/ewJ/L4G6yEUTALUJZSCIe7RZV?=
 =?us-ascii?Q?SN/W7dBq+9jxka3X2C8YnlBWAP26R9b8w6q65wyjZ/M82X/Xr//rkic7CX/T?=
 =?us-ascii?Q?EGHK6G2/MPdy6P2V50ZMJDDsgJoaYQ1jt3TeXBd7GJqzlOJSG8pJcy1H3E/i?=
 =?us-ascii?Q?Ed74uWfn0nopmT8TOd2YD4wO3IXf61YSEvx64YvZJ3RhsUUckGE+78A4XLGt?=
 =?us-ascii?Q?HeXuv4uC8uxTUjUsny3l+tRHFYgA3g+iyhouF5v/sMO8lFnQ0+9uOGyPWIGW?=
 =?us-ascii?Q?ZspjNRow1UyAB/o6p18/0U/nu62t8mzJOiAI6SMUbm13Oq3eA6hGJfMJFhsS?=
 =?us-ascii?Q?BQvjZwmVOFz7b1A/Pnci6ONFypyB9Nl+XElLQwyQYYtRzlqZYPmiIy79ZlZK?=
 =?us-ascii?Q?6L6cVqdp9jBly2+v8le05jZl8+6wWYStjbZXzdyhqxac2EA2Gs3VRoIUCPfW?=
 =?us-ascii?Q?cBniD3oMYrmhARdvo5zBYKsG4WUd7LLrnn5N5RakMDrY6Gjn418n2fH/OdAs?=
 =?us-ascii?Q?t09UpTqFgUtrsEvREyp2QQqRlpMjU+z9Rg+eaNrkzdWOvG8nnR9Cd9HWvXFk?=
 =?us-ascii?Q?d9HFmhN8UQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e8b93f-645c-4465-ea5a-08de7fa632f3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:41:33.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mW9Y/g0xBXGMnKpTAoaWlRST/uwcbM67WMHAdo7krXgLxu4SwB1/ake/wN+kGmCDlLncwIyEaeWBJnS7c44iYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11022

The i.MX6SX LCDIF is not fully compatible with the i.MX28 LCDIF. The
i.MX6SX controller provides additional overlay registers (AS_CTRL) which
are not present on i.MX28.

Linux has supported the dedicated compatible string since commit
45d59d704080 ("drm: Add new driver for MXSFB controller").

Other known DT users such as U-Boot and Barebox already support
"fsl,imx6sx-lcdif", so removing the fallback compatible string is low risk
since this device is used for display output only.

Fix the following CHECK_DTB warning:
/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
        ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2:
- update commit message to descript ABI broken judgement.
- Have not add fixes tags because it is not user visualiable issue.

Cc: Liu Ying <victor.liu@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Previous Fabio Estevam work try to allow fallback at
https://lore.kernel.org/imx/42eb2d42-47b0-46b6-92e9-c59473113c2d@nxp.com/
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 1426f357d4744..aefae5a3a6beb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1304,7 +1304,7 @@ csi2: csi@221c000 {
 				};
 
 				lcdif1: lcdif@2220000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
@@ -1325,7 +1325,7 @@ lcdif1_to_ldb: endpoint {
 				};
 
 				lcdif2: lcdif@2224000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
-- 
2.43.0

