Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510473;
	b=wBYnFckxPn8WcJ8mWCk7sj1p4P5WerzWdQOFa39pAk8rl4Au+SJJSStkG23wXBZlZ4rX
	 a3nBlqEYS0AY5vKLiL/QI+6Q5bTtNzPkTTQcvMFie4lbuwpnI1Rmjs4RkwtxroLqJQ0sR
	 azBz4yJdrBivk3jysr8C4Gs/vFMUwroJMd8z6TVmRym+pYOMJMk27rCcaPatX0XORRZIY
	 k7Dk4vS2lIBgWZuxSFXr6z8vqs8pzlzc8cKi2CjouMsVGq8A9TRUhLLsPrUgcv8d7lfOg
	 DwDgPQPY57vjxUbmU8+VsyS022fpAwMBXFeu3sJOknXx4Si/cYZAhTZXNr0ge4bCkhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510473;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CwVbosOlL8Hz3Vj5N/j3/ty3UIgSCCyfBKbuPFDa1hI=;
	b=pqWQTW4TB6X/O1z2ExZMIt82SlLMlF9M9EYnmu3gvT6a1MvqlWzzu4EWDBjNpYHA48K1
	 9IjU153V6/BXRVphuSWFfs0eiQDucb9J+7X3WB0zu4REpFgVLxVJm6GBclz5unZfGKF2P
	 zBeePgiYd3iMVoahakzHjQA7LHP8xz2Fvy0rsMK7liCU967/jeZyShQPehpoTpUZl2IAf
	 v9U9bKebKjyfBGIPd67P2zf3wYqdCU5B6drbGhubNHXAf7fyn910dDExVbSa6hIgxHvPk
	 R0GLdBpB62HwuZgepnQfzqL/wuEN+1K2ztjoZwnx9gsXZoZ06IEU2yTPTomVAjyJsFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=cmsZghmJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.142
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023142.outbound.protection.outlook.com [52.101.72.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C3606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 08:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=cmsZghmJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDr/k+Pjtj5W+zso/VLIQ5HVaDfzpopKAQywm/6BgJfqMwjRBseyMaA6C77sVcEHB1ux8iDMOEScYQ3+SSJXouZFKgQ4GwYJTZ9WwH/tAcfV+287xWTsyhD97YNq1ykjT6If9On5qT5aURswG2OshqrSQ48vWSEavDHJd9jYZr8DYkPACAn2mBdkz5EmyEdA/1B+Qdf6/fvyNPUjO3CzzcsPN5XqQf8XhIjm0YG9BwsO+EZJkP4VTgR4aTd6LWYNKbeTHZEgGnWD3x6XFtmoLZNtvFZzky2LqVkwLhqvMDa7n36H0TUmiYdgFdjsbHLmpc8ymVkF+dWVivP/L3342g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwVbosOlL8Hz3Vj5N/j3/ty3UIgSCCyfBKbuPFDa1hI=;
 b=ntw68EQ8wFRDpK8CXMxXYvGlmwV9z3IIeSCTZRzHWjo+sG2Rj+CiI3SwKoj39JSfL/7fEQenvcBsU+KWtegNwFNbTooFGfYysRkyRvzQXGSu3zVZZdfSLA0HHxJL7n9xTYdfi6vw/fqviTzZu8y3YnpGNw2C32fFY3hU6GSNVQfn6xeahUu2wedgfdYjQYCdD26rLPcC9t277wxL2Ig2gytRbfMpol4VA2QmFwd8AjbrGik1E7OmUzKQ2k22CHXY2otYLnCOKmHXc8dGTuxbYcAvjhrTZyMWbmrBxogPBHEkcPk9h4D/48gt2c5f3vvEtaGS+M9oY6wu/jktF9hE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwVbosOlL8Hz3Vj5N/j3/ty3UIgSCCyfBKbuPFDa1hI=;
 b=cmsZghmJGf0V6r0vffyGLiLOxWZUa1vjgBvZknMqiEiafwHKcoZzIjmBOQ36QrDcWx1vM8S349XL5BM82f+/5J0TT51Lb75klkkSDYYnH2MuqdZiq8g3zphjdb1hozsPe1lsETkGm2/JBCpHeAmbdAaPt6s7os+YpK63i08dsnEkg1n7K0OFUNF7CQ+pQFIQqZjGHz1iz3S4+gICyTsz18yRarX64giVgUJJQs72hPGFDS/toOQrfdU7+uRs3ErlfeD/i8aNk1YV9mqaHz8ivvFd7V24FiVU/ip1Ae3vRikdXpvzyly4Mejq2Tz7c/LbH3c63TFD4Q3VESPtr4H2mA==
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:b10:105::21) by AM9P195MB1186.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ab::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:54:29 +0000
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893]) by BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:54:29 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Benjamin Hahn <B.Hahn@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <J.Remmet@phytec.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 2/5] arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
Thread-Topic: [PATCH 2/5] arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
Thread-Index: AQHddbkC69r35dlUE0CopD8Nj634Pbc70EuAgAEnFgA=
Date: Tue, 24 Nov 2026 08:54:29 +0000
Message-ID: <189fda033c9f064abf6babf6c4911f1b54fde24a.camel@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
	 <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
	 <dcb6b43a-2315-4cb5-bb4a-5b060c1803be@phytec.de>
In-Reply-To: <dcb6b43a-2315-4cb5-bb4a-5b060c1803be@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESP195MB976599:EE_|AM9P195MB1186:EE_
x-ms-office365-filtering-correlation-id: aff35d70-4f00-4be2-3b2e-08df4a088cc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|11063799006|56012099006|261021135927099003|261021123027099003|261026140227099003|261022105027099003|261009221227099003|261026121527099003|261009223027099003|261022075727099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 GnV9POI1CCBQuM1k5IE0yXVLSollJR+wrZYoihYtveuj2iwy9njvIXkxVqXdXYS0JqOMlygZz2oAoHMNInQJYNZkRzu5HMPbpc43F464XxoI1frtDatvMmlv/AY1tTy7TLN1UaeTScgUW9ep4IctVP1ydxwqbQ/L4KMi72ftfdq3+nh31Jn7deF8i+fpMVkTxmnxs1KSfQ0Rn8O5413YElky/52F3t0BtzQr41u5jTEwzgHZXjGW4H1r27FgQfCekgBNaM8bvEowvZLxmGAoKSi8etVeY3WopYMwmNCBJurAOucFR06lwYDH6PtXMWVgGmkmOPguiStf/ixCtRWVki7lzqp87SAP0SXvLjPHPY7mt1wT/qEzKScWPwaGzUFt5dGqGaWqrzosyvv9OefN6tLNg8fMiMfE1Q7MESH6iz51uAbTxI6igYgCEhuixkUZDx92NWK9xDQ7b2VPVO4BAzC8wajfYOXjeaF7FJ/9Lg8GZDrnDIgcoeDFNGSeqPRj8o3Bcm5p0OLbgQvLxU0kwWVnRDVFfN8UWtUhwxdENXYbM1jN8pHI90tjHNq5lE73REcHto2pZzvNWmis8DMgdHR2BgafytNdxyE3B1xd+LBxGLP/811EiG/4yoU7DXmi/1gPPadb/vAR7gaRanCmtFjyWyHViNW7XK4JV1fxn41a5uqOBMiAuAo6wjsfRRXkrX6pOYlO02sY9buxoXGCWp0xlsIDILTNpf9/eOKkl1c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP195MB976599.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261026140227099003)(261022105027099003)(261009221227099003)(261026121527099003)(261009223027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2huamNTM09TL3dPcW4velZ3Nk1wUVc2em9iZG1oMjEvNW14cER0SkwvbTV4?=
 =?utf-8?B?aURqVjBLTXhBTDlEQjVuMHdSMnBNWHE2QTRCK2RpcEZXcUJqRldDakFka09W?=
 =?utf-8?B?U3lYM3lJdUk0SUlXdklsSHFtQ3VEMG5IZUkrckp2aStBTDVvTk40SHVsTGJE?=
 =?utf-8?B?c1BDd25zRmZrZjh6RnNYaURhbDNJVHh2K3BaTk1FMWgyNGo4OGY5Vks4cFFN?=
 =?utf-8?B?Sy9UeWdpYWk5TjlFSE8vN3JEWGhmTDJaTERwalQ0TGxhTkw2SjJkWmw0d0VZ?=
 =?utf-8?B?eGhqYlFBbjlxRzNSOEthN1VSUEJBUjBNeHpTSGt2Q1B2OXN6Vmo4ZUM2T1I1?=
 =?utf-8?B?Vlc5MURuN3pFMGx6dWlYaVYzNy9ldFhsNm5qMjhxeUlNMDVxVlF2SW53bHNa?=
 =?utf-8?B?TzVBRC9VR3MwREtRU1EvSy9RdUtmSUx2clNRRVZ0bUs2NlV4SCtwSXlMczRQ?=
 =?utf-8?B?aldZTkhqelBxZzFIak9yd1kvQXR2L3RpMVdpKzYvQllYdHdEeHlad290eWNo?=
 =?utf-8?B?MnMyZU1YUTg2VEI3eUZueWl4bThCQVVZWGNIN0l0MzlsRUVEVnRsVFpXcy9B?=
 =?utf-8?B?QWdjYks2anBRWlBzTjJjR0RFOXArY2RJRlhNbHh5OStCY2xvVnlWRG13UmQr?=
 =?utf-8?B?b3k5dm5aZ0xkVXNXRTlNRnZQcnBjU1drS0FYRTBFOVN4dnNoanlQV2F1VWFi?=
 =?utf-8?B?bWp5N1VYdWdlQ25sNTNtZ3Mra09TdCtzWk9GWlAyNzFmaTZOMHpmTjBzaVpk?=
 =?utf-8?B?WHQ1R2dnelpHaTZKMHUzUTdKc1BCbjdESyttNjgrTHFPMElNbml3MExwNGc5?=
 =?utf-8?B?QzlCbEJMeDdPa3V6Z2JxMW5mcFZjSTdGcVgxa01xQkpGbE9wc01PbnJXdytG?=
 =?utf-8?B?OU9mYXVyZkpTY05xY2pmelZGakpkNnVkaDVMdzBHQWVsenV3WGF3ZHNBTWRv?=
 =?utf-8?B?aE9ueURHMFZZTm9oRE9ZUnZIbnhwd1JrcXpwR2lrc0xoa0FLOThhNEc0LzIy?=
 =?utf-8?B?d1lXSG03OFkwOFFWTlV3a1F1QlVrMER4SUFMU0xLWWJZMjRmRTRzcHFMaWx0?=
 =?utf-8?B?aW1sTk9zRkwwa1JHTmxtTHk0NFJTRExKQVNnQ1V1V2tHcU9iVlduZFdPck80?=
 =?utf-8?B?Z0NNVGF5bi9VQjZRcGVTS3MzYUV0UUFkQmNKaUpudVVub0ZHWWUwbnJJYVdD?=
 =?utf-8?B?Q25SQURNOEZuaHUzdGVic1RER0hIdDdDZ29FMU8xY1RicTNsa0UzVXFFSlVx?=
 =?utf-8?B?cC9GY0N0dXBwK21uRlpaSUR5M3JJMXo1bmRpNDRmcXZNcFZDRldtdTNucVRr?=
 =?utf-8?B?a0FGNEtyelpVYm1qUUt5TzZsN24zQVhBTTNRQjlpdG0yaXo4MG5ESENraGlj?=
 =?utf-8?B?N0hiWTlpT3E5ZGhzd1NINDlCVE1STG9OZjQwZE5XazE3bGp2NlZIVmNyMDFG?=
 =?utf-8?B?ZU9WWEFiaTJwTUt1U0hGRU5oNmRIR1A4TERJaVlud09ybzRDMm5OTzRuRnJK?=
 =?utf-8?B?clNvbzAwOVZBektpK0dNSndQQUF4OThva01ocSs0Q0Y0UWs1QlkycFNpSk01?=
 =?utf-8?B?TE5tL3FmSmNRd1VmMk95NjZlWWJjR3J1MTNYMWFQOVJMaUxEQldkazQ3L0Ev?=
 =?utf-8?B?ZklzdncybXA1UDZseTNuUWd4QjFMR3ppd3NFQ2dLY0kxMGc5MTJSMjU0aXFu?=
 =?utf-8?B?STNKY2djbmhpc3MzYlhmbzIzc3dxVUtGeVh6RFhPRXBLeXh4elpCV1pOcDV1?=
 =?utf-8?B?aDh3Ky9nOXhPK1Z5SDB4SzVDendwNy9NV1pPQm4zUm54ZGMzZ2NBMUY2a29B?=
 =?utf-8?B?UTcyQldxWlRxV1VET2hERDdOMS9vcDkxZnNNZEdtbEZnQ0pNZkE5SWVyaDBp?=
 =?utf-8?B?YXE3ZW1icGF2Z2I2UFdoTU1sSFUvMW1GOEZOdE05ektUSDFBeXh1aWJPeXNy?=
 =?utf-8?B?VUFWT09DcFlDTk5hMDRSd3ppL0p2ajg2OGZUeHc5UXJCdFNFTS9xbitSRWd2?=
 =?utf-8?B?S2ZEZEc5THVPN0VUUmJOOU1LWXdoNVZ0dXJ4Y2R2YnM5Skp3bUNjZUhLUkZm?=
 =?utf-8?B?dWhoczJNOEFWbzlGSk5CMm81REsweWRRekFLcW1iV1JLUDE3cU1FeUlzUUxi?=
 =?utf-8?B?SU1NWXpmclhRVFdJdFhvTXhYSEFLVUN6azVxUHBQYzNSUmdjVE9LVzU1cjRZ?=
 =?utf-8?B?c2w5VXVlYnpzb09hZW1uOVJIWUg4WWMwTi92ajhyelpteHJ5a2ZreGhyYXpt?=
 =?utf-8?B?VGNzM1J2TjVUVUhTNXA5aWRCR0puZGZybDR3NWF0bCtnNGtySFhiWVJMM2ZQ?=
 =?utf-8?Q?vDlWEZ1gVbNas0djSF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AE9AB4BDF72F041BEE21AC285701FAE@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESP195MB976599.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aff35d70-4f00-4be2-3b2e-08df4a088cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 08:54:29.1390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93MhRhx6DwW5PZMMpO/ufUpkWKqC0lYyLGGc1qAyZJDq7p8lu4a68vrweu1a77BZnLsQqimZesLaYbMI61lnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1186

T24gTW9uLCAyMDI2LTExLTIzIGF0IDE2OjE4ICswMTAwLCBCZW5qYW1pbiBIYWhuIHdyb3RlOgo+
IEhpLAo+IGRpZCB5b3UgYmFzZSB0aGlzIG9uIHRoZSBsYXRlc3QgZG93bnN0cmVhbSBzdGF0ZT8g
SSB0aGluayB5b3UgYXJlIAo+IG1pc3Npbmcgc29tZSBvZiB0aGUgZml4ZXMgYW5kIGFkanVzdG1l
bnRzIG1hZGUgZHVlIHRvIGhhcmR3YXJlIAo+IG1lYXN1cmVtZW50cyBmcm9tIGRvd25zdHJlYW0g
ZS5nLjoKPiAwZmQyNTY4OTNhZDIgYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBpbXg4bXAtcGh5Zmxl
eC1mcHNjLWctc29tOiBGaXggd3JvbmcgCj4gY29tbWVudAo+IGEwODkwZTY1ZWI4MyBQRkxHMDEt
NDY6IGFybTY0OiBkdHM6IGlteDhtcC1waHlmbGV4LWZwc2MtZy1zb206IFVwZGF0ZSAKPiBlcW9z
IGRyaXZlIHN0cmVuZ3RoCj4gZGY3YWQ4NDg2NWQ2IFBGTEcwMS00NjogYXJtNjQ6IGR0czogaW14
OG1wLXBoeWZsZXgtbGlicmEtcmRrOiBVcGRhdGUgcGh5IAo+IGRlbGF5CgpJJ2xsIGNoZWNrLCB0
aGFua3MuCgo+IAo+IEFtIDE2LjExLjI2IHVtIDExOjU0IHNjaHJpZWIgWWFubmljIE1vb2c6Cj4g
Li4uCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1w
LXBoeWZsZXgtbGlicmEtcmRrLmR0cwo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXAtcGh5ZmxleC1saWJyYS1yZGsuZHRzCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uN2ViZWRiY2JhN2M2Nwo+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWZsZXgtbGli
cmEtcmRrLmR0cwo+IC4uLgo+ID4gKwo+ID4gKwlyZWdfdmRkXzN2MzogcmVndWxhdG9yLXZkZC0z
djMgewo+ID4gKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ID4gKwkJcmVndWxh
dG9yLWFsd2F5cy1vbjsKPiA+ICsJCXJlZ3VsYXRvci1ib290LW9uOwo+ID4gKwkJcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4gPiArCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsKPiA+ICsJCXJlZ3VsYXRvci1uYW1lID0gIlZERF8zVjMiOwo+ID4gKwl9
Owo+ID4gKwo+ID4gKwlyZWdfdmRkXzV2MDogcmVndWxhdG9yLXZkZC01djAgewo+ID4gKwkJY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+IFdoeSBpcyAicmVndWxhdG9yLWFsd2F5cy1v
biIgYW5kICJyZWd1bGF0b3ItYm9vdC1vbiIgbWlzc2luZyBoZXJlPwoKQWZhaWsgbm90IG5lZWRl
ZCBhcyB0aGV5IGFyZSB1c2VkLgoKPiA+ICsJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUw
MDAwMDA+Owo+ID4gKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47Cj4gPiAr
CQlyZWd1bGF0b3ItbmFtZSA9ICJWRERfNVYwIjsKPiA+ICsJfTsKPiA+ICsKPiA+ICsJcmVnX3Zk
ZF81djBfaGRtaV9vdXQ6IHJlZ3VsYXRvci12ZGQtNXYwLWhkbWktb3V0IHsKPiA+ICsJCWNvbXBh
dGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiA+ICsJCWVuYWJsZS1hY3RpdmUtaGlnaDsKPiA+
ICsJCWdwaW9zID0gPCZncGlvX2V4cGFuZGVyMiA3IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gKwkJ
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAwMD47Cj4gPiArCQlyZWd1bGF0b3ItbWlu
LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKPiA+ICsJCXJlZ3VsYXRvci1uYW1lID0gIlZERF81VjBf
SERNSV9PVVQiOwo+ID4gKwl9Owo+ID4gKwo+ID4gKwlyZWdfdmRkXzV2MF9yZWY6IHJlZ3VsYXRv
ci12ZGQtNXYwLXJlZiB7Cj4gPiArCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4g
V2h5IGlzICJyZWd1bGF0b3ItYWx3YXlzLW9uIiBhbmQgInJlZ3VsYXRvci1ib290LW9uIiBtaXNz
aW5nIGhlcmU/Cj4gCj4gPiArCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsK
PiA+ICsJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMDA+Owo+ID4gKwkJcmVndWxh
dG9yLW5hbWUgPSAiVkREXzVWMF9SRUYiOwo+ID4gKwl9Owo+ID4gKwo+IAo+IC4uLgo+IAo+ID4g
K307Cj4gPiArCj4gPiArJnVzZGhjMSB7Cj4gPiArCWJ1cy13aWR0aCA9IDw0PjsKPiBGaXJzdCBv
ZiBhbGwgdGhpcyBpcyBub3QgbmVjZXNzYXJpbHkgbmVlZGVkLCBhcyB0aGlzIGlzIHRoZSBkZWZh
dWx0IAo+IHZhbHVlIHByb3ZpZGVkIGJ5IGlteDhtcC5kdHNpLgo+IEJ1dCBpZiB5b3Ugd2FudCB0
byBzdXBwbHkgaXQsIHRoaXMgYmVsb25ncyB0byBTb00gZHRzaSAoYXMgaXMgZG9uZSBmb3IgCj4g
aW14OTUgcGh5RkxFWCBTb00pIGluIG15IG9waW5pb24sIGFzIHRoZSBTb00gcHJvdmlkZXMgNCBs
YW5lcyBmb3IgdGhpcyAKPiBpbnRlcmZhY2UuIFRoZSBvdGhlciA0IGFyZSBvbiBtYW5kYXRvcnkg
VUFSVCBzaWduYWxzLgoKQWdyZWUsIHdpbGwgYWRkIHRvIHRoZSBTb00gZHRzaS4KCllhbm5pYwoK
PiAKPiBCZW5qYW1pbgo+ID4gKwlzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+ICsKPiA+ICsv
KiBTRC1DYXJkICovCj4gPiArJnVzZGhjMiB7Cj4gPiArCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xr
IElNWDhNUF9DTEtfVVNESEMyPjsKPiA+ICsJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAw
MDAwPjsKPiA+ICsJYnVzLXdpZHRoID0gPDQ+Owo+ID4gKwlkaXNhYmxlLXdwOwo+ID4gKwlzdGF0
dXMgPSAib2theSI7Cj4gPiArfTsKPiA+IAo=
