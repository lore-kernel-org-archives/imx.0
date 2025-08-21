Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981230BF76
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755774529; cv=fail; b=IC3zDzYuXi1bt8NqeJxv28wz58PxG2150Os+SQemVgI2mNrP1dtZvcVRHESXGXrlAYoo9QmIWDG7D0tAnj5bjbkOfGI3LPW46aPaq0Mx1UhU5YmZMSkUQhsxc7VBECZmxntniBj8P0qmyyzrebNfJKsDIyFJX/udrL3pHAVITkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755774529; c=relaxed/simple;
	bh=EhXXbCDSMbYhVZUMHYbTf+9DO6l1Umy9pIsakH/Nut8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=A3INlrzl6ArBwNaGcBuvIb3idCgrBreIErMOghR3w1ORrSpnizkGFtc1Qs2OUBrcXYjln3iT8el2GE+yoD66sqPX4Y2slOG9mbj2iGYYuaOZWIOQYPfKfWVhheQve8IUNsCeXNZi4wRSU0JOwB6Se9uS2vmdnlPgXUnm77MgXkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WsOpmPr6; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WsOpmPr6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5a9hNO8E5/M3eTEE7N4ijyRNUnHyk/bEJS0RRqbp1MBC0djmYuM+E80pKtwxe+tpviDPWxbY6gOlT+kO/4hZlOzuaOKT1RoBH6UYcPL/S+PZf1qgFgDNd39hDp4Lk/bw9WqwYdfhLJHYLAIzY1OZsRNTwBd4mGiA0iB5vRQLO7yJtRYDzkRITJXauymYJFZ/d9yDyBPIdQ1YxTksdBHq3RqLrrKcDObrkeKq3EAn3OpLNlp2nQCdL/Sn5nqmqMR0V98Pwh/yd11BXUgDiEG4unIQ1wbYeHYzztRyIeIrRjgJfTFFtOrrQeqyauB7GFN6JEiMQrW2W6LdNOdpkg+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMitHveeKHYCMatoWaQE65AIAsP83X+o09/dFX2v3p0=;
 b=QkLNkdBYIXYNw3gQCPy9PmDadG275OziJKd8Ho0PxC1yKnTBtvefDiL14u39aIdU5gM1+u0+7DpmYeZwuBR5lIFn2alaLFiDkqQ731T9hNGlxf3chfDryZ5Sz/p3w/X81UIh3lwzkJJi3DUy9EWiUrNnVNMBNkhsuAhhZAWAkqMp/5btpEMpRY7U7Yw45zXYojn9GGI7WVYVbKtyf8ACcbItcpfJaZgY5FJ+6cvdZiLZq2Cr1gTJoAbVNWv4HVdSEti+6cZwfbsf5ftXQuyjz/jSakBbiWIyg5j6WhkqPjoc/iQ4mN2C7xbsyRPq8zYNhlT3VZaMHiSZ6s3Dqxu5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMitHveeKHYCMatoWaQE65AIAsP83X+o09/dFX2v3p0=;
 b=WsOpmPr65xKQI3rqJB0QuPfnsStC0TDKyX0pQ7BijmQsuN3h4jXSpzIioJZLCx20AQM0bMEPvRECr0owxvSX5ReWvXWB+m5WAWJ8RV2ueTOQyyVCQEESTWM+X4nWtHgyQqjiAGcHCBP+iZwi1hxKREqtkbtbgOiacHh5dNLtZxClR/h9A4h0SvrOeM7+3W+uziO020Kj6728y7h27uNnCY3w/TMbkq476SXkPKMk/d35SSmgziabWye9S7OhOyAlrd+ziFSaHhjL+qYspH4piF3YOU+1j8LzLvPpTp+EhteBjHcjXq4TkSzpsjb37Kt9NGRIcLBh8TFd9LBWofOEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7766.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 11:08:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 11:08:44 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx95: add fsl,phy-tx-vref-tune-percent tuning properties for USB3 PHY
Date: Thu, 21 Aug 2025 19:08:28 +0800
Message-Id: <20250821110828.20980-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0178da-1f0b-4d75-e00e-08dde0a317bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BX1S5jKFtrycvnvJ/xcKneTKPB0/OQeYOAmG+g+RvJguYJrqQvOVdm467FZ4?=
 =?us-ascii?Q?l3NWVMGOpKKBr+yshInhIM1IMLwq17uFNOx4AxlDg6pCGdNjX0xLNrw+pdSH?=
 =?us-ascii?Q?d5d/Jnp8Vh6/UqKvvrPLst0MTfd5KSWKtfSZMabSgI7Tsw2X/22Aatg2tQaz?=
 =?us-ascii?Q?7cH9oZgS3nk8bksJSzin6b4pnBeAF5yj+SAqZIBqqBw/JLxZjkgW346MVWKL?=
 =?us-ascii?Q?rTRkcKoXCR2cQnkiPF6UlmdDwPhbfv3zUD98iuA13r89QAxNm5fojI1Ja8iL?=
 =?us-ascii?Q?3tvJtlY7+vsjD7+hESVeHSIz/ZVIkKaAJ6DoEhgjqBQPCNP46qff2n4oURtQ?=
 =?us-ascii?Q?EyilgZZdffxvU6cUCUUN3LZScS54j67dMr2EHjBHQDmEl2dZJQjViv3/s00T?=
 =?us-ascii?Q?yNtMOhJdtwvtEDWDVyG6VTd5563NbU7xkAUt78mTWcCYxDx80A61SL5OXkaR?=
 =?us-ascii?Q?2i9nOps5Au4cFa/Jhyl2mjF6wOMCDLBshj8pAJJR7c2LZ7FSYAWpoO2tcUEv?=
 =?us-ascii?Q?whPPvh7HstWUW+QVoxcM3D93TKQZwLh6hcIIE2HeOOvzYlHnNPrktmjWpo1p?=
 =?us-ascii?Q?YyyEqhf+jCYR9w0lcjR017sXzuQbulPtys1XoaLxF0XIRx5mETv/BP+ji6hA?=
 =?us-ascii?Q?4foNOHuAhM1fT2rclwFM8Bs+0eiHT/mynZbEvQSTYtu/iYf4jn77eoeVNhIB?=
 =?us-ascii?Q?B41+fVUMuG7NN7h5CckqLm4IrfdsHSBMrPqKhsJcK4gCjsTXgvdz0/Uk53z6?=
 =?us-ascii?Q?9EupRXseB60GC//E4PvDh+sHnvhkc/KrkKKk6t7ClEMtnWLTNYJ0Oiyf0sOe?=
 =?us-ascii?Q?7tP9AGz7SkJ+UEZTn7Uig229iCDFTdBIom2eBqsMDfhZtmQXiQUUU25eKaU/?=
 =?us-ascii?Q?3ZqwzI7/K8kdKs/8d8OL3seAdGEwaAt660jFypcbmWjgXr3jPXYN+6vOU/j7?=
 =?us-ascii?Q?Ips4/IBhsQnW0pn/Z4d0+P499POB4X57B96Yy7oUExeREwsftRUBKXWLV8xV?=
 =?us-ascii?Q?qIV26xrerjCQc1reIC0uklDOTPFa8tYqLkRvXRAk47+wSHojABdqOn08gpDJ?=
 =?us-ascii?Q?FtYbQEaXnflmREG+yPOicyZTeYO2x/z555VLBTfunZl171CLWPI3v9D6Z+Em?=
 =?us-ascii?Q?vHPSfhogNDUlcd+St2p55TT+5rjbMhiGCUXbZBi3fAZQQHb8eNO3HUsDtIa4?=
 =?us-ascii?Q?wfbrKaM3VZ6KRRWb97wtMU+1rkf5uOpKl4iFbgLskX/FBt3a6im7NBLgw/ni?=
 =?us-ascii?Q?Fm/Nqru4pnGcnc1E3a9fxQKT5FC+H8oeSs4ftnHcsJd+PDyQSy6UrfKF7G51?=
 =?us-ascii?Q?D1eIu8Eca76IRnPvYGAitlIuYlbqw7Qp4CRQYjsEy6iUUG6YGcbFsFTQ14Dj?=
 =?us-ascii?Q?fVKU8KILfZZNb4hp0q4JlD3SM3WMYcd2WC/In5GQ+OiO0/eLKqNqYcqCJ/84?=
 =?us-ascii?Q?R6T2yA8hKTwx8KxVyWjF0u2+Z5lNRewu4GdeHPm89Aa07y2xjK1OFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebSNe63XD6FGDFljbFv0JhuChIwubyDDitBH70vUgDyrOgZEL4TtbdI5cra1?=
 =?us-ascii?Q?XvSHB04MSwVz27UN64m/r0YqA0q03u031oVlAoZdaWNr9sYI1/S5y1ApX+4f?=
 =?us-ascii?Q?CQC1ZKAE/rpRwVMApi+HXGFwcTi+TRpzgOfABH8GwN5xjYhcPWZC6yQubBv8?=
 =?us-ascii?Q?K7AZ/jxzEtDvPnZLqQc++mUNOz4lAVEFDQ7tghx5erWG3Qn9N7lMrNrNPgub?=
 =?us-ascii?Q?OECNIfHf+SHW2oPtf1BbJc+6JulJx2/8iJMjfteEHJhidl2mjj+sSlXQqsaK?=
 =?us-ascii?Q?hUwLY/RkaOROiqGX23tHP7+BCE0/uDhyLf0PvI8wdrREaIKZegh4ScXOMo1L?=
 =?us-ascii?Q?icjdIRD6E6qiDDus/Uw+rc9SMFHK8trEV54UWgucKvsi7Tne8R57CS4Nw4Qr?=
 =?us-ascii?Q?SNe3+XWyoMPMOVXQ9HVktXAlwW9n3aEmzDAy9212N2jNomKHbtyDcsOdPFvr?=
 =?us-ascii?Q?9ees3JBqqB4rH6igwT5EFRXKKCpee3gQ8VsfbGskTUrAqCo0BYYEYNy970Lv?=
 =?us-ascii?Q?AhK0Q0RlYD55P9U5qyURVzBOF6lgf6oGNLl6nSR4hCbg0MgeIO8439Zk4DxV?=
 =?us-ascii?Q?JewyZd7soXTngdKjkN4IbJ7JCnekM/GARzCFYeigd9cJLJ4LXJLx51d8YF8j?=
 =?us-ascii?Q?oKPxvQTnm2BXiOWNseW7hWqM+eEypj0NJFKzSxyQqaI8+qols/6UtQ1ZCprQ?=
 =?us-ascii?Q?SQwSm2G1aggZNJbrVjRv7GY40RCBb+7enySCJ49Ro01uehQQJGpPMROR9Foi?=
 =?us-ascii?Q?xQmwhpuV/KdmyJWznHB7d5z6X2GV7oUlVVV4NABzXX6qcQVMBpChIOXZpzyF?=
 =?us-ascii?Q?ByAgvSwRh5cHjoF4+wG40iQbMsIP1bvyytsehy8Coh93y5XA1PSZiugawav3?=
 =?us-ascii?Q?RjFNDFfId14cYJSQM8G/DgSy1ABwK/OIsFGKOO0PMW3r/IgYEvE40+LTdNOO?=
 =?us-ascii?Q?+rGffStnW0sP7pS5ooIvd+eN0OpPivUamarXn72ZkjbUEGDmajxvY//0aYGo?=
 =?us-ascii?Q?DxhmqRUrU6HJxdv4tKwPBEuLbipTC9lkokvXwizvNl6n3+V2ybv8W8l0UAgu?=
 =?us-ascii?Q?s+SlQUism+7BP7Ab8Fl/27Driy6VBPxmDWLzWpnhMuPi1Q0gKGDwsF278tv8?=
 =?us-ascii?Q?y0xwqGdqG6v9L9cliw+cQ6vwFKAxBH/K5VrcgJroE/chgqjPm62/GRNC9/k6?=
 =?us-ascii?Q?F0+5JxWI+ELyq5kXhjbSKxm/l109M2b9vs1BD4REI4BDKt+feXA3XQTj385Y?=
 =?us-ascii?Q?0kK96TIoqNAp/n07KZI98JjAHPmJHEzOfa6n0s6EIYC7bhJUc8yym5RlODrA?=
 =?us-ascii?Q?HgW/k9jI+QBKwGBHSj9sQ1e+yZlY10iQSxkNgQcLReBg9Oo6mD6wrCqbpezl?=
 =?us-ascii?Q?HRhVn3Nhql1GzLa9V+wvGxxbBmC4nPgxRD+TCxQqkM3M6ify9zab6QT35OVg?=
 =?us-ascii?Q?VAfa3KgjFPKD3kbFYVWU7Ziz+5GrQuCaF+V0qBiwNfuQTQzgSrVZIjwh6+E0?=
 =?us-ascii?Q?8eo1vBY85m68bV+X0nvCnY4jhgG+G6933GOIvPn2pNcuWgngU7oKFaft1G+J?=
 =?us-ascii?Q?phXOYwlS+o2EB+eJ5tCvY3tL7qfUA7sjSyoK09T5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0178da-1f0b-4d75-e00e-08dde0a317bf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 11:08:44.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6Su72hm3enSK4qj5XospneB/gxupnU0HwDf+y0bj4WPaHqJBAo8MkuvVkKA7cgo2G3lvfW2eBc9he6gfVT7YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7766

Add it to improve USB signal quality.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 46f6e0fbf2b0..f0aff01cefbf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1082,6 +1082,7 @@ &usb3_phy {
 	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
 	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2f949a0d48d2..064bc508eb1b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -622,6 +622,7 @@ &usb3_phy {
 	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
 	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
 	orientation-switch;
 	status = "okay";
 
-- 
2.34.1

