Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09E3AD50F
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522882; cv=fail; b=A5wZJfjS2JFOSuNGmxIIgvq2GOil0HZMkSV4j7vlA+Er//XJ+RoHtC0shMdp/u7a4N9kwuzNdHq2w0v1Pty4muZ+eiysJULxkOItKFXInwAIDnO8Yam7T6ItxWAWxqlRC397huEupgeuTadWuP5QNnjbIV6kw9qrht8qeRjbiT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522882; c=relaxed/simple;
	bh=PkLWpjC2W0Mbh1mXYREycYCDZ36fdAWD7mhTqfA3RKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HleWc2OVR7Jj2+6AM+jAlxpiTQ42sOPp3gjMw8lFQVn4Oj5QyhbNZh747ptoVv7D3MFSV32Don0QWQJ34NnblkU0h/QvNzvTFswRvNOjWjYHCbeKXiEyGPCXa0nfadY1FLPqM5G5czN6cTTj1wVOGxAkzvDV6AZ+wHF+3qvxfqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZBm4aDVP; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZBm4aDVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnzhxyQNNLi17/eZS5zqOOc2DTyNENBNnT657rZ63gjsvYQ7E/qUCsuJP7A+RfF2B3lmX/FpaIRrS7P6os+nS9CaUeXdWGdOFhIu50dGOsrabgDLzOWZOfdI57UJ8mzUMoIUOALi9mORRrl3w/9Dfz2YQ6nToq9CRzNO/+8dnbRUZ4MAU/8//JEbaNPdYiZTBriVlAt8f7YkuLnDTIaR3AduracY8ccfts+w3Dew+zMBvpuWyrcjYYd7Ag3oFRlnt6K5Ig7G8Z8uA06sv7l/fsVWJ4Yg/yE1V+Dvkv5NdKt91mEVE8cX92nQPtDKp4r7T6YVAziFiKueV9HU2B5fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRB09HpkfDqlJDDFaaI/Q4wsO30Avulj6wkYyBO1xWk=;
 b=oot/+LsWWUxpZuwDqLtFOR2x8zXfVOHIVdDZy8zd9XVRDYrT8JHn5xbb/Zk+twgRXOgZp4dU0sBkEzmj66BYnMORiduVHDynlr2kkNbuX95W0No6dOmnsd6pQWm3C8Dc9pwkUhE/vjCOHIaC7LFFeEev/XktN8S6+VCwiI8s2qA2XWZ0aLPsXjpVKuPgYj73oPcpWBhDCpKV+nPi1RXdgrY2Ulyu2fut9SAjh7LhF/i0RoFqRIfU+Z44LC9AY4F7LoajPYGuFhAD6kxA2EiuhQlH0JZlAwUbC1vKy6eRJn6TBpzSJIe+wNPu6gozZ8VkxoihkwSArTJTJ9kjW/nr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRB09HpkfDqlJDDFaaI/Q4wsO30Avulj6wkYyBO1xWk=;
 b=ZBm4aDVPzd8ZVUnuRNjZ/BdX1xe97/s2o+hH2TZEi9zmSz1EjSQWnCfBjWfVxYlCcNjvyMbQVH2ULIMETC0aU1Qx8wtAhs75LU4bVQyOZhNKWRmE9AYAZ142hkq5sd0lSE0LW94IpEjbUcHFdV+9xWoRQsQI/puAK5ulqeb7JowSj86UQmbo7JFjEIvUkHu5A6cge2jf2/C4NE0ySIqfR0+gFvHTs8RbTgHS+BuG44uoVKpit3AamWs8ELTt1zLTOoUrsPbbBZ20VLNIxl+BzwL0sM+pR5F906vXqyx0UBINC/FHQtZ0E1v/RNdaVUR9++KXZTgmhUPm3e5mfRdVaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 15:01:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 15:01:17 +0000
Date: Wed, 8 Jul 2026 10:01:05 -0500
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
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
Message-ID: <ak5mMbPlO8dCxH8R@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: PH7P220CA0151.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1d09a9-71dc-464d-47dd-08dedd01c31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	myjGiJDmYi+nsyyRhzyEL1fEER8LGRkKyAjTwoC20mF/xVdMJvmaVtevGARJF5RIZDHk/3NpbSAKpkruPW7YcOseK1CSe6okZu97DToOUlHTgofvQjOT8dohIzjhjueodjbYNnNwRK2JgDdfwdBpRVEgGYHS5w2Vw1VNQhoySeQN5DpGmxAqPbFyMi8M6iejJKBZPD6F6/L3Epg9uMe6/6I0Ipf+fb/UyLZ05c33gUEabnana5M/02xtTeuaM7Vv+QfNJPphTUoqrUmWacA9C0au2n2E+EjXDktI8kz5HRyy6d1J5yJdrnCb1NBRGDk+HqqTlC+9ZyfVfCuU8WK95Y78Gq9qob01jBiYEt3kFSGKMR0Tsp83kdm/1YmIsww/I2ax5zOIS8qyGe/ivlrLXwmprOcDu8y4NkTuJxTt7ug02mThBvbFNafFbGdSzG/HVr0CndsniwhdrCqLmMl2FyK3X3jfzNsoLSgFrsnjJgQUJ7V9zza7GwUbbK1Z1ouBn3aHgolxPeV0kVQ/RUPTDw7L9tSZoqbtIqQ2GIoUQJ0WR/8kN5BXeSNYCka4yBH3vye9BQBbG9X3qDLtyAb3R0JIcKoP1f2R3HvuXH4HH8DBbXGeTLm0E1CaHmxXJGs0SwF5v/WKUVeagDD5D7CdzU5cny4dEuPK5O3b+Zj3oq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VEGJlhKC6XBqNKA/q8o73eo7hLhmfQ7HHS21HPzrZbQBX4G4JciuvBr8ZkKu?=
 =?us-ascii?Q?NLTZznB5oSfWQUO6xaaf7ggILAgnvZShC1oYE8tR0FJ3EjGt7ZdD1loEmFJJ?=
 =?us-ascii?Q?ev11/u6SnQOTnEnxKBHWcTPWepBaWaGDip9cF4l/A1HQ03nj/W+iVgWHJDmk?=
 =?us-ascii?Q?Qy+23Z+pyAfNZWLi1kfuI63AR8vig1NV7IaznFZiT+tXaja1+Z49jQa4Zuml?=
 =?us-ascii?Q?BstmeyJCq6uY7oLTivIoIpi0qq7x0Atty7jTUIVblPtYZX4xg3CfJpIU0UKM?=
 =?us-ascii?Q?qMX3VFMu/2+JdTrW9ogc3VNt/VzdPzOpaJvm4wpaWgnbOM+N7YXw/H0WOz5f?=
 =?us-ascii?Q?V4WRNi6bfks3DDbabIw2mpoUCeoIIZ/fFYw8aw3rcf17pBGKq4EHaMbKJjFz?=
 =?us-ascii?Q?n0ctIjlHWNs6oiKFT3t0FbQwnpVD2U7CgjnZJlOcmarjZfJ3m8+n28+kKxt7?=
 =?us-ascii?Q?o2O+dzj1JST0Bw2OAoaderm4+kyF9erji26/9qxAvI9gWitH6h5FjVadQNeN?=
 =?us-ascii?Q?lyWDjlwSHd7x48MfB4fcDutmhxGPVHF1AhWLk/5/Uix7p432d5xJn85CHp56?=
 =?us-ascii?Q?1FZUVKgdJN2nGFrMkmLOviHK0N6TAdJ4r8jDlEH4UoonoRIjy2p1V0BQhSBT?=
 =?us-ascii?Q?+TlOv1iaYFQv3Y1NORy3mNGVEHqsnN+VuQtDCo+DXuHCAHRRUglc3yD0OmHr?=
 =?us-ascii?Q?lxkOOK3DnHuFqUsM0ZCglk6ooTVmsIO1YndrQkWAfjnPVrgZuhkcMOLM64IM?=
 =?us-ascii?Q?iJqC/RPPrydnpyy5b4jYN2MCeeqELiib5jQyVju0Nchv3cSSba4BchN6hciH?=
 =?us-ascii?Q?ANFvouATWJXWN641SiKu0zKcSITVTmhSPa9UwJLk6rLoSMlYFTQ5VTOyu34k?=
 =?us-ascii?Q?IUtc2paUqeEk2i1Lm/+gOs0t50vSElVzC0K4L6NGlNnMG8v0vSew4GEGB2/8?=
 =?us-ascii?Q?bMJ+bGvt5QbVxwUCSrI0jr6ynRn/BGSTSn1SFvRJA/mXuWAkAc1DXacoM30s?=
 =?us-ascii?Q?Q8K+I1uCTeMhq2eiG5vxuT2VzL4hFxMeMx+SvuQ3cQOfg6Y2xqVBLjBIKwSJ?=
 =?us-ascii?Q?2EvCcWX+QurG8mjV+VCv+1lsyoMnYgyhyD3tpVpuU/3uFToFCvHQVvK7reWR?=
 =?us-ascii?Q?D4KuQMc4N360nf10K6yysMnlOaVy5/9IjIP0+vFyvVwtegZEUWwZ5mvsZBVF?=
 =?us-ascii?Q?GVCHVrxPV+wW/+027Jrf5uTKtdAiIR6ORAaBP3ViSUjPg2unAW1444xAVccc?=
 =?us-ascii?Q?N2AITEl2tMPwZ6awxzU2JLxwK8QW5Ng0OvHFc2L8HI0mNsN9dp0feBDQCA4z?=
 =?us-ascii?Q?iSiadeUDigIXgWzK1NWQueHyBrpN79r0FSwt13qUVvJ4gUcfwxcDu8s5Xyb2?=
 =?us-ascii?Q?TXHy2GVq6Qw3fchNWMU9bq6wFjV9mycbrWEDWjT5sY9KPN0LS9heUMNEZ+H0?=
 =?us-ascii?Q?Jd98faelRsNg4X7vn9NvPdyQt9s/YQlYq7Le/qppgpuRMXG0chUCd7jJvHkY?=
 =?us-ascii?Q?SQCazh26LemXkgRcQOvdkkBdGD8CHd6Q+MzuRROA6yzPWmZbAL57hXX1LGLk?=
 =?us-ascii?Q?yks+z+zPgNRCbb4dpObGCtLlB5NsdPzj1CN3peKQJFGuEk5jccw+zZbAqOI3?=
 =?us-ascii?Q?4bW1LXcQruaf8OqPsPmbipe+D/a+SmI5fWnmhdSL3UgBsWZ+UKvJYdEP+DBd?=
 =?us-ascii?Q?c8IYpHU6xg7nxCKuCUswjr23x+dsoeTLqY3kVd2Ig8g2RllXINnhadKUgSOI?=
 =?us-ascii?Q?YTL5GcB8PkV3V3ExjhtLGSt0qZnT2CSklTaxEoNgHeJEys9bCVSY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1d09a9-71dc-464d-47dd-08dedd01c31c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:01:17.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eTL4iD6NvRmVQ3Ekj70IBV57k2BAda6dELiXtEfud8XlPK4wrnc57fK7ewAnN4zsfbxWcTRgTc4YLskPV2GGz9BeO6cE9YD8yFxCmi/dPKzyVVKgDuWNLTHnfhofcLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881

On Wed, Jul 08, 2026 at 12:17:41AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
> variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
> at the call site. Extend i3c_ccc_validate_payload_len() to honour it.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
> Changes in v5:
> - Split from v4 patch 3/3: optional_bytes and variable-length GET rules only.
> - Simplify validation: drop redundant exact-length check when
>   optional_bytes == 0 (per review).
> - Clarify GETMXDS fallback: with optional_bytes = 3, a 2-byte success on
>   the first attempt no longer needs the fallback; it remains for when the
>   5-byte request fails rather than short-reading.
> ---
>  drivers/i3c/master.c    | 29 +++++++++++++++++++++++------
>  include/linux/i3c/ccc.h |  2 ++
>  2 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3b6d3ecd9d12..12ca7c929ee5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -902,6 +902,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
>  	dest->addr = addr;
>  	dest->payload.len = payloadlen;
>  	dest->payload.actual_len = 0;
> +	dest->payload.optional_bytes = 0;
>  	if (payloadlen)
>  		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
>  	else
> @@ -944,11 +945,19 @@ static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
>
>  	for (i = 0; i < cmd->ndests; i++) {
>  		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
> +		u16 min_len;
> +
> +		if (p->optional_bytes > p->len)
> +			return -EINVAL;
>
>  		if (p->actual_len > p->len)
>  			return -EIO;
>
> -		if (p->len && p->actual_len != p->len)
> +		if (!p->len)
> +			continue;
> +
> +		min_len = p->len - p->optional_bytes;
> +		if (p->actual_len < min_len)
>  			return -EIO;
>  	}
>
> @@ -1342,10 +1351,14 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
>  		return -ENOMEM;
>
>  	/*
> -	 * When the device does not have IBI payload GETMRL only returns 2
> -	 * bytes of data.
> +	 * GETMRL returns 2 bytes (max read length) when the device does not
> +	 * advertise IBI payload, or 2 or 3 bytes when it does (the optional
> +	 * third byte is max IBI length). Use optional_bytes to allow either
> +	 * length when IBI payload is supported.
>  	 */
> -	if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
> +	if (info->bcr & I3C_BCR_IBI_PAYLOAD)
> +		dest.payload.optional_bytes = 1;
> +	else
>  		dest.payload.len -= 1;
>
>  	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMRL, &dest, 1);
> @@ -1414,14 +1427,18 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  	if (!getmaxds)
>  		return -ENOMEM;
>
> +	dest.payload.optional_bytes = 3;
> +
>  	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	if (ret) {
>  		/*
> -		 * Retry when the device does not support max read turnaround
> -		 * while expecting shorter length from this CCC command.
> +		 * optional_bytes = 3 accepts a 2-byte response on the first
> +		 * attempt, so this fallback runs only when the 5-byte request
> +		 * fails rather than returning a short read.
>  		 */
>  		dest.payload.len -= 3;
> +		dest.payload.optional_bytes = 0;
>  		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);

where use retry != 1 case ? if all is 1, patch 4 is not necessary.

Frank

>  		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  		if (ret)
> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
> index 2506d83b8255..7ad677baf761 100644
> --- a/include/linux/i3c/ccc.h
> +++ b/include/linux/i3c/ccc.h
> @@ -347,11 +347,13 @@ struct i3c_ccc_getxtime {
>   *
>   * @len: requested payload length
>   * @actual_len: number of bytes received on a GET CCC (filled by the driver)
> + * @optional_bytes: GET CCCs may return up to this many fewer bytes than @len
>   * @data: payload data. This buffer must be DMA-able
>   */
>  struct i3c_ccc_cmd_payload {
>  	u16 len;
>  	u16 actual_len;
> +	u16 optional_bytes;
>  	void *data;
>  };
>
> --
> 2.43.7
>
>
