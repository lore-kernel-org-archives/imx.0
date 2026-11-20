Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144580;
	b=4niUtU3mgwDuZcLVQMulPf1BtKck9tX2WL0TKARpVEWvqJHN3Ml4nl7AzCOn/BvneyEK
	 fDRnGPSr3cc+jsMF4vTokBzBbxHahagX0USrhN1WT83gJaL15Fw5C7St5cuFskmbBdrAQ
	 zNjZvZ/AV+JQmrC1fwXQkd4LCd7YOwyGgPH4tpI/lTeJsWvEtKR4L18eeSY+Vhgq5UFSd
	 UY9UJUU964J5S4zKaPDY4+G5hoeWNe2Gmln1XG1waTGV6yFj+qcRbm2jud5/c0Eo0UEaG
	 ftA9UxkiiyPxLcQQM749IFs+w+sdSFdRzhsHYjbHcv2e5rUtzKHxWUqrnAI5MMAeSjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144580;
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
	bh=S1nicShag/7/u/MCUgm164A1OPsngCL5JMVxYZrwE2U=;
	b=fSqC3kMrY1K2LoZ2ozJnpVk3mudjG77mr6porJ0r5uJbDAnHqC3+Ktl5qfTAcWbgF7o4
	 7/eoGK3l0hoFwFed7ooDLuY5wJ255C+N+zUf6XP6RiTQwpE4jLL3YeqZeh+zuFGmV4O2t
	 ckZWOGQqLnGKGzXGm8PwPpHf+Gd/MWbYJq3UNparx6vJRIeFJVhfAp7kYHDIbaXpls4A8
	 uYV37DSVxFcW0XDBQpsFhgwCA4x4qljQzDhKWxB1bpv31sD6ol2ATsUKkVw9Z222KePr8
	 +yrf1zMRyZh1ISmgceVHcaBD1dCALL+S5xdkkopIubpW8jT2EHy7af9cBGUQtSU7Znw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oS4vvT4a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9237606A33D
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9237606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oS4vvT4a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa+D3QAJHQeurKi5WnvIl+ESOPonLK2AGfgJfXwmxkDyDe7dDck4Ckf/qTspZCTjp5gTcsAhXwEDT7x4baT6UbzQSIsyXnxuN8hzDgLFj2Pnf712IJyUM859exsvRlI3Ctsp+wSWegV36sMkCiksFMFBrDrOTB8Exzb4+zOUHATC1LQ7hBC0W+kvOTz/eiTFtDTYU/am83YRaBv7BcwC4TY/syCXKhm+rze09cFntrPhIDN9Zs9EXzZHlzeam6MpUyvrIar0LDscEe2Pn9UZyBj8Ji/sJzSjuSwlHAhTFGOuXpHb53p9f1sDtEWFaQv710XH4CpL1Z5MDPi86LKCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1nicShag/7/u/MCUgm164A1OPsngCL5JMVxYZrwE2U=;
 b=AquzVREFCCEEJ1w4VHLLRSirNT+eYdgwByk66h5JGa2V87hTeYTnweD3ziHsgAidg7uJTSFHxpHtADCkBtZXi3c/wBowBCrFTbVFe9XZk/VeDLzAbUjcy6taVVWuV11wZXbZE1zl8CqeOuln7ppXMTEGZxbk/zUFb6Y8it51LFo0jqS51Kcj4LAeTer6vNdPe7Z8Erv5pSf/sWCsXLTS154zCU3AnXjcRLpnnjHoR3XQNeXEQpHULoGWN/F55cEWWi2NU6QzYCWtKQGcy3l4DuaVIGWe9zJmX0CcuCQdBc3fjzP93P9/XlEQmWLWlON1vANati5eewvdUhyh/vrHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1nicShag/7/u/MCUgm164A1OPsngCL5JMVxYZrwE2U=;
 b=oS4vvT4aU/0fXb4HK6ha/TkOi/q9Gq68BlJKy+kc+O7NyS5RpIG6uQQ/w8o5AQ/py8G3wqWAHZcF2QRlkXs4HaBIAxhO4+Cnf2bgKTs4xVvQKX8xs+n5eTsZcMi8Tber40aD4mSjCTF2oQmw7xk9y6aYD5HU7fAizB1jf9w68N38Sz2ERUVR2Pe6m5LGX8FAs+MT13eCRhT77Zlbs5qQRkOvoRroqQENI0SJYoEj7IwtGXfvg1Ua2r7P8aME5UsxUC1JrGf9hl/FyKETrCiVANogW7JOzh6T2nDqJZkp6D5Wk6QEp4g+GsBrXykEDLySq6Z2FJlNh2jjdbBZeRIFLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:16 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:16 +0000
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
Subject: [PATCH 1/7] arm64: dts: imx91-11x11-evk: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:47 +0800
Message-Id: <20261120031853.1175454-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1509a899-1e42-43c6-34a3-08df46b4a380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XYfgRE/p+6Oij/sHlrbo9NZj6UplJw0qewweyWA1TtpWpT+ZKKp3fdZZFealPZVKDxBYurYyCnNr0NZiMn11T3KCZa+47xCxEiZ3zHy5ld2B2EYkdzyWW1thVJnNJwGl+Ys7cyT71AqklbplWoIRELbhWHrk47GVULAh6U0PXD0UChLbzmpnGNB6aQ0fRQ7eJaKgEhKEgVes+bQqVeySgd8SKWZZc+UnMsViQOgZ+czDwYSg+e5+kdDwexHwUgTP1wd7LgjP9S8Pg7+mXWGYH8Es8SETqAP5gIDjsn9LPosBDzITGYD+MGWGe0N6tRASXCMc9od1uTfPSM/oY5qsGxVFahOe9/Yjeyz52bxkw0Nal8+2k3oer5PskAUADK1UkEJjZ4gdIN1IP7eqMPXE8o373Op7Z+pT4gLFCHPphF6jUWUa2TmKLth0SjQHw41I8j7rW0oeyuJ16mGoi2Of9NC5GmA1n6yMTGWErTQb5eFlz6HTLyDxrMdn11jjWICBLy3eMkW+M8ga42l/T1z9t6PTk3Arb3o10VhiN1kTCQxBC8rR2qA3K1fgh/XKNI+BIHC67iuBh/3chFQvRoZUAvqVpDkeUFkkk5H2RclTMsQGbORgKTC8BIzt5q6XaQeLZiKyjjDMQbUX3gjWJIh4R4FCQvPlb1aC52+fT00AzR2vUfdJCX1+qbQrFfKad7B5jtLMXDRTQAlP+mPpQLOJFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jl4Z3ppn9LYP3MpZlGSOua3VlIICngJT8mc+YFzrgbfxDJD215kPPuHYLcrU?=
 =?us-ascii?Q?LPxCsx7dOS+wRIzv1D1wBYMTSvQ0wCSt9l7/60K8XxtqQWIlcsztAv0TzI1l?=
 =?us-ascii?Q?OzPoONVXnvj+r5bzWjqkFeEsGNVWEOO2kADLlA0xvIMENUxGKJggDS2LXhbU?=
 =?us-ascii?Q?mHQk4fHwBevjksvUH6md1C+OitsRAaQhJGB0l1QFFlYNnDb/VigOh3DVmUpj?=
 =?us-ascii?Q?0m8U7OYiLqmoNdL5x95cGfuk8YAOrN8VFoY/fGK6xBPc+saFbvqbfAjtDVXq?=
 =?us-ascii?Q?+/es0bePgBWEHm37opWtaQegmyl+ksgG8SB73czaETWHAT2OwM4Hqe0ylNc8?=
 =?us-ascii?Q?RbBtw7Q6uVBpxL3FTLpu48sp7vT85QJyYdh7mocOhmsEdRQyVXkhDhTJyvz4?=
 =?us-ascii?Q?49zdG4HYpToDTXVrd/dHIClx2FvpD5xpMgvjNQku2NqttWTI/+5O+f37NnhG?=
 =?us-ascii?Q?zh2Q/n3aPAgtEG7BQSwjBC7WyeoHV09NWkcPwtKb77XiH6bhnXhYP0RjArSM?=
 =?us-ascii?Q?K2OtKjLWIhFKEm20oGPXH49VFU9L2qdAHrLn6NWRIMA45kUTarS0X+/zjNkJ?=
 =?us-ascii?Q?QBgKo/o5PiQMqI3VYNmmQrmIhemK53kp03kzPUHCONcJBFm2BDm97++30MK+?=
 =?us-ascii?Q?XBhOrc/CylMMU2jx/Kcyo9C08AuBvrN//KbdEyELNBSiUv6uEvp8VjoXcOD9?=
 =?us-ascii?Q?I0q9hLkCONhA8/rirR+pulPK9pOX3TxCZJBR74IoWZrnqMfXCwFIueA3AGMf?=
 =?us-ascii?Q?5uZzCVktEBdF/5QBL6c6NSz23RaUU6FrKV4Z6rOddPbGlmPkzFM/3PTbaykO?=
 =?us-ascii?Q?Qwc3xPUT9OSYqUGNsnh+E6pZIN74jPIzmhr1ZFLzGAN3QEpLO8i73o3o4xSv?=
 =?us-ascii?Q?3Ftc+BBlKA/fYCFtnNbpkrLHqysFJ2ZH9JtVfh3PGUBNouYjElPhCryoY7N0?=
 =?us-ascii?Q?FxExIk1XbIJwLaU43us3U37SHI1njcWF+7Ob0WothT9eH4Kb6Id2mY8gTaeC?=
 =?us-ascii?Q?C3uo8tRC0vLRivinRKuwq0lhicvWdi24xvEWT5YdLvorHQJggHa9Pt3hiZTS?=
 =?us-ascii?Q?G9JkhvIWsUJXX5f0EJ515oIf2wNBIZU/u4bys9Gpr60KYnlFdPKDvtyGPEdo?=
 =?us-ascii?Q?QKh2cqipP916DyEkONrusrA1zllylK4ZaCw593GN9lLJs2ORhrzYdw4i7AKi?=
 =?us-ascii?Q?dHm/LwSctpZL3kWRnQnoJ+HrkmbKy+0TEToA4mHiDVvyHCzA6HdoXPInDXjG?=
 =?us-ascii?Q?J8xX+qHGGJrBUh+OockwZv3Po4EIeyeE9teCbkrS9jBgTHT4nSQ0kYMU43uO?=
 =?us-ascii?Q?s1Ovo3lPihEuxGVJ5kzZq0nXXdexA9UUv8qKFNeuyTMqTRta3io+15P0nIPO?=
 =?us-ascii?Q?A2+XS58/CTFy7qKe3ir/ACtcXMGLk/sifhcwa4PnvrewTiL7CtUbWYejcuX+?=
 =?us-ascii?Q?mTgmfJW3tBnQzuZYt6hcR+UcYjz2JF/lktvjwvHg/SDxYa7ZLl6gtho09po4?=
 =?us-ascii?Q?0aT6TRhrGejKB5wQgMm/GEu6RXL9ePwn4DdoIceE1wInF5tyfNsux158Ij5y?=
 =?us-ascii?Q?dOxrkIlWVwnlqO3pfmknMP+v01tTVIZUcXiuk6bhkgGSL3k4oaDQMg0q5Q5Z?=
 =?us-ascii?Q?SRIYV1T5kwiWyYwqeHPpd4/iSqXjrhJiLVfsMql1oFrYZWnIUhraMLAy8YDt?=
 =?us-ascii?Q?f9+/NVE1L7xms8CrQPusJE1yACb+J/BsyJZGQMWFS4Yz34Kh0DcgaWPRt1yc?=
 =?us-ascii?Q?m9mNUgmTOWjgBtAvzplKyYdXTeLAiILiFzU/D/XYsafOqVSHcF01?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1509a899-1e42-43c6-34a3-08df46b4a380
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:16.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SV4dsiV2mxcuotPvXH78S/u+r+IdaRZYCpqRqZWAokMBYCqRtTtAS2R5vmzpT+bEtZr6KN3ZlMHWFzDQyDcTW5lL2qm0ZSpEcFjarTYpbYPJjJe/iuk6AvowLX3RUow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 4 channels to match the DMIC hardware layout on the i.MX91 11x11
EVK board.

Fixes: c85b67e2ab5f ("arm64: dts: imx91-11x11-evk: Add PDM microphone sound card support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 66466ce001ca..d473c0890048 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -48,6 +48,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+	};
+
 	pdm_mqs1_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -186,6 +192,10 @@ pri-dai-link {
 			link-name = "micfil hifi";
 			format = "i2s";
 
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1

