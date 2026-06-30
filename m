Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F15218ADD
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839020; cv=fail; b=e834/K1ygIBvVHpnk4SYKboSryg95IlhUer7O0j3tbhloVyZUUdnWpqBYJaK9U+Ces4A7kOR5x8H+tXTeLbPnYU8C4NQMJav6KpHarwLpEzUH1gmdImdH1vS5fTdJWkYBSCr5xeGMyH8xPoCQX0RC8waOvmCPdbcVsvQWnew/5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839020; c=relaxed/simple;
	bh=BCy/xJBJBSaLX4meccLaHAEpVwH478HBi8UYdALHlMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wp7vwJPb/EUJxld/HdgVXZ5BZpoY6WixhhTKb/5U7kRuMLxHC9lyk6jfy1Rh19YbvPqbDgmJDCiNO5+VErGex9NEkb0/1TqgzxMsi3mBRwsAuBjgbiKBDOqGHBfmSWm1M4kU2fwYPOuET8AugoZCCZ+Pwk/9am6upJCoyZ1zXGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xVvLCQc8; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xVvLCQc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ1QHsYfuUD10rGnS5Dnp3MciUvz5hdXpSNJ1OjYgF8f0mHKLE+z4dHQggZVCS0IHXsYtOzB9NLgXQKjV2LhkmRAuOkH6lglImbEIj/1DpUAoj4D/Wntkqut3LdIVHYmx7XScQOcoKJpPV3Dc89mXfo9iCUpZuqh/tp41rS7XbGl9wbyP+UQVI/c7ADG46yNNMp/gy9ZFjIAMy/CHmuy+mndI9z5q0u+nhnZO0GC8rovv7zpv4/uJGnWqZMhu+yMR4p6DTqSgyOA1OemzO2KHSoQYzJjWvYTCvcbSjES1fMDOtLW+FWbbyedU68EOvKQ90N2UhHbkWeluAo7KFpmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgF/hkOt7cdTFT1br6Mi0y5JCWhoqsFdkdzXpwSA9UY=;
 b=h0e9nCO4ccFl+uPe11OSvKCuqbTd/SFpfuZTd74stCZa4VEcUQF/5Dtg+qlMo8EfKUeKqeyh41MqGCXSAGMt1hOGTRxPz0ORlHCeAmxk8e7EUIO9aHFiu//GsEHNbqmAi7PZ8oGhLOiX/sU660W2p5n7V/Qy0lbiJ1D57M830aox/HPY+N7Z9w+UEqupB7pjtpfuGljiYj7ArXBd3dI/+TA/DjC2huFfyYhqNzrHWbQgW7LcTlBOVbmJn+bIq9UxjYiI/Zgrlb8/bqBa32PaFFzELVWqBJh79lvT2JpHWSkHcBhLmJHprhW6HgbUA3+jnD6SanPYAHXYJYLCjSz/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgF/hkOt7cdTFT1br6Mi0y5JCWhoqsFdkdzXpwSA9UY=;
 b=xVvLCQc8NCT0Uz9PvMCv1u2A4LarIob9bMtr9XkWad5qB2i3a4QVN+jYre5mFqq4eLH7dIkSZpNtRHyQzwsmfiBjxvQEudg0GfGEJ4PEq7ocfT9TQicGQMQBVXAR6wC4LZXbSwB1zBiJTftSWI4l2h4nQ2w6fjyI6xme8+mFJg6yeU+23nY/1cF9l93iKrVF7Ev8f/qCyfaiAmQ2SN2vmjJIF5rPoa6TaXN1d43i/uXce9qvDMr8xVlvwgVgr2Ng9Yaz1bHe+6nd5geru63IklGO22oMxOJv16k4PqDa/+slw6CQEPSnnWIFayC/ou05C5TCvYVuu4hJUOJMgJRxjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 17:03:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 17:03:34 +0000
Date: Tue, 30 Jun 2026 13:03:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Message-ID: <akP23nXJN5sBNb8c@lizhi-Precision-Tower-5810>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SA9PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:806:22::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5f0d9a-3792-4d05-021a-08ded6c98546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|376014|7416014|366016|22082099003|56012099006|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	R3Nb/Bo7ByabJmuE2lRFXDwMNllTx002nJ+nOWtitej+OTU8HrekxnF8zNDp0Hki5WOY5IoqvnPNAWB6RZ2xuMKfbJysIXYgKrqflHTlBh4Kxz3BaauDLiTgUF6oaMwdNh5g+/A66DGF8kJ5oEizzBmsWrEegtnQU/blQbQTrUTiwOoqAFyusw1WOnxo0i0TGwW4ev6tkhliNoy/5Ymm1bFTyFdoIhqwwDri3J0y5Mn923fJztpNJfRxA6zS84KJZwNljNeIJOChGlX5DxXr99d/I3/MEKQqDZUdCukkR8sTw/OlWdO2I8sozZbGBHx/ktqzFERuPnERiLmZEC2mMgAzmWVM+IjsCnvzBA4s/JVDiPceHil0rkD8p4hI/MoxaLftkstq5/Fj+9tDN6n0iz/csTaBw2XknThFgaCu+VJaV0CWEhS+eCOV59CAcnSZ9njYRmTGcn1947giwo2468k/JmB++Kg56WjwwUdMv3pw4L4C7CZiSmE5Gqxe9b8OX76ha1GdhtpSRDAjIGfZX07fJMf39VTizqrQupzoOy07YTRyDQNFCClcbw0IuuCeKPTOeWULViqi9grKvCeLjkS0DM6ulrNkvCDdz5t7AkL+ymfAFH33KE6SRQS7wM4PblxMj/KFqhYPx2enhKUvBlkVN3iLhZYY48RkJT5rBH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(376014)(7416014)(366016)(22082099003)(56012099006)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?td3AiOEdHNAJqmJuywzZA3BIwJDoTkls01FfV3BcazsbRdxqWCOT59ModZ3i?=
 =?us-ascii?Q?Y8hYm8BkmCjsJfQDXeMbj+ExwRPZ1x9jHYUuRNZd5tYgy9RtiIdIL6CmyHqb?=
 =?us-ascii?Q?jxKVNvq5YvtXn2aVz6c7kY0KFidFwfYAutnDXJIuyhnuJ5PrKNV1AkTobHgB?=
 =?us-ascii?Q?Mp5nQ9SKBMINFgEznfOLxxs0hEp98dp4NzfL7bpHHCB72LwHlUpVX01wYffx?=
 =?us-ascii?Q?wrygWssnelSZxCkd1OmPpLr2cdHiqFvDKHIQ5B/XkDDTw4K6v18HugHMMotZ?=
 =?us-ascii?Q?SHDsOk1B4nfLiaMZDzj70inXeyLZ32PdQ4FytwJxJ3Kuj84TQvjTgg4/6nZI?=
 =?us-ascii?Q?hI2MqBy5VtST1LPWjnqIGIYwFTKf9ZritBisNbB/qJV5TThBfBCSLAN6ryYi?=
 =?us-ascii?Q?QHmY/a68hJ25m2J2OkYn1Ot1Y6+a3azEggb7wAe6AOsdFjvCH4vgOT10V5fN?=
 =?us-ascii?Q?9SPJ5h5K1AK0PkQn2goVEGZQJzgxixzxnqCIJoEGjbA4jOynzvXWDD7JeiM9?=
 =?us-ascii?Q?8w54Fg69XyV+ZJUvZmTDuVZIcdM9Yos0KH0UtD48WSHB/jh5ILxRXcQ7Fs2s?=
 =?us-ascii?Q?nvwrCs2idl0sYOWicCX0fqGzCyQogimRh5yhL9UIE7X7ZR9wlx3dnEw3WWAB?=
 =?us-ascii?Q?in3q2hH0JvV8jcqSqtSWG+Uy75J7uTRyPm8OSIXMy8fosULAneEFGcC8FeMC?=
 =?us-ascii?Q?6HNby1m4rvtdj0MtSw1dqx1kmaGzXS4+k3DjHaoRoXcgkt8arTYi/ZDFhjbl?=
 =?us-ascii?Q?j9GpDPmrMHqD3EdWWfaokmZj1iyQDQhCYf5YjOCuZdZneNODUwC3R/lx2cI7?=
 =?us-ascii?Q?BncFrqizqEl9P6WF0cWPakpyoh91lapQ0vCCC0AWavJgWM9ZGFSsysN4TLrf?=
 =?us-ascii?Q?VdLabX9GKG/BnZZMjEQwd0p8fnnZwGkogCLOcpXV+ZIKSC1tbnxOwUK4oqUz?=
 =?us-ascii?Q?lJrexjGJFbedfvqsYui2Brts2KQg9nloeDuIP5RUQmvooP/hCe/tEuXiC9Ms?=
 =?us-ascii?Q?MgkEmWaQqaGPzE+01ymw4rfQCYbyLeCaLzdLpCMy0oPOw4+SSZLo7zHNI2hp?=
 =?us-ascii?Q?CqDqWi0T3ZWN8P1zS9k11aztnQ9d7FfxiJiQ2ilYf0bTLNAzHOooxs9tiyy2?=
 =?us-ascii?Q?LM9HgDCBJ24/k9FmyJAn8HCsyGMnzIYuZBbVqtSy5UhcaRTzulHIhTUkMIFP?=
 =?us-ascii?Q?FolVsE/ABKEP+9pSmg3PUtQRv08DrohW5oGSrL8K9aMvnZjQuM4gBQ0qnrJP?=
 =?us-ascii?Q?S8/txCKr/GrK0N/M/TInyBRf2D6WWGpQIZT/YCAu98Y/g+WeAj83SXA52W01?=
 =?us-ascii?Q?rYDyb6YucE97Th5BlffQ+X791l2Bnj77NpyPLdtVprmm8uV8/dcLo3NsYXvA?=
 =?us-ascii?Q?79BDUxBXktsnX7ooY1g8hpYqW/0RvrT7Kfi3hCaUQ1cDgsxPOcTNigBUAoct?=
 =?us-ascii?Q?FHnSGEVWOQ1o1VxoyFVGwDSKeHixOEH5jp644lOg16CRaLmmBPgHHvnd3Hb0?=
 =?us-ascii?Q?ZVFyYPjL8zVAc7L5Ni1e/jAaaePwnn8s14FyY+NH3I4I3SAQfReSHHrZW3IY?=
 =?us-ascii?Q?nmE2Y7ByyuYNHxcSKIZx5sTVwKdCStoiYdhi4RI+mKflbnqHVhgY/YdPJSez?=
 =?us-ascii?Q?gb/kr3oJVsYVZDjZZRv5PvwNTr9BlxDTTO000GAbn6h28v41RcCchp9BhgeH?=
 =?us-ascii?Q?9vTRtIh0wtGZPWue6R5G8O1icgxsGHvWZrFf75EQ2JCMmmVmwZ7J6xrcWc0T?=
 =?us-ascii?Q?JcXvECGeHFFy41f8Gn3gMH8m8vVof7JqoxZAiVlbm3ABvA3j6TbO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5f0d9a-3792-4d05-021a-08ded6c98546
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:03:34.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u/ecntNcKPYT1R8UGNXYX3bm6jgjp3jm7chxGh1y1CL8BnqpkCpJJ03an1GpPQCT1NlE+Ab8houVwgwyhfsVvEHWyGstCS+rRR4PD3IYWN7R1bWpsdsHkYXQQHlGYis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On Tue, Jun 30, 2026 at 06:20:25AM -0700, tze.yee.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> On successful GET CCC transfers, set dests[0].payload.actual_len from
> RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
> actually read. Add actual_len to struct i3c_ccc_cmd_payload to keep
> the requested buffer size in len.
>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 5 ++++-
>  include/linux/i3c/ccc.h            | 4 +++-

Can you split into two patches, first patch just add actual_len in ccc.h

Frank

>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..856961da1827 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> +	cmd = &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len = cmd->rx_len;
> +	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
>  		ccc->err = I3C_ERROR_M2;
>
>  	return ret;
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
