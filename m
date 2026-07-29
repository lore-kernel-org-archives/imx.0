Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452D416D17
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357666; cv=fail; b=EAxD5Xgqvka3zb4sTtDzli+lwYMDR9p0fqJF0sLio13jiRoCw2GepQzr4vsAc1gSuwdXKpM1lxZ7VJu0gJKWBsjBBvX5iNduTMubZ6CcAwtmmodoIHA+HmA5IkHaV3T8thyoSBjGGvDdcwYxA2QD5RTt5n2BC68GUwuPiFdMDQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357666; c=relaxed/simple;
	bh=YxD5DI02YqiZjPN6BwKLIpTJpD7pNsqo45pPad9q4s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sMV/8N6xLT6p3xu1AGVXNahhj1o4i4CPgGMnJSV3G4bPKdhcgTlceMCz+26wBP2wmgG/641co9D7UwWo0esoCaFPCCFzDS6x7pEiwFESLzMGK2vRV0beLAvDQXa8YlnmVzS45to3wj6gxo2d6eG9z9jVVr+JxFzou+lze9z+1wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CGbuOj+F; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CGbuOj+F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzzzcJ0al0OmZ8pD6kkxWFR5iFLZD2wBjvtlWmWBwSfaBxxte6RvfxBAxDem7PyJ0t83WrY5dBfoaTY2KpMhFPcuAGFlfXmX+AtpKydTGjSy1bob0ufqVbQ5u6J7qF7+qFlsNCECzmRTbtWaKqFAc6XIRX8fsQwFWRG93c8yoP5BEhw5/z6NDcGakgMIb3RsgRI/w4zV0c1yxo+fcyx/wg467V/nWjL2n3MNlFQpFgpl8ocmIjvblPytujX043/ftbmEBN3UUppGSCVbCm/nIZGVNccct4Cz2yd+I5Mz19Kz9snPGx3FCPL96k0u1f1B1tMqFvfP9ntEDih4rBv2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrSoq5g5Y4W9FyA5+CYERlP6/jIKhHoAIvYiMtAGqys=;
 b=CLP+2exAN5uRz/PfH+bHWrgljlfnTiBuZ/sjHCh8rPckv2eCI5Hlx1mld76Sgmbcd60SfgmVqS6lQiokYKq5GE2ZXFN2jI06/7JNdy/XOB35DrMENjPCKnDChaoVK06qqwldLOBM410Zj/LOgxTVCAMZRjoLOIuGjjCaffD45tJ8ht1LdsLIO+CiJHUCc5iPHf7KGFEorKzCItg2rO10KDtLX+xVXH7hQy1iTyj2gsam9TkCwCESTaC06twDp8khbc9nto5bHskAvhdBCjUiN9DA1aN3Y0c0o3swh1bE54tUR/UakfY1LtsoD1SBtC9Zp62bi67jZZ99+6h/Qasu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrSoq5g5Y4W9FyA5+CYERlP6/jIKhHoAIvYiMtAGqys=;
 b=CGbuOj+FFNLedTdnkzFAJiJQHU6NwRreiIPx1hyG8+YywiYyVZbeu0k0Qvrv9TwFsuAxH/wdQ22HqIys4tFJVdVJYR7Ex/gEGn6CeHfYi1fYHQb7qkPYKD0/sPB5tpu/JPUntpjq17sSiBfn3r9CmLF6fbCnruIQ7qoi7ZqtyapsAkWOCTm4b74YlhKqBEIbFOn+A8CC5hf3KgO05pqhYAEc9vL0PokvnDCqSrMKSpwu7e0ZQiGmAETreWV8sqswsSun/wjKKFkI2qCMPdL9pYOOdajYnR8MrfpPak9KPw7HhMa7soMbHlp/ByHaDhcH+IMz3VxCLuRUtiuTk6iP+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 20:40:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 20:40:52 +0000
Date: Wed, 29 Jul 2026 15:40:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: han.xu@oss.nxp.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
Message-ID: <amplTATeFqpGx7qe@SMW015318>
References: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c39239-3923-439c-8176-08deedb1ae0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|56012099006|10067099003|18002099003|22082099003|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	iL5EOtTJaTPvn11iZtU+XAYLC49k0LqD5hNk2/M8Y2PrnwwEk9jqV2uWec/svjf2KxpRgkES28NP3FviuCCLFbTdj039qHE3vsNYGliatuQi1BMteAjawcO1iDatE1Oe+sQCnh2qNRXH/rNhH/uHFwvdtkrSIjZASpibljh/5rrgF2165Ub1lY0Fd4j+wL65HX0pvlTqeNiRTkc15kmM5TaN7nskb/ybY1cDtutVxIQMvQfJd5FNCqIRM6VahdFscGRanfNRPG7ls2XSt+PmyIc3Wi2W7PrS10rgxNrB/jhjrqCvPoDeFrM0PBgrhZojwES4hmk6znPkJjrpKBGx9X4HpqV8GBjFN8CvMv3csUzEoo2eJuA2u1U/edv2B7enzbjE7tl1FnkR9YPLtrORHFrFVvGMJoR7hf1A6EEdo78gk/1PED/X53Vow7B7mGlnOmgSEnZSpctPfM9jJR8I+A3XOJzgkiliAqnG7Crt1PG9heFZ+kuixnOnSStaCaexUnWlyn3onEcgiHwk3RnHupJokzx/idEyde3HuafmqHO+h5JUpBy5RcrhuYI0vbBpy/x1MVgg6HG9g5sbDheT33HHaWTKx/hNsDRxJYSyDas+YrDqKtAAX+gTrUO84H/YHoDJHXCWlVVkwis23U7Nud/+Fpad+AlmsBTfPNIFOG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UQUex+RkwNLrrboCQwBXPanHQwpjZheYmozePAerQcmF1Wzx2L2TDmh90mQS?=
 =?us-ascii?Q?PyvpWN18jj5rijMlMDwm1C6pbx0reyXZktRcmn0W8IadkvWgrKXPTqXe87o0?=
 =?us-ascii?Q?h5K4rHzQELMl5ZwduqGQCxzErMxsc/9oTAOkWzBdKi8o3U1THJG1ab47I//l?=
 =?us-ascii?Q?ygkbAfSuHgr5vb8L9EkYp3szouptDfN0uoG5cWOBwQ3vxqhDoQZuHO0IWQVo?=
 =?us-ascii?Q?XDk2qUn0S80k/UE+pMVuS3KcJNVk/6KEa/kISgtDz36TOLtGpJ70CAf43fCK?=
 =?us-ascii?Q?QVLofn9E+d8rAVGdWjKJlQfqfleRh65wx0geIYQWC9poK/BSUtPogS/jz4Ka?=
 =?us-ascii?Q?99lhOoLUFiSyET/vLGUGCJlC4H3esmLeKkxmRO8/QyjFnFRxY83xQcpHx1QO?=
 =?us-ascii?Q?B1duZeXeWnnjP29NAy1qR9x9p2JAadAuXNO+l6e94+bxK3Mn3KIsMy0RWptI?=
 =?us-ascii?Q?KgsYit4NRf3vP9YacK+XFTMVC3NmFkWUITlWUYq1PcWiYyLQpfqWuT0w9Pep?=
 =?us-ascii?Q?vU27+beGVgjP4SFhzZATPCiErnB14u1cXQ6Q6OsZllwxtF4udZPw/YGfX2N7?=
 =?us-ascii?Q?SuRCopYOkCOMQJo9dz3mkfAiLXRRrA6gAZTHg+pyJ4j29C/YK3kbl32doqRo?=
 =?us-ascii?Q?g/Q2pTXi2fOTXImkowPifm5ibch3zk7ExaX2xMV8waucbSnKHA4EB5NR1ABH?=
 =?us-ascii?Q?O0fWcbLc7YOi9WW9CeRZlToA7wos6C2gvTv52vLNrGF3O7Gj0Dc436YUoCrn?=
 =?us-ascii?Q?AquDg/LizjFqg8CPxj58xWShcVJBJBk9ZZdsB8VeyTIR6JzavbmIgWg/B9mq?=
 =?us-ascii?Q?cQkxG/ijGkre+e/35TEmElgQuWI1AIG4g42a5lgOuPtRv2wiXtyswQzl8IIs?=
 =?us-ascii?Q?VdL4Bf9JoIDsWHObqCyamUzMMgG/0Pyw00mVlGCoBDOXNa9P+2/ZOBpD33dZ?=
 =?us-ascii?Q?R9j0oPbPI1WKcQMRgscKSoiY5ubSXCD9g5EOO+Ahvqftk0c0a85HRvsFLCln?=
 =?us-ascii?Q?Of3Iy3+18c10UDSALrzB/7AGjDjRNFilQJscqxKRaqEwQB7K3m5NJe1SMZCR?=
 =?us-ascii?Q?zAvf20Axh9Qs45O3f5zVsVlT+8X+vGaLHFM7JqH0EUJ7KZKrD18WlLl9r6Ry?=
 =?us-ascii?Q?3+E6jea0m9YsrCFSqG+ZVvTZQ8QtwfftwkD7KgDEwAorAXO/QNQ0PCC4J8nu?=
 =?us-ascii?Q?6wlOvNuNuaYS49Esc8kw87cIRcB0ZzwQNTP+kTEZWkLe9fE5jtLrS33KDCXy?=
 =?us-ascii?Q?kLTaG7d2PpUi2ZKXXZ5kOiWNChNtylcw1mz25c9e1pRQniJJkP5xlyj0GlyG?=
 =?us-ascii?Q?WrDE9ZLR/qaJ96WLNyHW600u6n/vhiham3OJcrSwlPTAqeql3PdU5AS9aTl1?=
 =?us-ascii?Q?A0HsWENqo6Q36E1/+XbGkjSryW85eI9prZmFCy7xYdb/DBWSc5DRh/z1MpeR?=
 =?us-ascii?Q?PuQKX8P0pgHCaHXead9RiveDwcdocpCkHITlk3r/UNafotlXn1kjZlyUACG4?=
 =?us-ascii?Q?WkNQh0B9Ft2m8g06ZPwxNmjHvaonxstXaIXE/Oc/uGVbOgmfaGAhdPI6WbeA?=
 =?us-ascii?Q?EbiKZYTbSyFLmnjpAQSp3B40/crWntzgxBnxxn1T1zxEWnSsdQDTlUE8Vyam?=
 =?us-ascii?Q?Z1J0iTD2pthluM5SdQIsogmMkyyuRLKKBikvDf4D1cBrwrYEN0ekD2h9+chu?=
 =?us-ascii?Q?D7BS7bQSzPpUppHKptU6DeqP334oDqCez7e80VYfkaWiLYQw3dJio+qCcpsX?=
 =?us-ascii?Q?CFO9g7NgRUc5xYmy06oWHCIL33y43GTExuoW7NWW9xhw9Cnvnjsj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c39239-3923-439c-8176-08deedb1ae0e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:40:52.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LOh/+e/v9nmAgbhmg6olg8a93fcFehT6ckRwIuLNmY3FETrSUROjYRhAxNsBBNlPywgPZPX/WL6JbCwRrZMnHu270pJWxQDDQ3QvydWh+UfuhOGMOF+GbSWmlKjKdkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

On Wed, Jul 29, 2026 at 02:22:20PM -0500, han.xu@oss.nxp.com wrote:
> From: Han Xu <han.xu@nxp.com>
>
> Export the BCH geometry parameters via debugfs to aid debugging and
> provide the necessary information for legacy kobs-ng tool. The debugfs
> directory "gpmi-nand" is created under the root debugfs tree, exposing:
>
> bch_geometry  - blob containing the struct bch_geometry fields
> raw_mode      - flag indicating raw mode status
>
> The implementation is guarded with #ifdef CONFIG_DEBUG_FS to avoid
> build failures when debugfs is disabled.
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
> Changes in v2:
> - Move dbg_root and dbg_bch_geo into struct gpmi_nand_data to fix
>   use-after-free on device unbind.
> - Replace debugfs_create_file_full() with debugfs_create_bool() to
>   expose the raw_mode flag.
> - Register a devm cleanup action to call debugfs_remove_recursive() on
>   driver removal.
>
> To: Han Xu <han.xu@nxp.com>
> To: Miquel Raynal <miquel.raynal@bootlin.com>
> To: Richard Weinberger <richard@nod.at>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: imx@lists.linux.dev
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 29 +++++++++++++++++++++++++++++
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  6 ++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index c1f766cb225aa..527165ccc839d 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -7,6 +7,7 @@
>   */
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
bch_remove_debugfs>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/sched/task_stack.h>
> @@ -732,6 +733,31 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  	return err;
>  }
>
> +#ifdef CONFIG_DEBUG_FS
> +static void bch_remove_debugfs(void *data)
> +{
> +	struct gpmi_nand_data *this = data;
> +
> +	debugfs_remove_recursive(this->dbg_root);
> +	this->dbg_root = NULL;
> +}
> +
> +static void bch_create_debugfs(struct gpmi_nand_data *this)
> +{
> +	struct bch_geometry *bch_geo = &this->bch_geometry;
> +
> +	this->dbg_root = debugfs_create_dir("gpmi-nand", NULL);
> +	this->dbg_bch_geo.data = (void *)bch_geo;
> +	this->dbg_bch_geo.size = sizeof(struct bch_geometry);
> +	this->raw_mode = true;
> +	debugfs_create_blob("bch_geometry", 0444, this->dbg_root, &this->dbg_bch_geo);
> +	debugfs_create_bool("raw_mode", 0444, this->dbg_root, &this->raw_mode);
> +	devm_add_action_or_reset(this->dev, bch_remove_debugfs, this);
> +}
> +#else
> +static void bch_create_debugfs(struct gpmi_nand_data *this) {}
> +#endif /* CONFIG_DEBUG_FS */
> +
>  /* Configures the geometry for BCH.  */
>  static int bch_set_geometry(struct gpmi_nand_data *this)
>  {
> @@ -2282,6 +2308,9 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
>  	if (ret)
>  		return ret;
>
> +	/* save BCH geometry to debugfs if CONFIG_DEBUG_FS is enabled */
> +	bch_create_debugfs(this);
> +
>  	/* Init the nand_ecc_ctrl{} */
>  	ecc->read_page	= gpmi_ecc_read_page;
>  	ecc->write_page	= gpmi_ecc_write_page;
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
> index 3e9bc985e44a3..80c32efbaef86 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
> @@ -161,6 +161,12 @@ struct gpmi_nand_data {
>  #define DMA_CHANS		8
>  	struct dma_chan		*dma_chans[DMA_CHANS];
>  	struct completion	dma_done;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct			dentry *dbg_root;
> +	struct			debugfs_blob_wrapper dbg_bch_geo;
> +	bool			raw_mode;
> +#endif
>  };
>
>  /* BCH : Status Block Completion Codes */
>
> ---
> base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
> change-id: 20260727-nand_debugfs-74d6d6ba52df
>
> Best regards,
> --
> Han Xu <han.xu@nxp.com>
>
>
