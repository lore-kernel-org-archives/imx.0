Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D662FD1A1
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450351; cv=fail; b=TEZGRj2MdpKlSmzKj58E1nWDPyoppyTqLVWFqzsaopBpI7BMiJyAX0GmEkcIVUV1uAmyjFvd6qgQRzBOuFw8pnYFTmASiM3u6MyEE66NnhpF6h5DGdu2ViB1Nv5+HdbkGwi79KrxI2BaB8sM3514Bqhb5pQ7TwK1IAyuuys8Nwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450351; c=relaxed/simple;
	bh=T57WI5SoPbMa6XB/jHjbbFBjo1q7PMfnoy7lhdPslEU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=U82B+0pIRpP7SymmmhzGynx/2euXRETX8YaGJ88gGusrvUUxE0ZrnM9J+cTkX7McBvkV7/D27F8Raga8XPCmbyxKpE5P2Otbvd88pwTFP5JUHY2GToeL2/G0+q112geL+nnPb+b7+H2BZLQ16z+7NfaFFRNGJ+4pdQVqPfb0Q5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vyu9cqIn; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vyu9cqIn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9Y+sxP27lalDFysfTHVwyllkRbVT2GfEb4EmRnhdCaM6yozLDzw/cqont0DgvhAuyRxDs3uY0V4MTXw0tOXw1RpCI+dB5oqauCTJ2QnoaHdTXPRZWy/62Sx9SYlLPv0bvSTvmFSuht4dsUF9r8+ub30z1QZUo+aNSp8F5d4LsXMitNooSZ84xFGnpn/9+EIFFLRqI0XhU6clM7BTKN34QHNy3Uo+Z2GEJIqcM6YM2kS9WcgPK5aZix6udwAeezTXtLNFx3eU/Zz1w+swN7EAy+SAPoV421qhAau9CM7OiJRUR1DOtZheI5ZUpJJY7rHnT63/sQR37FYFIMCfhbcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTHokWIOrgiJWtZYC5I5Y051EsdjSxrx6dkzMmdg4SU=;
 b=cXFyYJDnj2ZIsA+zQDJTuBHkZqLNICGpGRTj/Zy1AgLGZyAfzDQ4f2myW2Hnc9HYNddcH/qI6UIKlC+Vf2BG8/HztuKNMbQkTdWu5GD1qPIVhukm74gWEsWNLa8knOJHQTiXwEUnTEZPxDc+eLPK0V4PJhcjAo4zvD2NfZyw49IKpJlUsvuiNkAlA4bpMaNEynQA82tJc/U3wQNTYORerLcsTMkBXHTO88sPZt7OcyZwPLlT70sMCS7E2mscrzjs1ha1bqqJZnBGw5h23GjFrRhrdqpMdFdZjTQzW+9dASwLkcyDfQzhJH34kKqxXcYkUo+wMh80B/H+iFFy5DKzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTHokWIOrgiJWtZYC5I5Y051EsdjSxrx6dkzMmdg4SU=;
 b=Vyu9cqInkF8ENCANa6wyKag+3wcwrpjBOeZWeZgIzxe0DKiqb5EQCCt75JWbTsi72p7Yq9Gxuoug7UU5uhfmLHtxX22v4QEqApnPVJebSuqfW5eFnz0g5LIBGq+5ydxJ21xfB1kjoFgKUYjDvewekGy9Y3eJQk4xNrDAvxGFh8LSuKoHVu0eHU6HGWvBd3mCrDtakG16RlSPk4XqDRSVTL5U3mcNUR1R3rSM8CL7F25+lln57Ev40GlLQMayKo+8O+mStjyPWlYRhZK3+heOPe05DNrIVgKn0zeb4kkcceLYjGdVSGjw6Q22JJ1v5JwOPcBjocOkXgZ019pldQy2gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10643.eurprd04.prod.outlook.com (2603:10a6:800:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 07:19:06 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:19:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: phy: imx8mq-usb: add alternate reference clock
Date: Tue, 18 Nov 2025 15:19:46 +0800
Message-Id: <20251118071947.2504789-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10643:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d78d214-8f05-4111-b3ee-08de2672c1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gHoXiRCSnrVFqB3atz6He+/i/2GdMeM9VYFux9Tgo7+321m0riHPkmpg/+V+?=
 =?us-ascii?Q?02y37wmkQVu+LJ5MDYKD7TfAXW2Nww69dpun4QJjmwSc3f+jf4pRLrT9k6Xo?=
 =?us-ascii?Q?2mwOj+Myoe3kkeuNRh9cn169aWQl9jQqgkW/ifuJafu439VD8VMYaRQgf13o?=
 =?us-ascii?Q?zpHLlpcPoguItZpNnO0Td7E3HeHxZSG2GGfFooKv7PNV7WHW0+INKAEN02Zk?=
 =?us-ascii?Q?7FmA+6VxJY4Q4sogkoWzlwgz5tzv34cIlhNBjwbd5SopllUM/l3Prp1iyXGP?=
 =?us-ascii?Q?q7TWq4PU0QQz6fyZMV4D3GH/4ujj1CHn8Obms4JT8DBKfA8tdOAKTba4MhEY?=
 =?us-ascii?Q?15IbvzeAA9kPtBKimW0E/N6FZb3yKSGj/ThbzgR+4VgjeMFKlfIYbTU3+OSA?=
 =?us-ascii?Q?y0NlPSn47o7SjAud/YENHuQGmUlpF5Bh/OTbHmmPST3gWEdPawg29qJGjUra?=
 =?us-ascii?Q?w4PbKFlYIAORK/UJ3i67IZ3JDf9w2tS91l5uRdGmOPfolDRWQckAwHeV6zWq?=
 =?us-ascii?Q?DVtetLNtLoSIIDuGC84HS33a3kVzGIF+A4Kej05yGbFzsKryAmQ0USyBw5cF?=
 =?us-ascii?Q?4NuzLo/Xdc8al5uMVS4/Cv0MAw2amXRwJq4ax9ftDanMAs/xaJs1g6NXonzD?=
 =?us-ascii?Q?JMg9VDrHxPnpNm88a0owDz212z+aqco7x1H3V7xNOFAQ8ukVctWbCPbewkPj?=
 =?us-ascii?Q?MG009bKyp4pmdC+UGsxBMi85ey3YXs9iQMKFKTTGIvuj2zB/JlnJbrJ9uEJP?=
 =?us-ascii?Q?EHRYjMtV/6hGokVOw1xVd/Z45TUx/X7hUU4Up+oRDmOE0RZpy1sQxA9tk0ww?=
 =?us-ascii?Q?cwzjr0wyamcddwvGEwlZVrQT3yOgN0VYAIbKD/kokuBUVRfYylBwWHfbjeZg?=
 =?us-ascii?Q?ebqEs046E+WnXqM18QPBhUXK+q3/v2jCgRTg4cvRcT/hrjOxIrlsgcuy6mhD?=
 =?us-ascii?Q?Ip6chGPwInFtQ8bDETO8svUjYlIghwp6M3aacD/WY0Q8I8rYbXU/4Xwwbv0Z?=
 =?us-ascii?Q?UQ+ZNG5r7t1bJpLVoSuF6k5rB2B4ePjjyWSilyBXLoCe6wbDYn9cMOIAyNWe?=
 =?us-ascii?Q?ZeAEBvnUjYMA3k6cEdv4Lm3DRGa3QVcN9fIYg1IdH0z0YBa60hI2GxnfII76?=
 =?us-ascii?Q?Cqkl/+dJ55eCeCunltIaZgQToMqKvKy0KDaf8nb6k+Gni6kJsa1M//UiHvk2?=
 =?us-ascii?Q?cS2LXO/yr5VAMwNPlqUBUcMet9MK7wBQt5a+pcaI1z+V8E1Rd6U1rwSw0c7I?=
 =?us-ascii?Q?H/1z19dIBjy0hw9zNZRWGV/jecwJMfHD9CSkX8rJ4Sx2YhpwICOCR/W8okf3?=
 =?us-ascii?Q?Yy57h1nMEHMI7k9H6RS9u3y5N41QBfCpAOMYtLOYdbw8sPaouCXEo0HTFxiL?=
 =?us-ascii?Q?BoktQHQwWuOfPk0kswH7R7SDWvM4y32UmZb87O9Gc3+CPHP1ksGWmBfykKl3?=
 =?us-ascii?Q?KkCynOfGyHWB+k2iSIZg3Bj91rLmPwbOHcEj11XeBAo9+LM7d9sIHIC9i+vD?=
 =?us-ascii?Q?dO2fgarx/0qy+7JNadaS8oSSUVtK1QG5aD73RKQQ577iDmpBpl4jOoGm8g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VyEHWAHlI5hmkitjAxqzhphZ6YEvOJ0KdKW+BqJH3s7TYAEFbD1l1OZcjmUp?=
 =?us-ascii?Q?ceCjRorxm7g/qcD8cLqf+HrJ0EvYqR35tKXdrn2luPYCNcFq9gDxmGsLFh9/?=
 =?us-ascii?Q?PFqaI4eePSLYGB1X8FTNnzxUyW/eDJikc2Y8kkLnunY94CowRNS5DQ570GUx?=
 =?us-ascii?Q?4VZfygftDklLLUdgGl9+uonwgfkLpJ1Ofy0F0CNGVtI88qLVCWDhBsB8jo+/?=
 =?us-ascii?Q?TIVqPAU4iSoyU0x2McSaGXYeKH/j7KZpnyNBXsebp0hD/TVcglvyAde2117o?=
 =?us-ascii?Q?kLdENylg/TygKFuxz7CrtKyKDuxnfFxOLXoimM0PdijeErf7WyMtc/8SEPfT?=
 =?us-ascii?Q?C2wfo4pj8Q4XTqHrP5c51Dfz6+KIxRa4Pjcst+CxI82qvpIkNpp3rM16EGXd?=
 =?us-ascii?Q?MxYIQyVT5EonIE38+k9fIDZPeyPFpIHhjOgvmAptHX54l4EYZ31EJnzNswoP?=
 =?us-ascii?Q?WHqpjMCjTIspjDsBroPnMBwFOAoDSPOcozAEcNLpg4jmAwriLPOIa06ZW6mm?=
 =?us-ascii?Q?ngo/JiJB+yGQKFK9lxgTbubAPwBovlNyGPJvxF+SyW/VZFyZsncXSyrT1EEQ?=
 =?us-ascii?Q?HMiUmKeU6uhfAtUUbMwelh8MGRcPhBLE8fyFlEgIXEWqnqbBGyYD8GvZVWie?=
 =?us-ascii?Q?LbT8tAS4h/9ndKt+hGrDVQMPCc/sbGhuoTjTaicjzzZPYGVQ17EpZjJSHa7l?=
 =?us-ascii?Q?W0KlVIdBhPmO8rI+/Y8mINhEW4p/UpReqUZeuG/7OL/I9CSGiK83Y3Fpvoc9?=
 =?us-ascii?Q?Sp4CI+9Ybl0uz5nfehPw7vn4nhRLqLOeIPrnwYP4O3kFG0TILR1tscgdFDnQ?=
 =?us-ascii?Q?rS9nQStbEgu2aw9zYZslnfT3/CzdZJ+/12qLHHoQy/wfGKshccd+RtqkZwYG?=
 =?us-ascii?Q?ScieVa6zl0hnXFyrCCubpokaA2R7slNQJe18XHoTvzM9aLIlh5aNxh10ddP6?=
 =?us-ascii?Q?Gr5qfmOl9ee+5vONw5ORQoEzTQEVe8XFPsYsyK54eun5ozlx+Mx7paX4zJNE?=
 =?us-ascii?Q?iXR/9plieUV/sDxrJ4bt7mwgiVaJEtIUhyzorOCnqwF5aRzihe/8bdkR5xTL?=
 =?us-ascii?Q?TBS+e67ZE/xc/ySUrvJdnUmqoomHcIJVkj8H8Vo0Z85BYLaw8AONsDEXCUrt?=
 =?us-ascii?Q?ItSGBNt7Cq9Zl1eIpJRZTgodmwEd3V7ETq2OIYkEVfF1STCNsHUEcdMoJ7Ze?=
 =?us-ascii?Q?2hoon36s8T1yzW2VIc1xUoY+0pnnOYoJ+F1dB74Gp0DFi+hhTIYfHvBo17ck?=
 =?us-ascii?Q?cOWnv/0AtOq4kqEyXBXv1MyIoTht58ouB4R0Xh8KoV24v4SgbT2X1qoaGrBy?=
 =?us-ascii?Q?Ui3olH+2Wxkl7xwX+Q6pGnGbaLR/rgDUfxQ1yohBa148LSoBvBWFANsk78oQ?=
 =?us-ascii?Q?kcXmjzu0lQ01WmbaWPX9+e1yY/sTcSwigpVJaRoaPn+3cwChi+UzVdMTQj0r?=
 =?us-ascii?Q?SswwKZyr5L0Fn4H2ZzBCQEvVwZifhvMBq6Zlvkb5tZsyj7qug2P2f+j35Pml?=
 =?us-ascii?Q?jZJhkMrSck4WPrmk5uJssK7SoQMkudDVhOoqmto/+uXWnnmUvz16zf4ixZZ9?=
 =?us-ascii?Q?C/R6TJn4QZPg2Sp/hmPmWN78LWF6BYzdjpvauzxP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d78d214-8f05-4111-b3ee-08de2672c1cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:19:05.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6rzHa9qk092ymPr249W6iiWH3Ukz/BxX6eB/aa76af25VcbZkMsKuK0zQrHotYY0eD6LDYpcfFEihtT+Efrww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10643

Beside default 24MHz clock input, there is an optional additional 100Mhz
clock input 'alt' for USB PHY reference clock.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
Changes in v3:
 - no changes
Changes in v4:
 - no changes
---
 .../devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index f9cffbb2df07..8a00a6c58edd 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -27,11 +27,16 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PHY configuration clock
+      - description: Alternate PHY reference clock
 
   clock-names:
+    minItems: 1
     items:
       - const: phy
+      - const: alt
 
   power-domains:
     maxItems: 1
-- 
2.34.1

