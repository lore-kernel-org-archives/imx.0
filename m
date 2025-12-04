Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEF2FB627
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842317; cv=fail; b=Hh/nAw4o/UMsjKY5KZxbQYQXCepkOJEfZ+aZs+Rp517iQLIsgDBXg7UIcz3zwwQMAuc7lXm0Dk3v3VQRmuiXwpX3ADQhum2l3w9Ylu7JSgKA+/LaC+JLH0kv5wHrqxU4GnW6kuSMj9p5/YVN9Tz0zC6SHZwncKslOauLxY1OPsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842317; c=relaxed/simple;
	bh=ExKZwZicQs9x8S0vYnxfHCUN02kBNkZS91XGS4jU28M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LREtrJFQpg/MOBpJ8+KnTadh9ysAcpDSz5SRFlZqWdOLSJtGzH45MAWcxnw92cSWroBgz2CI3dZPT41tlggmdLZBZr3wzxvS35GuNmmABZnyTR31joH949zxSscD3kAgvSS8aNj03r8n69l/u7Bv9yHzhrDrPNfUpYO/APZGIFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rkbIqlOb; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rkbIqlOb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ocf5J454hLYHvNHMb94evvBCd3UVN2Ks+vdgCjsBJFPvKONGWhLkfgF7oJA5QeEwFfBqKmmVXFOplzSlA7w+u9cb4rMGoWWTP7Nnr0d0rpN+ctTeTQjqTqbB9jeFEA+Uw9Gh72JyOth8ZR2X80UuZpGPJXs+5GMTLBVXIUdIKXNgaXVlGHYdl2UVzvzY2+hmFk84rmw1Is6YbGc3WxWbXoJcShGE65HjUxV3aWaqU5Gjd9kYAdZPsGOojgoWRtfN6Vsg9jk72XVRDXXu59NYPD9dxa8pcVJRkUgicyCW53pdCJotYtRRkHcsovXVEpDGQrY4l5EX7gUifIf/0SigvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jALIequZgyp9sE9wpIFz5msWrC6m3lhqsIebjqU/VHs=;
 b=F2+f0X8pEnsKW/Q0bw+Qvp/xjkJkU+jG2qWC2NPE7ZVfaYnBo1RdoDRqIgn5wkgVeMM+I1VDYTOMHjB05f0mqwX7Rv2PJE1yNWlLyCrsooOPtShDmzdT+LTTfX/PpeC0+MKKNqHSGRqOCgK20QVGhMiBzUSPy4ikzr1SpkHVUlLxaVUbwd7gBq2KgrpTPTdr5XxVyMv+XCwdAqJL0GQD9YP22UxSyNVWkbhkEV3KdpcvRdBhy/+JIJz3trS8UdMTRg7qRiBxoafwVjZHFH5mmbQ8yjM/HU4uEuW/S6+STOjY9l0cKdD9vwnN1thopFIFKZyofnGbR2exxIxS7cdAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jALIequZgyp9sE9wpIFz5msWrC6m3lhqsIebjqU/VHs=;
 b=rkbIqlObDoFw0y8BqwlhH+mqmmi4mfefuUoix95eYA8VKs0Mq1EpLVoiQMIwSI0nOUsSRkgog0eDwNba66XiMoFbrx0+HHeF8T6OdgmRzES5tTBJ6BN5aPSV3/PhDdXbfxEzUN8iBHzct7OhlWqZxCL50RUlOl4ud6e1ck06HSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12255.jpnprd01.prod.outlook.com (2603:1096:405:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 09:58:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:58:31 +0000
Date: Thu, 4 Dec 2025 10:58:20 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] i3c: master: cleanup callback .priv_xfers()
Message-ID: <aTFbPE1KHWVeZYi2@tom-desktop>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
 <20251203-i3c_xfer_cleanup_master-v2-2-7dd94d04ee2d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-2-7dd94d04ee2d@nxp.com>
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bd62f4-7101-46b1-8fe1-08de331badec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wMLTy1rD49E0/amT7NytTXKopWV3wFSeCLHvU5EJxYjtooFvKh5R+oxBsrg4?=
 =?us-ascii?Q?PgzKIFvB93kCTO43+dSZHj4nvWfwKilqEq+wK+Qmyr5IxxLUngaGt90fJ872?=
 =?us-ascii?Q?97RZdHGdvSHZBsoFnCXDNl38TzJUdEKmbgUhiJe33ixautQ0j5fjQQVROf6T?=
 =?us-ascii?Q?F9UocO3RdQ+EAJLxRTw+djGr/L/5YgpIuDbC/J2swh78AgTi+p2iF5xseIZk?=
 =?us-ascii?Q?ioYKYG99mEcyU6wVwe6Ib/KwaQ5OxbV+T3vGGat57AcPNtiFwkTc8ZFCLrsA?=
 =?us-ascii?Q?Fx9F9cGJi/eY+8Ce0qUoWIHN9kJLi6GRQLWye4P3cVBHy1xw95VqjZNckhrO?=
 =?us-ascii?Q?A+PGwR/urv0aoFHM5hEGVlb3GT4GapLHdJx+zKUeYOcsgLDOWQk/SEbSKFXq?=
 =?us-ascii?Q?CD0eOzqqNS5p6bKdtaET87bpSGT2CYaYIyE/E4k+pthJ+mEj7xvyzrh6ls6l?=
 =?us-ascii?Q?fAdhmnqjkG+pSfh7inEII2jH0dfRQ4DOTmPjBDtFfTZNISB/n7U4+L1XLSYe?=
 =?us-ascii?Q?SkNHuy0uGf0y4US4VAPwHhAIwDxTcksQbG2WWece5gNuGNW3DBov43P4SUyb?=
 =?us-ascii?Q?w4bpd0uN2OfvAh4ISdNG4ePC8XQrIwQ//HWf1wUMJImRGgvzGJEz+dSWqCGt?=
 =?us-ascii?Q?mahttJg5eojNTkM9TDUNU1KV0Ic0bqkNbsZbAwtq/1s+n0HV2P4oemdZjz0e?=
 =?us-ascii?Q?TNdpxz5tYJvHEYQxeYJdyHIvNfaCzLEezvmehl1t4QLjgTm95GBGvZ8qBKsw?=
 =?us-ascii?Q?r0S0iJ+Lu6s49WcKv2EBURqEqlovfFamKfz7pw/jPmM4qMWOrEqBZ7MqlDpF?=
 =?us-ascii?Q?D4TTNF5MwLpJo1PZiZ6wmejhjCytg0WHEIHVSa8Y3wsCoy4zWqy63sAU20NR?=
 =?us-ascii?Q?Ry3Gn3+EBN5HaP8VqFB84gSAjvtS+Wf+odjS2+48hzjy9ymqRaSqAT1jSYTR?=
 =?us-ascii?Q?jNIzFKobqV2GWQ7CLS2xF9mva4lSPT6rBcWwHU6tLqkSDQXFQnJOXmnAs1jp?=
 =?us-ascii?Q?TlJufLpg808/D5j0IOkMwjy+7v140ABg51F5RQTlL9/5jt4yL8QP7VaC2rSe?=
 =?us-ascii?Q?hHLEk2S53UyJRysC3Lj+oISmYKBTssgKGsj6CItf3HLouUzukluyT5T7lU7C?=
 =?us-ascii?Q?mFFXwM6phtvTx5bgQGcGt49N7lkp3GqWFGGEnnrHcFmbevzDy8CsIPfarNBf?=
 =?us-ascii?Q?Pj6QP1nphLOO5FOarYK1Fv2nSwB2hEMpuNt1iOrQfrLJL7D3MPqhChrPyvB3?=
 =?us-ascii?Q?OMCGJ8Bfu2l1ya0RGS7wx/xnnsY5L+vMpqQmgz/dYt9J03GrrwK3r9Wenw+D?=
 =?us-ascii?Q?FOsdewcYZoJbqLH3ULJijc+E7SrsSZNoxjSeP77JZKZcwbT1xq0vbVo7Ln3Z?=
 =?us-ascii?Q?j+Tb/C4uhWXBxY8/BysV1ORZzAbNbV/nsF0BRYRtAkM6ttEPVQIsDG0BQdU5?=
 =?us-ascii?Q?EFgx36orenaQAev3Vn2U0baItJ5WBVk/oNBMwCBMPe0bgrcSIDSEbUT0GPmA?=
 =?us-ascii?Q?Gs2DpLbaLhkFt7lVHuGumbIY+pM6hSxI0XSr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KQBQ/eihA18EvHlaGptjMTgrlJiOUOseZtN2H4XwuFpeNuum8ogBttsLRux/?=
 =?us-ascii?Q?NSMUzqH8Qq+/k+7H2cXYmNHvsX0jhEXi+4dZ7ruDL9lSWjgoN6E93uRZpHHy?=
 =?us-ascii?Q?G5WN/fa6DapGJRhVEo7rQ+03FNMINT09sAa4eAriIUFaevRdT45zJHa/kA7l?=
 =?us-ascii?Q?m1QeYmZX6o0zeDuMgOKYGcxjX8QTZGl6GS78zZDfRepifKVDRIM4FHIoYxhu?=
 =?us-ascii?Q?RyJO922XK9r9ivLeUWN/W20NXsHu3GYM4nZXQdIVYHgQ9Mh+1h2gdTGM2v6r?=
 =?us-ascii?Q?gUY2IX+KjQpApXDj0Db3Sr4OqotQy6HY0LZWyTReOdADWLFkvaQPDGv9Z3cN?=
 =?us-ascii?Q?6ZCfKoxRs3wV92SFp2a/AeEAI4f7SVX596wPztb+o92kLbhAtieQ0mlq7PXl?=
 =?us-ascii?Q?GfylfvTvh+Q8kYgh3LjoowpcgXQgP0g6YGgGSecNwSCNrpjLPwCnuIeMte0e?=
 =?us-ascii?Q?AF42unBTuTsM2E+VuqOlWwfum+syMh4I5lPB6WRUWCVCgug1fG18DlGeRRcN?=
 =?us-ascii?Q?DZBPDHUoy3JPWHEb8u92G/xGn0+bCZCPgsaCBeHbP2oAgQugGtZi+l/uCoet?=
 =?us-ascii?Q?BPLgZHG9VWxcL/Bfy2FuvO4zKhiOu735ribfPVjAfVbRtASmLKo2+HG2hxlS?=
 =?us-ascii?Q?GwX3wUBCqRD5MMNIYO2SZnKVkctzXD+HpBa3eHCpzbYAFUgFztqt88GSIXOk?=
 =?us-ascii?Q?Rd09jUO+5t+Iz5kATYfOlDip+z006YGStx+vuoE26aHPuqVX5mSnPRQjYtn+?=
 =?us-ascii?Q?/jJD0sZBz4XLn9znRGE5qx6kbjneN9y6KWtNOJnaiqlzWgoAnZSXwx+oK1AQ?=
 =?us-ascii?Q?W2z8Gz1CFbeP7q2WkGGN6xgH8/S8P6vVYKEj8KhtoTmlfaK2Q5oF5CU55V+N?=
 =?us-ascii?Q?C35k2hqL5M+PbDlo9nR0U3/E8WlR2v/Am3D138O0rP2Hr66giEmXl17j5dtD?=
 =?us-ascii?Q?NPtdYcLstuZ3dZwdMNfC6R3F5eMz4H6g/9LWOTvUStLto126ibeSkeDfGyJW?=
 =?us-ascii?Q?qyqMQmuqrU0IJFp9QgKM62YbA3Kxmc5ZPc3C+vh00ccxZBRmp388Fv0W4X7m?=
 =?us-ascii?Q?0mnYYOfUOBiOJqcy9eQJrfLZJpU+oZgFSK2ioUGButHOYwoBIXg16SSGLwS2?=
 =?us-ascii?Q?aDqFiSnIUkDx/xMHREi93PFGcxTbZvZhn7myfko3HoutI+P4EG4KmjH7YCra?=
 =?us-ascii?Q?c4vGw96BlThOIe7GovvBTndgVe2dNl1SOrM/leybMiqLOFqa91k2CWrid9gS?=
 =?us-ascii?Q?Zc0ddZVxnU8EySg8kpo7CaTO6nCWcLvqThl+alaqAPxaI02IokdlkTmnZBFs?=
 =?us-ascii?Q?iRKMkOyEGZ+iGhpp1xKN4QIDzMc+usby7qccnVvDC0+Q1s8GjrkQjBMWZdyv?=
 =?us-ascii?Q?EMtsboR+NcyaA36xAiFPPM1jS9O5+ABZyrj9PDtIiH6MjYz0M7BPdODdH4xL?=
 =?us-ascii?Q?f/ceH6LRBCpscWLE2Z0BZCPRTG1XfHQwrKi5NXeQOGJDCyMr5O2sSQrx6Wsm?=
 =?us-ascii?Q?wC7uv73hQXqegjtw16iwcsrVTW7VJARvDh2BJjsMs5sCPQHWQ2C3Y1oMaIpm?=
 =?us-ascii?Q?rO8Cs9AhwGVHlMpMK6dRPgXT9kkXfriYxRWvtElJVB/pJTW+gP0rmdO5oARJ?=
 =?us-ascii?Q?9PWT3hIx5ixrKg5xZcJghwg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bd62f4-7101-46b1-8fe1-08de331badec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:58:31.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmJ/NeLgAD+hh/dJtmn8uxxUzRU1NIZ82Q26DNiCMYyQWROlTbmjVJIDExUhuCiANbHSWQz25DIX+HPNL4wu0ICO44Z0Xy/4gT9BuElellaJzmRc+uUj9ARM4vp2E+M2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12255

On Wed, Dec 03, 2025 at 03:45:51PM -0500, Frank Li wrote:
> Remove the .priv_xfers() callback from the framework after all master
> controller drivers have switched to use the new .i3c_xfers() callback.
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master.c       | 14 ++------------
>  include/linux/i3c/master.h | 11 +----------
>  2 files changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f88f7e19203ae5a90267b2491f3b13b6205863e8..ea45a519dd68a514fd7fe8314b3fcf2c5604aa64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2819,14 +2819,10 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
>  
>  static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  {
> -	if (!ops || !ops->bus_init ||
> +	if (!ops || !ops->bus_init || !ops->i3c_xfers ||
>  	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
>  		return -EINVAL;
>  
> -	/* Must provide one of priv_xfers (SDR only) or i3c_xfers (all modes) */
> -	if (!ops->priv_xfers && !ops->i3c_xfers)
> -		return -EINVAL;
> -
>  	if (ops->request_ibi &&
>  	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
>  	     !ops->recycle_ibi_slot))
> @@ -3031,13 +3027,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>  	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
>  		return -EOPNOTSUPP;
>  
> -	if (master->ops->i3c_xfers)
> -		return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
> -
> -	if (mode != I3C_SDR)
> -		return -EINVAL;
> -
> -	return master->ops->priv_xfers(dev, xfers, nxfers);
> +	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  }
>  
>  int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 2fd850f4678b22f352507f8f55910a196536a1e5..6225ad28f210fa15a8f2d521a565ef06995e2470 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -417,12 +417,7 @@ struct i3c_bus {
>   *		      all CCC commands are supported.
>   * @send_ccc_cmd: send a CCC command
>   *		  This method is mandatory.
> - * @priv_xfers: do one or several private I3C SDR transfers
> - *		This method is mandatory when i3c_xfers is not implemented. It
> - *		is deprecated.
> - * @i3c_xfers: do one or several I3C SDR or HDR transfers
> - *	       This method is mandatory when priv_xfers is not implemented but
> - *	       should be implemented instead of priv_xfers.
> + * @i3c_xfers: do one or several I3C SDR or HDR transfers.
>   * @attach_i2c_dev: called every time an I2C device is attached to the bus.
>   *		    This is a good place to attach master controller specific
>   *		    data to I2C devices.
> @@ -478,10 +473,6 @@ struct i3c_master_controller_ops {
>  				 const struct i3c_ccc_cmd *cmd);
>  	int (*send_ccc_cmd)(struct i3c_master_controller *master,
>  			    struct i3c_ccc_cmd *cmd);
> -	/* Deprecated, please use i3c_xfers() */
> -	int (*priv_xfers)(struct i3c_dev_desc *dev,
> -			  struct i3c_priv_xfer *xfers,
> -			  int nxfers);
>  	int (*i3c_xfers)(struct i3c_dev_desc *dev,
>  			 struct i3c_xfer *xfers,
>  			 int nxfers, enum i3c_xfer_mode mode);
> 
> -- 
> 2.34.1
> 
> 
