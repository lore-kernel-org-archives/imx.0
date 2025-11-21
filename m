Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387B2FFF83
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739840; cv=fail; b=gBwzMvUomfNDnl0FzLZAq85F3BmP1nCox29tbYpbhKoiHPNefcZr5DGvJdRSJrR4dc9hXriqXgUV+atzoHeVPi5+gDLNYF/omX1ipKIlrR96v1Ze7vgvjbLOuxB0UQ7E6RmLaHPSR+w1+GXUAavl5VvrQ+mOd/cVuF/FSjSLZ+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739840; c=relaxed/simple;
	bh=imWV1Qk4WDFHKuT9j/E41yOMDttB1LV91Xz2JyaQ2TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iDXd/IflwDBJ5IsrUzi7orTMKV4aiuA0zwcCfsXkJDbFF96rkwG5clwFSG/7jGO5/2yIyRX746s5zbLFV8x4xvT5TVuikRYNar70HJ5/9szPi6JxefZX3tRSy0R7xuGAnza67vSZErZzXI1vvUIrFmSJLLJXuc/zDZlmr1wuEEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=axpIkRr2; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="axpIkRr2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjZivll6RHGYWIYYVcIfg6g+mBn24RfbJV3AtQCoD3qJ9ggvybWLV+mb8K1fsBltqKoJ2drwSSFS0BBO6A6S3wWqIDZcy4doAR8/9ReVw9PhEfBmjlba7MKy+4V2FbMwzlsYiagHXegNhUtSMuMtTVXt7p6+EvYqXSmbYbdyFZFrc7wA+2tKG8WohHIbPg6mO6jnWlBM49WO4MvI1A0lvPCGCbBWhEti2VCFOt+DEdQiqHYdnB6e9Vf8UQkb4f5GnXEre22rT+dY25aYsWxkrOwwY2kASK+rHpXMPPklF4efzGmOS/ZMoPysDly6GgVHPh9ia6VfGcfvFhjwUAXwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4ssJt2Z0sDhEUsvr97gRk+MGIyKTU/XyYU2feXxDsQ=;
 b=fCA1j8g/DsLTsYei1mTM3SCP3exfU1SaD3ygdM7hJtTFJnkEgFpXENhZ/1VrGb4ZrbG2Z0V17o0c3MMwYN5lLF7OBUZvigSS0+8oXm6ikjzlaw1fxDYe3IxBJXfdLgM+08e4ZPDnUKuHA4V7gVp6AC+M9IU7UPX8JcUPpa4fEuH2OjoqDunAn5eR27DuqLlIqpFR1tRk2TEo7ZndpO7678e+USO7QrcM7J8G9ebBnDzM46EG0HvfMNHWReIWZlbCV/Jffy9QRhI/ksxBrORXlNaKhkktT3TRN+mVZ8F9AKfPBBula+ahTMQyHpUy+NJFpnv1YKhTT13zk52HeCQcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ssJt2Z0sDhEUsvr97gRk+MGIyKTU/XyYU2feXxDsQ=;
 b=axpIkRr28lq2dWxJGjQBaxUxG1+6gJ72spb+RXjNyAKdp9fx80TJjLICCqZBhbC5jHPsweoOGaTdkTGOFP8MIXuT/5v40aWPEZub9KQ0VeRxwPcMxQp+d/FqblZ+E0JBsv5ILZzEPmqoENhL7R9WJaFTN0lphhhxmiXqQo+N/NK7q4YvH94eKMaLg+VdxxzED1CReC3ir8cGdHDY5CiMf5sBBw61MlCaQFd4i/YFyXW0O2RTesXgJMCLeUZ1+F4AIcJVAJ6cQ55PZD7ZYFHt0KD70+1a/VhFTr/weidJF55zZ1SJnCjcefCRRDQX1SGRXCB2U79O0zo9AfQMoKKXfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by FRWPR04MB11151.eurprd04.prod.outlook.com (2603:10a6:d10:170::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:43:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:43:52 +0000
Date: Fri, 21 Nov 2025 10:43:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v5 3/6] reset: imx8mp-audiomix: Switch to using regmap API
Message-ID: <aSCIsezINmeijAxB@lizhi-Precision-Tower-5810>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114133738.1762-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH7PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:510:339::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|FRWPR04MB11151:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c895181-04a2-4de6-e6e1-08de2914c5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rtBKYmRJML21I4CP8A3GY6wlqCK1GS/wHf/5OgV67SrcxZx6Le2WMAWYfH1x?=
 =?us-ascii?Q?jPo2CKABvWx+wwppKWR0eYbqPjwRV4DHsXWZSHj78+XqZKiJN/fxPt2ViZ2o?=
 =?us-ascii?Q?/BBpXJbnxekFF+gsjpbv0s/g0RXwTF65CXBCOSmaC1te9Qf8s3mWiVOhv8NB?=
 =?us-ascii?Q?FVYgzUteQY/fkhAOJDV2we3lw5TJOzW/J/Tu4fSjSx4pivypSU5tXXLZ2hOo?=
 =?us-ascii?Q?CCM9yfPb50NRefLRVo66msJvjCRHI6cFkQ1f9CHFmsuoWscS/HrVwkzoq4Ll?=
 =?us-ascii?Q?GxcTjHOOSmjsc0JOr7gKHN1dBCJg1OCekbTvvIWYhUS57lp4+z6bPVinrQkt?=
 =?us-ascii?Q?/ejsnMPlfpDTtS6HHHJ7eZlu6L8yGKzr/MprIe5ZKoc6CUvhGxC+2V6TUDuC?=
 =?us-ascii?Q?iWCVFTQfwOcOu7YBarUuIuFe/NfhRFWgFNcUqSIom0899yfP3icdAtR4kGID?=
 =?us-ascii?Q?bywo3oJ4Vb4iVm3yDk+Z6N6R77o/I8YpvSkuOYzpIVpRa1i0b/l8k5fzdpbz?=
 =?us-ascii?Q?0T9h5XcsGAZ+cVPiSRAqdnW3Zdz0kiJqx1eamU1nj0I9Ib+NnvQbpXojLW1c?=
 =?us-ascii?Q?Q7V8fy2cXd4sO7JkdY3dlg1/xUvei9MP83lXdeOXx0wGArc9O5dTGQDaGLl+?=
 =?us-ascii?Q?ltIyTO72bGUJdo9sdM9/flgmt0aul7jJtXKAV+OaUKLZd8kwUATFVGqv3G/n?=
 =?us-ascii?Q?0GvUxtVGyENakqaRyFYJ71QYvzxAGs3brC0nM81aoWk4lGT9zz1cl31WGHX+?=
 =?us-ascii?Q?JcJ8p8yshWn6bDfGTlaj+qaOxY67Wd07CnjZZ9y26/hIUnnvFjOiByaC2xSW?=
 =?us-ascii?Q?1v87hF7cDFViANnJENOG2D1GDhe5TvGWrZc8qyAWA1xyXIt6yyi9w9FCrY+C?=
 =?us-ascii?Q?S6lNpV6CQ6xSGgFxxG4oAr93ehcad2MfjiVjsPb3WYQawpVPbvBYrG3z4Vf2?=
 =?us-ascii?Q?VvmFE76EAMDlwztbVGpz2EzJXAqf20OM4HjpkqqXOJl38gDlp/Vwqt4xg0RT?=
 =?us-ascii?Q?gyV3+px7i/gEZYyu7g/UgzRyNMNPEvtcEXXdgi9cnhLclhGodHOcszrIOTGR?=
 =?us-ascii?Q?FlojWBUgW2NB1N0yrNNMFQGS6bYmQr3Q1tWH7CeCG8f+26NKczLFzG+shyRz?=
 =?us-ascii?Q?Q0kohFO5RfKkVci7LT6GJDKBxL1rprNAzloJiZlu4BfRR8/bjZOX9CX+QV1n?=
 =?us-ascii?Q?G0Y6ROni9UwRKBQw2WCaF1IsRzv5BBkHSg4p9FXXd4ZuGD1vjZEPCT6oYaqY?=
 =?us-ascii?Q?8P20eLO+hDs4t4J8XbwoAPTqXz/G0NcKqR3CO7Ju4QNz93Arwlu9cbzlZP25?=
 =?us-ascii?Q?vvYWu9GHjYUsRfS2/ZI3EOEKi/yE+XsHhQqZlFs3ABP5EZb8fhc1ybooY6Nv?=
 =?us-ascii?Q?d4hhqwohJOX1A3V/B3ToOUGYyM0f1pwJBbwWsPRqGsAT7q+QaEksJFKB+ba1?=
 =?us-ascii?Q?3mbMIMGqunfUBTcB1X1WN7/UtBAzA2wGTaAcLTZPuKE7lKdieCD9ocKLDIom?=
 =?us-ascii?Q?BZPdrC5L8zefZKw+fNEPte5NkmGRK8kGYtxy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zat0B1QI+I70hYB2NjYhuT+kliWK58IzVswYtuAyAOE+aObM2t8TdyFZBbSV?=
 =?us-ascii?Q?21XaXWQ14PgHasatLvWI5rvR/3rLBlZUzTetWTZacF9BQKfY7b9PAM1CQFKB?=
 =?us-ascii?Q?rqy4tupmceflmiPGMwPVs1HTDXEoSaVSN6jxxOMftXlB8HGfYDIunvk+bOWP?=
 =?us-ascii?Q?RvBopH27w4UrC05Oj7oq7tqN3KmJt/49aY8Hf2m4znRtKMNl6F7efS7CaGl7?=
 =?us-ascii?Q?gQGJ0R3ycSBffqU2RzvypIe7EHi3HrDAGSJQc+l/gVo9ZZnJp+DEx2Nbdoai?=
 =?us-ascii?Q?qWMIdv8fSFc19CEINF/AxscM1e+gaQjK2shTepJrpf+nrRZkyUt+7l7dCquQ?=
 =?us-ascii?Q?xHk2qYvzCNE1hISWHc5Bl6YEo+m3JE7Jyg824q1Orp4Qw4eQZeYqWTzR6Q/P?=
 =?us-ascii?Q?rAuAR4NnF6lxp6Bs7BXIZ7Lidi3JB+8FF/4hbbUJq03+eHml0Q2uS22R5AuT?=
 =?us-ascii?Q?+/+Z50NmORvp+kJjODmAD31OOBvwklcjVGzIcS941LkyCyI0Ficbpj9JQoZv?=
 =?us-ascii?Q?1Q3E5IMPFNWsUMIviXjadnWBcCf4J40vS51kXXrq2KVBcpmANDy9jTlUBaQX?=
 =?us-ascii?Q?WfWV7a16Mj30DrClAA74znCNMIVzWUWLnbINsZQ4w8g9Flhk33TQxByi1CR4?=
 =?us-ascii?Q?8LVO+aoy/cydvjilBu9LrrfApuzRXPY1sUV1nnPylm4GrKK4WFxJcxsWHj0p?=
 =?us-ascii?Q?V8TJ0QjYxswq8476yxpUdHOXVOBVcyru2ltdKaSE18dajsO/FceMCtJraYLE?=
 =?us-ascii?Q?qTqA6bEFOlV4wvtK8rn+MGfXKbQKsjsYX+QOkZvdD029LjQMATIzXF4J8ooc?=
 =?us-ascii?Q?uQKltRDpCVWaxWh/aWcz+SwRYpy4BsLpOAOO5Qrvx6+9OclpMIB/b5gt+KfI?=
 =?us-ascii?Q?U3Ee4hhjEg5aFqsrvA5dAOAa3IxdoD50e/U2YDICMhW5Wzmbb7jUD+h/K6EC?=
 =?us-ascii?Q?GpLuzf1Sc4tgnALB+IFscTCmEhNBzrC8Fc/ov1KijosvlL9JQdMKRilN2gNh?=
 =?us-ascii?Q?y8XoS8axXPlYQEsLc+K3D7IsrRpQ/G+u5+I9OxP3gIXPb4VwUoPxSeRuchGl?=
 =?us-ascii?Q?Ii2fkHqMfjsgmInQeGW8bpt6KtHlfvomPQ+CSwTRtszg9NLiRCPP3Zm4jEtd?=
 =?us-ascii?Q?RzTGRzvTxIRPOjZ/Wqs0b3uymBwU3h9znJRL0CKITxXxIRDWlqlGt8yBN/75?=
 =?us-ascii?Q?hwkbTilcCK9pLOTm+rw1IROtAHFf1BzN5O9uC08eQTNRDOGVytTyIKkA5d/D?=
 =?us-ascii?Q?dVY8ZR6w2sd1URRnlF3odhxgxyL8vHnCLg3x5MFZ9JLkMXv0POfrSl1UbSmV?=
 =?us-ascii?Q?2bBTCTiQ17DpWa/j3FoeMAxZy/h43z+6GQ//XjXeCaIZAC4ke2qfu9LixGgc?=
 =?us-ascii?Q?M2y8M1ovDXpu+7/befvXfnpADShcN/6XS3me/DIRrxmeGiyLTE9MWq3Iyo43?=
 =?us-ascii?Q?1FNpOmuakc/CepuvxdZW3SKzy1ozQiIkPxWF+Bb8rNa69fBQQEuuUBTO/9CR?=
 =?us-ascii?Q?A6jWsf7aZtccC7ZBOYPRJ5nXppIMcCXu5tLSXFF5SsTGgii3NFasv6ruRcKQ?=
 =?us-ascii?Q?mge3JVQGr/ZmoK1ScGEvvnJLpgiP81kpIV2DMUSA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c895181-04a2-4de6-e6e1-08de2914c5ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:43:52.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttzegHBtmEdA5+BXOK+nQyKC1vVfSVUSzIMtAxSkkwp7J9BlJK3qhcf3ZUue7Hx/tnOpUi1oS4rjfFLpYz4oZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11151

On Fri, Nov 14, 2025 at 05:37:35AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Switch to using the regmap API to allow performing register operations
> under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
> where clock gating, reset control and MUX-ing is performed via the same
> register (i.e. SYSCTRL0) and different subsystem APIs.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/reset/reset-imx8mp-audiomix.c | 92 +++++++++++++++++----------
>  1 file changed, 57 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index d993c294c548..35df9bd5f71a 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
> @@ -43,8 +44,7 @@ static const struct imx8mp_reset_map reset_map[] = {
>
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> -	spinlock_t lock; /* protect register read-modify-write cycle */
> -	void __iomem *base;
> +	struct regmap *regmap;
>  };
>
>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
> @@ -56,26 +56,14 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>  				  unsigned long id, bool assert)
>  {
>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
> -	void __iomem *reg_addr = priv->base;
> -	unsigned int mask, offset, active_low;
> -	unsigned long reg, flags;
> +	unsigned int mask, offset, active_low, val;
>
>  	mask = BIT(reset_map[id].bit);
>  	offset = reset_map[id].offset;
>  	active_low = reset_map[id].active_low;
> +	val = (active_low ^ assert) << reset_map[id].bit;
>
> -	spin_lock_irqsave(&priv->lock, flags);
> -
> -	reg = readl(reg_addr + offset);
> -	if (active_low ^ assert)
> -		reg |= mask;
> -	else
> -		reg &= ~mask;
> -	writel(reg, reg_addr + offset);
> -
> -	spin_unlock_irqrestore(&priv->lock, flags);
> -
> -	return 0;
> +	return regmap_update_bits(priv->regmap, offset, mask, val);
>  }
>
>  static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
> @@ -95,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
>  	.deassert = imx8mp_audiomix_reset_deassert,
>  };
>
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +/* assumption: registered only if not using parent regmap */
> +static void imx8mp_audiomix_reset_iounmap(void *data)
> +{
> +	void __iomem *base = (void __iomem *)data;
> +
> +	iounmap(base);
> +}
> +
> +static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
> +{
> +	void __iomem *base;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = priv->rcdev.dev;
> +
> +	/* try to use the parent's regmap */
> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (priv->regmap)
> +		return 0;
> +
> +	/* ... if that's not possible then initialize the regmap right now */
> +	base = of_iomap(dev->parent->of_node, 0);
> +	if (!base)
> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
> +
> +	ret = devm_add_action_or_reset(dev,
> +				       imx8mp_audiomix_reset_iounmap,
> +				       (void __force *)base);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register action\n");
> +
> +	priv->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to initialize regmap\n");
> +
> +	return 0;
> +}
> +
>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  				       const struct auxiliary_device_id *id)
>  {
> @@ -106,36 +140,25 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  	if (!priv)
>  		return -ENOMEM;
>
> -	spin_lock_init(&priv->lock);
> -
>  	priv->rcdev.owner     = THIS_MODULE;
>  	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>  	priv->rcdev.of_node   = dev->parent->of_node;
>  	priv->rcdev.dev	      = dev;
>  	priv->rcdev.of_reset_n_cells = 1;
> -	priv->base            = of_iomap(dev->parent->of_node, 0);
> -	if (!priv->base)
> -		return -ENOMEM;
>
>  	dev_set_drvdata(dev, priv);
>
> +	ret = imx8mp_audiomix_reset_get_regmap(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regmap\n");
> +
>  	ret = devm_reset_controller_register(dev, &priv->rcdev);
>  	if (ret)
> -		goto out_unmap;
> +		return dev_err_probe(dev, ret,
> +				     "failed to register reset controller\n");
>
>  	return 0;
> -
> -out_unmap:
> -	iounmap(priv->base);
> -	return ret;
> -}
> -
> -static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
> -{
> -	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
> -
> -	iounmap(priv->base);
>  }
>
>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
> @@ -148,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>
>  static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
>  	.probe		= imx8mp_audiomix_reset_probe,
> -	.remove		= imx8mp_audiomix_reset_remove,
>  	.id_table	= imx8mp_audiomix_reset_ids,
>  };
>
> --
> 2.43.0
>
