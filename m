Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794974202;
	b=evCHPdIk8cM/0N/7iK5SQniacERFqIUZS60B2NH7QJmdgBqo7FLwBr782p6mhKzLViTz
	 r8RBGJNz4qR5xZuhwudAZUcSCnRskfzdkQZb53NCbgOqKyX+UepMagNAXlqOuPSmGrqEm
	 71DS+ma8NBvK655oCnjrTYx2pF6EeHM/Zt5zNEGRFossq9h7+AOmMWiczcfIOax38hs2S
	 lmRWeQnpF5+Ff7499ASiZeNFUpnyW2HoUXO+lDmvGaP6kbWlLh1OW2ZZ7ekglr1D7DGKO
	 68XA1rZHt8RCtn+Ewj6ODl/k8Hsce1gxi+PB6zlYOkgfpEs/78MSXEfBQJrUp9UNSig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974202;
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
	bh=5Mor02b1Yo44pibbP0Tz36C/g4pka8WMHsrLntk1+/w=;
	b=4HIJ29NSu3gcJ1JLURtP6xoYi7Sc8lrwGc6A3D4DnbnNo7Ez8k5hPPyTautIF3XG0PHZ
	 2x5AytYKVQlWsejAz8Znmvm/KBBq5PUVYwV4+0pdmyCahBe9efZKvxjaCnVljw9zr3aXp
	 NcE79ybZ5G/Q6oMR83L3znJwLobn0PAhngKNVK8O7YB7XW+vwireqRivntnfU5gWl9u9L
	 JqTzL8fhuQZPClgc20OdKWA84ovUqCOtwZi2MX+0PE6unC9h5jkRBW0SrwiCAfV4iAmm+
	 Z3jqvWH9U5AiFFVaTgt43zkNtUifRLMqAhPoGV4NL3obRUyyQPd4ce8XmNAkTcLcOxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=FJ3gXfeS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.1
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF6606A325
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 03:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BF6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=FJ3gXfeS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9UoIgiC998vPp1tGO2svEF5yWC3UCqXOECUrvBMJy/BeSd3g4mlgseMC2MQQ0bWAkuwTIpOnFzkaZiJUH00NkyPf72fe0RYpSS61gdlisihhJ1AdHtHB2waxluJEYWtpBfzzpUE0k6g1HEqN+g09t6gyqvy+xPlNotmEgA5YZ9dBXfLiVIvRY77lpCLfldmgj1ptRnciaewDGC3md2oKR2q1L5UF3vrpR88Tvy0eOFW1lFPh0N2ipmjR0QFgOnqrBa7Q/Y7C9N5gX+Qrw3JBwJb5B22cK6tFSj0r03iH4Fb1BBtpzlx9yIZN3a5H7VQsRm1ByU8kND8Ud4sFupn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mor02b1Yo44pibbP0Tz36C/g4pka8WMHsrLntk1+/w=;
 b=dxd4kjODnA/EAdnp/EsGSa/eLITJ5QGSEIK6JiO3XbK11dvBcFWoqtubXiK5a8mgbHCdHnM2d+FUsDcY8YHylEFx74PDkjwjhyQoqsZyHefy0ITzJGR0ItKYvjW8tB5XWTa9yYSbuU2TU6khswumSH32NhIBUkCP5vWEXrFg/9fTvDe4nD1TprqpLCgchtag1vNmLI/cOo77zYLwEhjKIRKlV/9iGh+YqHxTNSdSrhT7pHp2gOvoKnyKz46e6ITSVEzxHp2XB8OImbpV5hds3kKCEHlQoXbtQUD/HXgkDC7MPVuP6+s6TZ7rvMmJZSP3ydi1GlLRzqgmunRsKcRKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mor02b1Yo44pibbP0Tz36C/g4pka8WMHsrLntk1+/w=;
 b=FJ3gXfeSe+tJCFYSc6JfdI0Pnh5jtpmN7dMJYP8lNWSeat7bhhRJvW8ripC+eY8GoFBirnibUQQKVpzIrhsEiiT3wdQASzlUMK5YhUPElO7PsdFRIM0X2FjDHuT5aPOpbsVMT1lfLtqCPJv3S899kGGEIKtWXhAxcrEyBIF8o/xlivcJlXLqrmKPRI5jRRA9FSIMBd5hLihSEyS7yumitZ/zYmJfZdo+ecTPyTOUUPWuid1TKjj+p+2rMcHrHtJ3ogP23Jzr0bxtxivG5GUqTUFhsLCFr7SQkdgxuSHJFVtSUUOnMyBpFUrwa8PywHZLBC27W84DsKKiW1fxSB7iAQ==
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 by GV4PR04MB11308.eurprd04.prod.outlook.com (2603:10a6:150:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:56:37 +0000
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680]) by AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680%7]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:56:37 +0000
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
Subject: RE: [PATCH v7 net-next 6/9] net: dsa: netc: check return value of
 ntmp_ipft_delete_entry()
Thread-Topic: [PATCH v7 net-next 6/9] net: dsa: netc: check return value of
 ntmp_ipft_delete_entry()
Thread-Index: AQHdcaUwnVVWBxYV1ECBnP6nns24q7cuwWSAgAR2zBA=
Date: Wed, 18 Nov 2026 03:56:37 +0000
Message-ID:
 <AS4PR04MB9338B009E95F9EEC83363724887A2@AS4PR04MB9338.eurprd04.prod.outlook.com>
References: <20261111062753.1397582-7-wei.fang@oss.nxp.com>
 <179472746510.2199510.5500169981091992734@kernel.org>
In-Reply-To: <179472746510.2199510.5500169981091992734@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-18T03:34:38.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9338:EE_|GV4PR04MB11308:EE_
x-ms-office365-filtering-correlation-id: 90651f3f-7d5c-4970-aa78-08df4527f1cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|7416014|6133799003|22082099003|18002099003|261009223027099003|56012099006|4143699003|261026140227099003|11063799006|5023799004|261102123227099003|261028144727099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 QOunFVWo2yj3bRscDAqKzTsmGJ5+HzJQDn4jLNHjbanecenVq3L0P4vhdv7gGYfW8XV8jYQbxjfeRDYika/ZhAxekRC/ZTNoSVSBcoMBECaC8r/WHN1GFTUu8aHhsQ0XpMhWAAHztyfcXkni7HSMndOhKhbUuFreLb2BO0uLVDw9mujFF30NZn731cP2/Z+xSOK46CwcuIfcmcpat48xvhnDdh3gBYDgtYSn3B/0PfW7mrjxHw9kNlzVUEpWl731TCZc3WYJPvAqdKHFKKrmz1Kyi7o2BJx+ZW9pVhO0gvLMkrQx9j5fTl8j6j7/qbs/Stzup1GOeVA7eLH1Fg+WaNhqTG0KzCYjqvvPaDuPrvSeM/aAwpXLrVTqL58m/n6eSICKk3Diq4U4Pq9FLEH/hQomCasx5rv7JAYACAbEBpj0sU3LIxn7RSOyZPcExBffniNeYnimQvfrGRx4TwIqqxuG9OECU16VbF6jC8svH56mwOp0GhZDe0H93mi8KCYjl/rQLRovfUTcfJDfNtnzgFwTLy5mhmBI/lpjK9mbCGMARxKI+Ow/p8nvl3SxzrUTgyIx/pYrShjIl9B4OglCxIftU5+g2OXWMGJjebKN2VGcYUh5JLMs+hxhz+zkmNYWCV0s2Qsh2QPGCq5wm05Q9cDS65iim6etgF3kmmocZw4nNjHJJU6BgLWGIF7/Onp4ef76JpqyvkJSwyEDqdvVSiGRyWrh3vA5gG6nls56/fw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9338.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(7416014)(6133799003)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(261026140227099003)(11063799006)(5023799004)(261102123227099003)(261028144727099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3UtehVaDS3AAwOadR5CZT4qp7V21orvJPmSxv/ybq7NlAk4hh2hO9TpkK9kg?=
 =?us-ascii?Q?Ve719nXOUZ2W3YKJKuklKUiUhZc5+0xD9L/kW5Lgv1Hcl2IEBw+6IIIoJTPQ?=
 =?us-ascii?Q?19S0xgrr3BX9JUncrzkTNoKIpIKZWvbRnwD/VbgZkGft2vOoBn2cI4bXCLni?=
 =?us-ascii?Q?JVKPDwB+OK7CcBE2i3tGKPKWiSBgfJ9lbPK1hU2vLh7+ADnIk9fjpc5gURCU?=
 =?us-ascii?Q?cpPk1dVB0M+lWKvPBE8CKTTPSlkd41g4FA8OM4w5x294x//tQ5V4cK+rxV+X?=
 =?us-ascii?Q?5o51jtm2BmLgSns4AUW4BiLPBQGPWH/JsInSpr3zL9l89hqPFbm4APpsRhxq?=
 =?us-ascii?Q?4zZAV7NhoDS58mL6xisQHeYKnb3bN6cYON6oxUKIjQoW0iTOLvStB5QlbezJ?=
 =?us-ascii?Q?fq23G4KMQ4b+Vm9TEMsBTSdRzX1wWRl/mnoPdhk0TN0ScgtwNAX9r5vI6qGm?=
 =?us-ascii?Q?RqmqPe8sZUf/qYlFcMyeJUZOuS5z+MFGVhYp4RIGBYbBCKvHLNcN6BrY85bd?=
 =?us-ascii?Q?nrVF5w9b+MXBzBL8qFwKGZ7pWsEf02TqnabXI0mwc5m8yrhp9W5BNe4HbQLi?=
 =?us-ascii?Q?hMwJaOlw4qZ/uyzcbUSLMCsIjG5cn+nXI2HX/ED7VHs7ZMwe9xUPUsd0Jbod?=
 =?us-ascii?Q?ASk+CAxw/rFA/UBup3khgPdfRgJ+yUdPagcsrwtNhufFAkseAYDzHn+vnJqw?=
 =?us-ascii?Q?uQ++DKy8jyo+Wv5u34dD5gAIqJNaH0i74kHmK4Dgq/pJ1mqqs7ZjXLFjPU9H?=
 =?us-ascii?Q?5jzMr9XuKHdcFVfRv3jQn4xrLposZsM4H7LyOXDmysq+tAOIhVuAmO1CJQph?=
 =?us-ascii?Q?Q2cnWy+AgqgHQ4m7QguDmzaFFBJzYP14xEqbTmV69ocNC8HtHuGG7VN9PJTw?=
 =?us-ascii?Q?LCTycF6An0g2Rtwj7OqftPaog311G1TcuUZ/qGXK6woPHyGzI7BQGrE2/l0p?=
 =?us-ascii?Q?K2mmOskJqlkceVO0KsRFZq0HA65Utm8HxQ0sajPl/pAkE0hfoT7WJuse7l/M?=
 =?us-ascii?Q?g1LH/+azL4si1c7JXjBIub1utxTe5csBiA98ig5uEJl8K+Y5bxd/afNSIyqo?=
 =?us-ascii?Q?0V8f6LCOeTr/0Bf/avs6z9V22DJiRcaIlph6j5VyDTW5FaV/WizxveP+VyRm?=
 =?us-ascii?Q?kfV32Lls9w8FpDDx+/9zSQvhiSyMWaMQcn9mROULMwS4+LG1LoeDGJIhFR5J?=
 =?us-ascii?Q?+0TL1/zSb5YaO7jf5CmkSzNBwrGPiu4jb7ZMTIbJ7yY2c3CpZxSHTpc7YY91?=
 =?us-ascii?Q?TCB8DQcc1/ov2PspRBmx/2OYzqccRCuGSR16iQ8aRLYkP6QqzNOXw5XIEw5k?=
 =?us-ascii?Q?oEutUxmTMEdhSv4PULh7dq3fbIWlwxW75j5ggp1R9sgUPc7Z7BfzXmEjjGpc?=
 =?us-ascii?Q?BI5Kxsilha2wRvM5KdUJvzcanX0Mkn/giAxPCeF/Ln9H1JhwyP7LvmMJ0aQR?=
 =?us-ascii?Q?0lyLybskM8KhHBBKjf8z6wLhncrkkQhPqFyYk8MDgcXenTIcattpkCn6gfxh?=
 =?us-ascii?Q?5igVHtW4zRqW0Ay4tGIVzfhYi7r+vER2lvaqoCpw6oOoR8c6YbnHKvgfXE89?=
 =?us-ascii?Q?mDj26gZ+2zO4ZhHlj0w2iDmk36pVKGrERSY/DPJ7wgjurufKlCHx2Wbk2OCd?=
 =?us-ascii?Q?hPAacDP+kR2T4jBNhrqGXrVcDoQzFfiPYzQf0nXOJFRU0wRp4ECytMUAekz0?=
 =?us-ascii?Q?E7KwTvG6KaYOuxBrZRtr0sNzR9/1hKZtembrMXEm37fIKrNQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90651f3f-7d5c-4970-aa78-08df4527f1cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 03:56:37.2180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiSmZcsKRvaVZGHv0wkv8qHcwv8aTtKicD/iH/6HxXrc26iwB0qZW30jo+wSkxt3C3l5VT0cAl2+F9vv1AXnWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11308

> > -static void netc_port_remove_host_flood(struct netc_port *np, u32
> entry_id)
> > +static int netc_port_remove_host_flood(struct netc_port *np)
> >  {
> >     struct netc_switch *priv =3D np->switch_priv;
> > -   bool disable_host_flood =3D false;
> > +   u32 entry_id =3D np->ipft_hf_eid;
> > +   int err;
> >
> >     if (entry_id =3D=3D NTMP_NULL_ENTRY_ID)
> > -           return;
> > +           return 0;
> >
> > -   if (np->ipft_hf_eid =3D=3D entry_id)
> > -           disable_host_flood =3D true;
> > +   /* The command BD ring is always enabled here, with the ring
> > +    * enabled, the hardware completes a command well within 1 ms,
> > +    * so -ETIMEDOUT cannot happen here. Any error therefore means
> > +    * that the entry has not been deleted, so keep tracking it.
> > +    */
> > +   err =3D ntmp_ipft_delete_entry(&priv->ntmp, entry_id);
> > +   if (err)
> > +           return err;
>
> [Severity: Medium]
> Does the NTMP command layer actually guarantee what this comment
> assumes?
>
> ntmp_ipft_delete_entry()->ntmp_delete_entry_by_id() passes back whatever
> netc_xmit_ntmp_cmd() returns. In netc_xmit_ntmp_cmd() in
> drivers/net/ethernet/freescale/enetc/ntmp.c, the BD goes to hardware
> before the completion poll starts:
>
>       netc_write(cbdr->regs.pir, i);
>
>       err =3D read_poll_timeout(netc_read, val,
>                               (val & NETC_CBDRCIR_INDEX) =3D=3D i,
>                               NETC_CBDR_DELAY_US,
> NETC_CBDR_TIMEOUT,
>                               true, cbdr->regs.cir);
>       if (unlikely(err))
>               return err;
>
> On -ETIMEDOUT the BD stays queued, so hardware could still carry out the
> delete later. NETC_CBDR_TIMEOUT is exactly the 1 ms this comment relies
> on, with no margin.
>
> The -EIO returns (NETC_CBDRCIR_SBE and the writeback error status) are
> only raised after hardware has consumed the BD. Only -ENOMEM and -EBUSY
> seem to prove that the command never reached hardware.
>
> Suppose the delete did take effect but np->ipft_hf_eid is kept. Wouldn't
> every later delete of that ID fail?
>
> In that case netc_port_set_host_flood() would always return early. Also,
> netc_port_bridge_join() would always fail with "Failed to delete host
> flood rule", so the port could not join a bridge again until the driver
> is reloaded. Before this patch, the error was ignored and the state was
> cleared.
>
> IPFT entry IDs are assigned by hardware. Could a freed ID be reused by
> another rule? Examples are the PTP trap entries tracked in
> np->ptp_ipft_eid[] later in the series, or another port's host flood
> rule. A later netc_port_remove_host_flood() would then silently delete
> that unrelated entry and report success.
>
> The commit message's statement that "the software state always stays
> consistent with the hardware" seems to depend on this assumption holding.

As noted in the comments, a timeout will only occur if the command BD
ring is disabled, because the command BD ring will not be working in this
case. Currently, all the NTMP interfaces are called when the command BD
ring is enabled, the time for the hardware to execute a single command
BD is much less than 1ms, so a timeout will not occur.

Although EIO errors indicate that the hardware consumed command BD,
the requests in BD were not successfully executed due to the error.

Therefore, there is nothing that needs fixing.

>
> [ ... ]
>
> > @@ -1919,19 +1923,33 @@ static void netc_port_set_host_flood(struct
> dsa_switch *ds, int port,
>
> [ ... ]
>
> > +   /* Restoring the previous configuration is pointless because
> > +    * .port_set_host_flood() returns void, so the upper layer cannot
> > +    * detect the error and the RX flags have changed. Furthermore, we
> > +    * cannot guarantee that we can successfully restore the previous
> > +    * state.
> > +    */
> > +retry:
> > +   if (netc_port_add_host_flood_rule(np, uc, mc)) {
> > +           if (retry_num++ < 2) {
> > +                   usleep_range(100, 110);
> > +                   goto retry;
> > +           }
>
> [Severity: Low]
> This isn't a bug, but the commit message only says it will "log an error
> to help users find out why host flooding is not working". Neither the
> commit message nor a code comment mentions this retry loop with
> usleep_range(). Could the reason for it be documented?
>
> The loop retries no matter which error code is returned. Errors that will
> fail the same way again, such as -EIO from a writeback error status when
> the table is full, get retried too. Each retry also widens the
> delete-to-add window that the commit message calls "very short".
>
> The other add sites don't retry: the restore path in
> netc_port_bridge_join() and the add in netc_port_bridge_leave(). Is that
> difference intentional?
>
> [Severity: Medium]
> Can this retry leave an untracked IPFT entry behind?
>
> netc_port_add_host_flood_rule()->ntmp_ipft_add_entry()-
> >netc_xmit_ntmp_cmd()
> writes PIR before polling. On -ETIMEDOUT, or on -EIO after the BD has bee=
n
> consumed, hardware may still carry out the ADD. In that case
> ntmp_ipft_add_entry() returns before reading back the entry ID:
>
>       err =3D netc_xmit_ntmp_cmd(cbdr, &cbd, &swcbd);
>       if (err) {
>               ...
>               goto unlock_cbdr;
>       }
>
>       resp =3D (struct ipft_resp_query *)req;
>       entry->entry_id =3D le32_to_cpu(resp->entry_id);
>
> netc_port_add_host_flood_rule() also records np->ipft_hf_eid only on
> success.
>
> The retry then queues another ADD. If that one succeeds, only its ID is
> tracked. Up to two FLTFA=3DREDIRECT / NETC_HR_HOST_FLOOD entries keyed
> on
> this source port could be left with no tracked ID. ntmp_ipft_delete_entry=
()
> would never remove them.
>
> netc_port_bridge_join() deletes only np->ipft_hf_eid, so such an entry
> would survive bridge join. The comment at the top of
> netc_port_set_host_flood() says this kind of entry sends bridged ingress
> frames straight to the CPU, which skips FDB lookup and learning.
>
> Isn't this the untracked-entry problem the commit message says the patch
> removes? The -ETIMEDOUT argument in netc_port_remove_host_flood()
> covers
> only the delete path, but this loop retries the add on any error code.

The explanation is the same as in netc_port_remove_host_flood(), see above.


NXP Confidential
