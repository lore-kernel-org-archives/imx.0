Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B4212B3F
	for <imx@lists.linux.dev>; Mon, 19 May 2025 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685658; cv=fail; b=CmxKK8QkjzaRf8tAlZcC4Z9+UcWEEkNg0nnvbAgFdwGCV2bKf5EIZHukrbm5iHmdXap/CpDiYL0Igbbch2tJKJo3Ccrp+2gceDUnXHo2Dg8RcIKkeFOZnf3LU8dRYvTAhVWLXBXjnnChZK/uHwoPPGYSvamq8fHUSj6SLcsMlak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685658; c=relaxed/simple;
	bh=UztCVDtOQFt7yrlMhbbBWH7H8DX0xML+R2Rcq4GlVj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XV4JI+tr3YZaOdfG4ykPVYqCtKskFHQpGZkJLl91DrM48RtpNEeUeW3ZuhayuFFntZstkX86oKU4Oe3SS/3mA+DFFa/2oJe/Sm01RFgakuxMPAuG+XTbiYpqG7U2emhrUUkkjJcmW4wTiG1wuKDWw2WsNJgqU7GfFQF98mnOkmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZuIiWQ+k; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZuIiWQ+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl7HjcTc2EORxAxLN6ffHeO5dUrWyi1stK4Ng1ShgEWlanXKcgl4EQftD0PPgo640utE+2Ps20BW1UJgmt7x7SeeCnhLZwO9yccepv4IxeJkIrpcEa2WrVNrSB/BLqCJe8WjMYe4dPQZehBB1wXviWd54i0qgm52TVfk7nC+K9Gu4FXk/RkJ5zxyjjgFs2NUGl36BqR8Gq43uEdbQwIj8NKUu8aJe+yrqM40+sny9VHDqGldfSggQm3br+H58MYVxcXrUx+Vacq4KqFSNY+hPksSMAxgtseeAMNzBwm2XHndYROqQLQxTbvoCMotGV3TarywqwFE5Ep8T2fr7liaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MebrsVN8kuOi8AWTF7vms55LfEnz0/RfBs5NX6g39b8=;
 b=kKt2qXdjDJ6fabap5eXSK6TvkHxTZ6kfO6PTF++C0BGXoUY18OwA0NTD1dh1b18erudLWlnNmPD/qPmimfwkoMiIbtvAloQBu9wpoxus+ENG0SYe2JI/2OnKimWjZNYduZLPt9DF5fQbcXHeqrXJGODQ3+OHLoqeQbD+5T98VSQzg+OIdoI9jZIqglopILH+XjTwp2lVXHsIk4Y6O5pRHjUkePqInT85cIhOI19OqjQ28OY7IQAqjxOE9nNi36IbiF4C0hasJdoZZ7allfgMdtF/pez3hkPmoep+MlpCDeew/jGRVONAVKxAPRWVIBgYMrYxzI88lBE/xQi5LkgvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MebrsVN8kuOi8AWTF7vms55LfEnz0/RfBs5NX6g39b8=;
 b=ZuIiWQ+kv/ihwhCxCph4lmt72lsJ0/iefPyCCD8bUT3iT4spelgjNasiJ58lomdK0WmBZ/5LGSk54/GqvxPoqfOih5KP/rapA3WvG20EA0En1Z2EXclmeTsCcAnWwxh4rjbR5olm003e+Q2J1H8oQFg3LN6Q1fWefBe4Bf79wqrUa1a9BzPgR4GbwMdm+8/k1gPsiBN+eIwjy7ZTehTrALViunfAhPi4lCY6E6JJfxA1/NUml0g9cbRo6uLqv3rDKkEptpZX41nUaohNZ2MluisqHwa5RTjTBs+nlePNGdpuN/2Wc6po0O95whB+x8QCfk+vrHFbZtiuZSoVbk8Gpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10503.eurprd04.prod.outlook.com (2603:10a6:102:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 20:14:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 20:14:12 +0000
Date: Mon, 19 May 2025 16:14:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	swboyd@chromium.org, heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 3/4] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <aCuRCDF2NAC1apHB@lizhi-Precision-Tower-5810>
References: <20250509064526.3767729-1-xu.yang_2@nxp.com>
 <20250509064526.3767729-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509064526.3767729-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: 72081fac-4177-495b-2c43-08dd9711b86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZodOeE52OpLml0L8MhqfqWhqJquFZIXn7JO2etfucGKThUEZWSs9feGhxr4y?=
 =?us-ascii?Q?8JYB3cSqNZ6evFIq2DgO8/Z4+0CVV45ci9wecAhNsV+QfQxO8lzHc/bJaoOp?=
 =?us-ascii?Q?tVdiFyF+pwl5Rklspv5hd8tKyo4sxNpdWP73K9d00Ja9Z1J6qW870PS6NUfL?=
 =?us-ascii?Q?UC3Ey8djtpd9JgH+VhmpNNv1sgDZOelVwjcVj6wcK3/1W+puoSSeEMLtql0O?=
 =?us-ascii?Q?BfZ+h9wes8TQe/Ne1DZxenv+9uSdfCfRygv//CnfSj5AxBOOwn/rHwumhVAe?=
 =?us-ascii?Q?H4rL150ZFb/Grt8G34ugYNB3cQ823uIvl2nELXCXODdj4pC9tW7EMDO0+dDO?=
 =?us-ascii?Q?xZ8dtohiVZL8R25Tz/DDnJXIkQMaXSDBLVaJjrSvCTGbW7O3XG7w2En3Z/Wr?=
 =?us-ascii?Q?T6Dsk3vdicroF/NilxZXUjcDJAG4da9d5gPKx+ru54SCvcKxHnVopZrxlOxf?=
 =?us-ascii?Q?uujrdr/NA8WJpBpHX6PxgwJnEoXBEARNzt95w2vV6dKdtu31mfq0K1SMI6YC?=
 =?us-ascii?Q?1kYw3WNChjKxJ+s8JoX8bgkjVu/rw4Xh05q+6qyc8Iiu9XqdugjlI4F13zkH?=
 =?us-ascii?Q?DzIBaaBHY89vaT1+i1dYfL8mBe+cb6BgW3yF+o1jfyCdbX99SJ6wGjdvyg12?=
 =?us-ascii?Q?lG5iFSr6NdBksx6kLKhljt065POz6sF5dnaX5Lg0tTTlIrWwzFxv4PtoAx4N?=
 =?us-ascii?Q?uy3VrvP5As5JsI6I4k1jhs4zOWoKtmp2lg9HkO+6Q10u+bchDNrkkAEmNpyc?=
 =?us-ascii?Q?k/RB5YWB88sRzUKyCLMkn4gB0hZTc2nOUOi9kinn3aI/h9OGEVAktr4SBn7u?=
 =?us-ascii?Q?B6bO1Auqw0WLpy8cPXrVWsDOMRaWGIXngLW9PBUIjAsvpVNIPViboItzB4eG?=
 =?us-ascii?Q?LzSB332kiNwaBRjZuDlqbYXHCWxh/KJ5qJiW6vfa418YgryHJkhSUn1bORC8?=
 =?us-ascii?Q?yyEowznpI2V92gCNeFGhFZ0/lvqZMcV0KaDFsZEj2+NqQv0n/WrtVAah9q5u?=
 =?us-ascii?Q?nCbWKu9KoWC8YBjw/LA57feIkzx0SZJkw41cywy940YwMks2BCFzwxH8IL7j?=
 =?us-ascii?Q?4yad0tjV3N7wExr3VRuxX571/MDrA/LD0Zy495xiD9DEwrZ64SAtNQ/wxEHc?=
 =?us-ascii?Q?eCVpLriMsDQTwtFqMqy4/s/4awp4XHSGmeDmwrbynRafre7LNmsijM2m0jNn?=
 =?us-ascii?Q?k/mgJpcFrdcVMEyGTHRUcF38tpzufqprfCe1vQVNfLqFSutuHF6ZWtloyeLo?=
 =?us-ascii?Q?Yomn8+d9s8asDUSwfeNpJOBVKdNz8U4Am+8M82JY88cSj9YJ5ZIEjk+uQvqD?=
 =?us-ascii?Q?yv+BYqTmzSZ4Q17SonNkdYOvubqIEDqnocT1hRR1LLmGzTcEuj8FXSSotjN4?=
 =?us-ascii?Q?R3+DEtS08cRsmkdag+PMupmxB9cHSqlgiLvYw8PIIqXy4d5CHVKN3SjtOjuQ?=
 =?us-ascii?Q?ne1egBhQ1mWg08jacnrZzHUNUIhaJyR2FL6Z2xFyPxvgbk3/lOVJJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aDviHdAhrU8WecKo2OoeslueU4FU+oz3OcornuuCLn5q3CHQFWTCZbIUn+k1?=
 =?us-ascii?Q?6dOpJFY+0z5vLKTVd1wqRFPSthuHPaAMz/hUU85Ac3Je0dWiM8e0fE9Jjo6U?=
 =?us-ascii?Q?88w/gAeuHz7F9sXHjY/BwiHibE4FfkNp5Mf6XBn8mJRfxGOsfwaVVjHNf6nd?=
 =?us-ascii?Q?x13CYhBQ26qTPSGivaJP9GRT3M2q0WcSShJOZMCcU901tgVIrdrsUUH3nCgW?=
 =?us-ascii?Q?YS6PEivK+Vb6E17A0g+zKb4vMlEPQkwIvc/ftzBzdYJOvrJrIoqasvhFfPNQ?=
 =?us-ascii?Q?gRHLGs9vCcvV3rjw1OWE7bhWwr/6scUvJTG5CrwtlCHiR1t+HocN4g7Ock+A?=
 =?us-ascii?Q?uY7+hdCX9ly0c4s3NYLcGfLdnXptWJH3VgYYivcLJow+XaB/yk8gMLeOjFfR?=
 =?us-ascii?Q?Au+OwK+EbVtU5NeLbo1q+GjyJPApwiETl8h4Pf8yRginlhSK4HkYxDFCT9Cf?=
 =?us-ascii?Q?JBKXMSSCm67VgBg1qANWcw+mgPBJCKv5NVsmw0bc89l2yDCgQZgVWBWgunkS?=
 =?us-ascii?Q?1LAlZ5AP4KZvIONsZpG3O/b4+523QQHTNXbpBk0uNePV0VS4H9mCwWDF/1jc?=
 =?us-ascii?Q?vQvIr9/YBXt8FCl+E6CHi12IKp6sPQY7h+tUfU5T4Kexz/JHXd64T0UcYBEv?=
 =?us-ascii?Q?xOUqwAVjmE0RRDaIEioiyaL6uEYNBxEaMj+fHoSVJJnfrfnhjvZpj0K8Zp+D?=
 =?us-ascii?Q?ou+uSaxbSZTQjj2WoxE92z7jXiUNfZoTW6qvBOSmLlpddqnYr8a+Srop//hn?=
 =?us-ascii?Q?WIs++VemXQjT/SlXlnhvSctCiR/Dsn4S3zAYa8FnNhbMZyttVbqumNaeAOvl?=
 =?us-ascii?Q?tZRoYp5H9ifUHxkhLAwT/x8uW2OAUkwM3bv9RoR/D4Zu1JWHCJmlk1CXuL6W?=
 =?us-ascii?Q?ZiG4S+BzGSlYb793AwILWtXnivFK7UWvtfrveHxQeL6IBjlKuFU009u+xrd7?=
 =?us-ascii?Q?WrduhigouSQCGJdQGmIyhpQUN0BKC3yTnvEy/55ihyRmzTfLSMHosNRjs/Su?=
 =?us-ascii?Q?dmvq6YRTG5vCnqeJ/KTl7ujdpLSKN89oUYczrJudcUguZDVc3GprSaPSI20a?=
 =?us-ascii?Q?Kq0SSwW2Wk/DPeN/eh7k6I1fFIcNyIcudBsRmftq5akG2wjQmXhad3DTuYVe?=
 =?us-ascii?Q?l469Q945AOP1wlmY6J2OIP8BQZxidIjPbircu0oYq12fiEcxKX4XHtruy1PB?=
 =?us-ascii?Q?56Q1syuXyVaHTy6vZvnkOCHe6le+ntWlY4ZeHzrbuUhIovIoHIvVdtI2Xz+v?=
 =?us-ascii?Q?zc6dMssEkKT8A2o07y+MDhHHNzfKtFOkchSp4+XqRKBinLM0rDn1hZSYkVmq?=
 =?us-ascii?Q?Xv6TosdSx1Efam4adE5JCCPy0HSi6S+m9iAIMRX3J/yb/CG5K5jHVeTiysVw?=
 =?us-ascii?Q?NatBEI5bJJHAMzD5b/hbFUqxRutm4Z/OORPZqaYt3gq6qgZYBtAGC3cdwbPy?=
 =?us-ascii?Q?K3l+dv+i+dwUpZlHXPBPlkydNvltqVO2IUVczYFyN+TdJQXHJP6fuhiEcA9M?=
 =?us-ascii?Q?5SSqrmpcnKZfqKa5Y+nK9NADpHBH/0UexGfARxr60hRQ2rBrM+JXoqjILM3E?=
 =?us-ascii?Q?fsRu1zjTrBqwtLZmIaU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72081fac-4177-495b-2c43-08dd9711b86c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 20:14:12.2181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7JJf5dxye1XEHMtic2Yxtgq71zAgsB/pFkpNUG9QcNzipre4nC5J5M1DkTAK1yESNzbpfPGWB5Tfj7w75ugzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10503

On Fri, May 09, 2025 at 02:45:25PM +0800, Xu Yang wrote:
> PTN5150 is able to detect CC polarity. The field[1:0] of CC status
> register (04H) will keep the result.
>
>   00: Cable Not Attached
>   01: CC1 is connected (normal orientation)
>   10: CC2 is connected (reversed orientation)
>   11: Reserved
>
> Add orientation switch support to correctly set orientation of
> multiplexer according to CC status.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v3:
>  - no changes
> Changes in v2:
>  - move "enum typec_orientation orient" ahead
>  - improve commit message
> ---
>  drivers/extcon/Kconfig          |  1 +
>  drivers/extcon/extcon-ptn5150.c | 40 +++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index a6f6d467aacf..fd4ec5dda0b7 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -145,6 +145,7 @@ config EXTCON_PTN5150
>  	tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
>  	depends on I2C && (GPIOLIB || COMPILE_TEST)
>  	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> +	depends on TYPEC || !TYPEC
>  	select REGMAP_I2C
>  	help
>  	  Say Y here to enable support for USB peripheral and USB host
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index 78ad86c4a3be..768428d306ce 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -18,6 +18,7 @@
>  #include <linux/extcon-provider.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/usb/role.h>
> +#include <linux/usb/typec_mux.h>
>
>  /* PTN5150 registers */
>  #define PTN5150_REG_DEVICE_ID			0x01
> @@ -38,7 +39,11 @@
>  #define PTN5150_REG_DEVICE_ID_VERSION		GENMASK(7, 3)
>  #define PTN5150_REG_DEVICE_ID_VENDOR		GENMASK(2, 0)
>
> +#define PTN5150_POLARITY_CC1			0x1
> +#define PTN5150_POLARITY_CC2			0x2
> +
>  #define PTN5150_REG_CC_PORT_ATTACHMENT		GENMASK(4, 2)
> +#define PTN5150_REG_CC_POLARITY			GENMASK(1, 0)
>  #define PTN5150_REG_CC_VBUS_DETECTION		BIT(7)
>  #define PTN5150_REG_INT_CABLE_ATTACH_MASK	BIT(0)
>  #define PTN5150_REG_INT_CABLE_DETACH_MASK	BIT(1)
> @@ -53,6 +58,7 @@ struct ptn5150_info {
>  	int irq;
>  	struct work_struct irq_work;
>  	struct mutex mutex;
> +	struct typec_switch *orient_sw;
>  	struct usb_role_switch *role_sw;
>  };
>
> @@ -71,6 +77,7 @@ static const struct regmap_config ptn5150_regmap_config = {
>
>  static void ptn5150_check_state(struct ptn5150_info *info)
>  {
> +	enum typec_orientation orient = TYPEC_ORIENTATION_NONE;
>  	unsigned int port_status, reg_data, vbus;
>  	enum usb_role usb_role = USB_ROLE_NONE;
>  	int ret;
> @@ -81,6 +88,23 @@ static void ptn5150_check_state(struct ptn5150_info *info)
>  		return;
>  	}
>
> +	orient = FIELD_GET(PTN5150_REG_CC_POLARITY, reg_data);
> +	switch (orient) {
> +	case PTN5150_POLARITY_CC1:
> +		orient = TYPEC_ORIENTATION_NORMAL;
> +		break;
> +	case PTN5150_POLARITY_CC2:
> +		orient = TYPEC_ORIENTATION_REVERSE;
> +		break;
> +	default:
> +		orient = TYPEC_ORIENTATION_NONE;
> +		break;
> +	}
> +
> +	ret = typec_switch_set(info->orient_sw, orient);
> +	if (ret)
> +		dev_err(info->dev, "failed to set orientation: %d\n", ret);
> +
>  	port_status = FIELD_GET(PTN5150_REG_CC_PORT_ATTACHMENT, reg_data);
>
>  	switch (port_status) {
> @@ -152,6 +176,12 @@ static void ptn5150_irq_work(struct work_struct *work)
>  				dev_err(info->dev,
>  					"failed to set none role: %d\n",
>  					ret);
> +
> +			ret = typec_switch_set(info->orient_sw,
> +					       TYPEC_ORIENTATION_NONE);
> +			if (ret)
> +				dev_err(info->dev,
> +					"failed to set orientation: %d\n", ret);
>  		}
>  	}
>
> @@ -219,12 +249,14 @@ static void ptn5150_work_sync_and_put(void *data)
>
>  	cancel_work_sync(&info->irq_work);
>  	usb_role_switch_put(info->role_sw);
> +	typec_switch_put(info->orient_sw);
>  }
>
>  static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	struct device_node *np = i2c->dev.of_node;
> +	struct fwnode_handle *connector;
>  	struct ptn5150_info *info;
>  	int ret;
>
> @@ -311,6 +343,14 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return -EINVAL;
>
> +	connector = device_get_named_child_node(dev, "connector");
> +	if (connector) {
> +		info->orient_sw = fwnode_typec_switch_get(connector);
> +		if (IS_ERR(info->orient_sw))
> +			return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
> +					"failed to get orientation switch\n");
> +	}
> +
>  	info->role_sw = usb_role_switch_get(info->dev);
>  	if (IS_ERR(info->role_sw))
>  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
> --
> 2.34.1
>
