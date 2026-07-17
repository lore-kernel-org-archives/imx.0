Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84F34F26F
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319336; cv=fail; b=bhM+6B6t/SP2L7Tmfn5S0DPPR2tDekZHfk1nRD9a+sCCN/H6AFaPOLYIHOAWTWU4PSPVXEvQjxniyBU3iJyqOI5QYBMS6pgHpw3rD49mH4mt7FMPC6HRN0Da4+bR5BwiNVz/o2XWeWGoEDNj1SrcI839hvjXJSf0dQWdWkYm9io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319336; c=relaxed/simple;
	bh=Z7y8ln2VTmFPeQXp5/yfznz24GNj5AavazF20FEYb+o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eJJOBNyKKmZ2KHFZcgg8SAd1YeA9KK/vy2Y0IXIBejd9eFMEW7YSiwGWi0cZMVCVrwaUhHSo0FYEEAhjkaFBIjNgnxfS2dvpDoLYG1l0Ea1XB7H15YoAjZhtuX9DCVNcuAnKJqkPIn/qAFQPbxp2yFSTtjM2emoGl1bPPucKW/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qtTXJxTZ; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qtTXJxTZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtKpcZK+ZiUo2sEO0HIftTzT0zEzPThAUu7Ids9DFShUTu2VXgvJhTGA2omRqT8kkKPqpnokgIfDUGb+p4l+SMPaizV+nKV4+uwRfI4X/Y5z79VvkaKlZaHnRlZU3y3kMZBia/lxRfIUQNrjoXE7wyF3ppflGYQpXpd1OWCUnUIsmRqZFUS5oCZ4qiI9aLGq4xcm/1riFXTseT3HIotbeZj+SJ0T9gtZw7vBJSfOjvIh9HgqficDrr9zmMvymT9F5ZKPhbUPuDnX70bo/hmToFwY0BwLIqbKDlggsyT+QlSF6Rtu60fM603UDSAZth+ewXAn7tH1E7ObJbbLVP/APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpCBY9qMOgSc4ot+3Sr+jcSMl9z7SuZ/W3zPkot+flw=;
 b=D+agDQNFZ9G7o/t7Kqfbo3Zz26qkmhe0jHjmoHdZkNLCdxbrNZDAtKy1x4cS6NMk8nSI5P0BySS8Ijd2hDP5Lu31aJDs/HjBMM36d0QVoIWzJg58vayRGv9xtRz9QQNPWLlmTwLUT+VWdDbzdiD35WPb93pwNvi/M2BLxYFfNOmg/Q+vrqGSARTw+pwsQruLcEvPiXkWYhIdHF/9uAbAKQ2GuRowP79iKL1qfIt9+geHUGlP2KnJfcQnElwTHDnZhClgEKu8ScEQFIPozWF2smoT1u79/Rp4YGwAR9QV1DxQFtf4KzDlM/lm+1WTew2F3OMgZZoCjInh2yJnFp9EQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpCBY9qMOgSc4ot+3Sr+jcSMl9z7SuZ/W3zPkot+flw=;
 b=qtTXJxTZj6ahCExR8E0PUbqxkef/tytxwPlrkNgiVBaabveg72sTLUmTgHO7Cm8lujOYoLADyQsPTXtqQS8UDRwGXXuQHzxLIyGY2biZMP2N203e9KH4NG+WWS2ieljgRGJvLVNcRcjCqsut8iZCNPLJIv+2lTZfDL3/ESkPwLyDmLdvJDKZ+xJIXH8vFFRQSKCt/eYfCWUBTtdv1e1lCbAxdUF+jE1T48MMiDbIGMC34mpGfGXAbtSFtLp7PFzKeNnNu6LLk9v9+ISayhuyLbtudQEgff/yjTxhmp6gKonKdIPF1gdvl5ygGePz1aTu1PepiLserEAl9zRYB5EjMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8588.eurprd04.prod.outlook.com (2603:10a6:20b:43b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 20:15:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 20:15:29 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node
Date: Fri, 17 Jul 2026 16:15:17 -0400
Message-ID: <20260717201519.844259-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: e08f7181-e8fc-4651-3671-08dee440253c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|921020|11063799006|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LZd7q7HqKYcJe8sDV5r+zzJkBTZL//i78NJLfpvPJvu6yB2siTiV2lbSA1nikd1y7hj4pAc8dYDzatgpA6GAYDejqBikoYpUmSxOz5nyMPUeA61Kj82K0DQBDuMk7tgY9MMlwDHmM0xekSxyHXp66w7N9oAJ4nyh5ZimcxIycv3T095yN1FSHeVeyUHRjMlQzkcGSNjHPcMolE+crAZSkl7fRpbYdSBRbp80jQ7kkJ/tgEOEsrxnNHdCpaMD0fCDkiu1m+UcaIDq9gRkSYTc/dGTXp3mHcK14ni72WWw4iThIzg/h5JmFz6ZywYkvlQt29BtO/RpF9BQLpzCcdm/rSlKXHxmwRNViJU9cqAkEI1+tbfWlVVpsB7TP1dH3Re+a1FNqB2v/gGUFTVU6J4TxCegqLS3N5csBscIOiZsCq+HAwYjFjiQK4pyBAY5tgs9op7JG4I4v9/Rr27G4iL9Ij3CWP6ko8kAt+fnypBz+zjK8ff6mzcco4apLotup6kSlad3xxNjZF4qX1ypWstAtYaQmV3Mze0LdD9SYCIisHN8otl6JB8qUWQmA0SFxz8Nw+fUN17+OEbKk2m4YTVrat/ODZyNPjbDVsEnlnBxZ+GUupZsZAqdLNsdWdH7cPFdcmZpX8a/d02fX0kQeb7hFgU8+Pcy2nZQ5bVdOHJyZOEFBTAXzt33yaqhczWmIztnJPREl5SN2kuudLzoEO14KQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(921020)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gGyWwkrP3w9W/BmCiMAgHkqBT1ylPti4SC/9+2TqhhrSj4AobhPWPaWcYzYV?=
 =?us-ascii?Q?QspW2zr/AYQvFpex11PWEQVMuNAeuZ4qPd9ALnyE+8Y8chS8Ljt3Ugz66+eX?=
 =?us-ascii?Q?jrGW2spL1wVPZXE9R3izl9bLULD3CL4k6fnFPz1Q4msEIlHiqBOdnc8WUfwd?=
 =?us-ascii?Q?LoQLZysFLXn21yKhuD+maoICl57RFXFm1jROQ5VG+bj6lMv8f2024xcWKye+?=
 =?us-ascii?Q?A9ZhUf9NwIUH4WHC+ZVVrtphkn+DAMESyT6+plnjBQ+DlBxlWp/RXWnxtX5w?=
 =?us-ascii?Q?TIFCL7foewe/LPGPFS+GT4xQ3Cg9x+cbYNmkCZtS6YW897vNgQJ1rD7kuFGE?=
 =?us-ascii?Q?xgLVYAehvAC45sUEkFwErDP5x3coZKCgd5s1xnvXEByKXFSHaBrdEQVwjVjh?=
 =?us-ascii?Q?r/k8pMNB1Nr8KaJU5/c/e799d60kUKdWuQ68V7e14E0g+KpwXUF6iIa9dSy+?=
 =?us-ascii?Q?YPLjSIOeMTvCwT85S8VTR+QDkejkP3sIZ0uRhfpl2FX4mxRn+kJcNp49XMZf?=
 =?us-ascii?Q?lsixnwl3EP2IZRaGTyWaeFOi6yr01mmPdMbK9y707aloSWysyNozwXhCCrcK?=
 =?us-ascii?Q?w+uhi1Mebt5zncsdkaOFylAIPK9JkcxNgAdtZ+mKMMNbvnRYKESyE26w2zjg?=
 =?us-ascii?Q?Fk96LODF00vF3fr7tT0YOE6QbVxz8/V/7cbVtTALo/6ySgXJgPvMI4fsAKxS?=
 =?us-ascii?Q?KFY2KgZWAeY5A5bqzDWnxKVqEahy3IpRbHrb854uJ8I5Ytg3McqBhfuy7zUf?=
 =?us-ascii?Q?5HcmCJ1lrQHFlmyOgLCcwXgPChB4jIXcW7mDgtFqwMAut+HfxeSaQ1NqBZ8F?=
 =?us-ascii?Q?Oy/sB+ZbMD8THXFoV8Jt03qhXWP2KU3uBstMeMerTbtZ9wIzR+jZjtNaPEyp?=
 =?us-ascii?Q?Hz4kDQ4BsiV/GwrlMlwGc/Oe7Ky45sLRMup/R+WmPmngSVoz88BjfP815IzR?=
 =?us-ascii?Q?Xv9DmCWQjd0YfNzlktwcQ2HDne8nQyZq2/Jkuyqcr2pIbRkd/37DgjsW05y8?=
 =?us-ascii?Q?xWGKWmZ9HeQHHyTYQLY0OOrflKWO/8FyP1kgJOEwBWzvfSNEYg+GJTchTix2?=
 =?us-ascii?Q?jtDuQcJPB1Cv5KFu0ki6PbMVKgns3xJ7D5ZjNgAslS5qMfbLLrRPoupNn4xX?=
 =?us-ascii?Q?MTHBkQyM+Nmh167EPlR+G5r6sJdYNHU4T7Yfrt7FbUZpNVNojZcrAShsnQMS?=
 =?us-ascii?Q?uHMayO5eSTPLlrq2lQzVpdh3ouHUAny/QfGNxSfNBjMRy3WsnfZ4IJfOxNyJ?=
 =?us-ascii?Q?mJXxdACTYhbGyrGokPIFJOBJWMrrtX50n0G2+xQ4MTM8G7K7p78hb+s/5hf5?=
 =?us-ascii?Q?ryM4vk4E5VwaOXwYxnOgD1PPcn6Ic5ee/Tr7H24unrNIdwic9knCjX1DJy2F?=
 =?us-ascii?Q?V0vJIKIMDf4F5pRWCRYNwi94suNhUyeWScO1GRKFJzKDyn7CdYQ+1WWs10ce?=
 =?us-ascii?Q?r9dTr57UB1QY1Jj3uHV+P7wRrsj+3vmUqVoRvkmE4zM+zwkWRAswemOlGNve?=
 =?us-ascii?Q?Eo+yHU/k5oBN2Hl2peDIiGXZBTreAgmcgGfRg9pI5QPKnNM/OzRb9339cu2W?=
 =?us-ascii?Q?f7U+PSS1w749K6zf33ZStxkv5aOp3LYHqgNSW+nFjRraSivo6t42G4Ex/EUw?=
 =?us-ascii?Q?c9gBPEqVVMHzyRcQ5Gf6OQV8M5GpNe5QmIkJzd/yJEgNZGaNtnLJjbFMqI0v?=
 =?us-ascii?Q?EfPkkTL0rLKR62Gi67f6P9RF7F1sZ7WLXjAl0qJ+7NyjG5ZOD/xcWjylzzOv?=
 =?us-ascii?Q?TjoRU7lE/+JBOcmjIRU8d6K0fW8rBfK9lTFLn3kgb3YJMahTSMZi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08f7181-e8fc-4651-3671-08dee440253c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 20:15:29.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viipSo2bELwDexx2UqHI3MNfuO+r4Y92eZ43gxHkI74Kxx6Xr2PSnfqeBGsq/PbCv+mtnFNgFK0JLrDM5iQf5zvBLAvZnTS4UH6Wuhp0cdlePot7WxQlY7CGUR+vT34p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8588

From: Frank Li <Frank.Li@nxp.com>

The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
register. Allow the LVDS Display Bridge(LDB) child node under
imx-iomuxc-gpr.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove status = "disabled" at example
---
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml  | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 721a67e84c137..e1fbdc7e4e057 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -47,10 +47,21 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   mux-controller:
     type: object
     $ref: /schemas/mux/reg-mux.yaml
 
+  bridge@18:
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+    unevaluatedProperties: false
+
 patternProperties:
   "^ipu[12]_csi[01]_mux$":
     type: object
@@ -67,6 +78,18 @@ allOf:
       patternProperties:
         '^ipu[12]_csi[01]_mux$': false
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: fsl,imx6sx-iomuxc-gpr
+    then:
+      properties:
+        bridge@18: false
+        '#address-cells': false
+        '#size-cells': false
+
 additionalProperties: false
 
 required:
@@ -87,4 +110,39 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/clock/imx6sx-clock.h>
+
+    syscon@20e4000 {
+        compatible = "fsl,imx6sx-iomuxc-gpr", "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x020e4000 0x4000>;
+
+        bridge@18 {
+            compatible = "fsl,imx6sx-ldb";
+            reg = <0x18 0x4>;
+            clocks = <&clks IMX6SX_CLK_LDB_DI0>;
+            clock-names = "ldb";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                    };
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

