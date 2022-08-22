Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A204A02
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 17:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWaExddmH83YJPZ+zw87JcbN6BXjXTBAy0bhDeRR01yJ9En0Sv23U6mNy/VJq3+nmYQ09G3gSPmqlrkNlQyxev3VbjQEVmlplsf7HtIaNwj2Jm9IjB/fWL6zPlCQMnySAVPCITDhRY7DYn96C8ex9TPtejNY+u00tONc6cLBUA3GAVxZ9VEBYRzRTzrmhIa5sA1lEDyd+6WKzcLCureXwDbKPEG5aLqcncHL3tQeHZKEAXXAsa4I6ro4OtHVM3xlGG+oQIZ0n1meBKeiKCZBnKf5k2bWHtmNJzRQXnK4trVYKAItzVu5Ud4FnbtoNwXTqe+QUNfv9Xu76dlOWn7u8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8yNQEMDS57YPUNAPjCr6HikpMj0/J2qH5ayn9MzK2g=;
 b=ZddMXz2YppFVDwaBw4Aj5Jm2Z3s7Ib2nUstu41KZbGYSmgpk1zQ11KQ3d8BkqKfE9noYxPA28KA9omydNiVYxAqvfzEO5tRJEYCkdffZKkJ2fLOqcSdvkhl0/XUkyhEQ9rYieS/B5XugVvS4sW7uKY1sS+esbnlQGNhGYTJcXszu4U+9G67L08XMJSz/4hBTQTawsJJ3kvyRI1MO5MxSmFqMmNMsYpJQrz6PAbNL9BL1Cf2Rqoliwf93v9IqYx9b327Pv3v/uwVebAqmh6BYvy5vwZ8N5fuORGb16X6l+G3UP8TsMkd7hIBaOAdJmFQm/WF1gr/mbH3ordk4YevPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8yNQEMDS57YPUNAPjCr6HikpMj0/J2qH5ayn9MzK2g=;
 b=eewsc+BlynSCAK5ZBXMT+qfP6luo2n1hlIM1n/ISPnJUz4QkuSDDx/FcPTTwuxZpB5jG3zZZdOx9G/+O3pfQ1n4S2Vd/TdeeboxVf7/MDlXPdrBRsem4VDBVVY/0ruRR4I40Wb7ovAAjIjsNLcvpntZ2qFMHXCA8aK4AdsHfVXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by VI1PR0402MB3790.eurprd04.prod.outlook.com (2603:10a6:803:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:53:29 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 17:53:28 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/5] dt-bindings: arm: imx: update fsl.yaml for imx8dxl
Date: Mon, 22 Aug 2022 12:52:42 -0500
Message-Id: <20220822175245.222691-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822175245.222691-1-shenwei.wang@nxp.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db8a0fbd-92c5-4c8a-b0b6-08da84673830
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uYNALFUhUCsNCPHtjiaBs8xLJlOAUzmfe4f09z3azZL0VyVoHECkmBe9LbFgCwW3G8AB+yNFwKmNk/TJmSfu96l0yCOlKrekAnK0ZlDm6aXapo5iAfo5b5VNrB426wNR7FdM3JaWh69yfjx5M9moNUgfZhi6ET3sIBeO3RjGt8JHac3qJypEHR81aGoFQ/7iK2PaAWphW8lbCKyUyPRI69+mjy0SSnXgY6Dj596BuWEeSDjYTBce2wPHnd74AEd9eRdal9seTicVDMa9vpdGKF43KH7YhrqFdWFAPl1rdeZnMmkiqRYvGfBN2ON0w5XwFsMAC7be/9TjIUIl4P+7e9KSRtltlDI2UMqEwPQCaD8aju7o8QYvtVUqaLMhxdohgDorug46h2XW5PGp++5eHGOkQXFbrFPQSqaylyYFwVq1wewHPG7RXmUSh4sTlF7HGyHT/nrLbWjtVPCUCfTIJmwAJphVR+QRWnfTYGcUylmRU3jXWpQLcU/dMbh2L/5Vesbp14sCTT61hOHEHiRieBL2EML1zs9VSAEouOL1EEdv5W/pZ6S0kVB7YNxm5ctgokvF9HGj4qVr/W8pBPQaJf2tslPcet3Kmbo4Q98PE1qj+oSZO8iIFTVDY1ulhjZFAxI6giaOwVEG0JKminWu9163mo+CjspP3zCfUL5cBA6LbDb4vsy2s5iCOEZfwQ6CccNdLEDgZiGFfANFp0DkWksqhM7yvU5weICyZ0ukYemfGsqvP0ZixexHF66K5qx4dqyXIv5207H8NXm8y7qPxA/yW9cslCmrO0zDUCa1UFE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(36756003)(54906003)(2616005)(110136005)(186003)(1076003)(38100700002)(86362001)(38350700002)(6636002)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(2906002)(52116002)(55236004)(8936002)(26005)(6666004)(6506007)(4744005)(44832011)(6512007)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?recolVGupHcU6LJBRPxKAMrRUCG9y58sc+eqm0nufqHuRMqZ3YblGbjcD4GN?=
 =?us-ascii?Q?QkXiVFZGL3fKPjJ7kjfpbCt7i74Y8NZ7OpfRjtGQCGlZ8ugdaDgQw5Tr8Qhz?=
 =?us-ascii?Q?NmggJbsg+j19InCOpOwY7dQolxGYFxMIDwZ643fGvMioI9gU2J1+fG0T5vmo?=
 =?us-ascii?Q?yYIiDoJAP5ucJ1EAOrxnJ3XABgdeee8OrVUNaQPb02xFsqGKAyUN8oozmm5R?=
 =?us-ascii?Q?bjRyIU9LWvyCTtn6Pge1MjEEvhFLSMmbyViLTaYhT+/3uJT7e0aMez07OdDv?=
 =?us-ascii?Q?Q2CSc2jDesO+j9+OpKgBhdz8rVTBitpG1igc/A9rGNZBb2PibHEu49GRoBPY?=
 =?us-ascii?Q?cY/P0j6ju1y5leP0IQc30V4QlqDvNgfYJCG/PY0HQeXfbe4HjZ4uyQ8GscET?=
 =?us-ascii?Q?GCqVobNnBNcCgwL1vFKEid/JW45fm1dwIq3h2whpYLWr/FS4GBOaso8aNPyx?=
 =?us-ascii?Q?NF0qlc/X5LT3M2jms1vmN6EzFTSl0v6XGWAwE5N3rarf3kvEoorBmvEo1LxZ?=
 =?us-ascii?Q?Ai31U96Eni3NOnYxJS9cZCFqFVkhQi56EKC++KHCBY08gena2R9dEr7f5T98?=
 =?us-ascii?Q?H8JED0rpOMWP1SlZBRagQ1TTOQWuDIOIMpDBMlxP330yPuzrsrgxb4JSJ1qm?=
 =?us-ascii?Q?pVDNaOCRk9xFrdMLaBV1agcCVRJYDyai8xWdytwWrMcnSHvr/sq8k58eGFkK?=
 =?us-ascii?Q?pmT0Hh3MP2YbrJvTSpyrkA7Fd21jKFQqtArtXrEYpcY717WrOnFcx0H6tC36?=
 =?us-ascii?Q?sdcXGbtUR7Ks0oscnDhg7n0Or64r5YulzBhU6nrU9nsBZhM9r1O3cFnrzrqe?=
 =?us-ascii?Q?cZ0cILi0ix6lrc2+IJKqcfxR/QfpwIBOEJAdR11Z99VwWKtOVDIOijfLaZcw?=
 =?us-ascii?Q?1zh9f0KV/rPmKe5rnd4CgN60EtqLz4L1L+bcI54mGYuKq0PoDWvPuD0Jkrdr?=
 =?us-ascii?Q?/by+Smsp6nK12PGmP/z+AwKqn37fuPgM3jV33tOgKxwadMNUB5U4UCgHa2tz?=
 =?us-ascii?Q?9sh6t+n11HH6KO7srFWTYCOY4pocx3NJLG+oAYddN0IE/cKmWOPrNBhv2jHD?=
 =?us-ascii?Q?c+kXeiTA4ixKzD+nNJuRxIhI187NLacZRRIkDBcIzOWL5aVaV0vh2MiXSlkC?=
 =?us-ascii?Q?IctV5yVIUG7RPGBTEwN4gGTwwjJwbPqi1p5DnT9i341hcNA8EUTUgi39VCBt?=
 =?us-ascii?Q?CYRh5NHEk9XKsRM8BQ+nBQCAHe/oPJEnY+OlVi7ydgRDJr7VkptI5WT2UeYK?=
 =?us-ascii?Q?zr4PxjpUkrSGrTqwAU/17cSNKi+0ZJsrwncFSdDE3I+xA5cbR9oo/iF5UtES?=
 =?us-ascii?Q?FRU+AZDwtXGYWVLzPWQoaIqfSGROWimQuyUKLObKFP5bM8Moj+Xk42xN4jd7?=
 =?us-ascii?Q?NAGAvfPwXSjEoSrLMtUO7SM5P3qgFJ/BT5jjOiXowGRp3c2eMA82SA821YJC?=
 =?us-ascii?Q?bJ0oRW+Z9r07zc0yAMP7G+oC4JYn/npL5p6V4kPSS8NzqJafjV+0s5+3v0zS?=
 =?us-ascii?Q?8v9VGwjhteq8z4E6czIkbXFmZ1tUMe8ITJ+G7mdFwUD/pcb4kc5ZGy+ZcXtv?=
 =?us-ascii?Q?UELh7Uh2Nv/COmC9Q4InsJ8y03xlBzZ+K6StvpFUQdD1b3vIujcqdOY6tiTF?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8a0fbd-92c5-4c8a-b0b6-08da84673830
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:53:28.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rI5M7ajZnRRYWDZewDYT5mduvgHKLVWSzSH+wD6v6bV6pAo8l7YgO1gVX88BQ/EXPNZkI5zABJQcAyvYU1WXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3790

i.MX8DXL is a device targeting the automotive and industrial market
segments. The chip is designed to achieve both high performance and
low power consumption. It has a dual (2x) Cortex-A35 processor.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7431579ab0e8..4f4c9c0a1315 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1034,6 +1034,12 @@ properties:
               - toradex,colibri-imx8x     # Colibri iMX8X Modules
           - const: fsl,imx8qxp
 
+      - description: i.MX8DXL based Boards
+        items:
+          - enum:
+              - fsl,imx8dxl-evk           # i.MX8DXL EVK Board
+          - const: fsl,imx8dxl
+
       - description: i.MX8QXP Boards with Toradex Coilbri iMX8X Modules
         items:
           - enum:
-- 
2.25.1

