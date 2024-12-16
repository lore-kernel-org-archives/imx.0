Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A32066C1
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369302; cv=fail; b=oXWyErTHLj3ufKoekw0BKZFvQ7i6BZmdVLxXwKDqE1qJPhMY9I2TQZGQ6/0HZx4pL+e/beH+Lys8xbAljzK87ucPvEKoWZ+KL33yXg8UQ/ZSpQCWzNX+CW92jF/v83xJrtNe7pSViBcPaKAhXgpdpibuxHQJ6EAmaZp0tNUYj6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369302; c=relaxed/simple;
	bh=2dfSdISbW5qZS+G4iM1VznSzmmerhlCuQxsDrcuxKRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c1BuCOOcK91L2j9CskZ5ON8PeH3g8GzChZ1APtiuSU1u7buEFZegjw8yLVKhRCZ2fzWpU7o17neEcdlIQCpdFODEbNYTKo+zp5FHxSWyowN1rDegI+U+2S/4mqA6zsiwcF7CVATAo4HYw6ZV2SwCKyfdWuDONK7l7VnMTW2BQ4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W0UCQRoX; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W0UCQRoX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0bshDPLLx/pbfcZPirMe+7PkXk1sFYbo0mEuUl3HFhiqrhJS4N8GSgOo3tkSxwbund+0o/qsN62FDjWxL1yzZwJAg+AsMhyhgn1CI7cN3vZzq1P8a6bdSwDay6LpVDWxfwEpsdvcO1cgNIdxPH/aCNGKO0MDsNOL0j5rYg32hOWf4ydi2p7EulnlPeO1KbjL616oArRW/hCZ1BJ/Sjd+v1Xo6julTi+vGMnSmz9ych2BL4eQmSU7YPrSWu+39LT8lxwP1LdNSLyf/xoOipLwmEpPTZVix5Nthn1pFjFIkzDIVM+pUfQEuuAYQmINHRDfvto9OZVfsPBDJxSNpQdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rqFmJ/8WGlKtn6fbwglkUW8D7ZseTRSOj7zZfNs0bM=;
 b=QEiymojd7VlNd2dMt95v4A3RYcl1qhnuDKq8NGDtxqkJfd+ZnxY4MRZZ0e1KMsqG0XmBMwKE6ikpJ/+IKIhHo95xm1zhzUvHNzaX4hVAQfPoaIpeybdeBEMXOUVNn+73XzI00JTbRcrYGyJwt4/tUyyapkLdq8mSVEu3ObNSKEVhOG9blwNepBBXaeecLhQUOzgI2mkGV8B2SLj60kVScFjy5i4H8MaYNzndtLTlYYs/qqakbqEDkmWJvuZ3wMNZBSIN9HCC78gQSagA0rdRdg6QXgGnpXiv+XWG5bqfkOZqg/hn3SJ5k3MyqjtSqUki3apoN5skFTgDSPzleZZfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rqFmJ/8WGlKtn6fbwglkUW8D7ZseTRSOj7zZfNs0bM=;
 b=W0UCQRoX6JEJ4nyjZjfUHlDBJ25lus8AWzg74wkJnZ6MdEfFji3m7xj9oPlzVW+eSCQt66rqaSY/2FF9BtcRvAke2wQeLagCbEXQVVVt/JCG48aGlwemMsTkza3j5yaGWsNOuPZpAwYjXBW+P87l7/Yc23Y8RsWeSxTVcyE7ELdGkqWAMItevBWmuBuppuV0EIWrWOK5WEiegsBCNuqxFaPgfEi7AiwsD/BzHfkirUR6Ns25aw9KG4+aLeRXTs/YO+mN7SP/2xX2UntwKfRUZeJDo6eTthfssWzx5Loq3bjBc0RXYTw88AP4CmDR+verzTU0VoFG0LqFCHo4wmA/8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 17:14:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Mon, 16 Dec 2024
 17:14:56 +0000
Date: Mon, 16 Dec 2024 12:14:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: vkoul@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] dmaengine: fsl-edma: implement the cleanup path of
 fsl_edma3_attach_pd()
Message-ID: <Z2BgCnf+DTiir/uV@lizhi-Precision-Tower-5810>
References: <20241214040113.626275-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214040113.626275-1-joe@pf.is.s.u-tokyo.ac.jp>
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: c10de292-dfbc-44d7-866e-08dd1df529d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?phpQRZQuMreTKQq+alfo+bkqUzmhRTEYMuQamnCgSl8/V8e9dugw5omTe66L?=
 =?us-ascii?Q?ywxxaWv6HdOIuTFdwcD7SuS05GHjjJYEm0nF+idEDBSrT7elnqjmnlg8kzSi?=
 =?us-ascii?Q?bwBnKLUGwUAf5yD7yBKZcKHskExcsmc0boAgNAv1finmm95XZF2K4CEgmqz9?=
 =?us-ascii?Q?yM1WVx4o6cV+PgYt5MTDzsZ/3YF3VwwGGZPW3SC9ylxRUy7gbNjKsHoqfB1W?=
 =?us-ascii?Q?DCG0GbC1aBPnZQwg4RzPBoaoF0R97vSVTv4A9+xbRZS18cbtgI1tZZWsR2eg?=
 =?us-ascii?Q?CMZfWB0k1MLTiS/ZSXWYnB87Wu1Rh4klWMkgWq1lC9pEG12QnXrBEgI/3U7P?=
 =?us-ascii?Q?NY6JOaTYnZ1EOFubNknBO9nXwhpjRPYDJWeZRa3msQG6G6uXikg51Fc9KA0K?=
 =?us-ascii?Q?A8q3kez8uQ6Cerv3La/oNGxfUSHgj9htnYP+KQ6y8M4E0S11uF20dbN0ZA+2?=
 =?us-ascii?Q?3Sd05iipHNjGQnNwnlqCDW7p3+W2GyIvyXbbNuRb3BJPb1lF6WmH6ErCaTZs?=
 =?us-ascii?Q?FfklvoChhs4F/RAvMgygV4wceqli7i5OiB7uWyNW5WNLhIE4/aelLLNY9LAV?=
 =?us-ascii?Q?a6A4mjpsynU/4BD85qNjy2/YlrEz11yzksNN+fH9qWsJnHwU19qIbkwrZ5Sn?=
 =?us-ascii?Q?jZ4h1LwA8aY7Tl912CEEH9ewRT3oPdm4QLD9tvE9RRztbdlwX7lLYfXjDjN2?=
 =?us-ascii?Q?+xJ8YdtWPSIHl+lNd34DTefaKM0xDriJrZ8Kfy/+lEdz1AYEAxNBcy1GBnnr?=
 =?us-ascii?Q?3q7nbbGPIzwTYzsc9XbD0rvFD2dM5ImNlQv34gs9NjBOijDwDgXn4oeNBID6?=
 =?us-ascii?Q?x4JVHklqLBnk8VgE2Emw1ppfq4fh75x6tGRmlEApKAPd7LU3hN469Djay3sC?=
 =?us-ascii?Q?Wqr0bCqODu4a9DP08KrjO4sWDkjWpH2FmBMfbBg3azK6ZCWQahnCa5COSx9Z?=
 =?us-ascii?Q?sS0xEiNrm6Q0Kn/3DSf33j5BxS8Mz7eQ5xUpq/mllDVUVszC7tv6T6N+4e7F?=
 =?us-ascii?Q?l+SewEcLuarY7Oy/WucPH1B9ayBxsSrbQhviQ5GRryJyye8puBMcIwiMgEfj?=
 =?us-ascii?Q?HBebfnIOYAhF7qT7vppfib1N2NZKoPVQtCpE1pPB/BKK1g6QG9b2iOt3Rd4g?=
 =?us-ascii?Q?CAuPUMYrpyLxOU0xKUaQUXj4lUaIcPAovOFqkokaAmaGs2EBVlDolfb6aB3Q?=
 =?us-ascii?Q?7/pfmquiFAY69ljgYG73Oll6xd4dYT0a4Ew4aR645oaWEAAuWXxZ9yjcfAWz?=
 =?us-ascii?Q?Q8qtwJ/vEP3Ah9V2cVsf0NtACSndnwJm+xs+MF0meRXMT/j0aBjcPrQhrKxO?=
 =?us-ascii?Q?jlMi8+iZGfYktmv9gMv0AArDz4SxthfT840v5ERs0G4pKEenQERbLfQ60EFj?=
 =?us-ascii?Q?mdCOmNBfEwfjNKlktPM0r2UvTxRJ/L5YSh8t86I8IyUOUs026NsEBWuU+6FL?=
 =?us-ascii?Q?V4gY2Sx1MYUc9y94rc9yD1PIu2KAg8x4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?auNi8L5o71JK4iov3+NZjosQMZ2+ENQ0nsH9kIujTIldC3ui65e8tDEXazsO?=
 =?us-ascii?Q?FCUviKy0/7m/iR5pLDkPi0w5NdsKcVq391m9G5Zq6jtWs+Hrob2xBH9vo9eY?=
 =?us-ascii?Q?v3QD2PvP0NNjQtijBvfnCKj9Ga/LFl90jSzttbFJJFB/d3d2eEtzvMobLHcZ?=
 =?us-ascii?Q?vDZbR09O7tppHzSdY2SDKeRvZKyJBymTgCIWcwiPs/9A3CNRzpFvh+FhVsg3?=
 =?us-ascii?Q?OTOKWpKay1kzUcZO2om1ZIP0xrNSUMnWpmqsYETPTJ8hjNfE6TbZR469Yw2C?=
 =?us-ascii?Q?+IFX0lxTW/8bRvJILW9lmjHHAzZJoDSJYMh0NLVn4LrxDFGTmeL3sxfqp2br?=
 =?us-ascii?Q?RUpxcs83UdjppRbQzRtBplvT2ymlsYVuhLMN0Ngx4WQ996GhohDza++3rgV1?=
 =?us-ascii?Q?+iFHdEyXtDkg01hky0TvQhxhLFecLgcS6K1m4kEYJFYSiWX+wZE9IIQloPOf?=
 =?us-ascii?Q?joB42pyeM7YNPnEFwvnwFOmVLjge5okzsQDbjwa5C/3AQjhgLm+SScxqCHTJ?=
 =?us-ascii?Q?ixWJoJJ8AyzMgyLwqM2kSwsBt9XELBNQQMRs8p8QmSxJfl3fXtvx+R34GoD4?=
 =?us-ascii?Q?gEtUckTIGSL53/zOlTFWzh/5YudLFmLTpaN7D9cIUcObvKb3KGBM9n89BVEF?=
 =?us-ascii?Q?wWnQa/AHONcMV8OyZaFn4vgoCvPWNDco310DjJf2hNC9iENfkk0UdAPXCCo/?=
 =?us-ascii?Q?pQ0wowSsALP6cDh5g046XKrN4WAcT564NsdUDoL8h1M6BYNZc8HGmt92vp/b?=
 =?us-ascii?Q?Af4pZyafUDY+SJlRc9eL58sAXoNRYG0M8zDwZzfHxPJdIfXZwzENkWlEe3Gh?=
 =?us-ascii?Q?y8ngKbHGRN3CjRMLyB8MaguQxaHiAzQSYCn+FUuHbBwybCzAXpCv6JXPxRLG?=
 =?us-ascii?Q?Vbbev/0v0n54ks4suv042L2RjFGAa4nkMUCeIBRooqgJlVJ5GqJ6TqzMnwAK?=
 =?us-ascii?Q?MQUwgl1KbSdt/ukqR4b2kkThcnrXNeLzfyYfOh99Rfw+ye3KNhqwENKt98Ik?=
 =?us-ascii?Q?leIv9OZFBBOTTk/07xZCNnkeFpc1agzmMm+Ea2XhjqwuJE92MrsFmvBzjHZY?=
 =?us-ascii?Q?esc5KO+Fyi0MQ16gBA+70FQ1D0/dNmD1RRxt0yuGrg0cModkwDPcyIqKALnV?=
 =?us-ascii?Q?1krmqPj3zg/XWfu1MRZ1tS72pnGpz65rZvBYo7utzHbbvB/LFJThGLA8ywWC?=
 =?us-ascii?Q?yY+u0w/eIhcR7Oea4sVEB6Km8149cKxoDE8aa26dpkNghaU7TLL7EcSsbVT9?=
 =?us-ascii?Q?djBnTCSE4WebtUM1c2CdQqsgvverME+EhCOjoYpFw7JHrQ98o1upixVQ6U56?=
 =?us-ascii?Q?XN1bk647VQz593GXoRgyvd5OPZGpgHSJjHSJfMHbJ5dzL80CtOFLAxVkwoNa?=
 =?us-ascii?Q?f3sfsm2XDTm8OAmf+FFXfI5ywwI8+ZpHACZTPJQnPQKd5lb7LEV4tEAABLOk?=
 =?us-ascii?Q?THfzv6sb06Wwsm91gLZnLCgWLUWXCBV0y2eUyZLHtWAddYc26IDm+8+lzTmQ?=
 =?us-ascii?Q?7wWFT+ABekpJifH17V3GvuMsmmn+UsTdA7fb7OD332z8gpq6U+4zAAjNJw9y?=
 =?us-ascii?Q?6vsoNVM+bhDboJXi1GxoQJ1xESXTGpmXjjKjkgnC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10de292-dfbc-44d7-866e-08dd1df529d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:14:56.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLCsJjWVT0imQItpGXIhSPWNkvmUDQ8sMn7kInHlscuSDT5aiRVUmthK9G0yxIeNMEU+EUSAsQwFJ8Tk8EmdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218

On Sat, Dec 14, 2024 at 01:01:13PM +0900, Joe Hattori wrote:
> Current implementation of fsl_edma3_attach_pd() does not provide a
> cleanup path, resulting in memory leak. Thus, implement an error path of
> fsl_edma3_attach_pd(), which detaches PM domains, removes device links,
> and unwind the runtime PM settings. Also add fsl_edma3_detach_pd() and
> call it on the error path of the .probe().
>
> This bug was found by an experimental static analysis tool that I am
> developing.

static analysis often false alarm. Descript problem itself. for example
how memory leak happen when call func1(), .. func2()...

>
> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/dma/fsl-edma-common.h |  1 +
>  drivers/dma/fsl-edma-main.c   | 54 ++++++++++++++++++++++++++++-------
>  2 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index ce37e1ee9c46..fe8f103d4a63 100644
> --- a/drivers/dma/fsl-edma-common.h
> +++ b/drivers/dma/fsl-edma-common.h
> @@ -166,6 +166,7 @@ struct fsl_edma_chan {
>  	struct work_struct		issue_worker;
>  	struct platform_device		*pdev;
>  	struct device			*pd_dev;
> +	struct device_link		*pd_dev_link;
>  	u32				srcid;
>  	struct clk			*clk;
>  	int                             priority;
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 60de1003193a..5204c06589ea 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -420,7 +420,6 @@ MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
>  static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
>  {
>  	struct fsl_edma_chan *fsl_chan;
> -	struct device_link *link;
>  	struct device *pd_chan;
>  	struct device *dev;
>  	int i;
> @@ -436,15 +435,16 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  		pd_chan = dev_pm_domain_attach_by_id(dev, i);
>  		if (IS_ERR_OR_NULL(pd_chan)) {
>  			dev_err(dev, "Failed attach pd %d\n", i);
> -			return -EINVAL;
> +			goto err;
>  		}
>
> -		link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
> +		fsl_chan->pd_dev_link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
>  					     DL_FLAG_PM_RUNTIME |
>  					     DL_FLAG_RPM_ACTIVE);
> -		if (!link) {
> +		if (!fsl_chan->pd_dev_link) {
>  			dev_err(dev, "Failed to add device_link to %d\n", i);
> -			return -EINVAL;
> +			dev_pm_domain_detach(pd_chan, false);
> +			goto err;
>  		}
>
>  		fsl_chan->pd_dev = pd_chan;
> @@ -455,6 +455,33 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  	}
>
>  	return 0;
> +err:
> +	while (--i >= 0) {
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +		fsl_chan = &fsl_edma->chans[i];
> +		dev_pm_domain_detach(fsl_chan->pd_dev, false);
> +		device_link_del(fsl_chan->pd_dev_link);
> +		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
> +		pm_runtime_set_suspended(fsl_chan->pd_dev);
> +	}

can you call helper funciton fsl_edma3_detach_pd()?

> +	return -EINVAL;
> +}
> +
> +static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
> +{
> +	struct fsl_edma_chan *fsl_chan;
> +	int i;
> +
> +	for (i = 0; i < fsl_edma->n_chans; i++) {
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +		fsl_chan = &fsl_edma->chans[i];
> +		dev_pm_domain_detach(fsl_chan->pd_dev, false);
> +		device_link_del(fsl_chan->pd_dev_link);
> +		pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
> +		pm_runtime_set_suspended(fsl_chan->pd_dev);
> +	}
>  }
>
>  static int fsl_edma_probe(struct platform_device *pdev)
> @@ -577,8 +604,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
>  							     (const char *)clk_name);
>
> -			if (IS_ERR(fsl_chan->clk))
> -				return PTR_ERR(fsl_chan->clk);
> +			if (IS_ERR(fsl_chan->clk)) {
> +				ret = PTR_ERR(fsl_chan->clk);
> +				goto err;
> +			}
>  		}
>  		fsl_chan->pdev = pdev;
>  		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
> @@ -591,7 +620,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>
>  	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
>  	if (ret)
> -		return ret;
> +		goto err;
>
>  	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
>  	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
> @@ -642,7 +671,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Can't register Freescale eDMA engine. (%d)\n", ret);
> -		return ret;
> +		goto err;
>  	}
>
>  	ret = of_dma_controller_register(np,
> @@ -652,7 +681,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev,
>  			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
>  		dma_async_device_unregister(&fsl_edma->dma_dev);
> -		return ret;
> +		goto err;
>  	}
>
>  	/* enable round robin arbitration */
> @@ -660,6 +689,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
>
>  	return 0;
> +
> +err:
> +	if (drvdata->flags & FSL_EDMA_DRV_HAS_PD)
> +		fsl_edma3_detach_pd(fsl_edma);
> +	return ret;

Use devm_add_action() to avoid goto.

Frank

>  }
>
>  static void fsl_edma_remove(struct platform_device *pdev)
> --
> 2.34.1
>
