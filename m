Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A880346ADE
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963703; cv=fail; b=VSWyH5kud9NeCxbsYNZ9jr73kk4ngzYiQ2crZRT9DJ+xk2SwHK6Z8Vtk7oqOe87i/iVLf3PRE57bLtTmNqYL7I82Bhs8iOOPivv5ziiNMLMW4zltucJ0kesqpkG6MsZvLUyNz8lrmsrftoGZtM7JwfEOAG8OcuG0tsmHVRjwT6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963703; c=relaxed/simple;
	bh=6J+buBYolYuV0Cf4ZPd0ErYvkCHerciHoCd+Q7srv+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ym719+DfXFeAmloMhNz7zSWx36DnF2K7FroQlele1CZzuj9Zx4fowisLuOQrC8IDEQ428ll1FDfki84T7nnaNjfLUZ5PNC+AfoUes/KN+Q4+QMo1O7fB8RFajcNiyF0j0JGnMCsPCxUq56HXMYcGO062s/vNjvrDCnJeXL7oI/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r2sjSQue; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r2sjSQue"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLMh7HYmX77FPm6dVfp1s0cU/eTeEKWMTgsxcoOsSbT4DidlZpU/m4GdZ1/Dq0UDRyfsIex/TEcTYRYkXTDa+hiCS1Gsm6lAeQOV7JOwr5lVXrscRR8frv2jJFXnD2vWcKS66r7xyXJEOFZMl1jHY4tJaRN06OMz1YRpi8If5oP75wqsiKWJ4DLdCvz+baDDFlAVOVZE1d3KfBQq93PlyrPaCzFjPxwBadqIdDLUmHYSQtfF000iQNPPLdGhAZnaaLgZnhdKcm95ZUzGtmhSbyX+MaBTgBEo0OITY9UE/fu2m30fUBDsxymaMyMRedi1PBRP1Q2XVIh5ersFmFuIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smgkgHgq5der1uIbrwii7UCRBdLNx/jffsmxxDTJR3w=;
 b=tjxM4F82GXLNqRS9zpyXSRHh5tDDFJO5ElR2rEqS0UtKUI5OGifcMU8uFhSESgTYak5zUu16xzw3aVXc5nEf8s7U8Jxs4Hl2raoTp9ffkZR5CaB3KRIyjh019vJgngn5lEfswPIOqKhhQpD4jOoxSJtN219THppPEwVy1P5QlWOY+/vVFCRapeSMOa9PQsTPYfjpFZlbTFznq7re2sxjp3Cf7goXnXFkL6tI/KGyp6c4JwiiYo5lEt9S3sJJSgQZSRvmSv1l4U8cOul4Pz+zgZpvO5HCA9Oa+RZA8MkXK9kynvON+4ic9NtxKEfESWEi+1dju+hUeAkUx2/dKNs/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smgkgHgq5der1uIbrwii7UCRBdLNx/jffsmxxDTJR3w=;
 b=r2sjSQueOruvUHTIDK+XWoRAv/XyKojibe3ZzFbFIPWRQ3fthKpv7+vS5c/nVtEOIDBY5MHnOQF+kaxH3iRE+ZjL0paAcK2wURX263zcmsNrkJ/XpYd6fVWZYNRANnLinyFBPfxxH74cGtglJmLToguoCCuP/sVPLw93hdPCn4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB18075.jpnprd01.prod.outlook.com (2603:1096:405:391::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:28:18 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:28:18 +0000
Date: Mon, 13 Jul 2026 19:27:59 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
Subject: Re: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len,
 validation, and Direct GET retry
Message-ID: <alUgH73gxpKQPOIF@tom-desktop>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB18075:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ad2462-d9b1-4c09-1f1e-08dee104209d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|7416014|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jcMWPetV0z4rdb29TAg8/3Zi6GLXmKgUmgocN5C/U/CCyn3/qqPuHLj7gmZEE8n5T4rxIQqMsiaM5OVEJkWMeXDplsVS5hjURLgHjTHYN+ujEMaTJV1cZWBNGLGVNmCO/o6RoBDgAuLFrmeQPWGgyRFE3Hi7JeO0dDnXBe82vg+TWurQcKPRDafBc2ybjJQ+sdK0YH510YdaCiXEi8jNx7/K8Khl7jSYeik23ZQvP2K+43QIxUEXpmUm64AflqJWLkJJXt0UoGV7zlGmBbXQxLtc5RS7kpX+74GrC+Amkme396zFn+wicuZ7C7eNcQevjVQ/zYYCIHyCtReLqLnfwPiUdHWIkuVa8u8YxSbtFqNbNc5jrvkEuZ0QQW8JTt4qpN+WsVePrhJhg0GrUc8k4GBvJDp1Y4WhXM+10+4dQym5iEj3bZQNkLPDCFpYkgevjYOvk+1R5PtKzWIjeZVngVJT/SPwWwrJGBcmoP4bAMa0NY7lzub1VDBuUxQL6fTgns4hyW2T3pfe0rTAPnIwq1K/Y1hF3UyQPATovjLw7eicgxQbwQQc0w940y//6F9eCoAwIaHlkZPnGhMLLy19suv/uEx9AwZnLALwycvU/71I02SGHG4aYtPuudwW049gq2azN1s47qcz5j6X5YurL3/jocZbaNPBIKLdj50e6tVdSHHotYh4lGXp1LcqIR/uyo51nw7tz0GSooKM/DwY4lrFUpid60ZD9Ba0a/uoJ48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(7416014)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m6w9gAbnzUXto0DsBc5bxpToLPreiX5IX0x5d6bX+PY6/yRwSP4YoaJ6cNRj?=
 =?us-ascii?Q?yew5beNz6JsNyX2MPECI2QtmezUVxV9TbtMTmGYhMsvcxuVaXSkedR9DmWpW?=
 =?us-ascii?Q?zc9J5bTQB0x38jDdEC1NuZscWBB7nvOHYaJF+B7WK+KQam/uTCaQLCeBtETm?=
 =?us-ascii?Q?rlZh5EvazX3ax5z4/EciN/OPZri5d/HSdrUK2si0IgU9yOdvC2dCiGXqA6k2?=
 =?us-ascii?Q?j+WnaFo24SuaWF73CYpJI+Zftvk4e/LAVNnI87615Gm8zJHIuJrpPwhDr86F?=
 =?us-ascii?Q?vCHqX9F1Zh3JwgjT+F2gaK9F4AHkyu8arfKTydEwwTG3BIHhpEbQeEf8TUK1?=
 =?us-ascii?Q?qLl+qYzQIBZVDLP0AM9i1BizoXMCbGr7ksEvkPWASg7kODundASw0laz0orH?=
 =?us-ascii?Q?0ayftyUH1GyiP8F7QUlo/VyfjEbwMm9vp/+AdlRHOVay4+8arMNtazXPFwfu?=
 =?us-ascii?Q?FfQCHTUB6PdoI4Z/7iqjYK/Gk8eMJD2jxnFRi51/DuidGI9WTQME8Uy/JGJT?=
 =?us-ascii?Q?2S2kyLahp3N01c6MlvrW725JX+CWbyenG1aXKc951f6M4gIMxnMAIXSXyKxu?=
 =?us-ascii?Q?5Gj2SfY/7lmsOOMb5Wo/7Q9oLouZer9zHbxoM/4ZekDeOrs7rHKnGXZMyGHE?=
 =?us-ascii?Q?8WYpiV8ygFLW8swIJoMgo9Wiw0CZz4uQcEz+SFVj/4BfYNF/+Ny4TPGMTq+M?=
 =?us-ascii?Q?JSjFcndgSC1Yy+iEQMrBytOmO2VvMuY+txNaEujmo7lyF9A7oOFnK6gCiFoJ?=
 =?us-ascii?Q?TfiSzeTvnqqthL06wcX0t/yv9PTdadGJiwbXipvGTDN/E47hpfxTjFxjcg5z?=
 =?us-ascii?Q?dwy1o2X01ceIAs37XOZsLRjpWbhO6XIG+koRFpPUxd3iGVydtPetnjgzSQcb?=
 =?us-ascii?Q?m8vi8IOOu+qyBYQYMWOp8QHr8JlCfPnOs/tdytFTHufR/kwi/4yzFeS42Ahx?=
 =?us-ascii?Q?jecoVeWarTnjwylARfXugXWUHANpIdIV2GFJksvCDhxd38VFGqvsJNSAWhHz?=
 =?us-ascii?Q?NAEfLZYjVzo1v5VYX7RGcuLXhHFmZwXVvNhHE6Be7gGf0zNukmp6X0fZ44z+?=
 =?us-ascii?Q?ugUUyfiE+7Cor6RdnOAEzctfMPYsr7EcX7dArlVZrXsGJd1q0qqnqWuL9R77?=
 =?us-ascii?Q?oY7Lz6is+NZm/DWm1nqFKivMDrR3U7iwHztVJWCoW97PRBBEw5eU8aBiPt+J?=
 =?us-ascii?Q?x/kRold5J+dggBpKGW3ZdHPX/vSE7/ajqRqRBvQ3WtN+1L5tKX006XpsaAcD?=
 =?us-ascii?Q?39iiJzalr6eJVXZ87Eb7LS0waohKSeSBYiOW5Zg7PgbnGvYjEBeNus8nIw2h?=
 =?us-ascii?Q?tnPZd1kBgw+il0ipzMcrtGxalNgK4cS2Xno2z0P+YfXbsnRW75TKUhjoBCjy?=
 =?us-ascii?Q?OynYhzhE0Hc7Q6pol533nH0tTcUidAkF4Xw5EWAryakNCaOVdYQURG3T30Kj?=
 =?us-ascii?Q?u2dfyy3jBlortl3GJUZ7cXU7acvhzxFI4cQwBCPQwnmwBP4ItW9d8/qMv4qQ?=
 =?us-ascii?Q?7UtSDN4css49t0z2HrI8nku52+BFlWTZntNkwuP2xEynwOd5Uw8zf4GC21+r?=
 =?us-ascii?Q?nZb/yj0OEBwDMUEL/RQfWJTdZa7WzvqfacGyL/RhylJM0QwaV0kDH7FS9fPP?=
 =?us-ascii?Q?PPOvlZeJpFO/rTUgzdndEtsSEGJB5Ae9F9bUIwPB/H3HLL8P2+3Z56T/DNod?=
 =?us-ascii?Q?06EJFuvdjHgVVyDWSZUn40PM9YNftQ7LXavpodO57+7YuqbQlP0JP1i8kKEM?=
 =?us-ascii?Q?U/pWFgK+xbLKmctbVFZ9WswGVsjCXKP28ICTm5U9mldIeLMR+Yyi?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad2462-d9b1-4c09-1f1e-08dee104209d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:28:18.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X07Fdh1oLsDrwWJASZVH+uce3HPXVlYlgiPTcshAWaAHw2PbI18uUjqkrx1YnL4tR/fiyZtYc0HY1PDSjDtlRqs0gsZPi2rCFsmxSmfLt5SF78sVTYiB14n1KhTHp83E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18075

On Wed, Jul 08, 2026 at 12:17:36AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This series improves I3C Common Command Code (CCC) handling in the I3C
> core and master drivers. It separates requested and received GET payload
> lengths, validates GET responses centrally, and retries failed Direct GET
> CCCs once by default.
> 
> The DesignWare I3C master driver reports standard I3C M0/M2 error codes so
> the core can decide when a retry is appropriate. Variable-length GET CCC
> rules (GETMRL, GETMXDS) are described by callers via optional_bytes.
> 
> Patch 1/5 adds actual_len to struct i3c_ccc_cmd_payload.
> 
> Patch 2/5 has all I3C master drivers set actual_len on successful GET
> transfers and updates core GET helpers to interpret results from actual_len
> instead of len.
> 
> Patch 3/5 maps DesignWare CCC hardware errors to I3C M0/M2. M2 is reported
> only for broadcast address-header NACK (7'h7E). Target address NACK
> returns -EIO.
> 
> Patch 4/5 adds retries to struct i3c_ccc_cmd, validates GET payload length
> in i3c_master_send_ccc_cmd_locked() after a successful transfer, and
> retries failed Direct GET CCCs when the driver reports failure or an I3C
> error. Validation failures are not retried.
> 
> Patch 5/5 adds optional_bytes so callers describe variable-length GET CCC
> responses. GETMRL and GETMXDS set optional_bytes at the call site.
> 
> Changes in v6:
> - Fix ADI and Cadence GET actual_len: store hardware-reported xfer bytes
>   in cmd->rx_len and set actual_len from that, not from payload.len.
> - Fix Renesas GET actual_len: drain the response FIFO at rx_buf + rx_count
>   in resp_isr, clamp rx_count to data_len before subtracting (avoids
>   unsigned underflow when rx_isr reads round up to 32-bit words), and
>   report actual_len from cmd->rx_count.
> - Fix dw_i3c_ccc_set() to use dw_i3c_ccc_map_err() so SET CCCs get the
>   same M0/M2 mapping as GET.
> 
> Changes in v5:
> - Split the series into five patches for clearer review:
>   actual_len API, driver/core adoption, DW error mapping, core validation/
>   retry, and optional_bytes.
> - Fix regression in v4 patch 1: keep actual_len assignment in
>   dw_i3c_ccc_get(), not dw_i3c_ccc_set().
> - Move actual_len adoption in drivers/i3c/master.c into patch 2 so patch 2
>   matches its title and works on its own.
> - Split optional_bytes into its own patch (5/5); patch 4/5 adds strict
>   exact-length validation and retry only.
> - Do not retry on validation failure; retry only on driver/I3C errors.
> - Reset actual_len before each GET retry only when cmd->rnw is set.
> - Add @retries kernel-doc for struct i3c_ccc_cmd.
> - Simplify i3c_ccc_validate_payload_len() per review (drop redundant
>   exact-length check when optional_bytes == 0).
> - Clarify GETMXDS fallback comment: with optional_bytes = 3, a 2-byte
>   success on the first attempt no longer needs the shorter retry path.
> - Add Reviewed-by: Alexandre Mergnat on patch 3/5.
> 
> Changes in v4:
> - Add actual_len to keep requested and received lengths separate.
> - Map M2 only for broadcast-address NACK; not for target-address NACK.
> - Replace CCC-ID-specific validation with generic actual_len /
>   optional_bytes checks.
> - Retry Direct GET CCCs on any error (default once), not only M0/M2.
> - Add optional_bytes and cmd->retries to ccc.h; drop req_len and
>   payload.len save/restore in the core.
> - Update SVC, Cadence, ADI, Renesas, and MIPI HCI master drivers.
> 
> Changes in v3:
> - In dw_i3c_master_end_xfer_locked(), move RESPONSE_ERROR_ADDRESS_NACK to
>   return -EIO.
> 
> Changes in v2:
> - Split the monolithic patch into three patches (per review feedback).
> - Move GET payload validation and CCC retry from the DW driver to
>   drivers/i3c/master.c.
> - Validate GET CCCs only; drop SET payload-length checks (DW
>   RESPONSE_PORT_DATA_LEN is 0 on SET).
> - Retry GET CCCs only; do not repeat side-effecting SET CCCs.
> - Tighten GETMRL validation to exactly 2 or 3 bytes; add GETMXDS
>   2/5-byte handling.
> - Expand M0 mapping to CRC/parity/transfer-abort, not only frame
>   errors.
> - Restore dests[].payload.len before retry and on error return.
> - Avoid kmalloc on the common single-destination GET path.
> 
> 
> Adrian Ng Ho Yin (5):
>   i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
>   i3c: master: Report actual GET CCC payload length on success
>   i3c: master: dw: Map CCC hardware errors to I3C M0/M2
>   i3c: master: Validate GET CCC payload length and retry Direct GET once
>   i3c: master: Add optional_bytes for variable-length GET CCC validation

Tested on RZ/G3E:

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> 
>  drivers/i3c/master.c                   | 97 ++++++++++++++++++++++----
>  drivers/i3c/master/adi-i3c-master.c    |  3 +
>  drivers/i3c/master/dw-i3c-master.c     | 31 ++++++--
>  drivers/i3c/master/i3c-master-cdns.c   |  3 +
>  drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
>  drivers/i3c/master/renesas-i3c.c       | 16 +++--
>  drivers/i3c/master/svc-i3c-master.c    |  4 +-
>  include/linux/i3c/ccc.h                | 11 ++-
>  8 files changed, 142 insertions(+), 28 deletions(-)
> 
> -- 
> 2.43.7
> 
