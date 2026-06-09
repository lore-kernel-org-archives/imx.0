Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AD343896
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016367; cv=fail; b=YuR3p19ukPii++kb9JQjyFHhBx2luzNUUI0qpLVX3e2d8uJQ03UD3s1byzPkg1b456Hin1pJvEKtX+EmMrcltuL0wOEj+B7UVx57qC/DekIU1qsqLAmQwMMrzwup9qc2gFkzF54nXdSQ5s8VkewfatwcAtbDEyp/7+SHWoPAwdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016367; c=relaxed/simple;
	bh=5IJQJEfa77zfpRxakYaEvj/3DBoXnSFF0OzzLXjtCrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N2q3xdC1NCB1iY93nzimzOpksMoxDch+u9mpFqlOiP1SYj0YXJsGyUvd8afSV3k6gDM0CUnIAJU/i15njestexGsXuykJt0slcfax8w8/iIKDeWodoyq2Bsw+PwHhMQiIIVgGNvL8drNlxD6VWlLwfsUATSt/9YtECmypvSH8Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eqR9Fpg9; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eqR9Fpg9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q66Sk828N6FhgILcXGpLcsvSLygoqh3HayV3tzplho4Ir0lYVq99+Iqqdl0iYHGc0kBsAY+TL3ftgBQvMe4nP8NiLZ8d2gn/awX9Oa+kpM4e7lcFjrBvF8WKYZkmzEO4jXBGV9Nf6FfQpnyh6kLxPPU/l8Bcj69dhzKVt4HCtqhCgE8vYZV/Xg9QdVi3iskG1UcApRdYcreafGUcsGeN0o25UGKevtpUFXdS1CzsCgp/xFCiafuibSwD49chjY5BozHW93HeNRRgcjlhjFBtWM4xingGdyw+9PkS6SY6fujT9OuExBRjLTMPG6laVJAGEvVr9ChN/oS8iSbEly5D5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri7tSJG5mUTuRRWknZxoqDMXsmg7P3TI0tHO5RjBIYk=;
 b=d3qJOrTDxWN7sdU0h/aMEW7ouwqbR8k0+14wEL06Kmk4s60bMlsc0wT9HZaz670G6XrFE+ZP1ycFCmekAp0ujGIDr4083RIn1qRMhvFasbfaK9oNXVm1GhAOer7wJ2tqu5j7Lbtxu5veQlCVrdnjOFPWsa4GeLj0jaPlKMA098KVuCOfJS79Tst9aahb+DugeuGLOls0U2tO68274r68LKpfRKfj1sATR01d95D+nHhZlnROK5e+MN9jI6Gb2DbMtzK48vzWn56+AZcJiEpLK7u9yMxU9pe/PL6WQ7IjacZwYGv4I8stP+hQgeoQH602QRMESnmO3IR/DELd7UJCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri7tSJG5mUTuRRWknZxoqDMXsmg7P3TI0tHO5RjBIYk=;
 b=eqR9Fpg9qOY8cvl67sZivT1mCuL0KK4qJ22t7untWetM0zOH2Ig0fCiBFjcpdRLsGUv9kVrbSPnDZDNaTITZ+hXA7VgFoIJVhxY4t1A6L7LgvcGGw6LZYT24OgaaIL7y3H/yOSAjUqfYJ3hwNVO7kWbPzFPC2U8ZCxXr41VrEBYC6AmcaPdw0pOXj2nFENzA7WyMqvGuTGgPZIJNKzsV8X6/DGHWh/RJfpPvLMizwJeDH3L4pEEshnWsW7oj72YFCfNP96v8FKyOI+8+IvsZoQ3kmglttUWOHufoQsXPBfH+DCmQ2J+QFrrSWQwn9TYOzF+PYtsBRcg/w47x8nXezg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7327.eurprd04.prod.outlook.com (2603:10a6:800:1ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 14:46:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:46:00 +0000
Date: Tue, 9 Jun 2026 09:45:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
Message-ID: <aignHiLu4wbh86Ut@SMW015318>
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
 <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
X-ClientProxiedBy: PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 5facbab0-d7dc-40d2-1481-08dec635d2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Eth6MlGiNQFTrQDM/9FnlO3NAeJk3RQ9emKqtS32e6B9ygFoX4/1eVg9irTRlppqsKT1kNNqRsQWO/bgxsVz47PmsD2J/eJhIQ6t602Q8IBJzF7j4yytXoEbdVPkWOQ4mkTjcbrvDXfFOrP8/jZl2kFvXAAjAETtKsgOsne0x/hm48VQNeMPNmTrpfhBdDue+7NqxYjEGbd5S7cwzDQVLqOm5L3vF+BRtNa/4QsKMSs3YkE10na/E8PMK2s4ObFWPQDnigPG776LkgHgRyzULbnVfHtiqhZmSFL4XUXGReUA6SZwXg2bL57iS0WOqsdqR99b+vdyOzUkwcYCP3CzhYBEdFN7HZ50IN3W3ftiu4F4ib/pyXLgwIWtuvTwXCyjweNLvXesVRCeGdrC4TIgDJNffoDk8QnwqDbJz9Zt6ATvFaH+YgwKEh2ps02AzOvbkbTR0WCK8NxvIcd6+b+1bWSwbHCzaXmQxSrp/lfv1oBCE2igtVyUcfvgCPso6hvccKA1AXGwegjKckwjQZ2GpnqZ9qU1263VHt4YzAjS2KbXtNC+SJPtjU/Nalb+LGmqTv3gtAwtDh3lBRUyho29blDA1jwRfaKQfg7rsGHhco3MOyVlnPmazn1c9ARFgax1Yl5UCCVFwz/ZVkVyvadAAkOCJ26qrybhV2Ox+JHveQb3oUyEGJypeIPRCn1lwcTymHyO5b4Cgj1ciffbTqJG5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1d3KysvNFBENjlmRm0vRC9lU0ZKb2UwbDVuRm9HWFhHTnh4cXVzNEFsV211?=
 =?utf-8?B?UnpIWlkrYWQ4dlR1bG5wT2RWV1laWllPTlVMbm04RU91aHhhTi9icHc5ODlF?=
 =?utf-8?B?TDMvVVFUSGhtWWxPTm9Vd2VEUDNjcGtQNnpHZlE4dnV5LzRaSkI3a3dpMkdV?=
 =?utf-8?B?MXY0VFVQNUp5NnRELzgvZkVlTjlUd3VnbW95UnNHMGZZQ0t2dEQ2ZWlyckRB?=
 =?utf-8?B?SEhhZWZRM3I0ZllZL25HczFMcGk3UzJUN0ZUNUJLTGtHbmxPQ3R2Vk1ibUVL?=
 =?utf-8?B?U1AxSkFwcGkvNE1iUTd1QVpPVVJyaWd2ZFV4ek9RM2lrcWkrN3pzUHRPRWRT?=
 =?utf-8?B?RXhlM0JQMVRLSndxRklDMFJ6L01pYW1JMEVYMnA4cWE0dFB5NTlpZmlnMkFH?=
 =?utf-8?B?TllEUW9NOEVaNlRJWXJxQUpTWUUxdE0xWnIza09ML0JtNmJpbVVKb2JQRzdV?=
 =?utf-8?B?L1g0Ymk0MDRWek1JdHp4b1YrVC9vTjRLbTJYTmcxK0ViMkRYZW9zdFdOeHl0?=
 =?utf-8?B?REsrZzRzcjhxRFRwWHprT0hEaHVDWHVvem1yS0hBdGVrdVJRa2RDOGZTNUlk?=
 =?utf-8?B?UU5oMkJHYnQ3dEJXZXBjU2JZVFRTcExtWFhiNERHK0pIREhoNmxuWXRCN2dx?=
 =?utf-8?B?bTVvUlA5Z2Q2eXNLR1hEK3g2dFU2UzRNRTR6Zk5YUXY5eER0M0tOSXJ3Y3Zi?=
 =?utf-8?B?aE96ekorTmpLNGZGY3VlZHJMbzdmSzczQlR1dWxpcDQyblNnR0dWc3ByZEFZ?=
 =?utf-8?B?WGZialBUekVSQVBxM1FsdmhpbGxEOVdZYkxnQTY5UTZOanl0aTlSZDNjaFhD?=
 =?utf-8?B?WEhkMHA3RC9ZVEtwOTIxZnhBSnpncVdMRGUxOE0xQ2hGcEdBY3ExWHJ1VDM3?=
 =?utf-8?B?QUVPNVdNTFp1TmFJelBTRXAxQ0YxQUVGOFRuWGVKMkxGeHgwOHp0akx3SWlB?=
 =?utf-8?B?SmM3N3ByV1BSZmR6YSthS3ovMjNpNEJHQytCUjlVNks0dU1CQUZpSGhSNFNZ?=
 =?utf-8?B?aDZ5R0w0ZThZaHZIVVZrRG5uTmg3anppcmoyRU1DYlhpZEZHSC9xWlZwUGVu?=
 =?utf-8?B?czBodGlpOVIzM0JWS1JSeTVYSlBWRXpxRHlkOHczZWlGMWJ6anZvTzJtSnAr?=
 =?utf-8?B?SGZ5VmRIMU1RSFFEMzlJa25Wd0NLemtnQk9NZEZvMDRiN1d3WUtzdmVuUnNK?=
 =?utf-8?B?eU1Xb2c0Y3lTMG1RNG5ITTRlZ3V6ZDBDVnlCZGJYY3ZPZkNZMnpxcjJDOEo4?=
 =?utf-8?B?TlRkSEJKVlQrL2dmaEdlMUh3VTlCOEJkQXp5Y3M5eG9NU1dDeXBHYkJRc0NK?=
 =?utf-8?B?d29CQTQweHJ5QjNXalY1T0V1cGR0bzZvUlhrTWQrUWhTRFlpQTFXeStia1Bz?=
 =?utf-8?B?WlE2M2V5K2k5U2tsRnZ0TC9EUTUvWFZsWlZSbENvTmZsSWp0NjZaT21FMm43?=
 =?utf-8?B?WWhqdFhiNjRIelY4YlpTVFd1eEZjdFIxeW5tNjV3d1JSTU1pTUJGRU45djc4?=
 =?utf-8?B?aXJpNWt1U0k4OUVmWGR6ZUszNGEydGdyUHR3RGpCYUJkcG1RK0VXRTM3Ulhm?=
 =?utf-8?B?SU9kcjhVcDNQNmhVWTVGRklWZ3VBTklIcVJWT21HUjRRWDBCejI4TXdJNnNt?=
 =?utf-8?B?ZUpWTDRCSSsrUTFYbkk1VE1JdklzTFFQOGpWSXRmU01BVlIrRGhiZm50dWpS?=
 =?utf-8?B?TUdaOFlRbjYxQlBHaXhSZkgwU2tpMFA2RjhHVHFIV2lCOVAwVGlmbGhnYStI?=
 =?utf-8?B?Qm16TVU1a0c4M2xFY2lySFRqTU1ON1JleWlMdnNlMjdpWStKY1pWcndXUlhJ?=
 =?utf-8?B?MHVmVXlHc1drdmEwZ1Bmak5lQmMvc1lCZ1gyeUNDUzhhVXBLK2dPUmJsQ2ZH?=
 =?utf-8?B?NlRnK1V2dVgxYW5DVU5pWVpQd2dBRXh5ZWFDcU04U01LeXdHYXhJdDR6MTlB?=
 =?utf-8?B?REtsYWo0ckJnR1VzVFB2NWRYR21GQkEvQm1wWlNKRDY5YU8rMVVUZ0dEL1R6?=
 =?utf-8?B?V3o3Z2FwZUhkYk40YjdaOXVpa00ydUtoSitGK0ZvdXp5aDJnT2I4ZHJvQ3Zo?=
 =?utf-8?B?ZUt6UEZ0MStOcHQzOFJ3K1orN3hBSzduWDA0cGUyR3IvUUpyN2hHdXo3NENK?=
 =?utf-8?B?QS8xZVljQUNYN1ZyV1o3Zy9KTUFYTXpxR0xwSndUSG1OVG16NmlKUkgzUVcw?=
 =?utf-8?B?OVZxcXA3dGpXYTh0UlhnQ3JDK09iaVR4VTJZN2d3NXVGemlmMm0wRVdjOEhU?=
 =?utf-8?B?bGJUUDJDNHF3ODFTcE5ReDd2OEhCTC9pYTlJTjV0QUpZeWpsY3FibGFLZVdB?=
 =?utf-8?B?bjg2M3BUbEhLelNqL1NzRkZWMG42TFRDWHJPaGRkWDFNS1JaS2JFelRRWHp5?=
 =?utf-8?Q?oZbW3unEUPfsgnmwNS/O35LEXzCCaFkwkczL7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5facbab0-d7dc-40d2-1481-08dec635d2a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:46:00.7118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ/i+X/HO2VD9BPxz3W2X3AbINIyPnfyWWZflV4ueFBhqEo7dHKmq95lzEUqM5quMXyoV0xSrhAt++bsKB5/lXLnqG18dgDaHfrcUELbcuIdSnA053GTW/OpKDpCONcO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7327

On Tue, Jun 09, 2026 at 08:57:59AM +0200, Enric Balletbo i Serra wrote:
> Hi all,
>
> On Thu, May 14, 2026 at 1:14 PM Enric Balletbo i Serra
> <eballetbo@kernel.org> wrote:
> >
> > From: Enric Balletbo i Serra <eballetb@redhat.com>
> >
> > The Kconfig logic for selecting the scheduler clocksource on
> > NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
> > prevents 64-bit architectures, such as the NXP S32 family, from enabling
> > the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
> >
> > Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
> > drivers/clocksource/Kconfig. This allows the configuration to be shared
> > across different architectures.
> >
> > Update the selection to include support for ARCH_S32 and add a "None"
> > option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
> > Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
> > SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
> > which lack the ARM Global Timer hardware.
> >
> > Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>
> Now that Frank [1] has created a merge request for Linux 7.1-rc1 and
> the request includes

Thomas:
	It touch drivers/clocksource, Is it okay go through Soc tree Or you
can help take care this one?

Frank


>
>       arm64: dts: s32g: add PIT support for s32g2 and s32g3
>
> If this patch is ok, would it make sense to pick that patch?
> Otherwise, we won't be able to select the PIT timer for aarch64 only
> builds.
>
> Thanks.,
>   Enric
>
> [1] From: Frank.Li@nxp.com
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
> tags/imx-dt64-7.2
>
> for you to fetch changes up to c10cfc952215644956284a42fa7b7860dfbcb5f5:
>
>
>
> > ---
> > Changes in v3:
> > - Restrict VF_TIMER_NONE to ARCH_S32 to prevent selecting it on Vybrid
> >   platforms which lack the ARM Architected Timer
> > - Link to v2: https://lore.kernel.org/r/20260513-fix-nxp-timer-v2-1-533b99c57b67@redhat.com
> >
> > Changes in v2:
> > - Fix VF_USE_ARM_GLOBAL_TIMER dependency: use ARCH_MULTI_V7 instead of
> >   ARM to prevent the option from being visible on Cortex-M4 builds
> >   (Sashiko AI review)
> > - Link to v1: https://lore.kernel.org/r/20260302-fix-nxp-timer-v1-1-af4bc62d4ffa@redhat.com
> > ---
> >  arch/arm/mach-imx/Kconfig   | 21 ---------------------
> >  drivers/clocksource/Kconfig | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> > index 6ea1bd55acf8..a361840d7a04 100644
> > --- a/arch/arm/mach-imx/Kconfig
> > +++ b/arch/arm/mach-imx/Kconfig
> > @@ -227,27 +227,6 @@ config SOC_VF610
> >         help
> >           This enables support for Freescale Vybrid VF610 processor.
> >
> > -choice
> > -       prompt "Clocksource for scheduler clock"
> > -       depends on SOC_VF610
> > -       default VF_USE_ARM_GLOBAL_TIMER
> > -
> > -       config VF_USE_ARM_GLOBAL_TIMER
> > -               bool "Use ARM Global Timer"
> > -               depends on ARCH_MULTI_V7
> > -               select ARM_GLOBAL_TIMER
> > -               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> > -               help
> > -                 Use the ARM Global Timer as clocksource
> > -
> > -       config VF_USE_PIT_TIMER
> > -               bool "Use PIT timer"
> > -               select NXP_PIT_TIMER
> > -               help
> > -                 Use SoC Periodic Interrupt Timer (PIT) as clocksource
> > -
> > -endchoice
> > -
> >  endif
> >
> >  endif
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index d1a33a231a44..d9c76dd443f8 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -793,4 +793,35 @@ config RTK_SYSTIMER
> >           this option only when building for a Realtek platform or for compilation
> >           testing.
> >
> > +choice
> > +       prompt "NXP clocksource for scheduler clock"
> > +       depends on SOC_VF610 || ARCH_S32
> > +       # Default to Global Timer for Vybrid (32-bit)
> > +       default VF_USE_ARM_GLOBAL_TIMER if SOC_VF610
> > +       # Default to None for S32 (64-bit)
> > +       default VF_TIMER_NONE if ARCH_S32
> > +
> > +       config VF_USE_ARM_GLOBAL_TIMER
> > +               bool "Use NXP Vybrid Global Timer"
> > +               depends on ARCH_MULTI_V7 && SOC_VF610
> > +               select ARM_GLOBAL_TIMER
> > +               select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> > +               help
> > +                 Use the NXP Vybrid Global Timer as clocksource.
> > +
> > +       config VF_USE_PIT_TIMER
> > +               bool "Use NXP PIT timer"
> > +               select NXP_PIT_TIMER
> > +               help
> > +                 Use NXP Periodic Interrupt Timer (PIT) as clocksource.
> > +
> > +       config VF_TIMER_NONE
> > +               bool "None (Use standard Arch Timer)"
> > +               depends on ARCH_S32
> > +               help
> > +                 Do not use any specific NXP timer driver. Use the standard
> > +                 ARM Architected Timer instead.
> > +
> > +endchoice
> > +
> >  endmenu
> >
> > ---
> > base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> > change-id: 20260302-fix-nxp-timer-9cb1fbd7afcd
> >
> > Best regards,
> > --
> > Enric Balletbo i Serra <eballetb@redhat.com>
> >
>
>
