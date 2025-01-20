Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5181B4143
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364696; cv=fail; b=K/1R5EMJQBKeNLpoWmTpdn+ZuZI7dIP7kRq6NG6ZMah+2hY47P8QOU/x9v8aB10mzhMjTQlgjei3QzqclWE0JW4Z20MkuWPxI+BwTTO+Jz/EZGVx2BitGBMDGPCu58flur9x+rwVgLZfkRf0LV/Peks+dsK/xFGyluQLqFwI86M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364696; c=relaxed/simple;
	bh=mjvACmW9M/gYjBcRxK7Belg2kf63njAPmgdHs8BTqAU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hrzn5rXUTrl6blG/ycD+Tuto3JA1BsIGIJyhKT/+4mCNvlIPJ5uWHXG1DyqTDBeDoHI6uQyG7FTh7HQ+iiEXO3VypvS7SjoWc0FvvVaJImNcujFO3LOUzTb54BmjLdesqJ9l7UVa7GVi7zqEE1pNFcAtTaYT2P7q4VWtTp6kfVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SSM1WFjl; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SSM1WFjl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOrOmCkD0jEVy0Vb/reCN5w5DtmMgP2JS7oelnTd0Na5h6zzUb4NNaZSpYOI4Z64dIbtAKKlkzu9udnqgqB0FTh8ME8ibaygtNmlQVAzdYHO1sYqe3fMwUxzR/8VG/7e5iaDumZ6eLitRDwGSB2q871sHecGqPU1pB0J57bp4jJ4t7R0sLciafFTn9rF0z6ot1Ei+qPunvRA3cI7oeBgUHBVEcjmoEvL4rfWbwr26mIMxG1eK4iuRnJZL+LKmWJ5RU/mpWDZDwr/CPbkYX7C4GR+40KborHEnv6F6P7HE6AKZDd1Y5P3SBEydRYMnSRk+DK4RmFYwi8T2HarqNjsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1bMiODkVT+2uwM+V5ZldC4r2Reb6tZOUNgko/mpdi4=;
 b=oqOKd7hI+vgfmGDEA5DzJmGgt3tWAndDBnXGGViV8YnuTJdV20vX7AK/jvW4wg5iUkPa+iVQq0300tRnpm0JxkrphkAalc+USNI6URHNb4cvP3Stg4JXXw2jittEmRk66Iva+W2FU8cv+NPXpPk+Vrb5suKV5FJj7c1S91AFnlr/PfSrZ8OP+s6s9eddux92sUqg2PNv0dK9/4VHRdZ4YRy/SOW2lyQpcmlkJl8MYD9GqxxrO42Up27mH3fvz0okW7zM8LLsyftRKbPDbUDNmS1LCT6By59Ty5+vvWbRcAi+dWiimU+rOmrsCVGNV97+jn36kw5FdD46Ps4N9n6msA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1bMiODkVT+2uwM+V5ZldC4r2Reb6tZOUNgko/mpdi4=;
 b=SSM1WFjloyNNRd55SEK4LxG3ve1KOLxzxPXWnzwyVIFwhHiy+678Txs7t/OeEiTCN0zG0wfjg/h7caiZd9rLQ7cUohlAK4VvQgC5st595pFWmkifPweDe427HbyZsHiBlP9D3H4J4tOEbPccwf8Q2hzDGicypx20xmJwcG3E7eCqiwtL6pwyYH2qrpk8al8oxaXnFeOdsCxDQlYimTVsDQAbvc81xTbnGu9z/XmOadkZYcddBBtbfhK3Q+CUe4wVl1Sr8T4gaAEILyzKMKYB0k36AcG/wGuYPXiniC8hBKZWICgVuh1k61gGsJkskDraF+BHRQwFjyOFW0pzZ5UB6Q==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:18:11 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:18:11 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
Thread-Topic: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Index: AQHbaxvud9MzSKjlh0OtzlcnCh8w3bMfYjZg
Date: Mon, 20 Jan 2025 09:18:11 +0000
Message-ID:
 <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
In-Reply-To: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|AM9PR04MB8809:EE_
x-ms-office365-filtering-correlation-id: 0e2cc157-2e3a-44c4-3ca2-08dd39335c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0FydTdEUWRBbDM0MEFxOFVJdFR5M0NDNzQ5dktEcWh3MWZuOXlJOVJvM0xB?=
 =?utf-8?B?K01SdGNKUjhwY2JxLzVOaVhMd1RDMy8ybFg1VGY2QVh0MEZraXVQTml3THZX?=
 =?utf-8?B?emNZYnlETkNDY1VQUkFodHRwNGNxaGxhRnpUKzB2Y0FFOURxNmZGb2tOZ1Rh?=
 =?utf-8?B?SjhvK1FlZCs0ZjNKdUJycEVURG5SNEpZS2pYN0xvT25rSlBBQjUwdmMycDRL?=
 =?utf-8?B?UEthc04vN090Vy9EdFZ4dG8xdXNzUUkyZENCcHhzNmREUllBdWZ6YWdBVTRn?=
 =?utf-8?B?ZjF2cG1LUVdJQ0xvREJUMlVHeXpuSDhPSWtVSmpyekp2TU9nK2lJdHdLQUJF?=
 =?utf-8?B?dHVKeFl0SHBXR2prQnprNHJVa1NCeW9NMlBqeE1WSjVaL2NHN3JLNkhoN3RQ?=
 =?utf-8?B?eWhsNG80NDdoMmtKTU12UW9BY1Z0Y1N5dGdjeS9QUmJNOWNldkJaYU5QcXAy?=
 =?utf-8?B?Rnh4QUhxdFNUKzdFYzFqcCtSVE5zbHhqRFFoTFJrNXlMaXBBQlNsalRCWHp2?=
 =?utf-8?B?dCtsNEI5bDRLbDNBYVJubXpuakdGM29uQ1A5bGdFcHlUb1htdkdqQ05JSFB4?=
 =?utf-8?B?K3dPcmtjanFSK1gxNVE3cHR2ZnI2QTlUVWpKSnNtT1hjMmtlUUNrVmhiSFNw?=
 =?utf-8?B?RWRWN1hvME5za2x3YXBZbnBvQUYwRzNGNDBJMTJIb1liQVlKT1djeGlnK0ZF?=
 =?utf-8?B?WlFpQ0ExTExUOFVBditCbmMvMlNaL3p3a3ZEb2NocmpLQlR1TXFTQ093WjNa?=
 =?utf-8?B?MlExWDZ2OVZOOTlqWHY5VDFya210bWVYb1gvbTV2TURVOXE1ZGFNZ3hzRlor?=
 =?utf-8?B?TnhLME9BTzdoRlN6Q2NVS0dXTnVtVTcvamozZEFVcGdjamdzZUNOTkZHdXI4?=
 =?utf-8?B?M0NlTWgyeVhWTTMwSm0vOTVZRDJodys5RUl6T0hFVWZYQVMwTGw0UjQ2Nm5L?=
 =?utf-8?B?MlJyMDFoZ0tGQ3c2NWlkaFh6dndybjh2NUFYemRuSjNWNERHeUVTYlkyNjRj?=
 =?utf-8?B?VlhrWGxVZWwvVkRVa0g2bDNTMW5xOTlvbGp5MmhXaXFrMFRiYms0bnRrK3VT?=
 =?utf-8?B?RUVRM2wyWE53bmh2VXk1QnZUWHBKcWhjeUlDVDhIdEZ6Y3Bka1pDV1NMMHZ2?=
 =?utf-8?B?blNLQ2xwR0RhWllMdUM4ejkxZjVTam9vcjBLdFJZQmt0NEJaY2l0dGdlZDRa?=
 =?utf-8?B?YmZUakJnZGdURk9yVGFVZW9McEJqZGFicUpkMU5DWnpTOHd6ODVoV3hhUHRl?=
 =?utf-8?B?YlRHM2hYQTNuNHFyQVp2Nnh4TjdlOUJHbXhDdFVhQmdySlREK3dvWlFVWEhQ?=
 =?utf-8?B?UzhkOWtTVlBXbEtzOFEvMHR5QTZsTmRjZ1VCQTlnbkt3NDlhcVV4MHF0R2RD?=
 =?utf-8?B?Y2VQVFBiNGJweUVHakF3R2ZrTHhmbUNyUFVMay9KbE43UGREdWxNUStxaFhC?=
 =?utf-8?B?dG44SzR2RzNVRk9QczdsNUpZeGdtRHA2cTBZSy9RTWpvdU9EUVRPdTZZdCta?=
 =?utf-8?B?YjNRcHk3UEVMOHU3U3JoRkwxd0RnQU9ONDkweXJjRG1kdy9iM2NUTWZqa21h?=
 =?utf-8?B?cnRHZnZqT3FFV3R5RWRBUVlSTDNwc1l3djlFNUJEVnFBWG5vMjlYekh1MXkx?=
 =?utf-8?B?b3RQQWZkbVJ1UGZQbUxVaVMrQ0dXZWxZc0thNXZYbkx0NTJSUVNoRHVoejc4?=
 =?utf-8?B?OXBtYnMzMVFmS2o4SC85T1hTWEY5SGgzdDRrLzhRM3p1QjdDWmJXNkpGSkZj?=
 =?utf-8?B?WXY4ZzFuR2YxdWpxNjVpOENSMzRmaDhHYjRsSVlPRU5pYnBJZ1JwVkUxb0Rq?=
 =?utf-8?B?WFF0VmdwQ0dOeVFrSXFRZGI4TzJBa21lNFZ3YUhtWlZIUFNEVjBUNXljY0Nm?=
 =?utf-8?B?MTRsSVdQU0E2bWh6WkZxTUVaMllIdFF4ZlcyZVhuelJZWWFpd2ExK1ZCZits?=
 =?utf-8?Q?RSKFENkX1GONAf+ADI/9Cnfzj5+/6JHE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2FMT3VWeHFZWjRxMWw1MDM3MnpwVDRMbEU1Q3MzaGl4SGJDeUFONGFNWVZB?=
 =?utf-8?B?TmRwNUVzYWJpZHNOc211d0NQN3U1d0xOZTlCMFl2MG5MWm9yeHNnUmE1d2hz?=
 =?utf-8?B?Mk5sOENveFBKcTFoU1ozZFpKWnYxNWphblVvS2s0ZG5DcmNBeGVyN3hKckJo?=
 =?utf-8?B?V1BTWm14dkRvYlpaODRnNGVrNFpYWG1Edk9oN25mL2dOd2ZDbVFRMVQwdlRW?=
 =?utf-8?B?NUdnZ0U5OFNXZnJJK2ZkYnR1U1Y4RGVwS2JmWkdoK0t6VHk0bWtuR2N3RzhW?=
 =?utf-8?B?MnBReElzZ3pWT3VEcy9HS1RTUC9RNlY2S0N2NHh6TXpHZmtna1Q4dHhlNm9m?=
 =?utf-8?B?R0VYSjlVdjI5bnJFT1UycjMwNmxRZjltK2VDTHFhaXVkSmx2cG5oZ0VBZkFF?=
 =?utf-8?B?eUVieC9ybHdOWWpJQmNGWjZ1TUZhN01LelIrSkxBYmdEZVFzdm12VW1kMmNC?=
 =?utf-8?B?ZTh6VWd1ZjY5MGNQOWlyVmNIdnFCaVdIb05FUE9Xd1NTL1g3eVg2TEFoWkRQ?=
 =?utf-8?B?KzZrZ09XRE1WYzVWalBhUEJtWFRYTXhwNnBlYVJWSWUxSWdzbFFSTVZ2b2lJ?=
 =?utf-8?B?RFJ0c1ROejZEelU4aTh3a2N0Vm40TzQ3VjVTNEtEQzM2a3VrYmpvcGRsbVZW?=
 =?utf-8?B?VWUwUGxzZ2xVWHRmbU5iN05aalZncXNCQ0g1OTRQMVFWb09VamUweVVJTlI2?=
 =?utf-8?B?SkhZdTdnZlpmcGtnMTloSE93bG14NGJKc3VId0pBMUwwcTlzTXh1SHRqZmZt?=
 =?utf-8?B?NXpMbXB4b29TY0lMSGZWZ2dvalBzb3J5TzhIaWEvaUs1SFJZSU1MM3FkMjlj?=
 =?utf-8?B?VXIwVjRleFJqREszVng3L0pzTi9vSHBLOUdTYlUvTDUxdXdvNldYS1FMUTV3?=
 =?utf-8?B?dXZKcWZodUZWOG1ObTVOWERUc25vY0RGNFFnUkJ5ZFJiY3kwUVhLdlNLQ2J2?=
 =?utf-8?B?K2NTY3VMTXM3a0ZBYVdYemdubHdFQ3pDQWpzZzBTY0JHNjczMFlqK09YSzBx?=
 =?utf-8?B?aWFUVEpFNW01TVBtRU5DMU1GdUNOZCtrc1lVdzZMay92aWc0a3VLZ2NQRktJ?=
 =?utf-8?B?ZWROOU5QZmgxQytZZm5YS25IZEY1Vkk3ZUg2VzBrb1JkTENkblY0cU1uc0Zx?=
 =?utf-8?B?MkhJSGtuTkdwMUxGR0hCQXBKMmNKdGhoQVI0UW4yN3ZFNHZlRUp3NW9Fb0hk?=
 =?utf-8?B?dWhPTjQybWJGTEpjYm0vbnRFQTFVdlVQSzdXZWs1MTFsUFpYbkxVVjczay9O?=
 =?utf-8?B?OHYxSm1YWTYyaWRIR1ptdXJYVDM5QmdkaDRKLzZCOEJzN1pOMGpEM0wwa1FS?=
 =?utf-8?B?Q1BwdHd6bHBLSk4zc01HR0c5VWNvYmZ0TEp2VHFNVGprYSs3NUpaQzBIQTNa?=
 =?utf-8?B?RDVoWDNVU0ZkMEIrTERpRU1UR0I2dVBmVzlkTzFrcWpHbGRzZDVVOXMwOHRv?=
 =?utf-8?B?MEVTWk1BMWVldFR5M3NzQjk0bGx3YU1lckdpYkc4VUlSMnZBZyt2dGNxOEJs?=
 =?utf-8?B?WTJEckt3aFlxaUtrOVlsdEQrUVkvSnVHQ1dTTXViam5xM0ZVbFBlTjhza0ZS?=
 =?utf-8?B?WlVFZWY2Mkoya1pmV3U2WjlwS0dvTDhlMDRmMlZSN3JIYmZId1EyRExqRkEw?=
 =?utf-8?B?YjN0TFNFdEJZcWZmVzcyZkE5Z3FuSzkwR1ZtNWZrL3Q5dnYyaFBXRkVZdnAz?=
 =?utf-8?B?dkV6cjM0SmY4OC9pYlRGaytXcS9DTUJQaCs0VTZuK1FBdmpmRDUrYXhHeUVG?=
 =?utf-8?B?RndoRzUzeTB0ckNENlhjd2NXUWk0UHZXcEgydFZjWFNsaU1adG9VV2tmR1pj?=
 =?utf-8?B?aXcvdHAyMWFDT25sZnpDdkttUExCRGVvNHBkK2o1R3JEbUZXMFNHRzJjdVRB?=
 =?utf-8?B?Mnh6Q1RaTWxGT2dxUVFRM0pMenkzZERGdW9wOUFISjFJMnJkbndpRjQ3RWs4?=
 =?utf-8?B?MXYzRFUzcHFMK2ZSWWVIZ0krTEt3REV2Zy9IZnJLMTJJbVRuT00wR0tySUlK?=
 =?utf-8?B?aWhielh1UGNMZXd1N1dGUUQxZlVXRHZHTDhCVkhuQlYzclVheW9CWTRkSVBp?=
 =?utf-8?B?b29XSlBDeDhONHI2RnVvNnFINmVkc2ZpaHd1UU9OaEtDbnlnVlhWVUxGdTFh?=
 =?utf-8?Q?6JGA0YV1nubLudc7EJ0zM4oHu?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_046D_01DB6B4A.521C4D20"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2cc157-2e3a-44c4-3ca2-08dd39335c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:18:11.2633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPY97O7FtbD3lGQ58vIxTDOZv9HcOZUVTFNEVZWKt3agm0yI8ViLLRq7XMB0aJl8Uw9UlDi1TmnADSb8XFcvHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

------=_NextPart_000_046D_01DB6B4A.521C4D20
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Ran "b4 send --reflect"
But it sent to all.
Please ignore.

-----Original Message-----
From: Pankaj Gupta
Sent: Monday, January 20, 2025 2:46 PM
To: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof 
Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo 
<shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix 
Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; 
Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org; Conor Dooley <conor@kernel.org>
Subject: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave

5/5:
- increase the wait-timeout.

4/5
- moved imem buffer allocation to driver-probe.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: 
https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & 
se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the 
non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave 
interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's 
SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct 
"se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct 
"se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct 
se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will 
constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created 
structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", 
to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment 
ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: 
https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: 
https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: 
https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func 
"se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup 
& init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx 
*dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for 
waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is 
true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message 
API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's 
fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", 
"RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response 
to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is 
changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW 
loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and 
"seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of 
"request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the 
imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW 
loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: 
https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx 
*dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call 
to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), 
instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in 
fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in 
fops_read.
- fops_open is modified to create the new dev_ctx instance (using func 
init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the 
struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for 
shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), 
is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members 
processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of 
"se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference 
param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & 
exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, 
instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional 
input params.
- func se_if_callback(), is modified to work on two structures of 
"se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its 
usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of 
dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct 
se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: 
https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for 
ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: 
https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: 
https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple 
exclusive -MU(s), dedicated to itself. None of the MU is shared between two 
SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or
+multiple exclusive MUs, dedicated to itself. None of the MU is shared between 
two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, 
will be -enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95
+which has multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their 
interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and
+provisioned using the single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is 
defined
+  This layer is responsible for ensuring the communication protocol
+ that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a 
single MU,
-  user-space application(s) can call fops like write/read to send the 
command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to 
communicate with
+  Using these multiple device contexts that are getting multiplexed
+ over a single MU,  userspace application(s) can call fops like
+ write/read to send the command message,  and read back the command response 
message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to
+ communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to 
"se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, 
respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & 
get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & 
priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command 
response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before copying.

Reference:
- Link to v3: 
https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check 
for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - 
shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: 
se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in 
imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument 
to the funtions:se_save_imem_state, se_restore_imem_state, 
imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and 
plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when 
allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be 
assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= 
(~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer 
se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the 
reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, 
to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: 
https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in 
the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with 
NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case 
of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for 
ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file 
ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in 
response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the 
function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to 
NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to 
structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. 
Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev 
__maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, 
MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 
1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) 
device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following 
condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this 
flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child 
node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: 
failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check 
DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: 
https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (7):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      arm64: dts: imx8ulp-evk: add nxp secure enclave firmware
      firmware: imx: add driver for NXP EdgeLock Enclave
      se_ctrl.c
      firmware: imx: adds miscdev
      ele_common.c

 Documentation/ABI/testing/se-cdev                  |   43 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
 .../driver-api/firmware/other_interfaces.rst       |  121 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   17 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   13 +-
 drivers/firmware/imx/Kconfig                       |   13 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  273 ++++
 drivers/firmware/imx/ele_base_msg.h                |   94 ++
 drivers/firmware/imx/ele_common.c                  |  361 ++++++
 drivers/firmware/imx/ele_common.h                  |   51 +
 drivers/firmware/imx/se_ctrl.c                     | 1320 
++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  136 ++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |  101 ++
 15 files changed, 2647 insertions(+), 3 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
--
Pankaj Gupta <pankaj.gupta@nxp.com>


------=_NextPart_000_046D_01DB6B4A.521C4D20
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMDA5MTgwOFowIwYJKoZIhvcNAQkEMRYEFMln9Kay22kLHxsFNwhm
pLZKQdOHMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQAgrEtZWJ6dnELHLVgxQBlFiGrayO82364QFCPwAgsIISF0I3KubzZjZzyN6xCR9g/rQXvQABF3
2JtjkwP2uKJGzQ2LiORc+Pimr8SARZMeKznLAr4oPwkALMsRSvyu5v3xQJO8E+sqLxYaQPjYaMIY
AGuidKq8kM0pGGeoG+xVfEYkvOAbAjrqtlUG+fIL1qMLtHNAJV7DzW9w1l9ydiSRJ6FkVGxBEcc7
OhJAyh4FrNtGDZxERyVrO9+lPU+EHUQOj4sKhPR0uBjlOm/qG656imVVaAXQPH6dn2WLUSDecHnP
raC/UjgEONwVcM0dq8ok8IU7aY2lUTKAsSV4FKyPAAAAAAAA

------=_NextPart_000_046D_01DB6B4A.521C4D20--
