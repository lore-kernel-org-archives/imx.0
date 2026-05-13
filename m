Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B3038B7A6
	for <imx@lists.linux.dev>; Wed, 13 May 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666478; cv=fail; b=bDHd8IVyJGnp0o+oJ2QRmK+bfVOTCoiV2hNJvWZwm2SIoDvIBFeir78Xv0yzg9Dft5Lq095yoyDpWSRt9Zb6JG3J6tumHK7lCh9SiPN+e5ObJzaM7DbF1/BEPXvKRmnGaD86s3VOixkDOrYOrKQ9syPx/X4L/WUfDxgUQO0kLLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666478; c=relaxed/simple;
	bh=2AJBr44c/pc3o5RR/CJ+rV8pmZR/rZypa6wwXWDWagk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dnbjEo/YZiN+d0byMA9AdNZcfl8IotE8281ZYR8b25VJec6S76tO2VOVuwqa9TYEx3oKEu8l53CzuiIRqzC2sTiiGvf7K61ktBN4vuq9WabG6dVEAJ3F/AB8Sa7cP1QIXqLlEF9ZpZ2vosih76RucYVrUKNfDufnprGA4PFf1Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BsmbR98r; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BsmbR98r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmM5R1mpsCDJg8rc/80bCIeu6pk9Qap+F4LnKqkIcQZjfcTLM+xjPbD17Jreq54jfeSNTZx3M4mjcIzSBucVTe0QYS1M1ZqsVD/cApJrc7MVIjonTa9SYYUTYhTS1olaeC2q23FFNJigKyRrwP/Kb5E5GJK2WIv4b4N9q41b94zg7RYmuuFrHc4+geCqOitZkWRy9lqEjuG0pJ2SCageMcFDRINtJyhsoLxxyoOp6zVwYEFpNrpGe9Nx0JJ914LZdiBYpZTmtzTaJBL/bflam/A/t7prtQGX+nqkS/2AUse9OSv6Rgy83dhN3WiBFtYrvRQV4EaNrYwJEH47M2YfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ3a0YFl1+/uENqunZNSrXtGCgIg6C8gydQkjqUoGYM=;
 b=MRp5KlAIsMYItM/ODMOSVKGcobTq3JqsAPK0nWI76ATw6G5D/ejN8sEBiqNGgLJ/xejvSJc9wKso7c6/hiGjaMjUSLD4JLZrGYAFQE3OyU+lXHkoagEFuXPq57lTRgmjDNfxpKSAosGLMJdnHUbFL+wrwQmN4En18Syy5feZ15P7GfGD2AM/D1QZAuVHsp832vSQr9zJW6u3bOKN+d6lQ4o8YEMarGAq8InKDG2wx41fuINs5zNjXdvtdcO/kiZft3530IK9gGWMJM4CshybaOnTr40WxmXvn0Wt+Nel2nv6okyzTzLvxk2yNTPlvWiWFlEarw2Z8g0b4D504qXS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ3a0YFl1+/uENqunZNSrXtGCgIg6C8gydQkjqUoGYM=;
 b=BsmbR98rdv1+nL28+wgPUe8O9om14zVfo5ztRHXceCb2ofzoq5UUN8ifMgOsCH4A12qMTkl3P8xhA27uTpmW4bm/gd8jP1D+aDwS69Erovfupw6Gu+46jAeqRuCUhEa+3dW6vSYSdJ1Zh2MOWJMW8Kg5DwMu+qxy2/jMmkN+o3D+qZOANWUVGCS7DWy9g6JzBYtIY8CMT1DUPco5rioxw1nXEufslia2QwdsE8z4dbwQmeVmjJwYQRk/GR92dgg95BQPmeUoBoo8/bvDXOD3bUaabIrzXP2fa7ln3uWhdr92fEWobs8c/9QmjsIvqpDSnKpNX73klZArKeMCZpE/Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:01:10 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:01:10 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 13 May 2026 18:02:14 +0800
Subject: [PATCH 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow
 LVDS Display Bridge child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
References: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
In-Reply-To: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: b38a5f9f-a44b-4435-13bf-08deb0d68efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|3023799003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qVG3+QbmnKDs93eVYM99FFIODUHako8uy0Di1bNnuqYGlThsc0MbERy+tGIlLxICV2YXFca5wRpp/aukjaUj6ciwLWKjYBhUJJEyuIBQ/wTpt7BwPpYe4Y7r5PuA9XMeIoZgAzpeZi7KR4BL7qFs3WrE60zN5D2j/88k2Qq2KLNNKSNcn2+W+lbLQj8AVRwPvErmhCqAogVIZO0y/4kokkhm/InmKlex2LuzIuDAIn60eEisWVzl518Tvhkl+uiulmZB8tV6C+orFTZFgjHRx1LU/ARSO/EJ0CrTMNz0t40/esjQ/VneSzQ56qW8z2oxklYXAKNm3H1lKn85XnUtXecCHV+CCpE1z4ZNt6jqXC+xG4D4hNe18n2oMInqQAkI+WzzIzKZ5sHIhphgDrI0zMmbzza6Xuuc0Gqoi83CLVVpFL40EBk6vP/7T11i3ZnpWywnDi3pGXg682yGPrN7BWeF/LPAggtsI7FWS+q1YI3AiauvBS4i107XBxH4/qAiQ3x/DwZKolqEkWiWgruYqu1jup7R0j4Mnt5vJ8j9I+3VLtNppv7Tef5x4gfpYylyTHDW44wi0bZzn6599cf66gAPEonBqARjrMNnn2Bw1PXqmlnUjh404UA0tIix+TrJS3fPvs3Vu5KfOm1lVFHCnkFLN5j8wJn76asl6uBydSkvclet9I4Aluv3AhEu+L6d/6Z/nHrH25CZIPN+6UeQB+0u3rbnuhTWmlolFeIuYyHc2Q5WbrHYK9aUPUgJ3XA3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(3023799003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTc1dHNOL1lRVU1DcWVMREt2K1dORGRhT1VsNE5OdlpFWmNPQW1DcDlPU2Ur?=
 =?utf-8?B?RHVtOVZVODlqWTdjY1UyU2dKdGlyMjBBME9COW1FYXJqSi9yK2M0cjQySUlR?=
 =?utf-8?B?OHZObUp2T3pOTFVHclBidWFQTkw0VU5XT0xNSnJLMjVNdzdjdnBtanpGMEFH?=
 =?utf-8?B?OXlFK0JDWi84M25zWm4vbDZvTml5bzQ5dGp1R3JsY1hzN0M3a01TVW5kRXRW?=
 =?utf-8?B?a1RvbDFXTHhyTEF2bUZjbmdFN1VJNlp5TTAzV1o0UnhldWt5VVdYUi9Zbm02?=
 =?utf-8?B?SVBEM2ZwRTBUS1VSR3hLZGF5UFRIOUhXYlRKelJxWjdubUFsS3cwTWt1czRv?=
 =?utf-8?B?MnZMN0d6THhhOEd3am42bml4cGJPaEhDUjVrdS9UeXpjSUdRVFZDR3Qzempy?=
 =?utf-8?B?QnlsQ3VEcCtuNVArMXRhNUYya09abkZvMEZ6VCsrQjZjZVUvNThVV1FTazBn?=
 =?utf-8?B?NStabmxVT0x3UHdNbDZxb3FYa2hXbHAzUnJ2VmhIRCtSRHpablBKMGpWbmY1?=
 =?utf-8?B?VFhKTVdwZWFHSEFmbjFmQzB2ZWtLSHBrdHpnVTM0SWJRNlgwVUNQZTQ5OGY1?=
 =?utf-8?B?Sm9ScElmNFVBWDVIWHJQOFlSZ0dmL0EzQ0lhN0JIVXN1NDc0KytkYlRHVXVL?=
 =?utf-8?B?a3RKa0lmYjhNUHl1MXpTMkNpSnhxenZGbmVQeFVySC9DaURPdWdVUnc1dmYy?=
 =?utf-8?B?SWFlWkhKY0pyaUV0MGpmcFBqWjFxVGlGdXlEZndsSFowcGpqOXBWMHBnR0Z0?=
 =?utf-8?B?MjhtU25RZ3NqbVg4UmYySmZneVVCbG5DVGp1RmZ6akhxcXUvaTVvU0FzZFFv?=
 =?utf-8?B?TUZESHZoQ0F1bVVoSWF2Z1FQV1hrZVArT1QwTHl6VXozNEZEWndFVUJJc0l6?=
 =?utf-8?B?Q1JkWTE1RTROcE9aZ0ZkRVpvanhZT2ZHMnBCSFg4L1VQNHV3bDVxaWVjY1dU?=
 =?utf-8?B?OElhRWU2SzBpblQ1b0FpNS9DS244MVhwdVNqQWV5b21SbTl3eTFLUG5NNkRy?=
 =?utf-8?B?QTdrc0JUMUw1eUsxazRUUnVNOElRaG5pcHkyclNnVDdESVVmQ0hOUXBPbDI2?=
 =?utf-8?B?TzNtcGhxTTR4ZkVOS3EzRXAvM0FBVTFWMWY2WU90cnQwY1pleFNETG5rR0o5?=
 =?utf-8?B?dVF0SCtFL05iZ0N6K3VCNmpuZlBxbmRSRlRoTFhxTDY1NEE3ODRNK3pLaGxD?=
 =?utf-8?B?RlFzRW0rVGtJZndEdFAxdGw4a1VHNlM5QVBIcEpPZGxQblpMOUtIT0NSOExX?=
 =?utf-8?B?R2txUVFhNStLUTN4bVI4eklHdE1JUVNobjIxRVQrRmNmelNucE5OWU5NS1Bv?=
 =?utf-8?B?c0lReXdkc3FUZTgrYUovb0xZSWYybXR5Tm1lbDQ5S0Rmd1JreVgyTS9tRnZl?=
 =?utf-8?B?V0Z2VVpZU0RlUGo3UUJYM3R1dzdIckplYndiYVRuY2thVDFHUFd4elpYdldt?=
 =?utf-8?B?SWZsamE5WXRPSkhWODVxTXNNSUo1aEV1a0l0TGIvVlRGa0syelh3aXR3Nyta?=
 =?utf-8?B?ZVBmakpmVjhCR3hoMEovU0FEdmo1ZDhyK3lFRHlGK1VjbCtXb2tuaFVZMUx3?=
 =?utf-8?B?eHRId0JiWFhDcFBPVkh4dDYyS21SVWdPODVycld5L2E3TDRnZ3R4clg2SmEx?=
 =?utf-8?B?TGZRVm04RlBPdWlxR1B2MmVHcUlpY3VYRWkyWk4vd1czK0plMWVRa3lad3Bt?=
 =?utf-8?B?YnV0emZDRnhuSG5Bemo2bkpjQ3M5UmMyME9WZmxabzJ4bFU0NTBxSHk0YTd2?=
 =?utf-8?B?UVpjR0dJZWdLUCtTV05hWkZ4enAzWjFpSURPdTJGTTFTQ3loc1hXaUZwb2JB?=
 =?utf-8?B?NTU2OXZFcndodU1MSlRXOW15a2t6bThHKzEwaWNtd2dteHE5enFZc1I1Q1hS?=
 =?utf-8?B?bDFLdHJZTVNNT2syd0NkSHRDQ1dQVGFJbnhaUld3eW5MQjFrckRZYVRhcHRQ?=
 =?utf-8?B?VkhvSzV3L1cxUHRwOUxTRHNFRW9wTkRWN2hhQTlZZmdSL1FLM09uamdZQTdl?=
 =?utf-8?B?NzIwVTNJNlNqdTBOaWZMdHNjd25QOUtEV1RFVUMreCtaLzkvOVFuZU56dDY2?=
 =?utf-8?B?cXlqZTJxbzI2alExY1gvTVJpaCswdVlSTW5UM1oyUnVQQ3BaNTR2cHo3RjBp?=
 =?utf-8?B?TDVlVnppcnlBakFLSEVlZUNFcjBsRFRPYUUxWm1PY29iNlk2bVZrcThYRjF1?=
 =?utf-8?B?RWVMVTExRFVsd3BWK0M2dUhtaHgrQmltZlhFcDlYdzhQM2NlTngxckFoVHox?=
 =?utf-8?B?eE4zVkduOUZKY0E4TWhMbnFlMzFIZWhSTmM4SldEOEVGWGpVK09aZTdseW9i?=
 =?utf-8?B?dC9hV3BROWNQb1VvMEdSdkxVT2dOQzhuM0tJeERLUmsvMWtjdWp2UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38a5f9f-a44b-4435-13bf-08deb0d68efe
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:01:10.3534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2zItFf2jPC/l6Kgottp/aYX/+HQbMCQFl+CdZdBRW87FbbYdqZk/8KvRnQyIOxWIvwPqM1g36RdGEjyNpdlXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
register which control video output through a LVDS interface.  Allow the
LVDS Display Bridge(LDB) child node and add the child node to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index d828c2e82965..ab563b457e07 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -92,6 +98,11 @@ properties:
       - compatible
       - ports
 
+  bridge@20:
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+    unevaluatedProperties: false
+
 allOf:
   - if:
       properties:
@@ -163,6 +174,8 @@ examples:
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
+      #address-cells = <1>;
+      #size-cells = <1>;
       #power-domain-cells = <1>;
 
       dpi-bridge {
@@ -190,4 +203,29 @@ examples:
           };
         };
       };
+
+      bridge@20 {
+        compatible = "fsl,imx93-ldb";
+        reg = <0x20 0x4>, <0x24 0x4>;
+        reg-names = "ldb", "lvds";
+        clocks = <&clk IMX93_CLK_LVDS_GATE>;
+        clock-names = "ldb";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&lcdif_to_ldb>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+          };
+        };
+      };
     };

-- 
2.43.0

