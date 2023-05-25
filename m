Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1E24149
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBZnscIoTW9KPEHPkdEEj2SJGt/vk/ce3AyleAhhGCmtZTSlGyMJ12XS8K5EnVwHUsz+6vJKWd6v2n5fcpCXWNWvgtZmdQh2gekssvOeKCjR6h9OJvnPtBiTLzjvfTfzhnDwiOkIksdy9etYd+EbV2WYBYn8Rz3u1p1iPyE/jQGNF0hZUo8kd2VcmMVqqZDbr9B5+yA4U8zcgY6lkNp0zku2IHgM+VAzxcl5mPipCskxHQgPebdAEe+z8MiXvHEiDbhuIU1JqJQ1KWA2jNnEFpmD/mP8GPhQ+APiji1vR7mY7p4cL0mwq8E3Fv7Ebyt4KtdKIAIMbz+UHRqZ/PbBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcE5vMi7/aWPMewDcfZDH3ANpd2MIJt4V0iR3aq2iJs=;
 b=S+rzYYz8QA9Xo/yTp/uurWtXYyEf/2u6zZgLN6zTBFJNmhFwe5ye6kQwF/PZaKmK5XRbs2swXUrDOcTs9F3mjgB0iLPMMGpGiahffYgLURx3Jooxu2UM49qHhiB7gYEWRfCpf3qCJ2JiQUmKTj16P08FDU8IH3K24DK3/rHRdWlvNQWkMrerGpxRz//0BeeMrpsgfAW8qZ4r05q3KmP0UgZ1z5nR8mV4Bk547/T08sBBdOxcylutmnxBbv82Bk4OJjTmCWqo1r7/2UIBsB0Vh4Pp+ZV/s/9//H/P0b0fSvQlq2I81xzrMbm5twCFSiwDwvmqMF8wYn041ZR4utfBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcE5vMi7/aWPMewDcfZDH3ANpd2MIJt4V0iR3aq2iJs=;
 b=OGsVT8dUUxQQ6oii+Gqzygb1DNw604G/mmhDHCXV1udQ+kh+myp5hw1YH1BoeZ/PdoGKQFm8Ka/Xmo3yTxZSNbnpA58SAzOev2AmJ6N+50EevdXFN4P2Jw/E4J3oO6mdto79AFIRNWfuc4FJhiPFHMdOVxrddUmcwiW09504eLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8728.eurprd04.prod.outlook.com (2603:10a6:10:2df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:29 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3 compatible string
Date: Thu, 25 May 2023 16:01:48 -0400
Message-Id: <20230525200148.1015154-13-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525200148.1015154-1-Frank.Li@nxp.com>
References: <20230525200148.1015154-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: a5516f21-84d6-4bc3-3012-08db5d5af7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aM87ZOHa1T/PyFufgdptLl8r+uBwJeZ/h7pg/H2QGUdGzWxUo2SQumfGbn8GFFO8MSopMR1vkfDEIvXVp6g4mbR3NGJ+MlYWeClNMw/uQII1nGWeXSpmmg/LXfIQrTxoEfEdOfGlrXGCVXvnxA0hLnke7bpYnDxKVoOmtv06W442+mMbeGUZ5iks4gMT5RV5P0NbB1f5Y8jDNKPEWz8MleijopaQ7RnkkVvdcAIl57iBnV3nwOXB/doL+GcA98Qb3osWwsz9y+BRKG6+hvFqVFkwHazZ9sDculsv1CGAMMkn6opF+MPQeh0o184eMaUO9oaamCWIEsN8SGKZujxa6N/u0byLrtegLFiZz104n+2FftyFGN1VP6VqO+AGb6BigpmwLkWhi3OIQwlweTnrrb4xbyaTYN3vGKycgRAXD3PI8jxZ+50uKuFE18YRlA6gFvLeqNeH0fgKw95EQ5/UzsaTLvKAmxxr7Xcz8RcJ7ab8AjCIPgeYx6CEeSnq4O7I1Ro/xcT3d51CMs1wgaM4HSRWxVKOaASBV1mIlEpgww2HNQV6UaDpm7V7ppzUs/iI4yNT1E+nZophlQ4jJrbyVYPEuXkUiJgkehNeW3PWN+XXnz7nBHPo4QhVkZDT1Hgs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(66946007)(5660300002)(66476007)(66556008)(8676002)(8936002)(26005)(6512007)(6506007)(1076003)(478600001)(316002)(6666004)(52116002)(6486002)(41300700001)(186003)(83380400001)(2616005)(2906002)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilqiFwRmJf1fs7gbCUfC08gPFhZAoPUQiLtsXkrLQUbV2pHsXYsEvDHAQhhS?=
 =?us-ascii?Q?ZFhBpWX5/G56S8i6ZmWcwtqLA5Hg6tG3DcCUa94IPqZ+Y4naUCrNckX8M3Sm?=
 =?us-ascii?Q?Yhb+eyvKNuJ8ml+cKekCaJt5xe0P40jWCp66JxpJdTPS/ldFWc7pxoLLfbHU?=
 =?us-ascii?Q?S1YDyyloXWR3PvxYlowG5czGmTJokT7cD12PWmHrn2dLeuV20z661rtboy4O?=
 =?us-ascii?Q?m7GnzljqiLelh512q7VexxUnufRh5Ee+IhCZHzFm8ftZks8VW8B12uMkaozb?=
 =?us-ascii?Q?Bq6sOzoKuNxf7upGvS6D5Y0l4siQ9nvAdOzJrx5tfKHloT3yjPY2YMwygFx6?=
 =?us-ascii?Q?DlmRofJ1jpklDyzn15Ko6CdE1jDcvjVB8cU79hkcydh2F3Jb9t5u0wSpyoZu?=
 =?us-ascii?Q?G7XHnwN815o/+YP4vb+zb+1UTmXEpwEfVSiPsmdZ0LaGGSf2pB7EKlcix/ry?=
 =?us-ascii?Q?yV4g1JJzhJDocH8q83iUyLfVjZWnanwvOdg8jkJxyUdsC7thHSnYCre+Q0pR?=
 =?us-ascii?Q?ETmh8gFPWySBGTiQ72+tgDMdRPxmHt8Ry1RgFbh1iT0qIp0gOjlzg9A3+DTp?=
 =?us-ascii?Q?QCt7diyZy95Ol1QBXK+hWzYCutUtVaFC1yDrB0icNmV+CkJLOnYWd7EYz8Ow?=
 =?us-ascii?Q?63vKmi9t7LJADzJ+aFJfV/ZX/H1H5baUE+zwIKPo+WBPV59J9FtkKT3fKZmz?=
 =?us-ascii?Q?ePiXrU1pfTz9ZlW+OELg9TE4AySdmAS4yU9Xh3s6xanZbNK+dQplzWESU5gj?=
 =?us-ascii?Q?oq9hRPrNxmUPNlt36vu935QgHRbJ6RJNOBAft5iKScgaYvsUIlwqIkZRLMFV?=
 =?us-ascii?Q?dYppvDpRgpvn85qIsjmo8Vms2OpU8fJ8uwXw9AiXbUWes5Pvf+jF2tnxNc4E?=
 =?us-ascii?Q?HCB0D7yzqWzWU0X5CNanmEogeS+EzKsOsjw5uy+sYAQPRjpk4nnA0aniNzRZ?=
 =?us-ascii?Q?flUPMn/Jz/ac6dM94jVB0pSu7aOHCsXKPgROqrOJZfxa+JYGLXJE5QuW80Ty?=
 =?us-ascii?Q?0YOL7hBeeyIqGCjl8yZpVx/PVJVT5im/n/13TTTF2fFeGn3+RtF+G8HSDee/?=
 =?us-ascii?Q?l1lzNwyL0rEzRAwaRJfVgNTvcqLoDwoGgVF+E9OdyLC1CiHKt9SI6b9/yaDI?=
 =?us-ascii?Q?dBAtoRqi2eq78wsCK+iyAgna9kpAx80J727VTjUkRQk0FeopK9FmP81q2vrk?=
 =?us-ascii?Q?9H+LmElzck7nSv/hYNGTPFKH8T2x9gflIQBKSnNjhf5/M8w5/FbZ0NCTu7C6?=
 =?us-ascii?Q?NFx4ZtqtMgIEytTuT1qGKZkwkYXuNR9U8jHuAncgUbRdTMWeUSPGyKFVs9xw?=
 =?us-ascii?Q?+Ar6nqya/oK6kA+a/+kgtriXBPVLdjGkj1rkSNTL/7lwucvSvzdSGq03pnJr?=
 =?us-ascii?Q?Aq4gCL/TduW5kYiFNmVZ9gJEyqAF2uscXGhlwVubB0dMlwzYkQ5X/vQ9c+9z?=
 =?us-ascii?Q?hXQfO7iw7AgbUp9yZHVPmkRrDBNkUdrULYpm4zsCZ2QxCgiOT8dmEDu85VfA?=
 =?us-ascii?Q?meoWuTT6GzgE8lv4eRnAFeMj42KWShVlS/eQRK3v7+5Pbai3khXPk+XayULj?=
 =?us-ascii?Q?hRYjZTHmtTuDwhOdWBwo5hngBDjUvQ55SHfDsHgI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5516f21-84d6-4bc3-3012-08db5d5af7a8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:29.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84hRMn/qYneSBH0oUNebmtrFXLWTcNXLQXFL17uzzTjXaHeAFVytbbtUypQa/tah8wYDE4wexICGXqy/QrP2ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8728

Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/dma/fsl,edma.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index 5fd8fc604261..4315f854198e 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -21,6 +21,10 @@ properties:
       - enum:
           - fsl,vf610-edma
           - fsl,imx7ulp-edma
+          - fsl,imx8qm-edma
+          - fsl,imx8qm-adma
+          - fsl,imx93-edma3
+          - fsl,imx93-edma4
       - items:
           - const: fsl,ls1028a-edma
           - const: fsl,vf610-edma
@@ -101,6 +105,21 @@ allOf:
         reg:
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-edma
+            const: fsl,imx8qm-adma
+            const: fsl,imx93-edma3
+            const: fsl,imx93-edma4
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 64
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

