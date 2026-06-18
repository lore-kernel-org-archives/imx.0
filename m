Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2ED40D59E
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781756050; cv=fail; b=Uh/HZL/lVqT0kZK6DWfgABPSsDlIIO7n6hf4ohKEAbDVmc7TShGtp3kPXuHfql3CiEVKD+9wAr/6tyOoVKyQbAeXXXLREWbbhe8kuG75YUre8HDW4O2g3f/HeSzgSlOpeIsJrfTVjFhUEwhx8hSZ1gzvwG/EocNlJk9IPJAFCn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781756050; c=relaxed/simple;
	bh=1P+q3NgjPlXzGTf04EJAewsSZI/pB2tbjcuGWFoFQ/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tyT39S5XG+40h75LTqGNuZR6fHABS7C5N/vE7x8L9x5KUqMwvthsGh6uoryTXJP1t92uBPlfJVB3NkhSWxfBd297OTalVslm/2/2SfiGBfFJ9VtlJqRu1eyU1y4ZVW1Q+AM37SE0X6oe+rj0CT7s6mknZPrTSB+eSI9SR63p/nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v+zRBKj8; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v+zRBKj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEHAbIPU10aRPLy9BVtoRK/PnPze1lEZdhFizCSc0JXgRWqyd13nGwI+/5U2kv/x250N0gaJeiORLTGekGZY1PEALQdgSff8vK7iJAW4xjj1sFPsh30tXpuOQEZgPhLrLAh8CBBmpLN72jYeENh2Xolppn5d6Nowjh6PYwgVag0sw028A/yNLe1iAWxjXq3EWIDgyucs7X6zeljAk1JnkSifzTYMYJ12bX8A1ofj/A3MhDgQxgMFRck4struCgm6CJzb7rqPTedlN2288JtIsHdNR9qGnSJzNv7fP4E2shGFIw9uCySz6DLJzw+6O6/34E/E5dDw8z6aWFMKW6sg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wezUr9dv/jGZg/MlJ4u/nej36Qs5f8IjrTOcxjW5FUc=;
 b=l0DtFQrPIXn9BVUnuecXT3KMI1KLca07P1HpBSzavcfrJSImHcGdHZ4Q8Yorlt53JyBAQd9XJq5z9f9HMXrTuykf2egeKxmXTDnG202sPPyKLc9SncNSNYd4EnOUdmCTYxwsnhPnq/MI/s6TVOxU/Ad6GQmyfXA86ExcGWY/vtJKUmP44XAAFrgvLt9HsIcfuradFQq3DjWkIcYRa8QjfVc+cfatMd3UqryqZJ5V1gh/1AN2CSUJJm6x96csLWVZVZED/RfDCKMp/gH1WNlyZfKk0Ua+vpxQckYfBWADxPa5ukvkxapEG1ImPqJozneVLMFYVVOKwYsFSY1Y8LpBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wezUr9dv/jGZg/MlJ4u/nej36Qs5f8IjrTOcxjW5FUc=;
 b=v+zRBKj83CqKg/2txWzQ+NkZ2IDowKWcGxEJO0nbhSwRjw3ouedUuovX6fgkie1/Y8pEExGqy7UKb9zJMq5jhf9qrg2M9NiSdU/K7FcAiMJFamHBfnpE8TmjyLE5rO19UZ1UZIoDPOK6ei7ltdfhdREWuAZ3zDjmblNuGh5LOENqPJlRvFhNT2MKnSunF1fgaBTGOSXkzDMtQuKrwfk69YlpFqAcrLiNR50/0WjoQMklDrFtJo2ztc9gX+YqiqL7KJcfmo1RHamsE4maOGVuWwx43UQyAqTMcT6iZhiF18jJHfhguwFumpLvuSiV6ecAhyKvvbf/tucOidG9h6DlFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7435.eurprd04.prod.outlook.com (2603:10a6:102:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Thu, 18 Jun
 2026 04:14:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 04:14:06 +0000
Date: Wed, 17 Jun 2026 23:13:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Message-ID: <ajNwgq96WRrykE5I@SMW015318>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
 <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
X-ClientProxiedBy: SA1P222CA0144.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a03b69-7b57-43fa-4643-08deccf00989
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|4143699003|56012099006|11063799006|5023799004|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
 yya9bMOEkLu4OlSpxa76uMDurOBMJnMyjaotunKcoYYi/N8v8plN1gB+RtJ77Tcxd5OfhPRj3qiQQ4iCxm6FffZcrmf2cXyLjSlZ6ctpHuRzp+DtphjVow6oCaEjRVBKjuwENxql3stvf90XbHI6g5IRkH89BgwcqYUZKSIvkRES1wokGoHFhgn56vidHwBbugCeHpYgH3ty9YvwoDLLAo1tu1qzHUlhFvgfmAjLVdV33q2v9aGs6DdRm76RgLYdHbflWfxKYGatHCvGtoVXhBnzNtoFYTavmqbZug1SxUQJax6qVDAkjrRa+lB28NXTMqMEu745bxZTFTZ2mE0YP6RKQwQdyCaEjScKwkN8KqeuPbvOwIfkuSgHMpZ6v39RRe+yLcL0xaoFEUxy5R+u8h4Fnv21XreBIv9uLLH5Sum73f6Ty4PMWWkMR8QDCprps3v/l0x+89jh0nUwjgf6kUWLW1ICsjSzGYiCRgGXrSAyYMN9Djzg00I18JRXLttIOVQIjcnELh8PdnCH+FgeGjuZTvnifH+OvcMqW2n2cmRbYkeGcafbkM33gyBEwAW644Qei5V29j9LwG8W5DbloHW8l5fmW/3jU8XDxJoUNLv/NQGtwu+W+jNpTrrzxH4S3UJ3CRG3J7rUIYisaelw35f976biGWhPOidebzF8jWWRWY1PD2BiUyr+Y+6ltnMR
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lPfDHPSCWweGMBypMiUns3efhKrziEN+6NcjSDceJdzvVLN+p3QcIbAQKfHK?=
 =?us-ascii?Q?trPUUSrTBgqcoB4C1o+kIgew8pMqDasyi5LQhhNUjEu0m5iSG+uz5zyy4aDO?=
 =?us-ascii?Q?ZPrsIWOJhU1Pq0d5KJuBn4V5Xi3D5xoZfDhlWzqZCnrnsJ5xmnDjxq6agS7Y?=
 =?us-ascii?Q?P33FfoUhSBgJaItJFPUMlKOz58vC4KCSXgCuiHXsJe2H/4TP0Fiv2uvill1P?=
 =?us-ascii?Q?t8YOr+kdiKZFU9m0Fq+i5T/PlIW4UOKcJrS3LHyVOPrtOOeigPcB6OMsA7Sy?=
 =?us-ascii?Q?s+FxbjmNqvy5JEMyHoCD09oCgwWbPzKEjLOlW2vH4HCELXPu1QpUBrZ9y4mz?=
 =?us-ascii?Q?d9mcfzGNEWLGdRrYVKBKsbhV5Z4lw52gtAI5UTG0w1E9bXKtvLVomYN6JPvh?=
 =?us-ascii?Q?KGJZPINhYGLl6perOV3x6gO0kI69zsWbPmxs8EJE4E7863Nab8Tg/jcZMqUx?=
 =?us-ascii?Q?TD8FmQa1slouxyk4dyOn/LcymO5yVZyo59j9yP0DUJlTdvu0SmCkTX7psfx4?=
 =?us-ascii?Q?/bMPMMqz5ync4E6IQMBnHY2NR+QrhB7OXtlr80lmHlVUIXNqVAqzOaccyOTY?=
 =?us-ascii?Q?eXUCKmMkv7UfOwY8uvAYgvtJBdjPrYBQL6u1KzXlSpC1MN7odN/VZZxoFmCL?=
 =?us-ascii?Q?ZW4EYdUC+BkVeAc+N7/QezvpS0hnIpbvl3C7AoHPgmmrqYqEC4qltm3hTdcP?=
 =?us-ascii?Q?vCqoYECIzBnSKWR4OKSgDVzM6JY6KMnoisGZCbtRtmL/nsEoPokHitCZv5Xh?=
 =?us-ascii?Q?e2LXRJND10yqsbQ0Yfeb4VhkWxn22HYjtcE4mHGpsx09ALu7EN4czNUAAP8N?=
 =?us-ascii?Q?wsxdqyjXGwAGvhYjXiJud72QjHN9PiIs5MBQ0PWU7dzIvlQBMiyCn4QQAOcx?=
 =?us-ascii?Q?mpt+q5UFuXnGqfaXg9xadNl+ZQdxdst3K+cp2oAczgXR0Y1/XxUUKglMnFSA?=
 =?us-ascii?Q?19JcOJNNfAK7i4TMYrnfonoUk1PseQtdYbmpLKSD6jMP5Q9rqLTDDSREaB37?=
 =?us-ascii?Q?7pG3RJOMkYM5hsE3q6Bx0N9SYlo3M9Pbh8jXaQ8R6JuVuUYh7cZ0CXc7yv30?=
 =?us-ascii?Q?MZqjX4Bch5iFOarHKlc26d2f4LiHTLm/dJxqXzjxf1xL4XAw27QIyKRk5bbL?=
 =?us-ascii?Q?L+SvRRzfUEVf+5cqrcXNSHdXMxIUiTicCr7ZxygjWNs7C7DSn3tF0EO9a0jb?=
 =?us-ascii?Q?SYHWUimWM6ZMhmoP4mwOg5nlfLGoVbEQ1nLbc5SazbXt8p+2Vvjvf9mSZXCv?=
 =?us-ascii?Q?J1HY5rGcwPmv9iExwz6+fq7OfQ1Kcgl5YVVZkP2UfepjRDfuxW2dmuESFVkm?=
 =?us-ascii?Q?/KibrCPtJ2GBH+Xp+oPxp9huwIKN5jsoyfmJvj7Kd4DlQ7B/j4lhOGMgu2Vf?=
 =?us-ascii?Q?7dA3zPVIpBnowncDVvieKk7O56XTXNQ07Cxzk8xzHTLlJusGusHhKxxtsF86?=
 =?us-ascii?Q?SoCe8X15FYhHkflZk9DTxBtowdoRMHS922g1Kt4RqTVzEAU5wQi5IQD005Fk?=
 =?us-ascii?Q?340Ac7nJs5q+HgL5SqYuWLJ2j3m29iMqE0dHL3kutttxQiAgW8o2cx4nIG2h?=
 =?us-ascii?Q?c4B1vkuY33hZxAsZPE+w03JheY4KyA/pXNM0C/wgrvSS8GENp0IDD3+XhCgW?=
 =?us-ascii?Q?UmLCWKocYl1UdZ64yd0xrLBTC+BpPkgPGefxA5wMYJIdLkHuRCOqDEldUHZ2?=
 =?us-ascii?Q?hHVanLCddyWEC7sELjuAr58v1/LbT19ZI6F1ErsRm1ihxQ/oKkOkGmH7x+ck?=
 =?us-ascii?Q?6GMAmTt4G8WxeQ+0c1hOTKHaS+2tA2R1ZLNy1Z1SDzsAMgVn4Au7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a03b69-7b57-43fa-4643-08deccf00989
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 04:14:06.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujYMiebnuqbg1npopW1pLoRStX+ZcpiBKPUkIezC9EEYo2VRgl2xb1yNUCVoPISHFxfJq0lvDWQD2Y5ewkL9IinM48oJ9JDCvBr5NrByVUwHExYrwP92wxNk5nb7BPhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7435

On Thu, Jun 18, 2026 at 01:36:20AM +0300, Sakari Ailus wrote:
> Hi Frank,
>
> Thanks for the patch.

Thanks for you quick reply.

>
> On Wed, Jun 17, 2026 at 03:50:12PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Many V4L2 subdev drivers implement the same registration and media pad
> > setup logic for simple pipelines consisting of a single sink pad and a
> > single source pad. As a result, the same boilerplate code is duplicated
> > across multiple drivers.
> >
> > Introduce a common helper library for 1-to-1 subdevs to encapsulate the
> > registration, media entity initialization, and cleanup paths. Drivers
> > can embed a struct v4l2_subdev_1to1 instance and use the provided helper
> > APIs instead of open-coding the setup sequence.
>
> I appreciate your efforts in trying to reduce the amount of code drivers
> need simply to get things done but I think there are a few issues with the
> approach taken in this patch:
>
> - The new helpers aren't generic enough, but require two pads; one sink,
>   one source.

It can cover many case already, there are many bridge type subdev. after
glace of all code, many CSI2RX is type device. It should one kind important
type/case, like sensors.

And I plan do 1 TO N replicator driver, which duplicate 1 sink pad to N
source pad (with/without register config), plus exist video-mux driver,

It think It can cover more than 80% cases.

> You could provide special helpers for just this case, but
>   right now it looks like that if there's something you need that the
>   helper assumes you don't, you can't use the helper at all. In other
>   words, more modularity would be nice.

We can add it later if need, which easy to replace 1to1 API, like I did
for sensor one.

>
> - The new helper should work with the existing types and not add new types
>   (struct v4l2_subdev_1to1).

May be save vep data into v4l2_subdev to avoid parse it every time. and
enhence media_entity_pads_init() to avoid refer caller data.

>
> - There should be a way to provide default V4L2 fwnode endpoint
>   configuration as well as to validate the obtained configuration.

Do you means remote_bustype_cap_mask information get from a callback?

>
> I don't have a good proposal to address the above but at least one way I
> can think of making error handling easier would be to use devm_() for
> teardown in more places we to today. That certainly does have its own
> issues though.

I tried it before, media and v4l2's clean up is not revised order of init.
Sorry, I can't find original thread. I remember laurnet pinchart said there
are order problem.

1  v4l2_subdev_init()
2. v4l2_async_subdev_nf_init()
3. v4l2_async_nf_register()
4. media_entity_pads_init()
5  v4l2_async_register_subdev()


v4l2_async_unregister_subdev(sd);
v4l2_subdev_cleanup(sd);        // Not sure if it save to move to last step
media_entity_cleanup(&sd->entity);
v4l2_async_nf_unregister(&csi2->notifier);
v4l2_async_nf_cleanup(&csi2->notifier);

Frank
>
> --
> Kind regards,
>
> Sakari Ailus
