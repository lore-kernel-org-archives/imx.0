Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579D407560
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768977714; cv=fail; b=DjRiJSylz+nVRK0MrCF/YldUzEOvRDKx2CSax6ijewGuUo+HlAukVnoXo8yt/Gbh9ClG2Q7MeXgvdMIdFFvpq+6oQAJN/6wgGbUWLPsRQdMvw+490nYnbkoNqClEQagyxIGy3aCJrcmjcc1SteIgBNDXO2VAO79z8+bPzUEf2pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768977714; c=relaxed/simple;
	bh=a+K4B5AaT/ILLo1L862lugKry7v5dwNnqbkgmwBCHys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LigOkUEY0OvByNWymkqxe9NctekizQzdcGFxzsDU29wxVl6tJeAOpYugs0Jz6Z/UoJvDTwT7BbmmoJdPpYlirUvgFDEV1J9aDdoTXSBa/1rqB9ACXWYZEZZAwmjD2cBPWF+1icQlkMk6vQmK5rGiNLULmABzItILUVFzYhW32y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cT+27n5F; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cT+27n5F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5xuDp2whIe7nd71KKlUOrRetmMU3+Bso1URUatiZo7clvMCdUjmDRV9IT3d9wXzRo4wFVzkwfte39yGJdovdTQNyIYj+KjMHtywEOJuaFF5zqxPT/I7ODpaq+nhECsprbWJdGj+BJJ9YbmBlKqmIqzO+fjhAs9wsN5us6R1k+TIlrpqpMltdJzEXUKiquIvqh2TpqU+X0Dn1e1l4yn2mqJNnmwXNxUyaviTbQfMvvMksX1blYCQvonS+b8cCASDy3Yx9SXXdTpoNNePVzpJIntQOCb0sOchUqxJ0IQbWgxh8Y9ZiFnicNj0nXFWNFKaofa2otQ4P1na/q4nUZ5LqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkEzEu8QWZ+x6mQ/IDGkOFpYyEwo2iJFFEHeXso0paU=;
 b=ILVhArLrstFKMS+SMfM6EpG/soiv4aeVKcYnP0W/KUJRoH/hMDm1KU47xMUyrhJcTX4/tEux1EzLbEgeV3yS8YBj0US8JoG6sRw0ZdapTPkxwE59hjN6vGzhMkcn3QgKv5IM5lw8PZds7rk+J+4g68zuso90uyUxtjpzZJkPYm4EoJ9/eCE5bVVpltMg7mvSZluaW9He7eSHipEP1laOVVnwhOrFhnwAyYs3APHIa9rx3YQRXdCmyQAIkvQaiDKko424bWBRirNogaMsOt6KDEeyST3R0d2kKtxJfrLpELH1QaqbKWlhGnOW1oBe50tHZ+kMaa/sjYCRleg5GSV0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkEzEu8QWZ+x6mQ/IDGkOFpYyEwo2iJFFEHeXso0paU=;
 b=cT+27n5FeseaAnWKQ674A+7iHoKsUufACzmR6gpfHGBNlgDqGKb+XEhIvVqgbNb4od9AIKUIO+MgOyYbzqx3bZ2mLrZ+Ur2m2WkMpKtcr9v6Q3ynWm8carTs9JvzRSQxDc01yQG/9mnrWqJesJMyppNFYki2z4JHL7KYyqv/FgoRUU7oolnTF8qQ+atPVyRVq8BhRoizjthy6a1GXca7SFKUPd2lNUpAjtLLAqnNat954MO7u/6TspEUGPIRChZk8ZuxoXq8VDHmS12yjxO4R03NVDBvwZsWbP1Uv0+dm6F+3JAa5aCq9dg/19t8j4WXO8p6YL2re4D+l9TJf+IquQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB12064.eurprd04.prod.outlook.com
 (2603:10a6:10:63f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:41:48 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:41:48 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta
	<daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 2/2] arch: arm64: imx93-wevk: Add i.MX93W EVK board
 support
Thread-Topic: [PATCH 2/2] arch: arm64: imx93-wevk: Add i.MX93W EVK board
 support
Thread-Index: AQHcifdR8XyhCg3Q40mtqI5OlCpiM7VbQhMAgACzfqA=
Date: Wed, 21 Jan 2026 06:41:48 +0000
Message-ID:
 <VI0PR04MB121141B628431B6CAAC3A029F9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-3-sherry.sun@nxp.com>
 <aW+vLiN30r6mZxp4@lizhi-Precision-Tower-5810>
In-Reply-To: <aW+vLiN30r6mZxp4@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DU4PR04MB12064:EE_
x-ms-office365-filtering-correlation-id: a79c3f14-f8a1-4cbc-b48e-08de58b826de
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QkFk+p14jKdTO5GGSen2DGDB+W1GPuGFXvv9jDNRMWRrPAqVcGhPxces5SD3?=
 =?us-ascii?Q?Ed5nLiQ6/y+tRxGGviVxoVFhn/E1jY0oMiLWa1MawPiA6zcCLOlH3ifAuqh+?=
 =?us-ascii?Q?8czTxUFPKANXoIH3boiG3CfBXhwUUYzDcunpuGXknQs5OJj4GFNxK2aZI4Bk?=
 =?us-ascii?Q?p13H9YSis8iOk9G3lcDGL+72e+Sl00+sigzgKlPOizhat1XPB2oaQdEYtejb?=
 =?us-ascii?Q?RRncWng+c0RuOqZ/MlIcrNSGQ1VH1Nuj8voadDHgmjwFwshzrWlUB7goVhHa?=
 =?us-ascii?Q?05hb6ApI8zwKDWdzhbJKFbzygFrG87rC67nFxsjsGAk1X9cxKuHqZ/8XEndu?=
 =?us-ascii?Q?ojr2Vz5xUbQ9T+HyLrfRrdLUBx1puPBZV16ILvfU7Qe22aEWUb+ctf9VL+92?=
 =?us-ascii?Q?uJz2zjGKvI7bIgbiDofjov7dKQGMJQj9oxrepNYCppsfTBUVKa1RBj7DJHXR?=
 =?us-ascii?Q?FZtuia8z1eub/rIfeZQE/v/+T3V7n7THtsPMSuMtRIj2speVVuq23GYUHXee?=
 =?us-ascii?Q?wkr0V3rokcDHG+UkHUQ0mIwW+QdhtbewVg/LJ0xMnHze8deJ1i62stDlk76P?=
 =?us-ascii?Q?XFSn78V+8oBoQyeHRhzTWs1/ulFc9zQh20EqnEUaasq538O5s5HrOJFSNVth?=
 =?us-ascii?Q?6kCAToBoKmrO1O0iZLzRyKO9RxXv/ufplx6BU2esuDCEVRCDz/aLHIL4lsVL?=
 =?us-ascii?Q?xhvEE0SYsv44YY4YUeaiNN59FXcP+wT4xPvqH6PrGx3pueksLUAupwqHFAwT?=
 =?us-ascii?Q?DYMA7z+ODCVJNiG2moHIcxUHTHdK43hRUY4N+KXQMA8k3eW5rWJ58w7MFZtB?=
 =?us-ascii?Q?ZDr3Lzokdz7AR19wmksDsmQOJB2JkPnf93eUMH4jypKpVcPv3BZsLqwBYIsw?=
 =?us-ascii?Q?8ZAc7XS6ze1fXOxiBphmMt/guHoE/UO4XdilYlq06CokdBTGTvoSBFhnb5Pz?=
 =?us-ascii?Q?+M4fEuWu+SJHlZ5Mx955KyoTwp9opkGOKAOFUj6E3rB+KCQCT8+flzxRQMox?=
 =?us-ascii?Q?XcLAD86Urk3SFlW1oCo8tkQ6WB3pmW3FK+ot56b1slJanVk3J4m+llHqh0ZD?=
 =?us-ascii?Q?n7SF2l9jAJjQbBhAXZalh2kNyKgEwvyA9vK2kmNXUiSq5dTDJ5mR3usfzCYJ?=
 =?us-ascii?Q?oTWVfsuUPqcIcAJZNV7cIo7sVRChfXqYjPbiee2Cu9FZWjXO3Bk1wRnfaKkE?=
 =?us-ascii?Q?9ShMbfimpe4pzzcyZQv3jsYbLWDG2sIk6yzGUD3gxQL7S0PzxBLKgtrop8Tu?=
 =?us-ascii?Q?WT6qCeyDBfrqhVTdcEI81dlwhe7xz/BHjH2VlNQg+Gs3nD0o7pMTPjZlt6mV?=
 =?us-ascii?Q?2lpheSkaAn7N6CEMKmDgqsChRKRtOEGsUx2yUCrrl3KaA9Ng+IVPq2oF3EJZ?=
 =?us-ascii?Q?C5VzTuTJ3tBtFjanpvXlA9p0GxX0lzI/ndrBDYyy+cUvxEXOV2OUN0niECV9?=
 =?us-ascii?Q?aVTW+IBAdW1yub5ZTMJbVpB0evQBA5ZSBJOdy+HMmxcGcelx803ziVtTQqIz?=
 =?us-ascii?Q?71wMEg0XkhjznmWM4/dc1Ig+hccsvleyhED5xX/fWJ+7kT21nQRBwdKnT+8U?=
 =?us-ascii?Q?+zMkM8gEzLZIowl/QFvodKrtqN+vGhNySIhHJK/Vt5m2jQGpsoe480Yx0k9A?=
 =?us-ascii?Q?JaCxP7qfPezuhNrx9COfOhM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EZ+6UHeIKUvAHvOBjL13IVxaRAfLHrkBpiHkja2w6f9chsd/hm931DpP/GI3?=
 =?us-ascii?Q?vM541SZ1grTL5GOy03VqiVNGKZgN7b8MqtM2Iqjub/f0RC9evfk/6ywFqONW?=
 =?us-ascii?Q?ZZ7ZtUHQmlN2CY/NO4jV1AwPTTbqMVGJSZmZWvDHhs7zZQiyjT5RJ+c79ShM?=
 =?us-ascii?Q?yZ6UyEIgnQlglapIHzVr8ek9uRz9B26ae7IEQq3x8wrhViO4tT6xh+Jn0llj?=
 =?us-ascii?Q?zpSx44VgpbTBH/miwle4yKXfZd5km2uPm4m3RBR6SeAh7Jf1kWEpPeB1rTqp?=
 =?us-ascii?Q?gsviXH6tqXpN2SpPYIDa1IGdWeSayQPTb5IunZFxeyxMBF5VUbD+kYo6Anht?=
 =?us-ascii?Q?RWBhRwIQtut3lwb06Zy74UsTUDDISqC9oGMls2fbVxwckPHbOXn7X6DZPaDu?=
 =?us-ascii?Q?yfQL/lAc8tQORqxUEHs+cp0TL4LrgTDp/D2GH3KWpj+xBBwQaPDTprAM3j1E?=
 =?us-ascii?Q?/ctz2xdvebSv/ebdiceXfreyWV0LrMAuBZe+IuhQ0YIO8fxwOZF8muhLzI+j?=
 =?us-ascii?Q?78hsvsZ6TkCVAIiRJdhK8htxI/QDLpODXUXhZA56hufb22Cm+p1+FiIcz9xy?=
 =?us-ascii?Q?GcFpeCSGu5H7E4YKxnVzrRuQkLSyzlMM+ydnwA+LBRWdPMvqSA3LZebDLfHz?=
 =?us-ascii?Q?hftIecgDYQaqdw7BNJJ/vec+A3+WJBMqKDm6kX52GmSh+uYTjpfDNiyu40On?=
 =?us-ascii?Q?ZJCkqCcaUR2wkhNe/21g5BMKeCvXX5nrWpkosaS41pz0P2XXTZwipKInUZK0?=
 =?us-ascii?Q?VXhZGNdmkSTj0rysJRBBBw2UBx1iAUL4YRnsftB/N+q0I0vau/lY7mElxOn9?=
 =?us-ascii?Q?dLmieMBMlgCQmfdM+bvmwqdZ+rSf/xHwQzOo8CeaKkFNr6+gJ6Wuf0G8n2U2?=
 =?us-ascii?Q?jTbhnhW5B9GVgX4sqqsXaKpBriAN3KbmCdXqSw89Z1ncteewzDDgbzz0y7xw?=
 =?us-ascii?Q?Rzptii3GHZUpfqOOU8RjDJc3WTK8a2cfEsR6i5ByMAYEmwSmVI+T+7VAeXcv?=
 =?us-ascii?Q?ddnE0dZ4Yhiqv2LFuKyIoaNjewomf7vS2e9KVeifCKB1tSpov5ZAeEi6RHfE?=
 =?us-ascii?Q?z6OrvbRNDHMNaiAyTvcTCStajIwmYBxI1z+oKHBKWuvJAnTdu0x5kW+mTOTs?=
 =?us-ascii?Q?Xhm1feSmK18hnIJLxsxSBUyjiV1qyeoU/13zcSYMMRhomooZnIrvstx/6rrD?=
 =?us-ascii?Q?P77cSflYS/3JJOYQr4RSGNchcEQQfWxx+5dA2lBBvnp/ljK+hsdfMmXE2sYD?=
 =?us-ascii?Q?iS3w8GPLImlG5Wnx0wVFUl2tmF7ReRLmU150+UYR+tB6dCTFKltpNp3loFuH?=
 =?us-ascii?Q?LBZnVmWrGJg38F0CR4z+W7Zt6pxBb6pLuUzj3H2C22NdMf0+R3XOuOsaFwiy?=
 =?us-ascii?Q?v+0YXFh3EDRfe9tBc2NRiCwDZ8uwyvQa7r6WTOdm9iaOCIo/GMYTnUXPL1mf?=
 =?us-ascii?Q?k/mlb+C9Fk7PznMeYYHQVGKSLSGZj9DFSOK23tasiZShtqQeds3SQI+c82yc?=
 =?us-ascii?Q?zAZ9oCgOcX91LtF4NnMDoX0hLrwPmKyB/x1PjU6CZFUeLZPvI+1wKUUuiYuT?=
 =?us-ascii?Q?aNIpam0+P0iBfyc9dWcHZ2KKRsNTdEbUxFkztW2loejBfiOfNAN5k1fmZwdI?=
 =?us-ascii?Q?iwQgtyc7NFc6RwhgI9A0fRLQOz4Bu2q1n8bUpbREaJZGxrQ6HWYEZqnGm1AO?=
 =?us-ascii?Q?rh+QJDCLiLYJZI0f2c3bdTuunkcuWgji0caZ8muMN6uK0Em8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a79c3f14-f8a1-4cbc-b48e-08de58b826de
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:41:48.2325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+KpuBwtW6rZr4nXQlf0WcoiuB2K3KjAR8GBTF7gqLDQ8aCXxGJ1U7Vf/zGRKcKS0MXse0OqzkS6FjLeqdGRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12064



> Subject: Re: [PATCH 2/2] arch: arm64: imx93-wevk: Add i.MX93W EVK board
> support
>=20
> On Tue, Jan 20, 2026 at 06:26:04PM +0800, Sherry Sun wrote:
> > i.MX93W SiP is created by integrating i.MX93 and IW610 WLCSP (Wi-Fi +
> > BLE + 802.15.4). And i.MX93W EVK board with the i.MX93W SiP basically
> > reuse the i.MX93 11x11 EVK board, with some minor functional and pin
> > connection differences.
> >
> > Here are the detailed differences between i.MX93W EVK and i.MX93 11x11
> > EVK board.
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
> >  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73
> > ++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index ce8f937c2315..5cb1b1d8499f 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -399,6 +399,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-
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
> > index 000000000000..c2c758b7f9a4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
>=20
> Is it possible to use overlay file?

Hi Frank,

Thanks for the suggestion, after checking, I prefer to use dts for
imx93w-evk for below two main reasons:
1. The i.MX93W EVK (with the i.MX93W SiP) has a fixed hardware
configuration, so using a DTSO seems doesn't provide clear
advantages in this case. A regular DTS is simpler and more appropriate
for a static board design.
2. DTSO doesn't support /delete-node/ and /delete-property/, both
of which are used in this device tree. Handling such modifications is
more straightforward when using a normal DTS rather than an overlay.

Best Regards
Sherry

>=20
> Frank
>=20
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +#include "imx93-11x11-evk.dts"
> > +
> > +/ {
> > +	model =3D "NXP i.MX93W EVK board";
> > +	compatible =3D "fsl,imx93w-evk", "fsl,imx93";
> > +
> > +	/delete-node/ regulator-m2-pwr;
> > +
> > +	sound-bt-sco {
> > +		status =3D "disabled";
> > +	};
> > +
> > +	sound-micfil {
> > +		status =3D "disabled";
> > +	};
> > +};
> > +
> > +&pcal6524 {
> > +	/delete-node/ m2-pcm-level-shifter-hog; };
> > +
> > +&reg_usdhc3_vmmc {
> > +	/delete-property/ vin-supply;
> > +	pinctrl-0 =3D <&pinctrl_reg_usdhc3_vmmc>;
> > +	pinctrl-names =3D "default";
> > +	gpio =3D <&gpio2 29 GPIO_ACTIVE_HIGH>; };
> > +
> > +&usdhc3_pwrseq {
> > +	pinctrl-0 =3D <&pinctrl_usdhc3_pwrseq>;
> > +	pinctrl-names =3D "default";
> > +	reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>; };
> > +
> > +&micfil {
> > +	status =3D "disabled";
> > +};
> > +
> > +&sai1 {
> > +	status =3D "disabled";
> > +};
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
