Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5153D88
	for <imx@lists.linux.dev>; Thu, 18 Aug 2022 11:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1XOliet66Jb6056N+hi0dQ0gpFuKWtaWrC0OUvsOTNJnFWY3/GqMLa+OFy8SVQDH9J6DUO727VkyG8FtgNVq9qZkgfZJCJZuY2pcCmFKNgd80vTN9YXAsEzHovoeoSLEY1N2LNoQbEKpG4oRpT3qM29rGwroAYQH8ZjUX2lIeKuZq7aQRBdHGgyCfCEaS2wgFM7+V4SgF4WYL7D09BWbA7xjdu8HCeROalGjepxmwG+R3rcYu8cC2JvVugsH0PQDyrVTdsERxl+qbRvK2ReT/SZ2gUeWqpiQv3ZZwTV3ucsKMYWOu6nCgC2JLYwvwn1aVXagoD367p6jbuKoB1/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPwnqO6xxpVSbyLiGhoEh3Ee8lADtlyJj+l6Td+vYKY=;
 b=kamXNYo/0yoF7GoRRgGaXZ1BAEHVytaGjEVTvxAwjmJHWixzA+f0Dkw4BZZcUleluT9Skiz3y5GxvqL3bwY7UkxeZtdfW6t79+p1Tpx5S7smagxTzsLLwXeClLsHoGa9nLsaLWIxOgDjuDiVt8Idi4OpvKV5ySA56+IdnzXNkSmQMepOgi1rh0scSkMVMMTVgDLfSzhs+u18E9sL0DL+dveqr2nlXj88i6u7hFMpRd49x0+eMH2ypPqezoKOO5h+Fl273lWdGoL8ZvmvyB55Wj9dDbUPh5ISIt45a+2dEjwnciiM+ENnH+GI1tssMMqcRoxWtckvAfmP07eTKA94HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPwnqO6xxpVSbyLiGhoEh3Ee8lADtlyJj+l6Td+vYKY=;
 b=ChY3i219LT7uP+ZNTy+v/Lo1iRUGpf9w8dbZu00eV8YQrt4//RgtEekGIY5LD1gz2p1+BrYHLNvz6uL/DeUY0paWRVdVZ5OxGmDM1wz4JQDFoDuTCMpjcW0P7YSWxdprz7f8Lm4B5ecW9xxWcl/nZKfUDpkthakjDFC6tYfUDiI=
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 11:59:41 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 11:59:41 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Richard Leitner <richard.leitner@linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [EXT] I2C_IMX support for i.MX8MP
Thread-Topic: [EXT] I2C_IMX support for i.MX8MP
Thread-Index: AQHYsiWWIkRZU8Ek5kC1az54IGRcq62zHsLggAACUACAAAEMMIABNf0AgAA2pbA=
Date: Thu, 18 Aug 2022 11:59:41 +0000
Message-ID:
 <AM9PR04MB827430FBD894470753E97BC5896D9@AM9PR04MB8274.eurprd04.prod.outlook.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yvz2IA9GB2NJmc+D@skidata.com>
 <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yv37CrPtlm0WSUmd@skidata.com>
In-Reply-To: <Yv37CrPtlm0WSUmd@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7232f80e-61ec-40ff-de53-08da8111223e
x-ms-traffictypediagnostic: AM6PR0402MB3654:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lHrS//a1LwAVG0NyJncVgVaKwlfwP9WX9JEc7qXxqbonXEYEMZqFFNeFOaBBM5LvnqpIoFZWumiONTEi/N5DXe27Cay72xSpmKf6OWdamr8rwNcL9xIsF2kIbOi+JbUgPInW+TNMvCQNXsE0aNGBX75A+COLmetFQQ2jjrmt80lEC6OOmufU2M9Y+InVcFFUUudLThO+HELi4j8hWCjVERzflgwBZTvzRDbnBOhrH5kcsPrfTGqZ7YcP0KRff9jg9PWlrvT0IfxwjyB52hYKVOK9ca+GStNMwhWXvx9621T+p2k0Q+xdkiyT7Y6MOch98pMlrqj2yZ0pTH5Gzuhas3YsWoqPak/19X2WU/c42+QfyIF5iY4ddYavFFxq1jQhk/uN5sSydJ/ZAYFr3ZVToQlHHphJpdRvE8TzbBpK764BCkQogSFwchV7Eav5fW4CSG54sXfdLk26pYPfdPZiLRM9/CQLCLAHJpASD4s+ETk/NVsTDu5KL7dJTswNdRMcACMW3xtCArkZUQXPnKkwSG8cbUeOxT3icfIxvh3n2KdLP96TkLgkv2NZCMPTJ0F0JcBqsdZh5EfZE8od0sbk5x+yA+xeeo0S6qYEM0DG5CNUnW3GJYD8gMZkBlkGRqJ2A7S8qbzqGoPEdPJryGradGF+eZSmsZGtMNXH+fBczi3HvsT1GnMDIBYihQLykEX6rbiAjXiYyFHHDf32oCi6VRaW2SrTX56b8H4a48mZK7eFGkM5z9t3/PvZ0Bwu61iQmKuO/I9F/WI1wUX6moAEEQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(38070700005)(41300700001)(71200400001)(478600001)(316002)(76116006)(122000001)(83380400001)(6916009)(55236004)(53546011)(6506007)(9686003)(26005)(7696005)(66946007)(38100700002)(66446008)(186003)(5660300002)(52536014)(8936002)(44832011)(55016003)(33656002)(8676002)(4326008)(2906002)(66476007)(86362001)(66556008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TBq14omHHmLG9Wwi1xwOr0IZ35Z5KYYDv5mgi6RG9fsHUbPcq+a6sIBLud6I?=
 =?us-ascii?Q?R1DCuKsrHNDETi1VUMYkFZ2My9cehq80sqs/+WMo66UWlg2EuCY/5u2gGCQt?=
 =?us-ascii?Q?rmmHIOqeVtPlDq7k6GucNgmj5qcPHYhD2/0H0gMePbiri18mL4dSsp37eGFg?=
 =?us-ascii?Q?6lNWCVv6LPxs7Eyy9k4HcW2mQCe+PjepIqFTW/nstZcz823FtJneuU6kQjAd?=
 =?us-ascii?Q?/5m+S1UhZVlHzEuc0ZZsmdz8bgS6AfJyRwNHp+81Z8GIKOct89RVPCzeqoL0?=
 =?us-ascii?Q?cDtHmTW9JEgmgWQrU/zpLG5CpHDEvMkGx1pUrBCrnhuWC7jX7JZQDfQFBew+?=
 =?us-ascii?Q?OLvTBmEaPgC/N1A8V+ZBQ6283Hsr1hZsjDHJ6ZFd7XDfSQIJ0EAasZP0IpVd?=
 =?us-ascii?Q?s0Ui3jSerXiNBo64D1gizmYBZ+6ndzq5/jL7EcyKpgXd2/qIkhOym5a92Eqx?=
 =?us-ascii?Q?Ia135yfUDZX+dDNHoJCopJmlYayLCptEz2zqN5n7GVZmjXHGjljwgD0noNZ5?=
 =?us-ascii?Q?W+OFIDPnh0k7IM1tidf8X/b3ZVMsfOdd3meRkbHgdn240xvd/dIQUKbYV6wG?=
 =?us-ascii?Q?71CRJ94N3w46vI8oNFzICh/DEXKDSpGwUraoBSFc1Im18ClpOLN7eU3Fd2U7?=
 =?us-ascii?Q?cUmLhymGIE2lB0+Uq/gkJPFhR3aG+PZZX2ZkIKEqrEXdFFn6eqXnGR/6mPEu?=
 =?us-ascii?Q?TDV23TO1dwpqNggU91G6/nGNZYMYYiY6/Kt2nuNQKJ+bItgO131U3nsdChO7?=
 =?us-ascii?Q?5RzrRSqxrb71iom6AAvYpJMwYoarFHHf4Je8AF+yXrgbCXI2AA3pfYVU19N4?=
 =?us-ascii?Q?7DzfCEJf9bnRbrG+LIByno7uqg7syk/Pj9BS7PlaptJ0VYQJycMGPwgXkdDD?=
 =?us-ascii?Q?t7J8gF+YnZal/baAC/+fIDtVbBSpBvoKlYfY+XjI2MvOYkRcF8tJcmxejDf0?=
 =?us-ascii?Q?Is8eTaABehVcAw6NRAZWVNqChzVg8lzPW1uU74MZJ9tjplDEiIuw75TSfuSM?=
 =?us-ascii?Q?TtZFmDGizwhSE6y4BbatSy/fE+GL+sbPG+g4/g5H0/8iIAdE+HAKcjXsr82w?=
 =?us-ascii?Q?ejoVPyZYdpRUa5aE2WVMiGsBTVTeTPNRGlSEkPiuM5QteGYoQqC59IbsChNo?=
 =?us-ascii?Q?wZbYUREnb6yyw0GGdxII9I/3dNOJIqtxgsaOLxsNhdWLJz9o4V8ju0ulFGuW?=
 =?us-ascii?Q?CYOvGFNaaTks+FaMXalv8oIDwtZcc76lr87KujsIAIMppVq95McBfsCsJmpx?=
 =?us-ascii?Q?wGNcuISMj2sAhxDVAVAPdLy5PUyZa+84Ke7agUHYU6WLiKBPNpY5VYGgoj9s?=
 =?us-ascii?Q?FfInZcZ6I6KVf6oiEoqkqVZWJ3MvipbBmekTe+C7POQZiZNm61cQtZ1B112u?=
 =?us-ascii?Q?QI5f8b7RsZWjXDz8GUmt5YP56WaN+PnSS+JIUsP5lPHYwcCKC+I/jHzBQmLc?=
 =?us-ascii?Q?FYevFnodTdwvbcihukPnrhMeW2gZwTcInNRYrNRNFZBPvLCPXcVhtPDIU/0T?=
 =?us-ascii?Q?CjZ6ry6FwLq1Kx29jduw2xpTrLhrrfNjkHJBV3emMoQHulvBizd/goNp3zDy?=
 =?us-ascii?Q?K67JrL4hpnjMsMp/bi7Wa5N1UaI1zHUiXg82om6A?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7232f80e-61ec-40ff-de53-08da8111223e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 11:59:41.5007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnp6XeHJ9oX1EiTQp5uJ0TxJDlLgxrWQjUoh+sc884x4FTeqgis2IdPr1/aq1G81KtyY8hVnwPQU1hxih73Lqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654

Hi Richard,

Nothing is hidden here. That is PAD control register, and should be documen=
ted in the IOMUXC and PIN Control section in the RM.

Regards,
Shenwei

> -----Original Message-----
> From: Richard Leitner <richard.leitner@linux.dev>
> Sent: Thursday, August 18, 2022 3:41 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: imx@lists.linux.dev
> Subject: Re: [EXT] I2C_IMX support for i.MX8MP
>=20
> Caution: EXT Email
>=20
> On Wed, Aug 17, 2022 at 02:14:53PM +0000, Shenwei Wang wrote:
> >
> > The support for imx8mp-evk board has already pushed to mainline. That
> includes the usage of i2c-imx.
> > For example, a GPIO expander is connected to I2C3 on evk board.
>=20
> Thanks again. It now works with linux v6.0-rc1.
>=20
> The missing piece was setting the 0x40000000 bit in the SW_PAD_CTL regist=
ers
> of SCL and SDA.
> Unfortunately this bit seems to be undocumented in the RefManual and also=
 the
> driver documentation doesn't state anything about it.
>=20
> Can you please shed some light in this "magic" bit? Would be really helpf=
ul,
> thanks!
>=20
> Furthermore I guess documenting it somewhere in the driver or setting it
> implicitely (if that's possible) would be a good idea?
>=20
> regards;rl
