Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CF155342
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734631152; cv=fail; b=Xjt2ePqvCzARHp1WndKNIMTx66t1EznY66/4XldkmPJufPfhpEr4P0WUn9Tb3psa9pt6a2KgvNqXhAfo2Ec94VW0rX6Qipe1tYjevCcdBr2WCNufgGONHK19eHyYM4G7ksQ18kWupq/g/itQter8IkQjX/MdUtCDX9pyEnP+8q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734631152; c=relaxed/simple;
	bh=weWoDhNqwqK9MnHKWKJvCPiGMlB5rszdZJbeO2U0mRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FpyVKBR/RjUpwSNbKYtvE9Q6Q3cR9REcveNlEmEqPM+8NUvVHHUZOCquy6W+OG9VsowFw6us5hy6ryWZPxaM08CGDdHsCIiXl7Bj4++k+d6V9bdnfqgS5i6IefYXzJafzGhWvrCujLq3O/HNM1QvDV2bQT3tEJZYHvEV5XtIAMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XtIFUfb0; arc=fail smtp.client-ip=40.107.20.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XtIFUfb0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3qjNQtDiVDhuqWYXpI5EqKV/Q4b3b/Z9bAbNojRGqVfNHpPIFDiJpPevVF5guLazAwBQYdJYcm5N7k0l3dnh78oC2SvQYjRqzqPQaeJKtllOTRqQ6V18XeYoY2Hd2xH1UmdDBRvJon1EVCKXSmCXcoQdprmLMlNAaJTpsyfqg/2+neIT5gPrOIh4nO65wLf/BgXgkMpgWsZ7vLvN3uUunofJwYB7qWLRZt4uZuRjjj9/b/UaeChBUblVYEsg+npqkd4hY+6kKEuYJeUWWja08gk6qFyPjgR5K3uXcRzxfvwtdpk1VLZlJwT+4UlV/YVckItubatdMwc0P64KnS+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfMZV+CAS6SP69NtPSme5oRIXgCYQkMjrT5cTCKpSks=;
 b=kWDaU/wI4yJAzOe0ttkicyrq9ocHl6Idk7ghGp9qcVBAkDIKeQTYQmyLHxr2LuFn3HioMOg8uFxaKgXWv4GJu2DdLPeTGNEtcR2oZCeZ5odcqtdcDasOg05s7uLQVu7hRvU8AHHK76wttyF8gdf3Gx1uZB7vBi902XrAjvMMiz5xgdThhoU6BtdPUVTJxcraXtL9vgu3BJHtn9U5iHAS/XW3eerpFFVKsuWXatOtm70xU2Tw0oh8Fpr5do+XNE0SGl3FlFWApTv1e3ZECuMt6ZGM8cOYuo2M0Z8GoO75920sS13wR5iHOwtaWjeqZuWgNX5phiG/kdx8ZgI54MRFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfMZV+CAS6SP69NtPSme5oRIXgCYQkMjrT5cTCKpSks=;
 b=XtIFUfb009vwpLn5uTf2eD99cYt47PlrBPSbF2liA9Xm/kD7ueEYCVkdx1EDbtzwJ8LArDtObk4ZJ4XiB0jm8j165ZMt+xFNTn/WRcylpTba+rUXE3OQZ53EVrbD/GJaKOy+MRQoVZADeIjN2l8SrY/6zgWi9x0Hh5/g/yG7Dl7AaId9D5ZoMbVXMG441vaq/nA9azofJkTELkuy/RSMTUAJ7kq+/ENYSRKXRqwGVPdabHp1rbTpPdPuLfJplqImKyB5TTV+GEm5vAD8g7XrQYaIHwB7fZ+/ROJADHDVm2/qdEsnuamgzJpP3JmgKGuuV42i4K1Bmq1tYPvQZZNvgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8097.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:59:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:59:08 +0000
Date: Thu, 19 Dec 2024 12:59:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: vkoul@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] dmaengine: fsl-edma: implement the cleanup path of
 fsl_edma3_attach_pd()
Message-ID: <Z2Re5SS4JWQ/kZY0@lizhi-Precision-Tower-5810>
References: <20241219032845.2067851-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219032845.2067851-1-joe@pf.is.s.u-tokyo.ac.jp>
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e21a96-ec88-4499-b34e-08dd2056d5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRX+5Ld8jRqswpZohnKUJoYJ0VexBcld1qhPDLUNtAeOmfIoY7kF8glAXNAd?=
 =?us-ascii?Q?C1kQaRFsGFbKz2xoy66XOmFPyfNTSGxewMIOYNwO0FTqq/Wi1jGo54KpgOrh?=
 =?us-ascii?Q?VykdOrEFloQRoM3XU0tBiiBcCX47p+AZYF4hJRz8sKrclERLPCq7pH7ld27g?=
 =?us-ascii?Q?0DCt5eYgT+M8NE0iGzrxIqOLPWjFyWtOIln6TmoeP36+TQp9qCgcwQceZRNH?=
 =?us-ascii?Q?xndZrSiaGPeAqpQm6uGMU0oCKqc8cErO1HJnq92hEQBMYTMcE7Bn+yBYxJcI?=
 =?us-ascii?Q?fZmK58CrtbXV2adFFXVsuy2L1aOKx3/olDC7YBQMcHa6yexYpY71seNNVD4z?=
 =?us-ascii?Q?K6UaP8c0Ct7+KhIzP8LM16xxgIncU7vZg0y7J/rQYBgobF+SLqncDAut3pBg?=
 =?us-ascii?Q?jpw7Eg2K7aIYBiHOMXRfuOWUCmUG9iswm6+Piv+EuQQXkvmS7/H7duRzD59p?=
 =?us-ascii?Q?ldwbdVlO6b+wduJl2IUfrlTLs3YrKozNXIB62acn0nEhaOOu+IfFhFWPMV6W?=
 =?us-ascii?Q?Boc3ssDrxCpM6Tk7BMpRvCb4NDkKBM+JfBmirLXnVYNBacYkou81bepScJcq?=
 =?us-ascii?Q?iD7/NOLFjHaa3+d9nI+bXOI2CZ+dxgeQlW9X/+CFS8Xi46AM4IEI+qXC3Ezl?=
 =?us-ascii?Q?Ipmcw4ZdQv8XSzjKTUgX2o4Dd1nJYWgLQNJNdgrucWedpYXGUZafoCEZfnKb?=
 =?us-ascii?Q?1yYslG0b4DXFfutqTvRZlPWm9uYkwh3713iaV7yEU5PoudoHi3z5E7udaEKk?=
 =?us-ascii?Q?RaNFjuhPsBM7l873jON739Xv26EyWKpkP2micV9CEsTct1hhh+hvV1Aje9KW?=
 =?us-ascii?Q?8KuRVSAg8t+M7pjQ5ENy1XqXFcHhP5SEPIOi7dXnnzNBXgux2yHCxJ9ZPYW6?=
 =?us-ascii?Q?Cg741ld+azlCazPRG3z8F9r5b93//7mcTIwWvof0RL2yyl0OmYmq7GC2RHh2?=
 =?us-ascii?Q?FKuiDD92Ko98/tuAU6F/xydHJ+0A+rTq5ZVvNIIdnvjl+5vfLxw7eMPOv9Pl?=
 =?us-ascii?Q?xk5jzeKNsJvr7kWY8LPaQDUZFbk/nJsrY/KPpL1wvLZy+0iwtwNkAJLwNOon?=
 =?us-ascii?Q?P0oHDVQAwdH7U+pd1rZh9pSm2rWWQNetjW2iM2ir/NyuEzfpfRHwzyuhijIR?=
 =?us-ascii?Q?HW6p54QNEXtJ5U7ZEK+YZxLNY21EgwKxZa8ByiWfJ1LYexRDFDQzC0+TCtdI?=
 =?us-ascii?Q?JxNCez2a+DyimZF/6c9HCcSaF+U6VC6t2r4AgWOaB7Z02LxBQGsLhnmsuERe?=
 =?us-ascii?Q?ZJArr5tVSZgCM9nhxkc/zrZdi5qKOaygHa4MTG5HAS7//+NQU90zO5vkuDmO?=
 =?us-ascii?Q?46ttjTHdIhy8340J288/BWsyhh8iiOAbdI4rTaSEhUrRRZpP42XpIQGypB//?=
 =?us-ascii?Q?YHP6MIq/A8/3vxmie078xMm5IIg5byIMRsIdA58lutCUXqLHgDCrLS9d/1hN?=
 =?us-ascii?Q?GkkzyzsI6PtT+7b4IofIlM5aiDjNba9b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IoRCPuj7tnzcMvfju51g+ziTLLZH8lPXKseuYh0FMzFgGfdf97EAh0PzJOmU?=
 =?us-ascii?Q?VQ2Te4MFCgvlL/99n3RLUMVbOPtSOMtntPeWJh2oG8lnffDFtnNErQ7pxhuk?=
 =?us-ascii?Q?qWfqM/A199z5i4owBN/bfYvYZzUVHWfFRFdPcgA8I49E4x/uZhmGnUk/jxZ1?=
 =?us-ascii?Q?oIOyxSC7mIcGQLbjeqokTPTGTHF7k+YjMpi8GFbTetpUGwD2SZtuM7DlshmH?=
 =?us-ascii?Q?RZPDzMcDlK/Ar56kuFd8qoNL5te0q71bdgQdCglJLyW6AOdH1W2gRzAtMfXo?=
 =?us-ascii?Q?opbCCSg90MsVnJBOTg/rH+1YTZXCpTk+8dxIEm04MMXrxicgsntWCURsQI6z?=
 =?us-ascii?Q?vcn8Fc+dfpNtsdZ+G4wd6jUheEow+WUFEPGG8wkdPbqH30NYY/rMosy17PRr?=
 =?us-ascii?Q?fwUFtLyd6bZnXbqwxws4Kgllp4WLp1fUUxjLdmAYPpzZqz3ch6cB1KbWZThQ?=
 =?us-ascii?Q?Rv2J+brfMBqzeLGL17PaiwwqRFXLUza0n1KEWAztfJjyEmdK4/ZnnjGrdxA+?=
 =?us-ascii?Q?y6yCb2m94E71NisB1ajflHn8bUwh9MQmiwdEr4WaDTLFPN1vfMRKcWy5KuUa?=
 =?us-ascii?Q?0ENtWj20X3s0PJ4Ncashzb3oMJoE+5Kumu9VtuKWf/n7P+waRU2uOOMhA6ch?=
 =?us-ascii?Q?pVLjwhl4yb30zC/jjSig0l/OOJz0oe0flDY/Sw/p7w+790Imn2G69/fyPbCi?=
 =?us-ascii?Q?FZC76cWtQFC+xuMK8srbpdG5ZS1BbSSRkkCAiY/afhjGnCnSYuKmZCM9m3dz?=
 =?us-ascii?Q?3HtvmAL/rRYLHdrk3y+YH6KBf2UtNEkdgAVxryv+m2Bl8kIm8kmyq6Sjhl3M?=
 =?us-ascii?Q?ST0mpnMXCykr2PzFdqle3nksmqFHskZCfEW0jAzuV5Rkah/+nUbdnzgqiEdM?=
 =?us-ascii?Q?jaODHtSeH/VpVAGiie2U39r00MqQ/qgl4DuMJ0+vXtHh2EFO4LyG66ZZmPZZ?=
 =?us-ascii?Q?cHtur8PncYtszFHpOm3pMkSDCrg2jxos8PwbHMJCUrmayphLu5hXjlRMNUZH?=
 =?us-ascii?Q?kNvToostFQFBYCACbT/ROo4HJidudPPfus962j2UESn0Jfl5ypAad3v1eukh?=
 =?us-ascii?Q?8u4smEbuEQcAHRe3PUHc+NkF6zBa4E5MJX96pQE/1EoQN5tz/mrefZZU78w9?=
 =?us-ascii?Q?qRU6rODhZFr3f6fnfX4HEvz1Upsq3EYXxsUKkDrrWSLbAE1V+x3sAAhwq/UL?=
 =?us-ascii?Q?EEOS7B/Q37WZYZKvRFRqIofNKnbSlC5KZ2D4YJFtmjbXeDdKf8X6hyJDEMCx?=
 =?us-ascii?Q?jAQbdeFLcD6Q7isMkWB9sMqSmZ5Ld2FJ7GDo83J6jI4A7xlXNWe+CS29kA+4?=
 =?us-ascii?Q?SCLULyawE4ikYiJ/vx9hRd+BQ4TZVw/ePrBOy6XrbytQMsoJS43bG02McUXe?=
 =?us-ascii?Q?J/6/MgPULP+vtXKFxw4p8caFxewrwjTHGae8jiU4uYHRzvc+nEKs1+jwoW4d?=
 =?us-ascii?Q?ubtQozP7ggCXVgdxraidhhpyhp6J9PnEkyExxWyFc5LIjlNKntKTF53EyZ/B?=
 =?us-ascii?Q?OHCo9HzXUzMy1w/TLVKyFq9GkSwY8gn2wDOEqfO3Jrv+fvYbnMWdl+5lwgLo?=
 =?us-ascii?Q?Nw2ELPlbec58klNXuLJE2olxbdwjvu1qYm/v6ctK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e21a96-ec88-4499-b34e-08dd2056d5d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:59:08.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+ruBIT7GrbL5brpxLLP+KV7j/WxUnVoLbutEKw0PZJn+/YrunlfGihruiqgl0wDc++VK0KQG7NkXwPgBSMLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8097

On Thu, Dec 19, 2024 at 12:28:45PM +0900, Joe Hattori wrote:
> Current implementation of fsl_edma3_attach_pd() does not provide a
> cleanup path, resulting in a memory leak. For example,
> dev_pm_domain_detach() is not called after dev_pm_domain_attach_by_id(),
> and the device link created with the DL_FLAG_STATELESS is not released
> explicitly.
>
> Therefore, provide a cleanup function fsl_edma3_detach_pd() and call it
> upon failure. Also add a devm_add_action_or_reset() call with this
> function after a successful fsl_edma3_attach_pd().
>
> This bug was found by an experimental verification tool that I am
> developing.

Please remove this sentense. Not reproducable by other people.

Frank

>
> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in v2:
> - Use devm_add_action_or_reset() to avoid goto in .probe().
> - Use fsl_edma3_detach_pd() in the error path of fsl_edma3_attach_pd()
> - Update the commit message to elaborate the leak.
> ---
>  drivers/dma/fsl-edma-common.h |  1 +
>  drivers/dma/fsl-edma-main.c   | 41 ++++++++++++++++++++++++++++++-----
>  2 files changed, 37 insertions(+), 5 deletions(-)
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
> index 60de1003193a..1a613236b3e4 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -417,10 +417,33 @@ static const struct of_device_id fsl_edma_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
>
> +static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
> +{
> +	struct fsl_edma_chan *fsl_chan;
> +	int i;
> +
> +	for (i = 0; i < fsl_edma->n_chans; i++) {
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +		fsl_chan = &fsl_edma->chans[i];
> +		if (fsl_chan->pd_dev_link)
> +			device_link_del(fsl_chan->pd_dev_link);
> +		if (fsl_chan->pd_dev) {
> +			dev_pm_domain_detach(fsl_chan->pd_dev, false);
> +			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
> +			pm_runtime_set_suspended(fsl_chan->pd_dev);
> +		}
> +	}
> +}
> +
> +static void devm_fsl_edma3_detach_pd(void *data)
> +{
> +	fsl_edma3_detach_pd(data);
> +}
> +
>  static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
>  {
>  	struct fsl_edma_chan *fsl_chan;
> -	struct device_link *link;
>  	struct device *pd_chan;
>  	struct device *dev;
>  	int i;
> @@ -436,15 +459,16 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  		pd_chan = dev_pm_domain_attach_by_id(dev, i);
>  		if (IS_ERR_OR_NULL(pd_chan)) {
>  			dev_err(dev, "Failed attach pd %d\n", i);
> -			return -EINVAL;
> +			goto detach;
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
> +			goto detach;
>  		}
>
>  		fsl_chan->pd_dev = pd_chan;
> @@ -455,6 +479,10 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  	}
>
>  	return 0;
> +
> +detach:
> +	fsl_edma3_detach_pd(fsl_edma);
> +	return -EINVAL;
>  }
>
>  static int fsl_edma_probe(struct platform_device *pdev)
> @@ -544,6 +572,9 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  		ret = fsl_edma3_attach_pd(pdev, fsl_edma);
>  		if (ret)
>  			return ret;
> +		ret = devm_add_action_or_reset(&pdev->dev, devm_fsl_edma3_detach_pd, fsl_edma);
> +		if (ret)
> +			return ret;
>  	}
>
>  	if (drvdata->flags & FSL_EDMA_DRV_TCD64)
> --
> 2.34.1
>
