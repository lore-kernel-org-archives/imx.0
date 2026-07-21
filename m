Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4C441035
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675363; cv=fail; b=aDFqWtqw9HSvR9D/qEzLQUazpFqdcy+aZ8eghI4n0p3VfNY036zgfRUwOuetbvUWl25jvdH4vUOpYcwPXekZQgceVVWmd4vW4W0gSMdsgDaTeIYSxizRd13n0YPEI1tn8YlrIBpGxS0bfO+5Qh7vhLcLAvXIE99J49wicXa7oIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675363; c=relaxed/simple;
	bh=JuQANUfKca4N1tLejd0mc/J9aKWbND1k87yTsAyfaaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BtLSZBYuF6UbnNTfwcQaZW6JHhViB621j9EXicbC0a+PkeAEfSdn0V9sDgsAMeXBXt6i1wJrE8+HqRx3t9HkOzAh+DLO9natMyqj+SUyCLuiCNmK18+9VK+TUnKekdht7362ESoitEm01ghwUbpWuftlxEIg0zQy/RnmwKA4aYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f62yjmKy; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f62yjmKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx5jcTtk9mHvjmrRwKcbUJrWv/w6FTXHc2egwEGyThYmaB0/7UH1cNgSDfUcRlh2FxBfnvjwsHquxyJeVku79tw6hM1GVUSjS281P1SDfs97dpqA/xzWAJWTv7rNUZvf6LE2Js6+dL1Vy3m1bVfypJ9IfMSkLdJksDS5LEYAicilPXTYVJ31x0Z9Zd3ks9PbhI1vF1KCmBpSCqF/vok7pAO5WcWuMzUzfgd2GOfPQLOmXSuEYNqBl71GQihuB1gY79pnegRsDy5eNJQQ8lx0h4Aaa9xGxS0QW00ygeZlU5mn2xSQ8OwzOpqd9K+kBQDi5+tnB7kOLthhtS/qDr3EOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX7CHh3iEl/reRuys42EUdPUoPOghmWYLFbgwWkwQho=;
 b=IfDae7/cZDVb7oO960WIVSa3FKuXxKONST/MVWIagM0ayX3Cd7VM1/fUqOOC75QqaBAkjmfK8BtvI4cbntYZK8QQmqdA67iWPcd8IWL8hA0zN7nrXwBxM2DE9Yr+5Ito3lh6/4GRYZYA59xb+5FkOK2XLAXUt4c9NSvfZ/awndlanFiOiMqdV2OioltNbZEc9CWy9rjLl4cJX4evppqY7NcvekJBsuZnSa0l2vlcxe12gWnCoYdMaSI230pajLq/GJzxpgIyDgCPzKMrXZJ+uXeU0NsnHnnmun5rqWbvCmcGmEqtvWmQekyx+DAFlkPUJUGWDLyZcI5DK6aNm5xg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX7CHh3iEl/reRuys42EUdPUoPOghmWYLFbgwWkwQho=;
 b=f62yjmKyPz2NIHN2WVq7h2jUtQ5bYjJ/QsKaJW1c6fLefyLMcwdXxVygTmY+8Uzq1iaXCkVys7LmIt9Pb3CYm5QxtWRr2M4HGqGHWuor9e99vGxXiOWEHaaVR/sjBFJwPJMLUyDUiMHdvKvhRs43wTR6t+egR6tK9oijgYtoV6nobUIXpD5+KkYi0fkoSCX/H3PhuGW9RdjnWFDynWeG9RFsKlOfWq/KK0iJ7eewMi5XKL38r0C+EZYi/IARyjUtrUWhrviwHLfkZa/w0s8IZH25simNGweRDZoRM7ZstgfByf2X9QS8+005PMcLtNixJ0itsM7oDvzy6lFzEaOekA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB11937.eurprd04.prod.outlook.com (2603:10a6:800:307::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 23:09:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:09:16 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Frank Li <frank.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacopo
 Mondi <jacopo@jmondi.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor
 clamping
Thread-Topic: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor
 clamping
Thread-Index: AQHdGWXzsI8V+bj64ke1LhKY28uWUw==
Date: Tue, 21 Jul 2026 23:09:16 +0000
Message-ID:
 <AS8PR04MB9080CAC814CB36DC6304EAF0FAC22@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB11937:EE_
x-ms-office365-filtering-correlation-id: b1c8ba4c-4465-47b2-1301-08dee77d1668
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info:
 LpRW2OpIAmymMPqyRRYCMe4IqAqDAcGMVTTjy+DYI/q1evsNB+BcramvwjLoBe47r+L1AkPhWIYJ0yJDh63mXwj5kIjQuQ363NW9sztg8qHVvUURivvvyW42RvV+F7t6yePjzWLUowrNpssBtxxX9eeobmYeOe0BFciZPYeq3gIMqGzGjoxWw5OEXCnIxege0s9MnAT85+7koqJAO1gePlHhL2Eol5xhSxfcknQNKXj6WERrIl7RVk4CKoMOYMpxQPYZrUpXILC6Ypgm2Lei8XVZUaEmXXhm4+UoOBKp4wiUklz6NH2J7PXkiWe8sr7+Gnvsh2jczqaEhO4QO/WLg5fHem0ZnEr54A2Ikvv8ul8ZIrl54Idx9uHSX8AFKuHfQ+Kvz+FqhPFrhhVPmYGf3ygPe1JrwP7orP+vHC4IHUhoJVNet2JwWKMT5LnHRTCF/OjFPcTynw00OKN9VBNDp4g60q4iXUJTGgYoYzYChCZEJMhEuab2/brv7HJTiqcVChLBRMuqp4jZxztmR1PvSPPBXQ6ELO6I/cKYwREabrZJ0tZdW8bdYLlMOyhs7YxV0fqB+E5qkxf4K71NhopLadjMTBrWOJt8SggLtiv1UavqlgGBJM2jf6CcvDAxZrWZ8VIScKiIcUU6ikOQBHWm88jB3sCvQxTybj8glfQYCcHr1csas7cmD1ygvK+oagCOa/WO5iD5MqWR3pY/icFUH6K8+yEtUTcD/nNphmnAyyA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LoejaQLieBJoxNuwM5PkB/XxMlhE5ePP4DQNuX6U6X4cGmcs+Pu2uaf46KHf?=
 =?us-ascii?Q?LDN1pKc31LIs8kJf94KCcx33qhkisoSPO5vxkWLOxdZJulCk3MHI6dQPkolJ?=
 =?us-ascii?Q?4J8upgNnJfAegif2U21FNOu0+Q7udKhivpQ6jXYYTg65Teh2PKgccMFf1LJM?=
 =?us-ascii?Q?T0cnJaM1oLehvLR67zRzdVve5dd0UZ5T3Saxt5LeNQuYsA4lYAKYCf5Bb516?=
 =?us-ascii?Q?HwTHHHGbvdoWTyhoZ9+2iEgsoxer7FMqlBWs0eFKretbDyek3SazIoxp5FQe?=
 =?us-ascii?Q?k4A4iFx0fYg/usgA+sZdsIL6VEybIeK3Lo8dsRn5d2I/20TpXtY5TkOOg49f?=
 =?us-ascii?Q?RyJDJ+Io8X7QWR7R3h2US2Du4Rjn19oyhYWvpY5d69xqVsIhcDRN39IeVxr7?=
 =?us-ascii?Q?l36gXGzYK+FMbn6zAqfRgqYASAkI8BKURDgeCD5RvD1ZItQH43p9oMmaRLaU?=
 =?us-ascii?Q?qN322+TQCZ4lTN8owWPRfhzcLqaGv4apU5vpumxdyWs+nhI9gJsjh/Eo1Two?=
 =?us-ascii?Q?zUEdOepXwH+6mfyZObpjiY0wpIWAKkahXqUlX0OFTx6DhSQd2rnccSGVaCf2?=
 =?us-ascii?Q?HVfbOTeiNzhdHf0ttZ1E06JnKT0vc0h5bA5bk4IxEsgKV4eo1A29epB90ejW?=
 =?us-ascii?Q?DoPRK/f+Mvyp7vgvGBvInbgR+/yqHYZas8GHQno7X1GVVCowbgoN6fkCsSnG?=
 =?us-ascii?Q?ZpdmM3std82yUFbynNjOrqyrY1UTPXgQjYHMw81PCAUUAH8EtM+QT341fUYA?=
 =?us-ascii?Q?vf5SGb7F/53u8naQ3/LArrztUtxL7HIfZHpHbxMShru3x+gkhirIz7/lLbrZ?=
 =?us-ascii?Q?foCtWvCxYijBLSxPm2lqF8VKf/XXTr4KJ5xgTFPZ+aUiQP1q9L0SUvz40Ol4?=
 =?us-ascii?Q?/r3SdcP+O0CLoIs2xQpdH1HiOfiBVuLp/3TUxm61kOvwQYSVCFJ8GZFL5Y97?=
 =?us-ascii?Q?XLZEH9yY5G9uVnFnpTH4WQUzZma8DTK8PV30T/w0X2p+i96s9IpZpNlCtZD6?=
 =?us-ascii?Q?/l3kwftRXPLCxTj3fdTrVJGa5bbUEjOw/loH12yKKhfj1oBmeTL+lPUw+rKC?=
 =?us-ascii?Q?ydjjxdakxGHlRPWnkx+PJefawx5qqlp9z7TyvWnuoZ1sbScf3RCW7C+EvO/F?=
 =?us-ascii?Q?6N9rInqmquYUaZkHYRlIUvQhNLtNdAjiWkDC3fDSn5PUiKxbDsUGNG1oThUt?=
 =?us-ascii?Q?1aQygLXj74sNbPRAglaOo7t7zooVq6Aa8ETl9m9U6M/4FAfOzcI/rQv0hZ0S?=
 =?us-ascii?Q?aAewRFiKDxw0Df+TawajnufBPfbIDr+BNDil9Rgjv2rOY/WJGAVFAje2cDyd?=
 =?us-ascii?Q?kRdV0uY7bsb/k3J1TgR4rI1ivSHfisGRESYUqdW9Z3GhCZ9z03RVKZOKRDZq?=
 =?us-ascii?Q?/TkOziXKtmm6e4fcK0l92d65I4LY+wGVYvyLxfp4/B6PjLly0X1e4d/8/L+0?=
 =?us-ascii?Q?FuP5UbD+Oc7Zva/gPIeXFtjDwj7OIeJcfUA/rNscLIZmkLTCNLNB4DYbvbYE?=
 =?us-ascii?Q?zYo5R8nd9gXEZgF7Xp2XlO5dLBbyyHwR2rH3iOd56i2cDpiB8aj1BPTVCX3C?=
 =?us-ascii?Q?Jr6/ERHcGLtVVg+apWhgmR/HzcIDb36cqs9LmPW1Gew6LzWueJUPq8wo79Oe?=
 =?us-ascii?Q?DUKUzXXzJNZMpIPybaysfCPf9s1z+u+BIX3IffMz1UBTLK8ZZhZFFif7uovB?=
 =?us-ascii?Q?pf4HT9dkmNU/ypP82gLpLGZSSonqyhgRufA0Qi/QV4thcYZy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c8ba4c-4465-47b2-1301-08dee77d1668
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 23:09:16.5490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5G3AggNL5l5IHuzSgA9h4rPjruVje4jKXzavE8wifhKkG4PONObdzqApNVWnF6Wb8+oUcxeRsqQJx7AcaquYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11937



> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Thursday, May 21, 2026 4:28 AM
> To: linux-media@vger.kernel.org
> Cc: G.N. Zhou <guoniu.zhou@nxp.com>; Frank Li <frank.li@nxp.com>; Aisheng
> Dong <aisheng.dong@nxp.com>; Jacopo Mondi <jacopo@jmondi.org>;
> imx@lists.linux.dev
> Subject: [EXT] [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling fa=
ctor
> clamping
>=20
> Caution: This is an external email. Please take care when clicking links =
or opening
> attachments. When in doubt, report the message using the 'Report this ema=
il'
> button
>=20
>=20
> The total scaling factor including bi-linear downscaling and decimation i=
s clamped
> to 16. The bilinear factor calculation therefore produceds values guarant=
eed not
> to exceed the maximum factor of 2.0. The clamping is unneeded, drop it.
>=20
> Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as th=
at
> would be a factor of 4.0. This was inconsequential given that the compute=
d factor
> never exceeded 0x2000.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 16b20ea2d1db..e07eebae9e2b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -11,8 +11,6 @@
>  #include "imx8-isi-core.h"
>  #include "imx8-isi-regs.h"
>=20
> -#define        ISI_DOWNSCALE_THRESHOLD         0x4000
> -
>  static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)  {
>         return readl(pipe->regs + reg);
> @@ -118,8 +116,7 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int
> from, unsigned int to,
>          * output (input / scale_factor) rounds up to exactly the desired
>          * output.
>          */
> -       return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
> -                    ISI_DOWNSCALE_THRESHOLD);
> +       return DIV_ROUND_UP(from * 0x1000, to * *dec);
>  }
>=20
>  static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,
>=20
> base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
> prerequisite-patch-id: 2d7379698fb55fe2345d604dfb73914f91705a5a
> --
> Regards,
>=20
> Laurent Pinchart

