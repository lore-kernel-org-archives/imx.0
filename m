Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97832D6E5A
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220070; cv=fail; b=KLatdOdved/ZtWn3pBU4IwVbY38dVeR9LwV+THMzdnhwxNwjFFI0AZzHtjCNLaWPkCw6exdhVtv+eQa9RaoEtEZ2H2Bkqoo9L8PH2yrTzkIZRzviPOOmSO3DSLMLsa39NsxIqJ59ko+2V0seWExy+nx16rQz6L+9WpMIAN8CO6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220070; c=relaxed/simple;
	bh=9MF+QtgGfdOGvGByOtJQBglNKuEF/pX0+L/znsA2rI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SvBvDhV182INEcT87vZV8167AH2lViOYMFupy5PFmZy2xUzgQjxYHBAePLW1DHLq7m4cf+P2cgbgfvgU8xILQ6DYC4kY0JMVgK+oHPQ4ERsqpXWg0U+8vikwhPAyHezl1n8N++P4zjIwHxhf1PkA2TJy72HUXQS1Fia4i7xyz68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lcXifF32 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lcXifF32"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTMO/FG9Cn50/Aont4l8/G/qGkRvvrMnUlvq6/XRgKLY9AmbMRb8V+qTjs+hbvdfO3ByKqMvx+EzCPZdcGs2tXEeGqrcV5Yn/G7Arrt3psGk6Xb3l2O6E7sXAIrOf894PNQbsMz4YDOhpM1eVRSCAc0bYC6pakEys3t2P06d7QBsJw3brP4kv1uiQGjXZn0hRecNh9H85IPfKGDYvU7tjC7c1QpiYpWNgZjG8gbxU+4NtlADE86bAjnFfQ+0NWAAGJ0f4m8N3FW8KsWdkwrbe5IFBpVo3FThNnfHfnurHoznyTFhHqZ6wqxiFCqFd+hYF7VtGR5wThi7AL5cNVtgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns9Ek4aF6Ng3YVfN+W6PJhQledgm2BpaEN56NpeAG7o=;
 b=ajX+HSY6l7aAz0TV7Q2skbfloFsYwIKWzWXYPkRoIOyiRJiitOYkDGoPvL/fFf3a/KR3Ws5vxikP0ueybyg4pj8AiRLTfJq8WfEO2bqZ2FVfrEc2ErvZNr+GmO3tTZUvC2LVoLe+Xzu6FFyp7X6P9mGokbVj8EC08xUKYgTJ2pJSdfDo2KLrJIMGSmP0zxuBKWCb0kqVlUkcA8nwlGqC8y3nJJtqCKtSNAgL88oaCP+2VEV9VoJoN9znpu7W+njew4CHDNviPZEnBB34fBQ1t3NwITmt5iQr0CgixBVYjpFJWYCzGH9gxQTa0gAwmT96OR4Nek/53KftyzjR9LooGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns9Ek4aF6Ng3YVfN+W6PJhQledgm2BpaEN56NpeAG7o=;
 b=lcXifF32vqtutGA3TVXtD0gp+mZa7xevmfZ3UX5TNj95KEWreea24Ihv9gVp7YtzjBtneeleg737TfAbaAVSD2X6pxNp3TpX6PvuPC89tMpXfv/3OzXIH+bHZ111gUOELeSNzYp3hAOvfjtlKCEBtlj7DOJ9btE45BqsIe/mchMtyhiShUBNVmjFMaN9CLlsJerhFPc1x/kMqqaYP2KuhQ5XF+HysDqKI0i8LDNIXwIYlHX+9sdgwMLQOe7+zNQC8yQWiMzwBG3T6WB9ywQ96r8DkDKgfFReQSpWY3X+Ib7dDhdTRdCkCWW0RJKjsHYiRHmE4EAj19HGIzs6cTyzyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 13:07:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 13:07:45 +0000
Date: Tue, 23 Jun 2026 08:07:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <ajqFGWp3XKqDhPpE@SMW015318>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: SN7PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:806:126::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de7cbce-9c18-4dd6-2313-08ded1286ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|22082099003|18002099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	QP7izLDX3VVLVYYttB8w0jSd1/H769xVBVASDt1O30aVTb1TUJ0VU5wEViy7BKBF1OM9TpAGQVe8y/Ic9rlng1IfNoUv/OBwlJIy7NgB92Ci7vpGxc8VYZyzZL0whCOkmpVMhdwdWtDApXSA1I5TQ+0BvOyy2qTW2xO0VvkPgr98XhiN5P35cSdFOXqLkC6iEOvRSoUMv7ZEOn8TD5La3pCXo3WNsDugMlEj8n6CKMLVNRphN+5u3pvSmORc+oT+0PNcTfLjBfpMbX7uCt0o46KCBMtVOEOiSE9sUrvK5s9bl+CDxbxHfqb2GSK6MrGUywn1uGIRmb5v51L40yTE8bXDqWcCL3af0Emn8AP8VDjv6UTJpb9hPtO+qNk+qbCrc3b/nD2Jr0nFYcu3bHJd7RoKnacCrJ2XkCGVbNWLHtfRE7SxGU8TpJXpf4DDj0wR6vFFuyWsxTXpwEZqg08S53kSdHq0TfhieuzIoHgM4mGR4H1w+fu14WGqFZ2NzR9GGCRn0nC8WPInupMYlMTsgFJSv6uzO5JURd4cwqu3cYxL+Whs0wDnMGeJjytOU79LO80UDnOnCUPYzwu6eYahZnZUzp5j6cok0tTYzM1ZRlFlmc69LE43FgAk8cOKzJoxh14VCfRKrvr4Dz+BUL67oHObCIwsBd5hUYiofLVbjhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?REGoCckN7M1tgYbiK9w/IJqKfspQ5qE1tV1O/6lAT+T0ZGgf8/HZZSv/cJ?=
 =?iso-8859-1?Q?liOGASGxBb7yO894KR3cHTHMiQrHNO9dowHFqKv2wLvu/Y6t+Fz9Ae4S6V?=
 =?iso-8859-1?Q?6iFm/2S5jENyWsZCoUMnTx9oyJ0xSJgxhJCWuE7tOIsucJAtNGPmjgMFUf?=
 =?iso-8859-1?Q?WaToqYLlhwghY2fPV10DbA0OLlUcWO059GFW1S/E9kOzzT73FFAXjwGkcB?=
 =?iso-8859-1?Q?HuWZPiw0q27srNq7Lbf11JQ4Mm9smtrv/fngiJ9kdupPSz4eBdfqL4VQkr?=
 =?iso-8859-1?Q?SuR6PfRd3EnhEpwQ+VIxDHtcIJH6hmqGQJLZ1Er1b3Md4l+g7DyOf/9DiB?=
 =?iso-8859-1?Q?laPmSNrvYjd+a3azCl6L9IWoKJ5fBJpjoXJmSVvIaKH3NjJ2P7lF09kRQS?=
 =?iso-8859-1?Q?f9mj0xWIf82UwIWcNWzigEpeDbNEHe8LKFO5+Eav419tp1xkD9etNNE+jh?=
 =?iso-8859-1?Q?A//NQMcRv7xwN5UHgStZXumVGSsmvQoqiPglKoXa2gGR8RktbJE7lm0daa?=
 =?iso-8859-1?Q?Ne3iHWHc0iIciiDSCXs5tlhVb7eWn1YK4h1n7M9vEr7WtLAq3UXS3m3Xkz?=
 =?iso-8859-1?Q?zMfcXfcQfxBvjpMV8XM2RbtpHm9O713/7HlwemkaGxWLuSvpmsO0z5hsiV?=
 =?iso-8859-1?Q?fDp+74ZhVwhDolpcTx751nuslZfKc53G1Yoel8WdhXAWyZ8Lm9iwQBpo7f?=
 =?iso-8859-1?Q?cvRkr8cw5+CwFhpZmyTpPIanEhOLPBVdYamst1i7myozp/+xhvT4YEw2G0?=
 =?iso-8859-1?Q?4Ebq8Zp/nzxJuusbPfymFCFAAwAuxNoxkcBBEx0tYrCvZy2LnA3NFaWRXM?=
 =?iso-8859-1?Q?r81ftzud7vXFSjYvtlmFNabkgyI1h4p2w+/N/3zDkOvv3CCmKDtphjxgVi?=
 =?iso-8859-1?Q?f+leUp6QzLzTEMNLTuTjPofKPs6Noz/S9sDMrKVIo8tihaKYCs3UPZdzyU?=
 =?iso-8859-1?Q?ngIs0b9rl0ubUgXqtDMZU4yox/XLWl9LhS7GurgRWrWHraQoJc1kTMnsKP?=
 =?iso-8859-1?Q?XOUi15JSDW2G/fKR3eui3+7rXKUPDeYVFypYnFKxtrdgwLZzRkYTv+ZQtF?=
 =?iso-8859-1?Q?7xhhgCGzwhojFf0X4DAdrYu7iRHmTvyudeIUDJCIw5mDgaqYpUfm8dYsUs?=
 =?iso-8859-1?Q?tLj4mFdIzIQvXWmDkPt5u5a+cENPQGANQ7X1ifAFvXIqC7fnZ8iMCEMhmm?=
 =?iso-8859-1?Q?FGVkpdZPp6fKJhd6x3MVZmRMSz9PvPNBnLk5CJfZuYG3BKOCqw1MRDsjDU?=
 =?iso-8859-1?Q?RLPt9QLdTFdzJMG7rTxr6LqMQehOammhglF4IBMFFWxEQQjgBsliLyJ+rn?=
 =?iso-8859-1?Q?pSaXTNhHLo2ykNjB/x0AeIDNFWIvxMNypPLCllUlToFUt74uSd0H1t10s0?=
 =?iso-8859-1?Q?VnkD9AXxJMHtpfFspqTIfCndkZkP4iNGnvDuzm3KEN3W3BwV9o5KrayQfv?=
 =?iso-8859-1?Q?Dq/mhCtWS/WteSE4x6w0e68qimSotx+be738HgRnD3ezdIHKxWG7H5XH+z?=
 =?iso-8859-1?Q?wlJ3IIeoQAPDxHZvhzhbOAWJJYlNXYB/mSDlX5EnsyILpVJJIR9Z65Ktj0?=
 =?iso-8859-1?Q?Q2k2UkGv7azAfWvVS6hxIgSFKg6MKcQIKqInEF8pSeG134KYmKZFM3Vu//?=
 =?iso-8859-1?Q?fPI2suS4pPlYbG81ZpexaX8UfEZ92Vp7dHnQieoErvGIKHMuIy9FhmeeuR?=
 =?iso-8859-1?Q?85ja42Mh/ayn9gBsha03yyt0KHfLUWqUGOg/8fqACfG8idAdBrjfN8/xR1?=
 =?iso-8859-1?Q?HYd0U03/Gtqx9wwBn6lxBZqUX71GJpTIDB+wFesIMVxHZJqoIQP4Q29MLP?=
 =?iso-8859-1?Q?lU4Zb8TvvhNvJpYa1sA29Zt0y0HtqzivXX3MEdxyTaLEiMo+Ci48?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de7cbce-9c18-4dd6-2313-08ded1286ab0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:07:45.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3VqMQIDq3CW8DzTYtZ5zR+pfB2St2uV/zkOcwh/ys/I6y1jmLNAOOOV6H08uLoEb+xJfbiapYZUBmQ4gZNVhZbKunFigxnxKsY/Tbvv2hXD9rGNQ7ch9cKa/ubxqYWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064

On Tue, Jun 23, 2026 at 12:45:57PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> 4b563a066611 ("ARM: imx: Remove imx21 support")).
>
> The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
>
> And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> ("ARM: imx: Remove imx device directory")).
>
> The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
> e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).
>
> Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
> later in common.h without a usage in-between.
>
> All users of of_device_id also include <linux/of.h>,
> <linux/of_address.h> or <linux/of_platform.h> which is enough to not
> need the forward declaration.
>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> found while working on *_device_id.
>
> Best regards
> Uwe
>
>  arch/arm/mach-imx/common.h | 7 -------
>  arch/arm/mach-imx/system.c | 8 --------
>  2 files changed, 15 deletions(-)
>
> diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
> index 45c1a2a7b35f..d7ecaa822adb 100644
> --- a/arch/arm/mach-imx/common.h
> +++ b/arch/arm/mach-imx/common.h
> @@ -14,23 +14,16 @@ struct platform_device;
>  struct pt_regs;
>  struct clk;
>  struct device_node;
> -enum mxc_cpu_pwr_mode;
> -struct of_device_id;
>
>  void mx31_map_io(void);
>  void mx35_map_io(void);
> -void imx21_init_early(void);
>  void imx31_init_early(void);
>  void imx35_init_early(void);
> -void mx31_init_irq(void);
> -void mx35_init_irq(void);

which commit remove above two functions?

Frank

>  void mxc_set_cpu_type(unsigned int type);
>  void mxc_restart(enum reboot_mode, const char *);
>  void mxc_arch_reset_init(void __iomem *);
> -void imx1_reset_init(void __iomem *);
>  void imx_set_aips(void __iomem *);
>  void imx_aips_allow_unprivileged_access(const char *compat);
> -int mxc_device_init(void);
>  void imx_set_soc_revision(unsigned int rev);
>  void imx_init_revision_from_anatop(void);
>  void imx6_enable_rbc(bool enable);
> diff --git a/arch/arm/mach-imx/system.c b/arch/arm/mach-imx/system.c
> index e88ca027129d..1afae485f203 100644
> --- a/arch/arm/mach-imx/system.c
> +++ b/arch/arm/mach-imx/system.c
> @@ -74,14 +74,6 @@ void __init mxc_arch_reset_init(void __iomem *base)
>  		clk_prepare(wdog_clk);
>  }
>
> -#ifdef CONFIG_SOC_IMX1
> -void __init imx1_reset_init(void __iomem *base)
> -{
> -	wcr_enable = (1 << 0);
> -	mxc_arch_reset_init(base);
> -}
> -#endif
> -
>  #ifdef CONFIG_CACHE_L2X0
>  void __init imx_init_l2cache(void)
>  {
>
> base-commit: ef0c9f75a19532d7675384708fc8621e10850104
> --
> 2.47.3
>
>
