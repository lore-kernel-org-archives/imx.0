Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44327346761
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142462; cv=fail; b=rftkKUfhj6r0r8DQt/Eppjb7dAVbVcVc1+MWgfw8tKklEYhPjTFfGUMw4JF/BFQYG+OOibtpd5aODNvb7NKKy1+ZNEoqSwv9VxdUsmerqPEOdvNPfoSZSaO5uCkUdaTHK4aZ3n/C8GDnNsCOPF8FeIH57Jw8qph2F98OIBx2SOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142462; c=relaxed/simple;
	bh=va4ZNpwh5nl2AxSMolcwUiKdT1iLSrg7uY2HRZA6CGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E9cTZwHS+Yy0EKhNFWJkXQLJnLLemWFYWEytXtiwAEIA1xVg00oT+bVbQUcBzqw1ld4Fz2zcNV9e1/UI7m0hsFd2lKDlF363uIvoc7NPXiCyusVNV/mnNXZ4W6c7hiCrYHDnR1HIDOuCk3MZDhrxT7RCz9k9bhDl4+Zg/Qt/jmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kzf7kH/G; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kzf7kH/G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9Mdvk+HJ3hQWLdRtZhChDnN4Jz40n8BdCazK4OPaYOXYQFxlf784ifbVuoOiZDp/IvYBvuvCVF7s3IceOnUlroEIXtDFtPbgGsT5l7dawVe+Fo4XFd/C8EwABvX9nvQNXqVDSATFVPKK63iwH9ZyEagIR2XoPl8KYYf+YV+WTltcV/JHYylUJgN9qaFTgclSNDNDMaYIYWo8KdtPYrrYcSlcROOMl98qCums3+6k0/zeBupOnTjloY65vnyo0bS93iyEVBZ1uAXH45PwWtyzAyeCwu4Tir4CpS1xu5NxFDSDAEyfMwQZvc4CCwpU/77CBaZK1UeQQDdvVF10Th5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTDU7zUrdvKZN6DCFm4U0thZGnr4EFWZ3eQmLzsw6ks=;
 b=GdBsfMqHnsvb9aH0BT/5M3zbe1W/M0E+QSGqWx6mF2Q5SlNvWXyaUBlvU56gg2L3tX1rz3Ec6aPSBvzHO6bWOv0lM6ABMjS214zB9V3mA8t5PiYwOhnBEuTb7KBDg1Iy/IKK4TL9EsnKcXLv9fLmuTe0hFaDv6lwtMs2GSuHw7FdOuJ7kg1vtil3TmfQLROZrKAOmwJSMivbOPSFx+4/uKhycPScFiG1OP8FiJjkX9mkMTFSGXPrRGNz9cG+SLbfxBS4qq0fs0hsLNBCwXoPKl3034DfOTR3/ki6bS9HHhZ6fRWYHLvF1XLWlrjpXUpyTUJLilMRa3pxRdryWvxOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTDU7zUrdvKZN6DCFm4U0thZGnr4EFWZ3eQmLzsw6ks=;
 b=kzf7kH/GyvrWAuTxaExQ1wt4LbVOExz7wZT3g6QAC0ESs7Rs1u5RMREbDDEpKoZnI1Jq5Kd0NS0dIoMPRS+9sj/3g3WnnvKqZLqYmnDg9OqRtD/TYAf+EJgoYaMzRIYr64q2Z4Ue7BwqAosR5XTwzNTbzORQWOrFOVMaF4/Cb1IZvyQJyUmA1lREN+DBKWmmoy1Meq59HJ/RrNm31zbRL8M193AhxZhuLoglOLNMg0u/byHNtkRtNf+3i6/xu0GY9dqK+8wW63TCVlYplLPMhUndsGr0GUNPOEcS+ltPVNdS4Z9hmNeJlaUyAP2hST1PrkHtE2JO21c5DqdAFgv6gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:47:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:47:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 4/5] ARM: dts: lpc3250-phy3250: rename nodename at@0 to eeprom@0
Date: Fri, 14 Nov 2025 12:47:11 -0500
Message-Id: <20251114174712.1206027-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114174712.1206027-1-Frank.Li@nxp.com>
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12102:EE_
X-MS-Office365-Filtering-Correlation-Id: d12fb0f6-9bf5-49f6-a1ff-08de23a5e5f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pOFZxJVAFz/ydVJbuEWqVZ+9ZFoXGY+FiW91mVK9z8xPP2OjC7LkcYbX6gME?=
 =?us-ascii?Q?0hPtaYuEx648M8KpcpRcFdQsILAndwkYkhOvTXF0iP3kKQr9y3xXylGYASPe?=
 =?us-ascii?Q?+jPd5XhE5FQtKF3AqWQfp6CpSO58mW1fqm8T1jvM3cJVI9zQnOaVwW91qtBX?=
 =?us-ascii?Q?6vQ0/nZ9ff5fahThJECjVjmWZAp3Mtz0/BUnyjLzSOFUpF41leEa70nb1nd2?=
 =?us-ascii?Q?EBKjo32WKOBMwGHj1G92o8sdpcy0mdMS5H3QszJlRkNY2pLYiPvWvGljTdaM?=
 =?us-ascii?Q?7yZAm1f1IeIMdINB9R1Lq1571sPWUoKwIMrRxQSNtGL03Ig6jGV0mBXjtiLq?=
 =?us-ascii?Q?n6cNLuMvA4puva8vEcuXzQI674vs3n9zgLk6VVqrdwWhrVPppk3O+2Jy/N0V?=
 =?us-ascii?Q?x0pA5/BOHd8Yu/WC8tgE2KIB1L8IkUM2IuRIj+Zmxr08vP6cmIGjyqI0CRr1?=
 =?us-ascii?Q?mxwTuGQ6mCyhlsNM2hXSAsYtwT83Oo0JVQCRenM8Sj9nCUZVlzPjFtiY0g8z?=
 =?us-ascii?Q?xiWJbfd+rH98biXP0Ez0E3QOj8cixd/Nbj9UDXzgosn1b9ZMlCnHT5ZphJH2?=
 =?us-ascii?Q?LwQNE8UxGmg/WJr1Y9E1tOGH9UZK5YpdgiJb+StZWzs73qsDCQcTJ6ncOf1e?=
 =?us-ascii?Q?6o/gSBoBTOYl1rCsTvrwqCf35EsGhtHlzy87Zr1g+R3YxCBkQ4IeDGboZxL0?=
 =?us-ascii?Q?gH733QLmVMU6l2O14Ey/+9ps3GRytmyTgxQFTjBvmbUIea2yqLpUKYvZoAlt?=
 =?us-ascii?Q?l+RJ9Bmszkx0O0/SGZl2rABfCdFv9kRARH+gBBbZbsXipEOmtOkGut6snyUt?=
 =?us-ascii?Q?/WVez86PxyXWNQN1g00xWkc2LbV408hZE7qbr0+FH3n6Y5bTvVfAODAOlJNE?=
 =?us-ascii?Q?YeqX0Gs9FTsYnr1hREwVOm9eZQWucDawYwLXGPObNdwbQ6bVERhSEi49nVQb?=
 =?us-ascii?Q?f0f9JV12X/e2p8gKO4Do2dY2UcSj+d+DQ1eAYSEfSzH10szMAstxkYFlq4wd?=
 =?us-ascii?Q?rWhCqT/0UvDTZPGaH7gUEDdwBLt9g1sVxBg6GqWED9XyaCQkXWJ7aPc/ql4C?=
 =?us-ascii?Q?esDww/7yA9qGQBgNmMIV0Cx/xv4XlZEQNnR9vpOLaAbBSoulCnpMKOaKiP1f?=
 =?us-ascii?Q?byOWrlVVoezn7cqmv/q1WwxgktBcaJTZS8PYB+0s8zOjc9cevta9j0N2PjZ2?=
 =?us-ascii?Q?xNl0yI8zEDv6ev2wLdye5w5p2R2rOJS+O9gwEgtsbMDhflYuHVy/E36PocOD?=
 =?us-ascii?Q?JIHE0r5WGJNplFjUAMDuV4FytSvP46lyn3tuCS1rLRbQDkPtUwWdQ+R+l/wa?=
 =?us-ascii?Q?P3d0B552m/rVdApyVf1I/uUES2+h9lJo2rMvTkl6oe/NEdgiIkx8IBRDx4RF?=
 =?us-ascii?Q?7J9hBDtqU4Pk369vYKIaJijKutY63hf+s976UmSwgtl33f/L2SsdSVKK5NJm?=
 =?us-ascii?Q?vzZXqxR6MKerLqqaLDGdwU06U/dM+M0W/fY87h2EkJSrplYmcnalZBKsvnm3?=
 =?us-ascii?Q?dkOTRTPs9S7O3OaCdLCeLygJwj+BjWEUONA4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+NOX1BJi8iFmP9hL3gHzkmlqQ5F92bBAyfVGKXrhkPWEmmObYRDBgXOGBhLT?=
 =?us-ascii?Q?pctJUvXkYDGlheXtrf1mhzhGboDigcXTqrR1jL4EX/+7BouDsXpb5U+TRj+z?=
 =?us-ascii?Q?c0RxI63C718rWCWGNRK3BIUKTAixYACcOy3ecLz6H2BHrTY9L5xjSL9T98+X?=
 =?us-ascii?Q?lELyztE3F37Js4LcAaEQYgJsWwaCn6xe627TIaxv22b7DmB+LgTeClC/B6bj?=
 =?us-ascii?Q?9MKYa40kfYGF+ytAkMXi9un/yHPyKNPYElGXrkHMpNV1wyW94C9fb43eHY9O?=
 =?us-ascii?Q?aC6B3Yj2IAPZJxM3JG54rNWDzpyv8VXxv8Uk+xLIXHro5kdW4vvoOwmWx7pq?=
 =?us-ascii?Q?2Xlipf/ARp6tFGyUUxP1o/ccR4XQSPJNPR9wQ5QkiyC4NzjB3g40YZbJx+t6?=
 =?us-ascii?Q?KHG4wnE4StM6BuZ3aqEhZcmdD0TtxNsFjWUCVhTQ94r3Vmi0y60a9NUnHa0x?=
 =?us-ascii?Q?d6xbuuZmFHgpQ66F5yJonyfYqdXqgA7yNmLUaNMzID2MIhtSK1lkkivdH3Vn?=
 =?us-ascii?Q?U2Sdot4OpVI7wTDb6tINNQaxWbnP62zSn6cswR9dDvDWdZTMh2VldzzktH3V?=
 =?us-ascii?Q?sdwPz7Q/33dC1KT91QIjc31Q7ob+qqEhp+A4P7HX2mxVDJkqc1OD0iATuzQf?=
 =?us-ascii?Q?XKtOS8teILJlooLGtr2Z4jtsehP0jZNBSRplVDXMfcDnJXtczPPlk5HRyQUt?=
 =?us-ascii?Q?uLLd+J4JN0RRF63OMCa/WY/BxhbwzFtYEp8nYkN9Ujfbjo1hi11SELCQO1hQ?=
 =?us-ascii?Q?/Bf6Da5y13m4FGuu5z5AxRYCFmqcCHHea9+xK2C6yhpqv1jcnf6Ktb14cvAH?=
 =?us-ascii?Q?iJol7d6gNnXSBY+8MAAiYBV4eymS/Zpi9wdnm7g/Cizy84saa/XWJqdglb3y?=
 =?us-ascii?Q?hiE/jVjNUJh2dTvK3ZTR3mx4orvgACaHhonybKHN2Eewg0BI1u7MGouovUk8?=
 =?us-ascii?Q?pukXm8dyNAj7ny7vM9gYRa5mAGqkvYEynsTj8Yh/e2QRTo4mC8kLU41M51Xx?=
 =?us-ascii?Q?tnHFumPcPhSFvxJVKnlfTtlC8SY6vVlsNSwLnq29op0Hvd4abc7Nb/EHxIJ2?=
 =?us-ascii?Q?1sYTUuf0aGGBeYGPw9OAq0DTktN6LYVTl/Cr2Qu1X6O5JVng90y8gq1EHz4e?=
 =?us-ascii?Q?IVicio2QvKpXMhKwTPXvvpGnjOnVaAuxfey8kltq7TQqW3LOL4mSefPRZrNl?=
 =?us-ascii?Q?3DjzlIZvuSvRZzIM5apYIdY6vBUP2NiNppRGuTKjF0RHNm4xbNzqOI0hKjNn?=
 =?us-ascii?Q?fgFjV6gSudjPBLnnAwzwRrSa6D+RBRrLFWeraWs3phJphDU1o8JCNhiP8AgZ?=
 =?us-ascii?Q?occ7d3xpOeUo7oObJ2ce/rua0y7LFffEG9sSA6p1/s2OeOwhEBuDpz8mo58R?=
 =?us-ascii?Q?hZqYJ7sARZV5yAxnYP0GZHntegOY6yCrRPW0bN++xSNqGfWRfLNEEcAw9jth?=
 =?us-ascii?Q?VI3lzDTLrOswf+ohZA17/u7oqpFxMa+S5iyICDF1zxaz6FSFSKeyrqB6Zg9+?=
 =?us-ascii?Q?UEvDllwRTZ7AZPL8j2SHY+m2gFTTnwAWPkaOnQQlr+5W1QDykK9heAg2HNIt?=
 =?us-ascii?Q?Rmpc2+F3V0faFxCPpW2pH43R6i5IBYBe/P+4RQxA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12fb0f6-9bf5-49f6-a1ff-08de23a5e5f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:47:37.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mlv1Z7eTOARKM0SAN8on6xVgksMoKUsDrJ2k3KyO7nC55RfbtysOToOp71Zh3JQduyqfPjBTWkeiIO4vNhaCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102

Rename nodename at@0 to eeprom@0 to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
	'at25@0' does not match '^fram@[0-9a-f]{1,2}$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- new patch
---
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
index 732d590f6cfdf..15463a96938cc 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
@@ -200,7 +200,7 @@ &ssp0 {
 	cs-gpios = <&gpio 3 5 0>;
 	status = "okay";
 
-	eeprom: at25@0 {
+	eeprom: eeprom@0 {
 		compatible = "atmel,at25";
 		reg = <0>;
 		spi-max-frequency = <5000000>;
-- 
2.34.1

