Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CB386328
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850121; cv=fail; b=WDayjTfEXDMenkIVNQbLpfBQgGY6UIIKr1jDVpFHnBGolrw0IkF0ZKyRuFw0e50TrF1u40g1Jp0X8X7o6h+Enhx+2QI7cY0HsOyHu7Hk198k3kHRTfZ6KzBmje0qPa9Cdjmk7e3iy/xw3+u5Dlvf5VekpEPFb4LnBHSsa8oRXeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850121; c=relaxed/simple;
	bh=OMEp1tLXijk92yt3Mqb66CRPp5Pe+8pEsPEA66BnzpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nxQCrj+12Mt6mYOCSB4OYwVnCPQSP0pnPFsGEImRBcdgCy9r8PI7Bbecqozu0JgrPTvoUEF0XI2tb2i5fj8tGe4zbsm21xDvGfFylZYLHOhb70LKng5VxQxuiAZsocydGTZuDOzur8jXV6nlqhnmrimxcUiJe5bxRqhvl2fhS8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ALjhXpPt; arc=fail smtp.client-ip=40.107.241.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ALjhXpPt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hu+9hXS4yLaZy1g5cTzVuM/OllIIz3k8KuHusrRUki1f3Te06LQgsWRTEq26zKZ6/bgsT9To4MmC0qhoc082wuKHar7VA4lPsCRw4zx/jVEjnLskI8qqMT21SxRmqVeb8itW0zD9ts5iywpQ/TcNeNQgwuUHDMkTd5Tf5KWPrce4EIvBjz6BoMbk3VMDzyDDfN4NzNou9Abyl0KQEAtJu1YUIFQtXrZVgFu/mjvwla/Gt9n8yCPTgFEr0z//lDGcYGQ699xJyGSXQW+LyKD9da8/GhZ3Ldo90WeMbcQQnjF3WALJpMj1lrxecyFlvGX/6Sr7xb88i8mpgnMiHLKwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wBRPH5c3DiTOSU2Dvz9vKmECjm6puoZZe6rBLIrMG0=;
 b=yBYwN14B984E55cFu+14ZI1sqB4tTKU6vjbYnd8OUPIjPSlSGlX1hsojERLKIaYQSODDjDYFN9bBeYxuSeErXiE/ohuUfNiZ3mBkag3049uvdedfjXJ0z+1Arl3p9bCT18uwSj5yGQRKeYstYmxUYxcI2gtR4k8I71LE2dPuB1upLNRd3Bh6ik9bJoa6z84vYn5fY+5NUhmFP48YmRgf4MH+DMKy7lamZRVUhjshOQvX2mDl7rzIWC8H+oYFoY/VPU1K6umR31zRb20YJSNqVY3Fbz8Kmu2ZMUWK4hdTaDqvWMDs0mNHCwk+4I6GCDGg+Cc0hNKOe6Y8ZQ9v3rlYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wBRPH5c3DiTOSU2Dvz9vKmECjm6puoZZe6rBLIrMG0=;
 b=ALjhXpPtGhreKK6iRo+kE23CsDQ6gCLEUE7fmFKTCMKT0a5Fw6ITRHt0WkyyvdoYIigPGfnducYpQ5N7wWj1lNDC8fKgiJ5pv4xEM7MouI+RC1jeV4TqwK5vgA2KKg9Yo0bBjNTa61ycTW4hL8jtWu9und3z0xy/6CJozMx0A8kVF6lQrJBJfYmd7HGz0yXE1hxR96N80IN71jc7rA5De5lEeavmUeQZDMFL+/WZqg88bNc3lYMjDXCP9yDewZzEa1BbT5YYI39opJ7bpVL8Lmv/mZoveMZSIwtQo43SYyjwloMGaXmnqiukS0Qh7eCEhydl6gp2FeEhavGuxD6H5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 07:15:17 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 07:15:17 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCh v3 1/3] dt-bindings: arm: fsl: add i.MX943 EVK board
Date: Thu, 13 Mar 2025 15:16:26 +0800
Message-Id: <20250313071628.729168-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313071628.729168-1-ping.bai@nxp.com>
References: <20250313071628.729168-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab749db-1cb5-43c2-2025-08dd61fece72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kFem8VN61y0NyrgeYzxOcnDMkmPHPKqL017ScoYWuP4bRxPHKrKN4qB96eoZ?=
 =?us-ascii?Q?YPblrU9hBmbzjEx9wc9q9062xJP4Lwp0gOImT/1GMDDUIZvVUnB7z5KRwYI9?=
 =?us-ascii?Q?iuEPMPy+vTAI9KQ7sY1m/PN7eO8SzDIWe45CVgAjrk+ZzbqqfuF5aKH8N3Sd?=
 =?us-ascii?Q?S7nQ6LBrRmhVq2/wnlpX0nY6ZLA+rfaAo5DbSm1sGSsvQYj5jANcpyQ3qaxb?=
 =?us-ascii?Q?GVaHq7HbnqvP/99JeiPlj0ohvm6GBwiSzMItv/lRZyOCx7tlcvw/Xl2vqoDU?=
 =?us-ascii?Q?hpSU38fBvo0alBx7l47l4VWJdhM21PEVa0TFXeW8FKIdMxNpNFQQW0UxD3ww?=
 =?us-ascii?Q?3zsqqVySbWRO4W6q8u3fOM3i2UdRgvg4yx3SVQg9R/Ihm+PrFil0P0mgYmK/?=
 =?us-ascii?Q?ikyQRI+kPVLOHYiEnNoao/Jq3ahQeCyNBiBDi3AfeumamlmJv6zXuu/OSiEW?=
 =?us-ascii?Q?rgXhueNw4fgYC13jFC5ZqQkzBXdc24aBMp42Xk+rQyaZfL6LzuxK2H2yX5Y9?=
 =?us-ascii?Q?DsuYyQugeijUY0E3OiWDvHAzRh2rIw3tgFP9FTHYvhPYn3N6LpvEcxIYu9sw?=
 =?us-ascii?Q?cE5IPPcKSeMhrh8AdueyHvT/zn9bklp/7DfjpTz7AdyBv8XvwANLdhvuoqJp?=
 =?us-ascii?Q?dxr4OH1JH+74l+DX8ybFq7rieDCzVUzLYK8chtCj28QuJNJyNfHV6mtdqAgf?=
 =?us-ascii?Q?29lyrgI+NpTbZK+77dmlC/JQe6Sk4tNrBq586t2L3G1IPYEI5gcI8/6zGEUW?=
 =?us-ascii?Q?t8vMp+4J4Foe/b8SfyosBx3dXlUiWtDM+4cNKtbLx+VvxvxyOaEY8cad9ze9?=
 =?us-ascii?Q?CnSqVhtAfD4JO5KHvb5xJeR3AZlblljRHZQOp7RHz0vd0F0JW6DgKwPgOcfy?=
 =?us-ascii?Q?PVVTTnwEQnLDaq2k5GCqaQrWfFG0B99/8jdg/xnYS0RCk+lLQm7KVuadDDUT?=
 =?us-ascii?Q?PLkW5Mzsw9HrG/6qRGIEltP0kPNb46B305go02TO1Vb36WZCEHZkX5OgaITN?=
 =?us-ascii?Q?MF5XYPEtiAI5M2t2H7WFVP454Yuhlahgw988vKrLbCo23/U4qAYzp5UqwxdB?=
 =?us-ascii?Q?v3yQHHDqhzHWRP329jeqF5VcHstYmjgdG7p338MWOpMQq6hv0F4ZXlxRRXPJ?=
 =?us-ascii?Q?oRwXzWzKdlcRUkT7dqZ0eyGYWohG7CztukvQrlEZYpi4sX7FCTEK+Oey27eU?=
 =?us-ascii?Q?RSSqxNde0MsX9TfsFmeWjxI1HYzuuFYiPoMk4qlFjrwWCDOkNZFfD23uQVDm?=
 =?us-ascii?Q?I+J+F2CLwoOY3m/gulItAyDhTpp6rKA+YrCvQwbYDTBpl82w81AnTW0BrEBk?=
 =?us-ascii?Q?DtR1i4aQ7EG5aNEIktYnVNffU4sKBMJ+6STcN/V1EZSjPTPFFxiCq8E5vI+f?=
 =?us-ascii?Q?h+crSvGcyNZctyVNeo52VeLxfsbdgAnwzHjmNPHANQjGZQNJP8h7x1NWzFGV?=
 =?us-ascii?Q?B5gbMoUD/htmECNG9mId6aZ+/LPNdZQz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x0Fq4titUH+xfYrmEHPVxST60nufKma1n59tjhYZuA7J5Pn5q5890LIJmGP5?=
 =?us-ascii?Q?KFhFdXYTOTXLT8HblyqmZipcwgT/aJpsCr9QwalWacO7EP9DF04vUBTNBY4w?=
 =?us-ascii?Q?cusDbNXOsc0DHqI59DtIyYgHZaoeX/Ju4AFaUEUs+ak7zycO2GpFmhHnwvYC?=
 =?us-ascii?Q?vNDdSBBJv3sgXcJX/gqhUxtJ7F1Oy+x0Ws9NCXpZ3yM8cS4gBeHco6bvW0YX?=
 =?us-ascii?Q?DKT0jwNsbB3H4teMoTKgJlsaMwsBChWO65xFF1P0C/ND1IWNEjKQYso8J251?=
 =?us-ascii?Q?GgDFJeEkiOE0UcqWsvq4SmRY89+FHyZRSE4J5iMdbTWFaSAMUjJlmQWaSTdk?=
 =?us-ascii?Q?TzVLMcFd8KlZu31Y57Xz8Sl5+B2jJ62VI3BPjaMHBnTyeV+BGOd8RU0xs+Aa?=
 =?us-ascii?Q?zvHEQGq4SRyH43zFbn3FXunRwlcJuwqEy8x1E+VsJDrL4UKugHvYoH59RNZM?=
 =?us-ascii?Q?N8KmKHYplEztU31dvF0l+jBGrxjK0UtM+pr9hn2RavFax2G5Yq6uenl6k4Gp?=
 =?us-ascii?Q?groi/N5y3yPglHDSPgMYuwWPJcckcum6T5gec63oC+N406bRR8nJhEs/baEZ?=
 =?us-ascii?Q?4PROx6ZSfcrkrspyM/iTY7Xi/0ns/vTTFDhnBh+Verx70Lcv8qzatqn4VBvL?=
 =?us-ascii?Q?yXBKfmJ2dgYWV9tvfezUwv3bkheWhVWru4Og6j7aUJWZj+IJT6wX+e/bDCxQ?=
 =?us-ascii?Q?or8s9dolkPQgPpswQISJxMqYC925QJOMnptjJ2mxJIoVZzHtTUREpYEiEHRk?=
 =?us-ascii?Q?yHY1z/SqRvVG+mYIDLBF06wKBaNLcphlh4BAzXMhuvsMNyJta0lRbPUEZY+S?=
 =?us-ascii?Q?+IspvahrbxfhWFhC2mkylpY4Plwx1TO0ly4KvOBjhoE73y6J/WuC71ZcdTHB?=
 =?us-ascii?Q?MH5INhpgUHg5pY8b7anbb2Sk2d1OeEufa//m328i0leworIX8wLV+DUmFiss?=
 =?us-ascii?Q?cSzofy6nhUsvOXrj1e8arrjqoPoN9WzKYGsQinF2tQnvXtJ7kMncIj1vOXAJ?=
 =?us-ascii?Q?2gKmpO0tAGVmFIRG8B7G6zxvCOUHoDbTAdnAGJakh9PSkZiR150iZ4xTPirM?=
 =?us-ascii?Q?PALQHpuNK51GgEw8WYs2B157kp73EyFud1n8+f5Xu1cEmzTFNN0tqRxK7qEN?=
 =?us-ascii?Q?p7BExsLhTvtRZciozw0KJVMCREJ9jhk1akhrclNFUWwrKIoxgvKEh7LGhuk6?=
 =?us-ascii?Q?R2Th8LDT7jmkLYiyvCdvG1Y8O3Av0t6sqnTCAPr2X3CteijaPJvhoMcvDIuZ?=
 =?us-ascii?Q?PJFCq2ky5Pj/U3659xL0wvU2euluvu2MIGuyOTF7l2NpqFACiXvawa1W1SyD?=
 =?us-ascii?Q?cSgCgZKxfikukPLjzJFAvpY2UuLhTHtd1rDvMLLlk+ExqYNUsG+Ab1pcbr4y?=
 =?us-ascii?Q?0Zn829GBSCAv89sRUu6+z2lQJoG/qT8GlDkS2JLo6ENf0plfOl84o1aO2+vK?=
 =?us-ascii?Q?ipU2b2/NQTuo1htjE9sFXfVwhzN/pK3xgYnXnybRPwuGbjJfCx43IgYdkL1L?=
 =?us-ascii?Q?Duq1m9FP+cRo0ucygPqv/RY7e9IHX28UYXq4Gwn7oP1LVjfLkF80OQT9lp3x?=
 =?us-ascii?Q?J2G37xIDuw1BeTN4D4wLngpLqzYpI5w2hU9OqBfl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab749db-1cb5-43c2-2025-08dd61fece72
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 07:15:17.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLG/4nrxMWU1m0u37KVa6xpDFtBeEW9rGGpval6QhEw6AHBLwJ0z8zaYc5dtTHTtqo7C2yphqUkzxP0N8AgjNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228

Add DT compatible string for NXP i.MX943 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 - v3 changes:
  - no

 - v2 changes:
  - newly added
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index db781d315698..5b58c23d3c97 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1353,6 +1353,12 @@ properties:
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 
+      - description: i.MX94 based Boards
+        items:
+          - enum:
+              - fsl,imx943-evk            # i.MX943 EVK Board
+          - const: fsl,imx94
+
       - description: i.MX95 based Boards
         items:
           - enum:
-- 
2.34.1

