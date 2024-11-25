Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63038192D6C
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555360; cv=fail; b=UP8+fiVgJ8EIyTY3EyohDuJGNjZXqc6jDcnEk8lS4d6B9fZJnMEixjXo7itvv55FbMoEsjD790gNtTeAkWooH1qeHLNAxNwrnXukVmPv6O0Qeo7hypdefx+gqiQjku5VNC3qhFUOgVF50jtmIsIMH9+NnesqXGgmuKr0C6MSx1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555360; c=relaxed/simple;
	bh=eKsTUjIidsFG6m+Whig7mbFSPveGzAl2to1U2AHUYE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B58Zdg/och89Bwu603095Xu9i0gLttY/HXSnIZnrFl9mpTiY/XhFE/WHT1XO5MPZ8E+dSGJzgrDxuf6+jM9ii+ZNG6xELVP/+gV4Essw+qROkLW7N8Ul9+aFFMUA6B9FQUmUGOvicgmt9HqDwuK+bTI9T45+VllT4AFXwxfiNDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NKGPMwyj; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NKGPMwyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsxEN7OZXB6KAulsSwSaiF45/8ZQfobz6v6EZ5jQVC+m8V+O2xjUDbMjxZ7CEC00wrtOMEM9djw5qDrTOA8W+KzH/YBhuzl/pGyZcY53ExvZwA7xX+nSN+MH9N1+yl3rZJpAfSmgws0m4y75MpQoSI24DN6ei+kMOu+iUkjaMvhzhQ5JbQSn8H3WAr3iOTIWfM4hOdPVq47PNLTwTV+vBgTvWmRYk+Ksm4RdHhOcD6CpXps6codm5x/NZA2tJY9v2zOxPh0EyDTp4IKecPxyKIwGnyQxS/0fYBhNX5NFIIhakzXbN2V3a5LvYXAhiXdviCk19DcSCQBuwY/qyOs3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ0FBk+FzIRIxVHIJQrHa9tieahZBfXMgjqMgl+MIk4=;
 b=uzreioCpkECde/uLZOsxH6J2p5PDCiD7Atuv5ORaDgfhbkp3c1NXsLoyBAYqti8RmiM6mq0lGFcp5d1HZzjAzVoI9LfPglKw4cp5vb4yYzWScuKLgsIGW/BVcNxcC29meegLPh6wV44fjcR3C6FvdYYDT2uNPTBwVgYYNW9UCC2wfxIHIuE7l7Ej7EKmSLB0DoYENXobsFF9EMGoAvf1rkkLS2r8D6QCIneqfYELfE/kXax/h5M+swLIDlMtdZYGFTX+/KqYfAd/cpB9rbrDG/POh0NUhpNt7nVBEP9ukGZs8VGNDkyzzs1Sdy7mtMYLDviV5yOaq6bTSQp46yDSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ0FBk+FzIRIxVHIJQrHa9tieahZBfXMgjqMgl+MIk4=;
 b=NKGPMwyjPEOn16HK1/0iyV27nIZLTkX5Pys6EnILD+xTQ3HzPnuAxMDMsoS5zkdF+f1igXAWFIB/GVZ846QkoKvRjP54FIgODRy8ZTAhOS/jQbkcbVhEmJ3a/mYRJpvCXxwekeN7Ry+j2bjfu73rPeZviUuZvN19zBs1sLafyFYkOLa6I2FAcA6Ww5vmRT+D/jmiIkwPj6UAmqvAM6t79tJ/hlURV/3RCiOdyGS0lR5PiXNjPFfcFSTTgbTpV3L3gnMgZxXlprcyuctrL3HPjyt9HYAC2oyBNtXNKOXLunU76/mnfU3I2B9QmqWQSM0xlYli1tumo3wHoOBcuvloPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 17:22:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:22:35 +0000
Date: Mon, 25 Nov 2024 12:22:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: will@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <Z0SyVDVdYKiOGDig@lizhi-Precision-Tower-5810>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125104338.2433339-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: YQBPR01CA0157.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 301e11c8-5b1a-4300-1a5d-08dd0d75c078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r5HWEVC7i+Lvo1mDqP4Vbrhk2PhWQreMHnKKJBlJrQM9DeHY0ZooDdO0VWQf?=
 =?us-ascii?Q?0OA9CEJP+lsaEfSJIeZTxmJwcylYcBcG1d56IJHzh67Pjh09aigaCx7VdgNV?=
 =?us-ascii?Q?wXx2wiPhVP/e6u7zShB2g5AUhjB5or05cDfCpoz3zfvXuLaqHvTBTHYNBz48?=
 =?us-ascii?Q?BT6ZXQXTjBLvtA5rVQukMmLSpLebZLo8J9EKehXxfaw2YsXMehGsUzN8Li16?=
 =?us-ascii?Q?O3n+30Vd1enrw8qCz+wBtMBn6jQzVAoinJkHkIS8PJIpUXhz6an7SR+Pl1Fp?=
 =?us-ascii?Q?ClCVQ3j/ldT36qCXCNzMonGZfy8uMKwzJlEeg4Q6vnjc4I+zPdYMlY5GBYDt?=
 =?us-ascii?Q?vlX2IBBURvg4629G9+AR+14+NxfoI+R7HPKOLVSNqcHGyQ1VfoZpYAd41kCg?=
 =?us-ascii?Q?uR/PccSXOAmDw7uc27SVhSc1q4lq/xYlISxFnoNaRDttqvWIng8krPkjVFnn?=
 =?us-ascii?Q?E2KVNN+TcrQo7LQdKC400LCSKYbNPe0/vMjp0KoG7vFEFeuL2r5TLSBrlxOm?=
 =?us-ascii?Q?gcCZMIIlI4Q8SucvkRXURd/MVkKjspnr0aj8NbLFuIisrpOfvk/tBWbbkD4b?=
 =?us-ascii?Q?CPa6i2SXKaD/UnJbUtCXYBLqu4mtbdx2L3PunSNik/VR8oGyn8cXQCxTPuyZ?=
 =?us-ascii?Q?Ugz/zrDQoIb8bNY1hTldOnLs+DYXcDopLeWCYKHys/YuSGwLAuJgHLiU+cCX?=
 =?us-ascii?Q?U1VXFhuS1J0At5/y5929R2SQnPStF2nYkdIGm81+oRkycstl+GJGgOVlfhl7?=
 =?us-ascii?Q?en5FO+jTwybej7LYta0bp1Jc0QwAT/SLF49kDIh5fiBIPtpxAEis3ls5zBTH?=
 =?us-ascii?Q?yn1o9qsEZfeuCgn/rNJSUfieCtrWqg4/xfCuz412k9FaPNJDs4sC1TMJp+Oy?=
 =?us-ascii?Q?hU/j/aeG5V9aeUQFsL1OrBJ/nItxQEVHAmRAoVmHMpHrCIFZNvWFyFT5fDHF?=
 =?us-ascii?Q?M2xqDnM67S1xXV5IvgYT8fMABfumroo1/BnPM+322i5rINPayjnAeTp7R7VT?=
 =?us-ascii?Q?09rZdYYPpis4qqhqDc/PdE7WvVqUKo9Mjc0At7TqMkm3cxEPfRXME6LW8yJX?=
 =?us-ascii?Q?+WrLbcdXXPFplcdTlRGUlcg7nGX3dho5U/rotCYM50nIQhaE/dGeOVqdG9U2?=
 =?us-ascii?Q?5qmOpdP9bk7RThAC7bKUt78E+901jQKlTVEuq+O0u9cTikCFECTCuVLPpmgl?=
 =?us-ascii?Q?W17oKTsOhyO7QSly/Dq2yHquxsEI8rRhmFen6b7ji9wYLC8YNzigZNZITDn1?=
 =?us-ascii?Q?lNVyKvoeGWe1JlZA12s8B62pgdzPiYtDU8wRUD6sDuIxjYFBl5s+En0Yj1Ef?=
 =?us-ascii?Q?3tcsJlaF5OXf0adGV7kiA1UXse2H4CwLxU5B/Nq2TaTvBF7sJStxpQtrA0BI?=
 =?us-ascii?Q?pm1c6PZl78kllI+Z1SRWUqp8zpnIO00zG35iRuOngl9rg+GXkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hzAP8MuFeSN6VXwLuINbh32+QTQWRY+k7KOiymBd9dFiKQbY+tu5i9h+ITay?=
 =?us-ascii?Q?40e/bqTbnZ+NYjNCpCgsJWPMe0xa2Jt93gzTO4jN8NzBWZGXqgai9/P8YLqr?=
 =?us-ascii?Q?XS0Toc9j1dXmclDxy66f5i+4uHzMeFVovg4aD8oPKGe/f0gC0MdFmuOpNCLI?=
 =?us-ascii?Q?3C97PIC/r1UY7B93ombZbT3eD4/Penz2DJp190MhzaqlLLKnjX/yEbwmS93w?=
 =?us-ascii?Q?kSCv0uewRLw69hIuBMWkVKULQYX0DuRYilrINa+NP9GIzF9s861T0OS0Zu1L?=
 =?us-ascii?Q?uzBjOzwea84Z+oUwtma63uieu5oXbrA9I9M2CgYGoC7vLdnbtCU64Y/NcUI2?=
 =?us-ascii?Q?/h2iHRtwl4IjQwqUh5Lji24OR8A5f+dqqhJZzEUQPq21yHYSwWErkJnhc1Gk?=
 =?us-ascii?Q?0DxhR5jrY108/MjRvJYITeq42aNmG3lAGVpDiQhCezfnFU+mnZoSL4K4AK3p?=
 =?us-ascii?Q?L2iMDxhWc59XflCluETufFrwA3353NzrWW0xNJKDbYCuDLMJQAwKGYU+V190?=
 =?us-ascii?Q?9QlExpefvCuuOB7f+TDI+1fPi/gpHRFMad9s66+QTRCd8LBnc1xkJIXgKODs?=
 =?us-ascii?Q?PYTWZUvSOlnv6XJGmiasNO2YcUQtDFhiPGkvV8ifE7wwDiFZjIlSjbQEcV85?=
 =?us-ascii?Q?uuzZoBUZAWl8NlvZ6mgG4B7pMvozTAHRoo+niBX3KocQvhHCirST0eSVTAOJ?=
 =?us-ascii?Q?+zVuY79Z5jc2fHhNizb1ip8DVj4MgTeyZq/nqbYq56+MzsGSJKtVc/FQdSKf?=
 =?us-ascii?Q?qhmYcIDSDXIqAQ0a+vN4gA8UJwcop998O+ud9Nv9mfOda84BPInD2lcDEvJ3?=
 =?us-ascii?Q?+nbKFs4R3RvNphEBnnEiAmJzkkblZP7iZiq415IDOlpUt28UFoTLgS2qPMMd?=
 =?us-ascii?Q?7CEIivk5bRodP4CS3bFeINy98RoDuplyvB+Sx8TS7xakNLwPpDmjRB/JA27O?=
 =?us-ascii?Q?BlnpwzxoXWm25qcrYCb9kljM6gihHgguRDZlNPPeCJvRmNPdKh3xuO14WJ3N?=
 =?us-ascii?Q?g+0JgrCLohg98Sv89h7rKTCf0Q6dqR7Cih9xrkM3CR1YCCrCaTHW2Q3OCIW+?=
 =?us-ascii?Q?/Sg9tYnc5Q3D4duDXuWP+4qs2xaKDIcsX/wsXz5/Z0q3S257c3QQE/h6wXj7?=
 =?us-ascii?Q?YJ37Y9RqIZMt8yI9By9ZKcczCQRy9A7zAZlUF7AIOjxS5/fPTyx+IpiOGqTy?=
 =?us-ascii?Q?Cxd6gUcBuKCHxRHVnDrrZ/KO7DtAHcII84anF48jBtY7v01f+1OlneK+6MzC?=
 =?us-ascii?Q?Byq2KLMCsZW0j+Myn0tkz4TP6QcP7MMXv3a38RxxhncDEciYN8b0OoPKhobs?=
 =?us-ascii?Q?QT2kajThSdErq59k6whVxBIY4gSPOVGk5jTKAAEwYWa5zg7DPdVNlGy2fcX/?=
 =?us-ascii?Q?XYnbtmsXMjAVnnyJYye7pVeCdBejC7w86bSsxqhs+UOXd/Z9tmqn4CK4rwG2?=
 =?us-ascii?Q?aAu/K4jRFmNSShYn4Zrmwh1NpHTwCaUq6UfuU3omqz8Yh0HIOmkR6VoIIR7g?=
 =?us-ascii?Q?74+Kuu/9YmS4XVhgftObR0Dn4TO8Bb+lnKlMoNQfFa7sFLD89M2lVdf+w+2C?=
 =?us-ascii?Q?nZqQcO1ZUE1aLzDpseck5sD2HuUMeTOkUb5JutME?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301e11c8-5b1a-4300-1a5d-08dd0d75c078
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:22:34.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPP0xMAZiwMBLx7R7IIsxvBe0Cctkk7C2xLoffXMOif4KTczXN6/ODXjfrRkGEonoIPwXH3zRUWw81I+Zr6T0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> The imx93 is the first supported DDR PMU that supports read transaction,
> write transaction and read beats events which corresponding respecitively
> to counter 2, 3 and 4.
>
> However, transaction-based AXI match has low accuracy when get total bits
> compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> So axi filter is not used widely on imx93. This could be regards as AXI
> filter version 1.
>
> To improve the AXI filter capability, imx95 supports 1 read beats and 3
> write beats event which corresponding respecitively to counter 2-5. imx95
> also detailed AXI_ID allocation so that most of the master could be count
> individually. This could be regards as AXI filter version 2.
>
> This will introduce AXI filter version to refactor the driver and support
> better extension, such as coming imx943.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v2:
>  - modify subject
>  - add comments for AXI_FILTER version
>  - type -> filter_ver
> ---
>  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
> index 3c856d9a4e97..e2c2c674b6d2 100644
> --- a/drivers/perf/fsl_imx9_ddr_perf.c
> +++ b/drivers/perf/fsl_imx9_ddr_perf.c
> @@ -63,8 +63,21 @@
>
>  static DEFINE_IDA(ddr_ida);
>
> +/*
> + * V1 support 1 read transaction, 1 write transaction and 1 read beats
> + * event which corresponding respecitively to counter 2, 3 and 4.
> + */
> +#define DDR_PERF_AXI_FILTER_V1		0x1
> +
> +/*
> + * V2 support 1 read beats and 3 write beats events which corresponding
> + * respecitively to counter 2-5.
> + */
> +#define DDR_PERF_AXI_FILTER_V2		0x2
> +
>  struct imx_ddr_devtype_data {
>  	const char *identifier;		/* system PMU identifier for userspace */
> +	unsigned int filter_ver;	/* AXI filter version */
>  };
>
>  struct ddr_pmu {
> @@ -83,24 +96,27 @@ struct ddr_pmu {
>
>  static const struct imx_ddr_devtype_data imx91_devtype_data = {
>  	.identifier = "imx91",
> +	.filter_ver = DDR_PERF_AXI_FILTER_V1
>  };
>
>  static const struct imx_ddr_devtype_data imx93_devtype_data = {
>  	.identifier = "imx93",
> +	.filter_ver = DDR_PERF_AXI_FILTER_V1
>  };
>
>  static const struct imx_ddr_devtype_data imx95_devtype_data = {
>  	.identifier = "imx95",
> +	.filter_ver = DDR_PERF_AXI_FILTER_V2
>  };
>
> -static inline bool is_imx93(struct ddr_pmu *pmu)
> +static inline bool axi_filter_v1(struct ddr_pmu *pmu)
>  {
> -	return pmu->devtype_data == &imx93_devtype_data;
> +	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V1;
>  }
>
> -static inline bool is_imx95(struct ddr_pmu *pmu)
> +static inline bool axi_filter_v2(struct ddr_pmu *pmu)
>  {
> -	return pmu->devtype_data == &imx95_devtype_data;
> +	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V2;
>  }
>
>  static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
> @@ -155,7 +171,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
>  struct imx9_pmu_events_attr {
>  	struct device_attribute attr;
>  	u64 id;
> -	const void *devtype_data;
> +	const struct imx_ddr_devtype_data *devtype_data;
>  };
>
>  static ssize_t ddr_pmu_event_show(struct device *dev,
> @@ -307,7 +323,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
>  	if (!eattr->devtype_data)
>  		return attr->mode;
>
> -	if (eattr->devtype_data != ddr_pmu->devtype_data)
> +	if ((eattr->devtype_data != ddr_pmu->devtype_data) &&
> +		(eattr->devtype_data->filter_ver != ddr_pmu->devtype_data->filter_ver))
>  		return 0;
>
>  	return attr->mode;
> @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
>  	hwc->idx = counter;
>  	hwc->state |= PERF_HES_STOPPED;
>
> -	if (is_imx93(pmu))
> +	if (axi_filter_v1(pmu))
>  		/* read trans, write trans, read beat */
>  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
>
> -	if (is_imx95(pmu))
> +	if (axi_filter_v2(pmu))
>  		/* write beat, read beat2, read beat1, read beat */
>  		imx95_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
>
> --
> 2.34.1
>
