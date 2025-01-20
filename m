Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C11AF0A6
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365133; cv=fail; b=S2Jf5ptOHINLdpfJReWVo3Hsyu/oHQkcKwcGFvYSsTWTrOJecJWZhL+/bHvXFy/w6ZjT3OIteyQWxfnKCuBZR7MG7cZF+5B838hHdEPkFkUODm1X0rWg+vPahMY0XuhudVQ1RU3Ep/RP0CSRvHH5oIdp5iIZCZvzzo+n8WUU43Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365133; c=relaxed/simple;
	bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nkaRVIWrolzDf/5m3gRXebEi5dU3+jdZq05vNDzql522ip1hibnC8ynVTSi4Bi+sXmFF/zLZjYgGAHGj8pkHHa8+KUxgIMU8Jg6S5s04Z5NInD5JPJ26uW4/IDjWFdiYAJav43MReENX6VEmkwEhVi+8bDGTb3vsm6VstV5uf1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lQ3W0goc; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lQ3W0goc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA6poPyTtXCnMYoL6aivitM8u+WNJEAV8yZqfcdLV8zLCHlQ2YcTpgKSoknBh+OK9cQ70u4b4Y3zUo+6l5eE47giFCI94NXlj/dXZ+B50IHQRQgrBJwgHSzhC/Of2JNWDwWPN+P1SzvDubWz3oaBqBujsNZJHTPLnjnRh58TCCwhT0cpILkgUMquuIqR4DojoO2ESRSCTZj7mYEnZWuK+P+ROHj2nHB7RXRwljQsz+8SrdooWZkZaWBg1iB9xqY2S0cYcMeDYSotqr3crDlvnFrgZFe/+QkC9Dwvfa1KCleS4zsN5F1fjC9pxH0o/8sOngEg3e+CE4igbCe+0FZ85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=;
 b=hCpsLXs3W4bJRBuCq0Ir6A+kcmZNFnSYRdP0EsHuQSjtU8r76ox8fuoKcliC3pCtYdyPMCQibAfWYZdt5F7gyG817omrbK3n45SqWyNxWxGCyUV8tBhmU/9GLrqOynJcyAkzhFL7R37ttQmzmt0ZTOiLLLnbU6ePBFjUcuAbwsS4cOyyCilkEsozXGUcXa11prbma1a2KG9RTRAyiXmN9mnPiXjnqtKL7aMfJ2OYI6DeJtpYmj/5RvuGCBVusLBXzmAjsTql9WlnDO/GQ2sIs+LRV/ww60CGleieLzvcSyOhZcbBLbn0pdbfEGWvXu28q3or3zuMfa9RVL7WfDDvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=;
 b=lQ3W0gocAQyHqsXfMVbz7JdQY9C+sbri6/KYYJiBXQQsCZF7yBdoQ90gHijRoYnyISTUi0ffV4j+Y9c6/VnE72ouP5MFHArZMsaMbu+lTykgypDSqVDOm4fDHk4psTngUpJBlnRJmOSvzDLcmbmOwf0xPa0KsdwDuYlo4FuOwh8MQzc5qm26AH4qmhTpk+z4PZUVrfrTjRsibfbyBsrzpmsFcEn38Jp6styyGiq5+dE/qPw3uMlmyicY9y1UmqsAgHl49K48ObOHp+Z7v2gQuPRqFEODQtNqB4HSeEwWl4d0AWEunoQou1PWDy+JO3Rz+sG8jkkXz8Rbf54t1qCJQg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:25:28 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:25:28 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Topic: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Index: AQHbax0+kiyZjrqUmUKKTcGGrPTyxg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:25:28 +0000
Message-ID:
 <AM9PR04MB8604E43A1CB90274126515DE95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 178a15ae-da4a-47ef-686a-08dd3934611d
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rGUKqSOol6aM7LIdFlzlq7nBH6AFQI049nVevyxLriw/rucQA0syuzxiFERI?=
 =?us-ascii?Q?/XxqExZFx024li9z35I8cxFv175kNJJO65yMrbif2VBvz7OLPzikiaOTZHEF?=
 =?us-ascii?Q?FbnCjl3nr0txcPV0obeRgNiwR9cxxhI2jlkUQXUd8YAapw42KZsfcfro01re?=
 =?us-ascii?Q?vaYrc3Wgay7bODm6H8+sujaNCchQEUoY20H1hun1/rr4uUJSQ2eFin5rZWIJ?=
 =?us-ascii?Q?EyuxaZFQPqKLovx0AB1mou9G5I7w6kpBrrdwGRhHNFkD2NSzk21yxTlj7R8M?=
 =?us-ascii?Q?iUYZzHIFVS+VDqNL1wmrGlBe/V0RXqnlGBChM4M5JvNlQZjmjeu4T4lCpfNA?=
 =?us-ascii?Q?tm6ptEGgikg3kvZaZSfnz/YNOVjahriZs5tI7dzScu+w9qikgWpqe4GcqzOI?=
 =?us-ascii?Q?FSZuHm5S6q6PAY82v4AvTwaI/MfsseX4QpAra7TCywvPYOnV1IciGjmCqWGc?=
 =?us-ascii?Q?Wwhi2DSx3QN49q9RpXYrfHqRbAQhNmQidZHKyjyrvpF0iCzX5z8DE8X9JqwQ?=
 =?us-ascii?Q?eRKxvHx4aq8eTyvohLz7P9q2riueyGHS6yYRLQ/4M4HBVZg8i9Uq+CTI8ry6?=
 =?us-ascii?Q?rGKPcgAcoz+b7IzzDyFyvYieUJ9qbiUzplVujb5ZY8FeMFN0c7KAYZE1v2WK?=
 =?us-ascii?Q?xBUkRBXFXoN3SDckvEDrNdF1XB4UQVOJIMSu3PvyJVuqjKg3iGbDpAyhjuHd?=
 =?us-ascii?Q?QmsB+ZfjtkPqSrK/mBH7owIIXNu4PfiPiADrB5wRoZCQbFDiRomkYPgNILFO?=
 =?us-ascii?Q?mMliiKLDfVbF3T+v/PjyA+512LpakF45UnGlHymuhgl9JFAaqA/GsX00mIKx?=
 =?us-ascii?Q?K167ZArjAoDz2Mw12ezoEfBpGK3PLWzHDvQ2BfvSLr9zNUTGBUBscQ/ZLuY8?=
 =?us-ascii?Q?esecWnDHk0HOCBHqH6KSOxO1EYvOP5dYn8+TP4xuCHPZfHz3viANf2K3FoGz?=
 =?us-ascii?Q?zNGcCk+X8dKxTparOPHZBL5N693B0SOlxmLt8PJXx+jmf59kEDqPyvkUbtWV?=
 =?us-ascii?Q?jGRqgKtkBWkQbw/DAbH/YoQUXt+3D/rCUib05LKBJ0jL8ZAX3uQxc97lUTJf?=
 =?us-ascii?Q?NYoQjY2KngMZghGr2kkai3w5n6MaZSyg6aUpXVw9C9QzeO/cKk7U5gmfa0CX?=
 =?us-ascii?Q?J8TR/IJcmqB11ncDXlEnyY3p/FfBcNykOPn4Ia4iDibZtXabukBDp/wtKA0I?=
 =?us-ascii?Q?nsaDKwbVWXRFsajV4l/SkxUWgM6OBEzg4L3xurMgxCWpF1UNGS+maxb+JOCE?=
 =?us-ascii?Q?lyoRGkZyD7lgwvUe0/oVuQ/ffsA/7Dbnoodn9STlFyNZfxW/yxufQablIIKx?=
 =?us-ascii?Q?vHs3V35PHFoRajF8xpCeiFXLf3ZEpsxMD14AO60pWvY7SxARp34culx1Vghf?=
 =?us-ascii?Q?d9skITpPLlbDrQsbzEIgoehwWI2pqj7iMHcrLBXPFK1kyD6cqkpl9fgbrqdU?=
 =?us-ascii?Q?ROYdNvJEVITJQ6g7PrJjw2uUYlDBaz2p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AbNFOPGxb4kpV4i8oC7mvagW21c6UOTn1m4hWGEWtAmFZAg35mgAV6Jnncs/?=
 =?us-ascii?Q?qzmMmCWNOVzPw+arwaOJxNG+zVoH4vI9X/uW0cRUW2fWHhv6510ofrogUXZa?=
 =?us-ascii?Q?qgxl1Lc+Fq1vlDIvIFLhozdika1KBSapmxnOH5+X5fdvGDqNfa8KhJ7ywSjT?=
 =?us-ascii?Q?VFFiAXvu/36D/mld0XDmS1jFdMr3upRz20D/v9gMHImj7EOhxh/ey94SKjYf?=
 =?us-ascii?Q?yuk8vFp3hophQzIU1IsGsiONKm2lb+N6zOPMj1/dOkyO0LInjYrT654gcyIe?=
 =?us-ascii?Q?F0Hq0RCYM6PYplulmKxyiocbld+JJ1tNxGHaffKOoVZSjvNuTLWdqI9HmJSQ?=
 =?us-ascii?Q?hQighIrrj65tvX45T1Np4SzIdmi4BRFd2BHy+qUnIMdP0g441NyZFcLwtMM4?=
 =?us-ascii?Q?IVE4rFTFzcvkUQA25wFOuPFUkV9YXX3Y2Xi+bW5WDcrdMe6Vw67YqS12lBYO?=
 =?us-ascii?Q?CXotfsxUYY9GQtxe7WpulVp/8qZwWrh/p+D1KxEbh9NLHM8/VBWavFSCyXFE?=
 =?us-ascii?Q?RcvECz+1i3SKU4KpG6Xk7vqhrPSOVBAw9qPEyFtMcz+5VrA3clnidCUf7MJo?=
 =?us-ascii?Q?KwOd4JuSyLV532U4sGfHHX/ZD7EWW3HqLp6T7o1J/+6injoi2oSPmjzxTatA?=
 =?us-ascii?Q?D6zBxf5lrNSQ84JiN2xe9AjeHgNXyLtVkRXtWs3s7/tSremZU8BSfQiyzj+L?=
 =?us-ascii?Q?c/QYY7rgJEPMU1W8enCOV7UihXl76r2hiUv19H60dbAY0TYqQwef7OPRKtR/?=
 =?us-ascii?Q?O+sN8NU9SsaXbbXF3GHDKdFo87eoINiMAjx6BjYM2AfPl+wXX8nSrYUWAfPN?=
 =?us-ascii?Q?9V6ixNLhzo9ZzmNYvnC+WWdk5n6GtL5NCTbhlGhqtS/K1+sRNsaIzNvNfINy?=
 =?us-ascii?Q?509n+OBYdcCFAgWdE7t4AhecWnSP9t3hh/z38V8Va8BY9IRcXj3mrSITBx8x?=
 =?us-ascii?Q?vNeY6aYKG/mowo2rHq1Tl771VTIYWuzmxk+kcO3G1x8A50B3SOlzWk4qMr1n?=
 =?us-ascii?Q?jWSA7JZRWZhiMdtT9fwvLFBsFasdFbcnXY22NJ7+gypjHPV/c412IS8CxMSj?=
 =?us-ascii?Q?6mw5gwPBh7w/MrAlNkN8ErwBLHcZisOgped52zbFhoOz+ZnUgkYGkWnQ8Rfi?=
 =?us-ascii?Q?Z4tWSS+UrlwrZobxQ6pTY+cCpjoUThO6zSC3M62XbL7eG1hCkbDcJcVCC62b?=
 =?us-ascii?Q?XJ6Ns/RdLlIJMqOactl6oQM/9j4eA7sJJvI24eOy+qIlH/Ypuim9UlOgTBFJ?=
 =?us-ascii?Q?iWEo6WyrQIUnaGKLsNmD2nQceMEkw3N/cBppwD0MO4XEXYLp/kTPmzOjDnlO?=
 =?us-ascii?Q?B+DbRIXHVC+ZOAenZj/EQmBdUA9Cr58qI5ddL1AuJKSOoVW7pyW+Ribsqunk?=
 =?us-ascii?Q?m44ZDEg69Y8YVte2Ly2xETy0+VTBhwghIr9kJXFB6cDXXd7EpN54v4Xd8WH0?=
 =?us-ascii?Q?NyaneUcFiiszofTuTjimCi/S/bRmcfN0TQ3qTcpR0Uu3W9woGhbO3vBEkS+V?=
 =?us-ascii?Q?ZIVKpXn3NynAp3gYbYyQpux8icLR4hK8ZoWRnj8lT58vN/WKzC07dSXV7/hR?=
 =?us-ascii?Q?TWpr6C7RqLWZ2npuOj9GYR7tGp+nTdB50zNFdhGq?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178a15ae-da4a-47ef-686a-08dd3934611d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:25:28.6475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WavZefobLHjfzdrGyfMeanEyiLEJGCjQNHc248eiattxjbcwKYx3kXrNRqvtmoiAt1ZCZNeeCFlDfzw4SwURng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954

Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmwa=
re: imx: driver for NXP secure-enclave".=
