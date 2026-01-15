Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33794340DB2
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467733; cv=fail; b=VRIk34WX7OjfQNFOtK1mbRsfq4Qo56kTbd7/S0Z0OsZFm2Th0tfERS+0XWCIqy50klF/bS0YaboubsuWw7yAHYZKBP8CAYXANGLe1u/J1R+PtSmo5zwwN0jrX0LQGy+jebUqubpJelSK5haFsTWpwP0agLuh0msVu+TG4fiLw7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467733; c=relaxed/simple;
	bh=7C1u7/83L3G3DfsW1M4CDO7CVbyLdGl8KDR9xy64qG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R6tH3AWMbeFGAR+/3LZn7ozLUz0f81bmB0M2K7rg+tJQFNJ+BMdbuPRhe2xOPjC2OH4OFzhI1KKP75RMMCbRg3BqGHxj0lj8SSulb0Gnvf+HOE9Q1AMt6NnJNE1mBf6xlMHnF/Ed9uQDIvzOtRATzoB4fIpev3vo1OUB0LTKqUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C8EnN46w; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C8EnN46w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oq1UIgd/t4SGpQhiLm/QWU266fNlurFNxTP4XdhX2QRKB20vOC2Wv/V3FgAtCzPokRnYBAqfyZR+HAoGjoB3vIDtFnFiwRAWq4viI1SanbXqpQ8YQ85vloox0nKsjcQQcZ0sS3gSCdugpl5upInGahEVDxiOsxoy30MhwEXjkY/ss7Eagz+fR6OF2+OVXXQeesWlsYMgtV9swmVafuyoyqBnseSfWJ1gk2+wY6OtqhIUayWtCijrzJ+45VQ4dUC8tYYdVI7RbOxZofwF9wV1nAlNG+GbDc14oo1szcTJzSOkge611y6Zau4yRsjCBmHHsxxfVs66NPCfACKi9jRhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C1u7/83L3G3DfsW1M4CDO7CVbyLdGl8KDR9xy64qG0=;
 b=rlWiOHWcQaJyH3dkrC4+YEdYr5b0varRLJfU8I5u9gUdZExBJ0K277bX5E788NFaS94U9RNCL1z9zgHs1dYGLWAVjljp0Aa9A6jW2n+cFFTH5Q1CZXeGcwGRvLHvMZZ1QzsJDrThgJ8G6NESCVWubRHwwWDA4d1ZLfl+VRlJV6x+YxOq/tJlPhJj90JhVAbHnviPb/wsDAKeGepOg2JIxLNJit0mtvv0530awqnYO0bIQ8wDfq4f3ySmOfJECt0+RachcISUXRT0Puc3zUe0sknWWpcUumjHq+pncpB+B4ymmYiNuDEmzWURva/mTqJuTJVo0ihxnxltW62BnP5Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C1u7/83L3G3DfsW1M4CDO7CVbyLdGl8KDR9xy64qG0=;
 b=C8EnN46wt0JFDmbFPRJ/HwwS7vRogOW8aysU0QdR2bB0pDH8aPELyyATt3t7RzxUEchEO2AeVM86CBu0eJm3mMogYCIwMj9gRptoIpaH4r6P3G3ZlF9usy0HgctvYTabvMquPblZCabr1oFx1AON0+38E2+ktK8nubQMowh3OfGwBbVdnwgtYdwqtU/uXZyYweveU62Q1YNq96GVc7goPuv0ygSTPg+54IZZqSAdsjFXEwJvF1DmhhwlZVQO4q63PjchUW65zvuhoCJtzPi6RExUFMgdVshT0z5WdPSdOgbFimkxuK2xBury9LjQnbPASa7sOKYFqz7TwOcpNbP7Aw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8762.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 09:02:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 09:02:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Thread-Topic: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Thread-Index: AQHche9CZtzTRwtVTEOdIgX84l264LVS1tgAgAAJooCAAAC+AIAADImw
Date: Thu, 15 Jan 2026 09:02:08 +0000
Message-ID:
 <VI0PR04MB121140F296B2D63DA12F51A28928CA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115073418.GA4366@francesco-nb> <aWigj011i0pGgTRi@smile.fi.intel.com>
 <aWihLru9aT75LCPm@gaggiata.pivistrello.it>
In-Reply-To: <aWihLru9aT75LCPm@gaggiata.pivistrello.it>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AM9PR04MB8762:EE_
x-ms-office365-filtering-correlation-id: 30eac43e-b79a-49f5-6d13-08de5414c356
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Xz0sVdTbHhc/EfywEn5sefPojVAML7R2h66RuAezLKdfVSj9seTfr+oO2B/a?=
 =?us-ascii?Q?hC5cL8r1kQvQc9JE9DpgVqdej0mxCUsyru8xObrMQYMPsBgjfEGUG1Z5OPuJ?=
 =?us-ascii?Q?Ic2q31QSWnfgJWDXR4yMzYLkDC7O0OqNsM8JcBB/FJvFM5C6HHuWMWZWYMkx?=
 =?us-ascii?Q?OXWkb33c5aJKxl0gnUr+l4l9pccY8yTZZv1sUm8nb8PCKP1NqWidaAQ27uqq?=
 =?us-ascii?Q?9Fim2DROb9/UhjKXoDHoxkN9quwcYKVQpnKB4H5OLRv/L234pYUDWBwpYYIB?=
 =?us-ascii?Q?I9+h8iHvz/tTGRZf5DyGRlRFR+Ao04THUEYiLzFRh4McgAt9hjv/5llEXD5D?=
 =?us-ascii?Q?IKGup/8D1TS9Fo89e53Tg0yvIUgDEwCUB2vDrafrXT4jfu4MdYrIAbAH0yZ+?=
 =?us-ascii?Q?qRASwCQl4Rw62UNTsbPs/gAfoZxI+qoapFrn5zOZouAEK7zESSpaXOZJ+ofs?=
 =?us-ascii?Q?fTwmRHjJ9L2MLCe6H1q6SJ8j6oRceinY76/aiYu3uFo1hWEPkCA1VWAOUIQO?=
 =?us-ascii?Q?ZRy9f76FmbRyPLD8/VaeYB1PERBhTnN3mgDriTXrlYQjheuMXndiRUDmmOgY?=
 =?us-ascii?Q?SZM9uCUNCnPKu6lGNm4+cizwqQ4/oIPmEEUqhEIBv4R205zC08/JDy3qIQl7?=
 =?us-ascii?Q?AGz/tZj31mHNNhFjF7y+KO0KxtPbcWYRlJd/uq8fOHeQBcUIt/AmoGEEursh?=
 =?us-ascii?Q?YQVncssIO0K09B76hkBIUVxeDE4OVKAx5Xpc0hpt/wXvZCGL0WB73m4shp7k?=
 =?us-ascii?Q?ag9v2pARovxxxBWa/Mt/4P1waMl3dkImAQ25u76bB3kOWKA5MZcTX3KLOIO4?=
 =?us-ascii?Q?2pfNNuYlE59rYcCDdAPxZR+5LRnK40mieLW71gbIG7dv04K5D9gdG3WRAJ8O?=
 =?us-ascii?Q?4lhyYjI4ioGX7o7Cdas5FsnZQdAGs9/JG7sl1uWlA2CZAnsFI3HjwhbRTdus?=
 =?us-ascii?Q?Vj1YWaZBAysXhn81OqXMN27/4Cck0AVTgx6F0SGwa+m67hZmGCEbW4VWbO02?=
 =?us-ascii?Q?0xL1zIqVQP3QOZ5sNC1vwJtW6xsGeKiAvdZKaWk1uRcYiwFo4kBJ2zsNS409?=
 =?us-ascii?Q?GEW3zxWkKMxMOPwZDaWqO7/b4p0bJkv8rk6Kbyf/9KqFVYRTT4nh/ePWuXMJ?=
 =?us-ascii?Q?NkXQbMNS7c9d9hedDJOAQMDowAuB8YrqVdjZ5Nt4/RnJZKwGCrbmc+wgDZdU?=
 =?us-ascii?Q?MNmyn1FGT+OzWJ6XXNGQ/Ev81N+mH/pzjUxu8+9uAqRiBTuqw7IltA7tiBGB?=
 =?us-ascii?Q?KOuNjr9FqtI8L2ctgPJcVyfL76Wzetu+4mxrrxn/M59cVLSGdIbUu1pZuMhF?=
 =?us-ascii?Q?1EjLjEn4XOwS3p/TAxpKQrk1kY2nHJxeLdmh6eO7E9bcG5R1D6wKdjzCCuZ6?=
 =?us-ascii?Q?ZLYwcamzsUFPkp/DdHKCNm8BHT36qIiQWX1GQ+ke/4U/2UHpB/b24igbRXuY?=
 =?us-ascii?Q?bHZ+kKXC1fXUXI7cFPTPeso+tu7/1TB6AipkTsbAlAMbQedO/EvlghRa9XYB?=
 =?us-ascii?Q?dS504ECTKycQuSZJBfyhWHi4Lk22vrNnEC8ybIXBR5x3cDfxGgw/K9P7m6Cc?=
 =?us-ascii?Q?IGYe7/QXCmEQ5jTdmyfwOBfL1rmhB9eNvQ0Nha3w/4+VFSYnTqhGyAJXUDx2?=
 =?us-ascii?Q?C0/oGb1wSdT3wurCRp+BnQQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f74KQnGBO/mLUguFvBosrXXq3jXHOcHTTWaovJ+PqgVb/nIWF3GNtgx2x1m7?=
 =?us-ascii?Q?hBjoz6zVxYY9ZqxZZmk2leuSw7wCyXZUDrNYu6D0JMleX8EcA9Qdi5D1PCZN?=
 =?us-ascii?Q?5OAGGZkL+hzM54J7N+wsd/+qjxwpXOsjBBHl4RTN7VZXlrftjgux2dusanot?=
 =?us-ascii?Q?wVZCGvgxsqCEEucnycVEXu/2vBaMscE+G8Psu0eDqaY8hYGqQObgVqYyT0KM?=
 =?us-ascii?Q?eOxlAiLTRnhweifw9cEqDA+tvvG54iRed1o0kHnifpDyzOZ/aen60fPKULVP?=
 =?us-ascii?Q?ev2ezxGwXJg46KgewvTjuesQY/rrS7H8TmCxL4UWWLLl0voAFPsaoQhHUZf7?=
 =?us-ascii?Q?FGGMu7nEH5wx1yh9L2uBEjtpWfQhLOu9aPxJFsJ7y20vs0bzO8VJb/oyVs4K?=
 =?us-ascii?Q?6aQPss5okCsBSXEZOuqCk6KpjJE7oWclmKW/qB9O/1GOhvkrfrYYpOw5gCYC?=
 =?us-ascii?Q?PL90Px8LJ2/09yc/gIXmn8vm0mjlEvypAMWXogPYOuFMnuJM0NkLOaqTvfbV?=
 =?us-ascii?Q?8oT2LVTDynMv44F3G+TBVM1hyHo5UGdhPasAJKY15l5TcHpvPfz6Xu2npDk2?=
 =?us-ascii?Q?F8fLODt+mc5j3fyeHTLiZDRPjrfXkVKpPLWYsOHQ0uTu17SAwvQdF60RQpAf?=
 =?us-ascii?Q?sSrx7wjHEhbQ4DybYntj71V4jhPK3UwLQ08wb1oAiJTXGMLKhI1RoDSwVydE?=
 =?us-ascii?Q?E2C7Wqg+cX32VREljF2kJWs/uKkLexwWBOJDFSkDWx+u4jxv634RUZpqOxdo?=
 =?us-ascii?Q?blxMxC/F2yzNJw3m1hzuRp4xL7OZgUXrq1eVMUayoxP1HsrRNdsBFFz7U50l?=
 =?us-ascii?Q?NXic+ySXrRX5JRl5oRCe3n4prE0pqKW/3t13Jp7/J63Jwc2/4uhEk1QApx53?=
 =?us-ascii?Q?2QcYQNm5YWJzJPlpSRcDMtX4329P5fYi/TgjzJs7YQLAzMHM2IaibOv2Fnhk?=
 =?us-ascii?Q?w68LoWKLj2M2twv8qv2CfRjiFog3Gk/nrNl/Q9YEgNSXOO9bH+ahrgP1RWsF?=
 =?us-ascii?Q?5ygDgG1YXDQtkKv3663i2ST5JQ72VUxQPBZshpY0loAEsWvd/8b+ectE0Fes?=
 =?us-ascii?Q?9ZQltTZHYo8l8Gf465R8uqs/xPaIhxnmV/Qv/rdYH0dQU15OGB0gBtDD2B9I?=
 =?us-ascii?Q?vWHdY3qwFUCc83bEpOnhhoOStW0HULtw6M90LYD59fjPEhvHvx78Zf0CoYOO?=
 =?us-ascii?Q?gVDa/XbEwIJ8Tscl5XG9haO/CqtnScmO6g7kJ99gddYs+huQWOQBOGveY+/0?=
 =?us-ascii?Q?I5gATFH5ixv7G8xSH2xQxOwHiFmooxv5trCNXHGZ9nEAOAiB6vRGF2EL3Nu2?=
 =?us-ascii?Q?JrNCnPEH6T2EoaTi+pYjYPELFwU5S/+Mt1fJZP9jRpFcCWMCDlin/uvRJFrp?=
 =?us-ascii?Q?AaGSWO26+qZY30yGXckCyC8hzz6vgBPPDLEoVskH+mW/6LSMP5nyJ5jLU60B?=
 =?us-ascii?Q?T3AvwbVthpDc7hMX6mGvVMc/oHqOky0+EsXrP8Eo3prepReIFHg/frHvk4R3?=
 =?us-ascii?Q?Pt925Swy7LSaltjHKBUjDyQPS/OfnaMtBqSZcH5RqKjHv21MZSvM2NfSlBNR?=
 =?us-ascii?Q?yN75C7BT3bMcW6O4E9DAmTJaDWEZs7Igxj1d3uRA8pJG2weFx2cQSVOUE7h5?=
 =?us-ascii?Q?YNG+rnkPZiq7uyIujhD+KrJNADHjGSD4+HLzN3JK8Y8qikpAvdw7eeFrqa9j?=
 =?us-ascii?Q?y+QUCgyEHk5Z6yVIePzfUZ23mE+P6bRSWKnaRe2rC4aZ46Bg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30eac43e-b79a-49f5-6d13-08de5414c356
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 09:02:08.6247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Lp+BDv+oFXf2IoaZ2MNu6imwHKgHvfB7dcKf0Ck4+1yns0gv3QbHWIoX38V0c/YchTeyRemXwgQmbiKid/vxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8762



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Thursday, January 15, 2026 4:11 PM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Sherry Sun
> <sherry.sun@nxp.com>; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com; kwilczynski@kernel.org; mani@kernel.org;
> bhelgaas@google.com; Hongxing Zhu <hongxing.zhu@nxp.com>; Frank Li
> <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> kernel@pengutronix.de; devicetree@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated "reset-gpi=
o-
> active-high" property
>=20
> On Thu, Jan 15, 2026 at 10:08:47AM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 15, 2026 at 08:34:18AM +0100, Francesco Dolcini wrote:
> > > On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:
> >
> > ...
> >
> > > And , the property is still handled, see commit b8b80348c57b
> > > ("gpiolib: of: add polarity quirk for Freescale PCIe controller"),
> > > the DT compatibility was not broken as you seem to imply in this seri=
es.
> >
> > This is a quirk and not a 1st class support. There must be no such
> > property in new DTs, it's only present for the backward compatibility.
> >
> > For the old ones, indeed the property is needed.
>=20
> Ack, we just agree here.

Sorry, my bad, I didn't notice there is a hack for this property in gpiolib=
,
Not sure the history for adding this, but anyway, we should not break the o=
ld boards.
Maybe we can simply mark this property as deprecated.

Best Regards
Sherry
