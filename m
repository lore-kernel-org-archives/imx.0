Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111F326921
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842272; cv=fail; b=PUA9U9BIdG7hji3W75uLp5eORzebgKz67Z97UL2dAbWa9VPfTdHM3xBHm5UQAKl7T1csyAbTKWdefXViAojZa3xwh2CYml092+Hl5myZtTrYFmtZgN5c1rt7vxIeTbuvVMySRRDVYc3v8llpOTXcbeTFmh7K80dmYLkR8KbKXKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842272; c=relaxed/simple;
	bh=XCLqFUnUdFGz5gIz++gN1Alguug6gewIz1n3Qdk3MEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KUAnpFyw7CNBhCpW8EB3ctn7T43BK/sgHt1iOaiHGZPCu0fi/2mapBcP4RipTen9rnz5ZK6gruK0KHM8rDGSIlXzGAWfoWWXM681A3OwZP7w1rrK0+OeX/A0kjLTFWnU2j5yX5WbNV3nnCNqZQly4DpIBz63wJg9N73aBt01Fpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T8Z/W5Bi; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T8Z/W5Bi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9abStmNb1qmjXZ9HOufOjsdu6AiDB0IVBtvdc3fMGIbUtWSCzMkjmi4j3vZixZRr+rtfcf6D8MkAkrxIiXS1W5md7aX/Y3xnIGFDWIuhSZV5LN25zHjm5Gk7UVOGdgGt9Cq8NYAOYeBrxsyVxxYsFhSpKBpuB5KAqi3sG84Z+YWJPn+yWmetTLQZQSFYb/oU/UDn02GaYEkZ8Zm3EG+s9ikFaviI9TerIi53M/caRx22XRZHFrA2Z6QivA8o4nTyjgrEUiIQEdRvyR/G4ktS6UQ3LvmvXgXEIiD6IEVxdaYYCSvXpumJQ42l93TF+gdgxlvCQqWqP9aKFRR8iFU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZFAAdu0sAiIWHHIMxb+vHp9BhfjKuv5D4g3EKzheso=;
 b=CcaWyAQzPK/7Cv3HckmWc0PJYxwODNCmGSeT82VhaOThd49x18AgZ3UQMugVKyHqzCfr/IhqmBfWWzeOdtMlmG1rSLsxEyjqYlBd7p6wjutUXj7yjNz2+5hIFifRf8thjHRGH/Oy4HA444jsd1ErrCN3pmP8b3KJ2nhPZK4W6S4/OOsh02Jz0SToLDZf61zc3Hu5tHyMGptFqeJq8pM9SmEBeb4ROy9RD8DVkgP2ED3GfrXXvLK8DP1PdlNg8sRionNcdZt5Q+VfGXfF4zaQ5rgELfOmcjfOn43/E0BRurgLhtI+EoPlQzV1MnRLo8OxQ6IZ3JtCNMn1tG4A/Mjx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZFAAdu0sAiIWHHIMxb+vHp9BhfjKuv5D4g3EKzheso=;
 b=T8Z/W5Bip4jxukAlcZei6GRnURWl1IxrAPKNM/Si5RXF3CBcxv9Jr9IK/5F9DuGDv/O05fBAdmyuQxSejM8s37yY9kMNBT5+wMj1BEkg9DlKiEYUH88fcbCd1x7wpzUqApLOkaDHsM2DNgMIy739x1GvO6CSusPY8TraBhBVuP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13325.jpnprd01.prod.outlook.com (2603:1096:405:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 09:57:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:57:44 +0000
Date: Thu, 4 Dec 2025 10:57:26 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] i3c: master: switch to use new callback
 .i3c_xfers() from .priv_xfers()
Message-ID: <aTFbBtMwXQY7TK9P@tom-desktop>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
 <20251203-i3c_xfer_cleanup_master-v2-1-7dd94d04ee2d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-1-7dd94d04ee2d@nxp.com>
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7149df9a-3761-4ac5-03bc-08de331b9209
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KtdNciBH37ajWL3SkRjkqKfoLdbQOTzW69SF73JvSBmaUOvuYvd/E3jGtJfZ?=
 =?us-ascii?Q?Hwx/6iCUVUvuLiP2zb8ZY04rXRtHo3pOr5D3IrLEJbATXWjfVH87QEZFxIQC?=
 =?us-ascii?Q?BsB31NZtktqptfT0a6vuWhdKVLjGy8BDkAPJcs+1SHBiI9O95Ortkmxj6NQ/?=
 =?us-ascii?Q?JP3WNoFyy9btxDHMZzkMRHoBh41pLs0h2BIAr1BPCRxxUa793jsipz/VkoR7?=
 =?us-ascii?Q?i1loNmHzIjSZQgWQnSVTZb1if5DyKCA/OD1fSGnaF6lOlBDM1TFeKjdCwshU?=
 =?us-ascii?Q?hPhyXDhd3llgtoV4AVndyRxyAIyvxolvEXAjrA2+6g+ae+D+Pe3nFk8taQfk?=
 =?us-ascii?Q?jzkCgDfONQvsx+G55Ga+rbItjzY6EVMIOrKqzQG6YXW2ylWr2NNSifnsW27z?=
 =?us-ascii?Q?04bZ19CCBSHb59tLSUN+f32yu1utrm1NINuCDVbkeXF8X9PKSyFPm1ucyNrQ?=
 =?us-ascii?Q?EKRKJasqzjMV6l7oGANiPufELKtTWymMQ7ylUaYn35XMVII1sWzx2ExM17az?=
 =?us-ascii?Q?+Hn+fo1dwp5JPHxvwgB9s3E0enIPjsfScXqOTsPEnTMuc5fX0+agKs3Snr7l?=
 =?us-ascii?Q?uzwsSMbUNUta69rn+wWfO9RiLNjgQKJqRFt618VxS2NB8hPxDomMZaanTwXB?=
 =?us-ascii?Q?1MM48PMcbrn+wp31Jy9RMEzbnTHjAG3KVzRhkhC9hAsX3z8ChI/3n5BsMbPT?=
 =?us-ascii?Q?v/5xb3lS5Slhml12oByPo0DXjR7bs7KFokcxsvCm4yoO3O3Z8mHTpzKs1+VM?=
 =?us-ascii?Q?VABhliVQlcrKPG3u/9zxG8MgH+Jrd8DM8t52E7Cx7hu2DWgSu/jtp6G5UGXj?=
 =?us-ascii?Q?fa/mK8NRSDkcvOUVzWllg2olCMjRksF1BsYDWIPv8zqskYvl1BkIqxv0Dhsp?=
 =?us-ascii?Q?sJpqOSNwoTXbo1CvJ/wnWj+LHfHkJk5XoeLAakyjxDBI6iO6bkVDutyWJBYH?=
 =?us-ascii?Q?h1C1a3uq55WO+WRgyvrfaKKntIvBe1ozY3E/LTY88AkLDEJ2Ly3QsTe3HJdm?=
 =?us-ascii?Q?jiT+pODFP/CAe04ILhhRQxrUhkYGd/dhc15dyboOCpswcj0yy5+h0o+ugp/N?=
 =?us-ascii?Q?YhCXjl0pvffMdJChE4d64k0IpNXCtG0GYRszI4/UJZujhOWpgQPS9uKjLyg4?=
 =?us-ascii?Q?3c8wwhP2/9wlTBqfrjYQSA/MGsk+I8qW6JbiyKaijvOI9N6Dfliy+gGt7D7D?=
 =?us-ascii?Q?0Onji/6iqZE0t7gru14vsM3eDuXz9j7F+QtgmVoBSguXCoKzZOpVRUYLcEK+?=
 =?us-ascii?Q?2Z3+ZI2jjtJjNy8r7KdXMd7MU5wGG5hyzTvnyrJaNX8ZOQgIbn8OfilBJznu?=
 =?us-ascii?Q?BljrHTx4aVYLk7EcqE+YDTCzP/zbmKT7X68srxRLrbQU2hLYmSdIZJQd/McH?=
 =?us-ascii?Q?sKry0PGI13ClBYG0ZL7CpjECSsirdlYThC0EprMSwKGF81fP+jMhUpk3katf?=
 =?us-ascii?Q?ABQfjJNy0wkS9D63njZpKOil7XYJX7ilV0xAlRidxHRuYySRiFIQ6lkApTMA?=
 =?us-ascii?Q?b+HYMDEwwc+XS/auiizMm1JsA4ka+sEsEuau?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+LX9Ziu6k8jpTCMsRvdW/1c5xC3UCl21klRNE6LLP7IqeGdUwdH/mQnbuHvn?=
 =?us-ascii?Q?RIIUOUOgETq0SvYbrsDpncuJ/FKtf1w/+UHYcbtPsvDkCawwgjrfF4/Hfxlw?=
 =?us-ascii?Q?1TEFL8MfyiKJ+hC5kAp1ocPt7PHdngJU0Nc8QtNNFvZOsxGrXLtw5UGce2TI?=
 =?us-ascii?Q?suvbbbkwOzRbHatW7GQo9KNd9wmy50kbJ048ymhxlDJAgI9G79HjjRBd8weL?=
 =?us-ascii?Q?guO+qANNFgXLlUgaWg1w/Qw3WbcAGw60kk0qwuzry6GC5T9CGGPoPYttpBQY?=
 =?us-ascii?Q?CBCjb1ZqkjRB+z2eQJTzVHTbCGJYDVhf0z0aCYNy5FbunOJncEnLoFtnh/ek?=
 =?us-ascii?Q?hc+zZiI8wGQwsNl5MELGYSdLkae3cUcRcXSE2r/95Fm0BPTupM7CyqsZa41z?=
 =?us-ascii?Q?+tEeFfuC8fYFn573Z8Hfo7QLgjqfvwxJXK07T+s62jwotD6mnVXoZ5JCbTRb?=
 =?us-ascii?Q?bxLxQKIqPxPom72SgnzO83EcKmzxsA0VrVaEmGCm/L4BdfKoK0IudZX8uA4K?=
 =?us-ascii?Q?0B+omSKOSAizvmNoqI9+r7usqppqjBmUcD4vDEAYBtYCyowAyMmgCiRg4VEO?=
 =?us-ascii?Q?7p5s+kGn3KHAkpDOzkaAIItkhgTHqIqtBBZcc9h2cuNlNqb/zOW3/duH2CH2?=
 =?us-ascii?Q?yyGRrYVm//y7b6bjpKA+oLa/HiJUZxQqx4CqW+Sk2hbF0v4CSFG7dg8Vvn1S?=
 =?us-ascii?Q?5lAKba2CDkP4uNsZ1WVJofq2Eb4CM+hdjCu0SP9jZMMdAm7yR013dmKf2zAP?=
 =?us-ascii?Q?h/y6pAsV78YtoQz3RG4IPKnh8HxrB1/+GAtMwHmlRRJuZI43gL302dzQzaDR?=
 =?us-ascii?Q?wzI8dlzHAot741v/RcvXvcPTBEEU/1Y4T6RTq5qPI7wZBnUJmZpEkRP5LwjM?=
 =?us-ascii?Q?f1LYAN7jWAzmr45G9qD6/0pwjJzI7VQ1fzNFnJZZeITIdyCms9YfI4ulWtM6?=
 =?us-ascii?Q?YkWgK4pQrV0ubzl3r1qzJhv7bUXpNshmZ0Aor5FyScvVWboMS4D4Qojffouv?=
 =?us-ascii?Q?+NZAiJa+ATDqSC307ik1YF3+uJt/S5hHYwp0sN2iZBMaqzPO+OlJuSTQtAvU?=
 =?us-ascii?Q?KleGPiAbvYmjt58vmJDjXt0geA+IzFjIORgKtbHh2SfTcGGqpbACBUbBVyqs?=
 =?us-ascii?Q?DfivqQgG0dTAl3tzV6oSrXlbb6dJx1GR8j7WwntTobGN5EU2ThjTM7iKJzLw?=
 =?us-ascii?Q?t1F0eAhNtrmROGpDwM5dYB9OuRo07vWKEhmEWQytH9jCI89Fc5mMU1jsrbfO?=
 =?us-ascii?Q?f9G3Ig/TtOCf2kTTkqL6pK9Avl/D2LJoYCgukwdwsWj46VDiY/EQksXnT3rI?=
 =?us-ascii?Q?qWgqIPX+ydRwPD4ekbZ5nyusboXuFuQrTi0pGAvGkAvgzuFLVblgGS1B/toi?=
 =?us-ascii?Q?Q/GJO3G8zwZP78apxD6w3FTPlR5lBCOC/h/cESL/3WsOuF+fi5W7tjcT/raW?=
 =?us-ascii?Q?EEgVzmsRAfmaTKKAbWTeimlgltxByCTeUO+oWwmTg7vGRchkp1jEa9FD5a1r?=
 =?us-ascii?Q?KO9uJKHY4FR9y5m1yvpVljD7d1FL6wlEpxz8QHb7for29AfHbetQ3gLdQ70h?=
 =?us-ascii?Q?5TsOWILRRnflIh459zGC6Tj1uBGelJY+zxvYThWq/0T2uKpyLTFQawRi8yCa?=
 =?us-ascii?Q?QBsnC0X0d0CkewnWrfb8n8g=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7149df9a-3761-4ac5-03bc-08de331b9209
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:57:44.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV5z9VjnPN7b+sKJTdTN0KkdMJQMRYegxYB7ogyMz0c//VEUg5XbwE02fslDpifYEESOlFFta5z5tJ/9CjYlGeliMMmcKr5GoSJ92LWHg0+H0gPThoNGCHVeypGD8uw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13325

Hi Frank,
Thanks for your patch.

On Wed, Dec 03, 2025 at 03:45:50PM -0500, Frank Li wrote:
> Switch to use the new .i3c_xfers() callback, which supports all I3C
> transfer modes (SDR and HDR). Also replace struct i3c_priv_xfer with the
> new struct i3c_xfer, as i3c_priv_xfer is now an alias of i3c_xfer.
> 
> No functional changes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/adi-i3c-master.c    | 8 ++++----
>  drivers/i3c/master/dw-i3c-master.c     | 8 ++++----
>  drivers/i3c/master/i3c-master-cdns.c   | 8 ++++----
>  drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++----
>  drivers/i3c/master/renesas-i3c.c       | 6 +++---

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


Kind Regards,
Tommaso

>  5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 82ac0b3d057abddc78671ce973db12f528984ea1..00eb80e492afc736046f04fa454be16bb718004a 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -365,9 +365,9 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  	return 0;
>  }
>  
> -static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> -				     struct i3c_priv_xfer *xfers,
> -				     int nxfers)
> +static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> +				    struct i3c_xfer *xfers,
> +				    int nxfers, enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct adi_i3c_master *master = to_adi_i3c_master(m);
> @@ -919,7 +919,7 @@ static const struct i3c_master_controller_ops adi_i3c_master_ops = {
>  	.do_daa = adi_i3c_master_do_daa,
>  	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
>  	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
> -	.priv_xfers = adi_i3c_master_priv_xfers,
> +	.i3c_xfers = adi_i3c_master_i3c_xfers,
>  	.i2c_xfers = adi_i3c_master_i2c_xfers,
>  	.request_ibi = adi_i3c_master_request_ibi,
>  	.enable_ibi = adi_i3c_master_enable_ibi,
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 276592a8222e7b098a2323e0f3f587e77fc789bd..889e2ed5bc830310c5555eeeab08674d0c579a0e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -902,9 +902,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  	return ret;
>  }
>  
> -static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> -				    struct i3c_priv_xfer *i3c_xfers,
> -				    int i3c_nxfers)
> +static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> +				   struct i3c_xfer *i3c_xfers,
> +				   int i3c_nxfers, enum i3c_xfer_mode mode)
>  {
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> @@ -1498,7 +1498,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.do_daa = dw_i3c_master_daa,
>  	.supports_ccc_cmd = dw_i3c_master_supports_ccc_cmd,
>  	.send_ccc_cmd = dw_i3c_master_send_ccc_cmd,
> -	.priv_xfers = dw_i3c_master_priv_xfers,
> +	.i3c_xfers = dw_i3c_master_i3c_xfers,
>  	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
>  	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
>  	.i2c_xfers = dw_i3c_master_i2c_xfers,
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 97b151564d3d31092975cec14958a17ddcd91d13..8eb76b8ca2b00a46a65f3a6dc7416d8af7ca288d 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -720,9 +720,9 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>  	return ret;
>  }
>  
> -static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> -				      struct i3c_priv_xfer *xfers,
> -				      int nxfers)
> +static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers, enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> @@ -1519,7 +1519,7 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
>  	.detach_i2c_dev = cdns_i3c_master_detach_i2c_dev,
>  	.supports_ccc_cmd = cdns_i3c_master_supports_ccc_cmd,
>  	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
> -	.priv_xfers = cdns_i3c_master_priv_xfers,
> +	.i3c_xfers = cdns_i3c_master_i3c_xfers,
>  	.i2c_xfers = cdns_i3c_master_i2c_xfers,
>  	.enable_ibi = cdns_i3c_master_enable_ibi,
>  	.disable_ibi = cdns_i3c_master_disable_ibi,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 47e42cb4dbe71edc5a022f4cb0fdf33a281eb4a7..607d77ab0e54691705845c33a79939820a83c9f0 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -266,9 +266,9 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  	return hci->cmd->perform_daa(hci);
>  }
>  
> -static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
> -			      struct i3c_priv_xfer *i3c_xfers,
> -			      int nxfers)
> +static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
> +			     struct i3c_xfer *i3c_xfers, int nxfers,
> +			     enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
> @@ -515,7 +515,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.bus_cleanup		= i3c_hci_bus_cleanup,
>  	.do_daa			= i3c_hci_daa,
>  	.send_ccc_cmd		= i3c_hci_send_ccc_cmd,
> -	.priv_xfers		= i3c_hci_priv_xfers,
> +	.i3c_xfers		= i3c_hci_i3c_xfers,
>  	.i2c_xfers		= i3c_hci_i2c_xfers,
>  	.attach_i3c_dev		= i3c_hci_attach_i3c_dev,
>  	.reattach_i3c_dev	= i3c_hci_reattach_i3c_dev,
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 275f7b9242886ee77a647149a808e2f184fb0447..426a418f29b61256fbbfc50cf578bf04629ec391 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -794,8 +794,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
>  	return ret;
>  }
>  
> -static int renesas_i3c_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> -					 int i3c_nxfers)
> +static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_xfers,
> +				 int i3c_nxfers, enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
> @@ -1282,7 +1282,7 @@ static const struct i3c_master_controller_ops renesas_i3c_ops = {
>  	.do_daa = renesas_i3c_daa,
>  	.supports_ccc_cmd = renesas_i3c_supports_ccc_cmd,
>  	.send_ccc_cmd = renesas_i3c_send_ccc_cmd,
> -	.priv_xfers = renesas_i3c_priv_xfers,
> +	.i3c_xfers = renesas_i3c_i3c_xfers,
>  	.attach_i2c_dev = renesas_i3c_attach_i2c_dev,
>  	.detach_i2c_dev = renesas_i3c_detach_i2c_dev,
>  	.i2c_xfers = renesas_i3c_i2c_xfers,
> 
> -- 
> 2.34.1
> 
> 
