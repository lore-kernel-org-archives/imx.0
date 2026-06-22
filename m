Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243019D07E
	for <imx@lists.linux.dev>; Mon, 22 Jun 2026 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140548; cv=fail; b=TiG/cVez7t1jjw6j/B2vQtt6AGB0SSUkPKamZZ/+tz0MeB29wU2AVRlaZG+NYnVINnkNrV39G8G/MVFFz5vkoZwyTJVsgu0LXkK6lqgQ2n/7zHH9H7PPNzhvIeHGVvGNjX2T6k0vMnENf6MeICy+h6s4UzVq4fzCzBz+iWWO1oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140548; c=relaxed/simple;
	bh=e/8CdHzSaeELw9Mozi7IknOEv0sE5Q5IKxHr0mNHyTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fSjXsGuJ3Q5NLnKGQU3cI6u1V/56nFpclCxuDQ+3dXyDEZyegMe9FJbf0bS0AXhdmqC2MbxKVDX5pk08o5ESca5od5h4MikBSWOd7KMPjOIqUTfVu/WUwUuXAPJlbIkzMy4fsw+y2fRZTiCT6pi1pMOJVXmL34hdBQjK/T5MXL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f8NWfvDK; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f8NWfvDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeYWkMXjDxEkwktoi8AMlY/KYOHXezkWL51SJnp1hEMutpj0CRLGujnI3kGuy43wHZWnTiKN0XYmKxkOaKcPMfxtDtqsy72ZzjfDTO46JVYq8zg64t/Lr6bygvUTRz38eBPwtQMQGJdtInrnG3WvF8mt+fRLUhnEOOV85gZ70Pvg+VT1XpPqLKzL6jotqXTD6ljg/zegPVU+dy0Tj32eOzppEL/Nh/5yzRcUpCEhotaeKy3gOwnNc2QQYnGNlQuse+W2tJ7bSkUXYPzJaZc/W9rTFHuh+3uO3k9IxCor1xfC2Q+sIJOSZ7xtNwvYUtxtaMUXrx369dWdzBgxXl+xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK2okpeBMxKtRFRcvfsyhPUOrkB618YP/GeneZSOcfc=;
 b=RHNbKhP3mGMQj7EWtzFwUBQ/s18STzXUYbLdRwL4F5LKEqVYwK/3XqO1d64gBu7dLSvn2dI1zWVp7vtDIYWgHdu46p29jK3uE4pHDcMby1khTVIF2ETvFi+yqNqDFf2KFGuHtpkmfa+WouaOaCpNeWyLyDx2rLHf2v7k+ijLwbQ02d9FfnngU9XOD2ZXj/DvBJqMLpY1lrln0RdtFt2x0YU0gU3rse37xPE9L5IIG0lz2gsayy306NCgMJfjbM2hrYWFYD1AofVlkcko++9qgtNCRRBh7R5D+q2jId6+zaN2XF3P0nfIN9kcoO0CKN2GwSxo9H4sYLJayMkg9qzZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK2okpeBMxKtRFRcvfsyhPUOrkB618YP/GeneZSOcfc=;
 b=f8NWfvDK3x/vQhdJrGMIn6kV9fVpyTF+5rFn8gLVcpyDDjlTQJEU9n67H8oolDoxPfFVzMYRkd/713JYpyzSDwySQ572rmg2yzGtLuNOJYktkG0++U2Wv/tvn+smXXoK5QfGyX9zbBt8KjfraeM8EUcPfD5AyGrl5TuOIbHhTEmjd0pbmaEFemtorQZSF3pW9ussgHpUg6/kFagIZU3PD5z9Ul5+D/cyuB96Hv3hSIk5yHMhQM5WV5f+tUhTF5GHNKq76jalhawIfuzcOeSoNTLSCn86BNC0r46p56Yq1mKANMfgFK8OH1w7P+Ap4zTWX9gFISrzgyH0owli9y56Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 15:02:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:02:19 +0000
Date: Mon, 22 Jun 2026 10:02:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robby.cai@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support
 with GPIO fallback
Message-ID: <ajlObz4UiIVGdBsP@SMW015318>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
 <20260619100532.3779934-3-robby.cai@oss.nxp.com>
 <ajVPzoWVBi1vsqRQ@SMW015318>
 <7ee62b699c5cabb00cd7706ea42573da81c5bc84.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ee62b699c5cabb00cd7706ea42573da81c5bc84.camel@pengutronix.de>
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c975a04-c6c0-4add-eca4-08ded06f4178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	/sQvuK5tVri3/XMEtFl6Tk9/ryh1AYjLQjih0YRyLj4NbYz4HgZtRsjBGdwyNg+EYhbfi2hVYw68O2U4C2oNEvya1Sguu7PaH7j1j5nKS/qYxuwWEQ3xBeVzhayYvUemrG+TfpF1SSsJA0Wu/B4mOkbHYE5M5r2LfgvzJs0hliK8111N4s8u9wbBXS4JEMwsob79xLOyyrxajfSna4DBlv2Ke5DS+WNhbCSD4q+yMbe7AD1yK0dsZ6+eEr8VqGbO2Tx40VX3dl1kLpvntRXdFUGF1ROdiV6LHCsUIWTzILxW8+20QP98N3vGzNTIdaWU7l0c+FjSmifoyLviNkU+z7RpiP3FqHhvVOQgic+qDTdTsuJ7QmD/A5zZ8+ym5yU7gh2HgmAIIg4LoLM7jDuhbe01NKAA0gry2EDPya/JbTXDDiVhP4PkjfXBA28L/OFq0qkHTWEHK4AK7yIc0XL05SJt25axQ8yYQVeqTW0e/noPYv5vGklP3i8iStXwc0lEN9OhRPxTF/hGe9HX5HbVJiC7ZYCxtJcLNPpPJOYqOhnsjHyN06LAO4cyEglFmU61h/MJjv2SJw2wQqURWhHc/0/mLN9FVpE5ZigLLzkk4ix//hPrifREjf63dwx8WLIvqDfUMcTyc8cYdaEsrlUmFlBk77f2YAl/7+hkKXjxrQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YNpXqSVPem/GXsWh0q0TWExHz6MH3PeVa8eh/zQpqv6sebqocAQXWkzKzzSX?=
 =?us-ascii?Q?D3BM13HJ5W0jTgbTxgN1IHZwEhXKhH+fNS3JtkKrrXqLhQeOtdyuEOeYVGP/?=
 =?us-ascii?Q?aTMZU/U8OEQ4BZRyR1aX17hzVH0e2vYhdnnxFB46kil+dRm7j/aUEfDpGM+4?=
 =?us-ascii?Q?qwjAYAW9T8q/WYW8dOhepCT3LKiyKmrCNuGqaqFDVYbpcuF3qQxWeWMX/c5/?=
 =?us-ascii?Q?e0zMu5pcBXtniQbgBmvw5+Njmx7hiXngNfsKBxRIb58xhvrSyEGJeQOKShuI?=
 =?us-ascii?Q?MAictL20G3QckQmt8wtBgce6SaqE9ABqnfwpRhBDu0KsxOpjsr54bwperCL9?=
 =?us-ascii?Q?fY8thD1tO2RmD6KGode2KH6SAGjLzEpiFcb0ArlbpX+wilRFML7qkfp7Myjz?=
 =?us-ascii?Q?RtzxA39F81gltbpQb/lCMwxyj0R493PpLkvK83mPi1JRoZDST7rOJBCdMxwH?=
 =?us-ascii?Q?Fuz31PgIoUqjjvj0Ya9JeE//b36ewhKF7Fu7QC+YW2B1fPYJrXUUi7WGdvJ+?=
 =?us-ascii?Q?asBNUAK7Jv20ttdBOM5gvsqmVaWhyOvil6+V3RC7uAHWbwA/3rOJnJXJfUP1?=
 =?us-ascii?Q?3R3IiXxkUTmrWZU6kfO41Y+qAMe3nYuZAMBVwiJPO5zH1kFqnb3VINvdvBTq?=
 =?us-ascii?Q?6br1Fmoy5x77b4rb8vztFIXhpuDY3YjBV3eDPB2idpISnpu3WeRnnmQs8QNB?=
 =?us-ascii?Q?rOyazab1r5ZKJUSQa8iNyTZohkIrQ4qyKA7P+ANJ41+v2PMf1BG7Q4+8n09E?=
 =?us-ascii?Q?Xnw2REd2LHwdv8EgtHtrXbdCIMhz4/C6O5sUT5H+LFMlrj/3KO2fPBdWGDZj?=
 =?us-ascii?Q?lx/alAdDbV9KHH3hGkWJbUwmIkEmlLZb+FIV4jEPz3amweHad1zWFsLZSRIC?=
 =?us-ascii?Q?DoFFALpzjho+B0voVS4BMuXCmeCaVlKj9TWl9UguV+ugepGZZHTC5JNKjUyw?=
 =?us-ascii?Q?QbF810BclxMXqFe1xZ3LfdBWLuA3sg6iZ9HgZ4es/Mf83wAikOZiwEzHGPk+?=
 =?us-ascii?Q?TccH93UV7CXLK+h0MDL9sDvICAggH6l8Wl+W8hbN1l0cOxu9gEMywPPfbep9?=
 =?us-ascii?Q?KgzjgT3mry0rslkl9d2gKCTDhgLnJIQ9o+/hkoS0XzkYUCgUMEKTKMEa6E+Q?=
 =?us-ascii?Q?zdPRKL53+KK2OBmji2B92H8C9NzT2iRLBBeQEbiJUOAFu2jFm1IF2mvX3nkq?=
 =?us-ascii?Q?pMCwqleCN1Pvoyc9ZzAF/mmm88b343ftuoYzRx9nk3f+DNhPossa5/8wIXyc?=
 =?us-ascii?Q?kR7fWk6oZ9nsWBuZB4MHzO5mgBWq+BhXm8nxTGaeJ5/4W3HeBPS+o66DxQEo?=
 =?us-ascii?Q?qBv+nmpruy1kbaWgNgdbh1N61htZc36aY4d7Fx7b7Kl/+ux+r3oxPlji6PG4?=
 =?us-ascii?Q?uGAszmlG3M2jBTWY9EUT68FuKJOjI+pd9YAPAlUzF9llnH/PHUmv6zOu0il2?=
 =?us-ascii?Q?sR1oLb7ppDpkft0Bs+l7nIejFhcSNv8A34B5V/O9/DvsosVSzg0Z08wWFkxt?=
 =?us-ascii?Q?r8V0rWbJVqJnlzUgbB3DOuEIFQaZPnif30fH22ON/NOiw/tK1P6W8q8iq70e?=
 =?us-ascii?Q?2Ja3QUtwRPlk1jtExpJLl73tkPJA7MUOD51aL85bQz1PNgjDADYK9kLk9f+1?=
 =?us-ascii?Q?Z20bQMNXK3p2wZHpCVq3EpEqiSOaECJPPlMejD8iSvWg7GA42p3cAjW3fDag?=
 =?us-ascii?Q?QDl2s2RQMNaXHgKtFxQ0+dyiv1LzpiVYOhmWsisFzAvImBKklu2rqi1F+6g2?=
 =?us-ascii?Q?LbjbDJ756vCr+QMAJtkZGFIM9pBXFeMvZ9JtHh7xcw8QKc8sZb6s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c975a04-c6c0-4add-eca4-08ded06f4178
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:02:19.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6P0R7Rc7yXKJZlrrpkAFfV6i643mSyW0WkCzJgDtfBgNIa8wEcvxNaLUWDDx2UCeLdaJGQoB5/ltd57s7SN/GNN3dFUetyDn2V0bh9D6UrcW1sEZOEwYHIeqMhmBTvwH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643

On Mon, Jun 22, 2026 at 11:05:34AM +0200, Philipp Zabel wrote:
> On Fr, 2026-06-19 at 09:18 -0500, Frank Li wrote:
> > On Fri, Jun 19, 2026 at 06:05:32PM +0800, robby.cai@oss.nxp.com wrote:
> > > [You don't often get email from robby.cai@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > From: Robby Cai <robby.cai@nxp.com>
> > >
> > > Add support for the reset controller framework by acquiring the reset
> > > line using devm_reset_control_get_optional_shared_deasserted(). This
> > > allows the driver to handle reset lines provided by a reset controller,
> > > including shared ones, while avoiding unbalanced deassert counts.
> > >
> > > Retain support for legacy reset-gpios as a fallback when no reset
> > > controller is defined. In that case, request the GPIO and keep it in the
> > > deasserted state as the initial configuration.
> > >
> > > This enables the driver to support both reset-controller-backed reset
> > > lines and older GPIO-based descriptions while preserving the existing
> > > power-up sequencing behavior.
> > >
> > > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 80 +++++++++++++++++++++++++++++++++-----
> > >  1 file changed, 70 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 85ecc23b3587..5e6db8aacb11 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > >  #include <media/v4l2-async.h>
> > > @@ -442,6 +443,7 @@ struct ov5640_dev {
> > >         u32 xclk_freq;
> > >
> > >         struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
> > > +       struct reset_control *reset;
> > >         struct gpio_desc *reset_gpio;
> > >         struct gpio_desc *pwdn_gpio;
> > >         bool   upside_down;
> > > @@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
> > >         return ov5640_set_framefmt(sensor, &sensor->fmt);
> > >  }
> > >
> > > +static int ov5640_get_reset(struct device *dev, struct ov5640_dev *sensor)
> > > +{
> > > +       /* use deasserted version to avoid unbalanced deassert counts */
> > > +       sensor->reset =
> > > +           devm_reset_control_get_optional_shared_deasserted(dev, NULL);
> > > +       if (IS_ERR(sensor->reset))
> > > +               return dev_err_probe(dev, PTR_ERR(sensor->reset),
> > > +                                    "Failed to get reset\n");
> > > +       else if (sensor->reset)
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * fallback to legacy reset-gpios
> > > +        * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
> > > +        */
> > > +       sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > +                                                    GPIOD_OUT_HIGH);
> > > +       if (IS_ERR(sensor->reset_gpio))
> > > +               return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> > > +                                    "Failed to get reset gpio");
> >
> > I think needn't fallback here, NO ABI change, just change to use reset-gpio
> > driver.
>
> Please keep the gpiod fallback, the reset-gpio driver may not be
> available on all platforms using ov5640.

Maybe try promote reset-gpio is default build in / as module. Leave such
fallback every where make code complex.

Krysztof:
	Any suggestion?

Frank

>
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int ov5640_reset_assert(struct ov5640_dev *sensor)
> > > +{
> > > +       if (sensor->reset)
> > > +               return reset_control_assert(sensor->reset);
> >
> > needn't check sensor->reset, reset_control_assert() is no ops if NULL.
> >
> > > +
> > > +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> >
> > Needn't fallback, directly replace.
>
> See above.
>
>
> regards
> Philipp
