Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C81255E2F
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218203; cv=fail; b=r68X4pfYvlzGzBwJn86yBS8pvq4LwoYE+MdGX+CHBGvmrSVcq6pwFPp3lLp0fIih7paSATbWhZBHbgaX/mMSCeHZTxlu1cilvuMZfSzYn7qiP03wxiph6vvMoYWeYBtEhYk0Wij6c5U69dtKOAZoq9KW6fYwQhJwGXBWbIKcTn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218203; c=relaxed/simple;
	bh=FNXXZncCIqfVFOY4g8kUZEVlThk8alvpyvX4e1/6e68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZylEVupbPgbUAnncThdCS3z01NLTKDA2B5cGaJw5C2ByDUD9SjUdScPMVdxQ1OeVosZkLHSbPDJs35tRS/mjUwbwIpYGM1CRciyFREe6x8GPWZWTN83EWHNrax/Jf23+e2HR0ZOTpoSRmA2EaamVCdHXxnj2VH4qPW5shooEYYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ktc+8DOW; arc=fail smtp.client-ip=40.107.241.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ktc+8DOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wu5EbWRGI/VPMDRUbPC5Jf8RHuVxfrv3yYOjNKAYIOODzBdUYaWDSG7+FmF8dFvmzxOcy5feT4f9Mm3V3nh6bheQAccdedSFbA0KKX2RVhhubR4m9mvO9xIg2fDLUAGu+qr5SoMoXrYvYX4cIalx6nWHWBu49Ofe4hFrQAswalmDTU484XRmMn4e4cFkml72LDmKb2OEUrnbXRKP1p2rJONnKQrpG5C9UmDvQsq99H8MVxCi70T3eJiCIyL0PQcuPK3cmXVMlFcgkySKUSHJYbk3lPqYsSulsToI6fRQvDw93FEzkfvQkop/ASR1oXt/TxfQS+XGPSSxfJLEEgHc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMVzcbDtJJTtSagjvbRn3EEFW0kBre126jOSwQo2ndo=;
 b=T2kcLsL5LMA9cubO8qlGJ6Ks9oDIvFzE3Eywqt2wHLrJd+yNWj359BtsZqw1+soI9Qe6Wm+DQoAygmJ8aE8lmqJww1jNNm6bmKTnZjal1J0OSOwpZk8jcAITIgWh7C3nqeoSC1nE9Z8teWdi93nuoHSmmmKYLEFU0BDK8kYPeY8tV/L9cyYiT7M6cakFFri0Py88Wuj4BU7rkyQS8kad78betYl417xq9KTl2E+xOtBJ+7Q5mDaCYpcV/QEwcCW63S74ny4zoAoP6y0aUYv+CN2hjcfRqBDt0di6iR09NsmJqI9k0XfDCB4S1FJpQMzagLy4z+bKrIe5HnWjScZcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMVzcbDtJJTtSagjvbRn3EEFW0kBre126jOSwQo2ndo=;
 b=ktc+8DOWuTaGmwICyDL/bNW0d7m8wzg7lKvVGTUQUqCVozw5iZG5sppgqc1wBwImIKfffnItnmPXHxup0/rhop5XJjUudFEprHfl1lBfOf9wW5D09zuT47NzpV2TfbdRAs0TwArCoVVJoFZwHX95UhLfMfN7+/SygrSAqcjqhKVbFh7fNhYXGS08NJhkXxtCdI3I1uQ2Fmi8/xWid4CM8YbDr48+TuK2zdDs9fVh7OZLpI7+oswecvkZOcvy8UYZzb0zf9jidBjEwmhunK3FHlR8iCQTwvc6HHGrOgLYyGn+IYsjZuJ7YlDMg0/2f2OXE2Q40RdCJHSR/ePusATO7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:49:59 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:49:59 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linus.walleij@linaro.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add i.MX943 EVK board
Date: Mon, 21 Apr 2025 14:51:37 +0800
Message-Id: <20250421065139.3073232-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421065139.3073232-1-ping.bai@nxp.com>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8583c8-2734-4283-1e04-08dd80a0bb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+MfJoraM8BravUcaJmtmDOT0zVIydTF2XpoEbEskEZXRwGZWoPiSuXCE9dTL?=
 =?us-ascii?Q?T4Dk6chzzvp754zne+H5av5j3Wv0BSZCyHZVTIDVv1cZEm5+/qSaXcE2FXLi?=
 =?us-ascii?Q?NkPPSJLqk9P11H1pH0Nukq93fnEx2mxf5akovAhGMQbqy/X/j4WH+hnceu05?=
 =?us-ascii?Q?qNdtK4ns7bis0ayY3BFd1BQk90zhFkEG7OU5e9qa/4qU6UvEsHMj+a1fFfb9?=
 =?us-ascii?Q?Xr15srKmpyNvG5wW4yDkxvmLwKpLyHRAGhSZaDX1AUu34lNXG1ZLXPWAKVVw?=
 =?us-ascii?Q?vWnZ+DMt25ovHRUtdVvMaqovpDxeUXsOdVpBCacTQG+uuGt5SI2PAOxNabTS?=
 =?us-ascii?Q?ZWrGHV3PXtPnFKvWKqZTwqYgtQXJVpDgOso7Bqlj/gsTF2vSbLMyGjKVhNnp?=
 =?us-ascii?Q?sqjULFT+jxqdkazoUlu9us+ZQ2NoVMx/hl8y2rHpwcD99+v21wXyWkciRj74?=
 =?us-ascii?Q?MoVPpFzldOA5IelZwXp5j/TmLTrX1d48y2kOG0+ZytxHpE1C3pFA8HbgwzDQ?=
 =?us-ascii?Q?ONuAXvPg8YnYp2fzDhpBTMOw1XVIZdlDxyxvMbmMissZbyxFEY/mbSklYZuK?=
 =?us-ascii?Q?xbbWw3jzUjeWVtT3xU5zhIPRUCEIlY64qsqAuO/PI3wdan4ekPsTf3S52X6K?=
 =?us-ascii?Q?GYdbVImKC16oBpnM7RSxRCd7EEb4ZwQnNl/YoGPsKwt0Qc6BAoHrmRC7HsIM?=
 =?us-ascii?Q?OePs7768UtcAdj8EnhzPkIDIq/dxpC91s/XwfbTKYnjAoLJtZANYOWjgxLla?=
 =?us-ascii?Q?xyK3inbwkk/odbSibV8V03RsRwivgD/z8HnGIqDf8v7+Hk5ZZZBtwwKZDPQ5?=
 =?us-ascii?Q?IiqoQF7WWGwXgOg0WZkEfHOO43w0FsFHcbTdfP6b00SujIBMK/3/xuIXE7oy?=
 =?us-ascii?Q?tkcB21M0+zru85dnllQCIc9fuLM97EBNwWjLDtIEz1NXOGzUMXt88rBchtCi?=
 =?us-ascii?Q?YEL8JJoIwCHHnEsI5ckfxrOi5pYcBr8lIWJbBoK1Tg2FCFXFKjDg9dNK9wDD?=
 =?us-ascii?Q?ZmGYIQ4qbqPvSDackD1QwRrXFX/663U0Ss8QTjqBqTW3XD4YlZFq7UgunDnp?=
 =?us-ascii?Q?DF/M4rplwAY3az0amCg3R/qFVNOCrli98zsklINGYJXuaEXKNTKNSr8Dv/gB?=
 =?us-ascii?Q?hOjiHhW8Et/XqLY1LhiHOG/WYWmnUOAIuUQSelX/tXCrARJaFIWwFbQ445Rc?=
 =?us-ascii?Q?KK/a0k7hyrqKHcNKx06+S2ht59hR8ce8u6OkrE8/tsFjIouhMONv4i9SWQaP?=
 =?us-ascii?Q?U/q5kpqCAaWMK9i7axpLLqHtnu0mPLGvFArF5hpWEbX2VYaSWmDDOACjcWBQ?=
 =?us-ascii?Q?hn1gAb68WocBb4Di7cKKsy8b+12zHCERDH43reE1Nc+r8MR9my1AXw0CkxY9?=
 =?us-ascii?Q?TJqVC1vjNCjr01RwgARrMzECJAdrXk5Szow5BdEhZgHURsDyOCQ7qhqwAsfa?=
 =?us-ascii?Q?qmu6YCxtrSQuyCc7ejLl2F2lCgid4OQVIClnsQywb09Za1WWbwIdeuLY4f9O?=
 =?us-ascii?Q?0VMG9zNSaEHuwuk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5qVQmdFiVd6pwgoAJmglNoEnnLZwEMt4iFJKoa7YUVtwaMlv7gKrWItFpwMo?=
 =?us-ascii?Q?2SxAaiJ8u48JQvrcXRLy0RDSNEJUqbh0UXR6RmaNXjgiHPVlKHqLyWzqxN4W?=
 =?us-ascii?Q?ecNdicgdLs2L59c7+iEnTsTsMe4fs6/zxjQi1g+yVkbiTdkTMsCnxuAw8Ky7?=
 =?us-ascii?Q?6+2ImAQf0vXzUPMgLwN97bwfso3MejrgKlKrAg8rF1Yn1po+qKZc5t3awsZu?=
 =?us-ascii?Q?sqIFfEvk8YLYEQAxHp4ItHTfg8kP5NVfp0zZ9wS/sPint/EdeLjCTEq7l+3g?=
 =?us-ascii?Q?ahdyr5iT761OryyqTkM/tHUu244JEdWnDzvyLR47MNc4U6vi8B6Ik7E+9pQP?=
 =?us-ascii?Q?Qs9wgzGnayr8TZ5bJih8mYGhvhxEUBJtrY4fRx7CH+fYtMGaHZ8Iwrj6NwCe?=
 =?us-ascii?Q?nX1VnngpewJZqnAy3elriFw+ruHt/RNl8EYboAgWTngsEnuxnvbG4cEwhXfM?=
 =?us-ascii?Q?tsf6UubFbBullcG0BD4Hcsv4XwnOnNGinHP5G/c54+JR0yxZ+mvrG1/ythgr?=
 =?us-ascii?Q?mR/vM3wn99vwU9ey3zLwDbqjWlQQdKJuyPdg+TDAqXHmfLBmFFK+F8F593t7?=
 =?us-ascii?Q?yQ7dFUjbc9nmelSoLPKf9A8AN8aVyAhVa5BqEe6nuPQJMjPBGW+K1NJchh+z?=
 =?us-ascii?Q?G7Vy2vvHyHByhADypONFIlVgto8hXwV4eZyciKNPNoQE5pwj542GxHKSjdO4?=
 =?us-ascii?Q?Y8fKCGYWlY2OsVRLYoSeZOYmSsDMCHVp+rmWIybII1AQryJNnrk9EWRIas2Z?=
 =?us-ascii?Q?R4zQttQ+yv7vDt+0gQfkYQL8EPyQgPcxY84rff20n2pFjXWMbh2rONZBc/Cb?=
 =?us-ascii?Q?hzzuu1MYv6vyS6DyhW8wr0k769N10jRMt9vAMFcuP34Zx782fh7iF4RY36sr?=
 =?us-ascii?Q?FkSh+q0Uu/r7t41O7mYy0NeB/ngahpakStDCLCvgLaRuW8DP7TuLuKOWhxVE?=
 =?us-ascii?Q?IlaNTrG6pwMq39cht3dcWdanv/qG1cKre2UBM2giLB7wB75ARxMUl+oxro+E?=
 =?us-ascii?Q?JvytN3toZYGBmJtopwNH4LKkYWDJOKRgmngYfZQTiJu9yr0aY3Bud72nej/B?=
 =?us-ascii?Q?9rxTDWbInD7O8BSx8ACd+RFLzLy+T6SWa5LIpfvN9A4v5DrWLq2kxppbYwKy?=
 =?us-ascii?Q?nq9wmR0eC2evp3tf2GWlr9ogMI4sOd+JNJGCzrI4WKyAOZx2f6N7byjq0ddQ?=
 =?us-ascii?Q?yjU+E9nrvgpsejPP77jnYvKJBSSUdbztpcQbRJdZhgafFNBeGXI9hsbC/O9+?=
 =?us-ascii?Q?AoRqoQA7Xo6cgU9Q2mOAStcZPOloU0i+aKCkVZm0GNNUd2tymijc0aM1JhXd?=
 =?us-ascii?Q?Q1VU3cdv8o4nr3uVSkDr7eK/wXKLwn911Xj/QJnBG2Z85N+OniLdMFkt9JoG?=
 =?us-ascii?Q?uepPS/1fXz3HdHvZW4ItKdaAe8gkXy0owumw3VbxZOezW7FeTu/d1QJH/Iu6?=
 =?us-ascii?Q?N79lucW2wUHRj+vKFq4MwBCE7AJckYnAC12vmaJSqfi3fyrJyI/RGZoi0+bi?=
 =?us-ascii?Q?nvXBdmm9Ycar5t01CE0klPFKJnm4dRz/27EXxuQ18B5BOaBBP8fQ/w7cLDhD?=
 =?us-ascii?Q?ppiKfm91Y7gLbl3B8CAQw9bJXY2mzrTU15nV3G9+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8583c8-2734-4283-1e04-08dd80a0bb8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:49:58.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4esF0EofArLewEZyFejwUgQ7BevLYFxZ66986kIlUyTdc7r0tCQ9H/n/c7n0I/6db1rP+C/tZyWukS8X75oPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

Add DT compatible string for NXP i.MX943 EVK board.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 - v6 changes:
  - no

 - v5 changes:
  - no
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..873f9eb25cda 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1347,6 +1347,12 @@ properties:
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

