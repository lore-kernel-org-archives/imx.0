Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BFF37F302
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646733; cv=fail; b=ckiT6FKNCl/I5ST5dpbCS0SPew8jdWId272QvFIB0xS2BvwheZZaElPOnfqr3y9WF1QIYarjaStR1UaZl+dY+nowJQ+KvQnEGiKF+zpqO9tOD+Obb917fZTmk0SseTHZZyIPZ0hXOXyCYSgQlBfZw+XgnrA/v7/rIgNdDY8Jmeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646733; c=relaxed/simple;
	bh=Nem7qnAceDWrMHAYET8FKwh2pJpjaczX2qQaQgRWN/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ObXwmOjmI9NLGSDqqcASYFXUPmq1gSDpLiiOhq66KcFkSNu3uTmS66ZB1KL19m+uj2EKeF95tNDfXn/MLi3kn65jY9TY9QK95J0pLL4xvQplspFPYElshd26bodKWrWrPuRYfWvLOJTt7eam1EBlRee/dnazHQiZdsYmuzymROI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qOHRKSNN; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qOHRKSNN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhofyKQkrqc39yV28paaNDbVVVHQuO32jBZlOdMSXZ3SZKRz+7ERznW6YnAdIuh0trRY3b/fD8D/NVm0PhcSYg6Rf51chvMfeKo6kKm2fMcVs52QS1/IEcxaMJvsxDCqr81VPjv7DhtGfj28RiLztXJ8QSAIuom4pCe/9wLSuT2OGGNgmMAhvJWBLGhCe+lbH9zpjfNVr/TLVt+MSR5TWRjVjGlHHXkpA1zg4/wFsM9TVK7NwiMhG6KJ5Y9QRQsMP+aAoAcdtjPADShqe8MlrFm3te7DGwkbp+wqfShqS/lvEmq9/QgT17Idec1QvEMJ8PSHUTaEGNasQxMIBt/PsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phkEPNm95bzYNOZgAgMUx5XENpoN+CmJBdRK2AvZ+NE=;
 b=Fm231QRFda04K350x77UfTIOCTiJR+7+2ZcQFPH+Fvs1gUI+8kXXX5UQ6POYzEuvdH2RQyz6kiATJ7lNFwEe5jps7POuf+P4YWrUxP1fu4n9B3r2PsRvxCpO6ea9PbZKPIu2tRGPCVwP6s/KDOYo/LOscMh5wvE5Nm92uWCEykPi9fEivlWotk1wZxX9ycUi+hk382Uc1tCN/L8Y9/f6RXeoZtw3lkBJX42iFQHhYSsHImq2jeQRxByUNQlDw3rolfuCwhkGl2wnG/HoER4grNQgKDJIXQf01bDKjx/jl45DyEkhuld2jCreyeL/EzWpPHyfzAW5mA7nR/tggZdcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phkEPNm95bzYNOZgAgMUx5XENpoN+CmJBdRK2AvZ+NE=;
 b=qOHRKSNN05sgPTN6fYFKuhUwjU7318u1L94w49HnpQLRD0XFos+oNhaApX5+a8AFjbF1/7Y2UNg/6QzUY86Lxil+gHMlvY45rTyTS0dlRVirqakFidUmmAGMXD3mPBVBlB0mnYhuoZRi6Uo1p4vfau0SfexPWggZWOXXqcc1P+XwsiSlozpEc3ekyhJRhMvl1uUTIlDHl/Eb6pPMhXw+SjDa9xJuCXaISvWS2k3y/NsERZusdm7bBIDu57rt2w2CrhpT0YP+lzVwdplgHYUsswVuXnOG7eT8wZbvRrlBaoq+5J0/AXUBxujZ8uHpl00GOpw4A1JwUiDNVGA30Hda+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB10060.eurprd04.prod.outlook.com (2603:10a6:20b:676::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 18:45:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:45:26 +0000
Date: Thu, 13 Aug 2026 13:45:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header file
Message-ID: <an4Qv6kA-hnbUYaA@SMW015318>
References: <20260619122448.188046-1-thuth@redhat.com>
 <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
X-ClientProxiedBy: SA9PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:806:20::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB10060:EE_
X-MS-Office365-Filtering-Correlation-Id: edd360f5-f3c9-406d-6d1b-08def96b0a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HylSyw5GKzhsfaEII455LXXk/mgYbfiyJbQVabi9o+Narvzu+yUWHcrfV3SHVQI1tjiN1BH7XIA/yHxvTHAK6xbalcedd1A8hoGxk6DJTpNqUCBF/AwwfxCLoQ7dHl3dlkcG7pVstoEHfNkjgNFh+YDgRDkzxqRHyVv0I2i9JH7Ih1U8n0SRnrEyFMZL5itY7xVfoI3zCm8H5GtUFXtrb8dKAqgbMTyjpIOehSsLj3b3JH587HbuOBw0wNW//uxrt1t6yqqmqEPni23K89PYp2v1UpNUrvw6i8r9t4v2uOdU54YT8edp7akrxD3HyWZY6fm7zJZ5GWf5ouRokDht74+JDac0U7nxMBT7CZJE9EsvtcAIXy1g1SMCOD9p/CkiYif6yjMaxLhIFCRv3YOwSXw2tzH4TGbi4VFse8Tv6r9k7uNsgyEkKEt0qvfDs3FYEjIHlZPZCV5IceJOB6/Job2ADwa0umiK7I6cZ+eMYvysvKadb5mwx2ns8VnM3iOl/sjDMNlVlrZTGCyNvRTn2wxiSXKQ7NU9T+V6fJ3xZ0pv/l5BriFTU23D5/roUioXU2/0egYl5l7gAXNWkXwddhrrxsr9QDdTuRHIckq61AM4Rrp8C1M0n1XNGKLQETgWO1lCukVVoaqJgKCxGDxx8ZQTg097TaFR0fknKTDiMs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I6b8b58A6ll0rt0xP2bYiQjVe0wrORxHbHyXVATgZn+lm7A5fAflOC9/CoZS?=
 =?us-ascii?Q?KLGJJ65+kTiEClRkaAxgnYdt177KC8DJBo/6sytXZKYWMZp8iKcb4CYH8NYb?=
 =?us-ascii?Q?siuI/kCJMLwItOvvTnOtYwwHidfIZcyluB4nJxs5IRZWlj6BS9b+ADe1IwAV?=
 =?us-ascii?Q?WN156FMXEBK4f7k13tR8piGSLviExEqrK1Mup4tK00b87ma3GcHG27M0o/mp?=
 =?us-ascii?Q?8DGmne/XYeljC7Gx4EHOyPFa2kP/IpVRruR/63wYINMFiICyHq0OBbkFpKQd?=
 =?us-ascii?Q?Op76iDDavqTpdSFLHGfvAPYVzTQFf6nFMevC1bCuUX+8R869CQjZALb0t/s7?=
 =?us-ascii?Q?6MKuBWWMXuo9/GxAkn6DaFeXCmUp5qByHChc+6qm8l/+pqU5TbwUcIte4qG/?=
 =?us-ascii?Q?7fjDTKveSN5KrgVCBANvQxMAqf+VkUMxOWml+aZTsCDg2s0PnqTNSZgrRrbl?=
 =?us-ascii?Q?tp0nRLk2RBMbt2+r5PW6fFC7FJaHgivAAb0AJ3R8JqSnXSk+DisfRAJXxNmc?=
 =?us-ascii?Q?OjhwTefvvjCYDmOXKOcAWFAWT9m9kEH4+MNzeE5kk8tFNadFjjr7m5sYWBG1?=
 =?us-ascii?Q?DXod1qiMHxoVxhr+NeH623Ry/Yuw3o3I2oloUgey8souxeYIndiZYzbDOARV?=
 =?us-ascii?Q?i2FTK9PnCw43MSFjfBsaZuVAHNxXIh0LF61FUuDeILRYkFxaXBsnYMTI+YvV?=
 =?us-ascii?Q?8JDuY4CaF5VEigp+f28Ssm85LHwkyAUvDi/WTiEgJ0uQtwxovh0zM0UDqIhA?=
 =?us-ascii?Q?50N1gQv11+lck3FnWdWmMW2J3llzMxLYA0Lwu5tVNm+t500obGojZc+EactV?=
 =?us-ascii?Q?X+1ACaXUfzX4Bdpolj9EU4r+rfwP7xduCAOwJQXEh/8ZH3CKF3CF09RjwrO+?=
 =?us-ascii?Q?THNNwSk8jh0W4lxCq6N1LBYE+58K6v4dBwoum388nUM+1VH5q7ArnJ7v6eWw?=
 =?us-ascii?Q?z7J/yTZ2JCS9UD04TXAHNTiZO14+LwgwlLOYRHYMSXMZlPGZgIb1h4Tuc7I4?=
 =?us-ascii?Q?mJg+31Hltcl74Zb+mxxLRqo/U3K8sjaWs70IU6EwtP/HNXsMmZmHNsr6jrj7?=
 =?us-ascii?Q?xV4N/yEBNs8+z69XkLs7TmwEq7kFxiomTKYceADaJqySShBskiARa0+yfzQB?=
 =?us-ascii?Q?YTzr0e9mY9WUktnAJdM7OnC3YEI3fLmD7X8vev6pjodw3HZ9R3znhQbXiPNJ?=
 =?us-ascii?Q?zzbIvbGDwcGBNU+rUAUQESuA7hCWDoYvCY8xJZ2rN4NUi/1jj/vl6vSYOMsc?=
 =?us-ascii?Q?HywsHyt9eoPCYnZ68CbJioPhfBcLnxwMoUDggTdKDSZ+IQgKtU4Kz/eYlvUf?=
 =?us-ascii?Q?dta3UxNDAxd5bkMMyv6nRKkzejGycgOZiN0WwOwYjiZsG74uCOdOfvwoZX2v?=
 =?us-ascii?Q?XWCs3K8QX7BHYZrHq4uEPF71SYg84P2oB145pbZW62bN09GZEKw/G0wr/947?=
 =?us-ascii?Q?5PfLgORlj5OhSVtSfIUozteJD6R155MCODUEt18gblIXmePaqN4fn139IV9P?=
 =?us-ascii?Q?FfV1UmsjxtmJUnRZ9AbcrVQaVyOkGVQ5bRLexxYFkqX3uWT50mkSWCN4r3vz?=
 =?us-ascii?Q?C0l0pkqiVxdFOK4WsdSxf8TjNREMIsl2auO4A++N4D6vfrQ0lSW/RvCyMmav?=
 =?us-ascii?Q?yMlcv07u26L06ylnybq0gUiNw3J30FybO87SE6/HhBs+Zfn/gHvoOJ9UuKn8?=
 =?us-ascii?Q?JfC1XlODiO546Kks1IkACo9ugcUoAOVYeHx7+3BHeM8rnnYqAXgctablh1qy?=
 =?us-ascii?Q?wlXBMjDlo0/egSENzsuzTrAz544xIIjrCEwbEtGRstwxM1w3L3EN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd360f5-f3c9-406d-6d1b-08def96b0a17
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:45:26.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnwzahszJ5O0y0SaFHV3lOp3cH9E7ymnYJLMrmHyhRnCCoF4kmBHgm+a4pNps7apGPqPbkoWz3bDoHf62eUUEwylwEuY3pdqZJNDyBFJHcPvek+GrQFK0yaNw487yKnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10060

On Thu, Aug 13, 2026 at 09:35:38AM +0200, Thomas Huth wrote:
>
> On 19/06/2026 14.24, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > While the GCC and Clang compilers already define __ASSEMBLER__
> > automatically when compiling assembly code, __ASSEMBLY__ is a
> > macro that only gets defined by the Makefiles in the kernel.
> > This can be very confusing when switching between userspace
> > and kernelspace coding, or when dealing with uapi headers that
> > rather should use __ASSEMBLER__ instead. So let's standardize now
> > on the __ASSEMBLER__ macro that is provided by the compilers.
> >
> > This is a completely mechanical patch (done with a simple "sed -i"
> > statement).
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   Note: This patch has been split from an earlier bigger patch of
> >   mine to ease reviewing.
> >
> >   include/soc/imx/cpu.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
> > index 0bf610acafd06..8c53150acd76e 100644
> > --- a/include/soc/imx/cpu.h
> > +++ b/include/soc/imx/cpu.h
> > @@ -30,7 +30,7 @@
> >   #define MXC_CPU_VF600               0x600
> >   #define MXC_CPU_VF610               (MXC_CPU_VF600 | MXC_CPU_VFx10)
> >
> > -#ifndef __ASSEMBLY__
> > +#ifndef __ASSEMBLER__
> >   extern unsigned int __mxc_cpu_type;
> >   #endif
> >
>
> Friendly ping!
>
> Could anybody please pick this up? Thanks!

Sorry, I missed it. It is too late for 7.3.

Frank

>
>  Thomas
>
>
