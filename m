Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE211EB3E
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 01:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741137733; cv=fail; b=AYSYeqiLJDfaRjjSW2cek1Z6aDt9mjR6OUY8isnvIRle5OOf/UYVmcadLICszCaWpnOcndr0ee4Lbf3U2+iMxkauPtpM6C4MCZSb0T9ohKjJ3on9j0tcvhj6tJfzSytWCJsz/QJQZBI9/EqEc2bRtIt8p3qkozqEcwNqx07qxOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741137733; c=relaxed/simple;
	bh=Vm2D/32W38go8flB8oBJ5ahi290MWbss5e7qldp4N7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dcwi75+cEReeldzpts0A/GKxBC7iwlA2iQSiGtGnt5SbgBo2e2S+/JV6qNUtZjmUJfHLp/T2wLm8KVBnbwswU3fGarDrfsVC2JVZ8CNIcPkiB1GppSRUHBmIZIqf6yUwvlUCNW9ehLvP7OsLbyTbMccfwW3lCCgfvsiT7LpnxzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lSFdaPPe; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lSFdaPPe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf6fODkmGeIWMmXWbp5RfgukUhJdxwGgAdflehXzAZQBTvSsyfz8w7z+2STM11pfz59X/33/YwxsLNE+FxVfxt3ZDXvTy6GdEIUIX1iSpvMvgOBwLQJIykruICrhc627knmX8sSZLNQ7KUhbJJhwY0FOIDwnhnitmhMndJvenM0XMJ7ktAARzMA6UxEA++C6CvSEV32NJAqPNJwg+Cdg2eMMksyJdJCoCEIgjMDuF0O0gq7KAiWDwRCp8KgRhyS2LSvku72AXJqSlTtNiShFpxuT75fGQ7IqpOmzQs2+BvJjCEWX7evtuhol2be4IehF0SbO6GeDbuYQChhpG4VK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm2D/32W38go8flB8oBJ5ahi290MWbss5e7qldp4N7Y=;
 b=Is6amd5ZSWiwiYhZ2+7H43CB3juGeFm5502LqdaktrxUbbKQYPSwu2NaP5A6bQ6YWUhJbp4DqSKtEGR9dfB0IxL3Lk3XviOadLgLfhfOA0awj8Jcne/V+m4wFUnFkVJ7IToh6GFhe3vQzEONaoqBTvPTP/S0wc7nLvQ/QUz4uXFBdpR+AbIESpZApAcGcQu+pxvkskUVRfWQCzgmYIlQ9UV8ktyOubnCkUTC3wxoJACsZUazMW1KPCbE8HGSOM4N7UvAairmGMT15qN0YUcgCcvSYYLX0r7RSV99tNwoLIc/B0QwlOfZVtJ8WG5/dbkP0tws5ejezZ8qbD4lSGFEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm2D/32W38go8flB8oBJ5ahi290MWbss5e7qldp4N7Y=;
 b=lSFdaPPeEU3iSRuLfavY1vqMHzuAU+YWt5R5zCxMqHrQ1ke8+7hRAx1/utaPEpJhum9ZZH18/6P506Ly0WPfecBKjfmi4yFMSh2lbJWmXvXFW1zhIcoibhZ3Qf2DAlSXXKxE/h6ImoXUbj+BZyCvfUGYsA3x7V9C/3B459PqDwK2f4WIB0DTheJoQyXYdSPdL8Y7SX3roD/Pz9L6gQvVj1rE8sb6jJtwIpJ9B0TkS277o167HDxMsoemWEFJyqION/MjjGpmc8BzzbV61LNnxV01Fku0PwE9/+3mL7TEai5VU4SqNj2KF7rzXKPfFixvNpGAyiz4gHI0tdRGV7dtuQ==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 01:22:07 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 01:22:07 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbjOg69YhLe5tDw0KrTwzmNv+1a7NjEMIAgACn6gA=
Date: Wed, 5 Mar 2025 01:22:07 +0000
Message-ID:
 <AS8PR04MB8642F0234301B23206E78A0287CB2@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-4-ping.bai@nxp.com>
 <9581e376-19b2-4d4e-ad81-cc24e39e9d33@kernel.org>
In-Reply-To: <9581e376-19b2-4d4e-ad81-cc24e39e9d33@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM8PR04MB7970:EE_
x-ms-office365-filtering-correlation-id: ae27a3af-312e-4baa-9ae6-08dd5b842537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eE1EcWpJTGdKN0ZLZmR3ZDUvL1hkK2ZoOTdTcmxzbkhKZXBMbDdVNi9WUThB?=
 =?utf-8?B?V1phU3hCYnJYQitBaFBHZnplQWlRWTh3UjZlcGdHeUFUV0pONlVCbXpkN2NR?=
 =?utf-8?B?NkJUTDdKS3k1cXBMclptSGt4K3d1TnJoVEtnd3gzWFVrVEhBNWxHdG16eHR2?=
 =?utf-8?B?VnJGbVNRMEV2OHBNcFh2cVdjQXcwMUlHTW85ckpEcXpqRWFxQ2l4UlRiWTA5?=
 =?utf-8?B?UjNNMWMvQkp3SVprbmpjVXI2cm5iWlllR3E5WGxBdzBMbGd5YWtyWmtXN3Rj?=
 =?utf-8?B?VUtmOFhoZlNaVVJRTW11SUdQT0N2eVdLZUswMlFPc0xrOEd1TGhSWU52aUNR?=
 =?utf-8?B?YTBhTjQ5eDVBYjVsZWVodjZDQXAycUZlbE83N0NjRnZEUkxKUDkwVGlVaXlM?=
 =?utf-8?B?dUk0cS9FdWc3YUtvRlVCMWpWd2p2bVhqZjN1VW9wV040SlNOeTBrNTlhdHgw?=
 =?utf-8?B?YmQ0TWpRMmJ3eEFuQjJHWTlUb1JGSkE4VVd2Z2x5SFhzM28yUWhxejQzdnRF?=
 =?utf-8?B?YkpnTUI4b0RLd2ZnQXJ3ejQvbi8vNC9SUnZQdkRSSHZkYldneUFzY1NNcDZV?=
 =?utf-8?B?RzIxR0kvb2JkTHZoKzB3dzc1QURKTThCK3djSk5uV1lYck5BUnBvS2NGNnEw?=
 =?utf-8?B?dlJBQmlRUHVMTmZ5TkhkSEVmVVpXNEtSWkNOV3dxdFpnV2JUdHVQcU5tWmlQ?=
 =?utf-8?B?dXZMejRzMVdSSGZac0ZkcTIxQjFOeVZlSzZCQlZGWklCdEpGdzdOQ0c2eDlt?=
 =?utf-8?B?Z3NHTnBsTSt4S09rN2x6VFhQZ2ZWQVIyanlWRldTcFU5NzNJREt4M1ErUDRB?=
 =?utf-8?B?QlF4M25VUWpBdThVTU4zMVdwRGpLVWRMYnhHdnNtOTdxNFhMd1hQb1J2TjVr?=
 =?utf-8?B?YXZQclE2dkdiMjhqNE5jTlR4N2tQdzNhb1pLUDNVWUV0ZWYvekZaemdWTWJF?=
 =?utf-8?B?R1NDK0dycHl2N2VMZ2dycUNIUENTbFJwTlNINVRYQk1iWVFUbDBuWG1sK2lt?=
 =?utf-8?B?Y3o0bmRYVmRBTy83MWhVeTJHZXJ4QU82SUVCbXUzUGZPRDNXeGQxWENMSk1j?=
 =?utf-8?B?eFQ1UEgxSE9iL1ZsOWlFN21VSFNiL0E4MEpLSU16d3F5MlZEVmg2clBIQVVV?=
 =?utf-8?B?OFduOEMrbFRoUTU5eUhUMEhjWnhxcTQrTSsyVEJWWDM5SkVjZ3lmbzV6ZEhN?=
 =?utf-8?B?M3EvVVh4cDFkYk5jdFBpZW1CbmYxL1ZjOHQ3dnZhVm8vSTVEaEE4cXdkSTJz?=
 =?utf-8?B?VXZtV2RlblBQZ3NzQjZoNGR2Y3dVQktVNG5NRXhTNmI2SWtQQjZNbnJMamJI?=
 =?utf-8?B?Z1JvOEUxdTRHeEhpbTkydnpKSnhsZEQyWnE2SjBEdVNzMERzZVRIU2VnR3Fs?=
 =?utf-8?B?bUFQTytXNlNteEVZUHNsakR0MnhYK2p6MURYRzFDQnBJRVNjTURpL0JTNFBm?=
 =?utf-8?B?L0oxNmNDNlFZQU42ZmVubGkxa29nWmJlWjAwMlhMam5nWnUwbUJSWlJmRFpq?=
 =?utf-8?B?eUZSb25IQzFwL21xa0pzeUE2QW1nelhOVmN6SXNBZjlzSVlDQmNPWWdIalAx?=
 =?utf-8?B?dmJkci9UbDdZa1ZJcURMQUtHUHI0TGl5TldzZFBYNWs5QUpxd1N2cmJvN0Ix?=
 =?utf-8?B?eG1Ecy9HQ1dOUHE5Nk14V2pzYmtyc0ZBb2tkZk9aTlNudzlsa1NnSEtyRGJQ?=
 =?utf-8?B?TWtYc0RxdVRYaGtGaGhMZUM1QnYxUTI2VHZ4VDdhaGtWTVNyTmtBL2VyRjg0?=
 =?utf-8?B?dCtTQ2R3VjNMNlo2bEJiVkFFemRVR0JrSFNqb01DT0pLaWhXcmFlc3BNMmY2?=
 =?utf-8?B?dWt6ck5tNVF6VWZYOGY4b3ByLzBEK3ovcmVHVTV5Q1JYMWxSamp2TWgxZ0du?=
 =?utf-8?B?ME5YL3hMOThmNUUvVjk1OUt5SDc3alVuOWhqUVEzbyszV2R3TE1xYVppaE4v?=
 =?utf-8?Q?iuyNP/mkRqkf5v1zbz2OSXO0zTekth1n?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWNhR0xyWFdiK0E1WXBibG5rYVM1QytnaUlwcXJHQTRpaTQyL1VNeVRNVytH?=
 =?utf-8?B?UzBjdHl0U2tnMk4ra01pZ3FPRVhYdUZ2U1p1aHErMkdPblVENmEyUlIwbUxS?=
 =?utf-8?B?bGRXbFk2cXFxK0g2U2dIZ3dUSHFwQ3U1WG9tK0QvZnVXL056Zzg2OGlzNTlP?=
 =?utf-8?B?MDRaMXFpN0pDaFlsNSs1dzByUTdYa2dkaDNMR1RycEgyTEJESWVUSFdCL0V0?=
 =?utf-8?B?bmdXTDlLTmxtcmlkcWJrYk4raEtXWmszZ1kwS3gvVG1HMlhndUVOa0VOay9U?=
 =?utf-8?B?aEwrZEpmNGd5d1o1TjZTcUJaNGtWRGx5WUpqTGlaVEtLbVM4Ulp5OGpNME5y?=
 =?utf-8?B?cFFHZ3YzL3I3djRHc0NEQ2hZL01CQk1CWlBqUTUxSWhFU0dHODcrRWxoTm1r?=
 =?utf-8?B?MS9Ndy95R2tHVVlpN1lGTStEaHRpS2NiODB5a0dNRXF4WXlZVGRjbFNTc2Fo?=
 =?utf-8?B?ZjQzaWpSWDdNZDREWG1MSHVxOHdOMlRyM01oSFJCT2d0VUt5RnY3ckRPeGtk?=
 =?utf-8?B?cUthQ04vVzlVYmgyMklpOWJTKzBjM3FlRTN3aXBGKytEMlhHM1UwQzFmeFdB?=
 =?utf-8?B?YmJEQWwxcUt0QWU3ajNiTDJLS1E4YmlIZWN5L3pFeFB3MXNEUXRnTzhtSjJT?=
 =?utf-8?B?akxxdWN4K1ZtVTZ5bElLUFNxRDBKSy9EY0NrT2M0eldHRjR1REZQeStNNk9P?=
 =?utf-8?B?Vms0RGk1MGI2enlNV3hGUUdtdm5DRVFZb3RZcWh2QjVqZGxlNDJmMlpKNnh4?=
 =?utf-8?B?eVRDckZYYitHWTR1VDVka1IxWmEvVWgySldtcHIwZUorMUVWTmxxZGRQeXBt?=
 =?utf-8?B?YXpiTVNhSHc5UUE1aEROYzJCUXNyUFdCeUhkOGRwMlZwbDBqaGVld2s5NUk3?=
 =?utf-8?B?MzlYRXZiaUh3SEZoVUZuMUtuZWFVeWFyQW1xRWpSUzMzd0tSV0RSd1pjclNr?=
 =?utf-8?B?NlI0YlV5YjJCMklGQ3ZTcVdxWjFxNlo2VFNaY2U0bjNCNjRPK2tJcGRmYTZL?=
 =?utf-8?B?TGYrTGFON2tWaHE3TWR5dVI3bVY3d3pSNmd1aWpWaDdaZUV4UTVlR0FMUmpC?=
 =?utf-8?B?SlMzcmdNVjY0Qk5yTXh6MmNuQ201TFVneHBLVmhzNHc3VmlOOXkzcDc2QlJW?=
 =?utf-8?B?K3d3RkFVdlRvOGZvVE53Um9abDN4T0NDRXRNbHE5OXRMRmtTWVdDaE53ZG5L?=
 =?utf-8?B?VWFQYS9YMmVTUGdoRmgvL1R2b3VacFM5WW8xZzd3endMdkZUdEJsRWwxZUhF?=
 =?utf-8?B?MjJySExEbHZRSXJTYnk4bENtZEY5RXR3eHFzQW1mWUlkOWhwZHFUVHR0NHlm?=
 =?utf-8?B?K21pM1U5LzU5VXY3R1plNjdGUno3eUJoMk14c3k3aXh0V3NOcFJZM0EzKzhQ?=
 =?utf-8?B?UklGcVE5NFZsZTl2cHArbnFDMStZZzVKc3ErR3VEUXpVL1JwUDZBb0RKVWpk?=
 =?utf-8?B?TDYwRjBzMEdlaDB5Wkgydzl4WXI1VnJ5UTRydyt2eEorbXUxaG9sN2ZUb2Ra?=
 =?utf-8?B?L2g4T3BGQXhkYnBuaGVxMzY3T05TNDY1blNORlh1N25yb3VCdmlJL0VoU1NS?=
 =?utf-8?B?UUowbDBZR2tGWHBCMkNNS2IvZFZwbUlsK2RtblNjT1Z5czVaYmNGbHN5Mmwv?=
 =?utf-8?B?bHd0cnpndFZJWXNKeFdGaDA1eHF4UG01MTA2bW5tRXVtam5hYWNhbFJrcHBn?=
 =?utf-8?B?QVNOT242bzlnMERwTEZDUDRWeWI4YjRvelFqTVNIZHpURE1qblc5Vy8wNHRk?=
 =?utf-8?B?TUdNbWoxWVl6Q2M1Q09CZGdCalVRWW9aaEFlWXFuTDUra1lhTDRrUnFLQmZI?=
 =?utf-8?B?dkhlWnFTSW1ES3VSd3pVdWgzb04zZWg3VjZhdlpYNFJDekhyNG1sODNKSW55?=
 =?utf-8?B?V2RjYjZxcERlOHl1cGk4c1VaUERSNHM5TGN6Qnloc2ZDeFo1VFluZWFlWWFh?=
 =?utf-8?B?d3J0dDlJb0JHNHNJdkZNQTRhcE1vdHYwNDhtMWh1a0J5cUgvbThMOWRnTnlw?=
 =?utf-8?B?OE1TMURaRFJ0a0NTRTRYU3NILzRuNCtMMm1jaW9nSjdYbEoxZGhUMmQ1aHlr?=
 =?utf-8?B?SXgvSFQyMlB0T0xzT0Yyd0xhVW8yVFk0QzdDbGFGWDVJQ0dlVUloc2dOeDlt?=
 =?utf-8?Q?DmMI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae27a3af-312e-4baa-9ae6-08dd5b842537
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 01:22:07.4530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j40xkX19Dz9pBEVRSDqOGAT+KUDeLr1gtzKbm1haaInndfky2EtmIY1OCQgZqN+wYJopgjM4vTLNCbjcJQINoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970

SGkgS3J6eXN6dG9mLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy80XSBhcm02NDogZHRz
OiBmcmVlc2NhbGU6IEFkZCBiYXNpYyBkdHNpIGZvciBpbXg5NDMNCj4gDQo+IE9uIDA0LzAzLzIw
MjUgMTA6MzEsIEphY2t5IEJhaSB3cm90ZToNCj4gPiBBZGQgdGhlIG1pbmltYWwgZHRzaSBzdXBw
b3J0IGZvciBpLk1YOTQzLiBpLk1YOTQzIGlzIHRoZSBmaXJzdCBTb0Mgb2YNCj4gPiBpLk1YOTQg
RmFtaWx5LCBjcmVhdGUgYSBjb21tb24gZHRzaSBmb3IgdGhlIHdob2xlIGkuTVg5NCBmYW1pbHks
IGFuZA0KPiA+IHRoZSBzcGVjaWZpYyBkdHNpIHBhcnQgZm9yIGkuTVg5NDMuDQo+ID4NCj4gPiBU
aGUgY2xvY2ssIHBvd2VyIGRvbWFpbiBhbmQgcGVyZiBpbmRleCBuZWVkIHRvIGJlIHVzZWQgYnkg
dGhlIGRldmljZQ0KPiA+IG5vZGVzIGZvciByZXNvdXJjZSByZWZlcmVuY2UsIGFkZCB0aGVtIGFs
b25nIHdpdGggdGhlIGR0c2kgc3VwcG9ydC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2t5
IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLSB2MiBjaGFuZ2VzOg0KPiA+
ICAgLSByZW1vdmUgdGhlIHVubmVjZXNzYXJ5IG1hY3JvIGRlZmluZSBpbiBjbG9jayBoZWFkZXIg
YXMgc3VnZ2VzdGVkIGJ5DQo+IEtyenlzenRvZg0KPiA+ICAgLSBzcGxpdCB0aGUgZHRzaSBpbnRv
IGlteDk0LmR0c2kgYW5kIGlteDk0My5kdHNpDQo+ID4gICAtIHVzZSBsb3cgY2FzZSBpbiB0aGUg
cGluZnVuYyBoZWFkZXIgYXMgRnJhbmsgc3VnZ2VzdGVkDQo+ID4gICAtIHJlb3JkZXIgdGhlIGRl
dmljZSBub2RlcyBhbmQgcHJvcGVydGllcw0KPiA+ICAgLSByZXNvbHZlIEtyenlzenRvZidzIG90
aGVyIGNvbW1lbnRzDQo+IA0KPiBXaGljaCBvbmVzPyBCZSBzcGVjaWZpYy4NCj4gDQoNClRoYW5r
IHlvdSBmb3IgcmV2aWV3LCBXaWxsIGltcHJvdmUgdGhpcyBpbiB2My4gDQoNCj4gQmFzZWQgb24g
bGFzdCBpc3N1ZSwgSSBkb24ndCB0aGluayB5b3UgaW1wbGVtZW50ZWQgY29tbWVudHMuDQo+IA0K
DQpGb3IgdGhlIGNvbXBhdGlibGUgc3RyaW5nLCByZWFsbHkgbmVlZCB5b3VyIHN1Z2dlc3Rpb25z
IDopDQpJcyBpdCBhIGhhcmQgcmVxdWlyZW1lbnQgdGhhdCBlYWNoIHRpbWUgd2hlbiB3ZSBhZGQg
YSBuZXcgc29jLCB3ZSBtdXN0DQphZGQgbmV3IGNvbXBhdGlibGUgZm9yIHRoZSByZXVzZWQgSVBz
IGV2ZW4gaWYgdGhlIG5ldyBjb21wYXRpYmxlIG1heQ0Kbm90IGJlIHVzZWQ/DQoNCkJSDQo+IA0K
PiA+ICsNCj4gPiArCQkJYTU1X2lycXN0ZWVyOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0NDZhMDAw
MCB7DQo+ID4gKwkJCQljb21wYXRpYmxlID0gImZzbCxpbXgtaXJxc3RlZXIiOw0KPiA+ICsJCQkJ
cmVnID0gPDB4NDQ2YTAwMDAgMHgxMDAwPjsNCj4gPiArCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8
MT47DQo+ID4gKwkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gPiArCQkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyMjQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lD
X1NQSSAyMjUgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAy
MjYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjcgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjggSVJRX1RZUEVf
TEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjkgSVJRX1RZUEVfTEVWRUxf
SElHSD47DQo+ID4gKwkJCQljbG9ja3MgPSA8JnNjbWlfY2xrIElNWDk0X0NMS19CVVNBT04+Ow0K
PiA+ICsJCQkJY2xvY2stbmFtZXMgPSAiaXBnIjsNCj4gPiArCQkJCWZzbCxjaGFubmVsID0gPDA+
Ow0KPiA+ICsJCQkJZnNsLG51bS1pcnFzID0gPDk2MD47DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsN
Cj4gPiArDQo+ID4gKwkJYWlwczQ6IGJ1c0A0OTAwMDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUg
PSAiZnNsLGFpcHMtYnVzIiwgInNpbXBsZS1idXMiOw0KPiA+ICsJCQlyZWcgPSA8MHgwIDB4NDkw
MDAwMDAgMHgwIDB4ODAwMDAwPjsNCj4gPiArCQkJcmFuZ2VzID0gPDB4NDkwMDAwMDAgMHgwIDB4
NDkwMDAwMDAgMHg4MDAwMDA+Ow0KPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiAr
CQkJI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKw0KPiA+ICsJCQl3ZG9nMzogd2F0Y2hkb2dANDky
MjAwMDAgew0KPiA+ICsJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OTMtd2R0IjsNCj4gDQo+IGlt
eDkzIG9yIGlteDk1LCBsaWtlIGluIG90aGVyIHBsYWNlcz8gQW5kIHRoZSBjb21taXQgbXNnIHNh
eXMgaW14OTQzLg0KPiANCj4gSSBhbHJlYWR5IGFza2VkIGZvciB0aGF0Lg0KPiANCj4gPiArCQkJ
CXJlZyA9IDwweDQ5MjIwMDAwIDB4MTAwMDA+Ow0KPiA+ICsJCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDkwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsJCQkJY2xvY2tzID0gPCZzY21pX2Ns
ayBJTVg5NF9DTEtfQlVTV0FLRVVQPjsNCj4gPiArCQkJCXRpbWVvdXQtc2VjID0gPDQwPjsNCj4g
PiArCQkJCWZzbCxleHQtcmVzZXQtb3V0cHV0Ow0KPiA+ICsJCQkJc3RhdHVzID0gImRpc2FibGVk
IjsNCj4gPiArCQkJfTsNCj4gPiArCQl9Ow0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
