Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020089.outbound.protection.outlook.com [52.101.69.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0538C427
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.89
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396528; cv=fail; b=IhzUS3idGy/1MI0scgwc8Bby4Fl42Ph8+pNFPcrHV1T6/MMMeId67PrHKGPqtvoFM6EzITPkihXegyfCxMjI3xYlGDuQiVl4p83pnsouH8uuB0n2BBgUBo9RF7WNeKfKymbksadPBNZuUb3qimx11XNQFTVgZWRRXtCQAMGqwII=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396528; c=relaxed/simple;
	bh=I+Pf940kNUZEgQIfkKGJuCpwHZfIFK2uR/XARmj3xE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WHwOWvXfTUJE/8VtrNR5eOwpGbwA2jxeAfMrf+WwCmOjjF8MsJPQQwIHdtQu6F+8nvst2kzTXlDffVJY8C77AQh1KyQSUfTNlwfenUZdSFixbHo5xFRsZZxLAN8cHMb7UZrEktXKQ3rkpyNsWh0nXGpk1zNJQ8siCW27OsDKVtE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=WyhLTzWU; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=WyhLTzWU; arc=fail smtp.client-ip=52.101.69.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="WyhLTzWU";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="WyhLTzWU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gSZO8JIrSaJA0vSR+GTV4FuEVxgRam1lrMeSt3xqSOeZFbXnofw/sPfPd+XcaM0jQEa9F84Tf+cZbYURitbC2Bq2aURHLoqxf2r2R1Mn5oo4brF+JU7QJuH0U8TGLGazcuqbICNrKLdyrMGM2C0et/ovi/pfi/7bwY5WOCNKrA7nJkv6/2v6mzbebxbulUxQ65jxPFBosuyiB1qTvX0aMdSBVsGcaDG587q9zypnyjQIzjncEx0xSSDNmhOerrxgN7KggmvXr/sJ/BGKDgeWqyP9EflIuZzEYzZ5wLIJ8yiqD0+46CdcV9DWRHSJRxN6qs1G1oadaonGpEkXTI2Iug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+Pf940kNUZEgQIfkKGJuCpwHZfIFK2uR/XARmj3xE0=;
 b=jmFcrHANr4S8RFAGjiwwCOhcKM8P8NIhormv4n+Lh6fe6XMMogVPLoehzQIQn5+ZqNDCrdoCO13kJ/hYratk6zH05X62qvf5i4GPIKnSRwMv/NZd9x36LSUQm/3WATA+aswn9eXiDjrXSb55nLHmQH9EfBjUqYIMSl7IEiKkNEBpIA8XIucF0BDFTN8dEmlU6RfvyZHRjZ5SsqQ0AI/J9LM4gmHgzwhZRwWKTNTkClVWmMClRvJZ4g9dA4z1+QyhpJzhNVUH8oSxPMEdRNyb+a1GH0o0P+V+5cbkBEZBh/fzo4ytmuHPLDhEnXC9YZdTEsPKL0iVlr+NHOoPR0X62g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+Pf940kNUZEgQIfkKGJuCpwHZfIFK2uR/XARmj3xE0=;
 b=WyhLTzWU2+0YDFaMIEX++fkShOuqfw0m6+dbZ8IbO4/+MS6BlCa1rlsjmtQAe5NQKF/smy3edqyNPHYGf8xn0PlDztLqMl6lhvxakcLXP4dnUdiFJrvAmnzDFTYUw5V2mAJHhgSdTOIxljC+dB21/2f8puOM5o0gPLr6R8qEMkw=
Received: from AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34)
 by VI1PR04MB10073.eurprd04.prod.outlook.com (2603:10a6:800:1dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 10:08:39 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:209:8b:cafe::51) by AM6P191CA0021.outlook.office365.com
 (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 10:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 10:08:41 +0000
Received: from emails-269876-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0BEE280B75;
	Fri, 13 Mar 2026 10:08:41 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 10:08:26 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2zS2oZ5IQ2Uez2RrOjLsODqY7ZX1YY2ROk1Q0hJl1xmWz+Z96WjdlpKmQfEkPZSnR3UgJZC6DaEQHJwurnuRYACeHuPWuNMmGkwpO3JeUzCKVU9+/HApo4d+uQrFug4Ln475SSxiCpH9Ld9G/jIDWHAGCgvv8UW9zljDlK4opz7+Rs15bBdcDrF9ZHreYWNbXTBcEp9U26I/uAaxgPJkvrvz7NQp/rwcnqpbDusbU5cfzCnozNc/awquUVNw/U54QAx1m1VrEiLCt3obt5HyHh+eZiVBL5SouPI6yTH819Bwt41GnXZiCe5c/wDzL/USgAEZtgWff3ZO87Sz/TdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+Pf940kNUZEgQIfkKGJuCpwHZfIFK2uR/XARmj3xE0=;
 b=u4ur6D7aX4V91EfbkHOn/3zhPlkcp6LWD2/t1BdTHwRjSg67It+mzQAyFfds+td+DJm1oAn2+LY3LoWg0Sd+4HK835bnLn3nHl0s9MFsDK5b1PtqdTss/9qAS9PehcATXwEwyoq8f1KgCwmrconUPkxBaf9IrnhXYVfJTCcBj7ob13g5KH0sLakU6PqxxUiWux0pG51Z4Tjii9edNGRRFJZjeKVmYSEx+Q0CBo4yz43fm2MTsycaSseyuOiomnz9KeLHKlDtQMFwlw9Se2kPjswTSQlYY6dDW6UDI8lUJMw7ivg+m/6AaOm4KarpUD13NVTp/rBH4d8W0tDr4aQO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+Pf940kNUZEgQIfkKGJuCpwHZfIFK2uR/XARmj3xE0=;
 b=WyhLTzWU2+0YDFaMIEX++fkShOuqfw0m6+dbZ8IbO4/+MS6BlCa1rlsjmtQAe5NQKF/smy3edqyNPHYGf8xn0PlDztLqMl6lhvxakcLXP4dnUdiFJrvAmnzDFTYUw5V2mAJHhgSdTOIxljC+dB21/2f8puOM5o0gPLr6R8qEMkw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 10:08:20 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 10:08:11 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Topic: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Index: AQHcpz4a7szQRaQXb0aCoWZsVdtKILWmmXiAgAW4ugCAAAH3AA==
Date: Fri, 13 Mar 2026 10:08:11 +0000
Message-ID: <7c12e648-6c29-45b3-9e27-dbea0ca6d230@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
 <20260226-imx8mp-hb-iiot-v9-8-4533235eeb34@solid-run.com>
 <aa8TvVC8KWBiVGrG@lizhi-Precision-Tower-5810>
 <ee743a02-103a-4f20-91da-99d6cba699ff@solid-run.com>
In-Reply-To: <ee743a02-103a-4f20-91da-99d6cba699ff@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS1PR04MB9559:EE_|AMS1EPF0000003F:EE_|VI1PR04MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e319811-feb6-408b-f76a-08de80e880be
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 E2eNT56Wt9871DuuOE7XRZ+T/br4V4kNWVrwCdgSAw+bXKyd+Bw9R0jahlbzCaTWFP4vaX0v/NntTAH8w0uGkwjzj0kUvcK1rMfG3m3WS12YYUce1JwKutfJ6ZxnleA2vuxJlDcol1qOSMDojCvaL8M2AUBbCaLbRJjLhpTHsGs7YBknTpggZUjKBoAapunG7+Y60fUPURA9oA4xtX5uFxBDA+coems/4ybr10PlhRBCyfrXzQWM7FyVxGa2wp44BfEufsaBdZUCppV5Fj3O0i+prnG/aj6L6A5o0OWRVAfx21ITfzmhhiCUdz0E73Cg031wI39PcfeB7llMYUepWECtkvHZRzV1bhQ84t35B/yvxD55Ugng+u6Jgm9bJyCG+Xh3yE2kUhWmL9MP6Xho4jJNgbmxf+xonIQRBnZN8cTJZdvgsXUS2KSgRoSl6UiyZm7c3gfCvBkLi7RIMYAFuQays0lPpYa1+ldXSiQnAPvP1KexMbf90WPFk0oLDEn66ZI1ps+hxBkA90B/44C9DIyaj0eDz+J+C2x/CAwJdTDf33QSiRBprXlsaEBmngFEAj44HftAD/ciHDOBf4tC+iGfLuxmLWDEzY2ufxvEUT4W4Ti7r0D+4wcZBUFm/GNWG/BKP0YZHZf2hcxYuJmzsmgQLdVL9jTLnlQXUcs79JREp4jcWhjK7cSrcAmyICffwCvD/6FMLnHo8bl02FrwjlGH+btGq6SDI2HnrfRCIKovPHwKT2kvWkFAp9WAsplF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <23C283CB739D2346BC9443A371FCAEBB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qB5KGq7sTn0X3fyEu8TnrsGA3rrFWr0SlLC3PhPzJ6TCadyeCnFTGisGIh/sjSI0r1rCMgFgCYkLQqAC07V8fisK+LxaV1s+GsYLge6VMu1P+FpPZYEGjo7OhEW50TZ0hiGpmoFnC7Ljg+hscwqLb9tBAlbEIUHOh01J/v5ZTFgRqQ4l2/3lQ6EZEdVdXamcaojka9B1fK/oUf1hKC2Uv8q2lqdbfUfuzh9gWGfeGY4chYZ2oelJx2upis9ZdWe8arK4obMhPnbEZb5cKy/sbwktn0GrENVVtWGep41tce6e6DFYYntP2U+rH5XsqMdqUvOZDzEgl1bEUD8nfSNUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b3edcde6803e4c2cba2133bc54bc942a:solidrun,office365_emails,sent,inline:542bd80e4450dd43529c7d8f437737e6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b48ae06-b542-4ff6-bc7f-08de80e86ec1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|82310400026|376014|14060799003|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yXPULpe9HkUCHUSgnPkWYT9VfKWPPG3GTjGDS1uw1mqsho7r6QfjQRSkfEgVX8AGiA3DoGjlxuu4EdBtR3rDG8C5MSEqZa63wGsF3b+CBjygHCBSQ/lofc/MWNf8bWQV801jRW2EmDDbmUxzGUNxQV36bpH5V7L5gl4KRXIuJnPgQ9qr5v55rYUjrz+kJ83ExSVkbdwX0KH8DqYCRtLKh4ix820mSkbw/5XepvjhSYYMgrgWXkgURiCVg3ZuzKL0kPutIC8vOioturuCF5+llD46TSyU907cRwVJObVV9cGeOsg3kphGOwBuzuPelLzT0hoIJbvb0JjvBUbZcC7d2Fzt2uMGOb/8tEgZaTRPILRwyrJdCWvLyQdG/ZLwBRFMDHH8uBrHTewUwBkwKagiTudRf7OFQCfjeK+ro0/P80FwDwTGFI1W7D4N3exk7zOeEZ0JbL7a7J+cdonpxTzeSRrrlpEUl292anYkULs5Sehq+4ti059G2UWVpfTG5sIjyrDO8hxRWUS1NY8U5pUl55GFgJfSbhPTwtmg9dV7U0WEXLipU1w4awrOQZyMfqMyongjQdw5K5XKqadqdYOitOCAO/Qbz609cTG6ChxkWaFC/ewDeezykzCMYSP7yVcPLSl2DNfQI3P7O6qBHerwha2lC30KZeDhLYqmu4WPNecinxiMFELiI+PtnhesnYxM1xma7Xnm5nTuKa/tRRczBGWRQnnEQ+z7+9g4HazJy0w=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lp+EpB3zI7kqG7dwSvU/X9vPSwsKrjTIqYMNLl3m2cKP40BHDfsyj8zIa97ih5mYrP14xby4vKd+5qd6GOT5RyABOB/BMr6+4SACWJptgPrDfHWpIfPP6jEq2wL5lBWb0FTsJfChOtM5jZ+4Z/ar/aFGe8elEbPK0RLr21Y3WPzIkR4rBwdbtpoWZyAPmQaNi23HsZ04DVXJJ9l8DYukpger+ga8i5AYFPh+CWRcTtw05Hp586v+nLO61fZwFb978YEdQ2/UbYUqcrDY1cG9wV3332cJbtJTzFkryECXGT37ZYeesI60bIIEm8XzGOzYiXFlBrDsUZzpIvn2oTU7uhYeLIKuP3V14iR/Mnh1lR/dUtzkNDtF/hNcT3vXouw8ZTUauwQQQK40S04ZjtR5b1sezWS2g3H4u5KO+NkUMjw3ObTGBQVQxhj5VO9b+Pgu
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:08:41.2960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e319811-feb6-408b-f76a-08de80e880be
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10073

DQpBbSAxMy4wMy4yNiB1bSAxMTowMSBzY2hyaWViIEpvc3VhIE1heWVyOg0KPiBIaSBGcmFuaywN
Cj4NCj4gQW0gMDkuMDMuMjYgdW0gMTk6Mzggc2NocmllYiBGcmFuayBMaToNCj4+IE9uIFRodSwg
RmViIDI2LCAyMDI2IGF0IDA2OjM2OjM3UE0gKzAyMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4+
IEFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIFNvbGlkUnVuIGkuTVg4TSBNaW5pIFNvTSBvbiBIdW1t
aW5nQm9hcmQgUmlwcGxlLg0KPj4+DQo+Pj4gVGhlIFNvTSBmZWF0dXJlczoNCj4+PiAtIDFHYnBz
IEV0aGVybmV0IHdpdGggUEhZDQo+Pj4gLSBlTU1DDQo+Pj4gLSAxLzJHQiBERFINCj4+PiAtIE5Q
VSAoYXNzZW1ibHkgb3B0aW9uKQ0KPj4+IC0gV2lGaSArIEJsdWV0b290aA0KPj4+DQo+Pj4gVGhl
IEh1bW1pbmdCb2FyZCBSaXBwbGUgZmVhdHVyZXM6DQo+Pj4gLSAyeCBVU0ItMi4wIFR5cGUtQSBj
b25uZWN0b3INCj4+PiAtIDFHYnBzIFJKNDUgRXRoZXJuZXQgd2l0aCBQb0UNCj4+PiAtIG1pY3Jv
U0QgY29ubmVjdG9yDQo+Pj4gLSBtaWNyb0hETUkgY29ubmVjdG9yDQo+Pj4gLSBtcGNpZSBjb25u
ZWN0b3Igd2l0aCBVU0ItMi4wIGludGVyZmFjZSArIFNJTSBjYXJkIGhvbGRlcg0KPj4+IC0gbWlj
cm9VU0IgY29ubmVjdG9yIGZvciBjb25zb2xlICh1c2luZyBmZHRkaSBjaGlwKQ0KPj4+IC0gUlRD
IHdpdGggYmFja3VwIGJhdHRlcnkNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVy
IDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4+IC0tLQ0KPj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMiArDQo+Pj4gIC4uLi9kdHMvZnJl
ZXNjYWxlL2lteDhtbS1odW1taW5nYm9hcmQtcmlwcGxlLmR0cyAgIHwgMzM1ICsrKysrKysrKysr
KysrKysrKw0KPj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tc3Itc29t
LmR0c2kgICB8IDM5MyArKysrKysrKysrKysrKysrKysrKysNCj4+PiAgMyBmaWxlcyBjaGFuZ2Vk
LCA3MzAgaW5zZXJ0aW9ucygrKQ0KPj4gUGxlYXNlIHJ1biBodHRwczovL2dpdGh1Yi5jb20vbHpu
dWFhL2R0LWZvcm1hdCBmb3IgbmV3IGR0cyhpKSBmaWxlcy4NCj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4+PiBpbmRleCBhNjFlZDA5OGZmOGQuLjEzMTRhZWM2
NjM0YiAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtl
ZmlsZQ0KPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlDQo+
Pj4gQEAgLTEyNiw2ICsxMjYsOCBAQCBpbXg4bW0tZXZrLXBjaWUtZXAtZHRicyArPSBpbXg4bW0t
ZXZrLmR0YiBpbXgtcGNpZTAtZXAuZHRibw0KPj4+ICBpbXg4bW0tZXZrYi1wY2llLWVwLWR0YnMg
Kz0gaW14OG1tLWV2a2IuZHRiIGlteC1wY2llMC1lcC5kdGJvDQo+Pj4gIGR0Yi0kKENPTkZJR19B
UkNIX01YQykgKz0gaW14OG1tLWV2ay1wY2llLWVwLmR0YiBpbXg4bW0tZXZrYi1wY2llLWVwLmR0
Yg0KPj4+ICsNCj4+PiArCWNhcnJpZXJfZWVwcm9tOiBlZXByb21ANTd7DQo+PiBOZWVkIHNwYWNl
IGJlZm9yZSB7LCBkdC1mb3JtYXQgY2FuIGZpeCB0aGlzIGZvciB5b3UuIHBhdGNoIDEtNCBhbHJl
YWR5DQo+PiBwaWNrZWQsIG9ubHkgbmVlZCByZXNlbnQgNS04IGFmdGVyIHJ1biBkdC1mb3JtYXQu
DQo+IEkgdHJpZWQgcnVubmluZyB0aGUgdG9vbCBhZ2FpbiwgYW5kIGl0IG5pY2VseSByZS1vcmRl
cmVlZCB0aGUgbmV3IGlteDhtbS1odW1taW5nYm9hcmQtcmlwcGxlLmR0cw0KPg0KPiBZZXQgaXQg
Y3Jhc2hlcyBvbiBpbXg4bW4tc29saWRzZW5zZS1uOC1jb21wYWN0LmR0czoNCj4NCj4g4p2vIC4v
ZHQtZm9ybWF0IC9vcHQvd29ya3NwYWNlL2xpbnV4L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtbi1zb2xpZHNlbnNlLW44LWNvbXBhY3QuZHRzDQo+IHRlcm1pbmF0ZSBjYWxsZWQg
YWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3N0ZDo6b3V0X29mX3JhbmdlJw0KPiDCoCB3
aGF0KCk6wqAgYmFzaWNfc3RyaW5nOjpzdWJzdHI6IF9fcG9zICh3aGljaCBpcyAyNikgPiB0aGlz
LT5zaXplKCkgKHdoaWNoIGlzIDE4KQ0KPiBbMV3CoCDCoCAxMjAzMCBJT1QgaW5zdHJ1Y3Rpb24g
KGNvcmUgZHVtcGVkKcKgIC4vZHQtZm9ybWF0DQomaTJjMyB7DQrCoCDCoCAvKiBiYXR0ZXJ5LWNo
YXJnZXJANjggKi8NCg0KwqAgwqAgcnRjOiBydGNANjkgeyB9Ow0KfTsNCg0KVGhpcyBpcyB3aGF0
IHRyaXBzIGl0IHVwIC4uLiBjb21iaW5hdGlvbiBvZiB0aGUgb25lIGxpbmUgY29tbWVudCwgYW5k
IHRoZW4gYW4gcnRjIG5vZGUuDQpEcm9wcGluZyBlaXRoZXIgdGhlIGNvbW1lbnQsIG9yIHRoZSBy
dGMgbm9kZSwgYXZvaWRzIHRoZSBjcmFzaC4NCg0KPg0KPiBUaGVuIEkgcmFuIGl0IG9uIHRoZSBp
aW90IGJvYXJkIGR0cyBhbmQgZHRzbywgYW5kIGl0IHN1Z2dlc3RzIG9uZSBwYXJ0aWN1bGFyIGNo
YW5nZSBJIHdhcyBub3QgZXhwZWN0aW5nOg0KPg0KPiAtJnsvfSB7DQo+ICsmIHt9Ow0KPiArDQo+
ICsvIHsNCj4NCj4g4p2vIGZpbmQgLiAtaW5hbWUgIiouZHRzbyIgLWV4ZWMgZ3JlcCAtSCAiJnsv
fSIge30gXDsgfCB3YyAtbA0KPiAxMTANCj4NCj4g4p2vIGZpbmQgLiAtaW5hbWUgIiouZHRzbyIg
LWV4ZWMgZ3JlcCAtSCAiLyB7IiB7fSBcOyB8IHdjIC1sDQo+IDE1DQo+DQo+IFdoaWNoIG9uZSBp
cyBwcmVmZXJyZWQgZ29pbmcgZm9yd2FyZD8NCj4=
