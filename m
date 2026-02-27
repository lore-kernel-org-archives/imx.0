Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DBF13B5AE
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 00:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153508; cv=fail; b=g5aTQ7NJ66XFWdWc0PPynDnwD6z7CTNvovazlipeOr9tZi9t8eI6gqYGx4Lk+ZuwWJQKSSsm2S6CK56Fg4G6lEhLqyWbaIhRZN0qlqtNocqWwt5lc30KnwgRth7mbv/XJ6Xn9fLNV4CEj8+ogMURPfEFoD9gd0oCPkCjFFkWRas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153508; c=relaxed/simple;
	bh=sy2e1mjCmTnAjKWEk0sQm9/jx41PuqkLmfTPH0e7sCk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QtAd6XIGqVvt73dOaPuKf26yF9GLUFXweTbSkgbncMS2V1e40jnN9s/gyRSgpae3aPGQ/y17CfuGAkBEYzjdH/MgqX/9KendMBhz8MMIhSqSpPSHhwOthKYnh17wfuULM7mv7wqIy+kB4FDuJaBfJ61L/KxsJvg3mZ3kc4mi5MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qWax7yeA; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qWax7yeA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaaN3TTM3rgYWKl6ivyRlBpYRF6rxmjP+veNsZyo9rtPb8NjIeZqz/5OyvC+BkzOV00PDcv7z4BrC6IUVE4xJ7yM6F2IwVJejyQCV/VuTXIE/bkJJO+iCOzTfpHrRr8gFiVv3cNIjyRUkf1+RJefLaYQumNIIYvIiOLcNbcQbdXvCcz1UFuSybWiltPmMRC8+YPKtAUy76FIMcJsV5z0nwq8moeOA1ccAg0XLBgMBeZlWvS/3SiP/1c1hkwIgcBBWE3YurNguINpj7X4zwZcOuAmmHBJkD/fEyPcKSM80ytmmLfRocOm/OqbC04wxS9Ae72S8zWg+6fg5tF2f3JaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy2e1mjCmTnAjKWEk0sQm9/jx41PuqkLmfTPH0e7sCk=;
 b=RN+8pANyqH1nywTj1qHTlG1V3uxOxaxjocSvwclNha7ye+EW+ro4F/bg+T93kyDgFxrpvqoRitQ89CxfBgOLThkGR1JPbr4C3IjiTTrEfjQapBj7UvPu29V4s57KMrkCCGnU3exIG/ZYa7e//z/+i5r3CLM5wqJ3swnPn8i1NdDmROOq91H1iL9ObocBgt6U70agclEAOQtuBrn7OWdVJNC5mrrkZQIcGB3jIoMTV9C417WvZx/sdZ/0bvHfOy9UiyTitBqJaLFpNJJe6VwaBzwzeZ7yIyDvCWYhBwOZHBUJj+0kMHyYJ5Sn0Fdc9NNsZ/od1zEJ3Mumpd3YgYpZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy2e1mjCmTnAjKWEk0sQm9/jx41PuqkLmfTPH0e7sCk=;
 b=qWax7yeAjxSKE1etwEcsMnLSe8vEw1+/HGq1Jcp/oXlg57q/mcxCURo2P0A9/d4sMIxSS/Ij+JcH4343yhKjI4iVIUk7JCSLzZLHHW/7ZLsDszEKZap0HaHhpa3MVnSiOstHPgR7dFBpj3WjYKhzChzSjqzco5GcPDgXfCDWPvUidHzH7XtXWbX4zf7oNofRy8vhE5Yi3oqFXc30EcOUssCVY0oTvbp9T/6aIcLxMfqIdZa1BRQOUs7pFdLOa7z6LJ4Fzg6z8cZSFXnbCfDQhG6rYW9PoJeTR0sOHDfHwjHJGdk/Qj+2kOlEf7zNtgdixfIq49tvLHW+yQuUK+74dw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8702.eurprd04.prod.outlook.com (2603:10a6:102:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 00:51:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 00:51:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Forrest Shi <xuelin.shi@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM
 nodes
Thread-Topic: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM
 nodes
Thread-Index: AQHcoa301aDS5Fr/xUqnxS078frUd7WSrwMAgADDlYCAAk8T8A==
Date: Fri, 27 Feb 2026 00:51:42 +0000
Message-ID:
 <PAXPR04MB8459E1D449AE9B5E1CE435F68873A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260219144200.2633404-1-robh@kernel.org>
 <aZ5VgoDF4QvWaCgE@shlinux89>
 <CAL_JsqJH_JHd2Z_eGCVC7ZC6f++i0B0sgO0S+H=6pEPkDaQb_w@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJH_JHd2Z_eGCVC7ZC6f++i0B0sgO0S+H=6pEPkDaQb_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8702:EE_
x-ms-office365-filtering-correlation-id: 83abacd8-11cf-4283-073d-08de759a5fbe
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 qLx34DLWh9emfbHR5BoCVBHu2/37r3LhHug7D1Mh56CbnkYOUbOuV7V51Z7MjjYlCJnGdHo3WLHAnp+A7j+Xzij1kyoLA24yKjPMBU20Gi/OEZZd4WLEFIgA5qXMAs7YKtCw/eZZr87saBaWqUj72dVUp5wYc0pOa2CO+aJJRru2R4o3/5IcAN+hDR08F1QchhrDX6LAathJfuR/dJSaSsmH8Cy/VXH6SXVoEUUePLJylcB18sniD3BFTN/lvLkhnmvq43D2Dzz4rlTwBhnLaRca1t4nHOiRQ8toBZB3OUwqU9+kAmHOK1XdJuCT8Z2EXHKQw49iKUVTsDpnizVxQ8EQ2oKi7KOTp3+GVO0j/u1/3zaWmg21jQ/O4tMXPirYeMNnAchqcH8EFlZ9jxnpIBV8RHf8f57jHX6cE3thciVnE+tp9gnjp5j9L1oway1F0lBmDXDly4a9dOGqOMoQ9/rKGxFNuwvUj+NI76/IwEto+EUrIXkkJ1LGbrg3ARZec3HAEgbf5Cxewr3xBwo+Sj47ppY+NE3aY3oKExKcShQBFiVbpKIAl+5SAbfXLdYptQ/KLa6w+dwDr3qsHPAOxntG5pX02D7z/OoQshABRPXMaVpwlP0bBv0JbU0AHMnRffdTEtPI52NBTtWMwf5CXmt2iWXSqbp5Y7I648I9x1OhhLBptzmX7mnTAEDRFpwqwKfGsFyv3tJE6/jEClFR0v8JW0dIDgG7HfeWUpin6wrz5byV1G6JTxyHGJoWpRt6kCx9l32KBptvSX+TCoaiHwlAKzXSqRPQZM3Qnwgr5xk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlVXQlEvS285L0FVRVBFcUE1YWlmZkM2TG0wZnowSWVkUEQxK1hpSzZUUHpC?=
 =?utf-8?B?cDFHbmlLUVdmNXhGZFNTRGhYZ0xPY3FIVWRtd3g4SWhZbG1ES2RZYnVOL2d4?=
 =?utf-8?B?Zmw2bkVWMTFoeFpLdkNtNGZFOEF0bVJIZmQvcmYya3dvUGp3MzRUcWVzMjBL?=
 =?utf-8?B?NEVoUTVYZktLUHdOeUNVVHA2ZHI1SVRadzd5NEV5VHBUSjQ0OVVLN2VZRXJu?=
 =?utf-8?B?cGd6S2h5b0tTdkovbW9QQithZkVmRm03b3dFUEdDckVONWhGeUg1emRvNk1p?=
 =?utf-8?B?c2ZmNGhxV0F4M09IQ3dDUHhOMTBQTFZyenhnSmg4ZkZVZnA1RDF0NlA2aDRI?=
 =?utf-8?B?dndIZnNWU1dPYXlrZVVLOFFnaEp2QnZPN0ZybEZreEo2SDludUJJeUU2WXNu?=
 =?utf-8?B?eHZWQkk1QWdtRzN2VW01TXZCaEp4eFovTVhKRVVzNFhjdE94RDl0UHRNUS9Z?=
 =?utf-8?B?UmNDY1dDRDdIWTI0S3dERkQzbzJIdFJVSU9POFFjODR6VCtoMVJNTGYvTFo4?=
 =?utf-8?B?Tm52UVo2b2UyeTl0MUVPY2dpaG9ST2NHdW4zQjEzbGdYdmszQjV4REw4WEZN?=
 =?utf-8?B?TjZWNVhNSDk0NUZiTVJqenhHRlh2bWJlNTd3Z29ta1ZqYnVEa1RDckI3aC8w?=
 =?utf-8?B?enFTdDN1REsxV2MxenpXZTdGZ1RyNnFmaGV6TmZpUXlRWHN4TEFlUkUzcG4v?=
 =?utf-8?B?b1ZCT0FqYjJHT011cGxVMGJlcTA5NmhYNjM1eHpTSlF6M296OEVnMHUyNHBx?=
 =?utf-8?B?RnpuOGdGTTRtMFhMTUp2SHRHM0NOZU5zNGNWVnFlWFpwb1hWQ0Q1UDI0Y2M1?=
 =?utf-8?B?Y1EzM0dTalY1THp1OEZtTWJGUjRKVFFPMGgzbTN6YlQ2dFJYVHo2YUlqSE5P?=
 =?utf-8?B?VGZtWGt6Y0cvTzdTV0J0Zk1nT1gyekloRTZtT0EzdUVBU0FwY2s5R3kyQldX?=
 =?utf-8?B?TUVYUS9oWWk4Y3RBaWMvcVduMDNNM1MzbmVScjN5TVczZDMzbVk5QmRXWFBG?=
 =?utf-8?B?VFlNd3hMVzN5L2xoSGlsMzNmQVVZdGNnVlh3bnR3cERpOEJvK0hxdEIzMXk0?=
 =?utf-8?B?S3BrbXkvN2JNeGYwbGdIRkxSTkxwQ3dlODBhcU9vajc3SEduczdJZ3IxUkhw?=
 =?utf-8?B?WnlpeUhZQTB4eldOdFg1Smhxb1JPZjlmZ0I1YXF4ZWdycUhCaXJFdWxScWM1?=
 =?utf-8?B?QXRGZWlDY2JORTRXdmo4a05sM3hBVXFDWnhETGp1eUNpYmtXRmVCUldMVzFW?=
 =?utf-8?B?bVhESlZPQ01uK0ZrYjYvOE11dDVJcEYzakY3eFVhMXBGT09aSEo4VTh0OUUr?=
 =?utf-8?B?RjBwV0N0TWxjV05nVzRja3lPS0dUeE5Oa3phUEhXTlIxTzBITEJmbWo1QW9q?=
 =?utf-8?B?T0k0dlpPUjFZZEJJa2kzOUZnRTNqeUw0eXZmemJhSldraGNoeks4SEttcStV?=
 =?utf-8?B?a1FuWWVyMmVLdlBnZG1KaFh3OW95K0QrVi9YMGU5cldSTXhCS3cwclo1Qi9B?=
 =?utf-8?B?Y0hpVllGdzg4Y0VqQjJuVGdhNGd4YlE2eW9XREhRaFZRazhJZXR0OFFlTXNs?=
 =?utf-8?B?ckZlTVhHYlc1RE1lU2hXYUlic1YxQWY3aVhuMy9HblRrcHF2cmdCU2p6eHdV?=
 =?utf-8?B?Q3k4K3IyUktpVy8rREFCSzlMbG84b1pibFRQeVkyOEtHM2xQem5LSE9hZ0Yw?=
 =?utf-8?B?YjJJa3lXVE9VSGw0ZmtYdmVnbTFUNVFiTVB2bmxGbnEza0FzL1QzTGlwYjlk?=
 =?utf-8?B?ZW81RkZlUWZLRFFzdmpoaXdxZkVqbnMrdmpMNUhtWmNNV3c2WFZSaElZVHpX?=
 =?utf-8?B?ZzlyWWJ5NFF4WmdOZE9haHhIRDN0TlBmVTFkdEVCOWhPVFFlNE5YaENrVmN4?=
 =?utf-8?B?NklONCsrME1MK3hQT2hmeUtiNmxPMnFPSUU0MmtkMGFTS0htT09lcXFoVk4y?=
 =?utf-8?B?SFk3L1pOaXBjZXVlSHY1UUduVDl4VkExRXlab3pUd1lEcUFFM05sNG9SM3FP?=
 =?utf-8?B?YTJ4dnU4a1RrcXluN1FCMUt0elNDcjBNT2Ztak9iSFVkZlNYOXd2elBDNmM3?=
 =?utf-8?B?ekFHWGh2S3ZkbTk5aUtEZGpXdWN4a1MyMjBvbDhzdlZkRGdqVUFPNys3RG1j?=
 =?utf-8?B?OXpVYTVlaCt2SzU5OU9FWUVEeDRycmtSNHNhdEZWY1JkRVZuMndlYk14UC9o?=
 =?utf-8?B?RjRtSEl2WVNJenZTRE0vbURldCtlUWZWd3FwQmhtcC9uV1JOTTEwZk5rbG1l?=
 =?utf-8?B?WXJJNzJpOUtoQllHMmxVaEFsU0NsOG1qd0FQR3pLWkJqQXhJVzBiNklHMUcz?=
 =?utf-8?Q?LdkKkhD/NAroO8puAH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83abacd8-11cf-4283-073d-08de759a5fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 00:51:42.4796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oP4yJo9Z67CSaDa70AXKXM3UivWHzr43PflcmVQf1cnQ2XyUfX88KumBOZKsCdM4vLJTUpAcBGi58E17Pv4JFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8702

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBmcmVlc2NhbGU6IGlteDkzOiBBZGQg
RXRob3MtVTY1IE5QVQ0KWy4uLl0NCj4gPiA+KyAgICAgIHNvY0AwIHsNCj4gPiA+KyAgICAgICAg
ICAgICAgbnB1QDRhOTAwMDAwIHsNCj4gPiA+KyAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZzbCxpbXg5My1ucHUiLCAiYXJtLGV0aG9zLXU2NSI7DQo+ID4gPisgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4NGE5MDAwMDAgMHgxMDAwPjsNCj4gPiA+KyAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTc4IElSUV9UWVBFX0xFVkVMX0hJR0g+
Ow0KPiA+ID4rICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8Jm1sbWl4PjsN
Cj4gPiA+KyAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsayBJTVg5M19DTEtfTUw+
LCA8JmNsaw0KPiBJTVg5M19DTEtfTUxfQVBCPjsNCj4gPiA+KyAgICAgICAgICAgICAgICAgICAg
ICBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImFwYiI7DQo+ID4gPisgICAgICAgICAgICAgICAgICAg
ICAgc3JhbSA9IDwmc3JhbT47DQo+ID4gPisgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQt
Y2xvY2tzID0gPCZjbGsgSU1YOTNfQ0xLX01MPiwgPCZjbGsNCj4gSU1YOTNfQ0xLX01MX0FQQj47
DQo+ID4gPisgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwm
Y2xrDQo+IElNWDkzX0NMS19TWVNfUExMX1BGRDE+LCA8JmNsayBJTVg5M19DTEtfMjRNPjsNCj4g
PiA+KyAgICAgICAgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw4MDAwMDAw
MDA+LA0KPiA+ID4rIDwyNDAwMDAwMD47DQo+ID4NCj4gPiBBUEIgY291bGQgcnVuIGF0IDEzMy4z
TUh6Lg0KPiANCj4gMjRNSHogZG9lcyBzZWVtIGEgYml0IHNsb3cuIERvIHlvdSBrbm93IHdoYXQg
cGFyZW50IHdvdWxkIHRoYXQgYmU/DQoNClBsZWFzZSB0cnkgYmVsb3c6DQpQYXJlbnQ6IDwmY2xr
IElNWDkzX0NMS19TWVNfUExMX1BGRDFfRElWMj47DQpSYXRlOiA8MTMzMDAwMDAwPjsNCg0KUmVn
YXJkcw0KUGVuZy4NCg0KPiANCj4gUm9iDQo=
