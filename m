Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144619;
	b=i5xONyByUZEUL+BfQQdMmbuXAWpjTzFzetY5+x3Iq8DKxZhTO+c1pirGkAYT3mPkDOUi
	 KUuUBKbN95TDDAaZAcB0OLP54A6vcP26MJ8XL1a30ilEDQ6AkfqoETVpyl+tvXHfzdJ01
	 bbB5oN/Nq/9o2d217eK64hQtkQrPw52qliQZ2aw6GmDVbjesXrRKTc2NguOn0Tzs1wIcY
	 BVh+0Hd3bcGHJU1S/pt1n7Zi0DVnVVskKJHrqWyow9d52PduvJA5/1jSRSFw2zRhAdm+j
	 TugjuV+K73CpCbyJFHR1TK2E8yh0usjv6oi/hbnobTl2vftTk6/g263H/Td+5/Zcpeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144619;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rGQGgrPWWyJMAJ6LSGrAKec/66ZxRTKbPl9O9VhjbdE=;
	b=ya2N0ZYtTe25NGMi2UoEPJTN97MwfMjhE7X+57+78LFpnc5XWmEKd4UYft9B1DHS4fPU
	 2e/t1pdXpyS3PNRKKH27Jkwe01xcrx84iElz/sUtwNzUFYPeLFY/JaWCPfBDWG0BIu/9c
	 I8R3aTEcUc1YVhUaDkHLYrsdGywlSuXkDzBfDwO6XYrFga/ckwegCyCUk4r48jY7+b9fn
	 jznYWKyKpcRP1s1Va8zNIJF3ifjc5S9oNLf+rdyNK59S3XGwm56sUtRErBqS4zvc9f+Qg
	 s4aBrKMM3DDXyGjI9uQIwHSRUXi1rFmIj3UeEmmkYSxKrunRig7twP4JY7iRLi37ccw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DhC5FjZ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.12
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5D60A2600
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA5D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DhC5FjZ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9ERoy+/tXfljifjxxAyFpvExVRTXpsA2lVKmW6+Sq/MyiMDZpqtsHTD+Efm+cPZFEMGQLpgvkR2gz6SD1ChoCVbiTWV91L8u6RF0kZ+mXQPQTJBFHWQdNQzWgeIHYVAQWTbOe5A3VvxNfI9WLTPc0igXTdzRB/oZO+5cOArOeMIBNJGTHFSaXDkTPcXa4/MrXvlhouMaVpm4Rbal4snOxnYHM7mxRE4G+xMgZOGElp4ggrkVxqPMJUotqO/DlDra6MiQS7V5yBi8nYGZHui1F4qx2PRDaYyaVcsyJt4vq5WBhC3tuUtULI33YZJkcGm3xnzLci2tgGTQOTj+Bh2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGQGgrPWWyJMAJ6LSGrAKec/66ZxRTKbPl9O9VhjbdE=;
 b=sdRzfDU5eztLjTgpw/RllpRW13ca/XzAJoWyCnqyYI8EQK3xjX5VhiIunqz4s5ceobEsaWk0MgogNf2Mf/Z34WHVIuGV2Bs8DovcJ7AIezA+1Wp6eKA+L7GAXro3NIbcCowpeswJR6cHMAWyppNfLzQkbSO/BAO+SPHW4WTKhO7aWaB81FXb0Ps3e+Uj17q6ts2lyFgeAzE4Prvz8b66sOa9EWxo8gEEzEvpsZ5hqW8+ikvUSqW/yU21ehwwqPYZ9H7e+lMPj/loDxBmANQcdR9jbue9Ll6pE+Syl4WKWXW1eOd1MectpDwUYJIPwXVKoTLKcJK+VNImv1hvmAylGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGQGgrPWWyJMAJ6LSGrAKec/66ZxRTKbPl9O9VhjbdE=;
 b=DhC5FjZ958Uih6wGEkpcuV3Ha9PIkxYiO0IUGQQCNPX9ENgvNa+euIUZSRoZYvBAibuxvsKauE5gZXLQx16bWDY1NLt0t2COGsvIAtPKIimCtFFbt51qyxy/EMnZz7U3gLcsSUMyq4wTLgpUTB/7RGZPFGybDG9EnKKNYtTydNjD/7YIDvoq2kP6XFIVi7LG2E1Dr5h+zG2Y/HA4QGseVzRYQXGjgcvI5tsnTJ8GBh+aZ7C76LYwvgZ2IAtRKd/+YeEnH8O+LoePpl2e0Tj71aBU93iRdMONSmIAAlP0iY8OBsP/vnAXsyEoq7SWjJGNFHXAhjROYb02bHMyeV2/zw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:54 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:54 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] arm64: dts: imx95-19x19-evk: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:52 +0800
Message-Id: <20261120031853.1175454-7-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: d507aa4e-7c0b-41a1-348a-08df46b4ba00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qKWnKuiEZPyUouv0tbFj5M4xEKkI31dw7CUCsy7Y/PrFqNYowCZhu4qPtIDRve+q7sh/D94sdxnxXNOh1Xi6U/NJCNhlNhrRUoqgjLKXRZ2zVs4KGNuaB06ydA6p2Bq7q8Plosldzn1uRzR+BWBvSjxrF23wzkBbErUY0PkSbL+l7kdhl01Q3xfyfwjUxbKLoiTvrCWdBVVjuL6/Ai+pi4WGYSAjvMzQf25QbYP4fF/qMKAB1agyJo5AZUYDENwUl2V8rp2Aw74Jk5MhAO7bmWFvZ8kzx+wez2+MyhZ3PKQBTH135YIepBpw6medOX2v5QgTP2rCwQAYSzkRH52813BGPFSvXJhksH1wl4lHDEYj6G97nZS9u4+RUnYnftNnsBkB+iIl3ijhL0BUz3CdNSeVMNobEV+zq3/I7xg266T74Ub9S5IOBbBV6erezIH9a7e2snE2P0IbVbHfWfs/mfXYe4vilaAykYd7OKmfw3vXGWZ7WA3lGF1tQzt9J/MTc/883awK0EaB4T4c3Q+Y3ZmMcS8RKQYX9J771tpaF05tuPe0S4bVz4IBatjINbNHS3TpkQYWFBLq23y6ZajKJSzecZXpH/yb9Z7fTv5D2IcyioiTpXobdhGJcP9sVuI+ZGKdZs0XRI6oJADfRY2OemMAbCVyoJiYxxoGWLwjbTkltzv8DMj3xOkDwnLei4Cw+IezE89giWvjiSqQ7dtwEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7dQFn+cZcthcwXsTI550pPqXE5osybaN9hks5EFM3sU5iqg7hiHgTIsVdHaj?=
 =?us-ascii?Q?SkaHMU4t/edVaQ4GyRKcw5wpNhIXH0VsvO2i2pGgCz7cm/jWO8Ob6Jl/rHSO?=
 =?us-ascii?Q?+9qSgNiEQcK4xfNGkkvUA/q5+0NeLbQOOssJVvyYRt4PElHSJXVnFrg7o06v?=
 =?us-ascii?Q?1OpLDe8jKVFtfxQEIXXUGCghe6tQoNNi/+ZMlLXZlwvPGTOPrVChUkZs1kts?=
 =?us-ascii?Q?MhhqaSF7ilWCAnEOJtkLITLqmtypkoD9pVe1+U/l+2xaislvMrAyOB08KA7L?=
 =?us-ascii?Q?Lk5MJ4OJaivJNCUtwhHDSQ/h7pespZuQ2VC0jgte8Ft/tB5RJZ7pwOn22Wiu?=
 =?us-ascii?Q?4IL/bLNqSPp3JE/MxXvjH7BV+ALBqgR1u5+xOuofLWqi/X8K3jeqVitaZfV7?=
 =?us-ascii?Q?x7BO4h2n3NPg5FIPR6y0O1YrdOJmBTNrLQPdLFaSoJBNcOXfioVCo+ilHOWp?=
 =?us-ascii?Q?QXB5olECBQBUvF6GAiW8b4WFleyCwDrnPbFez1LE+lIcAeyuX3w2dr3E8/jV?=
 =?us-ascii?Q?/JUjXZotZ6lVZDqWGfqJa6rXUiBLkiZp/kiaXDZfGAqqrOzfD6r7TWah/lSr?=
 =?us-ascii?Q?iZZ8Ztudq4KLAg9e5RcNvgiOmu+FMZDsME/sF/4CxSir1vWkZY+LQuSvE1mh?=
 =?us-ascii?Q?kVLj9q22i6PN0PuuPT8Xg13r68dw/mQymfSIuZehZK1KoDUV8eLKVduQdiF7?=
 =?us-ascii?Q?K7x9PbTR7gk00TLBlTw60b3KP/qcfwjdwe9vok13znQBPFkLoJ2+yNUzssUU?=
 =?us-ascii?Q?y/vpQAtC1pPeBJShxM2Sy/2hwbvPE2m+8fBgNUr3HUKCu62TMDNrVAbkiylX?=
 =?us-ascii?Q?YoFKTv9FrGT54g6y9/m0nqOm/+8XAS45KvyJ4n0Vv8Vzc+a89/aAvx2nS8sV?=
 =?us-ascii?Q?AjCmPMk07/DpwgEcXYnFmVzkIsho0jt48Q9cdqUsngX35gJeUmVRkoum35LK?=
 =?us-ascii?Q?I4J93WUpfxzvQVFhblAxkwkSgQXwUbGJ8qldfsGvekq1RrqSn4p6DSGS1J2+?=
 =?us-ascii?Q?/0+tvUpyI4bDgrGIe9b+oqVODRCfRUT7vCqJ5zscAuHx2v3ZVnCf4IacTRM1?=
 =?us-ascii?Q?kipIAgfyS99kU9sPFEkoV6VXK37K+7XrZqXdGb15MDRoyLCZK16qvx920ieO?=
 =?us-ascii?Q?M45WqMALO2ixKiC1lBujmmeWIFXloRn3JSLpd0h2cz2fIJEf3g/Emsx7kCXh?=
 =?us-ascii?Q?/BaTQeezSMfzkMeR25DYRVKe4VxIgpXT+CADlooc6rxIYXfc/LQ8MHUEXADG?=
 =?us-ascii?Q?NUBMBpJEc/0lKR23cMIkyTQmV73O/jgb/L4lnaMfrAaRSyJwSIEXeLN0JYBS?=
 =?us-ascii?Q?tCYFZECnkpLBmTUbMr6YsN0BNgDGVmzUcec6Ip0jZikF08KwlEDKt3qK0JTm?=
 =?us-ascii?Q?c/1soTNG2NSHI7hPXN8r7OvGOvxJzz/MKsiig/UwNNyI3Q4rZvAq51Aw3rBP?=
 =?us-ascii?Q?9wnuDGeNKq09z3+nA5gql0lMQHNUYvhtpScFY5BUaPBIPYMnJ5Yw3tSv23sC?=
 =?us-ascii?Q?18vSX/Cq7nmHc7hbAw7LS44PH0cQ4r3Bq7Fr26A+wz8jPFmKZuGIBaXFVReC?=
 =?us-ascii?Q?KE4vGFG3F4F/WyUeSR7wMHKCBBcJt6d5mTxyuFCW6PXrXQxu5TEy78OddTVZ?=
 =?us-ascii?Q?kTf9Yng9GfJVNcv4RA78X96Be5hsZ9sGhKvevOsvm+wJjES68oaBubI6ZiUG?=
 =?us-ascii?Q?Cdt+QgubsuNbXVu9UxkVpMELS/m0i3gs7zqueid1FeEhdW2EE+xir5WpLImM?=
 =?us-ascii?Q?RAEMXmbWquoyGeNC9+/rqtEfCS94xstvXSaNzyopu8Qo1kfX7Dvg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d507aa4e-7c0b-41a1-348a-08df46b4ba00
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:53.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Vq/znmsr5MLg3/tWtzm3YGwz548YVBlr4gvaP2Q+c3KnWn9M3h9Tr4Zt35pR154JRtmwUuqokUcSzXwBGPOYZwgqDOqYk01oUiYgNio14eUeec3QAhv/IBXGI2MpZsh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 2 channels to match the DMIC hardware layout on the i.MX95 19x19
EVK board.

Fixes: 288c31c92f45 ("arm64: dts: imx95-19x19-evk: Add audio related nodes")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 47ed0ef67611..86ad58d033f9 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -52,6 +52,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
@@ -278,6 +284,11 @@ sound-micfil {
 		pri-dai-link {
 			link-name = "micfil hifi";
 			format = "i2s";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1

