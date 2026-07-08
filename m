Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4727E1D7
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516333; cv=fail; b=HtiwJH9hbzruDcfWiBLQ7Wa17364KCfmcR1uSG+74/9OFN9/eb57SFbqmv7PNXtejg9cPeul5J3yhBhgpfq0TcNdLAC5lOvbVRvKDMNk2IduCB2lrsZ0yEUBKTKVuTSDa3xn9NarX3SJWbOI48PS8M/Mx0s1dvZL5gpqBQqAvv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516333; c=relaxed/simple;
	bh=WwaL2cBb7df5CqfMgsWCpg4FmSDgTduoEHaIdjziB9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b7NhN4EH+s+T0kHd3owpUilko4BUHhISab9CrWyVSYQ0+pDoiAXt6ncPiD2trRNiW3Le5nMlXlMk+axaVxyhpOg/sS3uygHj5QJqZ4JsDMaw3kPtChW+eaDhaASjSzcmqKKWdZU4WBeVVh9a9/yYcOwMH7r2wHHG2hPJtamT/tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=czG8G+dF; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="czG8G+dF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUbn5E/wa4KNSp5y3V8f1DS2Jyb0yOGa/T8l34J8YwVl/P8P2oHf3rXUwn7NDR6A7VLQ2Ng8d+YU1fHOih3pICEesLu2GHGyw8Kq0BfhiXREK70Cl6pS2fNU0Qig2tM99z5HxyM8Z9qDiqcmY9I/om+5Eu9rI3YymVWWnPt6dHsdsR/xuofQIMLSxvMYHoocq3FjCzTcH2l2d9FLbuZeQJv3GrPtTTkOsEbPi1MJhIFAegCVviDYsHeBljgTzZSWvvdxyB6hUktYU7Etkfv8WfXZmEgG+zIMXyN891jT+hQhcnvfl7T4fg1TFw8W5Xuhp6EuZj5HmzsBuctYXRKZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzLvFEyOQ1RB8US9yGpD9eklqxUYAJh8LAg5P+ss4hw=;
 b=ACI9oxLuALXJxUQnVSCGV1F0sCOK4fCuDVN2IHEumGVqqWjzP9lkNV3js2n9CnSOJDeYIS6OVZAgTKFYjtu4uYqkbx4ETMfjDPc2R4Tn7vqBn6RuaHngnAus3onWv1X0Wc2iaA4nAy1xf4YON3e/T0NrE1yryFo+GK0efTibUy4mw+GvDloUBks7AasIMcavt9TumZpnrvdlB9sQ3SjwzL+y1xNtQPb1cY4FRur1ra+wXm8mB2JUrEZL9qrjbHjpFZAaQIh+JssjQt0dKIbQ6Rsas5Yn08VCwF2oO1J4v9mkJZHrFdbrzgXObmPCwZCRLMVApVRIFpahn514ImUu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzLvFEyOQ1RB8US9yGpD9eklqxUYAJh8LAg5P+ss4hw=;
 b=czG8G+dFbx11P04p5R2Ewwq95ISBh9CJ/FNklYtmpfD6oI5LFnsPFuuk8e2d8skhHZUff0PnRkcSjnTB1UhCPA7JI8TiybegZencl5s0H9BZuba1qgXEAa17/KECenDeXhmziuRGVxmaQXv+Q4vHdSqbLnzPsjIErLWG15oXyL4debK0dgUcvAU8dWObqva41eUQwE58odzCwFf6SX5IbVzLtmTbtz8YAVarqvNHiPfAbGqbu23jujoTGZa6g9b8HSq4Q6TNLpTROnHNpehUhEVIkKWSzU8H0CVc/sc0noaXztCTyqdOB21yEt8c/s9pSGwKte5RUHpLDNjNUcSZww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12262.eurprd04.prod.outlook.com (2603:10a6:800:326::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 8 Jul
 2026 13:12:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 13:12:07 +0000
Date: Wed, 8 Jul 2026 08:11:56 -0500
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
Subject: Re: [PATCH v6 1/5] i3c: ccc: Add actual_len to struct
 i3c_ccc_cmd_payload
Message-ID: <ak5MnCrhimv1TrFJ@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SA9PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:806:21::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12262:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bb0347-4237-403f-485d-08dedcf282f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Bkqy5rwqxAPFtuCoB1nT3XmuF0ogR1KxSwJc5LjvaqlDZnbc6ngNsbTOUyjYrSA5Hic6O24ZTdG7rSZJ8o/7YJoIbvVnGSaYwaVHacuyCzkVz6Wsyboo3VjtMDH51EialznxrGRXJ3OjmV/XTEqhiDJLmF+jmQ8kHYBVgmwV/TbVvZhl/g0bcSC8m+T9nrfVXW3YlLubjiVG0wEIqkKZqBipK2pTxQbiu2wVkDJXkYS5+QCa6QS0LzuTPZkf4Tz04jyWXQryxWOfMT4D8arNpo8Md7OFwIEqh8y9cB795+hTaXALfjdNNFctKKexQHxozvTikp1HzGLNG1q+4mZH60aqWKxoyhhmGj20hmtmli3455f00cP1t50s3NML947XcsPu3fW+YyPCmL2pgFtxJvebndVgwPEcht3TzTYsKQ9004fk6aYAlSeAEM9s1BShXDJoiVS0jHcDWU7+0IYCrKhw0+NqkjBYXQGpsNV+mcPAlZE04rdu7Vls5Gz/cMSPPumg145KxNF48RnsWWKkCvS4g2qsxZYNN8fYJQ+id7qDw3s+VW29V275716vjMiZzBEdz0xwK7u15GODNAyWFNEdMLMnpWBN3+fIol8H0sD8FADHf4EBtrJbbyG/6lMo5Igqo2n9QnabsvhaEujXFUFCGnEpbLlirbtJtWZIFUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I5eWzY8QuI9/C2C4qS9PMjr8GApl4m1SU3Y+QdA0fH7FbfVQejMDyLrT/F9l?=
 =?us-ascii?Q?YiUiVlwgRYClbB0xeSW3BZq93+qagD6KQuicjgT5zQtWF9l6MwtZFAJOc3Cg?=
 =?us-ascii?Q?+dzzEAnJ91J227rkt1Xm8FrIAT0pKFp8jWJ9TOI7RTJZlimzU1V4bnQ+1rRN?=
 =?us-ascii?Q?yZ5JwOcraJ5jkm6nnvC4/fRp9D+k8X26Ag0RHWVFD/MnOuFjVdLxStblelre?=
 =?us-ascii?Q?xNqu/9jzh5MJZEqmhwqiuVYnLzQUAuiAE6sBJHWv99vRimzIxBrgncfJBbSC?=
 =?us-ascii?Q?SNSDO06xj1uiwxKkD5GNXeJ3Mh22G4hUMdjvTEZmrr1rT7uTDRPBUPhLJo+Q?=
 =?us-ascii?Q?oEGNlLFii2EoJTEhSkgq2hokpxab8ClxjVsYaBtqI12JEcLktQdQA0IXZwie?=
 =?us-ascii?Q?kc2Tp/ofIPGVrX1U/9hyXFcU7AoGUxctiGSWh4ReR7ViGnwc2GuJtFJQND/c?=
 =?us-ascii?Q?MzfFytj8SwuUmJ7y2dVUC8JeqSTpgwYuibFa+IfJ0urJNVogWYzpOHIb5lzr?=
 =?us-ascii?Q?aBdZSWKD6C6mNv81De7Bz8nQ0KPlsoxx1l2QMFIMAvnaN1Q5QYX8l4ViiMBv?=
 =?us-ascii?Q?ukX9q9k52hmgHhskSxR0DMSFubzRG0CpMo95A9x4KQkKH2X3A/Gxhp/daaXa?=
 =?us-ascii?Q?Z7mzSvdvDkQwvxslnMBl0tPYCjpizs/1R1qb2JFrVoR8BbdWaGI9HyFDZ1S9?=
 =?us-ascii?Q?qd78QRLT/EnzJLmGUXYCpF0m/WjnKHvAhdW1uzU1ZrfGG/lvbd2TQMH+0fMP?=
 =?us-ascii?Q?PbXRsEQ2xsqG5TYd7BkBQDNlYdmo/NL7YSLlnAL8+FtpXnwEMEnR3GrXotrn?=
 =?us-ascii?Q?wKU5785351AtEcN3fuUAVweMJDt2qvhDlOTDnQNSlpA0HGKYauI9rSiLVKGR?=
 =?us-ascii?Q?eLSdXs6gBpsBc6rYuLKzpFekWZFzBQC/vBV+LXMPPkDPoCy9qFN8zRa+ZL0t?=
 =?us-ascii?Q?ojKGPmuiow6PE0KWYxo+K2v7WlMNVfPkXNz5N5G+H4U7f3S+QMyxeHtHbypC?=
 =?us-ascii?Q?gyrVbjsB+qrT1LYVCwOYVjBJKoIVMcnvU9R77Cg+nQeTO7eNy/hthApfik6T?=
 =?us-ascii?Q?a3Z+fhiqqRcrOx+s6inWf1daV4C8N/HGCdKtUhK073wCjA7mfpIlXr/MIRwM?=
 =?us-ascii?Q?tbefozQKIrEU5K84gWWWIyuEmxJ8Jkc0nkgAhYAoSTBgUoJwfWrvn+wEqTVi?=
 =?us-ascii?Q?Lhrpfnl4hLRC8+w6gulpzi7rLwm6XpU8cms1e/jOEGXE0gSyiODCDyJeLw4b?=
 =?us-ascii?Q?IYQB2xgwo4i6My+ILAogh9jA0P7NwvsOVuhOOO/8WxsdcPD9fb3lf9GvlnAt?=
 =?us-ascii?Q?nqO7+aU062fukkfgdfdpqH1pPYoxGImRdYHyy56jYjWIWZp0cX7a3SbhSulK?=
 =?us-ascii?Q?IoK6Lyap/wYvNLJfCKTPJp7K6AlAuMca7PV+dxJ2aEivonRhkc8zM0xO7LiA?=
 =?us-ascii?Q?fnHghI5jgiz/EAF7+WmdzOOkT0YeBpk/2LgaXHrBtIMJ6XOBwge16+iWeT0X?=
 =?us-ascii?Q?duZObdxikwyWMugbkPmsHDRTXpMunvpofstKb9OenU0hM69SReUvv6Cmr0Wp?=
 =?us-ascii?Q?HTuEJyWWzy0OTUQRLxJ0684ft+j05PXS4bPhU0VQ/VM55FJDa8mZQw/qgshp?=
 =?us-ascii?Q?y2bnjphLDGnLF66k1ZA8QYy8kkYlJVixy7WmrQdKohJccdNuaSuXDVFCufqb?=
 =?us-ascii?Q?2H+WmJ9dBm2QeqJfc5d7j0/cA2R1ZPw7IahGfInfLabmoONtFcB0qbcE1CwH?=
 =?us-ascii?Q?J0VeiNeO5uDLLJsGpW2IoEsW9qUzHeuXwACLxThrhwK2xE/x9dGq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bb0347-4237-403f-485d-08dedcf282f5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:07.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5bCCjTXg7awuR+OgFhKuPk9Y/XBzFVmKa6OeitkRl84pnY4LV9BS6JMV7Eg8N+/8BHqydacf7UZoDerbrORdBh7R4GSlJ7zJt7lpXJ7B6muEKFTBZpZR/7bNDTeiITx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12262

On Wed, Jul 08, 2026 at 12:17:37AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Add actual_len to struct i3c_ccc_cmd_payload so drivers can report how
> many bytes were received on a GET CCC without overwriting the requested
> buffer length in len.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v5:
> - Split from v4 patch 1/3: ccc.h only; no driver changes in this patch.
> ---
>  include/linux/i3c/ccc.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
> index ad59a4ae60d1..d8052949e57e 100644
> --- a/include/linux/i3c/ccc.h
> +++ b/include/linux/i3c/ccc.h
> @@ -343,11 +343,13 @@ struct i3c_ccc_getxtime {
>  /**
>   * struct i3c_ccc_cmd_payload - CCC payload
>   *
> - * @len: payload length
> + * @len: requested payload length
> + * @actual_len: number of bytes received on a GET CCC (filled by the driver)
>   * @data: payload data. This buffer must be DMA-able
>   */
>  struct i3c_ccc_cmd_payload {
>  	u16 len;
> +	u16 actual_len;
>  	void *data;
>  };
>
> --
> 2.43.7
>
>
