Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB02EDD69
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516854; cv=fail; b=CNj7ir6gxvZI4c1bju7FZr4kgU9MPzH2EhLWwydx/tIkoa5udTeHX1DRKRV/o/tb7EztyYEvLnqDZMk19aMkQCOz+hlBTeuyZcS+J1AxmZCBwg2pn6e/WziPT1Qtcffb3ppyJBZigbA+qtCCe0ibQ5WSWGYTGfzAcJ8asdwOVvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516854; c=relaxed/simple;
	bh=a4dOfB1WWgcdKSv6CcF8xs22WZQxriOtcL4MvD39Z7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZ8FaPrGOt9TaoxVUVw7CDD4NJcdAjzdItN5rJUDRby7YIF2iIiBA2Xx1F3RM8i8h8OlFi5qYamm0ahNip34PJbDb4QH8Jt75Dus052Nuptth1GTo86mBSnFPkW3V6Tbs6cphUghLtVAOIYjYOaBVL9qyex6wPvb+Ygvp8d2ZHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y7/DHmeT; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y7/DHmeT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noN9A4mN0WzWLFEvqWojEyuGlXhJ2JV85SvNsTizS7RKfXNntU4nmVtAYpgpLTzQsOdIhdnkEgWTEfpwruX4lfe7JVDsUBjsU96PWcWgEd16JOsDPHTM+H/AyGMNrtiUUrvTqGNkAz0GNMHgfexKdXrqn9DzIwSgG4gV+ofJbfS0+XEmxulm6ieue8kmBygHmNGU3O6Oo+zgC+47OqauOb225DzPIBsknfjnUR47S4Y4yhUrFfQryxV91rERIoFiy6GjpvCr0tNk6k8pUUSaf4c6brXKsSOGtUqymKQTDmS4LRu7Zx7M6PZI94uUwLSZahLK3jcnhqGy4+fBPfLHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDPDme4CasIMSK8VR2NeqNmVv2wzfzBy2f1sMZAv6Eo=;
 b=GWLFi9KPBRgRWKqRTD81teuPIRCWMuW7SB3XLKQK/jEFIcnZwqSMOCxusJftAWZC7QesxMYfXIMQnaTknMkX2dYlTt0qJxp8dOkww2+R8bpKVZouX4tnW1D7UROUmpxWa/f2eJuK/RVMl/oPp039J5za6PKk8IqNgzCMJLVi9ANyLWHy28qKWbJ+OM6D/CoqRso6mQ+xdSzhyJ3YHGDfKzMWF5HQytil5mf4U8YVdVX2v/B5MRX9+6JGceWic3qSsVGzVWXL07j2BI+KKo4WA265eCqQmxGhxGRStkHCmFwarFu8Q3UuVWz8weLL/ffVKGvq2vtF87D8TCinaDFDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDPDme4CasIMSK8VR2NeqNmVv2wzfzBy2f1sMZAv6Eo=;
 b=Y7/DHmeTu67yCQcOQRsBrlq8w23yiXQiHuACOcNEUrcnUrOtFGjD6dmoLykW5AZl6EwapheU3U1KmL/xt1DRjXD5RWsgrHCVqxXkm+HFypa2EtCL2wmAycpTmBr0f0qjq+xBzumR0S3+dWTEJE7jWC3iEsP4x3zFh2BwFo0rWVJezn3Za4cCftcGqAR5ZkVVYf2vG0/N3pzTeSdldmVOzN0xe12hSrW1gCB5dOLfN4TuPfWKTxB7Bhpm0TCHeNmxvCR7B+QdTVIQYbJnR/kBHa3Re4ChZ0cGgYpbCs4l/N1qPpd69k/Wh6G83e+7HoBANbRI4rG/hPSug9uiRadqHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 13:20:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 13:20:48 +0000
Date: Wed, 8 Jul 2026 08:20:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
Subject: Re: [PATCH v6 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Message-ID: <ak5Oovrfj-o0Fhcx@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <05994f0479041f3d8d199babe2a4535d6dcba3bf.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05994f0479041f3d8d199babe2a4535d6dcba3bf.1783493868.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH0PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:510:e::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: a6aba97d-76b8-4502-a855-08dedcf3b918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|23010399003|366016|11063799006|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	ME7wN/pqcSb8n/btMcGy+J+3kmqU0YDxAalbbeB53mLd9el/uZsVecydfg2owJOg7iE8PVPabmlbqiO8FpKO/jAktj/QgPQS4JEY/eW0pdncbNhEVzWNRlUIIYR06srQfKAvuAXLnSDcFg5SDxj7f2p/VmC6xTeBezkAbFTJCLQqg/6TslvBgn6zQRALXxIauT+x+xpbeY2SStgSpP2BttHgBkrRjr7+ySoqQPJAxtPZOv75huctb+1U0vBm0blxv8I5zs5PGiHe1Nj1pDiT6vdxteXaUuDlsc0YrIOa3z+HVSyC3H6alg3tBbjcigh7b85fb2RJX4JxYmhecDWvSVHyxo2F5Z5aAP4ASydZMWzr9xnEPmJLPmKrevVaGq1hT/Ly4zc7Na4WG3oJjzrk0ocAvfcr56oQjQbgvlLqAFMAX4W7UiOV9hfTCjcvp6GZR/qW4z52ygTE4FLzU4St/XI4IUw2YbmZmpwotQqufy0hSbVjOLein+1NVuQxG0bLnlTNkQdGV/50JMDonCChV5o1YvKoVQ26nOmgOJeJhWvgArfmjy4lZ99kyzeEC6EvxUStoaAZwhgzQMwh9D4+HaWFq1c8SsQgzeUVfVvbAFcV0CqhJHgyzfFZbKPik5THo8rljAdGJ7tVXHcFCzxKcdrZX5hX/NHeN3XrzzlNKSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(23010399003)(366016)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9VK4aAar3StjYCSYhPtXPyePhBV5g6sMNmGbmIK+DTGYIqUaw+zIo7QK4hhc?=
 =?us-ascii?Q?vyDsOvxM4r75tGFenpR9mgrfBT37AxCge+fkjGcswARXKI3Yn39D7nMPxIVW?=
 =?us-ascii?Q?DrUMhKsIhx86u+HulcMrYwOmyfTSnCqDqgVGdYRrOy5Rp2aRCKDkryvkPCSA?=
 =?us-ascii?Q?iPDtxE2R7yc7rqz23oxdjTnLG95QKZjP+fXe8rXt3zP7F9EiyJMDCxwDxWZW?=
 =?us-ascii?Q?qb4eFmBl+95u0nGgsxwbpESIgbIe3+2SNrdXEmrLoyKPhx5Q0LK0BhMzegS4?=
 =?us-ascii?Q?b36E9N37wB2DSXoItSn3RNV8WJoLA0vs4DvlgcojLqLQA2esrEzaU7b6Wu9m?=
 =?us-ascii?Q?wPD/bNZfMhSODRK8mSRVPON3M8Xo58JxzIpicXQb1gyfMNR0f27x+3TAOgHI?=
 =?us-ascii?Q?OwE5F0SISe1AkcV4hS2lZq2KyyN+TG591GNkYxfS2COmBjs2zoH0+tdscHDh?=
 =?us-ascii?Q?ree8msjzp7Ak1kuIJeMZ8EaMwM8M+HoL3SiIZ+ug9EwvGI7gHdOabyjFn35F?=
 =?us-ascii?Q?2jb2qvbg1IZSjsSIJ2Vfr+8AdBYeoUIzBGONKfyKkEeHqX7sFLvm1F/YEwJq?=
 =?us-ascii?Q?5Owa26TTzcX1c9Lx+EfoPhqZGPHAr4Af83v2NZRLZueh88VKo3OCjmyNEkLy?=
 =?us-ascii?Q?XIh86MNdniyrlrMqNCv4NahW2yLjhsDm8mlrJfY9L8E37WxSFovTKm+AQjVt?=
 =?us-ascii?Q?J+BPngUjN5BZOZK6ungIHNaSEV5ZL1vpmvPwXxbuqC3HOAt+enSMTD0x2tTk?=
 =?us-ascii?Q?0VfVB8uLwd0c5gCaQbQCY/fUe2XBFVCcZ1/zuCmPO6KlVosNMr0jDGxAhMR9?=
 =?us-ascii?Q?wjb4q4yBEGeSOsw2GtvjVsQSO4Ke9mutnN0J/eNdkEykyFqqcDYCyHwJcasN?=
 =?us-ascii?Q?fNjNcQuu4K0377OZbNyOkREbmmjedFnLy0Y0xGxQes/2+m92E/uKGsZpFAbC?=
 =?us-ascii?Q?302qV0N1AFWoU8sTyDFQ7RxhAy9toJaHSF7CvuiHS9JC8HMT11rqI4Y4Vmos?=
 =?us-ascii?Q?70hm8WC+meQ6ACEGY3egOXDTXqggPfThv2KFWEcFJad1NEJW9Jga7CQkliIp?=
 =?us-ascii?Q?yBkWiATM22xLP3+dTB7qzNdk92+eSxdqqX+oEHlI0ONbzYqafly8GioVUkt0?=
 =?us-ascii?Q?8PILsLPXDtqmTMVsSuDGjnAefTnx9QHhkO/6TjZthKJ8G3uOowdIavTGjl2N?=
 =?us-ascii?Q?zRVhiB8hoVASiB0tH5HWLJZQVEuaHQgpE6BFZr3qtD34ZeEMqp6aDM3Edk/G?=
 =?us-ascii?Q?yQP0HMmraoMVhHCYS/durEEmkzDJcKBi96zhVupNvxtJM0p3+Cyd1WX9Paq/?=
 =?us-ascii?Q?ZvjmLdxT9jOH02idcK7nYq39G0c/yFJm/clti8Asr9NbO5cxYJ5yIgYHgUl+?=
 =?us-ascii?Q?rgcNGMwmKwPZYhdJrNn0fJAn4WNpxPQ0JaQqcet/Chjhzq3Dpa1y9kY7y/Y1?=
 =?us-ascii?Q?BsciRQ0JJ9jNbPGlLcZXMr6GhS5uhftHGJl1jbVpcOy9ODuFkvgYsDMGF9A0?=
 =?us-ascii?Q?yconiOoIqChrf/Ad3m05hXWXfpghp0KrmlgA+SjkQxLo2279ckwhSNmOnNEa?=
 =?us-ascii?Q?4FjrdBuYSxUF5SkVJUeb+3SP1DCA9y/ixNNItVTBOtoH0sgEMDPxh5/kiViO?=
 =?us-ascii?Q?IkyRaMd21QA18lpy1CGsyhSRX5yu67pUVCAQKq+HZInYD5/i7C6LosH8mYfg?=
 =?us-ascii?Q?UMD2uMQmsCZxVbLKZKdoq44PHCn6z3DSHkc6cSlsy4fS/olYOa0GsWVTkhRJ?=
 =?us-ascii?Q?UTG6xjiVk2ZXGVIhA2zQmH4TYpEjQujEnlxof+LLDE4plHiThxDj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aba97d-76b8-4502-a855-08dedcf3b918
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:20:48.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgAirk+NELo2u7DpXAZj5gfAgC04XhvKE5F0B8ETK36fxiCamx7Uer9El5M0YTCALyA+TwlKIBK2HQEvc2tT5ZyfU7d0iyynH5CPHRqzy/CnUKtgEYtlgz4cCPWTMSW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

On Wed, Jul 08, 2026 at 12:17:39AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Map DesignWare I3C master CCC hardware errors to I3C M0/M2 error codes.
> I3C_ERROR_M2 is reported only for broadcast address-header NACK
> (RESPONSE_ERROR_IBA_NACK). Target address NACK remains -EIO.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v6:
> - Fix dw_i3c_ccc_set() to use dw_i3c_ccc_map_err() so SET CCCs get the
>   same M0/M2 mapping as GET.
>
> Changes in v5:
> - Unchanged from v4 patch 2/3.
> - Add Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>.
> ---
>  drivers/i3c/master/dw-i3c-master.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 6998ffd15f5f..c70f6876bd38 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  			break;
>  		case RESPONSE_ERROR_PARITY:
>  		case RESPONSE_ERROR_IBA_NACK:
> +		case RESPONSE_ERROR_ADDRESS_NACK:
>  		case RESPONSE_ERROR_TRANSF_ABORT:
>  		case RESPONSE_ERROR_CRC:
>  		case RESPONSE_ERROR_FRAME:
> @@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
>  			ret = -ENOSPC;
>  			break;
>  		case RESPONSE_ERROR_I2C_W_NACK_ERR:
> -		case RESPONSE_ERROR_ADDRESS_NACK:
>  		default:
>  			ret = -EINVAL;
>  			break;
> @@ -708,12 +708,29 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
>  	dw_i3c_master_disable(master);
>  }
>
> +static enum i3c_error_code dw_i3c_ccc_map_err(u8 dw_err)
> +{
> +	switch (dw_err) {
> +	case RESPONSE_ERROR_IBA_NACK:
> +		return I3C_ERROR_M2;
> +	case RESPONSE_ERROR_CRC:
> +	case RESPONSE_ERROR_PARITY:
> +	case RESPONSE_ERROR_FRAME:
> +	case RESPONSE_ERROR_TRANSF_ABORT:
> +		return I3C_ERROR_M0;
> +	default:
> +		return I3C_ERROR_UNKNOWN;
> +	}
> +}
> +
>  static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  			  struct i3c_ccc_cmd *ccc)
>  {
>  	struct dw_i3c_cmd *cmd;
>  	int ret, pos = 0;
>
> +	ccc->err = I3C_ERROR_UNKNOWN;
> +
>  	if (ccc->id & I3C_CCC_DIRECT) {
>  		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>  		if (pos < 0)
> @@ -742,8 +759,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> -		ccc->err = I3C_ERROR_M2;
> +	cmd = &xfer->cmds[0];
> +	ccc->err = dw_i3c_ccc_map_err(cmd->error);
>
>  	return ret;
>  }
> @@ -753,6 +770,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>  	struct dw_i3c_cmd *cmd;
>  	int ret, pos;
>
> +	ccc->err = I3C_ERROR_UNKNOWN;
> +
>  	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
>  	if (pos < 0)
>  		return pos;
> @@ -781,10 +800,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
>
>  	ret = xfer->ret;
>  	cmd = &xfer->cmds[0];
> +	ccc->err = dw_i3c_ccc_map_err(cmd->error);
>  	if (!ret)
>  		ccc->dests[0].payload.actual_len = cmd->rx_len;
> -	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
> -		ccc->err = I3C_ERROR_M2;
>
>  	return ret;
>  }
> --
> 2.43.7
>
>
