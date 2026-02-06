Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31E156CA
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 03:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770350106; cv=fail; b=fNIQWuXkaa/faLVZfrIn+yVWKtS1lKfCmlC861TJWRrxN/2sh58EBpspFx+B45/W7slm4tWjr1WLj0Ojv9mgBGTWVpdfhWDk0TGDNI9sjUC2gKAME2g6cg4/TVh9+Q9TUCHdt9DkiVgkrH+ud+8oavFk05JIUaKzSPD6E+Cz92M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770350106; c=relaxed/simple;
	bh=yxS1IGljDOSFsfZ/3O0mT91y8RLa09qWLwt2TjtSl6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cuGkDVxnhVWwJzLSrxRYR/fF8T3aUD5N4kYpcdzOxg4wpQddTUjlBuTKcuPePlknRevhXCtGTErwYFBEDs2RSSQM7P8lru1Xidv3V0HUm9JZyUz2A9OXvTJIIoEmAUlotKb0YHqQp19QHNtIPnGvltQ5ALWsa0RNDIcmQyL/bM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PWPtkN6C; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PWPtkN6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2OQOio89wERKILsJZG7NtixN/tIJkhKjSrkXkRMiap3eFq6gUQ+NEagjY6/2ErUiJHuawxCz8wfgcnSUYqz2KkR6Co7vjnC5pHwE60V3jTtl9mVh5YsuR3PCuv8fztvFUrrHwAnCbgztzIOK9iPpq89SzxZim3qpWd7e4D0FitXzGJRYK/tule4w54YaCAtZLID8fB1jdIZ/8oDvGT8XK56x4AW4mGb9AdlN4KCXDvpv4edjyuwDtKysj78UmfRFSc/EIgsfLT434CcxLH5AZ79QOW82QWxBruO+y3F5hJwF+mgTYGdjF66dssBhB3hdVsQrYMggWD21/pzq2tVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxS1IGljDOSFsfZ/3O0mT91y8RLa09qWLwt2TjtSl6g=;
 b=r8oN4KqcVUXtct1K3+h+KIiwkJm2IJ4nQKHr+Z93aqEm0/uHp5wsg3Xfut6WyiuuTffX15n7nEkYmjWLocm2XuGyzNAD7kvANz5T9/NCLahycj/FDDM0tm8b79QhU36Autw/w8c18ZfXh8Fadd4SMq4+nCSHcWpLqSOdyoGO333fPCafI+k+8XP4iDboYGwzAAHobaH428jyPTG518c639dnczaK0pMLm1FjdrRwQ6HbaVvRI/7U667J/Apvk2hXLxRsI81tLBSQKoxRBbmxUjW4HKfPmNH82+hbCu6bNlcV473zf4C8GoOuxiddWUZ0f5j0m4d8s+4unsAHSWveXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxS1IGljDOSFsfZ/3O0mT91y8RLa09qWLwt2TjtSl6g=;
 b=PWPtkN6CTGFKJqd3+zP4oOOJQsySrNhZhVm6DLI079jC1a7Mkc81/+S8WSLrEvM9P37OLByiHG3Gl6fJsirQW4RbTj9ToktakjKlKsjrZs5H21tR/daw4ggQP5uRr8afTd/imUkpRm+/3T6BR2Tzi/Y8IdWYcplQ5Ww5dA/MA5CGoCzDQ8SaDK21i0j80MfTG3FXRyJrQp++9jxU4c5scd6So2Cc8YtCgAAnvCnp4vrtgl0pLkk6kQhQxbxpGGS9KGdB9A0RjmGDS6550btW6ynmevufNrYlVt6SjGz89l6QmFxKSyQ2hr1e94a2+Zcus92/6LDZmGLPCvyt67mHnw==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by VI2PR04MB10165.eurprd04.prod.outlook.com (2603:10a6:800:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 03:55:01 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 03:55:01 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] arm64: dts: imx95: Add fsl,max-link-speed property for
 pcie-ep[0,1]
Thread-Topic: [PATCH v1] arm64: dts: imx95: Add fsl,max-link-speed property
 for pcie-ep[0,1]
Thread-Index: AQHciarXQO43rG+BJkafRiYZTvXFX7Va8aCAgBousZA=
Date: Fri, 6 Feb 2026 03:55:01 +0000
Message-ID:
 <AS8PR04MB8833FD605450FBB63AF8F2FC8C66A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
 <CAEnQRZBpLxM289h=OoZA5Dx_pDdG6Ude2wam+sULb=www68uow@mail.gmail.com>
In-Reply-To:
 <CAEnQRZBpLxM289h=OoZA5Dx_pDdG6Ude2wam+sULb=www68uow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|VI2PR04MB10165:EE_
x-ms-office365-filtering-correlation-id: e677efba-f616-4ffb-39da-08de65338109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T3VTOVZyNmRFYmwrQVRBdkpTUVZEeWNZL1g3Z1hBaDdFd0ZHOG1uYTIzMVl1?=
 =?utf-8?B?Q2hLb2cwRk1mMThlL3crVWpSYW81ODArdUE4ZWxML0VvZDJrdzJQcmpHS0NV?=
 =?utf-8?B?OEE1ZVIreHpGK2l5UkJ0VVBKbE5SYllaSG9QRDJYYzVtbGxUdFNVNzF6Wno5?=
 =?utf-8?B?T1RyZzdDZ0txU1VuRCtpRkpYU3Q2SEJ0aGdZYmZacGJQd0lDSGluVEVTTEt4?=
 =?utf-8?B?cTZqNmFoaFl6VG5GbVF2ajYrQlR5ZzA1OHdSRzl3RTZuYSsxN2d3VHQ0Um8y?=
 =?utf-8?B?WXEvai9jNkZxekxtanlQZnZvSVBBSzdsTFd6OVhacXZscGpJK1FzY1pnV2xN?=
 =?utf-8?B?MVplZVgvdFNVdlh3RjVSNG1UZmd3d0NVdHNMUEpOc0dkUjVJTER4RlZHRm5q?=
 =?utf-8?B?d1MrLzNRZ293bXFvNzZSU2RNdDByTGlmdFlrSDdpZ1oxYyt0OFd0NDVpTnpz?=
 =?utf-8?B?YU14VXJ5QkhxUnJpbW96TUZ3THRQT0FCaUdveW50WFZUTWdDVWUyM05CakEx?=
 =?utf-8?B?Mzc5aVNkeTlzY3B1M2pBSklpc3V2UmIzNWR0aUxnNThvWnFXMlhsZDBnVlJJ?=
 =?utf-8?B?bGpwbURFNy9lS3IyVGtFaVUwOElWTXBOMjhKOHhyeHJuNDY0eHRHb3hJOHJT?=
 =?utf-8?B?MTNDMkt4RURRaG9HbHRoZmxDSEtaTGFVelc3L28rMDFmMGNCVi82bUFUQmdF?=
 =?utf-8?B?Q2dKM1JYRGZ3cTZsYmxuN0VTbW13Zll0b0dmNFlkZmd5YS85QjRWbTRyYlY0?=
 =?utf-8?B?eWFZcDAvV08vbkJKRlpBcE5lZXptZ2w0eUlSV0o0ZWhFMFp5Zkd1UTUyNGE0?=
 =?utf-8?B?dTFQck9GdlJkdHB2Um1URHdGa0RyeklBbUVnOVRTcWFUSnlNenZIMjR4bmEr?=
 =?utf-8?B?ajlDeEEwL0tmQTFVTkRYWk5oazUrRVcvRWc3SzFKYW1nL1lpbkxoWUhCVWxu?=
 =?utf-8?B?MzBMNlh0TjJFT2hGZ0pORldBdi9NYmJ3aG9rTU9WVEVMVmF1T1dKUlpKSW9F?=
 =?utf-8?B?OTlQV3lhNGl3cDB0SEo1dGs0Mlh2NDFOeTFNc2d2dXM0T1RpU0VWUmRyeTYx?=
 =?utf-8?B?R2xsOTVFanFKblh5TW8xV1FqblR0Y1F6dW5sanBrdFk0Zy9LcmdPL2dueUZL?=
 =?utf-8?B?RFpJUnBPUDN4RHNwZnBYemdTS0V6U0ExeHhyNjNxeEUvYXFRWktrZ21FLzBy?=
 =?utf-8?B?V1VURlRieDdYOUVDdWhaUHA5MlhwVUF2bCt0RVowK2FQSjBCZFN2Mlg4NXFr?=
 =?utf-8?B?aHZ0dVVvaElSNGw5ZGxpV3dzbUNVSkJXL3pndEZtdkVydy9ObnBBL0RNbTFu?=
 =?utf-8?B?UXJ4TmU5VWovOGRvRnRrditad3NHVmxVdXBIWml2aXQzdmFJSzJtT0k5b01u?=
 =?utf-8?B?TnVUc0Ira2VFQ1JWYUZrNjI4NytHYm1Sb1NqL29VTWNhRHEwMnQrZzI5K3hD?=
 =?utf-8?B?cmtuaU1LcnMvMnA4azVkOEZuQzBsSURkaHhpRUg0elJ5NTRzNjBUYmtJWGN5?=
 =?utf-8?B?SUdpRXRvL0haWDZ3NFBhREVHZ3N5dEYrSFkrcnh5MXRaMSs5eXp2M1B3a2x4?=
 =?utf-8?B?Qjd4UmVYSXc0czBlSWRUdDM1dW1mV3FsQW1KTWMrSVozOTd5MGErYXNYSXRw?=
 =?utf-8?B?cERSTWt3cGZTM1VZTmZpaCs4N1VZbkE5WDFKRFVjK3FRY0VlVWVMR1drbEVz?=
 =?utf-8?B?SytGRVlVRkNkSkxxSnFTcFdhUU83REVmemJ4UzFITjN4eFpUYkFkM3Jhb3hv?=
 =?utf-8?B?bkc2V2Jvd1ovdUdwejlNLy9NWmZyeGhwYUNUS3QyOGpKdkVKeHhHQTRDVlNV?=
 =?utf-8?B?SjFDSEVTM0x6STc1Y2QrRGZsdnIxV0M0QlE4NExyQk5zN3Q3WGNqUTBUZjFY?=
 =?utf-8?B?OUViMFJPaUg0NGR1YTgzRTY4Ri9aRE9oVk5PbTJ6WGY4WGhtT0w5dEgzZ0x6?=
 =?utf-8?B?ZWUvcDN0ejhvVEp1SDNXem1oTEN4NkpNd05kTVl1eWlRMWJ4R1hMSVRNcVZn?=
 =?utf-8?B?dlNIejFUaUdjUXNOeGJyZDBzY3hYaDlKT2ZxSEJ3cUxpVzY2WHNBMU00K1VD?=
 =?utf-8?B?TDQ3TVFUbk5wNUZyS25ueUZoa3U5RUtZRW1PYzJVQTBVQmxGemthWDc5bU1B?=
 =?utf-8?B?ckc3L3VsVUpIbWxlRllyeWxJMnhUeDNYWE9aZE10Qm11YmlxRm1DR0tSUzVD?=
 =?utf-8?Q?pcmfO+4oHT3useQ2FhqcJ1s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0JnNy9wK01tR0s5VWhUTzlqajYwaW1DOEVLQlFiaGxBT20zcm5PaC91ZFVZ?=
 =?utf-8?B?ajlMbHY0eC9PT2RYUXRMNGNFeGs2Q2dYTk1hQnhEUFB1K0o4NFBWcFBCUEVI?=
 =?utf-8?B?eXBEZUROVjk1RUdsTElyZmZPZjViTGdYRHZxUjM1cTZpd1lTK1d0N2VhQTFZ?=
 =?utf-8?B?WUxDN0ZvZ2JIOStNQzh0Yzc1QkRNM2pVSlVGSkprNDk0RkJMYUI5U2RQWDc1?=
 =?utf-8?B?YTN4TDQrUVFLVWNlaGZaS2NpLzk2L0ZMSUd0N2VTTGFZWGFWZ3IxM1piL0l1?=
 =?utf-8?B?d1RLUm5DT2srdEhiam16VWkyd0lRT0pRRzVqdThHaGtFb0U1Q2svUDZZMklx?=
 =?utf-8?B?MDZWR05iYlo0V0k1YUVFemxtVEdJcVYrR0dyeXQwQURqRVduWnR6blZZaWFo?=
 =?utf-8?B?dy9PYmtkVlhNWWU3K2Z3Uk1Fc09KQmRrZm95RStrY0RKeWZhZEZpVVBXNkpk?=
 =?utf-8?B?NzVMcTN3N2JDODUzMUtSQXBrN3dMb2hFZE5XSTFSTlpQOGI0SHBPblN3WnZl?=
 =?utf-8?B?bGVqNUNjRUpXOXZoNGFKcDhtSzV6UU5NRkdTNTZUdEc2R1I4dHplNXJ2ZUQy?=
 =?utf-8?B?S3J0OTJ4TFVpQ1JrdUFBSUFsWCszeCtNSkhoRi9zYnJZWkRJN0RQYUc1aW84?=
 =?utf-8?B?cWxqU1IyMXRWWnJFT0xTSiswMkw3elBGeHpETE9rc1I5L29DcFFmQTdpL0JR?=
 =?utf-8?B?WWl5bHIxZDJnYk0wQU9JK3cySmlITmtqN2o2QkdZTVNQVk1tV0ZxVGdlRU5R?=
 =?utf-8?B?M1IrakU1Z0I5b1ZUYUlZYWt2K1NOdk9FYlVxb0V2OGExNTMzTlpQY2ZZZC9a?=
 =?utf-8?B?emFIbWpCOWVVczE3a2MwS0I2MTMzQ3VLenU0bEpyMHJ2RXBVUnNHTG1hYnEy?=
 =?utf-8?B?ZndIeTJSV2E3c2VKeVJMbTFTYkNyaWRWSDdtVmFRRlNvMVBVS21nSXFNTjl1?=
 =?utf-8?B?Skc2Ry9YdU5xbjJaYll2aC9RR1ZDdDZJQVMvNnZYRnVtSEtQT3dXdnNsNUJx?=
 =?utf-8?B?K2NNMVU5T2RUcEQ4QVc4SXZpbGRnRHowbXhlaXh1Q05Za2cxalk4eXlhMCty?=
 =?utf-8?B?WkNPWS95SkZQNnh6SW91QUV3WXR0c2F3c1l6TW5tVmVQZGlDZ1drQ0RPdG1V?=
 =?utf-8?B?ZE9VMUZ3bXBHeW84eU0xakZtSUI3ZVVZRzBPMkNJY3VqOU8ybHZuSit1VndI?=
 =?utf-8?B?bUhOUGtuR2hhRE5jc1BvNXVURndlTDVmRmhzM2s1cDZqckgveEdXaitjUlRL?=
 =?utf-8?B?b2dXN0xLb0tzQ2piTFZnR2tCN0hnUFJwVTkwc3B4L1VlVHRseXllRkpXYkVD?=
 =?utf-8?B?TENaT2dEcSswNU43SVRPdld4L1pzQ3FvYUxjLzJFNFgzbFNuUWJrQ2NOSG5I?=
 =?utf-8?B?MTVJYllFVVRLSnk0ZU9uYXhXQUdsNG9YUGt3Y2VBZFRVdzhRVm1qU0l5STFK?=
 =?utf-8?B?eWJjb0Nld25Ka3p5ZUZaNjljeHA4Q1N2YzRuaDNxb05za0w4UGp1aEFuRXRT?=
 =?utf-8?B?RFdwK0poT2gzU29oUnBlSFkrdGdLMWhkSVhHRWFHK3RaSDNFb2hCcWpJWURI?=
 =?utf-8?B?TWFNRmNMNm9pRmgxVHVDOWxUd1Y3MnhFdTJsTXVoaHdyOUxXWDVaMGVGc0U1?=
 =?utf-8?B?cTFzbDh0dHFXNXQ4RGw4ZmlCWnQwaU1hQ2hBekhXTTlqbVFDRnBTbWFTTzNp?=
 =?utf-8?B?Y0dOa28vTWpzaGVjZmp3Tzg0M1AzckFueFpUWHV5a3NJbjZNZytrVFFuT2VQ?=
 =?utf-8?B?Z1Q3bjg2T0phNVJRODA0NllqZVBpQ2w5alNnaVZzRFpnVmlEVm94WUI4QzhH?=
 =?utf-8?B?MXp5bmFQalg2dXIyc25HRVk3YjhhY2VIWVB3MFB0QTMxeGVGSHlhUkl0MUZP?=
 =?utf-8?B?TklVbUNhT3Vpb0dIQ2toSzhyY0RNdy8rMzBrWVpMMFM5eHA4MVlNaVdCcHRx?=
 =?utf-8?B?OXZvNzF2NXZqbm1VWWFZKzIzdlk5MlBMbkJHYnlqL3BBVzhEaENqTStRL1RB?=
 =?utf-8?B?dkNXbTFCWU1HUjN3bWtRV1Zzc0FnV0dDNXhKVWczb2IzcXkrS2h2clo3aFdG?=
 =?utf-8?B?ckx4THpoUHFWeHliUmdxS0FQVXR4MGVWeVMwZ1RkbzhRb3hRNGZSMWxjREdL?=
 =?utf-8?B?cmthWkRIOWFIVzgza3A5NFZmeEgzSUpTM0VyKzFOVS8yMzF6dmY1eHJzdkRX?=
 =?utf-8?B?WjFhQk1iNVJFQUs0WmIxYWJpQzNsOFJDNWE3KzNLZnV6NFAxL2EyQnFZWkFO?=
 =?utf-8?B?bFhkSTdOTGlUM1orZFRiT3g3ODJpcnhmR05CR0hrd09DZTlhWjhUTmNqLzdL?=
 =?utf-8?Q?wyRKSwI0YL6EG2jGW8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e677efba-f616-4ffb-39da-08de65338109
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 03:55:01.4970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SCdd/X6mLqTOySZePMtxbItHTBvwcODT+ULhvC/ZCxVe0K3SCgWsQb5BNqtJ15LgLyTkpu2iXUU1AO/UCZo+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10165

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgQmFsdXRhIDxkYW5p
ZWwuYmFsdXRhQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyNuW5tDHmnIgyMOaXpSAxOTo0Nw0KPiBU
bzogSG9uZ3hpbmcgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IHJvYmhAa2VybmVs
Lm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBzaGF3bmd1
b0BrZXJuZWwub3JnOyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47DQo+IHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0K
PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIGFybTY0OiBkdHM6IGlteDk1OiBBZGQg
ZnNsLG1heC1saW5rLXNwZWVkIHByb3BlcnR5DQo+IGZvciBwY2llLWVwWzAsMV0NCj4gDQo+IE9u
IFR1ZSwgSmFuIDIwLCAyMDI2IGF0IDM6MjHigK9BTSBSaWNoYXJkIFpodSA8aG9uZ3hpbmcuemh1
QG54cC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIGZzbCxtYXgtbGluay1zcGVlZCBwcm9w
ZXJ0eSBmb3IgcGNpZV9lcFswLDFdLg0KPiANCj4gSGkgUmljaGFyZCwNCj4gDQo+IENhbiB5b3Ug
ZXhwbGFpbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2h5IHRoaXMgY2hhbmdlIGlzIG5lZWRlZD8N
Cj4gDQo+IFdoYXQgcHJvYmxlbSBkb2VzIGl0IGZpeC4NCj4gDQo+IGZzbCxtYXgtbGluay1zcGVl
ZCAgaXMgYW4gb3B0aW9uYWwgcHJvcGVydHkgd2l0aCBhIGRlZmF1bHQgb2YgMS4NCj4gDQo+IFNv
IGl0IGlzIHBlcmZlY3RseSBmaW5lIHRvIHNraXAgaXQgYXMgdGhlIGluaXRpYWwgcGF0Y2ggZG9l
cy4NCkhpIERhbmllbDoNClNvcnJ5IHRvIHJlcGx5IGxhdGUuDQpZZXMsIHlvdSdyZSByaWdodC4g
SXQncyBiZXR0ZXIgdG8gc2tpcCBpdC4NCk15IGJhZC4gSSBtaXMtc2VuZCB0aGlzIHBhdGNoIHVz
ZWQgaW4gbG9jYWwgNi4xMiBrZXJuZWwgdG8gY29tbXVuaXR5Lg0KUGxlYXNlIGlnbm9yZSBpdC4N
Cg0KQmVzdCBSZWdhcmRzDQpSaWNoYXJkIFpodQ0KPiANCj4gVGhhbmtzLA0KPiBEYW5pZWwNCg==
