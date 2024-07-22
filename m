Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8BDDA8
	for <imx@lists.linux.dev>; Mon, 22 Jul 2024 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721616938; cv=fail; b=Vk9/jblChZru4Rw2P61BQGkznqSSn3DN0TVehLcmmMG0Xn3+4xZi5xKpyGBYhflU+wSmBOKquSsKHTcE05NVh4KA4Ex2Zbg/IpqEckkMIQuEKKFqhChDGPFU9kRi7SP3+6Ac7hiM2qDgQVph2UeOnRDODvG5PsovK09gBE1UH50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721616938; c=relaxed/simple;
	bh=X4odbP/UU2iWKe08GWczZJUypLpsBagVMHGLLMD0K4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sVf9imAJnVp1IBdh12mGktOaTywIKcy2kgvaYmctfcGC3iGJSBPhOIXb3mQe40PS/GINXjNJI1+DXHJUdIrlxHXb2L9rnHg4xF9OqZy1wdFkOt5KS/cr30W2IuLifF7bYyk2S4Ba4nPu2l2VVkkY+LUxSBdj0WlpdS1WVTe1Mzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=UlXR5Sh/; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UlXR5Sh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMtjmgbdE3Kw9s7JOZpNTOyXkKPRcEnrq+xyrhBLjKH9nYaNinja7TXegR14mM91rqjy2aol7VQwgNP44tpCrfGkiSJ07YiqUeeTtAMf5AAilLhyVzwceJZjnOKJZ1SzU1rWDx2j+McTX8b5HW2MoHpO0jXqKIiW2+XQ9PDsGZ+5F0b+qdgwMiv1fmbF7ra2X4TggKDqKv2vPUfbzQoQR0oaSUZzcFBLTqPvMrrmlkUChCgBQHIp172aWom3JpNVAHdjg1ZIcfmuSioFjhm470PYmLmUHVFCA35kXT3yPWAvBl1opcb2woMDgATxNM/kmurLSyDJqq35rHHADHJhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQHtH+PA4IINqJethbniaty4MWI3DRsfDIzp9botHyg=;
 b=LgMJMCmGfpbRN+RFt0ixUk/w7gJF8lznq0cUDWL60LH2G5B+iKg0/gO/R9zHjq6gsSJP/bxUhO0x2ev5QuulB9FUywhAjO1HTeUEVYpUtHLoBVDaSdkgOmTPMb4bFkuhaRYVvbcjJG2bs+P/XgJz4PpKjh8Tj4mgxNzmg1zKPL5j/T5JweobQghCjCWtVa6NvlxKL9G0WcocalmXktb27tofg8rkUn3Q2cJ9gZM7BUaHp0OZrpQNiyCnO2r0DLn06FKrGoKt9MbII6Yk97dVq66oHV0RHyJIYaDFJt37Vq5KVQqy1BAwl5Nybjywdb2HAgN8Bee3GJjZ18sgT4bTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQHtH+PA4IINqJethbniaty4MWI3DRsfDIzp9botHyg=;
 b=UlXR5Sh/QEgfAcVoGfdjIDfMNtu+EZ8m8llIS//ZXZQewdVfW/oYC7BIe4pDFvi/ezj7QOXb/Edguz4EZo6JoqYK+XZ4VUaCsxQcqdLz2zp4vmYC2tRFuF6+YstP7KIf34DmtCe8OrARQT65Ol/OxeUBu77Qsnnh/66anQpKu+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 02:55:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 02:55:34 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dmitry.baryshkov@linaro.org
Subject: [PATCH 2/2] ARM: dts: imx53-qsb-hdmi: Merge display0 node
Date: Mon, 22 Jul 2024 11:04:13 +0800
Message-Id: <20240722030413.3456203-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240722030413.3456203-1-victor.liu@nxp.com>
References: <20240722030413.3456203-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c07eba-b8b8-496d-9afc-08dca9f9c168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?35/Hwfc/FQWhQxNeGI9SnoKRL0+4vV0qa/1R4X6m2RC69QDfVy3nldFTYa2A?=
 =?us-ascii?Q?axKoFYeFxINpsMG0oMGTv/H0/xKTmtsWWjn0mKYYNWNlPBwDB7IR1xHNy1A6?=
 =?us-ascii?Q?9bmCL3RWwK73aQzLvGRaMeds98MxUsx5IrAExYAEJxIbfcVr2/QiNaHOZGhM?=
 =?us-ascii?Q?HuK78ESO8btKPV0CmpTmBQhoeO7Qfdso5lxdo0YHEsEr+Nm6sT8qs2rxVFTF?=
 =?us-ascii?Q?oyaVqGfuXvazWalVY/0C9aTIZVxz0VTn6vsoSQSqzK4V9K1pT1qhSbmzWRtl?=
 =?us-ascii?Q?ThoBPg+/Q38dxI4LBpmXsjc6Kh5AVxSeTWo5oNFlSknvnM/Ox258IVHb7tRB?=
 =?us-ascii?Q?i0duVgP+4Ux56z4y0ge36/iDOM4OpWmSf6eytqEgpQm4JkDjC01SHn58x2CU?=
 =?us-ascii?Q?nd11luulnmvLCjwtyC082ZE3RjzJsaApa/mpINSA/2CyUy83dn+E1bi6L2y1?=
 =?us-ascii?Q?oLBZGeCKaLKYxXT7zNCzdrH7OkLG5KxF6ifcC5fJodMTGHbS9Y1K5fFCJZrY?=
 =?us-ascii?Q?IgLR4uZ8nyRaEuQ2x7k3ZIfviRhCpRyyLSfBBesW7qzx85OzVvXuM5BQuvOP?=
 =?us-ascii?Q?WrWHBmCkjvnMuBTHC1KvC662Jl2gS7wud10EVTGidSYw8DROdFYl6xuGb9D6?=
 =?us-ascii?Q?hxxPUB9bX6BVEdmNsNsraMlcjT1LkBBhyyP2C43KY0CapHC5ULiuc8mzcgwQ?=
 =?us-ascii?Q?fBrhPSfQajteZowPNfwo+xH3s3o1J3TcCCfGAoGvoOA/joMfyIm3VoPvkV5E?=
 =?us-ascii?Q?Dg7YJ0fhGACq+ha+H3HR4fHxLXLUKfEyZi/D6e+NbjqNSUnXVPuLcVLrB2lL?=
 =?us-ascii?Q?NYaOV6PqYIwCs54yLdsXII7M7QMvgb7wit0UmKkJu6G+HbGPPT+B1koaB1nL?=
 =?us-ascii?Q?OiaAbPw7COcrubRiNKANZDID2vZvHx0m3MLSpIX9jh16rJxd9xBRifmpi6gm?=
 =?us-ascii?Q?AI9QnxhLptUDMBXLl1nDHNlGXv3HYnXEUZfJEDwRvoKvaCzhdF7HJwPUPsEP?=
 =?us-ascii?Q?MnMNulKtAw1IcrPNWz6ihy3Fgaei44K0ccr9jLBNGDP6rBCSXzAjiwAjnUbW?=
 =?us-ascii?Q?WEYHsaim3kP+zdXCGLlaVnGVINy4n5lW+qr39PrKaWCm02twkIvMqZqHHv5q?=
 =?us-ascii?Q?TxD7yHurJDB1jt44B0d806mWFtMOQC1vVzMO5n7x2zGxvrDEX+ZMfXg7Gimt?=
 =?us-ascii?Q?FC148XWQMBSYsdKpCJbdB5FysE1vDo8nBcvvZ5cGQxW/mdULpYDzLcRpcsRt?=
 =?us-ascii?Q?ssCPKm+i1MChZHACPyStsrriZLTbUfbHbyvcpnQVfqY5gv+5Kn8Osv6NyzdN?=
 =?us-ascii?Q?Y1KuYtoX95o4OlCHMTklJRzbGQHvZ0Y5o4U6AAPeQrpLqFZRlhzhB/SWfBfp?=
 =?us-ascii?Q?TZASqYGrdweF0J9tUjky1oSPXJdJMru+ST7Z0AduV+J6WPJHzQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EiHu/DCsrt9xH8Ii9nuFkiwmernwTatk4EjBAJQW9scmIVvD0PNOrW9ayKdH?=
 =?us-ascii?Q?QVfLSchGmI8Ia2DL/ZrkBWsInuXFxDDZSEkTlHfzTAjeoLkRSqQ4N1tXETM8?=
 =?us-ascii?Q?2jm8X4fpe6hnriIfTpPgoxeZTDSVJgaLOq1vcD+/fvQIg+0CBMypT7el9A+a?=
 =?us-ascii?Q?J9SKS1uHNw5tmBYraALbaOOYWukr9zL5yeRqL0RTOeuR6VPbJfUlW6vxoLSl?=
 =?us-ascii?Q?kVwV756h+sTdZZIAXbFSGKQmBJPnM771jLQ+pjIvQwiev8bXp3ZUpv9qYmTL?=
 =?us-ascii?Q?XauFTXlRUGB+6QnwHGMA8eMAnB95SqNTztMDY5+v7T92BK3By7gk1SOsmZr7?=
 =?us-ascii?Q?3FMSaZMbPpSnLcbIbfbAPvZIRUIJN5iixfeLjOpsbz0G9d6U2ba584Kjb+Q1?=
 =?us-ascii?Q?gtXHXADMc7MquGOeUhJr87luTOdiSsvapnR6ENhZj12u0l0dwLmOCmVN/uks?=
 =?us-ascii?Q?ffCybm0hI3iRXzU9WqxagRkNQ1ZCmobSL4oD9rCjp/HscW0OmOSOPBBNrgt/?=
 =?us-ascii?Q?OqqpBDc2WS0vYVSFVs2iJWP+sW7YibDERpgoWTXbYfSal/HTKweYddzjppQB?=
 =?us-ascii?Q?yls4RZ7V8/BnNEYMbeYHFTmlDrsuEcoPcXuEVlJJQ0zhdLxk2lBsz/1WlStg?=
 =?us-ascii?Q?dQFbpPiDGYBz55KWEFwB1Gd1JqJsH5+OgDDzPBMSFJFh8uJcYSODfukkLB4Z?=
 =?us-ascii?Q?v2i/hM0g1HHGiVPQtXZsUqud7hxjVPNbXXbJLZuIWicDXWkv404scAtENWIY?=
 =?us-ascii?Q?hVs45RXkoLr7ZQ0+j4MLqlE+irGnYg+P3IG9eAs1KrqHrGaegAH00WH1ja2g?=
 =?us-ascii?Q?RN9uFWMBzN0zzR2yw8GkKbQfYTurcUuh8fgDxqvbc/Ws8MwOPSfeBy9wV001?=
 =?us-ascii?Q?qPRU2nJhB0kjMZfj/qzh3O8v4ZKIH33hu9QbAbjPMxt+S/sc5zq88HcLYeF+?=
 =?us-ascii?Q?THFOkaaviGNmtyjqOoLS5C6epLKkb6EpCzkN067VQYgHG1NWLWCuBrFq+lzl?=
 =?us-ascii?Q?PdqNWdMH1ADYNqprZfidFpcFwkhneOMYYpECDowJEqiC+5iOmbVfR5/gLqaU?=
 =?us-ascii?Q?XvaLOWfmGqK4LcLyNwEpkeD6+XYAI1+bwguRVtoW3VL7xLhck7F1h06DBftZ?=
 =?us-ascii?Q?Rq/qZLNFHJLgkaUAXDlwyaq1AX3lGCLSLsCkeyRT/2yXPU1D5bMu52jFulhk?=
 =?us-ascii?Q?pjZ5ugdDxLfzpjRxRbTN+D251wWBQq4hc0RP8vImXNcEKAOOuAOrKz//2EcO?=
 =?us-ascii?Q?m6snM3Txn6cL8/Q8yHnUmlAJho6jbBRWHdsW/IdCtcVksMCDbhJ6xRaNzz35?=
 =?us-ascii?Q?rACI/wOUKVG/BntxNqV9yAY8Zgz0p3YdzrmgwyxZCv8UMcRJzoLrQSRQhhiS?=
 =?us-ascii?Q?7fAV9sbEzOmYUCXRaO7Rvwkw3JTeRGox5VSuAQHdqkkQqj4F132ijcMzz1gJ?=
 =?us-ascii?Q?nrE+DYAf0TUyMTZBL4yD4nYqpGstunKAS+XeBQlqQ1dYaUkILoW0+FxtGeM9?=
 =?us-ascii?Q?Sa1797VMUitCVE9APn7PItFchTsdFpD+HIq/B0rdI99SxByBaxuRQbdiS1Wo?=
 =?us-ascii?Q?1WVFLMHQsDjkWKJmQhgdh+fX0saupor2Dy0E+usg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c07eba-b8b8-496d-9afc-08dca9f9c168
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 02:55:33.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJYiwBYGjhisl0+POugDJOInAZGpTNzDiQ5rXytnmDLg7ySW1v/DsiAhQzP1d6uySep9ZFit3JWwZ58PIRvbQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290

It's not necessary to split display0 node.  Merge it to save two lines.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
index dbd9065b8bb4..2527bfe13145 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
@@ -34,9 +34,7 @@ reg_1p2v: regulator-1p2v {
 
 &display0 {
 	status = "okay";
-};
 
-&display0 {
 	port@1 {
 		display0_out: endpoint {
 			remote-endpoint = <&sii9022_in>;
-- 
2.34.1

