Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED331A06C
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134759; cv=fail; b=N//KDTOQXu1pK0ZvhIwakifECAwxPBPlezy2xaoBrZ+Yn4T1+05kp0grPhAlbkwk+tDaYgVM6RQY/RwaCpqo5wPMkY2dU8a8CX1hjM2jQCvlXKuY27NGNOK/Gx0K/y8mONFsPKznVuqYINP2DxEFH5OTfkCDPBtiYP3Xx28X+5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134759; c=relaxed/simple;
	bh=z3OGWgELPszyNzQS/PNUIW1761a3bWfjwHzu/h+dRe0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I5SrwIasDEI963bpfqFJxCQBJmPoopInWVvCh5/m8oUDDmhu9a/mkW+n3/ZcOShHQ0P4EyunapuSfTjrA3x8QShWtmaxY6jRJoGUyBAuU0AkPGMKjGDowODiXDeR4lLtShglIHRv9U1HmxewFKT3v0WfdOtDoTv6ayaXuf7QCzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WTPiphay; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WTPiphay"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywMDwjpXTDABQmH5NY3inur2GepZee5070qvktvNUy0gZep48BatQxiP6XkhNKdVfzBarA61ztqsiBgXNi8+l2Hj2pU3yL8A/jDqNFhIwsbM731NVAMRexJ1slMrCVBYAyVUYAa0XPAeVdXyQqjiuWb9jsLBLIxqFllPLwWVniLe/YQH9D88gY4URVEJZi36Jz6Z4DW7xWJmL6H31CMAccllPGnlDIZkCvZUevKZVJYHPkIR82xN8cZUAAlLbACzT7DaOZWg2CAqxLbsJZjzWoM+6dOKOdKGYBPb/DiyMtFKZmERKO4wKp9LWGqST9idKGG/rjYYxM2LcFqy+NlW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsFZx3bfxXg8ShXMYtcbUQOwqOnAxp0AdK8J6gLLROA=;
 b=hyrdof6GFf8vQ13WOO4WF+C5LfAXTPAvNPOaOfTcycpoqZ8lAM3nFsH0Ewmr78GJ0OQD/1UNqWQuWuYXIBJdlFkqXPtc74GwfWQwgZuNhJzkfekwfRftA4xlSbYcgLYS9Iitki6N1laTNXUBkJYDseJ/dwMZmOBQtIVBm+oyYXMBn3F1lJf8rIxUZ80ceDumJ/Ygdjbu0HOD+8lMPCIpJtQfIpmn53oA9ijfCt5FFVu2JhY1JzddOFXxCVCXv76p+LIAYAbL1ngb1WHnUJps8PP+y9Gtb3acFtaq6SgyLfYLYMTm6Tywl6RZuDW+JM4HxuhDl0RgpLMR2hWNzjtNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsFZx3bfxXg8ShXMYtcbUQOwqOnAxp0AdK8J6gLLROA=;
 b=WTPiphayoaDCSaKFsBhWEqyIIe1yg63Ax3H5zoPw9aBwXuXI4zVjQX/4szF7d5fD6Mv6jzmuysZLK1/6LDUFMLx+A3aIEPq+q3iDEKE1IDO5vJcaKq0zhqruoj4TtxY4a2wpVAbyb+cloAlDsrLnOjIOvaydtLAtCkoRC4PLaInBRad/as1O0YQgu8biomGojpOBk586YhpEDwWz8q464vbEBvCov7nLVxos7Whz3DTyw85eFSqe0mI2qJy7dOS443btAHtyvM7XfNiVpMBCldd6uiibLH1lZku/i4kw2YMd4YOAMocL6/m3Qdre2vahpHBPoSq80eqp4NI8rNp22A==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS1PR04MB9408.eurprd04.prod.outlook.com
 (2603:10a6:20b:4d8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:19:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:19:13 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Hongxing
 Zhu <hongxing.zhu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to
 enable PCIe on M.2 connector
Thread-Topic: [PATCH V3 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to
 enable PCIe on M.2 connector
Thread-Index: AQHcvDGyzMMz/N9whkmi6YJpOEE5P7X/5hGAgAJ0NhA=
Date: Thu, 7 May 2026 06:19:13 +0000
Message-ID:
 <VI0PR04MB12114E0CEBECC811C11C3E5C2923C2@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260325083201.2637520-1-sherry.sun@nxp.com>
 <20260325083201.2637520-4-sherry.sun@nxp.com>
 <afofv3GjEpS67ayb@lizhi-Precision-Tower-5810>
In-Reply-To: <afofv3GjEpS67ayb@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS1PR04MB9408:EE_
x-ms-office365-filtering-correlation-id: 4229fee3-aa84-4771-60cd-08deac008ee1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|7416014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 BJg/nk4U/h+RMZKr5sOg0ecwzXr8mocmxgKToiXo5yLwaVSVJrWoL0RzHB5i+SVWT8b7sQUo23zHi5RmmomOiofqX1OrhmYTRwDUYz3KvG/7sJnzS6bMotf0pCOvuDLR3LIfrCKjOGn6dHNpXYJEFW97vKK3PlAZ6gkLXTcj9yH7liy8CZaoLArOl50AmTPQUlTlaalPGT3HvsSinXb0FJ7VghpLI8P+RY3LJZwDnKPFdPeCq5aHC6J1MOqvCBbCa0yzuJCiAhmOPOAoA+SGEIWKed35He34f3cnMNgC+inFct0wHoRAvy2Nf3/rZyYx/5j1DOiFjiNTuHDmJ5PI7jM3wPUL+zokxTOv4VtwpgCu6F23lTCDP93MHh4Jaz190Q0B62ywHjziWo0lz2dovBJheaw5UfSPcCYA6lI78X4SPr0uUIj7Ix5hYIGC2F9l+MC/RPEYrvn2FFhW3M7DN+EQKay2bmDqZZYr5OXhgCUHuam4LcGAGsRAq09oS/NKjjKgzTZa3FYweeU888wC/CmahiFPJ7zCYNnia1bhHITVJvdgelFlsUQRgDrB0KFStrcpbpaNOKuwwXBPCsp1lf1RbmtjoWRIJZVt6MwXo/M5X/hnDRfZc+1q7GeiCT91A7f69ePYqRf7GbOFXqV9fQGfHFSOs/eQ9Q7I2juyGlZYe3jNU2n5Bqbe27VWmPknBEzrlvb4sxQuB6r1M+eRTbPqdbpk/VVRehEEnsV6y+2dJtlx+iyXglnwHvWYambe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OY9Rrc1nErVte9pI5wvXFv9wx+dfsiFtkh7uoQY8gmSSgssH86Z85ZYexhsg?=
 =?us-ascii?Q?HUFu/ud+8NGFeSh0Jl0a/6J3V/apicnKS+TG/1ntap4yPKvwZutje6NpOZj8?=
 =?us-ascii?Q?0MCO37TKxG3TWyJ94YiHFasjLD0GiO+/UW0bo8B7p4iaqDBnJPxDRryYZSyL?=
 =?us-ascii?Q?k3RgCCY9YqfwGjWVBX5Paf7N7BFaMsBnrWPCWy4liKHmSK/TpWYLlKtVmZ1p?=
 =?us-ascii?Q?VsgTU6fiHUQ1BgWBwslhvEKjDQSsAiNFqDIRzJxeyXsMOIE+zNG5qzrBfii+?=
 =?us-ascii?Q?EVaTBjKgOsSe9uon4LGNdkkGS/QeAoG1qOCp19t9//6gUxXUtPs2Z5/gxGqA?=
 =?us-ascii?Q?lu/K8dP4NyK53d906/2llM/Ox05/A31mpwH5bV6xdMwBI2w17uSD7DdwC9Nh?=
 =?us-ascii?Q?YYU8p0g9YjyEBDUaiDwqoj58HkdyMFUNJCVIXwguukVwDA7onQ0PqPPu6+19?=
 =?us-ascii?Q?LYE3GrqgaVVUsydCYDDJ5GRDOcrDn4OFPjmD7Rvx7Igcfw/zKkWUaGQrJlmq?=
 =?us-ascii?Q?rgDTjfqigvmfXU/DPpLI7LSle1Vd6WffUd2BfwfZ5S9pDav2M9DpMB1tI7uB?=
 =?us-ascii?Q?ORsQnrd702pgHEi2Z8c2T/2tDwgtBjzKdeki3N9ufCF/l4iaKlVX/ze/Yvjy?=
 =?us-ascii?Q?gBL8m+RzI3Kjm7hp9zueWCrCmn/CrKGLCRI2M9vBf9T2mO/ZkFULB8WvPcU0?=
 =?us-ascii?Q?p5LaLRd3LC/buhLQmuJRBYmDml/vFhUah9Xq69P7T9Pf1INcPIkbflEk0oal?=
 =?us-ascii?Q?OK9vsm1dqmqa5rMQ87s+FALqmHAWik3ydNSq/GkuSG50TXR2vkQap5cMpUA3?=
 =?us-ascii?Q?5Jq+4Fi4f8p4RKJFoe718+R4BDEHJbe1bdH6QQVo1iB6bguLefIIBo0yC/lx?=
 =?us-ascii?Q?g7RdHwYna3NOwqDTdkhwRC39UbiEIUJqH/Gqs8d+cu3jM7qPVF3oCVnEcFjZ?=
 =?us-ascii?Q?tauOoO02BzHmiCkNJ3lnJzPXlH3BlVcf+BU64nzQPgCZRF0JZgL+1+/PxyuW?=
 =?us-ascii?Q?XA+uFFjs+OyYJnQWjp3qOSFhd7tshnJt3PqIYPCladAQNh9PfpDD/c1LlWne?=
 =?us-ascii?Q?gajlls9YptujJwvgkFHdgEiIUf64Jkljp936XScbT4vT8RJTogKcxkNca5T/?=
 =?us-ascii?Q?0KlNJZ4m63WYDDtAyiYfh1mM9xsXB+IxbpBa35FgrTuHo53XKSEj0t9sTpTW?=
 =?us-ascii?Q?tYrjk8Kwdu4NC8NhsjSPlS8ApUIU3a4eZIosyk7OZaKOfyC5bBYCztCXVaPo?=
 =?us-ascii?Q?9jz3vU1t9SGtMP4debSBZiRTukAnMT3ZdMaq0ZMYdTAGn26sM1JbZMC5dQwt?=
 =?us-ascii?Q?kxmCjlN27zBfESOz2fj9IPYvsAVcqC+7INWm4+tg5DNzodnFA+D3ZfcLcFc8?=
 =?us-ascii?Q?BejVuLwzH79Ft1/+SjwYBCk35c5ytQD8ydckSKxz4KvlKjjTBWxZE1q6qWyh?=
 =?us-ascii?Q?E2sBXfuZ1kpEe+SHqGS5MFgol6bXwrTRDmQFl1kioKPHjr/X/cPq8eqX+jhV?=
 =?us-ascii?Q?uozVdeNC2SfCPgIC7H84maZdAivbgcbcYnE7iexjvibC1elx6vnSibpg9v5W?=
 =?us-ascii?Q?qX43knlzqq23cwfym3aMQuP6u1s4YaGdWjNmdNI3aWAxbKvdXINpsG8mXA7e?=
 =?us-ascii?Q?TiZ9Lg/XKF9JRZMn+V7JFxdalbHKVhx4B4u0Gxvp81pPc4036TsJ+mDWQsWC?=
 =?us-ascii?Q?EyuLhJudkt5yQvu8+M5EN7aCmM2sK3RJ0RW2W82CD3vfXnoy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4229fee3-aa84-4771-60cd-08deac008ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 06:19:13.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxanitoTuAEr4nLVuLacCtf4C3yeeuVgj9frdGiAHOLwDblEMUeaj8BmUrKYm13kSkc+Jsf6vXKM5l+fPAtQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408

> Subject: Re: [PATCH V3 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso
> to enable PCIe on M.2 connector
>=20
> On Wed, Mar 25, 2026 at 04:32:01PM +0800, Sherry Sun wrote:
> > Some i.MX boards (i.MX8MP EVK and i.MX95-15x15 EVK) have M.2
> > connectors that are physically wired to both USDHC and PCIe
> > controllers. The default device tree enables USDHC for SDIO WiFi
> > modules and disables PCIe to avoid regulator conflicts.
> >
> > Add a common imx-m2-pcie.dtso that can be applied to enable PCIe and
> > disable USDHC when a PCIe module is installed in the M.2 connector.
> >
> > This creates the following DTB files:
> > - imx8mp-evk-pcie.dtb: i.MX8MP EVK with PCIe enabled
> > - imx95-15x15-evk-pcie.dtb: i.MX95-15x15 EVK with PCIe enabled
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
>=20
> Please rebase it to imx/dt64, and prefer use b4 or provide base-commit
> information. ref https://people.kernel.org/monsieuricon/all-patches-must-
> include-base-commit-info

Will do in next version, thanks!

Best Regards
Sherry

>=20
> Frank
>=20
> >  arch/arm64/boot/dts/freescale/Makefile         |  9 +++++++--
> >  arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso | 15 +++++++++++++++
> >  2 files changed, 22 insertions(+), 2 deletions(-)  create mode 100644
> > arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 155213c45319..1f542324b4fc 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs +=3D
> > imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
> >  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
> >  imx8mp-evk-mx8-dlvds-lcd1-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-mx8-dlvds-lcd1.dtbo -imx8mp-evk-pcie-ep-dtbs +=3D
> > imx8mp-evk.dtb imx-pcie0-ep.dtbo
> > +imx8mp-evk-pcie-dtbs +=3D imx8mp-evk.dtb imx-m2-pcie.dtbo
> > +imx8mp-evk-pcie-ep-dtbs +=3D imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-mx8-dlvds-lcd1.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie-ep.dtb
> >
> >  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D
> > imx8mp-tqma8mpql-mba8mpxl.dtb
> > imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> > @@ -481,7 +483,10 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk-
> sof.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-toradex-smarc-dev.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596sa-mb-smarc-2.dtb
> >
> > -imx95-15x15-evk-pcie0-ep-dtbs =3D imx95-15x15-evk.dtb imx-pcie0-ep.dtb=
o
> > +imx95-15x15-evk-pcie-dtbs +=3D imx95-15x15-evk.dtb imx-m2-pcie.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk-pcie.dtb
> > +
> > +imx95-15x15-evk-pcie0-ep-dtbs =3D imx95-15x15-evk-pcie.dtb
> > +imx-pcie0-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk-pcie0-ep.dtb
> > imx95-19x19-evk-pcie0-ep-dtbs +=3D imx95-19x19-evk.dtb imx-pcie0-ep.dtb=
o
> > imx95-19x19-evk-pcie1-ep-dtbs +=3D imx95-19x19-evk.dtb imx-pcie1-ep.dtb=
o
> > diff --git a/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
> > b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
> > new file mode 100644
> > index 000000000000..1930de058a08
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
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
> > +	status =3D "okay";
> > +};
> > +
> > +&m2_usdhc {
> > +	status =3D "disabled";
> > +};
> > --
> > 2.37.1
> >
