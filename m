Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F671552E4
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732120525; cv=fail; b=eIrrBOeR6MV4mT4PrgsO+W7yDdFa3F/fXk8MGN3w5Q9sJwFAaD8B2dHBpjQxEUg3hAZmoK+Syo2MsqRm8S9WSUa61JUqs4u+Opm+45/PXaC5z5q3aoucPrLJpYObcxxInvlIreHzXAwRnqZfjJJvMXW7cSYfg/vts3EHRD6xesM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732120525; c=relaxed/simple;
	bh=xwdypS+pNF0dNPzsHfGkh79fyHwOXrdDAHDnGR+b0Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PjtpdPntcaJIsfkTZKHvkyoJsw4LP8XK008BRRuqojEmV9pFtrIQzUKrY3VMkkhj6GM8p6Vr2IBV6979NKquQ/vOw/aSuwZzwZwxaiy5EFHDKtk+p3KFinsk0u2hFM5A79Ig0Dkbs6eS00Kao3WhxJ3YdcYFVvrr1mPBNMYcFuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iyT23AtW; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iyT23AtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFPF4Cv8W4vJS0vNg2B9F+vFDDBiCeD7qbp5ZK6XQiyiRnvukmvTsADVjXc3R91GQdTeIEfZp7M2+oqJV00uwYhPzhiG4/dlfOK06KbiCMDdoTFXZgqRQ5kSR/MuWwsJMf+CRdnabGl0EUVGRcjplWcTgHmTBxLHK/xuDwE7spwI0n+9n9F8pzKm4wtyq6GM+8p0HO9gPsiSrePHT7FWmMcIkLw1Z2QDaPWrXHF76AbzyxipsU7cnPpTAHLYvhAkuDePqHcgVNG3cLxh3SLldQIpGp7Z99BvCpM45D0jKSQZ7O3RHTe9dh6pFMGXbnNWnu59WVNBQ1ERg4wCi21AJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQntTKwUtOPAB6DhcVwNtZ+5//TkY+h5F5WU5U8MxUI=;
 b=Qqz0FgMtJBQNbqf81fk3zBToLJS0DtHn97mZuCIwj4oIvO+8Ivz6VG/C8gb5Mh1v73EvWnjnKjQUPolXo8a4EtXytQl+sNe/dzHtLbdiIFlfHvzGMSNd1maK1PekGPj90iLy5amsFVZVXDAokFNn3mepKyWY01QyZtQiPImuI1PmWV9sQyUnmyjBEqQZkItlVkOL5yNQuXqU3JDirjuNgpJ2+2jiJi8ofWDLXxdkqygU64fGWgXdeSYcZHZb4isL6lboUfhWYnHp6G/jVTyf1V6odWYYyN8lzX7rVlNo34pNs0TSQ3FW5iQA67cphQ67mYsNMpuqNQljYjl2FSZSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQntTKwUtOPAB6DhcVwNtZ+5//TkY+h5F5WU5U8MxUI=;
 b=iyT23AtWEGZsV+ozzEjUGRDwzSiRBPI99JQx8gm25CqcfDb08DpiQBX078sdkBNpQ7yB7aRRvCD7iRtN1CLHW307vvP7PsTiYbtqF2b8spxVCPXeavLn/eNWGxHONWMM66qOkNkuq2EE2KNly7F8mOzyiljI/f9TVphYJ4LiMKkGYAcHm5RHAR6zQqCajMe9inmV23tzr/8b5zFQjxp8BDnYH36nP4ERjHimb122ao072y/VEIlQuuIyjFP6WaJSXuhz7XWvt7p1t9EAe4VRKzxPeEAC7jufvD0AHb6bacuHgzIUB2J20+KEGeF9NHVI+gKQa2LWGMBx5SDX5DM7Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 16:35:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 16:35:17 +0000
Date: Wed, 20 Nov 2024 11:35:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: will@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] perf: imx9_perf: introduce axi filter version
Message-ID: <Zz4PvoCj0ziNzU3w@lizhi-Precision-Tower-5810>
References: <20241120032109.1163146-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120032109.1163146-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: eb68a519-be5d-4f75-e19b-08dd0981515e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bd0hYePi56NNoWwplaD2z8AtvsVhghvEoLFYui+5QXzUcS0Xo0MwqfkiHVJM?=
 =?us-ascii?Q?FwSyGa/4Bo6w8qilN5eDiGkhyKX62w/2mjZoy6od/Ya3FJg+58Wlxvoy2Bib?=
 =?us-ascii?Q?CDDgZiy4wEi87Zll8fUxPhkKsFsZdj0tMVqDO2WEszRrgFQtZExPMukMjUNv?=
 =?us-ascii?Q?eiushQmWc2ejl4CHK7XyNG52a5XvLo1+X3ynOiuSs9uUsBNlfHWtab5KDPtq?=
 =?us-ascii?Q?Y/6Eu1MJq6o96/3DOBM1QhCCl0NiG54UdxOlfYal4p6OnksCVFZis32Tao/f?=
 =?us-ascii?Q?xUvtjk7O79ggqdemBqLmYWTghoQexu8vvzSfXWnuu0XXlsIYg3jjnQD23HFK?=
 =?us-ascii?Q?Xw5f8XtqvcFDV0wFFtwi3HjJxMNhAGF1MEOkoVXrAiKZGL4QbRX6uEApMted?=
 =?us-ascii?Q?WkTJVQLNqNdJaAZphtmB0z/dktiLg9BsFD24YJMk7lXYWkwi8ayUuycLjJNh?=
 =?us-ascii?Q?f2CuJQMEW06LrpFS9dKz8nCxlP5YjBEUfQY8oyRwKcLe6DXAKi/4mX+6Vh6x?=
 =?us-ascii?Q?QwhvlDr2X8UsN14I+zr5J6op7fWw2k5UF04W8xYrMFzE8F0S+s6yopLBiL4T?=
 =?us-ascii?Q?YkP4pK6KrZMFOhgky/1/nXm93ZUmE0zGtKkL7XvfUQSfrxG/HN+8NEq0oRlw?=
 =?us-ascii?Q?I6ywIDAAS+TY3pomte2d6cw124QxcqvFqvAbK3hBU1xKpFEn+fWzT0QHDNaa?=
 =?us-ascii?Q?4NmHvyp0XuD/oNruH7n7re5WoSD+JsG5hXTfa/WydGTuB8zlLS6G5Jit4LCQ?=
 =?us-ascii?Q?qrJAzlZBYn3reJFdKVsj5b9OsUR0atGA+N8VaWjT3Yf9BS2uGcZ298vFZHZb?=
 =?us-ascii?Q?svXDeylHPSgELHgOGz463VDAsCXOvutp1vo/hy4smmSy04jJDKAdUEo5UFrJ?=
 =?us-ascii?Q?Eg+NXmnfwUo//skDGY9nchUAc0n3BFMJG4Csr+V5DbxUw7u9jcgn9qgw9dvO?=
 =?us-ascii?Q?/suVQxARfuJtj+CYn/JpBI4xbuvIfq0p4s/2+0j6kLAlXE5qaVmkAoHEGBm+?=
 =?us-ascii?Q?AKaylibNMctFmsk40kgxfU/5L0JPoDb9y2HktLzWeLP0sMzJZuuWYwO8wXY5?=
 =?us-ascii?Q?Xv6b//5+cNZaGre1qSE9jGXJcMdQQgO0sfy0RIO3gyfBKU18UtCDVcxpZstX?=
 =?us-ascii?Q?ut/SRHFZR3fPsEsq+YIN0XG+I4moKiUK32EKT9QyNHDCVzr2EbxPn7R/wec2?=
 =?us-ascii?Q?bIao1bwq4zCazQLpg1uqDg7rzQLqjDPtxQkdCdLi7dHmiF7JxU9KGl4cn1RP?=
 =?us-ascii?Q?OAmNCIvJ8dDC6pKJt5ec1NBM6JQ2tlrpDrfGhW40AY8BojOSSViZaQTjrv9K?=
 =?us-ascii?Q?jm1lUTNg75MckH3fvc9EhoYqkeI9KSQMlA14leOx4ROOV/LLXIex0hVQPuSt?=
 =?us-ascii?Q?oL7vdVU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MERZUGx2BQ0yEbpuuD89LJfoN2cn+w3gfZYp8gmu1qcyovjMsSfEljrDKPO5?=
 =?us-ascii?Q?QmE0kv+0l8HDjuS3TiqKaS5qzFbzLH83uabCocloWebQI+PSvvO1zsBbtVx9?=
 =?us-ascii?Q?tKH2i9/Ytr7diCx1pjr4M/u9GYXRBnmNwcnaehavbhH22FTz5Q2HvsAlQscH?=
 =?us-ascii?Q?haZmNTzZFKyaArA+cf0VIGADF6TeH5HLwlMbUNVDa2qL8RCVFZGnIUjSBKC1?=
 =?us-ascii?Q?198Hg9jnVl+zqgTvGuTtDCF1SdCiH+Um9UfRHpbSGrWM9LnXTTjiQH9ldSwG?=
 =?us-ascii?Q?MclWah2O1dvH9LVTfr1iPVJeWu2rAxrQRO5/3AcGqTV7cTIz6sYyR/v7UIfG?=
 =?us-ascii?Q?aLr/9/v0EbEF2R8YxNjBFLVY6AwjW+ImSvW2LKANduDm9FqdDpHinqSXTEiA?=
 =?us-ascii?Q?RwmBxItVVFWDXhqwLj0RVWp/YRxSaBG+nQgN3jN+K15aXdgxdYnWHtbkrXtU?=
 =?us-ascii?Q?5RKarIlt0sWs8Z5Us3pRRey9azfmvABXDIOJxQqdncdoHcxDE/XrfCCBRB3i?=
 =?us-ascii?Q?YAPmzXIs5RF2HX5TyPvb0Os+TICmXync5eb0m+RWPVlLtegSF9DIrbGVAntQ?=
 =?us-ascii?Q?9b2d/8c0sNOY0Rs7moIwwoWS3m1HPFrp2DxnzPgeV4gugfo1vmiGRj5YDh9O?=
 =?us-ascii?Q?iGs4FpDlA6I/JfD/yoPkDgYFDPb0YetDuaOT4d6jLVFseX/k/05dmq+lRu+3?=
 =?us-ascii?Q?Re7nKsFlw8ZaSPmt+XcDemamrjQDyau+A8a6bo4t8yCQjspVjHKnypcIPlzI?=
 =?us-ascii?Q?+FfPXCNrkXjXQrlXJBerYOVZUaxvkjH7d/i7N1gRWB29PBbhZx/mE69cLerY?=
 =?us-ascii?Q?TSyJMPH3dhyvyZEr2Ulcl45ampTO7Dz9Jtqh11Z3mARr3joIvHHPaAINXpKw?=
 =?us-ascii?Q?cakCp2WuwVSNNkYUN+x+T6FAn+yCyxIMiGjMLakJwkGKuq6P4L0+D4KZKWBy?=
 =?us-ascii?Q?tvRHvR7GyUR5ytm05luZA6cxTDneNEfbbdyLhyy1hw0bbw2e6bgcILR+yJ3n?=
 =?us-ascii?Q?q+5O1K+Zg2zJgBY/fil+Qn+80qfRqzkU0Kz+hB5ughkWR/xg2Tx21AMpkWbV?=
 =?us-ascii?Q?uva0jEGtb5KQ+6yZHhldST1xIFr/ws+zXxaUp+jNvwmAb+P0Jsib3HuBufGM?=
 =?us-ascii?Q?SbtKcpG2its9Ig9s/Bo4PYzWqWRXyrMd/nomRKpLXbGP2VULLs3Oyb5lO1b9?=
 =?us-ascii?Q?4eHM2tksfrLdNVV/vcrSrx7Ke85MdKGHXjMn5JL5Jlej0ysLTl/rIyopDpaL?=
 =?us-ascii?Q?y2Ll2MMvgNzKQfNcajhYdhRi2cB8bzjuF8oCi08Y6tuNsZFiwQlXRX/aQUmp?=
 =?us-ascii?Q?jBq/OQ040UF67MjECLt3PIOut6vbkaU9Zdu8wPmmcqtlrKKHWFNAIfwFAGLq?=
 =?us-ascii?Q?Z1lGW+LEtSG6jh50d2/lGQ5vGm+39cwY195bv57nS5IVlY+i62hMVNPUhWyE?=
 =?us-ascii?Q?8TlqCqQW/Lx67UUsX8aE/4t45XNqMyE2sgMCPoxjxFL1zRhkbviKqSJK/Opo?=
 =?us-ascii?Q?F2ryXFt1SxUXZmIhMUcKSbGTBgTRl5UhpMVKXlhzdDPiwu+2ADMJKH1WW8Ld?=
 =?us-ascii?Q?q+W8mhYsk/Roq9kdFdI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb68a519-be5d-4f75-e19b-08dd0981515e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 16:35:17.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmvUqPk6Gr8IgzOqm8npOT18Dvp+Iph2h3UXZz2nW9LzURH08bXh+096PIls0Qd7+o+DxUa0jxhsEYYh4QQXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628

On Wed, Nov 20, 2024 at 11:21:09AM +0800, Xu Yang wrote:
> The imx93 is the first supported DDR PMU that supports read transaction,
> write transaction and read beats events which corresponding respecitively
> to counter 2, 3 and 4.

Introduce AXI filter version to refactor the driver and better extension.

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

Such informaiton is not related with your this change. I suggest put it
to comment for DDR_PERF_AXI_FILTER_V1 and DDR_PERF_AXI_FILTER_V2.

>
> This will introduce AXI filter version to refactor the driver and support
> better extension, such as coming imx943.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/perf/fsl_imx9_ddr_perf.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
> index 3c856d9a4e97..965345d78f7a 100644
> --- a/drivers/perf/fsl_imx9_ddr_perf.c
> +++ b/drivers/perf/fsl_imx9_ddr_perf.c
> @@ -63,8 +63,12 @@
>
>  static DEFINE_IDA(ddr_ida);
>
> +#define DDR_PERF_AXI_FILTER_V1          0x1
> +#define DDR_PERF_AXI_FILTER_V2          0x2

V1 V2 is quite difficult to know the difference. Please add comments to
show the more detail about V1 and V2, you can resue from commit message.

> +
>  struct imx_ddr_devtype_data {
>  	const char *identifier;		/* system PMU identifier for userspace */
> +	unsigned int type;		/* AXI filter version */

variable name is better match function
	"filter_ver"

>  };
>
>  struct ddr_pmu {
> @@ -83,24 +87,27 @@ struct ddr_pmu {
>
>  static const struct imx_ddr_devtype_data imx91_devtype_data = {
>  	.identifier = "imx91",
> +	.type = DDR_PERF_AXI_FILTER_V1
>  };
>
>  static const struct imx_ddr_devtype_data imx93_devtype_data = {
>  	.identifier = "imx93",
> +	.type = DDR_PERF_AXI_FILTER_V1
>  };
>
>  static const struct imx_ddr_devtype_data imx95_devtype_data = {
>  	.identifier = "imx95",
> +	.type = DDR_PERF_AXI_FILTER_V2
>  };
>
> -static inline bool is_imx93(struct ddr_pmu *pmu)
> +static inline bool axi_filter_v1(struct ddr_pmu *pmu)
>  {
> -	return pmu->devtype_data == &imx93_devtype_data;
> +	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V1;
>  }
>
> -static inline bool is_imx95(struct ddr_pmu *pmu)
> +static inline bool axi_filter_v2(struct ddr_pmu *pmu)
>  {
> -	return pmu->devtype_data == &imx95_devtype_data;
> +	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V2;
>  }
>
>  static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
> @@ -155,7 +162,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
>  struct imx9_pmu_events_attr {
>  	struct device_attribute attr;
>  	u64 id;
> -	const void *devtype_data;
> +	const struct imx_ddr_devtype_data *devtype_data;
>  };
>
>  static ssize_t ddr_pmu_event_show(struct device *dev,
> @@ -307,7 +314,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
>  	if (!eattr->devtype_data)
>  		return attr->mode;
>
> -	if (eattr->devtype_data != ddr_pmu->devtype_data)
> +	if ((eattr->devtype_data != ddr_pmu->devtype_data) &&
> +		(eattr->devtype_data->type != ddr_pmu->devtype_data->type))
>  		return 0;
>
>  	return attr->mode;
> @@ -624,11 +632,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
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
