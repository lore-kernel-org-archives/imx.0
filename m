Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D241DED0
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423142; cv=fail; b=Cjx+/Yo+OojuW8ML5mCdAaavBjLtL9d6pA02/kYpwf2oqyMH0mWLCG8k/Wx56fUGd412NK1rsgT6W2ZBCSVGToTmYmYHp3vPY0qYpyomkVryj5qs0yQR48RGbJmnv/IWyWGx9VI3n7OEGTHNjDwatBDqFOyfgKD/vzKsf5wwJIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423142; c=relaxed/simple;
	bh=d6rAYpO57WKcFZo2lFVrI/KMg5RefI8sitXvSFRjeMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kkffk3ao2kktoQ03ObtnrWbZHOI20C5BnkL8OT+bjit7XWwaXrGfj1QAzeyewIE8EmU1Qf+H9QItXx995E6TYWAI6SkYW2zIGS8ErpeKh/zJlcGkk2hE59P9ZqUakl2QbAYAbt5ap+kks3QuXSR9DBmS3He1kKGFiPyY6zxU71w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pZaBlU1X; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pZaBlU1X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADRTNhlujsPmKqO+kMROclQgQBsUzGozqFdXYDelv/bYyDbtM518xu3k+vc8mzqdR8VghhXVUzSWLQbX2FQ6yGulXXJeIrUTbKNtrpVh7xGl/ULaq2LVhUbkftP0pSLweXz9tpbs/Ak3H2qpFVVEoAXtEkQ44Uiol+W8bYBra7GtV29bwVJRwEYpRtkiQlKTMAxGJzFlzMKzBHaRtPmkQ8U7wZRqQqFM8nVDhdQH8Qs+HdegHe+2w+g8/z2B7feK3NcIPnyuCzTVqmqb0Uw0DfV6C50+7P8KmxRfgRjQNVrq3HqgEE4fOMojV55tp5iY2nU8wJcEQ8jZQyyKHpG+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7Jz3fVk6/lDcYEmSnWGhGIOxss/dcBr8D74e+2VxpA=;
 b=BQbfzunUxbtR8tU5h/YnJXolVQ9YgHqMszKKV7/xHeUriPfvI6i+YBLVNJdJe6bunMymUjrUVOIbjc965AlAKr4lkaGth1iupT6rlSOoNZ+uDw30VZ/UKsF6ZFeNcRbwuxO2W0MHoFaAeiUfi1Y0pAyuAvSW2S9Lpkg72vX/fs6twcjADU5502c4dqzeY+7Fx82B9d9JF6E8g5+oWTqbwBCV8xgt2x5tGFarM0dxyXOe/TI7dLOkVW8vFOxpJgLkwb6vy81WOg6udN7xDyhgnf4VKBsTeGFcU+edcJCc0eC3MJ257d886SbJY0HGt/5kN580r+ukOwPaWX6M0fj10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7Jz3fVk6/lDcYEmSnWGhGIOxss/dcBr8D74e+2VxpA=;
 b=pZaBlU1X1coThubLdVXE05Pxcwbhf9yenlTsYyE6yBBmtZCNBQE91PfaSjgrtNibALKu1/EwEaabGQLoVgop8lYRvrzjS1cczHdTzng7dW/rPVid6Ru4kk4kCv30qFWwEq9SLWaqnH6WijKIJMSYocF4RAGtCfZbXatqHZx3FQD170/sMzBGM1LdEedTjWbGfvKC2psisMECcTrEfC2k839ycKJjkuuB8rTnEnXG/fhI3pFgrj9Nv95O7tkHcSWPGEAACpQ0qnjQ47qOij0ySZlwOXrOPWrfLdufJ+QHsESdOPcaOF1NUfL4lsYJa/NQ8tlCxGRj0b7CjGryrkG9dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8516.eurprd04.prod.outlook.com (2603:10a6:20b:343::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Thu, 30 Jul
 2026 14:52:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 14:52:18 +0000
Date: Thu, 30 Jul 2026 09:52:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@kernel.org, radu@rendec.net, Frank.Li@nxp.com, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
Message-ID: <amtlGjFpS-XYDxpC@SMW015318>
References: <20260729221416.499781-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729221416.499781-1-festevam@gmail.com>
X-ClientProxiedBy: SA9PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:806:a7::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3a45d4-e0c7-40e2-40fa-08deee4a2693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5D24RjSDv4o4M15HJK6QDcADQyYHpFz1PbCkxU1jLNVkTdhngXy8M6nEPf25ACv2VmXkEDRfZUsPmgioy7DPYe+/EtsELG/G5kKXdvVGCEMHkjd9UUhK/yKFrmf9WSyVFdnSvSAWPNhcMXANccdsbKhue0cdBiprNaCHnfAg/HjykEN0y7+IwTYVPrWu9NX6B+0E05+WrnGw688B4yci1gpktxXEbQinA/Gs+JJbCS0ORNaILKtQP3EJdeBAZZoJHCaWK4a2NXf3LBlB76QDP4B2YyI4V2O46QxP2JYBtPLLpw3yUC4jUEZoNEk7FgWAnxORCURpyP0TW0IQN5aiM2CVGCyEwoM5tWv+5FQ+BxNujptwMjT1xvxJXFot8YIdnAW5zOoqm6n1sDk0Qob9Wo+mSl3cJyATDxKciITZ+I8/bFHRwiKMaroZrm8dcMdCzxOUJrumbPbqxZTOKHRH4bTnGN1HQf6iOYVO9h4Dl1dVcbqRZumqrn0swoLwQWNVIXxc7M5Ni3iaZILnzfIZCMF2fb1WqbxK0yLsoPd9Hyv02cqz0v77Ac6tBXoRCk1PkLYPixNBvq0JEUlJBdxnrtn3VpW2ujJKUlVvO5GDZ8CK7uysY+rHVah+0mZJPIQwBM7VqVIsrY+HiXKHX8E5lEF9MgGYU5BPdHIMIqaB1Tg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ocgGsh1sKx4rTltHHfJtNdvU9YklQ363AtWxJ1YrbZAto87TamFhocdHb1q?=
 =?us-ascii?Q?Cu8AtY04cn5HZKkeygY/nbJwV/BRQ6HHXJcEGVEkdPxg17swO/escip234uw?=
 =?us-ascii?Q?L3nNa+MihqA1f8JM16xgYnYxb6L56W45cdybgJKkKjCq2ROW6k7PZ1syyhY1?=
 =?us-ascii?Q?vWWVRJ8o0QHeGGddakLFCmh+bJz30wzKfoZyiNiArQ999+9lKh/iXevJu+kN?=
 =?us-ascii?Q?JOultqi60rI245TjFBlqIUNrmXzF0jz5tfUQOzsBk5bZUAj4RHjbRPBNLRgV?=
 =?us-ascii?Q?YNQquRjWAPM6P+DkLVHkgTCfHbeIJoGivDq00wsCiqwn95eEKEdF3oZhJv5M?=
 =?us-ascii?Q?4I3je9cFua6LjYyzzaEx82XNyp6HLuBLU7Lf5iVVAoSuQ67+wr56er9Pdt6C?=
 =?us-ascii?Q?7s6QohGxedf+QbtDr8EDX7F5eAAN54fJUIFXuKIk/ilqO1u7wDS71VqW53Kz?=
 =?us-ascii?Q?qY8iJSX1IsktDH3HE10S1YykDweFfLzUZQKS+50AhSZIjrP7E8vMWWsJA+pJ?=
 =?us-ascii?Q?hqvoSXlD+4aT4NOO/tSIh/ZE/EUww0nedHDswXXKE44AaTgy4Phv6LqIadap?=
 =?us-ascii?Q?Fz0qKVhq90sy+rckgZ1oGx0rqFooRus5jhYTv9IK/9AYs6Lng5G2IJ8tRUBm?=
 =?us-ascii?Q?AxsF+bKae4IQLdCbH8cLeZv2w5DgT5Gc8aWVXhYDX4LrLjEyhFlllRJLQAyc?=
 =?us-ascii?Q?I5i0HNPx4tvZmW6YgoCPUjh4epV7Rr6fR2uAab/b6yo0AuRjrKcIx/LmmVHu?=
 =?us-ascii?Q?bW6IkkLbLygakKQbDiDPaTqFWRACJ7OEB3rw5PySgTrfFlZTE6y3GU6ebvgm?=
 =?us-ascii?Q?L9pKq75XVJ9XX0LYIIRawhpLGmtxm5VES6MxLdoZfth8GjldaPrX9V7vXuMq?=
 =?us-ascii?Q?ZjMHfnxJb6DN7NQftyf0A9CAee0PEE7iDWuVIIIatV1VEl8y8wxTFq6tY6pm?=
 =?us-ascii?Q?uY1awwCgTU4BVMu3u0Htry+U0eUW/JPVNZuV8Il4E+ho864RIbSFDoDxu1yI?=
 =?us-ascii?Q?6ZIE5eEDlHibG7sIYrIfoy76daRxbyD4KGDdMdWqGf54BpxWchmNbXfX1zLi?=
 =?us-ascii?Q?sPxtIxDbF7/dXjRELm22HamIBQg3JSELh5goWaWu6Y5ix87BjMZPapdv3wq9?=
 =?us-ascii?Q?nuXDGOZxaw/G2Wq1OIFAGEspSyHmDr06wduyKDxVgDrVrYJ6kFsD+F4tSWLj?=
 =?us-ascii?Q?xMwj82kG1t6tpuG8u7DCMIPU4XLkyn62Zcr9n6wwgNv3EvHhX1lhdhTt1XjQ?=
 =?us-ascii?Q?boqTMW9ccLGjMn/45FSmsWdprRXCZdvTVUnegDGYAhOVt/yReR8X5g5mB6Lw?=
 =?us-ascii?Q?VoTg9V1VTR4zT+bEcAPmfkh2es8w1yTtQDLfHd8ZBk/9SXI8jlfkwaKkXQdc?=
 =?us-ascii?Q?eFf16c2gX4WVrqipH2i6SlFsdnZGRr8xuTNSra81+WAi+sYArkqkRXg1W5AD?=
 =?us-ascii?Q?I4Wmi//sv8l8qLcyKEJEKOLy7AG9m/ByC4PaFvMgm3izp2rdPUA3+dxChdsL?=
 =?us-ascii?Q?h5zvQ09CNJMcsg/OCIu6gWzgddVXyw54xmlfxeqJI1N50idJRLjec08KMMzr?=
 =?us-ascii?Q?c67ieMFemq+UDGWPKretj4Imo9xwgiI6FP3oNsYVngWTOZkMZ+kwKgusw9zu?=
 =?us-ascii?Q?LOoPX1yD1dxQBzFvXtHW+ljwql/hWrrNiXhumsQCRhxBI3yUy/tzxoocRT8M?=
 =?us-ascii?Q?T+eTuEItyNPN3hYE5fBtvEKTC4WwjB1RzMx53KtSuRfr+nA69466Ijaj8+/b?=
 =?us-ascii?Q?sZMw7rQzKiffz+ufA45pWqroauKS4JW2k1YPxRutDz8ZtqrTl70g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3a45d4-e0c7-40e2-40fa-08deee4a2693
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:52:18.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmJWYIQpC6L30BIyK2llzp6+X5D1RP0DyNPHs+vunZY/8SVwP+gRorm/HBTwZFcDOMr9IKNYrdSQsfaFxbCcOPX0aTFKv4THYlz1+tOJo2ISShRbkVMHesL3D0pbBwtK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8516

On Wed, Jul 29, 2026 at 07:14:16PM -0300, Fabio Estevam wrote:
> imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
> does not disable it.
>
> Consequently, runtime PM remains enabled after unbinding the device,
> and rebinding it triggers:
>
> Unbalanced pm_runtime_enable!
>
> Use devm_pm_runtime_enable() to automatically disable runtime PM when
> the device is removed.
>
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
> - Use devm_pm_runtime_enable() (Frank)
>
>  drivers/irqchip/irq-imx-irqsteer.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..ba1203d3edd4 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, data);
>
>  	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		goto out;
>
>  	return 0;
>  out:
> --
> 2.43.0
>
>
