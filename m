Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122896;
	b=dm/QGdJnXIT4maC0qFOH2us4a4ii9dEt52R7hP4ia9AcE/xSnDuLnlt8hlRtjNhvy3cw
	 5W++5eimx9ahhzj7IqkFzI8K3/cF3QncGeOf960Edp1+LHFm6Vg35oaZtQG5ktLXYJVq5
	 7r5HDvyNtpFNTQj7ZtY6BeH0WlZRF0J3YOlBU+EKwHxe2l/VnP5tCm3MyT38S1qzKcdvN
	 B4IDFqk5K6rnKtBgVwWluW/shV+vvJw06e6eDgu+MerlmyBbJwDyWECgcg3f0Ddb8SrvJ
	 XqXMSAXQVjPt25KzYqjm+BMgvNr7wJgHg9y0Q1zLDL6FmkLiRUmZU0DUs72XB2QEJkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122896;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uD/3GGb4aw8jMr2+9K5csmWHvkhaYmWZgQCieDk7sv8=;
	b=bGW7HMhT3ZvJjyZhHkZoChcBY523DwjhNgDce3JeJjvcg77SmhPxEIBj7XIGuIzsFeDJ
	 f1+oMq00wPLZCR9OTVVdophlkEfKqXOa/TwDSZpQJ0vpcAwe0+ksR82BkG3WnRIKYvjLN
	 7JhyCt3WEcghDFLj3YebevNO2kY2Wa4lkneoT28jI7dZEJicIKh9rSdTXE15x8iB7S849
	 tugnUFPhWisNd588a8HiEnCk6bmKMp1Ed93uuE214g5vAFHJhBEXT8T7tUotgQD+dSwze
	 OX6YsvAudYuH99VkPa3PIERg0obmajrB1ACxwHBww2wu4j7GoeM9+aFUS1ytqze1nvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FQLJC698;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.36
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2461606A33E
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2461606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FQLJC698
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuk3LqxCLC4mlXFjFK1WZlYP1IfGywqKe7Rsxov9hijMpz8AB8TqTWzRq9qIJ9FcgZ1423todz6k8RmokPgg/WjT75joUer1uNd9yM/8CoS5RTe6/B4I+c2giJkurIlPaGnXZ7uEZvjUcAg9AlQZ8ZQKPxl8CkntJ6eS5YLeUWMoa64+XX9rEyNazKNcMOV/0hep33hmm8PNSsY6cxzXbZ/+1fgJICrM8E3RSFmLZlQZo/IJHF6LcShtFxnu/d2UGHc/O2F/FIkpZKjZPC6N7f2GE7j57Pd+8d0x6B4NWwp/vLipbKtgd65/1tPHJmZpClZF4fL5o05aN2L6q5iwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD/3GGb4aw8jMr2+9K5csmWHvkhaYmWZgQCieDk7sv8=;
 b=u2ReYB/me5tvSecYitebamkbEZbr2dXKohPZS5opaPUMOgPXSWnC5/NYUsH2DCbFUIXts9tnVLNBlTLLucxPF5O+8ybW09yD7sInp5IlyxYCaQbWPPgNpvv6kSRQGYR3WzgJ35XctMVx2+l0dw3ZmXS7HghXte/mny45Dzxb7DSOH905occ7mIpLOa+cuMxaWZGsBLXS3zdZHGl0AhIpR2w9RNda4/veCYHUpdB8n0WnjfKMNuSEQC842Z+ddxdEAkORreZBX+/XFnWATJamSc0rRfbiRMa1w2jmP0G1BF4Ra0eeifGwYhfa2+hvU5KVRc9fCnzspLQBeeEXQPByFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD/3GGb4aw8jMr2+9K5csmWHvkhaYmWZgQCieDk7sv8=;
 b=FQLJC698khwSRn1S3/FDpeNCZkzct9bGzk+6At0SQgsmNc7dRBx2+zH+1anDWMRn06WwjjrkbMG9JxDdMZRyOreesAny1DNqae2KMQ7PPcMFiYL4acxA0sA4bMhTsV1FHms+Jb1QSvZn/wFFnX8j+lLZNiJ/GPl3Sa8Y3G5kL42AI1HPgbasaEIOFCItUNw5kbMPYje50/vFsBDUG+SsjYHJoc1qkvvm9yMsxVIXtS57dW5G3EeHJuM0ssYkCc7cG82+lQVqvs+8beU+QZqJZLkg97nEKnsJR4NKNwncugsxQ6cpQ2qy0y2FgzTXDZ6lUd241z0NFuJQOqO4wvZlyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9481.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 21:14:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:14:51 +0000
Date: Thu, 19 Nov 2026 16:14:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: coda: Fix potential use-after-free after VDOA
 removal
Message-ID: <av9mwwAmlRoDdU0d@lizhi-Precision-Tower-5810>
References: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
X-ClientProxiedBy: PH0PR07CA0109.namprd07.prod.outlook.com
 (2603:10b6:510:4::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 47322d96-a2a7-44be-c3dc-08df4682262d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261102130727099003|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	KJl8T0y+N9K2TDLq0teasWdCRp9/8iPJYshIsn21eWR3efdhybfycB1T2eG/GcWBsj+xW1VER6aCF0W/BKi7t+0GNersPv4xqmO6ITNxwq3brjeOIVp/ZTc9vDz51lvGbOKdQ/VFkQqnaiIOJ0MYyoxmZRxg/3IpCni2rLCkJvuXFtx/JKkUh8nWBpdncq4UwBNRxQKPCWVllHt1fXm3zeSIyCBk/ImFCCjtNUsfY/zLt05IiSX5S5ijKUvGPvxDztdG4iLHTUrNB/jdRrPa36TGRrvCg9w+RG0krHTxBXqakHA7RVR45tPJpCci/wUN1Rd/DaXHb5yxRkLkclkcQFxNLTYm5f8SzcZpx+WzZysFYoGPeSjfdp4uJ1ar540WYOjHb7OM6RFyKomxy+htwWNJV3pdJOlQ4emqbG//mJS6y1pAYkGF7v0s7HPiTJOchl2qMQXIl/MqgA4hjDO/lR/1EesLB3ckpZ0HqLBEohy0Zuel5bgJZ0t509zSkIFyxfIAWfon5jeslbiXm/J6UMzzToqouF3OuS1oHjsEOj+9uQJsrEhVQTJNf7zcT26QNqPbgffBBo3urGUfwrK0+10UjwEIjmLx3KBjqOjOoLlxwnaSqE1xkY+welXQDAxwSSVTP0yqo8L3mqZ3asVo/Jku2oRik3zGuifIADySEiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261102130727099003)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xf/TaFf/hFzsk7aAS4e8HBVAS/kbCFo/zrAI1vvWp7a5nAtasirilHUi3Zb?=
 =?us-ascii?Q?wcCxJtD2lMqeHakVZZPm4pG1jaS7KRqZ+wUrDSIH9It4uT4IlcRoP4oti2fW?=
 =?us-ascii?Q?GGGXxr9OqpaVYyVT/4IMpJQOMKW4jEhbQ5hudxlUND2XuxpC4Y6l3IuHzEh9?=
 =?us-ascii?Q?q+/RHoBvE4+TXo+LYVc71EYPinZ4TJORUn7mqbU8ShhKMQcxU3oUsFvIi4Q+?=
 =?us-ascii?Q?/GOe/LJjqAHaIVTsbC3AkBqOTG49t4v6E5CBuvjc3U86tMG/7aQxLilOWr9H?=
 =?us-ascii?Q?tvifhxrgqEv/1lBsZSbSgIG27dlYfNXetFMqcsai8YL2k54HSob6mCiK7r+Y?=
 =?us-ascii?Q?F9NVUWPIT3iDvKSs82grUKcpjgIwvv5fyI8pfpAjwxH5bX7kTSHLHwRmePYl?=
 =?us-ascii?Q?RvAUcDhGRGynRttA+sg4OoI2qWlSQUcv+0r+OMw25NCYyAd14v7uhBHi02b9?=
 =?us-ascii?Q?AHsM8eqva1n25/XHWkC+42HolzOAX58z/8+9HbM43v6lLlehmtoed65C66ai?=
 =?us-ascii?Q?qNk9YFGP2EhNfZ16hudGMUswkdDUBIDJPjBwUQ2QzNTyivLVsD9OH1R/iQCr?=
 =?us-ascii?Q?wDn7RroFQ2PgDwax5zqx+f7gC4RxGVJ87jumehqROda4b/eESO/26MLFQ+ho?=
 =?us-ascii?Q?Jjd88uxo3vuGvenTAEnsfzj679Bn45fSf09rBPnzJBxRU+F266kjq3DibMdl?=
 =?us-ascii?Q?Y9S+ItKGzAdZqv9e1/e2tcNEPhujI1E9Ry1smrudHs8eHTW65yfkvnGmawWr?=
 =?us-ascii?Q?yapN8pX9vnU8r1LGBm5FjNEaHU5l+B4Y1KZvzPgYi098hOEekRMrvCK9ratU?=
 =?us-ascii?Q?fTUOnr1clYuKXJEq9EGIhHm79tzL0UzSQxYBvlWrSNqU7xg50qHMmc0q7unU?=
 =?us-ascii?Q?IouEb7EoMCSMQbRVXMKWP6fjZDJtI2WAHu49hzIxpyG+H+2tCkacMQQg5X8v?=
 =?us-ascii?Q?eIrK621HaiHJGmS1EejrYngS94qnWOpPlrxb3+qeMnCTngzSHm8ofVC/VKpn?=
 =?us-ascii?Q?I6Vo8fi/y5LSLjeCtd/KYqEyBjO7GV8Ry/KSN3yx/N3jiSQsYLm039wAbK3C?=
 =?us-ascii?Q?YcB27jA2QSvn0pguAFhksSJJcWnCkHw7wbo96gTCm3HNZQIkST3JyYoCFAHL?=
 =?us-ascii?Q?RBX0gArJaBCBrKjCteOYFH2/Hwm/wHjOqUdMK+FFy6uhm7YMs0xv2Z2JY78H?=
 =?us-ascii?Q?bNhrRSyr8WxbcnwyZcSUFgMFvW9MNzVOG9LQMumGh+V5UNfDG15ksMm5oyGi?=
 =?us-ascii?Q?f3W6F1RTUxDxSZFKudr2ssb77kQ2dDKhoce5EdhCDs33Ov6WRvy9a6cUPvF0?=
 =?us-ascii?Q?rflAigxRVeLLDWZM8tcdIDut6lfXW64Eyk83idssky4fjQZdmO8FnyhENutS?=
 =?us-ascii?Q?ps4umxh5HpH/Y6mBczFnOMCr2e/8bxAU/USB0dPDyQ6bAXJdmTT3B9batPhk?=
 =?us-ascii?Q?V0LfQvVm9ZgkK+FOqrfX6CSKrKMn4Kb0UTCTDgAjbMchOR/J/CJcWbR698yf?=
 =?us-ascii?Q?WGacfBA+uBX8kWbUWOW7YstSiwNKDJAK7WJfpSCR8VCfWmNjOupsjiFMT9/E?=
 =?us-ascii?Q?8wPKREgY16besEXHcb0g6AnpfN4AD+7tDd+7RiCcOcyYm+irvMTAXTHUCFLM?=
 =?us-ascii?Q?5LtSD4twmLuoUHKOSTlYqTBQ1VhHoAErSuzN40c0OT+PHwQbbyWP8QN5gjZg?=
 =?us-ascii?Q?wABumBfD1m7TF6zl40GLQQqXa6h0iFtIDSTq0y5ggFhxN5lJ5skUzSyREFtt?=
 =?us-ascii?Q?KfBf8bK1L24+u3M9tOYNQMLtwq6rcEgHA9ppYIFX15b4FhK72aq5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47322d96-a2a7-44be-c3dc-08df4682262d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:14:51.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXdaqn+AZNOjkRYhlM+7bUZ2QYXo2dphl75kX40v+h+PSTfqEhShgVRVGce0X49qNS0MVgY1EXb/Ay8y0SijisT1kqZUXycRzZ0JH3gaPNtJRGt2olhgxjXIn9fXBYMB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9481

On Sat, Nov 07, 2026 at 02:54:30PM +0800, Guangshuo Li wrote:
> VDOA can be unbound while CODA still holds its driver data and open
> contexts. Their next transfer or close then accesses released state
> and device-managed resources.
>
> Retain the VDOA state for its consumers and contexts. Serialize hardware
> access with removal, stop outstanding transfers and balance the clock
> references before disconnecting the retained contexts. Also release a
> VDOA context when opening CODA fails.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: e7f3c5481035 ("[media] coda: use VDOA for un-tiling custom macroblock format")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 GCC W=1 changed-object compilation passed. An
> extracted-code test with mocked services reports an ASan failure before
> the fix and passes after it; this is not a kernel reproducer. No
> hardware test, ARM64 build or full linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>
>  .../platform/chips-media/coda/coda-common.c   |  14 +-
>  .../platform/chips-media/coda/imx-vdoa.c      | 133 ++++++++++++++++--
>  .../platform/chips-media/coda/imx-vdoa.h      |   8 ++
>  3 files changed, 134 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
> index be37ea568bfe..b519cf8541de 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -396,7 +396,7 @@ const char *coda_product_name(int product)
>  	}
>  }
>
> -static struct vdoa_data *coda_get_vdoa_data(void)
> +static struct vdoa_data *coda_get_vdoa_data(struct device *dev)
>  {
>  	struct device_node *vdoa_node;
>  	struct platform_device *vdoa_pdev;
> @@ -410,9 +410,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
>  	if (!vdoa_pdev)
>  		goto out;
>
> -	vdoa_data = platform_get_drvdata(vdoa_pdev);
> -	if (!vdoa_data)
> -		vdoa_data = ERR_PTR(-EPROBE_DEFER);
> +	vdoa_data = devm_vdoa_get(dev, &vdoa_pdev->dev);
>
>  	put_device(&vdoa_pdev->dev);
>  out:
> @@ -2721,6 +2719,8 @@ static int coda_open(struct file *file)
>  err_clk_enable:
>  	pm_runtime_put_sync(dev->dev);
>  err_pm_get:
> +	if (ctx->vdoa)
> +		vdoa_context_destroy(ctx->vdoa);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  err_coda_name_init:
> @@ -3220,9 +3220,9 @@ static int coda_probe(struct platform_device *pdev)
>  	dev->iram_pool = pool;
>
>  	/* Get vdoa_data if supported by the platform */
> -	dev->vdoa = coda_get_vdoa_data();
> -	if (PTR_ERR(dev->vdoa) == -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> +	dev->vdoa = coda_get_vdoa_data(&pdev->dev);
> +	if (IS_ERR(dev->vdoa))
> +		return PTR_ERR(dev->vdoa);
>
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret)
> diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> index cd085c1c73f4..d9249c943dfa 100644
> --- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
> +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> @@ -9,7 +9,9 @@
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> +#include <linux/kref.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
> @@ -74,6 +76,12 @@ enum {
>  };
>
>  struct vdoa_data {
> +	struct kref		ref;
> +	/* Serializes context hardware access with removal. */
> +	struct mutex		lock;
> +	unsigned int		num_contexts;
> +	bool			removed;
> +	int			irq;
>  	struct vdoa_ctx		*curr_ctx;
>  	struct device		*dev;
>  	struct clk		*vdoa_clk;
> @@ -126,7 +134,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>
> -int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> +static int vdoa_wait(struct vdoa_ctx *ctx)
>  {
>  	struct vdoa_data *vdoa = ctx->vdoa;
>
> @@ -142,17 +150,43 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
>
>  	return 0;
>  }
> +
> +int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> +{
> +	struct vdoa_data *vdoa = ctx->vdoa;
> +	int ret;
> +
> +	mutex_lock(&vdoa->lock);
> +	ret = vdoa->removed ? -ENODEV : vdoa_wait(ctx);
> +	mutex_unlock(&vdoa->lock);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(vdoa_wait_for_completion);
>
> +static void vdoa_stop(struct vdoa_data *vdoa)
> +{
> +	if (!vdoa->curr_ctx)
> +		return;
> +
> +	if (vdoa_wait(vdoa->curr_ctx))
> +		writel(VDOASRR_SWRST, vdoa->regs + VDOASRR);
> +	writel(0, vdoa->regs + VDOAIE);
> +	synchronize_irq(vdoa->irq);
> +	vdoa->curr_ctx = NULL;
> +}
> +
>  void vdoa_device_run(struct vdoa_ctx *ctx, dma_addr_t dst, dma_addr_t src)
>  {
>  	struct vdoa_q_data *src_q_data, *dst_q_data;
>  	struct vdoa_data *vdoa = ctx->vdoa;
>  	u32 val;
>
> -	if (vdoa->curr_ctx)
> -		vdoa_wait_for_completion(vdoa->curr_ctx);
> +	mutex_lock(&vdoa->lock);

use cleanup guard()

> +	if (vdoa->removed)
> +		goto out_unlock;
>
> +	vdoa_stop(vdoa);
>  	vdoa->curr_ctx = ctx;
>
>  	reinit_completion(&ctx->completion);
> @@ -192,9 +226,44 @@ void vdoa_device_run(struct vdoa_ctx *ctx, dma_addr_t dst, dma_addr_t src)
>  	/* Enable interrupts and start transfer */
>  	writel(VDOAIE_EITERR | VDOAIE_EIEOT, vdoa->regs + VDOAIE);
>  	writel(VDOASRR_START, vdoa->regs + VDOASRR);
> +out_unlock:
> +	mutex_unlock(&vdoa->lock);
>  }
>  EXPORT_SYMBOL(vdoa_device_run);
>
> +static void vdoa_release(struct kref *ref)
> +{
> +	struct vdoa_data *vdoa = container_of(ref, struct vdoa_data, ref);
> +
> +	put_device(vdoa->dev);
> +	kfree(vdoa);
> +}
> +
> +static void vdoa_put(void *data)
> +{
> +	struct vdoa_data *vdoa = data;
> +
> +	kref_put(&vdoa->ref, vdoa_release);
> +}
> +
> +struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *supplier)
> +{
> +	struct vdoa_data *vdoa;
> +	int ret;
> +
> +	device_lock(supplier);

why not use device link ?

> +	vdoa = dev_get_drvdata(supplier);
> +	if (vdoa)
> +		kref_get(&vdoa->ref);
> +	device_unlock(supplier);
> +	if (!vdoa)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	ret = devm_add_action_or_reset(dev, vdoa_put, vdoa);
> +	return ret ? ERR_PTR(ret) : vdoa;
> +}
> +EXPORT_SYMBOL(devm_vdoa_get);
> +
>  struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
>  {
>  	struct vdoa_ctx *ctx;
> @@ -204,16 +273,26 @@ struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
>  	if (!ctx)
>  		return NULL;
>
> +	mutex_lock(&vdoa->lock);
> +	if (vdoa->removed)
> +		goto err_unlock;
> +
>  	err = clk_prepare_enable(vdoa->vdoa_clk);
> -	if (err) {
> -		kfree(ctx);
> -		return NULL;
> -	}
> +	if (err)
> +		goto err_unlock;
>
> +	kref_get(&vdoa->ref);
> +	vdoa->num_contexts++;
>  	init_completion(&ctx->completion);
>  	ctx->vdoa = vdoa;
> +	mutex_unlock(&vdoa->lock);
>
>  	return ctx;
> +
> +err_unlock:
> +	mutex_unlock(&vdoa->lock);
> +	kfree(ctx);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(vdoa_context_create);
>
> @@ -221,12 +300,15 @@ void vdoa_context_destroy(struct vdoa_ctx *ctx)
>  {
>  	struct vdoa_data *vdoa = ctx->vdoa;
>
> -	if (vdoa->curr_ctx == ctx) {
> -		vdoa_wait_for_completion(vdoa->curr_ctx);
> -		vdoa->curr_ctx = NULL;
> +	mutex_lock(&vdoa->lock);
> +	if (!vdoa->removed) {
> +		if (vdoa->curr_ctx == ctx)
> +			vdoa_stop(vdoa);
> +		clk_disable_unprepare(vdoa->vdoa_clk);
> +		vdoa->num_contexts--;
>  	}
> -
> -	clk_disable_unprepare(vdoa->vdoa_clk);
> +	mutex_unlock(&vdoa->lock);
> +	vdoa_put(vdoa);
>  	kfree(ctx);
>  }
>  EXPORT_SYMBOL(vdoa_context_destroy);
> @@ -291,11 +373,16 @@ static int vdoa_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>
> -	vdoa = devm_kzalloc(&pdev->dev, sizeof(*vdoa), GFP_KERNEL);
> +	vdoa = kzalloc_obj(*vdoa);
>  	if (!vdoa)
>  		return -ENOMEM;
>
> -	vdoa->dev = &pdev->dev;
> +	vdoa->dev = get_device(&pdev->dev);
> +	kref_init(&vdoa->ref);
> +	mutex_init(&vdoa->lock);

devm_mutex_init();

Frank
> +	ret = devm_add_action_or_reset(&pdev->dev, vdoa_put, vdoa);
> +	if (ret)
> +		return ret;
>
>  	vdoa->vdoa_clk = devm_clk_get(vdoa->dev, NULL);
>  	if (IS_ERR(vdoa->vdoa_clk)) {
> @@ -310,6 +397,7 @@ static int vdoa_probe(struct platform_device *pdev)
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
>  		return ret;
> +	vdoa->irq = ret;
>  	ret = devm_request_threaded_irq(&pdev->dev, ret, NULL,
>  					vdoa_irq_handler, IRQF_ONESHOT,
>  					"vdoa", vdoa);
> @@ -323,6 +411,22 @@ static int vdoa_probe(struct platform_device *pdev)
>  	return 0;
>  }
>
> +static void vdoa_remove(struct platform_device *pdev)
> +{
> +	struct vdoa_data *vdoa = platform_get_drvdata(pdev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +	mutex_lock(&vdoa->lock);
> +	vdoa_stop(vdoa);
> +	disable_irq(vdoa->irq);
> +	while (vdoa->num_contexts) {
> +		clk_disable_unprepare(vdoa->vdoa_clk);
> +		vdoa->num_contexts--;
> +	}
> +	vdoa->removed = true;
> +	mutex_unlock(&vdoa->lock);
> +}
> +
>  static const struct of_device_id vdoa_dt_ids[] = {
>  	{ .compatible = "fsl,imx6q-vdoa" },
>  	{}
> @@ -331,6 +435,7 @@ MODULE_DEVICE_TABLE(of, vdoa_dt_ids);
>
>  static struct platform_driver vdoa_driver = {
>  	.probe		= vdoa_probe,
> +	.remove		= vdoa_remove,
>  	.driver		= {
>  		.name	= VDOA_NAME,
>  		.of_match_table = vdoa_dt_ids,
> diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.h b/drivers/media/platform/chips-media/coda/imx-vdoa.h
> index a62eab476d58..e0ab414ddf5a 100644
> --- a/drivers/media/platform/chips-media/coda/imx-vdoa.h
> +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.h
> @@ -6,11 +6,13 @@
>  #ifndef IMX_VDOA_H
>  #define IMX_VDOA_H
>
> +struct device;
>  struct vdoa_data;
>  struct vdoa_ctx;
>
>  #if (defined CONFIG_VIDEO_IMX_VDOA || defined CONFIG_VIDEO_IMX_VDOA_MODULE)
>
> +struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *supplier);
>  struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa);
>  int vdoa_context_configure(struct vdoa_ctx *ctx,
>  			   unsigned int width, unsigned int height,
> @@ -22,6 +24,12 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx);
>
>  #else
>
> +static inline struct vdoa_data *devm_vdoa_get(struct device *dev,
> +					      struct device *supplier)
> +{
> +	return NULL;
> +}
> +
>  static inline struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
>  {
>  	return NULL;
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
