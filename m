Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0E33B6CB
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833376; cv=fail; b=gjJWIvRjB7fSd5lqXXn7IUM5XVuBh5JTlTn8OC9nk0e1isY13wYVPGMOfNnN056hxFEe/GM45BOgl4I0t7x18P9RCGYELja95AKGEUwEdtjhT65Xm5VfGRebRJoQJ8FBzHS3hmVyn8UT8exK9kac9Ha5fOjf6Boz3DVTAcW/3Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833376; c=relaxed/simple;
	bh=esyfCQuebN8gcise7Xg6qKLspLmuYYZcVjFCgNtmfmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uLaSpOdoJj3Fbc/YI12IHIiDP53LCeyUcKbZcxXD7yZYnu/IIltymjCsZs9QhHY1FPd1baIBdptjHXfpiAvFHW9GXNvG7KFrMNEBN7Gu6YkNpEvCfxzXUI/zSgpwmC9yJOMA1odicVV+DItHU9JVGbs0NqDv3qdUVvwkfRNew8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GGO2dJJJ; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GGO2dJJJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtHu+u3TonCIXR+pswiwCGFV2CTvY3j3pSSSz11dkDZK8zJo/jtTMj0w0ZQ3a8JYPK0pU72R0fbBvObW4E9L8kZsHxL4w7au9LZXevhKmY5sQQ+XN82dgqMECMaK1dHwmntMxN4xbPWQmvv/kZeHVhVL6fhWkYQphxi7vdZlvRZCGADLSbsTZfMe2YI0/xLrcIJ4rjRzc657sgfp988n2Pl5imKuvFY8fNIQqZedo4/qTplLY2Dn0mncReEyUA969ePJ3xmjPAU2dF55oPho89Io0gaShZ8IZctwNTE237JspTGY0VUI1x4JybbYwKTpDoFxGCwlOx22DSRlPt2g7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLQQNVyQRiZFcM80CxeHL/yMKRTwDwwpmY0x/E7fr/4=;
 b=htwsxg2DCrDL2oJzGJ++AJpYNPZNB8Mvw47Pw3VBUNS7VSIYuSH5qPm9+hV5ttqvOWxuxabmURC+YxLkE1pJsRlwA+5pGvLXNwNBuJM53j1ryFkBK6VshSXU4i/tuoJFLqlXKbH8Gmr8pi/KbbD+urUtUQMMoqxYRDNjO+B7Iy6Tby0i8CZMgin8rXcLW8S6SCdJSSH6gc2Qi0K33FgcPYXDuCWp5hgxW+prIs4GJZo2Gr7JlAdhXyyGFu1D7JArqzQR0N95dVCK7/SJJs8IYdE0COlFhyOHBmAHRtugJc3RJfWxsbxoLWzyNtXZH4oBNSrHtf7X3mBxSsRXaOIcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLQQNVyQRiZFcM80CxeHL/yMKRTwDwwpmY0x/E7fr/4=;
 b=GGO2dJJJGOYDl8q4RkaVY6MvbuS/ov+FL003gjNq++bC8/gAF/rdNE3r5LsX//xVCCRXMyMraCJj3j9Nx/jV7ChXRddrSSXDK4t5CwTdOriYulHa9hATSRdjwxtU+m84oFxPJDns47LPipBDBOx02LCyeZKRIFD8cRISumFoWbyPZ60ehet1n226u5tqjGSsQGqsXkhSn4qdS/dkTpx0x0zSgJkPkAlWyl3oUuKh9wCMEz93vGdEenSvUj1t9yfKToglalewjdvbI5K7Z2YvbWuBJ/C2TjwlJUdpM04pg/3yL6eJYHGWk+9yQNA0tvrEBoWZQvFa6sAVWbHi109MXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 21:42:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 21:42:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
Date: Fri,  6 Mar 2026 16:42:19 -0500
Message-ID: <20260306214226.403672-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306214226.403672-1-Frank.Li@nxp.com>
References: <20260306214226.403672-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:5::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 348d66c1-f0c5-4f31-1a0d-08de7bc951ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	XDFk6COz441e/WjO/2O6iEV/pOiYHYsuw616Qzn5H0GXaJJoeO61LMjIt6HWfOgazAa5SvXjRG9uH8BoTrIN2ZZ05otC8OssfGqNQ8Dne7FC/YDT0ApyW/7BUUPeeFRX/1rYjbWFdE9d/u8xy7IXui9me9iiyJ3f1nYDk/BKJAznlTMa2Dxi08Vbd7jCmdbV7f0muqUCi//mpHKsR+WGI2HzzoRFBCueibiBZMyyZ4w53IWCL8HLQ4TAVZUO0+d8MZ0kxl71v64dXapFoed6FM3q+2xjMDs4dX9B2uWKQjc+jnhrE4Ll3Kukh6AQmH8DqQRgQXVmujB4qrnrAIXL4xuFSacrxqhgLkUaugIbJLG0ZtuGpnvlrlfg3bsojM3nn2FSxPV1kwMKKe4gf0e7tzfFSWcuL0NxJnaZ0SevkERgoZFbTFQva2ds+VH81O/NXUXEUuBbrnqvDsK5qgSrW20EYlcHvIGY+ke4YmvMTalswtl5GmA4sPTi+doVuufm0bC5oKMWHmJUyfl7XPN4/VxajdwejALXokwKruPzu34OBkUXbkDl078iLbtBQ8iCTPRKxX0O8O71jaEr7pxknMoGVjjFui4aZk6GlR5oU1+V8+9ch4rSwwCMzJZbWS3NJhEQ99J3dCtdQqr/hP699Xvr5lC0OLpyOoeORoMbGTgmnSCT5wnuwLB4UXoa7LrftW8woEBJh7ofcEfVjeHGgdyFoxwJFz38NZW5/Zfls3ue5zH6x4pa5aF/aiH6g3qsNa3YfM0nGgZbIlE5BVcqM5+IMqw2FwzEw8wBDNKUhfEmakbWxG3OLzoc4z+CXrBR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRGYXUzVHcyR3Y5V3hMM014d2pCVHQvYmZaVG1QQ0ZXalhGdHNwTHExUEFy?=
 =?utf-8?B?b3NrZzU0eUNWcVJFYVNFTS9BT3dTZmFyd295TXZnZE8xZjNOTTlkN3l3aGVW?=
 =?utf-8?B?MFV4VjBrTWN6OEV4cWpWV096SzhCcjdSTHkzQnNEUWl4am9PbVBpdVBYcTE2?=
 =?utf-8?B?VDRHL1grbzVhakxYN29XeXhjN2tLRDBvKytML2VwajlYU0hHYndET1NkLzlW?=
 =?utf-8?B?SUVPcGo4N293ZFo0cUdDY0xwQURpSDNhNGRpOHVaSmhEemlQNlVvazJ6UlpT?=
 =?utf-8?B?dlRtNzBhdmxmc0gyRGJxdWJtUlMwM0M4TGlWSEhUUmpHSDZUMi9jTU01WTJD?=
 =?utf-8?B?dS9rYTJFc04yZjI0aEt2VHNqbjFRdE05aWZwWXQ0QmZjTzl2bkVJQjZBMTNI?=
 =?utf-8?B?WnM5MmhrTzkzSlZUZnVTbEdDbFczUnY2ck1HQVRFNHlSWHhyTGR3L1ZDcDlD?=
 =?utf-8?B?WmNaajJpb29oVytRU3QvSHdVY3JGdEdUVnpRbW1iamJYQmMraGNmbXpJckRG?=
 =?utf-8?B?N05TQUxIbmVJVk5oVW9FQStlM3MycUtucDRnSzZrTDFXT0lwUmVaSU1yVzkx?=
 =?utf-8?B?cW1wNDhIVUtVUjF3dlM5MVp3REFsRFRnQXFmQUZCUGdpc04vQ1JxanpsZG44?=
 =?utf-8?B?NUVhUVFFRzUzTEZkcnNFUGU1RXJvb244MFFRZklIckt3R0FpUElHTUprMjRX?=
 =?utf-8?B?YjdDTWVQUHNaNEoxcmQyM1paNzNxamNVWmw4Um1jVEYweU0vRTJuOUF6TWU5?=
 =?utf-8?B?QUNHbm9IR3hHQllXbHRlWWxvZTNPeXM4S05TRUY2WHhxeU1MZFhNcjJEL1dN?=
 =?utf-8?B?TnpRWmFZNTJPSmxjZlowekkrOWdLVjlLSWlQTDVMUWM2U3pRQlFweFpQYnF6?=
 =?utf-8?B?WkR0SzFPQ2pPTE1uV2h4SVk4bUdnNFNDOSthL2VWcnBWaVNZaUZlNWh0Y0hJ?=
 =?utf-8?B?TkYxWUd2VjZZUy9XKzFSOWkrNm11SitueVlBZTM0anZyMzhPa2pUYWRWdWVi?=
 =?utf-8?B?N1Ywa1FxRm93NSswNFU3K2JNdStqZmtPUE0zR0gxdU03Q0QvUGo1Yld6Njdn?=
 =?utf-8?B?bFNlaDNNR3Jnd05RODBjZEtkdlVxU20wQ0J2aG5LNUxPUG40eGV4NE5rMkYz?=
 =?utf-8?B?bENudjlnZHVZTEhNQnJOaHVXQnhFTVduVzVsa1NMV0xsdGViem1na3hqRmZC?=
 =?utf-8?B?cVJYWHh0Y0tmNnk0WDEzZGtaQlZWNDA2RHpmQllzMitrbVUreEhRV2N3Umps?=
 =?utf-8?B?NzVWSXJJbGRoYTY5SXFKbnNNNSt0NWpQWisrb3lVV09uNWd6VVZmVWt4b3NW?=
 =?utf-8?B?M3BvVGhpM011VDlOV0ZOVlU3WDN5aHdFUU4rSmdlMkdGNVRmUkdsZTcrc2o5?=
 =?utf-8?B?Wis1NFdJczB3R0JPYU5oN3lQYk5uckFURElrNWI4VkU3NzNZTGxiaHZOZEpt?=
 =?utf-8?B?UTJDL3JscFNPQlZZY05ZWHh4c1VhTDQvakM2Wks1ZjBFOUtuTDFVc2dEbFlV?=
 =?utf-8?B?ZlJvZkNEQmZid3VLRWZzUGZ0akF4WENZYnV4SE03MDNhVjRqSy9naiswTy9y?=
 =?utf-8?B?akY0NkFNSFBNVE1USXhjcnBaa2pHL0Y2WVg1eWFiV3pQb3NYdGJZSzVFRmZo?=
 =?utf-8?B?cGp4S042NnZqMjMxdW5oNVdGaElNdWxFVFJCVU4wM2NxMDJqM1NsUXRpTmxu?=
 =?utf-8?B?dDRlRld0Y09FZWtvaWZ6aVhZMkhiRjJ3eXloWnJhdVl0VmR1OGw4eXpCL0h0?=
 =?utf-8?B?QU9ERmd1NHZ5M3l6ckh4QzgwT2tMc0JxNEdRR0ZOaDBMVXIzZmZoSW0rUGw1?=
 =?utf-8?B?cE5hc0p5TkxQV3RGbkk3emh6ZUJoWkxTRHA0ZFNkUVEzdEkvVXR0TjZEbnQ4?=
 =?utf-8?B?WlpkVVZNM2htb1R5cXdCV2pNMWtUUHZmS3Z6TFpTaVBKaGRTMFlvWnhQeTZZ?=
 =?utf-8?B?VE4yS29BZDRDR1V2RHNDM25XREkyL1FndFlQVWRpaE83dTVmTGhVVUhzVjMz?=
 =?utf-8?B?RnFNd1lnUGl4bXpmYmJDUURpNksrSFlzcnhacG1WWGdOdXpBeHJhcXU1RzRm?=
 =?utf-8?B?SWd4SXcrb2VobDlMUS9SWXpYc200S0w4M0YvUnk5RjVwdmFXelhIVzVYcSta?=
 =?utf-8?B?Vzh5b3lra0FETTRpL0lyb25MQlBGbXZraXN4dVc3MEpCSUpKcTdybGU0dEgv?=
 =?utf-8?B?TmlxcWhjUThpenFLQnJuUVgvVXloaUVXVDNtMncrbDV4Y056YnB4SXk1Y2hT?=
 =?utf-8?B?WmJQSUhBaGNJZ2huR3FEVXkrc3p6d2ZhcEVVcHZqaUZCdTVqdUM5a0ZPUkpX?=
 =?utf-8?B?S2ZCcXRlcndkUWNuSEJHVWZLMUJjZFB1eWtMam5mQW1FZ0FySldPQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d66c1-f0c5-4f31-1a0d-08de7bc951ef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:42:53.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh2dnDPXD4+n+Cwc/L8iiS41/kWOZVMTVlq3AFkxkn7gmp1l5Ofpag5cg+nkVGwVEO/GKw7exsZAYDtVAy/7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770

Add compatible string fsl,imx51-nand, fsl,imx53-nand and fsl,imx35-nand.

Add missinge properties dmas and dma-names.

Change reg's maxItems to 2 because i.MX53 have addition NAND flash internal
buffer space.

Change ref to nand-controller-legacy.yaml allow legacy DT layout.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mtd/mxc-nand.yaml      | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
index 433ae5727ad85..ec5b15341eb07 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
 
 allOf:
-  - $ref: nand-controller.yaml
+  - $ref: nand-controller-legacy.yaml
 
 properties:
   compatible:
@@ -18,12 +18,19 @@ properties:
       - enum:
           - fsl,imx25-nand
           - fsl,imx27-nand
+          - fsl,imx51-nand
+          - fsl,imx53-nand
+      - items:
+          - enum:
+              - fsl,imx35-nand
+          - const: fsl,imx25-nand
       - items:
           - enum:
               - fsl,imx31-nand
           - const: fsl,imx27-nand
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
@@ -31,6 +38,13 @@ properties:
   clocks:
     maxItems: 1
 
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx-tx
+
 required:
   - compatible
   - reg
-- 
2.43.0

