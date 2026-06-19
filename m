Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C4221F26
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878750; cv=fail; b=g2i25FZmqlqP8KcLAiI0CuaOWjAvja3PTAZoIW7E/j0vaX0zufXqoFATBhs9B4YFWt8I9xJ0ZEZDQ8RciPdO9Ph/tRbF9dmoH8a1QmmUkkB313G9Z3IwWVJxrol4rishp2O4ZkMCcH4Z8p9lPqCBYLtbMSrwO8Ym8199a3uEM1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878750; c=relaxed/simple;
	bh=8Hw2chul6kwn+WOYzg2yLThDt7h3NNtwBItwOoMczQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=izr5ENrpTyfOBCs/cLLebZROF2puTuhZnkfE35NNBzY3j/GKZdggtRvBcWYt7tfFgvVI68o5zfYDXsd9By51X5qhRQnSlo5Id866FHk+Rt0QXWFlidbOkQ3dTfNT4S5zo/pbG5XM10C8nfLVu/oDzGBldBNV4cTwB9RxNcS2aFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D4sPYD3n; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D4sPYD3n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8Lbprkr7BI0fnqb2ksqKPeDKcIxov1lLB1ZL61ynMCLbmL+P9kWbfykuwBAn0MeetX0ys6xVoz6O6tAlHUUMsMMbtM737X0pr3onkiH0Q0CWWvzluIVI38kVFMS095M4SxzwJfpSNWtDrlCmHUy2EKFusspy/2iOQpS0P280p+jDXovlUvDnk30J21SY5La8nQ0nXmdlaTpR06T5lvPtmWWsWlDPd5/ZQSQP9IIdpTtspEWlHx2e7cg2/SQg1qdEEDGsCPsoLC0cYJkKkshbRnNZZPD5Dm+YMaOQQzM9vfxmB/upGkuOmd8gB9YGyKJWPGDU/7HM9MaS64ISgbQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unsTD+yY8xMePZ9l7eBQmNb0eEVXwIksUexlxmnw7og=;
 b=m7H54Sd/dN35bvxO3zYHPTzLuOaYnuiB+yUbwv7JHAQ7nt6JD0seMeQoSRMrl+1pWvH4or6ThWe5W/x4sjQbn5xxSK717NQt0rur2P+xW+gatPuqMPbY/OhGgt1Kh6D8934h7FEnokMb5EXboByv2FCQCKoWMDl/ky14SP9rGJ9g2mNHQVA9j+KgHordinSoDzBGU/YJpg9whfdHIDCVTgd5MGNC+gqx2XBdlJpxU1x8xIcToTN/Yuon78eU3Qd3qEK4P5Z50MQv2skQnhvZuGsFrjFkJpYqt5QjPEoIW3DzGPrR5V8MfRox08mhnt9f5T09bHzWMafISJS3Hnib2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unsTD+yY8xMePZ9l7eBQmNb0eEVXwIksUexlxmnw7og=;
 b=D4sPYD3nZ6aCRnx1bMxcS53kXkhRDSUyIbIQ4sBxjtvOpcSirtZuh5JYqLtTwg3JmWkH4yj+FgRU4iT+225WO4MstNHcUj455aOl7tRe8yizCkPKia7BBwzhVyMPynWJpvwj9MipgnxnvO18qctj7exochcYUnpILR8uQ2J8e5j4pgTKb7rePs/BjDPytnkioZTWKpyaTDoTRtKfpR3xQ5XacdiH087dOX/gDbUZ/5g80LE9kTHZd0YglU7Dh+pz/Kcvjnxzcji3iS32NNhPALlJ1XUISg020FWBUOiEgHMyH1b4eCStKT4izECcdjyR7CXKflBUSVcNow/joYEKFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7211.eurprd04.prod.outlook.com (2603:10a6:102:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:19:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:19:05 +0000
Date: Fri, 19 Jun 2026 09:18:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: robby.cai@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com, mchehab@kernel.org,
	p.zabel@pengutronix.de, kieran.bingham@ideasonboard.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support
 with GPIO fallback
Message-ID: <ajVPzoWVBi1vsqRQ@SMW015318>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
 <20260619100532.3779934-3-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619100532.3779934-3-robby.cai@oss.nxp.com>
X-ClientProxiedBy: PH8P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: f30348e5-360a-404b-0581-08dece0db801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|19092799006|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yOXo7gzoyfg5h+fg2tp5zsXYl2qPC88mGO+3h6WpHfhPXo424hKuF1PKqYrC+ZaFqSPd83MVdDMjN88BlN7DNIWnvM1rc5Et7eEw61MYQh7OdC07hp5kiXTvn8WswNHhCux3jrT7a4x2aaUR40KcwVegGur+3wb2iDRanmfuZHmp/3iX52cxs4+UgWzHqX0upnVaINmwiEf4FrisfLAESRDgf1ElVL2UixPBpom9qAUZpcXR+T45XffkN9d0uDU8Dl8mNc8/BHa458PqTIWfCsdUPk/FWbIdli1lXsNWBCMbm6zXNXIUPANIahSMms9+FzPjRAUE6IJcZ/khxcbs8rPFSideKGMO9h1gvWGfUmPC0eQlMfczMsmDH8WZmFELYgOmuaxS+Wns7F6WKUuYvWq3oRcOVq/vq/IV6tzBN2XrMqGfkTy2t76FdHfwc3F8tUP5C+CyjNgUtyXpBNlpfUq9YYFWCgH6BBwndBbZyhMt8BAqHDT+3MtPeTa3+bQoqxv62SRxq1Ph84blGwq7fBgli7qDAxoSUFG0Tf5nSuGyHwMO9cBuvXPPxs2vmPvO17InmK+6cLhzXqiOW0sX80qr5b2awzla084r7TdsvxqG5pXSmnpRSxajWFc03dpI9WR7R11dgsDhwlTKd1AMXAs68rukMZmCV/KReHqosqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(19092799006)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4CtQreGyH9c70/eDHwdD8fkucYCmRE3/VRbnep74shiMG9GNQNHnI2JPOOIl?=
 =?us-ascii?Q?m5uzq3KUgkRiqb0Fs1IF9CP5BedigkWoj7fN9bH0y+dfRWlo80j/UexZH+6C?=
 =?us-ascii?Q?LwctnaKnEjelr+GGd+FPab7gIDs4pnwI+USrMLiHSblTE1TBEg6nW3tcxzUh?=
 =?us-ascii?Q?6flWDu66sSiBcykYK2ZbDFVl2TfdhxNwI8Hu1r/EAEUVYQDzkwtCEHcM55Qm?=
 =?us-ascii?Q?gdarB01ebcbeqSvyYfqJbYkVYcXYD8R5AsjeTsbFFlSLydEhdjIjlxWjApHR?=
 =?us-ascii?Q?GLbEu8NFdetdml1i3r27ZyXVydSKCQhQUHtNpuOckbKh2UB8c3DF7Al4D44o?=
 =?us-ascii?Q?IgNi3CAL9kQNHJMYVaK+GUfErv+d3/DNQPs2ySV6WJ+4Yhi04l7kL9dOSo4E?=
 =?us-ascii?Q?FuN7welPJ/BJEnhKUZbumGGBVrZKyhexnxgbL6D1zRGf9ShIWoMHWgvQ8qvY?=
 =?us-ascii?Q?8Tu+i8GYxnDyMpKHBAnmmbf/PxaFNjm4uQ0/9nft6Vh4kMS3TC+bqLguHf9o?=
 =?us-ascii?Q?3qxXsZ3U8sF8Wxssgo7/K1UbvTvcrx/zCNdeYK4jvD5AYNl7iLs+UreHGrB9?=
 =?us-ascii?Q?yxxqTx7a3A7d06vVgVwZQ1C8COzwlq1kRdxhqN1l4X7uksgVC/c8mltRqwaZ?=
 =?us-ascii?Q?7bezlUPctls809xkN76gHn/tLgAkvIZFFwieIBYDG7a/+zVKXdBFGsdjs3ku?=
 =?us-ascii?Q?kg+NAAG3VGbdKcCDhttQFeEa8ExeG9rdqyKMkNo+4Dk9I0BbCo6gbioV9nEW?=
 =?us-ascii?Q?4zAGgjwLXpBqUNpZ3CBLz5T7FRcsgxIa0XnIOeJ8oVB0ZLpDJ4jpgxbb6ef0?=
 =?us-ascii?Q?T07u48Z2oMKuZaDe+BDY1Oguf8mrBhlI1yIZy3cUcc5EC0kz5ogA4xGub+AD?=
 =?us-ascii?Q?rIQ7/JfPQtsN2KDfAnfoBuNKaQ5immU2o25Bg597WRxhrrvV9/geqZ86wo6N?=
 =?us-ascii?Q?e4gVcKjyHpqw1R2ixy0zkUZx+1YdPkB4V5beBVU1KTjyAzmHPFqJUm1WFgH0?=
 =?us-ascii?Q?dyOmXyTy3c53Vj6KvTlHeKfDY+VHjhy37Celq216bgpJ8osidFnxEyJgFkDB?=
 =?us-ascii?Q?9+GEqkWbffp06BnV43Q19mbCBu18zXFfc6LKDLmo2bJjVLVhgKcKlHTMKCXQ?=
 =?us-ascii?Q?nYm2xAapLO4MYMhQ1gFVUurqhc1g9JKOe8ugwHCTRhmD88f13aApvCYJI9iC?=
 =?us-ascii?Q?WrRsIJLhiqUe/YPsrgzRn1JHE9QZzl+HM+6VQJQGcwU6SQUIJMDU3K/fcBgx?=
 =?us-ascii?Q?+cKv0ACy2eSeJdEmBX4smGg8Wga/YVu0UM6AArvjN9S54f2+/eVDHpQe2AC8?=
 =?us-ascii?Q?6JE7U0+tcSK8DXFPNp8gu3vx7QglLWlPFJUVBaTyZP4p+vyBbqOHQSfokPP9?=
 =?us-ascii?Q?NHRz9XcIu+KmwV50PDC3AdBnfzkNX4FRyFL3+8cCtsgumsKDUDTtpUyfkUBa?=
 =?us-ascii?Q?p44AilUOR5TB/mkcJtOqkxnWFHuGae+zlR3GVTb9aHKJnsa3tjPDKledOxJp?=
 =?us-ascii?Q?4Ihyjo0joHkMTAi1LQPVgaVTeWDGbXo+I+Mb3dkVJ6rou4c7UaSZE0XC1AJQ?=
 =?us-ascii?Q?0bCNZI7sfjaGlAfB9K/lCyr29mbUOKPL9LDd/NsACxGNpksm8VM3OovQjRSI?=
 =?us-ascii?Q?3CWubuQrf3U+ADWcBBAWGoTbPyFMo/+5GTF609fMhO+24gAgYCajhvaS//Cm?=
 =?us-ascii?Q?v2Bjuj1N2BAxiqp3SPiel5UU0B1B1eO7AEgR0p2a9aEBISa6r+q2gqBKfiNN?=
 =?us-ascii?Q?aEnAkNTAQPcOlBWO87dVZNfi7p86KmdAfioZgSQUgGWhDRNVIo+7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30348e5-360a-404b-0581-08dece0db801
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:19:05.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBnau4JUfyb+OqPZqZS7GffE6MDQ7Kelyxs7MIMCgBH/pvxPxqLsGZaaTNpGax0wnSTdiFxfQ42gqxSZr70b4zxAa8FGtGz8ZfIM+SRI2Q/wg6O/10CLeu9XNdROsUIX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7211

On Fri, Jun 19, 2026 at 06:05:32PM +0800, robby.cai@oss.nxp.com wrote:
> [You don't often get email from robby.cai@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Robby Cai <robby.cai@nxp.com>
>
> Add support for the reset controller framework by acquiring the reset
> line using devm_reset_control_get_optional_shared_deasserted(). This
> allows the driver to handle reset lines provided by a reset controller,
> including shared ones, while avoiding unbalanced deassert counts.
>
> Retain support for legacy reset-gpios as a fallback when no reset
> controller is defined. In that case, request the GPIO and keep it in the
> deasserted state as the initial configuration.
>
> This enables the driver to support both reset-controller-backed reset
> lines and older GPIO-based descriptions while preserving the existing
> power-up sequencing behavior.
>
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  drivers/media/i2c/ov5640.c | 80 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 85ecc23b3587..5e6db8aacb11 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <media/v4l2-async.h>
> @@ -442,6 +443,7 @@ struct ov5640_dev {
>         u32 xclk_freq;
>
>         struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
> +       struct reset_control *reset;
>         struct gpio_desc *reset_gpio;
>         struct gpio_desc *pwdn_gpio;
>         bool   upside_down;
> @@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
>         return ov5640_set_framefmt(sensor, &sensor->fmt);
>  }
>
> +static int ov5640_get_reset(struct device *dev, struct ov5640_dev *sensor)
> +{
> +       /* use deasserted version to avoid unbalanced deassert counts */
> +       sensor->reset =
> +           devm_reset_control_get_optional_shared_deasserted(dev, NULL);
> +       if (IS_ERR(sensor->reset))
> +               return dev_err_probe(dev, PTR_ERR(sensor->reset),
> +                                    "Failed to get reset\n");
> +       else if (sensor->reset)
> +               return 0;
> +
> +       /*
> +        * fallback to legacy reset-gpios
> +        * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
> +        */
> +       sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +                                                    GPIOD_OUT_HIGH);
> +       if (IS_ERR(sensor->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> +                                    "Failed to get reset gpio");

I think needn't fallback here, NO ABI change, just change to use reset-gpio
driver.

> +
> +       return 0;
> +}
> +
> +static int ov5640_reset_assert(struct ov5640_dev *sensor)
> +{
> +       if (sensor->reset)
> +               return reset_control_assert(sensor->reset);

needn't check sensor->reset, reset_control_assert() is no ops if NULL.

> +
> +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);

Needn't fallback, directly replace.

Frank

> +       return 0;
> +}
> +
> +static int ov5640_reset_deassert(struct ov5640_dev *sensor)
> +{
> +       if (sensor->reset)
> +               return reset_control_deassert(sensor->reset);
> +
> +       gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +       return 0;
> +}
> +
>  static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>  {
>         gpiod_set_value_cansleep(sensor->pwdn_gpio, enable ? 0 : 1);
> @@ -2448,12 +2492,19 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>   *
>   * In such cases, this gpio should be mapped to pwdn_gpio in the driver, and we
>   * should still toggle the pwdn_gpio below with the appropriate delays, while
> - * the calls to reset_gpio will be ignored.
> + * reset handling (via reset controller or GPIO) will be ignored.
>   */
> -static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
> +static int ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
> +       int ret;
> +
>         if (sensor->pwdn_gpio) {
> -               gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +               ret = ov5640_reset_assert(sensor);
> +               if (ret) {
> +                       dev_err(&sensor->i2c_client->dev,
> +                               "Failed to assert reset: %d\n", ret);
> +                       return ret;
> +               }
>
>                 /* camera power cycle */
>                 ov5640_power(sensor, false);
> @@ -2461,7 +2512,13 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>                 ov5640_power(sensor, true);
>                 usleep_range(1000, 2000);       /* t3 */
>
> -               gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +               ret = ov5640_reset_deassert(sensor);
> +               if (ret) {
> +                       dev_err(&sensor->i2c_client->dev,
> +                               "Failed to deassert reset: %d\n", ret);
> +                       ov5640_power(sensor, false);
> +                       return ret;
> +               }
>         } else {
>                 /* software reset */
>                 ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> @@ -2475,6 +2532,8 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>          */
>         ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>                          OV5640_REG_SYS_CTRL0_SW_PWDN);
> +
> +       return 0;
>  }
>
>  static int ov5640_set_power_on(struct ov5640_dev *sensor)
> @@ -2497,7 +2556,9 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>                 goto xclk_off;
>         }
>
> -       ov5640_powerup_sequence(sensor);
> +       ret = ov5640_powerup_sequence(sensor);
> +       if (ret)
> +               goto regulator_off;
>
>         ret = ov5640_init_slave_id(sensor);
>         if (ret)
> @@ -2507,6 +2568,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>
>  power_off:
>         ov5640_power(sensor, false);
> +regulator_off:
>         regulator_bulk_disable(OV5640_NUM_SUPPLIES, sensor->supplies);
>  xclk_off:
>         clk_disable_unprepare(sensor->xclk);
> @@ -3914,11 +3976,9 @@ static int ov5640_probe(struct i2c_client *client)
>         if (IS_ERR(sensor->pwdn_gpio))
>                 return PTR_ERR(sensor->pwdn_gpio);
>
> -       /* request optional reset pin */
> -       sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> -                                                    GPIOD_OUT_HIGH);
> -       if (IS_ERR(sensor->reset_gpio))
> -               return PTR_ERR(sensor->reset_gpio);
> +       ret = ov5640_get_reset(dev, sensor);
> +       if (ret)
> +               return ret;
>
>         v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
>         sensor->sd.internal_ops = &ov5640_internal_ops;
> --
> 2.50.1
>
>
