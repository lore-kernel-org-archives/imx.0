Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374341102
	for <imx@lists.linux.dev>; Mon, 12 Sep 2022 14:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBOO+oA2CgZ1Ee0W4xxHh0eI0Umj27pHL1OuOU5xw5etyGIg1tNc1iwQlHAA7WQk6W2XLu3MOsAN7pGa7gFwlgSlWwFHihtBjdpLi81W1a5UxLMIGqIGMeabAFEiHlQ4xb1/VPWS2JxrUSZKIky9quE3/kJI86B+/yVBsLvOpp+TtmT+3x5OnhcqML96icbq6EHTw54y5inExDk7TyJqeegW8Y3CDZbMnESw3GXlqOdZZQNwwTJK9tCIvPdO2cC27JplxkpUKGL3LGXL2M97a2avswWW24tH43Xo8/A1qFQPsnSXFUt+F4onKCqcp6Qym88dC7xGgDB9+Bf0Xb2+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp7ekgGkWBshWzxv4PLEIUvxbfQwsu0PqgqC+4Pfths=;
 b=Etcf5zY7x/0QQo81zezIfb7nUqySc64MO2LWSJBocjOlJFDnn+vmGfSHAZuYw5HOt/P+6Ksfrh0YyQQW4TPiZTRtv7pnuHF7NpKsghcL/tecCUFxo4HPm5593Sfb6Z0hU8s/M9BG5wO/YqL7JVuMBTZBJvqlkOjuoCilA5o6xHZLOslLtOGNEJWWdbcK06LP46a0K1OK59kKx7mlRVWFs63bsolYwiYBFI3mFU6FbelDSP9Gq1WQGXHCVb++XX7FB99TLKcGAbeaYxJCGcjpzL4cve0mnA0yNM+NmbcVsxZBo3E+FZk5n9bXJVDGZMeBiYwFVy/HU7961enQX5/qUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp7ekgGkWBshWzxv4PLEIUvxbfQwsu0PqgqC+4Pfths=;
 b=XBSyzBjsGo509vcBiSx1TpMHTr4Ak7fkxzG6T2bGctU14g01PUOTZsECy3ukHtzefF9dlAOuD8h/nFpvBdtT/wOR7V/G4DGespEPEFPKWjiCistxXljwxYDzWiYRjtT0Lfxhf9ZDAtn+/cxlPkVlc56eN+EQwSgp008W/rScLXk=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 14:35:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962%5]) with mapi id 15.20.5566.021; Mon, 12 Sep 2022
 14:35:18 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
 i.MX8DXL EVK board
Thread-Topic: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
 i.MX8DXL EVK board
Thread-Index: AQHYtlAgdVQnsa8uOkGgg6uKMosVx63NI2KAgAVTviCACRxCgIAAZ46Q
Date: Mon, 12 Sep 2022 14:35:18 +0000
Message-ID:
 <PAXPR04MB9185F52BA6FEC47E6412EB3C89449@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
 <20220822175245.222691-6-shenwei.wang@nxp.com>
 <20220903034819.GF1728671@dragon>
 <PAXPR04MB9185D243324279DD80C371DB897E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20220912081649.GR1728671@dragon>
In-Reply-To: <20220912081649.GR1728671@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a24319db-9d38-4fa9-21eb-08da94cc03ec
x-ms-traffictypediagnostic: PAXPR04MB8765:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oysxjb+5C4JG5+W4OSGE2jkACGZPql3gjX9Qa8nEiqd3wfiOpOT+8ERv+KLFa6Mo25b5wHlHt+oGCFbrkCe6vYZZDr19eMQaNv2dR9YtOM6oQ+9bZcEx/+nXC853FvOtpPJ6nfywgDqVSZFcnqiDGEk8kVZ66KnJLrnvLe8JXA+P3y8qYKFeYbgtsWp6LElMI243Y1CqNp3fw2uLMPSgqimdkEy9yRq7rmWhQNN91iundJet5S7GsbUDgjxQOIspCioJ8hYRi3OLOXduJxtsAOtQDlwmCHy+tQG9XBLPuSoF0tKgqQAL6e+zoZdRvS4aH3zZ7cnYpE+kOMtWMhwfP+00tU5QXl9fgZsfCWcsOHLVi4+AMRE2QacAo7s+DlCiEFwavvtgcSOk36hSdyIl1kcyIqMnL16+zcNy6Q+Lss47dfVNQETJOHB9CIPuzw5VXOc0dMp5J9lkqhiFEgHf7OYZadGdL3aWS76Ju+Ah7YenA/Sw424ys8eoIZSyk8oHmoEm0/+tGUtjzg05jbF6vERE/JzdHvsSBc0TTCje1uFQ5vrcxaq0ROUwskM1fT3zIseHN6DEEEy4RyNY/Vw3mAR1WO3BbzBVVSESbZvOpaLyZ9DheTo0ftZL5Y8R0z+z6uehvT2O1nRTTV9RBKycl1Vzo3zBN6akeU6fRzcYbaZGlIaVQficAIt85hL5kP2XTt1QwSdK4BBb69boxhEcIJB+Aux4GwqFYo2ztLhK4aq/sGc+bZeLDtrmEgOzdG3ucRS0WnSl7bk/3p2VhspGiA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(7696005)(53546011)(6506007)(9686003)(55236004)(26005)(38070700005)(71200400001)(86362001)(478600001)(41300700001)(122000001)(55016003)(66946007)(186003)(83380400001)(2906002)(66446008)(5660300002)(44832011)(66556008)(76116006)(66476007)(64756008)(4326008)(6916009)(54906003)(8676002)(52536014)(38100700002)(8936002)(33656002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YZ9QQpHLXjghkLOqfgo72Ew+Mik3HadUmjq+e7Poost8Wab0HpYTZScMXne1?=
 =?us-ascii?Q?iyvpr77rG/ffAR7lNsGVoDzY/PU/cfmLDRkLvcidXSGFh9wfmhOnQGNkFV16?=
 =?us-ascii?Q?3+hv8ymQ8+IFLF+JhKuHFUsgaB+yfNlZ+Gz1BZVzFRpPGIejg0EWwGTN00O+?=
 =?us-ascii?Q?qC3aAFHfl8XbYHS2gkblOZF7KQ9Iu9jjrmqgFmvrbvkjmEVfSKtXLEm1vPX4?=
 =?us-ascii?Q?lZ7xD/U76F4j2QFPzD8dvH17E5ipREfrMn+2tV38UY6zVJiQ4K0/mxtB1AtP?=
 =?us-ascii?Q?3y+REt4SCakw2LvoY/wjkiLqcuveIAMBxnY0dtr5rXzlAv905YWEH4BhfTIR?=
 =?us-ascii?Q?3EYzeY9mrn+E3EU2rZwZ40b/vmDr+UfCmXeLAHbeBpeiofXwvjUA70B9t5Gd?=
 =?us-ascii?Q?vxOKepfe+FhHFLbcosE4XGXsxEnnfUUEPh1UsKk9Vnx+kHIFHkXSQ3yjCMlJ?=
 =?us-ascii?Q?C7oh2ohBkyWwT4CRk9/duzsKRQsmxs/w65dkcTmYn7CP38GtpGDda+wEnAP2?=
 =?us-ascii?Q?meCfhm5mfL7p2y5uykLJMU+9GAixt1XCIG+qZhSujiIkyutFGcvMFwBaXXgA?=
 =?us-ascii?Q?N9//a6SJcmYg8TJ2N5o4LlgSoHiBEFiEQ+Ec95IQYFPuBhT0qbtbYEzcSApK?=
 =?us-ascii?Q?7oza0lNnP3+gtcx8ZWWEJQ2vDE6X6UydFQX8ygY8zNxzrYSOmKhlSJ+oeACC?=
 =?us-ascii?Q?8AWLvdRL9JdTSivJn1FD0N7t4XglL50QMl4nSSbmMIqhiFkFkXPdfXtIlzlN?=
 =?us-ascii?Q?64ldBd2wP839dm4+4SljadkF66pSXKY6CQw3PCT6v6FBA24nkL9mMvE3Ketl?=
 =?us-ascii?Q?OxLhflG7H39ENg1fhtxrvxMgUSp3jhBAmUMNuVmlYqDQxGnYdYQ6l5Ht7B6C?=
 =?us-ascii?Q?KTFPMnpAcMNC83LP9/3neecXGmm7l0OpyB9yJjbSCeSCRKOcnn5JmxnRkWz8?=
 =?us-ascii?Q?Yg2qD8pA+VpWMIgbuOyvmgMmfR91jYGqJcA69LOPP2QR6bnbsToOstUMHOhX?=
 =?us-ascii?Q?k5QsUtiiOeGrzk2QLMbJhrueoN0Sxx0fLDe8cTj9HgoLOO6EaQFmGns4jKAO?=
 =?us-ascii?Q?rHb1Pl3wihyo2RXbn+u/3jNKSAxHv0cmdVBFlXaIqmn4R715Kn6Fe+4c0SeB?=
 =?us-ascii?Q?S3OnOnyqG0ZlKZRGfZiGpeLPT+q/ZSHxSQt1/Rk0WsQcOjIBthLOTlOB73H2?=
 =?us-ascii?Q?gC2/7oVl6rFiGKThRJMzs9mAyPAAJ7zIxaeByyK6I05ZsQtMmZxcCrrI7QFz?=
 =?us-ascii?Q?A2KpCJZFmhW0M//4rBn8GyjYlPWrd6C8R+B2TizKVLBr3TpS3kdi6Lx/UrwR?=
 =?us-ascii?Q?R5qokGBd2d6bcDDpC10mPFcS4Abebe47qvTnybIIQoiVPfE4E7JdY/vMTAD7?=
 =?us-ascii?Q?pv3QhTb2Q0o69O7mNJfj15g1GVSu1KESL3dFxy5nwKt/g/2/KGHC7ssr7vQs?=
 =?us-ascii?Q?sNracGp7R/jfdTLsz83YKlbKjSv/Tkow8eVVq6N3/Mxd9rQV24aZJT1POzSW?=
 =?us-ascii?Q?CNdc9QICFm6N+si0+MN5hYcVpgD0tYOJiUN+E8lwyVhZA43O7jOGwNae89jI?=
 =?us-ascii?Q?DelsArL/FDjP70MaGn0KelJB9+HsfjqfEmpFkA33?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24319db-9d38-4fa9-21eb-08da94cc03ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 14:35:18.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpOpkwPHe5KzTF07E8eYwWBuraLQUjfSv28v63Z6+gSkmwQeY2AzKLz2uKuWAF2GCIcuE2W2ngYOWu7ADbkukw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, September 12, 2022 3:17 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Sascha Hauer <s.hauer@pengutronix.de=
>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; imx@lists.linux.dev; dl-linux-imx <linux-
> imx@nxp.com>
> > > > +
> > > > +     reg_fec1_sel: regulator-1 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "fec1_supply";
> > > > +             regulator-min-microvolt =3D <3300000>;
> > > > +             regulator-max-microvolt =3D <3300000>;
> > > > +             gpio =3D <&pca6416_1 11 GPIO_ACTIVE_HIGH>;
> > >
> > > Missing enable-active-high?
> >
> > No. Enabling this regulator to select the fec1 interface instead of usd=
hc2.
> Pulling this GPIO pin to low is to use FEC1 interface.
>=20
> Then the polarity cell should be GPIO_ACTIVE_LOW rather than
> GPIO_ACTIVE_HIGH?
>=20

That doesn't matter since any GPIO phandle flags are ignored in the node of=
 "regulator-fixed".  The final flag is only determined by the property of "=
enable-active-high".  If there is a "enable-active-high", the GPIO line wor=
ks as active high. If no such a property, it works as active low by default=
. Right?

Regards,
Shenwei=20

> Shawn
