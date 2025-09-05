Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011015.outbound.protection.outlook.com [40.107.130.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87015E5C2
	for <imx@lists.linux.dev>; Fri,  5 Sep 2025 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757052255; cv=fail; b=C8HHBBVb2N2aL5yMXkN3qYiDaUnk+upgOI+VQH2KuVoxZRBz813wHA2cS8l7QWISWt3klpv6taNOKR3p/qAda/XkySDCtfhY6VfexsRGCbun7aWeofxxkTiB8Q0rgYWDlUihgg9lLOI8YmBh4h69sel+L2tI3Uy7nm6lXHw5oR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757052255; c=relaxed/simple;
	bh=/0K4zDUPUjTr/cRG+jR9oJgCe76/mfL/1qRCBS17yeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NcPlwbHrknd0iZduMBRA0089kW0iUglg1kVkxhLK4KXczSr4c3P4cq/EvD04FYytGUx/rFHXLlwWV7HolysipAk/JAI2ljlXd00bTOLbc8sdpW9tHtJZA88Q2GuqL9UOO2RNLFTiZTJIXLC4Ojg8q5cSdzRmpGhKyZhLfeysJjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I4oQ3FHg; arc=fail smtp.client-ip=40.107.130.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I4oQ3FHg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Euz1h8gwwGXuu4rewAZ9Gko7J/rV7PAw7S1vB34ZhHIK94JhJBkkAGW0FGy2SH2WUcocZ78e8ZOvU0m9hLjc8meA6hxpO+v28+jj/mWaz8AGC9Irzis2DJ98GhKt5KrRvtD0bb6AjiT2VKubynKjmPrQilV9J8fGlNMDkm5+r7iv1IkSu2vdORQg9xoHiAndbSlsWWul2WtBj73bH3mEKR4Sgx4b9gjcu5Xj/zmy0+KMRVKrfFx9VkwbciPVetBvKBRqu29OgqBpcK26/43D2U6VfLzpojIPb1UB+hVq3W0TxTR9NOIYUAieIdlwIz2Pt6jcI/oHROsx9YHI/IHgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u15fF0p+5IrIJJMdCmJdH1BCrjjlAs1IAic2Uq1ECx4=;
 b=dL3IT0cSLfI4SN5au0Pg/4CnNfAWxDAuIn6yZ+psxR46axAGYcJ1OvHhmb1qBnHpNVW1TfKO+6SjGnUoJBhpJ2WI77pfK5A51LBvU7orJD6MWxyMT/mf959t9gJtJX+YqVk6NTaP2DoLd+SGsAf0Vec6sn4hty0eu/G6B09+ANFuHGQd3bSuoIXuiDd36M/1j0OOomDf8YpHF0m22ucrg3nW1eFw01RH8nkMq+2QJHDw6/uxoT02BGjw4GoqBpOADAqBFJL8GF1l88aKxZtPo26WzKjjgxvXcnJfWbQj014aA5GZQERVRm0U8rZ9km1ZDrksOByCQ6nTNF6TUKdxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u15fF0p+5IrIJJMdCmJdH1BCrjjlAs1IAic2Uq1ECx4=;
 b=I4oQ3FHgK1yBBidPDa1BcDdK8llm4gWWFi4267qqk0R/0aLslDAodoDKl2DRcEw/TDHV/sUQR0hNtO3euoi5H6vc5WeCkvgbyDvxjPvkoYPkoLkGEaiiXfj30/YslxC1y2cUAJQVpiObvzB2/KxRk2h9gJAwXUS7KWjtdEVhG3jUELEHA5tfZeYEmLZGvZkdU/7GI/MwA3fg33c4IAe9/38IocbOPyYzwEDIfxrXhfjxNmdIYQGPt/XjcIrG4nVntN3ech66AeJA92Yu8AnQCNF2sjCAEhbTjS9YaicSWkt8Htbp/aexJV7A7qG0k8YBHlaq47zr6iTuikRLdna+LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7292.eurprd04.prod.outlook.com (2603:10a6:102:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:04:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%4]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 06:04:08 +0000
Date: Fri, 5 Sep 2025 13:58:17 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: swboyd@chromium.org, heikki.krogerus@linux.intel.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [patch v4 3/4] extcon: ptn5150: Add Type-C orientation switch
 support
Message-ID: <bjy5jxkfwcuhz46eeixmcwaleza6kftgshezbxth2gtzbcvemr@svrul6tyuxk2>
References: <20250815094733.2353916-1-xu.yang_2@nxp.com>
 <20250815094733.2353916-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815094733.2353916-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: AS4P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 02236635-40af-4b68-9261-08ddec4206a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H+DPhYKwNdc0SFJI14b1LpmQ6kudGViXYVAK4LacVNg+QJDOhDtEL33o4nPB?=
 =?us-ascii?Q?vniRU8Fh+UAo4uLy6Q1xr77TQ0bsN2jDMAsvwEgZ/8q5RnN0CZoRM1COK5XD?=
 =?us-ascii?Q?vEHxtk+L5e3RsdxmZWM8UYBHHK/LpirUAvbArfJ2cDxXHVH2RvkBuyWah/ID?=
 =?us-ascii?Q?vIiX5sGm5DS6b9CLea6+uJFm4QUqEsT3R+k/HFSuoPZrPjQ4y0urYeCvC2Bm?=
 =?us-ascii?Q?GVz8t4GNMx/0Tm/LXuRyVW0KMGTo3f46oGM/HQZQDPX5LPGifGcnI7JCwOCU?=
 =?us-ascii?Q?IKhCzLdZtUv5zVR2wLh7X27mjYfGYHF8fS614eOUw9UTTQ4XEBx0IGS7c/vg?=
 =?us-ascii?Q?PUoPFgu6c40aCeEEXWn5WB9kkhmZO+jLmSM3LbEKXmthOMsUnVFmjcAfQ1YJ?=
 =?us-ascii?Q?n5IOE8d2yXxxFFpMdoCoe6x6LNuwqWdefQ9gHCvMXi2zuhRXRvaE0xbbfHIw?=
 =?us-ascii?Q?ua/HhPLaWkktlEaMrrdEho3D/4o+N89fmZnjD7GzSjgQunLIzNXa47IWJpW+?=
 =?us-ascii?Q?UntZso5e5RtkbN+s9P4dee03r8EGw8+/bw+pzrbMm9eqwk1qG+lvRIqNWnep?=
 =?us-ascii?Q?Jzq3wVw4warkLg+ugwrLvKYCosSR/y+CQFBC896v5PflhJAclJ3xg/DmTxw3?=
 =?us-ascii?Q?llq/+Ak3mmp2ICGLPck2R+rpLu+mO+PEKS7NlhpTykGe1zIx5+6AAjyzneYq?=
 =?us-ascii?Q?Ui2ftXX1iH+nqdBm0ERB8i3d+Hi8yeyzzNAOL5tONKfhZMQWcnmF5EUfIgpe?=
 =?us-ascii?Q?KcH4pbOvtMdvVJUrEJYlPZzOScEgIFDtp20rO+JlGv6IvcKrtMpUPjzhTWEr?=
 =?us-ascii?Q?O+91uN4vnclxjYzgFhO+AsI9gKGiysTwJag/WLIB03HWsgs3l4Fux3W2R++3?=
 =?us-ascii?Q?L9fynh+3YxqJBvMykAne882E/EyX2r7SWD8vedPYBh6NlV+gXtvSZvLdmmja?=
 =?us-ascii?Q?RtZYExLZRKSIMKQlSuLLz6IQj6ts9+/CHnv1iuoproT+ystgq8U7E/rblv3W?=
 =?us-ascii?Q?csO9tv9DMND7PQiR8H3l/RbkYWisZv5rl25nSdBdcEMqRzUvP4O29Rt9/+e0?=
 =?us-ascii?Q?rGmCBaJ3ajh2JVxzwGLsUNbGDlwxz6gfNbudylJQ1wod+lViRNl/gnst4UK1?=
 =?us-ascii?Q?lTAAv1fd88ezcmbhOmwm2WQSaftGpFGrdnPRGPKIrHiXp2tAv8+SrR0O5j/n?=
 =?us-ascii?Q?nYukh9RE/fwCnqDI74Nki3boXRr9FqxCBiIxe0sCv/1/swT+XKaGdRSsBD2/?=
 =?us-ascii?Q?s8zaN4e6ExsS4doMkUizKkDzf6upHtNSmSrDbXD+z9SzD5fVvcFXrXytfCGA?=
 =?us-ascii?Q?wV8FU2/ZM381vYbLUDiYpLFuPXdUGSSN5wBKgPdkZGhKkNe0YH/YYAhmy1uu?=
 =?us-ascii?Q?p2fP3R6JymuYvzyUxbVf2Fz0i1UTaD35UAnsxosUkABPdLcn+DxuRP1F9Knx?=
 =?us-ascii?Q?3NUhmIwW20tPpcgcnNwEisZOCAU81ysuFGfutCH8mwWxgk+G145PPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4krYvqF3AXZH2PBFiEKW3YGAjXsSKgdGtE2qMxqE4eJu41KvdYs91lwS+HsX?=
 =?us-ascii?Q?3h4MJiRryBTSNoF/z9LaNmoVKUgL7Aiy16CLL+qNI59OCGE3cDSO9gFtCuMA?=
 =?us-ascii?Q?+sIaAQNQjaxIWOkYWJ8bcOq2KgxjYSVKCbFSwMS0C8oSaIstxaQvB+V1WvaJ?=
 =?us-ascii?Q?6JNE3L4RD9XH4ZpOeQshOL1O4cAkrMg7JYPOASDevc3PteU8UeBGGgAcnbW1?=
 =?us-ascii?Q?Kbwyb7uiA52fES8Z+346nHVPQpHYwaEozZWFWLF2qYb2osapiZ2OyjbuLhs5?=
 =?us-ascii?Q?QozjL8EitKtF6j5XD/EjT6A9+G7jFa9LzQbChL64sXOXhKHQEQmeVMaPPRcU?=
 =?us-ascii?Q?JRyfLFogNlJ8tPVg2bOysMOK3TKkZaj3feUG0ajRmJNxa63Gplrt+j/d1iRM?=
 =?us-ascii?Q?pdoPwnf99prHUBcOnws3/0yACS/wan75qwpt/9RCKRxF/SPPtJJ2vhpMfvYl?=
 =?us-ascii?Q?J5Vl2VxKsBTHbu8a4OgOKBe6qyZKS+W8nVX204Gl9k8mjgM0wJZdfZP9u4Fz?=
 =?us-ascii?Q?gGc3R1UnBWofz9a8NzbRDzvFNIiyyfW2yguNd1yQLO5RMreWU9S4nsG9UKNl?=
 =?us-ascii?Q?Rf8REdx9F3+654s/tr9ylGg2iWzh2S5Kp6WhC3Wd7Ux9PQaEZNuYsf+lmbvb?=
 =?us-ascii?Q?DaIUzOPAZWA1/w6NkEMwHXWqgXPZN6awDs/KurERM53y+aLdKoelV8Q8EyKw?=
 =?us-ascii?Q?oPTMzPM6MoXO9oAGU2IryfSWgp/lNSOwGivFbhXKp8LS5ZYKg6xG7cJfW9Og?=
 =?us-ascii?Q?Y5PPJKFCy7ugB46l5Z8Wj9c6I32FcRT2y3vkJbKDPg9Ln1KmjpsaTlP81e/R?=
 =?us-ascii?Q?BUrMADXwmqMDi/A4dXe7D49+S3VUfm/QPyS/NXII8ldy2bZA0rrwwzBbcbbR?=
 =?us-ascii?Q?mu+SAyZjY2Yzf3J2H9Oo3xh8O8J3ZfB+dPugwgE8XVuhFlutp3BSe7x2WV6O?=
 =?us-ascii?Q?/6XKYbKb4b5ls1EsNLFQSYdSllkW8kPCn9ruYwf8XcuQ4YwVIMdPULB0YSpy?=
 =?us-ascii?Q?EOz04hUTiuF8xyH8KUqMTfkdZQWSEa+HyqRSQr/GbsmT2Ss2g1I3rYyIueyr?=
 =?us-ascii?Q?gB4zP9AcoQ+/hhJBVZP+W0AJy0r+KV+6Zfr0MQ1hCNOr50z8xCoLC3HWNblH?=
 =?us-ascii?Q?UN6STtgde0NCLPRCwo0j8QgdWMCgUA8GItZzlpjnWX4H1BKeWLGPrnNQ/CDe?=
 =?us-ascii?Q?q5q75j0t4oNgpc8TXuuEPW6UfcuNM34ipexhqJ2NB1k4CYLzTdh+cB8LEayN?=
 =?us-ascii?Q?KFObjb4PntX3woY8AwIM5WACZrFlImigSxkUQ1WnVDZ5kKKnGN3ukWMYN/eT?=
 =?us-ascii?Q?YkL/6EPvsDhkPDGVXONDTRsC1eT6lZxXBPUY6mGN2aCeQQlRjSKsWbKhLwvP?=
 =?us-ascii?Q?N9JnXsf0MantmE4/KzU/1b7R5PbQLGdPpc1Oiakhr0uMyjtDe0adu3RtY13H?=
 =?us-ascii?Q?zsW5rh3HxusEqK4gG9TQvmH0aZulFfWsV792zmHc3yPDMXW0pI2PAsU4DEvD?=
 =?us-ascii?Q?GA1Vj1EKJGI9bBp6QAASXajX2gfhLJ3w1bVGzP4NfLtp+5QxEMc7fLnMnMNk?=
 =?us-ascii?Q?nvzBQ97+r55v0b8nWsrNH3+yR+HG4Nbvtj3bSNX1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02236635-40af-4b68-9261-08ddec4206a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:04:08.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63js237LDoGwh34F6IQszDSRKEs/OlFKgH2QerZoiteoeBldBWBA3FZZAiW+y2ohgIeNAYi6g2stYrBAXUx5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7292

Hi Chanwoo,

Could you please pick up this patchset?

Thanks,
Xu Yang

On Fri, Aug 15, 2025 at 05:47:32PM +0800, Xu Yang wrote:
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
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v4:
>  - add Rb tag
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
