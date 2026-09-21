Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA1368964
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982715; cv=fail; b=u4X6kyQ7JmBITSdOTn5VSqZ1/e5U7XBtnCeTqLtr0wFKjS70fzKWiUxLKxfJfvB7dH/+LqWyVHI3XbU0WFWtJjlaphuK2wQyDB/Ra7iRZZ2EUWgHoGfvIWM3Wuds94lPdYlu9E//78bSN58/7nlCTl877+f4SdvmE2DEyEjf0Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982715; c=relaxed/simple;
	bh=GZdaH+9yKYYUQD7j7kX0S2q8MbOEG8/EMS+CYBdX2A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dIHpzsi5sGVuLeNVhOOraivyrdKqkPnMS9VcV9esjXGZ7/VOYxmZ1wvT7gBud+KGTe0tNr8wkGvL+2vIUtjPLTQkdrDDzn0kca6wFFM1t7HlKTmFpWEx1Yzr7ZOmPiOzZ8z6rJSeX3m7uwMqZ2wdaJGGgqOYoB8JThqAKNO2rHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vOWS1hAy; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vOWS1hAy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoX3I7i1Bx3JeNVCE9xSq09FEjYAlhqjJoLHzzd0XYJmsWH2nnqQqXE/Rdm3QN4+W0lOfY9fXFrPq9UzAhwRIlh0XhT9s3exGMjMFXlyAOK1Xl+qcz9wylKPWJUAHzTUHqhB41UNDuUkO8tpF6YcxRlazC1Orv4+q2PD1u5zBdN8h0jy9JRG4D9zeKDPXN8IzpBGIOAXu01EDhYFjAkauicNw9F+R56z5iNm+FGuX9W/fii5pj7P4F8FyVHfmrXEatF3ONZmp/mRzAo11qSjLJT9Mf3U7hkdpklQWEUceDAdn8nH583xw2o7uGmiPwivfmDM/5QqPvTCSk/nQ/xC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFVWKrhPbwSnEyDc8bnTKPyGJTHU0RsVYpSYucpsuWE=;
 b=dXvomnL8IEZHEyevP4nFFfWHxbHmkG9I0fcBwi1TSzjQYwSAgkzmbjkIjtS/tGH56PJVEOm8LUJMMeELegY8UceGl2WOyWV6qqaxLBUJ1kERp9FL1gC44zLUEGKvYBS5CzUtC26zFDAkD8Muqk4vk1C8OmXSSEdFSiTxS1x3q7M3OiQbb3zz9sfe2Rfx12SLdYe4MQuJueLcihgPStfL+STt3i9oy/0+Ae2vGjeeXF6ggjziBg7LVNdEy2GrKKNsXQiGJ2DQQkZxWZM9hSs5aBtUmDaO40piNvUSXY5Ql+sgKQKNOhx0yBwahjyOo5przJFDCN/x4uir48bN9A5Grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFVWKrhPbwSnEyDc8bnTKPyGJTHU0RsVYpSYucpsuWE=;
 b=vOWS1hAyUgMmHXsXXNErE7x7zk7HW2zg7UqF8bP1Y4mHW0uafSxj70mH9ZXGR4JpRuwZ0fe2tHHOpafiEn0Tns2qsJ4wPBTDgoRqQCA/1z4seJkDw3Dh/V/SXEL6zMsemhTmkg3Su7HSPzvPgoRSnCDRsFejI/xYyC+xTr6b0aeM55S9ZJRRpb/VbiydDp0B+ncK+6JmQ+YmOh4xjOu90Tc3U39hub6l748z6OSRg8L8CTPTEeBG2EuhSORsZE2KgpwyIvG7kmqGBu2oIOlVidb/yOQJJK1oKt8DZFJ+RdVLmceJrOZDgH4O13IAKJW+8LwhtpFSRE8REJUie4q3CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PAXPR04MB9595.eurprd04.prod.outlook.com
 (2603:10a6:102:23d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 09:25:04 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 09:25:02 +0000
Date: Mon, 21 Sep 2026 17:29:23 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: chunyuzhiqiang <chunyuzhiqiang@yinhe.ht>
Cc: imx@lists.linux.dev, shawnguo@kernel.org, mkl@pengutronix.de
Subject: Re: [PATCH] can: flexcan: fix synchronous external abort in
 flexcan_get_berr_counter()
Message-ID: <20260921092923.jwyluujse2uet3js@shlinux89>
References: <20260915063522.3010750-1-chunyuzhiqiang@yinhe.ht>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915063522.3010750-1-chunyuzhiqiang@yinhe.ht>
X-ClientProxiedBy: SI3PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::15) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d0f478-e46d-4b9d-d0ec-08df17c236c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eZf2TZwkfPfGLMYkTAzGCH8VBqRNOHR0rkJUdSzGW/ziwNWjDKOtLO0+KVR87FirD6FAQEjeT9dOt09xA2DDQLa3xHIdFUOL8mJuGgUHz8o7AdcVMj8VvvaAbIrvi5WeuGdiijHSpsC23Uz/QEpPOxOwsE01NSwYb3e6sQhvGlSZZ9+e7eiTfYHSdvpAFkthavMyNNfaDSHZ02SxQvnbNmONTlztG45RWsaPyppiZFEJB943RxiXKtzRxc/S4T4HUsLVEFnDBI9pWkOmhnwwiTfZfqTApRQcBHWf2vhwV0xq7ni8flAHGG/635SeNiLT6DuxyTrBpiS4q7X4BrkmREJBlz4NrAMD3wtqr85JoCe3SaBt1FwJXIRtpp/0bgiNJvnI3Xphf1iLuk/lOIJmiflrOqRatAUULIYqDuwLMFRbGZmUwGyHyHYshhwTYGSNKTzfOfpYSMfe63pkdkZD61CyPHlJq4PO0CLB5plk7FKNUMgitggK9xGtN87MUZsm6EjiZdMj5aK6XjIJcaZq3x7rm2WYqiYbmWG4QTREM4+wAfT3S/PHkcKJXJULH0hbHAqg5SweyJK7l/VZ24N1ZZ6f4/vZ0Bm3p1BtZsMV1vxcWyc17JAfol2rliWF111gYGRc7iwU9lG6m5+5LFM7zj/IkswWMdkVF60pBz9da7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXQmWupdtNkPHUgohBjn/JBQoSUArwl/MM0VSsdudlWrHBx2YxVrjcTOooHt?=
 =?us-ascii?Q?8/cweF994QVQb02QtQS8fWtPQz7qMJN5cj5iGTm3eYElxNiX64A5bP2xnurQ?=
 =?us-ascii?Q?+xY6a3VgopcUf9JvKZqO0ABg/MFAtRQO5OfZKYCh55HycJr+m/v/uF6MOAp4?=
 =?us-ascii?Q?O9837QNDMOjpPXjD7GCjn6VpgysaEBW3ruaumEssTo52Atw6MgtkVC58Y7Zl?=
 =?us-ascii?Q?GqcLzGdmoEOdx9EB1yMVyN02JbyzxgXQsaLlDhte799RXR/NhoD5Y4ouEBEu?=
 =?us-ascii?Q?8rCG2Zu5ixKwPVts2JJuOUfFhdJ0UVNioym/OhDYcWdAiozPJ7oWvf9SZX/G?=
 =?us-ascii?Q?n+RYpd7V1Io6Er/6oQsDaZxmwzruu6kIvLz34yNxZTPYECuHquCWGkR/JZWn?=
 =?us-ascii?Q?GeKGFCXBcyx7ml9Q9H0VeVEpLVoAcFekacb8La1iGCjIqKuXOaEIyYwO7PmT?=
 =?us-ascii?Q?Dx+ymPnaiKqx+Of6NCE1NAyacV8iRoKlO5uoiAOtt8Eod3grHu056qTWiN2k?=
 =?us-ascii?Q?IqdKwg1TRQobkomjrvnWEvzyz4lwF5/Q++WbWcVDUdXEB7HgPwxea55YwUyl?=
 =?us-ascii?Q?TzgchNBBWEJhIE7T5n2VVYgkLKyPY3qpSJA5FeFFNHnXDMhA+1YHhBnSqHZI?=
 =?us-ascii?Q?BcH4kyTjiQPYcyiB6rpz2tON/KjCDPTP2GR4//4YVl+pIYH0Dl71Nvn2y1eK?=
 =?us-ascii?Q?IH+FI3OayZ9Z22b1sdkci5PC/Mc3oTBlCazb62aa0HLPuLWd+6RKubud4+nh?=
 =?us-ascii?Q?D42beQxm4vvdUGbzJuD8o3sT3qc3+7Hg8qgTD5tMg+NbBHc8nNgrxqUcZthb?=
 =?us-ascii?Q?sgcMLbmspwl9Ph4JAP67w0eDRSfpQIyo1J2iX2fgmbvjAMQbnovYd/IqdycX?=
 =?us-ascii?Q?H4CHBrt7BgycEXDabVv6F+PBSIBbPuVHI+hFgqf1EpEad20YsImyqtbNks2j?=
 =?us-ascii?Q?DpuYNTwN2Ck7yoXYj6leYVR4k/JrB7tyJ18wxlS7n/qSr8B/xlqs3bXvdJj4?=
 =?us-ascii?Q?io9RIvP0D/3KhDYB87Z2f/4HMliwAOv7XPu9UQKFhIFJb5nLAlrDORp6aQ3A?=
 =?us-ascii?Q?K95P6d7eIfDvt2hi9A466lOd/zFjOPutDph6feX6IThnaJ6vNkrdz4IaALUn?=
 =?us-ascii?Q?tQjVSTyqG2gpZfLOBmX6vq7qX5yJKGttZuAnUDP6uKiuL6bQxo18y0tFuTV8?=
 =?us-ascii?Q?ohrVaS0piVJAbw+UU+eP36i86p0drILJdHDkcmFDh1TUiQXE1Riz3001hRer?=
 =?us-ascii?Q?hhez/EJaKOW9pbgIEzEu7Ovx3stTJajMTGhUWxpsW8XPGD9Je4dbNclhActx?=
 =?us-ascii?Q?kvxSXlvUDlQyr/u9SWMt5/QGlezeIuQ/v6tWDjoG82Q/rlmLNmFBtfTZdvsF?=
 =?us-ascii?Q?uU1mMybweRTcVPqZTIVhLFHBK+1X7gktPNRu98Q1CSK73KSJPyhmCnUOR+Gf?=
 =?us-ascii?Q?weeDTFSW1BqXY8BJ7WNVRAimhb9dOgmj04FmqQSMpm0+dtPzEnGvXu5nmiTg?=
 =?us-ascii?Q?KA6Gaok9Pnzaz56bvjvLwf5r+d6i404poj510waaVjOrKi6hYDeC5GJw9M7n?=
 =?us-ascii?Q?Fi6KeNOxNg9AcMvKU7orgmq8SI+iebAJZugKswqaX6GymTWDLpnckM+uonW4?=
 =?us-ascii?Q?MXRBQs8gxK7vw3+wmZm8BE2AwaLCMO9GVyZBq+gXXKIA9XJYQIYwOrvHWsPy?=
 =?us-ascii?Q?HyXRuCqOMFobeMUF6dmHsFftXcwG5vedtgUoGqT4R/RYktZ2+0z/KBk3phSD?=
 =?us-ascii?Q?YhqLTgeuLw7cFq57NWcEKwwFdm9dePNsoDRtdrdNnjL7Yxu4H/Ol?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d0f478-e46d-4b9d-d0ec-08df17c236c1
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:25:02.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iirtv6XHe/aE9j5hjdzUynvLxo79rtH81NMDZ8nQ/5pKJtGr/IxaY1kFE6EHWj3bASbrMD6KblKYgyCJX2JD5VxT2inOkGdY0h6jYht8BDc4ZTcyFsgvKcMX7yO7d6SV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595

On Tue, Sep 15, 2026 at 02:35:22PM +0800, chunyuzhiqiang wrote:
> From: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
> 
> When the FlexCAN interface is down, can_fill_info() still calls
> flexcan_get_berr_counter() to fill the error counters for a netlink
> dump. This function calls pm_runtime_resume_and_get(), which only
> enables the clocks via flexcan_runtime_resume(), but does not clear
> the MCR[MDIS] bit. Since the interface has never been opened, the
> FlexCAN module is still disabled (MDIS=1) from register_flexcandev().
> Accessing the ECR register then triggers a synchronous external abort.
> 

Hi ChunYuZhiQiang,

Thanks for the patch. The fix direction is correct, but I think the
root-cause description needs to be corrected before this goes upstream.

The MDIS explanation doesn't hold. Setting MCR[MDIS]=1 only puts the CAN
protocol engine into disable/low-power state; it does *not* make the
register slave interface stop responding to bus accesses. Reading ECR
with MDIS=1 on a powered, clocked FlexCAN module does not raise a
synchronous external abort. In fact register_flexcandev() reads and
writes MCR (and toggles MDIS via flexcan_chip_disable()/
flexcan_chip_enable()) throughout probe without ever aborting. So "the
module is still disabled (MDIS=1), therefore accessing ECR triggers a
SEA" is not the actual mechanism.

The real trigger is platform-specific: the register target is not truly
clocked/powered when the access is issued. On i.MX8QXP the CAN clocks
are gated through the SCU LPCG and the whole subsystem shares the
IMX_SC_R_CAN_0 power domain. flexcan_runtime_resume() only calls
flexcan_clks_enable(); combined with the LPCG e10858 synchronization
erratum, there is a window where pm_runtime_resume_and_get() has
returned but the clock has not actually reached the module yet. The
immediate readl(&regs->ecr) in that window hits an un-clocked target and
faults with the external abort (0x96000210, abort on load).

This is why the abort is not reproducible on i.MX95 / i.MX952. Those
SoCs use SCMI-based centralized clocking (IMX95_CLK_CANx /
IMX952_CLK_CANx with BUSWAKEUP/BUSAON), have no LPCG e10858 erratum, and
do not share one power domain across CAN instances. There, after
pm_runtime_resume_and_get() returns the registers are genuinely
accessible, so reading ECR is safe even with MDIS=1. This actually
disproves the MDIS theory: if MDIS were the cause, i.MX95/i.MX952 would
abort too, since MDIS=1 there as well.

So the underlying issue is a logic flaw common to all platforms -
can_fill_info() unconditionally calls do_get_berr_counter() regardless
of interface state - but the SEA only manifests on topologies like
i.MX8QXP. This is the same class of problem that was already fixed for
m_can:

  commit 91a55c72a821d ("can: m_can: m_can_get_berr_counter(): don't
  wake up controller if interface is down")

Suggestions for v2:

1. Reword the commit message: drop the MDIS reasoning and instead state
   that when the interface is down the controller may be unpowered / its
   clock not yet settled (e.g. the i.MX8QXP SCU+LPCG topology), so
   resuming and immediately accessing ECR can trigger an external abort.
   Reference the m_can precedent above.

2. Add a Fixes: tag (the runtime-PM introduction, or ec56acfef2af1 which
   first added the clock enable in flexcan_get_berr_counter()).


Thanks,
Bough

> This can be reproduced on an i.MX8QXP board by simply running
> `ip link show` without ever bringing the CAN interface up:
> 
>     Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT SMP
>     pc : flexcan_read_le+0x0/0x18
>     lr : flexcan_get_berr_counter+0x4c/0x8c
>     Call trace:
>      flexcan_read_le+0x0/0x18
>      can_fill_info+0x1f8/0x434
>      rtnl_fill_ifinfo+0x8fc/0xbb4
>      rtnl_dump_ifinfo+0x364/0x448
>      ...
> 
> ftrace shows the exact path:
> 
>   can_fill_info() {
>     flexcan_get_berr_counter() {
>       __pm_runtime_resume() {
>         rpm_resume()
>           rpm_callback()
>             __rpm_callback()
>               pm_generic_runtime_resume()
>                 flexcan_runtime_resume()
>                   flexcan_clks_enable() {
>                     clk_prepare(); clk_enable();
>                     ...
>                   }
>       }
>       do_mem_abort() {
>         do_sea()
>         ...
>       }
>     }
>   }
> 
> Fix this by returning early if the interface is not running.
> 
> Tested on i.MX8QXP: after the patch, `ip link show` no longer triggers
> the abort.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
> index 06d5d35fc..b08779ee2 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -765,6 +765,9 @@ static int flexcan_get_berr_counter(const struct net_device *dev,
>  	const struct flexcan_priv *priv = netdev_priv(dev);
>  	int err;
>  
> +	if (!netif_running(dev))
> +		return 0;
> +
>  	err = pm_runtime_resume_and_get(priv->dev);
>  	if (err < 0)
>  		return err;
> -- 
> 2.47.3
> 
