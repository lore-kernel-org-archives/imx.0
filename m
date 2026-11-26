Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712211;
	b=RaRUrh371vRZcSsXO3H3Q6NOqZB9ZB+ew6/XOvQVPsBQEVPjVZPE8aEeO29PIwM+yOQT
	 lKHZ3J/dHxrURk3dh5Hn6t+KKDEtqzKVDsy0kN+rblo51DBaznYknbKUlQFijW7kSmu6Y
	 pbmGPeZLiFpKKZBjMF5wVzsgE2jop8bOPCIX1LUt0+Jvcw9CpHsxFn95Eh/3nNGU1HSSq
	 Rc5B4JPW+OYi184ugejtqVxx55ngtBYf75MT146rCR253xF5uToYNPEJIgXR837o2Uk2W
	 C5Mhmezz/vO1++sIsA1AWc0jwlMBJmN6PLgs+KRj/hKcihqCgGYJf690xhyP0ZFTBcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712211;
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
	bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=;
	b=fTSnWO71zyYFOk/vGNDiZ0aqSLlgofRWy6jmYLFH0amgKoywtfGs56uKS9R0uXfxSAsV
	 Gqgf0Syy+rshnyH/Ni0F2UdTC2HKZOuhNJS3s5hr+1Eu5D7NevYpzy+uHUmcHpB0/xRM5
	 DEZYy/X8OulldfYoeRQrdHsAV+fJZyiexzPyKxevtkcM134a8rplAWJtFhc+UpwCfAkOA
	 mZVa0TfPVO5vMhr2mKXWnj/LrwWHQqvVa3UHKkBs+nr1+IYC+8Xq0WY6seBxTct0u5J31
	 vl8l/d0d8h3BVS19p3w2t1NslIb0+RxvxIfTx9ylaPzqs3fxKa1fKSwUvjqwMYEf8Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oidyI12y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.11
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB69606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oidyI12y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf0tMfAPHTgbDpDg8Pu5XHDNAhtIXkulKaTXrWNZNcSuvjvGzDV7wtLYq348c5pplXO1luKr7I7ckFRjivMCOSKKeb3fkm4UIKFcpx90ZYv6DQTGvagY8YAG+H6ibKA8ItSPdQbCW/XxL/EA8J46ji2X7+XBJTIwIATrRCG9D6HYu1+lc7tc6Op0wPYbLj0U5ZpDe9PN3+Oqq0wXRZhc39RT2l6xlXTPfSfnvFtoFamqcIdLXexuwfV03L96uSHRfJsiEzpeif4YV/cKXp91bhPc+7PxCrH3ybledpd7mYh1C9sjz0/gR1/ZCJ7+h7VdmatzqNoKgKEMghk3TX9eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=;
 b=MCmB9lp1addmOEgo3O8esVBX+1e5xBqxmwP/fFTe90UkWk/MGxmSfvSAi0bSrw3ycvkzzevmWRSO1LXrwM+WX7sK7m3kNu8+Xu4oMW36n1RrhOfbq7S/byZln1qRfzPd7IYvWR6Me9wZFtFWYdI0BnTkKkFs7O29iyrr7DTCYtCcqMv7gPXp/29rWz8m6xtrZay+wvnqNDQ9mC8s7H2wllXxSiFZ3lcaP5a3L1+AR3KqaPH/lTaBw+Fpx9j0VbVm7slZa+gYyutyVgEx8ATIWf5AWdFIyMXkESR/aSeyyGX0CJv8PxNak6/vDj98okgb5tR12JEtXPLgWlih/CamTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=;
 b=oidyI12y9yDsgu5+XemkTWMdea4DDTDEgH0aafyGjg37hRIAWGHc3wDl3Bypybwzgpt9ofYirz9Njg/Zp7ZNeo/Gkr5AXorKsbFTQGtWcc+S7b+lG7POyk4GPnIG9MtxbTjkRfOSa1Jh1asBO7O+VX3hYbqjQJzEl4iobF3CZKwaF8dJIfnWtV3/FZP7sGitbk636AITqmxQbnn1ElGZT8AE8XiPbvZG5FkTc2wIRjnlM+thuvQRP4FFbH875DXvrx6GILdK2m+FsvxEy4En1Fw9ptDgYcDikbTOJQ+jEjcvXqlq6DPtl34Hz0bFYv4icg8YV210QqZWJiIRyCr9Uw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMVPR04MB12650.eurprd04.prod.outlook.com (2603:10a6:20b:775::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:56:47 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:56:47 +0000
Date: Thu, 26 Nov 2026 10:56:35 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux@yoavmoshe.com
Subject: Re: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
Message-ID: <awhkwx0O9MPwJxdt@SMW015318>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
 <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
X-ClientProxiedBy: CPBP307CA0006.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMVPR04MB12650:EE_
X-MS-Office365-Filtering-Correlation-Id: 13180dcd-ed45-4170-48bc-08df4bde41d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|23010399003|10067099003|261022105027099003|56012099006|4143699003|11063799006|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T8vkMvvQOFU3X3wjo3nw8QWkPmknVnH0mN1En4n4YpxnkUZbhXRebx+SmNgl0vblU7yz4s7SNgaW+N+Dt/W6A3wFQvkFeW/9SyoR3WIwva0CbjXu2FHHKW9ohLRIMDhFKf5wB3qpK8Db7UeuiUwdxKZyIjIwL17oWbRvUTk1kTkP4JRl2UJe/9yyLX2SnW61nI+ENUF29wWln3cMPwKFDHwe+9ZZIPF2tko3LrhXJYAMgTcTeHVHDWD6k6TzjSNYLBCDlq2LsbjSNfltLinPmUwBH/m8t6eojdJ5q0VpFjmuCRGX30kW67L+MxfUgSojhFp2EfPyNdGq2bFoJP7V5ynhYJEV4T4n723oLQs79gqG1hNeOmCBa3pcYC29YPRZUY5kXreHXUrMBDzZRBZqsh8OXrCUvWa/zBbRL1XihjaVXFRaFRyvV3bjOF3W0oOwegGX1toTZBjKTrlxVyE2dWXRs5X+BH4WCAkwwe3Oxtea4seq5EJQhQxiyjLWoFyLAo4G7UEksQW/LGX3IxzuXs+/pYFSzaaDN0fkBjazClmRRX0AUHOeOlDq098qkMHaG8DFT6w2OJDrN+HWSPUZF9jSf1LAOEY7LmTDjPzcwOB0g+t/nlfCXe7LCe09cYVqqSmwoIQmokjFdWbyQwaDOXbwOH1s62QgLTjz4QyufIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(23010399003)(10067099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?delTJo3mZY2OalRuTMxtegRLOFGOsWdY3Yc14iZiT4E59TwxINYBdlJwTDGD?=
 =?us-ascii?Q?kOQ1TbKT0rwOB2DIFxFa2gy1EqlMNFbAIlB5FNIrU3WCE77znJrQ96rsmBf5?=
 =?us-ascii?Q?6RsfT0qTLIwuDDHT9uXdfpxlFBj/ZbNpJvxUoF0tj1LnyhWhSearWOqp6aBU?=
 =?us-ascii?Q?H1RVYtTsemvB9mV7f54c7vX4IZ6X25kvKf0pVbVZlejQMheSAlJLRpwV4JN+?=
 =?us-ascii?Q?xEpMjcECn4FUfcHHtBzLyKS+66K/zFjKQLrGyOpPkKCW/N5Dyh1vyr7NH7ux?=
 =?us-ascii?Q?v8Mb03H2HoKC5THhOMsaITVpEZ8v2nbANKwDEr0zQ5opjdhUxR6KHOjszjlj?=
 =?us-ascii?Q?UC4jWLg+VCgPRLx44csIPz8jkyCuDsuqf2MG6G9ESOjzrja9Yh/Y8k5AaKF4?=
 =?us-ascii?Q?xQx2UPr/W2TE1ARD9UBhryYFVYNs6whmBCkJYH5n3pGfJkw24W8KsKo9lFyC?=
 =?us-ascii?Q?NNrjCFve+c1a465ctQG6Fd79m/zz2XEwR5XahPH6UEX/DontSx5wyvoqbqeZ?=
 =?us-ascii?Q?MKNC0DUK47bdNZ9E27h5uY7/C22IAGmViwvSKbNG9xHnJlpmqlUmY+QTLeqa?=
 =?us-ascii?Q?9ke2vjH+cpI7nLhyA8rzRqgpJXdTedL6OOVkN/dIIJk89PTvnnSYBk9gq8c3?=
 =?us-ascii?Q?K4FFTwP1YcwQ3IcKeOQDuGV9qrASf3yo25uA1/sW+5MxM69bBjO+LlITy/RC?=
 =?us-ascii?Q?0nghZUhSBdpGRU9+n9T//M4vuqVoELBH2+3sPLnFW9GuAndpGdHHIAHYIxsD?=
 =?us-ascii?Q?3lEFNYeNHU2KIzyCUifscJvNCaUoN+BAn6v7PYgDQNDNXu4RWkmSyHj+GdVm?=
 =?us-ascii?Q?SHzob0smJchgDG+X2Jvrht0Yx0pHVz+qb/x149zbghG9wfjdarnmy/T8c48Z?=
 =?us-ascii?Q?aYXW4Hh6HyEpfTDyDFZ9jg7in9w00ErfAa7DT0oGogdzBHXhKXCTYb3+G/w+?=
 =?us-ascii?Q?maUZpCudYmhPdPRYu50NT64niAwGTGIdWOAazm0WQvRdCXTohF9h7TgGvJyt?=
 =?us-ascii?Q?m9Z1Uni2Y3PLqGuJX6d/EEW7+1gUZsxcmJwBpJbyBW9DO+b9KAGhhl+fN4Sf?=
 =?us-ascii?Q?6sNaKebhO5xqZPvT+/snmSWhLu+gncxkLtxxjqxx4+Cgp7SiNFhxAue/AgXS?=
 =?us-ascii?Q?+xl/iQpkEY+q/aKL47SzdkFGaUS3AjGlGyXKg/R/KPVVx+cXrlVzkcpHakTs?=
 =?us-ascii?Q?Xyyg8MfgVCOODFJRAZAxZxoZDScGTS51+GRyh/drrvQ2/HxfB1XpZCr+kAoB?=
 =?us-ascii?Q?lMacjW3ipQc5n/4siQ/yZ4Z6akTex+As7/pN7NcehtbxI8vjqD/z43qED53m?=
 =?us-ascii?Q?cCG+bRscIROfpN/3LMpCStAO9b4T+vbgIR4FdkAjGv6Fgv97Ca6xXaL2cf7m?=
 =?us-ascii?Q?sRdL6nDamcXDEbmJmfC8+eiyok6YkRTGnRCNB+8x2GJdZS8spfXKWDyMFOlm?=
 =?us-ascii?Q?dK+b4pZ8YjT7easiL9MfBQhpuBWSCdOIwnw9yy3df+OFxuEvYybJ7s87ee90?=
 =?us-ascii?Q?p5rtrNdwU4TDoV/JCR+0sNnwRi+neMqeLrs/R0zzokImZgA8bfizIjJOInZS?=
 =?us-ascii?Q?K1DttkvBdB8arueC19HYNpnPD6IkCvB/qCagGVb9QgrXFm2HqGuk7X7swtIX?=
 =?us-ascii?Q?cNAeftcQ/iIqI1Sb+zIFIneWSJyZUPrR1DOqYj/8XM4Ci6yATKeyM1G1Z2EG?=
 =?us-ascii?Q?Rz5Q4pD8onarE5WJ264NPiBGbTaqcLOM0iiNUDElkKn1Iqvt1+XasHmAzxRJ?=
 =?us-ascii?Q?EzNlIxPVfHEqm9nMOA0EVinSSKFnXiL5+hq9tkUhlPkj8G7KsGGX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13180dcd-ed45-4170-48bc-08df4bde41d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:56:47.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfCUtoc8d6SaGbEyijrZkKIyw++en3NNQNwCuglP/YQo9wKw1E5f+BlfrT+slT40xX1+6lae1olsj9kJda8Qm1ja/E2+FhwLZPIkp4uel5IRWDXG3wIAJN3oIsys7+OT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12650

On Thu, Nov 26, 2026 at 12:00:55PM +0100, Andreas Kemnade wrote:
> To avoid depending on PLL infrastructure for timekeeping, prepare for
> using the 32K clock by configuring the clock source accordingly.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/clocksource/timer-imx-gpt.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
> index 8335bd7f8c6ce..85fd36fe1c760 100644
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c
> @@ -50,8 +50,10 @@ enum imx_gpt_type {
>
>  /* MX31, MX35, MX25, MX5, MX6 */
>  #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
> +#define V2_TCTL_STOPEN		(1 << 5) /* Stop enable mode */
>  #define V2_TCTL_CLK_IPG		(1 << 6)
>  #define V2_TCTL_CLK_PER		(2 << 6)
> +#define V2_TCTL_CLK_32K		(4 << 6)
>  #define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
>  #define V2_TCTL_FRR		(1 << 9)
>  #define V2_TCTL_24MEN		(1 << 10)
> @@ -271,6 +273,7 @@ static irqreturn_t mxc_timer_interrupt(int irq, void *dev_id)
>  static int __init mxc_clockevent_init(struct imx_timer *imxtm)
>  {
>  	struct clock_event_device *ced = &imxtm->ced;
> +	unsigned long rate = clk_get_rate(imxtm->clk_per);
>
>  	ced->name = "mxc_timer1";
>  	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
> @@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_timer *imxtm)
>  	ced->rating = 200;
>  	ced->cpumask = cpumask_of(0);
>  	ced->irq = imxtm->irq;
> -	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
> -					0xff, 0xfffffffe);
> +	clockevents_config_and_register(ced, rate, rate == 32768 ? 3 : 0xff, 0xfffffffe);

Check 32768 is not good enough, in case board use 32000 osc. Add optional
clock osc? Or check clk_per is NULL?  OSC clk should always existing.

Frank

>
>  	return request_irq(imxtm->irq, mxc_timer_interrupt,
>  			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);
> @@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer *imxtm)
>  	u32 tctl_val;
>
>  	tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
> -	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8) {
> +	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8)  {
>  		tctl_val |= V2_TCTL_CLK_OSC_DIV8;
>  		/* 24 / 8 = 3 MHz */
>  		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
>  		tctl_val |= V2_TCTL_24MEN;
> -	} else {
> +	} else if (clk_get_rate(imxtm->clk_per) == 32768)
> +		/*
> +		 * if powered by that always on clock, it is feasible to let
> +		 * it run in stop mode, too, allowing lower idle states
> +		 */
> +		tctl_val |= V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
> +	else
>  		tctl_val |= V2_TCTL_CLK_PER;
> -	}
>
>  	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
>  }
>
> --
> 2.47.3
>
>
