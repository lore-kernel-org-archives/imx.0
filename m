Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F453B776D
	for <imx@lists.linux.dev>; Thu,  7 May 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168805; cv=fail; b=F3XCQ0OvyawPVFz0a02GxC/VldkqMG2cdjZiYR+6YD83d1FuuCLIHZCEqGTlyLwaJ7fX0Tzmv5e7kq0LF1YoXx8Dg7aQ8gK8VgTrXRrO7AxLJF+D8cgruEpvhe928bwqDvh9MhKBwXlPisy65/rKxrwqzsciJYuFKSua/r9l9pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168805; c=relaxed/simple;
	bh=y5fB3pi/ZR54mCZ8bmee95b2DdSdZtLvI1JW8Cn5k1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=EddrWCphND07Kahcca8tzgQAazGeV43Rys4PYmeiUDdWvZeBdhWdQVbQhxaGcojdP392S69CSh5FozBDZsy+WT6FBs+r6WsZwi8KahIHpDmjFu5OBH5lU0Z6IV/zsoQw5esC2vk1mXFjyl5vs1932mE9FOGcD0fG+hHHpGXk5uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PXf9mn11; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PXf9mn11"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLOKNf+N3yefrxOQxSAG+l7FFe53ieVzBOH6dlPfURMOmosuk7PY3/FIX2gE04mty+487NrD4e42R834o+Tn1AsEIxvPwFN8x6Yz5VJ2XtPF0HWpd532cw/WxgdUgifnAbMfRnOEVNpOFwp/Vzu+ZDGJy4nwPNVLwtZo/5Vi8Fs1PzGr0n+aMPwDDgGv8QBYYwxfVxtYLBI6J9ywfAs4jAwuu+oQE8+WDLr12amzlz6tMqO5mQ+FRm8/kEXJgMfHynu0wWyOKt6Ah1qRTPY32/yXkyf52AYzQGpKhXGRl+xvz8Oo542er73X0bJKHHJSDrGiNmX8jmLkJaj7bMcnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=in7f4Pj3rNEPrBIEzyTXEqm2kB78Ei7cGe986hGvVSU=;
 b=Yr4S0WOnj1l1o9NVKFMSQ+qnnu5QWSZU1xjKeiUZ0o0UC3qwEqynrMOKMbuJYfk/By2LEYNOgNfzo0wg/RMccQJQpRC+T0POEGyY/H8AqRqrAOUojsNi5vSIO8p5UUjWb8x9cf4wuD2iY3s4m94qMid2MI8is6j1Ka79bDQZLBk7oEu9LoBb+oIaHsKEQP1Cy9h39ZOYA315Q/W63kzoS/GjXUJg6+4JDfyoAqbOEwJd/rFrJ6aFeTcTVd85KMJtTjQmPsWA1CUbwxuTDfXD50GnyiqRFbWkF8nB9+NfqvSRKGfDD7+nTcqDb/6LJTFIMgY5VyTqf1pbhOuHNeRirw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in7f4Pj3rNEPrBIEzyTXEqm2kB78Ei7cGe986hGvVSU=;
 b=PXf9mn11l4j+IkkDqJ5/azg0AkGOO5NYOtRQU3PSFeYJV/m2VHAqQXF2yNB2XvvQXykvT+BggfgdfjFhj/2gKVt5XSAmARulDO1a3PPzzqkFxmzuK4Dum4DuUNv0kUIN5r4253tL+DtybbvPOVoglEt8ZfSxzsy809Q4ma2ZzgqJQq95jkX0Pjnjjq2uEqXgD7lPz56+Rmzr0+r5rnt3Qp1cJS0k1Q+qGiyPuAJbtBWP3WN74mRkdYyJ9T0nG+MH3KOdab2k/n/eGTA1xjn8RCiTXiec17R9Sr3N3SLBuUvvMJxD/2H6cgjGu1nflsZ3cGBezEFSSsDa5B/NWxrVVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 15:46:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 15:46:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
Message-Id: <177816879666.299775.3947960528231798400.b4-ty@nxp.com>
Date: Thu, 07 May 2026 11:46:36 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:510:325::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 33715c34-7551-4ded-8f4b-08deac4fd42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wErEYCDwFwsc/9r8J73L+QVKLMfusxhIKtTUgHoCgce+bzKG4npWZgSy//ZP0kddGE0NyLB+FVuRQTuA9sop/K4GfgU/Y9K88uc8z5iwaEC817k+fMydKbJezIoKSJsb+TUxXOYurOx6AL4ZElfKtOiI0bIwGpljOmMlA5l+aqXA1wycR1OEoqgDQBw2HdcqQA1ilKIY+ezbHx8dlG5V+9dTWJfOV75k9ua4gurdV89N9fV/9BTdcJITn/aPNbxISBS5UA9/ziC2oULSTV+4HDYkC+0Xp0L/oWBOR2zfe0q811FHKFRM1FZtHIUNjDYIR7CGZ6VR6h5dBpumky9/Q+6kKwqofu1G7Mu4XgQ8IDANWmdcWoumY4pNVxNLA4fcoy7J3mdqrnuALO1+aFI6GM5LTGQgtC25eUwm2ozby9TVOjM6TUHVe5i2rnRIyhXgnX0yvJSYXO5LsyNGCX6UishbtkD5r63W1NkqX3LwIFLHvZ02xCIJn7Zf1IBtVip19JfyDecKibLJJnhl9f6KvX1fGElRI6cb0BXLhKGbv0GfHz25o++aTAUelZAunF6V0cbmBlP8zxKTN9m9osJlM3rJbLgEvm7EOW62z6o539cNKyua/ABjmFG5gAVakgf6KGrip+UTDnCgrbJ27fvun9xhb6AgdDQPcZXNFXZSweDPh58i9IFDJ81pCPishkshNJncm5RPpZbDhzEkm42LPaho+JW1/6BxXoXWxtD0y99KBhdIAKbjA194ufL8TGTF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJRdjNYUWFSWm5vWTREMFV4YWdJVmNLcTB6c2F1aUEwNDArbDlINDRrWGxH?=
 =?utf-8?B?SUg3dWxHNjkrOTc3Qk5wTytDRjdKNVp0NnFBYytnQ2Mrd1EycXA0OEdES0pB?=
 =?utf-8?B?OE9SK1VSSGNyWEljOWtwak51YkFySUFQSVFXNUhhQXIxMkh3cmhaWFZjK2hv?=
 =?utf-8?B?YWdOcFROL0EySzVqTHFDcmkvYU1PL01CNmtLWURkUEJyVEVZMGZNYkhLVVNW?=
 =?utf-8?B?UjZaQmYxY1BFWDhMRldPa2QyTXlmL29uMzZ3ZGxSczhXSWtFdGhDNEN5ZzVW?=
 =?utf-8?B?R2c3cXhXa1dlbzFTaGdwNXJnS0FXRUlxVG8zTWlOYVdjYmI3bEZWRGRDbjJK?=
 =?utf-8?B?eTA1RHU5RFhBN1puTU0xdDBHR0FyTU9hQTZHU2lsWFNoTE5IaVNhbjVkZGg1?=
 =?utf-8?B?SUtKSElab1NjamJuWWdYaTNzQ21BODRpdUJ3dVN3UnBXTWdVTm51KzZncW9y?=
 =?utf-8?B?RXhMOEFzV0tBODBVV2hxUEVUck91ZVp6MnpWU1kxbmdSNlZNRURLbExWNnpO?=
 =?utf-8?B?cEd1K3lNZ1o2aFRseGRqOW5rR0RKSnkxZlF3QnBqNklOY0pRWE1Tc3JQK3ln?=
 =?utf-8?B?ZzJuc1h4Y0tCdisrcDBrVEowblBLeWttU3JiSnpNUUx1YXpvV2ttajdObWJN?=
 =?utf-8?B?OHFjaDRlK1lKUGM4bVNRZDAyRFYxRjBscDVqd2lDaU5saE9udGJDTHMvaGVa?=
 =?utf-8?B?S3BLc1lQcXlLRHdKNW1mZjhpWEppenVrWEtpWEU0bkJJR2hNVU5oN2ZvenNk?=
 =?utf-8?B?T2RXbGh1VUVwcDRaMngyeksxcVczWjFaaFVuZ2dyWlhQdXVKVUxIY0EzaE0v?=
 =?utf-8?B?R1hRcjRhUFJyNFhCeXdVZGtkYlNDSmNFcjZzeHk0ajI5YWpoR2V2eGVxL3VZ?=
 =?utf-8?B?K2RydFpVVnJ6Z2ZvaGh5dHBEK2ZUMGJTbGxjSjYwT2x1QUpySzUvT1RzeUpF?=
 =?utf-8?B?TjRTRDZvT3dLTVlhN1ZHbk1yWTJZN0E4czdXSVZqZnE4SzliUjJsbTJ0QUll?=
 =?utf-8?B?d3dySStnbHhHd1FSblNkSFkyVzlNZkJKUDRROG11bWdieGhOdVRET1BjQkg0?=
 =?utf-8?B?Qnk1Y1lFeEVJY085QWRQMGRwem8wMyt1RlVDTlduYVhVTnJwRXNWaHlZL0Z3?=
 =?utf-8?B?OW1qeklRU25XdEFNejBVVlpuNzA2Q05BTlZxVVlmSFJ1cGpia2ljM1B0dm5U?=
 =?utf-8?B?L1NSR0d6L1FlanZQNk5aNzhqeG5vN3JzcG5ld3FsTlpYa3lZckdBNURYSHhh?=
 =?utf-8?B?enFodUtYYWlXQm43WWgvYm5JT1ZrakZHVFdBRGNteDNSZ3lBcUVVT2MxQzF6?=
 =?utf-8?B?ZEwvL1U3K1NoNW9xTEt4Q0J1aDg1ZzJQdmg5Zko4WWdZbzI5ajk1MW9wOG5V?=
 =?utf-8?B?S0JrbWtvcC9PYmlDdHBrR2JrMlU1SDQ1MVNyenpXUEhmUWZoeTRDSDJET2hx?=
 =?utf-8?B?WXE5UUkyMFhzMGhJNGdCVEt5bEdISG1FNDgyREgvTHlJS1N0ZFdUYkQ4cjkw?=
 =?utf-8?B?aWdTTjVrQnRLVEg3d1dOTERyT0xJakRTSGg4NWQwRTJYejhyK3hKb1NPNVBB?=
 =?utf-8?B?SVUwK1hibzRQTmZhRFpJTkx4Q1lKQ1hudklZMzVyTWU1VHU5c3FUMktzL0Vy?=
 =?utf-8?B?Q3Z3WCtvTWpXZEFZOGxrRW9ITVk2Z1Q5K3ZUMW5BOG10SSthUnc0OU1nQjEr?=
 =?utf-8?B?MnN6SFBRNkhyaFJsRng4REtvVlV3dFhuWmtwZXYxVnRLak1MMUt3MUV2Um1Q?=
 =?utf-8?B?K2hBV25kVnh5QXhUdFFldmcvMmQ5Y3B2bkt1SlJOMUd4UFBTVGhHODU1S1Fk?=
 =?utf-8?B?M0htazkxS1JPZGdjNnpmZDZpYnp5VXQvY2MzMVg5b1Z6eGVQSU9KakJVWmZI?=
 =?utf-8?B?ZU10cWM5UFdsZ2Yxd3htUlMvQ0xjVHRYQ3A2ellSeG5ad213dVdEQnVKZnRZ?=
 =?utf-8?B?TmxGSlRiUjRKZ0xqWmdVUGt3dE5pazZQTVJzNVkyOWtKUzd2alRzWnZyNWJm?=
 =?utf-8?B?S2EyendtSTZRQlFraVZFL3NNVTErOWF0ckhONkhLYXBCOGF0bnh4NjJxMldy?=
 =?utf-8?B?VUo3clR3elAwZGErNlJxZEIrRHdBWmM4ZC9Ldm9Jai9HUzQwR1BWYnhQOXA2?=
 =?utf-8?B?eEVFOHJoYmxTcHUzMmJVTE8waTVQMytZQ0REbmYzV2l2dWI5YitmT0VtMm4x?=
 =?utf-8?B?elQ1UzlwSmhKZVo0Q1NvTGNZUC9Kck95bHR2RGh3cXZucGQwZ2MwWmhkQTc4?=
 =?utf-8?B?Sk52c0trTWlWYlNiK0lvVTV1NjcxYXJzYm1wRGhpSHhBZ3NObURpNm5oSzNC?=
 =?utf-8?B?MzZaNzY4Y096YVhMK2o1b2xXN2dnd29oNVZWNWs5TjdBVHI4U2RGdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33715c34-7551-4ded-8f4b-08deac4fd42c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:46:39.7265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg29d5yVUqCsOkRbCovD0YKeXv2b0m0tJyjJBlSVgyhYR0Zoj8aqWd35bKQ1tdjPq5820iguMGIT8Rn8kDpjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9154


On Mon, 27 Apr 2026 09:01:48 +0800, Peng Fan (OSS) wrote:
> The i.MX8M soc device is registered via platform_device_register_simple(),
> so it is not associated with a Device Tree node and the imx8m_soc_driver
> has no of_match_table.
> 
> As a result, device_get_match_data() always returns NULL when probing
> the soc device.
> 
> [...]

Applied, thanks!

[1/1] soc: imx8m: Fix match data lookup for soc device
      commit: 2c6821657ce3b3c85f92719ea81ec9f9ff27df11

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

