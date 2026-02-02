Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618930EF84
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061441; cv=fail; b=bVpUOa8sREul1QtspSGsgfTJ9s0juRjSR4bkqMlN5k+EQkbLOzXmSXrH4YG9IUZ7Pc1JJxI78t1Pik5q7lffGEd7i2bS5wHHSI5hRL3vpj6q7Op4BsRiUpiUjtczVIau3P7uqbZtaFSEr6TVN5lY1anqPJuXGXgrEU6XzqlC1X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061441; c=relaxed/simple;
	bh=9+UKdp4TRNsobozFIMJJ68biYN4cfyH7HC5ASz8mcdA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ceiJJNwcBwGweEashEoPrRI0YqydWjfOols4ZTtS9mL/FiAxPw0KS1Vi7hDArpQzFy2HrNF6SGW6BaOrkWxdBlyMQU8KsYJ2GPv4iQDOCEmOMeFN0az+TBeabOwj+S3UwTsv8hFLwAzS6BPsCBPfYGbPstz0VlXoaZP10EDRasc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZkXws3Cu; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZkXws3Cu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnZ3NA0fFWuT49+ZE9sNacQcnFH17E6hjHi/yk/upvE27/sRbTKqfC9LdJP2IRtSczAqZM2AvuuaW7ZbPUkonmdbwhTAoJM4z4zoo+VqKI3WPvHmPlrA6HTA484C+9Qobftcv1j1g8buTtELjSef/pFgFHRQ1QmFU6q7uTMIBJGFoXW1jLoMv2ApwtdGuYgwWAVdrsXLjIoc4p2Y+aQf+2FIwE5Ght6QiO7VYFuzk56ofyPeVG3asqJKDxpkn7Teo8vGOKZY1os96AiKXtKd32Tnj5RbRz8Z96amsyv4WT51RjkIaAFguR9cbZCuHw8OhWIf6VkTZuUwcW+vTjymFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LUEtj1gqKNxGlbe37H/EmqlecQH7VTbfnWQqMafA0I=;
 b=x+WBkIMUscJyOnyU1E+1atckplYwMxsgzRqg7pivYc5kbQlGOm97H7FExl38ihY+fQTd+WFsXScYQcYKvYT0gFIB6qwL4QnNL5CaorrykvBsXZdrd44CPk2kVXe7rP7IffH2/FSDC3l2iCCCw7x+atV4BpF763SXR8R7UaN+mrTCD6cFPTSD98xpj4cF1m/Wle1aV7cVDEq2ZCS5bS0dFBgpQkZ2xmjllte3f3KkLGLBEAmhx6vtFHdn5x9mk+ELS82/gSRS57cpRAYETC6+u/1qS//ySddzmb5MK/yXCwzgkXrgNKqzf+SR8cxUrohF01jtnYALcuV1pgcmskONTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LUEtj1gqKNxGlbe37H/EmqlecQH7VTbfnWQqMafA0I=;
 b=ZkXws3Cun6OQ0j+kyuaPaB/I+ccIejEMoFqlnjNw4OMU6lh6/rLHRbX53KAg9TvEPTjVpShoOhpMQLHjrBbIGN7RENi+xSPFG05ON0Bu7UdjLYqowvda7VxN3mV6m99RwC4aYKBRJHYbGQVPjT6FP1Cf1wurgulL80oWIpyBvbBGJwY7jRRy/5vVHZROno0EXWDutoLn0w3s9dlERLuloaFgvQuKL3yVZHxB0rdNXCY4ZZQDcWDdm2azTACcRLrwNiyJPbfhaoK6si4UgzW4t3sTl03yiBMWx0sFCoQHQcyWgWrV52pnFyevSUE1pkMtWN8L1xDMAHRKE2/LLBDozA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:27 -0500
Subject: [PATCH 10/10] ARM: dts: imx7s-warp: Remove data-lanes and
 clock-lanes for ov2680
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-10-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1131;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9+UKdp4TRNsobozFIMJJ68biYN4cfyH7HC5ASz8mcdA=;
 b=qtP7KNTeWzM9WIuAXhBYle74exuPUDpn6qQNuxu0ZOLAiilTAeHF1BgqciSKiEf0q/cIL8AVx
 IXWf1OUfYlQBGLnpgK2dydaleh54xOPmx750+K+b3cDc0DCItFA+Eob
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 384aa20d-cbb6-4fd8-8ffd-08de62936856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZLc3U0RDJERzZPQ3pld2xZL3VlR1l2Wjh0RGxFdTdFbEZsSGRHTC9ubEZ6?=
 =?utf-8?B?T1RZQjdCQXM0K2pJSjFmcXBvUlY5cm5uZCt1REdOWE9yTjJmTlFUNFFHbkNw?=
 =?utf-8?B?eStKYThQK01DUE9MaE9PNjd1ZnNXdG80UmNsRmRlNFpUY1FDNnRsdzczZ0gy?=
 =?utf-8?B?eEhLM0VaOGoza09CV1h1WE5zYzdHaUZOQWZweXNHS2pHaEVoelkrN2pEVndp?=
 =?utf-8?B?V3hNL2FHZGE4RXpjL2RNMXhabWgvWjBaam9oVjFuNC9EZDg3UVJXUDh0Wk9E?=
 =?utf-8?B?V0ZIQXVTOCtyQXB2SVNxamtSODI5MU1xZ1pwamZJOHJlWU9Fc2p6eFZFUjlh?=
 =?utf-8?B?VloyVXR4Y1Z1dUdFVDFKa2tvNEtuQVExV1JrR0VpNVdkU0RIcUFQTXFuak4y?=
 =?utf-8?B?dHgrbnZtVVlSNGNraWVJZzVYemM2dEJwSmE4NCtCaFYwdm50b1RIYXA0SHE3?=
 =?utf-8?B?dnJqS1BkNGlRYW40U2RDRmNtQ1JCV0VsWVd3WHZqMmozVDAyMldGZFUxUmFj?=
 =?utf-8?B?Q1JuSVhuVERQRll3SFdqTWFoclkyMzcwelRtSGx0UmNFQW5iYTN0UXZZOTJN?=
 =?utf-8?B?R0ZSb3FaV09NbEtpaEFzOEZXblJHZzYwY2d6eHRpSUE3SGFDbEo4Y3RlNGp5?=
 =?utf-8?B?V09EM0xGNUFRYnk2UGNvRDZjeUJHaGpEUmJxN3orNjVLK2NuMzI0TysvYmJV?=
 =?utf-8?B?MTRoR2o3V1VDQmZlUVgxVjRQRTAxYlNmcnRldmxSdGJUcHBDQlpsSDYzNWdY?=
 =?utf-8?B?ZlFPdDYrQmwyakZvb2pVRnVsMW9uZ1FodDFWbWNraG1KOGhWMDJTSTVPQXFG?=
 =?utf-8?B?UXAvUmhkQjJLQ2RmeThpVTdQVjlLbWtaY0ZaN3dqdEJEL3ZDUm5ERG1pRHBv?=
 =?utf-8?B?My9RWmVnTjZLWnZSQ2xOcDVwL0VMUmFmcUw5M3RWZ0JoQyszSE1oblJRcEVQ?=
 =?utf-8?B?a1dVK283cElkYmZDcTdSS0dBMWRLbUdhblNMNWlDN1ZxRVI5WXc1VU50Q09t?=
 =?utf-8?B?aU9LUi9pVC92VFlvNXhEVXRDM042M2xyT3BQeEZ3R2poRWNMMUc4WlAvZTFZ?=
 =?utf-8?B?UUlxcWg2MFp3ZVRwbE1BMXJrZUxjMTRmMHRCbFVMNVhQMFg2RDgyektNdko1?=
 =?utf-8?B?STVBKzJMd25mdmhVWEdWMFlaR21Na2UyMlpBT3B5K2VqanhMZkl6Qm9KdFpY?=
 =?utf-8?B?a2p6WkxjNDk5QzlnLzhIMktSRVdMM2Zjd0d1VDFsY1IxaVlZWTYvT2FGRCtE?=
 =?utf-8?B?TXpkUUI3dVRMN1NCOUtWOURUall6eDk1VjEzbDAxUDB1cmxqRkRCVlB3T2lq?=
 =?utf-8?B?bEREZXNnY1JyR2FqOWhGTDZEMEtYb2FIWkNaWUdDQVNnN2tmTGFvK1Zqa25v?=
 =?utf-8?B?UEUzeUZ0Z0pqM2YvaG9VaVdTZ1JyUE9PYWxGaHNLR1Vud09lSGgvOHZZcTRO?=
 =?utf-8?B?NCtpVW04RnVyY3FUSmFNazF1emFSaEhpR1VXYWNyVlErNERxaUtMcXEwWDFl?=
 =?utf-8?B?ZTdJVUdjQUJQVnV1VGV0N096MW9EbTlVRVVkYWdzamxBWW5oTXg2VFJRN2l1?=
 =?utf-8?B?Njdhd1lFRmxndktPb0pTS0oydkpzTkx5dzFMZHVtVytjVnA5bEhxZS9JUnJy?=
 =?utf-8?B?YzluOUdmR0YxSmVheHZqdmlackppZzVlTEtEODNodTJxOUtkQjdReThhZnVO?=
 =?utf-8?B?V0VSZk40cnA1cUZyOGFtQzMzOVNnRSs1eW1SVGp0MHgyOWEyS0hRV1RDZGZx?=
 =?utf-8?B?NENPMHVrWUI3OFZ1NEdWUjdyOWRjQ2ZuK2pkcmE3azMyVVVnY0pTUXE2MklO?=
 =?utf-8?B?a1dWZCtydjIrT2lTVHBZelZCb0pCMDYwMU9PdWQ1MStlOWJObGplRjdkdnJJ?=
 =?utf-8?B?cWRmNUMzeEo3OE42Q29EVGtzNzBLVFcvUkJ0aFU1MDl3c2NENXVnSGRPWUpS?=
 =?utf-8?B?cHZUbUFKd2ZBQWRJT2dJTmpnN2l0ZjJFMnNLamZJTUNKeUtkSitYM0J2RFFU?=
 =?utf-8?B?elJGMU5EOVdGM0RmVXFld2ZHeTNNRG1JRU5YZnhoZFRIaVBMamxFK1dwSDFw?=
 =?utf-8?B?bkQ5K2ZMdEhPTWhQTm4xM1V1eVE4Nkl2Y0NJb0pYdXhBcG9QdEpWL042WXR2?=
 =?utf-8?B?V2swcXFjcU1MYlczVGZDNFhuNnI0TkQ1TmpPdE11U05BTUs5VVNOWG5pMkZ6?=
 =?utf-8?Q?xj1Sc2u/+Ni2YMMABBQrXpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXp0Ykw5bGxrMVlJaC9BdXI2ODhpbm9mR2xPbTQ4dnZ0bzRuTHpxbVVlbTYv?=
 =?utf-8?B?cWwzNzhjaFF4amtDUEJ5T1pkZmpucldiL2dpZll1cDZteTIvQURxK0NlSUtl?=
 =?utf-8?B?TjRRalNEWitqUm5sVlJBZUs0U3NYdmE1ZlBTcldFMHZTbDAyNmhlajl1Z1oy?=
 =?utf-8?B?bGtwNWloSTBCcXJFaTBYRVpYT2pCT2VDRkMzQ3JkMjU1Rkg4dVROUHc3K1hr?=
 =?utf-8?B?RmhueForUkVMOE1EYmhHSjh4YmhiL0MzeXVFdldCT3RUQTB2cGFwSFlSQy9G?=
 =?utf-8?B?NUpURWx0cUYrQi9WY2hmNmNrNXBMbXZIQ3dBNWNmUFJPTkJJQW91ZWJaUnZJ?=
 =?utf-8?B?aEZxWmJ0WURObmVMb1huLytUdGs0cWcvNjJ2OGpNVkh3NDhTb3pBY2NLKzh4?=
 =?utf-8?B?YmVQcFplMjZNVk1ud1lBaExQT1dRLy83WDl3djZrMzVVUG03ZU92cmY4UFo3?=
 =?utf-8?B?OTdhbEJ6bGJLZ1A5SE0rMVZvL1AyMGRMVlZPcC9NbTJkVzh0WDJjVkl4ajVu?=
 =?utf-8?B?dTZBaUxzZVBQaWVEaWpnWWlJYVpRUjRaM3o1bWFGZVNESEEyc3BCV1N5L0dY?=
 =?utf-8?B?Q3IvSUMvaWx4eGovMXJ2S2pWQzl6QmVCUG4rUnZWdzdvL3lna0NncFhnL0Fy?=
 =?utf-8?B?QVgzbDR1dElqbE5pcUF3bHhqcys3ZXFOUWQwTWk4T3ZMMDc4akFoM1BXcTQw?=
 =?utf-8?B?Nk1WNitEbWtpc0ZwcVAzWE03QURoWmtTeGgzT1hWWlZha3BRYk1laWV0cnVN?=
 =?utf-8?B?Q0NLN2E5Wmp6aDV1MW0xRnlxbWx2UlhJSlJxdUxRZ3VwQndoRVNpMW14OWo4?=
 =?utf-8?B?VUpVT2NlWTVKaFh0L00vaHB4NVMzbmt4SWM0MzM1MERHQlNYQTZVaXlWcFdM?=
 =?utf-8?B?RjlUVlZhTmxieUdGY1lobWVzVmJGU0F6Z3BvQTdtK2ZlY2dBOTV6U054ZXVO?=
 =?utf-8?B?UFIxWFZjZm8rUlV5TEZtcU4vK1J0Tkoxa1V1YXBZZElqM3FOYU5VRCtzdTN3?=
 =?utf-8?B?Z1B0M1pRSnFqSnNoYmJwWHVzSUtZSVZlNXdpSnNhaXZBNER5Z1Rzd1JMakdv?=
 =?utf-8?B?cVI0Vi8vQnFQaHlwaGRnNFBBblFoZFlueEg0dFlZMkZPKzVvNkpxSnBHQVQ3?=
 =?utf-8?B?Z2hNWnRaMEdZYjNRV0o4ZTRvamF5YzhuNlErMXBzMHFaSDA1VHlaSHBWOGtU?=
 =?utf-8?B?WCtrU3M5Nnc1b200YTNod3dYdmNBMWZ3K24zbGhRTUsyb2x0SE1DczQ3SkNh?=
 =?utf-8?B?cUl6a2JzdWtWTWJpYU95QXFxb2E5bVUwbHM3cmpPTTlhYTROQlU5a2VDdkZv?=
 =?utf-8?B?MjJXaFBhVHFlclRLUFlyYjhLUDRRY01WbXM5NThLRzVDUnllRjAwVHN4Vzg2?=
 =?utf-8?B?R3VLZnN2YkJEODBNdG9zZ1VKMWNxaStBNmZNVy8yU3FNMXl0MTl2NW0yVTZw?=
 =?utf-8?B?ZXNmWlZIVVJsMG15RHRWcTMyRHlKOEtDRHNLTWZTdStsYUwxUWV5Vm1EUEJ5?=
 =?utf-8?B?YkExTFlUTUg1MHNkOCtValdpRDd0bFJ2dDJETytxRGMxMlUycXc5N3dOVDdh?=
 =?utf-8?B?SWpHSk50ZTBaOFVTY1dMUjJyNVNXM3Y5Ny9HMHBkVWdoVTd3WDhJVUVBbyt3?=
 =?utf-8?B?QVJLb2dLeXAxN3hOMFhLRUtMUFZHak1MbTEvNGtnNkNtVDhqc0MvR0dsTFlS?=
 =?utf-8?B?dG5MWUhPV3E2cWNSMWhVMkZCeDdKWnlUb1lEOXpOVmRINmRHVy9ESXcrdnhm?=
 =?utf-8?B?N3F2RDN6TDRvVUUzdDhETWdwYURXWEZQVi9jUFAxRFFXWjFUVHFlR1FyMHZR?=
 =?utf-8?B?aGc1RWNlajhRMVJvbTJkdERPM3pUbjNOQ2lZay81TDBGaUJjd29hMlhJQ1ZW?=
 =?utf-8?B?OGxvOTVCSitKUHM1YVJzNWw5OGhIeElVL1NVVjArSlZjYm9nZ1JVYnNJQktD?=
 =?utf-8?B?OVIrUlhoMGRUMXZ0ZU8rQ2ZOTkRNa1Z6V0NNRTRnMGIyNWFZM1NieGtFS3Rm?=
 =?utf-8?B?MTZnWXltNVMrR05FVEExd0FNRHVwVDQyNHRRWW9EVUJ2Z0daZWVlM09HUVVw?=
 =?utf-8?B?ODdYcVF4NlRCYXNSUDc1UFNmYTNzcnM5VGFBdE1GRklsaHlQSHFJTnhkSjEv?=
 =?utf-8?B?TGtMVkVYckVFL3RhaXd1Vi9oLzErL0dtanlVRTBMT2o4eXdHb1pNL1lQWE9o?=
 =?utf-8?B?WGIxbFova05RMkE1eHhpSy9lUnBjaEQwdHlvTmFrKy9FekIzaHFuajBPbDB1?=
 =?utf-8?B?K1NWUTlhTkIySXJRak5aUHZYdk43OTJDZWtwaVdPVmJMRmhRRW9QNis1VGI5?=
 =?utf-8?Q?DDb7Oes0qIAMXvjNOY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384aa20d-cbb6-4fd8-8ffd-08de62936856
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:58.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGbEXGjt1L9dp+moG5JGKVArZKAVtg+iDSr6HO0S+rxOEXkQfV4SU/KqpiCAhZMB/IAwR7iGdOt5jsxD+mZ3DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

The ov2680 only support 1 lane. Needn't additional property to descript it.

Remove it to fix below DTB_CHECK warnings:
  camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Previous binding update discussion [1]
[1] https://lore.kernel.org/imx/aPiA3G9x_RsTL9Mv@valkosipuli.retiisi.eu/
---
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index 92b6258059ee0150803d960ea076f6301ce1b209..25f38acc53501b0f0fd39446e0e016ec6fb6433d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -199,8 +199,6 @@ ov2680: camera@36 {
 		port {
 			ov2680_to_mipi: endpoint {
 				remote-endpoint = <&mipi_from_sensor>;
-				clock-lanes = <0>;
-				data-lanes = <1>;
 				link-frequencies = /bits/ 64 <330000000>;
 			};
 		};

-- 
2.34.1

