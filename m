Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013027.outbound.protection.outlook.com [52.101.67.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74310F4
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 01:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721005248; cv=fail; b=NJGObIClXfYk+owSUPx+Lq48uYU2wsddTN06iCHDPDZCCEPDtnHDAQoneZ86qY2z7r/IoMuHWOy2d1FjqNNgeXXbbJ29BElRtYMHSWRxpMjNqlRK++k7eSA3BojOm6xwSuQELdEFGp++v6nY+RXso/ChCZ5GBAI/Nq6iHiSNAmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721005248; c=relaxed/simple;
	bh=icVePotLVcJ/QR9PpcsYQjTdwsNs5m8wXP1YLv0ckEE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C9CmzUnQ2ShUNnheTKpulj/d4ocNuuJiwo1WBOtIXmj2CZepKvtqM9JD4VnPrX64wU78AH4bOhij+4MDTycOzbxWZzsH+rVac6K6HbHyo2myKJmUUWR66rW4RVNBIKUP57wn3zfniEKxkvyJs5ctfebq4J417WcXWC2O6bRPpB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=RBRqyPVg; arc=fail smtp.client-ip=52.101.67.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RBRqyPVg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EweFmQBeN0a5syipP4+fpXqBrjhfGtBPc7nAZkNeiMLAmvnnqTYtOiaRAYFAzHb8SAZcPlKpg+EBv20nbEcBqef7E8cRwbhBmNaMwx8bjAEdxoazLKWVMY25lXV/iz7PPlNu/SCfSF5g0erHUkEGGNUGLIVh8ag1Q6+jEik3VcTSwsqMrOWsYBjFMt1IZKqz642uZa4g8hnbzU0sNbom8eT5wF2H4Vo8sY1tUrkFkL1uueFpM6pW4+GXcHUcK8lM2SQ6khbxIVibiBTnTKobXD6WuEqTit+TOahscXlYmtGIu5NhIyMcRUZFcnN6z2HVeLmDotHI4jMzP2wtWtU/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw0vHgJyaRJGeBbVYzAVVK3PWF+9Y0At59Q2j0IC/LM=;
 b=l5IzUqJXBR0ZcaL269WlcPdh22capuwuTxE0NVozH3ndZ6JPXdqj5OkqC4RQgqbLB9EkQAZ3pbCSehyZ3wFgtJvsMamLvWDDebBZn4gNXnqiC9ExWxebvrr7VjTHFrYEICvlVq7k0Y1H3VfGoyuDSj0C+X4SSd2Wb9Fe2qCIKKM/C1JmVH4CReNdHPPSUYBsEvTvwP9xULxJvpd3HElcUelOUxUkQArv2Ul8SY4/LBxSZAo9O5EzvDdjCwOweE++9YHcEB6ghBIoxbJYhQnEVPMTvTxRO5lP/G0AH36udqLBbcEYufO4evs4NivkrDUJxzkCRSZ6ZkQ5zB7noiDXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw0vHgJyaRJGeBbVYzAVVK3PWF+9Y0At59Q2j0IC/LM=;
 b=RBRqyPVgA56/IdkPtii9U47i1SLdRNf6WRlvkBpLa3gVlpetzoriFFifz5IbGaUMBIRvZzVhDb1kzfuZZXM9b4utWuMJUdd9nLhBinffQpetLgbMwqgYY67+tEL+tqFshKCVs2TQTuhg5ugefMEt0u6+tuJxVFcXB2aCYvVYlAQ=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9376.eurprd04.prod.outlook.com (2603:10a6:102:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 01:00:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Mon, 15 Jul 2024
 01:00:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: i.MX8M SNVS ONOFF key handling (secure system)
Thread-Topic: i.MX8M SNVS ONOFF key handling (secure system)
Thread-Index: AQHazTb8hN5ltMoiJE+1y2PO1t9wurHmGjYAgABpQICAEIUK8A==
Date: Mon, 15 Jul 2024 01:00:41 +0000
Message-ID:
 <PAXPR04MB84595C0985425188C281E39B88A12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240703105137.fpjollqvtpysktqa@pengutronix.de>
 <AM6PR04MB5941D70C5EE91BC83E2DF4FA88DE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <20240704123735.arh7em2lxcc42y6w@pengutronix.de>
In-Reply-To: <20240704123735.arh7em2lxcc42y6w@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9376:EE_
x-ms-office365-filtering-correlation-id: 28f81979-ac5b-4a5b-e937-08dca4698c8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MQxXRJ3o6iKDcK8qhi+a8pV93ZNKsaXHmvapjAt2Itq4LyoZZHXZdnx1cSeY?=
 =?us-ascii?Q?1bHMk/d9yx2yMaerINvB70TtawXRFuhX0RtldXmhbh7h4+w1I4rmyHGNphnG?=
 =?us-ascii?Q?zGRRQyIlWkJEDmWFXMgODCu6lxIt1zoh4niaxk3zyfYA6gt/H/H5VkhaufAN?=
 =?us-ascii?Q?lVb2p2V0lUXrRJWt3FbxaN4jrldGJm0CWvZnTQxj0r1V51Z/IQDvMJlSd96R?=
 =?us-ascii?Q?ZvECrHHeee2qrCJzz/3r6QQsMfalw5bhfs9SmivChzwvvyGk/MdYPTKtZzae?=
 =?us-ascii?Q?DVI8lyvL6i8TruRi6rY3NLNDLu8IhS3RiZdrl1C+fXQxQfPKyfOSbLXJqyQO?=
 =?us-ascii?Q?+Nk1w0YH2IXAIt1zOaRhei+Ob+cPdV2tPJ2ams8KCWZygw9vciyOJgMAdFSd?=
 =?us-ascii?Q?Ut8lDZ40d5XJRt2//NBeyOBY7ebppGpWyS7fWTJgiZT9rjUOwBUhXXLLkL+5?=
 =?us-ascii?Q?BxP9Ce+5rADcUSXn2an+iMO7EYnseoWuDsz5lGlyoSBEQJIRbPxOKXWNPWZ0?=
 =?us-ascii?Q?ChmcwYJyf3XVEg2VtMr9MExVJPflnimps/xtgTtYiJucsInf+frDpKA8rxW8?=
 =?us-ascii?Q?Rg/056iH2o0RQeyRMb3/7SAe2tPCxO27lGbK7ET4gvI6CWBQLTN6Zz6x0+jA?=
 =?us-ascii?Q?6Hjm1+/pvMz9UmEBYRh6wIh+oig6BjTvYClgus1fWx+dT5jVjgyvybBljteQ?=
 =?us-ascii?Q?8lHAUW8ND5eazGzVkXpani09h8fzFQ3Dmduw8i6a5xJepN0aWlcSOBxXtzos?=
 =?us-ascii?Q?p+7F6e8WZsDJRY9nesCnIGzE6RFEMiHsSiF+ErmZzWNT6oI5o1+rmL7XGOcR?=
 =?us-ascii?Q?rJduEWomThkOWUYBzxCIQ+50pmQDLBPnUg3VH8ZrRDjN/p7uj3Sdae5cg5qe?=
 =?us-ascii?Q?tYNozmjD4vW/ESwqUmjd+nLfvvo8brQ0A5do2WE/PZ+NpguiqgkXMtGXsRxR?=
 =?us-ascii?Q?ifRAw+V3tUtUqhqKeaZTFNmOYaat/joDYyxYz+5TAMMK2mDjaDazZ227GG89?=
 =?us-ascii?Q?G0sKaB7+EVSMOG/s/Cy4vzuZBcQaG0wF9CrPqkbRHOQqq1SYDPpxvzG8mPDu?=
 =?us-ascii?Q?IEgscD3P1N1XUCtFaGrD9SquGjzCgBv37GqktDNCSZEH6ezOCTIHyEOphKxg?=
 =?us-ascii?Q?hMYYec7CWQhyjd+Q/vh7EKOTpec6v6cyDYjrjy7abJYMuQdk6lX7HAeK8QKE?=
 =?us-ascii?Q?MDC24DQd2AMFnj3kxe8ePJMDR56zG9GYyABxfIyaYiPo6XTXN2C+oQamwccX?=
 =?us-ascii?Q?CgeSW4dwhlOhHbiaq+r5f/4az34/dSqqEbjhQrLIe6KnQfXKGOxKcg3saPp4?=
 =?us-ascii?Q?W2Nq5kLaiXJN6BXK/EzBUzGFbSpcMqDbcKyj5IWZ3zSVbz8SEddnAAHbe+D+?=
 =?us-ascii?Q?lup3GG8J+/BuG3636Bpv4+eSm5tm/PtKC6c5AfS8qug/AB0gYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?scJAhe1mvO9AISioEENwREmSyFQtTnrpQG4B2t7iHNzed8eY5O8NHMqQMNjv?=
 =?us-ascii?Q?1OKasG/kuGsXvnANU3wOi3JySCh6jIo9Sh2MgI2Q8bnWs1hPBpN+RQ9E1Pke?=
 =?us-ascii?Q?gr5ao1FTSu39aESHqhpFLTo0rrquE45fvva9FcAf46susR28VlmqfljZFkeL?=
 =?us-ascii?Q?VT/YJRBDNYDZESAUlWmLIGgSBFtNPJjMsUq7R2L7uBQd1xyLrlZTh9F+VBqH?=
 =?us-ascii?Q?W8wM0unDNHRNT2x9CxLbEoxgA2nUekLbR3h6drzYas7oQlYj+iFzwfxm8PPw?=
 =?us-ascii?Q?YlzXdV2hsma2Fd2M+KSJ9UWMRycBYVj1T2lAjsY2gDId0qqV6vDf/OGm6Kz8?=
 =?us-ascii?Q?XrV6l4SjpWIm+bRPnEW+j/HUTn4pUkD43WIRMD4cmXnrwIePPPUihg2SDQCz?=
 =?us-ascii?Q?Y9csDRMlxlJB4oCaJ/7m3OPW4EMh52zQidsjQsr4NU0Uk+OMahcdWfedVaCl?=
 =?us-ascii?Q?GaXWzEw/LN2rYgv4vWXTvT0Iox1m+USKc+gVyEXFOs8dahD5b89c2wtT0BY+?=
 =?us-ascii?Q?2MrSNZTOh9kcKJxGAc19lvNhQ3B7w6Boe02mj2w1vCs5E+WLeM+Vy5Xgd3vv?=
 =?us-ascii?Q?C76mWUAb5NGOat+lW0QZ38UYxGUK611Y+PEba1rG1asEMlFYDO87XR/cJd3u?=
 =?us-ascii?Q?30Yi7PbHmPqRf19E8V2GbMY1SA8TcKI0+jWgdpTQnesYzmOMzZ45b/x0JltO?=
 =?us-ascii?Q?iK4eYbhqiglqn4Np+dPut+ks77kxlaERDJnuAuMW6L86tnHwJfgS+AOq1h5l?=
 =?us-ascii?Q?o5LI2u4dBfajgknJSNy4mh9MFsSjvRn/qdByMnNycBD84xK4PFSZQfUafxca?=
 =?us-ascii?Q?o5hMJW1Oo+QHdB2POPyjowqKaQUJK56oMWThsGgphMlaRDoGYU63lOhLlbwJ?=
 =?us-ascii?Q?5jShX9/+1re0hC2210g+6BUocHIfS8W8qLIS8XZYcURwFBcABIie46IbUTF3?=
 =?us-ascii?Q?fgg+zj9vmykdiJFpHiR7twklFLqFcs2QqnQ7VBo9lmbu0GLLpMB/5LXWHGNx?=
 =?us-ascii?Q?4nvNxMoWV7V1PTU6aMa58+YsV7zICijikVLKaZaKKY1ylk9vJn5sl0fVSguq?=
 =?us-ascii?Q?9OAbrezCowGHO9uvzp1DBN/b6mpn00ikUTywJn64PhQ7ct6Jp0ZJlS4gzlzy?=
 =?us-ascii?Q?0P1YRpFcDcwZGNwbbhuuIY/bptWRfqIQjJ9nLppdFTe7VJEFDu1km2OEGrDc?=
 =?us-ascii?Q?cbW5eiAWpCwARHctOxT5WN39tLdAsgVFhbsw/DbS/J6c1SOeMiA+KCIcXvYP?=
 =?us-ascii?Q?jnyR4n6eX0t/v1WZqYoNzL3IULWjRy8Gxsd8K+sRYbg2vqy/tjcPJaw9bksV?=
 =?us-ascii?Q?IxHKdtOIOR61uwPojuDBuo++1jpnRT334alZAo1p75nV32tMknw77zS0k6hY?=
 =?us-ascii?Q?OExhKB0tP+/4lKRagypq2isCKy9Zu2d+qAKJe5OfQpHTfI5hk8lbFrOFdYT+?=
 =?us-ascii?Q?6/pmStR09ZplhPQuFXt7bmISiLcKmv7VQoBp3sbrYvqzcFQw93tPKl9V5ufF?=
 =?us-ascii?Q?RcDaLLkmbPEiHgBmWEzn6lm/6AXM1m0XBY3TwCig46BF/qCoH9q8dsTPdDcz?=
 =?us-ascii?Q?B9KRER+CxAsXzYsu9w0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f81979-ac5b-4a5b-e937-08dca4698c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 01:00:41.6440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzdfPQy6OVt2AAjO7ZgSGzjsEvrKlbwSzX5gItJ841ylFEFtYbxSmaY3UHqXqBe5aZ1oEq9ACSaxHgqVngaQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9376

> Subject: Re: i.MX8M SNVS ONOFF key handling (secure system)
>=20
> Hi Peng,
>=20
> On 24-07-04, Peng Fan wrote:
> > Hi Marco
> >
> > > Subject: i.MX8M SNVS ONOFF key handling (secure system)
> > >
> > > Dear NXP team,
> > >
> > > we do have the following situation:
> > >  - A verified boot (locked-down) system based on i.MX8MM and
> i.MX8MP
> > >  - The ONOFF pin is connected to an ext. MCU to initiate a
> shutdown
> > >  - The NPSWA_EN bit in HPCOMR is _not_ set
> > >
> > > According the datasheet NXP introduced a new interrupt called
> > > "ipi_snvs_btn_int_b (button) interrupt" which can be enabled via
> > > HPCR register BTN_MASK bit. The interrupt level/edge trigger can
> be
> > > configured via the HPCR register BTN_CONFIG bit field. This
> > > interrupt can be cleared by _non_ privileged software e.g. Linux by
> > > writting an '1' to the BI bit (HPSR register).
> > >
> > > Unfortunately I don't see how this interrupt is connected to the
> > > GIC. I can only see the snvs_lp_wrapper and snvs_hp_wrapper
> which do
> > > share the same IRQ number 4. According "Table 7-1. ARM Domain
> > > Interrupt Summary"
> > > IRQ 4 is triggered if: "ON-OFF button press shorter than 5 secs
> > > (pulse event)". It seems like this IRQ is controlled by the
> > > set_pwr_off_irq
> > > (SPOF) but to clear this IRQ from Linux we need to set the
> NPSWA_EN
> > > bit.
> > >
> > > Now my question is how the ipi_snvs_btn_int_b irq is supposed to
> > > work?
> >
> > My understanding is (set_pwr_off_irq | ipi_snvs_btn_int_b) connects
> to
> > IRQ 4.
>=20
> That was my assumption too.
>=20
> > For more details, I need check with our Design team. Will update if I
> > have more information.

Sorry for late reply.

There is no debounce for ipi_snvs_btn_int_b, so if interrupt detected
on PAD, the interrupt will be triggered immediately.
And this interrupt has different trigger types. Level or edge

There is debounce for set_pwr_off_irq.  And this should be level
trigger.

So there is possibility that ipi_snvs_btn_int_b could be triggered
before set_pwr_off_irq. Then there is a short window for user
to do some action, but my understanding is this not make
much sense, unless needs edge trigger interrupt using btn.

Regards,
Peng.



>=20
> Thank you!
>=20
> Regards,
>   Marco
