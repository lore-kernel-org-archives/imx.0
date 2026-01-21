Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE402481222
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990462; cv=fail; b=ImtZ577/7R+GezOUP6G26snFriXEfu1D0bMIRHLiqk7paruPvBv4UuGN3ugYdhe+8Qa0FUFqoG5RfCqdla00iUauozSFvCVT1Bp88MT4I9n5Y6u0gu5f70BzMkEEymE4ppIO9ctc2KE/GVQBc/7XZN7zy3juIOJiEjNtunz+/a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990462; c=relaxed/simple;
	bh=nHc7CArORRfbqcPsXM5sb4i3sLM3RFNq6lfrXFDDfW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kemATO8KnpmSIsTBadgPUPisABPfRzY4CGVR43dahp1KEx/QYH2TyYqJp9NP+VMLEGDOG+ApnLlnFe5Duxkujz3ndBvgMkzcf9+/EpGH5qiVNxGOPJW0AHuBpw9OGxOfovXHItB87GMckzhRuDdiWsna4Sfg+xw07hvbI4kLNxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jR+X0dga; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jR+X0dga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8gIIq8lKmMlEzhKdT9cpjDniKxPtWbIfRcIxoUu7gye6Ph2strDQxVw7aMHtiwlttxLtr6LYeLIhl3of0qwsWwASevwG6SrkbdbvYn5Zy3DUKeEWSLhboXlQ5U+EsH3CG8Z1c1nS3HTUj/KciHV+Fdhr/Ln7sGnW6LIP+iZ3ncAHeDH1BflCH7FxiE7NA1+EP7T9xH7zYTTUPghuRFyWwxiTx5SvL0BMOa6QJkVJzemHTY1QXBimLlXhvj7cBrVPWBkBS6hlR0ZGQlwBwTg83agS5yMs6tB4uc0fiisEjt0RnW+VIYBrjMItmAenyoXz4cYYa186m+Sd4YTli7dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHc7CArORRfbqcPsXM5sb4i3sLM3RFNq6lfrXFDDfW4=;
 b=ZnINhvHvOIkIDiLIzTX/10HAsNYwMd6GZkkmzOt2X1y4YevBRcaVC0tTa9acPljpQwJ47smzyC5Ct/GdhPhR2dKpu4B5A8SoVIxvkeQlYMciXpF3Rk6JTSy1wFM8kxr4VgbFmIRCSWsKAOzryagR04ee0it9B2jIZI/Tqf2I1lXwyxvlE3R3jing0wVNKTE0YwnWeNKppPLNM01t836+SFhI/GPfAe0BmPE3RCkZtLUDMvM37HxO9JiUCK0OTggWWL9IiPU8clUXUxeMxiKHX3zYCvREDDOTlrn8XvqdZOgVh5a3XyyRZxFD3r/kQTf1nujWG5epH7vdUE/o8Paf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHc7CArORRfbqcPsXM5sb4i3sLM3RFNq6lfrXFDDfW4=;
 b=jR+X0dga/YNADUZXyBXZrHVGt8PJtYmXUQJKvRfVxLsqIDE51rmbzHhwjpu96fuYH4i5cMXxKtx9uzS6NjrtZWlqJz4cqXbd/d952zzFaDNdg03BKkOaY+8YzEZGxDDWvLdirJgsR/9O51+xyTdxXaZbMVtgl2QDGA4Mufez7eik2Mj/GKdK7W7ILExhOC0D0sBxmpqJ8lgpAOTJoaqvjD/7/D+5sXu4C+HinTDjz2qk5p3BDLATMGZXdfcJEbFTVWtheWIRVYWOREuislbJb/JHEwp03jji+kQAGJcJ1d0XWGLYKW4z+VALBZfIyN7LBwXosMrl9VEcYzNw8tiLMw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7370.eurprd04.prod.outlook.com
 (2603:10a6:102:92::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:14:16 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:14:16 +0000
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
 AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRCAAEjGgIAACMaggAAgIYCAAAPEIA==
Date: Wed, 21 Jan 2026 10:14:15 +0000
Message-ID:
 <VI0PR04MB121142F03A29796D0204A89809296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <27e88ef0-afc9-4108-a136-754a90ade0bd@kernel.org>
In-Reply-To: <27e88ef0-afc9-4108-a136-754a90ade0bd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PR3PR04MB7370:EE_
x-ms-office365-filtering-correlation-id: 79f80fd9-97bb-492b-2f0d-08de58d5d52a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3NLWDJKNWpGNWQyNDVOZk1yVTZpcE8yQ3p3cU14cDZ3VXU3UDNuckJJQ2FQ?=
 =?utf-8?B?OXBmdjk2L2JzZGFJc3R0dmlWcFk5WDMrci81bFFVcXE4Y3ZDN21VdDdzRGRM?=
 =?utf-8?B?bjY4ZnpBc0hTYk8wOEVHeDJWUVgrUUNjRFJ4RkNZdXU5SS92dldnQUxrckpC?=
 =?utf-8?B?cGp5Zzl1NFRCb0dXeW1IaFFYVzhyeXN0a3grNHVMaEM1dmpDcEJzbWZXZGFm?=
 =?utf-8?B?eUtnM2xxYmM0Y3NFVzFnMnJ1akd1SHhPTUZJemxSVlVJYmp2MkJkdUNwamNy?=
 =?utf-8?B?TG9ycjMrL0h3Y0NGdFp2eTJvOHc2UkNXalMyZWlReVUvTTVhNy9aUGtjU2VU?=
 =?utf-8?B?Z2VodVlkbG1jQ09LakpwN3I4aUlMVHZBbFFaWnk0R2htK25uK2MrOXN4Nk5r?=
 =?utf-8?B?M1MzUGIzaWs5YWt5VWU0cVkwZzNTZ3FhK3A3Z2k1VmdQbGo0WEFyMUJMMEJ0?=
 =?utf-8?B?eDQwNVlvMUdFaDZ4L04yVkRjaUJLVmdhTUJkbWU3ajhPdnNVZDVvV1B4Qlcy?=
 =?utf-8?B?RFp2MXl2dndWNllUM1lkd1dtcllyT3NLOFhRV2UwZTFRMUIxRnYvM040bWlY?=
 =?utf-8?B?QjNDbUpYalh2MlV5OXE3U1hxL3BpR2Z0MStYOWlORzl3dGtUWjZ1MlFjVTBX?=
 =?utf-8?B?STB5ZTlQWnU3UW1UUEpYM3dJaHI3N09PMGkrNTk5MDliV3VPekhrQWExTHph?=
 =?utf-8?B?eGJJelVVWjB0UkxXTHNWdFpsUTFOeCtERnkvRkgxcU9PZEpXRU9PS2V6Tzh5?=
 =?utf-8?B?T21DNU9XVURKbERCd3prZmdKUXlkOC9CMEdXOUl2YVBlYkhUZ2dQbzMyOVZo?=
 =?utf-8?B?L0k5b2VQS1NoK2M4dmRyZksxRTBTVzJwdkFzQW9od1R6Y1pWcmhwcHFINmF2?=
 =?utf-8?B?WVBtemJXajJlanpLcThDUzlmOE9lN0lWYm5yQ1hrN1N2OWJBSVVFN2VBdnpV?=
 =?utf-8?B?dXVPMDUxanlxdGtVZEtjTDlkODErcnFPeVhlTGhJaHIxRHFTY2xpYmt6RGxn?=
 =?utf-8?B?WlpKN1pZRVZ0a1NFYjBORzFyeURBbnhSKzUxVjBvWHp2djNFbVM0SU5DTktv?=
 =?utf-8?B?S2RwdTJYc2N4WEFYemJ1NTN2YWgrNWFXK2hGdE4zWWFtTHJ4cmVTbnBrSnRL?=
 =?utf-8?B?bWFEc2VRYnFRSDI4L1FSWldKNFNKdWZxZnA1eVdpQ3ZLZVVLMEVVYjRiYVFa?=
 =?utf-8?B?c21HcS9ZeVhlVkcrcVBFa01vNUJ6THFoNkZZRnVzU2puMG5uK3FSb2pOWE15?=
 =?utf-8?B?c2NiMTYyOU40dyt2Ump6QXBIWk9MdXZXQU9OVXRjSG56NnZuNGtlQ3owOE5P?=
 =?utf-8?B?WG9ySUR4RjUxL2xnNks2TEw3NHQ3QVFCMW9Tb0x4d2RUN1NvM3NxVDR4QXRT?=
 =?utf-8?B?VnV1ZVRyU2hRbkFMQW5XK3pYTHZWK3B4NnM0SHFTMUZyS0crVE9QRXFEMjla?=
 =?utf-8?B?T0lrMUFUVlBVZlBackR1SnE3WmFLbWlCeksyL3AvREh2MjNQalYveTNKYXlZ?=
 =?utf-8?B?eURiMDFyNWxyNmNhUWpNSndIR0s1OW5uUklOQldxVUVJbmNmTDBtaGY3VXF1?=
 =?utf-8?B?WU55TGxCMnpiUWxxK2FHWm1reDhEZFJUVU92UGhPTk91Y0d0WjdZTkN0ai8r?=
 =?utf-8?B?T3lrMURHTDZTNUs4Yzd3dmRlNG45bCt6bGhyNk9XUzJoR2g1aFJSM2IzeTY5?=
 =?utf-8?B?NEZjQnFBelhHcEJ3K2FKejhXQXU3K01jT1VTdlpUS0NOb2ovVWNzSlRFT0JN?=
 =?utf-8?B?NmhkVlJlcFkzaGVqaHBkK0h4dDlvRk5TRFg1eVhkVnlBeUJHSGR5ZU05VUlm?=
 =?utf-8?B?alV1ZEdQNGZ0dmdpMEdybFhCaWRJbDBmNi9tNCtlbkFCcUhqK3h1TjkyQ0M3?=
 =?utf-8?B?NzE4QjJ1WTJ1Zm8wUTc4am9yQTNVaXJWQStUQUs4bllmNElLb3RCYVllMmhG?=
 =?utf-8?B?NkI1N0Y1M1p3WWJMMXArV09KN0phc3NrSGw1K2JKZ2dZOC9Hckh6UGR0TG56?=
 =?utf-8?B?UGh4OThZSG9rWDFNeXMwckIzZTF4cjd5VlBKbzRKcFM2ZVpkYjRtWEFldUpZ?=
 =?utf-8?B?Y09GUHlFUUdqR3UxOVlpbnp3eGhaY1N2T3ZaU21uQjBMTTdBS3pvL1RhRWs0?=
 =?utf-8?B?Mk5BbEcrd0dBN3UvbEQ1U281U2NranVwTGw3UWE3RWpyanRUd21SQUVDNUZz?=
 =?utf-8?Q?GqcdQVzQCpigbr2NHLxVYQM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eCtxOG5LS0Z6d2hDdnp6TXJnMVY2RUJxWExFMXZ3b0J4Znh0TDVINFlhcmc3?=
 =?utf-8?B?MDZKMERTV3BTU2oxY21oREw1RWJhVjE3a3NWQnhuR2s2bXJTcVYrQXB6WEdi?=
 =?utf-8?B?Zk1ZeGdxRmx3UW1kbjhNbHdvSGFSTDlacjVCWjA1YlB6NDFlWnhoSUp1OHcw?=
 =?utf-8?B?NHU3YU4yMGVQTHBiWTNxbkIxenRIbnpla1VFVnhTeEp6eTZQNDVXV0V3WGcr?=
 =?utf-8?B?RjRDMjN4NEcxdWd1ZkhMMjZPdTViY2VrVWhYK1d5ZC9aVktsSE5VeWthOThl?=
 =?utf-8?B?aWxPN0hYRzI1K1h2ZEdKQ2NtSkRZVjVpRS9FMHUyTnZQaWNsMDQ2Q0tRMmVZ?=
 =?utf-8?B?YWhsM1FHeXFXZmlGNkt2a3JuVGp6UkZuZFVnOHlHcHVZZVM0cUc0ZFhKeS91?=
 =?utf-8?B?RS9QMHFwU3hwcjBEbWphTGU0T2tndzVKcFcvL0JaQUs5elRHd2hDbUR0ZFJx?=
 =?utf-8?B?QldIVVFCL2tzZkZKWEFzM2k5MlhSZUZhaHRybmxLVk9TMGJIV0FPN2lBL3Nx?=
 =?utf-8?B?V2lqb3dKdThxaDRvZVZ1cjREblBZekppWXlEWmUrY3JwSHg5TVRrWE96Q084?=
 =?utf-8?B?ZGVicTRMd3JQRy9MdFpnNk1rR2cvM2M3TnNZZUwvRnI2ZlZzb0IwWm5YUWx4?=
 =?utf-8?B?UFNwLzN2eVRFd3k1dmhXcVFOOVkyNWFScDlCT1NZOEZkOE1zVnBiVlVBeE1n?=
 =?utf-8?B?ai9iNXh0cXpqUGFqODZzbzJZWnVxMmE5Um5wdXNmbWVlcm1MbHBzU0luWHIx?=
 =?utf-8?B?dCtUZXJ6N1gxWGdFWEZORWVOT1p5bzloVGRleGlXa3ZqZUJZZDBYd0xvTzZa?=
 =?utf-8?B?WEl1RklVMWUvOW91M0hJMXNPZXNBWGF3eFpzVm02dm9CYnJ0aGVhdTV3WDBQ?=
 =?utf-8?B?aEdISVpPd01hUElNeGhOUTVUMkNyV21vL0tFVzFGbjd1Y2dVUmZBSWV1dW9r?=
 =?utf-8?B?aGdSdzVnaXhhV2xGVEVIbWZRSlBsUTJLL1hzY0ErQ3BSM3ZWTFZlb3NNM0o5?=
 =?utf-8?B?eG5jTUhYelNhemVDbjN4M0NzVTB0QSswMTE2OVgyWjEyRzVzMUFGRkthR0t6?=
 =?utf-8?B?NnpVVW83RlI3OXpaK0ZZRy9ZMWh5aW5FNWF3U3VFcDhDdk1SVVVEZXhTZzNH?=
 =?utf-8?B?WDZTNUY4bG9VcnpUYzhFbTZaaTE4TkZWMWo0a3BqTDY4UUNwcEFiS2JmZmln?=
 =?utf-8?B?TGlrV0duYmpIcXlmZXhVb25hWllHNmNGRUVYK1Ywc3BYcEpRRGNvVlNBdEpJ?=
 =?utf-8?B?eVhsQ2tIWlJtd29RVkRRK3ZoZk9NVk1RaUdHSkd6ZXJRdkVhMzRKTWpRdnJo?=
 =?utf-8?B?T25ZOGswdlNEZXdXTTFYM1NmbFdQZXNEWkR3VzUvb01maDBwY0NRUTF2R2ZC?=
 =?utf-8?B?RGNxMzhJbnBTNzRsV0diUXUvVFk1OFdMcTd0RXA1YWxwdW5WR1BJdTVOVHdo?=
 =?utf-8?B?TDV3SXRZanovL1RacTFnYjVZdHVZNENkMUM4ejlRZ0dXMG5mU1d1QTcyanFa?=
 =?utf-8?B?aHp6UzZUY3BrelhSNUdJYVU0ZDl4MUhmeDc0NGR0QytaYkdKdUVNOUpPYWcz?=
 =?utf-8?B?MlVGdzk0SzV1aWN4all1YkJGMGtsVmYvdkdtNHN3N3FGeXo3Zk5sQUVTeHFp?=
 =?utf-8?B?VXVOdmZhcVMvdEI1eTFUYVFySTVQQ2NMMitreElJNmwzK3RhQmVmSjBTcTB1?=
 =?utf-8?B?dXY0aXY3RHdjVFd2QkVYTG4yK3N6dnF2Z0VaVktMbUxtWHlaM284RlpxV3BE?=
 =?utf-8?B?QjFXZjdQSzZHNXlHaGswM1BPTmkzUHdTRGpJWHJ0VW1vQWdFWHMrcklhTmdX?=
 =?utf-8?B?d1p0RDRMUXkxcWNuQjZ1cmw5UkdNbTdGOC9KVjUrckJsZ1JKRGYxSndZK2M0?=
 =?utf-8?B?bCtaK1ZHNk85YnRwYTVzb0ZnSHZGU0VwNXZwNW5zQnRYMjVtR05TM2xqSHpi?=
 =?utf-8?B?aGJPbm9mVWlsRTduVzhrclBGdzJEUHlka3V5aGk0Y29QQmFhWmFsZ0lScXo2?=
 =?utf-8?B?TEVEdHRHYksxd0xOQy9OMDRMTTJ0cXQ0NEhJWjdhU3R5UXhtaStZM0dwUE9U?=
 =?utf-8?B?SXNUY3R3bW5ZeHhRWVFKTVFvTTNmbXNiZVcyNUFtZXFJZ1hSSjI1RzFvdjRx?=
 =?utf-8?B?OThVRktvWVRISE5KeTZRY1NtbEhYTS8rSk44SlNQZVBxa1Q4S2VsRFUzR1NJ?=
 =?utf-8?B?cUhoWE14MXBvR28xZ0M2NkVucXpzc29LMS85eGdVQzl6Mi90R0lKWUtJbDJC?=
 =?utf-8?B?MzNETmNSUmtFUXkxSUdxQXdKbVZWYlpDS0NXQkhDTnRyZE5hK1pZVi9FN01U?=
 =?utf-8?Q?5g7pd6rMzVM0D6Igb4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f80fd9-97bb-492b-2f0d-08de58d5d52a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 10:14:16.0173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wF/0+7TUAIZEx16jIjsX8UvC3QJsCg5WIUYkUGfk40m+h3KDf60ZWT2Iga13pgJ0QCl5X18JEQJF+IBzqk5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7370

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IGFybTogZnNsOiBBZGQgaS5N
WDkzVyBFVksgYm9hcmQNCj4gDQo+IE9uIDIxLzAxLzIwMjYgMDk6MDUsIFNoZXJyeSBTdW4gd3Jv
dGU6DQo+ID4NCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6
IGFybTogZnNsOiBBZGQgaS5NWDkzVyBFVksgYm9hcmQNCj4gPj4NCj4gPj4gT24gMjEvMDEvMjAy
NiAwNDoxOCwgU2hlcnJ5IFN1biB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogYXJtOiBmc2w6IEFkZCBpLk1YOTNXIEVWSw0K
PiA+Pj4+IGJvYXJkDQo+ID4+Pj4NCj4gPj4+PiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAwNjoy
NjowM1BNICswODAwLCBTaGVycnkgU3VuIHdyb3RlOg0KPiA+Pj4+PiBBZGQgRFQgY29tcGF0aWJs
ZSBzdHJpbmcgZm9yIE5YUCBpLk1YOTNXIEVWSyBib2FyZC4NCj4gPj4+Pj4NCj4gPj4+Pj4gU2ln
bmVkLW9mZi1ieTogU2hlcnJ5IFN1biA8c2hlcnJ5LnN1bkBueHAuY29tPg0KPiA+Pj4+PiAtLS0N
Cj4gPj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwg
fCAxICsNCj4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+Pj4+Pg0K
PiA+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9mc2wueWFtbA0KPiA+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9mc2wueWFtbA0KPiA+Pj4+PiBpbmRleCA5M2FkNmYwMDI3ZDAuLjE3NjlmMjQzZDcwZiAxMDA2
NDQNCj4gPj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9m
c2wueWFtbA0KPiA+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2ZzbC55YW1sDQo+ID4+Pj4+IEBAIC0xNDMyLDYgKzE0MzIsNyBAQCBwcm9wZXJ0aWVzOg0K
PiA+Pj4+PiAgICAgICAgICAgICAgICAtIGZzbCxpbXg5My0xMXgxMS1ldmsgICAgICAgIyBpLk1Y
OTMgMTF4MTEgRVZLIEJvYXJkDQo+ID4+Pj4+ICAgICAgICAgICAgICAgIC0gZnNsLGlteDkzLTEx
eDExLWZyZG0gICAgICAjIGkuTVg5MyAxMXgxMSBGUkRNIEJvYXJkDQo+ID4+Pj4+ICAgICAgICAg
ICAgICAgIC0gZnNsLGlteDkzLTE0eDE0LWV2ayAgICAgICAjIGkuTVg5MyAxNHgxNCBFVksgQm9h
cmQNCj4gPj4+Pj4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OTN3LWV2ayAgICAgICAgICAgICMg
aS5NWDkzVyBFVksgQm9hcmQNCj4gPj4+Pg0KPiA+Pj4+IElzIDkzdyAxMXgxMSBvciAxNHgxND8g
Y2FuIHlvdSBhZGQgc3VmZml4IHRvIGtlZXAgYWxpZ24gZXhpc3Rpbmcgb25lLg0KPiA+Pj4+DQo+
ID4+Pg0KPiA+Pj4gSGkgRnJhbmssDQo+ID4+Pg0KPiA+Pj4gSU1YOTNXLUVWSyBpcyB0aGUgb2Zm
aWNpYWwgYm9hcmQgbmFtZSwgaXQgYmFzaWNhbGx5IHJldXNlIHRoZQ0KPiA+Pj4gaS5NWDkzDQo+
ID4+PiAxMXgxMSBFVksgYm9hcmQsIGFzIGRlc2NyaWJlZCBpbiB0aGUgY292ZXIgbGV0dGVyIGFu
ZCBkdHMgcGF0Y2guIEkNCj4gPj4+IHByZWZlciB0byBzdGlsbCB1c2UgdGhpcyBuYW1lIChpbXg5
M3ctZXZrKSB0byBrZWVwIGFsaWduIHdpdGggdGhlDQo+ID4+PiBib2FyZA0KPiA+PiBvZmZpY2lh
bCBuYW1lLg0KPiA+PiBJdCdzIHNlY29uZCBjYXNlLCBwcmV2aW91cyB3YXMgZnJkbSwgd2l0aCB0
aGUgc2FtZSBhcmd1bWVudC4gSSBkb24ndA0KPiA+PiBjYXJlIHdoYXQgeW91IHByZWZlciBpbnRl
cm5hbGx5LiBZb3UgbXVzdCBhbGlnbiB0byB1cHN0cmVhbSBhbmQgYWxsDQo+ID4+IE5YUCBib2Fy
ZHMgYXJlIGNhbGxlZCBzb2MtZm9vLiBOb3Qgc29jZm9vLg0KPiA+DQo+ID4gSGkgS3J6eXN6dG9m
LA0KPiA+DQo+ID4gVGhlIHNvYyBuYW1lIGlzIGlteDkzdywgdGhlIGJvYXJkIGlzIGJhc2ljYWxs
eSByZXVzZSB0aGUgaS5NWDkzIDExeDExDQo+ID4gRVZLLCBzbyBkbyB5b3Ugc3VnZ2VzdCB3ZSBu
YW1lIGl0IGZzbCxpbXg5M3ctMTF4MTEtZXZrIG9yIGZzbCxpbXg5M3ctZXZrPw0KPiANCj4gSWYg
U29DIGlzIGlteDkzdyB0aGVuIHlvdXIgY29tcGF0aWJsZSBpcyB3cm9uZy4gSXQgY2xlYXJseSBz
YXlzIGlteDkzIChubyAidyIpLg0KDQpIaSAgS3J6eXN6dG9mLA0KU29ycnkgZm9yIHRoZSBjb25m
dXNpb24gKEkgc2hvdWxkIGFkZCBtb3JlIGRldGFpbGVkIGluZm8gaW4gdGhpcyBwYXRjaCBjb21t
aXQgbWVzc2FnZSksDQpBY3R1YWxseSBpLk1YOTNXIFNpUCBpcyBjcmVhdGVkIGJ5IGludGVncmF0
aW5nIGkuTVg5MyBhbmQgSVc2MTAgV0xDU1AgKFdpLUZpICsgQkxFICsgODAyLjE1LjQpLg0KVGhl
IGkuTVg5M1cgRVZLIGJvYXJkIHdpdGggdGhlIGkuTVg5M1cgU2lQIGJhc2ljYWxseSByZXVzZSB0
aGUgaS5NWDkzIDExeDExIEVWSyBib2FyZC4NCkkgYW0gbm90IHN1cmUgZm9yIHRoaXMgY2FzZSwg
c2hvdWxkIHdlIGNvbnNpZGVyIHRvIG5hbWUgdGhlIHNvYyBhcyBpbXg5M3cgb3IgaW14OTM/DQoN
CkJlc3QgUmVnYXJkcw0KU2hlcnJ5DQo=
