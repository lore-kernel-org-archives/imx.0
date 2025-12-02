Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734428690
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674218; cv=fail; b=oyP75hZNNCnzvlXufm6VwXhgAtIjeO6n+W+musRhL2hFkwCoUk3HGv6iTnvjZajxZhzXmh911NuTTnJYuVdWD1NdGsr9LIUTWXdhLZNQlXL8UmyxkiMsN82vSoqp3yuBH+LqQKWFkA4DEoLdYaUePPsb4WtBMo7wyeHoF6W1gyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674218; c=relaxed/simple;
	bh=ys4t9KXgfpunZ6NQ2pdR5QnB2E7qNOaLladM7duq0k4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L/ChygcWkx+7tjUKl05RM6ATYFUa+l910RFskKukg+Qftwh77bpZ78dIPTV9+SpL4fqGKUfyJj5uc6kEBbonkNbJK3c3mYdteeDmEyxk51hotb6uoQ3pJw5ZZwF7xH56VnFS60z1cE2fwpv08ygQvFczfCcnbDuoyGU/IGEYdK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RSsQBL0R; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RSsQBL0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXD0TAv6r0XEfbRIu35IPiOv2hUpzjasmahpDxXM35MIOKRmNcxeXgNPzxKcCHOGEUgF09dl3SvNcg8boSI2ENnH5mRKvnVUR+BZRbrHFCnoXAHr8vP89FBMShmPfCvC5uw4RZCkZ/ZAtsPHSKr7ejEIkPt+/KKEj40gmd+pDBXPg/wsNopbWIPmz4JRYdIxAKl+wnULlwznvdWBE/fe9RL1IkXp0CA2LXJK3dmTAzaFSD75YDUvH8QwM3JH9xWcpxMRTrBRS6CPRAg/RZqFXxemxy3vCfpMUiZYo/8RgjrzvHmVRIQt6kvtYJi/ow2uUZw4wG8yTZZsJbltkbOpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5s6Q+3hKUjWU9VqhxsNo2f/pDIhClaTLfIe4Q2J+7M=;
 b=HJTqr1jbsmNvREYiHacpOFhbiD5pfu/CoBjYvOq7Cx0EzNDoDpdE9ETL7tXJbL6Gw8DOB0tETTMef0VPa+efui+qP5uJI56ZNixDz0ShS5nvB6gBqeqL72xHcgYFkaZmnyg4Az6VM2rfFuFAStwrKb/DwIeux19ifG+Ea/No6AT2BxF3CLXqA75Ec/3RNtvzBdTGXk3QyW/w7dLYtZEpU3962LhgUT4mA+xi3f0A59yKHteIA49nTVT4nZGt0pdxcLJ9Tr5Cruh2oygoHKef3TeyQw16GQIjAFJM8iYLZwtLdeRU0FD9Y49UMa8K2VcYm3qay0uhYqECJPzCmJUzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5s6Q+3hKUjWU9VqhxsNo2f/pDIhClaTLfIe4Q2J+7M=;
 b=RSsQBL0R4Fd//UfoAj2qBrnp0FdLs20l1ZTtKjOannmv8pSxXpkg08eZNitt17ZXQDM/FVIHJ2a0+zQMP89fsbi18yxhqF9gDeix0uYXnSexluGKtMrnrbRmCn7tvSgDpniEPyDU2ZZFmRaAwbJDOkdf1eh8HMl56IafYlL4HSg6mzjmhb+Ul5rXaR2Zx9LlwO16vhEBimgULJoBKroIhHWTcG6QV/3omTkI9NvCoZSTfISg758u6Y9+qThW2DoRjYHV6Jmf7zGXJz6z+YN47Pu5oH7xMjfSunk7HAaKQeav/8hF1tQVe0X6fgHxo9KPrPq0Tjo3/491fAlnDpQfow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by AM9PR04MB8164.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:16:53 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::f480:97c8:1335:20c1]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::f480:97c8:1335:20c1%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:16:52 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
Date: Tue,  2 Dec 2025 19:16:38 +0800
Message-Id: <20251202111638.3553-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|AM9PR04MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 016e0d25-9203-4a67-dfa9-08de31944b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uc6RxgNiCp3rfbk/f3jRy2TGQCoj3xlwU68Zk/IUXTbC/fbpL0nbDX/Gf1re?=
 =?us-ascii?Q?Xwo411ZU+ByRNdPI9oPXiIa7FapGxiSVVWV/oMoU3iRMOb2+tX+P0giRTLXP?=
 =?us-ascii?Q?6OwvSYWwwzAuYsBHHrS2Uw6mVIQJtqqu4Iez9OINi7lZxGRioqDRSLT8lcXy?=
 =?us-ascii?Q?SyZskVJapiu59+TZHSXDuk+q+r93vp1k0OZdLwSR8fgVRt9ALusOWO+UQm7l?=
 =?us-ascii?Q?cPa15wU7TXh8rh9u6Fxbg8Bl4C7rcP2JPiMjV202BkpnsQ2vmSzNOGhuOpML?=
 =?us-ascii?Q?NDFIVZTglnMQRoasXHNoa+3ZSuF/rdJZfM5BBQ2AyNIMYVqxmDZCYLKcDwZL?=
 =?us-ascii?Q?6WkPTnab3kbJl51hJFYfUXPi6q9gR1fIb0RgKdRy+LicUI2g0mafIahjeZiH?=
 =?us-ascii?Q?COIFfXObiHOhhwe3KwIVlnFftkKeJSebvkFGsRS2ogQpxGrgs1aruKQeZChw?=
 =?us-ascii?Q?Mx2MnnTeNJwp2Cs2HausI6yaF9WKIjNd2flsXPZxJkZbTuIE8His3fCD4sPT?=
 =?us-ascii?Q?yOj8BEEeaFk9s3WeeW6lom/W70fA6sq+W5ofwS6YKQIroRR+xNKSIav0VgiC?=
 =?us-ascii?Q?KlgVpu6typ41R80NarFAQuPMnV54GnDRjZj8iMt/mD4wkWgTtUmQsWQHgwpJ?=
 =?us-ascii?Q?BbWc+NyDI8p2mKQcgdOKgPtSMKVKHrq9TlJKddQrjy2xW/e/VO8wF7+cNNJB?=
 =?us-ascii?Q?kxqxqc+sQu+Grvhz0B1B8ZxO+FGP8lP7icLjBPaRiKiKfaPnyx0Wl2CUIL+e?=
 =?us-ascii?Q?PcE8LFUIKlqkFCayCtR5T+Q3LL9q6w4M34Ng4bXcfRGNUlR/vf7JPR25OxKo?=
 =?us-ascii?Q?ZYDiuGhUWwy5DXLHltWZ97Pq0qZYXrzxCTTO329MVng2PUg/rTefuGWQ/qOI?=
 =?us-ascii?Q?JrFxMmIqDEvY8zx300Jn6eO8XKld+G4nYfL7ijrhQItrM2FHeQJpsktgH0cD?=
 =?us-ascii?Q?fJjoGSoZuViPqf9GRmxo+VtaaepEVZ2Rs12VPNjPSa1CgG/FlhT2O76hjG+8?=
 =?us-ascii?Q?DDvXaxuddNm9VoV0Z3DFt+5a38mAKFQJc14G30p0tNIZrmdiIghaEbrwNHHH?=
 =?us-ascii?Q?pwqPVHo5xPWxdb0GdOFeaYbc2oHiPFwO1L9vuLeqUQKsDP5eDISdwhkTPDp0?=
 =?us-ascii?Q?rS5bQezrUBOcvdjHybLdSybjua+KsnLJDOvHW9xV7gw2DDCzXdhBesv9O/HJ?=
 =?us-ascii?Q?ukRKx0j5K+JHtSZlLBPwHxogjuVpyZj07QcYaQOCcE7s+zxQi7uN0ek9wwzg?=
 =?us-ascii?Q?23RO08JTe89DEk2jj5jbAw3tHlsUFsWHeRLJ8KxYmERdasjMXIOHdwLy7S66?=
 =?us-ascii?Q?OluxNZaMzIZmkD7GUkSXujKdus/qrguj6bc5PQCXqpEBdLowWDW6pS4Znc7N?=
 =?us-ascii?Q?BsWDlDFqWTY9NgbE9RPsGKFjq0Gq8l+0ft6p2yp0IH3+TZzNxY6HMFDq4u/a?=
 =?us-ascii?Q?d/ieajDqJ+uP4PLy+98HYbvfQep+5xm494yFbFH7IhwJKhgL5cAgXR8JYCB5?=
 =?us-ascii?Q?eEwljy4mlum4YaH3KWzSu6uQka1KM0dmpZi+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?66WgNspAfWy3JoMaUOpn7Qcj+dIlB4aBvjcCepuy18X0vmtmqKd0EXTF1vGn?=
 =?us-ascii?Q?NKkq61sw4veKR1U8uhHNR7l22S7XBh7K2u1tgSSsUmTMTSQ+obSpNAry2HCo?=
 =?us-ascii?Q?jgTbMVbF5eSwo9sGqKRTFbnwUV/N9fsvoTkh7oKFc1vWfN5DfX96Fu/QmRLX?=
 =?us-ascii?Q?vlhPdebFjuVMkPF2IesZ7RyYQ0UyEdqVvn0ZPvq7S7WCFFZ9no3kY3B8IUlK?=
 =?us-ascii?Q?PkdZXIaqpcQDIKUotJPZfUiAW6e5T+C6nUQVLD2E3OcXyMorYH/KxxuMshrn?=
 =?us-ascii?Q?Rd1EcHmZRyRyrGl7cjTynsx9X9tIEN3zyY+6vC42ka9QzgG+gUcmhw1+Y99L?=
 =?us-ascii?Q?kuKnPCq5rETzoUcZORX2kqgfUArByDG0MFXlKYY58AEvJoZra4iERFJ5FtNU?=
 =?us-ascii?Q?pfETgVo9vkBiMmbiSrUJfGjpfGzy8xC9EUnNjqeTCNrA7K34MycyaLht6kfD?=
 =?us-ascii?Q?tJvuupu4bpD0MlZmeekE9vsBaQMOWO02m4b1ga8Y/JPEnihNGIFz5/tkMJVu?=
 =?us-ascii?Q?wxKKs0ISynYM9ejpMRuSYYlRPdbx5Ru7EpwUscTQd6ePCioRjQarba2o8eNA?=
 =?us-ascii?Q?EL4mOO8x0Xth4cMftmwMnYtZOjjorjF1aQUhxJdwGTGKFISeXbrr8b1RlTp8?=
 =?us-ascii?Q?tEPOt9L6L6HcdYFZ54FAadEGchOzI382ExImw79e91QpD8oraLJ214xv7sKN?=
 =?us-ascii?Q?sS4E8en+qW4hvsLFh1JGhIniLPa0HB2i0TpIv1YZvznl+oRzu85E0X2fdRGY?=
 =?us-ascii?Q?5vtrTSMfR9ulxcOmbuO/KTc8CmrQ9yKef2oRMFxyHf2CSZpYaID+DYV0jtcs?=
 =?us-ascii?Q?50FVgsumPqiuUb88BMeslQteOJ3XynoYaHUx9Zr+eoGVBKvoRIHDJU6Qc8Qt?=
 =?us-ascii?Q?lbYkOa0ZbVCEVE+o/uH6bRH1CKz1dkMHWx3drBVKF+LQIFhJAMmDwA8jP3Y2?=
 =?us-ascii?Q?xbg/KBfOa8wN49lp+Vo5Dlv40LZN9xthhEUzitPk+s22uMVxGRJ/CfKt5fAr?=
 =?us-ascii?Q?qK2pSgod4zHoI7dLWOp4OgsguEI7wE8bqUUFsuMhh+i+7dZks+4Yu9LAc1mw?=
 =?us-ascii?Q?l/9+cSt5/8tShkx2MfBTejlDR0tV1s4g44Ok82Mxw6It1Pd8itf6XpX1oEXc?=
 =?us-ascii?Q?s5+dkuIR+0cKfqa9qxiOaz8PsZtJGKpa0pYhjFpQ61xpltjVehJbqFDUh8BO?=
 =?us-ascii?Q?jZ92w6V2HBDom+/mHWf/xdYhkTj4NHj5T9yHZF3qQqeITXm/1EBZGr4OgjMx?=
 =?us-ascii?Q?NbBm2k9jifrDYP6PYRk2zkHPudDbZ+CIWG3osFi+5sR06Qh1AuhbadualpQJ?=
 =?us-ascii?Q?dq3cz/SuHQJDRYoPTFSFjysJDzhaRc0fZ/O4yyTadrAlqrDDvXVP7aipedOX?=
 =?us-ascii?Q?U71KClpZosn8skXcTfckDb7qLpn3Uk11XRD3wUnJgoKv4G79Ouj/XkcpmRXT?=
 =?us-ascii?Q?3/Eh5GChNXOhbMigKKpsBA5etvSaGat0VpgEuYX+6N7yoUEMWy1+vi63S4SV?=
 =?us-ascii?Q?fkWaBDZjkEhl5hecx2PklEDpbJMDb8Koqhu6uWwt67oovnxK+KId5Z33J10V?=
 =?us-ascii?Q?WzKPBpMq/oJuHW5tjc0shkjXo1C1OORdM5ChUvMX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016e0d25-9203-4a67-dfa9-08de31944b96
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:16:52.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kI6FXDP77Q69UqmXS7LD6/9RFi2qHAZKkodQGc0HlrkkoElgOFzUGi+qkkBIip1/de3+F3PLrlT7L8Eo8Bu2gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8164

The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
update imx8qm-ss-dma.dtsi.

The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
dma-names") just simple add dma-names as binding doc requirement.

Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
the FSL_EDMA_RX flag.

Fixes: 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel order")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 5f24850bf322..974e193f8dcb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -172,25 +172,25 @@ &flexcan3 {
 
 &lpuart0 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 13 0 0>, <&edma2 12 0 1>;
+	dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart1 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 15 0 0>, <&edma2 14 0 1>;
+	dmas = <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart2 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 17 0 0>, <&edma2 16 0 1>;
+	dmas = <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
 	dma-names = "rx","tx";
 };
 
 &lpuart3 {
 	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
-	dmas = <&edma2 19 0 0>, <&edma2 18 0 1>;
+	dmas = <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
 	dma-names = "rx","tx";
 };
 
-- 
2.34.1

