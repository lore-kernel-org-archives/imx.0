Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A1419FA2
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170088; cv=fail; b=gFCGDFec3tGtKYWdsmnD0P+SdZqej3giW6lIiWz3VjXNM5WVsrPKxlbUS63wEBTE9OccHnRQX+D9gq9fgNdyGjhwCv5pa/EB/EWjlucnz8DexA8xc+O28Gi5vNSmpdo7b1ZYNsT/Dhm1leB8Ev9U70MHkRqL7nt7cJEjfTlc7uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170088; c=relaxed/simple;
	bh=1yA8wFmDl84yMPcQ2uFHl5ltYLnY4by8fT3OKUEfkCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOUhyUBNUtxwuw5/y8m8cvn5ucr7sSVh2+HEqp+cgzReeGM4rgumESBDFiw3hSVHjObMXQo6gjEjTMhRETWBWwQRaxlZkeSNM0ekjkoMs2CAcCQnP7NuPHg7q8Tv2a1B+dnjUhn/bmSZJeeduKOWq3VyHpCxnT3vudU2xzjXYGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NhMF/s16; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NhMF/s16"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1vuskB1kf0izTGe4qdXW4yQRFxSVUx3GMYihgCJ+Pkr6gL9vxDMmPgYkKtLHKYXTHOa5CSsmuqYjj/0d8SMQVLxJkf3PfXXtx/wCVmKJIyatGU32OmMDk4dw5jwvhaZiVmIOA52mBG4xgnhpn6i+ggXIBDSegZdrTVpGw5j9/2J3jn8eJfXr1sZEO73r9RPEqavp5aDhze28StkDGxHma6chrhVv5siuLB0XE1KLZw+Igh7tISjM1ynD2eoINGtgkwjFtTdGhRdyRMr3ngbhhusHCiGbMmlAMKGORINNll1KG/Yu/X2qp87wr0s1TfGD26SQ0SF1DzV1cVuyUp46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIca20BqWDTlOAOSPQPSrS2FVo0+d9r+PwsLRpFcIDo=;
 b=Sl2z3tLMRUE9rWZY+wzUXVQ62/jQkRbwOUMYTtmVbCzPaVOYYw8hKbT+UXkHifTmGVQfrhHSYARjIoe4lGv0bG6sXr0Ui61iuJ/JPpjvmwW9v8saeJRlL4wCpsWQJJDD99O07LiRNr+YpqcsmMIgmDDyfleucUeB0x47XjVooqrp++XuI9QM9O0yiDkTIcMbqrAl4TQrTMyTwME6ze9TJKZrv3mIlk9A3Mygyk2ZbqOUACeGzz9bQGASIO1GmbauMyzeEARRU4zA3n6iBaYq9RMK3bMotqfN8NC0wbAbubu1roFr/rzQG6cAdeikIu3W7VpopCmLha2cnxoRPMVVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIca20BqWDTlOAOSPQPSrS2FVo0+d9r+PwsLRpFcIDo=;
 b=NhMF/s16OuoUHj3fNk5fE7yh9SeHswfWBXayoBLtdPcKWNDeZWS5OFLTxR6tHdJ/0vuJ1xoXTfM/1Xgo7ZCI0E8+VkBCyevRrSA4IGlmoDF3TzD6vQFKkJcEVV/qtuBUc8z0uZcuQoJCmA+ZA5KExBsrXNItMTAD48orHZJH8AyFH+mVD+tq5iEfV8XYj7KxK3O1p5zaMYVw54gHKaxRJa3aXOEK5lhLhapKJRjzYTY5tKuu47uXsZFj8EvZDl1JDUBo89LegjOUyT3N0VI6zIdMS4BWDULhdx685ILi0QXvs28AIaWOwAdSAK2nJyf2q8F0AvbzIrpcnG4ivfb8Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:34:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:34:42 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Wei Fang <wei.fang@nxp.com>
Subject: Re: [PATCH v2 0/9] arm64: dts: imx8ulp: Device tree updates for i.MX 8ULP EVK boards
Date: Mon, 27 Jul 2026 12:34:35 -0400
Message-ID: <178517006282.2521127.16503703124624562470.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0451487d-0d79-452d-9715-08deebfcf5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DmqXL/BKTX0f/BZrj3O5i02pbl6meHFv9cLtJwqGn+RRLqf2MzZdo5REDQ6gpeajzfLY4kqr/PEFkiYjO9sTHemjUKW30sitVKh8aHE1HP8z7ildhQtf6eHDecdR7l66qdhrWka1Ui7Q+F0/fskHcDIEL7ycwwb4CGyZN2UO8L2+Ed5xmKb99ocoLHmDxIfbaJ59uItln64I0BY9AU8N+d99O8sAMwrCpikrk4ipj5VaTTcJd48OvAGTHYc78RdzTG5F/LfEkcU1o1epy1BG2N9UF32CsFW1RY2WDDxD7neGKsg7uus+MPQ46BkjedkNET+vMfLfx4/8SmNWFFZyM3TRPEUC/OxKxnm09T4QcJPTF/s0ZgLY0HRsCbezVtb+TF6RfNM0RgfscEDBnq1taOiFPIMf0n+//V8vMLa5RiRPsmv0GZT1y+jwLtZojjudKZM0JKR/pfOGonzZiiN8TNFZ44W4zhhyqONvkcOokRCA1iNbDfhoLNzrtGi33E9o4zRZVUhBR9ziuOwjcKnDgAn/WzEhG/vc7MsKBj+qu1bh2mTeCzYYLKW8hA9IP5YlYh4m/2FXk4ihI+q/dZApWhzIN21Wv1nkyud14hazRJ8KvNXxuXHh/5LI0mJ2EPITQpulELZnWrlFCpKKuFKWHNVAZyRAvp4ovjjGQtc3jrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpVZ0FXaFBZZDhWUjdGaGxEUHVnem0rZDgwNWtJWC9HUFVBOHY3cmpLMStl?=
 =?utf-8?B?cEZZQ1hkUk45elU3U0dVRjlMM0QrU1RYclRUTGIvNWNDd3lBOXh5aWpNbDN3?=
 =?utf-8?B?YklWTVh5WlJNcEplTDYwVmJZNlVHbDc1ek1hZ2J1NTRRc1NUQktjYTVwb1FG?=
 =?utf-8?B?M3VxZUJlMzR0TXlYSVZkb1g5TFR3ejM3UUtldlh2ZHdLRE5mbFpZSkpKNXBo?=
 =?utf-8?B?ZnNjczJzZ1hySWxpVDJ6ZEFNTWZpb0JIZzQvUG9Ma1Q2bTJkc0FVcFFhUnpX?=
 =?utf-8?B?dTBWOFVUdHUxa1h0N3J4S3ZEcGNpSkZCaGkxcnVaVU5VM3VhUTh3VkFkQkZP?=
 =?utf-8?B?QzhQKzRPM2lDUm11b1BINjdTVlE1VEtwbExDckthQnpwLzB3YlNrcTJnWUt3?=
 =?utf-8?B?SUdPcWZGeHlqMGwvU01QUmRtTnBJaUVpNzVTNEdheEx5L1ZmSCtwaDRtdCtO?=
 =?utf-8?B?SmpOUVBhY3ZsYXBxbmRMbWNWTXQ0aEVCYWF2WVZ6U3B6MTBKRm1JY01yYklC?=
 =?utf-8?B?aTlFbm9NZFVyUHYzZ1ZKSXJwdFNNZzhxVHVEWFNLMjdSd1lEQTEyUU45Rzl1?=
 =?utf-8?B?ODVqQXg0NUhGZWFIell1aFpBL2hQZkxpbnJqUmNEUzJxTDBIakNmUUlDV0Fn?=
 =?utf-8?B?dFhoR054QThMOTZDS0UyRnFwSXJRbTNkeXlEYk9Yc2pacE14Y2p2cWhNQ0R0?=
 =?utf-8?B?dVJYK1V5NWFPSUR1ckxtTlBxdXlBQWdkdExhMXVmcE55VXlaMEw4QmxLcGRH?=
 =?utf-8?B?bnlqVndDNXFYTUV5QnhTUGkrUXIzMzYrbW1NeVJjQnBFT3MwVGtRMmE4dHd6?=
 =?utf-8?B?bEx5TzF6VGxWRGFNdUZobzJqTEIvNkxiVEwyYVdDZG5qemV4RXl5emFjSmpr?=
 =?utf-8?B?K0drWSt0L1I0VDQ1Mk83bm5YWk9kMkZ3ZDl3U0Z6cFJVMXNTdTJwZklBNEJ1?=
 =?utf-8?B?NmFIZnBtMlhxMXM5QjdkcE1rUndheDZrZU1pdWhCRnJBcStvM0dUWTIyYVpL?=
 =?utf-8?B?STQzUi9lLzRBNnFya3piOFdQclJxRXBSVDFCODg3ZXBkLzdSby9RV1U3ZXNy?=
 =?utf-8?B?R1RqczA3YlRyLzBQbUJQL3FNeHU2K2RHNUpHR2lpQVFkUThYbExTMkNOakl4?=
 =?utf-8?B?WUUyL0ptVHZTY2RzQUYzSzVUcC9nMDNvN0p0Q2hsUXY0ejZFYnVYMmpCMEJH?=
 =?utf-8?B?K2h3REViQWlDczJOOVVFSkIvRitHcExrUTVnam5LN2c5Y2pQbktqbHNTdTVi?=
 =?utf-8?B?ZWtPRjJNZnhiK0tYWTJ3WWkwRTlCNmRpcW96enRvY25WYkJ4MUQ4NitLM1hO?=
 =?utf-8?B?eW5EWEFsM25heXE3NFdVU2VIWGZ6d2o4MjB4WnRHK1RNQTcxYW5wQ28yZkJN?=
 =?utf-8?B?TzJkem1KU0dYQ1IxK24zMFdTNmhQb1lnZkJpTXhFR2hsdGNrdlBLRHRzeE5x?=
 =?utf-8?B?cmMzdUcvcEJQOXVYbTU5UC9XMmo0allGMlpHTDJkS1dMYUFYV3pGZTFaeVZq?=
 =?utf-8?B?RklSOEo5clpCdjRrUk44SnhWMFc2c293RVkvaVVjcTdaRnZpdzNDTHRKSk5B?=
 =?utf-8?B?ZUFSODdJYUIwc2dFZUloTktHZGZDS25mUTFYdjJnaXdsbjRzalJRcERQTlhh?=
 =?utf-8?B?NE1TTzQzSXJwRkw3Tk1KODUyWnRZOXEyZUhWcEdLSXBRTVFSNWVPNnkyMVZS?=
 =?utf-8?B?b3g0aWV1RDhMSGhOeXgrMXJCUVFLcXg5ZWJoVnpXYUlMQm9ERmpTdTZ0bjYx?=
 =?utf-8?B?NmFjdTdGRWZZTitCOUllN25IQXpJeUpFeXhJSXlVc3Z4R0QrRTBXRVBvam94?=
 =?utf-8?B?N09ENStmZ09QbU1QN0t2VVB6TDBOTHQ1RWlpdXdnR3dEYUZNV3hNNjNqL1FH?=
 =?utf-8?B?MDUwSjczSXh3emhzNlNtUERPRnd2ZnJvbXRUR1NPZjhRa2N6amUyLzAzaWNq?=
 =?utf-8?B?dG9zTHVOU1FKZXkzUzVvZ083V0xOL1lXdUpjbWxUbEZ5M1JZaDVGcEhvanpN?=
 =?utf-8?B?UkFXUjZSem13TS9GbnpHUE9nV2hDcWg5cWhldHVCQXBsdUZTdTNzQWxWMkox?=
 =?utf-8?B?cFZadlg3SWVWWDFkbDFvZFd4TmhZbTV6T28vSUpvb2l4V2xRS1BrU0NZL0JI?=
 =?utf-8?B?dHNZbERuYXRNcFQzZVAyUGJLamJ6YmZLV0NYUFQzOW9XYnQwQ3UwMHhDNUJl?=
 =?utf-8?B?eS9KY2owMUc4YlBwYXk4cUJ2SUdvdFNkVTROSkZuYnZzMlo4aVdxbmhQVEZP?=
 =?utf-8?B?aUw3dnA5WjB1QWZhWjBDbmdlUjV4Mll5eVVnalJsZGdkWnRyMjNoNnc0dkxV?=
 =?utf-8?B?MnBwaW96MnZGNjkxc0pST2Z2SjQxNENzWm1xZ0lWRm0veG8wM2gycDY0aTJQ?=
 =?utf-8?Q?yNkYT47Fj2ugI7kSy4R2++CL0f46+9RvVH/Gw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0451487d-0d79-452d-9715-08deebfcf5df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:34:42.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1G4evlo+zI8Kx0qDIw5nd8ngiGMtovsgIXkXzi9pRi4XqVLfTdsLRm0KfC9wDuFQVtCQEDm1czdraSxcXnLL3swk2V6Wk6P+8+QmL/edlY+1jkAkUDQVqhhDtkF+qbv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493

From: Frank Li <Frank.Li@nxp.com>


On Mon, 20 Jul 2026 22:12:08 +0800, Peng Fan (OSS) wrote:
> A collection of device tree fixes and additions for the i.MX 8ULP SoC
> and its EVK boards:
> 
> SoC-level (imx8ulp.dtsi):
> - Add DMA channel properties to LPI2C, LPUART and LPSPI nodes and
>   replace hardcoded eDMA direction flags with FSL_EDMA_RX /
>   FSL_EDMA_MULTI_FIFO macros for SAI and SPDIF nodes.
> - Add the I3C2 controller node (Silvaco IP).
> - Correct the SRAM node base address and size to cover the full 64 KB
>   SSRAM P2 partition instead of only the last 4 KB.
> - Add assigned-clock properties to LPUART4-7 so the clock framework
>   configures the input clock automatically during probe.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: imx8ulp: Add DMA channel properties and use eDMA flag macros
      commit: e1e3f7582bb87e849bd3e4101696992878529340
[2/9] arm64: dts: imx8ulp: Add I3C2 controller node
      commit: 5f3301712f42c89df861d26518121d1deefca96c
[3/9] arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2
      commit: 92ccf83b8d58f9dca5752a824f0e81ac54665889
[4/9] arm64: dts: imx8ulp: Add assigned clock properties for LPUART nodes
      commit: c89839764bf17b76d6f53d5923a28bda140a46cc
[5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
      commit: 011242de59d0eb69e7b8a4f42dc32cf1f5d53592
[6/9] arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
      commit: fdcdcb8dd47e829f5bdb4e52ecce210e845ef4f7
[7/9] arm64: dts: imx8ulp-evk: Enable LPUART7
      commit: 35bdffecf91b8f31a526116d488022fa0f5e09ad
[8/9] arm64: dts: imx8ulp-evk: Change the values of some PCRs of ENET
      commit: 7108abc25f3b6f97e3098650924816ccdbc06367
[9/9] arm64: dts: imx8ulp-9x9-evk: Rename model string to reflect die size
      commit: c4e8b643c83d4abfbd92e7161b4975f670eff0a6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
