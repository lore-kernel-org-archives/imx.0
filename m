Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022101.outbound.protection.outlook.com [52.101.66.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4E1A3166
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730772; cv=fail; b=F30DBFRpnxMGicQ1z9qA0O2x/sDjuNuLarSTeNx3CkL+OsYLGcf6uxgsMwBQCHfyzsU70SHYZM8YiCudHwkqjdIR9dfwzgfII+ZiEzqq6zeegD2ItwyrDqoVFp8mceWnj79wHvBOJzCmh3apAtesql871laOawOJKElgf9A66Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730772; c=relaxed/simple;
	bh=7hgk/gzO7vE9VOEZcsla5o8EecW8ydqia3mpMNwAYwU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pAxDSEq1PS35ffyNdiMZ/hE6fmBp8/rC8+wlvkL8sjQ0Ak/bqsT26t9TaMcOR2IxwhSZjeh2CFGJesRxV2MDtnefwRQSYNJtRPuH6U3BNq69NHW5C7eENvYcDtpfil+c9nMEGeLRg1MLK0OZS6HCnmeEvwqHmLlqp2I00t3lcAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=pF1zRn0U; arc=fail smtp.client-ip=52.101.66.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="pF1zRn0U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnLUVEn1kFzlyWdKeHxrk0G7fJNuL5WW+ijgpTOBG/KXEz80SQ/Mr27Fo6k1jY+UeLI8y5FC6BKOpQdgULqPlvBmxBxw0kqd0Vv2iWTTRGMdifeeBma7wkDEmYCMCpPsKGh6nAlqJDX1D0MP0SyEpCTIvNi1lLNxdDL6jJR9NNyALm2wopk/oQlumEynADlrKDiPoJKafg3uULp60KCkmHxMoqWkisUEYwLf10MoCaw/FmHVrlivmSeL8qWObJinujkHVP0WoqenMs8xjhKf6NSt4Jqd9Xx6YYyutMRJOJk5bnWOWDYFfOd6g8BDtqXtA1xdwJzt7rN+24OkokUNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwNXMUyFYo2+LFH+9oJIG/GKwCWDRj6Dj2VZYR+nU1A=;
 b=RGJbd/5aL5qvZbRUvvWWKeBliPkHdoRlLRWOK2ekfF0Fh/UYgnZCpgpvPNxzl7y9l3I7+YsVfUnG7Ip+s4YghsnNRUzbuf09TGlpfxfjwvqR6gpMEJADEyV3dbwOgn2G7ZYxPmtZzHIbVMvVPCIY7EfT9UVXyfEEpFU0/unnaUILTyzKq75xNYM6BZSK7HjMcXB+n+jkiwIkSEMcxrmOA+ajTzNUaZXrbVU++CwYiBe90UZtGxObuEK/9iXrPrgDKv338QxtTVBZEIoPRJb4QiRf1swJqIH6DRQn0NK/Hf+Egdi1edvroX8B1mGlV2+dSVIFEgaAYmKi8hfdATHZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwNXMUyFYo2+LFH+9oJIG/GKwCWDRj6Dj2VZYR+nU1A=;
 b=pF1zRn0UgfMOeoH/3IYklM4uB2lJnj23luVog6qSSbGEdlSXVRqWpwrjaQnowszzF7xlZxDNStTrCFVb23POv1srQ/lu80xWYIZpp8/KB7mVrxH64B5eD9E51BI/FnRbx2M/xI9lH9oS4uPwrbqZXsfUICrZIsMDXpAXzwk90hlSOHtjxxv3oadM0Wj60BP+uYlm9n7dudW2J3PvSJRXupPy8iHYKkVqnUKAzEGoOiHEyPUkxLXFZTyjrJmDcl/uk786yFqUsdWLddV72eCdQGnMJG2KZDfoPP3YH6JPfOChhBty+IhGQK6UBZBFoidim4KH7Ab5QgP3zWJiFFp/aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU0PR10MB5411.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:32:45 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:32:45 +0000
Message-ID: <710cb8fb-3ef4-41ec-beb2-36acc9fac34b@kontron.de>
Date: Wed, 22 Jul 2026 16:32:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
 <7a799385-fcc4-49a5-bef1-700e3bfb7c5d@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <7a799385-fcc4-49a5-bef1-700e3bfb7c5d@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0431.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU0PR10MB5411:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a733ba0-7455-4dcb-303b-08dee7fe1855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	svwmeIhLnmLgrqdsyQZ2iAFEGneDWQaRhoTlnxsUzoWGXfpzUR8rJ8o9Nv25I+xPWkiYTdfRc8Z3ms9vrtnvjLlZg5kpdy7NqQ5Aw/PPj4ZthBnq7Q8I37X8Sm9MZGd7UusRm1wYhPzyEq2cZSlIBAIcn5CnN2xtjmv87sfwzL/eSYSEdqVrIP4192OtikxTyDhkHZs4kGwAmspZNr0L3I5IjUcqXPt5u4Ge74pGbicaju8Z9qWeB4xo3UDoZ/G8D2t96mIJCv3Goo52cJsYrGYbs9/uDZan/dB+K3vd1EfDGoCSeoneYmhV5DFogm5mkBdayVPdathNc/ldQbNlSdP3Gc3zEx/DxXicaFD8MiVvE7T6v2FMeHKMNsD5/Gyfi894gHRugRRUTEQEAmBvZtzV0q74beXbQKcefPs2aaRstdgZU3Na0LmMVcoKhO8sApFvQk5wSZlkKMCRinjlHnu6QOLzIW2VYL2GKjUCl15A3iNowjWeDAuOX208cCshZCOi81Vv0nBDXmScuVx3xTbEOhUP6es3lklqw1JH8f1Ts6i8Oy4CLO6ge70f7SVdIF9FGaVyzXmT/sq4kE2pEEF+XhnDdFHlK0QVhNQ68a6PSQt4bEof1OrZ8zrapTrHYYud9gz8TC0mviwbNYtRiBfP8DBnvjCbVLIuXKmYPNYDkhu+osV4eB2mAVQL6gQnAgipNd0Sxv9VblOl0Gj/YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTVwSXFjQ3V2VWFWbis2anloQmdBeFVmK1VTdVlkaW1zRUtNZmFaRlI5c3Uv?=
 =?utf-8?B?YWladXVMbjJEQ1FmUUdQOTh4cndOdm9WNUlxU2o0d04reW9KVit2S2lkYTVt?=
 =?utf-8?B?aVU1UGF1ZS9lNGNRYmx5V2k5NVI2OGlyNG9lQTVTYUFxeS8rN0tSNXBDZktk?=
 =?utf-8?B?bFE3RG50eTExUnc3ZmNnTlNrQkV4QnNLaDBJZUxlemxlTGJvTXFiUGtQT20w?=
 =?utf-8?B?RTRkeDdRWHQzV21NVkluT2JYdEF5Z01Pam5jRVJDc0J4T005YmIybDZaK3F2?=
 =?utf-8?B?cVJTcU4xWUF5SngyOWFLcXhHUDd4MXdVOFk2RkNHVkZVaDVzL05hT3piSWh2?=
 =?utf-8?B?SVhhOENUSWpjRHU0dlpkZEhuZ0svY3gwakFGVTM3c2toa25HaVdKNnl0UVJj?=
 =?utf-8?B?Q0ZiMC9rLzFSdEMyVTVQbU1wb2JRcU5yTWF5dm5tNlIzT2xzcDF1N05SM0Fu?=
 =?utf-8?B?RzhJMUlURkhIS2hmVi9najZKY2lpSmNYVVZTUFNsVjArTXBPSFZEdHQyZGVs?=
 =?utf-8?B?cmZSSEFBd2hmZ1oxRDl2V2llOEw2UkFmWHZzTlBRcGp3bVp4OUNnb3dkeXVL?=
 =?utf-8?B?aDV5alVURHF3aWh1eURjNG9DelhJYXlxeU0vemxPQ3dRMGJaaGFLYzRWUzV1?=
 =?utf-8?B?VXdickowWHRidXhFdG0weVFlYm1LZE05OXJhOFNsS2ZmZTNWd2hJV0VVb0Zl?=
 =?utf-8?B?eW5IZTI1SG5UbWJscGJzREZBZVVxaEtqQTlyZHl2cVdCMHhZUUtucStwL0sv?=
 =?utf-8?B?WDNCUmNFakVyNE96ODV0VlZXT2pSdHFNa2lRbWpHQ2dpdjJFTGI5MDB2d2ZH?=
 =?utf-8?B?RE92UnpqRUlKb3RISWpGTERwM2swRC93eHlQODF4SWpnK21zS3VQU1RnL1da?=
 =?utf-8?B?bEZFVURhWlBCSWw1aDdSQk9RZWJiTHlvME5aZFA0YXJhQ2QyWEZ3NklxdURK?=
 =?utf-8?B?dTBSQ29BZG90MlA4ZGZzc1RoQlBJOHJXSk05cjltNU8raVN6dGx6MHNmQmZ2?=
 =?utf-8?B?QkZrcFJUaXhxeUgvODh3Rmc4SjRYZmhESDFvZ1owam5KVUVFWk5PZzFHNzBo?=
 =?utf-8?B?VnNrcm9jcXNNbHpuSGN1VXEwdDMyUFpFVEtKVDh4THFWVnhWaWhWR01mYkhE?=
 =?utf-8?B?RUtRd3gvZlhZYXBKMmd4V0xjNGtVSzZlelhuQnRrMUZEN3BvTEFWVjJZMmxK?=
 =?utf-8?B?WlRHd1VIQ3hGVHBFVENHN0ZTanplbTlOdWl6QXk0clZRYzM2SDNPWHFncEZp?=
 =?utf-8?B?amNTOHJaZ1Vzd2U1U3VrMEhPYWxQbGRDcVlXVEtLSW13WFNRUFVXSVRUeCtK?=
 =?utf-8?B?SkRkQ0k1Nmt4UzNOSXZGdUQ2U0t3eEd1cDZybnI5OGkxdUhUQWJ5RUc1bnRq?=
 =?utf-8?B?MnJaVUs4T3grT2pqcVV2dWJHM2NCeU9PRW4wblBPQzQ4S3RnYVByclJaSFF2?=
 =?utf-8?B?Wk85Zlp3Rm1SZk9BclpmdE1CVm9zNVpkcGlQNHlpWVBlbDhyRGVRNHJkZ2hV?=
 =?utf-8?B?WXl0ODFpNSt6RStWZ21lQzBKZ0RGT0RyMVg3NVFvQzROaCsydks1Um1wQncz?=
 =?utf-8?B?L3JZamNRRU1wZ0hTVzZNNzFPY3JMQjhEbG02c0NKc0xTNUlJdGx4YUxraGJo?=
 =?utf-8?B?RllUaGZxOVhlMHNkVC8rcmRqQzFxRjFReDhDNGk3RlQ1TExkSjIwdHlSWkJv?=
 =?utf-8?B?UGJEaHhWSDFNSkxONDIySUdTelpqVmRpMzdmdklkRnV6dXFBT21LSEJXZzRR?=
 =?utf-8?B?VndVbGhUaVc5M1VjdEhwYVY2U2tyMjZ6NGcvZk1mR2dqT0NQcnUvclM4RGZu?=
 =?utf-8?B?T2lpdWdvbnlvMlVOVWE5THFRcU51bWJUaGY2cmFZc09OVjFXWG43SGFpV3FY?=
 =?utf-8?B?ZjRXQ3B6Rm5vY3Q0OTJZdXNoWWRvNGk3OW1tR0Q0SHc1bGFHYTBMTzNyOXV4?=
 =?utf-8?B?WFprTWxhV1FWelF4RStqSXZnc2VOdGNGeEllNG4wNGQ1TVJqUnNZQXNYamdI?=
 =?utf-8?B?RmJoNEx4VS85N0dlbUdnNzJ1VzZ2UlhtTVZCQm80VTNXamExeW0xTTllUlgw?=
 =?utf-8?B?V1l4aFBTRDVwV01MaFg1d0RxOXhWQ081Tm5ESmpYay9NT3c0U1FPeUxqWis5?=
 =?utf-8?B?UGRPdGV5aEFIVGVMWmY4TGhOMTlreHZkZTlod0RLek1TTGFQT25EUENmMVJS?=
 =?utf-8?B?RHRHZTJmSU1BL25RZGxiT1YwSjcwZ0pJd3BDT0hqOTFTUlppZVVkWmRtUjAw?=
 =?utf-8?B?Z2NLSTVKRzVYZ3o5eG0rVTlLMGlKQzRRN2ZSMTBHOGFVZEV3aVBXeE5QdkFm?=
 =?utf-8?B?WUMwci9GVEJEWUNaZm81c3c3emZVWGg4ZTU0Rm9lMlJ5VUxoQlN3b3lCOTV1?=
 =?utf-8?Q?8bfF7G1X6nfm1qrw=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a733ba0-7455-4dcb-303b-08dee7fe1855
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:32:45.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acqfbe4lWICt5K/kgMhE6421prM3IMf+rDP0A9oNGH+3sKD3J7LxA4Gn7MkfOIuMoFCgRLu2lzv06ctOqUbNYAU6HBdzpyYBwv0Zv8GzAhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5411

On 21.07.26 12:50, Frieder Schrempf wrote:
> On 21.07.26 13:23, pankaj.gupta@oss.nxp.com wrote:
>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>
>> Add MU-based communication interface for secure enclave.
>>
>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
>> embedded in the SoC to support the features like HSM, SHE & V2X, using
>> message based communication interface.
>>
>> The secure enclave FW communicates with Linux over single or multiple
>> dedicated messaging unit(MU) based interface(s).
>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>>
>> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
>> world - Linux(one or more) and OPTEE-OS (one or more).
>>
>> Other dependent kernel drivers will be:
>> - NVMEM: that supports non-volatile devices like EFUSES,
>>   managed by NXP's secure-enclave.
>>
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> My test and review tags were sent for v25 of this patchset. Meanwhile it
> looks like you have added tons of fixes for Sashiko reports and it is
> quite obvious that I haven't reviewed and tested those. So my tags
> definitely don't apply anymore and should be dropped. Thanks!


I rebased my patchset for the OCOTP driver on the v29 and it seems to
work. So the Tested-by can stay, but the Reviewed-by can not.
