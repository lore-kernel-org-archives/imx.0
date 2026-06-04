Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E8D3C2B9D
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555763; cv=fail; b=uNT8dgNGov9jaZBXeHV5njICQBRVCT5yLutQxoRDw7zF4njITxh4bQSSxXBD1WzeZEfHzDAcwRdTs0tIXrBRH1NJLK0pFkK5tZNbWYn2qCK19uReYvTx6zj0rVlZ82Uo4joNd6rapZgC8k5WT96l/O42VxRbKpg5VeFgkynwwZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555763; c=relaxed/simple;
	bh=TBlMOp0JopO0Hhj3DkbLiL62hzBNW9mxc2XB1JGtWoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DQEZi80iapqvnilkra9mHd+jvSYsA5i7V502syJiP0BOlScv4bphBpfSsY2LBrlJdyOyT4had1U5zyeXEZAV5tOBdFQJ9P3Wd3H2ExHMIFgq9HGPZc1TnfgTvNy1zFHtMTjpWZxRBnafb80qVf/iHFGFDGwt/C9Ut05ZMGvLBQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AUiBPbsw; arc=fail smtp.client-ip=52.101.84.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AUiBPbsw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CF7DBEhlPx0jcHFrJetGZviWB66cXEqmoWXHRAnXbwKBFRwzSGzFNXcwvjApMUlwTk1cg1dXJgsyh1hN4vtFKsyNweTead4qGBia4gs8D+6QTtQRirLG1oPs8qpv7YnVHEQOEPP8TSXXiyI6GGRKNyJgg8gwrD9h/yEcHD+eKG4D1FSkDvlNpPeTfNBbLacVWeJ8orLr2OCHB4nvFPctuxLj7fSJgWeRA7qXv9sInnZyl3eA3soCshI+zhPeAgQEOJjXVDZYivjXSmFS4M2471VKk4gPVyKZJjUAOoyKYpWBCX6Z1d7VpCUPAcGWU2hO28Q/GsN1ybGmolJGOhpc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ6SryaLEZrQ9nkLnRUo9u9eEcejp5mmpfAJQ2I4uuw=;
 b=bhdzYmzhMVCn3Obr7sx8gb+0a4ut0/fidZyb3wIWHiNqnhV20UmHL6FpiQHgAIeMTyqtJM62CIIM/Kg2yCcRV/imi8+WeDBtz+oamRyCN/shYitVO6Nb4D8DhW9kgRfDgGuuL6DHVJ6e7HZE5dd1+xlZvghRm/deEUNR6Z0zrWR3sGVDt9uo58eaoq0NGAz7YdqePEpdxRMOn+K0AVikZNkYKoQVoo7w4cL1d0K5WHXyOAtrto1HGC1wypKJWhJ8HBP9aA2qwgVHyXKevDwIchqdmaHdVTNfiUdteRSep1+k5R3rzJsxhPJ0mphoQkDupKilRKWiFXkUXSv/DV6vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ6SryaLEZrQ9nkLnRUo9u9eEcejp5mmpfAJQ2I4uuw=;
 b=AUiBPbswHVsFOYY0c83DIXAXRLZlC9+rLv9gdpoy7kEONqrN6IO3sG3rgLEuCp21NYzZoE8RTlQMVRdf+wfGynFPrEKREbytV2oF6dR038UBbo7ZMevkhvLKL8ME/EARhFwnahBwoQf+0I3+QgjkJotE5cw5OAClTtBW7/vYcDON/lcYaafGuGuNEujS/Yhps97/s7oqcS2Yxgl2O9vV/cESLcvNqjFSsIK6JCKkLXHOy7CHgk8qfkO/WJLwMysi/d78rSwIjlRZgojlmFeFcXVOvAq9GOfupvc3oWA0N+pKWol0NlFAM4zfrCJuVLEEXHxnrPxTP7Yqdqi5JTC7Wg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7482.eurprd04.prod.outlook.com
 (2603:10a6:102:8f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:49:18 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:49:18 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Topic: [PATCH v2] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Index: AQHc8+sH0ZDCmxCVi0CXELE6fHO8RLYt9HVg
Date: Thu, 4 Jun 2026 06:49:18 +0000
Message-ID:
 <VI0PR04MB12114C03C7D3EE162B99AFD6C92102@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260604062846.310810-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20260604062846.310810-1-hongxing.zhu@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PR3PR04MB7482:EE_
x-ms-office365-filtering-correlation-id: febfe190-ff0b-4a5b-abe8-08dec2056698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|366016|376014|38070700021|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 QZlnD+S45KQsdsa2Q35GTizvdoE9PK+56XjdTLq2A2hlA6WiqJ8Iay9GiTsQYPLbwhiJTzjDRVxZHQKzsoA94BF1ClkX9Q+rb600la/jvhL3au7BB8bIdtZpFhfOCeiUNpxiMHk2lKC1uiu+CVUN0jtZksgM5enUv9dNfMpAbXDGIkfB3CvUqyQCyIAdxKICxIwAl0e3izV7ZDYeqb6KlSN6bxJYUE+HYeF90SurxsEI1hn222H8jojRf9NaQZYZzGEMpcvGdYWK8YoZyT5ZFm+aUPQMzLlpcfaWlMpfPSIoEenzODlZnM0/ic3D0VaWYQb0OGmPRq92+LxsfGtoQhQAIDbxPgOwt4mEvKcl20N+yQEd/k3EVFjfIpS2rgphTl4lROveeR0LjQZK7wwstFtqTsK1/WKPbub+niJC3bCjetpm/q3PgroU+CQP68CuQIzH5LusBXutS1D5pCj6JVpJCPvEA9VDZm0p3oLYLtujgeF/uPeVaShEHHJg8TlZfWzzdbLZ2mQroFUl8n+oF+dbE8Uq3Xcex5s7eClvR6ltzl4CdhoYYCRfQPY7gNJL3B8CV6RmrOD+pOOABjC2qXwbU1N1mSs5DTzIvp/1b4y9vfqLay+ltseufXzxybe7KW6TuZwul7KcQE3rJYhJNSE12Uwf/ljCHC5fikK8qo0cMUdAdfg2+3utIqizvsTtm+EkmbFpTrSF+fl03W87TPw/21vU36vJyP1v9hfnWxKEK3pFzbGCY1GCqwmzflx3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(366016)(376014)(38070700021)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e2b5bWvMsLgs6jt0ejCppSzKpT/HzA+tKSR8QsFpbUWDAYviDTumMyqiVJpr?=
 =?us-ascii?Q?tfaIoA/+2zrGuDvJbEQdp6gcJ05pAe9JKq8z1eCUEZc8C07rYdxk0/vDSsEV?=
 =?us-ascii?Q?5e0UZrluL1mkpLvNdoBZu/LLJrNwhlGaZk2FFKDSeUB79/UaFo0Db1KdFWRz?=
 =?us-ascii?Q?pKHsXuEJuoqm9D+q0DntQOS/j+iLIS3g/xWewvjyJHn7Ozz6kZyEDMSY+UrA?=
 =?us-ascii?Q?nf468y+Fx4Eiq4Knauxo156dQ3Tov8XMCd7/4JqpCTokuvtdKqLCj+vTRlo3?=
 =?us-ascii?Q?o+dhabZoSlO5h159jTyB18Tl0GieqFyN1SPFaRBFamtk1wZmuSuptG//A5Dq?=
 =?us-ascii?Q?a3jpzV5WJPT4MIkPLdaAm4YEGxLUMRVNTD3ySB+wzRwFTdgAcQxBtK4brn7D?=
 =?us-ascii?Q?+zYLc3V2GdGjVAItZMyFeRbpp5QiuKgtf3imxh9D6QbN+URTmhx56amdd/0b?=
 =?us-ascii?Q?94nTATuj/3muDEr5EuLOQpuPK7Yrt1Tj5X0VbUgrTFazVEEd7RIHtSMFH9os?=
 =?us-ascii?Q?FSNgu50y6AGw0YTh5jv+mzQb7OKAUWzl4zMWBGdMOEYKj47vCGo5ClKsC/nF?=
 =?us-ascii?Q?mYYdWLPVQ+fpqLINmmgPa2aQawZ/EPcUij4Iht9YVe0J0bpY3r7NDqRucd8e?=
 =?us-ascii?Q?nN4IwLScbEn6htXtc02CbAKga5TtSZ1dBce3IjVDwEMhjGh+mUaTCOcR9Gci?=
 =?us-ascii?Q?iiTbS934QJzZnL9ufO6V8rUe7G9N27Fmp0qHcWXqjn410iU8pfWMbESGbWfJ?=
 =?us-ascii?Q?YoUUp9o8zU8k8Yd5/FrCMLPXAF3T6ayOk7TcyZmLiZ4acfP54RmVCejZ40vc?=
 =?us-ascii?Q?EAaWe3UQ6JO5uXbyvEmYOhlHz3m88H+T1GKD24WtHZTftlXFgybgm4vdkknY?=
 =?us-ascii?Q?DP8iBsiWRa2EaBAMNx8LgInikkFPUOA22go4UqH1ZPVvWLumQZ/3NGtTgxVK?=
 =?us-ascii?Q?C+UB6rclEM8l1Ns3rLbf7MhQAq5Sp5jkfqLrQTK1jcnoUvQbX3+xcBeeNjUT?=
 =?us-ascii?Q?mQKfCmreTi104oJ+4jEEGnKuN3cwxyJY1TN0PavR1EzWCZKaQE0myC4ZGxaQ?=
 =?us-ascii?Q?kKxALJpy5C6BDItkiEg0Hv6VYtQJUiDz5PAbtPEo6GUl+1iE47wPf+Bn+04S?=
 =?us-ascii?Q?Xc9SEKdYrCBTbXL+nt26Acxrt0DYdh4I/+4xPZXbp0sp3O2b+X6Wuaj5hlcg?=
 =?us-ascii?Q?wEJvwBK1nrTzglPcRGhJtMHY0BUk7MXcOy4Uei+1z34W4eQop1issA9l1cpz?=
 =?us-ascii?Q?S5wcc3gteciWTWIC8gKNvON0UmHycIdLpJcR6GS5lG0q7GLQFGasOBoEi9Jm?=
 =?us-ascii?Q?pJBz0a569ATusyELX5Z8uWTd0zA0KbGLE9nq4T8za4ZJMqtZJpeB2hUNk5PI?=
 =?us-ascii?Q?38P8Jdpc9djySFlO/HSdKxs6FzLN2iEGL0x+jOZjnkKiRD2iXYd2z4UmtJO6?=
 =?us-ascii?Q?kOtZN5MqTrxS8quYVmcTu0hSwKpztsU9PA1VpJax9pH3ls/iaM9Q2KiKglbd?=
 =?us-ascii?Q?xJAE1aqRsk0Syj+qR+yWZ6fuwIHW9ZcgvgfgwnjhycSAYnwQDx0N16XjVswn?=
 =?us-ascii?Q?WyiWQ09ISn78OX6I2Nkt+fUmMVtkPVd4oUtskqhwRS9jLjhge42ETGcU824B?=
 =?us-ascii?Q?sG1CstUiMF3iY1XztgkzSA+B6FL1epMpCxPJzJqQ8a52zRVF1r3EyEBgRAjp?=
 =?us-ascii?Q?RGH8V76vNFjfVB7lDdyhhUqrBrUMtfauB5yaLEeJmPmO5rDO?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: febfe190-ff0b-4a5b-abe8-08dec2056698
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 06:49:18.4663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GaI25YZOcrQnR71En8ImhdMhuWddL7OKUgYT3l63O5UpAYRiW3bLppN+vuzu+bWGi2jCDRlXjET5ZImVO8hYGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482

> From: Richard Zhu <hongxing.zhu@nxp.com>
>=20
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so creatin=
g the
> Root Port node and add the reset-gpios property in Root Port.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Sherry Sun <sherry.sun@nxp.com>

Best Regards
Sherry
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 10 ++++++++--
>  arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
> ---
> Changes in v2:
> - Delete reset-gpio properties in PCIe bridge node.
> - Correct the "reset-gpio" property to "reset-gpios".
>=20
> Since the patch-set [1] issued by Sherry had been landed. Add according
> changes on i.MX943 board too.
> [1] https://lkml.org/lkml/2026/6/1/1461
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi
> b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 1f9035e6cf159..dfbb73603cb24 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
>  			power-domains =3D <&scmi_devpd
> IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
> +
> +			pcie0_port0: pcie@0 {
> +				compatible =3D "pciclass,0604";
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
>  		};
>=20
>  		pcie0_ep: pcie-ep@4c300000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 7cfd424689507..99d66484ded04 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,15 @@ &pcie0 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
>  	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie0_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>; };
> +
>  &pcie0_ep {
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
>  	pinctrl-names =3D "default";
> @@ -1058,12 +1061,15 @@ &pcie1 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
>  	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie1_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>; };
> +
>  &pcie1_ep {
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
>  	pinctrl-names =3D "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi
> b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index cf5b3dbb47ff7..01152fd0efa5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
>  			power-domains =3D <&scmi_devpd
> IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
> +
> +			pcie1_port0: pcie@0 {
> +				compatible =3D "pciclass,0604";
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
>  		};
>=20
>  		pcie1_ep: pcie-ep@4c380000 {
> --
> 2.34.1

