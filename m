Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68F25D551
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101366; cv=fail; b=XQsSKg240OH5pD5TdJZvuXZx5zNb2bSk6ao/ePkRQb2rWRd+hVdxLR7J09xu3DGCtoub+kVhKRU4hk0y6jLWZlAHfa+kqiQJV5CJU1DzE4aarZcAX9Bd2fXuyoBxDiISljRbSy0Z0Ue3dgAIuC4ve7WMWg0IeMZOR3XzfvvPzUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101366; c=relaxed/simple;
	bh=R5c2ajrJq29RSxfp2ZXnSyeuRfZk+0fZqIpgWxfLv7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PsNCyKoBkvcNEduVrsYPYn3FErn1thJCCW3bB/yM63TkEPel5zH0s334RYY3SqYD+Lo/rVmPcML9OrnQu2E7rIDl5gJT6UTHOFciMynwaHS/hjGVXliJVaghzK/9ju1gEA9UVz+JU3acJO+MPXTqawDbE3mWou9ofImRVCoyjgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QJrtFJYe; arc=fail smtp.client-ip=40.107.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QJrtFJYe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjcjPSYz+Rz0KAuwe6s3eghoxiosY8qFl0PdrT2aTLdzSswkHAl2K4TuL+uAhCtHS5DfJVP100oxZ2rjjdNj9Nd0LaqdLkgMSi3+z8pCr4IMOieZYrG5L4A3wPm4SY2ZVBKgpVYVitwgrtLK0C2rcjAesW6lBX7HOT060fuF3nZi5MLZbAj+RDkuCcbxuMu7OGnIfI2rnr1lr9Q5JoWdk9Vov36P29xoab7aTfoxGyImJNVbQ5PaRPh+RJZ4Zdrxv5iJPTk/3+eeygExnCdA3qAbAQWBuIb7wMsAYs6Uoo1XUCGhU8j7PuLGUtZE0RhGkmoZg3ikQmqACRhAnfJXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5c2ajrJq29RSxfp2ZXnSyeuRfZk+0fZqIpgWxfLv7Y=;
 b=dHvWoRcAfSNDu2qGPysmAkUsojOn2QUg7ptAJKULpfP9UCtLOxF5IXQ3t2Z8DPotX4P1qEQGaCoAhrGbB1BvuSfcpd3+D3WKtIucHe8H9Sj8PKVGl4Bhb0ymW4ye5+oup1nT7ShEYcpbeVvy+IWy8TLcXoZXknjAt/gkFD+1BBnJ1V/ktqCmNYVG+uTWaulSmufO9N1zng597Gg5P+zv3Fu2+knQUjZKlxXuVX4h1522QmDLcKRx3VBSJRYAbvJCFr6KdLbWI3144LP4QdZcrDwPmpwc11YpCwqYaqFZUziNIa6GufkjUAS/oQdXlz34TvwARA4dQdpdhKGGZtSe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5c2ajrJq29RSxfp2ZXnSyeuRfZk+0fZqIpgWxfLv7Y=;
 b=QJrtFJYeHdqss98SbxqiazhM97dbmV+msG+9MsC2mhLiX+EpyaZXYOt9oQVHAObvmCBYPUP62Tm3BJ+J8KYWVR9mEpPX2ip7Xi4oUYK+jmY3M/0rMpFaSeW0tjTbnmXGoDvWr48/tRhvXR6KwTZjsKBaZ9ytZ0UpkTZUCw5ykt+cnFhdgZglKS1jbwjOv2OywFME0Xy3s3y31bL5VwjBddgWn8hhe0fSMxn+gEa2qHFBnJOeUxapZHjNKw6iGFKQCYlgU/IouEmqJgF9lVoWC2FHxzM76cLIusNWrGjThXh4+6GIvuvQxWMlujbrkeRnbunJjYgXQMUaJTWoreFCIg==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8722.eurprd04.prod.outlook.com (2603:10a6:20b:429::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 15:16:00 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:16:00 +0000
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
Thread-Index: AQHbjOg69YhLe5tDw0KrTwzmNv+1a7NjEMIAgAACMPA=
Date: Tue, 4 Mar 2025 15:16:00 +0000
Message-ID:
 <AS8PR04MB86420E1D079341F806EC685087C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
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
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AS8PR04MB8722:EE_
x-ms-office365-filtering-correlation-id: 480b2bc3-9977-483e-975a-08dd5b2f78bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tm5uc1ZQaHBiK2t2bG5YemNvbzJqUVdiZUk4Tkl3Z3BTQ0RaSThhalBIanJM?=
 =?utf-8?B?SFV4SHN5Vnp6OUlHc0pab0dWb29pWGkzRWprVDJjTkNmbG5uYU9SdWFUM1py?=
 =?utf-8?B?ZmFaQlFycVd3NFJMeEhlbTJuZHNkK3h0VDkvc05ib1RzalpnaHVTSWhyT1JG?=
 =?utf-8?B?ekZtQkZ6WU9WN293c1VqREhKSWF6M29MVnJQeTJHUmVZV3JxWVJtN0Z4ZVRk?=
 =?utf-8?B?TlhkSXdDZzhzOUd2a0F2QkZyL2JhdmRla3JoSlB6SmFqSmVzYlplZ25ySUcz?=
 =?utf-8?B?a0JKb0M5REJlekNuU0RaRTdrRVhVUXpzb2g3aXcwV2tmc1gzd2pPcXJpLzFI?=
 =?utf-8?B?T1ZYRTZDWE0yMHd3YjJya2s3SG55R2FBMXFhQ3dVZUg0QmZkYjJrbnlKc1lV?=
 =?utf-8?B?cUs0djBoekJvaTB2RllnclRCSk5YaDdtNDRTRkR6TFF3ampzWmJnSUtHeUhM?=
 =?utf-8?B?cElwTmJ2cWZBREcvSDRWTjIrUlRDbjRKM2J4eFNQeVlhbGJzbVB5eGRSRlZv?=
 =?utf-8?B?U2xtdVlKS2VXdjBXUUFDSE5uNDVmaXp2UHJoa3ZzTVZ2bC9ZSUQySEQ5ZHdB?=
 =?utf-8?B?YWM3bXR2SmZwbDNQRlJmeStNZS9pcmV0S0phczZsb2ZDekZyS3pGdElYazhD?=
 =?utf-8?B?MUx6bEhzNUZWZ2VlVE5mSkV4eTA1bnpWclF0Z3hLT3RacUJPSTB4VDhzcmdt?=
 =?utf-8?B?ZEJidHJZR1ZxTjJwRUhCeWtBV0xYdXN6QUx5SlB3ZTBpZzMzVEZBUEVvaWYw?=
 =?utf-8?B?a3ZTbzJYUmVwaTB6RDltNzZ0eHlUSUZtbFJsMFFTaDRJQUZDVStSUlVQazJk?=
 =?utf-8?B?VjNWenhzSWk5QW84QkNiYm5NU3VLb3RiUkhiNEVCT1V1TWVWZlRyYlp1QnFK?=
 =?utf-8?B?c0xlSUZJOUY1UmlxZy9uODFSVWdyY21yYkdBZ2NjdllyVTB5T1BMSUlWaUpK?=
 =?utf-8?B?d29ja3V5TS9haktmR2kxanlCcFh4VHpDSVZzcWFxdWhVc0JVUFlGVTMzVWVn?=
 =?utf-8?B?NHZTT1ZUT3hLSE8vMWpYRTVueTBmbG5uYlRqN1B5akR1cEdvRlhMc2VZNFhk?=
 =?utf-8?B?VTFVSGtuTmlqL01wSXJYZFd5RVRZUDM1Qi94emVabGxVQXlJbGpNY1A3NGNK?=
 =?utf-8?B?b0piYXA0d2pCa1VWeGVORU0zajkveTdZZWhwWHVTRE5PV2VsQzVBZk1qS2ds?=
 =?utf-8?B?TU9WaExuUzBkaTJhQkF3cnhPaWdWZEZXQjYwNFZRTjRWNDRUb2thVy9xRGto?=
 =?utf-8?B?R1dhVG5TUWJLNHJJNWw4YTJQNUFZNzZ0NW1hSXlnVEtoR2RPNFBzNkplQ1Z5?=
 =?utf-8?B?bGlkVytqNFRHMkprVjFRWDdTdVU3YzIxWEVPS1B4dHhvdEs3VzBqTFZZSXBi?=
 =?utf-8?B?N25vRmFBcUNTbFZnYzZONnFDVzhENk9IZk9wTVNiQWlwdGtwSGJlZ1ZEOGhM?=
 =?utf-8?B?eTVjOVZUS25xMmJBTE9vOFd5VC9Hc2ZTWmxsNXRPZTh6ODBRdFBsQi9tUjd3?=
 =?utf-8?B?NlBkUFhBLytrYkxKTWFCd0wrcjE3NFdVb2FJQXkzL05YYzFzTXg3MVV1UVF4?=
 =?utf-8?B?cURvcDJSUVZ2bVlqb3VoV0NxalN0QnVlRUZtTFVxc005M1NhUWkzWkN4Sy9w?=
 =?utf-8?B?QjFhdldxSi9ZL2ZXRGhZZWRpTTJyVDVXZDl5Ni8zNmlEU21aaXlLRHlvNHBy?=
 =?utf-8?B?a1lPdndrNCtHbHVXVjNlOGZjOGVYOGVmQit6OWtHNmhHeGprVko1NVZkRFRs?=
 =?utf-8?B?Y2ZKc3pSK0x0dTZXdzZDRnlzdTlsMWhHVlVHV040MG1EUmdLK1Z5bXhpMU1H?=
 =?utf-8?B?THVFeWNUQXFnSElhbGxlenFUcWM1UzhzQXJIaXhoUDFwQU96UTRpeXFwVEsy?=
 =?utf-8?Q?vQMnZ4qS1/A60?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmVsODcwMmVkclhEQTIrZkgybnBhV1ZPeUpYUkxPQm92NVJmUkxxelYvNzd5?=
 =?utf-8?B?V3hKaitnTnpWS1A0RHBUU1BCMEl0blZvU2FHSmVhZHQ3dkM2VHNjYVVhOVNS?=
 =?utf-8?B?aHpyandybXNJd04yU3NsNG0xTkY0UVFwNXJSYjNLU2tFQkFGdTJXNUxwSGRW?=
 =?utf-8?B?cnNNTTYvU1JPTThsaVpvdVpFU05QWkRuUXZxdG55UWlNaEdHaFU3eXR4Y3hT?=
 =?utf-8?B?N05PQktWNjdyMWdydE9ZRS9WdHdxR1F1NndqREVlT3IxaGdCNk5EU1diS3pZ?=
 =?utf-8?B?NmZpb1h6ZkdvTWxwbCsxTVlPWDcxQWx5K0JQbTIyNEtoRXZnc2pjemNQSVV5?=
 =?utf-8?B?OE00L0VYTlJMWC9CWS9xZk1EZ3l6cHZsSEZXVjlESjN6MFFnYVZ4MGg4OVRs?=
 =?utf-8?B?OWE3d1M2dWkwRWVyZklNOGtSS0Q5dVprU2FPY1Z0Z29zMnVwT2xJaTFUdGg0?=
 =?utf-8?B?bmFxZC9DVnIwTE1FbEZJUzRrU04yd2JTZ3pWMVZUZE9zMC9vcHk0UWRablFO?=
 =?utf-8?B?dGN1N3NOaHpLaE5JdERWQXVvaHZ2Vkd3MVVCVG1Hb3FPQy9YVXdEbXAySUZJ?=
 =?utf-8?B?Ukw5cDlEMkVUd3Q0dVA0dDdvZDZwQVdQdjFVc2srOHhvY0ZZZndCU2h0LzBE?=
 =?utf-8?B?U2JxZlJwazV6TW95S1lRbHNrRVRwN28wOXZ3Y2J5cFhhK0VsREZ4YjQ5amVW?=
 =?utf-8?B?bk1pREQ5ellHZ05Gb2NHSlFZTVRzaGFGYldBRUlsamllNHJJV213ODc3cVZl?=
 =?utf-8?B?TGJ2T2FZbVlxb1huMTd2TXo2NFNhR3BVT0RLV3UzTmJjdC9mbitScDJ2THMv?=
 =?utf-8?B?WDlJbkhJRlVoRGR1aFdoYUJtU0pCaUd6bjJlVldhanlQeXZsT2UvWm4vYVBp?=
 =?utf-8?B?SUQxNnlFTWdmYXhYZjBucXlRYThqTnlybkd6M1IvemtIOEcvdGxJSG9oOXpG?=
 =?utf-8?B?QmowbzBiOVF5TGZ6dURldStYeDU2Q0RKVjVqMTgxVTJxUUZxYzN3V3cwMzJM?=
 =?utf-8?B?N204VDcxaElhU0VpV0JoN3hCa3lFMkd2bi9ueHIwTmdOa0pnVWVPcWg4VnAv?=
 =?utf-8?B?RHlsejhJdUZtVHljb0JYRlFORE1kMFVGY2JFMHIvUG5Hb056aFVaVGFwenJY?=
 =?utf-8?B?bDhrYlBaMC9BaTl1ZzNoYlRqbzh3UGRRMjdvMXVuSmsyUE5PUHFpekVZOHVW?=
 =?utf-8?B?TTNMMUJYT0lzdCtkUWxkeHJBbkpWb2xodjkvMjJCd1pvcFM1WUdoeWMxUTNq?=
 =?utf-8?B?NjlseXcyV3JNZWdnV3RFWjlhRVVHQUZWVW11MVNPYnF0ZEVIam5TUDE3RWYx?=
 =?utf-8?B?UW03cEYvdWNPakRlUyt4RWQwdS9BT2ViTUQvelpxdXA2ODhTazZncEw3REI4?=
 =?utf-8?B?QjN3YXdRUlFYcEtGSFMwUzRpS0RaQkx0QnZhMWU1R3Z3OXc3QTZabjF4YitP?=
 =?utf-8?B?MmJWeGpmRWVreUtHSkY2UktkRzNQNHFRWWo3Y01nSVFhRHowK2g2c2hPdnFn?=
 =?utf-8?B?R1F2blM4K2VCU3c2aUwyN2dxZ3lmdmVxcWhMZ0NjNXhlN09Hc1kyNTVDRkJ1?=
 =?utf-8?B?Ry9ueENXVHgzTFEwekFxQW9VUVBBWWczMnRVemhhRkpFZGE0UzlrOXZpaGJ6?=
 =?utf-8?B?d2NGaUtqQm56NlVhN2F1NTdCOTRwM2UreS9uNlhDUi90VUp2NlFkNW5DSmlT?=
 =?utf-8?B?UlB1aVpiRkJzV2Y0MjBhK2hOelhQbiswRTZtVzkyRmE3aTBHR3k5K3RxQUta?=
 =?utf-8?B?K25HUmx0ZVNJZlBKYXgvRlFYRXVhM01IMmFyWEc4dmRxbVNVNFR2NmxLZ3o2?=
 =?utf-8?B?aUdyQzFrRXNQcW1uWTFvUnlleG54c3pxYWFsdmZycFVER3VzUUxPbkQ4enJB?=
 =?utf-8?B?TmVHUkJZWkxINEFRWEFvb1B0S0V0ZSsrcC9vVWJ2eU5BQVJhTGJaQkhGdXJN?=
 =?utf-8?B?VGdHNmRDY01lWnVvV29rOUdMeGd5WlN6Q3lFeFpyZUhqeDZYUWJlbG1lVjVZ?=
 =?utf-8?B?bERYM25PMXduaUFlSkRIZkZ6YjBHZE1RSUR1cEkrcFRQMDJoTTJEYm1Tc2FS?=
 =?utf-8?B?N2huL3pUdE5qL1AvbEtQUUNvWWNKS3E3UUJkRkVGVnV3Z1IzMC9sYTVjMlh6?=
 =?utf-8?Q?RsaE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 480b2bc3-9977-483e-975a-08dd5b2f78bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 15:16:00.3556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kqwb2df1/l5aINTXWeVcOmB6LPJ7Wfo9PNwx6S2Pabw0ovnS5CgIiEJzaFrwHXP9cpEAmeSdLJJy2szj07lag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8722

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNF0gYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBBZGQg
YmFzaWMgZHRzaSBmb3IgaW14OTQzDQo+IA0KPiBPbiAwNC8wMy8yMDI1IDEwOjMxLCBKYWNreSBC
YWkgd3JvdGU6DQo+ID4gQWRkIHRoZSBtaW5pbWFsIGR0c2kgc3VwcG9ydCBmb3IgaS5NWDk0My4g
aS5NWDk0MyBpcyB0aGUgZmlyc3QgU29DIG9mDQo+ID4gaS5NWDk0IEZhbWlseSwgY3JlYXRlIGEg
Y29tbW9uIGR0c2kgZm9yIHRoZSB3aG9sZSBpLk1YOTQgZmFtaWx5LCBhbmQNCj4gPiB0aGUgc3Bl
Y2lmaWMgZHRzaSBwYXJ0IGZvciBpLk1YOTQzLg0KPiA+DQo+ID4gVGhlIGNsb2NrLCBwb3dlciBk
b21haW4gYW5kIHBlcmYgaW5kZXggbmVlZCB0byBiZSB1c2VkIGJ5IHRoZSBkZXZpY2UNCj4gPiBu
b2RlcyBmb3IgcmVzb3VyY2UgcmVmZXJlbmNlLCBhZGQgdGhlbSBhbG9uZyB3aXRoIHRoZSBkdHNp
IHN1cHBvcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkgPHBpbmcuYmFpQG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gIC0gdjIgY2hhbmdlczoNCj4gPiAgIC0gcmVtb3ZlIHRoZSB1
bm5lY2Vzc2FyeSBtYWNybyBkZWZpbmUgaW4gY2xvY2sgaGVhZGVyIGFzIHN1Z2dlc3RlZCBieQ0K
PiBLcnp5c3p0b2YNCj4gPiAgIC0gc3BsaXQgdGhlIGR0c2kgaW50byBpbXg5NC5kdHNpIGFuZCBp
bXg5NDMuZHRzaQ0KPiA+ICAgLSB1c2UgbG93IGNhc2UgaW4gdGhlIHBpbmZ1bmMgaGVhZGVyIGFz
IEZyYW5rIHN1Z2dlc3RlZA0KPiA+ICAgLSByZW9yZGVyIHRoZSBkZXZpY2Ugbm9kZXMgYW5kIHBy
b3BlcnRpZXMNCj4gPiAgIC0gcmVzb2x2ZSBLcnp5c3p0b2YncyBvdGhlciBjb21tZW50cw0KPiAN
Cj4gV2hpY2ggb25lcz8gQmUgc3BlY2lmaWMuDQo+IA0KPiBCYXNlZCBvbiBsYXN0IGlzc3VlLCBJ
IGRvbid0IHRoaW5rIHlvdSBpbXBsZW1lbnRlZCBjb21tZW50cy4NCj4gDQo+IA0KPiA+ICsNCj4g
PiArCQkJYTU1X2lycXN0ZWVyOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0NDZhMDAwMCB7DQo+ID4g
KwkJCQljb21wYXRpYmxlID0gImZzbCxpbXgtaXJxc3RlZXIiOw0KPiA+ICsJCQkJcmVnID0gPDB4
NDQ2YTAwMDAgMHgxMDAwPjsNCj4gPiArCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQo+ID4g
KwkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAyMjQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjUg
SVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjYgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjcgSVJRX1RZUEVfTEVW
RUxfSElHSD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjggSVJRX1RZUEVfTEVWRUxfSElH
SD4sDQo+ID4gKwkJCQkJICAgICA8R0lDX1NQSSAyMjkgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+
ID4gKwkJCQljbG9ja3MgPSA8JnNjbWlfY2xrIElNWDk0X0NMS19CVVNBT04+Ow0KPiA+ICsJCQkJ
Y2xvY2stbmFtZXMgPSAiaXBnIjsNCj4gPiArCQkJCWZzbCxjaGFubmVsID0gPDA+Ow0KPiA+ICsJ
CQkJZnNsLG51bS1pcnFzID0gPDk2MD47DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiArDQo+
ID4gKwkJYWlwczQ6IGJ1c0A0OTAwMDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGFp
cHMtYnVzIiwgInNpbXBsZS1idXMiOw0KPiA+ICsJCQlyZWcgPSA8MHgwIDB4NDkwMDAwMDAgMHgw
IDB4ODAwMDAwPjsNCj4gPiArCQkJcmFuZ2VzID0gPDB4NDkwMDAwMDAgMHgwIDB4NDkwMDAwMDAg
MHg4MDAwMDA+Ow0KPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArCQkJI3NpemUt
Y2VsbHMgPSA8MT47DQo+ID4gKw0KPiA+ICsJCQl3ZG9nMzogd2F0Y2hkb2dANDkyMjAwMDAgew0K
PiA+ICsJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OTMtd2R0IjsNCj4gDQo+IGlteDkzIG9yIGlt
eDk1LCBsaWtlIGluIG90aGVyIHBsYWNlcz8gQW5kIHRoZSBjb21taXQgbXNnIHNheXMgaW14OTQz
Lg0KPiANCj4gSSBhbHJlYWR5IGFza2VkIGZvciB0aGF0Lg0KDQpZZXMsIEkga25vdy4gSSBhc2tl
ZCBmb3IgeW91ciBzdWdnZXN0aW9uIGluIHYxIG1haWwgdGhyZWFkLg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8zYzlmZTg1YS01Zjg2LTRkZjYtOTJmYi1lNGNlYjAz
M2YxNjFAa2VybmVsLm9yZy9ULyNtMGExODBjNTdlNWQ3OWUzNjhiNWVhZTkyNGFmYmFiODcwNmY5
NTU0Ng0KDQpCUg0KSmFja3kgQmFpDQoNCj4gDQo+ID4gKwkJCQlyZWcgPSA8MHg0OTIyMDAwMCAw
eDEwMDAwPjsNCj4gPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA5MCBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsNCj4gPiArCQkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgSU1YOTRfQ0xLX0JVU1dBS0VV
UD47DQo+ID4gKwkJCQl0aW1lb3V0LXNlYyA9IDw0MD47DQo+ID4gKwkJCQlmc2wsZXh0LXJlc2V0
LW91dHB1dDsNCj4gPiArCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwkJCX07DQo+ID4g
KwkJfTsNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
