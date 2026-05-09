Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C327E05F
	for <imx@lists.linux.dev>; Sat,  9 May 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291546; cv=fail; b=YLZZqV44LlaOCKGyf4mkoV1OtqAnKqKJkRl9WVnrDFz6RRoz7xqCt+3MaZEADa7LsQp/LYJPIMDIpTSRPwSlljow9+P0hXOFn4m8vnFc+OTEqUDE4lef7z8pJACFr1/Ss/yzepflMhDVz/xnbeI2FP500Nov/fvVdXlI28h0IZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291546; c=relaxed/simple;
	bh=xo80V4IpyT6KqH0fjTX3f4vuByokzsNfhL2xGpmK6tU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SryKvev16Dresro3UmH9QRBfqLDNNy5fInI6Su0l5Ydkd8S29cYO7J7dTTMT7UwbyGEpTpSmvVC+Bi4WwOUY+frGHsPLXZ4EUkKrdQy8wu8om/OMdmEeY0lyrwN08EPjDhYiqvXB+4EU5BM5TgOvjUZoZu6XwmzA+0qcBhpo/IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FLU9DbNK; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FLU9DbNK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQaSrLGQSdilcipiFDSNVjHK9oGiZJCrhe3fFFXNJWQZ9UDMMslHFbbURyH3bshjUUqcgJ8WH/1Nf9ABskZ/slD4ze1dEoTql7xalNSWMInc+dZgQuSxUW4Oa/9o3CDXb+Lip3/61Kg0jqbzoeRbXJJLI4iu1rP+Uf6N4LI563qUI2VlxTgnTf9Fgq4rYdgIy/F+qyb6twS6Jj2TKOrLyxrgmnVVhgeFhceLrbkn8KflKGA/cK3UqRBp8QGHeHMLholPBYawd2/kC+W1Ve+5nOkE6pmbsliBpWr2Riq5g5erfHknmQphC586MIfdoAiOZZ0zf7f9HFutFn4BbxuPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eEmGOCOEb6u07tkxbxlz22L9Mm0wWE+21v08COpx6w=;
 b=VLDDmbdqOO8YfNwkTHK+hOja1oO+VCp3s00v1x/kGinglr7drk3Z1ZqFOL/+yCUTaA5KkorMwOFnPdQ6NbIkFhcXt7ZACik6v1a2BonBdoLVqNIeoW7fY45FjebLxJIVHi5qa+EFQTXRZ0woKCdo/x+R6bFXX1Nf69cEZhGK/i2UDgxYDzGtMuxSQyW4oWcah8k563SOmJ/QyZRegzrZTuaC7+gWmMewE84AICqaLPcVuig6GvQp/0qmKZdeOzkUGQ328yXlJkTlvq1L31lkWnCai5VOayh65pEQNdALT6iSRVUgGZo/SRb4kA2wUTWGDL627SRPB/HCgFs5ZfnC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eEmGOCOEb6u07tkxbxlz22L9Mm0wWE+21v08COpx6w=;
 b=FLU9DbNKqA5IBOHGOM+iKCsVu7O+yOmWih/oEIS7BIIk1P7Gz2M1UDlwxG2URMuDErCjMo3AAsP24f18jxyKwSSyjtb1oyNdDp2fg+pFIw0fefvYs+k1VEUCHPwy+ueZ9ydfyn1Vct1LuPZTCCC9cUe9jF1STuqhs2HDiyJ+cdpPQCOol4TiI2exc1OxgOJkULE7s/CrDIOM3ZxBK7rUwEXjiomVELALp6nKWB2AZsf95XEil5wEbykfCd/qC5YqU4gMbPRyiDMbtCmwIEO0UbWZfzm2qHOTF/rwYnS9gFIrU5GHEYOPnITnX0HS7O8yVpzILRb65SvEY06jrLUVqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI2PR04MB11027.eurprd04.prod.outlook.com
 (2603:10a6:800:276::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:52:22 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.016; Sat, 9 May 2026
 01:52:22 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
Date: Sat,  9 May 2026 09:54:11 +0800
Message-Id: <20260509015411.3218700-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260509015411.3218700-1-sherry.sun@nxp.com>
References: <20260509015411.3218700-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e46c1f-7d42-4cec-8fd7-08dead6d9c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2NRPnuSTpwWS2570bcvz1NBAl5irqWm5kPh/qUMoRc0F537zUZ18hc1BtgTDw3Fvq9MCEszUw6cClQlKRDOffcgDv1TAQkG4wKiqR5/lJDkNzA8SEy7a89p1AEIan20fTrIF6GftQepQvd50Ij1KkBV+jG0gUE34fA9ESS5yoANyRU56i+GFKoFmruS97q1UsHfP+IlAzh8xp0I2RUiKh/tsKFiaFkJNqDNjD148HEdu4k1rt0I9xk95ftf94fUXvGwfPKUkXq8Hw6ITk1tMjbW8GKTiuTVwY4UTqOtsQ3rRops1Y99rPwVXV35l88KAYJd4RMARGnpFojiUO1oRf+m6UK2kU6dMSs+cVKK0dbSp6y7L13lm42XdYWw8CzWpZQTvdsfWzIsjJhEqOvROg/pXBpR8NfHZXsXRd4unw21nHk/ye2vjbZQxmhNGbSKBDCnamO7dcKh29KB1eC+2uF0Sz3VpyPMSY2NfVyLF9g++x1JeKr4g5MwRRIHiUHTLFzjKG//sOrQ3hoMplDClnB37bfCeeGWQ2xWSP9G67pFdux9S7nrtaSpheP5kJxMvdoEE2tLZESlUgdHb5W/seNHZH+/5oQvm1yvK7BmxXikUeIUHpfkXESe14oPn8F77s2piYGCCpdM5iu/hvn8AIy4uN8J4lejhQuSk8Q7GmxbngS3ORa9bNthGGirSTXyfPB/lnoJDyHT2CDTXyxSw79K75Bw5DvFRTOHLUcvQ8/OA80bPOA7lm0Bynp68/UUm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XACW8sDXOlM4u7nQl6ggxNiUL8m5TUhQhfT4UJxaB+hfCbEXlJUjlPowGmiw?=
 =?us-ascii?Q?ri3jQxuNuk3FLL0d/XPx9oVDHBSjEfVZdrrIJoEThssGpZ4OjJYctaEJduXa?=
 =?us-ascii?Q?JJ6Jz6LBpMYUitC0LME9WXZKUCR3Hb9/iRcgZFBkNRyMYpeCohqa/uhtNjTj?=
 =?us-ascii?Q?xjd9Ee3J3sUQ9XyCtHOCVH3RdDU/fM37/DvScQkPUs+WsdRGDOo371mVkNzS?=
 =?us-ascii?Q?j4EoH89TOy+gPHR/oqXIkqYj/HVEGNv7ukRUP8RYZsVGhojoeLkWwwQ0a/Ph?=
 =?us-ascii?Q?II8vPkrYAufqy/+jLZlzgIxawO+7CJF1b0IJ2trWWz/ByLUCS/mHNuLRdLxI?=
 =?us-ascii?Q?ACHSfUaKa2tsjyRsUp5R6X2huhQVp7PaBaEj0Og7BxaISzMan/fBWPIXcSaE?=
 =?us-ascii?Q?OKuWjbN9T4wbFmK5odZMHnqTVDpIYhT/aPjhtzC92YK3mI3sAz0JqzoBdtIa?=
 =?us-ascii?Q?LBLBgFxgLCm2vDZCO5/X3xgtjI6Ogny8NAVVE9TM1nMobwFCQfLg6qn8r0OS?=
 =?us-ascii?Q?30/898oJiQ5PGt3uXNMSt4mwqXsajICNdNQeVgtRSUQN881r0YwKa+oCVaX5?=
 =?us-ascii?Q?d10MBR5E6Lo33SNbLzHWJL6oPgj9TsIKVZBGAiNHtaAl23N+SOlxAgfsDv1s?=
 =?us-ascii?Q?v5VT0Q6+Q/NOurrNvjbazpxPmf0DtWa3Kyi3hdVvRHz05OdJuRftcEi5zHdo?=
 =?us-ascii?Q?ZdxXQOaTuZfFk0OsLKXdFYD+b58Hn3zWXkAscTxWrj23nB9pO394gCCfu/SF?=
 =?us-ascii?Q?WsoZWVuWVh5qz6rhgCotIIYEacv3dS09lfFNU0oWGxoeb8Cesz4POfc9r377?=
 =?us-ascii?Q?mT+T9P45lO3E8tJ9gs3Fehb/zc/Q7sj6ke2VQAZu41nsb4gPdzXOWTu9uipC?=
 =?us-ascii?Q?S9Hx4flgm9t4Dzs/wbsuYh1iC9WdrV5FlFczebMKZNX7cT6LaoWW2cB6kLPC?=
 =?us-ascii?Q?wZWT4xWk1YNwgmwTUx48iaxXEWB6r+nC0xcP/k0j9DSwmIFRRxrKNe4Lw+AW?=
 =?us-ascii?Q?mBKPij4cWiL2ypyYwTOpRDwbxggnQxYo6msln8UdACZFoLjU5iYFLsUdq8iW?=
 =?us-ascii?Q?/Tsrzb9BBT/U6NCqfOgH45XzEhAcrQbEjqqG9CaNJ0P76bm8nBJYViS+BG7f?=
 =?us-ascii?Q?GDBZXUB4qqEOfXu1oqPAIWk+JnCu5SxxMbMLRq+e077bqRKgRO6WGQb3hdA/?=
 =?us-ascii?Q?hk0987SxEc6t789fhrax0TmWzzeNIDHpyQU1+m3D5aHmt+tcEnM/n9s7Do5H?=
 =?us-ascii?Q?sgV7IUKqHMteftMhz62FbnEMBh7utFLxQzx+Hae1lEnDlFGy8JF2LE9yYG62?=
 =?us-ascii?Q?w4Er3oG0KkruPo9N5ptoSaD1Qwx+Dm3CwEoIKz/27Dpt2/iQv+xi1WAoYL/S?=
 =?us-ascii?Q?Rb3/UrTnUa9diM2+IeT6m71TELwzJPFJxLk19QB4x+RkZWuHCWgTPHr09ifI?=
 =?us-ascii?Q?61fT0Gkn5+U4Wt3io0doVnfQ+gf3p++PuEk9Y6crb1MWUHJgy/Fps+NMw3OE?=
 =?us-ascii?Q?3rZh1k0fVYyVHthiiOZou2Ey2jjJOh1MoEzBMMdIbcwAf1zjw57LrYdJh4z3?=
 =?us-ascii?Q?T/roUblqrjnHYUbIMPpofDcvsZSV3fTqNkj1yXWNAjjR7y0P43yco3Qxntv+?=
 =?us-ascii?Q?sR3DxCLZnbI0yan1yrJIBTAjhIGWXGMG31K1DhitEBdsFpwbASMIwSNpkYkj?=
 =?us-ascii?Q?0CG1v8CGUThlLnN7v5b6qK+0fbdHOp7sLSf5dE6yosz+sRGg021OcepSnbkr?=
 =?us-ascii?Q?hCCMo2QGHw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e46c1f-7d42-4cec-8fd7-08dead6d9c8b
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:52:22.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9Elg+Sg7TKQGrcPOOU+17cy7Bt6ER+tRkwbU2BxjIZU10xz+ziDs0XPc7f8ykoaUMUnqF6sv3I7AxobXCYLaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027

The vpcie-supply property should reference the regulator that controls
the actual M.2 power supply, not the W_DISABLE1# signal.
On imx95-19x19-evk:
- reg_pcie0 controls M.2 W_DISABLE1# signal
- reg_m2_pwr controls the actual M.2 power supply

Fix the vpcie-supply to use reg_m2_pwr for proper power control in
PCIe endpoint mode.

Fixes: 58bea81052d0 ("arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..49400bc9ba91 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -550,7 +550,7 @@ &pcie0 {
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	vpcie-supply = <&reg_pcie0>;
+	vpcie-supply = <&reg_m2_pwr>;
 	status = "disabled";
 };
 
-- 
2.37.1

