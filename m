Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30DC26059D
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051152; cv=fail; b=atyiJU6F8f6F2obVJ5NmbsDZYQg+lNUgiF8yydDEauIu5HMeQ02+LvyJuNbq/G1sF67GXFTiOFC3z0J8Mb3XdjFb3nTMqF1L7jOd1shrABrd96AprVi5M+jUBuhbFxilN1E7ROQjxXKDDgZgiG1L01d+J1JaZ7RLmFbwA21kXac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051152; c=relaxed/simple;
	bh=m35qySiRiZowEnybvCA1ZvQiZcL29JCYk/G8OE4wQuU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KSmLAmCztnQkq1DQCzE8lA5SxOIH6fBAoUfij/amFVKRmhLxAfgzkao81S67S6UylsCoFY0uNEDjW0SnjlFrcKv0/gmZUCI6+fB51RAyQ+2la90du0xT5AkH85QemD8yRfkR4cGYQX4ftfBxKtYSOhEDp1UmrvyiELvvR6JDFpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PtanAqaK; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PtanAqaK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl4tZ7YzA0WOpkNkOcJnW9f5650EaJT+UA5YYpprtnRftWTRgJcG968IUtSoF9JfZyYYWDCTVtBaGfMvKjD0NN1KfWvev0SoVQAJuDI7H8bNKYOCyfPiyq49691viGy5q6PZu3xbX2dKtHNMd04Qdd9wC+t5Inqxdw79Drg5oqwfgC28D7b4dv3u1xd4fy5QMiRYLtyo2DIPspokFXO21rmMvbqksDJiSkWgtMJBFvj2VaWJtyJJVQMv7D0o2qGtIk7Jdy9bUOAaSUV/F+CTMOypPVccPIPU+XqHbjDzFM+jaLEQ1gmzUlZlhJABNv54sG4b+fR6h3q8Mqjit1lviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m35qySiRiZowEnybvCA1ZvQiZcL29JCYk/G8OE4wQuU=;
 b=Muc4V/2fwq99LeiusbXl7QS+3zkGIoksuhFmAUyqCJXU+PFrogO+fIjcY3lhe4V1cf2B4nb5vEBxtncz6+ESVHOfUe26iyjiAq1aIUo5oeC4bXq3PJuifSAVx28+1MuDZ23InbJHHHkbDZM8KbI8EnlwCDiWdVZzbinwX+F98Xp8foMBAkuWvLmzllioToWT0W9jObAgRF5z9i5XNiFoa8AqGIeehya/AKNeLGHYXEvGZv6nfx9B/gGH7LqxQdgR1w22tmyKT1MbkIU8zvfBUWnQ9LkmHOIDoRu/l/aSK3wJR+g/OuLuALfxdxQQcW9l0w8hYhJd5GaFW+DSMiqPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m35qySiRiZowEnybvCA1ZvQiZcL29JCYk/G8OE4wQuU=;
 b=PtanAqaKbkIG3DHrq0rkG+sgZN38Y1NPuSdfuZRQRSsnaqBvHIRuf37RVoKmt/yShP0AHKNQ4L1lUuu7nG20ouZxXBauRV0WAX4/KEs9LhsoOXgi2jWkEsF8YGARfR2fXQlNU0kAbd0FSTkOMJ7leW89YEf2h+oHSsEcIfjQFKrR8Y5B1VVQpYoE5Fe1EQoi38NGWyLr2e5YEImvxUrMfHK+A0qjj0Xb5rCtLv0mFvBV0GMOfFYMVUCQdQUGbqsEwyKTZfXWsWYG2+tVdonW2oopB2V9cYYE3xEG2A8G/RstxIEH7Ldo8Is6KLWjANTD61XWGmXS+P1ICKBrXsdpiQ==
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by GV2PR04MB11214.eurprd04.prod.outlook.com (2603:10a6:150:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 09:45:46 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 09:45:45 +0000
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
	<linux-arm-kernel@lists.infradead.org>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v22 5/7] firmware: drivers: imx: adds miscdev
Thread-Topic: [PATCH v22 5/7] firmware: drivers: imx: adds miscdev
Thread-Index: AQHcb+pFlqO5vYjb0E6T0s+YLx+KpbUnIYCg
Date: Thu, 18 Dec 2025 09:45:45 +0000
Message-ID:
 <DU2PR04MB8599D0CC5EFE125D4B29AA9895A8A@DU2PR04MB8599.eurprd04.prod.outlook.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
 <20251218-imx-se-if-v22-5-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-5-07418c872509@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8599:EE_|GV2PR04MB11214:EE_
x-ms-office365-filtering-correlation-id: 6d2228aa-ee76-4bc4-3257-08de3e1a376c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWlacXRGWHNMZmdTZVpwcFFFY2tDcldoTHgvQzVkNG9YOC9BeFFFdDVNeThQ?=
 =?utf-8?B?M3JTdVlIUnhTNGt1SUppdW1iNE1LdUlVYTFmdHovMVNhQnFNMXhqc2xDSDVF?=
 =?utf-8?B?UnNuVjFXWWJpcER3aVREUXdIckwyZWl3L0xEZHhHYnJoYmdEMFJ2WGxDYmN5?=
 =?utf-8?B?TS92U0gxYUZiTStuZ21WNVdrZnJXWHZjNVdwUVdoaHptejMrT2lFUmxnVmpQ?=
 =?utf-8?B?WUxDUHRYdlZvSVdwY1RtckY5aFovNi9ZelEyTHdVUi80RldDMjZncVlTa2tO?=
 =?utf-8?B?ZmplNHB0V0Q2dHQrUkUwcldMMnFWTXh1TDcxbVpsbHhCWXpsdjd4b1JrT292?=
 =?utf-8?B?YVVPeXhmSS9QNkI1RlBYblhSSnRwZXQ1a2JUUy9ra1RqZi9sRzZWYXVXR1VS?=
 =?utf-8?B?Rk9BeVpudmRHV0dVV3czN1JqVk9mR21aM3Z2MnFkSkVoQVR0SnpBMjNmVUcw?=
 =?utf-8?B?YnlkUElBeHhVeTVINzFFMk5kUnNGWHBNY1FaZUV5ZVVDS3V0NnBRTFpneGR5?=
 =?utf-8?B?TjZqbjdQMCsxdTJPOU9PaHlLSGJoeCtWLzcvWHZ4bzZiQk1jYTVqUFAxT2pj?=
 =?utf-8?B?eHBUWnlzMFV2TTZLVUh0ek5qUmN1TTI0ZEg0b1pwcWJBdGRlZlk1WmJqNEVK?=
 =?utf-8?B?SkE0L0ZqdkdLMFRJUVl3SGZnM2hJTFk4aXlYcjIxdXZHRTE1SHh2bnIvZmVX?=
 =?utf-8?B?QlMzZmJocFZ6N0w5TWtPUU1qNTc5UmoxakhlUXJ4dTBPd1l3OFE5Z0krdG4v?=
 =?utf-8?B?NXQrUXlzcDRXK2ZIbjY2aUMySUFVNVQ0KzlueXA0NjM4Wmo0RWtqTXMyYzZu?=
 =?utf-8?B?enFtK3V4RDVRY1V0M3BFYzVHN2RtRnhrVDBkZE9aelNkQ0VzblEyWjJHUEJC?=
 =?utf-8?B?dmZnS1JNbFJ5b0N4UmFraGVZdC9kNjl5cndnN0pUL2JpamNLZVFyT2hFdWMz?=
 =?utf-8?B?VnA2Q29XMGtlc3UvZXA3aGVjaFlQR1gwUkpXc2NGNlphWGcrcUFWcDNXbld1?=
 =?utf-8?B?SHRoQytSNStRRmhwSnBpMmtpaWU0b2JUU3RpWUQyYW9ZZ21aSUFZcmwzaU5D?=
 =?utf-8?B?Umo4Nml5V2FQb08rcDE2bzBZb05tM2dYTERFYVQxVU4vQkQrNmJuaURDelI2?=
 =?utf-8?B?ZVIxWitaZjNLczVvZFd2a2VWdTZQQ2wySkxJRlRxdkN0aHNzZ05ENC9IMmRF?=
 =?utf-8?B?RnhvTFV0N1o2S2tmcjlEZkFvSUtYd1NyYUlhdGRnQURxMlBEd2JaQnFDUE53?=
 =?utf-8?B?Zk9YTjlzUXNNWHpSeHVWcG5hYWxDdFc3M1Q3a2tlcmkybm9rKzg5VzAwcTZI?=
 =?utf-8?B?a0lmcms4Y3puREJvT2kxaWxGOGF4dUVRTHZZV0FobXE0UjArNHprd2tOQWRa?=
 =?utf-8?B?TEpNVnBwdmJONG5zSXVqdEJ1enMwUzlhSEx0N0V5Ni83dTlJYTR4eVJvNlE0?=
 =?utf-8?B?S2YvVzFVd1phVll0eW1GVkxRbXA1T0U4OXNTTDQzZXJWQVNyVFVNMnAweE51?=
 =?utf-8?B?RE01N0lXSmh3M2FVZ3QwREtiN1VsbFBHU3JMSjZFWURWcnhoV0RwVHZOTTYw?=
 =?utf-8?B?TTY1ODY2UlRReC90VjhBbjdPMkhvc0FKUUp6TlZLbWhQTHhneEo0d3dUUjJ2?=
 =?utf-8?B?Q2FCS21sTFpnU0ZZRXVuMm5HV2hGMXdBcytQUlpVZVpDa2RSeFZ3ZlIyWlRi?=
 =?utf-8?B?Qk1UajdlZFg2b3hTUmp0M3FiZlZTL2FIRHFycTE5QTh2S1Z0OER4eXdCUzJy?=
 =?utf-8?B?RzBFVDM1Q2l2RGwyYWE3UUVwUDBUY016TzBUVjhLWnloV2dQdnZlWGdxWkdz?=
 =?utf-8?B?emNtUi9iQTB2L0ozU283TUpVbndZSXNhVFllQVhHVEtZSTZEK1E1M0ZLc25m?=
 =?utf-8?B?VXVsOXFqeUZJdlFBK2VkckVPOTM4MC94NHR1Tm1Hb1QydUVFV0l6S1VFQUhM?=
 =?utf-8?B?alJ1c1Y5MTlFUHJMcGlXZFJ6YjIxeHlVaHFjczVlMndEZmFRSHU3ZU5IZm8x?=
 =?utf-8?B?NnpBSWJmNmZKOVNScUI3THdwd2NyT1lsTEthR3FvOWl0b01jVmZRZ0pBNG55?=
 =?utf-8?Q?oZmt69?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ektFVisvM3Z2UEhqVm9JbVNPM2hBVkV5MDJZZWV0N3ByT21HTmtQbHh5ZSsx?=
 =?utf-8?B?MytHUXBBM3JiMHlyV3pwb0c2czVTOVZGK2o0Kzk4RUVxZnUzMTNCZnpzU3I3?=
 =?utf-8?B?eGZpbzhKUzZMSEdTVGxXakh5Y29GejE5dFA5Zm00cXVmd0wxcXl1UTN6Q2Zq?=
 =?utf-8?B?N284UXZHdGUvM0wzK0RCMWR0NFB1b3VVeUhibGt0YjU5L0tJdldhOG5TdHBX?=
 =?utf-8?B?cVZhUXdyN3dTMzRnV2pjb0FvRGphR3c3REhpU1JCZXkySHNPVm1oS3FPY3RK?=
 =?utf-8?B?dHFkMEJ6a3lQdjkyQUpRbTduL3hXOHh5VGYzdFZpRkZwQkNNc3B6MFVyQjJJ?=
 =?utf-8?B?VE03blhLeWZReVVBWHVKSmxZRTJ6UXYwSUFUNjhwVmo0Q0I1bm5QcldCVWhM?=
 =?utf-8?B?NlFOM3lqWlROMG5tM1JnL09hcjRmdEJBWllmTm5vMFE1MzNjV0MrWmNBblZ2?=
 =?utf-8?B?bWhzNnJIRDV5ZGxIZytOczVYeXNjMnNTYmJkZUZxU1FCRXZ5WFdzY0ZHdGRC?=
 =?utf-8?B?aFl5WnNSU3daOG4rakNwUnJVcGhaYjY0NzQvMmlmWUY1d0JvQkprb1dNTDdQ?=
 =?utf-8?B?VkYzc2VzWTc0RTkwbEFCOEJOaGU4dmM1RkpWWCs1NzE3NmpNK2xjWi9hemRB?=
 =?utf-8?B?VnB6TmRBdE5rRTRKUW9XV1MwSFdzMEE3NjlxM1kvRVNTTkdmTGlteVFzV1p3?=
 =?utf-8?B?VWRjWWtjYlppS3lUVDlObDUyQTZHbTA0NjZHVzF5dWFLVDVVN3pNYmJMUUZm?=
 =?utf-8?B?WVY4aVkxUGNJWDAzejNicmlJek15UDZ6Z0t5K1NEeS9XYk9Ua0l3NS9xNUIx?=
 =?utf-8?B?S3NxYncxNDZoYUZrc0RsakViUXVSbGdXZ1ZXUzlZRkZMaXBmZFhDTkd6cDRR?=
 =?utf-8?B?MmJUUTg2dWNtbkh3K3FOdUVpV2krYUs2cnkrV0dEc2FTaEUwS0FUTjdwcndS?=
 =?utf-8?B?OGg3OFF1MHZQdnZ1Z0VlTzhEZGlPWUhiNkEyZ3ZEWWxDRFBQc2RIMFNUZVp0?=
 =?utf-8?B?ZG1zRXRFWTZ1R2IyeGVuVkNWNlpkVHFXbHpqWWhBZS95aVJxVUZsVXFYUElm?=
 =?utf-8?B?a09sOEgrSXhPRlU2bHY5aHhPM1d3Q21MTzRNVFVKTmcvNmF3em5qOTBYdmR1?=
 =?utf-8?B?SnFwWHlEWGFiQ2lvYUp4V2tVQVdoWUUwODJOS1o5Qit6TCtaWEdBcUl4Vllh?=
 =?utf-8?B?VkFFb0FGVWJqNkNBTGZnSFVEbFNPZHByVlU1WVczREJvcENZdWlZSGQ0Z2xR?=
 =?utf-8?B?VkZGTC9CTjFSL3dDeldROXNqcVQ0VDFLSHM3S2dZQmZ3cTZFMjM1dDZqdldI?=
 =?utf-8?B?WE9KSXBJUWoxS2ZNNWtVc0N2TllmRVlMNFF4Wk1HZHJaU21EUGpkUzd6c21k?=
 =?utf-8?B?R0Vkb2M0bVptSEhtaE5sem9XM2ZDa0s3Qng5TTIzZFhnS3NUaUNhTEYzQkJv?=
 =?utf-8?B?cEZTOVN6bFc0aXVQMWQxbFcydkhPZEdlam9uM1BVL01iSTJsSnRiMnRWaWRC?=
 =?utf-8?B?cVRuWlorSU9idCswK3pvcjY1WkFwWjQ1SlBsY0M0Mllrb1UzbXprc0xqQk1T?=
 =?utf-8?B?NktpM0dmVnVIS2tGUkx3MXVRektXZ3o3SDIzcUtZdEY4VERhamRsV2RGVVdL?=
 =?utf-8?B?NExqenRlU0drQWJnTFpiSU5iRkR4Z25FYzVFalRpeG04RklhOGtsdVMzazNE?=
 =?utf-8?B?WGtlZVh1NkZBYUxSUmpGOUUrV3JqNmdtS0JCYnUxb0pZenM2TDZ5WVhma3lV?=
 =?utf-8?B?dW5saE9TZTNoajIzeVdtL05oQTgxV1FKeW1WNlovaWQzOUFJaVJOWnFBTE9K?=
 =?utf-8?B?aktnVlBCVlZPWWdraG1Kb2lVOVZwZ2FET2xHU2ZYOEdVdUk1SThHeHpEL3lE?=
 =?utf-8?B?RTEwek9BZ3FkNk9iSzUvalI4cnJGMWtWYk9iU0c4TjV4di9rRVVEOHhIZTBN?=
 =?utf-8?B?U3BuQXZxZGdTejFUcFFFWng3andaS1lKbDNzTG16Z01PZFpSdHgwb0lURmVp?=
 =?utf-8?B?U0owVEhCZ0o0V3lXZlNDc3BkQno4NlpibVZMN0ZacWJLWjY4UzJZVDFFZGhR?=
 =?utf-8?B?RGpuS0dwdXN1TlI5RmV4bUpSWDd2ZVlwak41WDFNYXBCYlU4eEQzbzBaN2tv?=
 =?utf-8?Q?i664=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2228aa-ee76-4bc4-3257-08de3e1a376c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 09:45:45.2860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n057K8jDyOc0M3rV8M4ejyzjdhvGEqx47OTYxliqNZZLnSIBAEi3k73zSLi3W+VS5i8ijs7uGKJGC/jdj/vQCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11214

PiArc3RhdGljIGludCBzZV9pb2N0bF9jbWRfc25kX3Jjdl9yc3BfaGFuZGxlcihzdHJ1Y3Qgc2Vf
aWZfZGV2aWNlX2N0eA0KPiAqZGV2X2N0eCwNCj4gKwkJCQkJICAgIHU2NCBhcmcpDQo+ICt7DQo+
ICsJc3RydWN0IHNlX2lvY3RsX2NtZF9zbmRfcmN2X3JzcF9pbmZvIGNtZF9zbmRfcmN2X3JzcF9p
bmZvID0gezB9Ow0KPiArCXN0cnVjdCBzZV9pZl9wcml2ICpwcml2ID0gZGV2X2N0eC0+cHJpdjsN
Cj4gKwlpbnQgZXJyID0gMDsNCj4gKw0KPiArCWlmIChjb3B5X2Zyb21fdXNlcigmY21kX3NuZF9y
Y3ZfcnNwX2luZm8sICh1OCBfX3VzZXIgKilhcmcsDQo+ICsJCQkgICBzaXplb2YoY21kX3NuZF9y
Y3ZfcnNwX2luZm8pKSkgew0KPiArCQlkZXZfZXJyKHByaXYtPmRldiwNCj4gKwkJCSIlczogRmFp
bGVkIHRvIGNvcHkgY21kX3NuZF9yY3ZfcnNwX2luZm8gZnJvbSB1c2VyLiIsDQo+ICsJCQlkZXZf
Y3R4LT5kZXZuYW1lKTsNCj4gKwkJZXJyID0gLUVGQVVMVDsNCj4gKwkJZ290byBleGl0Ow0KPiAr
CX0NCj4gKw0KPiArCWlmIChjbWRfc25kX3Jjdl9yc3BfaW5mby50eF9idWZfc3ogPCBTRV9NVV9I
RFJfU1opIHsNCj4gKwkJZGV2X2Vycihwcml2LT5kZXYsICIlczogVXNlciBidWZmZXIgdG9vIHNt
YWxsKCVkIDwgJWQpIiwNCj4gKwkJCWRldl9jdHgtPmRldm5hbWUsIGNtZF9zbmRfcmN2X3JzcF9p
bmZvLnR4X2J1Zl9zeiwNCj4gU0VfTVVfSERSX1NaKTsNCj4gKwkJZXJyID0gLUVOT1NQQzsNCj4g
KwkJZ290byBleGl0Ow0KPiArCX0NCj4gKw0KPiArCWVyciA9IHNlX2Noa190eF9tc2dfaGRyKHBy
aXYsIChzdHJ1Y3Qgc2VfbXNnX2hkcg0KPiAqKWNtZF9zbmRfcmN2X3JzcF9pbmZvLnR4X2J1Zik7
DQo+ICsJaWYgKGVycikNCj4gKwkJZ290byBleGl0Ow0KPiArDQo+ICsJc3RydWN0IHNlX2FwaV9t
c2cgKnJ4X21zZyBfX2ZyZWUoa2ZyZWUpID0NCj4gKwkJa3phbGxvYyhjbWRfc25kX3Jjdl9yc3Bf
aW5mby5yeF9idWZfc3osIEdGUF9LRVJORUwpOw0KPiArCWlmICghcnhfbXNnKSB7DQo+ICsJCWVy
ciA9IC1FTk9NRU07DQo+ICsJCWdvdG8gZXhpdDsNCj4gKwl9DQo+ICsNCj4gKwlzdHJ1Y3Qgc2Vf
YXBpX21zZyAqdHhfbXNnIF9fZnJlZShrZnJlZSkgPQ0KPiArCQltZW1kdXBfdXNlcihjbWRfc25k
X3Jjdl9yc3BfaW5mby50eF9idWYsDQo+ICsJCQkgICAgY21kX3NuZF9yY3ZfcnNwX2luZm8udHhf
YnVmX3N6KTsNCj4gKwlpZiAoSVNfRVJSKHR4X21zZykpIHsNCj4gKwkJZXJyID0gUFRSX0VSUih0
eF9tc2cpOw0KPiArCQlnb3RvIGV4aXQ7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHR4X21zZy0+aGVh
ZGVyLnRhZyAhPSBwcml2LT5pZl9kZWZzLT5jbWRfdGFnKSB7DQo+ICsJCWVyciA9IC1FSU5WQUw7
DQo+ICsJCWdvdG8gZXhpdDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAodHhfbXNnLT5oZWFkZXIudmVy
ID09IHByaXYtPmlmX2RlZnMtPmZ3X2FwaV92ZXIgJiYNCj4gKwkgICAgZ2V0X2xvYWRfZndfaW5z
dGFuY2UocHJpdiktPmlzX2Z3X3RvYmVfbG9hZGVkKSB7DQo+ICsJCWVyciA9IHNlX2xvYWRfZmly
bXdhcmUocHJpdik7DQo+ICsJCWlmIChlcnIpIHsNCj4gKwkJCWRldl9lcnIocHJpdi0+ZGV2LCAi
Q291bGQgbm90IHNlbmQgbXNnIGFzIEZXIGlzIG5vdA0KPiBsb2FkZWQuIik7DQo+ICsJCQllcnIg
PSAtRVBFUk07DQo+ICsJCQlnb3RvIGV4aXQ7DQo+ICsJCX0NCj4gKwl9DQo+ICsJc2V0X3NlX3Jj
dl9tc2dfdGltZW91dChwcml2LCBTRV9SQ1ZfTVNHX0xPTkdfVElNRU9VVCk7DQo+ICsNCj4gKwll
cnIgPSBlbGVfbXNnX3NlbmRfcmN2KGRldl9jdHgsIHR4X21zZywNCj4gY21kX3NuZF9yY3ZfcnNw
X2luZm8udHhfYnVmX3N6LA0KPiArCQkJICAgICAgIHJ4X21zZywgY21kX3NuZF9yY3ZfcnNwX2lu
Zm8ucnhfYnVmX3N6KTsNCj4gKwlpZiAoZXJyIDwgMCkNCj4gKwkJZ290byBleGl0Ow0KPiArDQo+
ICsJZGV2X2RiZyhwcml2LT5kZXYsICIlczogJXMgJXMuIiwgZGV2X2N0eC0+ZGV2bmFtZSwgX19m
dW5jX18sDQo+ICsJCSJtZXNzYWdlIHJlY2VpdmVkLCBzdGFydCB0cmFuc21pdCB0byB1c2VyIik7
DQo+ICsNCj4gKwkvKiBXZSBtYXkgbmVlZCB0byBjb3B5IHRoZSBvdXRwdXQgZGF0YSB0byB1c2Vy
IGJlZm9yZQ0KPiArCSAqIGRlbGl2ZXJpbmcgdGhlIGNvbXBsZXRpb24gbWVzc2FnZS4NCj4gKwkg
Ki8NCj4gKwllcnIgPSBzZV9kZXZfY3R4X2NweV9vdXRfZGF0YShkZXZfY3R4KTsNCj4gKwlpZiAo
ZXJyIDwgMCkNCj4gKwkJZ290byBleGl0Ow0KPiArDQo+ICsJLyogQ29weSBkYXRhIGZyb20gdGhl
IGJ1ZmZlciAqLw0KPiArCXByaW50X2hleF9kdW1wX2RlYnVnKCJ0byB1c2VyICIsIERVTVBfUFJF
RklYX09GRlNFVCwgNCwgNCwNCj4gcnhfbXNnLA0KPiArCQkJICAgICBjbWRfc25kX3Jjdl9yc3Bf
aW5mby5yeF9idWZfc3osIGZhbHNlKTsNCj4gKw0KPiArCWlmIChjb3B5X3RvX3VzZXIoY21kX3Nu
ZF9yY3ZfcnNwX2luZm8ucnhfYnVmLCByeF9tc2csDQo+ICsJCQkgY21kX3NuZF9yY3ZfcnNwX2lu
Zm8ucnhfYnVmX3N6KSkgew0KPiArCQlkZXZfZXJyKHByaXYtPmRldiwgIiVzOiBGYWlsZWQgdG8g
Y29weSB0byB1c2VyLiIsIGRldl9jdHgtDQo+ID5kZXZuYW1lKTsNCj4gKwkJZXJyID0gLUVGQVVM
VDsNCj4gKwl9DQo+ICsNCj4gK2V4aXQ6DQo+ICsNCj4gKwkvKiBzaGFyZWQgbWVtb3J5IGlzIGFs
bG9jYXRlZCBiZWZvcmUgdGhpcyBJT0NUTCAqLw0KPiArCXNlX2Rldl9jdHhfc2hhcmVkX21lbV9j
bGVhbnVwKGRldl9jdHgpOw0KPiArDQo+ICsJaWYgKGNvcHlfdG9fdXNlcigodm9pZCBfX3VzZXIg
KilhcmcsICZjbWRfc25kX3Jjdl9yc3BfaW5mbywNCj4gKwkJCSBzaXplb2YoY21kX3NuZF9yY3Zf
cnNwX2luZm8pKSkgew0KPiArCQlkZXZfZXJyKHByaXYtPmRldiwgIiVzOiBGYWlsZWQgdG8gY29w
eSBjbWRfc25kX3Jjdl9yc3BfaW5mbw0KPiBmcm9tIHVzZXIuIiwNCj4gKwkJCWRldl9jdHgtPmRl
dm5hbWUpOw0KPiArCQllcnIgPSAtRUZBVUxUOw0KPiArCX0NCj4gKw0KPiArCWtmcmVlKHR4X21z
Zyk7DQo+ICsJa2ZyZWUocnhfbXNnKTsNCg0KVGhpcyBuZWVkcyB0byBiZSByZW1vdmVkLg0KV2ls
bCBmaXggdGhpcyBpbiB2MjMuDQoNCj4gKwlyZXR1cm4gZXJyOw0KPiArfQ0K
