Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165278;
	b=5nneggqnqu7oYsurpmYlx1ylAifI0xYUpDWYcqa7DkF8WzpifmUcSQYjqhGZDR1uqLNh
	 bXCEf26G03ldc05WGgCqwl3qOKuBULDzkDVozjR1XFg0Ibdd6fcw+pU/xNFhJQgTqxfPf
	 tSTk6h3ygtiM4ZNUnJpLHArw8O/RLUqjfR6SJBoSJxSemfclVBASYwWzkZLk0mF7ddjEh
	 XdSNIa5ndAoxSP9H6hxD5dWhkAJ5BVy9Uk/ujVXl9QV6/CgYyCFT49XxLtDOD6btnvxLz
	 1WUdsmvELLxynayi7MtyUIb3uyq3nDVymIPQY21dH7M62S5+l5gDfJO5DZK9xYSYhYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165278;
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
	bh=cmYzu7z7ZtQswqZ3IM9vldj6oyPV2MjvN6wbY4O4ctU=;
	b=LBpklwPjmoYYNKG7atwf0r4NyZWKirx1i3fg8776w/XplXH2pEqHZGI6TzUqv8FJ/6IZ
	 wQwTlQH+UUgXZns5YVCn2xuOLWDE5/Gp2MOL48CJ6Hwy4qLKCS4cn+mx+jkVh/ghmpEz5
	 tCEPd4SctIJeWa7PeYbXzQL496sbh/83yGMgiNJO3LRc/jDRKQCqDLqeVc0OzE4XNOKtN
	 sob4ynfAv9KF404fEQVZJaMFsG1lMwRofr/sg6XPTKfacnBgQul9qFq2Rab0FNOezIldO
	 +RhujfD27VKxFwgpkUj3+Rk8Katxu141s8uqJaKctvqiVCFnz6IhETjy53Ns+qlc3Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KjJfteBk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EB606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728EB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KjJfteBk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmMdaal7O7WHsJ/drjX1AuUBagRqIgtqoHwcpzrQGxJ8gVhB3LoShOGO/z/6wK2iks+eI257Qr+dOKD+pa3lyArU9PP/mkrptUepQhbZsKXsCuogXj72yfnAErVei5KffOIRlHqbRwqQyVmnPDBcu7DvxgWGiCVqmR+L/4dRAqBmi3g1GA851YcpIzEg3WpylxUspmIAH3oVnJNyIZslCFuNamh7bzHLBBM6duBVO9yzHu5qhKSrl+0AOjFLbvYzKAIpRt0kqy1JqPkLopgm5AT6qlR9oFFbrmKrKkse6XxANHz/LSFzvYeMg275xdgFIzlKTWMvUf1SXOl3nshL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmYzu7z7ZtQswqZ3IM9vldj6oyPV2MjvN6wbY4O4ctU=;
 b=izy1NKlMaoKltGvMMRdX8MwOjFJsrDI9/DHzu89vaoMdJZlQGMh23QRaEiov6nSvtksqZu+cAKs/pFSGJ8kNWhizIUQD8FghDg3vRe+tGqIxQidG/NqtaBf8Pw8T5DedMBbGRF7z1UIO0x35SeDB10urFBEJsByzV2ZeBr9NIHNk+4FAQnFjElw8z4a0/fTGUD5UoqN0cKd++j+HQTDmT11ii6uXrNDFJApAyM7uOg5NTNKMKCfBui+UFdt6PayugFs63D53cF2D+t4CiAB4zjKtxwQthRtWTOdZwGGpg0Mi3JcOwHdmJBHn/Qg1I3K1DNnv7BH/F6CJKBE8/GYDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmYzu7z7ZtQswqZ3IM9vldj6oyPV2MjvN6wbY4O4ctU=;
 b=KjJfteBkDJK0aDl7BZV2p2BTsgkf+ye3oh1BPqtfOrrxz5aUNSZ+Z1QFl1Xq0dNMWo24yMOme3Pi93wLwAWt93dR5b2ds4Wvz53+EjLyPV6ZJ4ILl6LuYUy1Mxq8KFSQ1HBAI/t2GrvmQ7z2zpE7SCyrrcMSCgX1Y62kGOizepK+nAvXYehYbw6097YWXLAJDCFwu1fC60n/AMC24uomG0+q0n7nqWxGT0RqhWgsj0ZGZDjzDVro4P6htTxORNt8qFefA+4K9sJ7Hl3liIv6TMB81ryG6QrYgFt+sLErppwxLL1bVRlnzEvi7iPT3RHsBy7SyXgc5QjHwoL2fWTynA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 09:01:15 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:01:15 +0000
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
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 1/2] arm64: dts: imx8mn: Update SPDIF compatible string to fsl,imx8mm-spdif
Date: Fri, 20 Nov 2026 17:03:23 +0800
Message-Id: <20261120090324.1220501-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
References: <20261120090324.1220501-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DU0PR04MB9347.eurprd04.prod.outlook.com
 (2603:10a6:10:357::18)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM9PR04MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 9209c47b-f318-4063-c8ed-08df46e4d466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|23010399003|6133799003|22082099003|18002099003|261009223027099003|921020|261022075727099003|261021123027099003|261021121427099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JrOOROwUi+bwd7k4g5e7V39BLF449hGW/y8sJ9PioMqqbD9PNqniMDKEd0wIXf+H9KChA6SELsflNxOE3yZ+ReyWXKJWwOfpRbLNVAMbtq5Uv4r5TQxKbKtEXU+fpC4TK34eMJc3LTW2EvTR8NAKV1uGDyBkocD38Jsa1Ozd7CdIbIKT9EG3CCUT8IgaRENWR1iS/4M+WLmJVwgpQkjPs83lXMPK2HYuvSg0y3yFyi876rV2ooshdZoXNBrgf5+4IzQgKg+hRGrfe9iJZThAH77o/IKa4Wj/+CNXb/TDZ5u0PDHrbypvHNyQGbd4LnDXq15H6LWJKNNuWGVTzujSlckITpEVRjn+oLM/tEIFXj+yVNfgGhwBwpIlRQmZu0mowizkQsK+71nOYK+6VQIr4pbY3ChLbsLCJwe9Bztbum44yH3QCrPQDtufUKFTggtd7A3TZs+OsQUqKv0EMGnvOdae5h6dqUVN2oPcHwLq5otM7tl4x9TktjMnY7NlN47Ea36s/+oMxNFM0ejFZJMGygq494PQtfcFNCwsmuaxGC+YziezdCgsZQsEpElD/hKjvQBNwprCCe0sDVwucdokCUFYKKJ/03S2ghpbsjqVIO2M+enbsinA/oOz67eK4+QVzWU6yD+trHxn3tPfc3BvjKQcnTAbZ5vcBvXOzowURWOYAU/AQ1DK6Y2t5LKB/IBwQLibO3zF6iDDfZZKqg9yUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(921020)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CctxK0J4tWceCQp7rRoXlc7yB+pzEK+AxeCDyuZZBbTWaqqt1XpKp8LVfS9g?=
 =?us-ascii?Q?CQocUnU8gLzJwq5wUpqYAbOdo5/PoqkbnioVjxxuaPCZN0+/ILAnIMdSlbZ7?=
 =?us-ascii?Q?wkbWc630nHbojftFrY+cr9ZsdNyxif225OKUlX97qU/Bhiw2Bx+Nie4KmurA?=
 =?us-ascii?Q?xizJT6gkW+ucclkopHNoxzrdx+irnntVfgTCz6iAcaX+vHOnMDEggXD7qqiE?=
 =?us-ascii?Q?QH/66ZPWxkI92hF+00cz5ZNbQV4WL3DXS8PvKORDA951jZdPBSKcX47sSFxZ?=
 =?us-ascii?Q?3Kg7tmvhDsSi7Krr/Hq1jlat1CQOXnOr07tsXqDKijFOcJEjlRnkebnmFH7J?=
 =?us-ascii?Q?gDqi9EaP9nWEKd/TZhRfvK63mE9kAFYW7cmPvuVkPkrO0ukqT8d56M1E8sPD?=
 =?us-ascii?Q?uPA8uor5jiU5MzNa3CtuoI+U7ROAmXb+IH0nsRBWsbZTEqg9t+LBD10KOMFQ?=
 =?us-ascii?Q?Q0F9Evu4PCCt6QOeUxaNO7xDD7PvPCsy3juGUkpEJARaYxEupgkAsH0k7bzC?=
 =?us-ascii?Q?bOZ6n7zbvfkLRp9/0F0EFD45DP4hwse/NREAiJO2cFz8uIxrV94s0XjQ0NDW?=
 =?us-ascii?Q?pRlRBX6NZDM6tFhQ9qigqq5uGOFumTgCSl8N5zpvivWVVMKNsiQxMMONXKrw?=
 =?us-ascii?Q?YD9yLMr6q3V2faWVdxL/8ueOe9Pt4cGi4eF4rmmgy0qYZs+b0lsQrlDq346q?=
 =?us-ascii?Q?aHcKShNRF00gYt3LlT28cyI2yfzBzfmtg4z28l3qCUk1xXk1GcKfXhpqeEfz?=
 =?us-ascii?Q?nQlXQlLudSjn6kyWrW5aCVJe2tMx5zHme/gq0Evhiexjsxooaumj7Vo+Zmwc?=
 =?us-ascii?Q?k7EIVb9vHm7aQLkKsKid30Df9sH7WoXjYjkaZQCgWosvIqLX8E2E3eb3w5Lq?=
 =?us-ascii?Q?EdTRZgLEhyXRFoblul5UTvI522KpZ2g9HAUVXpC5+wBF4fczup6Bbrrq0TWR?=
 =?us-ascii?Q?JVVLYKw8RNVNdm/RefGqb3lLDHw7mRsTeax+Ug42U4kKS8W8Ey/WkdaeJTdn?=
 =?us-ascii?Q?Ej7H4BXQUv5OVwuKPQxYvjGv1dc1XXfTX67NV01JT6iehVf6388nbwbzyaiR?=
 =?us-ascii?Q?zvau7cFS8K3i7LsSguUjSxF2I6c6uiK2NrClxPOMOclLOfcwmsfzFGI6s+EE?=
 =?us-ascii?Q?heB14KI3GQFU6L6AOWzWqj8f37H58s1CNJUSEJrTaReNTCDZZ6g/AhrTpanh?=
 =?us-ascii?Q?C2x5mwkOmjBTxct059cuo0Ix9FbziwX7kSPHNp6W7yVew54Rw8YTZLcOM1RG?=
 =?us-ascii?Q?oP2XXGuxQqfF2mrxUo/GvLTLKynI5S+Hh2+Ou1F+6YQldZLknGwL4MHVyh6i?=
 =?us-ascii?Q?Cj1qFl+qPadNTSMATZJkZJAdtz4PqPJWd/OpWvgz7P4xiPSXWTmg4BE6qvzw?=
 =?us-ascii?Q?+PqPHVT6Z9tiWpKrCLA21XaAlUSC1gRQQ0cJTKjI05420xPqBAqiElhREHDN?=
 =?us-ascii?Q?Vny8vu8YpLe2iHpGmR5aD+5SZZqjYUzt1K9IEizjHH2XtUxx14LyNmUnDDEu?=
 =?us-ascii?Q?002I7skqyRX/xMLmyM4V0oT4eFvfK8Mtx3ISQE3ak2hTJT60msUsfj3cbdO7?=
 =?us-ascii?Q?aINOg5dR12e6q9ZnyFM3VDulshYUvkQsx9/Yo6yadJw70tOzuiScxJQTGAWD?=
 =?us-ascii?Q?inC1Gv7qe65cAYHtVmTLhxc80HLOUdRd4h7odn6BiaO78CUdCx793lSGUQ45?=
 =?us-ascii?Q?GjvL81dczfg2cC4voO6pv9hbadLZyVioUOvc6DGFwyECNrCZnHHy/NVUafIk?=
 =?us-ascii?Q?tVV5jHrmHlPwbVJ5CSgh97ywO2DovARNOXGMFumpGN971Yhe24sC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9209c47b-f318-4063-c8ed-08df46e4d466
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9347.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:01:15.0230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhrQDRx9OhftWLur0V/zkNiVlPSgUbZESKlCwzNCE/6Hv520RYiL/Hd48JZes7vb9/1yhlImBWUc5aUORrSWYofg28R2A7DW61/2xq6ZOEnsbqoZLjDjXMKVhQIRUkAy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8083

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX8MN SPDIF controller is compatible with the i.MX8MM SPDIF
IP block, not the older i.MX35 one. Update the compatible string
from "fsl,imx35-spdif" to "fsl,imx8mm-spdif" to better reflect
the actual hardware and ensure the correct driver configuration
data is used.

Fixes: b9cf7d3b6592 ("arm64: dts: imx8mn: Add node for SPDIF")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 79b169b07c4f..5e148516cb5c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -371,7 +371,7 @@ micfil: audio-controller@30080000 {
 				};
 
 				spdif1: spdif@30090000 {
-					compatible = "fsl,imx35-spdif";
+					compatible = "fsl,imx8mm-spdif";
 					reg = <0x30090000 0x10000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_AUDIO_AHB>, /* core */
-- 
2.34.1

