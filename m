Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB161DE890
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428842; cv=fail; b=mZ35kU8Rc3RVhdB7j9n1A3o0mfUbidmYZ9+Cx6RYLddVTqenfS3ulYeUOSUfbuNM1EwUxVVSWTaKOA9Jd3OYafwpg8d0QUxq8lPgSN3+IcJvhd1dUepcZbDkgfn2QtSfin+mDaj2ReTuYoVp38r40PklxhPWY5RVlavBjq94kkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428842; c=relaxed/simple;
	bh=5FVTlA1pi+6jILCfNw3lBFfz9W5TP/rhyitx5U+VGzg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hetYusSEBRkWnkwjga+Vovnjc57FaTnmtA+zWLp1tUT4tOnO+vgELKB9gq6Ai+2Q7+anWS8arLY97mv8wzlAoKqjol9TKFJ3svmr6x4Q/Gv40KCpIsKdGcVr/+iiZUeCOatysevlrbfp+U9ckKJV5ZSW4o4FZHFkn4ofqY6AZ68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YigPo8Gj; arc=fail smtp.client-ip=40.107.104.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YigPo8Gj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utDzgzTUKEGlvaXz18lRRSWwJ97pKvmVNhvB2cHlCJBdMYhuiLF8n3G8hybLXOP1qO2GxminwE1+QAz/xxL+2bqUqpD8T7uPle21QSMXF7gIWWRX6aR8tcUplRBaWn17L490FH9EB0L3WgYPUSnbL9+CfiIJbJVZBf3n5xSj9mQkPrP2eH03bC7Rj0SbbbFOldr/6HwdRh7BhfD6gdy8EfFVR4sMaR5wZIlg8YZSdoo4fIHOnM2GT3qHEH+FpxYdNf3PehKOerssudbKu1S2itQj5mjBmgHNHXVMqx8VUhjOm+6RaxaunyE3DifYwSmG7tJnYSdBI8QqlorZTlui0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FVTlA1pi+6jILCfNw3lBFfz9W5TP/rhyitx5U+VGzg=;
 b=VnonyZGEQ7kjt4jaxWVSBeWBsu+LlQt+JmRbycldKvCZjJEhcaKpEmUll+wpHt1p5f3IcI95j6m2A98hzqBD6w78x2Lb0zoB4quchXocknSjvKgimc3RsHknEmQUVHKvzwVDBPblF6KIXOQcYVTOyj+0QSKt5rdn41k5tJmHzsmarnhACLDjdI56sxbb0w0pOWpqtO+0nM2pD7wM6/klrEZX116JW4R8PX8XXoD7Ru4ozIBhpC57WWNDNHHAacLTcrLDl2D2G+1eA0t7MSyqZ/V2upvVPOWA1MhE6SetT6LDrU5ecT1gWxt9Td0bY04VdPLZYYi+cmkE+oOljs+rUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FVTlA1pi+6jILCfNw3lBFfz9W5TP/rhyitx5U+VGzg=;
 b=YigPo8Gj0gBLs78szd2JQEc15U0Da4qGEVWYtzxLs/8Vo65MPCKcg0NqgJ8hY+rSUVNjZ9AWqR3JkrI2SLyAybVNxHEjW75QuPgafc4mBIlCT63CskygqVxdqC7fsiXMrqk305m2QDRZDCwABhShOZJVGJq1ks6ikFiDUIIuPi1KAsQRlVKFo2XqEKqoLtic0UNOKmMu27gKzhFRT+QhW2rl/Xd5F59AIe0FQd39QIR3TWkfGKZ+t6PYr0XGK0Ls5anMP1W2zeMKV+USE8iaJFS486vCqRaFf7nCNad6YWE1hmnyd0Td/zfC1F01urSfcJGEynuqgphD+8ovs8N9lA==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB8PR04MB7020.eurprd04.prod.outlook.com (2603:10a6:10:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:47:17 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:47:17 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbTHk81yKZ8OkADU+CIsg4vinMd7Loro0AgAF3nnCAAAXpAIAABO0A
Date: Tue, 17 Dec 2024 09:47:17 +0000
Message-ID:
 <AS8PR04MB8642F7BF3F5B8E2455EEB0BB87042@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
 <bx3r4cs3oklfduvkg65vke3clb3fc6sseske2ellq27ifpmsnm@msz6iqvjwufn>
 <AS8PR04MB8642D11477A37E75BAB71F3087042@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <fa130432-bbfe-4d8f-913c-e86488efe203@kernel.org>
In-Reply-To: <fa130432-bbfe-4d8f-913c-e86488efe203@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DB8PR04MB7020:EE_
x-ms-office365-filtering-correlation-id: 20d88d37-6a33-4e38-b566-08dd1e7fcaf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTJSR1p4NXFPU1NOUkpSNW9oYjRZcy9jcXFKMm5sQjExZHFuYjNOWWJXWVAz?=
 =?utf-8?B?cjd0MWttQXdEMTdMREJFVVltcnpsenp4dVhnTlpyVENBTWNDUXltRG5SMmZy?=
 =?utf-8?B?QWE2Tnd5TnhOQ0dYenl4MUJ5SUt1RGVRdWZBYlRnTVdoNTlwL2YyQXZPZk1O?=
 =?utf-8?B?WUNBZjBXOUtPclVleHdQalVrMGxHNkJGUjh4UTJzdGIxcVBnTUhjSEpQYXk1?=
 =?utf-8?B?QVZlMlVYbk5VMHZXd0dhYU1iS2w5c2xscS81ZVFOSWNIQXhEMVBCdk9ETDZr?=
 =?utf-8?B?UU0waG1PRm9IYUxGWTFrdVN4Qi83Tm0zL3FIeVQyVnJFa3hrRnY4UDFIb3Fs?=
 =?utf-8?B?RGZjcXNmV1ZVWVhVdGlRVmdwOGlNWHRWTXNWSnVCVU54YytNZUVZUjQ2bkQ0?=
 =?utf-8?B?R2VINENwMzJtOWhXWWZ2bHNWZTdjUmloOXBYakI3Z3BtTnBuZkpTN2c4NnNY?=
 =?utf-8?B?RU10L2o0eExJdEIyWmNYU29PZjRPZGo2UlNQTWt5bURSalpSVVNyYzRoQTUv?=
 =?utf-8?B?aCszL0VxOHRaS1dXNTUydUhYQ01SeUZPajJnc01TT3hyaU1HUkpYY09neWZL?=
 =?utf-8?B?eHNPWVJIb1ovR2NmTlh0cDlvcWk5K0M5RnRjdUN2KzBNZUZCL0NLME9mUzhB?=
 =?utf-8?B?SE5tdTJKY1V0bjcwNG91UHhpdzRvZUtCMXdlbGNJZk9HdGp5WXFtaW9UOHNS?=
 =?utf-8?B?UDFYOVJaRmxLaC83QjJLZnRSa0VDYkROT1JBbUcxajlUazVCelc0MU0rZXVP?=
 =?utf-8?B?MWlCMjc2UUw4bk1nZUdNZEx0S0dSd2kwR05OTzZYNzkvZVV5a1dXYmRKeWNI?=
 =?utf-8?B?bms2Ui9qb0hFeFFpWXEyQ3FLSSs3akFmdG9LSFhCQ243U2sxakEzOHJjSDZ0?=
 =?utf-8?B?ZUtSRk82OHNkbDRlcDFIYWpUaER2ZnljZllzWWhCMkVWVE1sRXBYcUI2VEJq?=
 =?utf-8?B?SmJMbTNJZVM0K2UvU05nM0F1eFBORzM5UmR2cjd0QnFZS05SbXVTcmJaSGV2?=
 =?utf-8?B?K2M0U2lKLy84NGlvMlhHcWRIa2JqaVl1Z0p0aG5GU1JUODFUOUdoTHYrREpE?=
 =?utf-8?B?WFUvOWtJNXB6eDZsUFpVZW1HL1pFcW1xSzdOa1RmTVIwUEh0ektlMWVpRUln?=
 =?utf-8?B?Y3lkRkhoWXBGR0xGemlaamFycHZkSFlvcHlHV1dNcVc0Y3p6NTVNR29QelZ4?=
 =?utf-8?B?cFdZcGVOVHNYYTEzR1VDNlBmTHJFRkRESjZlRU0wd2FPNlA4MXNGK2tBTlVs?=
 =?utf-8?B?QllHNm9OMWpqVHZaa1YxN3pwbUpPS1ZaUWpQNUpnSnQvWnJaSVpybTF1enIr?=
 =?utf-8?B?M3BtN1lKRElrQ1doK3RjUGkvOEViMCs2T2owbWk5NU1xck8rNmlxYm0yNXpS?=
 =?utf-8?B?Z2xZSmVCenVvYUt2R0xtZE9VWEZYRU9TWGI1V1hRN21zWkhKTWZod2dwOE9w?=
 =?utf-8?B?T21rU2VrWUsxR25pTkJhMndoNEJjajFlWnRqN2U0VEtkakRjV1RSdjh0aWxs?=
 =?utf-8?B?d2hDNFFxWnh0b1c4VUszVUpoTys0Tk9BMThmYlZzU3hXaHh0YXo2SkFBM09T?=
 =?utf-8?B?U0VNZHJpY1RGMS9JczRIa2N4UlNFTlRHUk9MdlFPQ0xVZWtRY1pDUTFRWDdr?=
 =?utf-8?B?a2VhNDhWRTExUzBjaHl6TXRUL1FEOWhsNVNWOUg5UnRlZ2dhQ3hDRUtDM25N?=
 =?utf-8?B?ZCsyekxlWXZGVW12b1RieFpIanZSVDUxc0JKa3BtYUwrdExlUjhKcEs5dGZ4?=
 =?utf-8?B?K01WU2FDekZtN3RqcUtGOVJVNVovdGgzdSt5dlBWL1EyWC9aRjMvUTNjbnc3?=
 =?utf-8?B?aVBPR3BuVXB4TjJDUjBRTVlNRkRiWEtPa2x5azJTYkJDTFNRZTZvTUdBZDh3?=
 =?utf-8?B?QXN4cjhLR1hRQWNWYkc4OWtHcUxFVm1NU1RXV0ZqcTdTbEJZSGwwK0Zub2Ja?=
 =?utf-8?Q?i3cBwJDCVAM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEFuYlZKTG1QQXB0U21rSTZVYnY2YVdSZzNBZWNQVDUyeEF6UVEzRFI0WW1Q?=
 =?utf-8?B?dE92cUlHSERJT2tlcmFkN2NZRVhkQm1uOUUyRmJYRS9pYUUvTGJXaW94VlJw?=
 =?utf-8?B?cTQ3VmN6VVNjNk8xRHM1amNGUXJMSkRIT1hreklQSllpeVF0WVd0WXFRRXh6?=
 =?utf-8?B?R1Yza0ZJaEZEUlA4UzJ1bldwSFUzOUpTZ3lmQk1wZ2pUemhOUkhRcy9VaVhx?=
 =?utf-8?B?K09XYzQ2d280RFBFVFJ6MGJoL1BSajd2ZWFNSy85NUdtWTZPMk9qOURaMDd2?=
 =?utf-8?B?M2REWmt5Y1FOcTg5ZXowbXI0QlQwRVZPN3FkbXRpYkxuUE5VMVo5UWNCMXhy?=
 =?utf-8?B?R0lUcE14L1FEWjdyNXdzcEdCb0hSdzdBMFFyT1RxRlFwem1LRklKSHJ1VmZM?=
 =?utf-8?B?MUVzUmE4YTQ3RXFrNFZYTFFydG1LSCtRK0d4VHcrMXpZd2pMQ3N5MU02VFhZ?=
 =?utf-8?B?ZUtLRmJjN2RzMGczUFZySjk1YXdJMXRMdUxGNlZBL2FMTXU3R1FOTWVlTTJG?=
 =?utf-8?B?SVJWOEttMCtWMHNhOCtES3RmbjRkNjE0S0RDMmtQelh6RlJFaGxhUngzU2ZT?=
 =?utf-8?B?dHd0bWE1T2x2eXFBK05FQ3E3NlUwWjBsczR1bWpoQi9tMWx5TVRMTXNGQTFh?=
 =?utf-8?B?OFN0QjlzRThKMmZncTBDazNyV3JoSGJkWWNiRXVsZnRNWlY5aTJ2NHZoTzFr?=
 =?utf-8?B?NWxFdG56L0RwNVc2NkJPZllLR0RyQk1ubHVEZEI0dklUcUJOOXBuWHVFOUFK?=
 =?utf-8?B?R1l5T0NTREZRakxNOE9LTjhaaGcyUlh6b2tkL1ZoTE5VLzRTNTV1eVZTcTZ2?=
 =?utf-8?B?VlhHcGxXUEJWTk1UVDF6UTdzMzkwenFHM1J1bHJyN0hqWXk0VmlNVUtzRkw4?=
 =?utf-8?B?dFh0ZDdPeWpuUHBYRUxWZlR2WXFCOEtseWI5SmNnUkNJZThBa3NUYXJLOTdB?=
 =?utf-8?B?MmczZUdnK1RYVHV4aEFNT0diY2YzdFR3S21QU1pNVDUxWkZzeGhydU12WW5y?=
 =?utf-8?B?cnQ5OG9JbUFxaUZDOGdmODZtcXVaOVIvd254djVPMTRjNFN2d2xrWW82Z2R0?=
 =?utf-8?B?UEZDSHFrT2QzNHAyenROL1F2QVdaZXI2ZS9tNFJBeWZNcjBkV0d6eE5NUENw?=
 =?utf-8?B?QW5IblQ4T0xLSzFPZDloWXZkd3gzOXI3bkxMQWdrM0lCQ240NXdFOStTT2lm?=
 =?utf-8?B?MTE5RFg5TmtCZ1MwN0JVY3V0L2hPaWd5S1p1Sk44VTdGdU55aXVQUnJBTW4y?=
 =?utf-8?B?RjlCcWRSQ2Qyb3dMRno4V3MreFlDK0FOTStZVXZUakhBdXJTV0JqalpTZHJ5?=
 =?utf-8?B?SVJRS3Z2ZzlPdnpXQ0tvbWRZVFo0MG0yUytOOVQySjQyNk1WTnZzQVp2cmhm?=
 =?utf-8?B?TlQzMFQ0am9VS2k1WVVtcFNBbkNUU05hdDVWOGkxREJaYlFOREl3bG1xVHlH?=
 =?utf-8?B?cnBMdEVYOG1Rd2FUTFNDUzA0SjFqYWtBUmx1eHo4MW5mT01IU2RCK2FYYXpx?=
 =?utf-8?B?QTNncktSMkc5R2dHb2s0Z3dOZmZSTEg5bG54Y1liN3ZqNExsYXJwemRJQWQz?=
 =?utf-8?B?S1hHTndlQ09ya0Q1SWM1OW4xNk9EVU9CSmhEU2QzSE5nS0RvOE9EQ2loUHBj?=
 =?utf-8?B?Z1BSUEc4dG14d0tJRjdtYUhlYmFOYUJJK1UvdnhadGJtNHJ1ck8zRHZkUGZO?=
 =?utf-8?B?MmtlUG80VGFuY1lQVTlXb1huaWQwRU9ib1ZmajNMSkhyV3BWR24vaHZTZCtW?=
 =?utf-8?B?bWltSHFWeWRUQkJTYzBCN3l2akJJUUYrMzJ4eWh4WkdKeDQvakpwenpqOWg5?=
 =?utf-8?B?TElsZUh4bFhEMG40WXdWWUQyV3lBMHd5Y2NkOEp6TUs2US82ak53VzMzZlJ5?=
 =?utf-8?B?c1hELzJveTQwa3A1L3VzYW5JQTdjV1Vncm5vQm9Dbzh0Y054aTlhcTZzQmwx?=
 =?utf-8?B?NWJyTFpQVUtPejh2WkRkcXNjbUs5YjE5K2hjMGlWanFLVzNWODllN0pXTkx4?=
 =?utf-8?B?anVVMnArcFRDT1VjOEtyVkxGOGJPcWI1QTJIY1UxaTNtU1B4bnV4SnRodXdI?=
 =?utf-8?B?SWV4WGVtNEhmcGd6OExnMERjWEVtOU9GOEFLTGEvREVpQ2tDd2hFd0hVd3h0?=
 =?utf-8?Q?15H8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d88d37-6a33-4e38-b566-08dd1e7fcaf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 09:47:17.0814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6aKW6QIuCFv24nZ0bzhvwj1K3/6PNW2HLLnJoy0xm9lj9xAuB2+TLTLyIH8PkmSCqIXIEvy5jpHfGqVUZBywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7020

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBmcmVlc2NhbGU6IEFkZCBiYXNpYyBk
dHNpIGZvciBpbXg5NDMNCj4gDQo+IE9uIDE3LzEyLzIwMjQgMDk6NTUsIEphY2t5IEJhaSB3cm90
ZToNCj4gPj4NCj4gPj4+ICsJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOw0KPiA+DQo+ID4gLi4uDQo+
ID4NCj4gPj4+ICsJCQllZG1hMjogZG1hLWNvbnRyb2xsZXJANDIwMDAwMDAgew0KPiA+Pj4gKwkJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg5NS1lZG1hNSI7DQo+ID4+DQo+ID4+IGlteDk0MyBvciBp
bXg5NT8NCj4gPj4NCj4gPg0KPiA+IENvbXBhdGlibGUgd2l0aCBpbXg5NSwgc28gSSBkaWQgbm90
IGFkZCBuZXcgcmVkdW5kYW50IGR0IGJpbmRpbmcgZW50cnkuDQo+IFRoZSBlbnRyeSBpcyBub3Qg
cmVkdW5kYW50LCBiZWNhdXNlIGFsbG93cyBoYW5kbGluZyBxdWlya3Mgb3IgbWlzc2luZyBmZWF0
dXJlcw0KPiAoc2VlIHdyaXRpbmcgYmluZGluZ3MpLg0KPiANCg0KVGh4IGZvciB5b3VyIHRpbWUu
IEZvciB0aGUgZWRtYSBub2RlLCBJIGNhbiB1bmRlcnN0YW5kIHdlIG1heSBuZWVkIHRvIGFkZA0K
aW14OTQzIHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nLCB0aGVuIGZ1bGxiYWNrIGNvbXBhdGli
bGUgaW14OTUgc3RyaW5nLg0KSSBkbyBoYXZlIG9uZSBjb25jZXJuIGFib3V0IG90aGVyIG5vZGUg
bGlrZSBscHVhcnQsIGkyYyBldGMsIElzIGl0IHN0aWxsIG5lY2Vzc2FyeQ0KdG8gYWRkIG5ldyBj
b21wYXRpYmxlIHN0cmluZyBmb3IgbmV3IHNvYz8gQ3VycmVudGx5IEkgcmV1c2UgdGhlIGNvbXBh
dGlibGVzDQphcyBpbXg5NS4gSSBrbm93IHByZXZpb3VzbHkgd2Ugd2VyZSBhc2tlZCB0byBhZGQg
bmV3IGNvbXBhdGlibGUgc3RyaW5nIGZvcg0KcGVyaXBoZXJhbCBub2RlcyB3aGVuIGEgbmV3IFNv
QyBpcyBpbnRyb2R1Y2VkLCBkbyB3ZSBzdGlsbCBuZWVkIGZvbGxvdyB0aGF0DQpzdWdnZXN0aW9u
IG9yIHNvbWUgdHJhZGVvZmY/DQoNCmxwdWFydDE6IHNlcmlhbEA0NDM4MDAwMCB7DQoJY29tcGF0
aWJsZSA9ICJmc2wsaW14OTUtbHB1YXJ0IiwgImZzbCxpbXg4dWxwLWxwdWFydCIsDQoJCQkgICAi
ZnNsLGlteDd1bHAtbHB1YXJ0IjsNCglyZWcgPSA8MHg0NDM4MDAwMCAweDEwMDA+Ow0KDQpCUg0K
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
