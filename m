Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7AF46AF31
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835282; cv=fail; b=h6JkqTHoD8X0hDTT8Y1JimqQ3BiYAETVlYyoqAuCR4S/Fv+By82Gz0yK985cWucDlEX3InF49A766Hq/79J2r4XAr9pg4gEVWHxi/FVLQ5V8NQiEhpJD0ZY1cJJ50gnck2QOBqpwvg5WpIV6o7C7iI9WtY98EO+EFbdeJBwBB34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835282; c=relaxed/simple;
	bh=su2buZjkL1zE3Q83O2DmsN8pHoVBDblNxFBpab1ZzZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOufEj9s9dmVPJMsHN3U3bw+sgQwNNQ6mFeEbKTv27mxFwkVKrSzowOqGVffI4vpxPpCHDNQr65njhwLyXwOYolCKIlSgbZX6JgEOaIko7cz2vb2DST/Oyo0keSrpzZ6Q0jCr1YeRAZzROabbYJMZbORkD6AMUsCco5JI39lfp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sqAyWkZi; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sqAyWkZi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xzk46wC15cvSfuWvm/xw/FRgcX2OriYbe2iBfXukDraJWIsAY5FyrAu0efSQh7hUJlSy2BqbSMtQxYgNvMw9aJc2Tvh0bsdlEGO0kHGXKKPwgHuDXBKflVt1xOzfMfqwbgTi4JW8DrO/IdQ87qEAT27akr4nHTRgYdIZ/xrLFUV3I+XN0na6zMAjFFgpytnvULMnM4WlSQZQtX4WX4VvWe4xwdOy8p4wdFQCftrnzufYUbLHDkD4bxvY4hi6yZhBAuyk/cjI4vDLTkpkq5kwcTMahUXJZBwF/P4ui4wvzHKNSs8zO9XIu301pkgJFG+N0OyYa6LwosZ6tadIbYmv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9UiuoFe1UF4IIpJk75ZLHB0ODvUJDh17grCTgQfuSs=;
 b=iutSNwFnHaH6q5Sdq7TPx0F55RUlLptbEU7IHrWy01of0ESo7EwsMv7dU8Ga/mBrXNJkkxwthOfTUm9t/9Wyr1VkqmWdknBpSYtbO6wRlowFqEaDac1uVefT1XXM4nX9u1ZwFOaNrU3qVcwW/EcgKhtpjvDiolC4jHSOIhCp8m7jYfq9wuLqIeVuhuyzB0s/jMLEITeAvqBYOHvumVLmVvlokzsOEnVnkFAzap9T226GsUS6/mjw22FG+ivhpMMUmsGOI6cpbNKiFYIwpOsdTxwxUhKKlKKHBjdTZpdr5+ZLkGF8hBrLhesgK/5j69l7YkhzAtGyR7QYMSvlAS0NvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9UiuoFe1UF4IIpJk75ZLHB0ODvUJDh17grCTgQfuSs=;
 b=sqAyWkZibJ2IVSbljpSOfigzd6YdZ5FoterAz09ACKHJ+3TgmYdcGT3eF9OiFSa8gFoRL/H8pqa4qlOh0TU+2CnSfApTQuSTSiDV5nAm4YMwyTUpaoUuN5PJdTf2cwQVdLNett9CNZPILcJBQqrsmUQz/lEaaIOlssjQNRMrvZu0Ranwpazu+uBYmSiiAozcQ1EVbHhHCOc3Kpk/xzsPV5U+QnGV338FvEOCP+ob5oucJDCmDUW+4CtsO93XqXrY9B4NSvcmFrQLQc5g7hFNEAR8E0PhTK8NU3etDkZ/n40D+y/+dwaTBPfhlAjKEyOTXTerNIjR3oKFrvfF5lTaoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7827.eurprd04.prod.outlook.com (2603:10a6:20b:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Tue, 30 Jun
 2026 16:01:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 16:01:15 +0000
From: Frank.Li@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: imx94: Add Root Port node
Date: Tue, 30 Jun 2026 12:00:59 -0400
Message-ID: <178283408627.3277713.8166693976051701885.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630023006.3247578-1-hongxing.zhu@oss.nxp.com>
References: <20260630023006.3247578-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:806:127::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 71536816-e06d-49b5-7415-08ded6c0d09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zIpsu0XSAh1ezejQ5Es2YPu1cAu2px3mlNNSXF+/SLCgDugzOOe5nMKX1IbtBHrllUks0acb8f1BuXNIG+LfD54m/sFomsQvewVcPEDn6wh4sY0iGD7rxfetRMXmYTTCxT1AdxGyKBXeP+aO9DiTC9nxGAANhcudmjGltoap6crpQoaL+rLMZb06fs80H3/S1GbC1pYTgXinwZgOfPJRKi/j3jFYEg3AT1a94la0Kow8QimRPAAfHEXBYIwYWwrOEW9VzsFcwfKUJ5KdHtdA4ECF2CkU9fPRl4Uc65zaSFRW6gRVw+tXehETSr4i2ZDYUcnc+o+zQQPUAJkIQNnUn2p2hpYzh24TyC0ELC0TpYytZMITDNyXPi4J7qCi1hZqwKhhbifip7pFFJkmHbvjAPe1Y/YNOfV9yoOcQsaX2bPgyHBA5JFOKB4bcYOS9/8TTr2QTtKfTGaAnGAHh0WAxK/43Enj3rEz2Wx10n/Imvp5E+k5OgFHjnWS9/YBJN1v0zy53OvGyB5fbPLy3EMd5AkPleh93kWdprcQN2bLtkPQmRE8JP7KNw5wQupGMOPSjIX0iq2r6alq2vASGrQSLs0abJ82mtUAtbnsrd8i9e10QI+ZV9jklwR4R/c6h2f+Yy7Q0mCwQTEWGtW3pkPnB+35R7JrnF7hshCtEPuWJUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjl1a1Y4R2FlVTRwUm90LzRhaFhxdDZlMWJzL2pabStnNXgyc1A5clNaOTNj?=
 =?utf-8?B?T2pxL2taSXJWQVIvVys2VTlGV2Y3VGpwVk0walFicjFVN0JwOGdTWndSZ1pS?=
 =?utf-8?B?UTV0U2lnaTZwVWlDVjdEWGR2MW1RcytIWGFIRmhndXpUeHZyQXl0ZFlLQ2Qy?=
 =?utf-8?B?cTU5Z2Z2cjVGd0ZEU3BITi90RXdRS1NWY2VNbm1ibk84SWtmektqeVhVT3Vm?=
 =?utf-8?B?aHhTZzh5TmZlUlJLbmhuL2ZhcEprWG0wY0trYWdEZ0NlUHE0bFFiN2ZBb3V4?=
 =?utf-8?B?VXBjMEFzRGJhcnVqemxpWHk5ZXEwcGpnWU1SSjIvUHVMUkFrUS9CMERWdER3?=
 =?utf-8?B?dndlK0JVYW9yVzNlS3lsQ0M0dkFjVEwwVEwrcVhWOTUyRklaRUlJWHcyZjFC?=
 =?utf-8?B?cmV4QjlwRjl6TTFJVDgwQXlqb3htZ3J5NDJNSUdMWC9jVjBUSFJjbU82THBL?=
 =?utf-8?B?dkNnSy93T2w2amowSzhjdVhxWTBIVGNnZ2RoRnVmeEEyamp0dFIyWWJyWUl5?=
 =?utf-8?B?TzB6VDZSRTdYTXFuSkxkbGc5d3BYQytEblNhS2wxc0dkMjVvU3F2cUgrY0Jt?=
 =?utf-8?B?V2Y5NlhEajErSkdoSDJadnpNaENOVEFBcWliZWpQOUYwQWtJRGZlQzRIbWNG?=
 =?utf-8?B?M1FweTF4OTZFaHovRlJqTW54THlUanRLYzBWQ3V6bnpQcVl2UmNlVW9jWG1M?=
 =?utf-8?B?bEdrdXBEY3JkYXowcGVnK2x3TDdUVHNJZ3RGd3ZCQ1Z0aUFTdmdaWDZPTVJW?=
 =?utf-8?B?bVZqbTRQT2JPNy9LQjRvSnBqUFJka1hTdDk5cEVjbFlUSXNPcFFOSUNGRFhB?=
 =?utf-8?B?dEFDYzZlaFlYZE5IQlRCM1QrSXBTZ045NURVWE5MR283L3docENyM01kb3ps?=
 =?utf-8?B?RDVTTDZDTGpUalFUdHJ1bmtFd3dXV2ZVRENCOGwxYk5OV0d1RUdRWFkwRDc3?=
 =?utf-8?B?ZVZ0OWhUdVRoMnQwRk5Nbk1ETE14Nm1Ga3dzdUsveFlYY2QybFFwZGY1RGlS?=
 =?utf-8?B?Y2xsTTRMejI0SmFDYm02REc5Ym9xTmlsMVdmVUNINWNkT1orRk00UmxzUDdX?=
 =?utf-8?B?WEV3TVhNNG9WdG04R0pTdnlFN0ZCK1J6RzRrajF4aExpc1pQSmlXUGNaMUdM?=
 =?utf-8?B?ekZPZmJGc0wzczlrMWpGMjlVTkNlQno3ZlBwWkIxa09uN1ZxTEIyaWVhMlRq?=
 =?utf-8?B?aTJSTE9zQnFEaS9wVmQvcm81QlBNU1VLMEt4VFNObkVVZElVbWpCOG5WUWdm?=
 =?utf-8?B?T0VrZ1V0S3gvdnhkak42R29hcjZkZUVkLzhpQ2pTb1JiYmxrbG5nVXRQaUU0?=
 =?utf-8?B?QkVUbEtTTmlCcTlSTHJBRWxDNFE4WXdweVU4bmt6OW50VnRUbkNEaVpMWXll?=
 =?utf-8?B?WnpxQUY5eC8zeEFjYXBNYkVqWENsMUdFZjVOV0hYSmFQVXNpWmVqYVhpb1k1?=
 =?utf-8?B?bndsSlFIbmRSSWplYmMrd2d2VVRPRTl6Q3owT0pSb2JVVTM4V2xqZGJhRGNU?=
 =?utf-8?B?aGE2OGZua3ZudFBhOXl4RkUybi8zWTMraWFOSzlRRDBnWHpqY012SW5yRzNY?=
 =?utf-8?B?Vys3QjIxK2kyZzVxRHJ6RVd2NjZ1QkZ1ajhjd1dPa0tMeERHL2EwR0pDMW9Q?=
 =?utf-8?B?azFzZ0NNaXRRR3UwOG5pMHlPNXVYVUYrcUNoSXJpamptOG50Z3pRNXFUdjVX?=
 =?utf-8?B?MndVRDRESGVHSDFqWlRWNkRDN3JzOXdqdUJIUG5scmx2b3ZtUVlnRkFvb2JJ?=
 =?utf-8?B?c0ovck16ZVR0YzlCSmcvZU9Mdm15OFdLeElianRRNE1tcmEwM25vQXVrandu?=
 =?utf-8?B?bTY0UWhRVkRzaVU3bUNCL1k5ajhUL0dpZ3BjMEZoMjJpa1FEUGw0TUxhUUZX?=
 =?utf-8?B?MnhPZkVZWmZ2Ky8rdmpUVXJ0TzFqUExIbm1DN1NmMHVsYURzM1M0akd4YlRz?=
 =?utf-8?B?ZURPSFI1TE9lbmlYMFBrRzFGMGNJM2ZaNERreVJSVjFZSTZtVGFFK0ZxOXRI?=
 =?utf-8?B?Uk41dmxrYmlnN2dGalVLMlNyQ3FmdnNGNExpUllLMU1WZzdCVUY2RzlqL1dn?=
 =?utf-8?B?M2xHOTRTUjJ5RVBLbGF6RGpaNzZRWi9ZWkRnQzR0bUIwS2xtYkc3cnJzdi9F?=
 =?utf-8?B?b1hrMU0zeDdlYzBoZVVYVEpOTmhGRExsV2JkNCs3Ukw4T3l2aytsc1dMOFh3?=
 =?utf-8?B?NXY2am1UZmVZNnRsQTZhVEgyR0ROd0IrVFNMNldZL2QzNjlmME5pbDJzUThn?=
 =?utf-8?B?S1JUMGVpS2dMalZudHNpcmwvYmkzYUNXNk9pbU5HZDlxR0huUzdUZHZkTjla?=
 =?utf-8?B?ald5ZUhpU0dKcytYN3YrWmNMN1lMWS9KOFdxY2F2UWZWWkprTGZTYTkxQUJP?=
 =?utf-8?Q?c/kFsHetlreYN1bypT8olERf97gn2ThFJnlRJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71536816-e06d-49b5-7415-08ded6c0d09d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 16:01:15.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7FYK5DTQg6R9myRhdezrPlyorSaMa6W9myCNwVsO3MarVAyWf7/nlIZ7rrzQx1HEz0PUEV8+ExZmJPwSe/B/+Z3JzHNmIUhrlLUrPx/6kk5apuwGcU2Za8rZRojGyV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7827

From: Frank Li <Frank.Li@nxp.com>


On Tue, 30 Jun 2026 10:30:05 +0800, hongxing.zhu@oss.nxp.com wrote:
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so
> creating the Root Port node and pave the path to add the reset-gpios
> and so on properties in Root Port later.

Applied, thanks!

[1/2] arm64: dts: imx94: Add Root Port node
      commit: c1a9a0e59055d22c8faa57f0cda444d8eafc1a4b
[2/2] arm64: dts: imx943-evk: Add Root Port node and according properties
      commit: aba2fbe63163e82db8c82fa5c305dca58a89b4b0

Change commit message and add broke back compatible judgement.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
