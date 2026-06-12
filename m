Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84133F8D4
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781229477; cv=fail; b=KuFljqaQ6SXJdM85NFZwlogZX+UmZ7rxyNGN/2BHPlT+Nl/76mu3/jLxQilImRww9z58hoSGM4Jn9wpDwDN1Rrfxv4j49HaAxpxR61qbPTzTj/WrdMUFJDF6FCyznJXMpn0K4uOOjhJQtgap0F5GQDpaQm5PAE2LOUv3y0m9JkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781229477; c=relaxed/simple;
	bh=3GLz2EHkOnTs6qhh0JqZAW0+L3100OlZvBwueg588K8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QGT5oJwz9py7aVEvijrNZhiIOmutj+1rK7eXxYRAZjzM2Zy6W6WE7sNa2HUGVdhM48nzpABR950+PmmHr7ogKKrVbCwq2cfHK2ZlTTQEw2Rlrsnxb8f539NQB4pOp17y9qop/Bld5GXhcbhAXPjnJHT2alZC81SUxsxk9qeKvuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T5PFH8bq; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T5PFH8bq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0iUjmaasvuqBEmGxcTx5G/dh0ddTC3yxMeswO5MAfUoUcaxXuA34kLfz5MQ6+vB9bN3Kvq0RF3mA/7SoGxiXw2MKyFJgeHglutBZl8SCx+niUCfTghll0oGh5dyO8vCm/zQ5BJKQ80pzu6TMAItVUIKwWftPwgy0gfo0DwYagJX/V9uWf0NjHXV5IEld2HFUDf7WpuJXkFcsZSiOgkQ0FXkeuBy9xrEnvnyzC0MtiSydCDkYQ6n/Hq+wI8d/2heoeHFp7Wlf1v13FCzVY1ITyy3YtGS8nHmlYaDjWPbnj8GWjy0EGBo/YwXB+wrAT1kkeJXn+vAh9FMiSO6FgDQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1Q1mm6atx2qaEhybAUUNlPER0RDKgQ5we85BLnyDY4=;
 b=AuYlNSbPzCnumUvgZoUIT7uChcXAP7xNjLGdsPq6HTlaZnTFpQ/hV4O6C701+6gAc7yqxEGYU0fKBYd9Uhb7slgkv+hhyEnY+p45RmJ7aGRpMiH/Qe8XiFcKA+eGkPltxt1W6L1HbIuDqJ205BrdJy2ry/qwiLEAIcp3P5I2KHUgj5vn3yjdEpYaBbEOQ/e8TCNDKXxDgZjMijokjyHalW77dg9jeymiivtLTq+GxYusBzyFBXiQMzT761ywxNktKEz0rS8ZX6tYSdR5cc2n8JdMHFSM9APXuzZib/HcQhKmmFOtu2i34SJIInRCtXSM6kLBayw7c9fBG9mYTXGYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1Q1mm6atx2qaEhybAUUNlPER0RDKgQ5we85BLnyDY4=;
 b=T5PFH8bqZCPztgYaAehlCQzd6p4aIv4GELRjw9ETuE77aaR82aBzhl/GzL0/Tj/6JzoRI/rD4K2pL16JOrbbwrCb1443RBI0KKaI6ep94gEOtAwe3wk4GA23vqVhUkKFWPX6nxJh9pl3QeX5NxeYRWCiARr3mGAn/WPKaGFSVTKtGw71g9aJk+EPn+8yEJbfqy8NZvaXV4ue9ASA5ikRI/4k6SzSA7YxM7CLohP0k+c5uSvnfFMjQ4BUyOrDjWyjwGwntBexGVoJzhBH/Fqp0Oqx5CorS5kaPPZwhtrSFxG0/88FihU55rk2tmI6iosG2CFEX/26vBVUa3l2QUI8hA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB11068.eurprd04.prod.outlook.com
 (2603:10a6:150:215::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 01:57:48 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 01:57:48 +0000
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
Subject: RE: [PATCH v3] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Topic: [PATCH v3] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Index: AQHc+Xa4dlJdj5eTNEyOtbgWmjkZP7Y5dZxQ
Date: Fri, 12 Jun 2026 01:57:48 +0000
Message-ID:
 <VI0PR04MB121141199AE84944457F66EA492182@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260611075057.2892593-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20260611075057.2892593-1-hongxing.zhu@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GVXPR04MB11068:EE_
x-ms-office365-filtering-correlation-id: 38396c44-9da5-4e9d-3806-08dec82600e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|56012099006|11063799006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6Jj06rroIJJPpoWkQCJtp+FdFi3pVGsktfosiLMFMlbK64EGpKMyG7shhZyuOJnEesMRXNQh3ylvga0qD8KB2+RxRzkQrfFN7PRXtiDcil4eAqNA8TTwF8TR4KQF6CNwWiZlkYWjnQprR/ssAuU/EYmyZs/tQpf0E2cX9A/zh00/tJnYEfU+iGvU1v3LOt4FzJoYkBb4BPxPXO9iF7Htl35J68z+Srf2wxmunS3KbzU8WvTbyV02Q32LjCBh7n2A0X0wnRZDKbM168ckeS2X3BuG1X0h2b+d77vGP7Ujj4j23fzAUPEkahQC0kmrT16wAmHdvnN4xkSdxreRBoIo43Q1rUdo2xEmylN1cUUem+iAPG0OskndxelvbvxL/32LECNmNTNKk1VS8ccYbx6XY3nUqdYBMgZ1q2LrolQA+8pjo8kxveN3ETHZl3qcLcukl9JYzRd/5RZb2fy1wB5nG+sbyfyaDI7nJSwWDE5N5dx3kPHl5je31T2tAHQQahStkDuJRpdrQzUDl3t98gQdrbl9AEOkPZD/2krK4PT5PBut07fs+I8EzdBYPJII4TIxkjzdGwsa7gfLeew0uTNzjGw1TwdkIC2+dX0bLcadMAIg9N9iXdx9k7zQ3aLGfW+IGFMXqg7ALJb8D8HzJ6SGsO5nGQyBXJsaXApwkeBCloUP1i0Fo+Lp4fJhmn+A/bRbXmjhjnL7YrPpBeT29JpqDC5KGEvr22O5F9dzY8MXwnN39HfFD0kTEVJGCxb9IqZQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QTcx2OLsB+P2V/0Qg+O+Gh1C+e/HuD/hMkL/33SHwqOSzfUtqLS0Ybe6IMiq?=
 =?us-ascii?Q?88JWqK2L3tg6vt9t7c2uhDdiFQ/iB4mG061p9WK3FF58m1kvZGXL5/C+iw6C?=
 =?us-ascii?Q?77K7DBfAUz/B9cAvoDg4gCMExDGlfBKGMrmXc3rsoIWGrEAps2C2YZtuHkd/?=
 =?us-ascii?Q?6mHJyDBhh+IufNN+I8KA6FyW+LGWY+GeJEaTA2w/8313AcONrSq7JZqKAqQL?=
 =?us-ascii?Q?jFXCNl6e4G7UisJHeEslC5U8YvbVO9aHWa+iaKs0AJkbcCks9t0JuqHTNT3d?=
 =?us-ascii?Q?Rn8xhT9cZft0taYv7pgWaCcTvf3QgciKg2BtaftwxheEOUscmqw05am/+H06?=
 =?us-ascii?Q?ujF4ALuxM7K6HgKzEYR8y0Mm7bGAmuSJVqT0HIh4hiFgLAXfSMUtOAeQCmQ4?=
 =?us-ascii?Q?xKGDA7et07QrqB4cXxTuhp4c5A5eNTL/GQQGERiHc8hks69nQ5ruwXJS+DiM?=
 =?us-ascii?Q?GuaWUxWYCKwi4HHshteWfa7mlA578C6Gn7JLkV0s+TN+R+ucUYQWwCaoyjlF?=
 =?us-ascii?Q?GQ0pF2ZQdCo73C/3WNqUpzBacbV27Z0K/ZHAyVx8liXEcrErwZN4NV1Ld1OH?=
 =?us-ascii?Q?cSrw8GMk/6j4ajUb2P0/kfAN0TPx1WVfXxRmpkc+XBcVnp3LFWoBnn17BHaN?=
 =?us-ascii?Q?L+eCZcFyt2C3Bm5wR1lk0Vmwy7zuSKxFGDXKnUUKf0KvUfqjM8kbxd41MSmv?=
 =?us-ascii?Q?H5Y/plganqqkEALaAusTIKrQbbGHXaSV4wJ/aURqmnPtbEgais+ygXPP/dpO?=
 =?us-ascii?Q?/GZb7odoFPhwwu3bDZ69fgbpOr8cHHIS2bByJ0t6sW4YSlz9XY6x2vZTtD4c?=
 =?us-ascii?Q?y3OXgQxZ72Zmdnu1dBzVkRheFnkOshN1CRghNFCIMlrE7i2RL8yUjjjQPj0V?=
 =?us-ascii?Q?4bSVPDHF0Jv9EQNbzGpC0F1BukD1c6Wvxid1RjDz59niBuCoixWykOWJFRsg?=
 =?us-ascii?Q?P1oins2LPkBOg1XgAqnrzs/9WJEB7guom+566Co4rRFEHtmgaOPN0qD+1wY4?=
 =?us-ascii?Q?nnuL9/OT4IIDzIGDfdaIULopEy71MJhNxbn+hXuB0VY4Dq3FeutJ+/dfeo3u?=
 =?us-ascii?Q?8aFkSGc/zWz800+mta2Q/eoF+QZaIPZY70U2RZuLQfIIKqctrGzpb5Uv9XC+?=
 =?us-ascii?Q?iJlv4FDDt6ouYgMnw/+k+u3pI/b6b29tjhKC1lL++0vuA68zeyH0/C7e9cRy?=
 =?us-ascii?Q?Ie+r2awn9AtpWQQONQVdHH1gb83VAuhiz4ZELyzO0E/GpWI6wTp4r7EEM3OM?=
 =?us-ascii?Q?a9jJS/2YV491dKFqep4+xUNDaMak2G1arX4FvFtUkl6MK8DQsk1NjSetSZzE?=
 =?us-ascii?Q?Qr/H+bsYXljxVL3nOByFg9BKh06QIggpGbrA1/BauMeRQboGn1rung5zp6hz?=
 =?us-ascii?Q?2+NfKKPxhPXzw6Wji7t4WndXBJil7bTnrtydoFAv9RdN7H9z4Tz00FJstuAa?=
 =?us-ascii?Q?ujxW2OAxXTs1c3hIH3JiFG69UaKU4ntfdpq8e8CeEtWb/VYH7eiPrMywUZkN?=
 =?us-ascii?Q?s4reE6ypdn1xDPkm1OdzupZcLSK0Bzc0HBfxmdJQXBGac7CBSIe2PdstZFRb?=
 =?us-ascii?Q?X8k4N6nvwNgWywlDz4z26v56zUGQL2WArQqpZ8y8Z9iyMQNkSbBobJJeoXYz?=
 =?us-ascii?Q?4KruBvQaxS2Is2hA5w/Zr69MqX8RZwd7660wfi3yvK1azrK6JDQKvApgqc7b?=
 =?us-ascii?Q?RHuFXlGwtI475Er9E6SC7FJUB+UmMbrBwXLJUBwJ+9xRCD2Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38396c44-9da5-4e9d-3806-08dec82600e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 01:57:48.2087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbIJFye6eDVldg0NCRvenyUjO28R1RsYgNurudCkNb73xwL2XES2jRplveg+l4AlaQXfR/ayYXQuNzwY8APwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11068

>=20
> From: Richard Zhu <hongxing.zhu@nxp.com>
>=20
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so creatin=
g the
> Root Port node and add the reset-gpios property in Root Port.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++----
>  arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
>  3 files changed, 32 insertions(+), 4 deletions(-)
> ---
> Changes in v3:
> - Move the regulator to Root Port node as well,=20

Hi Richard, please also add this info into the commit message.
Others look good to me.

Best Regards
Sherry
> since [2] had been
>   settled.
> - Collect Reviewed-by tag issued by Sherry.
>=20
> Changes in v2:
> - Delete reset-gpio properties in PCIe bridge node.
> - Correct the "reset-gpio" property to "reset-gpios".
>=20
> Since the patch-set [1] issued by Sherry had been landed. Add according
> changes on i.MX943 board too.
> [1] https://lkml.org/lkml/2026/6/1/1461
> [2] https://lore.kernel.org/imx/20260520084904.2424253-1-
> sherry.sun@oss.nxp.com/
>=20
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
> index 7cfd424689507..674410e541cba 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,15 @@ &pcie0 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie0_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
> +};
> +
>  &pcie0_ep {
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
>  	pinctrl-names =3D "default";
> @@ -1058,12 +1061,15 @@ &pcie1 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> -	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> -	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie1_port0 {
> +	reset-gpios =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
> +};
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

