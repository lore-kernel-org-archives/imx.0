Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A0309EE7
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003144; cv=fail; b=RHxwuzwMwHYoYvibJnS7bdP9KD27ycjK3HKRU5M8Tkol9RxZRkefKTRjudRjwmaX226lG6GXoJ56RTLpnauvLYlhDwdHJq/UoKcQTDSth1fwXlXzR5xykBGHrY8JTJKRRorE1XhFeh3vs/Xuxz/DHZ6hj7RS74W1ygvgfcjgyNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003144; c=relaxed/simple;
	bh=qQm28SL1pbit/mWZK15kydzTt0LRXQU3gMPMPgmVS4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rqpyxAeSVTwGNAPCI3DRhFV+yF5z1Y2StV34C64YV+u9jP1eeY4Up8Ye2GvZMNaudOQn1v9BT8nzxTwepX3cHynreesCoe4F9Ah+ET3fnl4ql8/uDbEn78xjtkVtaN6ULFGmpaE152oVL7AkXReygIZXmAhl3d7llHiNBNuUOlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yvr7DUQD; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yvr7DUQD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+GueSxMzUEE28if/fIbREW+spL0azu+epvI738eL0MJm9ea4OOjgPSF2MgIvuHJNokPLYinX/Re643EVwkMjXjS7DsXXAAkovGP60pDeFUaKil5AHCg6qcxCJHG36lhc8RMkPVsJKbB+fqOYZ85qBQT7EZvi63YAl8RcDMcd21lDndOONMEj4PU1vyVTekkh3PJWFQ+hAwU1MLHHz0RKV7davTu/P+BrchPaI86SgUVvIGGNrdOgr+2a63KGUE9oFiNaN/P8HnHXPAn7IFokshHm+T/RAlaqCGTVvto2SGvbibqgHZ16VvMb8/yvRaF6qEqpN7HiQRZcUTtMflfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA39F7cN1iayLPxbapMU/INNwmhDr3TuaKn+9bZsBvA=;
 b=fpliLIqJt4ybvm8cmSHCm+vmh+2viN3q3//qPgRVrO/Jbd1DEzzYuKq1PxIteJsw2jYl21VCdy8cQ083CRLWP5VQXuoOe8oR8XguupjzE+ciz139zL6YISqMCfdfrXlk8zjk0pTPcbnJ1OblqvYdC9fPXveVX/s8eDOS+zR1mTIJaqmhp5Ck7f2Z4VGLpfaqJgXtiGdlbLMSClMrQLFY7PJXN7qAn1Sj4ek/ML4mddwvCt5WTZ2F6gKguFLROHdGu7CHPGrHVU+4O6SOKacCbhUD6y12LJWX/rZPXKVt4LkgevKeF3OiGUnndeVhpJWmhR5P+GwSnhTNFGB9CaeTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA39F7cN1iayLPxbapMU/INNwmhDr3TuaKn+9bZsBvA=;
 b=Yvr7DUQDwDjQ/2uesiuyWBXooeEaannYYDvTm0oSmmSFhshbMayG/0uRtN6lEJVVB4pcn+y85pnv9+hRflywq/hqgipeQfc9wsK3ryDDzmyGdo/V9MyNdFaucjF90eLoSufToOYO9pfYR3EhbOObFlnviSRQYStCE6NK2aONu5F99HJe+rBY267oVae083UcoXcFfTCw5vp6qx4PSmWFoDtSdVQNZ2NAxbJNb/wfmUgDr70ipY0wDIwOim7PsYlNJLjIeQXkwUCDnGfCDLZ5rypha7nmYmfGmIEg4Py+qAe8iBKz9NA6JzHTzdctUXZadV5wWp+56efgTTYc1mxAng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:58:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 03:58:59 +0000
Date: Thu, 23 Apr 2026 23:58:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/7] media: synopsys: Fix IPI using hardcoded datatype
Message-ID: <aerqfAfq9w7y_RCd@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-2-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-2-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0119.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: a29f4a95-0e5c-40f5-e8f2-08dea1b5d077
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 29CucX5/BK+XOGACGmZV2pNGAmitJX0pwxPGo+/8Rfy0O5q7dR2XBjdHvilliUyownvSqjFwbzR4KeO6qBCNqbB8hyCCmICz7SW2XolosrBgDosWz5grW4LFpLobOPFnw2/FPzv2eUqxFu2PG9bNpNeyPZKbgTKLAftmF4E7dp1uNAB/jkRekmR0Az2bClBR2NPCdfHtn718ZLQCGQtReWqEfCj9Z4TiIuCoRyla8tz1Z0GsPYlBPxb5tNG2DYuURdhDON/+GhAPIFdCfnOnJ3XXlf8yUih6Fo3wuUeyCSHzF+Hi0uyvnNzrs5PsXIfOA/LRPdknLmsZ8S1nC0HBqPydqzMcW4wMqqhO+tdGi4dQuT2qP504B/zP/8Mv1GBUWy8SDWCnfrMhGg9tg7n1e+sdfc29vqgRzhrQz097kKxBbzmvyXsB6Th/0gtG0nQhm9rE/wFJetAqZ3NkwyFyiASFKyMOo0W9nmTlnglFS8QZ3HYwDHn3YvsT/6osagFtauo82W7dOBXgpQ4IDlonLQH9fBioOagBiLpvm29xPcFTZMdMO6sz4EdUXwk2Dx64gJ+Tl7iWxmj0tSNk4t8nJI+TKbBt0yEYD83Omsv0e0OeuBN4FkRnR6S6X9cmK2O1uCpGTxOqUYtlGzLrrUCiO0dQgkq/y5EpVXho3x0OD9qSuxw1e9LLC/ryETLIXl+TUkgBdPDKJuKM0hTmhhbNw/yZj9RDKe8oGoJKhCywGaRKA3P68xTJP7N8Zqjy+wy0D0QzFSnUigUVZtF9GKzXOTxLRukq9xT4NHMNdwFb11Y=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sfR2CzUhRhtWAClOI82/QOKe0sBRAMxExUXwhjXL/kOz9k19XKFES5N5AZ7f?=
 =?us-ascii?Q?vK30WLQ60iSNDO1RBCYjjQIQAJ9AMd/UIrjzm5KFKjGuwCUz463CXtIp+2xT?=
 =?us-ascii?Q?Whkv0YIlRQC0w26YAyG6ld21Zvc2QjtNYKiVK2Eq6Sjo7Rkp2Y5dldmfQsO5?=
 =?us-ascii?Q?GTLz2RNJ4oTzWmGaVzzXlhz8Aoeqi34abrjEmqhEcb9VGjUawZeS+n9hSVTX?=
 =?us-ascii?Q?w4IA8xRwrXUGpBuxe7Pwd3cLHiFKD9m0smxazl9iDl426IIhBAxI4lKpjasj?=
 =?us-ascii?Q?wRdGyQ9VEE1KXR/a7vdXN0m9zXbC9ly3ZPWX4LNP0rvYBGDtMBMnOvvGt0/H?=
 =?us-ascii?Q?mM9ozNNA5Svhe2FbpA3Q5ycgKseeohnnmR0c/yiwWLZv/QCV2oy5ZD0CI4KU?=
 =?us-ascii?Q?e9JMDninMQOSm99ucUGol+sfHSf181YQkQAXYgAaFrWj2xJXDREspboWlej5?=
 =?us-ascii?Q?U+X420tytMqPJMm4Vn7iT4xNpqbKVSoml2a9qlj9dgJcNdC4bGtYT3q22ntA?=
 =?us-ascii?Q?CLVSdH0QOSEa8r8CQlFmPa6rRvqyiDtuCw5Gby5Ps0THuKAU2olfm8Gi+BeM?=
 =?us-ascii?Q?f0VB3p/pBJ9zU8njsZgBv8NDBXYLERPY8LkRVr/vgrwcT3a5A/jGw5dzIrNd?=
 =?us-ascii?Q?GEWXIUi3yEnvf4XXnBv2o1eoQxH0X+5iCB0oUdWnqud8n0taoo0K45ccOOe5?=
 =?us-ascii?Q?s3IFJ3TXmcTT58OfshuswQDqy0eHZhpi5ZuSvQqu4ZM5yT55DHq1qus0I+NV?=
 =?us-ascii?Q?AkMKpFeSpZiZ+4iojLLWvIqCF1T2nUC3QDvCkXAFZqF8PalLIhuQc8aZARyk?=
 =?us-ascii?Q?Dz/aRi6oFw1SKQZJDITUJW2/AGTMVjm11+Tqgd6S6eJoaNhFb7yKNXjyZIxK?=
 =?us-ascii?Q?6lhqDH01J0PtUEvMPG/Ni+eODe/og1Em3x+drUj2NI7fx0v6DfOrMHn1DUQC?=
 =?us-ascii?Q?n5WAEP0hnT2foJG7qUGwPjuEyaYGrwvM8hQiga5ymKuAeP7ixF9Jswwq+JX/?=
 =?us-ascii?Q?o4AOgEEunp4I6xjwAiAJ+6PPDbfSq2+5N4Y+ZLiud196hZtcOqVaqvaTkW2V?=
 =?us-ascii?Q?msanI0nxb28UOqroX+Ij9e3d8otqi5/vOuubf2k1lAd2FKMSjfdhTdvhvZsq?=
 =?us-ascii?Q?sFIi57s5BB2jnSLa8FUMeyGRq9ZFGXL+IOwUskfxNCS3SyB831c1zG7azNAK?=
 =?us-ascii?Q?ZGeb5ObV+6tzMzWbecK77l+BRsoySNl0T7daAiaDy2XQyAZNmbZBEOsVqBRu?=
 =?us-ascii?Q?RWbKI3gXcJqTGT9vfAAJG1RGlNMu7EqXL5d1un3RwrY1ELnS0hZ/1RvP5HeG?=
 =?us-ascii?Q?cxWMpr0brtUSj9NUN5vDI1ukEKCTOtGFalm+fbhJjRIl9V958KgrigwrYQlW?=
 =?us-ascii?Q?B/fhYiR26hBsu1JLZK27uxPlw86Bvs/ms/vDcnVJxiI26Hi7OdLQJkvw86aS?=
 =?us-ascii?Q?TzwR876jy6x7nGFgpzov9rIyrFewv1zQDYHD3AoR0zjN3ePha2BPbhCpUNXw?=
 =?us-ascii?Q?niTFP3pZy+R55CMiXEml4D41xSxA75TUq3lEhZGb3s5WZN3MW0NHFVg5Tzzy?=
 =?us-ascii?Q?cpeENMt8JW1PtqdxX51szNCgMUFkiXFUL/sC29tQgBafW5ivhL+W45R+tsdU?=
 =?us-ascii?Q?1frGqQQ/Fjdn5Xcd/Z6VldzeqgyCv7vuiHuawBSeiZWrLb4paSKnjxJUvazO?=
 =?us-ascii?Q?bhqd9v2tMikvLwjrswP/tdaQz9hSJNokWIkalDrSjtNu/DMwW5BD/obGqdU9?=
 =?us-ascii?Q?7AaspCcVHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29f4a95-0e5c-40f5-e8f2-08dea1b5d077
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:58:59.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sASNoc+EzLjHC+T6psFk8BXnbCjGwq4/JkQhb/NeWkD4QmnKSEzIRkQ2ox45C27Hm6Mn/8L/enk18vRFu73uZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

On Thu, Apr 23, 2026 at 04:22:57PM +0800, Guoniu Zhou wrote:
> The imx93_csi2rx_dphy_ipi_enable() function configures the IPI datatype
> using csi2->formats->csi_dt, which is initialized during probe but never
> updated in set_fmt(). This causes the IPI to always use the probe-time
> default datatype, ignoring the actual media bus format negotiated at
> runtime. When userspace requests a different format, the IPI hardware is
> configured with the wrong datatype, resulting in incorrect image output.
>
> Fix by updating csi2->formats in the set_fmt callback to reflect the
> currently negotiated format, ensuring the IPI configuration matches the
> runtime datatype.
>
> Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - New added in v2
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 02eb4a6cafad..b3f90da8b43c 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -470,6 +470,11 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
>
>  	*src = *sink;
>
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		csi2->formats = fmt ? :
> +			dw_mipi_csi2rx_find_format(csi2, default_format.code);
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>
