Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766130AABF
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992007; cv=fail; b=HpZBYGgEQUw4hagDg0ZAsF4oDuwmwYrT7uCSdHyFPGi2Ro6uFvbUj1hAt20K6ezACbUk9i8LRjdka0Lkt1hgHu64sj+/tA6lPR9qzVh1wqiB/ttfQ9bShhsMLTje8OQtP3Uf5qt41IbX88lUfFczfF394eFnwuGmNbigW+tJywg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992007; c=relaxed/simple;
	bh=uyeYU/VEbVgXnNUTALhnUOG3tlZs8CguTMjetK7RdLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HI11VKi+93be6Wk857r8mHMFjQb9xt80ZCbCSQJntFJ1a+7NewDm+w0hE3FGCpGc6c1gYPp5ttpYtNvtzEkcHN25Kq4LeZZVLZNNdda5/5fKBLv8Svk/99e9tsOom3ul6UKNJXgS/Lm2vjzYjOI3ImOj22EHu8vV4nPB08HE33M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lZ447SQ/; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lZ447SQ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0nH8QSV9pysA/LjA8JZHI+Pz/QM9NSd2wKh66zl5uDljkaJeKfgkTMXJKwb6K0E0MXtLlUyUGnJXujrCyABDS9QpsJ3A1j2r8guJHEWs8bko46kQQU+YoER/RM6VaVotNsIeyHIf4kcgS8WhQ1cnhFjj2n/lzifSkA/rzM6EMx5euezWQvAJw34pWcpE9VrO3rFCnClQd3WcWumOfAq/BwXFOGanTxxLGfNpQXvwZ2nbDyG1HezOwAccIexOBoMAYpg3ma5s1L4ZGhNUQiiAxn8PZwFWc3u5tNb9q+vFPuJtjwfdXQqOcosYxYVVOiut3NJLFxXTJY5tlKH4qENng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=262ONU/II9aKZSDAcofKLmDf8Ctahhu3GQSsDcv5ejA=;
 b=AUZOZpM9Ru2HwAbuPnrlX4BJ2d7gNMu1RVtZyVApnSvLKcn9JcaWBfJhEYwTG3bCoppFSN513/OR9Jk68EoVIeP2cyicRNgNbu3Ktw2PxIeGoNF5cttcwWLpGRGsKcL7Uyinc74n5MiNW+++B8/gTizfmSp80USvOHwHYHQhkl7ijIhewYlvNIoTHwgaWXv3xAoFrc8JrqHYyTq4WLxi3y0WSZhSOROhIEBAcQ2LOVQlOTSRIBbDfpUphXzPHhFwQjtdmRE9ZZx6w3JGdwu7TkluMHlM2MOXPESchxVz6TXPwZL33GnTu7yX6rK8XCVqiTOr7uqtvhOlnDW6heo9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=262ONU/II9aKZSDAcofKLmDf8Ctahhu3GQSsDcv5ejA=;
 b=lZ447SQ/53xvleAmbOpj30a6Z40bPjSjQbYYl/CRkaEX5cqItJLdIHH/UNypQtbmupof03Ag5g5dcdM1ZQyuJRPelY9yCAhyBg6dJX4a6n4a5Dh7pyQ/OFhvqIssx+/DHH6U0MFJ2WaIBadLnezp3ARnHcOx8lldYV4/il/O9vXmHPvJBiRF5Ahfly+bhaZGl1oHxzpbC1Z0VRQBX9/5vPnap7Xi6ubh4/YshPMvm4j88XTHrI3pUpXrJeRViEY4F2vtbc3VDiZmPEaJ8dDNz4AclkMZFkbPwdLgzWDC22JMQYs+p8WbuaXVf5mhcNFuqZHlkv7vWXvcH1SNuW3Rhg==
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by DU2PR04MB8808.eurprd04.prod.outlook.com (2603:10a6:10:2e3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:46:37 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:46:37 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"dongas86@gmail.com" <dongas86@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, Anson Huang <Anson.Huang@nxp.com>
Subject: RE: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Topic: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Index: AQHcXShvkeNcu2VmTUKLRIhokyBnebUBq+eAgAApjNA=
Date: Mon, 24 Nov 2025 13:46:36 +0000
Message-ID:
 <DU0PR04MB929902EFA27FAC76B61349E480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5946049.DvuYhMxLoT@steina-w>
In-Reply-To: <5946049.DvuYhMxLoT@steina-w>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|DU2PR04MB8808:EE_
x-ms-office365-filtering-correlation-id: 45d2b9c0-118b-4638-ee68-08de2b5fe35e
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Df8KjdjlujmEvEZLHwgNVnHdKE1sycNwxKuASYYzbUrRfXj2OVSkB4vQnb?=
 =?iso-8859-1?Q?fKJUYWqqitlRsJPxHdBBpxdUE/D+68l4fgiYEBMdibTycHtLzw+NL2133+?=
 =?iso-8859-1?Q?Tznp+aeDN44ZjnhO7i41gABqPHwdH8c03EGJC3CJ5aiG5r5yxjnnRHiwVy?=
 =?iso-8859-1?Q?WBb2W05q1hhJlqzmCobQxEdjtiVhMy1jVsV8eTgeSXttkvzunDQFGZPcLo?=
 =?iso-8859-1?Q?boUe4AiurduwzyEq6r7YkaGhED1iCpbXdHhkSFjWEfaazmpnI74I7yv3sp?=
 =?iso-8859-1?Q?vxwN08UqSIfwaElr7tOXSnQ2Y3WnxehcICuSuNdrpd/MRWqaq5j8pwzj3u?=
 =?iso-8859-1?Q?i1BUnBmUbSMyz29F14dbO0cYEt8BlL4epjK8oFIJjQICVvAXQQdZaRZkf9?=
 =?iso-8859-1?Q?7SZH51Lyu5bB5+umJRpuRCS3AMaPEZVcais13OgLZvqoExHciYWapERYwY?=
 =?iso-8859-1?Q?FkxqnQmKwEQ1lojlVAHvrU69R+ianKZyZ9RgnmfBxP4ceJC51t9OHWTxOP?=
 =?iso-8859-1?Q?SG9qywkx2iW6I63iMb92YTI89wZbOCOWHmDk0D2XqAGrdDIsmLvDXIUvOB?=
 =?iso-8859-1?Q?5dyV8QJELIEXQVeG8jj1qZtdST8oTJR8vQ5lGrmpqIXuu5W1yFQ8giIZWH?=
 =?iso-8859-1?Q?DqXW/iBpmfowC0pgEQtvQTr6ascWep7KAVBjnIoNceUY5TZEp4F73KyNVs?=
 =?iso-8859-1?Q?cZ3j3ZgmGOeV9jADreCuThiUs31RosqL80dX4U2yKRSblp8ueRYI5l4K0o?=
 =?iso-8859-1?Q?M1qD2G4BK003Vx5JPQgvWb9dVNdtt2aUYUBZAF5KAwsYsxYYbPs3PuMIMF?=
 =?iso-8859-1?Q?GnTZZxBMlDjfxCVk77Jex5X/vr6zPoDRQfnLBiKQZWSRFqqcPeydwD76Gw?=
 =?iso-8859-1?Q?8A/cZoNCDnGfdoIX1/pcjGE5tiYLLVEjj2RIFxl8qqlx16CE+VyamqaQU5?=
 =?iso-8859-1?Q?SWGcxbU1aPJ+Pd0FTNUtykB2fGRQ5zkxnVZIVgU57l6wJCRyKPFM/ejVAP?=
 =?iso-8859-1?Q?dzU03pEy0BjlHQMx6Q6T1+QVMWThbGir6+sEzXGSIfSr8V+xmuGD3PMv24?=
 =?iso-8859-1?Q?EMzxVKr1i0aVqImEneWB6zSrTL+WCDfTJJ4uTw1fb3GSr2IAgvdeHjsX+d?=
 =?iso-8859-1?Q?iXXiv5OTgagNBxglLR31tTkMUF36TTrkI+MW60xHgVCTsoxdPeAEY2WO4K?=
 =?iso-8859-1?Q?Zj3IXjpQa9V/NiJ2XV8jW5Cp4c7we9al3pHEWX8J+PapHyzbnzrh3qQYih?=
 =?iso-8859-1?Q?odplMAnjtSZzHpRiLLobvIzDzz/kq4s6QIfv0WdTq22vXXx6rJ8iEFPeeF?=
 =?iso-8859-1?Q?iCdax9moE//8JJwxyq/88KgH8OkHDOrdA+6dP+N/lz5+84AWw4+BgsIGBp?=
 =?iso-8859-1?Q?WKKz1hhznqe1JAmB97zKBRAERp+RVjSnVifz3azWwzDjIFSFr3HL2Qnkdy?=
 =?iso-8859-1?Q?So8rGgLzYI16nQburwJl0nLHtU9UUExJT3yeU64+BbMLJ9XoFfQy6gtj3i?=
 =?iso-8859-1?Q?yPrew+fGaBef2mcUPqDLi2AYgvgkD8aJ1ac1xEF5bVlfNc2vizCVS6mNy4?=
 =?iso-8859-1?Q?8ngupQfxxacDU4KBlHo7Ba6R2/np?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gy9rdGW6TooIz9Rx99mmEUM/YdRjq5HjYQSxs3B5gcd7YahUFu7cGfnQM/?=
 =?iso-8859-1?Q?AQC9XGtQXBjnNdPaoNfJRxOlZFeFTbcBV+xFs2Cq2X9XZiTWaVSC0sBcUL?=
 =?iso-8859-1?Q?67FzA+gdvv97MeznDDr/EIa/r57JRTo4BtS2vSmO8tQyepRxQw/85G8ASi?=
 =?iso-8859-1?Q?w9I26Hp2GRe6tO/TenjkzVwMnz7wtf1dfhR6aEUMJyDUnZGi/cQHEtT5dW?=
 =?iso-8859-1?Q?xib47ujDIn0dOxg8SxDoLaVESwUgWBwKJyZUHjSvs90QZNkehlNfmMCNo0?=
 =?iso-8859-1?Q?43ESnpEzLSwz3BizhfpT1LIAQ7f6+QhmF7e1gXlHkaKy6VVDRPRCrLKemJ?=
 =?iso-8859-1?Q?je3N0jczC4AD0jXH5U/Qiwps1+PUsOoJrBTrjkd5qPx67KocQDfObgj5D/?=
 =?iso-8859-1?Q?FhRLaGUD6V/QOTFk35xmEqyyoUQMiD0sd0GXzHKlmMk3eCN6811G6y38Tk?=
 =?iso-8859-1?Q?qj8vq4jhsRumYsu+caxh7mwrfzjCppXtQDV5B9mRY98iI2ubbrYT7Avdn5?=
 =?iso-8859-1?Q?uT6zmZAqRLz/iTnagnluko66/kF7mUSia0DTDpGauG+USlqcrBFOfNUCOB?=
 =?iso-8859-1?Q?Q1YMrGaZeJzvW0XzDzo+SGrqSEw0gmCChcPds61fzsUUeAdPcHD1eszqI0?=
 =?iso-8859-1?Q?c9U/r/7vK1/4x82+tFIPZFrhNKYDqQ/iL0dXdIzccqIxP5PYNfTa54PwmH?=
 =?iso-8859-1?Q?s7kWxjqC1EmAkJEHaIPKzXNdvKPFhd+ddEAEUCpAHUBbPkCOXQeq6M/pbx?=
 =?iso-8859-1?Q?1ILENyb+a3q77YHnx75rux83b5zcUQXOwmi5BF0rlY0VNOORVXM9VHwzse?=
 =?iso-8859-1?Q?ysRJlTJhnmCS7bPLd1R1Mf2v7hM713wVIVmdx1LTui74Um4liiSGk9ReH1?=
 =?iso-8859-1?Q?ZUq6zAafDzLnwYIp1Y4aHiImEMkx2BcpvgD/qinPvgRhpMkJZSNTOWU1Bs?=
 =?iso-8859-1?Q?aGBuM7XKYWRCBQCP9GE0G0+YDunCcBMWeYnUmekwkSdlodns8h0voVLNbV?=
 =?iso-8859-1?Q?f0u4NCfdqQK5QpY2o3AJ5iA9YpeKKQ08VOmSHrsuqdUs7EmusZGXKcXN9G?=
 =?iso-8859-1?Q?eM69Kdjbdf3Otm8/Q3+jOhy2YXh6A3bT/CfBu1JlZi2GAUrNPG2TW5BtTD?=
 =?iso-8859-1?Q?PPcp9VbrrMtZqsT++KVeehelpVlxCUQ53taZiB1uVR0cm3y650C1b0z2jz?=
 =?iso-8859-1?Q?mrvlg0/fFMtieI/I0UPsyPs2ha6D39KJH35uIYp03EBAx1pNYnFv0hvaM/?=
 =?iso-8859-1?Q?1d6NBRaL9yKLPpst+QsUhrRgwji1rmbwthsbJ70QUZJ5gn64dXasHYFjn9?=
 =?iso-8859-1?Q?H3OUQ7Ghrayix0NWIMFmb3jF4iilFlP5deG9ooq7ksGdZnSppaDXtCjIdZ?=
 =?iso-8859-1?Q?hJXkHr7+IsOAKa8SwMThOQjXra+SnnbfwRU1PYw1LTM2BsP7jzJBCO5CBa?=
 =?iso-8859-1?Q?bH3BnryT9/LXUZqcKo2AOCnI+8/vQpvxXbtDOoHVN1zGiLlVLhAGALlK1v?=
 =?iso-8859-1?Q?TS4Ms+mXc8NDYPGmlNBzsIjxiC1SsviAlYHpkTLlS1HOSMIaNRekmMSRet?=
 =?iso-8859-1?Q?pfho3NUCyCFR//mhrOOKh9GyQib/cDPGWB2NrabQ72RpKDNKEp6nPrLRzu?=
 =?iso-8859-1?Q?QnTHT/rFD4yuAwKu1it4bMMejqZmfPHItV?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d2b9c0-118b-4638-ee68-08de2b5fe35e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 13:46:36.8811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cwlYp2WXs0BBZlcOrzMx1zkZoL3jZfjOopcus4o1dFPf+38Sb/O2jn4rImi5zvq7H2AbclNFnelMAHNo1lldsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8808

> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Monday, November 24, 2025 7:12 PM
>=20
> Am Montag, 24. November 2025, 10:54:49 CET schrieb Dong Aisheng:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > Update i.MX8MP imx8mp-pinfunc.h file according to reference manual
> Rev.D.
>=20
> Latest officially available is reference manual 3. 11/2020.
> I can't find Rev D.

Rev.D is the previous version. The latest one I saw here is Rev 3. 08/2024.
https://www.nxp.com/products/i.MX8MPLUS
We only got the pinfunc.h update for Rev.D. No updates for newer version so=
 far.
Anyway, I can double check with the related team member.

Regards
Aisheng

>=20
> Best regards,
> Alexander
>=20
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > NOTE: I met the following checkpatch error, could you advise how to
> > handle it?
> > ERROR: Macros with complex values should be enclosed in parentheses
> > +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K
> 0x014 0x274 0x000 0x5 0x0
> > ---
> >  .../dts/freescale/imx8mp-data-modul-edm-sbc.dts  |  4 ++--
> > .../boot/dts/freescale/imx8mp-debix-model-a.dts  |  2 +-
> >  .../boot/dts/freescale/imx8mp-dhcom-som.dtsi     |  4 ++--
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts     |  2 +-
> >  .../boot/dts/freescale/imx8mp-iota2-lumpy.dts    |  2 +-
> >  .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  6 +++---
> >  .../imx8mp-nitrogen-enc-carrier-board.dts        |  2 +-
> >  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi  | 12 ++++++------
> >  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   | 16 ++++++++--------
> >  .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  |  4 ++--
> > .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi |  2 +-
> > .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi |  2 +-
> > .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi |  2 +-
> > .../boot/dts/freescale/imx8mp-venice-gw74xx.dts  |  2 +-
> > arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi |  2 +-
> >  15 files changed, 32 insertions(+), 32 deletions(-)
> >
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > index 16078ff60ef08..7a05e0692d78d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > @@ -1085,8 +1085,8 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01
> 		0x4
> >
> >  	pinctrl_usb1: usb1-grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> 		0x6
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 		0x80
> > +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR
> 	0x6
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> 	0x80
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > index 9422beee30b29..2df6434bde652 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > @@ -485,7 +485,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> 				0x49
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 				0x10
> > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> 			0x10
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > index 68c2e0156a5c8..755ea967bb9cb 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> > @@ -1061,8 +1061,8 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> 		0x49
> >
> >  	pinctrl_usb1_vbus: dhcom-usb1-grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 		0x6
> > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> 		0x80
> > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> 	0x6
> > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC
> 	0x80
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index c6facb2ad9aaa..57accd33ec62c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -1088,7 +1088,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX
> 	0x140
> >
> >  	pinctrl_usb1_vbus: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 	0x10
> > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR
> 	0x19
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > index f48cf22b423db..f66c6b9236fbe 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> > @@ -363,7 +363,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX
> 	0x0
> >
> >  	pinctrl_usb_host_vbus: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 	0x0
> > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x0
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > index b97bfeb1c30f8..6de4d4ace8a73 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> > @@ -734,19 +734,19 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10
> 		0x1c4 /* USB_A_ID */
> >
> >  	pinctrl_usb1_oc: usb1ocgrp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 		0x1c0 /* USB_A_OC# */
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> 	0x1c0 /* USB_A_OC# */
> >  		>;
> >  	};
> >
> >  	pinctrl_usb2_id: usb2idgrp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID
> 	0x1c4 /* USB_B_ID */
> > +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID
> 	0x1c4 /* USB_B_ID */
> >  		>;
> >  	};
> >
> >  	pinctrl_usb2_oc: usb2ocgrp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> 		0x1c0 /* USB_B_OC# */
> > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC
> 	0x1c0 /* USB_B_OC# */
> >  		>;
> >  	};
> >
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > index 1df9488aaeb22..9ffeeb382bad4 100644
> > ---
> > a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.
> > +++ dts
> > @@ -406,7 +406,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> 		0x140
> >
> >  	pinctrl_usb3_0: usb3-0grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 		0x1c0
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> 	0x1c0
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > index 8b0e8cf86cadb..7b5c402ff9f27 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > @@ -579,17 +579,17 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> 	0x140	/* UART3_TXD */
> >
> >  	pinctrl_usb0: usb0grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> 	0x106	/* USB1_PWR_EN */
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x106	/* USB1_OC */
> > -			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106
> 	/* USB1_ID */
> > +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR	0x106
> 	/* USB1_PWR_EN */
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x106
> 	/* USB1_OC */
> > +			MX8MP_IOMUXC_GPIO1_IO10__USB1_ID	0x106
> 	/* USB1_ID */
> >  		>;
> >  	};
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 	0x106	/* USB2_PWR_EN */
> > -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> 	0x106	/* USB2_OC */
> > -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106
> 	/* USB2_ID */
> > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x106
> 	/* USB2_PWR_EN */
> > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC	0x106
> 	/* USB2_OC */
> > +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID	0x106
> 	/* USB2_ID */
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > index 16f5899de4152..50f5e674a6b71 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > @@ -46,10 +46,12 @@
> >  #define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                          0=
x014
> 0x274 0x000 0x0 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_ENET_PHY_REF_CLK_ROOT
> 0x014 0x274 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO00__ISP_FL_TRIG_0                       0=
x014
> 0x274 0x5D4 0x3 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K
> 0x014 0x274 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1
> 0x014 0x274 0x000 0x6 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                          0=
x018
> 0x278 0x000 0x0 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                            0=
x018
> 0x278 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO01__ISP_SHUTTER_TRIG_0
> 0x018 0x278 0x5DC 0x3 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M
> 0x018 0x278 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO01__CCM_EXT_CLK2
> 0x018 0x278 0x000 0x6 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                          0=
x01C
> 0x27C 0x000 0x0 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B
> 0x01C 0x27C 0x000 0x1 0x0
> > @@ -91,26 +93,26 @@
> >  #define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B
> 0x038 0x298 0x000 0x4 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO09__SDMA2_EXT_EVENT00
> 0x038 0x298 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                          0=
x03C
> 0x29C 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID
> 0x03C 0x29C 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO10__USB1_ID                             0=
x03C
> 0x29C 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                            0=
x03C
> 0x29C 0x000 0x2 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                          0=
x040
> 0x2A0 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID
> 0x040 0x2A0 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO11__USB2_ID                             0=
x040
> 0x2A0 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                            0=
x040
> 0x2A0 0x000 0x2 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT
> 0x040 0x2A0 0x000 0x4 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO11__CCM_PMIC_READY
> 0x040 0x2A0 0x554 0x5 0x1
> >  #define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                          0=
x044
> 0x2A4 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> 0x044 0x2A4 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR                            0=
x044
> 0x2A4 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO12__SDMA2_EXT_EVENT01
> 0x044 0x2A4 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                          0=
x048
> 0x2A8 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 0x048 0x2A8 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OC                             0=
x048
> 0x2A8 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                            0=
x048
> 0x2A8 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                          0=
x04C
> 0x2AC 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR
> 0x04C 0x2AC 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR                            0=
x04C
> 0x2AC 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B
> 0x04C 0x2AC 0x608 0x4 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                            0=
x04C
> 0x2AC 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1                           0=
x04C
> 0x2AC 0x000 0x6 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                          0=
x050
> 0x2B0 0x000 0x0 0x0
> > -#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC
> 0x050 0x2B0 0x000 0x1 0x0
> > +#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OC                             0=
x050
> 0x2B0 0x000 0x1 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                           0=
x050
> 0x2B0 0x634 0x4 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                            0=
x050
> 0x2B0 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2                           0=
x050
> 0x2B0 0x000 0x6 0x0
> > @@ -291,10 +293,8 @@
> >  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF1_IN
> 0x0D4 0x334 0x544 0x3 0x1
> >  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_PDM_BIT_STREAM03
> 0x0D4 0x334 0x4CC 0x4 0x2
> >  #define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                           0=
x0D4
> 0x334 0x000 0x5 0x0
> > -#define MX8MP_IOMUXC_SD2_DATA3__SRC_EARLY_RESET
> 0x0D4 0x334 0x000 0x6 0x0
> >  #define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B
> 0x0D8 0x338 0x000 0x0 0x0
> >  #define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                         0=
x0D8
> 0x338 0x000 0x5 0x0
> > -#define MX8MP_IOMUXC_SD2_RESET_B__SRC_SYSTEM_RESET
> 0x0D8 0x338 0x000 0x6 0x0
> >  #define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                               0=
x0DC
> 0x33C 0x000 0x0 0x0
> >  #define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                              0=
x0DC
> 0x33C 0x000 0x5 0x0
> >  #define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI
> 0x0DC 0x33C 0x000 0x6 0x0
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > index 59642a8a2c445..50c8a7c2a7bd3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > @@ -976,8 +976,8 @@ pinctrl_uart4: uart4grp {
> >  	};
> >
> >  	pinctrl_usb0: usb0grp {
> > -		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x1c0>,
> > -			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR
> 	0x1c0>;
> > +		fsl,pins =3D <MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> 	0x1c0>,
> > +			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR
> 	0x1c0>;
> >  	};
> >
> >  	pinctrl_usbcon0: usb0congrp {
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > index 4bf818873fe3c..162329b403d30 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> > @@ -219,7 +219,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x146
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x140 /* USB1_FLT# */
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> /* USB1_FLT# */
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > index 76020ef89bf3e..02ea0e8bcc6ff 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> > @@ -318,7 +318,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146
> /* USB1_EN */
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x140 /* USB1_FLT# */
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> /* USB1_FLT# */
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > index 5eb114d2360a3..2b6bb9fcbc7a9 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> > @@ -359,7 +359,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146
> /* USB1_EN */
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x140 /* USB1_FLT# */
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> /* USB1_FLT# */
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > index 7662663ff5dad..6d752fe0d1bf5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> > @@ -1060,7 +1060,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX
> 	0x140
> >
> >  	pinctrl_usb1: usb1grp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 	0x140
> > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
> >  		>;
> >  	};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > index d43ba00871269..28f5983a78469 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > @@ -1316,7 +1316,7 @@ pinctrl_usb_1_id: usb1idgrp {
> >  	/* USB_1_OC# */
> >  	pinctrl_usb_1_oc_n: usb1ocngrp {
> >  		fsl,pins =3D
> > -			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC
> 		0x1c4>;	/* SODIMM 157 */
> > +			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OC
> 	0x1c4>;	/* SODIMM 157 */
> >  	};
> >
> >  	pinctrl_usb2_vbus: usb2vbusgrp {
> >
>=20
>=20
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
