Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640D3B8D56
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057670; cv=fail; b=Wg+N0YtJd+hJQJZ0RxF9OuEGZFe0DHoonWSJlIHd9yv7O+AtR6cruF9C5EPBJMRVNco1Bhx1gxLk5G+kMydoKDbb9BSgX1lsrLGV5FUYKsW5QG38L1KlV+w4oKFWK+yN1F+5r+s7GUV7FGq1OmvvUpuPNpsxmpDo1vsVkNf7wP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057670; c=relaxed/simple;
	bh=oLcOh2PmNL6/03m/hXaif9QZ+XE1Q47++uQHcBXOFho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CfD9LuMsktLNTCV/PL03VkNfPsWfBGoYkpwNjYFIWQ2JdRUdyM3QdbvQ8dqlRSbiUl5/yUsB6ZRidPAiCYNVWpYEZBOIjMe1rvud6sm8tgaoLTok0KPwBr3cQsj+lcsLY0MaJgQeATvK/CaFl5X+xnWReGq1Vn9lLOkXkGOE03I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PrFezxvg; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PrFezxvg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTe1jZwdEHWA1rxYW2H0ixAsx3ulU+biIPdI1r/Ou4oT+rCe2MEz9vdxUoILWGvvf9E+pLLb6Gh9mGff+J2NnJn7rEcB1H6EnM1MdDjSlMDzO8deKEeMVeIyzDDWu0h8CMhTXApoxNf+a9biMTWKYWc7CEr172mPFQE6OKuOL4BkgS3bjLvyQKqA8b90HyAcjtaXOT/tmTIrqoJ6Jq+BtruWiPkKVTIkPL3jBm9qJGloM5tEiRjgiAxW8qjr0hAuEy+u0yX0btZ0YH6dFH+jGNzhuOsdRVGdLMa4EVUr6SVdgbniThMCA4dIWaAauNrl5Ij3H+HBVPBG3K3GUgShzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLcOh2PmNL6/03m/hXaif9QZ+XE1Q47++uQHcBXOFho=;
 b=uuDZdUWQBs4gv0VzIuikWCCZAYWmCeKwVLEQvhyE/RvatH56qEv/nz1j/pKf3dlapDPxh+mNn1FuklX9hPcDHQotC8Hro80RAD2HvxA4L5fC2V62ljTXQIhbQIRHHO4KZZQ3zLzWjliyvOyKHNYix13N0ZD+ExUZMrBJgh2lVF/MJz35z/Ash/Qf7aNbbs7fWGIGgiYMandwDT8ZE7js+a1C7WBxGquWMwUdjcUwNPyLJ6NzWOLhBZLjeAHVvnUJIYORgw2evG1GlKCONqGsXA8pqlbIQB8wVaZir1vMNgUPpKBM6Bf+htCglq/HMyjAyMrxMbJVcrTzRtsexrJ74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLcOh2PmNL6/03m/hXaif9QZ+XE1Q47++uQHcBXOFho=;
 b=PrFezxvg/uzAUB/1XUKIiKHZs1aiiP366B19N3Ij16IVWM4NUX1uCt8sFswWEOm5zUORwnR3vmWeumO2neYMXAZ2py8+TfgVmKC+vElOudmUfcboN9WjuWT6+r42tvJJ2M0ii1G7tsxF1I7CCgY7Z3u25oxCtB4goZOvzTH040ehEpWKIU1PGR5+0meeXiwNhiuYB7vSPp2v7s+i+sBt94j+Q23Y4ljgNvBBOGX0oNcKvzkWb05idPUYa3Zyew/+8PMvYF3P22frTKyEfwPBEyeFpQ5PMqE1xNsbo/EL408uuUOBGoFVpihmUmhc8P9h8cC1Q6YaOmN8EEIZBV7fLA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DBAPR04MB7431.eurprd04.prod.outlook.com
 (2603:10a6:10:1a1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 04:54:21 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 04:54:21 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>
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
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index:
 AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRCAAEjGgIAACMaggAAgIYCAAAPEIIABOKlA
Date: Thu, 22 Jan 2026 04:54:21 +0000
Message-ID:
 <VI0PR04MB121147D366A20A2400590CF359297A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <27e88ef0-afc9-4108-a136-754a90ade0bd@kernel.org>
 <VI0PR04MB121142F03A29796D0204A89809296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To:
 <VI0PR04MB121142F03A29796D0204A89809296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DBAPR04MB7431:EE_
x-ms-office365-filtering-correlation-id: c300efb2-c67d-4f88-1348-08de59724e7a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmRBVmhyajRLdTFMMWhuZWhxYmI1K3JsMFhiRXNmNjNxUGJoQ1dVcEY1SGh5?=
 =?utf-8?B?U3p1WG9SNm5iTy9KNnZ2b1ZIaDU5dUhqYkovenBZaXJUaFBzWVBoTVdtRHhn?=
 =?utf-8?B?SUFJZWhqbWJma3VZdUJva0dTS2dDTVFRbkZKVVNneHZkLzJTYnRpYmh3cHMw?=
 =?utf-8?B?aEpqbnh1TFU3ZXRzNGhqVTdUSG52VFFRcmtGWWk0bW8yQmVrdUp0N1IxL0ti?=
 =?utf-8?B?TWRlZmtsSjg0cjcwRlpGMFV3OFRZeU9wN0IyL3NudXFYbHpMYzFaS1d6MDVq?=
 =?utf-8?B?MU8wS1luekNwZHpMU1BTYUpVc2xvZzlPcXN5dGtCM2NIdVlnVGpqeElLMUtW?=
 =?utf-8?B?TGdnckdXd2dqcFhIcG1XZCswQnFqRjd2UmpXbWVUQVNpdmI3L0tOUndTMHFk?=
 =?utf-8?B?U09ESGFhRkVFbEJlSFJmc1hhQ25naWd3dkw2cUFGMFpXQ2VTREF2RWNPOXRs?=
 =?utf-8?B?eDcrZ1lGc1R1SVBFMFBNdFk3MjM2VTNXMU5UUWVVaExGT0dFTlhlSE52enlz?=
 =?utf-8?B?NFQyczhkSEZPT1U1TDhYSnFURFFuZmc3eVJ0WUM2N29OSENZS0hOWHJ4RjZz?=
 =?utf-8?B?bGdId3EyNm5Bdmw2eTUycXd6Ky9wWW14ZVlhNFNYTnVyOHlRYTBuQmZDeFpo?=
 =?utf-8?B?WkxoQ0ZJYUZIbGtoWTBSNGloRUZwN1JoUEcydVppMjVUZjNiSWYxR2QwSzdT?=
 =?utf-8?B?M0ZadHlzaTB1YWdTWnFicEpOT3JzUDdIQlpvZFA0eTc3bGtoeURaRjdMUUdN?=
 =?utf-8?B?Z1Q1cEZHZDFHcjJXODhRZFI4Z2NwRVBhUGpBZy9XK1NVRTdaOWVSUHdrRXNz?=
 =?utf-8?B?THJyRU1tNXc0bW00T2ttQWhTY254SHE5ODczU2RDLzRLdXhUNEFhNXRGNFQy?=
 =?utf-8?B?TmZjZ1hGUGlVODZ6OWpXRnlaUEUyV2NZMU03cTBIcDR4QzJER0tBQWZ0Z2s2?=
 =?utf-8?B?TFVCSVFGNWJvTGZmK1RiMzMyaGZIcHVjMUJoeDBCK0d3N3o3UVZCcDl4bFFL?=
 =?utf-8?B?RTJULytnQXJ5M1FJVzBuL2JOd0FJM1dMd0o0b0xqdmliNlpzanhMTHM1WkRB?=
 =?utf-8?B?V015QUdva0VmdW1ZeG1xTVQ2SFJiS0NQVmVGZ3RyNFJFZzNYMHhKc08xY2Q0?=
 =?utf-8?B?QkJQWjFBanZqYWs1TFVTVWM3OWJ5Rit1MFZ3ZlVWNXYxaHpsUEJYdG5zVjAz?=
 =?utf-8?B?d2ttdXhVZ3NuRlhtNlRDNHR3Z2RKQTRXb3BrQjlkNk5NRng2OExTdlZBOS83?=
 =?utf-8?B?cE5RWE8wVDBzNjNKZHJaaTVDL1pSVjVEazZFVlNlZFV1aFJUL2R5V0d2Z1lh?=
 =?utf-8?B?MGJWdEp0WTZXVXNpVVNIeTdmaXhiSEQ4YWZ3ZEpKaFhKSUYrUWVFS0RLc3R4?=
 =?utf-8?B?UzlTNTFiV0VaSVU1aElpMXg3UDBzNFBINlY2R2pkTUV5dzBUT3JKOW9VUDFL?=
 =?utf-8?B?VytWckxjOWdBQlh5K1M0ZnJYMHBRbWNQV0JJYktOaTEvMTZ4RFlsL21NdjUz?=
 =?utf-8?B?Z29IVERySXFzanhZQVdKS2lZMmYwM0JSOW9zMW5rNmhrS2R2MldkR2M5M3Ay?=
 =?utf-8?B?N0NPbkxVcm1rWnZRZUl2YnoralJ3RVlJZUdldEMwU2FhVnVRL2k0K0puNmFK?=
 =?utf-8?B?MEc0cHVaSndpTEVWcXM3TmkwWk1OSlZ1b09YMk1VN1ZsT0FkeHB5Ly9yTXhH?=
 =?utf-8?B?V01FK2JPY2duSnljWVRjaDNoQkJJcG5TSUs1bldOQ3BkMWc2YXVYdGtTaFY0?=
 =?utf-8?B?RklSaG5mdmRPRm5weXcrZmJaWFY4cEtCVXRnd0IrdlZUbWJod3hnditnc0dT?=
 =?utf-8?B?VVZncHhyRGRzcmRIWXN6d0o3S1pPVFRxNjBTNCtIMDQwQzJUa1BDWjNWandF?=
 =?utf-8?B?ZG5jaldtTElnSzhET3I2aDJLSGp3WHhFU1EwVzM1UWcvcG9VWHhBaEF3anhp?=
 =?utf-8?B?VklCOFIyRWJOQ0RlVzYyb0YySXk0NHBOUTNrZmFmS3pWeUNXaUpkRmpMU2ZL?=
 =?utf-8?B?WHVBZVJ3OVl0NUIyajhYRWZPY3FUV3c3S2gvWWdmOUVvR2NTTDhMeUtmMVJk?=
 =?utf-8?B?dVZsQUdlT3BEVm10K1kydkUrU1lpQ3dmcWxETUxJVU4yNXpwV3Vza1dTMUVG?=
 =?utf-8?B?N2RUVkJqYVA4SnkrQjR0dnpTWUxZcmE0MXdXMEo0VjRoQW4vdlhNY2pnZExR?=
 =?utf-8?Q?/p9x3QK7SZmc/ikLJMjVNfI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFIzZGJEZXFrUURidUNLL1JaQ2s2TWk5SkZOVUdWMGFxYkpqc2RXbWk5U0R4?=
 =?utf-8?B?Z1hjdG9jb0NMeVJxdEtJWXk3QTFwajZtTENhaGwyZWgrYVF3VXhsd1BGVzJr?=
 =?utf-8?B?STVLdG1hVEtTME85eEhqQ1hneWdiTlFzUllVT29sWUd3K3B6aTI3ajBHOWs4?=
 =?utf-8?B?clYyVnZSZlZBSTdRVUg4ZHpLcVIwMmVoRVMwMFpkVklXZkdXVDZvQlpxR2ND?=
 =?utf-8?B?MlJITVNpbnVLZDVjYnFyM2JYVmQrZWRScEtzRDc4aEpnby9HTXpud2xZc1Bs?=
 =?utf-8?B?V0J5cWR2elhYazdsWkZoc3RjV3Q5VzVuY2NtY1p1QUlZdTNuQnlsMUYzQWJj?=
 =?utf-8?B?UE1UWEZ3cThKTVpkdDhwMmc0WER5UG1ZZTNraElhRHFabEF4Y0hUZVBzSGYx?=
 =?utf-8?B?eStjMTNGcml5SytwdFFuNVp3dUFiVzZrcTJCRG1TWUkrWDl3bGNoWm9PeEFF?=
 =?utf-8?B?Q2dBQjBHajVHSTBKajZHM2sxZW5Qc29hTmlIbUNodEZXSWdzRXhXeEo2NnIz?=
 =?utf-8?B?elowZmV6d09ldXJmcmRXVFdZMUJzQXQ5OEUwdHJyQ050T3I1Zm5tSmxzUkxz?=
 =?utf-8?B?SUQxNWliM1EyWEtpNXFqeFVCQXR1VC84UEhjaFNnSWZYcHl5T2ZqVmNVR1B6?=
 =?utf-8?B?OVpvK040YUQ5NE1COFZtTWdNM0xuTnB0UU9kbkgzY09jNHkxSmhNNDh5bDEr?=
 =?utf-8?B?SkhNeXBiNnp1NXNiRUJnZE81MkdzNTAzTmozTmRGMi8zWm10WVVnM0tXUEY0?=
 =?utf-8?B?ODlJOVZSa3ZRRnpwZm0rd3RQaUhSOEx5R0JSV0wyTkVabnVWajNaT0xqSm9h?=
 =?utf-8?B?MGdQZ3NvbjhkUDBHVWo3cVVPODFjV2xERTU2a1BQSGRUQ3p3eEw1R1ZaUDFW?=
 =?utf-8?B?eDhsQWJpRU5iOGo3Ly9mTUtqQ2tyNENQQzc0NlJZTld3cE82MU9ZZHFpY1ky?=
 =?utf-8?B?VEZjdWNtdDc4QUZ1SWhGY1pPS0NIdzFyZ3VkVFlxY1ppb3FDTkhaYXRiem5R?=
 =?utf-8?B?Y1NvajFYR20rQkRIa1d0dUhJNHIwVkZJS1FYcmF2bTZBT3BSTUdiUExTblhZ?=
 =?utf-8?B?WTI2Y1AzbHJFaHYyTmplRDNHWHBBOXNudTFqNTFWWDBQYUhBZ2h1YThWMVlD?=
 =?utf-8?B?SlREZzUrRUxrbnVIMDlGZHM5Lzk0R3N3cHJjMXlxU1NEOU9nR2hxVEpXM3Rh?=
 =?utf-8?B?VFRscHRDeDd0Q0UzTk0xMnBFYmFHbXV5RzlZNjJnRkZMc3VIR3BCRUxYbmZK?=
 =?utf-8?B?dXpMeXBTaG5TQVVjVCtSdXpGd2Iwd2dWVDhWNU91L3FnNm9iaER0TG9FRkhk?=
 =?utf-8?B?V2tkeGVDSlZNL041UHA1QWFPamQ1b2tyTXloMkNFbE45VXNaM01mM1RpSUNz?=
 =?utf-8?B?d2k2aHJXay9kWjJmWlUyYzhOVlFRNEVwUmtjK2FoWUhkamZVcitKUjhXWmYz?=
 =?utf-8?B?SjFoc21WUWpkWE5Za3NQM1VCQy9BNFI3akJEQ0JydlljZzZ1UlhJdFZBRC9r?=
 =?utf-8?B?Ym1GUThDeDBmY01NVUVMM1NHUE9WVHZWbWRxWjZEdWFIcWJ3Mk00QVZoOTZX?=
 =?utf-8?B?NnlJRStDOHJDMEh1blIyYmxPRks3S3Zrc25aOG02TmZ4SDF4WExSN3VpUE1M?=
 =?utf-8?B?SzQyR3R3NDZMb3o2MHhIQVBhdEhHQTNMTEFpK3RDeW0ydDh0MzY2VXRTcktZ?=
 =?utf-8?B?RktQUExsWUNoaW9HZnhvQTVaWVVkY0NjUG9QbExDUTh1RHhtbXF3QklUSDlP?=
 =?utf-8?B?R2ZKaUZGcG02WUxBZUtJV2ZMcTZJWkVrY0t6S1Y3cnplaXVvYm93bzI1azh3?=
 =?utf-8?B?K3pyUUoxcGFQMmJKWEdBSUNVRjZVZjI1cDhyclZOU0J1aVpLeWErNzkyUGxj?=
 =?utf-8?B?RGQyNkNPQUVINFZKd1B5NFY1S3pJRjIza3VlRVk1a250dWhrbUhlelRLL2wz?=
 =?utf-8?B?NmRaQkllMFlHdEFsQmpENVM2RG10UWk4Yzk1dEVVR05tY21kcFhJRDdXWkEy?=
 =?utf-8?B?eDJHTFJHdjRzRGI0a21BUEordjNlanV6S1l0azJYNGxyVzZxTktTRHI2b3FP?=
 =?utf-8?B?T2NPQXlzbFlqZGpzZCtxZkdON2ZuUkNUOXUxU2xxMzdlVHQvd3BQNEhaaWxP?=
 =?utf-8?B?eWZueUovOFczMnJMYjBxbEdEYmQ1eitScElML1RXcXZCOEVYODJSb0dERk84?=
 =?utf-8?B?dDNsQW1ieUdNcUROTDBQRTdUdXl1anpTa2RuOUREYlJYdGZzZWVLcWcwZWZL?=
 =?utf-8?B?aW1EOWRQc05VMzdQZThjeHJHMVp0L2ZDZGFXQUtYNnhRSmRudElsYnFqS0JK?=
 =?utf-8?Q?PyV0RzCYOXKnYiAPjW?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c300efb2-c67d-4f88-1348-08de59724e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 04:54:21.0409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuD8QwmDhJZeg3Z5/P08j+7F5ULjww+4Cm+Knv5JsRwgnL/pvu2uI6XeJA9VxewA1ht0Ax5EI0y88e8rKqGw1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

PiA+IE9uIDIxLzAxLzIwMjYgMDk6MDUsIFNoZXJyeSBTdW4gd3JvdGU6DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IGFybTogZnNsOiBB
ZGQgaS5NWDkzVyBFVksNCj4gPiA+PiBib2FyZA0KPiA+ID4+DQo+ID4gPj4gT24gMjEvMDEvMjAy
NiAwNDoxOCwgU2hlcnJ5IFN1biB3cm90ZToNCj4gPiA+Pj4NCj4gPiA+Pj4NCj4gPiA+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogYXJtOiBmc2w6IEFkZCBpLk1YOTNX
IEVWSw0KPiA+ID4+Pj4gYm9hcmQNCj4gPiA+Pj4+DQo+ID4gPj4+PiBPbiBUdWUsIEphbiAyMCwg
MjAyNiBhdCAwNjoyNjowM1BNICswODAwLCBTaGVycnkgU3VuIHdyb3RlOg0KPiA+ID4+Pj4+IEFk
ZCBEVCBjb21wYXRpYmxlIHN0cmluZyBmb3IgTlhQIGkuTVg5M1cgRVZLIGJvYXJkLg0KPiA+ID4+
Pj4+DQo+ID4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogU2hlcnJ5IFN1biA8c2hlcnJ5LnN1bkBueHAu
Y29tPg0KPiA+ID4+Pj4+IC0tLQ0KPiA+ID4+Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2ZzbC55YW1sIHwgMSArDQo+ID4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwNCj4gPiA+Pj4+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbA0KPiA+ID4+Pj4+IGluZGV4
IDkzYWQ2ZjAwMjdkMC4uMTc2OWYyNDNkNzBmIDEwMDY0NA0KPiA+ID4+Pj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwNCj4gPiA+Pj4+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+ID4gPj4+
Pj4gQEAgLTE0MzIsNiArMTQzMiw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPj4+Pj4gICAgICAgICAg
ICAgICAgLSBmc2wsaW14OTMtMTF4MTEtZXZrICAgICAgICMgaS5NWDkzIDExeDExIEVWSyBCb2Fy
ZA0KPiA+ID4+Pj4+ICAgICAgICAgICAgICAgIC0gZnNsLGlteDkzLTExeDExLWZyZG0gICAgICAj
IGkuTVg5MyAxMXgxMSBGUkRNIEJvYXJkDQo+ID4gPj4+Pj4gICAgICAgICAgICAgICAgLSBmc2ws
aW14OTMtMTR4MTQtZXZrICAgICAgICMgaS5NWDkzIDE0eDE0IEVWSyBCb2FyZA0KPiA+ID4+Pj4+
ICsgICAgICAgICAgICAgIC0gZnNsLGlteDkzdy1ldmsgICAgICAgICAgICAjIGkuTVg5M1cgRVZL
IEJvYXJkDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSXMgOTN3IDExeDExIG9yIDE0eDE0PyBjYW4geW91
IGFkZCBzdWZmaXggdG8ga2VlcCBhbGlnbiBleGlzdGluZyBvbmUuDQo+ID4gPj4+Pg0KPiA+ID4+
Pg0KPiA+ID4+PiBIaSBGcmFuaywNCj4gPiA+Pj4NCj4gPiA+Pj4gSU1YOTNXLUVWSyBpcyB0aGUg
b2ZmaWNpYWwgYm9hcmQgbmFtZSwgaXQgYmFzaWNhbGx5IHJldXNlIHRoZQ0KPiA+ID4+PiBpLk1Y
OTMNCj4gPiA+Pj4gMTF4MTEgRVZLIGJvYXJkLCBhcyBkZXNjcmliZWQgaW4gdGhlIGNvdmVyIGxl
dHRlciBhbmQgZHRzIHBhdGNoLiBJDQo+ID4gPj4+IHByZWZlciB0byBzdGlsbCB1c2UgdGhpcyBu
YW1lIChpbXg5M3ctZXZrKSB0byBrZWVwIGFsaWduIHdpdGggdGhlDQo+ID4gPj4+IGJvYXJkDQo+
ID4gPj4gb2ZmaWNpYWwgbmFtZS4NCj4gPiA+PiBJdCdzIHNlY29uZCBjYXNlLCBwcmV2aW91cyB3
YXMgZnJkbSwgd2l0aCB0aGUgc2FtZSBhcmd1bWVudC4gSQ0KPiA+ID4+IGRvbid0IGNhcmUgd2hh
dCB5b3UgcHJlZmVyIGludGVybmFsbHkuIFlvdSBtdXN0IGFsaWduIHRvIHVwc3RyZWFtDQo+ID4g
Pj4gYW5kIGFsbCBOWFAgYm9hcmRzIGFyZSBjYWxsZWQgc29jLWZvby4gTm90IHNvY2Zvby4NCj4g
PiA+DQo+ID4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gPg0KPiA+ID4gVGhlIHNvYyBuYW1lIGlzIGlt
eDkzdywgdGhlIGJvYXJkIGlzIGJhc2ljYWxseSByZXVzZSB0aGUgaS5NWDkzDQo+ID4gPiAxMXgx
MSBFVkssIHNvIGRvIHlvdSBzdWdnZXN0IHdlIG5hbWUgaXQgZnNsLGlteDkzdy0xMXgxMS1ldmsg
b3INCj4gZnNsLGlteDkzdy1ldms/DQo+ID4NCj4gPiBJZiBTb0MgaXMgaW14OTN3IHRoZW4geW91
ciBjb21wYXRpYmxlIGlzIHdyb25nLiBJdCBjbGVhcmx5IHNheXMgaW14OTMgKG5vDQo+ICJ3Iiku
DQo+IA0KPiBIaSAgS3J6eXN6dG9mLA0KPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiAoSSBzaG91
bGQgYWRkIG1vcmUgZGV0YWlsZWQgaW5mbyBpbiB0aGlzIHBhdGNoIGNvbW1pdA0KPiBtZXNzYWdl
KSwgQWN0dWFsbHkgaS5NWDkzVyBTaVAgaXMgY3JlYXRlZCBieSBpbnRlZ3JhdGluZyBpLk1YOTMg
YW5kIElXNjEwDQo+IFdMQ1NQIChXaS1GaSArIEJMRSArIDgwMi4xNS40KS4NCj4gVGhlIGkuTVg5
M1cgRVZLIGJvYXJkIHdpdGggdGhlIGkuTVg5M1cgU2lQIGJhc2ljYWxseSByZXVzZSB0aGUgaS5N
WDkzDQo+IDExeDExIEVWSyBib2FyZC4NCj4gSSBhbSBub3Qgc3VyZSBmb3IgdGhpcyBjYXNlLCBz
aG91bGQgd2UgY29uc2lkZXIgdG8gbmFtZSB0aGUgc29jIGFzIGlteDkzdyBvcg0KPiBpbXg5Mz8N
Cj4gDQpIaSBLcnp5c3p0b2YsDQpBZnRlciBzb21lIGludGVybmFsIGRpc2N1c3Npb24sIHdlIGZl
ZWwgdGhhdCB1c2luZyB0aGUgImZzbCxpbXg5My13aXJlbGVzcy1ldmsiDQpjb21wYXRpYmxlIHN0
cmluZyB3b3VsZCBiZSBjbGVhcmVyIGFuZCBhbHNvIGJldHRlciBhbGlnbmVkIHdpdGggdGhlIG5h
bWluZw0KY29udmVudGlvbiB1c2VkIG9uIHByZXZpb3VzIE5YUCBib2FyZHMuDQpXaGF0IGRvIHlv
dSB0aGluayBhYm91dCB0aGlzIGRpcmVjdGlvbj8NCg0KQmVzdCBSZWdhcmRzDQpTaGVycnkNCg==
