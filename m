Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0033264E4
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019510; cv=fail; b=SNDzzmsy1xuVlXLOFfk7MnvG8oE4n9gGFBQy3LPe0KdfZUP6s9ocuq50sLxDtMEOCqPabA9x9ji6gvKY6WF91nsO2SIm6lQjT9AThRPvDEKhvzIoXUYYr8qbNBgFmqK+aJ3bh356r36aDUJJ1DxuCgM2qwRhEb+D4sZhQVFdcnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019510; c=relaxed/simple;
	bh=QyPwprbXmW6hhCzgpF1HxmHy0y07sZ5lrVS74POt3gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hItaycVA1EJj6sDnPtqvdd9rh1Da8o18V/rApC+JgELTBP554pLQEqhY5A+tmp6kuawCtG6WSJrvusNMt5L7EPdro4FAO+p0arT6CJFu58Sjqtsbw5j0zslMOEGX1bysa4g5Zq1V9xji1hvRyWegAQCCAJG+kSEzxL7MggSYssg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BxckhhZy; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BxckhhZy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDS5Hbn+ooHu5XFpRHFMzXfSfExmQYl27gNlT3ayAvbQGSdN1JYUet9kkQQElnri9IA+jFI68s7jmiF5dsOc7Q2gnGD99itzS9s6EB/h6+dtZnAxBTGjT5p6Qhz3zmuQcWF9vmUQolELDI2qvjPDIjTbUn5/IdYOWGDaKmhgKi9Tu+0WulQI7OzzPGhQBjMsB2ExrToXqD5djew6VVdez6yNiHmSzD1qML0GyPlzTStwHqiT/oQ85Vn8KNXT8cDurwmCxxqJ45q/FY9FeU15RwOcf5E6bCmgkf8eg+U43kU4G+WYsRIT7IC2K5WXeQ5NfHIkjtsemWaza507xgdItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+hR6/rbyvdVnfpFd8NZ/iO8stq04jO6klXKge5x8WI=;
 b=ooj85+3Xo7Cbc4FJOu9JL8pJg7BWMWmZlVYp83j2I+uFccsmkBrzVqtCARS6Sh+X2aC4zsybtWmzZqh2cFaBe4ePq24DQ0PULTKtR5nYlcO52g6Klzn0+q+HhfDvFcU8WukVRar/8iG4LdIVSAP4e1zV7Re1uKFFbUAsmRm/6r7Meyoq+pe6ms6NuIQOgBxyXm6CarPuuIsargbgo/EocJDXm7L8O9OFLixO3FyeTOkVzAhTN36bP2KW+vO+LMKtcjrAtM0EegxYduc21Z9y6lY1sawL3MAUXt15HNTbzZ3dPwjmJ/FyeIF3V5DphG6Ko87UWmxZWIN8T8tB2Fetqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+hR6/rbyvdVnfpFd8NZ/iO8stq04jO6klXKge5x8WI=;
 b=BxckhhZy2odPYSjKek7q+O3T0GqE9iKICJgAegXjFsMwvY3JPNyH7eVHdZf0CYIeDcKTV1V/m8wRcS1N955HM24nHPD4OvuGqIktBZ5A9PFjDDOHVfYT1qP6DddIYT1h7/aYESZp0w7nP4wBul7K7Q/egIY8pYp3cZxS8yl8WpGbSaLIKqr4bmYUZ6l8K8l5wfuOYKM2gZNCSI5wwgMPiXD7A8We5PC+WU8abjtgGO5BZ2CEAhyHQaJyTzy0aBkNfBzPg9CnBauTpIg44yQnApgIlENPq61KikXamgZTHVOkmMM/k2H8LAt5hOxQBabvRnSGcu6LB37gRsHlGlfEAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB12224.eurprd04.prod.outlook.com (2603:10a6:102:561::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 15:38:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:38:25 +0000
Date: Tue, 9 Jun 2026 10:38:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, shawnguo@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in
 syslog_show
Message-ID: <aigzZ8_uGT8bCzWc@SMW015318>
References: <20260609004504.3402281-1-lijun01@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609004504.3402281-1-lijun01@kylinos.cn>
X-ClientProxiedBy: PH8PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB12224:EE_
X-MS-Office365-Filtering-Correlation-Id: d98bd37c-2b80-46e4-8108-08dec63d24f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8w1EKluv43+tvddis5fErIrWniFqtIvgPh/1u6ZY8n09PU9TnVX2aL5/oD8b+X9uCVs5HuUiyPxPjYdnzCbz+8LjXj1qvWcIKQRzDrU455SluipBME94bt3CiuSklMIIqxpcfVA6MVx5ajjVQettcsYbFwflsrebNTu22rpFKBclaBk27nVr6vg0BHCEMiPOlqMnnor9GEeLMWtHS//kWpO5FoKLgn/th2Cs1XJgQ/WOu5f5sBFdqOMwfemXeT+nI6AAYD3ZoLGKezoYGV3/0iSbgVgiP/HABOpAyk7BKOJI+kH25K8HhW6mpenSeThS8LcfGJMBF8qjwyWzjlSaC0RBzXPUkmK0kQ/S+FPQUxzafCHAO4Z0PU8pzAQ+8KrsrKm+7o8MVDq/zJTYod4jnC4LeC14RRPsf35ob8T4RrRwcARS+ft4DWNhoNnFhkQMWs3nv1ZUZIgXeg5SFNrs5w3iYh1z7X39413xElhE7CFD6+qLealBNS8f+MDEllHL7wykY+ka1Yl6r6NXM7W1rDyT7Dtm5O9qnugEccMG9PPdMWvjrbwdx2KlrdSGgkjOZ/0OuCQ1kmTRcmqVNLR2f0g0NqyltSHSwtzUvK42UQNzBkIKJiyrpKDkNt4n+xISPUDcdvGgMrM7rlHC4XYCzPuAzubIeY6koeHUII0YLMLtEYqWErACHJ1t0WwSCG3e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXOT5+AHVGqbDLq4sh1zLVeviMgUubxwA1DFQV56YIYOcvrArDcbQW7OUVuo?=
 =?us-ascii?Q?8Zi1UfzNilpqBTfAkPWw1qbHcvwKKCSRQYVVjWZnVX6zogP2LRghpAPX2L0x?=
 =?us-ascii?Q?48IDSQgtMSNQqHU2a5REJ2DPHO+Ya20mr1gaAAhJE+RqSvTTcc1naMywFAKO?=
 =?us-ascii?Q?wr/MORVU71rG1Et9OUexiKvjyeRyitMpHqGS4rRMWljBouJ+f8w1ZQsZNubP?=
 =?us-ascii?Q?khoh6biUZFpArK/RvbaDdcSVQeF7n1v6utp9uLTf4c2wWwN/GdDL0k5J9F2/?=
 =?us-ascii?Q?twHfvUd+9ryuZeMmjojIyixB19t6Sb1YHpZw5Qswo6u7oAhAW2CqJmouGsa3?=
 =?us-ascii?Q?oKG/ocKaExvSSFw+4Pk/Yuea8FnQ683J/6IH81yDsGmGJsIA1kMbIy9gg4yN?=
 =?us-ascii?Q?uSoA4t/JcBvDMU6y8QQZBJlXQ9L+cLm1bzBTv/PXdkqV0a70nA5oqRe8PEnm?=
 =?us-ascii?Q?SgXsssXZ51Gka8/w3O5LB5wmdi6wHT45wy9Q8C4PVFjTdP8H3dSCHN0dVroR?=
 =?us-ascii?Q?EN8n1EFXmZDvKU8lmsf892zjzGK/arqWt7IwqrgT76T/4I0jdUYUZoBS2mWB?=
 =?us-ascii?Q?3bMj+qvgz4ssjQ+jRW6/IoUPkkOcef5dQ59cBgrLwRuvaWzPUOB+nAfdBRpS?=
 =?us-ascii?Q?X3aksVq5n5YTBbNbi46LipKbfdHXSXTkZpezzoGChrw9ByIBZBKm4rk6gmzm?=
 =?us-ascii?Q?rKqbACEAg+qgGSlTzzNvWto8SSOGexEzyZvb76JYNRm+Tz3QnWPwLISrfr+n?=
 =?us-ascii?Q?HZfrWnH03lRKoKpVFss6Z3vA8RG2qslOr92E1NEkLoAllJj4VlTuKmKPuCzn?=
 =?us-ascii?Q?qAHr5N3/0hSFnW+xno+8hSSa3jd118iZpQsTufcFWARuaSLyMbvy8sIWsqHG?=
 =?us-ascii?Q?E+F+QgUUYzJPtgttRXmBvpV2ZiN6LBXpx907LofsSZPiD6d/1UQje3Kn163g?=
 =?us-ascii?Q?B0AO0lVCY/FSi45pJmrD5+Qkp8Ztq5eo59YyRGDzG0uiHZynCAiudgGOhzOC?=
 =?us-ascii?Q?hJ/X7S4T8WN+c4utkdsroGXnO5rfjn3oZn7oFe/KzEE9jbtlUNiQYmG5orB2?=
 =?us-ascii?Q?qL+3u65e7L7mZ0unkkvpXeAXalnzMF63yr7gwJRVsVmrJz5ke/lJ9qQDuOaE?=
 =?us-ascii?Q?tXZj6JqRLmgRiVSDcr6vTsnlk6STDg/UXBGZnm6K/RNFVDvJ4fETrqt3M4k8?=
 =?us-ascii?Q?7q9Q5SHy8XhXjweWZUw25Xzkrmzz6lG9b48bP8FhzxupAIWop2TFuSy/kGOU?=
 =?us-ascii?Q?NuvtoZKE1w1AYqpbl19fsqG/FQrffqk40eLxeSRL5ha9ro4yNiYKvrlmPmoY?=
 =?us-ascii?Q?qvMrSef6IeDwxtyykWCL/0Jg2tq5bF9utvA5W7lUujittb4uOh19WwmlCyZT?=
 =?us-ascii?Q?MNqqG5P4Pah3G+Xja9amIKrzU1+/IaNXQp6gzTAtdU05hA2vXD4OEL20gSw2?=
 =?us-ascii?Q?EpuJzcnO80GFL9d+yEds6saBZno8/mzUyKPwXs8tuppQiP347IMldEWvnMH4?=
 =?us-ascii?Q?vTt5BNjO/z+ku3cy4YN5JdHXKdlCT5K311MyV3IGEaSHLamqYYyEBeYW6lmF?=
 =?us-ascii?Q?tN1eGA+rTdgIviebuEN9frFoHL6LGi0VKO64U8LoG+/RjfKCsg35tw+tZbpW?=
 =?us-ascii?Q?AXa8oaMVQSFsTfZTFEuwsU2kxWGyR1Ukk3wqXaOpJzSI/UAgvvKJTSo+0Dem?=
 =?us-ascii?Q?8JNL4D22lu0Jol0VYLtaOlH/73HcwcHtR5P/wYYWZGlnJ9YOPkssZvcdau/J?=
 =?us-ascii?Q?vwCgSiFRRu4RLkfqohzBG2mxhK5RCTdWTxlAxajuW87m4dd7qi/F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98bd37c-2b80-46e4-8108-08dec63d24f2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:38:25.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NY5YUACCwmchbsUDKgxMOLQZ0uopyuYTtblgSa5B8B6vgfS6Hq1r7gcO5YDK0x+FBxDptcPcbhp4KeSpYoWEIy2m0SSfXqBAiHk+iYk2dw4maQCV9ASmY6ZDTtvCmx53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12224

On Tue, Jun 09, 2026 at 08:45:04AM +0800, Li Jun wrote:
>
> Add a proper NULL check for the kmalloc() return value in syslog_show().
> If memory allocation fails, syslog would be NULL and passing it to
> misc_syslog() could lead to a NULL pointer dereference.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---

Add a fix tags

Frank

>  drivers/firmware/imx/sm-misc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> index ac9af824c2d4..fb8d7bdb5b08 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -79,6 +79,9 @@ static int syslog_show(struct seq_file *file, void *priv)
>         u16 size = SZ_4K / 4;
>         int ret;
>
> +       if (!syslog)
> +               return -ENOMEM;
> +
>         if (!ph)
>                 return -ENODEV;
>
> --
> 2.25.1
>
>
