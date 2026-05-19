Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5D352C54
	for <imx@lists.linux.dev>; Tue, 19 May 2026 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169960; cv=fail; b=Wf4DxGuWBJBz0ZgstixQIkpmaBha79ul4MWv55nD3TkYj5UsStkzgui4e8T/LUWQRLXihqmAQ5FeUuD40SYOw4vSiH5t5H5k4qIVuTNbRCEKAwkG6Jpn4//AR9bL4MCFKXzv7iHGhCzJVi7rOipfH/i1bT03Xj5nTeZlAjSop6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169960; c=relaxed/simple;
	bh=TbSctFc9+3h6f5QwPFNQ4dD2RFNpZBd1J1Y877ys4QI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LHRKYIEn2X6zYu+HrJCTBUjK/hW5VgVhYV9qA/qXIlNMlQMarlZaahyG2AMu1Yyk2bYAG/1f9iRb89Vp15e07Ej6fEt6RT6aakGFQSjzaBc/WEUDoFQmonbu1CEA5fUcdQWNd/em8OExkmLCyH8Pz+/aLqwtApV6kmEp6Imq4w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XznhCHum; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XznhCHum"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddYaprFSOrjGSkqemPR6NJXVKwUWx2dffae5nVYprZGrv82YlQoW4IGj3dRWJ8qwfU/MbaLu7oIEgTCaU7IdBYcU4s447vzIQtt1Rvub5Op32rn8kW/m1QjNc5LmQmU26lSDawR0s7i3qsGki7b3Cl4fX3Yd1hFhb2OWHQs53FafDM4lmo17jQ7ycDE0RaGBck6usvNd2qRbcFwj4r4MWy66bJsa2NCY/UHF0rkZv/JSuJ4oVmnUVMItaZLobV3nBDfCq1pCHCMJCRcArQNHO7pyP7WsrsolFcKs5XVqoM0uldB8djaApwyc9z/2H0qv9+Vjbu8DbiDQyl4S6Xuibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mFg2ehCeHtmq5Il2K8slP7foo8PjDCFG9KQNms6+0c=;
 b=Gs/7eSD2ShHEcxvjkmUXYeV8imPV+kpBaNjg6+eOHag93MGvHI14CYqQOT8jHKdrGLur9NzZlIQblNXUx87/UpB6tLikwyKYaw3Xb6B0xN2i/bYGBX2WmF88Ylrg2ur9GYLS1SHL0jHbdSpmIeKeOYhPgXEnEVqJD+PLCu3UiHqg9UwfcPP2ppbvp+YyhOT69mFz1sIHD1fuBdwPgv7B18fMdEZ6A8fe/HXazNY6ihhpAN4+5lqKaqqCpa/DIFiKRtOrp9VO6saRnrqcMMX8gZv0dBgfQXoSin5WAb5Qc9Jo8yYlIMa0ib1q7FKiMS7XJS1IyZxHIeAAqBZLzYMiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mFg2ehCeHtmq5Il2K8slP7foo8PjDCFG9KQNms6+0c=;
 b=XznhCHumy9lZBi4Hu0E6/UluaO3ojxvKr11p3x3viLafxLyPBUZQ7NrGnU+LJ2Wkj3ryWY7cpDsBPDTNGZg0dopj3Q3geZXRPFZdV2L4jpqzv3VfNO2JoOdnLf6URg6l9tpoRki4SHk+RYRzZKeAOUuFcjmVkbYSpD66v7Y3U9swDmSh0X8mfoqv8urSIEYpBM0nntEPqC2N1lRfu7D0v3b/BfD3r/Cq+Vb8B4VT4AVIbHbXUudr8dKahcKXutAX5sdXp/kYpiTJ6u+To0mkm7hrbj5ZCgMKABzKYH0ACMkTeU9vTKjxu17051EDtPcCPJIeoMyufsSJNFFs73aFWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB9328.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 05:52:27 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 05:52:27 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
Date: Tue, 19 May 2026 13:54:31 +0800
Message-Id: <20260519055431.249960-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 45330d18-3de2-432f-0564-08deb56aceb1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|18002099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info:
	LinbRPXyDtlBtCBUbPK7adPWcKMIBac0aKTmPsabQ/Fh6brZaVxMj/4gUHxt92JDDr+JYPqMFoJObgqgvPJQDarp9TfNHUOe0WUQuCv24dL9sdLHSBUlS9C1sMuGjviKLTDddw23WT1c+GOn7rJnMlTbTow3YGKEmXoPlPH5Zg/ey4akls+Gzl21BsXumCSekXUm4g1NO+yFv8W85H0YgBohKE11qsPklGgw1P8myagp8AF85HOavT745OsvtBobdJy3MA4Uc9xOXXWEoN2kDo4EntKfUfSGuL5dma05v9qpS7kA5xq1VFdKWfs1SGA2mUvbGQq8e2M641v4EBwntQVXbyCD5mvvpIFB/lCoHA22p3zUW8KFzQUJqVimgh/50EYyNWwPjSS0UBGvCOpJLK1Pg5f2282RGSRcQ03fjuuEmFDspX7FejCkpHBUorhdYIr3vIzMqIDWD5u7FOkvsIjA8mt9r8BSpJkKR5kNWzsMn574Sn4zsH6gN2ezhdQQ+ky6ankUYb1HAF1cPikpuOD/5aaQgK16sWAcuXfTZJyDtbbsESF0Zum15lEvRjGyU1XJV3m4l+6FY6pQxlZb7gHzgredorSYQdSZf3soV+UXaNC5ix+6Db4C8iEbg1oNzLtlsVnpUueKzgyEIv5oh6bPoo0ujepdkYOE6obKgfrKMmVSNAHZGzO0JbJXLlEQhD0kn0V3QB9EgjVuVbcyLlEiqsrpRatB77epooAp71icGkxWytp8pmzalL6Pa30a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(18002099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MOkAAxib2K5y4BLqwjGLjnWTpWyYlM+dPyGc+jBY1qEh+YiZvZg8WRj7pRQo?=
 =?us-ascii?Q?vAe5/onR/X/pcIPxzGwPVaZR16SQezZyNmJR4xLohFSslE6HBPhzYMsSAvAK?=
 =?us-ascii?Q?J4d4hcIHaCmVvE4Ix40CgXglPnHCJTc9OdzDiDBRAvjiJ1Jo/YPqyvaZp63X?=
 =?us-ascii?Q?z+03qqZtri828HXmV6Y0tyCKqVTmJFIgp1XaZ5r7rPrze/VZH4ESOWlzHg5Y?=
 =?us-ascii?Q?aDXTtGED3dVwZ1tbKAfze+EtHBBjF0F4GxK+V0kSO2uqI1jN6RmDmEM0vfvf?=
 =?us-ascii?Q?buvLWhuJMM0ND8SW8r/WvC6NYwiOGCJpUGi4nBpwtLpOS91UKnHiBM3uMhRx?=
 =?us-ascii?Q?PuMN5beSBF19srRc5Ct+/hjRfgRNN1P9KawWb2nIewBGbxVIl+YFVuOSUTBx?=
 =?us-ascii?Q?QPMjl9LUS92BjdiYJZALKIxg/02HOdCYr/wFGzcpRtxBRE+3ofrEFpzFLzVO?=
 =?us-ascii?Q?scOxWZTwats/K5cydDceMBzx6D4rmHAhMQqacP5raiyFhz2lK52pH1VMXK7V?=
 =?us-ascii?Q?c+QtkJGAr6x8nKr/l+lyv//yio7EUVq0AvmrTLTAAR/hteSJShcwUHk+O+CW?=
 =?us-ascii?Q?irSs8YAE1bavgpGFcluVxJXv0Kb1fUhYY5TFLvMurf621leHM5ag0jt9fr77?=
 =?us-ascii?Q?8Kv0saPpKvsqMkGRfhX+0+HFOlklwtYAhD/VpFTtQqx0em4BZDBOOGdhtd3w?=
 =?us-ascii?Q?XcjxeV1nox8eXtR4raH+iZPXStG5/H42y5XfNoiNdBlrwA85bPSSnoyCOxND?=
 =?us-ascii?Q?ObrvPkS2J7/b4AxSF1+sKjtS88Jt9GKl4ZKqFtMxIcE8mTr1h53+JU9/5mmp?=
 =?us-ascii?Q?o1H/kOaiOdMqvB5XVzLnjaaeJW+CC9T0IMJ6X5bIbCKKaxJFBHcDcOnEgjMd?=
 =?us-ascii?Q?5TBYVIZyT0p8urp6+msSBDeAqhImr5i2solFWEDBZ3bnpGhmj+P3jRPOy9IB?=
 =?us-ascii?Q?26gzJiosnVd2bYn/WHX4jofzbdmNsoPvxF4VagXbr7ScZFg3g+oPAtIXfbwE?=
 =?us-ascii?Q?c8KTWsAcuMppe+6f8z4c+YDQq3ReRNXWwRFu4aeArZUNQfA1+v0hu0PJUlxV?=
 =?us-ascii?Q?N7DUs8bTxSAkib+jcXBGLkhsHxqNUvqBzc95irhaGc59XOGU0qJ5cRGuTu/e?=
 =?us-ascii?Q?q/2Qzhqgw/7fcpgkMj2gFvVmufiPvgv720LqWaaNGxTkOWw95WctMIPTULB/?=
 =?us-ascii?Q?2LHelbsrc8OOVuNrSBAN6ufo5xE44hSYsSJEQI65HuZK2+6tGYcKX0LuVxh6?=
 =?us-ascii?Q?T5HMOfJ88fjx98TJeTNJZNOSwl5Kw+5SUM74uGvA9theqKJA9sh9H1KA2jxR?=
 =?us-ascii?Q?N5+lUe7hkL8DqJpth40rlysMhz4jkG6MOEr6cMixyPt7l56b2uXn7PuTM7T8?=
 =?us-ascii?Q?xaLeJjs1K4ByPJYY26ObcgqEfnwmOPUF/EKoB+yg8Jld6KgZjUwmz0p7QXDn?=
 =?us-ascii?Q?pMN1bcOSxHkYzRF5vRs3cVuExA3YewwUST24U+mUF3RT2LU3JHA6GhhT9Gy0?=
 =?us-ascii?Q?3u9XP09rimkmIpQDCrfMUFk0BeXTHLJsBNJTEavriHsANreNV/N/X0Mn0I0u?=
 =?us-ascii?Q?URa8aUMbTptNW80m0ED/5+TcY5Fm4IQhtP2mnPhH72YXf7e38P7G3icfz2RJ?=
 =?us-ascii?Q?6Otw65/kKOw48IdLo2/ujGwA/yhiDHK8fmQYPOuHuGoJdGxYQ6E1PRTp3eoX?=
 =?us-ascii?Q?NuCJR6s2vi5lbEZelVBrXb3n0ZBOZHZqgjUp0w7Azkp60DtzgY2NyKJFTbeU?=
 =?us-ascii?Q?rUOMdujXhA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45330d18-3de2-432f-0564-08deb56aceb1
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:52:27.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1yxJ5eS39P9ciJ1RjvJFDgekH+x9IMlgCY3CMfMLcbD1XcbQUimV0oK0dD6avP4ApD6mR+bHiR7mDBzQarmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9328

From: Sherry Sun <sherry.sun@nxp.com>

The vpcie-supply property should reference the regulator that controls
the actual M.2 power supply, not the W_DISABLE1# signal.
On imx943-evk:
- reg_m2_wlan controls M.2 W_DISABLE1# signal
- reg_m2_pwr controls the actual M.2 power supply

Fix the vpcie-supply to use reg_m2_pwr for proper power control in
PCIe endpoint mode.

Fixes: 1962c596d51c ("arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 1346a6a56883..7cfd42468950 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1043,7 +1043,7 @@ &pcie0 {
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	vpcie-supply = <&reg_m2_wlan>;
+	vpcie-supply = <&reg_m2_pwr>;
 	status = "disabled";
 };
 

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

