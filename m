Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DB2153C9
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563708; cv=fail; b=Wvf4S0PIaCZuanaqwcs1r0tYRjYcQmWkW/WF67CSkB2W+fNwkhdcb8NnB3Uk91TIB1DmZpHJbVbtk5fRzuj9P4ZNxUkFskukn0wAzEgET401zTtES2m+9SSn4Bu15HNaR+FoayMzzsQ/d3+7Wgn3aBiPP41gNr6JxGj+LzBpXe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563708; c=relaxed/simple;
	bh=OC/sqr9nS75Gl0cSg+7a9kWZKClAxbyPNDeoSHjp2fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PnvfzVCgRiq3t0kxaXjeNBjvclmHn3mWMVb56kQoPNHmGIh/xhZpgCyChpB+/DDBXjr7bsxDrU+wa+wXzBFtcj25VaWFGZ8DKI/9aoQy3JHDDMIDJTU3sqDa8x+iwGJqW9Z5HIvTztluanBL1OsYAeg+TkkuB2OXvxjIHSOt+DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hkLWFKG+; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hkLWFKG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQuiq8irUeczQlAGdRuun91VaJ1miwEfJa73tPcGBLA7GRDNosMbty3XcABnWqbqVBMHOuK2wJz6ChDmNUFZBRCKvwXsU1LOjl+U5rstBri+4WsRFPfBLOvWhlMDkYSWsXDqQzGJk7nQetCurYPgPX3P0iYsn2GxQ/ILYf2tA2JGHQo5nQPWPFD3fzLfxPpn57KcqwCzdd0Pkp0TrJmBActqQhyZc0nxNl3Ti1tp8G1VRPJdcWgcsqpYAVmdKzUbPSr+/50CNtkO16fJLlQry2jn0sZ+U25RTRQdpQVuOlLmOA4sJowbyZm/VRlt5WDUX1XnJXaK2HDzGGnqvbIf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3sZzJqIiIx9ABxyuiIIOy9RvdlfRFtvvMyVAnWNyqA=;
 b=ryyzWxuaDFoM7SobnqAzeCQB8mukoI211W6RZCJv+zgS6z3I2PJ+fX7ONsgOtkip3J3+crx6udQKBNvu2zLhRUTRv+0bT8iG+JlkEtV3ZneCjxPAjG1JkwJ1QqWe3uOty5NsfzEUWzgxcLeN82ZQgWjzyx21Au892QuGjzJvvttO3c4NLA+YlwQkeGJnBUJybbBqeuCVFo3gAbt/qwzKDMqcsSGzNGy1UOeV3kDN7dkI2ylDuKnwCxq0iC68l2+BKkcowQC07wPUCuHIjBpBzHhcLlau7sRP8skROfA1aYoLMvSAgMvU7V5m4niE2Q4Qb3SOFls63yYP4gwhl+hBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3sZzJqIiIx9ABxyuiIIOy9RvdlfRFtvvMyVAnWNyqA=;
 b=hkLWFKG+it6ceJJLpcLPD8mLpscGRVDvNbHxh1rgIfGQoBMXtu9Vud1GVtSMFfvHViiVs2pGZ8YfvQD2Ix5fYe4VGw3qI0MBRcekLlxbb+mBRnlAlk2fKSyOgbwPiNzQRfB6t2kP4Cw+ZXBRAItc2kumsb4WJcdFC+K/0hHJE/TqlCMhaxrUUjj0fRsravdvvQzivhCM1/yfNlIKcoZVDXcicwtOd6gyQfylRq+bbXH8a42HWV7EHTRd1fVR2P9/u34jdqifeWcd+3903tydKEI7RBkfhK5URMZb8bitjhjb9lB4gZgzYIji3+0yasG7hCIDNnoBui9luCSyAcd+Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 16:35:03 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 16:35:03 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org
Cc: shawnguo@kernel.org,
	conor+dt@kernel.org,
	peng.fan@nxp.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 4/4] ASoC: SOF: imx8m: Add entry for new 8M Plus revision
Date: Wed, 22 Jan 2025 18:35:44 +0200
Message-ID: <20250122163544.1392869-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122163544.1392869-1-daniel.baluta@nxp.com>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:205:2::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 191427a9-f0d3-49db-aafa-08dd3b02b8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xEgIy7bmWtUMv/+uS0pttUOsTKfd1bpmi7+Uq75GPdc3Y7kEGy9uN5CNI/FX?=
 =?us-ascii?Q?x/r3BqU1EPsOp3fUns0ipudWBNugHkFveXsYZWVMxkZh11li7m4Z/emk5TOH?=
 =?us-ascii?Q?YpOTF4ise4YIsouEhKB5IyHhcEmxowjRjzvPjBdvxvxG4jMQMwMwk4hjtrSA?=
 =?us-ascii?Q?Q45w/QA1Y2dc/kHNUHlxTF26s+4kj+bOTLQv5gm9LF5INLLvKMnhnIBQydLk?=
 =?us-ascii?Q?DbNZjhD6z3wYnGUBgajVdxZ91y6uv2prDE8d6mNlAOr4WAg+arHA2mYOm/ce?=
 =?us-ascii?Q?F3824pBCbCCU+f2SfNnoX0JuDEZJKgiUNm/DjIm6FcBvF+1g0ji4CefRGY/o?=
 =?us-ascii?Q?BD+QJd6bLXErvbgkJkz3JmDzP23/2mmm3KlZm1QqdKvHNzh9sFgqOHTNLu2i?=
 =?us-ascii?Q?/9PJVuKydYfH9J5rMamdI4cTW9X4L6tIn/ASUqo/tXM5L/76UKMwcLrcoRu2?=
 =?us-ascii?Q?ZthwZS7MgDeCmELXh3thWqWSMD/d7iHMt8s6KKfLWBK44VyPwP2ot0DuRcho?=
 =?us-ascii?Q?dhTQAUVZMofs06QedB3oS4c9/MmvNvUd97e3CKAWQ0f0z26t1x2IhFNqBGh7?=
 =?us-ascii?Q?fnrAlP7TB+sICxzRGmvPNVYrRrmAIXsGSiNl45qDuL+Jf7pLWni9/bVnW5g9?=
 =?us-ascii?Q?s5fDW2t+fTR2HSESmZ0vDM8G4zViJgfJm+WYp28aXoXNZW6pK2JKcOwKEExx?=
 =?us-ascii?Q?R8afkbmf/cYdNMZhT0En4WHR6rwNLCiJgM5vuIgCLck+I3jj19NLcGpC3Qhg?=
 =?us-ascii?Q?bFOxv5ks4Dwy8MUL+w+249O12i6uQ4feT64PdUNdcP1xCwE6me0pkJyaXwVn?=
 =?us-ascii?Q?G1sM+3va1Q+GaB23h6g9thou0lHigGswph8vImhVg/FdFMjpAdOdAZVedOkN?=
 =?us-ascii?Q?K3eQlPkUZOFDgdeAOSh1OiodCCE/8ZlNHdwFO3GAr+iR+Eu0MqsDUi2oyCUx?=
 =?us-ascii?Q?zoJziteB4kz7tCMPQY2LLK20xzdddMbb3JjP83ZiQiEAwkiG1x2ifjPFtKD/?=
 =?us-ascii?Q?X13OjUzFELqL6f5V1dGKhP85e0sPZtpsgQkpn61fJ4rU/Y0/I7Z0o1R9D2Fm?=
 =?us-ascii?Q?NpLWXlb+Oscv4a7w7pidcQ+yFtcqlKZwsYRCy9IPdGvGjoZ1LHHlpo5B0915?=
 =?us-ascii?Q?Wt5EvSlgrxFsWoJlEJyYnQXNQN7gvVpfcPI7sbZxHMofZEOEnuMMu1jCfF23?=
 =?us-ascii?Q?iEr10UYGWbb9EsNZSC4qa9g4JmBFM2xtmlN2X5GWeA6Woy1niIiNPvK8eBP+?=
 =?us-ascii?Q?jO1isxsuCanItiBsD8AP1gb5f7nqYYipPC58p9nhYnICdNY5ZVNg6VLvcgbB?=
 =?us-ascii?Q?Xt05bd85Z9ynVxap4r48aUdjUEL+JI8zvKr2XfP7rn9gVxMtJejbZwUv8mG0?=
 =?us-ascii?Q?Rh7KrTeFZg6Nts1Oj3y7iTFk/RQv/817O27i8/ZKtHRazfeIEKMWGPh8SI8C?=
 =?us-ascii?Q?U5X2h4/0PCApRQifhEIvbLM/NrrBru4X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?veYmYxEakGhqyyqLq6y9buLm4rrERAUr5wLcau/Uw/wQ5LzKXM4Pahf4hE+j?=
 =?us-ascii?Q?VyZn1pM5icwgkYvUEWeu0MlCrRxaOpsoFMm8kXm3aKMoByEnhmvjEaDFweqm?=
 =?us-ascii?Q?Ky8m2Zq4rUP03kGR17CmfyBc4Fr90g1/7xFzXjCPADzGtiBOsdPZmH9SYV5r?=
 =?us-ascii?Q?8YmVT8GtwlMPZEze3YEYTr5GLjApa+L5T6sNBvxnPvk5ziQC4BCgpZdUzqF7?=
 =?us-ascii?Q?o/FAtbigYoF6iSZroivApdKXCrBLAPAnm9Fxx8qphoRl2iNiIvjHgHT3ZXqD?=
 =?us-ascii?Q?EMWVueR5Wq/Zf3xoxXKDwV2kAvHqpmd/LqSuTpZzH5wxdB7I/QIiAOJ3lNz4?=
 =?us-ascii?Q?uLKLJeeFFY6Cm8TyDMrlCi6TWsLL+TwcJDa1HO1ySY8IdML9IEaIVH/ixcbT?=
 =?us-ascii?Q?X6X2xNINSwupoySPWbCPZseK8Hqs5YC0uF/wNGk+AueJZ2+davqzfLIy8Tpe?=
 =?us-ascii?Q?XWvM1+h8Z8oW57CUZsUeKS3c4eFo7YuQLCgwAL8lqa/MpmvS/JX5CGlYDayf?=
 =?us-ascii?Q?JUTo92ME9iuc7BoXtTEhgClBN+hfNjymdtGu8FaHo8CXb8+4/P5ewW66NX2Q?=
 =?us-ascii?Q?740VcSi2fb0auaGXxLPz8QccqcPJvuflHcBD3VT73BFR6Mdp6PUCxzctPhBZ?=
 =?us-ascii?Q?TYxgD+L1C+V3/w115B1xAPkE7k+YouVZ5eWiP931VbJYNwtg/Edr3BfJXzgC?=
 =?us-ascii?Q?wd7Y/7IYRzFhzkGz4U4dVorDW+vY6SxnuLd2R4zUkFoMGHn6saGwQiSzMbTf?=
 =?us-ascii?Q?3/8TJ7xrIwqwdg748auiQkFBCuLOhPjbYf4Ljel4UDBMUmNL+51Xv4iSc4Ym?=
 =?us-ascii?Q?ARFoxzSa1oqloLBOMkPPpUKeXffpt99wAs81z81NDAkruIDNXLViLeM5uYxE?=
 =?us-ascii?Q?VrXOfyWkR4Bpdxmly/YPfreBba8QRykBMuNyM1Eixz1Ie56PFSN2//2TslaH?=
 =?us-ascii?Q?n5Twcy3DUby+4TU+dpF+XA3CbkZ21gmkeOF6AagoRwhaNJwRJLvkAN7BrQSx?=
 =?us-ascii?Q?JOWm2N9pMQVBSyzl2JjoOW28YlyvTVdPj6t241ZDRCEXKRUs9zfdNU/PiV9V?=
 =?us-ascii?Q?hD+mvUTHptQbXxd79/tylfKwPb8RLJaseC6VwQAokcSyuk/Phcm5vaClW/bv?=
 =?us-ascii?Q?TLYg+8yZ94583KLYdbg8lmFNwFCa7tzjD49ILvDMPTBNgRoCkciWwm7S0+Sg?=
 =?us-ascii?Q?FB5ziOWXCTp7nAeXivCpFWVYRSNTmHv3MS8NQJ3oKQ8XJBTzJkeEXaF9GtH9?=
 =?us-ascii?Q?TApUympqOOnyt+NubD4L4N7jlPpmYU4cWMZiR0bVth7jU8i7nMuuAL2s5eAB?=
 =?us-ascii?Q?5pJR19nCZKrO8L370coXNDHxSEHNfRRDU6WuvPUoK6MMop4U74Wxi7P6Z9t0?=
 =?us-ascii?Q?g8EiBI0LJS6+6lGqxJ3ZXoabySWGxfuB96F/iEYkjkkxDjx/vguqDzEg17Mr?=
 =?us-ascii?Q?1ABz26f6A+qQEzaPqrbCuDZm8DiK+q7Sjev0x81fC9rAy96uL0ENqE4I+7It?=
 =?us-ascii?Q?d+32phTqT2oChv+kdKV5Ps5T8cUr8TKHUDdHRhuyNHNyecB+tt2TzrnK4WSY?=
 =?us-ascii?Q?CqM9/y/xwt/mhD593x3RFNtqdlOqDiDyBSU1Dod1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191427a9-f0d3-49db-aafa-08dd3b02b8ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:35:03.5596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OJpykCFmEsNqO/NoCmO/NbsS/CZDidia0sfgedsqtn8gzITxSBEKQZjyw7dHdRCwZZoHYBdJlJ4TcrALDVD8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

From: Iuliana Prodan <iuliana.prodan@nxp.com>

The new revision for 8M Plus has wm8962 codec instead of wm8960.
Therefore add new entry in sof_imx8mp_machs, an array of snd_sof_of_mach,
where we describe topology name and driver name.
For the new revision we have new compatible value and based on this,
we select the new topology file, for wm8962 codec.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8m.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 4ab5814e9117..c63d64164e4b 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -515,6 +515,11 @@ static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 };
 
 static struct snd_sof_of_mach sof_imx8mp_machs[] = {
+	{
+		.compatible = "fsl,imx8mp-evk-revb4",
+		.sof_tplg_filename = "sof-imx8mp-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
 	{
 		.compatible = "fsl,imx8mp-evk",
 		.sof_tplg_filename = "sof-imx8mp-wm8960.tplg",
-- 
2.43.0

