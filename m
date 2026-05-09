Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA127E05F
	for <imx@lists.linux.dev>; Sat,  9 May 2026 01:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291533; cv=fail; b=uxgs50i2TP43J5hhnNhxvLTd59XlbqMYfFYkUQC2YBv5QxvD1Tw5ZttImVjly4mQF9kV8cjmFAZcOvYlkf/cbSq6CWxA60csbm4tsGCiB8B0lDnHWt87vPBvvzfUuKkk0HVNwlAsvT78vSU8FeOJJ2yGnYdJV7BfS8MEGd2zLv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291533; c=relaxed/simple;
	bh=O/zmWT8yWdKTjErmqsGzNPLKnKJ4gKnnpP2PZ6GhWc4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eF/v7ZnHOSXWqJ5urS8CY9gr7lYeP8UP3bMpkFfLc/d1kMSPXU8fprIEVnEs4wgY5qepvFjhT+SImys/Dl1c2PG7hK6QIBt8nmnCuJGXUcbPoJIDaMrCc46dm+m212HPEEBJByqP9BL8C2Nfjs+uX08I5/q3Qyfo3PYhI/BoXjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YpUNJwkE; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YpUNJwkE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyvgdB1bVk+GrHf93bb0L6umbSILVCVgF+QZkCGPeTysZoDREl7KZ4JHulxGZgOYOjqWyUaaPRZRW/mxyKonZDiB14+735/wihhIbmwYIaGksn/G0bFHLGHfHHGpN4VVvAsh6PvZ23vaSzrE18K0HmNitMpUGrgQDjXeC9iEF+mytgDA0xLlwVl09pU8fmCUcr50XPbFMsq/9Al+d/KWwu8fPRWVJCicmsDzh4us5hNSjR5b+iRFroRHuCM5qfFfuV3TVW89SIV9PVW7b42NIWA0XowP7WgoinZznG2YEkS0RuIVoY06hS7XEQxXNCxdCzWBpDZILuDaVwLL7M1K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgjmJeN3DRBZXfeI0Fm/mkQkblj8Nrt2vmNxgYZSUog=;
 b=TLXwGBCFmo0YRFkXuKe8JbdSKdu7qh3nzkkvPtA4jsMeCruModb/TBuzha8IN29svfPiWkAzBcPIWri395JtNACa/wlDhYbrxf4nQ+z/Nhi0cmjckUAmjk8Fh9NSg68jucO617zW5Wcs0WHRynEa4F7kGcu+/N49FuenAhFA8cwhHg7M9/iFTLmnMbViBBwvDcG35d6uwLvDGz6Jyv7djVp3Khpala0ITyxVGfSCPoQo09hkwpVLKMQMUrQsyP8Vy3L71zzt5CSSk6TP7j39LNMYkSAkM15Xs92Gcw/WMNeBJ2risBey2SA7krT/SN9OCx4tRXltrvLg7EAPt1NR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgjmJeN3DRBZXfeI0Fm/mkQkblj8Nrt2vmNxgYZSUog=;
 b=YpUNJwkE9ouwLhKjcvE5aboe33/uhuNdlUuwOjTOmKSIAzKBGxLOzcIbhErQl4JEcTCT47sgwe53KY4MyPMsFN4F0XHMVO31Qbgvf1dnYygSaqkApIlWEux9QU7kmChpTxxNTWB0pTe5shC2K97eRle8dL+AzocOiw1oFiwEbh+5RCGj8k3xFZkoXVLBEn6zW7Ti158WINy5tnWhOachGg9MeWLPMPR1gFGziR/Sv47WIO5kQMj2/j+jiRyhB9vpwjOgJ3PbNItZW3FafgGYRBPb9w+f9zNjyEUId7SVRbZsIuGc+JTinq+8DUTQvxeEvpMLSdetbOQnwZuFKYI/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB11027.eurprd04.prod.outlook.com
 (2603:10a6:800:276::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:52:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.016; Sat, 9 May 2026
 01:52:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
Date: Sat,  9 May 2026 09:54:08 +0800
Message-Id: <20260509015411.3218700-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: a0315a90-fb71-42f6-7655-08dead6d93dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	amfM/cN5uABK3KfU9EQKYRkvCvuc2OljJmuMRq41Nsps1++TxFKhCoKC5WWjfIehkcVLgRuK2cZyXpgISduf2t52+KlwZDLDK2oCggtl+GHuh46oYC+FFIHmzh3V5NcIi/FxW/8XZTLtXAPzN8kS3EUjIf2/VS/Vv4MtBapBJ3rw7/Kjmdgl4ecf4CroN52Zk+Pl723lrUPtBCkyYsi6uJuEEH0NtAwPPkceqQ6AZiAT17usDgSt7JRaFRjzR2/DorIkTWB+xM6ef4nvFpcwbIhAc0EYD6kiQzBgh5nX4tcFH8Okr1MJGdlGK2D/evvMKrJrZ53APQQBhtqBrjZVVVnuAhdoHWD7/sUkF2P6BCA/JYOYjNk+uAMrrb4CS+HG9q4UArsKjV6xhcRiwyFVJXTdBNyL5P0ISZTIUg9XJRo4R0e8/lAx8ZZ/kkLQHC0iQRa3vJQF6Tk1mhGsT6h6Ygw0kaSPhwqM8jMH4nM7vRNrzqNzGPWuwjul/O5WQoUC9xNbrmc2xsj22OtS5RTFs0xBYB94NL6ZW8LSkLM8gltfsNcXLA2cQNn3LWor79UEjN7DUgMEtKPph3KUAeEfKjdvtdPw9BlVLhHq/GNyInzOy8AwGF+tT4EaMi3tG6luG4JTICDLsRuWXdvgbMIr14V+09+vjPfkch7P4srDVAP3MyI1KEePgRE1+D6N33a0c9nouZ4vCYpkSF3gvvlbG/NbBMnTvVVeo2lBenNWyy/XjYJjUtY4KPnrofXJ3VQ7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jrzMF/nBfxwh8df33nzw4i7sl2i4oLfma2q6sUX/TwYDzBLQhNlm67hYNvB?=
 =?us-ascii?Q?pqtc5JcNMUpQKzWY2EhzMY8gKDnBPY4dpm/2X05OvKL78ytOASli/5FKuKNz?=
 =?us-ascii?Q?p/SI0E87ot4HUfwtZBNkVZ9MZo/fi5t9mysnIfA//HU/JBSNm0nANEFWTliG?=
 =?us-ascii?Q?yBUJaLQ/jJHp6C08wT3Vk+faIBCjVBCDfLldwYy8lAZ0picabz6Z4dxCg1+W?=
 =?us-ascii?Q?GbnGQuN/tOa587OGpmPAXiWiPB6AvGQmZQk9KtZ//x/VJbPwdSbDQnQjM9td?=
 =?us-ascii?Q?0+CUdYxVqsHkp6p4Zd+6dAMiLonwV6dFYLuDTpL78AiXaMX8s9Kt53p4caXc?=
 =?us-ascii?Q?zjSBPmqAtC7MORBkmDtxK1gc1gCtEjIfbxP2m+BQyT2SyScYKjyMEhGJK+hR?=
 =?us-ascii?Q?93hh0tYDE95ghTC7d0v7gncJUj3PJRVRgqp5zHPs5R8NttAz2SkprGeygSbX?=
 =?us-ascii?Q?DV2njx7aPmkomYDqy1iFFfIKoWQAkk2jpjOEnMatOpn/71y4bNy+WJSYlgLN?=
 =?us-ascii?Q?06oF003Bi0TpEP/Zvod9IEP8Or7P4FQ8+7u2vPIgDhEdnq7/x3U8ZQwd1ZfL?=
 =?us-ascii?Q?I/flSXnQ24pTPmpPiTISa6hUEikHqFhqmGeWWQ+Edx/pa3RFrvSQudBvdg3r?=
 =?us-ascii?Q?B6+NtbSuCzY/mxylmJcv4LwofxNmzXOuGngkMVlul+fVLb99ZeVG4zGVCM6f?=
 =?us-ascii?Q?zNbXNhlh20m6mH99HpXkwldipduhz2rAMAtnCywfbJ0eWTxh8JDNcxdxooPP?=
 =?us-ascii?Q?POURBJo/IbDLuAuGD5d2Jr6Wd+MlY8VEt18ruxlRSVowK731hUi/J+uHf8zE?=
 =?us-ascii?Q?r9CwFGWGoyqMrgREnH6WQLV46YdUW9uO4RclbU2RM9VRf+Ecl6PDWgA39kR4?=
 =?us-ascii?Q?uI3WkjrEEfPWHKDM833+mjfZeP9Vg7lwHQwE7pQgPpi7XfpM7OjIJiLPKrrD?=
 =?us-ascii?Q?zJoNc3/klAJ6Qp/wL4TRsZwDaIVUfypMi2yODKTdgewctf9FP2xk6bLrclnd?=
 =?us-ascii?Q?vqSe5+sGPn2zFZpSn0Jo+t/jdNgz//GK2syNpTqbghBVk5ANbfo9suZG7DAh?=
 =?us-ascii?Q?kC0ddR4lI2EDaOT2iuiLLz3RwSCJ3MBXspR0sjnMs70UHPASjhlXJzwWzh7K?=
 =?us-ascii?Q?usISbprB0tjIPDNWltYyCkw17kCWgI2k/2yeVhxHEd/D7V9yEdZJGrRE9ni7?=
 =?us-ascii?Q?10IozfarjFz2aZaxKwT24nbux/dYwjOwqdriLF2osJrJU/ONHLEjEEQQ0Um+?=
 =?us-ascii?Q?ADYAJPOE4iF0D21oTq5ysWlykcnpnHGNKKzIhNoaQHYxpJC3JolYfHZNVxe2?=
 =?us-ascii?Q?P9AFA6+z64yuhomzTNkAhIaZAG+2HrgVnvdGH/mAp/IiKGA8WbQdZdJsn7mZ?=
 =?us-ascii?Q?ZuAFFQF5UUqdRoKITlZG9jW7dkNZKUY599PzHdcLkewWjc+VJIrQyxiH2TsP?=
 =?us-ascii?Q?rmnoDVQ9jPEL54tv1PUDVo+0SLPcjoOXFeYmv+a5qyP2YKlIdXBf/6qWpFn5?=
 =?us-ascii?Q?fXfeXtaimwcvVgkapKMJ28E2y6PQSwzWJK0WXGFaxA6MzgvwK6n6Fj/yq5IM?=
 =?us-ascii?Q?tL99kRNkF8WQRd476ZJcdhpXQNHR1B1fkeAb6LTnUVgrBB+zBTWP8E4lWafW?=
 =?us-ascii?Q?nOXUBCBbbHttIDHje99Wt+xzsuZVt8PK9SFkD2EeKpyQk+xPnYhW9uTbZXFy?=
 =?us-ascii?Q?MsjUurd00KJ1SBkfi+z4AxvsRrYhR7eYwNkTvXu1AyflCJMuV1gvNycjc6JI?=
 =?us-ascii?Q?ay+bpQcN2w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0315a90-fb71-42f6-7655-08dead6d93dd
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:52:08.0018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+iOwM7+vXEV4hAU234JC8/NgMHRzpq75Y0So2jq9+5EYCi4WxFkJ8pVaGNT0IYz4PX8F/q8xYOaqrzSo6OJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027

This series fixes PCIe endpoint mode vpcie-supply properties across
multiple i.MX platforms.

For PCIe endpoint mode, the vpcie-supply should either control the
actual M.2 power supply or be omitted if the power is always on and
uncontrollable.

Current issues:
- imx8dxl-evk and imx8qxp-mek: vpcie-supply references regulators that
  only control W_DISABLE1# signal, not actual power (which is always on)
- imx95-19x19-evk: vpcie-supply references wrong regulator (W_DISABLE1#
  instead of actual M.2 power)

So remove unnecessary properties for imx8dxl-evk and imx8qxp-mek, also
fix vpcie-supply to use correct regulator on imx95-19x19-evk.

Sherry Sun (3):
  arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
  arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
  arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply

 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts     | 2 --
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 3 files changed, 1 insertion(+), 4 deletions(-)


base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

