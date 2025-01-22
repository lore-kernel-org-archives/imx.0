Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14DA2045B1
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534493; cv=fail; b=WQzP7ZiT8UrCIiBM6hbAQnR22C3qV9uqKoLVAOUyMdN05ToMLAMR/2zGrhsLTCs5HX/hfWIrCP6CxeMnE0209MOoVE905255gSBUYK775s7Hs4NygXwG8BwUhVscSBYs7isJS7E96Ta3BKf+0MRt1uUWWRQrBEqo3wKxn4Ej/Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534493; c=relaxed/simple;
	bh=BCGnTHPt+oaukioVPuFtoLcfTnQGaeZOwgsYwTXp11M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V7gFpc4ktXQYfu0/IsSruq92RF6Kt1oeuzY27edijKdCWznodSK0drLZn0MLPdcQpqC3iUBib7tBx1pEKlTitCKYnXH+jHyKn/tguGcOdOjWoz9NV5nc3kLCLwXNiHzlYfS1QZX3wclrhAO+RkAp5FSucREaTC8yWzB0o/1BMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ja27zFNk; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ja27zFNk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6hSNif8pn5Xz9F5jXWwTlcre08MC6hJ2uh7LJPOLdJjkOfTEFOaxLlKQ4KF+YUOLhvWKquCh9HBc7R/tQlbwz6H2+GPPSdwgn6XpfC3x43ld9hxmBrXFp5OlStmWYEQfui5nXSiihke5tG5N9G+Jk9Y8RcCWQ4OA/My0YSeXb6VQiWN7bsexPr70yjJ1nkiz/U3yK6iH/nIl/J12zWp4I21mGjaktQiLunAyus1xxXpy4dzPYtdk0E/GDoyIUz3ivjCP+9RpyONB/NrOdj4/DYRRjwQ0gFwjWvsFQ6SVSWff+dY8F9SSPTo4D58eKkX5rEQTVpr8gLQBiFIS0ifJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXurwolKrV51osWvW0bayuXdj1dXrkhD93BFxMEn3ik=;
 b=ZHT/CC1t2/T0dYlmfHPFgg+YGMTud5sXM4xYB+TpkGOVs2nuJXKQ04UXJ63WlmFPrfCT2s3iIO63hgfnqSr1r+kNn+/6r/VF/v7WsvswthdLsWSIkDxM5YqECmQ3J28dW5/26rPuMT5Z/BBhziiFGimgIQP6kfGxSTyMjxAkQhPPPzr0zqAfXXVVsBXpvItOmRZiCYcaU8zOofRO1RmLvAZHXsUoB6qfHwZMOkOOw/80X9nCO191aMU2qkHPxRZsqvj6hygCYI6WfFW+YnGiCfMUDtdtw6VkyDAOZkdmTTc7vLMzRGALzpm0eVGw++K90qF0skLl6uGlFot5pNiRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXurwolKrV51osWvW0bayuXdj1dXrkhD93BFxMEn3ik=;
 b=Ja27zFNksdCZPbTnVjEzZi1thzQEg9nukcfrZUsrBaXiWcDdXemW2jYDBUt/qBUfEk+r3XOGbGNky5motAE+VXmPVtf/R65FrXMuEssZTvUOenwrPcUQsN91xfOkQHVNTiAYITWxhuJ5xqj0+Ojic6Db6iEbNfzpmDHeR0vTxYX3ocvUuBhksldkTTAc97sU5lTIBeUHd1IZKeY6pM2pN/sVDyUg3KX7CJ0bho9c71DxhO+a0d/18NByESyhjbL0QVppUOklyvB3iXuYZ+qzWhwjW14gON/h0YP4kuG01sEzY2qLUf8/Rr+EqOKYQfUsPFZWgyervCOCoDcUTRc3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 08:28:08 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 08:28:08 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Cc: iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	lgirdwood@gmail.com,
	imx@lists.linux.dev,
	Alexander Boehm <aboehm@eurofunk.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH v2] ASoC: SOF: imx8m: add SAI2,5,6,7
Date: Wed, 22 Jan 2025 10:29:27 +0200
Message-ID: <20250122082928.1321536-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::32) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 836f2d40-781e-4bb9-563e-08dd3abeb34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jdo2IcKjvlDInSicTupoQe/bACtTacbZVCP9QAO162H2Vaw4bq1J0ojbQBqy?=
 =?us-ascii?Q?+HIYtfYuqeb7VtpAbhngfIskw9WzhWhLId3R1WnJAgiYSeUHm0cCJYtR1JHT?=
 =?us-ascii?Q?jdU8UH9Q9yUH1cAMFNoHwR9JW+mCBgBdat07kyMeeCEBquPMq/amHbaLZOYe?=
 =?us-ascii?Q?dxTJnn+Pa5KCXfGDPc+qkLqjMPTqyVV7XjMWoelWH52URF9Pa2AnMiI9Ovl2?=
 =?us-ascii?Q?MZIWgVrowtM0F5JaXvptPyhtQi2W9S9mgbbOEExD7L+P7/aYCmp1lgUaQ5W0?=
 =?us-ascii?Q?/eHdmInqCal8ItQZcfdYhKTZS8BUuvzoCdXz7wU6t9bDmnyO1kSfdzV1DxG3?=
 =?us-ascii?Q?YLOYB5CNmhJ6CYHMEYU3PeSZtwukNJ82YIKPgG/dV3BoMuw+/eoG4YdPslmO?=
 =?us-ascii?Q?PzitEmUjePQjy4b1bDUHV54aaYgud1aQG66cuWwkQczQcFh4Vz+xTQQZLZYt?=
 =?us-ascii?Q?LQsOsYmNsmGkwEsVtOJaEfR6YrHwrZ/cA8yCSCFO8LVYXWCC9gxh9NTUhOxB?=
 =?us-ascii?Q?ggxVisCDYyfnqMKGGnvrHCnUv6ibQ9+K8UWgcAXNogT/cxWq7EDoz4nkXIWp?=
 =?us-ascii?Q?4DXKxIaC5e4OBqsbntCmMgg8vxPuouPOIU3Ha1RHI3LdyXS2taGfGXcRTcFG?=
 =?us-ascii?Q?KDS3nEYEZkAcAEritg6KVOce5yWQ2Xc5J+KYuy8qkShw20B8GtC/G0dJpk/d?=
 =?us-ascii?Q?HdrykMulRXEPB+NAyiPSbxDASJobBhIINIpQVdp9XvHUvJAHkzyHS7skjJhy?=
 =?us-ascii?Q?3XpEAlsXEWor0d1LKlsbF0YVfppKbR/L2csxupIBysgVQsAFViHSRSG03vLh?=
 =?us-ascii?Q?OJdeHYrnMCZMfJkY1Bk4+xFWab9CTaRtp7NyYyUrw/JB7tYwlOx74BgdhjIr?=
 =?us-ascii?Q?cUe3D9zJPPSXzH70zqgfEy4rDMy59IvEwY5ZrG37Gly+VRcaRA2NlAhzaEzc?=
 =?us-ascii?Q?QgJ9hOO0P3g9Laajsf43voYefjMEUwczW0yJWhV3E7gPsVOGcTa30VEiu9yD?=
 =?us-ascii?Q?KQBGj9VVqMSOu43+Scqc6eaWf6MhuIrsGZlAD3WmFkqpQe9C1mwNgXAZGNSk?=
 =?us-ascii?Q?RmmmRJhlFGYjQQCGl7vUTXVu+FMp0ew3ARBETPMdZXpiayOogCl2G3R8pXu4?=
 =?us-ascii?Q?8IKEW5KUGprlKrT+oEjo38AlDyOKg3Et+VCQ9jsgGiq5927pFRpJia+eHqAv?=
 =?us-ascii?Q?vKjataT88/cYg9JcPvfwpAcX9kN9VEKhlaRcqH7+TCOmaB/NwG813/AONytA?=
 =?us-ascii?Q?LnVXtA+6F/hGnrb1bb6UhUaBUqRgcw+9tUqJeXgjc1LxvqaUQaf0DQTwnIMI?=
 =?us-ascii?Q?IOwk6zIv/gDLsB2fcoCufbAMm3764Ey4PoUWucdGAi86bqjlSzO25vyTWPvQ?=
 =?us-ascii?Q?yZ7TRctO95isvIdpsM8QB6q9iTt28wYCA6N9d2PvaKXdLe6g7b7EE3J3WgiM?=
 =?us-ascii?Q?RmqTSBKOgFsCqAndnA9JKhV0y/pJVa/y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0UC1GuXVFVpOkpzMx4NtQZ8NlNHW0g+S+X0UQd9YBkndcFzvwI0Mzqvpc76/?=
 =?us-ascii?Q?nuvFIv1A9BKQSJJHyLFV0bUXJjpedpKJz1Ju8rEoLgG2mg3m5aTr1/49RWT7?=
 =?us-ascii?Q?Lba8ZS6sPKZOMijNv4Vu+WOUdbNiZH2AfxEnMDi0NYfl8QJI3ShAtxTHgCCJ?=
 =?us-ascii?Q?ySTn445fUTyR2mbEMmATaydRr/CnI+P5e4deKifc0Piub3KZlJx41LRAtDD6?=
 =?us-ascii?Q?LVqJaa+MU/2C7jvu0eTjNl30m9JYOvc5YFPo/YZcMJN2ZFWphtYwQSZEXyB6?=
 =?us-ascii?Q?pDFe/U/1dSEwW8Nje8G3h90weUjiCWsrf3bKrwW91bjCdXfgDIYZjOq7r8ar?=
 =?us-ascii?Q?DS04fLS8xc6VNEEfA0dZz6PKTWU9sl39b8epWfQ1r8Ap7+Kg8VCA7l6Ba6mu?=
 =?us-ascii?Q?Fxjk5cJgcS7Cc7p/5Q64G5XBrtjCoI/TcOpcDyyFmtFHZg21fd8ua5hdYeCv?=
 =?us-ascii?Q?8vw+LYcEJfKrE3tgXSzXCkFFVVT2jqGy1oqz1wNdTheJNVCRFKJbGO6sfHWL?=
 =?us-ascii?Q?WFu9UuOz2Bf/eVPKjvGbvmwKGbD1Ju1n+kbl19ekcXeoiMdd3jxBOJCFUoZq?=
 =?us-ascii?Q?NupHHO/CS1kF4kMl87XHk/dkVAj7fA/7RsFbsSJbDLF9lkV1eoEIC2BclBI7?=
 =?us-ascii?Q?DiqR8fL9BVjVa0Uku7gRoNvA3s9ZfHsl3HPs+jq4OOz6oSofKGzkmWwqci5X?=
 =?us-ascii?Q?x2hVUEO/mvS+t9I5n9KE0JZy6or+V9xMDIceJ6dHxMML/3/OfynKn5NDd2zz?=
 =?us-ascii?Q?IURpG6dvnOmjsIgYInm2uePF5toTLtD1RcKgNixFzRcw6VkK4LsX0gkntWKg?=
 =?us-ascii?Q?eA9vAqk3DVHzv5IBKsVouH67Nad8MZVZz1OKeIJdXMVStW4aNhHBKiZ1hbB+?=
 =?us-ascii?Q?I4EyVPGKUJr/BjM6t7Ls7ueKSQcbhG1bd6ZysTfVoUG8ssFRrhb1mdCNCai5?=
 =?us-ascii?Q?ImM3dTDNNtzVt4AQBWLurC8BOhS5i9+vSPp8CqlGt+HA8gd0fWSNzVS1VTtJ?=
 =?us-ascii?Q?QvDkZGP0LD2uR434KFIzEIMWiiVHbJbigmxt5uGsV24lOpc8te4eqgtAVB0u?=
 =?us-ascii?Q?Feh/jzfMShUZs5XGf1D3bsktBAI7mcTyM1eTRokpOF7O1K4cDaJzeglVhY9o?=
 =?us-ascii?Q?E95IEdEclkO3iE88OoCWWpzaVrNK6zTOSK8p/ATZg6GuyThvX8Js0GVDWhQ7?=
 =?us-ascii?Q?IYmBQjFrmA/p897/W8j0MOFwlyRWW9gf/+cltcMYKNErQh/FDHBmTgASJBMM?=
 =?us-ascii?Q?UvOEEnLQU+mV3K07ps91O25DcExennvIK0rM4AQjjhPXai32V7ukCURWkprN?=
 =?us-ascii?Q?g9RZLxfJHAz0XbUJHhT8W2SFEmRhbYUU3n4UrQKKg4mjVJl7C0VF3Bd9Hhyo?=
 =?us-ascii?Q?azLVZFLop9D2hXsCNkHUFWOGL43rI4bZDkLO0yupms+tEtX9wdfq9Qf+S0bf?=
 =?us-ascii?Q?8WcSXaild7VWGHRRnXyT6czzmHzJpW3T6DkRmqU7l3NA1MguYS9raXI+4HVm?=
 =?us-ascii?Q?GUUCobDtitIb3LQM3eZvSKoTi4X8NKHGtwxz6yKlET+F2/8OSwuH8W4X05Kl?=
 =?us-ascii?Q?aXc7zN+FftS1NSDYRNEX3HJBQO2HN/FeZBdVZ4gC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836f2d40-781e-4bb9-563e-08dd3abeb34c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:08.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1dmHF/fwR0NCCjcsGTu+75CIsqBpSkJnUfyh0DeeXqDhI+L1zhxzNHKHStAsWtKl7cc+kFeEWW1eG0kI1EjdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

From: Alexander Boehm <aboehm@eurofunk.com>

Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.

Signed-off-by: Alexander Boehm <aboehm@eurofunk.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
	- add my S-o-B since I'm picking this patch from
	  thesofproject/topic/sof-dev tree.

 sound/soc/sof/imx/imx8m.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index ff42743efa79..4ab5814e9117 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -294,6 +294,17 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 		.channels_max = 32,
 	},
 },
+{
+	.name = "sai2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
 {
 	.name = "sai3",
 	.playback = {
@@ -305,6 +316,39 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 		.channels_max = 32,
 	},
 },
+{
+	.name = "sai5",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
+{
+	.name = "sai6",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
+{
+	.name = "sai7",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
 {
 	.name = "micfil",
 	.capture = {
-- 
2.43.0

