Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98B3AE6FA
	for <imx@lists.linux.dev>; Fri, 29 May 2026 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038314; cv=fail; b=tAdXFRzOdkX0fLnEEdPs2Keh+FG/wHK/a624vEts6OycqxMauiEInyL0LWjGKuZvZpU6ajYPAtDTy8bh0Rk/ugq4UJFWWEQasyeW092KTeZmczgM4UKKNLQzylTHNG3BYQRUoRJKJq/aa6+EP09IRLUuwswWXppKE4hhcrwvHfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038314; c=relaxed/simple;
	bh=Youk2id6NSHlsqtwqym8SANjcbdnGmUBJD4ElJJtDxM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=N01AOo2QUDE3nBzwnjqF2jj3nLLGv30s5ua+BPCv1N4xTgyGdPLm153l2qgv0wNMLs3vdKsZbIKrdV6of+pLrmm1CCG7GaeX9lLR4jcCkjdLJjz4rAiJ0FD2mBIYZMbnoJv7TCBi5cmBBIL/jnSXm5u1X5SEBZ8GMEObXi/LkRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=auZ5QmVj; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="auZ5QmVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuJgD3cFGhkSWWxHhxmsuCUW852pIEV3i2Utu0fGzOHiGeVkbdZer6CXzEEfxc1WIm88flAwXrqmEK26VAJfjto6tw+QH34aehMGRpuu0WXsQilPRrlVjfaa8LIwb2B8guQAn7aDsmPl9n6/g2FOO4/cbSf/M8ozuKe6Qj2hfu8q7VeXdNNwf6dl4jxvhz/NhdM3WH0njbWvp9RLOF2ooefQwGSfSz2M4ehq1j6vc0QaNjCodpLygEshX9dPpUeYnHDsBC6RBc1VvZjlg1sZKRiC50b4snx9iH3/9O7hY8NooQ/5O44bVq4ZT41e5aBOdbYldr0sqrmUoTWvYqHHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXVxA87OMHv4oCEwE0N2B8pkgSnIOKaB1Z1G8eB8jv0=;
 b=ZxgPHe/yNV0rSN/mV+KgyrQ/68w7eCIrku2FcEJMI8nPu59FD9mf1UBass7v/dk7cvEsB7eaGaWWTDo5YgqzpQ0PgP+GxZ4IOWLtHoDZrAaPLzpo/czaLGSllB3xCULLzOTJNQfIoFO/fhK7SyHigU31Jz8ROBl1zpcg1tmJq5FiwcpxlOtPWg2vTeGXQgYMbdJzLt1ikXVH9wCn5xBw6iFgkh8OwAGVWqH6wEfr+eGUrKhW2ZyvE9XrpH2NKBS/xns75tT6PJQVFpzoIs5l0mec1vKgy/W84oN8vffXI0ZqJgXN0fplU0ID7dePq6E7ZvC7yy8nHi06hjNQWw0qNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXVxA87OMHv4oCEwE0N2B8pkgSnIOKaB1Z1G8eB8jv0=;
 b=auZ5QmVj53JPv0nOlJ6gvqrbJl57uqTiHtfLhbdC3dajNcALsHapr6bzgCcfQiE/sawXaa0qrk4CyQyuoPcrVKsfKyQOl2GEfSBpLg1SgUBNUmV2sjdnBNbBmnZ/ToJIwOb4rit2/Q8Ij6MeSTPU0gnWTs/TQzbgoTLHjW0v2MLb4fGEs+nLoryVGYbZfRdM+/DXpSsk0jnEIdSegcE7H/pgSgJDgcou9LgrYWE1d5Gv6q+EYg3xc4jRRoVHDlPUBVqsP7QVNf/39hmSV6f1c/VIr6vgKkHZ0jqYBGjTMG0wW/45cyn+66FGnqJeHHyOLRhtHrDXs3LEkn9g/EhvXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:05:04 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:05:04 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v3 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Fri, 29 May 2026 09:05:01 +0200
Message-Id: <20260529070502.1749632-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0122.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: c059914e-a585-4cf8-9cc8-08debd509c00
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 ihwA4RZ5niDWtwo0RB5WhfZ2kjA8pgMKS/B21toZ4zCNNM82QegnzFn7m2qlAJ6CiZN+HTDIgckfkOWs8zuIcUVnX41/OXHJDTMxrbyMxaLkbrYxjN1QwScTpL7eLWBg6qI1qZ1YOERpgSbKXGP8gjGx8AjZuqcy2Uz9H1bWnvUmJ4EviitNqXn7t3F0+rXK1S4JY04Kgf9IIH5kVQTC5zkXc5qfs6LjVV1u1GGxaxJaGBDW5t9dO+RiO0DwFJ5yNBM8kovb8Yml1winqv3HsKYARNfDY4VUGgQpeNq2hMKIZH3OzhIiyoLfVbTVr2SUZKsb9WCPBKt558fbg7+/T7ZYa/t8H0CmiBOkROhLL9uBQsZVBZavfs9F7hjZuu/UpL+TwXssaBSs9ucLVvGUoubUBixC8PSAbatzf4m8Z8gXeX92fIAvS3oPV8jFr9JQFRqvuK83gY/Dz563zyZ+gHEbdi4QARn8XawcmZwfsyF9NM7uw7vWneIqRupLy7qFk36q2AgxV5KKMmqGlGtcEqNnwPLkz22TQ9UXqlvENhryrUEKhAdZGSUkjtbeyCqrRCmvZlhfpjmkH4kSuj8yuXCFsWuWBLWi/PMMxv0GF5BG/UWQcOe+KcZPx4LuHjdxG5Yh6wQjYlkXRi7dvCnyXptq5cJ9WI92W13bUCje+Rz19tZvsce4liEjXYd1qPeA/BYA3sW+64WZ94CEihUWzA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDVJYW9RQTE1QTFsK0o0elJGalRHZTQyZEZOT1dxMzM3M0lzY1B2Uk1QWGlK?=
 =?utf-8?B?bnBReUFOdDdKYnk2NjBLM1cybnV6TjR5NWRxNW9uQ3d4WlJYc0E0RndxeFJZ?=
 =?utf-8?B?cFNrZzNTQVU1eU4xZVh5ZHpmUCsxTG9kb0JSaWpOeS9BSk1CN05nMU5kOXFN?=
 =?utf-8?B?c0E1clRBeEh2NHoxRTZCQWd0N0lYVVVRMWNIMVBLMFdOcHlnSW5GZm50KzNk?=
 =?utf-8?B?dEVSMnRDZm55UlpPcVVMMVN3dndiYk1oZ21uODBmMkdqbE1XTjNUd09yMzZV?=
 =?utf-8?B?ZDBnZ05WNjhZa1dLcXgwK0MxVlVyUTl0anBQdHdORjFDcDRqcitvaFJsa1NV?=
 =?utf-8?B?b0duRCtWWjJNVWV3V0J6ZitLcHBMaERMeVJ2K3I4T2wzZ3FDNkViM3JqK3BE?=
 =?utf-8?B?aWtUaFduVUxrVXlobVZyY3V4a1BmTWVZZ2JEUkFaNHJxYWRoRU45eUJENkVy?=
 =?utf-8?B?Ri9mMmZSMUd1QjBEaTkrK2FaWlM4ZUZZd0lyVkp0YjZXTVlpWW1GM1BxT2tP?=
 =?utf-8?B?Y1VoN2tQOXg3dGFmNmNoSXhOUXFsWnVTTnFEa3VYaVZLQy9NNGdyZWN6cC84?=
 =?utf-8?B?dmx4b0tlY3hZOERpSjM2Y3JEN1k3R3hEZCtPT0ExbUkyR0tIQ052Z0VKbkFT?=
 =?utf-8?B?NWh4YUxDZFhjN21uYk1IRHFHUGVtcVpKRnJVa2FkYTE4eHhKeDVJbXZieCt2?=
 =?utf-8?B?Q0VXUUNycGtneG5DQnBuTENwTjV0TWYrYUJ3RmZLQWN0VDI2WUtOVGg1RWlD?=
 =?utf-8?B?MGRWTDRpOXRzTUxnd1ArdUk3bENwcHVkdFVlcHd2Nno3UmY1alFHR2xoTUNV?=
 =?utf-8?B?Smt6V092MTRZc3h0SEdXNmhHY3dOcnFoZ0h5OHVnWVFITnVzSTVMRUN0b00v?=
 =?utf-8?B?eHdIWThMMDR2a0tNYlozTXFhcDd3M25CRms4QU5RVktUcGg1cFZFTDJkL1Bs?=
 =?utf-8?B?QU1MajVnTURVSDl0ejBYci9RYnJsdDRuaml4K2U1ZXdaNlIzVHNTZHJSRlE4?=
 =?utf-8?B?RmtFUm1aQURXY3RFOFpWNzgvVDJ1aUJxNUxGd3NoY1dBd3A4d0dqcWVGcDl0?=
 =?utf-8?B?cVNKL2oycUEvQ3ZYNjhWQzFPSjBmZURLS0ROZnVkOUk1SlZsc1hzb0tLRThB?=
 =?utf-8?B?MWhxY3pDN3ZhY3UvS01IM3dKdWJGMmlkR3JIYk13UEliQUNLeXZkOTZhSkhu?=
 =?utf-8?B?VTV5ZUNkUG1zT3dxaVZaUkpEWHRBS0xoTVNRdUVsVnlUZzFRZUk3RFBjT0U3?=
 =?utf-8?B?V2hjNVJBUkhRcFAxNHJVNGROTXlXZEZQOEp0SjVrRFhMM29GbWgvYTBrTWdH?=
 =?utf-8?B?WllKL2Y5V0ZzWWo2aGN2MFNQLytrOUxpd0lnRTg5SXVEdVNUUFBwOEhsUWdH?=
 =?utf-8?B?bnhNaDhmZXJpOWUreVVPcWptOHRabTAvOTBZUUIvaG1ycjJlcXhFWklBUVFw?=
 =?utf-8?B?YTMwNXhRd3JYbG1wSlY0VWlLazV2ZW5aRFMyTnQ0VGp2M2MzZkFlL2NXSmx6?=
 =?utf-8?B?N2NwWHYrMEw5L1NJcDBtZ25vSWlUV3liUk81OWg1eGVMVGo1NlFETEZUTHVO?=
 =?utf-8?B?YS9kYnUrMGVOQVlPdDlxTkF6N1lySVV3TTZXOXA0N29PQU94ZmNKZHIybm5q?=
 =?utf-8?B?MFlGVndMUWozaWZZeXhZYW9ucXMwcndmM3FVZW4rd2g0VytHY2VaMVJobDc3?=
 =?utf-8?B?SnZzd0xHT3gyTTdhanFESUNIbitKbVpINTVPT0hmMTZmVXo0MUVDSC9WejN0?=
 =?utf-8?B?c0JZQy9DUmdacjlmanUzbWZKM0FDTzZZb2RSTEJidGJpdzhaRXJSNmo5QktM?=
 =?utf-8?B?SEoreFJvUG1zVXAzTndwSkZCSzZocGJGMjJVeFZrRWRwM25LS3pBVEVxeTN2?=
 =?utf-8?B?WDZEVG96aHVJenFhd0dwRTdmdVdnZktkKzhHcThqejRiRGVvUmE0cnUxZmtO?=
 =?utf-8?B?TEZzQVRPZHJwMTEyVWM5RDc0SkpBN2VMcTlJbGlsSVBWQ1l3T1VIZ1N5WEQz?=
 =?utf-8?B?d1BBdVJSQ3RWS1dZdXZyWis0dlRQazJHWEZuSVhpSTZLQ0xaNGNTVVJTamo4?=
 =?utf-8?B?RDNTWGZrUXZhdlZVekdPbG0xelVvTEhPamxmd3hpdVMvWmh0TGswN3ZHUERB?=
 =?utf-8?B?SmFwU2FuV3BwRkhaL0ZML3ZPVlpiTHRoK0JmWmFTb2MyeVRyNTFiTmZ6UWFq?=
 =?utf-8?B?bkdoM3VOZ0JqeWJoTk9vREIxMnVuMm9vNzJoVHlFTzBCQ2M1T0tObmppVVR6?=
 =?utf-8?B?bUJLSklKN3RmS2VrTmZ3MEhLNmExYytsRU45QUdSVlA3a2VPRjJvN2JVSWN1?=
 =?utf-8?B?bTJMcHEwRWlyYlBFMWFDaE9OWkVYMFFmMllaQ2h6aWFUekVsRXBNNjI5YVJw?=
 =?utf-8?Q?TzOqN4mZdLaoSB2sJrQQNYOWvJmLZORrdmU0L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059914e-a585-4cf8-9cc8-08debd509c00
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:05:04.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3PwVIaNXr8+vYOtmU40hleqahvU7iSNAaI/qPtmIoFthshwttO1JKccQX2B/x0Z+okKX7Wq9t3Ds4xN78oaTZS+cJRmjO7HcTjkwRnQHhbwrceVs5bBrF21b2xl9MZn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v3 -> v2:
- remove vendor internal issue tracker

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

