Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2342A172
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212059; cv=fail; b=PfmLCuolbx1FLcIRdYm3eb/Ge8cCz7FPDX4k6gZ3VQqwEWuPttqnl2qPr1GLoPuau6qiV5biQZyXT0KfK0Y8gA1NRRRmHTRGeWhFoWVgVy5rnsZ+hgodsijIRKZBLPcVhdVFQKme01ANYWp9JWXP1A+/DouBsfO9escyjP0PbD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212059; c=relaxed/simple;
	bh=05vpYCMF5xMzWY7QjuSCFgrIcTh7+lxR9sEvZxvhk3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UIjOxkSEFKruOXUAfX5V3b/4ALrjpllqRAJaZdWozf7uESs1mnzGjJiHt7O2Igyy/bLiQwRdZt3jy0srop4U/IMaxmZONxGcoXCoue1Hvxm3eshmfX3s7BYmm0KZZghKElSSdQTAyx7E85eOOv6xZ6FAGcvHZMe3bI9w6oX3qkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iAQa0TbB; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iAQa0TbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPEDlxDDR/LRt0snYO544C9wnMXUiY2fivW+hsWGbXO3cZpMLu9nw2pXgTz66D2WOKsApzodwQbbkeql+AL51rKsXMMpIimqnpIQtC9AC1dVdd29ERDaBNQUqUtMukCug0rKtrC4GnADfs7U3STbBe0bPaFGQLHLYL/3QhxmOqf3gDF8IbCTFk166h0m762SvsdXg1quIPCrDON1NzjrOXt1twQ3fESiLgMJpFFruwqhPsWMyz58Owve8RrJpNXwjjOxy0iSDASi2kQmfBD5GRUDHUMSLNBgbsMSfYo+sqFMSOsxTwkFofTRomhXB1Y2YTtdIx9UTYZuBE44beCZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmPXYIgXudJdk7ilCxuMA28BkeiLmN6JDPGWMpU9QJ8=;
 b=YWJoA5SHlcsN1tLuH1uqnIxZdFbCkAsqoa3EQoxQUtnmR/7TT0b/8gEFrDYUe4W5KPKWB82SWoZHoTPL2KuudqX270rtjlPqJJhD7xofvgGjJ6Tnn1RPSKb+E22HOuhL33VrOSUaTKUDXKa7fP61EJShABa3FRiquJcfaTcUysp6VRj+fdtNXk0TICqhmWQyO+YYnhbaqnOOVpZraq4E8zQ+Vu4H0OvFJXf5WP1TXcKuvM7MSHBaHFYX5LLzxo9dqs+dLPDfEFKNrd2ule2ifoiZbo1h9xv8SDZsdpA6fsw+xne+AC+IjcmIIxVLt5Vtv6eoFgRuR3dL2lXT2HxiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmPXYIgXudJdk7ilCxuMA28BkeiLmN6JDPGWMpU9QJ8=;
 b=iAQa0TbBsKhSopoZm5kxwGFkECvQgmzBcAfS0YEL5rHnw0FzmPMkkBHuvYzlE9gqYOof31oujJx/QUgQHlEhmtk4SPK0YwEW3wJEDLyt3Akui+8iiKHTzIGTEIbGobzt94In32Qtgp4jjU4KX79/51uGFlFm3dN2konW8F3yPQsDh6l7WdY10JyhBPfl4fvsnDjjs1PSHZSwEcA6R3+lZKyhP2GsY4SqlyzM1mbFuevmWuLLe4nIf3X289wsmJWcjh2Rl7qM/2OviXFdkkI6P1mX1HzespOgF8ExLrESohHxIPFD5wPE+tEGoefgBNIrleQ+6j+aGHH/LiARMmaXlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9148.eurprd04.prod.outlook.com (2603:10a6:10:2f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:27:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:27:33 +0000
Date: Thu, 16 Jul 2026 09:27:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] regulator: core: use system_freezable_wq for init
 complete work
Message-ID: <aljqTb1SGP487wJz@SMW015318>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
 <20260716-b4-regulator-pf01-v1-1-8c1519d54bd4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-regulator-pf01-v1-1-8c1519d54bd4@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:806:d0::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc0a1ce-a08d-4b5e-3046-08dee346602d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mWnTIangnnGCa0NryFPD0uaP//BMo0jfG7by9ZlbK4YWBDmlGSWTANPErmZoqrEEn+bvoAi5cnWdikUo8msduJpl+lDh1FMknNJ/p6SKMTPN3Q69I1VQitjsRLoceo/r88CVW0J62tpj5dyJqU2kIUWrXACKic/Ya1xt7aLWOUeFD9vjaUXGxoMTrovbq9IzUdAbBC+MB+5z80ErI0FxuL7h6qVJY9qTJiKfcv465cPQ7eCasPkMPx6eT8CvwDKLzYh6urwwhzpAWhoy9bozIfZgvB+glZugqL4SzZL+cZVyef5Wt3PZ5gXRBBEY8wPDZWRL37MN9oURgo5O6YCHiWLJOuLmyazayIzL9xjrRBCWej4ACGBXwsleQPdEu8wI4e+hoohizcLVdJgY1X87UIx/sPFAgiajyoXsoy8QHCt330rt+dly4C9ADj8TyaqfwFBleyqT1nDZ5/Y7rOdHeO7HfoH7znQdWmtSFh507WhcJMoFwRCS+ByjX8BzoO9mN6bPWC+RSumBNvcFjUxd3qNYYRZBW/F9rJpiYdc9R8Uo9s8P7vnQj0PmvSSwf1H07i+sSsb2QsSB7lfnwBwVY5O4Eye3GuU6cBwJVM3CLwvuz7eCWVtd4a8ARR50EZ/rtyAclTdjQvV34E2K1WuI6GQQSBMsw4g/PYd3E4yQtkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c0ucm4i0vpumJ7WFRHJcSYU4uQtiKFN4zTZ688vLR6AnG5Q4E3shqDvEsJsR?=
 =?us-ascii?Q?xKb3tpxZ7WKiMR2h5+CfpPfjwI69lI+DZCHtrywsq7wEPM0hKCs+Q40EPr7f?=
 =?us-ascii?Q?RFa2/QOmZEqFOJ9BwL/1bllClDqLjvecAFCi25LfXHk19NojuYPabIPXTidj?=
 =?us-ascii?Q?IYqfRH3lDw0E9DVIypLGGITQHV8MHso58kRgqPsXaQC7yqLWz5yXVa7Xahob?=
 =?us-ascii?Q?gioOpPTVbx0e4zoxzTKvCaOFakBOwuAS/8TdtxEDssUQCzkRstwbqt/JeKpf?=
 =?us-ascii?Q?gQEzdy2lczg+4L6lVYD34t+a0eN4+8xhiogwS1pB5r/fmYOg5aYNwpgn3iwF?=
 =?us-ascii?Q?rY7oMVU259S/Hoc7oNhJPuC1jRjTICg0tDjZn+rxqVpJIKM20zvNJfnrRMLc?=
 =?us-ascii?Q?QPBMaC8kloV3sVtBu/zlC94RCNC1aeevq3BbmL8TqNFQU4YNQzKxkWfjWfFN?=
 =?us-ascii?Q?1MA2THRWj9lyE1vUa2LhU6PKQv9+ktL7IiQ+0KrQ7prBXytJGcUf5ukHlyUG?=
 =?us-ascii?Q?CNi9Z0OK6otlnWxzuWZ0juetPVj3m/Q9/bgCFhQtpIZC36QwXRE3SCMrCwjV?=
 =?us-ascii?Q?EDNRoCGN/t0vy4QnFTBdyTzgP0hQlSHKqFmsO4XI/vp7Ojb53YQkuVd3QvwS?=
 =?us-ascii?Q?LWgliBCMgLmvY/T32bLgmSSb5D/LgpGLhmfVxQO/tpfTS5QUEfblpBtv/CoA?=
 =?us-ascii?Q?X2Q74niqQ/9RlS+t4yXI9tohw/3dFyn1WDGS1C51ksZF2OohjKOQQfKUKPV8?=
 =?us-ascii?Q?OqYJa+v2qvAkP6ksh2F+I0lmT1OhxdwaCWgkVJkFN1MIF2UhgcT9d2MjH1jz?=
 =?us-ascii?Q?o9gLjEV2zZ6HbM/dx8mGZIfKeuHbjOT87zjBlJOFCWp2kQDmGeVP7iyEN9FL?=
 =?us-ascii?Q?gGYl4PLBG1304IAvAx/bCa12xnBbLNbFOzqXu3AToffdOcPFgh4qKqOFd+5E?=
 =?us-ascii?Q?H8v7h1knPIsUUmwBy639eORqF+HQl74A+r+AtNTTNUBC6TBuFtYEkTWfYyb3?=
 =?us-ascii?Q?Lls9ftDo9I7Bee3tNXblzLYHMJBUvbovcJd5Axm+uauksGteRN7rTZ8NmWGq?=
 =?us-ascii?Q?0k2Uma/XNUjVUQJMPrCKU0H7vdN9uIaPk7J7grow9s/+4aNOqMlS4UxM7JPu?=
 =?us-ascii?Q?7qPuz+A+oaVku1Bqf5csHNlLTtwTI6SvZadkXhbQLnCg1FViL8+w7QcNjJHn?=
 =?us-ascii?Q?dP+5fwXPs2hU79lwbm6wonEDDSYz4VoT7puj4b4Op5UVMnDGaXLSf1BLnDJk?=
 =?us-ascii?Q?5LCwmlEPpaipz0fpyp8Nj6elreGW/IVWnnqXVDOQ6sM6Y14GgTgtmtGY6+wx?=
 =?us-ascii?Q?TJAlgnAokbWPs90Qou52mxYU8Xm4gcDV7IcpvtrCli9nuwSiJ4Id6LJwL0aq?=
 =?us-ascii?Q?hAjNq7wzGSJexMw/NmhejlIOvWaxUH5ID1/6NL8yJgObJ/galXqvhooyhbKE?=
 =?us-ascii?Q?dJ0zdCnRIENSCLJPBAcOHzq+j9Ys9IAlmxqKuQU4QY0qyDbb0FJ97mpN2dJK?=
 =?us-ascii?Q?q26+rRwYTcw2O4jtzshEDVr/9biGJtskpJCtcon/u4MZ18tXn5l1fkWOiNhX?=
 =?us-ascii?Q?zhJi9WGkX/czrioVGVAhc6bkI+3OkUFY3vQY/FnS7lDxyzbRfWoEjAfUVB3j?=
 =?us-ascii?Q?NAqbPL0yKWAETVoye1OmZ7dEGJ8BaY2oNxywv3xKgOo3x7XxBembFhz2JMBH?=
 =?us-ascii?Q?QN/AtOK9qTsjM6WAERQsvuXjmgf+MeqSqVpdXGr3v/oyGjpfpuqKfypeEaHQ?=
 =?us-ascii?Q?YSqRLMJNesR9QKuYCH5GuI0PcKQ961mLfep39SVeBGTMMSwfEFdl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc0a1ce-a08d-4b5e-3046-08dee346602d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:27:33.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfZFXNnwBwqUM3q2BToP5UJTlYbYqXusbcre1+rwyD1XsE5w46TiAEnv957rqaxXNt+2Q2Q783+DXJ9smTITismesIAwbEQd+BCopJDICGLw/TidTuCX1a2duQxGXGAA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9148

On Thu, Jul 16, 2026 at 11:50:53AM +0800, Joy Zou wrote:
> schedule_delayed_work() uses system_wq, which is non-freezable, allowing
> regulator_init_complete_work to run concurrently with system suspend. This
> work fires ~30s after boot to disable unused regulators via I2C. When it
> races with PM suspend, the I2C adapter may already be suspended, triggering
> a -ESHUTDOWN warning dump.
>
> [   33.707233] pc : __i2c_transfer+0x36c/0x3c8
> [   33.707240] lr : __i2c_transfer+0x36c/0x3c8
> [   33.707246] sp : ffff80008239ba50
> [   33.707249] x29: ffff80008239ba50 x28: 0000000000000001 x27: 0000000000000000
> [   33.707259] x26: 0000000000000000 x25: 0000000000000001 x24: ffff0000c025c0e0
> [   33.707268] x23: 0000000000000000 x22: ffff0000c025c0e1 x21: 0000000000000001
> [   33.707277] x20: ffff80008239bae8 x19: ffff0000c0f54880 x18: fffffffffffeb320
> [   33.707287] x17: 000000040044ffff x16: 0000000000000000 x15: ffff800082086fd8
> [   33.707296] x14: 0000000000000000 x13: 0a6465646e657073 x12: 757320656c696877
> [   33.707305] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082087060
> [   33.707314] x8 : 0000000000057fa8 x7 : 000000000000027d x6 : 0000000000000000
> [   33.707323] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
> [   33.707333] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c0123480
> [   33.707343] Call trace:
> [   33.707346]  __i2c_transfer+0x36c/0x3c8 (P)
> [   33.707356]  i2c_transfer+0x6c/0xf8
> [   33.707364]  i2c_transfer_buffer_flags+0x5c/0xa0
> [   33.707372]  regmap_i2c_write+0x20/0x60
> [   33.707382]  _regmap_raw_write_impl+0x5cc/0x660
> [   33.707389]  _regmap_bus_raw_write+0x60/0x80
> [   33.707396]  _regmap_write+0x58/0xc0
> [   33.707403]  _regmap_update_bits+0x11c/0x140
> [   33.707409]  regmap_update_bits_base+0x54/0x80
> [   33.707416]  regulator_disable_regmap+0x40/0x5c
> [   33.707424]  _regulator_do_disable+0x94/0xbc
> [   33.707435] CPU2 is up
> [   33.707433]  regulator_late_cleanup+0xe0/0x1e8
> [   33.707442]  class_for_each_device+0x104/0x13c
> [   33.707450]  regulator_init_complete_work_function+0x54/0x80
> [   33.707458]  process_one_work+0x150/0x290
> [   33.707467]  worker_thread+0x180/0x2f4
> [   33.707473]  kthread+0x12c/0x204
> [   33.707484]  ret_from_fork+0x10/0x20
> [   33.707493] ---[ end trace 0000000000000000 ]---
>
> Switch to system_freezable_wq so the work is frozen before any device
> is suspended, eliminating the race.
>
> Fixes: 55576cf18537 ("regulator: Defer init completion for a while after late_initcall")
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/regulator/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 1797929dfe56..d5d24a940f31 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/regulator.h>
> @@ -6882,8 +6883,9 @@ static int __init regulator_init_complete(void)
>  	 * we'd only do this on systems that need it, and a kernel
>  	 * command line option might be useful.
>  	 */
> -	schedule_delayed_work(&regulator_init_complete_work,
> -			      msecs_to_jiffies(30000));
> +	queue_delayed_work(system_freezable_wq,
> +			   &regulator_init_complete_work,
> +			   msecs_to_jiffies(30000));
>
>  	return 0;
>  }
>
> --
> 2.34.1
>
>
