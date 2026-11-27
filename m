Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776537;
	b=vNhJlVnDRISwKRtLbqptBCPBk51fPLu0tKS2P1j0jcLO2xG9aSxyD9zpRjzVOlkVNsQc
	 22Uds4FZLum00wsA0HZQoeB+1YI1fVnDHLdnErLXBoONMgIb/ukAwV4Z5bt+XzQopuICQ
	 x1MyReA4DdCTUsZI0e+CCRJCiDTADdoAuLQ9Pi2GvyTvlAqs5yUvun4uwCrWDsx8m23bE
	 2hKXppOHignRxQX6cvPDHs4bozVh7SIoKULsX3eOLicaxjVNrdSJNrz0dWielHcJViR2V
	 SQIvuH6L63np2y/xR44dfnho3SdkC4XRAqq5U51p/2Yt6pUd5SImxLrcO0e/HeODpbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776537;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3zuC7XGCbjANdXirogfZAR/JjJ9wjf7xb7TOpVMD5Yw=;
	b=TGWjuvZVLBJpZGCTtZ7Noi8Ujzf9h5I/eP8KrOkUI0IhHp31L4lZc5fAL1QDD/BBzaxC
	 YIrS92KpJhverOnfQbKE1+YfFGY663X7g2m4htkveKwv9GnAziTbGz7eOFZe1fivbg7iS
	 BWTKMNZ8WDee0tPnOa4rG0QyhfvpQUmysg4jLZ3tR1ATbIsNVCabOc1GToa89cH0SjmlP
	 LqArdsppDhKoJpmTbR5n0K4ryYpyduntfaholVX7LfRRsDCuXSmGJ9/Od3TraNL1jV5OK
	 HZsl/fe5bhl+zqbI11zFy+QsMb+j5G86njbOb6BDu084rxT6RC38/uP+9tY2jhy0OPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mdMrdl0f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625C606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8625C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mdMrdl0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8sm53m9L67nV123VPnfJ/Ec++OGrTuW9MW5aDIWjxfEnqzPEKZPOeZXEcUbKIFHOQ78lzKdS7FFo0xK3llLk5+w1xnXNUyDrP4j44qSJvRsSKE3uoQ/G0ZZ2d4VNrNYBVihtUm7sfFFQanzPsJ5TpUsMixB9XdDKCRa+jhol+4ZdECoAMmCyh4J/pO4nxKMmz7BBr/00ty3D1ahFBp/fqWgXAomr2KJN0XoGw980sbyM25H+AVxYzurFdaeEOuFFBVxLCZ1nEsPnypG4DTiZYWn2XfP+svUrvh5lkoHdqv5qIr48AHehEPAw7iXmL+R3qtHs/FutmhQ0JoWFg1u4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zuC7XGCbjANdXirogfZAR/JjJ9wjf7xb7TOpVMD5Yw=;
 b=WqpQXWyB+FwCmvJ0maJctG/NgbIBj891dJG4kYaMwgGZz0oGgeHBrwUeYALXAkhPGr5cbmFk76amJ7yrY1UDfLUiuqjq2qSt6Exs+WYEoPTW8WI038VXhfwUUTnou5u8/l/MvKos/vAFhpKhyI2HDKBmz6ppjDLv65tTD3Zeegaz70IQ0MqR9A0TspPnAEzw+u5gtMc7wAD+OkrvU4gtFdpTFnUZO6VTaGS1VUyjsuFVAkPcR4C07AxNKvjqYq+2+N3QsqlAiJ6ZtqcNP0jHK3z/z9TMRsByKFV2+8BKR1uHBbKA7hOwoHmV86xn3NBlqGMUjkYCB9IXTFGWwbuZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zuC7XGCbjANdXirogfZAR/JjJ9wjf7xb7TOpVMD5Yw=;
 b=mdMrdl0fck28gc6JpG9zaon3FvnFIT1r2dFLHgONfkdjeDOtpzwGyOMrKlz9KOKbPKzPHJhv5tNS1OG8nVLdcpywq0V1fxrFIvnREXa48DbwEuXtvWes2fi3RyKxJadH2Pgw3voVmAy1X4nAqTy++f6eZjpu1ER0O0ET9uGySvNIxZhB4nCORpDG7ia1sCVgZINnj4T4o0GFU9hcGHzNige81Hy96KfJYPYfqknw507fYMW4xtR4a32gudFNd1J3sgsDLcY4bS2N0luujxvvXhYHzt2wsiTCUXFtsME53hisJq2JnlsEKn8fc/o0qdc+IRipucj47rG8grqmACPNJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by PA4PR04MB7999.eurprd04.prod.outlook.com
 (2603:10a6:102:c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 10:48:49 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:49 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.dd,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: ls1088ardb: describe the on-board TI retimer
Date: Fri, 27 Nov 2026 12:48:18 +0200
Message-Id: <20261127104820.1990733-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
References: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::11) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f64236a-cc35-45d8-7a26-08df4c7404ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yw9MY4By+aDx4e8KHKYVAEy7awyp0DVRc4BvEXGzVXoE7iCnlzotZKwY6FbBKXrZHu5f8QcdpLXBNPz+PlcUR15YLoD5CIBVzu8qclU+5FvrLMVk7t2HN3nWD/ziRg6RyxoDFXGqsXC/LTssYgp706A28dPwerkG/Tmr7vSnGULtnHqAxXwPpxCbt41g6uuwUlFfykuBCiAsy6N9ufoiLtVfh80yzlvLGuOUEbvJLlXqzog4CkvasgTjw5+u38DWAmzDassdygeqOsDzO3Xx5P8xwDU4r8H+aejnRZZ/dFRhZL931/1dTSQKAqWvwc4ArlJ67PQqhSFsrs1PwoLINthfybrTgMZIzXI8wWMRtLTgQxLyt/5zo5eGNyQBjLDcI/WvspCOixLmetrWOOcdlhlPqijrDDW0B0TFBBgXnUvcAxCqDIcTptNlfQ4O/H28DC+LZcUk2hQcwJ5DjKqqBrt14OLUMSzlvGI4TpRqn7SXQGZ3wKbBncUNIAmg6WWdD8B5zzU4duwZWGJenOi7YH/BZUfoNyMOZB4rAAcp8hSgrrETLO7SP0J4ZRSmvlIwrxBTmnuzuLgxKPw9Gu1fCh3V/8mkXC5GIHNR4B69goNHMfGHB7NHCoGTg6QMTGxIiw/oM2u4560R+OelOh3C4Hi2OoWd12p0sL+KQCWtOdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?36on9aYFZomjzwcKsMlhiy3nl7ufhSA+oFg3zFbuUFFSuJDKLFynnkgvL7rp?=
 =?us-ascii?Q?uB2z43Gl/OB9JKcVsWNFAqWRQ6UYgwCqgs/gpMLk/wdR8RD2hEBpnqV4fC6r?=
 =?us-ascii?Q?+fA4r7em7nsyBde7f+CfmcauVFQR+MsQHZYib9MBbXztBu5mN3QNH5ZhFCNL?=
 =?us-ascii?Q?ArgJxO6/AKm0m8xivIcGFCCYOOzD5pdiVsEtglKThyDSZa0tiZKislTIOFdi?=
 =?us-ascii?Q?PDc0gDWbMyQ/rDC6QS8xr+3z/mgEhUNns6xITGWrtx8/SVh89m0aUrUzJYPo?=
 =?us-ascii?Q?cdHvOGiczAD8dqRJ67VkI1qsnG8i2Iu39IaOACtlzi6pnp/Tdmxk9Ofvigji?=
 =?us-ascii?Q?w9bwJrFEg9te7g7tuguG18xW1GGFrmKdmcoA14byhdw7b46So1C5MGfe7Ygc?=
 =?us-ascii?Q?VxLFsMUNi4k211VaVJA/oqqfz8GkzKwu74oeEFuX6gmK04vWDb/JU9di7Trv?=
 =?us-ascii?Q?Xc4W9XwnvKDRLpUiRyVr2kxjkLu7LcbYfGaQ+SItfjX5ZJSmDwaXVS8Xm3v1?=
 =?us-ascii?Q?eh3iBHDVyoRA01b1yqqs4uhJiDP+TntIX4g3I9NL/+FtXJ3lo4t4o4UjoTOA?=
 =?us-ascii?Q?QfHZ+ReqG36EVtdB/DD9Q6Sy7gDWNbZcpsC25zVEvwTOCiw2TFR+jk/G/TuC?=
 =?us-ascii?Q?yjkOTy61+wpstXgif+/G4atlS9s1lhL2jOZm7iIdOCB3toHBl53CoT0/QXx8?=
 =?us-ascii?Q?0sVyeb+YMVVnxNZQv94eI6TA5hTMzA30y8cx8aQg/DmUnnNs8AwuZOJCBzo2?=
 =?us-ascii?Q?sDscuMaKnD6dAcHhNN/6dCgD1yL+IkvfMi3GABKtr+zVzoi9m22Bt9dQnMBn?=
 =?us-ascii?Q?yqCb3F6ahy8IAoTOO2XTaVWizPckYq5BMngFiEUu+2I2XvaEIT7sSJjqRhFX?=
 =?us-ascii?Q?GnzgJGx3EoV71DpRjIjfAWAol5QfhV9uInYDQwiWkcOmC9NtwlabV4Kz8LHk?=
 =?us-ascii?Q?yRcBDUReJE7zNOkzVuXPDyydgMdDQsPIE0m8Jg+WTaSHFfO6clohvEFgCQlf?=
 =?us-ascii?Q?x3l8Gx2AAnrrqlNptEM+3VbL6wzvXwEVa5dahWT9UYeYn4DVfVeGabH+bgv4?=
 =?us-ascii?Q?ulWC1JWO00TO6XNFHsrkSvT4CL01g1DQMCu72bZhyps89rHKlV8EFxylI+qj?=
 =?us-ascii?Q?vfh53p1DnFlRPganOlEouQGZNftNyvRvChGwyz+OkKPQ9gYpcwTDMI3Af5xd?=
 =?us-ascii?Q?8ejKv8A+ZNcgtioKC357yxn2ULPRFWtFGcaI0U/HtMybG8kb+ZIn9uHVdAB9?=
 =?us-ascii?Q?OUbvCUgaVhQlcNAECHFTqq/Im4f0RQSW+LCQSyTxuPr0IJMG82/YM6yCY/v2?=
 =?us-ascii?Q?VwOiF66A1UACgSdFFYEF8DqzslkpEE+xZBRuSJocjR0kPijGhlOcfv16eZxY?=
 =?us-ascii?Q?EUMjZ4TUUg2nDO/8Ffg3waedclDpuW7+N+rZV3M9xB0OTNp7v+WC3EUwXImU?=
 =?us-ascii?Q?+GUtD2F9s1ffrhI/0k4Q8szGO18FcZi+GKRenVwxfn9mjsM9hBWeQGxGazVe?=
 =?us-ascii?Q?CZo6Ok9v6L0TOFOA4OA43EmZ977M6TCI7lF3YmZD6oT09BbXyrNTp6xOdy9U?=
 =?us-ascii?Q?c0OFU8Iw3b9TuWBmUiApr5Utj4BuKskc1h0hOCLZslIJx9p8mGvzGHsWK6p/?=
 =?us-ascii?Q?65J+DkoukMlwXdI8qWXD6xKiwo5UYs0c2rhEGAMqxGqc3i38xlJ3eWYzL3Ar?=
 =?us-ascii?Q?2FMHxjZDgWBMg19AqiFooCT+JatE2t6s7LvnGi78i2sBzJaWTW2yxSD9sjXJ?=
 =?us-ascii?Q?DxUxunwn/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f64236a-cc35-45d8-7a26-08df4c7404ff
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:49.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c67YOmcfrh3BdabMsbsJN+18eb+pwszYw61S6P+fX2WBuo1P3ba/8Vsl287X08EuIYYQuVDzeq23DWgKyINDEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999

The SFP cage of DPMAC1 is connected to SerDes 1 lane C through a TI
DS125DF111 retimer found on I2C channel 5 of the PCA9547 mux. Describe
the retimer and list its two channels, one per direction, in the "phys"
property of the SerDes lane node, so that the retimer gets configured
together with the SerDes lane.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 25d91f1eea29..dee872d79e78 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -200,6 +200,18 @@ rtc@53 {
 			};
 		};
 
+		i2c@5 {
+			reg = <0x5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ti_retimer: phy@18 {
+				compatible = "ti,ds125df111";
+				reg = <0x18>;
+				#phy-cells = <1>;
+			};
+		};
+
 		sfp_i2c_bus: i2c@6 {
 			reg = <0x6>;
 			#address-cells = <1>;
@@ -285,6 +297,14 @@ &serdes1 {
 	status = "okay";
 };
 
+/*
+ * The DS125DF111 retimer sits between SerDes 1 lane C and the SFP cage of
+ * DPMAC1. Channel 0 and 1 retime the two directions of the lane.
+ */
+&serdes1_lane_c {
+	phys = <&ti_retimer 0>, <&ti_retimer 1>;
+};
+
 &usb0 {
 	status = "okay";
 };
-- 
2.25.1

