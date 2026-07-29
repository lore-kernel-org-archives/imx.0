Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6C3FBB7D
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357483; cv=fail; b=oVcvPzt19GQRZWrpJkgUIngjqzvt0uNq94HrK2LG3kMqAa8WvE93jPFcdfNRDYdo/Z99s7l7W6UdvbdfVIQIpnifBWAn9SNnsc69e19idnVOUzqfTjRoA8FvGRqrNehpKNTBsiXI1IU+WCmNT+LwMPwAolAQghTIlwzTDdBBxM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357483; c=relaxed/simple;
	bh=yfBDbsZl9tjJLojKb7pY33Obt0ODbQyNVVwLwGPdNqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EheWIlmGPdwDd8sr+tAck2X96mVAf6Lu7Fa0gsCAdY6sIigKiZI2Ost0A1qjruI75V3NhUY4YcLihyHQt3fiLDbN9Hg3A4EhqAMpBTJ3ycDdisH8L5jOXxU0Y99YMAJmPt0aSwr+ghMnCQIj3zfe9m6riyg9CP+BlzDtEEnWQ1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vlRFRV2H; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vlRFRV2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq0vSfr1FvaxzkNK8oh6HfOMiiWmNz3oIWFCFHLlXH9X/41dHtS7dg71vckhvE2IbZvUFywab9tfPZGuc3k0RG35YjsdGzKKJBCXAVH8l7xv2Dbz+ZpefZP4vdcbYTWm5H5CSJ0IMP/1ESYW9HqeNmXQBpwBRNNpbRIGt2cha3EoDYK9Im8lJ4wwtgA3lPSpc9H3HjXHkLy6jscBpCi8MLuucTs9oKviwuGq7EwXOxWJagtDxXlmAahb5grQIwmFtYETqTeOJuRAvpaE9zjgWcw42axYBLqj7eRGT0IThqUmjmmIaAkxjoM8fABkERrkv/foSdXbDkNh6mvnLU52Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW9Uyzmd0CgtZq/3i07ZTJx1czL9+w2DIvk/fu9rJ3I=;
 b=vhfpfz5GSDJ/c1eulZLaIy7mXkmBCOqGIMl1oebMAKLnK6wU97RJvGdh3/zA2u6EaYUQ18hQcHO3pzqWtPUVoMqUHRiimGewfdvvXL3si2Trcoo/DZ0eOr0hg9ezh8mG4v8u2MV6stnBGGtPORF+j5repApCK14CcBH8c0jC+EkLjet0oV29mmZcm3RJIBOm/S76fqqPLfjHZktoHA81acQBjnb+smCFf9jgsDHhKm56LYgtf2vW7TjDPKdJRaVmIHkaxLJb5F33Ot6I8ptxPqdAfW9onFw1iczTbxjPJeRSR16Jo2pLyr6Mb9NjufZhSS5TWddVnpC0oknG3vjkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW9Uyzmd0CgtZq/3i07ZTJx1czL9+w2DIvk/fu9rJ3I=;
 b=vlRFRV2HjbDRDw7MLjEK7uL+/WA3QeKVtkduibtNJtk4LuL2mGvYAGFpdQAaKQLvB9FUaMH19tQojVnAyvVm1gVG8MRcByDg+vQ6+2fbi0gsY05052KZXkyVJMvf9Y4TJBSR+wqWVfXy0Vc9SjiGf/LfHxKqWKoCkKa/vOyYeR4JrfpM4AOVHRm6FW/f3P2X8HUKwG/bT/eXCMt0dv2pMHVBtzdP2D3zn3zhYviDuQFjuCZItt1wVlSE6F0cjRIXt44Jy74xhh2cCwzvb6mkN5l4+cm9QlaY6XP8aLoITv/J69oj6aXT7nSY9B25Nfm660zvmnZZCvY/vpiKHUrKGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 20:37:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 20:37:51 +0000
Date: Wed, 29 Jul 2026 15:37:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@kernel.org, radu@rendec.net, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip: imx-irqsteer: Call pm_runtime_disable() on
 remove
Message-ID: <ampkmBMGBCJM0-SA@SMW015318>
References: <20260729201634.490317-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729201634.490317-1-festevam@gmail.com>
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 202952d1-9abe-43b6-8126-08deedb14296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|56012099006|10067099003|18002099003|22082099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	F4D8Y5bVMz1ExrJPLx/pWIBMFfroZwy/kufiHah87pOaOUHV6oFn5Gh4JQk4hlQhscUA8vJI5caxOlINbX7h4A8je3bkmqLMDUBHFP2R+eAiT5jEmSa3wZzzyo3Y553FWXEa5NRR2FwQ8n7UW49FjGC1mdLwAO+0lOqqLQg4uWYEwgPq893nXtrjdOX/WNz9aL/K0Y+TeUVqDtw4IPC26y4iT+NpZqbu5D6OUYzq9aeb5hHIhE3EE6tBKLJ+2wGYwux5/O0qD+6szSh5ueI4HnLL26ssD/Q0A2n2DhDoz3IOGjzBh9/B/HGyft1Biaq1i9KaDmzZoQQ3xKqe8OUNFAf2ZgqAImw+TvRpddFQvPXkbVW5r9jgEW1dsk4JTxKuZb1c0EQkuNOzHTozwLjqcV0obse0bF26LAFPSjiAgXdSmoFp3YgjFx3PV+LCZEjw518qPvC5E8eU+bpSffLWHu+LSjRVf4BQ9UQN4EBEMC/gdflVHbeCFJOEZdHUklvzHcNxXaE2v2YFAu/xHklzjw+1Mutnfuq3zwOazDCWJlwANSMdme2sCQ3rqZ2zsGfItffLoLW0B4pbnCqIreGcrYGk/nP059MBiLo3jY3anQQObVIp4NLSwRWybxQMdnDacpfUwVR+j1cV8SV0tVctWUDh5+e3hZpA72BbmAuLDG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VvKcWIIVOUc9+dgH5YvvpTYObmxcDTiFpRy0EdJgGm5ibIxdTC89pjpucSM+?=
 =?us-ascii?Q?jQ9HbhvaWomHHsG8UuRVagScFPbLc8xxgbSkIhglQfGQK+g2aox9LXu/Bx5L?=
 =?us-ascii?Q?bnLLttC0Fz5ro3RxmerBSTETYRPNnvnx9CMetZclHZaFoMN6t6hDnJ+H0T4y?=
 =?us-ascii?Q?yCqfltawlogNbniBy6QFnr3iicAnEuNO8KsGJznkj71/eHE+EtaSWm9unG6O?=
 =?us-ascii?Q?EA4ziVelN54/gBigvv4aEp1uXWgDy+PchquQlGOPW9sg02ea5aIb51oOoBo8?=
 =?us-ascii?Q?CNjuF7TFhutXjb6ZlpyKJx297EGp9oWxho+lm5urCQe/qEZlKbMO91XofXT/?=
 =?us-ascii?Q?pYsvIl/dUrRtxQ56yvWFqBc0GQ7TDSYMgzhZLq9pZHCbvWP/UDHqn6n2J1Ln?=
 =?us-ascii?Q?QMNyDgJLJEXKIHXqHsqTpS8CTloJUaauYiFZzAx/0LvOhWNdAA+2WgW9lbYI?=
 =?us-ascii?Q?ss3xOQcvegzqDvdeyclf8IDW4DppNCq7r2ponRu6Xrmli1dtBn0eIyPrA+7F?=
 =?us-ascii?Q?tWPOFtpo/gyVg1FNz7tNnyMiksZjs7GbShh3e1a8VhxwBLy3BE7GBD47EIqp?=
 =?us-ascii?Q?e+i5u/iVJUaISyBaKRMjGa+xpOrD/hsQBiTpGS984O1zq+XKB8YL8dJWh6p6?=
 =?us-ascii?Q?LR5WvaXpw/81y/Z5uuD5lrm7sRfiyT+43Ux+89nkI/rnpBbV1vtmr9tOOC+x?=
 =?us-ascii?Q?B/9kGQpvPwk9pQZQOXw/2CfRxUw4TJrYLwO+9lfjdKP5RUq7h8mOrLiaPH+/?=
 =?us-ascii?Q?e9EzjN35R28E/eXamh9+7M78a0EEJMmrUba3mD6ka0b23EsTqsC863lwi3DG?=
 =?us-ascii?Q?1kPdVQMFSypCWNLRNo3c5ZwafCBDyVyR4ey6qAUD2sO2dctdIHg3RfOtN0bN?=
 =?us-ascii?Q?QAHHBJWPFngPM3cElLIFo9JfFYdbP678Onft8D4zXHQHBzy0bnf8td6AXapT?=
 =?us-ascii?Q?0wMEHAwa7kxhhw1LcwxxLpp+B695F1ecMsi/A9SVAslBDSkUv8SCY+ccnU5L?=
 =?us-ascii?Q?H8SOH3RNt0ozV/LW05zBREMPsEGNT0N40SyAz+M6E55EQsWe9Xn40BtBpKA1?=
 =?us-ascii?Q?Gie+DnZMkLLrt1FGBstSe6Srb4PZi8Rf823bNB4NQvW4zJP6GVlE1c0X4MCi?=
 =?us-ascii?Q?NPeaksjs9K5d29tqs4g4FZ+LTKljp+IFWeJXSnuyISTTLf4D3lHyMSKicHV7?=
 =?us-ascii?Q?RAIHCb4Hwq2UMzcFiv8Lk5l0Ewdu8RkJbZJiakrK0qCp4UOaXiDvpPBzz6hz?=
 =?us-ascii?Q?c6G/n1/o3RKwNEufsQLiGYjqcpixl7If9pV0Ap80cEKoAFFUqdD+5Vf15mwP?=
 =?us-ascii?Q?m40UQ7Nz/TuD4PJl20uNdhrIx5cCrJzzZojKmOGZR0QsXnzbZ6SFo7Ific1Q?=
 =?us-ascii?Q?EO1vnNmqMJYDQ7iqt4RJ7Jh1PGcO0CjydXEpHVkbr2cM5tnaCVr0bZxc1ATf?=
 =?us-ascii?Q?1NqFTHerfwyFgM2uWjhDtqyMC3aoU2ginXwR9cNKTjfmImJQvEQxSBZ/bVQU?=
 =?us-ascii?Q?ADtTFHXVd9LhY5ZWVi5JY6Z6xOsOMChB7AwTwHe4/7nnzdHkWpEc9WjsaWtR?=
 =?us-ascii?Q?9fftLQb2dGvbK2NDuhhI94YqYNqyjd9tDSyBAY4i1QH3c5i6yj09nGXYjMIj?=
 =?us-ascii?Q?FNjPZ6ZQAe/o+r8o2XgGMxvcxlGfxnBDtcoLdjiIOaZvDYmmofZccEzLtMuh?=
 =?us-ascii?Q?wqKj9R9AoHiLrg/OrAFYasnEuq0DCMyOiJBkzjtyNCGNbemU6lY5eM6p9G+3?=
 =?us-ascii?Q?C3dTsVosvxxO0tNe6rhZhKUmqyYqnCciTEee4A8UoXmbzvaficHe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202952d1-9abe-43b6-8126-08deedb14296
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:37:51.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRVLVucwnm9vIz3gk1yTKD0vpdNjETm0rDI7KMrnfJ93yautQOOp3or0TJ0UiwDdqp5O0y793jQFLpoGuKrgg/w2CHY5HSJz3FnUD10CreW5Aa+pmQeW4RD+OaUdBHv+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

On Wed, Jul 29, 2026 at 05:16:34PM -0300, Fabio Estevam wrote:
> imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
> does not disable it.
>
> Consequently, runtime PM remains enabled after unbinding the device,
> and rebinding it triggers:
>
> Unbalanced pm_runtime_enable!

can change to use devm_pm_runtime_enable()?

Frank

>
> Disable runtime PM when removing the device.
>
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..a695ba31db9a 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -276,6 +276,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>  	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
>  	int i;
>
> +	pm_runtime_disable(&pdev->dev);
> +
>  	for (i = 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
>  			break;
> --
> 2.43.0
>
>
