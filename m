Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6F3B9616
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149561; cv=fail; b=F2p7Mp6lPM9vL1jd0lZ7kzoP6Q3osxk1eFBjdyf+8BuZO1dn8edNY0pTvYxUHGrC9ywUddVYp+0OdRi76qMhLdRl1VNm/8xJo6Ypoy7TSvoCBs9wKCf5f1eZs1RNIXCimcGMyRdafql1ISquWw76i9aa0U9qxBMsVGXH3vWi43w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149561; c=relaxed/simple;
	bh=D+BdpmExguBclL2rjMXJcKbUkKzud5QiobMGAZi/fbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mqCv9Hsj0lIlJKVmSvcHvwIpz6IrBhlftAUW2iuusYtdhroDOUBrQteew7PI6e+8+Iln/AATmHNUuYvlvZVxim4R8vMp6Tbx02DVOsxBBecbhKewYB9JNDpHxaVBT1B/rhUrt7SUQhf8FiP7VOvnMIXwGb3Y1iMOt+WJ+97iMPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z47A898M; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z47A898M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1lkv2tWmmJ7gwIxDQmMw3nL6P7ZG0FbSnCdPw9brVbdX29XZR0f7UuCsVXrcT+PHOx9DpA3hUGHVB/rU9qaJ3UyIlAy6n8/EicH8w4eM99iut33N4ua8u/bt5rzxNFOiKUQA+WpNpYn/Rq3bJFK91qNX4DwQuiEFunjE/T1sP6NRs2sOhFmyhqLlRN2BkWzvJatbuPeY1CrSWsxYV947y77IPW7e4F3DOoJtMIfUnBzj7eKk3OFndIoME1KWYWgQrJmXRjhXOIb46lstSJhd3A/oTbfhqD1GmEP7N811ctpYXQZdKXvIYiKPKzu2o/EzBLIIr6Tc9v55ei2laLAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2eQFn8FaC2ehbiukPPvmqAP1lhAKnJH9RCzVWD7Z9w=;
 b=nMtEDsIgPzA8rdKZAZ4sSLntmc5t+7Y7L0Tzp24D1hdkn0uZoT7+nbsGy/yavTYhWTd1fhohtFvUjIQsCe9tsMN+29QCazIHDTQMxd8xIOTJmWqNd9mH5rs44gZivyXRr0ODSYjp6VYh7FXi7VXoOnVmCvHDbo3SGiBrWtRsSpj+TP6w8gb1ecdFvDC8sgWmc9GLgOZXNHcbA7B4nGS1s0rqCzFfZh9R6AZsxnRpABnuGXFEdNia7y9OJbaolaBvJGmBujx09Yy+NKWNcOKcsYvq3RLI7fH5XSSD7Dh/0jzP9bLZATJ5iP8fe8iz5hO1g5YnCFeM+wavM3mtlHeqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2eQFn8FaC2ehbiukPPvmqAP1lhAKnJH9RCzVWD7Z9w=;
 b=Z47A898Mrpxg1TTvrzOaPXmr4nzhjZAdznGbXlKbblqupRi4855XUcD8zxYri2AW4DJ6tIZ91bAl1YGRfYY06uAxZEfRgIHx5Yg+o/k7VFBTD9V4TbYKvY0tutzPy8DsScX27VsfVs2FsFZHcyJ758FwEDoeWapuk5mJ9ilaJWqWFuFDg4NzxP84mE10sU57hfPmcnmX6FM3D3L22QpWZFxviMlbJz4W9SXHtmN9swNYQ7ghrbCtFnsvJ/gRMNwm2kTszF/SWZEutlco+kCfJqTs4PjlxfDpvtYuFofpL0s/uEoil+VvSymMbwc7ndvrIyMBte0VxlwUgqje/vQiOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8462.eurprd04.prod.outlook.com (2603:10a6:10:2cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:25:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:25:54 +0000
Date: Wed, 19 Aug 2026 09:25:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
Message-ID: <aoW86-JvEaiDQC6r@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819090543.585131-4-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:806:d2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa14e99-4e1f-4708-03de-08defdfdc704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|56012099006|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	NTo4ONPQAIXgRybjdADPToPo+lobBEl25mx8Fre0TSh4V4b9HQAmDpebhyGk7KRC8fhCinj5UqKz2kU/NTvYXt3QeeCA+kDQ+nLjcgxUlsxYlEijmkpcKybCgnx6GFuz/qM1nnUHcF7mZTQ3pXNcoXIr6JtxxBTtlnBGdWc+mWyACjcRBE4N5Q2jN34X5LGo3IRphoftGWT8MHQRkW56eTTgob1kMunnqjpECNjTWfQT+63t0p6Bg7sRPMdNwAPhsCQq1yp1UISXP1N2z8xXKXjHG59n6iqMBlwGLzIY94AeEOx/qAo9YFucXndmtOpiXx67PA1GNWOIJusll3PnpchirVAZdGA0qGvWJkouNGhE7dV8neznihuEDW2pUPj9AZ7jKthp8sOc67jcfe4pGgfsP6IzAFCCnF+ryd+T3OXQj0JMfQL7z4gcVE14MMbmPtpHbbUuXWlaWXiUnrz1fs/AZseoC+N3DMCM/zhthy7Ll3HngOJNa1g55Ul26RkAlzdh8QCTPBUR6JS08ndqgB/DmnODPSnQK8K5dHdY5E5hz3Of7R3r2YhTYEU0EscbDGC5yC04E5m6lTqKXVmVCaSKwwOCUxAin0yV3PJW4nbLEFJ+XJ9xN2j/9SxUntNBBrQVUKDSq6tUSuweC7fICSk0AAR9bIzsS1qHqO7MsqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BjAi/0+Xeioqg4GwOU4SOwy9rTrUVHhHlCq4ZoqItGpOJFttj7rk8nXerhVp?=
 =?us-ascii?Q?pQ5yCgEEfb2Qvot2lAZgF39i8DTqI8PpagHrTm3yADRLfwqErdVVesEQDEa8?=
 =?us-ascii?Q?6vQZSSgnEfpso/+zYtzMCpsH3outchfe8F1ZPXNV2nWNYnU3uMk1/BTVumWo?=
 =?us-ascii?Q?dZWIKXEGZ6MreulYdmwIicFoiWkZcDBqVPgYYHeVBxNPaWB3pD34owjjNjMF?=
 =?us-ascii?Q?3wxKo1vJzILljlaI5acYdaADnQ6LY1YNYa85R34EIDdoukKG7PYkJcwDEcgD?=
 =?us-ascii?Q?rfbYLcHRAkM7W5IHl0jwNeUyJE4p5vwp/owhPxMeygsMA4qHiSb6waE1MZXk?=
 =?us-ascii?Q?0z0htlMiCJBDF+w54o2jBEzNwOohnCYNi+6clUK9HAekJEnPzTqs+Dy5fPle?=
 =?us-ascii?Q?BjZZu18whaSjMkxDJGYbp2ojqJRBr/1KJrHdUQryN9E1KbMUFvwkRJ1R/I0f?=
 =?us-ascii?Q?pVnst648Zi4Iqv5i5/Yxspl+C6QQl8bCC8qisWaduS0IHVZsPV59RTMsDq2Z?=
 =?us-ascii?Q?HR48lVcb+jduQEMgAJ4WKCLnVWrAgkguFF/mIoNn6GsxxouaA2DaXBQxNJGV?=
 =?us-ascii?Q?2oe18t2PzE1R+h+3WqYDSaQZRcQQUF3xy846lVryWwQw0NZDMF/x+xfyCYr4?=
 =?us-ascii?Q?bU+0oXxqBQsVFHabtkYYdWrM/VuwhPq1KXrIvbspW07thHMKEHPAm9vSPwTX?=
 =?us-ascii?Q?ssGDcxky6fZ+/OeWqnTNsh2uawj1h+ee+N4A3XA7LU672XXm/sdyO4oAuzwb?=
 =?us-ascii?Q?CkugJgnnpw8smiZ0xS31EmJgVzjPXMMcrEomglFsXaFiK9cUM0p4REL99tYg?=
 =?us-ascii?Q?IhCoZgwse0gESmgieu3zt8dxZxlnIam3r9lhkUMWBH3fiBKDSw5h6odAlJY6?=
 =?us-ascii?Q?tKLID8tSRlEbumEmCBPiHmL39jOjh+By5sCsfroa5O3NXbA8tUoSTCjoS9no?=
 =?us-ascii?Q?30tUtNSyWDKmbdM2mq+B13sU+roMf45ljarePk2V1uPI171PnqTep6OU6vOd?=
 =?us-ascii?Q?3pU6emlDTUDnbQ8nHrn6i7CQBR5yULV0VbHXLfUvEjc0iuSoVZ8XWbFrEd7y?=
 =?us-ascii?Q?4Q2aKQPxr5hPQln1CWgadTm01N1G6xfweHseegje7A3z8vCvkeDHytSn4lb5?=
 =?us-ascii?Q?vM98Re/fztwANG4kuYVcQ7xIuNX9TAQ3z8/LiVvnqCKyfrs82O8UqXwp2Ayu?=
 =?us-ascii?Q?shcsgmcCeD1P1dXqIDDpnekI4/z72mxdmD2X3rqdhTOXjwzSd9MBbWRJav3e?=
 =?us-ascii?Q?btapMJUfVxRav6l1atzm06C9fPGGp8PP3ODT4A/Seebn2NdT04iwZC1y1zoQ?=
 =?us-ascii?Q?wna9VdZknDKGbtyN1/5wndf1aJJ2F1l6zf71ZcUYwl1nBAPQg3xGeN+FwZIh?=
 =?us-ascii?Q?ghcRxL9jX1TS14QR+GPjCirroP5I/evQF7eXzDldTzLKpPCE/jOvyLNUVWYa?=
 =?us-ascii?Q?fIKRtfrismMYW7EovZPZ/6KZ7zSl0sLRhXJQjOgNPnQ2JgI4dQfA8jVedQHI?=
 =?us-ascii?Q?KjuUXxiLSVQztC3k4l6HNpGyVz/dS/WvfMnFS5riMtdkWC2bLfQsPaB/ZzNC?=
 =?us-ascii?Q?pmt6bBgmU/FJh7UMwLZZ6YNEwJgDmDdqlTbGnZKzrMZw2ufo1zWdaOGu0HJc?=
 =?us-ascii?Q?T+C/JkX0rZdq7VCUBom/lqE1Icb7NsgvM9Q5kKM5eAPEEqH/jqwck0DOvDlr?=
 =?us-ascii?Q?EmCulXMPQhzy2my2KgSs3KPeo7kY01l2sjdQ8AUdxQjXlYaE2sTQo42hhkcC?=
 =?us-ascii?Q?noyap3h/yFD2Tjs7DCIRZ0ehXd41KZESD00DGoRutl7JsYb/eOxq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa14e99-4e1f-4708-03de-08defdfdc704
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:25:54.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8t2qK75BXkF2mSrWSOV+In3PQPwPt18Q5mwtfr0L6p4gKZlGODTB+4ES6lt1OjKT3OgdynjbW5gFe7YA8o2E73/l7ZJP7qjbLgARDy9tzP/5GFWnEO3z7gofJVuqOm1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8462

On Wed, Aug 19, 2026 at 06:05:41PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> probe() maps the parent output interrupts with irq_of_parse_and_map(),
> but remove() only unchains the handlers and never disposes of those
> mappings, leaking them on unbind. The child mappings handed out by the
> domain are freed by their consumers and, together with the domain, are
> now torn down by devres, so remove() only has to dispose of the parent
> mappings it created itself.
>
> Dispose of the parent mappings alongside the chained-handler teardown.
>
> Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-irqsteer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 359b8ebc1bae..320082d3a632 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -283,6 +283,7 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>
>  		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
>  						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
>
>  	clk_disable_unprepare(irqsteer_data->ipg_clk);
> --
> 2.34.1
>
>
