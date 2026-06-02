Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20E2C234A
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368032; cv=fail; b=ghot5UgHpCVqAkjNiyoXWUXMY8gLARN4lUGrbEwoW9S6HVi/h13/ddRNtmGKU04ixIF1UEEXhjxEZ5xtc3woJlFzM/itSpgzjhNB3T9trfCUwqHWvBmh6FRZJ3c2uqO4zK/Ew9BVjgyk1iK3mmjraLL/WswOc2Sj14TK7hLwwtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368032; c=relaxed/simple;
	bh=AwsK6Xmggc9ujPDzlc7dkKk8u94mkc4E6PY2pP27bbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rm47Jk6UpqH5NjqxOeV5ODBGLnlL25YK5iy9AcXyxPmJXZFi7LNa8j9Px1lvUyHGgt9+yB669g8YEdGnU5/nxZaXBG+9TdyhoWZ87/iV24gFTmLSoF83v3EM4+bmE/rZlKXrEQvQjQ2t5xQuSNB5Ouu4YWuSetOHS/H8Ics2HLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I49fkfqE; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I49fkfqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSAz4B81WoCVwJK9L0hsjhMF7whEJH6EJM0iY54T8nOvSkt+1DhKhXlRLz+iR27/wkGQo4dPIBoOQn/AtWNvFqvmCT7DTzKkodAPkDaAImzBm48ylNxARDoJwy13pAlpORkD7vFX8KkmsDAtA0hul7UKU8pgfxKddPL+jSFeHt0Ym9q2NPMCH7J1/cEfdLekYkK0sa4ogTSf/H7OUvRAJqY9YYh6d0lFVqC/GHy6x27oTgc8pamY6/zVxpLDcb2ouaAdkZvvllSwor5wSaxCoyE7r3yg3tHOMCveq/AOQJmYKZheBYT13qQpjry5AzXl+dyjTtOqsbrcTMJOoh90ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbMTUbdrboRD+g6Vb4chcgOLLmINdD3x+aLkEYnvc68=;
 b=AOB3eOn256FdWha0iiF2y1kxHsttatBvI0f2+CILm2eZ09tXwbm3Vxv7gAoKQlmDBmnr9yVn1vFuO4NuQnFGy+6645zCTjmQUAhE6Rl8LLu3tV5LySXs/jNOxORNIZRAspSI65qAFv5YJRl+xqUZr0o5n3rCNH2Ll+SyqBBjbXD8mp5vdeoy3Pt5gM8lXqc2t96Pn2Z29RaOyv5BMi0p2xYz9nVaSk8Vm4WBZmBpFPHGwthvhEElw65UK9DMxPQCF9PGYzht1IR9+DYwq0XnqSPDM1oGrhPZCMub5Ly5fhnSw3q7UziTvOnLXPFWF/4hMQ8scaZZmgrbPiDp20bsow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbMTUbdrboRD+g6Vb4chcgOLLmINdD3x+aLkEYnvc68=;
 b=I49fkfqEdhZBkz3xUgPm8Sr3yl6DCIjgMFRb/3ndtPTcXRR7kbK+thftNGjzgIar+ICdKCMIKIJUv8EGoXJFu+NbTtSzcvcRVYLIjbpnCn8dfXeIASCFQNvLBVi2uhIg/4gzdNNtkakkSQROXGzkfLYnIFNglHL0eP6NTTNuizbX5/cqCVF95UbE6qOGsp6+UH8EEzex36D69OVYJOCgAAY9c8ixlTG/WWi0WDDjlUWE33u6sTgaDqOyB3PSOWRd0l8NK8YtcufmCt2VWw7XbM6Eka50+SGafTi9tpm5zxkr5xirgiLmnt4zXs+P5QxGyUsPAvrdc9umvkvnYXMCeg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB7662.eurprd04.prod.outlook.com
 (2603:10a6:102:f2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 02:40:25 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:40:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>, "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: imx943-evk-sdwifi: add a new dtso to support
 SDIW612 WiFi
Thread-Topic: [PATCH] arm64: dts: imx943-evk-sdwifi: add a new dtso to support
 SDIW612 WiFi
Thread-Index: AQHc51GY6D0Ocq7qKUy33WzKWj96CbYqBMCAgACbQTA=
Date: Tue, 2 Jun 2026 02:40:25 +0000
Message-ID:
 <VI0PR04MB12114D542F1CEF263494628E992122@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
 <ah29RV8eZEScKixA@lizhi-Precision-Tower-5810>
In-Reply-To: <ah29RV8eZEScKixA@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PA4PR04MB7662:EE_
x-ms-office365-filtering-correlation-id: 10758dd9-f6cf-4c8d-461f-08dec0504cd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|4143699003|56012099006|11063799006|22082099003|6133799003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 SnKJVgCYtKkR++TILWrPA9tSwKkfcjV6ftN2vWcEoXekBs31d0nVHi/wDN2vVJVn7CmJ3jBsw7OCvyR9E6i3gsGaqp9NywSzN9dEK+k1hwcsLyp7LmFi9AoHGv4YVHnt7Jy9t8a66FGrwpkDH8CdSX+cUxs4dmDFc41OmRH33dPTLyBCwC3LCSgf8DA7LQSXnU8SI42Mo+l8NUCbRwJRk6AhyXy4iGAVZzAtdKB1fJ1AM2s1rm0G5U0bwQeh8DPqYI4PG8Ol3lqq8vBWi8ULyZdhaPAGZklFJqI5l/XcG6GyJ/wxEfEjrUP0+yWqEm5HR+t2qQR9kUu5I8OVbQNbiB748TrSTDZ0v5oHfa4JN0FUM73rN3rkqHi75P30bIM0qu6MLEJdadj7aKhbJfDzfE+epgB9VBWea7bAzRex6ff7zINqFuIWk51DWWkqILZCCf9BK8/AjdlwjZmbSqP4KmfF+9DlOXu+U4ehi78MHt2okjwdb2RqHKC9Ta0i5lXRtYdXvbGNXXozy6oWnYFOcF/xc/RdJ5Ve1UbjW3IWaI8w/9u2A0zwOdW6nXJbhkuRaugu8vQanyQgzz62/uACZo/nlOj2BLISg7X99LeZ2lxRv+n3RS70R289VCSqhVsjuKgstCKT4FhwPzwDEfL9f6udJHrCb45trykj1pXE70p4/xxk8OKfqW8nasZSa5fQBekYGbY16KnYP/cg5XSuTT/1WQD2DBH7aantB4hztvxYb4iw0BDDKbpmVwkk+6io
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(4143699003)(56012099006)(11063799006)(22082099003)(6133799003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IzduPg0XVRFMDFD47NFBWBr3xYXdI9985HPQesfekjZ/vg4+gDRZqqeCsYET?=
 =?us-ascii?Q?SROHgJErCt8pKIik079n9Pd8z48sx1YubtphnngvVIXSjFQLGsUe9cbove9e?=
 =?us-ascii?Q?T8DzWCqCCaT/8jYdgAYwTQ1y10befCjqDBvS42hE30h7s/AVLAH7SP0M57EE?=
 =?us-ascii?Q?oiwBGABJdzJshEGkJXHWBbtZD+Tv6dt1y5AE1Ayyg96jy3nhdQ0eeMR7e7at?=
 =?us-ascii?Q?jZE0XdTK0cqCPqaKoprZxB+ahlZpj2B+uqCXMqheWabiDshJbarQp3Lk86ck?=
 =?us-ascii?Q?/T75mVvpLUzufOzJsQSv5ZvhkAaBItgPNKnd/C9k8x7semjmDXjskUkNzI5E?=
 =?us-ascii?Q?DDbmL3zafspmVBxOrkEVDMLFplCktE5IBK/em44Nw63Jx7hBq554PYE62B3C?=
 =?us-ascii?Q?WMFSCxV4oQce0QM4aON6xgdrrWrO7smz60vrOE+QoTKb4ietBDa/UR3J23l/?=
 =?us-ascii?Q?e//BcFKXJQ3GwKRV/JDflJS03Ht7A14GLBlWpxC2tRglwPbnuZYjr5oAA4aF?=
 =?us-ascii?Q?kznSx6hKvSYI7PYdpxUEzNToUzxBD8aTBgyZaM0XjbkxhjgxOUg7Me+AAfDq?=
 =?us-ascii?Q?6wATSgfMTS2Q9ls1Qu9JH3FKrkw2b+tGawSA58T11aQ6WaNQ8eWU44Mfgkb+?=
 =?us-ascii?Q?yeCdd0kpu3WMqVt3kiWQvIpZmcNZhyKTCXkQbBQMCb/K29ugWTkq0DZrVr2g?=
 =?us-ascii?Q?66LQ53P5jNgiMw4lrYnsNEWHCBeNP5XXqKm5x9Zx4V4UxMULCn0rMD2Yf/J1?=
 =?us-ascii?Q?Z/Nfv2G7HyDIJd2kKkANBQ9wqrSlW82JLNKzqgEw7h8uw7F1BId5FdJBz7y/?=
 =?us-ascii?Q?BYf4/4nKmalLG8rD9YMkdOgJLIuQrJ7et9tAGwifwzHN87mval7JyU1vJoKE?=
 =?us-ascii?Q?w+78nbsvlKpAjswuBqfXCLNZ+Rj1tgrSbKca3bCcvtOr0deTD+JzgKAFDNuN?=
 =?us-ascii?Q?sinIGrC2xFHdO67CNfHrb6D9X6YkTUpfX3HykRTB01ablgVq/Th1Rp/UmKvS?=
 =?us-ascii?Q?+Cr8hYO3w+iNnPaY0Fka5CNWLlaTYroLN3AE1KzSW16VxjNXzEZQ77XuXc/I?=
 =?us-ascii?Q?c3+K5F6Aq2Pj/KzDShuqFkudo1QQcwGi6nbRi7UgxWu83BiH/YEaIm5fuFQR?=
 =?us-ascii?Q?93/PXOV7NELl4Zu9cw/ZwHg0wBajY46G1w1WH+K7/NF1iAC24JvfPq+avQ0S?=
 =?us-ascii?Q?3KQwvwVc6WdMQnjdyf9iJO1AnoGiXFfUlUePnvWlQdouXjJDb5Nzf9phCkId?=
 =?us-ascii?Q?+m8gfF+l+v1NjoBm0zAnbDx/ac4UcvL140Shbnrg+UeW22kE7dyBigKWhq7T?=
 =?us-ascii?Q?GnqT/vrdSA5YvIfB2OMAdvSWTxqj8mbjCMly1L1Fgr8q/CLZCr21s5h6CYfM?=
 =?us-ascii?Q?KzalriFrF8U+lgCki7X3/rVqxQQlYmEazqoAZaOHYvY6zm0/uOrNetLHbWEf?=
 =?us-ascii?Q?6mUEL6iuQnXz2Aavz7fcDiAsBRwNU9/LoJbeh45maun7BbWZttwWXTg5RCVA?=
 =?us-ascii?Q?9w6RM2+peDb3dQr59rqZwcwdnAHclp/Snjp1AFs/lqc2f3Uy/c76JI9KyaMd?=
 =?us-ascii?Q?XPz9nMRcZFr1xRYtLWZCmoZwjB8bud5+mvXkFkSjGmr49UIAjlUFTqIYbB1y?=
 =?us-ascii?Q?E1+hUgJd4r8sjMtjbmEjfT1HLK+3jsDvixx1P0OeBw1eth5YxNlmEzJFe1X4?=
 =?us-ascii?Q?8nFWLuUhuNhNprAHXZTfG/IlanPyb+2H63XkxRHR4B1TlDYd?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10758dd9-f6cf-4c8d-461f-08dec0504cd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 02:40:25.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jcUCTQncaKLw42TQYWLRECMMxZanvoJ9hxmnrTnRCL6FB6d/LE+plYJgil+gHo1X3jjqx/jJGpMmzGZGONeMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7662

> On Tue, May 19, 2026 at 01:39:42PM +0800, Sherry Sun (OSS) wrote:
> > From: Sherry Sun <sherry.sun@nxp.com>
> >
> > Add a new imx943-evk-sdwifi.dtso to support SDIW612 WiFi chip on
> > imx943-evk board, the default imx943-evk.dtb is used to support PCIE
> > AW693 WiFi.
> >
> > Use separate dts for SDIW612 and PCIe AW693 WiFi to avoid the shared
> > regulator between SDIO and PCIe buses, the random probe order between
> > the two buses may break the PCIe initialization sequence which cause
> > AW693 has probability of failing to detect.
>=20
> Mani said M.2 Key E patch already applied. Dose use M.2 Key E fix this
> problem?
>=20

Hi Frank,
With the new M.2 Key E framwork, PCIe wifi and SDIO wifi don't share the
regulator, but it cause the following issues, so we still need a separate d=
tso
for SDIO wifi even we use the M.2 Key framework.

1.  The PCIe M.2 connector use a dedicated w_disable1-gpios, which is
      conflict with reg_usdhc3_vmmc that needed for SDIO wifi to controls t=
he
      w_disable1 pin.

    m2_connector: m2-connector {
        compatible =3D "pcie-m2-e-connector";
        vpcie3v3-supply =3D <&reg_m2_pwr>;
        vpcie3v3aux-supply =3D <&reg_m2_pwr>;
        w_disable1-gpios =3D <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_LOW>;

        ports {
        ...
    reg_usdhc3_vmmc: regulator-usdhc3 {
        compatible =3D "regulator-fixed";
        regulator-name =3D "WLAN_EN";
        regulator-min-microvolt =3D <3300000>;
        regulator-max-microvolt =3D <3300000>;
        vin-supply =3D <&reg_m2_pwr>;
        gpio =3D <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;

2. New PCIe M.2 keye dts require a new lpuart6_ep remote node to replace
    the old Bluetooth serdev node.=20
&lpuart6 {
...
    port {
        lpuart6_ep: endpoint {
            remote-endpoint =3D <&m2_e_uart_ep>;
        };
    };
};

But the old Bluetooth serdev node is needed for SDIO wifi.
&lpuart6 {
...
    bluetooth {
        compatible =3D "nxp,88w8987-bt";
    };
};

Best Regards
Sherry

>=20
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile            |  3 +++
> >  .../boot/dts/freescale/imx943-evk-sdwifi.dtso     | 15 +++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts      |  2 +-
> >  3 files changed, 19 insertions(+), 1 deletion(-)  create mode 100644
> > arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 0a4dabac5de4..657e0915ca69 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -516,6 +516,9 @@ imx943-evk-pcie0-ep-dtbs +=3D imx943-evk.dtb
> > imx-pcie0-ep.dtbo  imx943-evk-pcie1-ep-dtbs +=3D imx943-evk.dtb
> > imx-pcie1-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx943-evk-pcie0-ep.dtb
> > imx943-evk-pcie1-ep.dtb
> >
> > +imx943-evk-sdwifi-dtbs :=3D imx943-evk.dtb imx943-evk-sdwifi.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx943-evk-sdwifi.dtb
> > +
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-ab2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-frdm.dtb diff --git
> > a/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> > b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> > new file mode 100644
> > index 000000000000..59cc1c27b9b9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie0 {
> > +	status =3D "disabled";
> > +};
> > +
> > +&usdhc3 {
> > +	status =3D "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > index fe4fc512d95d..1346a6a56883 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -1153,7 +1153,7 @@ &usdhc3 {
> >  	keep-power-in-suspend;
> >  	non-removable;
> >  	wakeup-source;
> > -	status =3D "okay";
> > +	status =3D "disabled";
> >  };
> >
> >  &wdog3 {
> >
> > base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
> > --
> > 2.37.1
> >

