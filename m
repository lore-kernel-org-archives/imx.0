Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2074.outbound.protection.outlook.com [40.107.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1146BC
	for <imx@lists.linux.dev>; Tue,  6 Sep 2022 13:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6ZGnN4k3Q9ZIUB8z2P1ANQnkI5Hwtl+tZGQSzLW8o6AJB+FD5shKxPchHQ8KQHuZFAyeW1ZwYWvk1e3pb79fQwo5+AGqIk05N5ffjicrjx6ll3qzHP+fCoXoRO7Fy8EvNirF1ckAWOnhjPLnow4TjBFAAtWxnhWymFItZ0y+MNv8cWBGa1jNMignFAThQfsSYFR76KhAFwYFBpp9zG1v2eySCCGB509rJ/YF09ox097CX6FAnbFDiRgTMr8e7Ljt2Ns5NWy5upEVlrXgPqJ2xdRNDEpf6dxMkPUD+gAk4/2kE0TI4+lIe6GDy+/Pf6tClbLfTt82SwHz6SUoVYBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTlRKKCkV+6fsag+VapqDVCp3Yg7ip1UWNReGmNFCxU=;
 b=K2XrT3dexKWSTAIMaPW71O3awqZoRK3hO513a11yjdvn1/p7FEx6c9nQl6E1mY2fJzBMCw4LobrtL7O6kik9KZCeoc1oudiePTV3IfRIf1YIaVF1kpEw52QGjB5pz3yhUW5bXF/pJPhVqIXBGWQ6tMksFEbn8a1CeD84fKgOOlPcanwqdO4AP68QLJPlTUy8qPjp/1JNroLFLjMCrhi1uSeZ3jvmWzJvsRnSbL16FQomFUheDTSZZD/QZxr9Spmrjq10+2De38soqk8b4WYd4htiS+h+4o+kUp06ZfLngqpLemIiz3D66jFKeNE0OUm8R7vLsUn3u5CHelbkbKztwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTlRKKCkV+6fsag+VapqDVCp3Yg7ip1UWNReGmNFCxU=;
 b=pisAN45G2dKp9f2Vtr0VhmL1vlorZG/mGroX/KE1ebGS9FP3/pY1nrHGfsa0XSQEJ10+LV5Z3QqOCvUVmQd84w69YLCch+joV/+vKoPjSsyNpw4hvaGR+4ugYt61IzBpG9yk7/yTf7dc6VsJl9MmWhCqYUHkjwYyvdzEu4IPaDE=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7968.eurprd04.prod.outlook.com (2603:10a6:102:c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 13:15:37 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962%4]) with mapi id 15.20.5566.021; Tue, 6 Sep 2022
 13:15:37 +0000
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
Thread-Index: AQHYtlAgdVQnsa8uOkGgg6uKMosVx63NI2KAgAVTviA=
Date: Tue, 6 Sep 2022 13:15:37 +0000
Message-ID:
 <PAXPR04MB9185D243324279DD80C371DB897E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
 <20220822175245.222691-6-shenwei.wang@nxp.com>
 <20220903034819.GF1728671@dragon>
In-Reply-To: <20220903034819.GF1728671@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fff60f90-5228-482a-042a-08da9009e3b0
x-ms-traffictypediagnostic: PA4PR04MB7968:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zeS5DJ5zEEiyh07JZlTibQqloDWVywYHJDUCE1FSq6Kfs6ldXrtQlN8+NqL0KY0yRvnESw8vz452OjFQhgJgimgDiCFpXH3JPM8uRGrLJZwz0a2QTLAv1t++ZsRiOC/fAE7hRftm9XNjVPQlG6X9cqcL8KptrtXwQBPjQrSSeJ/SM9zKhpxAB4tNQQSF4jN7BNXW10u0KL6dM4iohW0gxFLglLhAabyzMZIvBce21m3lFAIP2trFQhi6rR/My2p+Lc26sH12Gv6TNHACh+xdaqVjVeu2bHn5ZEJHXGbX8OczGphON0Tcd5wAxDwEfefZX75g2GoP9FaOAM9PO/878qiRh9R5gsvLErI/3LwR8F8aq7PTG4j65hiA+tOaTGW9y4JpE8qeKj/s6+4RTn/8986/tLQADdYfg4Z97LVNrMiIyXogK75Gn7mx+hgp/ZZ+RIzk/6QMvs5DijSCXFRbe2CpS+7sfwkgZiz2RvR7WKPVt4YAJp5HBOGn8bg/iAWqPdK0I8acaRJLp3cz5+KnIjyTyiDo4y1RZFBI0bTebN+BBEEDG+EQXlSYjMu1ZIrsFHO4pg5/rvjJtqhDgtV5xueCLpz8+lKioJG/Z4oDf7H5Ok5AHZ7nd7g3zcsCUBdxNdJSl+1dsvVgvWHKB3BUjwwn2EWLsNB9LeNa5Ykc9CFnQzEeMhd0bqbenunYVewUcrXJ3uuTlBjymb3Lwok16U/FigLB/X90xLOSh1f4JWSaR2FO8jpV1i9OJQ+opx/EZWKrlbbQGDzsxw4i6XqgdnnC6t17braHq38ISgl9qavfIr9ITJPrAWDBJS1rIJ39
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(122000001)(52536014)(186003)(54906003)(316002)(71200400001)(6916009)(55016003)(38100700002)(5660300002)(9686003)(33656002)(83380400001)(8936002)(44832011)(6506007)(478600001)(26005)(76116006)(8676002)(2906002)(66946007)(41300700001)(66556008)(4326008)(66446008)(86362001)(55236004)(7696005)(38070700005)(53546011)(66476007)(64756008)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5dnV1tNf4DALee8I/37N8604x7qzZqjymXuFBufKQ53LnBWxAMkZ5KzSZiJy?=
 =?us-ascii?Q?sP4l3MuA0TAJ+WjgiKOglSceUY/6a+TppSW09Zx9O+nAkFmXUOLfar7SM11n?=
 =?us-ascii?Q?W5payu6aGCtCo90G/rK96Z4YG09dvUKkBk+QrtdtV3U76vdUbjA/D9jvhUem?=
 =?us-ascii?Q?q6Er0n7tjr8Uov1czMcABWRTK+GTYHuMvTmJVwjeW8IVC33eIpo2G4PPvt8X?=
 =?us-ascii?Q?+POIFAS6wlnCPKOdjApcivpwfxQM8LzHk88hXqHcy3CE+baR8OfEk3II7Rz0?=
 =?us-ascii?Q?wo5Y6NTQZbP/6wiyASbnlm01tvM0gKWGSdFURmWrj9osCYb3a/pz98+N/o1N?=
 =?us-ascii?Q?RhpPA2+7rqkGa6eTY58XWU+sDKphvMATy3urJ9xPkif8agOTLNt9hxIVhi0O?=
 =?us-ascii?Q?d00g2AdgxibrWf0CsZL9cz6EPIPxU5sunH+xbuTmuBKH+dypg+XEB20HU7Vl?=
 =?us-ascii?Q?/4y6ZjXQiVr58lJIm03Kp7BLY0rFjEGlQLvmYlqGSLmtO2FyfgzGO8FexOqs?=
 =?us-ascii?Q?Fk1VBhp1cXt+yCkVTsiQEaFa4i103vZrKzVxNsRaPKr45TpZB+bRAqSjHo85?=
 =?us-ascii?Q?MkLGhZsX26wNdavNB4AkETqEjJeQS6Natrr2SdcwYXI9APB9vRWQng/lUHW8?=
 =?us-ascii?Q?ekY6immDsW24IRHnreTkWl/D0knCFOmoI4hoNOlDAvEOzXWSW6n/4brZHcNN?=
 =?us-ascii?Q?etOdXHVUJOdgeXYkp0OF63a1TsJbJe4B51NuI2vs8QGYPV8yWrdxBuJMr8ia?=
 =?us-ascii?Q?ZyVYl9iS9+uhkkZ7rX/EdyvzVgN8vP/fL5GNDIMuyOapBx+4V3Uao9/fLKQ0?=
 =?us-ascii?Q?RJFzc4s8hbux8pVYSTC25RYZTghoC7ba4hiUaJxDEkCTeKLfTYrPxKRMG/AU?=
 =?us-ascii?Q?dye9OvwJCGB/O6lsATj9h6KBjR3YyCZUE7PCXL1BOJ++ILptwnfPXyXYs0uZ?=
 =?us-ascii?Q?JaOEO3EFrhLbqHmR7Lfe9I3VuyYH1Mf2CUQ6BuT7jwuTLAwceCRpTp0DlVEZ?=
 =?us-ascii?Q?yhjnOZtecjIqtKQ2UNJ27TSOYEatKdsRHxOEhbvvpfR8AbDAnuFfLHTH98Ec?=
 =?us-ascii?Q?JUvFwn1zWZoJUmI9jxFUdQN3dVkZwqpgh7azdVm8ncbB5aGfvgr7xLSyqhIW?=
 =?us-ascii?Q?8N8KhpG5QTCWXJcPSo2E87tnKZV70DvnIt0G1qgprXtHS7tvqy9M7yYF+Gvn?=
 =?us-ascii?Q?7/Wl4cFSwa+am0l+JGH/XsxxjWqexsVdVwzd6SKbXsZgnGfhKXKg2r2rvVrO?=
 =?us-ascii?Q?pUXUlLqNVe/Y+lc48PlOB+8QI5bkStOL0aNCV7jEZhFQ26E6D35WcV4gmNR2?=
 =?us-ascii?Q?FrLceHfwCeWrwoPXEWBIG8POqrMG6JwFonPL6oMdPr2oJ6fiJKAghZ92DgYH?=
 =?us-ascii?Q?mm6SHzTJNGR1GkYUj3LFvBD+yP4Piw8VPNrbGJ1+QhbtauiF7qm9/c0AJ6jn?=
 =?us-ascii?Q?kS02jvjfcbvWOkOUGDz2WVR9few/DUH0VrzsKpgeA7jYrMe5jV/LXBGjfLmv?=
 =?us-ascii?Q?UODhC0hVSsGr6RAdRaXxTfMu1n5A+S58cPQpqBpuDy05mtNoOGXV7QSdsVFH?=
 =?us-ascii?Q?QFXqMj32iQiDHZxEc4RBoN0gOZvjUTrFBYgIG7iw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fff60f90-5228-482a-042a-08da9009e3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 13:15:37.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9VXpZJPCJCSi/j0T83YQLg++QGbPx4GUB0NRudTfEGqYgEQbdSQTn+zhV4rZTyFF5pf109iPSmBXzLkq4OFUwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7968



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Friday, September 2, 2022 10:48 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Sascha Hauer <s.hauer@pengutronix.de=
>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; imx@lists.linux.dev; dl-linux-imx <linux-
> imx@nxp.com>
> Subject: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
> i.MX8DXL EVK board
>=20
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_fec1_sel: regulator-1 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "fec1_supply";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpio =3D <&pca6416_1 11 GPIO_ACTIVE_HIGH>;
>=20
> Missing enable-active-high?

No. Enabling this regulator to select the fec1 interface instead of usdhc2.=
 Pulling this GPIO pin to low is to use FEC1 interface.=20

>=20
> > +             regulator-always-on;
> > +             status =3D "disabled";
> > +     };
> > +
> > +     reg_fec1_io: regulator-2 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "fec1_io_supply";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
...
> > +     fsl,magic-packet;
> > +     rx-internal-delay-ps =3D <2000>;
> > +     nvmem-cells =3D <&fec_mac0>;
> > +     nvmem-cell-names =3D "mac-address";
> > +     phy-reset-gpios =3D <&pca6416_1 0 GPIO_ACTIVE_LOW>;
> > +     phy-reset-duration =3D <10>;
> > +     phy-reset-post-delay =3D <150>;
>=20
> These are listed as deprecated optional properties in fsl,fec.yaml.

Will move the reset properties to phy node according to the new rule.

Thanks,
Shenwei

>=20
> Shawn
>=20
> > +     status =3D "disabled";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy1: ethernet-phy@1 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <1>;
> > +                     qca,disable-smarteee;
> > +                     vddio-supply =3D <&vddio1>;
> > +
> > +                     vddio1: vddio-regulator {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     clock-frequency =3D <100000>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c2>;
> > +     status =3D "okay";
> > +
> > +     pca6416_1: gpio@20 {
> > +             compatible =3D "ti,tca6416";
> > +             reg =3D <0x20>;
> > +             gpio-controller;
> > +             #gpio-cells =3D <2>;
> > +     };
> > +
> > +     pca6416_2: gpio@21 {
> > +             compatible =3D "ti,tca6416";
> > +             reg =3D <0x21>;
> > +             gpio-controller;
> > +             #gpio-cells =3D <2>;
> > +     };
> > +
> > +     pca9548_1: i2c-mux@70 {
> > +             compatible =3D "nxp,pca9548";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             reg =3D <0x70>;
> > +
> > +             i2c@0 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0>;
> > +
> > +                     max7322: gpio@68 {
> > +                             compatible =3D "maxim,max7322";
> > +                             reg =3D <0x68>;
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                             status =3D "disabled";
> > +                     };
> > +             };
> > +
> > +             i2c@4 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x4>;
> > +             };
> > +
> > +             i2c@5 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x5>;
> > +             };
> > +
> > +             i2c@6 {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x6>;
> > +             };
> > +     };
> > +};
> > +
> > +&lpuart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_lpuart0>;
> > +     status =3D "okay";
> > +};
> > +
> > +&lsio_gpio4 {
> > +     status =3D "okay";
> > +};
> > +
> > +&lsio_gpio5 {
> > +     status =3D "okay";
> > +};
> > +
> > +&thermal_zones {
> > +     pmic-thermal0 {
> > +             polling-delay-passive =3D <250>;
> > +             polling-delay =3D <2000>;
> > +             thermal-sensors =3D <&tsens IMX_SC_R_PMIC_0>;
> > +
> > +             trips {
> > +                     pmic_alert0: trip0 {
> > +                             temperature =3D <110000>;
> > +                             hysteresis =3D <2000>;
> > +                             type =3D "passive";
> > +                     };
> > +
> > +                     pmic_crit0: trip1 {
> > +                             temperature =3D <125000>;
> > +                             hysteresis =3D <2000>;
> > +                             type =3D "critical";
> > +                     };
> > +             };
> > +
> > +             cooling-maps {
> > +                     map0 {
> > +                             trip =3D <&pmic_alert0>;
> > +                             cooling-device =3D
> > +                                     <&A35_0 THERMAL_NO_LIMIT THERMAL_=
NO_LIMIT>,
> > +                                     <&A35_1 THERMAL_NO_LIMIT THERMAL_=
NO_LIMIT>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&usdhc1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_usdhc1>;
> > +     bus-width =3D <8>;
> > +     no-sd;
> > +     no-sdio;
> > +     non-removable;
> > +     status =3D "okay";
> > +};
> > +
> > +&usdhc2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +     bus-width =3D <4>;
> > +     vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > +     cd-gpios =3D <&lsio_gpio5 1 GPIO_ACTIVE_LOW>;
> > +     wp-gpios =3D <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>;
> > +     status =3D "okay";
> > +};
> > +
> > +&iomuxc {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_hog>;
> > +
> > +     pinctrl_hog: hoggrp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD
> 0x000514a0
> > +                     IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD
> 0x000014a0
> > +                     IMX8DXL_SPI3_CS0_ADMA_ACM_MCLK_OUT1
> 0x0600004c
> > +                     IMX8DXL_SNVS_TAMPER_OUT1_LSIO_GPIO2_IO05_IN
> 0x0600004c
> > +             >;
> > +     };
> > +
> > +     pinctrl_usbotg1: usbotg1grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_USB_SS3_TC0_CONN_USB_OTG1_PWR
> 0x00000021
> > +             >;
> > +     };
> > +
> > +     pinctrl_usbotg2: usbotg2grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_USB_SS3_TC1_CONN_USB_OTG2_PWR
> 0x00000021
> > +             >;
> > +     };
> > +
> > +     pinctrl_eqos: eqosgrp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_ENET0_MDC_CONN_EQOS_MDC
> 0x06000020
> > +                     IMX8DXL_ENET0_MDIO_CONN_EQOS_MDIO
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RXC_CONN_EQOS_RGMII_RXC
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RXD0_CONN_EQOS_RGMII_RXD0
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RXD1_CONN_EQOS_RGMII_RXD1
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RXD2_CONN_EQOS_RGMII_RXD2
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RXD3_CONN_EQOS_RGMII_RXD3
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_RX_CTL_CONN_EQOS_RGMII_RX_CTL
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TXC_CONN_EQOS_RGMII_TXC
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TXD0_CONN_EQOS_RGMII_TXD0
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TXD1_CONN_EQOS_RGMII_TXD1
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TXD2_CONN_EQOS_RGMII_TXD2
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TXD3_CONN_EQOS_RGMII_TXD3
> 0x06000020
> > +                     IMX8DXL_ENET1_RGMII_TX_CTL_CONN_EQOS_RGMII_TX_CTL
> 0x06000020
> > +             >;
> > +     };
> > +
> > +     pinctrl_fec1: fec1grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB0_PAD
> 0x000014a0
> > +                     IMX8DXL_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB1_PAD
> 0x000014a0
> > +                     IMX8DXL_ENET0_MDC_CONN_ENET0_MDC
> 0x06000020
> > +                     IMX8DXL_ENET0_MDIO_CONN_ENET0_MDIO
> 0x06000020
> > +                     IMX8DXL_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CT=
L
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3
> 0x00000060
> > +                     IMX8DXL_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CT=
L
> 0x00000060
> > +             >;
> > +     };
> > +
> > +     pinctrl_lpspi3: lpspi3grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_SPI3_SCK_ADMA_SPI3_SCK          0x6000040
> > +                     IMX8DXL_SPI3_SDO_ADMA_SPI3_SDO          0x6000040
> > +                     IMX8DXL_SPI3_SDI_ADMA_SPI3_SDI          0x6000040
> > +                     IMX8DXL_SPI3_CS1_ADMA_SPI3_CS1          0x6000040
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c2: i2c2grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_SPI1_SCK_ADMA_I2C2_SDA          0x0600002=
1
> > +                     IMX8DXL_SPI1_SDO_ADMA_I2C2_SCL          0x0600002=
1
> > +             >;
> > +     };
> > +
> > +     pinctrl_cm40_lpuart: cm40lpuartgrp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_ADC_IN2_M40_UART0_RX            0x0600002=
0
> > +                     IMX8DXL_ADC_IN3_M40_UART0_TX            0x0600002=
0
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c3: i2c3grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_SPI1_CS0_ADMA_I2C3_SDA          0x0600002=
1
> > +                     IMX8DXL_SPI1_SDI_ADMA_I2C3_SCL          0x0600002=
1
> > +             >;
> > +     };
> > +
> > +     pinctrl_lpuart0: lpuart0grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_UART0_RX_ADMA_UART0_RX          0x0600002=
0
> > +                     IMX8DXL_UART0_TX_ADMA_UART0_TX          0x0600002=
0
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc1: usdhc1grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK        0x0600004=
1
> > +                     IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD        0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6    0x0000002=
1
> > +                     IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7    0x0000002=
1
> > +                     IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE
> 0x00000041
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_ENET0_RGMII_TX_CTL_LSIO_GPIO4_IO30
> 0x00000040 /* RESET_B */
> > +                     IMX8DXL_ENET0_RGMII_TXD1_LSIO_GPIO5_IO00
> 0x00000021 /* WP */
> > +                     IMX8DXL_ENET0_RGMII_TXD2_LSIO_GPIO5_IO01
> 0x00000021 /* CD */
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2: usdhc2grp {
> > +             fsl,pins =3D <
> > +                     IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK
> 0x06000041
> > +                     IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD
> 0x00000021
> > +                     IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0
> 0x00000021
> > +                     IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1
> 0x00000021
> > +                     IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2
> 0x00000021
> > +                     IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3
> 0x00000021
> > +                     IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT
> 0x00000021
> > +             >;
> > +     };
> > +};
> > --
> > 2.25.1
> >
