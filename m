Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D31E832A
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745608; cv=fail; b=ogOY2gLntJye04LeMunP1+sRhgrFbxJkCYPB+mXmTL+lTy30FA9QKwMEMVAIh1nHUFowo8Nz/l7DDNXg8++RAsMDSHfVVsiycdXdJZdrBCih9SbB9GgogTD50cFXPL1x4y61JgEmFVCK1noKiiNDVtqoGZKmxdgbSQM/VOQjHr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745608; c=relaxed/simple;
	bh=Pvi6wTsPaDb9wpgX9e5N7g6DYHd3TwPmPtPIDwVuunU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EsNXJ3zHKoQ4/34ht70swblqVlPW2SpHNtmFTpxrec3meRhIqLi4d0pcccxnbXEvK1vxra0lLbkL9IZoUXxTjdTBJzKR/ipeJgJD3t0M3//Z8QhmR1BkmtsgWtBaQlVZjjkE5wUXKcuMfYpU4ncXQZtGkpd7Z/P48827lJLqSZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FKzk1PFx; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FKzk1PFx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTuwuCl0M1Uda0sDIfbEOMthpnhGX/q2S3fkdnwS0OjzbTk404Ix2Ndooep1/2/yxr+RRuEWilu4xxURlLj0IClgTGDua+Hc9isHK6o9amup+P79QCxyIVzKQ51MGJzavL2Q3Maz7OfaaeYUN+JJAMocqN/QcmdqspjvTFTx5Gce55t5JJKN6unOla4DARKXYIhNKmvWiRG4jm+10jIC9ogO7aUanq05kZC1kCvuTodIs5sr5n/AbKS6AdfGGDHOBq68LMRU1e+P7NVxNVWN8QnGEeREJJtEek/ebOcxl8xaM4vP7tfYAitk1pFopiE3csVtwv84puvCLX7nv3PLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE3GRkH9jcfnJ+gWCb5cxt5E8mRvvp1lFhZ04GIUqY0=;
 b=y+wLE2EvVjhX2tN89Z5qfqZ2DR0pERAhUHHeqJRdEBxM4uERojYwMZbzAehYdO0Sn0+QPXRV/xUAbOnSaisDb6si186ky4qkdXveJsCx86kH2gB4P3I6omKnT7Py0uqEr/LyOO+j4KNYYiD2qFkgKpXGa023/9UJ2BezqNg534ap0jpBp+AS2EMO09TX43eJnQxvBvd9kTEdWg0ewJbJ89gVbvmhJJ+YNlhn+RqLIUR304uBAmcas74YfFwKkrkMHHznm7vKp+8VWlCbX8jYg2gFvAZCfblLBKD13lPBRIY7TPPnY2LXOyuPikp3umeTb22A/98pB6FepcSwmkPxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE3GRkH9jcfnJ+gWCb5cxt5E8mRvvp1lFhZ04GIUqY0=;
 b=FKzk1PFxwedXnpLU+UBv2hUMb18lI0K7Jsm5N31vYG11LTWSXFkU6jUXreaW/EphkyxkUKpoGEplVkvBS+8wWZBoGzWNQ2wmjSnvzDaqAONYPMWgx+T9ovbE48Wnbj8XpVfUF4ilGTCu96iKS4I2wgTgJztNrziOhTL3kElKQvRkhyLSeo4u2k27OMUcJLD98su646K61OhyzX5qM/Xd4JDLEyGyWNBMEGfrhiMkVmdOxxCBIutvlo4PCrzEzLAk2FgOzzoYvZdWBZy8SLztpw8WrjBAw3BHjNCiFGupDRncgbpEKGoOMfUYOqQcJK6TXgffnRBUDnoit/JsJMpuUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:45 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:45 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: imx91-11x11-evk: Refine label and node name of WM8962
Date: Wed,  3 Dec 2025 16:06:01 +0900
Message-ID: <20251203070605.1868821-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203070605.1868821-1-chancel.liu@nxp.com>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fa843e-72e3-49c1-2545-08de323a8497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D8rUo9nL00P59qxKMifZmuEiI8FdYGqBGmcLetv/9muwMfJf1IdUel9PUzE+?=
 =?us-ascii?Q?qYn0Ls+Xw3+nJByVyyNMYxHs5nCf2PDOPM29ZaPxB+Qt0llSjcxrPOARvSNp?=
 =?us-ascii?Q?OyP3QT6/g9MznYsDfuhyQXx+SZbD6Oi8/msZYhPhjWuxxaI19lRNvotjSV+i?=
 =?us-ascii?Q?eEpYxrH6g7rfRLn8+Oq9AY+PHws4i8HomcWYtdCXG4fA8VsPakT7Ksfd6ZXl?=
 =?us-ascii?Q?TOBV+OotBYQ+YIQxNt0ELFj2bNRcaz6g5BX8jibm1u9hNose8MV6RYv9QYdr?=
 =?us-ascii?Q?KU9HSJ5CsreB5xynfqUIurZb7fXEmwDpqcreANwVK9vj2f8BKfSck9RsGlEy?=
 =?us-ascii?Q?mt6uSgTObpWqUOWKOHS3o0WbcQCFya0FGBauE6085fbFxNt4okpmN+egEiXI?=
 =?us-ascii?Q?vGWOo2PSk8s/98YHrz0BCHMZ3F2H8VMby/d4UDcTIC2a/dclIFtG3rEsZ1K9?=
 =?us-ascii?Q?ZJXP78Zg1H7+QNieBS+7Bra77pljspbgUhvCTVpXo3YjZ/EjYqyGIR2Lgq2M?=
 =?us-ascii?Q?zsFPCopk5e5DyEmIXTyYAzG+CLZX7aFpodnw/s8LvbRANtk9R0WPRSST063x?=
 =?us-ascii?Q?R8NAehYG4fOkMBuUsVDTFQkIim5WvNiDACFNzp4zoiYFx7ikFlyaXEE5vz3o?=
 =?us-ascii?Q?cG9io9dN4nAvwpvyOr4+HmqRzpAy/oOil45t9rjiH1s9519vb0JUxK7GXL8i?=
 =?us-ascii?Q?cGPlTGGfCokjLAeTQa6e24yI0E41nd5tWVhpESRkKLa3sFP40mIzVkmHEv0E?=
 =?us-ascii?Q?reDuffX8R0IrpHRv2OgRzWieddhlxufA7QDWgRb8/iZHv5MMD6H7W/rXHK70?=
 =?us-ascii?Q?S0cVsSAEKFOFr7p/5zxeIsmSwg6+4Js3IRcwuAAWcf5JuFYFT9x8t1g5VSpk?=
 =?us-ascii?Q?x9cPpbU4ePZBQj2rFM8jaTeBhcN5ZbvXJZrMJZjmemznRjaL+eLE159yC8UP?=
 =?us-ascii?Q?WjJCP2bIK05X/O1KOfReiKFJRGpmWsHLh44cWVx4mbJbaEr/uSH0NKPpljm3?=
 =?us-ascii?Q?4AENiz8mBRoSsm0Ry52ojJtv2edJZwThzuA0s4aDnnNSDYLNrROVtH6JuLZo?=
 =?us-ascii?Q?y7e9B0CV6MFHbTvoEtk+0H8ftE27O1dJHiEiO81Bx6DF3n7Zc4EWSACVcTcB?=
 =?us-ascii?Q?SOdoY5RhZUF55/sxZrkwkpci1Nlds+F0KpJZv/tSVMweqj4STTmrgwTyJ9LY?=
 =?us-ascii?Q?AacYGidWc26KEZswqzwpJbFOqZ/M24G23k4gXXFrp/OZbLlLdkXylVmTu1Fh?=
 =?us-ascii?Q?vaJgHnzSM4e3qcbzFANQAPuV6fn4g0RtiZWcQRMm6+5BIcI56k4GJBpY9bwQ?=
 =?us-ascii?Q?pDxIj2v1IVRgCE/YIeEW/r7w/lE6QORidDi6PP7bqEihx02VRs5JnNLnmKQq?=
 =?us-ascii?Q?tBm8BYl37QCYeme1WFPiJZTCIcZ1g2Sh5baz3H6FAKkOVJFcomXCWutQ0z95?=
 =?us-ascii?Q?W+xng8yGUkXKWxDWISryTf78cs0G6qd2FrZIQGf5YrLRtW8LR9v0YxAL1Pgg?=
 =?us-ascii?Q?xFU6Cu7MpMWcnXOh1aPIExMoS3Q9gA+LUIZK+pFs8B2hZvRegsrcxvSK1A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CKYzGQXWcHKcitULtjyK/XYxAohpRnyUKzo96VjFHsxOZwrG3O9v+XzroN/G?=
 =?us-ascii?Q?wg6S3s5x3NVIn/swO5/gSh4HxK9xPI7EkFfnrURXcZcGM51wYdvy58xNThcF?=
 =?us-ascii?Q?dLMSCJLxaBn7JROwDoTv5lnSpx/CVVCr5Ln1TK28muWFqlh5R5JdFPSlxNg9?=
 =?us-ascii?Q?COaAmmRqahZFAAL8ile6iU+iQAz1IJsYXtOk8RsxzCYcMidDy960bLIaqqkF?=
 =?us-ascii?Q?thu9XpO1QR/jBjSs31AZvG/4Wqs1Kig//mWWmTWcxKLM5ex1HqLL/KoEV1EU?=
 =?us-ascii?Q?3Hedbj2IvmLRzaufMi/a5sKylkdUHuPBxTHw3zcyvqRKHs/Y3gpCeHwA1eH8?=
 =?us-ascii?Q?18FDJj6DvbJhC5GX/yz9Z4H4YN98i0YTAETTSol9/z/dkclShSfIYasd426y?=
 =?us-ascii?Q?s4MGqi3DpDlysfIy5XII1SmXizI+DAkLKoUJoEc6rhirwvnWSWHvud3fQ1A0?=
 =?us-ascii?Q?G/R61O9vjckPwkvM6wf9u8WcH5o/BA+KfzI+F3ozyaweqSj3yEgYB6wNYr/O?=
 =?us-ascii?Q?YRO9gHjAnDlUDx63s4wrmF/aINAgyuA9yQ6hOp9utctDYNKnR0lu5Aws4rP2?=
 =?us-ascii?Q?yI1LxqPQgHVHA8kLNYozRl4q07GcP+V/+Hl23CMwnCR/MbbkGDYUihHpfLHx?=
 =?us-ascii?Q?ELP4aQhnUD6iEQ3WMAQaHbgQpeLb/BnRNM/qdGBxspCMN+fEK5tl/TxE4I1D?=
 =?us-ascii?Q?wcKNL5kQKCwdwiDAJubl/juZuXXPr7CLV+S7oxe0WK/72FWEhaZXrcL5N7MV?=
 =?us-ascii?Q?HjahDjNJvHBg9KuwSARX0I05dYLONewWy0eIQhowsQ4u7e3Nmj0gkp4daY8x?=
 =?us-ascii?Q?XMRtXZNnkdsneQyyC9P7gCUPSIGJcr9CRCKLVWXhg0aJ82ARtXpBhexilAUp?=
 =?us-ascii?Q?y4aT4Gj5uW7m1x9EkuI8CXTdJ4QGqOCd2wjH3NaUTIo9+MM6z5tra2l9G7zv?=
 =?us-ascii?Q?AwN+PUN5lahj3iQP8od1ScbOkPtiyb9YJp37K91d+zs9JmmLKmMNdRnnZVaa?=
 =?us-ascii?Q?YEG0n/xFyCQgZbH0BhCWn6SwSEHJ0P7ZpW5VVd6qOvl2nxzWpWaWo6O2e5bI?=
 =?us-ascii?Q?vRyw5H52bstnfDZaqOw+pYKhnSOjGvrTjLuUUXDK8VfD5L9d3kJuOrGvpfr6?=
 =?us-ascii?Q?zVnse3TPw0Zza1ffYdLCHt/X/wTh6exaPk9Ig1r21XhPQ88SABAHfrUpehK9?=
 =?us-ascii?Q?eDgDh45zdWfNxbYLebY8SrsqguRRsfapGkQ6sFaCs5qexuxN+HmopCuTuMPV?=
 =?us-ascii?Q?16GXVzTPsuig4jeC2gjw5u2Q28U4CnVllvze0ocJhN8PJ22b6MF9uxNV8s75?=
 =?us-ascii?Q?QtcfukiKZ9VgBLEdbJTug3GSAR2BdgdrCG3POzmle64imJKhfpZtRlzQlGsa?=
 =?us-ascii?Q?KSVD08pXaOzP3Ta6XonLPlyrbh7AdAdFRsBfNWKe4Yrlwb0h4AE1oDAutBGe?=
 =?us-ascii?Q?20HLXIEpXOvVouFUkp+FpUvo+LPZwFEvouxTLtJcV6bBu/eq1FFprXe6Ibu9?=
 =?us-ascii?Q?O7+nPVBk3xO2seOyYdQA6+4NRD8nPfoIQ4uT4FfrcM6pmCnbh9/dfnM+/BRW?=
 =?us-ascii?Q?vEew15SjkwSNIadXK9wNeusfbM28jV1paHk+16UE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fa843e-72e3-49c1-2545-08de323a8497
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:45.0991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+c+mwqTfCt0Iq+xUAR4ewmFhp3+GAMiTD4X8sAAoHfLALOv4TCCzFLCXOhWxj5Y5KFCKfcB6OeJzpFb8eb/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

Refine label with "wm8962" and node name with "codec" to follow
devicetree specification.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index aca78768dbd4..313ebc7e8a9c 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -132,7 +132,7 @@ &lpi2c1 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	audio_codec: wm8962@1a {
+	wm8962: codec@1a {
 		compatible = "wlf,wm8962";
 		reg = <0x1a>;
 		clocks = <&clk IMX93_CLK_SAI3_GATE>;
-- 
2.50.1

