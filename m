Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899851;
	b=0uorrsta01YIYnujCXx3AUcw5gkjxD1mfyy6rvCKjyXfE6OSBoXMaIOvnP+6mIvHTZLO
	 Lr6TxfMAMAVRSctN7zCE/smuUviOb5Co8PJ8BAsd3mwQ4JKgq20cacvqD+da5UXIEa7uT
	 mgRbVZENXIHhDyYeWXC0gAw7KiWtijHnIEQb2T1Bn00M51iv2nXkhsZEW+tL3CgJ/PJSb
	 v136gTfNNuKRRAmkJMOgMvHH5PS7Lp0yNYlqjWryOvwnotVZMubojk6sA6BE/Bo+UOCNf
	 c8UrP89xUrIlX744jPnK+A54bTVbIVfcJVc2ja4VsdfqGff1W8dZv3TcocMqj+qoqEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=z0DYjW3aEW6qI3UEKYhz2UlG0X4fZZP5SQ+MZbpTres=;
	b=R6afJUunTcsFL1CfARMZthsJmYU/yi+PpsMfAGUmMLWuk/G7OCbIXJZawOy73ezxhhmH
	 5QF9LxHY4eMXpzElWzsb0Nq2kMDg2dYpoYNVTNsDtKlrXlE/9w6RECExAcvELkKWzpRc/
	 DWZdT9mFZ1DhjN7ijtyYfMyD5fa1dH/SxCEDW2aTmXM+467iUEzhFF/1mUJF640SDR6bx
	 OiOimPj3j1gcs4Pfcjs7/wu8KWJ2lvtbIO1COSLJYjObJwffdmrnnOc69oqIwGRcXnUlG
	 XOmJIDi4ujf4xHU3/Q+R6UZSCnW+7pJUHqqfCS1/PjuQin0OEhS5rJ91Cv8FKPO0F5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=W8Gd2XC+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B45606A32D
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 17:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B45606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=W8Gd2XC+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uImJxnV7IatKpGxHeadV7fBY4gshfT4gamNhPV/YRkxCj9gT+qegLIEDj7INh0GztEhg07TeiG5eNq5FZSfj2JlupGBfF1d6l9y41T4Y2jIaS6kdCBb36M3FNKe0ND7OVSpam3RVePX6gew9ZMW+7B9UfAZcEt1AHrnClAg3bIVWg9m5dB2JPGTMaYt84lcVkaGqfisDaK7jU/Qf3cdfeNxXTOgRgo/ibbHwrk9UvKXrCXdOYPCE/WRYpcxNRfZaCtnrWTFJDcnnq8m2K6CU9I7PCg6GgYYS+Xe8kD2U2OIas2rsUSlpkteeiwYRuL3DYnX1YipIY3zAnVAPlKEwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0DYjW3aEW6qI3UEKYhz2UlG0X4fZZP5SQ+MZbpTres=;
 b=G2T8STdBznJ9yVx41JhAtaKsLdFqwLlR2rvEJQrZ/DtPxo/Zre3qTlGF64Jp4a0QLicCSp4idHdO5MtLGeXm5U9T0rHMjvzynTaojzh2dEjJGAyB8cjOLLPxHnbRhx9BsGmc5OotR7YtR0S/d/3wobryQHwcOZmd5CceWWFduqTN6+6ph/0IFcj19PNm9rYVrrwrpfLrJ1mbrUwddoucALsU1rb/HFzw1a9OYSjFehOxVL6FYCUPgSfmBA6kAnQkSFb+U01XUozLl9fL5DHY2LSMA4sj9nLn91DxslQOKsJlSsznIAhOzi+RQWFJULxPXJbQJzFvYI6623GfHzeFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0DYjW3aEW6qI3UEKYhz2UlG0X4fZZP5SQ+MZbpTres=;
 b=W8Gd2XC+puY9Z0J1AslPZWV75LvJsjObqMRMoFAD53EP5h8E/am1KnddW2Tszgjyxaedr++iOxVpBvJBbCoBdFxu1EL797ehG+9byWWjBjrYbK2anEReoQB3Rz86LQqmFiEeoFP1HTESHWo8KRe29lOBxZTW5ziju5WAAaXo9cGd26gEvE5MYibENY1A7dmVcjWuC28rC6Hz2jAzqjvELCOx+B2JPOwBzuiWfQRKnNqNT/FP9l2kwuEX0GrTxVmKMY0klD1AqjEwcaGSdVUnYaYK90HTL2rGGDMzbBRZIbWXJneDX211WXK1VdL+kxYjYeXWX5s1VPrJakWkQZOLPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:30:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:30:45 +0000
Date: Thu, 5 Nov 2026 11:30:34 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: han.xu@nxp.com, miquel.raynal@bootlin.com, richard@nod.at,
	daniel.baluta@nxp.com, vigneshr@ti.com, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Message-ID: <auy9OtNE402TwdOi@SMW015318>
References: <20261105095935.159650-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105095935.159650-1-stefan.ghetu@nxp.com>
X-ClientProxiedBy: PH8PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b61c969-6247-46ad-5031-08df3b6285c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|261021123027099003|261021121427099003|261026121527099003|261102123227099003|10067099003|11063799006|261009223027099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	r8UpWrDJ3Xjy366IbYNnZO1DWE2HfgwbR8TSVc3wI4rBTH0ZbgZ5NK3Mza287YpemHQMgAhz1/cP5yzO+FPFyPuubcrkHXQVeqLazllcxYMFK4OEO7vzGD6u2gf/pD/a9u5jJASSxMtU9SepsrXpDP5i6853M+zZbykH0xxi5C3Rx82J1P31LzSXYZe5dsynui05TXTMWv1a5SbNR8TjdD12WUoRLFogDbQqWf2e16mErba2xSWQ1il/hNOCChgYtmvTr4agPxgrtbczqhY9c12J2C3l6k46s9D+VFj92YfYD4qiiQ9X7Ya7DvMklwYVE4bahhye7pA0IrIv79go1PiabRCLdNppb8chkbDILqXRH15Dvr83zCDdh49pgWAsLJ/KrgmXXk138NRjMotQIbduZXDUNR3e6ve6JKGS24fQQ0UVcnZvUApkMBqZftHJtlBEJztnGzUIr0aAAghOyaACuMPzhtGOkGMBNsinG3dO5wRHfpJNIEBwMEQTgMSzytH4sectaoSV5y9YMo4g0ZyKYlCKg9t+tR6wbgu1oeEgClZursZyaIhT9YjY3CpP/gPwP2hKEqlZYzALChJaGDjRS045XAsRu8ykashiFMKsrDIfLabWfA+swDrTt3iEl4afM38itfhOPPc0ul0vjgQte2/Kve2zjWFaldWMrQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(10067099003)(11063799006)(261009223027099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?42phwojDWZu3qNbnIY+xjc2qlOZdwTMnRSxkprioHw4PspiraDl6Ihe7n6by?=
 =?us-ascii?Q?teq0FUaQGCloaQ+XPxwwSO7KK+Gfapjo2gJZGS5spq0Kw7Y2GShxEc1jKrmz?=
 =?us-ascii?Q?SlkMa6DpPQi3dGoRQweLdmEqkwIAI6ZwOojbuAr43uYS0c2MbLj7BoNGlYq3?=
 =?us-ascii?Q?3yeAK08bLn+opCgpNxJZH5/34xrF1P8R0qIqbJgsypQkeKnommiJwKBe6sua?=
 =?us-ascii?Q?VDD6VkjEIFH70Lr6nXlBZfxi3tjWV9A06Szq1r/85SU3JwEnJfQewDgNKOmT?=
 =?us-ascii?Q?qJ2JRqrui0Ap2AlnIuXqrRS5RDg0M1orF/81Rg/u7S9zcNL3Nak9WVXe8mQr?=
 =?us-ascii?Q?nkHmK0HTbuUqdIDcyQM3R9lDYXdWadl6yRqt321r6SMYhSr6wbP/W2VNynbY?=
 =?us-ascii?Q?yGYdLB6GlPd7u06moxfmjD2doHKu2vSHUuJvHNSeod3qwRpkGiwVg3YC9cMv?=
 =?us-ascii?Q?7bUoS++WVnQ19GW6L63rEhQeiOTCoaX7lPYu/VXrCpZSLPdB4OWqnIsybw3N?=
 =?us-ascii?Q?b4+q0PXtpno1eLwtS3rYu0I8EnudpBJ+cpI3L+eY2Ifj6cpSo32gQ8BKHlJf?=
 =?us-ascii?Q?Orz4dzhp7tRQql772qbTuT4ndzrqMGm6mb9W+vYlEbp1cHzmHphvr42FTu9G?=
 =?us-ascii?Q?QaMXKNc6LihCeT7AJLwEjSaswjTp7NFxKVhfzhH3Lqbyhi8hwiQbANJeUWup?=
 =?us-ascii?Q?IP3TV8JqexzBqzo+q+UeBzTy+FFzVpMM44KvWijP7T9irK5pzAXnw7WUjT7c?=
 =?us-ascii?Q?3GYkIOg2vG7zcRwTPbb+j+R/vY2ua2hXBQqOeGproJB+h/PtufKpoBTrc3Qo?=
 =?us-ascii?Q?MrL1r5zCbGfX/9E4J27gb9Tet3fzyXcf8OaB68Nc/421ub96iZslct3mWfPV?=
 =?us-ascii?Q?PBuj+kLUC5OOTAbakja+WJmTupAEtzXHk2ozaiKF/hezIOzIBw0tpdAOzGsu?=
 =?us-ascii?Q?KUPJdIQ0Wt4+VBjdR6idYw3qpMciK93fxL2xrP9c03I/YXyvDMMtmdUkLOmW?=
 =?us-ascii?Q?ls/BZeoCOY4MSX9FNPHzF5c0JlJIQTujTyxPLztqtVUYVriArUvp0vquWUEV?=
 =?us-ascii?Q?bdfzsuXxtP9ngQEZLUcxNydxPfl8SXAFKF37uuCURX8q8svk3lkVykkehuaG?=
 =?us-ascii?Q?/Gnt6VPyZjS9hdErPGE9ZDsLcI3UKm9HZTqXUAYT99fQYDOlCzmzRu1EfyGN?=
 =?us-ascii?Q?3NxRIy9hCRg/f294V1kXkpgn3FOcy1kW3OXVtEp7cC/6cS4oODCls8wd1puI?=
 =?us-ascii?Q?+NbQsTjfYGXIN6BzDpkb3UKDcG4X/KRQAK/Ifnvfl58LNZ/0OUDsAOYWCjsh?=
 =?us-ascii?Q?Col+zOz4wnACqS7mU24JOfFwwCN/u/xInAWaLQaqf6P7K5vMU2UkLid16tlq?=
 =?us-ascii?Q?lfAATxYMljIB6GXYEWGQ4dLNmxaAUDWhXJG1SfLw+wcQE8hQ7GbpcBDMXvIv?=
 =?us-ascii?Q?S5I9jUC2uIYHNIY/ilUIfVzhzLqtcB+N0/hbU6FGZkDInZIbe/Ru6uA+icw/?=
 =?us-ascii?Q?j2M5PtHDUm5/9ix4+AiY64N9IS8xPdmSuqJONyJcwXbcZ0VdOCsCjK2Hsj36?=
 =?us-ascii?Q?XxdgrMwLQ9GfOIyNbwv006Yc47D3g0vUq0YU4idOMJ72EUKTFsm/12WM+c1J?=
 =?us-ascii?Q?HlxaHGpaBbyDVYUPLGltCXVMPj7nbe97yBym4NIfOsE9o+w+oZZKql/wCPmC?=
 =?us-ascii?Q?gP3VOOrKcMTvWsmEpeGKlhjCzKM9m2ds8+tcHQb3UwHx55QublQGNvs0ZCEc?=
 =?us-ascii?Q?ObYJpHGjHkYQQ0JblOMTy/76wuaAMt4l1ku5tQJUT3J9SDgnX9Q2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b61c969-6247-46ad-5031-08df3b6285c3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:30:44.9791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlFuL6SJA1jz03M2JuVLQnq8AOq/YDo1AbGfihh1b8T3iK4Af44/2w62K+wN+jfPlQc+vvvyrnL2Am2QgThese9B2gEbJth4OQlSPSXZqLk4Y81FkIVWUGQwiiSKw0q4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786

On Thu, Nov 05, 2026 at 11:59:35AM +0200, Stefan Ghetu wrote:
>
> From: Han Xu <han.xu@nxp.com>
>
> Cast block to loff_t before shifting, so that the shift is done in
> 64-bit arithmetic and the potential integer overflow is avoided.
> Reported by Coverity.
>
> Fixes: 10a2bcae9926 ("mtd: add the common code for GPMI-NAND controller driver")
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 0f1528710a6a..e21e407f86c0 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2236,7 +2236,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
>                  */
>                 chipnr = block >> (chip->chip_shift - chip->phys_erase_shift);
>                 page = block << (chip->phys_erase_shift - chip->page_shift);
> -               byte = block <<  chip->phys_erase_shift;
> +               byte = (loff_t)block <<  chip->phys_erase_shift;
>
>                 /* Send the command to read the conventional block mark. */
>                 nand_select_target(chip, chipnr);
> --
> 2.34.1
>
>
