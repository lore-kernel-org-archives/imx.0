Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A033909A4
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425141; cv=fail; b=PRlxuiuoYg1W3ZM8plfWh2S9DlD7GxhOCj2xt3LY2qykW0YvoRyk1HBp8WSMJQRRjoCOc22/lEiEBHJutXLsIlv3boFD/HaujSdSAcGWZPqKNXa+NPdTu+aVLbELcYg3WUF4oV9tV3r19Ah72W6t751K7IuVGtGk6qYaBshSZsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425141; c=relaxed/simple;
	bh=E7APH3bBmWel/8GvHtiVgVIghtJUr4f0GooUVt13EXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eyIah4Nyvp5NA2fVEr1rRsf1Fh8qxmwMrT94N0WiCL/CTFW4fCyd+uokvSw359jEtB2umFqY703KZ2/ubwQUPnBbwyzbKI82RJO7aG/+J5s+qaEmXwLGnYXV7Pr31G7bU1yLpoh+rQ9hva04T3ZBZWtdxLF/J1PN9ZVM85U+6KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DmkOOuN9; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DmkOOuN9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzNR443jg/AhbEGxxD2a0Lp+gBHHSyAU6/JVanG/o0IYXagIsVrCyVWv7koHckJpvtYsayBi/ekrVeTw95LNfUV3X2PQZ8C9enn8L8c4vpHminAh1C5jta9nAxPczi/F0t/BfbqUK6eDlybrDnpitIy7WMts1mJqorWmmZu2PeCCP2YYYQis5pJgtQbKls3WA6Lvwf45T3JJAFWRebmJKpz1xp97XiIy15pFvcrwMx13OmyJlFX89FUVvU5ANs4oR63TzqtbfN+c5eB2KcJEpqRmcCAXPD5bn/jAq+UO8wYybI/FJe/3kJ+Z+8Xb3VQMP8ujO/IzbcPZaL0Wzd2d9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhP+ywTh4vCBzdbbO1sQkHCZ7/5t8ldfXrr0dIqHKl4=;
 b=oE8FAVFdKkJixn/RH47Tch09uyVv2ysMPeG82nIEMy9uO/zloXK8tPY1wPLVOf/8jUkzStLac4KYXbXzFBMoBGkqoCkCxWAbltiKokqKO3M6YSbKRVd8NM0RtTB7o2Zn4+JOx8hiuMuLJr2++n4sc433ezt75NVbUwXNFkeJuskYcPCQ15FCKR758BN66Rm1/pUze611Er8Z+NWlu+OK6kxr72q9QdBSa6kY2x9xOT8jW7MLG8k8VxV3KqCgPGijm0mhdGkT8p4Si431pW5KfU7C8RCdHgcTu7FeYxeerRNGF+p9gjSHwgyOIzyvlwshfOlDQiYnw7MRB1Dq799AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhP+ywTh4vCBzdbbO1sQkHCZ7/5t8ldfXrr0dIqHKl4=;
 b=DmkOOuN9jzeMzOqiFotvp7mET1T6kBFXWJeElJNWVn7L8by9nBjYe0pKoR963HBJ17U4WutcCFE2ByXcsWnK53iHv+N+ABWSaVukNxQ/XM3tDbPOy4yILBCpo39+QoZAt6jwuizNFlPCHP4Hj7tU1B6RAbX1G4cmO/e7iu63tVDdSF4ui2K10CLqlnEPrnf61nySXXTIrBzQUqrhzUHEQWJFLFmro4pAEDnKFvn+ZULE67eiFHaLN+2H0Pe9C/TC7CwHpFQl339pORzwHzpDtGpE9RGHIkkGi6aaOhqZ1xbx/JlzZ6u5VikmKQXMS0iXlagkBWKlMddYTwUPkFYgbw==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV4PR04MB11942.eurprd04.prod.outlook.com (2603:10a6:150:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 07:52:10 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 07:52:10 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Topic: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Index: AQHcsFgtipls7Q9Tf0ij/80NuUVIBrWn34OAgBcWzSA=
Date: Wed, 25 Mar 2026 07:52:10 +0000
Message-ID:
 <AM9PR04MB8353EC1BDFB60DDA2137B4B4E349A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
 <abA0W82MyPtB2iVj@lizhi-Precision-Tower-5810>
In-Reply-To: <abA0W82MyPtB2iVj@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV4PR04MB11942:EE_
x-ms-office365-filtering-correlation-id: c09a91d1-019a-4ded-46b3-08de8a436bbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 uoNJMooHSzgfkfIKqFMNn085qJj4AF/ZfmVUfurgm7CXP8Sfwuo/sodZIqw3Le1VQKRHpP8W2y+EXRvvmhuIzUQ2g1Xh0CLX1XzQaJo+fjsNXhDlQoGjSX6kwLpIjQyIyPduvgAk6nHhJoyuyfCpjC5ShuPyO6PdmAVaAegKwl/k6x8xYjGJ5HpTicTCUmoY0R//dSFfbIINPp0RjdqZM4DH9l3k8bbfYPrNH0E8n5vrOuSY36kKUNwDSeQlcjhSDqM5VsXSpamqIigd8hpN38cEuj/sTG/CXvKwAp7iPKVqmZORiOWAH+XevtvxdBLAIVAXvSyTmbctgE0MdKfLEC7Fjz1UqvAA7SfClbGRkox2alt8kRpcYr8AUPenwLS3ytVIHg9Z4T2cvkMJO12dIm0V8BjWqrB7IEeFIR1JqfJwtvyxqX8SGuNj+LdMXhv70NuRxmyBMeAqSO7jJ7FUZtyy1+p7jZpW7Gz771WT9lIOjCkewzIeh2CMnmpE5wog/TYVnPkm2fF/UgZLPTyXRiB6DI4MZa96jNV4UOYKuikqvE998wiKf7AXSmziaMT9x1ecjgoiGg89RrrbhlLBqWqClmZXfDcMixhrwUsZecvUqUi1ElKM5EnmlEjtPJppE8cMp/wf22oXHS7CwsZWZ1qQTdHhPN3ClKBpDA/CPMRwf3yKRZNjEAjKfd9tTOT6PuVve+BSbNPdskyS4pienLfkfPSrgBKJnKBC/taftIbrZrMFv/IZDGPV8JIcaJhRQi6RqWFwXux7eDd88FBuDsQf0jZxyb2TiSoQUF4AXGs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jT5hRMwpQxgoQ0U5PZKiRXKgiH0dQ8U+6gQ+I2vNjDkZILtmox/4p2LkvoD3?=
 =?us-ascii?Q?Y047kjVLOEs5KXEKVJrFyvBQI9haM3JIAh+qZ5yQZE30mx++4M9+hWau7sgv?=
 =?us-ascii?Q?NPoL16mnliD+eg2uSmYrnneUjmZVHOO5OeRiLGFPSB8I5OWIdj026Q8SuVZb?=
 =?us-ascii?Q?8Axu6q7Q28iGfWXFqvGsuGOlFncDlRoNU1ZW4S2GuyUva9vuhjD3VVzLdV/h?=
 =?us-ascii?Q?EpI5fPDCI4rkI6rwVGBqOYMou8P9TxOSRPRZi3isiz93GapvFXmjWkm3fFkk?=
 =?us-ascii?Q?m1z0dPVP7CAuiiySzmOKd/uaXrC3i5VNSKOAm/Bru5L034A3+hPpv9+Mryg7?=
 =?us-ascii?Q?QZ0tOoOC0b6nOrOPEM2/IFxYvXKDML/MQS6ZmMLHS8I+VT5dJNy27aZ0uJHg?=
 =?us-ascii?Q?D8QHqbFVDhPOXQBMtNxW3OmtYYLV9cbBgpENK+3wf1Bv4mR3F9zEsBKeFy9V?=
 =?us-ascii?Q?ogd9hDNENnBUIKpLbPxUzyguDoVr8RQwiKoYTMdyE8yhFOVqkUhMzhfHkSns?=
 =?us-ascii?Q?Zm8qvwo/escvrfkUgZNP8YG79XgYEK73jKgQD7A6eIRxgYuoheqoJG2esVht?=
 =?us-ascii?Q?tH78pI6Q/w7bnf0LMgH2U+Z3KcWAmAYe7Xmk/DroVXJZMNsMPp1suOFwT3QW?=
 =?us-ascii?Q?gdpm1OuOMv7Qhd33rN8nYzFFzaPVPsHDDe6vlhdz00ivmixQLedK25mnaPfY?=
 =?us-ascii?Q?1WwYuVi+pZ/yWAbAiz6qwR7rXQxZlDUr1xS5nDeyNLY9qlhAMkoduhBp8VdT?=
 =?us-ascii?Q?lNLBdCq7v/+TpVhoYQ8VwOe/Lcz82hAhnTXkiP+c4+lpAzwLI8lVoeR8HPa2?=
 =?us-ascii?Q?s4LkWFTKQc1IPx0I1fyA+kg7+YucZIryFdoV63fjn7davnjPeP79Omc+ucIv?=
 =?us-ascii?Q?RDDfPNG+oAOzj3q6nDpXbwGsru/DLJr5ki/z64TdDs4DpuBw++VFtEm7A6Q/?=
 =?us-ascii?Q?46eflkMbEs1UQrG8G0c/5rlJLbSM2tm2Cc9h2zEVonFtnZ5Xv9tdPeO6KuCF?=
 =?us-ascii?Q?wjHr1cM8TQxhN1vdx39YnDbKaYhBG/pfVMPUhw7/siOZBdBq13t8BBMznUbv?=
 =?us-ascii?Q?L8dlZv/eAo0ZxuIoL85JykzM4F0qBMc58fShM3yqdlMV0QAUuA00DAVguQJR?=
 =?us-ascii?Q?fhieNOnEjJ0HmkuWEnTjjQkmMaPsb35JtpD5ibCCrcsHB4yvWlielFTCwcEt?=
 =?us-ascii?Q?JYyK/AcMZq+ytUq/7T/86O9B2tEtqx8NqqZjDTZWGpNTdcJeas8nyU9PGcKi?=
 =?us-ascii?Q?CzW/aJVthAf5eTFWBL0grKBvx8RGj1jIyMCpH0clyI9abf5SixDXy+/AaJaC?=
 =?us-ascii?Q?a5vZ4w40B/Xbfo48Lo+C+ENkVUbrGV/syT8EUW0eZLMOHQX3RMwwv7+HbOOP?=
 =?us-ascii?Q?2Ykjv37Wova4G1cfqM8HeS75UoyBFt3HrCdHMwZ9cRlMBLpnHyJe0DiatLfC?=
 =?us-ascii?Q?g9sNkdeEzioNJbFmp+TO1OBXjZcSPKK0FGzjhEb+uJ63LHOUT+mdJvUGf87u?=
 =?us-ascii?Q?1Lif1GMm37I5zUqY44wYtNqMlqZ1dEpHTnz17MPCkLK5R4/uJhKTdEpmLkgd?=
 =?us-ascii?Q?f+fm36sfgKf9K+26nR5VDAjVZ2W0nv23WArnu1hEqG533MKT53/hVkwzdlA5?=
 =?us-ascii?Q?JL2D7ByhIesTmYJMAcD5yme4isKZO72+7lkHbGLJOnWoeiTpgZFzspHUHqFy?=
 =?us-ascii?Q?yekoE45u292fhsBkYT/0F2vB2mgd5QiymTXsIU/FzdkI7ej3?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09a91d1-019a-4ded-46b3-08de8a436bbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 07:52:10.7534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOUljzeBzDMvfo75Z2sAuqx19T/PsG8kXwoRMIfORfAXQuQYZhHDFvyzo/GyyIrtIIArWVt07ZqPs0AGlDoqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11942

> > The imx-card machine driver originally supported only codecs operating
> > in i2s or dsp_b formats. This machine driver can support CS42448 codec
> > and this codec typically uses dsp_a for its TDM interface. Therefore,
> > dsp_a format support is required for describing such sound cards in DT.
>=20
> binding is descript hardware not driver. s/driver/device.
>=20
> Frank

Yes. I realize the commit message is incorrect. The intention is to
describe the codec hardware requirement. I will fix it.

Regards,=20
Chancel Liu

> >
> > Update DT bindings to include "dsp_a" in the list of supported DAI
> > formats.
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > index 3c75c8c78987..5c08289346c0 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > @@ -36,6 +36,7 @@ patternProperties:
> >          items:
> >            enum:
> >              - i2s
> > +            - dsp_a
> >              - dsp_b
> >
> >        dai-tdm-slot-num:
> > --
> > 2.50.1
> >
