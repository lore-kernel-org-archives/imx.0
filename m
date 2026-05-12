Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41B377EBF
	for <imx@lists.linux.dev>; Tue, 12 May 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599035; cv=fail; b=I+38oOOQH3MDjGaR4UxeDa6jG8JzJeibTPoCUd/oxNMBed2t9qgzs5/PA6HTMOpX5V/+srfqhukhF1xnExEuIgh9M9OJwxnpEjI+5WOAvPSmINNzkdFOOkRMuG+qmA6ZggUM/3qgfuodsusRkMbT2EwiCKNs4NjQ/DrUYmUZNc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599035; c=relaxed/simple;
	bh=FPgxA1pX6yNxq/6yJU4d6rwQVxMb91rOg1O5wF+Nld4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YCsQMQHkiZqB5ZcjHsHec4K2WkndZgLDtx8qVEQXmZUGfR+gccCD1dZb/hSvSCw2D0gmskh0MAM/kChsapZ0+IKjf+NfCHqVIHrY8hegQ0/XHWiAemFHPeilGKj7nbTzFiFM56RqY94TJZvaeb2xHg9+plbDdKieeP7dUHQ5yNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SnmXuVrj; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SnmXuVrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0T04bZSJ7yz1KJ6dUpUZwWE+lxQA4oftURYFNUYfJbLdGANbSh8yf/OHxaKKAx9iL+gqdVt1cZWs6WRYh7bkB7w1l0wAOy8/Zf3FU8fbrr2/oWTs/kbMS9Eau+lJ8eIItZ/eQ0KtaunPxZZ1xLDX5YMLl2/qHqPNt25xybtN5pxJpzvhQtVUUF+igNzr2+zoqtP6viNhXFm/tORwuu9vAMkqghYd6o3lTMSHdtK4P6opHMdaUpxaV+NgnIQvVLJEfCZBwyv4pjjjCi6Vz9gIKWvlaNcslYCo/AQ88jYbDaHI4Eaa7i/NjXzYMEGVutIxBiF33FOKQQfITrGr6EioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo9xMzwweBahoQX7hLGoBhQSw4y3PCEu9BFFmoIpsuI=;
 b=RocTbG4I3wd1H6UFHlbL6fS0imf2PY1+2ZDdwODNDicOI17e8o0QCT2xqnEavNAk7VuxCQpH8fLljAnd331N+4pwWeGQ678PtIOFajVMWI+UIE9ZmimEO40nUSoujtHGLLcM3MZjq6fQcEd8bRQm6fonLKuJt8EE4ifns4MC8g1rB+NbxBLwIxkgwvvC1qej/91qHWKZVa2VEKX6GllaeY0lNtwtEvsdyv6L8ic4QckhqsfERrBcTHqvCD+u/7xcXBU1rm+UDTQYHKV6Dg7KktwV/5lgrf4j3isc7dgWp9oSJnUcY6xjSumgW3PD/rA4fK8fDiGQZcfXxGjlwg8KTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fo9xMzwweBahoQX7hLGoBhQSw4y3PCEu9BFFmoIpsuI=;
 b=SnmXuVrjfqiDDr4qq1crbOsOUDKdj+X89uF1FIogfbWJn3nYH017WY1udOY7rTF8lxoHZAnZ6dVJUy0GyDrH+C5gufCYKHMkcJFJ8e5NNo4LyUDS0GuOjPS8tSt3F1hNdR9LJemVighRdVtVSi/+ov0da6i6JoCx9KTEgU1qchwUPlfEjtyh3aYMNtEuHX7rzAuRgjDYrAiFnmam/ErMF7Qbk6JP96D+AsNLVSOzDhSa1ddTkvWo6kBYfhItrge+jABVtf9PrnmaNNH8JTheP0IYVsP6hnJHCZYUAZHKCXARhlK+5H8JC+0t0I+5uhRxN6uWySXZySNzql0qYzhHEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7006.eurprd04.prod.outlook.com (2603:10a6:803:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:17:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:17:10 +0000
Date: Tue, 12 May 2026 11:17:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH RESEND] clocksource: move NXP timer selection to
 drivers/clocksource
Message-ID: <agNEcIbvcjFKn_Ay@lizhi-Precision-Tower-5810>
References: <20260512-fix-nxp-timer-v1-1-565e13ef3e46@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-fix-nxp-timer-v1-1-565e13ef3e46@redhat.com>
X-ClientProxiedBy: SA9PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:806:a7::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: e6888fca-a3ef-467c-52d8-08deb03989ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	47LEQSJwL8Yl1aMpKfbisnGRoiDZiQexOytg/U5QIwcYg2F+iU6OAFvhwhGjyNlb7Ot7kvsxLCCEFJPWTW3bSd37c+d2LHqa+gjSIbPZJlrtyXwSgF+X6+7/DLzxVcu9WJZF9Jqavb+dwkJtHXNOEBSzC11OzIZyzvskppibLbV1u5Q/RlHhdR5Oo7ZPmFJW1UIJ+xG+Dbfw2HRJpk9DVEnxad0Ck7cOka4w/Wb2UNOasTRbHIQ4AgxrfXxTzHDOIcBwhSijMxOB/ij/e0k5XSZSYkV9+YnkfL6Uv3Ifr7lY1O8s0AknaSmXKcLqmx1FE3NoImqSLQGlHOcYWrUNJRiEgBc+q/NCJ+Ei6tm5Td4icFtau0kt96ClWEH4TTaom/f6OHE25pahbj0P7FR7jlgJqNY7qzb/03GmScaYefcKksvk20P3b+/6QI4SK6ALYe9qeDDRtkILe2LuQL121d00fI0T5lLDLMvtEq6dYMZnk/wr1mxD77pWks92LN9N261f5yO/wdWzq9TL8wgu2HECVHOsf6Lr5TH5CvBV1fNJSWBvnEHpqasY1h6Q5t+XTaZRT6XJODk4BQcx8tOaX3BifGW1kGTLgEFEJqAfi/1N2LZhsASDQA+uX8NVoA4DsiX7cZC2eSRFktifUgw1brsKv+2iH25d/p9hkSBCWWxdCUBjNV7RNkD8pecIbrqBtnOTmm/USx7PZszi5T06JBZGPo9xlK6Tz9UqDNUPd6/m+FE8AVU/TuEQ7Ov7QxCu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZEkLPzrJX/HddIQ2f/i3/x7gxiFrks9UwIKGkbYR1164F6c9JDGR7mQTrg4J?=
 =?us-ascii?Q?FTzrMqn9qy6CBQ2W4MToz1xGzQwxsshifRvdCOlpWJeyf04kO1d8nQM7+Sa/?=
 =?us-ascii?Q?b4wDfGoANN3OrJpzua8QZ1KibkAWxXsUYOxCnf7jRcGvONy9ReoU1HaI+HTR?=
 =?us-ascii?Q?RUd/rOaYLX2lVX+B/RQFJFZ/+tbgmXFOqxMNEtvoFe/DNXG2/58+WzV9oRmy?=
 =?us-ascii?Q?SdRnFpxyxP+oA37a1lXLm80IMQtImZ1p/SSXftSGqyzby91QdPy4kV/mWAfT?=
 =?us-ascii?Q?Le+NSmpPWesEM3pXiZwI7sEIqNf9Zn1dpaEwfIhtrVKxr6x5y0GIE392zevP?=
 =?us-ascii?Q?IIgTqfbey3sqA7pXYLRcP3NgfQLXXNx23UeadAb61H0WvG2G7DxDs3v2PLCA?=
 =?us-ascii?Q?mK0Xh80Q20LlkvN2Uouzx0jUzkOqEWp9PuI0PGpoS+M5FiLUpvGt7iRrBFeh?=
 =?us-ascii?Q?wiz/dQS/BE32PU6jQZ6djIMn5djvMNS3KeNLaM1n4Vglvc4H4ZfOULew9Hqp?=
 =?us-ascii?Q?Vi12RleJ9QKkKdaPngLSJp5tr0tlwTQlPCjNU+5r52pLjZE6m3U/mcoStIko?=
 =?us-ascii?Q?0TY7MRfg4d67PwtMjIoC1sY21tZVMCR/ny7kCxdGy7SQRTaGPj+XmV4Vg9P1?=
 =?us-ascii?Q?dDs3AFKmJOgHB4ttXumt3FY5BVQ8xTolsclNiL+vi6+vtJdJo+WpGXYUxRxL?=
 =?us-ascii?Q?Zfu6XFCMHaNZgHJRbluCblIrkgWlWIf6JhR93AVUwy5iTHmzFagfpxvqRZ2r?=
 =?us-ascii?Q?UW7IiRi7vuFbBPZiHpGpsyAip7/QHAM3yxFlCQc2Fs4kCkyRmV7t5UcKCVS6?=
 =?us-ascii?Q?sZS3A3RVNKqPjG0yR0sPt4B+WFWPZT2anlGfNbVhQhoYlI6wYY6cQ2rwEPhS?=
 =?us-ascii?Q?fdxjoxRPoaw5o6OUfeWM8q5CnA8tV44J22te68HUqZYLpgcwl9391P9FwKJl?=
 =?us-ascii?Q?SvBZZrUDJXN1o4LGv6YNNiZGT69I3ij3oUaNvWblgSVGUhZiuLEpLaXm/HPi?=
 =?us-ascii?Q?UcQQUO5ZUAJoQzA9Y5Aa4EgD0g/hO3Jg2isITv5AIYODZEheQWiCR8ymuT6a?=
 =?us-ascii?Q?V4f/N+LDnHODy4NZgMCILFEaqfOkIOLiX5srfmY9lkY/UyX/HHdQbwPjYmvt?=
 =?us-ascii?Q?B6qbKktaXRAUSkMoG3S3+bD2dWYDQdEYFlmwzjqMuye8xtIP91WimfvUr4+a?=
 =?us-ascii?Q?HZrMpYYsJLfZ6FCwLmbwlMTA6DFNKRY0+XvUj/hoqLH0bmzJf/R7EedBvSsx?=
 =?us-ascii?Q?hsipa8qpwmF9QDGZlEueepFWT3US8l/+bOw6SHC6Dg+C21BHZ0Wxo/35Xmh0?=
 =?us-ascii?Q?bBz3ApCYJb09HpYUNMH5lUrHBvIntjN81fxSCiRFxCtUyJ4YC8zYIzYanCKZ?=
 =?us-ascii?Q?X9rgRulljjyQJt6dm52ZwQkIgzscfXhUewuI18hLdUF37zEmM/lqirZqm8fW?=
 =?us-ascii?Q?dGNn/J+DnDVVB/6IdsBP7IoIHnedIsBx/yeFqgjNkJzLE68kWO16Dn8vAsM1?=
 =?us-ascii?Q?wXnz9E+V9mcxXd3ZKpMc0H79AnUe3W/T+XO/MsodlzTGp19phXdtACDBFuzG?=
 =?us-ascii?Q?oe9LerrdxYw7jrAMB6Xc1AiPP3uxHdtZGVIZS9Bc2nKGiEUJSaJlTP6lMLwV?=
 =?us-ascii?Q?98m/s13jEfm88Ml7eMQpvvREQo6HeFxKZ5y3kpO6AD/mUY/p0TSPoT0Tw6Qi?=
 =?us-ascii?Q?dNN6oQpF99p7a5xMMZNo15W3IIQSvLmoE7XDXNiWooqqC1HE06ABptEjgghq?=
 =?us-ascii?Q?hUNBXhyemQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6888fca-a3ef-467c-52d8-08deb03989ad
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:17:10.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ra+5uI1wfuLZ7yTSO35HclvKcFEhcw3Lvu0WO+7Q+igiC6uEgS8WtbePQjdeJFKSURnq+QGWh/7Su65MpZEpUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006

On Tue, May 12, 2026 at 08:45:16AM +0200, Enric Balletbo i Serra wrote:
> From: Enric Balletbo i Serra <eballetb@redhat.com>
>
> The Kconfig logic for selecting the scheduler clocksource on
> NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
> prevents 64-bit architectures, such as the NXP S32 family, from enabling
> the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
>
> Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
> drivers/clocksource/Kconfig. This allows the configuration to be shared
> across different architectures.
>
> Update the selection to include support for ARCH_S32 and add a "None"
> option to allow using the standard ARM Architected Timer. The Vybrid
> Global Timer option is now specifically restricted to 32-bit ARM SOC_VF610
> platforms.
>
> Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")

How it work when upstream clocksource/drivers/nxp-pit?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> ---
>  arch/arm/mach-imx/Kconfig   | 21 ---------------------
>  drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 6ea1bd55acf8..a361840d7a04 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -227,27 +227,6 @@ config SOC_VF610
>  	help
>  	  This enables support for Freescale Vybrid VF610 processor.
>
> -choice
> -	prompt "Clocksource for scheduler clock"
> -	depends on SOC_VF610
> -	default VF_USE_ARM_GLOBAL_TIMER
> -
> -	config VF_USE_ARM_GLOBAL_TIMER
> -		bool "Use ARM Global Timer"
> -		depends on ARCH_MULTI_V7
> -		select ARM_GLOBAL_TIMER
> -		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -		help
> -		  Use the ARM Global Timer as clocksource
> -
> -	config VF_USE_PIT_TIMER
> -		bool "Use PIT timer"
> -		select NXP_PIT_TIMER
> -		help
> -		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
> -
> -endchoice
> -
>  endif
>
>  endif
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd9112706545..b5c88ec65802 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -794,4 +794,35 @@ config RTK_SYSTIMER
>  	  this option only when building for a Realtek platform or for compilation
>  	  testing.
>
> +choice
> +	prompt "NXP clocksource for scheduler clock"
> +	depends on SOC_VF610 || ARCH_S32
> +	# Default to Global Timer for Vybrid (32-bit)
> +	default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> +	# Default to None for S32 (64-bit)
> +	default VF_TIMER_NONE if ARCH_S32
> +
> +	config VF_USE_ARM_GLOBAL_TIMER
> +		bool "Use NXP Vybrid Global Timer"
> +		# This option is ONLY visible if we are on 32-bit ARM
> +		depends on ARM && SOC_VF610
> +		select ARM_GLOBAL_TIMER
> +		select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> +		help
> +		  Use the NXP Vybrid Global Timer as clocksource.
> +
> +	config VF_USE_PIT_TIMER
> +		bool "Use NXP PIT timer"
> +		select NXP_PIT_TIMER
> +		help
> +		  Use NXP Periodic Interrupt Timer (PIT) as clocksource.
> +
> +	config VF_TIMER_NONE
> +		bool "None (Use standard Arch Timer)"
> +		help
> +		  Do not use any specific NXP timer driver. Use the standard
> +		  ARM Architected Timer instead.
> +
> +endchoice
> +
>  endmenu
>
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd
>
> Best regards,
> --
> Enric Balletbo i Serra <eballetb@redhat.com>
>
