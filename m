Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39040B11A
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692134; cv=fail; b=cr5Jold1MKLk5wtAOFaPjWabLbzB7nioyzAIQHQgga1eiPT60n/wS4PI/oliBLRjt4+3Y5ZdR8nLKoy+G4Mow4KHd5fxDE8qqUIgElap5UlvdvCcbpgaV98a1DNuaE68KNd+zgqzpoL+B8Mv8Z9cQJlf4QF9rMGgVgsnmc0DbKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692134; c=relaxed/simple;
	bh=FRT209kUF1JO43VkIJ83VBfboXdzeFnQtemxebVRNZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3Zv1aGxNjFDq2PNKXOHkqx1PirlHcerUEBlyed5B6BTjaWFPIGSWBWI2r6XXOeuq4kh8SlzTHCl5XeRQbGYEPug+WHW8ce2GH3owed2GXwT7nCG9XAe9nXq8zzxLusAnoZSlWr9CHdFi6Mv54IZTUSeXKHgppUgkbQUyTcHy6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G3lZar75; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G3lZar75"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlkDeGS386ASPpiklxMfZ7cb3eaDCYI3au5EggFj2wPFChhX+u4SDySinIsQDTkzTn9JbYd8uWKhnIz5BZRggC6e5R55kDq8Z7sSkCx4NrfyxluofIhEiDw2/+FWCyt3Aio54eJRnzpfZKBnm0DhKq5kgezKVdnfxQgPwPzfS6D/faucVuE+B4N0vyaeYFd1NZMmfe3U7rFxhq4ZcIcZYQ3r9HviR1HsZWGftsbMw5qty3VylwvN9GkDcNT1jUyXY2mIiiaLPIAwV/V04bWcf6fYQDTlYGbft9VgNSQpu3HbI+kieVj7tmgwGpVPKMIUBftRVXAPknuGffM7sJMG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=sP/gvZCoZHm0LKmA2qj0spDMjEbKpDFYcw+0r/d+qX2Y3vh/BSLPPH/9c9A405PMFgCsFDxIu7Xru9pWCobQ8HlKYz+EYMhZ5nxpUhMCK6xzuGlBzK/0rOYtdJYz9M5Drn8kG95aXmMfr27iaTqj73vllzoaf0TxIvGewJOqmgUSqGzaC6qY9Co7dUDehafpVH6+USoihhRpxuvmKPHcYukTKeskOor9PvPGrQlSYzYUUkGk8evEiHd75Zu7C+nBBxgi11aYEPWPy+MCXxIc6fJSjXFQkUHTdOHdyNI6/4uvO097Y1EgCIMrpkFA4kD6ih3Fdvvq9z9Zk6v08P0FbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=G3lZar75Y65vdmP36dwJzJT8hOeZ65x9yqCyTAO96NwGQ5T8XzghLhc0gAtmrZYFIRhmsv7pvI9aJKA2lSM55uM6d63s76MdKTa9dGMNifx3HVPxCCjGqv8j3SLZjjntPa7F4QIqcgyyz1XaZ4WXSMI1l4B6U8pRnFrCIysuaEzjW6FB/uMSvGDXOJ5cLmY4MIYX9KmSs72IuJIaqhDrGyKPpP+egXallAc/osmreKSxGzidmIY6eE0dfD3+ZPux+1XmwENlZDSu7cC+p9nttKMwnJ7GGqkfmPTnSrAcuLogv3B0VOaXQZqVXuZGd5cOz5ZJrwpPBBwXOiPP5PCjyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:22:10 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:22:10 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] arm64: dts: imx952: Add AONMIX MQS device node
Date: Fri, 14 Aug 2026 16:20:18 +0900
Message-ID: <20260814072022.4064009-15-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 054f0448-0356-46c5-ad92-08def9d4c13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W6OTR/tkRhc6NlKTcCQC1n5PrRxTjyE3UPnDMjNQMbQqKNAmnoaXfGhDCHRhXYtIs3Qtf55d4SpANLX3lqS8yJBFLpZdsJqfN5kQU9TLqTP770gNJuED12Lrehlyur7TsX6wIcSZwL2Q4/77DQp7xbQ5UTFybz6D4WoyMvwTAAOxFXghTZtrUqiLeI+EcdMM2opoh5MZhXHqJpiKhrKjq2VRR5N2iFK9EcdK0PFIFk92CCUdD/yjEnfBZuX3BRGIrWPXVef1cu1ZwC2EVu5eUT40glTyhZJNLgrtVEv971epe1T9Vd1go+h4M+5brmMrFPonF1FfKlJWRpfpvA0NopVcofT4PkJDRm/LiiFZ8kjAUJ6fEPVa2NUYWlQ/QgHNSuO4v8k37Zi1fKl27rb/TCJOwxMj2wwSNcr8OegxWwfYgLlreNvdSK1gZemlzFC+cgDYuW4Z69dd/iVkblvV7nF4058KZKCB7BFLRRoHaYxCIErMYCdZ6SKVpu4niuvhBgV98QtgOIvYtTLA1btrPZIlp/miYIjhZwmDiQ8fn6sOOX+mNXpU7e/dQTlGyPK3b5cI1ozvRHiULkWE4l7QY+iuWbyLc0DSqI0AS4CZkz8E+TrI/+W3lU1BYQWgq9knBMjeC/tKMuK2UyZORLm2fLhhWN2VI+KzZcFgs0GEYy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7+eIppZL7KJSFozkwgn4xEBwAuKsdoSr2PwJw+aJjteJaXhUv9X37Y6GAR8V?=
 =?us-ascii?Q?wOiiZCtGYbgRSRai3yc4fA91L9Ujp7Dl0MXTndG8xlPcXTS8lm2t2o7zMDun?=
 =?us-ascii?Q?JBLVkoFRZxtKvjDBFPGH0WVgraKRbkm6uMl0mQs+GbRiE34PUeSapk74pi/F?=
 =?us-ascii?Q?zEuCvKj/oB+jNVEr1lYDB7UJyCZyWMIntIRVfuH06zcaKUGTY8hgiVb8lUFA?=
 =?us-ascii?Q?YSObS8FKj/18dW118Vd8hv9xqobT4aH4C8Zwym7EssnU16EtisqcbBwtm85l?=
 =?us-ascii?Q?25xFxY+FtWrO9g+AVnFiB4fPQapZwbS7Pp9q3ong47EYz7znYa1OlxzRVy1z?=
 =?us-ascii?Q?2GpCDIc+fZqpNmiQgWGNDLzHeMtvmysI9wwHDb4ORghuIHZM+NPcjEEq9+gz?=
 =?us-ascii?Q?bh7p6FuHLd7XsX/+9QQG9lxcM+csS+RbRoSNFY7IGXqV+kFNHZ+tnwPyU5iS?=
 =?us-ascii?Q?ILp8fsrn/qiQyY7SZU+k0FPM7pQKeeH1SoUpTpx+d3bimedozHYP1Mj4QGOl?=
 =?us-ascii?Q?2S+lrtNYiGsf7UpXFVUiOzKXcf8a2Ig82vOzqzvNCRz0vKMea/1duFP3vRiG?=
 =?us-ascii?Q?rz3olLIm2dQWGbibcgvsYSnM0pKPT/DKKXD2z6a2IJHwGuGW056YcOWBuo/Z?=
 =?us-ascii?Q?qYZAwgFtyPq7Q3/UEZ1An5g4qf9sTj4Jc8lCjiOZf42Oa318hFDZ2Wh43Ud/?=
 =?us-ascii?Q?Dhf05NXN/KV1Zl2j2W4MtDXTCKg+XjSYjDvXjSQpbzRcyxT6LaWQFtkBjt2n?=
 =?us-ascii?Q?vCuVVPLz55iE03aqJ9Nuy8Jgt2qPe7QaALiR9W28V24tcUo4KTRNclOw1TaS?=
 =?us-ascii?Q?IJRKgcy+VVDmwL8O21x8lMc24DNtuNY8xMzkm10iiIlW2hWfp12Dndlbe8kc?=
 =?us-ascii?Q?wiB+frDh8F4e/pTooIHXU9y6dcravadDmr3hrsHPEUpwUBqpyT82g+qaqZOK?=
 =?us-ascii?Q?I1wUgwLxBbOyRKS3XTXiUJfByVo0SvJsJ8KpyOXKn9LtACxYSwrEgOE7xtNa?=
 =?us-ascii?Q?RAtwQeH9iTwmrxkuNUk4tSdnHjxArxdSXCiT8lm9ys9I5fakflEkkDKPdS4G?=
 =?us-ascii?Q?MW7LRHzGZ2r9m4ahxAff3ruLH3hCjtnMCzwKTYuuNwaGggBr/761yYSHo/pj?=
 =?us-ascii?Q?FT6jTVaqlTZ0gkEgeli73h+Fx91NouTwX7b7movZqjIhw7qpC0SLfWIhP4wl?=
 =?us-ascii?Q?nHUr5erJfJ3Jv7XKPVrSyhSiug2W/maNFd/vJxumASwCr0zXzUkOU+19ZaUW?=
 =?us-ascii?Q?ML5O7x2+yyBymmTuAHpsFPswlZ9S1nNN3UYzMoWpmDEMaSZQz8by6Edf2DUe?=
 =?us-ascii?Q?jwZ7ViPGV8+Hq0QunHChCImmIiAuGjN3pIlNuW09Fa0KDIz4vMksV/MzZ6Sm?=
 =?us-ascii?Q?jDOj0njK9Ec/w9+dpS0gYOtq6SIhzfP7JEDuDmoCl15GbNKeZApLl2hTqGW7?=
 =?us-ascii?Q?+rD4RSlTddRYM1dlpNaKnPTh6J2hkFu4UnIXd0b7Ek3NJB5RQlTgKiobNN3H?=
 =?us-ascii?Q?/GwkG5RYrIuiKIKPCQ2xg13lsTdlIe7TtENpiR72bF0THlc1SUYFt6IKdtFk?=
 =?us-ascii?Q?YXUJWkoKJCtI2Ia9k7f7fH0xWkC/7y1Bm4tBu8Qf1M2ZnpkQbAPBfVqK9wPh?=
 =?us-ascii?Q?FcM5GDoXLpmSz9bzV49cx7Nffzt0qhW+xqv1z48OkolMDbszdNXNQnWJFJT1?=
 =?us-ascii?Q?blhFZaosa8hbDQCrCrSV9TQ81CbQ0lIgBBC5hPM0ncxli9DmKMX+GwoBTrsq?=
 =?us-ascii?Q?2TgI3rI0O1c9yOYoVfqQNZhJnv+ANV2cfMzYRvgA98u4B8zI1r0m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054f0448-0356-46c5-ad92-08def9d4c13a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:22:10.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPLQg8w16pFvwFC8FOQttO4XAhkx6buYJ7gv0CIR1g6g9GoIU4p0WVPXOUkfkHMlLuHNB4MkJL3XyDutqaeHvXIDgt7Ed8fEit6MAAohJPVZbm2O6pDMd6kJr+7mItgX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

Add DT node for AONMIX MQS (i.e. MQS1).

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 020de00e8285..54dc793a2f69 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -261,6 +261,14 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX952_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@48000000 {
 		compatible = "arm,gic-v3";
 		reg = <0 0x48000000 0 0x10000>,
-- 
2.50.1

