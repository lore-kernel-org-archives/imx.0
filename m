Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9B3009D4
	for <imx@lists.linux.dev>; Tue,  5 May 2026 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012463; cv=fail; b=ZNpIfCvuCc1PkWBMtg0/ftrYr5pSWI8TsFbohOQY1dNZN9v5oIGESy3YuGFOScEbcOPZr0A2+WyJZIoHmsm3q0lWZ96oRfu8EgAmLF9IWKCKucLgAr0YtXOFVeDfxmimxP2nhxGPopi/6fGkIOSxovCvMGEm4SWkYW5kawJofU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012463; c=relaxed/simple;
	bh=JIwgMzGhD9Gw3c1eQt3L9ENx2lAGhNXx1H/XMZVsjOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=ZLpnmRgwx4/kXVjnuRn+QUSjIH2IUQz7Rb1boBmrwJLw3KMIsg5g98+O4us18kr/+eCqtnrVnkmgvTzDy127FPgq9GxHJYEg/vC5p0Dvt7pXn5xwiS6JZlFihcz6wFvAI0IfAhirOLq97Lzj/sIvQJ8+Qd5oQI1xifinZtmfa68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aHEOdx65; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aHEOdx65"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJzx96lOBi49wlthXBeBZlviz3iyryGm/5tXhUqAB7b4NEg7UO+rfrEw7876HD7J9/lZHepCoAvMQmWvMtgJFQOIAwFqDRwaoPoWxMCYmIiQRFk3rX87UBZyUNbhtEZQXAmvzyowM3uM+kn+H4tCYdAfJUJZPl6cZE6kXQptz4xjbTgGtPrOt+EGGUt5dw5D4jy5S/1encWKt9ew0cqI1ZoLPC6BvAf45CDueyiCKgceb36GU4ZTs83nsvq/aBThHXRm7PhyQ6SvShZOGoPtSKxisDspb5426/ps5ek2Q3ZoXXdJpxGSvdxUJqfECY2hCgZpf+ZbY8er5FWQmSMFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ugxYi1RCUukXSfeokKaRQIXTswYyo1s4/khAJguSug=;
 b=MOG4ZhKyP/uRROtln2UWO2NFTdLo++3DewlIXedGxe/2PDPppXltgZmoyGc2rSDAPvGpdJVM0nmy1MTKC4Ckp2IibW5oAa6IAYZYWWvSZ8YtsohL6quHTXuyZYPczIL8/MCpZhQOEwdGfn1gS3Y51I1VsSPWABhElboH8dy8GzfENLoLgupOUQNaNehyLpR8KrY3FXldQMGpUtVbj8EJ6in0vvx6+maI+hvBPuGSmKhIOhHM+no/3nVR+kloTwzWgKtj4ZHRnqAR9wwZ2PHnkAHE0GUjlH7zitqHS4AJpgK/rcp0PsXvEoDPvTklB/NgyQ006RoqSIzjIUrje7rfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ugxYi1RCUukXSfeokKaRQIXTswYyo1s4/khAJguSug=;
 b=aHEOdx65qcSW6suEYOm6RLoqaBd6zwfKKU32Ut01N3fof+K51LTb1eTH4UIAruWdGuyJCzcXHWKwgqCY2XSFyQtR34GmmNG9xEvdLzRdprCu2X9OB089y4fo9LZwh8cSMYwvr9o5uQzmUtNaXHYsEo8q2qlg8/6lRCKyYEpDZRvZUtcfO1sliwVv5bUlLM8Gl6V5nCnpUMvo0WThls4uzueJi8HWw27OnupCeL2sBTclSDKqSCovd0Wr27ksvNgrzEEU6F5zMCvctoUw3vzhphFaKjKvVi5T2ZfLggjg7SIS45Oa/SCMKGdpoKfZkgbm4vaFlH6EbidLthcg6cuhKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8257.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 20:20:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 20:20:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260409111100.4177389-1-alexander.stein@ew.tq-group.com>
References: <20260409111100.4177389-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Message-Id: <177801245629.2093840.970300045284068399.b4-ty@nxp.com>
Date: Tue, 05 May 2026 16:20:56 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P221CA0046.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1d3b87-b234-41ea-eae8-08deaae3d1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|366016|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Eu5ac4QsyOFhm/+3KCaDRSM9HdCmiIc0y+0+M54pXDckpvXi+QpU5KxK8E4S3R3EtVaOkeV9BOxQyrRZrN7DytYK12EZlutYoTBkc2c4aVuQyMw1VFWj+G4r3q6j5nJOYuCBCrHWQeNHYSg6VUglmNM4Td1Ld+iWmJ7mSPEfwJBAX5WhnXIpx6Y9ThV0o4PzvaKOMHd/pYNlOXTOr1UV+vhf3pTfpW5YKUR74Zricy7olBpJXu0sqgbcz75jdQvWH6MICB57vVJ4F56u9upPEZtfQuCFvQaRSmMfKZmhq0GOE8zrL+1Pu8cKmTbB/5J9KW5sPMNTAhS6c5Z/IokVpagQg0LySUEk3eU5bA732jO7+IDK7S3olEgIQQ80acCTVax+RXEZYhRtxaCkPePSqoThA88M8Txt1cHI/ANS5cWK//VVr9dIg1VpZe17YtSdrdXTQlGiqGT7myY2Q92Gxas0wmrrNxTu2i2aCJXMcYqLJCY7B0dn5r/uUz4mcpIPWi1WqzQmJk+5VlA2hNCZvpl7bMDJhS/1AnLsrnoYc0uUGpW5wrAk6havZ2YPzNsmLiCANhJ1PLy3ZzcAp4EAcE/y8l+PceSq59b1hS9HpfvleL7iugu1uO1/psL9V2QRupzZDaWaeP+C2iehK9KWwWyqLVvuvFAWRJXdF/TS1qb/ja2HUlPuB22NiPXm3eb1y3t+vidiZHV+assbZMzBWrcB/ujZPO/sn28Oer5JwLPD5CjEifahsQCqfkNdCS5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(366016)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTE2VHVqRFExVDJHTGhEWnBIWlF1blc0UGxHMm10bVZKTTdVeVJDZFZlYytG?=
 =?utf-8?B?R1p2eEVYbWFMQ2tpNHNJT2FNdE5qVDNycnRncjlOZzlDYlBzVmt3Nm5PK1Rx?=
 =?utf-8?B?VytEMEorcGdLSC8vTmN0SXRRSzRCcXl2blRWdXBmTzdndnF5N0xnMTZ3bm9v?=
 =?utf-8?B?cG5mRm5rbGVScXB1V3owaHFCakJpdVJRSjdZLys1ZUs4Q2VZS2tiN2dQWk1z?=
 =?utf-8?B?clF2MXRaVTRxNFJId3hzS2N5Q1ZnV2VNaDJLcWJGUStrK3JYN25IRDZ5UmFP?=
 =?utf-8?B?dm9QVGpjUFVHSEpSNVUyQlY4eFVHcWQzNTFlck9RdWRrZXpYSTVsL1J1VTh1?=
 =?utf-8?B?dWVXSFNLaEphNkdBYmUzaE5oVHptSGtPRDFNVlNIZHVIRW9RakF4U1NxZWNL?=
 =?utf-8?B?QmUwb2xqQ1BDZC9aNTU4cENyN2JwZjQ1ZXpiZHRhcXV0T2FLSnZDdXRRNG9G?=
 =?utf-8?B?eE9mTDhkemZGdEorUi9NMDRlSG52RDhBOFIxcjdiVjdxK0FFZEdvS1QyT0ts?=
 =?utf-8?B?bzFiOGxKd2JFSkVnWUVEQ2U3RlptQXJodzh1bHJaTGE5dm90MDQ5YU5pdk55?=
 =?utf-8?B?aDNXTWN0ZmZqanNqMk51M21xOHJ3cTJuWWNoZUFiVFhVS3JzNXc4b3dDbnJG?=
 =?utf-8?B?RStldkNIanFVWlYxWEZxZEJFL2Fvb2JRR01DZzV6L0dPRUpGS1RBOG1sTkRv?=
 =?utf-8?B?Qy9ITTBQRDdiTUYyM2hZNFBIbm1LWWNnaTBRb2tnaE4ycVN3OFg1bTlKODdD?=
 =?utf-8?B?dytMWGNWb04rY2YyZlNKWWhJTEJYV1ZUQ3FzajdwYUJTYjFxVndmSm9zOFl1?=
 =?utf-8?B?ZW8wYzZzSHlCY243RmFhNGx3QmdKWEt5bEs3WVAvdGROSVdzNS81K3ZUVlo0?=
 =?utf-8?B?MDlRenBLMnNJL0V6b092c0xtZktpalBKbDRENzNtdE9saUo1R3F0SU9GbzVI?=
 =?utf-8?B?ZElHeEk0a2JQUDk2Wm9YRmpEWTViSU93eTNMQkdPdWpYemhjUWlsU0M3NERa?=
 =?utf-8?B?bGNIalJoMUx3bmtEZWxPckNGRXdRNmtWZlI4MDgrTDduSmRsWTE1c0s3RjRw?=
 =?utf-8?B?N0VsSWh3b1ZXc0U5bEZTNm9WMDZGb2VKbkZ1TE8xS0hkUEhwYktIRWxXeUNK?=
 =?utf-8?B?TWpQc0ppTUhVMXpNcTRaUDE0N1FmWmxDT1RjSDdGOXBJeHdGNzNFY1d1UTQ3?=
 =?utf-8?B?MEp2ZExRWUdhWW9mL0xXVnlsTVF0MXZTSjZoUTJ1RlB2ZmRxS2pJSmNTZGho?=
 =?utf-8?B?UmRZWTlMd0F1aG5zd3ZPTVZNMi94WGliMGVRNmlENFhSOGx1aStkZE1tSXNH?=
 =?utf-8?B?WHN5MGp6SEVudG0ydXo1ZytCVHMyamZHMGhaNWErVzJwSmtEd3VyK1R3OXdz?=
 =?utf-8?B?c3poRE52SHA2L3BiRlptSUxGb3RDRUc1dVh3dHpwK1JKWnowZjU2OWlLdzFn?=
 =?utf-8?B?WFY3VCtFdjRCdFJscVFEWVh2SUZ3YUpTaXJ4MVhqaXBkQWdZQ0VodGxBa20x?=
 =?utf-8?B?Wno2bktaTVVpL2lIWnBwOTZzL2V3WExkaXJzeUdGb1J4dDdvSjMxbFRXU20r?=
 =?utf-8?B?ZE9ML1lmYldRdmlGMjhkWkJGZW9GQzVjMXBwL2ZxTWpnMlRuRHg5RU5OV3kr?=
 =?utf-8?B?TVBWdWJ6cnpuaDdJWUdkZnBVNUxVbjgwK2ZrY3Z5ZXlpUDhVNnh2d0tRR3Fu?=
 =?utf-8?B?N2U4dDBqb3U0bWdCYWk1RHZ1aEVZazFoejFDK3ZLVzZodmdjTGZkS2VlVGR4?=
 =?utf-8?B?OUtXKzkwTEJkYUpLb0lsWnZtY0tObkh4MmE2a1JJRjdJR2pZM0tydW1QQndW?=
 =?utf-8?B?M2R4Z3lwMkM5TDVaS2w5NHptbmM1TDZyVi9IRXRwMEhWVmM5K0k0eWVGRk03?=
 =?utf-8?B?VFZoSmJKOVZ3YnR4aWp5VU5Hb2dpVGNNTmd2cDgyMThxc3JIOU04Y0NOaFdW?=
 =?utf-8?B?YWROSzZFdk5yWWMvaGRyTVp4Zm9ySUh6dXNFUkcrS084L1B2UE02djNNY3FX?=
 =?utf-8?B?bGhCK1dRWm02ckZrTlF5ek11UTdWMnUyS1J1bXdSZHVENE84d2p5UFZSKzBQ?=
 =?utf-8?B?Nk10bythcHQ3akFzTlZyYThya1Vtemp4c3Mwa29ya0gvditsQ1l2UU9MU3Bt?=
 =?utf-8?B?M0NwenVMNjMvemJUTWV2Yy84SnQ4cHNINGNHQ3I3aXpYMkJLMkxNK2pWU3FT?=
 =?utf-8?B?dXVFK3A5UkRIb1cybElxZHpyQWUwc2lqd3RLVXY5UWlXYlhiNU00VTF1NUtm?=
 =?utf-8?B?MHd5RzdmRnZLUE1DYVNDcEJpdnVTQmZvUW1GODhZMjBRNWxwd0FxT3BqNFRD?=
 =?utf-8?Q?PD21lQpe+PtdGkEZxR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1d3b87-b234-41ea-eae8-08deaae3d1dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:20:59.0620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjM1bKLsSiSgzn0rTaLf9cBUX5Kro3OLkT5v3/srOV1Wzi8Kbf+1SDiFiAK/EQTBfmT/BSzD+wtcdimoQE5EVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8257


On Thu, 09 Apr 2026 13:10:59 +0200, Alexander Stein wrote:
> Add #io-channel-cells property to the ADC node. This property is required
> for an IIO consumer driver to work.
> 
> 

Applied, thanks!

[1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
      commit: a2407a8a42784f90732351dc9982ec3f6f67a6d8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

