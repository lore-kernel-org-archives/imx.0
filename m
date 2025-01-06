Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2082.outbound.protection.outlook.com [40.107.105.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C778F41
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736131880; cv=fail; b=XM6VMqJKsIR4+exmrtbmfPkfmgJkrB55r6xyFE6p0WY0V6yLP+4duZtbw+tRMbUZJFp5mY5lVHodD8Tkg0eC5yYYEmggKZh0E/Y8PBgqDd4PLTJQqMWJV2AT3eSwMWPyY/3aFGKc/CdipvzfPrTHUvjSuiQE8/TiI5iNdgeycw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736131880; c=relaxed/simple;
	bh=VqAevO+s8WYtBpmz2H8Av7f/he8oEjs03Y6+Eqmeh0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fKGW9hVqrbqYRQVhPp9ZnoIL5VP8sJcYcGEHjgXE2e/8vguR79neZwg1d+sB45FoQqL/hK1D/jqjAqiODAzjxfBjgxqM/TDJrPJtbMmFP9fSv8VSKyK8mXdNyHwCxIndrUv7Wwj2WaNxkdmrE7kokzfaXckB4ODxZxdQRoW4n6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WghFtKdR; arc=fail smtp.client-ip=40.107.105.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WghFtKdR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGY16Uv+u11S21D2NTSsJUXuSSwN4GAuIB/c0lz0gCNHa7oT7OfsJ28ZqA3rdZoQZm95bILhyew5y47M6LQ07tplNoyjythK356ay3B6WPzlBSXFd9P0Pr24AxohLQrGOpIfw7B1z6qVnZbY9WxqP0ucVI8b6G0tB+AHLdRuftSeGprZCru/kbbeyNk+THLMBt5GNxV7nmaeSToPenOS82c/ifK6UFJ09SuL9CEJZpWS3XAOy3eIpU3g7YO/VTN5HCMlMjAn+5Kho500DK/WK4HRQ0L2DDqCVwy0XoFMdwpujtJDJL0BOmWZBPbQTD1iY9Nfky6QgQ1O81YYsqLozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqAevO+s8WYtBpmz2H8Av7f/he8oEjs03Y6+Eqmeh0k=;
 b=iI+nGa9zv4PgDTqXXSkcrQyq9Scbk4UKl+2QIgGuQxcc4Ei8ndHRfAA0uH3XfL4iifCWjAchDBPQlH546mNMAl0EJTMQzjfP1JLtG7TIA+ctFvTO5+PsxI91qZ7ZJfvy4GRbnJdSdXea6PMgJI9OCRibAcz3ck/CplFjU2J8Q+h8Z9og0M/ue0IkACgGMpLm4BDs07AX1sh6gzyBD8W/mvM+w/e7rffDi0Kj9vvWzo6O91A1BR2Ud6+Icz36bTxRuTfnaYWIszJrFkTVoigMRynyG3BkhuhmFjCMW6jYvcyU2AreJVLFVnf3AeoxGZzMhIECgFK6a8QU+l9rMmd67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqAevO+s8WYtBpmz2H8Av7f/he8oEjs03Y6+Eqmeh0k=;
 b=WghFtKdRlVc5L0Y2YXoFq2LJlI3IEXHNMCi+EtB+DL8DqS1Y9YC9Sh30+VLM7qqnoPZVLFuPrm/OxOUH8JT7fOdpOGUVeMW/N8PoP6XNTcwupZVm1iDNTFObhtkdeOwfb4cGdj9yswQO1vMr0p8wga4Ueo5qB9Y8Lf5Vt3ctMLabDsfcFU9GyKvGhOLRKvCSqhwp9kCcwXo2I6r98UZZ6jRzdyDAxvjMeJ+0vW3sqf3Vte3n3L6h3UBKopeleUhefNj8SfffxZgXufBE6K7qT0cKloP8xKbSXfC8faWyxWmchYCQg+YiqTtRc3uYlOtwaxTsmh14oQNkM60u5TkqJg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 02:51:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:51:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95 compatible
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95 compatible
Thread-Index: AQHbXqIpkQmKm4Aggkaa88eJVdRO27MGsM6AgAJcpoA=
Date: Mon, 6 Jan 2025 02:51:11 +0000
Message-ID:
 <PAXPR04MB845922D5BCAA88C26C0149B488102@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
 <20250104-imx9-machine-v1-1-18a78e41456b@nxp.com>
 <4666f8e9-d19e-45bd-be9c-a7f111168d66@kernel.org>
In-Reply-To: <4666f8e9-d19e-45bd-be9c-a7f111168d66@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB8PR04MB6956:EE_
x-ms-office365-filtering-correlation-id: 01700f30-c176-4365-a700-08dd2dfcfa9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkdZUVFwZXBhTTBXcDYzQWZTNFNBbXZSZVlzYnBIMEl2MUwxOEkvK1dzYUts?=
 =?utf-8?B?VXZwSDU5akt3M3R5emtzN0JTQTR3OTA5TElLOThlaWJ2OWJtaW0vanRkbTJk?=
 =?utf-8?B?bW9vTWxEcFJEWE1SYW4vakkvOStrblR6YU4rZWNUOUxqaVlrd1JIWDN0aTFT?=
 =?utf-8?B?cXIrWGpvc3BmcWRrZ1JpU0pVN2U0dURLOXJHbHQ3UmFnVmk2d0VKZ2YxSDd6?=
 =?utf-8?B?SVZrQlpwdTk1V1ZaRlFIQUcxNGRWTTA2UkVDMzNHTmlhTDVUU2I2UFhOdXRZ?=
 =?utf-8?B?VG54S0xUME4wZzZ4eXUrWG9LQ2JDTFViZUo4cm9yVnVoT2g5UGFqbE9vcWdu?=
 =?utf-8?B?QlAyOC80QkxqQzJvUW9aZFFuRXMvMmhQdHhjaDVEQkNZWlVEMm1zTzRUSUNF?=
 =?utf-8?B?T2NFaDZONUtIY2hmU1ZYSjJXeWNTUjllc0Uzd240TGVxUlgrRkdER0wvd1Fq?=
 =?utf-8?B?VCtNNUZnUy9wMnNJU244NncyeURFZnIwdng5NVY1T2VuWi9zTVBqV2lxTUxy?=
 =?utf-8?B?UFgwRlVuUlM0dVk4QkRHdk0wYncyaVNvZ2dZaDBiUjRZSmhqN1laNnlOUkdW?=
 =?utf-8?B?eUFRWlNyTkxFTkt1T3IvdkxPOXZSVjJvT0xFZ1FhOWVxem4wVk5QQTBmanZN?=
 =?utf-8?B?Y2tIOWtDR0FUclJBdEZXUHJMeThjZk0wMnhzWkloWFo5N2xRMmtCL1VDVi9m?=
 =?utf-8?B?bGhCWTc1cXJ5aUNSdmNsQmQzSGNHR0ZabVlnb0tGK0R4VUVlbFZTVHRvQVhO?=
 =?utf-8?B?RnA3WkdDc0l0Um5YWnBESlRMZENjd3lpaEJleTJ6MHFKVDk3T2hqcUd6Ykl1?=
 =?utf-8?B?Tnd6UjRCUk1wYXhJSzVCamNMdlV2VDdMOVlQanZrcnV3a0xFR2s2NFJIRlNQ?=
 =?utf-8?B?UmJLcUhYOGJoNGJJb2pxUXFHSTEzMmErK1ZKbWkzSGt3Z2pPRi9hYllKSWJt?=
 =?utf-8?B?MzhaT0hibFlQMzlISmxxS3MzMFdoVE4rQ2k3NUFvZ0ZpbDhrRjZReVAvQmly?=
 =?utf-8?B?eTY2RThHa0YxYm1QMnE0aHdoMm5xYWNGTm80TzQybmpBZjQzSHhlS09vbXVC?=
 =?utf-8?B?dTRYZzlsTGlFR3Bkb1ROdDZNY056MnpKTVphVmVCY2VtRmZqNkpnRHdpODk5?=
 =?utf-8?B?MVZhQnVkZVdxdmI5YVFKR1RVM0MvZEhoUWJOZ05xcmF4QU5UVWlaSVN2cldo?=
 =?utf-8?B?VmdqbUorUTFDTGxkaHB2WGVKTTVTd0p0SmpQTG5CU3FBMUtaeU5VMXpJcXlJ?=
 =?utf-8?B?N2ZaNDZrVUVwZUg5clVFa3czQzFRam9ZYzBQemNMY1lUNFdQM1VEeHUvZFBQ?=
 =?utf-8?B?QnJYYVQyT1ZKVFdQMUp6Z21DSTVFakp2bDdRcyt5TFE0WHpVcWU0aXFoUzdD?=
 =?utf-8?B?UzJyd3crWUZtSm1BYnRodTlFd2ZFSkpDK2ZldlNHVkE1YXJ2UHNJeUFXUExH?=
 =?utf-8?B?K2s3NW04Rkx4ZFF6VDlNUzhkdjRyOVBGVllGaHJ0ZlI5d3lJUTUxck1HN3Nr?=
 =?utf-8?B?bDZZZ0x5MmV1Q1JTL0ZmWENQc1NCMzI1bG5RZFBGc2FGUkRGcVg4VFhHcjV4?=
 =?utf-8?B?YWtPY0dzWkdzUU16SXBSQzhNUTRzcjhHU01KcjVGTFNNVVdMb0dMZjJyM1Jw?=
 =?utf-8?B?UHdWczFMa2hnaXZLSGZNVUFFV0RXbHdibU9aZ21mMktrR1REQ3JTWHBEcFFY?=
 =?utf-8?B?QnMyanZOOFJtZHVCQkdnWXhQaTZZdnk4RDdUVUJYcXdYOGNaZ2JmR0M1VTBu?=
 =?utf-8?B?b0pNdUhEZTE3YVBTUlRYMmtPNFhEMHF6dDFDK2dsa3hRWVUwRnplSkhqN05h?=
 =?utf-8?B?cXBpYTJodW9yZ05TdHZCdGNaYjR0dGNURTRkb0E0MmNFN3pRVTRWbWx3VGlX?=
 =?utf-8?B?RlhFUUVwSklOejl2bGFZdDlRd3VrN3VRbHY1TUpYTE1oQlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2luZmxUWTBkS2pnMkdGdWFZOHdYaVZTZGRtc3NtUVMweFZFK2RCbTh3ZzJN?=
 =?utf-8?B?R3E2RDFJVmVOMGVIdy8yUHJ5ZVJ5bUFnN2ZZR0tXRW44K081K09qSUtoWWh6?=
 =?utf-8?B?TTlCc3NKc0JUWTNTRUZwSlVXeUU1MEdQQjZxZFpKQUhnVCsvS29uRkt4SUFE?=
 =?utf-8?B?Vm83S01aRi9weGcvYWRGU1BHYzRyeUhiN3ZpU3VUWUtyTUEwMXA4Tnc0WDd2?=
 =?utf-8?B?b3R5OXUzRS9yNWttYzd0N3hyalc5VFJBcHA5NUZPc255TEtkUW5LdlhYa3V5?=
 =?utf-8?B?aExLem4vRE85UkVUUUtSSGFHRHduSEVFeEtSOWQ2dHd4eVRkakw1WFhjSjhW?=
 =?utf-8?B?eUxlQ2dEd2dIb3M3SW8yTG5vUVNTbElxWUtOdlNxUmJLUzZNajFzWFRybHpC?=
 =?utf-8?B?TE5vUkhWRXFzMTlGcFFQYTFVVGRhN2NJN09PeHVuTEovazV4UmQ0blNtZSsr?=
 =?utf-8?B?aHRzVmh2NndDc2N1WEViNzlRK2J3VU5VejVzTkpDbHp0QWxjNFlDZTNzeTdC?=
 =?utf-8?B?WWRjV0xpVWpVQWZnYVBBc2M0UEdyV3NuUXIwZ1JQNEkrOFgyYUJuVkNmN3lE?=
 =?utf-8?B?dEVsZzIyZnVTTW1FOGswWUMyS1FJck4xcXdIcEsySHh1K3BTTWh0NVNOWDhy?=
 =?utf-8?B?ZzlRa2NGeUhKVGtLSVo3dTUwTlIxOWJzbTRDRkQweUliREJNeVYvWTNkVktv?=
 =?utf-8?B?d25BZmp5VEJ1STdvOFU1NE1Wb09OTW51T1dJRlZxeDVBWUFZV0ZXUmdUaU5E?=
 =?utf-8?B?NnJxSGNXZzdvUm5vYnVpZmdrTVB1S3BFbTc4RTYvQ0xwSVhsTlRSV2ZwSGI1?=
 =?utf-8?B?RG1LZ2x5dHEwRmpLUDBFTFBTdDF4QkdZM2daYmRlNDc4K3ZzRWN3UTFPRUZn?=
 =?utf-8?B?bklwb1dCVzhXRk8rRzVWc3FaRGdPUkJVNmtKa0ZzamM5bzlsSXpPNHBXS2Jr?=
 =?utf-8?B?amFGak5rdnZVczUxK29EVlB0dEphb1NoczA4QVFyK2Jna2pYVzRDK3Y3dDFW?=
 =?utf-8?B?ZEhpZEJEQlZqem92c1crY0c5V2VoRUlwMWZya3Zvc2drQk8xVjVTK3BMYW85?=
 =?utf-8?B?Qi85SnA4K1hyV1Q4amR4VzdnZUhRS2g1K25lTzczN3pwTDNZRktxTTNZTnBi?=
 =?utf-8?B?WWgrRTZhN2FEUktQZ1NuMzhTdk9ZVjA0K1Z4c1BPUVpCSWtlNVFTa0ZqRmRw?=
 =?utf-8?B?RUxkYXBQbE5LNVNBeWpuYzkwTE5LNVhieUpOdmc1QnM0Q0Y4ZFdYaE5HaTNK?=
 =?utf-8?B?OUwwblhCMEI4SXVZckk5TmZkWnlTSmttRk41RDZML25OOGltUEZUSDgxV0FH?=
 =?utf-8?B?YVVRSDJRbitROEp3aE9tK0xKdThXMHczcHRtU3ozc0hMcWNqWVRSeTFEWUFX?=
 =?utf-8?B?dDBGdXVjbHRDdnNsd0JaMTMzcFcvYnE1WlVxbWw2aFM4N2FPdDdlbldjR1NX?=
 =?utf-8?B?QVhOYVNxdzRkVERyMHlOV2pUTFVSVUpBK1ZuNllvZ1QxdDRjM0hTWm81RlNT?=
 =?utf-8?B?THphWUdrSlF5NjVwVWphN3lJcWMyZUdtemdBRXBrZ241dm9iVWM0cmNyZDRn?=
 =?utf-8?B?SmFNWFROR1B2T2F2SFdlM2ZOSUxVVWlPMmc3dTRvaThhdmtuU3pVSHVoVU4v?=
 =?utf-8?B?ZG5JM2hpNWhwWnl4WWFMcUpOL2pnaExQSnovc2J0QmNMYlc4YVZ0Rmlqck9Q?=
 =?utf-8?B?cmR3OEVEMDc4bmdTWTJtTEExbVIwaFd2c2huRDNhWEdnbzNRTFN4K2dNTE8r?=
 =?utf-8?B?NkFzclJITEFFWFJmZ2ErWkFka2JOa1FTeU5pYTBBcjlKaFdvTEdlRUg5VnFv?=
 =?utf-8?B?amRwczJsTWlBWnRERDMvTnVKMXI2QjNYd05JOEVPSHY5N202QU00d2VYRmZ5?=
 =?utf-8?B?L3ZFc1BsQm5QQ2pDY0hyZ1BHQWU5a0FQQi9IWGRpeHRldVlaejExMmtValZC?=
 =?utf-8?B?aXkrRXlyUmkwaG1EZ09ZMGVpTGlZQnUvaWIxZlhTTitSSWVtSWpRc29xWHg0?=
 =?utf-8?B?SnNoYVh6SHFrMHZZeFZsMVR0bnZkTFZKZXlHLzBzdDA2MHVRejhMdCs0aDBX?=
 =?utf-8?B?L1ppNmpldWNYOFhnS2hROWlhbHc5UnF3VDZoQUJxQ284WUVHMHRKQTE3TzY5?=
 =?utf-8?Q?Xe1w=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01700f30-c176-4365-a700-08dd2dfcfa9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 02:51:11.5961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIOv7FG9p7kJA/qO8qh6nXSYDcslFPmARhWP6F2bpWgSZJYrwRlSKTVSk2rP/MNBXt+zMZiXuhUZy1VYCvuvkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IGFybTogZnNsOiBVcGRhdGUg
aS5NWDk1DQo+IGNvbXBhdGlibGUNCj4gDQo+IE9uIDA0LzAxLzIwMjUgMTM6MTMsIFBlbmcgRmFu
IChPU1MpIHdyb3RlOg0KPiA+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+
DQo+ID4gaS5NWDk1IGZlYXR1cmVzIGEgU3lzdGVtIENvbnRyb2xsZXIgYW5kIFNDTUkgU3BlYyAz
LjIgY29tcGF0aWJsZQ0KPiA+IGZpcm13YXJlIFN5c3RlbSBNYW5hZ2VyKFNNKSBydW5zIG9uIHRo
ZSBjb250cm9sbGVyLg0KPiA+IEFkZCAiZnNsLGlteC1zbSIgY29tcGF0aWJsZSBzdHJpbmcgYXMg
ZmFsbGJhY2sgZm9yICJmc2wsaW14OTUiIHRvDQo+ID4gaW5kaWNhdGUgaXQgaXMgY29tcGF0aWJs
ZSB3aXRoIGkuTVggU3lzdGVtIE1hbmFnZXIuDQo+IA0KPiBJIHNlZSBsaXR0bGUgdmFsdWUgaW4g
Z2VuZXJpYyBjb21wYXRpYmxlIGxpa2UgdGhhdC4gQWxsIHRoZXNlIGFyZQ0KPiBhYXJjaDY0IHNv
IHdoeSBub3QgYWRkaW5nIHRoYXQgY29tcGF0aWJsZT8NCj4gDQo+IEhvdyB0aGlzIGdlbmVyaWMg
Y29tcGF0aWJsZSB3b3VsZCBiZSB1c2VkPw0KPiANCj4gQW5kIGJ5IHdoYXQgZXhhY3RseT8NCg0K
VGhlcmUgd2lsbCBiZSBtb3JlIGkuTVg5IGNoaXBzIHdpdGggU3lzdGVtIE1hbmFnZXIuIEkgd291
bGQNCm5vdCBleHBhbmQgdGhlIGxpc3QgaGVyZSBlYWNoIHRpbWUgdG8gc3VwcG9ydCBhIG5ldyBT
b0MuDQoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzLXJjMy9zb3VyY2Uv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc2NtaS5jI0w1MDgNCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjEzLXJjMy9zb3VyY2UvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9w
aW5jdHJsLWlteC1zY21pLmMjTDI5MA0KDQo+IA0KPiBBbGwgdGhpcyBtdXN0IGJlIGV4cGxhaW5l
ZCBpbiB0aGUgY29tbWl0IG1zZy4NCg0KSWYgdXBwZXIgaXMgb2ssIEkgd2lsbCBpbmNsdWRlIGlu
IFYyLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0K
