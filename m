Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E03FADF1
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522447; cv=fail; b=owViRQ9oMpClTOGX8zySJpchcYo3N1ukAXBboz+gHOmnXm2A8uQmhm6Igg2oQm1G22jHC5jN/mi6vsflXdnbiqoaY6wseAjmJdTNf/kPOkRfT9UhirNBlQ7BNLaAvYANEQVKsTIrdCCVOJeoqpfAArfn6ZNnnokobmDicd9ZR8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522447; c=relaxed/simple;
	bh=lV4iW9ojc+Ka8HAenqzg5TERHNr6cbKrpbj0ZEEQ4a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lnhc5pxy/B+rJEe+b/BAcE10vItlpd6Csh/nJPzAVLto8/OQilrvbsJ1WDQmgxs8XMGNoWI1VTH2+GDoDVHkfyGpAbaJqLrLtgz4leVPkrH7W0TXRe6HnC0Q4s6GO1Gi3G6B4mGXNGIm744Ly4EBbGPT2C8gNYSmRdmwkpkPyxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bvLk8SWl reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bvLk8SWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSuuySyTFr5xxCoB7YxQJU8BXklQ3z1adJIksQLn6yZWI5nOVKbGQB2BxgE3VYtp9g9qhEAan+a6z6vm9yx6eEcZVp7gcep/qwLKdxZRdjOEX3Q+yykMD7XbW/jV9nFQaXLI6pWGmLe6CjwkOa/Hzm74NuYk4rDF4UmMNCPUerQ5U/0uNV6sc8AcJTCpR+cakM7SADfhAYlXkwKJrt755ShSf8JQQkp176s60Gv7pv1aGW4BrKyypUOfz/CDS5IzupC5dvK5RNVd0QoJZm/6NsFqasSY8ZRVg2GlwIbBsvZXSDoJrCsZBMHNO1bHHO0CDdupsYjrR1IvjRGxSxIZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ/PXep9HzV/wFH83SF8oHldU7L95x/GbnizAExu7is=;
 b=SqjSRG80UfQBSkWZPwYW7cl+TAgSioe65axpX8Uwao6MJuUXj7jCL3SLtTJPpjQ5CE5Zaq8G5MQQDg0MNaScV0BUAZNBhff34fQmxTf/4GdC52Qj65+Gw/YZ6Aok1kZNyI0hx+0tmI0QoOpO0gOQhis5+G6mcHRrMLasc7w+a3+F94j0DZR5IOCxXu8jpuo/f5jTgG1d1I1pDyMb7wgCiCvdLXyo345s6rYqJZvgMTXzejFdNisaE59rd2gvEkSGMUGUVZM1QSu1FAgKGRlUEtvpPXlrq7LmuhyWbtTOK2nP4M0EgOZdS/kCLPo4amUK20nIIuw9qxIQs1JkLvx9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ/PXep9HzV/wFH83SF8oHldU7L95x/GbnizAExu7is=;
 b=bvLk8SWlj06oNmKfT587+65mOTTvS8bOKoRhjrdUjefn7uXKvtAXRgsvUm854nWi+2gQkdE+AJHNWQGC7u4TpWtQiIBtFwHQb3o4WfX6RxiuqOQSCqCROPtMc7hMbmaur2TVMcUZOOtvddPbGnj1FUkxSpSnflMOck7K8jGso9LAWLAEWsYQHhMkCUG9UV40/V1xBVI2WnozUs4Y7cacPDWqWkYUxX0cnyNjCbf43R/ncLiyhlqZ/QjtrdSHf1cO1+84sfqJ/s/FTXwqW+bGFYUo2TlMORzN9FUGGUxVwqqygGEHwPEoH5fyrDhzBodmFYQE4oEdUisYwbDulA9aIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10761.eurprd04.prod.outlook.com (2603:10a6:800:27e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 14:53:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 14:53:57 +0000
Date: Wed, 8 Jul 2026 09:53:46 -0500
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
Subject: Re: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Message-ID: <ak5kenGbrXOACLuN@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SA1PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10761:EE_
X-MS-Office365-Filtering-Correlation-Id: e27c036a-af0e-465f-04d8-08dedd00bc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|22082099003|18002099003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	GDs/vY+mEtSb/dmKzJ3DYqR1UB678JSLXvKQQttDS+wGvvSXFukRcBTX5MaCXfi5qbLaym5TNB4wgLoCTzg7HyvXdnMXfDb/6K3Wj1I1QfZ/IeI7YcE5SxLcjgpCqsJtb1M5D7Tt1jACFMi/SWznd2cHwd4n46J1J4KYmmTrIexJvS8qwCtMffYrlT1uuRtS0UH29AyIq1/zqTX24sb2R7xFQdVKMPJZQ2izZmmdXS+bVINtRjSHnGJk6JIIvFlMBtlR8Q2uNgduMsrevb2bgHu49z/6LU88pNTkZPUz+R2murwHLGOyjkszR+RdRs2gQMfNO2hxUR106/qx0JJs+QUdHADmGesBPTmQ/bFvl228O2PQK9EW8ytMguKz7li+WH3LebY39EjWpoZ1U+eBfKZi8KeeDtKLmZAgnOCPFM0HSkGz8O5Ul9yXF4m4y1/mO6xTF3746A/Nt4KsLgE0vSnSQPBT8F3UG8GUgn62LEhad67K2q0JCARvVTJkexdfAAsUtH4296lgXh0OVwrJrbL9omqTDrLEJtZSZ0ImrFYObOkrcWbSFrLfqKHZ9HLkjw7gUMQygmlyk1ZDLtLIKdTzxvQq9ixdIpYI8XP+vsdUDZv8Y0qhUMfXpQ+Icv9QFiuY7JLUCFe/SM/vy6m+5qsHP1ShBYbhC/lwuQE9WSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Ti72c1I/+s2viZQTd7tRh/V3CkuFL7fY0z0QDvNnOS8wfhdtAEZ+5ZjHA4?=
 =?iso-8859-1?Q?l/uH9yMkcyERreE/jTVIsm4UttVNykbEdNXwGeAxGDsgYODUH/YqTI5mGK?=
 =?iso-8859-1?Q?7sWjG3Z0WoI8YtlApXf2h0OyGGiAFGs3hPHzyULQE6sjSi0nA/kX3weV0d?=
 =?iso-8859-1?Q?nkA+F5qAp00vWyGgaUQN59838EuLfiaHfkhhhB50R7lQnMEsZT9WSxohel?=
 =?iso-8859-1?Q?y7suRA2GhTY+M697mRMCxIEEPOpw/Faz65XBXnAJf+F+CUiPuSJFGPkFFG?=
 =?iso-8859-1?Q?3FPiDZ9XlKuZn85mTtldBdKASBnWWoWWObXnfqSzt93pwyaBNZTFsUEtft?=
 =?iso-8859-1?Q?g8i3WEuS5tOBraV6v7COXz8X076k1+vMgXUwXmqudBgHky57xBHMLTNUcy?=
 =?iso-8859-1?Q?WDAGfOyqU1WejykR8Cw9Dwww0HWyLMkcbcXpTioPOnZlsRi8Ovkzdt+x/t?=
 =?iso-8859-1?Q?qf8XSO94YZuICWD9MA5VkVYJMh1NGpUOED8E5Q0rGlx5/6f1PjH/ynECHN?=
 =?iso-8859-1?Q?a2NDRI8GnJCXvwA9gxyMLjkvcSHWHwnzP/XF3tVAhVp2RshJ1ufaD2JDeT?=
 =?iso-8859-1?Q?RasXtTiKaRKFGq3PK0HmbVj58zSL52yXneI+jnReQNCdDCcj4jDXNGTIUm?=
 =?iso-8859-1?Q?kFXJtKVLGRpCzGCM9foGeqRD2sPR8QL/8/ffvLBiCE3G+MemeysgrgeU9r?=
 =?iso-8859-1?Q?cjWKUwvtRmVnd89l0rbtX6eQzPohNeLi3OY/xbHV6nAv0nbrXC186iopYj?=
 =?iso-8859-1?Q?tfsyPGqwLN6erzsCTMJxO317RnY+sQak2UTyq1F+Ig7MZBO2enrhQX+pni?=
 =?iso-8859-1?Q?LCVCTOYq7PKbPKJuaOnyDHzpfcUn8YxjCO3lmJx27sNwyvpzV2heK4dqpr?=
 =?iso-8859-1?Q?1thu7xvYrs2S2LbsVaRgTZqDt3RhbNqVpeJPeFkd7oueFzfY1Ry3v8uWLS?=
 =?iso-8859-1?Q?IrrETZlqLGy4I4xaj30VoxDFw9Vjjj2qEMVRm4iFPb/Cp2T5HEQHfEV/hs?=
 =?iso-8859-1?Q?ml1lrmeD8z4DNDcBu27lNAdtjSCxOxjkQtXniil6O5vwb8dLc/fpuVY4U6?=
 =?iso-8859-1?Q?31a3fahJLKf8C64RdLSAX1PIo4e0/TG2Ag+2fFAGP8gkyb6j0hD8UPK3JQ?=
 =?iso-8859-1?Q?qmBn+9cAXriY2mP7Ac9nI10lFolJ53XNPt3+ppj771/0wdWNhlY4vdCPQd?=
 =?iso-8859-1?Q?cQ8Z41dcPIdbIC6DKZb6feuC0eiLjkc0GGMsgD7K6UiPaEuWRvwJ7ORUbv?=
 =?iso-8859-1?Q?wJ6MXvbGCXU8brojMhqLsgDIguBQbDbm1dvt0ZbQE6I7ELvnoJXuAlzQrY?=
 =?iso-8859-1?Q?CLH3qviPSDCcBfnUIbsVyGYlYVlf5GZd2t4dp9UmmpCpoCPGHjQ774/Jzs?=
 =?iso-8859-1?Q?ltwQhRkD1dVjOCEWsfAYUovPY5Pz/5jkZwgzJGuu8iu+mD2KPCyfOMgp7H?=
 =?iso-8859-1?Q?+REJ7RuHnpVAGfQNFuy6IO3BSJWHyVwGhJ5X71rFAMdeQua+tACJOlme9Q?=
 =?iso-8859-1?Q?wtf1KTLb1AXVRUTMfZGl8GVHlvXS3kAQ5mugihY1rrqNJ5wxXWaV7Cq81p?=
 =?iso-8859-1?Q?gQHcg13EQ2LTT3+DoLN4bmWIxqUnaH5e6kATTYFITJHzJpUZe1Hef8FKW+?=
 =?iso-8859-1?Q?pIKHSiIKSPI1U57t6GT5al4THUykqHZndGIAo4FCpzyxgeRx5cpkk9L5eH?=
 =?iso-8859-1?Q?6xvDHIE4zEzMpbR57b/Qy4iLzmSRrwHsWjVeiFCx4fY0mXR171yblyAbKs?=
 =?iso-8859-1?Q?3vkKRQ/VmzuanpoXdU0/hyFU//8fIu/W4TlL1dFWva+I0346nANrmy7UCj?=
 =?iso-8859-1?Q?3tIqZWZ7vz+SErqFToWrLpqtzRoYxfTl7GxoMQlwYCMI34rQ90IV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27c036a-af0e-465f-04d8-08dedd00bc60
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:53:57.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWcDdr2umnE5oNWCXxQdC0eDvs90hcGCfxLUJjp565htH9hE1cUg/v1Dig5xC9kLmxYDxQChqgC/E+Qb+8VLCaLM+n+BD6AcebyudmXHKxBPFUDPT3NiZzeJdvWq8Zal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10761

On Wed, Jul 08, 2026 at 12:17:40AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> Add retries to struct i3c_ccc_cmd. Validate GET payload length in
> i3c_master_send_ccc_cmd_locked() after a successful transfer.
>
> Retry failed Direct GET CCCs up to cmd->retries times when the driver
> reports failure or an I3C error; validation failures are not retried.
> SET CCCs are not retried by default.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v5:
> - Split from v4 patch 3/3: retry and strict validation only; optional_bytes
>   moved to patch 5/5.
> - Validate GET payload length after a successful transfer.
> - Retry failed Direct GET CCCs when the driver reports failure or an I3C
>   error; validation failures are not retried.
>
> Changes in v4:
> - Add optional_bytes to struct i3c_ccc_cmd_payload and retries to
>   struct i3c_ccc_cmd (default I3C_CCC_RETRIES for GET, 0 for SET).
> - Replace CCC-ID-specific payload checks with generic validation using
>   actual_len, len, and optional_bytes.
> - GETMRL and GETMXDS set optional_bytes at the call site instead of
>   hardcoding lengths in the core.
> - Retry failed Direct GET CCCs on any error up to cmd->retries times,
>   per I3C spec Direct GET single-retry model (§5.1.9.2.3); drop M0/M2-
>   gated retry logic.
> - Drop req_lens save/restore and the stack/kmalloc bookkeeping for
>   payload.len.
> - Update I3C master drivers (SVC, Cadence, ADI, Renesas, MIPI HCI) to
>   populate actual_len on successful GET transfers.
> - Use actual_len in getmrl_locked(), getmwl_locked(), getmxds_locked(),
>   and gethdrcap_locked().
> ---
>  drivers/i3c/master.c    | 59 ++++++++++++++++++++++++++++++++++++++---
>  include/linux/i3c/ccc.h |  5 ++++
>  2 files changed, 60 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 037b3b980717..3b6d3ecd9d12 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -915,17 +915,46 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
>  	kfree(dest->payload.data);
>  }
>
> -static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
> -			     struct i3c_ccc_cmd_dest *dests,
> -			     unsigned int ndests)
> +static void i3c_ccc_cmd_init_retries(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
> +				     struct i3c_ccc_cmd_dest *dests,
> +				     unsigned int ndests, unsigned int retries)
>  {
>  	cmd->rnw = rnw ? 1 : 0;
>  	cmd->id = id;
>  	cmd->dests = dests;
>  	cmd->ndests = ndests;
> +	cmd->retries = retries;
>  	cmd->err = I3C_ERROR_UNKNOWN;
>  }
>
> +static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
> +			     struct i3c_ccc_cmd_dest *dests,
> +			     unsigned int ndests)
> +{
> +	i3c_ccc_cmd_init_retries(cmd, rnw, id, dests, ndests,
> +				 rnw ? I3C_CCC_RETRIES : 0);
> +}
> +
> +static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
> +{
> +	unsigned int i;
> +
> +	if (!cmd->rnw)
> +		return 0;
> +
> +	for (i = 0; i < cmd->ndests; i++) {
> +		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
> +
> +		if (p->actual_len > p->len)
> +			return -EIO;
> +
> +		if (p->len && p->actual_len != p->len)
> +			return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
>   * @master: master used to send frames on the bus
> @@ -937,6 +966,9 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
>  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  					  struct i3c_ccc_cmd *cmd)
>  {
> +	unsigned int attempt, max_attempts;
> +	int ret;
> +
>  	if (!cmd || !master)
>  		return -EINVAL;
>
> @@ -954,7 +986,25 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	    !master->ops->supports_ccc_cmd(master, cmd))
>  		return -EOPNOTSUPP;
>
> -	return master->ops->send_ccc_cmd(master, cmd);
> +	max_attempts = cmd->retries + 1;
> +	ret = -EIO;
> +	for (attempt = 0; attempt < max_attempts; attempt++) {
> +		unsigned int i;
> +
> +		if (cmd->rnw)
> +			for (i = 0; i < cmd->ndests; i++)
> +				cmd->dests[i].payload.actual_len = 0;
> +
> +		cmd->err = I3C_ERROR_UNKNOWN;
> +		ret = master->ops->send_ccc_cmd(master, cmd);
> +		if (!ret && cmd->err == I3C_ERROR_UNKNOWN)
> +			break;
> +	}
> +
> +	if (!ret)
> +		ret = i3c_ccc_validate_payload_len(cmd);
> +
> +	return ret;
>
>  static struct i2c_dev_desc *
> @@ -1372,6 +1422,7 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  		 * while expecting shorter length from this CCC command.
>  		 */
>  		dest.payload.len -= 3;
> +		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
>  		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  		if (ret)
>  			goto out;
> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
> index d8052949e57e..2506d83b8255 100644
> --- a/include/linux/i3c/ccc.h
> +++ b/include/linux/i3c/ccc.h
> @@ -12,6 +12,8 @@
>  #include <linux/i3c/device.h>
>
>  /* I3C CCC (Common Command Codes) related definitions */
> +#define I3C_CCC_RETRIES	1
> +
>  #define I3C_CCC_DIRECT			BIT(7)
>
>  #define I3C_CCC_ID(id, broadcast)	\
> @@ -374,12 +376,15 @@ struct i3c_ccc_cmd_dest {
>   * @ndests: number of destinations. Should always be one for broadcast commands
>   * @dests: array of destinations and associated payload for this CCC. Most of
>   *	   the time, only one destination is provided
> + * @retries: number of times to retry a failed Direct GET CCC (see
> + *	     &I3C_CCC_RETRIES)
>   * @err: I3C error code
>   */
>  struct i3c_ccc_cmd {
>  	u8 rnw;
>  	u8 id;
>  	unsigned int ndests;
> +	unsigned int retries;
>  	struct i3c_ccc_cmd_dest *dests;
>  	enum i3c_error_code err;
>  };
> --
> 2.43.7
>
>
