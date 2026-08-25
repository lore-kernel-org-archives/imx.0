Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6223E49E4
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692707; cv=fail; b=hOrgLa2XUJZ+pbIt1+1CGDY3RxI75VqoilS4Mb2jIhD3yw2p7E57kPhQ1/2Xb8bVJqj3uR1m4ONzft5rRQtbPf9eTeES36zODruHfxhskZ3JyELKeZkEhLYDbHomSpjadn5ED0GTz6HU+Vhw18fSLbvskSsCPrvoQSBkrMNtVEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692707; c=relaxed/simple;
	bh=ggrSeKgD1CMyWLvxxvQ6HSVXroIe3a0eSSVcaeucPkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CBmOqIVv/wr8ygGGzrkSN4Hw20GMdc9e94MjBklsriZXq/+N2ed2V0WQiKLAhTUrXcUNSDJ1NSmcFZjqnslSR1djOzNz5dJvKdAArMmeltCTUBcx8IPgz0JQ51dwsbjJpyGqR4haaivqHQdSFoG+GtNW+xB350wBqToZTq6kxjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lsAq9TLO; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lsAq9TLO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHxApwOcXGbRZVp3XcUB5SoeAhG8jmMVs26yX7Ck7902Vpffwc8C1F31zy8If2Xar4In4jGBgjoXZuVwcMxSTvNnjIdnkzqbOLK6mqybmnfr78iRuI4Oxh+GchytyJ+5iZk5UtQ7DB2un2ZPB6vMRCcKwdEht544QlqiprUjRBhZifFFs2/eiA0NQKgF59b16VsNIc+IOmsWCkaD6Is/UBHPbLgsCAGrPc1jjOljlrvvrN8ynSQ4Dss4ZuxNTM/bknq39WRHmDwO5Zwnwz88NjWJGaLKBp9FXFmiFPM61wJxYLnGg0++9VqvQmvv4+Sg4/MkfWIg3P1PH2RxgydopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/amZMn7veITM9CJfNfg3hOiW7uRa/iKivs5jdlnyK60=;
 b=V07zTN2cyuxCUXcrNZFvw4LqSzokj7Je/Yp7mZCIlPcSuL4R8lPgSq9qlIW5f/tqJMkejNAnFQ/qczHVx/iao2xjE9YwmXyhIH87898akgyInXeZ+SIi/R9TTPTZ8ep79kV6qUUIghlW0X39Zo+Jlcib4hhpov0RMKWw6Y7qjXo33ipHqlgUrU+eg7AmLeIJornnwY/d31oY/VS/fl7KrstrIGNSyw2oeydJgz60IwZRVnzyqmIR8yxuCtBFVWtHwS4REKcRkczXcGUF8C1dNd7aAJiGDTArPQLjg97bpByALpJR6FRkcIeHDl1xjlMKfmRJizpoB5i7XPHlTu9Gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/amZMn7veITM9CJfNfg3hOiW7uRa/iKivs5jdlnyK60=;
 b=lsAq9TLOOdxLQmHK78XsQ54yoPorfHoFaCM1Cc8XldFINVxxf+TvMHzsDeMN9IkPYhUcnDRCizO+eWqIQglxynbHYjyhAqTGrJomd09jbu+qEZOCv7BQqQkQqrrh1P07dvrYsSz4C0TJGH3TYB9Z59gi4w470/JGm12h0Yma6XxRs90qxkAjaKGK4XzsewSA0rz3+8dHbm0wRjzng6pz5pFpTKAtL/FmFg/zpJZkEECISG4Rk08AdVk7F2rSc7JpQsTi7zGjXwTyeHvgEfa76nAGEIcgiID8NuvmpkMkcwqzJIbsj+TiBOyw6riDsg79cZvOwCA8XSYuwScXaae6bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 21:18:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:18:18 +0000
From: Frank.Li@oss.nxp.com
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Mehmet Fide <mehmet.fide@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vf500: describe the Cortex-A5 L1 caches
Date: Tue, 25 Aug 2026 17:18:11 -0400
Message-ID: <178769264809.2255750.18170859151580675367.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152200.3230971-1-mehmet.fide@gmail.com>
References: <20260810152200.3230971-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 792855ea-09f0-4e2c-3a99-08df02ee6270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|7416014|376014|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wjM5LAhzO/GjYqTQ7XYYFvtHtmh95AGKSajmnKM2lCqL0cV5Xw+7AHsoJLYeWW02BcoF3JCNjjyDovuRNPUQmjbbQ616eTGV5VskRDm061Jim3LvXA5BgeHgfMjKSbOIxzCPUvjexBdLkgJK+G88CQqWRf3/1ddgn0c1r+eVPUY69J4P7QQGXlpiibKbbqSFfN6/3+rdlhv3LW8i1+ekKcvzDU9uFC+RYxnPBCcf/FZyfiaE46LDwClGAzR8CvmNy73GAyO/WBBGXnrDJGBkMZlAJRTDjlohLsXy3xmyKF0PFa6Cfp2Oq1xEnAM3fe6EmTGLRQP8Z1Zq/O7IXHey7KYUsC0+G6wFYa1Un6f0afvNb/mIbKVL8BteYNfjAvRuJyBj6e1Vj+n/fVt9i02Mwr0D2mF61tbx3/BjAzf+buKJjcf6NoJCoT5QaRYsPhH09U+T9lNwvVoDN4KobXG9OdF41b5ysu8fFBosgM1GFxd3VYIlOQI56smTkvTtu86LG9C6KOUA694aFHNWoGmaVWmLapkhlPOfcmlTWKguCFZwvlmqyqcF7ZIM6YD8DZgU3fRL31uKEZ3Jc1E29SW0U2mXUN+IkJVIY2JpsgpDzug5iBD5ylSIi60jl35AA7VRHgf87s4lBeVXnYv1Xjskcy0M+x9kaj8ZO45lLP+E6TU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(7416014)(376014)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkQvNWtDYXlPRE1DQWJNR3R1eTRPQ3JtL3I0Z0J6SzhjWTlZZ1FQMVFwL3Fl?=
 =?utf-8?B?eHgrUmxyS09ONFdjeEljaEFjcmlkMTNsQ201Y2dFdlhLTDlYTEhFNWhrb1Vr?=
 =?utf-8?B?WlJRbjJRdUxTRnQxTFhHa3pWK09YSUpsVVJVZDR2dVEvM1lDNERtMVRHM3NR?=
 =?utf-8?B?L2RwczhnbWVYMGxOUEJGSGhLSlhwRjZIL0dYckVGclJjdDc5TXpaSG9oeUhz?=
 =?utf-8?B?b09oK3psUlVVYzJ4Y2pnNENqQzM4WTQ0T2JtSTQwRFpIOFYyRnluOE5kRnBa?=
 =?utf-8?B?QVRrK1NlUEZSME1nL3hxVk1RS2hPOFNLbWdrUUoyclhYSmVYRStQd2FNdWJ6?=
 =?utf-8?B?dGdROXVjVWtMeGdQMlF1QkdPakJ1L2VrSXpGckxiWllselJHVW1oQ0t0Rzc5?=
 =?utf-8?B?RjI4ZFQ2K0V2ZHVrTUpsWloybXpuN2x6cU5NOHltQnFFRjI5YmpzK3FRZVIx?=
 =?utf-8?B?aG1RYnlyUWpWTHF1WXFyUXFUUFJCZTJOMWdYbzV3bkxxM3pCUlJlNHJzL3Bn?=
 =?utf-8?B?amp0bldmRHN3UlZyQUpwWGYrbXNKTmNJN2lXVDlPbHRzK0xSdDUxSWtPV1RN?=
 =?utf-8?B?SU5GMmd0aFJzaU9CTGNpVE5pQmN4RTNUMHp2dmRBZWFabEdhbUZrai92V1BV?=
 =?utf-8?B?OEdDWGlhT2VxaTEzaUNnYjVxZ0hQY1MzR2hHQmYxd0VLQXZnMlE4UHk1elRa?=
 =?utf-8?B?T3AvZmFTSXlaWDJTcm03d3ZSdnoxQzMzNVZOR3FSaElsd3dTSk81RzYxa1Ns?=
 =?utf-8?B?YVdCdWcvNVRGMmlmamw1OGcwWmxaWmprVWsrREVrbkVPcFhCUFZVVUlQdisr?=
 =?utf-8?B?dnU0WGdIbUhhd3gvZWhUd0hNOE9QT0tOZDFTa25tZ1FEUUxFSnlBVkxxYTdP?=
 =?utf-8?B?TTJkZUNKRWd3U25RdVVieVhoeWlMVzUyT08xbVZUdmlkTUdRZ0REM2psR0Qy?=
 =?utf-8?B?bTdlTHlPa1cwbmlGUXJSNTc5c01YTVltdHBRUVJ3eFpjSkRXUWN0YWgwNHFj?=
 =?utf-8?B?V0YrUi9VUDJseEFCVW16b0FhSUY2WlJRcHZFN0lmZ2xORk9xTGpvd0s3amdT?=
 =?utf-8?B?ckxWRloralNUWVc1dkZxeDVxTmg1YlhVbzc1dXV2WlVKUVNINmIvT2Q0dSsx?=
 =?utf-8?B?L1RlMVRrQkx0OXRwNkYySW9YS0svd2NvbGdqbFdhT3E2S3h0OFZycFFjZGJ2?=
 =?utf-8?B?a3BOMytPTUtwQU1QQTVCdDJ4UmNHVlJ3dmxsVWNrRnZSNDV4SjBRUFMyWStJ?=
 =?utf-8?B?dVRHeXNWQ2xHRzZueFNMVmwrdGdzNkNDT3Fuemx5bU9uTnZQWnBmams1UjJn?=
 =?utf-8?B?L2ZhOWR3bFc3ZG9nYUtXalVsM3Z5UTBBYTdMZEc2RGx0dk9ZbU9pQStkZmJS?=
 =?utf-8?B?b0t6dzcxY1JxdWZhbGZwQUwwVmxnOUtxRm05NmNtaWRXRjl3RFM4aWpOZlVw?=
 =?utf-8?B?ZEwwY01aNFMvQ1UrelY3RUxlSWFVMFlMTlpGejVUTUlvbXRRbjVRUm4yYnV1?=
 =?utf-8?B?NlgySStOSTdnZXZKL0tkQy9mSEltblFTanJWdXFLL3hPWUYwMjN6RCt5aWF5?=
 =?utf-8?B?L2R0WnNqc1V0dERvOVZoTURHTkVTWjdacGFxbGs1MTJqRUpZRU1HNDdzblNx?=
 =?utf-8?B?RkxBTmJTMUZsZFRPWmRoeHRPeUxRSUFQSEl1SGs1Y21Ta00zRU5HVURkYU1s?=
 =?utf-8?B?VUZ3eWxRQk0yRUVCQmZlSHBZVmNVOXA5aEJQbDRscUhmZ2p5d3QrNi9EWm55?=
 =?utf-8?B?ZFhFQVdERVE5bjlJQ1lNK2pIWnpNaHR5SHN1OG1DdGFyeUNvd1g2akphUVBq?=
 =?utf-8?B?RDZlVkM4SXJWbjNFeGpLUHZCRjdDTE9udlg2ZmlobUFVOUpKd3c3OXozWE55?=
 =?utf-8?B?QitiWWRwdHdJK2l2b1NCTUl4MGIxWFJWeldWbi9YY0QxckJKb0N3K1MrMnY5?=
 =?utf-8?B?aUh5VitpclRCRW1uRXV2NHladUNVWTZNb1M0b3h0VzR6YS8wVS9CK3lUc0tr?=
 =?utf-8?B?bUFHbFFJVTlJMFBTb0Z3dHA5ZmVFcjd5eTBqaVBaTGZXelRsTmVqeXYxQk0r?=
 =?utf-8?B?dVhXOFJKRHpMa0orRFc4bEswbUlpMzg0WU9JWnBWaDZoTUZ3VmxvYmF3Mnpt?=
 =?utf-8?B?Z1MyaEhHNDR2OFFYVERCZmlXRE5xUm9wYVEza0NadDkwbVloeWNuU0Jjbnl2?=
 =?utf-8?B?RktubjBYVk5pRkZCV0phMUpvSUJJNmhsWGYzZ1NSdFBZbkdCT01DNWtlRkQx?=
 =?utf-8?B?TjBjUVFyZUFuMUZrVXV4R2Nua2NVSFRYcE1sZmhVYUlRbnZhOStmNC9SbWJz?=
 =?utf-8?B?R3UySXpvRGp1YkVhMXo1SlM4dCtENlJhbnZZVlI3Y2ZiWmxUa3F2OE4zd2Nr?=
 =?utf-8?Q?VclAisF1F4Be9SJQhpAihLeFj3xOyvciSvtAd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792855ea-09f0-4e2c-3a99-08df02ee6270
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:18:18.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZBToM9P0dIRqm6YBq2sNXxYtSekCKjGXAn/sF5AlNKcutfWXxE07WeYShAvxZntFWflKU8zHQipdnX31+Df2tMYdVeCBht79uErRX0Q6U/ZV2JMhweFFlwktfKZPYFW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7928

From: Frank Li <Frank.Li@nxp.com>


On Mon, 10 Aug 2026 17:22:00 +0200, Mehmet Fide wrote:
> The cpu node carries no cache properties, so cacheinfo has nothing to
> build the hierarchy from and gives up at boot:
>
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
>
> The level and the type of the two L1 caches come from CLIDR and CCSIDR,
> but the geometry does not, so /sys/devices/system/cpu/cpu0/cache is left
> without a size, a line size or a set count.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/1] ARM: dts: vf500: describe the Cortex-A5 L1 caches
      commit: e148f98ccf9cf71947b6227031fa570c95be4da0

Best regards,
--
Frank Li <Frank.Li@nxp.com>
