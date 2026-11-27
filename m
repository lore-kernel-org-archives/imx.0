Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795760962;
	b=YJgDJbOFoMsdXQ0uiMtG4vqkzXYezFPHDI3CDv8o9Tu4AG/e6YZLeMvEBcW0hLRATSFC
	 tYisL2jC9HIEsmtF/q9ulfWHuA2ZM0HBZkcLyWkvzGO+EJni+lXzWZvwWo1FwXoEp9l8j
	 0jNmo2HAGg+ZtKBSmCmckA1oD8xYjaQx/ivUrDWsWbs4icbqKtQp+C8mrY+/dl0ab8391
	 vVd1Xg+IQB0OpnJvY8kT4NMnRM5+hfCQhHwEX23XHT0vusKC8axtc6YllKJTz/cHPlDa/
	 4CdynpqiKpjQFzZuqsNN0fo5PvDYlvNfokOjlzV+lbrIMckx2v4NO59mRaqTRNU4Xgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760962;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fWsTafJypgjI6fZiR4sVp4cIkxXneA3qPMB8ybjNs5c=;
	b=CfZuSb7p23APOUPcth6WsqF9sCbDPgoHFBmyMxfe1dO9gCqL9teaH2T3mA5Oi+LOTiRB
	 v0sREjUZnIzZOJQxGT30iJXZgxfDU4cGNQGYvgFvKPRwfDIgfu/cf15AnudksctSq6TYZ
	 3XuxqNItc8u3QvENTBcHAW6HG//Y+ELDXOp8YbbnHmkM+JJsoZwMFCIMTTp3HSFIf709P
	 JWNW6LeMgJHfZBlCh1yunbzXvsCFxIzrYMW3NuGvHxRjjj+Zis1YfdhepGO7RI/3hbcI4
	 L/CHXUoW4J+XSpgKmnsYY+gJp/qzBhRrJNc6Wj8ruZrUWaxRtG3/ASbJfXw9I3sQ4uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WBQ4UWXE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.23
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F93606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 06:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F93606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WBQ4UWXE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkBzEjw39z4OLr3J479ue/ZT+ZKgsqaznO8HrmSq/FFLknI4QJZBDcdXh4+RKT1jOrCXgN/jlyM5AkCdUrxQBvPzbCqJ+MBubIprXm7143pNW1P+n67oI5/2vUwMMkq9r4nrwBI4fNVqxJjKY42Dp0Q2bOoquf/TdS2YhfIQ3y6K2krE90aOO1jZd2Q3YXnet6mnAjU9QFsSmYzPZF0FZEpaZ509apDJZDBy8TrgQurhkJuwu7W8nmRW/rfYNRqpe8ehxkQyLRS7/F2SJgM7XNWtLNOtRpioKtzZ8dd9wDbvAbl1KqiMObsCC9yYAKXRWHLiBChoqN8qzvUjl9mnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWsTafJypgjI6fZiR4sVp4cIkxXneA3qPMB8ybjNs5c=;
 b=wqDCD5oO9NVDsTGwrM1f216NCnPKfRwg7yfkKaO+pGpuBdUwqvqNWc4l1Rbn/F/VKDIUZYP7DEmoDzJx/kTAz2X5hSvCc5lLDGJzBVtdORpX7QwDjd52GnniD2fF8HcH55i2sHT55SnhgCzKYkwaqoVmqWKpo0va2hdeHuTiZzUIbF3ncayL7jjBSVtiB4vcFsU/PvLp9wmlilKE7v5LxOdSb96kiQxLudiXYjo5zx1qaSy9kot4RQlpkkydkZtKUdqwJE6yNmQYe4IJJqajuWVAy26wIi/djAo+CSa70R8xCd6XKobp/zA/P3qMjUYKYsG7c6db7ouIQLK9uA7MJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWsTafJypgjI6fZiR4sVp4cIkxXneA3qPMB8ybjNs5c=;
 b=WBQ4UWXEgB702j/ee3gV3+pOx3Ih86YpP7yKcTvbhS7MCW815uN83PQBvVF8X156ckwHmde1We1h3zLRH/ESLaU7pZx2RBfznAIqDJ4xvoLvJt6Nlhj0OVOT9ST2rRpRSh6bJqq/PSBzfFFIks5/z42Aa0a6TlnuE6hLGpP3nCrIqF+xSqCW+oh2swBm03NRiCMQYxLOheZJbNooGZfjIFYKrTwu/Cyi2CQXFFv5lofHzzC7sKfrCwA8SZb2tYFcWgpZXSveBk3vYOUvNU7U90CD4x9/fb5OJCHsrcqNvmiyxpLKSp+pS+kQ3nSHwvCmkghJEM3ay2b1IxIDUAyweQ==
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 by AMBPR04MB12206.eurprd04.prod.outlook.com (2603:10a6:20b:759::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 06:29:18 +0000
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680]) by AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680%7]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:29:18 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Keisuke Tsukuda <tkdkei@outlook.jp>
CC: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH net] net: fec: fix TSO DMA mapping failure handling
Thread-Topic: [PATCH net] net: fec: fix TSO DMA mapping failure handling
Thread-Index: AQHdfiDdXJAPFXqILkmzJeyyha/um7dBcm5w
Date: Fri, 27 Nov 2026 06:29:18 +0000
Message-ID:
 <AS4PR04MB9338D0CD2F0B9C8CA941E34488412@AS4PR04MB9338.eurprd04.prod.outlook.com>
References: <20261127033906.9561-1-tkdkei@outlook.jp>
In-Reply-To: <20261127033906.9561-1-tkdkei@outlook.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9338:EE_|AMBPR04MB12206:EE_
x-ms-office365-filtering-correlation-id: eb4116be-8538-4eba-102a-08df4c4fc3c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|38070700021|10067099003|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 OXfT0IxIkQllFrGR2qeBwFQ/HCy/Og68Dz3yz9aa3CKuGBK4cs6mXkv0HkSlA3xVBNYFAnAO3aYxgacFLW36RjDl8V6L+0/+okugB6mNes26Ln9zABc4oAXsxIkrk0lN77xVON6XlUd6iu6zzFdvxIbl5x8/3LTkzoaX5+yxqU2KOX3iO6E+vfvrD2GoyvN0w+P2xyNktyllM5GxHex4+2aVKE/42pOCsyYpxzshQ5AGLOOhviG47szzNcUEbaq8jrZVU9y70mRF5cA95CriG2APE8kwHnDdfRulZi7bZw6P7rGKqtVsiZXoEkWDrwCMj+ajzCUc2IpJkA5Z5DqcZV54TG6oNABwC6EdW62BWyV0PPO9PunW18g8u5CiEmM1XT2JfCBL4UG7GSGMG5MZGw/WqQxLaOlIcFAdHo/0ZeuWaPSFM+3i3PgTFTb9fNL7H3eLP2QGvHrG2rZToaElLz+fvp/aKdhcBPNqECI6joJhV6eOcaDYggIn9bxFDXDQeDMVKQS7xYvCxl3WsCALDf+gQItXEbhsuoNZq9Umbz5Md4XRcLz3rGeAbqSUDLP0+8ZlHcQ4iuC3CyNrpwXnJXlDD8YysjYpENBs6LawNJKf7oIjp/wmEx8BMp7f5zBHReE9ceco0Trq9BpV+c3lcQBL9WSJ8M10/45lJnL2vDlTWLrL9tfNCz05HyZKY2R/1UYg3x8gvgSyjGhByeIiR4tPuhYrxWP36LcAmatxjA8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9338.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(38070700021)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y9gG0JA1kkgtVw4+tqgm4AtFIEVZ+o5Mzwgd44a6Z4L+1JdTeRwok86drZv3?=
 =?us-ascii?Q?TTj8dy8FVqNTRh692zc3+wx1Az206MkTXf8mdZz5HYLMpCEXwph5lJBZLrc7?=
 =?us-ascii?Q?i7d04WzVuaWlawqt+3/i/aaGwC1EEIpC9jnjWo5+eScLwODhQrHZ/+Ircpor?=
 =?us-ascii?Q?YYhZyxjSLOmbtDKmIBq9DPg/9Dt0EIAbDGfyOxVRm9OMMFMK+jTAUQYyyirK?=
 =?us-ascii?Q?9lweT4MZUGQG1PFAsHc2vYyXnUauXJ+GEVkHLPSiXlCjKkn7zMI02NIaqfgc?=
 =?us-ascii?Q?dwqonWc2g3wn1eRECGVuvOgXN9V6q8pv7V7UoykgATn/nx+mgH3ZMkqAkiih?=
 =?us-ascii?Q?Ko9jhlZ0if1EYhA8z75ggQ3SnwVeC9FjIB5ktMxwCnjHu+VjbjM+L4lGliEi?=
 =?us-ascii?Q?qw8oqjem5vc5zzvWaINY2B6vXMiiToamZY670gduDK/tFGeNDuY042Y3ujaT?=
 =?us-ascii?Q?TqQ0szxtVbzCnO9vEobcyr+MS4Kt0wblMzO/STmxxlSvDE2jPRWJ5WOls1uO?=
 =?us-ascii?Q?GbWgBW9UYLV0oUhfAGs9EzHgGwCFwHksVig2T5QqTgJc+o4z+ZBlsWR+pZ9w?=
 =?us-ascii?Q?QPYXEHIsuHlKrhoMZ2FBpZye/rGCphPVke38No6TSOm5u1yIQd/SnwDaRlfj?=
 =?us-ascii?Q?vFGHrNc07bzV4VUYkFydYxvhIbL8MkCMyOuJgwg3b75g7DbP013uaSgeE9JU?=
 =?us-ascii?Q?cbV+Fny25+CXvIYGaeEYWY8jvXOOYrQOe7h3WHPSSD7G4dYrRSyxN0HoU1mV?=
 =?us-ascii?Q?SCoOMOXI5CU7hPOyqlLYRqb0Crx1faW1p2OOkVHMkixH5xgIKCk1bVBGVqF4?=
 =?us-ascii?Q?bR+3GmmfJZgV3348h0qOJxGrDfYzBacGcHkTF1ZXBjN/mjDMZbREeDCne12W?=
 =?us-ascii?Q?2ZIV7sL6d1Mpv9CfmUwlehDTIWsBBs81r/Naxm/7VqtlMAqMEUllLiUEM4jS?=
 =?us-ascii?Q?ZLdzs5SXmhFVHUy6cDew2xA+0IO6HHVhrIuCK16Yq/OT3rsNeSOLFt4jiTo4?=
 =?us-ascii?Q?EZuZ2Z4X6qiTO0BETwLI+/LA7ePqoKhE5BjWrG+/SBlxwTvNn4HvvJp9yqFf?=
 =?us-ascii?Q?rZTcbe/wMOCSZGcHpjM90NNfqotQJ3axOakBx/stvLAeK11WpqqKmigYjY/5?=
 =?us-ascii?Q?LW4WtGK36A2cCJqxAmfUwmYpSyayH50m7tu+Q59z2WprC0c9Il1GaYkcHK5i?=
 =?us-ascii?Q?Dz4urVKGU6ew1mndqETrhJE7TCZxuFSfaDbuhEk4aU7ZZm2/RX89gYbDFF/o?=
 =?us-ascii?Q?aC8GpfQ8hd8iyI2L/JIPgXc71QUQWviStLqnArWcDrolSga6KDSGUDxshdZJ?=
 =?us-ascii?Q?h6GJvFY00IV/BX0DED4A8Qo6MycI3PqrxAkQeZU54833HHhO/TiuD/7SsP/8?=
 =?us-ascii?Q?al+//NkJqL21YKI5Bh3KN0wHfBJqvrI2h/fEQ7+XvJqZ6MahrJPxgJQbKBDG?=
 =?us-ascii?Q?f7EVnmXb24DgjYYN1oJeu8N8bOTZR+mrbrc/Lk12JtfgE/4HU1MjzALv9E2N?=
 =?us-ascii?Q?kLODIaFBKvPit5Q/eiX5YIClkgy9z/on7jAGMbtvGe9Vu+u5hHbbGQHOubDP?=
 =?us-ascii?Q?WEXUOIksslNx88a0L9J8ZUP94PT1FNozXmPjD8ui3pQs5/cyuGsx/sXocnfu?=
 =?us-ascii?Q?HoP3gQ7b+MzvM6m2b98I1x0z2fSUxSlmmsd24mJQlNxmKD0dLX1j398XtVLp?=
 =?us-ascii?Q?73TVVEPHd+EJbXFrRsI8q3SvwFZOZ9pIAw39YZZs9IUA7o12?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9338.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4116be-8538-4eba-102a-08df4c4fc3c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 06:29:18.0564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OyT+DZbpUXDU5D0kZr4LzFLdbaa/xDRsZG3cT7GNniFpY9gm+QpDw/jhx+jysYZDklbkJEc/Vy++ZtsCLWCIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12206

> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -746,10 +746,9 @@ fec_enet_txq_put_data_tso(struct
> fec_enet_priv_tx_q *txq, struct sk_buff *skb,
>=20
>         addr =3D dma_map_single(&fep->pdev->dev, data, size, DMA_TO_DEVIC=
E);
>         if (dma_mapping_error(&fep->pdev->dev, addr)) {
> -               dev_kfree_skb_any(skb);
>                 if (net_ratelimit())
>                         netdev_err(ndev, "Tx DMA memory map failed\n");
> -               return NETDEV_TX_OK;
> +               return -ENOMEM;
>         }
>=20
>         bdp->cbd_datlen =3D cpu_to_fec16(size);
> @@ -792,8 +791,11 @@ fec_enet_txq_put_hdr_tso(struct
> fec_enet_priv_tx_q *txq,
>         unsigned int estatus =3D 0;
>=20
>         status =3D fec16_to_cpu(bdp->cbd_sc);
> -       status &=3D ~BD_ENET_TX_STATS;
> -       status |=3D (BD_ENET_TX_TC | BD_ENET_TX_READY);
> +       status &=3D ~(BD_ENET_TX_STATS | BD_ENET_TX_READY);
> +       status |=3D BD_ENET_TX_TC;
> +       /* Keep the first descriptor unavailable until all mappings succe=
ed. */
> +       if (bdp !=3D txq->bd.cur)
> +               status |=3D BD_ENET_TX_READY;
>=20
>         bufaddr =3D txq->tso_hdrs + index * TSO_HEADER_SIZE;
>         dmabuf =3D txq->tso_hdrs_dma + index * TSO_HEADER_SIZE;
> @@ -808,10 +810,9 @@ fec_enet_txq_put_hdr_tso(struct
> fec_enet_priv_tx_q *txq,
>                 dmabuf =3D dma_map_single(&fep->pdev->dev, bufaddr,
>                                         hdr_len, DMA_TO_DEVICE);
>                 if (dma_mapping_error(&fep->pdev->dev, dmabuf)) {
> -                       dev_kfree_skb_any(skb);
>                         if (net_ratelimit())
>                                 netdev_err(ndev, "Tx DMA memory map faile=
d\n");
> -                       return NETDEV_TX_OK;
> +                       return -ENOMEM;
>                 }
>         }
>=20
> @@ -901,6 +902,10 @@ static int fec_enet_txq_submit_tso(struct
> fec_enet_priv_tx_q *txq,
>         txq->tx_buf[index].buf_p =3D skb;
>=20
>         skb_tx_timestamp(skb);
> +       dma_wmb();
> +       txq->bd.cur->cbd_sc |=3D cpu_to_fec16(BD_ENET_TX_READY);
> +       /* Make the READY update visible before advancing the ring cursor=
. */
> +       wmb();

I think using dma_wmb() is sufficient here.

