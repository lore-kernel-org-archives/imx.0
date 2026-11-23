Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795415441;
	b=iyBTXUbr7e5zXDiUDUNdR2Uju+dI2m0bNJWWIUaRohq5xh+9mKyIFSfurDrNEnvjOgkq
	 r+B1RI+h+Bwx6vBz8Yz6bVcfUACDcHDURcaQGMIrMaQwdp7Jrb3PRIwKwr5Bm34yJhnX0
	 C8aKDO3YDnaZdOs72aDaYd1DMI3zNWOcUu/lKOsmp8BA6M8EtrA8+DfcHHpPpV7Yt7h4B
	 pWelGeVLrODn9DB8t/AWlEQrTBTBHLE0NAnhqwT/GK+VFXceWHg8zSzqlF31dgL1BLjxS
	 +9riGkppf2kOHnFnJJC+zUhYXou9x51L0xbwYedjaQ7rrhmVpU5nWhvNGCH/RXBzcxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415441;
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
	bh=7WmfcxVfo+tuMrwxoND1BmbAhw440OXQeu6cvQjpe8Y=;
	b=i/ZVMhIfzw86swK2z65J4Zkj8rDYaoTWiWKm9Bbl6/Oy8zYT+aHLvnrL5JVXmgImQ3kO
	 r6G8ullYypcfTPczAmO6bqs15L383ctxp4XujRI1ieseJlq7MDMsC96cWmnWtiyNJL0ku
	 rSlTQZ3ku4r+tD18suZ+/uxDb1dH4Dp/Aw1mfJG9pVD0Q19L2yvWtwA/twnObAVvka4Cf
	 OM0i2C/Rw7iBdUozzFFYLtsTSNV9tuuE/TkMNgu63my0iniKpAfUMkt7XJLAdCAyMwdVw
	 Y/6gInRsPaLvAildORpNPx9LP4TjetUDEEyn52JtLVqaU8dltmzCMi/K9OhTQ4uK3/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=akB8c08W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.69
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01AA606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 06:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=akB8c08W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9WrNEvL7raMkeBnneGw/hQ7YT9LDZvAIAB3TVe2x5Q2S1Z9KleQe9I4AUQeRji68KPXb+Q2jORv4tzpwy72ueCyLE7cZxo5ehVNysdtvIhH/jaFlQtw7smsONa/zQ7lyO74+fLQtS4vOfcRcmshC4Ma3J7/lXHuadULHTQZiGk69NJ832zwpHNGNIdcyQO4MZVt1vIiEhSfU23JOKtAjrd2j8ffAVgRoiX2/Y8sm04GU/s161/ftlmavxONAYQCE+xbsjfAndUXWEcZVCRgCE5dLzx1JjYYtada1/WGK/CiO6eZQ0JXMTPhsEUxef2svkobILPSBW4el1Ps6vsp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WmfcxVfo+tuMrwxoND1BmbAhw440OXQeu6cvQjpe8Y=;
 b=druObjYBmOJdpN/V9+Omvmp2YmMv8hq9UnD+taewfEntgLHZPuzmX02hTUFajIQ7K80j8iC8pWlRicYxfDw+bX6sMqGQ61HwYwKwr0B7ZSxKDC2ERU8n6H0tPRm5pgIrKeb/oFKZMTVFgxa/R7gykZDfpC+gjyK9NIJF8UhJ+uMx0vae6j6zNjnyZRD+bIWMEPN9dHtbPAAE+kEhl1jaAT5AUQE5/i3YfduTeXC2r8s4rNadb3jw9iwcfXbGuGv2BuH/hbnmjcEmkTDzeZnVvZVbl+z1gor0YyQEwVLAIf9XQpbSxFsVtXPUNfz1brVT0ktajAWa3ngJGmPYpJlwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WmfcxVfo+tuMrwxoND1BmbAhw440OXQeu6cvQjpe8Y=;
 b=akB8c08WPtaQ0j6RD686U4Igce8edXmb99VYi2FCMOt77yanxg1XZ5aJhbKOVssqxosSS0VQjF1I0UsjuYfmkzY7MAb79wDQdETXCGYdyHV7sdtpNL1IJgFP1fMMSHw8z3kuAtzFwCavLQjILNza6aUXFFhCIkNuEnwOYUbJEbJVyZz1QjW0Ba9Sq4JPQ5hrBLg3rJ0pAluo989Ol4m4UNsRTVCQnzXG6ggrqIfOkGGLjFXTOCjotlR9KSYODtBUe9kkSLzEY74ewOFkuh/jFqCBytiTZfekEnw+r49rOlLuMKQLYKW54ZxEhcivMSB2cwi0uYacs/fRJWwWGaPRFw==
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 06:30:36 +0000
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680]) by AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 06:30:36 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>, "Wei Fang
 (OSS)" <wei.fang@oss.nxp.com>
CC: Clark Wang <xiaoning.wang@nxp.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"olteanv@gmail.com" <olteanv@gmail.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "richardcochran@gmail.com"
	<richardcochran@gmail.com>, "linusw@kernel.org" <linusw@kernel.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
Thread-Topic: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
Thread-Index: AQHdd9JFrual8XbhpkqJwtDHKU1MD7c7IOoAgAAXSAA=
Date: Mon, 23 Nov 2026 06:30:36 +0000
Message-ID:
 <AS4PR04MB9338EF6246A8910C1BB4393988452@AS4PR04MB9338.eurprd04.prod.outlook.com>
References: <20261119030534.1892935-9-wei.fang@oss.nxp.com>
 <179541033885.3135.10657211800089692875@kernel.org>
In-Reply-To: <179541033885.3135.10657211800089692875@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9338:EE_|AM7PR04MB7189:EE_
x-ms-office365-filtering-correlation-id: d2384d17-e8ce-4d7d-b916-08df492b4909
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|261009223027099003|4143699003|10067099003|11063799006|56012099006|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 g336sZHx3cNpceX814fSPxsL0m0UVOUIGVPc+YJvWq8Z+2r0UmmTjO5N0xNv2mhVen1J+Z/EAWawj+qslzVJiGUOeP2fkUxkjuOdDKwtipsnMwL/yEoOR9wUN12UZUMqAAZvh+gVn1+I3dcNoAmbYchkSRhXtioU8tXStEChqacvCPvcLZiPgtF8O3Y26JqDvxe9WUwKI3hlDbtLbIZcP+PQq1kCG6dV926zqNWXKGqX5HqCFlPAi8B1RbF/COiM5YnQI/lBXCYde1CakXFG0fbzXjGzKRZEwmHeRZkO4eqI9/Sp+tSmMX2WPGmV46aSI3IQKW248CTYVu20TorLMBIoxh/haulUOYJmwTYqA3PiIZIWyDD8mPyVWOQDo5zOXLULudZowPpWvVFqrsvZ+4I9TD3WAp0ljZMzHRQiqMcrO8eCKnN8YoaMYW/z4pfnxwAIoZ2hmHUz6ZWuAngeB2Kanpg13tGOjh4OZwGhZpyK8zrY8isiiV3Xcah5qz1mV+tN0gj7iL0CgtnvAqLAtvbuF0EpyQOLsPKQPT7EEVIT9RaQ6ig/CUZLmZ9j9p/2wrEh+1GLcRKFwoEkTQaomFlaRc23TwEi90Xy1dhZDHsjNIGoDG3B0ehK3zAGSbyKYVFXX6BklBlyRzyyhMsO/Reu5ZA2WpM8ys55BZt+j20KSKPQ+r4GA0613IN7lS7H2F/zRImukoJc4tkL9aOjqLBrs/zSxm4gvQ2aEyUfBwE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9338.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(4143699003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BwzIpMlaUTessdZB2wfjpSjkB8c92Uml5fI09AoQ/5g2A38Qco4J7nCwHlGN?=
 =?us-ascii?Q?8SEJz9xCVe81M6iD3mcuP907qFF0fqpfl4SLgcdTxp9H5dWmGwR52QXW11ap?=
 =?us-ascii?Q?CDBHIXM575ER2MlWstRme0LO1/Mz/WhpphMcQG5HHT6BwbmDcUFgawd1Env9?=
 =?us-ascii?Q?rZiJ9Bf2IaXyssvwP54Vwl/0Dqlt0tKgFcFKtYOC151CxCpPrZKkCEv+OY2V?=
 =?us-ascii?Q?cyp7/cRJsY//5mdlCbixNNURGvt9F35WP35TuFuiBMQ6EYuS1F0MG3RQF9Ta?=
 =?us-ascii?Q?uhn3iEACtikXpRHypolQucXC2BrB1N010und+ErmNkCp0xCGAGXNe41sC6a9?=
 =?us-ascii?Q?zBB2O81H0F4J8tDqj/mUOVo7osdia010vagKrCeFbdojfKUkbDcQOowW604Z?=
 =?us-ascii?Q?f1cu6dE7v8pqw3W41Hf9vtb+U03nzmARMujM/8xhc1JzUKzCAGn/ENV5Pno7?=
 =?us-ascii?Q?Q+LO29ZSjVvb79X3RISERUm+SmP0dSa9ZuJpHk98cDv74Ofh1fAKur/jOCgY?=
 =?us-ascii?Q?UclLlDD/EFC/VTb50ceh8vu/t5MKalC1DS2qGW7dnhEk5XTHOiNv6Xszrbip?=
 =?us-ascii?Q?5TjTNC73H5mQUyPekrP4NjJ6FAh9+muZf7ojdb+CXNML9yrX6xzbQBIlcdnX?=
 =?us-ascii?Q?EJl1ci6nkGR+DFvKASgqDoWchQBiXBXIr+Gd/kQGl2oXJxo9r7+EbP//yFfo?=
 =?us-ascii?Q?ovHDU3a2X+vvDxzSfsy8zi7zbb80+fFYpntd0pNNCQRoOgwNuzKZsc7PJH/q?=
 =?us-ascii?Q?wfEquO1YGshoIgiP+0sePaTzS/e8MZN+07De1DMAVwYkogOyvYlxAKaFqZcG?=
 =?us-ascii?Q?kAX97VvstbYrCxNZKjoCBCr35igMMtl183kL0PKog3ef7ToyJt+mSNeHULhy?=
 =?us-ascii?Q?9Eeegh7+Bm4gUBzSzeVWNakFgCq/qTUSIihs1WLTAUKgX+W80nHiTZBmYlqk?=
 =?us-ascii?Q?R34/gqTjAhqXAhzJk9DPN8VYUinkG6EKGzu6YPovyheHG90B7kLATQB0m0iy?=
 =?us-ascii?Q?fgCL2OnSTFegPUUubTfiNYPdNfo7lmDvuLaymSsL4xk7jjJGKREfOYHc1OCu?=
 =?us-ascii?Q?DPFqPOkGH+g/fv2B8Y/1uO1vf6p+pPntzJlwSTJtxJrs1rrH7fhwOKyGX7Lm?=
 =?us-ascii?Q?u1DpXpe4CTZS/JgJ2GUI7N9V5h113rDESEchgolhwrxD1ogtNIbGk7ZE63bk?=
 =?us-ascii?Q?Qt8ymLxviMcgIYofpDEdLsF4rPICKp6K03Jrp3bXbayXtG/8J84ynN2h6jlS?=
 =?us-ascii?Q?r5dmyx37aUaxocVPo+zZPINNvP3MYgaB7Pf7eVWpbRvkAeKC/9t3OPNy/2sw?=
 =?us-ascii?Q?dLdF05kYAA5DAJ7JmqXUnh0rhs5GOAFs2zn5owRGsNWOvRuWgeJhCddmQOkb?=
 =?us-ascii?Q?J29J4NATN9B3XFtwZN4bRbaCVj1ZtMYsKTqMH9JgpXdVd59l3qMLztXLMaXT?=
 =?us-ascii?Q?9yFvEtxUK7K8qO6QGMJ+Ihr3b/2Klj3+vU4ATxDwrYTt2pX8UYea9amJgGxi?=
 =?us-ascii?Q?3v1TPRSpeor4moCzLzbUxyzQ+VmpsgyXSlSCD1xkJgMnjX2wF4v6SQdq5NqQ?=
 =?us-ascii?Q?o4RNdMuojzCgdXFnYm47D1vdFlj+exmGNA1XrtjUbrtDUZtral2qBaFoNC76?=
 =?us-ascii?Q?AST7Zj1qzZKu18gaet0I6JvPjoEOYEmhCupwjHRUJD3k+H+eJMfaNbVBlIGR?=
 =?us-ascii?Q?AnQ8pybKpvAu1Xe9kpnP2IGlhH33dtj6+vtwcE+4j61ShF6H?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2384d17-e8ce-4d7d-b916-08df492b4909
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 06:30:36.7234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBFgLCbuRhWSRXJoQiDIMVf4IiPV7qpGkaN7bi9JIRukR35gwUXnDnG0mh49rSiBcXy9U6PTT4I3guogmCWRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189

> > +static int netc_port_del_ptp_filter(struct netc_port *np)
> > +{
> > +	struct netc_switch *priv =3D np->switch_priv;
> > +	int ret =3D 0;
> > +	int err;
> > +
> > +	for (int i =3D 0; i < NETC_PTP_MAX; i++) {
> > +		if (np->ptp_ipft_eid[i] =3D=3D NTMP_NULL_ENTRY_ID)
> > +			continue;
> > +
> > +		/* No -ETIMEDOUT here: with the command BD ring enabled,
> the
> > +		 * hardware execution time for a command is much less than
> > +		 * 1ms, so no timeout error will occur. Any remaining error
> > +		 * means the entry is still present in the table.
> > +		 */
> > +		err =3D ntmp_ipft_delete_entry(&priv->ntmp,
> > +					     np->ptp_ipft_eid[i]);
> > +		if (likely(!err)) {
> > +			np->ptp_ipft_eid[i] =3D NTMP_NULL_ENTRY_ID;
> > +			continue;
> > +		}
> > +
> > +		ret =3D err;
> > +		dev_err(priv->dev,
> > +			"Delete PTP entry 0x%x (type %d) on port %d
> failed\n",
> > +			np->ptp_ipft_eid[i], i, np->dp->index);
> > +	}
>=20
> [Severity: Low]
> Is the claim in this comment guaranteed by the NTMP layer? The delete
> goes through this path:
>=20
> netc_port_hwtstamp_set()
>   netc_port_set_ptp_filter()
>     netc_port_del_ptp_filter()
>       ntmp_ipft_delete_entry()
>         ntmp_delete_entry_by_id()
>           netc_xmit_ntmp_cmd()
>=20
> netc_xmit_ntmp_cmd() hands the BD to hardware and only then waits:
>=20
> drivers/net/ethernet/freescale/enetc/ntmp.c:netc_xmit_ntmp_cmd() {
>     ...
> 	i =3D (i + 1) % cbdr->bd_num;
> 	cbdr->next_to_use =3D i;
> 	netc_write(cbdr->regs.pir, i);
>=20
> 	err =3D read_poll_timeout(netc_read, val,
> 				(val & NETC_CBDRCIR_INDEX) =3D=3D i,
> 				NETC_CBDR_DELAY_US,
> NETC_CBDR_TIMEOUT,
> 				true, cbdr->regs.cir);
> 	if (unlikely(err))
> 		return err;
>     ...
> }
>=20
> If the consumer index does not advance within NETC_CBDR_TIMEOUT, this
> returns -ETIMEDOUT. The hardware may still run the DELETE after that.
>=20
> In that case np->ptp_ipft_eid[i] is kept. netc_port_current_rx_filter()
> would then report an rx_filter that is no longer installed. The commit
> message says this design avoids exactly that:
>=20
>   "so a delete or rollback that fails partway does not leave software
>   reporting a filter that no longer matches the hardware."
>=20
> Every later netc_port_set_ptp_filter() also starts by deleting the stale
> entry ID. If the hardware rejects deleting a missing entry (the response
> error status maps to -EIO), could every later hwtstamp_set on that port
> fail until the switch is set up again?
>=20
> This needs the hardware itself to stall, because read_poll_timeout()
> reads once more after the deadline. The host-flood path added earlier in
> the series by "net: dsa: netc: check return value of
> ntmp_ipft_delete_entry()" makes the same assumption. This patch adds a
> second user whose reported state depends on it.
>=20
> Should -ETIMEDOUT be handled separately here, for example by treating
> the entry state as unknown? Or should the comment say this is an
> assumption about the hardware rather than a guarantee?

As explained in the email thread for patch 6, the -ETIMEDOUT error will not
occur, so there is no need to worry about this.


