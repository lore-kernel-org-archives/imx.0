Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CA21504D
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563702; cv=fail; b=YbVMZW/c6KlJPUk1/1VLoCMVarUA2xKJcxON1fk+V5HZFyKBgf/a5hiDscE4+dwXDx3seD6GxcfWQ+3ZGowAnR6vmmtFtG7n0iILB3hTCitIuISgMRK5czB4HgbSLkwUH7pVxIFWdxA1yeZ87SA0OcUfJJ6UiSAH8ijMKn3EcPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563702; c=relaxed/simple;
	bh=n6+i6Y3dNFBBEzZ7JiC5EXMTBd/bkxGjfdSB63b0uSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KoYPA84TDktPzEJzHmXbt/EhzDqo43SYKWixRicY+u+hCS3NIik84gIa5stDG1ez08PkNqGrmduJxe+ChqG2glq4mfIyQGoEvutZqKjuAR2vK7+m9D/VYrUebY0SWGVJq0IVmucuMK5DpJJ9DCl/VK4jdyXOw8hFqea4bd2gB68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U9+653Dd; arc=fail smtp.client-ip=40.107.22.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U9+653Dd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KukhSXzr8QonAlQN4Jp7f/wU03/BVp9XIXLI3qX0vITg/JxU0lmAA7Ua0paYq/HP4sgbuPgTBv/nW1mD239DVpNjthOwi3AU2t6FH9A1Cwp1L/3yaQ7JohgI7sL4Z1ERuYqw2b7l/gq1PqCtTz9nJ0dpY3rasRzl8pqUIhGSeuS0Z9Q7MCFBItaYXzeacrFxjaVv0+fiAWkiJ9EdT0Tl0D+H+cMlsvm1IqxsFXWnnssk53CEBPIcQBs2s+19KP0gXsR8Xb1bzHvmqJFvmJT6OGMO5ViknX/HPMlPf248WnmfFJJVda8AoJsDin5YlKMcvby6X48LwuvhUQwBb0alLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugBtfXnpRz2/UpmcZe7xQn1+YqBkmpyS9zgANPAxmaM=;
 b=bxtXrYxvfBO2FaK6Ju9zuRg6A0ala3T5SEo6+x+4ulIcyhFr+hiQDHEDqRSgH7yHz/S6RrcRD72N+kzGWmr2qGU5mtFH4FTu5E2zD6irpom3mfmaFgchDrC+++yRg+wTsfl40qEHHd3jscBTNeGyOxM/tnFo12ssGzbWfQ1zCDZNJyDzLJ7B/vXiWcJ7G5V3Nc8qaLhNwK8bUe6R8q88JkMvldb3BY84qpcCRqtON3xcVZ5oKvwif+7LP8ddwg9KPBJsX62Q+QIC5e5msMoJoekq+/wtWG1mbwyrGQqg2mpJjzwDIYDNa7ROH5w29gAmmCUSOip7zg6mWpu5CaMcFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugBtfXnpRz2/UpmcZe7xQn1+YqBkmpyS9zgANPAxmaM=;
 b=U9+653DdgcN8fy2GAwlDvuvQsLqRH4royLvMK7AuiROlkR0bKikK87UBpwwu1pGUsajCVdOrNeLOPuvmX6OV+RSEHDPvyNlaOqxEP46KDgUdvE0cGEaZr0wBlqfv/EP82FJucRw07i3ZyOtIDjrWdiPFKr4JpLvM+egI5TO5G0XnCLXbM704N3qG3JBXZkPRRn2y1QklKjxpk4ffk+u1LExD80l9M56chq9yuFTqOETR912Zzs92SGu9OYxVUvCAC9D0glP8Hth7nI9YrRqkILEXgHYXHowRQbdU3i1QP4m4ZUafykIoA4wbmaxEvKI66poPwty2pozZmv//oKXY+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 16:34:58 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 16:34:58 +0000
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
Subject: [PATCH 3/4] ASoC: SOF: imx8: Add entries for new 8QM and 8QXP revisions
Date: Wed, 22 Jan 2025 18:35:43 +0200
Message-ID: <20250122163544.1392869-4-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8512b95c-576e-4495-597b-08dd3b02b568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/f1/J4rLAIWyI24KBJKTE3KDdsO4de5hXRksg3tjEt9EnGpV0Zv1GL62r7v9?=
 =?us-ascii?Q?ooDEzUq84aZmjwMpujhR2xaP3/G/r8RIqHcWWExeRt8nGouEK0VcoQMGsTGo?=
 =?us-ascii?Q?+eyi8tHjPm2o9FlapfDNhosU/IkKIzctN+oR7vFmLy5IzfMqsqmiQPCCz7NA?=
 =?us-ascii?Q?QZXMQTkI6jIyuFqiqGW/9sYW/pxeooUvfGlWUqiwV7trWpb22BQaOQUYTzU+?=
 =?us-ascii?Q?xdS6aNOQfKd0mdceKEbXzoP5ZxZQwPqIX5SP3szah0hubZZo54WGgyh6wbZJ?=
 =?us-ascii?Q?NZQBml0yCRkpUadvVhQ2FDafCqym7Gy0HsGTAmPjX0zGtaZA/Yyu9R0NDazs?=
 =?us-ascii?Q?mUbwpgaWrcUdtAPwvB6WU5R3mYntJqAtZG7/gucSBdXx9WxNk4O7ZWk37mFZ?=
 =?us-ascii?Q?GXBHqiH4zxCe/tRS4MUcluzLMA/9O+e2J1o83wyULJAeSHNdUCJSavdB1F1W?=
 =?us-ascii?Q?GOPpRtP/QH2/bDWPTf93ya4fZM7IGavzNcdtZ/DSyDt3KLcxJkEHQaVG/zxJ?=
 =?us-ascii?Q?uhP61p3wk9sBoiOh5Bw7b4BysTHFWtaDgpZJTHMDFB7Mn9vuIOwYwSDDhhFU?=
 =?us-ascii?Q?h/DAnHit1PCWIX3QG5XphqgmD5iLGPh2z+/uA/9FX/iM/N1dRHZWygjWstRA?=
 =?us-ascii?Q?3KfVeJ9+dCTw8NR/0XdUTDcdPsT3w4dS/AHCPEdJAM5GLWDqwA6NwPAstmej?=
 =?us-ascii?Q?ifGzxxjk0//STEx8nIxA7RTEHCFmme/3cubcIjJsSQdgeYAv0M5FdKWQeWgB?=
 =?us-ascii?Q?rAG/rtTp0P9XnPevdKduktOks37TT7yue8XZFDNuMaEMmzKRAbRjYV3BF7Xt?=
 =?us-ascii?Q?et5oXDTWqXvQCfijGuL5jo92aANPO8OS0fGilvJCzo622PbfAzFw80ezDgcK?=
 =?us-ascii?Q?kOQeVzIf6jSyUeX+wPKHwJsSFKu/KTc9yfE/YunpsPHhDutSxDN8nHFQij8e?=
 =?us-ascii?Q?TfX+5mGVCsMoTlen1Uyn2VoFYQBdRPOBhkaWsFSXNbgI4ciXju0jxKK6XCdV?=
 =?us-ascii?Q?LR7yJ9HISffoJNdShj7vzws25flRyWx1DxMnt5Qv0vE6JdAIfACi7V9e5mUv?=
 =?us-ascii?Q?1CoYlyVXQOMQYk8XggK73UI1wiutLoatOKpxrGkaD5FXbKossvC5XNdiXr54?=
 =?us-ascii?Q?QeccvvWLp5ChLCryB85JQZSzc7KYlKbve0OoNd0CV1SA+jjlDjnwkbGzxBdV?=
 =?us-ascii?Q?MC5rfvY9OTPe3/CiOSIFflQd8DqDsOOQP37uQ+m8WDschxHbZg8frwmHjAd7?=
 =?us-ascii?Q?W9zg60Oq4mMp+SNA3HCSjQ+8DjXdSTFouMMN3d2Mn5xZNgRgAEzIrpi/6d9m?=
 =?us-ascii?Q?kviBcEy7mjuY+bCA+YzoguT1hUvzUp9owyUeWzwzj1jIroogEDYsltkZX4A3?=
 =?us-ascii?Q?hW1VvamsNVbpB0RoHj+P0no6Kv0+3c8BppoHBy0Qdwax+HkjZM49sDSTXJ9w?=
 =?us-ascii?Q?gmKEPKqmJVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fb9clZGT+WZk3ENbsN69TDxnC/bJIVcVkNo8KpR4kCY8wSIPUFTfKMaCSJmW?=
 =?us-ascii?Q?/AyaLF7qWRAV4wjZXBFNZhZSTrWGr2MXfIE/+cz2GcwHLd9QwljHv/Atb8Rx?=
 =?us-ascii?Q?znGA0vcmQEZhkvgNCr5UECjmCV1kPUxW0vwNpfEZNWlDMwVC1PPmqo44O6ih?=
 =?us-ascii?Q?J/nRcvce4IRS+zOyx4DlK0euApeIbIa7ka+62EO2CqrCWCXwRYfOiJ66scWx?=
 =?us-ascii?Q?HWtB21gSiOlruwyg7Twq2ZwXrswCpFMJUyb7ynTApsoERx5C2HLwRyCZ0VIr?=
 =?us-ascii?Q?ShI6EQTEJxT5bZx9E2V6zYAh8giOedeDx+O7RJhq4JJBbuADCfCpaIH6sCl8?=
 =?us-ascii?Q?IzeIlqR5SJlDp2OhkWAPAoHUJR6eLIE5Y0xmtovDiXnV0Lpk/fCw2N5cmI9a?=
 =?us-ascii?Q?8J2MAdNgGrhM7GZZ/OWT+Fdit14na7ip9FMHjBlUvc1pScOWY7EJmKkffgkI?=
 =?us-ascii?Q?JV55hwAH8Rgr92Wvwi+7v8hLrShqOLOniuM17PFlGzyVapPPTeioz1l95Vdd?=
 =?us-ascii?Q?DxHge2YYiw0CPHlml0PeiOvpldaI2NazM61hKOu+3QlSO1/zrXAmvoWkK/5a?=
 =?us-ascii?Q?IhTrZ1itSCxHLGQ5YJSOQExIDji2jR/Qa+9O+MFc8MzPdyjl1XPanP7nc4cY?=
 =?us-ascii?Q?GOEiCoxrGa7VitMiC32bncPQVMb37mMIIuhONfPcEiW4MNucUkgIiv2aE9qq?=
 =?us-ascii?Q?estJg2AMjuSB27H2o73N8PqhCEc7iGmXDJg+v+GeZStDuYM7E/KDyGlfDEhZ?=
 =?us-ascii?Q?/89RjJUYMGJdqIdDekm4T8G6zhcLXJxMdNc3HuZyNY9YF7KFNtKS28diaDNm?=
 =?us-ascii?Q?rT+rCY0DrYvfMI+Tp4ilfvuslxW7E/Ne6fHhDErQP9LTLzn1tn8nLLgsAsIS?=
 =?us-ascii?Q?RVTLdD0Z7Ol717V+PRRh+46IA6jGG9XuJDNUZi6WvBZgzXUygrc9jeOHEx5s?=
 =?us-ascii?Q?0XQyagpDhSJQrpHKwAxcpOTLc+twqKidQfMFndkbUhJmWRJ/DCpTZC21Wqm2?=
 =?us-ascii?Q?wcDo9B8V4rPNfxUeDQjiR6YObp+yPgcB3K5a2aSqOCbyz9HuSvRpFeJxFbb6?=
 =?us-ascii?Q?7Gx5roeb1b5wP0tAKNEbY7YvVOM6g5XBQwJSflhxAAHNta2LnO0XzcFWo4Xl?=
 =?us-ascii?Q?YwrVBVu3d6ZPOoKGWTqkcW71X+UsAwmg1aXTaYrULnOy1aUg7xhSSL2qeonf?=
 =?us-ascii?Q?RbFo/z9c26GJc8FeDPJyB/pNbhczUFiNr4Dm3bsoalrqWfWV0kJrJ56QrAp1?=
 =?us-ascii?Q?r84Rf7I1kZTSX57kHpM+MsNb1zUCs0UX1WSqEyPCUL360R7M6nGIPDF8H89Z?=
 =?us-ascii?Q?UqpEtTKs1ZrCEgq+mm9i69b0D7stbZKIjX3nLWgrHRk1TU7cNb4nMeYferj9?=
 =?us-ascii?Q?sDjL9l1mjzvxDAgIAm7P2jMRzyMEK8S8n215Wo2T9vU2tqFEPtSR1cBaY0J0?=
 =?us-ascii?Q?ENjgRPx9LXmZhTKWYXCivxaBGVXESdwGW4sej4hON+c+zXj2DWTbi12RRd9o?=
 =?us-ascii?Q?62FhKCe5ql/jz4xUtNTegvAyDwoxllbkCJ5pNUrFuSOeC1xOUMLaJ6i1WIV6?=
 =?us-ascii?Q?GcRJ6Z7VVzM/zKKqjw/RkdSS4bYZJf1uc/JIhzgB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8512b95c-576e-4495-597b-08dd3b02b568
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:34:57.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi2fM8yK5v+c9ZWoBdiKHlrBAxBwQgCWtcmm64uqVk3GW6WJJjcZSDfpzlZEFnaZ0ZgcW1D5yM3qB+pr/CfmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

From: Iuliana Prodan <iuliana.prodan@nxp.com>

The new revisions for 8QM and 8QXP have wm8962 codec instead of wm8960.
Therefore add new entries in sof_imx8_machs, an array of snd_sof_of_mach,
where we describe topology name and driver name.
For the new revisions we have new compatible values and based on these,
we select the new topology file, for wm8962 codec.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index d6117a3d4266..3b418114e8d5 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -606,11 +606,21 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 		.sof_tplg_filename = "sof-imx8-wm8960.tplg",
 		.drv_name = "asoc-audio-graph-card2",
 	},
+	{
+		.compatible = "fsl,imx8qxp-mek-wcpu",
+		.sof_tplg_filename = "sof-imx8-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
 	{
 		.compatible = "fsl,imx8qm-mek",
 		.sof_tplg_filename = "sof-imx8-wm8960.tplg",
 		.drv_name = "asoc-audio-graph-card2",
 	},
+	{
+		.compatible = "fsl,imx8qm-mek-revd",
+		.sof_tplg_filename = "sof-imx8-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
 	{
 		.compatible = "fsl,imx8qxp-mek-bb",
 		.sof_tplg_filename = "sof-imx8-cs42888.tplg",
-- 
2.43.0

