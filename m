Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5584D84039
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386076; cv=fail; b=bbWsdHtrK8IdOEotEBwGmRNcdkogqVrlXsFnDIoWkpA6UOAtQ/oGwdd9SdPrLFyteRSMvep2eK8HUntjmwFrzVYyRgSKe2GM06r517GttgWAubmfIy3/jhdqMdayLfONFr3UmjrtplGOWeY6ej+ZAo19ZWGvxlF4dsFjw8Uct+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386076; c=relaxed/simple;
	bh=+tUm1UycMzeZhp5WEm1safQQ3RFevWGBRBkbPVm3zXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CzwkljYTxEfNPItje/XQJ1sYH2ZQta5Q702GOymmjtpezy6ycMgi/1Mgq9htcFQ8y6ViQwtuncj2LitcA56w/DcNwjtFru0RzzA9qEGaNrXJlLzecTcaiU2Pu/g8Jbrnt5NCwyVG5d52lgyDDAWBbD9EyVPqGnvWfwlIenutM/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FZPKrfTc; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FZPKrfTc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9SPXP1x3oPpyJbf6r2jwXT+7J4Hpl8Bws6u9HB0vw/eHYYf68uVWmNYo64nh421L5FofxFp0SX8qJ0DqmTCBtpYHtQ3kck9LOVx+xivVz/VcJM/nfAwJ/cwuKzZRA7/QwITiRI3BXlp3Yl62f6aceUhDdNK3LJE1ry2fAEurST1tTdgfL1dpEujFCgKSt+EccVi4n0jLeCBBTTYuUlt6SAd/387tfwCmXT/Gs2qc1w4P/bI55lT3pc2pZzWnHCuDvY/GwwYeEwz0VZkKcOnUNNK8Y5vldHC8NZLcK3nFd1DVHL7nD3bnBkhHlezTngA0HortUKTjEOsrr+NNKzErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msTo68KlwDvsmRfirAtXc0jRFPxbii2QR5+VaJMAtIw=;
 b=GXbSCaiIqUb6fNBlVmbiJKT+ryDx4iyHugXQ8gp6VR6KbWOuCAzlnzvXSJasSQJYkpyk7ieX1hnU+rtsGH0hujX4MRIpIYoGhog8pMTTLp5INF3tOlPJ6M+K4sr53U8iurK3Boisb6fg911fnPnjhhN287nbxAntyD2sdhLiJY3exqZjIA9qFiYNYbb21NlTFEHcuQIkKFaatGJAYVREEXKJX1JxKE1G4zfuLl0y9BVQdtkB6RIv4tGTu1AU/YJgnLwoC5z0SzA3Q9Qv2DVFUMOprJLyT9B3quqccCqr2fHWdpwbvSWP7dzIuBJ6dIoZ0iRID8EHGB5KGJd6JVrVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msTo68KlwDvsmRfirAtXc0jRFPxbii2QR5+VaJMAtIw=;
 b=FZPKrfTck4vNAGdJflkuW9jWnF1F0t9oK4J08dgK9qmG3CCR8qofyCd0MQYWvDcVKXeGWxthmsogMbfe5xA5PnH8lH/ofVqqNd5Q353OkILIJWMdvy373BETvWgJLxyu4EtVY4DR7Z9dLNgHTn7cGN/nkTBedKJM9KcFugZP+bf4w5zSD2n4GHAlBTWUYUj2DOWuMIJ0eT8Gk2EdyzKkya6lZHqjXq6E6hDQ3OfdpgXPrv0fqXMp9irQ2wcFRfde/Kp5IW7U3iqLf6HxSQj0gp9KOA4tTOFJ6/wDrecU5YJ6jpqgXV9ZQ076Mcyye7xYP6Oyrv1IQkiH21F4rWLZ6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:52 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:52 +0000
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
Cc: shengjiu.wang@gmail.com
Subject: [PATCH 3/6] arm64: dts: imx8qm-mek: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:15 +0900
Message-ID: <20250109012718.328692-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109012718.328692-1-chancel.liu@nxp.com>
References: <20250109012718.328692-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 578c94af-3f6b-4784-c027-08dd304cd5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ckRmRee6nsxy2qvdJP8d1HWJDNEp0LfD+Ttj1T4y/WDoMQzTQQ+UWF7nOXwb?=
 =?us-ascii?Q?nbpmwniMbXB2AFCNWEvsm36FxN6IwJC0WsJ02DPXTgnU+/Sl0eE7v6nY5/bo?=
 =?us-ascii?Q?pi4WVeFkGz5n1hX6TWD2TksQYq65ebSy8muZojVI5hq+sZZuS+FBXbr4pP01?=
 =?us-ascii?Q?X3oLylNYAMzfKlUydyk3ZJTcuyIjLPGbps1a4LNSulnT19Pl2hWzdlNNcYgO?=
 =?us-ascii?Q?w+FAT/RHk1RQqDgXmUwE3HmBuATsT7Qm/FUrCcCxVxwEQQ3IAKE50ROpqAO6?=
 =?us-ascii?Q?/ARkJV1l5MLl9NwZobR762gzb08ixlsRO7LCZFI2/DNWj8Ej0YALLdQfx6Qu?=
 =?us-ascii?Q?RxL4IvsFUKUcPeT/VWo/ZPCtj38XY2BhYpaA0ExpI7kAxlayMGr4WjPuvtNc?=
 =?us-ascii?Q?GFN2WqDXBfN11apwGJIXJUouZyW6I3/BQqCXqWp6fNgB+05SxBvPVEV5TWfg?=
 =?us-ascii?Q?p1sm4MAlYfoM69I7xufvddKbcw0pgF3mdyDDkLcYs2NcjGLtN/rgwuYWvyeD?=
 =?us-ascii?Q?5j81O+dj8C59hYE9MRk4VDvUYfQrzp0A/0B1BIUEiR4qNOyxrjRhbHLzXcQY?=
 =?us-ascii?Q?E95AYcvruOHpnh3bOq/iUB7DG1zKwE3Kh0mhJhvJCpSQgCKn/2mrHNLgHY7p?=
 =?us-ascii?Q?C9nyjSkKy3QVfFItXbaN+j+zca5c/sx92zIa0n7VAd64WxCpIQRvz5m9HbbL?=
 =?us-ascii?Q?6iwblmgj9Fua1lY+92DmGzn4YN1SfE/h4Bvtyiy683uW+YOMINEAu/LABePI?=
 =?us-ascii?Q?3F+uLauw/mrvpn66aUNRzt5VL+I+YZhDmPsg9hEVFCbrBLPn3qzRZ8R0vjU6?=
 =?us-ascii?Q?VZLOOqyE9ejPCkxVHd1JJ4/wyzYmNgYrwuUddOITLQ3AFOHb4r/YuGvBg/2x?=
 =?us-ascii?Q?tGCZ6o+w3clk4JGFkXlD9CB/68sum25gh1kxfiizuDhf/zQs3btWZyVM4riu?=
 =?us-ascii?Q?cYTP/WzGGHX1NbfcwfnXFfUfH3IWV7aeQWBGZ27xzAofebel1CLd6a0upx+W?=
 =?us-ascii?Q?/JWwUNKu8/GI/kopQK3u/H9UC54QU/pnsI0p7Sa/a08CdDLkduMxSmRSFArd?=
 =?us-ascii?Q?oCnqKCaX/K1KRaArGBAi6dmWumGy5RncY0Geb98erurlKTOHdRWLcFLUaEe8?=
 =?us-ascii?Q?cFjWob0upDxWZv27MIik16ixo52nxztQmtZyStsc2jk7E0JIwXTtmhgxBE0f?=
 =?us-ascii?Q?Og4JrDznF7KRm9Io4vnWV/dK6itbh5cnZqcXIMqHe8RzeKsnSBrcTs6V+GLO?=
 =?us-ascii?Q?+w5iMhFNwY9QYlt+fXbHI2QUommnV51BaHERCLGjKMNPMj26Ul/BmQr6CRct?=
 =?us-ascii?Q?scZTMPsrPrdxCNAyY7DVTgPThbzjCIRyjnx4KzXYerKjkBqT4uCbox8wDz9K?=
 =?us-ascii?Q?Adjp67g4DuykOZ0TBmuvo1GvStxi/p6tEeX5avcqSMtXFb1p3HsI7/cMqBlJ?=
 =?us-ascii?Q?gxoIUaorAHKAcFbaMsuSwPHfyhPkZBTt3pD61UfZdbQHBWr9IsLwig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sjsZBWew2OykKokV0EXzVqgIzQWZQ/wZ2h+9xxEBJtkmxXBPndaYeMAy1Jlz?=
 =?us-ascii?Q?XLNVME6sYdOp1K+xVk2S2QyIb68C09q9F22lhA46X0mAjYdo4xjzcHfavbpi?=
 =?us-ascii?Q?uJJLQHLI+UtBUBOZ8uggkJQX4fZNVn30QfchfWSN0AK/JQ1PHSi73pBMpngW?=
 =?us-ascii?Q?IyuMBUWfA21MNmli7lzpzYOD42VCB2iQKCytq8m7V5Gfhc4ooxuRVOp3xRhz?=
 =?us-ascii?Q?vg49aCfdol7fXctTqhVyqtfgw/fno8djuoekGc8XvL2hS0d8NibDQB8JNfXj?=
 =?us-ascii?Q?f6mQGmq2q/s31MWtbdgKnXNg5o3DytJ8KSc0RzTukHSUjJUvQegZKfpCQNLS?=
 =?us-ascii?Q?SnJgrH46bBUDl69rzIIpgy0+BNBSJ4Oao/kvzove0RkwMQCwuQZtW69vP5Rk?=
 =?us-ascii?Q?e0OzmjD4IaUe0Ij2SBR/735e27rjHtA0vdbRhyndqTOOj+91MkjmRaHItYaN?=
 =?us-ascii?Q?wYro+pLBTk1lWL6GyoGEoQXWgTqeJiyqv/tuq2V+8rjOzua1KZA4DxLbEANG?=
 =?us-ascii?Q?FXQ8Wq6kiABk5lDA0kPyShU5WH2lSLNNpKrVq5+unc/u20tyfnv1XNAnaph8?=
 =?us-ascii?Q?NP+huFQHPfCxTcFnPugZU+i99m56Sg4W4v0A7uOMw2n4YFpgurdkI+MM/nGd?=
 =?us-ascii?Q?nHwO9IqmQSim3//mPyDJbRb5YCBJz2G5r06s+Rf17hDLObV9jI3FvRKhCLGt?=
 =?us-ascii?Q?v9PXlzL41mz2Ea8dzpeXEmJ6Pe+a+D1kqzXDlVQEFOyGfAHDBj/QN4HywdOp?=
 =?us-ascii?Q?Anjln/Dl+XM6W7zwM6Y/oaR6/hXbOdzn15b9NCwY5+5FSfeHCh0CbOGxO3OO?=
 =?us-ascii?Q?wVuZkluPSJJrb4wjhVcmQr4rUoeRvwaEULJYVqvKHk84koQjSpEug7y7kqmC?=
 =?us-ascii?Q?12ow2/0Ee9mbP0RiWg2fQb+LgDcbi7wISCg26l10N0nwkpPPDoT+8hhDvjt8?=
 =?us-ascii?Q?7Q8kbpVk+Omqpeh7KAOc1SAWlTl0+i1qih0Th+Ts7VLOjiOyk9ih5yCJnQED?=
 =?us-ascii?Q?9YnvTXHlQFXfIZUrBar4K9DlE7h5o9yFa+QXN3cr8NNps+dK6Kmh6OOA5Ti9?=
 =?us-ascii?Q?Xa4P08z7W0mlRjs71rV83UhXY2wlEIxyWjE6NyijZ5yYaMdMHm3BhUQePeDD?=
 =?us-ascii?Q?a8TqneEAqy+kb2FiK55y5HSQXzGjl9vKZJx4vqFMlQ1uqezXZpsZgk5gw0y4?=
 =?us-ascii?Q?wtLt+++/q9QroEOXmGkz3FODfGZOsXcMCIiCB7ek7HGu7mNg2JCoKNGv2WpO?=
 =?us-ascii?Q?/4RMGv6kb7RJDHhs9S4Rd8gp9bLOfix4YzkvNRKdiG7qGBfpqcWE67BY0i2a?=
 =?us-ascii?Q?zAwscEZJlt7VVObke8Q1UkiVzDYzFTMbGLxzqiGJlfGVyVi43Mn1XeiSBJXe?=
 =?us-ascii?Q?OUX+JGzi1/wO9Mi2TIE2+Ibh3gHBuz5Q87ZIz+7U2OMzrEtyc+eU+BiVK7md?=
 =?us-ascii?Q?6UBRVi1Zs1GrY8XSNSreBP7BUkV1D3WU3VnK7XYyB8g8QwIxKpVTdmPSTW4G?=
 =?us-ascii?Q?WLp7eDn83InotDp1XXmV3/S91phvNS7MimnL5t39bFJFtPtosC6xjVoasheX?=
 =?us-ascii?Q?+F+3ncWSOSci4s7NGziZoGr6I6365/8pLclnK/zV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578c94af-3f6b-4784-c027-08dd304cd5c0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:52.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neTJoNzf0O+8fYCU+xhla96BYZ8Ns90MVvdJgksGziJWWKX2apzflAbXJ6njd+ZAfriqORWox1mgs7yntRYgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

WM8960 has the following power supplies:
- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD2

Add new audio regulators to reflect the schematic and complete missed
power supplies.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 50fd3370f7dc..dedbc6a22773 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -220,6 +220,33 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_audio_5v: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	bt_sco_codec: audio-codec-bt {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -439,6 +466,11 @@ wm8960: audio-codec@1a {
 		wlf,shared-lrclk;
 		wlf,hp-cfg = <2 2 3>;
 		wlf,gpio-cfg = <1 3>;
+		AVDD-supply = <&reg_audio_3v3>;
+		DBVDD-supply = <&reg_audio_1v8>;
+		DCVDD-supply = <&reg_audio_1v8>;
+		SPKVDD1-supply = <&reg_audio_5v>;
+		SPKVDD2-supply = <&reg_audio_5v>;
 	};
 };
 
-- 
2.47.1

