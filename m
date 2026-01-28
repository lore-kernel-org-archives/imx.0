Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D817A2F6
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567347; cv=fail; b=ZNqoYWV/yZY1K8oYMM41pACeosKugaXExvXHxXgMlVmUyw/Q0skQcPigO7GgCtDE+FOlFPz0+RPl6GE1aEBf6otRVg40WeldHZmRO+h0zo06AlbNgoFVSxDilgvz/enet9eHKt1pYinkr2aHINcOVjmiYeW7swWZyE3W8lbIitM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567347; c=relaxed/simple;
	bh=Bb+3EpCmGQvY8QZ4gdoYb1lYOP4dhc3OdL71OEF0ZxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ci6r+Nf56r+R4sCrtbovdjp+7F4BXw11DbAAtiSZeqHksOv4yRlF0aNkUveZe2ORsDF5j8Fd7X6F1hcI2rE2Y7x3Od8JmexWKg5pqXUEdr3i3FHFkTh8icQLiKv+BzJm7SplWgPjQr/PoJtzq+e40SWkYZ7ttozQP2sBPAAOEjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mRfcvW+o; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mRfcvW+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltiWosH+kzhh7YoDgfGPDCuEpv/gPECqRbIWES+/KsD4VNA+Zi/yA11SCJVXYFoCkCXiSEvO+jdfXkMhcea/7jNPoniNlKAMIIz/zcx6KS7dAsFaFcgwndrdGbPF7eVWvkOS3kVWWJDDxPA0jC9/dj6sQCOxo2vP/SSit/kOpjosfAq0k6A0Sy+O1kv/eUW7HnujazAMo5dqutivDWXaZjcWdwfL2PkjRYf7xhX/r/4Jd12FTFTU+o6R+6jpW3dcsVozj7rnlFVFoTLMxmJytR6Hs9aZ1syV7zDyFYhwUuPP5EodjK/vMm1FpvW8tP/Gkvmv67vfvZlZpQTbl6X9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94xHD81YZAGf/HXdtDlXReKH75U2Eas87A/SvvcBSMQ=;
 b=Rt400Hg8h0T0aQwxxfaVTjje1VhtNtX2Oi/TYOcsA89uksckY6VBNSWTcNyeM5fdWC3AFjPwM9GevqtPQJZxkrgqvNr9C4Fy0SlxqI2WDd4fBkFcCHsbbdWZ+NgeuxUh/xqcDUIqOcOcSlQs2+LnttDSinBJcR8LEnBI+fTqRDUcOcSOYN9NOb0+by+/Zp8AFLToUiorDaPGxrKBQd0dnJbOlW5zpBOjFp7g6D0JX5stb48vZ6HqeMoQF4YpJvIznP9qd6lGTpcXkqQEswZ7lQ8jeR98VaVfkspl+YqIiNQkx7TyP16yX1NQ3q9Usxeef8lUyzIK0yjkLSZaFErU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94xHD81YZAGf/HXdtDlXReKH75U2Eas87A/SvvcBSMQ=;
 b=mRfcvW+o8n+SCLYeOWbXW7EmFWWvJ7x5NB17h2+Z5MTifn/jOg9p63v0EBgs+wxiFEklCSghzfBLPFOW9Bcaiy8gecP3niRiv+ZJzcMxtwH/V12PlzLdhBPx9zfvAQE3P0+32pOY60KT4jr3WLZT/HioM6arze/gcILqZ+msyY3zLzipKaxwzAj6DzLJaL0+v2DVIZYFkNZ0SMhKek3MhNvg9rBGAq7wn+ybQbIHCXG9PRxg97eSIU/06MOI4BUnxpgsLAo7tltaCU5lZJHLifTx9VDqiLyVRdBsJqOp398d0zNvnsy5u215FRfKekfneMUzMbUf32l+2X844LCGUw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9820.eurprd04.prod.outlook.com
 (2603:10a6:10:4c3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 02:29:01 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 02:29:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3 3/3] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Topic: [PATCH V3 3/3] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Index: AQHcj2hLqvBLl1/I3kCqDi58hno50LVmTjwAgACNomA=
Date: Wed, 28 Jan 2026 02:29:01 +0000
Message-ID:
 <VI0PR04MB12114E416E4A20D14983E68F69291A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
 <20260127083727.1839605-4-sherry.sun@nxp.com>
 <aXj8vuEnrr2ul6rg@lizhi-Precision-Tower-5810>
In-Reply-To: <aXj8vuEnrr2ul6rg@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DB9PR04MB9820:EE_
x-ms-office365-filtering-correlation-id: 4fb7e0fc-65b0-4759-7e4b-08de5e14ffcf
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yeq85GkAxjpmWNgl+1aUinKw2L/x2yHccxgrVxXBLZKwfikRQZV9VYAjFOVQ?=
 =?us-ascii?Q?uNEvmw8+nzRJYvICXv7fplidrtt36XZ0YmEbxQlWebkjhDj6y2sKHQQ2qeRv?=
 =?us-ascii?Q?53bT21Whv4Fm4T/3UGFkYRi5zhb4rMJC+IVj/TCefB5N10pCOiDY9sshho3n?=
 =?us-ascii?Q?mkjYWbZs1b3U+lNZhPnAGnFxexksGeo7LNQIsPlEuILWxXdf2mgp97APYkrt?=
 =?us-ascii?Q?nf2bEUVdb8+OgU0OsDq3f+SULeR+gQx33IsMMzLwHwwptx22KexIDXJQrX3E?=
 =?us-ascii?Q?lU0Fv+A67s8UrL7xD4qQ3oNN7NkUxP/3aasLO1HwOs2o+NVPvEU4iNIp3S5U?=
 =?us-ascii?Q?cM702dQFgf+7QnWDFQmKYTAsEWhrLNjPmCCRfFQ5NNdOh7D/5hK8qstqkIFM?=
 =?us-ascii?Q?JPF9qdLFrD3gQhM4eAeOVxkttwRyx7xNDVG0JFAjpYBD1sdmALKZo/eZvlZr?=
 =?us-ascii?Q?ut0qqJx/S2ylffNFIYL8MxUqC2SRpHLQQ+DzTILnJkVVR3j1VGyCkBmhhJml?=
 =?us-ascii?Q?JcaZ5KRr2cGDbIMWukeu2Z1FhsUWjYcRYP51xx75SCN1CsHyLue6sDMONcV1?=
 =?us-ascii?Q?vKWOyaRS1wKfUGpyyaUhimAgwH0bHU8o+CqUvN2KjjlpepVLxSGmevEDKV08?=
 =?us-ascii?Q?ywFqoTCypdOeQIBT9krTkSX6JssZ3qAWYyHI3lZPZC3GYn9WGYKjgS5ItPTy?=
 =?us-ascii?Q?IdxmPGmQH8y9vR6Qgg6GYlWjucPS8I5zjsaYzCulntx2yoHly0j1Ns0iKaEB?=
 =?us-ascii?Q?WY+spHLLGYLLn6y1K6ifHmC+OB2KnAGfZKGUnUanqyCnNMVJoBSLjsrRhPen?=
 =?us-ascii?Q?ZxhxdbT5oz6NfLmobOgqt1rznAxcFWt+PD2UUbdj7/FjG6ou58fEur59sKtJ?=
 =?us-ascii?Q?Ul30700VcP70+xvJVX20z0X2jVJE17ySYhiAWnfZ0ub0RzmSG9krfOYzvoBs?=
 =?us-ascii?Q?wM0Kg8dJmzlxJBWxxf3kr8PyotcKMh3h4NjiuNLmgNAOwQRAIoXN2JTjMaW/?=
 =?us-ascii?Q?0rqwO4cryvv0gXGGZNCS3XcFh/RrZf4ualK3fthGKWLDuwKgfbwT3g02NmuH?=
 =?us-ascii?Q?Dvzkng8LQ6hWObsksAPGxU3f1S42wsEbSjKJt8SoMNr9gjR3IkOQwEihokq7?=
 =?us-ascii?Q?7tk66htAgMcSHLJYwWLm4M8p0AGSx44stwa7fd4PsSV+kF6DPVwtfkMzt8ZC?=
 =?us-ascii?Q?KQKNf9TvgChrM9gbulPl03pIk2J/H1yd/ma8M7J1AQAjVOlRgdBBWTl5Vsyw?=
 =?us-ascii?Q?dwF0KwEosR1OetocYF1XFZYUMlPton9fq9HBJS+Eg6OJwiWJ7MA2elZ9ZTKN?=
 =?us-ascii?Q?taT9JCbF8lPtB56JuIXxfBZb6qeZcbJPJe/hhaaXRHtSf38IJiYwNSYBiCC8?=
 =?us-ascii?Q?9xbgmUKWeLrA57K9pGkqt3dD41q5Ss0UyHjuEXSdTXQr02FNZU1JACMU5zZm?=
 =?us-ascii?Q?bEcQJSHYLI870W6dh/g2DTNDZaKvntc7fgob8WWbu68THWm19+txskBTPqCx?=
 =?us-ascii?Q?vGMCO1CVtS6qFhizsbIISb+pAObjHB3GJd0OW91r6NIzQMDP4tPoaHhL909r?=
 =?us-ascii?Q?tCRfWkkM7M7bOisFdC3M4sc9ZNxOn+K009ssXXEHIsr78k1LPjFecNpy7CtF?=
 =?us-ascii?Q?4bBRoQIUmg8foliG2oRh4HY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K78/C4qNsPluQbmFfdDonpwKQKShcgMYBkrG04tjI6Ymu3suGT4f9kn8stq2?=
 =?us-ascii?Q?NtJm9VB/AfZVPMbcxWq0np6Pr+jMBcqUzY3bfqd+Nmktdh5bgDGx+QTZbXGE?=
 =?us-ascii?Q?fID7oUA+R7FOXvDaWzBLpwV2cB6Ebbb2J1sep+7x50tgF4p/MpUsxQYdGFxr?=
 =?us-ascii?Q?6UWnNbSJqoTxt78u3pQOPsQrwBRSUVuVTGuxSmvldy48W7slJ4CTacwXyQ2p?=
 =?us-ascii?Q?aH+TBQsyfTXmWyqyGPtiJkV9OE8Vip7Vq3rbBpqf/e41H+n4QQNuyNKP8Bd6?=
 =?us-ascii?Q?sAW083g0TmjsL6Eeq27acKLr3zHgsxlGNfwSxNPsfj1XuRGV5CACBqpOZhQn?=
 =?us-ascii?Q?pK/hbOYY9xq3rjuQYLitV9BZDW9H/3bJGEK4HQQTXo5hJv+HLUk8mS/PDWYp?=
 =?us-ascii?Q?wd3OUNZ1EGU2HnCl2Di/BIkRRCor78UdeQGARIDzpBkM7SnbT/VmGJec8zXV?=
 =?us-ascii?Q?hLTPt3V5lCBzMa4HOWlzXjicl2Tf9cwRN8IH+zhEss7i0DBx0QTd0+gSO8FM?=
 =?us-ascii?Q?abvXATr+eIQXKXDjIoSOwO5abf5pM/kieGuuTkTePN/N/4pLWQypDBfqUKJf?=
 =?us-ascii?Q?qb5xzr26eJJMN1VL5uczg4zmZBJmuPgGSkaTZjQytjKQ9GDz2+EMZLGPdzti?=
 =?us-ascii?Q?7+lv4RYFfYv1LuRjjuFFBjjhvJ0gNoQdmXpzk1DA/FV7BDIRNxXzDDLPUG0c?=
 =?us-ascii?Q?ePPVHrfCgjM2HuwvcrXJhcbLYS7bAdg3uMtPVD7OaOMKoin3HpmKorsVHgii?=
 =?us-ascii?Q?GhNZLrvQ34sXZ7S54ay5pbXP38izqvizT/2QA2FiwriWNSI6DQDxh947KEW/?=
 =?us-ascii?Q?3o/rITywEnDKhflyZehT7M8jV+SgCbxEj6RaBf4fDaWXX3zX1CgpFiaiOJpD?=
 =?us-ascii?Q?YyAkETDv7E/dSqrhSw8VCvXDzV8S7CB7g4um7XRA7jTUpBqkiOqFOin1AHOX?=
 =?us-ascii?Q?ATa6z96Qh0g3kaUDLM1Nz88ho1RrLhvXbvnR5ZHYFtM43w/XZz9m+Eh+W8xj?=
 =?us-ascii?Q?nV4NOUOG6NTca9QuU8dy/EjwTq2cI4YtUSj1DMQDYRGTjVQV/9+Sf6G9RDN/?=
 =?us-ascii?Q?UDEq0I7OGl+MrHuCTae6N4AdhAZTHQQ3DX+JkVW8Y5b7T8HUENpgWx2bWRjU?=
 =?us-ascii?Q?5HBlFfno+DUDSR5Me8yDYuqRHzPhjTC7gdSbb8bZ5yrRKgPMU1ZI9u8Xc2hE?=
 =?us-ascii?Q?+FiV6Tsks6Wg7CscBFT1ogGNuapi/9pnrEUCXDVrINFn59ROzC6D3oFL9Xz6?=
 =?us-ascii?Q?HetPq735d9zvu7igogwxmZst5J5UbsSpeTVNri0GF4XUkaRN3mBt1bdgyA16?=
 =?us-ascii?Q?uhvGdsXXtr3EjUt91mK53tkFD1qIs1M54L2SakhvSDj9GaUqoXhhEyRAjo2A?=
 =?us-ascii?Q?futQqugGhF9ByBcmfqKLARc6/gGd56UT5ew7oiJbDIr5KgniCImZEZNDxwfz?=
 =?us-ascii?Q?vcEmufxFWDQRyPhlmD9H1oNP1HIy6720MX1MJ4HwvWJL3DO0TbbbsFmSIGCk?=
 =?us-ascii?Q?Ay6i3aEdJYlwM1+C0Zzp8M3lax8A6nhFPLh1qHGR9j+7MraI3PUTuPSz8Htl?=
 =?us-ascii?Q?8pFJ6GImtk2rifzL8WnOt7Cg/8+LxeHWhSDq3IRrEtZubA8jt6G9HrfaHXKU?=
 =?us-ascii?Q?RDOco3xdOfMDFa1t4mhK2BHABESahXQ65O4EQa5f6CdC4Ju+ixgBMWWp6sGn?=
 =?us-ascii?Q?q4eF8KvkshijbQE25pzWK2EchBJc2/1oGHCSie4E4692ZmE1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb7e0fc-65b0-4759-7e4b-08de5e14ffcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 02:29:01.7314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FMbUw8Lw+obvlEYOiVZt6ILN7C/Dr/rocIsSq5YuuVUX88kkCPwrULDLyqYI+iPK2TowUHy81dO8DJU/Yop+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9820


> On Tue, Jan 27, 2026 at 04:37:27PM +0800, Sherry Sun wrote:
> > i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> > (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the
> > i.MX93
>=20
> I think most important is that need common part for SIP.
>=20
> Create one imx93w-sip.dtsi for wireless part. So other vendor can reuse i=
t if
> they use this sip part.

Hi Frank,
Okay, thanks for the suggestion. Will add imx93w-sip.dtsi (or name it imx93=
w.dtsi) in V4.

Best Regards
Sherry
>=20
> Frank
>=20
> > Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some
> > minor functional and pin connection differences. Reuse the new
> > imx93-evk-common.dtsi and add the board-specific changes here.
> >
> > Here are the detailed differences between i.MX93 Wireless EVK and
> > i.MX93
> > 11x11 EVK board.
> >
> > Function differences:
> > Function	i.MX93W EVK			i.MX93 EVK
> > WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> > MQS		N				Y
> > PDM MIC		N				Y
> > M.2		N				Y
> > RPi 40-pin HDR	Limited support(pin conflict) 	Y
> >
> > Pin connection differences:
> > Function  Signal name	i.MX93W EVK		i.MX93 EVK
> > WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08
> (spi3.PCS0)
> > 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> > 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> > 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> > 	  SPI_INT	CCM_CLKO1		on-board IO expander
> > 	  NB_WAKE_IN	PDM_CLK			on-module IO
> expander
> > 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO
> expander
> > 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO
> expander
> > 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> > 	  PDn		GPIO_IO29		on-module IO expander
> > 	  NB_WAKE_OUT	GPIO_IO14		on-board IO
> expander
> > 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> > I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> > 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |  1 +
> >  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 52
> > ++++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 700bab4d3e60..d0ea746c59b8 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-
> i3c.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx93w-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-segin.dtb diff --git
> > a/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > new file mode 100644
> > index 000000000000..ea76d5df84a1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > @@ -0,0 +1,52 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx93-evk-common.dtsi"
> > +
> > +/ {
> > +	model =3D "NXP i.MX93W EVK board";
> > +	compatible =3D "fsl,imx93-wireless-evk", "fsl,imx93"; };
> > +
> > +&reg_usdhc3_vmmc {
> > +	pinctrl-0 =3D <&pinctrl_reg_usdhc3_vmmc>;
> > +	pinctrl-names =3D "default";
> > +	gpio =3D <&gpio2 29 GPIO_ACTIVE_HIGH>; };
> > +
> > +&usdhc3_pwrseq {
> > +	pinctrl-0 =3D <&pinctrl_usdhc3_pwrseq>;
> > +	pinctrl-names =3D "default";
> > +	reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>; };
> > +
> > +&iomuxc {
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_GPIO_IO00__LPI2C3_SDA
> 	0x40000b9e
> > +			MX93_PAD_GPIO_IO01__LPI2C3_SCL
> 	0x40000b9e
> > +		>;
> > +	};
> > +
> > +	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_GPIO_IO29__GPIO2_IO29
> 	0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10
> 	0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_GPIO_IO15__GPIO2_IO15
> 	0x31e
> > +		>;
> > +	};
> > +};
> > --
> > 2.37.1
> >
