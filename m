Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7C1D07BA
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814002; cv=fail; b=XE5Xn5Fnrj7LLoRqFlMVEXI8q/FddkOAX487V5X896FHkYoRs8frenKtW3EV5BE53A9x0NgF79f4+L2VhfOAai+LHRZzW3ofu2vYz5BI62x9c8NVgEjp3wVBJHql4MUEvqaACqjtREvEEg3tixkEX9uejcAW91pfgDrREsDS4sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814002; c=relaxed/simple;
	bh=ZEbc9da789j0MptjZfIUrW8zuFmmQdSzUMXnaW0+Ff4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bDOHmhtU3jPmClE4VYQ9ovTZ7dM/bmujP+w9xHsSI04sV8Nuo4Z3e983zHav0ugTKg5PkiLCUF29el+YO2wFB6L/bknBEtevdxuMzgIpzGMamRQewjrbc64nowAmRgwpJ5PcCFAaF9EQf9QDTreh3O1IX9rBp+R17szs9LIHzGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FsGmMWHM; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FsGmMWHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXnUzHO6rYZVv5PPVaMGHtZ9RHTo7kETnhDwWQVr6uie81CH3rJA+quGAsq7BOa1JDFb1S6GRqiwDLQfaF2TcGfyAD0eqxfltq8uHwr1t1Y1tDw8l6cVj0iWHHYqFNFzVEJJ1JVQdpYo8gtbXEag+p0V0o4lotLY6133UvLw06SKpE1gGEXQv5rPK6FZqHAwE3K106TDF2/vaEKAa8RZZFG7f9z1+wjRqHLWgIhJac6qixGFinootYA9jMj+5MBQ0J2lXyAnprAgO31j+pjyRcoHPXZtGQLHppTrUWEuIFX5mxRGctJQEPBsg2co4Pf4VGzS8GN6jfFQqPRO048SWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71kTG4onuqFpLScJTlp2ZVmpgvzmV/VrABEdNRr1oH0=;
 b=k1pJrzO86gwGQsoo6wjAsfOCDyVyD1sWZPdvOc62gokj85Y1V9k7CjOI6PuZrEz65M5zaM3im2DhswIgxNnJm12d2iNBQw1G8VgxYotdPeVlGMT6w7baD84uhFNcrraEF5LAT0zWIv+3WlKODaSsKXaAZnc8PadCpfYDdlYPPJD5R2UjkC6S7v66Wr8GtBJpSV9f6f+XXxBrqQMl0vuG9E2t1EmGUoG4EdloNROWg+hmBIRznowFd4moxEmRDJl7Ds/K5jAVu9YhrcMWRdKOQoQkLJgl8k794RslnTPRWhRgrqRnyCCw0RXLQ3837OLhPUHCWpkg7gD+wN+edY+m+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71kTG4onuqFpLScJTlp2ZVmpgvzmV/VrABEdNRr1oH0=;
 b=FsGmMWHMQXjR5pTvOOHFVawt1IkJafLZUS/KpHKTYasAz8RP6Qs/3K6663nM6/X9rzELuAaxK7mFHjLn+43Y/pmjiFqiGsqOB1QwTPpDoI6/BoTHw8QYhgtfDKjHG8r7KTwG8oRWn5QzSDX8aa/EL+Mu+WZqfFZ9EGypb82njtViYQylgNiCudJdMwDa8VoKaoarZEnUJKXIpJ1c6WhMVX0JBJ5q0X/RtebBDKxvfMjSJa7AEhVN2rye0cCCJjU5XjHhft1HZAULoZTF0KeblLt1nU/dFX/f3qhXEaJbUupM28Tjr34Kz7NWc2JeLUny8wG3diMADAlwq24KkHCwzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8517.eurprd04.prod.outlook.com (2603:10a6:10:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 14:33:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:33:17 +0000
Date: Wed, 16 Apr 2025 10:33:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <Z/+/pgmR4n71iTkE@lizhi-Precision-Tower-5810>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <20250416105940.1572672-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b49c7e-e5b2-46da-c558-08dd7cf3a0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?objUBMZJ5K83Rtp65Qbe80MY6n79X9PkShnMltESfxqs/RsX31B828xc/Qi/?=
 =?us-ascii?Q?+wUTR+HG2awvwei/bHB6PqFaJITK1x716S4WqxGSbp9MNC/6OQFX34YvqBMB?=
 =?us-ascii?Q?iez0B4j1YJcvLJeadq9sGKjx5WChTbDMXLBs1omWsxZaVr4YUu4z8rUExp01?=
 =?us-ascii?Q?xYZkmaoLllZPFDJBOTMMGL2fUBVj+i6cs23Br5NQtDqUg/B72imgVBlFIpDF?=
 =?us-ascii?Q?ZgQ8DPBYpM7tkwMN43RwphcugY4h5evMpy5btympT41KZq06RxPzlHZoH+Lx?=
 =?us-ascii?Q?Pd/RagDiuhw79Wa/mzEg7NnJkS074hkyftjB7vUG5A8L+WuHuXt3ffJiZN6O?=
 =?us-ascii?Q?ERaZybc0Bdudk63z1+x5qhOd3hLXBRLXp+N0VYBgjWGOCU6bBL2pUcrtSVWc?=
 =?us-ascii?Q?KNSQUsp/8Exqrh0bAvagW6z/wv7ysH8hleCwXg593CpgptUWMVsj0DIWdAAm?=
 =?us-ascii?Q?vLtHYL/eCIj0zjBiIDN2Z9E/t3lbYU9DoeYvvXOFqqDbTN029GQGV2tV2Rez?=
 =?us-ascii?Q?Ig4p6KllCFNdmf6nUMFdErG2sWQz03LBvZekNSegngF/aive+0PGs2T6MrjD?=
 =?us-ascii?Q?PHezUmbjdBBWpq+3kmAL50heax53gx/Wbr8uorno4kNMmR06g9ALOUQLenOU?=
 =?us-ascii?Q?U8SIWDQ+7fwH6OF0k454xn80nNzbAqiwMIGiixZwd7ePEtNNaSvVXj63K9v6?=
 =?us-ascii?Q?M3zvlFDbG13h3fFrTI3dQtNeRn/+PdLHAMG30eoFLwU+KnBAbU7TGC/XMQ/u?=
 =?us-ascii?Q?dyOf9av++0NaIn74WtsVFFdTseF+oQNAL6yVX6NdDRxbzRddziSPJKcIz21g?=
 =?us-ascii?Q?mVeXKL72NVFJNQoVUsXbaOZgwbcVuOaPMryQdNOBTUQCStC8L89OCGY5jBIP?=
 =?us-ascii?Q?mnH+n6cEhv7ew21xuaT3/c9wf0c6c8rwDdIQ/6eF7KmrGsMDXq3x18ZrNCYf?=
 =?us-ascii?Q?KDLIlsvUahmpl7d/5Ul8GVTS5RVYicixnGgJxejMZt/nOYv4qDSfv3ih5yMz?=
 =?us-ascii?Q?m/ZDjJFDxek+ID9sO80SpCNWEX3freamlehcmyDZIdW8/050p+sJObZ2gtLW?=
 =?us-ascii?Q?lsfughHzogGbZIMRbNIGlxtEVTOirGrkU8hOOTFNU63caXAgDp8ydIY/kE6R?=
 =?us-ascii?Q?crXODQZ2G6AdbSYF3oxnCBxXKfvwShlHjWQ+BGC+VPIXcm+98mYkdsvpGq6H?=
 =?us-ascii?Q?S42wDlrDjfX7Wbf3FFkxRK2b1wZbYbauu9eFedEsDR5QKhEnnPFFT9Pw5Apx?=
 =?us-ascii?Q?zm2rWFRJGz7VG4TjrCC1DgCEDSUs/9q5eMrF83kmCAGnh4m54Aodt5++Uu4I?=
 =?us-ascii?Q?LkOlefFLck2VSYImF2SQy2eOYnXGdCgsDgIaSPMY8/qF1oCp0cuul2gJu1uz?=
 =?us-ascii?Q?N9DbcxWB7wqqGlCdP9TLkFaL8ILmWa9SmIs2nzl16BPD9YqtpCOLKCyqTlBA?=
 =?us-ascii?Q?/2p50vjN6tpcVPSqXdDSUGL+Xf6rSyxU1ULMLkBF4/6NRrflLrVauw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GahwKdIt9a3K7AiREcJzzci5lCe3s9e1YUMEm9ieEOR+6DC/nOUfiA9mifE3?=
 =?us-ascii?Q?/HR68t+fyMCkfWi7YStkJvi+uEvqP2OzCoskSZ1VzSaOTpR3Ncn4Cn2uOdG6?=
 =?us-ascii?Q?chIaRIiPrX7DJDSHMn6q3jSYCbdsNoYpDuOKytC28Cxie/2gtbryAIJzXuC+?=
 =?us-ascii?Q?oUUezrKq3MIU8Yk7pHFLE0cpOaQpY1RdbXAO0DYLE01O6axMM4huxI91d4Kb?=
 =?us-ascii?Q?shgnYQqw3MEIDE5K9b+KHrNmSKxPujRxv+8Mmb+UyqVzkfK6OO3ZoiogU2lC?=
 =?us-ascii?Q?4Zanf+VgjtwJhUhCjKDq59r1KO0d3qJymMbwrEXnjaAZ8Cw7rVS5oZazip4/?=
 =?us-ascii?Q?MxjOShimu7aJxrCqfCJGtHmJEeZ6NLtVL2KG8TQErmA/GbLgaIJTyonYZveY?=
 =?us-ascii?Q?LluFCGPKnJv+TxvICI+rwOFLh5lXTKMfgHcYTk3WcDXrOTdcs5onl1I2cYyX?=
 =?us-ascii?Q?0UWtU7EgmcsGS5nmO7JPcZIvkZdj9CpVNf+oxEPqk0gHzO5m8DKmlcffdjvt?=
 =?us-ascii?Q?5FEPtjh4dLCUNeQi2lGnM0c/A7nd3SjTvjkUYnUEPh4CvN++EVzoYatOO61J?=
 =?us-ascii?Q?e2TooOlfc1zCLatR8zzpxAsqpuHgBzZ7zL88Pt/WOVxBo9F90Hku+avpZF0G?=
 =?us-ascii?Q?jGhf7KlZAqWuB3HpFl8/upl/e745zcH6Wko7pIasp0lXMduDuexjMQ8qCBjr?=
 =?us-ascii?Q?P5G8UoahktY+PytGtuYt4AcSKNGJwNA64HWX9w4l+HvGpyez7SCIRYPDqMjU?=
 =?us-ascii?Q?CKSMupXdNr3naAUhPfyp14v6vhEAElsIbKGohc3kqXw6aXv+wcLwno2y5vUB?=
 =?us-ascii?Q?nmwzrZ3qIer+Ubbk8Kjkt5dal9Whk3NH3qpAPd7k4h8hEQ9uT3bu20+A/og1?=
 =?us-ascii?Q?OCMW2AmC3+xj5DteD9Y9CV3hMJZ6E3TEfIH9WaSwKFTENbsKbJlxJCFoIYTF?=
 =?us-ascii?Q?qdsVCjS8DuRbs5yFfy9iCfxZBPKbmD48RD97iudB9YyB+4lRXs2+hjSGlzuG?=
 =?us-ascii?Q?H4jrkkF/hfTWmVVWhTG72StjrbtBXUxKIfTmJCVOr9ddhcIqkJ7ihCGmmHzI?=
 =?us-ascii?Q?h+x7PZZjJav/JsLIhbpl0fU6AXqCK8WpcVkdi6xLDwkAv7hr1AGi+qhIcyK+?=
 =?us-ascii?Q?Jx3kGuWoo6d83CpvZBAyF3hRTzebV30ggxj6i0wokM6L4rRQ9QMcuQV9Dj+W?=
 =?us-ascii?Q?7yUek/X0HQ7icjZksnZU0l6/p5SrQt2RQCISHFSCt0RZ+BEUAc6HxoUK7iun?=
 =?us-ascii?Q?rQZZpbXBsH3oN/MMU19MPMhVKJWD9+IOGEK8M+WC8gX/4mI/abgzBLJdGzng?=
 =?us-ascii?Q?fD3MsZvF4uaPDq3YDK/U10pAl8ATOKngofbmQ/HOotqxoAxBRFZvZJLY6H5n?=
 =?us-ascii?Q?Kzujb70H/4+gZd7F5XOmmFVj1N4txA6cgTWt1NAmfCGjY+k4qroYXh91VD51?=
 =?us-ascii?Q?WPq5cRXRkjQVYCBrJvbd2ik6LlSETO6WnCgwTmYbdbJt39HdDL5GLEr8IPZk?=
 =?us-ascii?Q?Fy+XGToqFdafqT72yuBDMuNPKcZ+wBH+vySfd0iRQDqCMMswnvoDyBQRHwMm?=
 =?us-ascii?Q?3bht7Qx6rvg+VAAt6jCvbVj908h6fChwGqH7l+za?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b49c7e-e5b2-46da-c558-08dd7cf3a0b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:33:17.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzoEOBwZEsdAufptqdM6eJUhdbCOHneQM0fWIc5+km3HdexeYMPJOxlN9eSPsw6RO1+iabRZ7xF20GUPIVNQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8517

On Wed, Apr 16, 2025 at 06:59:39PM +0800, Xu Yang wrote:
> PTN5150 is able to detect CC polarity. The field[1:0] of CC status
> register (04H) will keep the result.
>
>   00: Cable Not Attached
>   01: CC1 is connected (normal orientation)
>   10: CC2 is connected (reversed orientation)
>   11: Reserved
>
> Sometimes this information is necessary, so add orientation switch
> support to correctly set orientation of multiplexer.

Add orientation switch support to correctly set orientation of
multiplexer according to CC status.

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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
> index 78ad86c4a3be..b7e05d921c79 100644
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
> @@ -72,6 +78,7 @@ static const struct regmap_config ptn5150_regmap_config = {
>  static void ptn5150_check_state(struct ptn5150_info *info)
>  {
>  	unsigned int port_status, reg_data, vbus;
> +	enum typec_orientation orient = TYPEC_ORIENTATION_NONE;

Move to first variable to keep reverse christmas order

>  	enum usb_role usb_role = USB_ROLE_NONE;
>  	int ret;
>
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

Does it need return error here?

Frank

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
