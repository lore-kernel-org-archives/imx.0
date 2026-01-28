Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023131.outbound.protection.outlook.com [52.101.83.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE030F7FA
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.131
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617313; cv=fail; b=cW5+yDRBWZcblEioCnhQrLb0BMA9ArLCoAVik3fJ/AnY6+Tyk7I4cdJQUicmIZa7mE2E1HhQ6QSzORztcbXZ001TalIi9NsMwMTj3+PjuepsiNBHbl1uqxAMjDcSDJYNbT8sRyye6Q4R2Am5spi4aChAVJjQQfGKgLnHIxNDsUk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617313; c=relaxed/simple;
	bh=qTVS5KIiYTUkNxVAH3pEcC0xA3V0igSflRrA+VsHJ8M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j34r9XKLadwIwpG8QjW1X/E+EDRWyaKQTFLQz1YrLG3ME8tXBg5F6R2DHpY5W61dWg7A4rsbUTQaRkDKaVkAeTbMjgZeAq9F2br9EfQatqbli1+XS7tlO2KwvmI5mf9kaH/rRTIYmHkODDmGMTwvxvGO4XQbvFg7MGJXiRUeWQA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f5wjHr2d; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f5wjHr2d; arc=fail smtp.client-ip=52.101.83.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f5wjHr2d";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f5wjHr2d"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BwDaVaK57WZ6WOEEh2f9gcM3LChgLdiyg8Guo8Cg0GxMMt5i2yGZzfgDwvPF9WN7/3frEvXhjFNcftmFFcAhe3g36xT/8s4ktGQFQLnkWcI2slJkcTOjO/EoBWDYOvCDPHElV1VzzrMOcOM42ysKoy660dcZyrT9I8C5HVb5hD7rO1/jppcQ/h4Sd4VcQwAYSSQiXTcEkyiGJjzCLqM2nPjCaxPhUUXGiwe8qEn6ZIGwf1Hjqe6GyiPlBp1ZLQwIXkghQ9ZapJhwfoKttmJ4xfmb1VNNqFUDBjA7jDSgUK1yT8MVQtPBIqaO40pKJkPhi0AgVy8C9FyDHz8gut/RyQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjA1oKnAdhvgspIS96k8DH5kSg8wAAIWi9bn89Nk71w=;
 b=RdZyaiNHiiTHogPQoFR5NV5AdU/+s9B7PADGRNdtPR3fpUp7mctHOoHhgoE7SJ91xOu+koDpsRmhGNX3BpU6srDR68+nHJhGGPJ0+Bt6u5tTH+nG/dxw7wTj6Z3ltJq/z4j34mOo7/xLFoMSbBjeak9BkrH60XTbyl7Qba0ehf6UaBXr1MMk0Ej2RkTs0IMsI0eAiESc4JMjpT00JCg8YycY1iJMhGCd3SR3L/xPSDMJocAGvGHfVqXQoHEaofCAwwfTPWW/a/u0jxKqnjAwprvh81t8aqhMlP/tu37IMcxOThC/xdOhd7sdMOlnLDs1Dho4HsBR0PKilrKPzUb7Xw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjA1oKnAdhvgspIS96k8DH5kSg8wAAIWi9bn89Nk71w=;
 b=f5wjHr2dwi5L345YyjQhB3aq1N/HCOIEvvz0CAOfZ6BKzfymXANNkQ9P+NYtpvXg7bmqm3y4LMMC4+lhGMbbrAbFZqo+CDCd5fzzKtpe/qMD63c/VAPoKETxoSHOI9HJImOghrf7ddXLy/8IByVK1thW0CSPQcfrN4o64kLLmi8=
Received: from AS4P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::18)
 by AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 16:21:47 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::56) by AS4P189CA0032.outlook.office365.com
 (2603:10a6:20b:5dd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 16:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:21:47 +0000
Received: from emails-2547891-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-155.eu-west-1.compute.internal [10.20.5.155])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D95F4806BC;
	Wed, 28 Jan 2026 16:21:46 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617306; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=jjA1oKnAdhvgspIS96k8DH5kSg8wAAIWi9bn89Nk71w=;
 b=USWhskap+6qwt4nWCThTn1cNzvXZ3tXK2iTch2HV1j7QIKCAQEu9YAzuE2cYtMrH6+vB6
 FWg53Bx2U29yXz/dtGVShjezQmJaMoXPj9LpJgRTb7kVtZzUuo6y+g1t2QB6PO0ZMyIdAxT
 y1kCiqfYEvuYqmaMcte5a4FJNKyXPJY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617306;
 b=fpLG/gHbdjWGwi82gDRuPAkckQ471FYzoeo45zcF8yGF3pm+fam4m7IeSQ7BMBKueVg6l
 mdYe8C1fZVN2KdiZ8ZoIVzRdiVeU7g9gOJdaqTuVpWvi7qu1EZ557xyAGnkn+kxV4OygPMT
 XtRUhZ91i93eO50y2e8sovrVV90+QBk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB7rlwIYWaLelXFQu0Bk+XY+uZ+V/8LJ0DZ3Uv6APpG9m7TA+AQgfV7EVoxl3ciLYmNIcLq6Igi8hgXwBJJ8LnQaGPgb4QOV/4cDseNaotF7pdETbpP2ZhI/kzcd8+fYTMyFOGPnUJwT7xJXHg+4IcuP5Zt1U1xHXWFLoHlANY21gj3rUqOU+Juarv2ks9dyeWu1SBK/sILvCtVf5x2xKm1wvz0R7d8y6NI/dVpNLkG8kNEnw+vRHSzXY3AiRofOkRmJpSQtkmJHBQKMuphzv20l1ZLHmZUekUpoFka5qGTSCgnHwtWaGx5zwORytx9t03xsA2RilHbNm55B8V6nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjA1oKnAdhvgspIS96k8DH5kSg8wAAIWi9bn89Nk71w=;
 b=lCgBdbZrweqa07Pqlx1+Mvhxx6LxXdBtxMQJK/8EZGrSI/xTED97sJj0dRkZ5J58lzEY/uBRZOhC4iyo5P5ubiaCigL17igZzz1s+Nu5REg367n2CUtumYrgCRk5X2d2L6g8ZwNCkKfwbDsY1rwonLqo6gq4l9bpRclc0JW52OojEaSLQ3lLJGLwmL6V0s0R8MFLSLdxJB1TBolyOQTMJnWGl/se/aogQWNLaRfeHNQeR+UXfED0DGTdhQ96FFkcFjMUceYFOYn09bjB7VqeSw6uRWyIuJSVjhPeC0iJQcDOR8ed1HO4wPx4TR88vfHXQy/oDBsnidXAkA1oQS47SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjA1oKnAdhvgspIS96k8DH5kSg8wAAIWi9bn89Nk71w=;
 b=f5wjHr2dwi5L345YyjQhB3aq1N/HCOIEvvz0CAOfZ6BKzfymXANNkQ9P+NYtpvXg7bmqm3y4LMMC4+lhGMbbrAbFZqo+CDCd5fzzKtpe/qMD63c/VAPoKETxoSHOI9HJImOghrf7ddXLy/8IByVK1thW0CSPQcfrN4o64kLLmi8=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:21:38 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:30 +0200
Subject: [PATCH v8 6/8] arm64: dts: imx8mp-hummingboard-iiot: add dt
 overlays for muxable ports
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-6-9646a3025cf4@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB7522:EE_|AM2PEPF0001C710:EE_|AMBPR04MB12334:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8d2239-d18e-4a83-81cb-08de5e895590
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YTVNTXF3L1JVcm1Xdkt2MjFpdFlsejFpYlZtcGpnMHdjeWJldnh1ZHFWeERE?=
 =?utf-8?B?cGhNMG9zNDF0NTY1TXRlOE5ick1XUFg3VW15N3ZZYWlnVEI2bDV3VWxxNVg4?=
 =?utf-8?B?L2kyQ25sekhzMEJKSGtkczVkcnZCbmRmN0ZxY1QxNzNQVVF1dDM2U3VGMDhy?=
 =?utf-8?B?SHc3Y21YVk9KYlQvMjNKZWtOSThobDlaZjBhZnNGMEgyU2k2OUxhS3NuMzVU?=
 =?utf-8?B?R2Y0QnV5akpRbUtGZFhOYm5USXFJdTROZDlocGhOaHlYWHVBaGNITWc2aUlC?=
 =?utf-8?B?WEZCWk9oSWhOYTlFYjA5dHEyMFA4MlY0MXM4enI0NU8vd1VQT2JNR05SUC9S?=
 =?utf-8?B?d1F2bm1QZXY3K1BvNkJLcFFXcWwyR3lGZzQ1YmVwaityUXdjWkFpdENUZlRw?=
 =?utf-8?B?NTM3cFVJZkFvU3kwcm9ucHVnRHFReTFuKzRlMDAzRzlTMnp6ZE42eisyb0cx?=
 =?utf-8?B?OGY3RjYyUGpkalUxcllQSHBJTzdIL1hEdlVFZXFBZ3h0Z3ptSDNnK0lKL1F5?=
 =?utf-8?B?emwyMzJZdVZHN01mR3U5Q0h2WXZGZS9jTVVYZTVjRDBYWURwNFZpOVBsT1o2?=
 =?utf-8?B?dUxHMDdYSmQ2QmNtVTZkWmhuNUdBZjhPUG1ZRlpmNjBVNkx2V0RXdTlQbzRD?=
 =?utf-8?B?UkVlVDB4TVdWVTFYMUF5enp6d0lJbzZOUnV2YWcwSU5iRXFncFIrOHlFUWoy?=
 =?utf-8?B?MldSanBRZHNWL3BiUkE5dE5ISXo2amxVTHFaYlE1V2ZxemhUV1NQclZGYTdM?=
 =?utf-8?B?S3FVbWRLUzRjbzRBc3BqSm1nQWE1dkI4OXg0cktQM3kzUXJIc0k0T3dNWnEv?=
 =?utf-8?B?Nllja2tYVU1KNVlTK3UvWE5ZMWd1K1lCTzhNQVgwRjdhR0NMdnRma25aNFRU?=
 =?utf-8?B?aFV2WXRlK2FYV1dieWczb1F0ejZUZnlIV1dDNnRHZi9rUGpaamxLclZPNFFQ?=
 =?utf-8?B?R3h3V2I1YU9KRHgzMDRjaDFlYXZQQnZIZjZTT2FVWFN3aVdIVTdhK3hKb3F6?=
 =?utf-8?B?SW5IS3E1N3NTdlhQMS9QVTgyNlpSeXBXTUVVMCt3RjM1ZlZ4aWJGb3F1enNM?=
 =?utf-8?B?b09CZC82TUVZNDhKZFRxWENCYzdMcjFCV0I1RFpuTHhxVDgxcGptSGY5dW5D?=
 =?utf-8?B?d2ZKSDJzSGQ5Qzh1Z0JaSDBiNStLOTJveGNlZ3R2dTIyQ2dxcWRQMzdEWlRa?=
 =?utf-8?B?clFWR0lETFdiSWRidzkwVzJqUitRZlEvTnovRm9hMEI0ejNuYVZqR2V5UjAv?=
 =?utf-8?B?ZzJiTFY2a1lhM1Y4NGJIKzQzeThEdUllL0xuOWUvL2lRYm5LYlpqSHQyWFhK?=
 =?utf-8?B?ang3cU10ektVZ2FHK2t3U2pPUVROUUZBOEhIS2dHaXhQUWIvSWdvSGtMa05i?=
 =?utf-8?B?aWNTQlhqL1pJamgrN2k3M1ExRWt5U1B4NTg3SFY0ZjExYUpxMGovQ3JKR0ZW?=
 =?utf-8?B?Q21FMlRTUCttRnZZcUhWTUhLbEI2cHRldU9sZG4wN3A0bm9TQXJoUXdQTHl6?=
 =?utf-8?B?SWlYZXBBbzVjVHpZSTNEZ1YweTNnOGhMSU5MbDB4OWtmZ1VRTmRQajViQzcr?=
 =?utf-8?B?b3lvQkhBenRERGUwbnA5aTU1c2tFQ3dkUGJ4RjRDSm5HWU8wSEVGYWZqRG92?=
 =?utf-8?B?eGhmVTlLaFhVUlBYeXRxR2NBdFp5M2lDREhVUHQvM2FNQUpYalJSdlI3UVFC?=
 =?utf-8?B?bjFjRFBXZnZTck10WEVDNE9JZ0RZcmhqc25CdU1UcUtJRVpaak9NZ0xjNmln?=
 =?utf-8?B?bHpuQURKdC93OEhESVFNQUEwU01vcXpLZjd6dytlSWJCZFJZNTFqemVFMEkz?=
 =?utf-8?B?U3hOVThFWmx5YlQwa1FVQ3NaRXpubHp0a05FdEFrNC9EaFZJak1kYnltZjZV?=
 =?utf-8?B?cFRTK0pmVVFMQktXN2FpM0JDTnE5VUxSYkJPV201MWFkSzBVcktSY2JOZEFD?=
 =?utf-8?B?cEZVVEVRaHJZT0JTRXpnbDhHaDFlZVV4T3FFSE8wbG9oWVRGQjRBc1NOUHk2?=
 =?utf-8?B?bnJmZWFneHpPcUNjOGlpYmZrcWQ1cG40dVVtdk1oaWdNV3VzcUw1L1pUYWlq?=
 =?utf-8?B?WEQvS0NKbkZvYTA4NlBJR01tOFVWRGtsRFhyTDRjczQrcmozZmhDOWN1RnR0?=
 =?utf-8?B?a1FaSEk2S3F1RTFJZGtncHlPeWNROThyU3czTFBybldqdUE0clVzT0tHZFgx?=
 =?utf-8?Q?wtHOS5kgxeAn2Vyv77BacuY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c9529c071c3c4bbfb16c91bc7633c3b3:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3e15208-0397-4110-da9a-08de5e89506e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2JwcVA1aldHODNkdlhkSldZQ1d3azRKTUF6OCtmMW8rdFI2dzQvbkg1cWFa?=
 =?utf-8?B?ZHZIZnR6cFJLbVZlcnVQVW9iVkhMdjExa1J1SkFGNUJtT29sN3BvdnM3YnZi?=
 =?utf-8?B?cHdyOGRkVnFyYk55SWE1N1VWT1NTNzJCT1lsMlQvU2p6S3JDcGNISWFIdUo0?=
 =?utf-8?B?MGpDNGsrMDJ3d3VmZm12OFlUMVVrMUNISVZzdkpNSXFFditmMTBCWkJaL3Iw?=
 =?utf-8?B?VkhLVUZLb0FHODRtN2FYRjk2V0xTbHZ6RWxHT2ZGcldTb1lIMjVid2dtQnNs?=
 =?utf-8?B?eHlhdnlkM0hkTllPM2hlSzB1aVdFS21EZXMrb2RoeW1hMFp2MlhCSDBYWWZi?=
 =?utf-8?B?ZXhzbjBkalFBbFRRQTZHSzNLLzhYNGxlU2ljcmlKaHRpMzF5UmtscG1iWER1?=
 =?utf-8?B?S3hpL2htOE5yMVNJTXcxbkx4enk4cUx6Wk5nVEdJUzd6cXdLek1nNTdXSm9t?=
 =?utf-8?B?NHNRTk9mYi9kNE1vOEdqaEppS081SHNEcVpHZUhQdmJhU0V2NUhmWmNTK1pu?=
 =?utf-8?B?RnZaY3NBS2pqZzZaak1RdHBuUWl1VXZFUVVMRE9DM0hySHJqWi9MT3FMWUJl?=
 =?utf-8?B?b0ZPZzc5UE9hYkorTmxlMW1Ua0hER2FMTFFQOGI3blhCemMxTFFLV3pmbXdJ?=
 =?utf-8?B?bWpxNlhUU3ozSHEyZThlc3I2b2ZjYmZNbm1EOUIrdzFZL0tXcSs4N3lTRVJV?=
 =?utf-8?B?Q0QzTTVLUHBvRVc5Wm84azRVOGpjSjZaOHd5Q0U3SkV1N1M2UDNVSGJsQnpF?=
 =?utf-8?B?ZXF0aGZtN2FZYmlOYk5PUncwTjVpeGdQejBESFdTK3lPWkRrTUpua096NFFU?=
 =?utf-8?B?ejFEOG1sbGhGU0lnSVQvZEthOFR3cktXU2NHRlFabkdaTXNBK0ptaEFQWFRa?=
 =?utf-8?B?aEhwUU5MK1FvQytjVmwzc3FqY0xGbHF4SWJ3bXhjUXF0OUkrMlVxcHhJc1Jp?=
 =?utf-8?B?UlhtcG9yV3lnRkloejlEdWlydFV4bk8vUDIzTXlQbCtoRFRYTUdqQTVjc0tX?=
 =?utf-8?B?MnlieDh2Qjd3Yy9iRlhhYWorTkVZTjJmMGE4TzhHMDVNK0pPT2tCY3NFMGgw?=
 =?utf-8?B?eVU0MkJ1TmttSmpLckNKSHNFb0hKL04xS2NaMUlSdGF2QkpkS0Y0Y2tMVzJp?=
 =?utf-8?B?Y3VHQnU5ZkVTUWV1bThDSGdXckZOTjdMN1N1aFo1SzdRNkdibjAvd3hROXRn?=
 =?utf-8?B?S2dUR1QvMi9wUTg5R3h5RTdPcGNiVE9FUG1aVTN6bXNNbzhMcDIycStTUVRn?=
 =?utf-8?B?Rnk2STNaRjlDRDNWeTNEeXUzaXh6ckNkWlpHWDZBV2w0Y0RMV203ZTNNcE43?=
 =?utf-8?B?d25qRFVyODJRV0Ura3lzRkhpSE5OSzQ2M3huck1NZVBybVJjdFhhYWxTa29N?=
 =?utf-8?B?c3ZaR3hNWjJ4Y1o3dXB5S2VUM0M2M3lBd1FyU0VFeXdqL1VlMlQ5VHZmZ09s?=
 =?utf-8?B?TVhJUEpiQkRseitwZGo4eWd0VmZhbHE3WVdmV3EvRWpUam01c05YK1o0SmQ0?=
 =?utf-8?B?WTVpVG1uRXdDUXB5UEtIdzlrZVAwMS9TN3lQSkdXYXp4ejhnUFdZKzdIK05F?=
 =?utf-8?B?bmxxY2FVQ2RqTGZLb2tLeUZjNjN6Z3V2YzlHNzN1U0pPbEIrZTJqamdmUWpw?=
 =?utf-8?B?QW9HQTBCamlVaElZK2pqWlNpSURJRHlSRk1SeFhlNTk4TjJkcE1lUVg4VVlj?=
 =?utf-8?B?VjAvME8rSTZXanp0YTM0cG5iQzNaNTl4NDdVSkd1OVNLclRURlhEcXBmdUlR?=
 =?utf-8?B?Y09NWGFsZ1RRVXJrMFdtL21IU1NvQjlWTjBHcGNGL3Z1ZFZjQWRvMFp4WVFD?=
 =?utf-8?B?YzFrMWZ5eDdnNHF6eGRwMERnZ3ZYNlMrQWRuL3NYVk83cEg1MWhRUVc1ODFP?=
 =?utf-8?B?dUZDSHIxMkJJSHZhcjdleDJ4dnlNVWF4c3Q5N3J5SW9vTWxPV1gyT1M5dEtI?=
 =?utf-8?B?L0c4QTZ6eWxDNklPeU1ZM3lUenlPSklQSUw1S09tVUcyb0RQUmtIUWZjd1RQ?=
 =?utf-8?B?aWU5V200VGlQTzRPZTQzSjlqczJDUXZZQmF3MHhQS2VLOFJWZ3FXQW9OMkRI?=
 =?utf-8?B?UEEybm9SdXo4VHJCUjNwT1pURWhieG45ZmszamJVS2lPRTY0QVVuN0hCa2k5?=
 =?utf-8?B?VStVRkF6ZjFCTU8xK2F5anFER0pvV1JIUUd2RU9id0JGN2d6eXpPUjhla1Fq?=
 =?utf-8?B?ck96bUVidEpKamw5cEtCYjN5RHBUWE9CaHQyRUg1OUV6YU1QczFIbUlMdkVM?=
 =?utf-8?B?Zk41MzVVemd6YkdwaWwxdXJSd1lnPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:21:47.1240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8d2239-d18e-4a83-81cb-08de5e895590
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12334

The SolidRun i.MX8MP HummingBoard IIoT has a variety of conectors, and
configurable ports:

- 2x RS232
- 2x RS485
- DSI Panel Connector
- LVDS Panel Connector

RS232 and RS485 each share a single UART from the SoC via a mux, which
are configured from the base dts for RS232 by default.

Provide addons for:

1. Reconfigure UART A from RS232 to RS485.
2. Reconfigure UART B from RS232 to RS485.
3. Configure DSI Connector for Winstar WJ70N3TYJHMNG0 Panel.
4. Configure LVDS Connector for Winstar WF70A8SYJHLNGA Panel.

A variation of the base dtb is generated for each addon to ensure that
make dtbs_check covers the resulting dtb, and applying overlay is
tested during build.

It is however expected that bootloader should apply any combination of
addons based on runtime configuration.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  12 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++++++++++++++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++++++++++++++++++++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 ++++
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 ++++
 5 files changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0847347786fa..36d3bc783a88 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -215,6 +215,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+imx8mp-hummingboard-iiot-rs485-a-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
+imx8mp-hummingboard-iiot-rs485-b-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-pro := -@
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 000000000000..e66ee2ce69d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			data-lanes = <1 2 3 4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 000000000000..f8fb7fd0e4e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..7bbf800b78fb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..d4bfea886ad1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};

-- 
2.43.0


