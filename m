Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CD1340264
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897989; cv=fail; b=CSlWAGFQs3lMi9EwZ/QFb1rIysXjfNWKqzKJCgyVtjL1fM8Z5gx+mbPOXXN0WdBIVLOMVABzqF9tLEq9ujuIU9Y875kYLjRVCb/PXgddNQ7c8qMc7j5gZvsO7uiex+itylp2cQUiMBKkC1jmW6sf5xMG3x7QYKHU7PvubZl4lHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897989; c=relaxed/simple;
	bh=Ns04DQ59rLfLN9Tzc8C9KNvYPHZ6j2sZV6nak1HSmU0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uqPZC14dAMPnz1gxp3EvIG1wubhaBHizlm2bMLuXWGMYFpenPXtxgtXVAENYXxNMs07eMsQgz7H54i3EzxZONzsXnO+oS+PtT4iclbZnfe/O2NsVddGYAPWrn2zzOOCjhQ/zrmkfLm9ycfQ5+vvUlgb3AMuc0FSupZpvK5RS6+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PaqejHo9; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PaqejHo9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8fWYQ8gpI2UAfxwr6ABLlU/6EFo9W32V5cMs+TxovtWgS/s/ETaQnY+tEyPLW/J9EDxE0kpi5wz3M/l8unA6iSUVJBR7RJy0m19kecyOXK+KuLgJdHrU99NgnmEwAko6slfZrnplbJbVq+wVXguAYoAcuItDdfeoDKO/xrT4gsYaSCodySc4vHVqp7dIkCkIiWBr60TS+lFJpHASoga3yStOZuJVN9Z9Xh+tfVer25D6qrItjUvbLBAq2fQkCHpupn4sfmjsAq9VzQPicX5PMsEx2bOKg0B9gXB+6ch9uQy5FCtSTmJmbnNzcLdP6D2RWGT6AEtmXHZdd7SkEcdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=;
 b=lI6YOpBzqLnwKT0IWjxMN7sOODqRXfp+N2gwOk/j/7qaVuvTCVuPtzRLBvZ7C6OWPqA+02g5c0Tu+iXNWkKa5vN9A6U6XvdXAFMD4wyiTk1n1kicb9WClih2G1mMsGd29EEhFmSnIuhhZDH4cx0fvrYrPtDBDq41d9zwCFgixiJY7PAeJ+THbghGYrJimriF58of6Bgu0PjliWoSe0fGh4ieWHrA3K8Fh6y1xKq6G8jk0hERYaRbCjNQGEOxulLzcjLfBW4BkNw+SavEBC2Dd0rsAR6vpeNOeRKJTl9dWemQ7PuQNbM1Iu5K3kGqhZNZ0v24fU2YQWyuZChb0bSH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJDoCFOpHi7PC0uRvJVMhbyyY4Hs6nO4u5vH5JzJjIU=;
 b=PaqejHo99aPxZiNL9C9KsJ+1raRjuuPpCXvGVA83otsoTFR3VW30u7UK5N6BsdaH/+IqTCNkB9blxlxkROUqmxpmkT3OA36WdOBfNn0bnB0JYgf9QmIlB7a7M4psg5LW0WQPeHCIzIdJuIiIdCiutvsU4uYWUcJCj7vBmCCxvuNQi4CkyZjn46ZA1lY6Ib+9J70c2tIkPEJc+Yclr8zeq+9TObOeWBrzZs79VwOh6aizY+PCH7biMIaG1BzG5E4saimVSMcJdQebbKhB78tgVlNgX/sJDumO/WZxBpf1rV2ei6b4nnNovi6qPy9YC9ffoQHaaJ0pGcxcCYU6SrC9SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8797.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 08:33:01 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:33:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP
Date: Tue, 20 Jan 2026 16:32:33 +0800
Message-Id: <20260120083233.1899272-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea95c66-082a-4235-bf9f-08de57fe85d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5vzHXc2vOBjFTss/2xppvgWH7cEykel0VAOzk9nsOnWmmjfUGkjlQhV51q1N?=
 =?us-ascii?Q?7U0q/bnI2dSlfuZlQHErh5+Qeb07e6QlDaGjU8jyEw2P6Aczma84po2ztdpY?=
 =?us-ascii?Q?ESue0wkpB+20skSfLm+wyst5/jkNCSGSaVI5m6gm3XLq5C3nplBIs6/UT1xN?=
 =?us-ascii?Q?qaIgld81OmmfGk0KRT7KaNqydA1XcSJGKD1MIPhMWWOoCES5hWWrjb/uJ3Ot?=
 =?us-ascii?Q?Qz9am0W8tX38D3hvIDOjjdKWIhkYtX4mhEbu0ahvrDTFSCO176Nsjfb3DqPJ?=
 =?us-ascii?Q?J62SBNnLoETcOFyb2cFTj1Sh3iV1wJMcRoX2zuU+rcpJRv/J8x9OJCzOKg88?=
 =?us-ascii?Q?e+ATtvXYWugbRYEz2lZgOEA5dnIXZykHxCjw+NJb6jp5dGWzrwg3G29tjs32?=
 =?us-ascii?Q?ufOBYnfP9VFOPCNYKs4T4UNDvIbDFERoJ1LmQN8zlOwCcKHcf0nwWiAMMoy1?=
 =?us-ascii?Q?EK923+Im8F4XRTMCk2VovOduNZKsZz3xeA5wjN0aLOvMuNtg3RGN+K1suaSw?=
 =?us-ascii?Q?ZuKhONxH1IewtgKrc/fn5JhizK6V5sSihA8TGz2YQmaEH7UDJ7g6LZ2YKjqc?=
 =?us-ascii?Q?DVJd2QyccxcscbPGr5WsRqrnBKmCnGqyeIi2TbHDosd7wzRcaph497rwG+ok?=
 =?us-ascii?Q?uFpqbjqfC5eHFEePBsFsCDGjfTfBXwUidwiojt0BHxKYzV4+C4bKsBsuYA7i?=
 =?us-ascii?Q?4SX8mfh3C29/Sh7cUyq5xksRJgqILpi8MfanGW/aMzQWIPhtgEg54PmjTx7R?=
 =?us-ascii?Q?XcvF3n3AZxbfkmgTegN9qoQ9IxwQ8YlSBkYNbdP+iALl4lcsLukGnE+KtvpW?=
 =?us-ascii?Q?To7QZLBBXNFmSG3jhn97ey29IEun9GEXEVtX2+p3GnEWGCDLkSiS8+rDZiqW?=
 =?us-ascii?Q?z87bAgW1GwBZT643C6ERCzo/mhJxVSGyXDH0FGCEtY/BuN/7wSf864Dq0Btr?=
 =?us-ascii?Q?MANPKbfuG+aSGyArHWdr7s5arx1/7BpH3jQOKwakNk062mNhtDD7qZMGDXw5?=
 =?us-ascii?Q?/ZagU8msZhRYXbxqUFlqyhdGH19jvujuxgL+vM7TiArjIfsSSauapDE26eqH?=
 =?us-ascii?Q?L2btFUbjOXHnNWAjE69g1CjEEK/dO7sTPt3gZKP+obpM4om/FDFCcv0UASsm?=
 =?us-ascii?Q?P6rvMWNlfbyi81XVdcPtUfd9s1QmpUiNtHDjs+LlnNzc1JClKB35thq0UeFE?=
 =?us-ascii?Q?8o5+NM9C/5/4Nc6hYZ9sUy6IuT20JDj7bG/3BXtivQuzHIXphjHeaI2Fwf4p?=
 =?us-ascii?Q?ntFX7LhdmjjJKUJaajOWVb4ZZXKuV/DYi+BvVJVLB3K+sMVbXmKBl7l/Ls0Z?=
 =?us-ascii?Q?8kMd6+nlALc/Xi/XiHwRwH0gBSecA0HQMYY5aPQWGeS2JgqtGa7rUQD5BisY?=
 =?us-ascii?Q?Y6i6UldIbmESbnfQ353RkNfwYxflGIcoMsrZsYYAq3TCgfsRZo2dXJyn0xch?=
 =?us-ascii?Q?54TVyIx8nxFmQlKDy/Pe5CNOHzMcwDmvuis/CsDK+opIkRSiCPJymhvqpuSC?=
 =?us-ascii?Q?8acJLNLJ1IYqW8AIUv/501nveoIJu+T/oNeUl6sLJ3+J9nwPSFJ7h2p0tNh5?=
 =?us-ascii?Q?aawuABJ28uAeg8mw2GwNFPAajRCkxMhOiVNAaxPwj2QVzfHoa7AuqleOiV0A?=
 =?us-ascii?Q?JoK4UnfSPy36l2AjITlB+3w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VW6R4HA6DfpX8QfYOqmEagFokcmwuhgQ0Ux6KjSxVzQG0273H0tP5dW2JB4a?=
 =?us-ascii?Q?07VOap+SmfhxloBDRfswvkYhPqMtOrRv31AeYtpKYQidCkcnzZ46E15CTnKH?=
 =?us-ascii?Q?aSEXFAO+KqBcJDAd6zMRrS+QBgbfRSr8QrdRCPiW7UpDaD/mLNQb82v7oFB3?=
 =?us-ascii?Q?NRXLsliCAypk7kko0wBEzGe9S6nU5jRapAy42zo749nvS5aj0OdLyytq/KK5?=
 =?us-ascii?Q?GipgvTsVt4VysUPZlAmuiFU5xuKi4trU/987QlQSfV3ql/aFkuC1fWjtzbNZ?=
 =?us-ascii?Q?jCaHGWctKQaUwOoKTHLhidDtlD4nHlxT5J86uXw1tx5240bSV5sfUDaoiXHW?=
 =?us-ascii?Q?ECgBWvsF+4rLU3Qx8K7E+RaoZCFFHk49I9jThV0xIyFxrV7JCbZvJXQHiq4o?=
 =?us-ascii?Q?9fj8qji3V1vEtvkY09eTG/VDaiGsaWPUk0t+snsb1iclzrOGgVdwosZX9sOA?=
 =?us-ascii?Q?sTCfeghx3AeytdSYjSVLy/suGlq+/pwDFSIbScvPjBaKUb+dM1G6Qowlg/ao?=
 =?us-ascii?Q?EL3Q6Ni7BcULsE0Wy7U/NWb5et8XVnDDKYIatusd/SyabpWNbEZ5lk9rlEAk?=
 =?us-ascii?Q?duuBa1qbuG5jPnFapwhCFKTy/MMVhLRTkrStYFQz9Zns1sBDcuupO2ntDZMf?=
 =?us-ascii?Q?9PjlEASvaMVWKI36bgtJ/OET9uzEfkwBIxFmEv18bqkI4zAUc9hCO8xcRR00?=
 =?us-ascii?Q?BVZm1M/nqQp6VW36iYC9+fNsRQ+mAHNdLc2UvjMo6iXut0CSuGwzH+C+E8qn?=
 =?us-ascii?Q?3rAaqyUNue8XQlRx47jIpUbsCrBqECCqxvr+LKa2beLaqg6VuEkLrRHYy4JJ?=
 =?us-ascii?Q?QmgaavTTRvsTPNt2hYfMT+lERsGZd2aD8s9L8p6srjbPgwDe0nR1fhLw+FY2?=
 =?us-ascii?Q?NZbJE6uCpj2SZ4rlqMYjJR0DVWyEmN18QUiMgUdvJvR7hU/hjOmAvkQXkhyw?=
 =?us-ascii?Q?TSkMfZO9eH3YBxchfUPJcs1RVNHsu3NRZLDDcnejbVfE5N4nHqiOJBEZW3HX?=
 =?us-ascii?Q?lTdB+c3905nMs372awnKY2e6XkawlfVfDA+hVnl792zFz6X09tTluQ5rPU6W?=
 =?us-ascii?Q?jYf0fjwogFL0IaTZCJ9i8RNFeo48YvyfAdCA+8jV+lMSchaQdwRRAPzqkFVC?=
 =?us-ascii?Q?6wBfVx13giJPiBM623a9dCzV2hTgT0qBhddsjxO9j8bcuxIB5mZ0FZqtHWha?=
 =?us-ascii?Q?TKBN4WxI6S8SH4dldUNvOjVOG9rJJE239gs26RomVS8uVEHnA78ERJUGIJL5?=
 =?us-ascii?Q?AWkbEOH/hFdfZo5ilJs4a1s8Vs29vr4dqTDdjnCibPUDB41TlNqE8pJ8doVq?=
 =?us-ascii?Q?Q1q2KUam6ji5exWG2Nqi5GsAYV3a4nOQd0aKTTsQd7XdgmEYQRAivXcoMBN9?=
 =?us-ascii?Q?5+adr5NOMclSvCVy844yZoJ3258DekGTS2+fCvwmS5v56wEFpkYA5/8ZeJK0?=
 =?us-ascii?Q?73Io06umXff8/e3nY/9lMB7w/WTbF9KOJtxCA1mReUBRb6G/hKFFJrfNKgN2?=
 =?us-ascii?Q?F7RK3CWALQox2RXZEv754L64tpbwB8HBn0hd/sn5jt7uMKd3sZ+9MSEHohpQ?=
 =?us-ascii?Q?mAsSEmny2FctUAkI5QlwBxRBTMr+zXJSxSSpoSkKs9wKA4qw1xzGEGNa87Cf?=
 =?us-ascii?Q?ZWNMifx9NRZOXJ4dqcB+Gnc0LcxeP5B7NH5x16bFiQd7BD/OYSUB9F9ttbxp?=
 =?us-ascii?Q?q6eV7k/gVGg4wGbmfzccV+pazhPWy/uE4xliaDF8ebBOU//oFxcoW1TOPRwv?=
 =?us-ascii?Q?dMQ0m1plaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea95c66-082a-4235-bf9f-08de57fe85d2
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:33:01.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lY0qWy6RpgHwUmTkKryMUvcHutLVzUKY29ZJWtPm15/xOof2tq8dolleySJL2mxZscekbI94a0Uk3ErI+lGlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797

For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
M.2 PCM pins level shifter connected between soc sai1 interface and M.2
PCM pins so that HFP feature can be supported.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8dd5340e8141..acb160d3186c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -356,6 +356,12 @@ pcal6524: gpio@22 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..11e08673083b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -349,6 +349,12 @@ mic-can-sel-hog {
 			gpios = <17 GPIO_ACTIVE_HIGH>;
 			output-low;
 		};
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
-- 
2.37.1

