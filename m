Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0512E191F98
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009234; cv=fail; b=YE4Bd661cuWiBdP3AYKPUq6M7/Ppr4p3HVuinjIXWGApK1Lu65iD8AxaNuEe0IzZEtZ4wxHHDa3UpOqin8E9dFUVPB/37+SxVLOxR0Wi8YZEgYbc8t9kYEiGTFH4h5HA3bHs2Zu8EPILv2YmL8DERes2PHS1zmeJ60mhvR6kLns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009234; c=relaxed/simple;
	bh=/16ngrOXIa8HCYJ+02LEndK4zyHBtaZQiewxxSM2MmY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=JU+CSe7fv0cIPvIcnQcmt7nNHUb6mmj/T1rfSDyZ8hRms6UO41sw9RLgG/ERMywXMxrSnG0yIevxBdslTZDyJ+pzHc7dDbF0Z2IngC8cfs3loxoXdqX980JBkEjN51ZrOEK2ShcIQAFDBLV0f3ymEq/qsckXaaiqg0h3W+559ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CVx3cLF3; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CVx3cLF3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+MgtaPrE8pp8P+Q1Yc4K+GX48bOgEOx2d3HNXJtA2IxsI8c9E0HvK1hI0/NfNKPyccrxXHcVQcvBaOomPL414w2wu5yrFIewDE5844hvEcSpNbVccAFyexmtkajjB4pwupzjimgXO7UA2dkUW8Mk/JmHK2aOWp/GNvliernSyQ3Y/MyVdiaZjXCAd35FXMO1UVtI/+PV8/iQvomsEJSrIhnKCaLRuk3K9cwErzzgMsmV1tBMvsmBHwWFa8AuwtoV4WFyNWagSSCJj3t/TcJ+zwkO1pDNFBl23b4OE1f7Zd9tFm1cPAqsw3GiNrvRtX8dMz1R/ukx5rUiE+Oj4A2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29EAF1xEskcw5+iaHLVuBt1iX+ANxPSobuu6LGpW9do=;
 b=RkgW3QR73dpnm/O/Y2LJQ5nc3ptyBqAkQmlFMp9Q8bTvWmcFMn6WNy2kh/0EKQtpcpayNo9dDXBESd6/n7NJ7LuZqkhzWoXcyN+asmfTfgutRXfsCEaGIkuaCBNLJW2E1RIBhYp/jF3Fc45RDdFSlRXcofAsmYwLQ0OMwOsjRai6f6WmoB6hGGIfRQ9dRXy3bFRqkFFcxSFUhdmJK3gpF3eIi2dIo2CcuDSC01UVjzGirpX4gU6HHfcSmjldVs+EB/e+Cj8znZwEx/wrnIXDBYqtVe9aTDN3C4xpXXk8esOGACy1aNsannhwZu55BcGvsewM80XeZyKtepuBdHu8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29EAF1xEskcw5+iaHLVuBt1iX+ANxPSobuu6LGpW9do=;
 b=CVx3cLF3n3SFNLDWv9ITwFRI8TI4ukIKGYaY12pX+AmCX3FIirEnQEmSOKHc2znL8TvpDILjvz+oTjHa+giOyoB316BJqE5xyP/xgOvd4+TbOGNPDPyJGY+j2amZH+ak4uRziaY7aVPFPHm2SjVxXby3S0MXDjW61ps/KcbMUQ0Fafbl9GcxumFZ/cmIhHxU3Gi7bsokDE9Lv9MF7ugbkY62Hq5dbTM2eqfxR4v7pCR0YAPX/CHWcBO+PZF7R0hdBzShh1AuiygFNcphGdC5GIg+hRKXmJc2u/zOL4vaV01d12MQXDOS2j75lnSzdft7xLK36plouW+xEffw/OHryw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11506.eurprd04.prod.outlook.com (2603:10a6:102:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:27:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:27:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>, 
 Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct
 interrupt flags
Message-Id: <177800922666.1949333.3026771485798556554.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:27:06 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:806:125::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11506:EE_
X-MS-Office365-Filtering-Correlation-Id: 70708d8b-24ba-4837-1620-08deaadc4ce7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|18002099003|38350700014|921020|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 b2JwgPriB+jkfM1ZhtIJTCUS8/bk3VKy3+4mJJnxBuNg0MFcORIZyDcUgLvk4KC9YEn1L47APNF/FyfPGbhdERHVWtmbwroPKuBoNETQPfgcoegdqL1/bIjlQWEOUtDZQsggWUYoEfBOgMhtkaoW0o8mJZmNce2yHU1QCjinkO6+glWZjHZLcWbA3EaotjJIAbV60YR4vTQ6D1+eyZF/ASr6BCAFxt3pQ03YeTFS+ZsKj2oSVGqPM+R57mJ+noM2zHTon5DaoTyvCUROkb2aqPmw8SWmvH+iD51ET8wDuhnJSEkZbD/kfAIF1Y4ZyHBX9hYCYek7MC2wwQ5Z20fTi7HeQA8tDd3MeB6yFVMLHTk3uadiSnshrs4iyLumY+j6NL/6G9NoCNxxdQYlKmUhxeaVEndPrCtVaSGdcLDhLlFfDGg5WJfiBXXj86l+aTxI+nvixnjWAfB2LfCS8f7kixsqKAB/go1td9JY4j/L1JBj0WAOz2B+HkZLCii6kyp0Kt4eAueabs9wH3oC+XxxGjAd6bG6/dOwMYC2NDfEvz+lwgOYLU/Sr2nzwZMy7J87qeiuQqQRoR6OaEV3H1qwpQM/51OTz/0iPGChAadhazOMmI4JPqZDdVaaStLrQuUFr1IvFdcnNA8aJJWxM2263wOn89P3iJd44ffpekMKmd5SD7+Keu1sQRaRj6lDJcfHP8NCasASUsVhKTwufgDbwgvaK/8V3gQhHqlGhuDt0E6KPVNALTB0kICNPaZq3aSVa0/EPmZPtYG7WPgAot5fdA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(18002099003)(38350700014)(921020)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QkMzZGtsTlI1WlhkcWZ0V2gzdkVuWlN3KzdGR1ZHWUNiTEIvTGNnUUF1cTJW?=
 =?utf-8?B?cXlKcGpzekFwc2FkN0ZXaWt0d1dWYTUxQTZ0eUR4cnNUWEFlK2JTaDJVRmxZ?=
 =?utf-8?B?T29NRGNRemh6ckJFSnJpN3I4SGNOK0NKQkp3NDA3eDZacDR3d1BFYUU4em1G?=
 =?utf-8?B?ZytINDJFOVFlYUNkb2NvK2FJbVBuMTl6dDBObVl2b2hDMzUzd2toUFRuYlY1?=
 =?utf-8?B?U25NWXhyaUF0U1Y3ZWt4QitXS2RSZkhEM2hLK28wRFJZckJkc21sTmxDMkJj?=
 =?utf-8?B?SXhoaG5lclpabngrTjliK0hnL2o4MjJTclB6MkVZcHBxRDNEaHZPSFRicGVq?=
 =?utf-8?B?UDVuY3lRMWhVNW5jSWFxQUUzbXZVM0Jzc3hUU3E4QkRIbjhFaHMzQVNOUkNx?=
 =?utf-8?B?MmNCUTk3djdmUmZTWms4ZWU1dVZ0SWFLRDRrK2NMVU9jbkUwTUphdUh1bFFH?=
 =?utf-8?B?VCtpYWJnUm9NWUFxMmZHbk5VOCtYRkxuT2lzSXE2dGZaWVRsOVc4NS9KczlL?=
 =?utf-8?B?cEk0b0VjcUxueitQdm5uL2VjT01TRE1VbFhRZUZjdGNLWVRwVUxSc1BDNHQz?=
 =?utf-8?B?WE9sY3E1ZUdUUWZLc1cvZnljVkQ5WVdzV0FVcTAwNEdoaHpick1kam5Rd3hC?=
 =?utf-8?B?ak1OZjZ2eDhsNW54Wm1zZzA3S2xPdlNQTGNjVFNlcTZYRnJoZTdGZUxFeEQ5?=
 =?utf-8?B?ZjRhYlA5UzNOcmRscVVKSzdBb2ZLbHp1T1pld3dRS0lLMTIrb2pzMkpFTzZk?=
 =?utf-8?B?ZGdzZ2RGeUVjYTgxeWVTQ3hrcGJEbGxxOFpOS1d6NHA2ZlpnT004MmhVTW1L?=
 =?utf-8?B?aEwrZERSdTdjOHBGYUtsRzcxTEJISVVvMjNRYSs3WkQ1MHMxWXAwUTh1anAr?=
 =?utf-8?B?bE9QVUV1azJPTCs0M3podzRnU0p3TlA5cmFVbmNOYzdoUHFYTTVjN2NIbXdJ?=
 =?utf-8?B?VCthRGpSZ0M2K2pHRDlYbDVOQXhBVVpNZ0N1bmU2Y09KYTZqN1lUM1BtdUpk?=
 =?utf-8?B?WDFZclhOUFloclRZT2RRRTZ6cW1aMWpZa01jVnh2bXZDL2hvSUpTYVBPWTdw?=
 =?utf-8?B?NWdjWEd4MTZadWkwa2N0K0YzdEE3OVBVeGZtcGl0TlFuQjFNaG9ZTVVGanVh?=
 =?utf-8?B?NkdGeU9NRlNFTEU1dEtTZ0tCRDRqMWtrazRndlRRcS90WTRJMlVaZjdvUDF3?=
 =?utf-8?B?RHByZ2NsRHBDZ1ZnSXBscjhKdGt0dFVuZEpKWGpaaStjdXEzZlZBSU5pYmtU?=
 =?utf-8?B?WGpYR1NacnN3MXY1YzFOWDNTeG5xZGsxWkZTKzhVcldPaGtRa0tQRlAzNzdJ?=
 =?utf-8?B?TlBQMlE4V2FTU2NYL1J1NWNoNjZRTm5KcjFqOW5sVStzd0FjNWg0YVdlV1Rj?=
 =?utf-8?B?WVRhajVZelR6VlhWOTJrTXVTL0RBQ0hnVUZrVFJSdGRWaGs2KzluWTA5NFdO?=
 =?utf-8?B?VmE2N2VCRTVNWWpaYllnRmFuTzMyUy94Mis5VGxwVUtuMVFzbkVLU2tTbDRl?=
 =?utf-8?B?RUdBSWNDNVFhWWxVV0kwd0lOZkVMSDJUR09XSW53cmM5d3N0MnZEbExNRnN6?=
 =?utf-8?B?RDcvNldQTEVjUEFFWUdibFZVRFhaUDhUV1JCK2VhNjE1cC9NZkVkbHdhMklq?=
 =?utf-8?B?TmgwYjZOQXBkVHp2blNlSVBKU1lmdzJ5dUhJU3EyVytCeHd5UVNNU1BDa2Ri?=
 =?utf-8?B?TUdCUWQrT0NYWXE3eHBNaDlaL2UydExRRVlDQlhSeUJxZzhoOWZmT0lVREVx?=
 =?utf-8?B?eisyeWVLRk1tVDR3VUZhdDNkSkFROHJtdGdoSzlXMDBKallFV0E2d2lkeXNw?=
 =?utf-8?B?OG1uSitxOGRGUlZ1UUZIKy9iK3hyNTNlSzBHNGk1Uk5NbkhmYzdKMGg5eTU2?=
 =?utf-8?B?L1VMZy9pOEd4b3N4YmVqMllqcU9ZR0xESUJScU9CWm5ER1dSaGhZVm9lWm1N?=
 =?utf-8?B?OU40bzJ4c1ZBdExkaDRjSlpNS200bkN4Z0tQMGtPclpwdFFodmtsTEdaMXZ1?=
 =?utf-8?B?WE9xOWpzQms4TmFKNHBLSG5TTHE3c1M4eVpLUy9MTlBoaFRDTXorMTVEV2p1?=
 =?utf-8?B?WmV3L1FoZ21kVUgvV0ozZXpQU0NZSjMrSmZvenFSeSs0Q0xZdlcwdS9aZFRx?=
 =?utf-8?B?RndycXozaWorbFMvNGZOVEtqNlZhNVl6KzhlUUg4NENseU0zbnhqeVlleXc4?=
 =?utf-8?B?MTFJY2pTaThBYWhtZnVOYVJmdHJrVTRFT1JwUVFDamRrVjAzNm9pOXJsa3Bu?=
 =?utf-8?B?Y1RFUnBtdm9GYUFFRVFEV3BjZE5uUnpIMFFIYlprQytkWGpyYlRYKzJ3cDEw?=
 =?utf-8?Q?o+ziprSdA/fbSdq+ow?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70708d8b-24ba-4837-1620-08deaadc4ce7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:27:09.4440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8rZooL04U4WyAdEVoIAxzyWzxHe1ZAAIlvmzRCf6niK94Le3UfgHBVUvzotq2V86Rr57uhkXG6OyYv2d+QJNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11506


On Mon, 06 Apr 2026 08:38:11 +0200, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
> 
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct interrupt flags
      commit: 895e7756cdc1ba6467eb37eba31c1358243f6ad9
[2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
      commit: 7263f1acdd33169e1558064ee9a98758921f3bec
[3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
      commit: eb27f9b9a4b2965f8d497a3c565cfbc2473c184b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

