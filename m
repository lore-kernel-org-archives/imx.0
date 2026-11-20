Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795169335;
	b=EydGM69TEzGbe2RUNBMI5owLhjaCystOHCfkSwlcjAkLOYMsLYoM0Ec/XHbuuFvChv7u
	 dJw7LxbuLAGAE8Q30ntaitlu9gcosDgg4jU3RRDgKXjCtpMj6xZrjXhjePY1RevSiawrV
	 rPu/e4c6Meie76EURpWpz8mEZK7OdgCd1mVTBeJf4rSxUOw7sMYSSShBLdQHjehbFoGMT
	 KlQX174NKO2cmjjEGZuzuO+J0vTKIOmT9Ek5ka979Fsx7L2mlaOcuJvYPf5Uk/dE+Jx97
	 t1i4ntPXzLgrvayTL9lb3XkSHzJrdj4lIKNY7D/rnGs7tIH/0c60VFLkxvTRg8i+voQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169335;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-sharedmailbox-routingagent-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MmeEN5QII1GoFCG4zcV9pxlI/MnwBSd7wqq2PO/58qs=;
	b=wKDt/rBfkgH/MdoO50ZBvfnORMky1DrF774E8ublvA52PCohiTzTPBCgZV5z2Mh3ko9s
	 LrTCu+4E7wdHhzzlAS0LtLSZmic7W5FuAO1+T1qRYMxBqXd8B5F9gkytfszD1e5gVlwdb
	 ZKdF4nYA/PZJF9SjPWzNdO1CGRkwKO0Z6sKslkucO3QsSmBu5gi2Pk/4S2crPfMh8/1G7
	 tQ1lyTt3gkyuO3B0WM166/0GzqmTN9YTly5J58I4f6uqfeFqvJ2Zpq0GX+Kh28u6GuWTB
	 Kgqhkp3t9WF/SGJn4OzEhDQUE25N6rL+8L/L03v+sREUX7UYkC25QCpY0VwHtqaQzMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TebimsK4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.4
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6113606A326
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6113606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TebimsK4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+YoEOnv6UHzGyZ9678uYn3T5UVOR6A7bOp3U0rU/9ShRvjEgY2iURjeQO2Hpv8gq2a2sOOplSG2l6xAT4Pk1bS+9YnaKQcyDgFuIZbPBr8kGqWBnUa09kbj7FhC1kFyvKKGod8cAqyXgLlK7vdzccsXSKZgQHC+lLt0djRoPkr4LuGnF6H7oLZn7ugj/NxDb9kjM6gj4fAmSvkDAMRElhJYVMypl3Xo3CT1P7VtOpNVwavxKd+DHabN41wmQRgR/niXksefEO7WQqgr4zhKF6t5fgRy49D/8gWlCbg4owX3mgIf1b7RykTbtittQ0KMSgfgAsZTG8q1KwX3hZ+yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmeEN5QII1GoFCG4zcV9pxlI/MnwBSd7wqq2PO/58qs=;
 b=XYQLzTXoop4Eod627jbRQ/lfND11cgcVbGYBslEKxHFbp8EGH7CrqEKnQtcgxqFCD5+0KiGU71jQ/Ld2UlJDA1s5Ek365OBOQrbR/Hh+Kwf/7g4tAlN1o+T5AwGpsZuYI16VewzChYTKJJt7+niKTOltj/wrEaxwGK/SdCf6Mf5o+G+8cOPN4aHG7e5J96y6U/0yrDhNti538cdB1Db1yFG07EIOzTWYmn+eerBc6Bqrc9J2M3QYqXy7YoVvlaBSQExHBqjLWyR2+iY5BN0NK/mTO6HAHJe28qe/nOBv1tiRFTnTIO/MxD3aM5iDXEGMev784AeaXPIdXtsewd3j2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmeEN5QII1GoFCG4zcV9pxlI/MnwBSd7wqq2PO/58qs=;
 b=TebimsK4mx+eU3IqN4yxfa0jy7oSi9eC70V172OgEavX51Q4w8axscmy1Yoyg6fEAaundZTV8pcS604jaoa1gkawfM+jkDVdnBOTviWaAo9dEK+eCo68RRNREFrj0MS92ekRPpGOTKX7tWr+GUVWDveVFZc3n67hwA90ch//h5//NmY0lw6QGlvOz2P4AaQ0mOR1U0p5xvHGLAJh/HxMfO5DlLL6yVnXaBwOau3YfISj4r12QTqg+pDbmedr/WCOjJYG5zqWHfr49EBynPF06ir7FVapv/Kaykw3YciYUIQ1Iqxm86C/VbBsBj1bKiEGsrJ3RyjOYlh7cjVs3ctojg==
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by GV1PR04MB10967.eurprd04.prod.outlook.com (2603:10a6:150:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Fri, 20 Nov
 2026 10:08:48 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%3]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 10:08:48 +0000
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
To: Freimut Diener <f.diener@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>, Justin Jiang
	<justin.jiang@nxp.com>
Subject: RE: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
Thread-Topic: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
Thread-Index: AQHdeNLOpM+UapgzCUajo2GmY64VZrc2vCaA
Date: Fri, 20 Nov 2026 10:08:48 +0000
Message-ID:
 <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-11-20T10:07:23.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12117:EE_|GV1PR04MB10967:EE_
x-ms-office365-filtering-correlation-id: 75ffa4c8-d2d7-4459-eb7c-08df46ee44de
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|56012099006|261022105027099003|261021121427099003|261026121527099003|4143699003|11063799006|10067099003|261026140227099003|261028144727099003|261102123227099003|38070700021|22082099003|18002099003|261009223027099003|3023799007;
x-microsoft-antispam-message-info:
 uedr35EcDhvzquhkf3R6xjAJm1VhNnFtNjB4dg5m5ChCCGH2qwP/HxgV3UGfP31F2UKroym222fcisn/bKvLvhMVBiLpSk0C3GE+8wxvKirgvle7oyCxi23CfClJhaguV3zWb5wqQRkIvnHCzIgWCpfVvj2C4IyneGo6t1fdZ9r4O0jrcqugkXZ2e0RRhnTCNWMZywcJVBTs7d98NkjcAXuGljBXsBIlOG7BJouGvR/gxuYBJgSNQKmTrW2vt+8UjyPvyKb56VDAKlHfe+GpcjKiTd2CxwOc8Eu0AknCqBQr+5SH16EvXP9CEdkUMAnim9bYqtod0K3RJyLOrDnpcG+WFADTknIMRxNM4ZyZcyFqep3Ni+qCOch6UJH7boNRyI/R2iRSZ5nZtjcy2HpFvjVFad9r2a0QpKa8g8HleLOtp34RDyo4LAGVZll8Th4JnJ+BOXd5rq8j9NChZAPKlsJ3iWXCSlxFzpp8KoeavFSUhZSwJvedD9o1hM/Eg7MINVGki3jrZytQwjyRjc0mkCVv7fPUR1C7ebx525DBYSI+6x3ySANucVnv0N2CyQ/aLpU6yZa2qM5TgygiojYnPKhteUX1bLQOIDv7pZg7Nsq46Ke6lh3PgbrtzDGlIMqcIdDtoz4DKKSxxf4+qRx2wmZDuZ+E8rUecCTBOLRGEXFtA1YAlPvEVVQ2e2mMPtAibruuBlonIq05pjaLQ5mmpw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261028144727099003)(261102123227099003)(38070700021)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VW5GS0xZWGZmU1YvY3Zhd09vVDFjTDczOGM5QUVidXRSZnJCQjgzb3ZhWlhT?=
 =?utf-8?B?cHVKVlNmbHM2YnNrNkRIdkprV29OTUx2R1UwWUJXaThNS0JLYVdFVTdNUnpS?=
 =?utf-8?B?NmNKZ1dPQjdiZ2M1a0ExcUsybjlHaEhIRWJMaW9NNG9FZnkxVk5zeTRQcSt6?=
 =?utf-8?B?c0htc0I4eUduc0pGaytEcTFTNzl5KzJDTXVBNHBpSkRVeElRbmdkajMxMlls?=
 =?utf-8?B?SEdUSTNpYWpkOFpmTnBaUjFGTlFWUmRXUkEzbnRuMmlva0lLTU9IUGpuWnZw?=
 =?utf-8?B?Smw3bUpaWWo0azAraFZNYVFkblVEQ295VmM0QWo3bEJkSjhpTHRSN2tqakhi?=
 =?utf-8?B?VlVWL1pyUWhIR3FENTlsTTl5dXJIVnZJT3BHYzZBYzJ6QWdPQy9ibllLeTRw?=
 =?utf-8?B?bGV5RW5UQnhyNlBrWTZUbGFJVVd1aWMyK2xmYVkwdjZTUUcyUTdMM0NQWENT?=
 =?utf-8?B?aXBjNkpNRS83bHhSb0U3cklUd2gyWk5QdzBMT0NweURreHVXZ04vVE1YS01E?=
 =?utf-8?B?MmlvaXhXRFYxbUtFcTZtWnhZQmlJL0xwYlIwZWcrbGZMTVNnN3ZIeG83cmhW?=
 =?utf-8?B?VU8xbWlsVWFiWC9qYWozUjlMVkV1N1FjQWRoOC9aWlhQM2xXRGVXWFEzWElt?=
 =?utf-8?B?c3lwUStlLzVmNVY4ZXBUdDlENVh2U1lDVjdyeEZXUlkzUm00WlJST0RReThI?=
 =?utf-8?B?Rnl0YUMyMjZWUHRFcmxORGNYWkU0djduYWowTmw1WXYwVWlPQ2g2RGNlSVZ2?=
 =?utf-8?B?ZHIrMFRQK3ZOb1o1TzNrelJyRkYxTGUwYmlzd2hjWDQ0Szc1cXZlelkrZmhz?=
 =?utf-8?B?MGh5SkNyalVjdlBOSXdNVHAwU0ZTOE1JbUNrVVVMTmRpVmhTcWIyVm9lQ1I2?=
 =?utf-8?B?WU1CUUVoaElGaFFaVW02REI4YXNyMVJwdi90cEQ1S29wVC92MjZsUllJVUEw?=
 =?utf-8?B?UEpQWFFUV2MyM1pycGVzeWZndUM2dCtoTUpKOUQ0TWpZcitEWS91T3ltdDVP?=
 =?utf-8?B?U3I1Ry9VaWNtWUR2aW9KQ2xSZ25EMUtJNzZIVS96K0dRNU5JaWtWYnl0cG5v?=
 =?utf-8?B?YW9LaUJzTXFWckxLSVFpRkZCNUl3d1FNUURtTWpyd0pDYTN3UnNSOHFkbGt6?=
 =?utf-8?B?b0cyOGtIYkttQjNEUUduMjliTGZFZUJvc3RQZUNWckdSYmtnTTRDNHVwL0pD?=
 =?utf-8?B?UStEbGVDeU9zYzBIOXJOR3ZzZGt1T0VDeE5qSU4xcCt3a1NheGI3UEE0T1BD?=
 =?utf-8?B?RHlTZzJPcWw5TVBBWGpnWmJqd2xsSis0VlRpMXA3eWJyTGEyZkZEbGV0V2Nq?=
 =?utf-8?B?bFh5YmFFQUZTSW5BUEpUbmQ2Nk92R1BMa3dmbUpMUHJCWGpKaXVPUTRoSWFO?=
 =?utf-8?B?OHl4Rk53aCtsb1Jpd29pNmN4L25CSE9EOUFlYzhiM0tzSFl6TCtxZGlTWjRH?=
 =?utf-8?B?U0V5MnAzWXVNUXZmTWtkYzlZbTR1ZE13a2o1Y1ZXTVhrMThycFlHcXlnOHBD?=
 =?utf-8?B?eEt6RGJjOSs4cGk5dUhyNjlINitBVW5LVGNqRzBtQWh2dWtOZjc2ZXpYMktB?=
 =?utf-8?B?c2tDT21Gd1dDZGl5R2tQSFlHMy82eGVJRVlYbTIwV25VamsvU2RSL0tTbmMy?=
 =?utf-8?B?Z3ROcndqQ2FqNHlDTHVTQmp3VkN2Snh3a3dRNXNGOEZtMEx1RWtyOVhvU0tp?=
 =?utf-8?B?U1gycmI2bmtyeHdqTGVvQlh6VFdJRkYyTm0rT3pyUVpYaGlBLzJodGY2QTVw?=
 =?utf-8?B?VnBpRWo3RXQ1aTBIaWVJTkkrTUxwb2E3NXpqbm5RMHJxbStQaWQ5MG9jektY?=
 =?utf-8?B?QmpnbEtQVFNBa1FWR0tJV1ZpeXdDRG0rV0dBQ2pRSkQ2NkI5SHd4MDBHMlpm?=
 =?utf-8?B?NzF4ell1L2NteGNYTS9XN0tlRzJwSm51TW1KaGdqWm5lN2t2ejh1OHpLY05j?=
 =?utf-8?B?M2VGWTM0dm1pT3h5Yys2U1ZYcHNpYkc5MU9lckFYRXFzZHhEUzROWFBjdk5m?=
 =?utf-8?B?blhvdUR6Um52MzRiTGwyKy90UGtCbHpkZHRlWkNOQzY4bFkxVkRYOXAyR29l?=
 =?utf-8?B?QmhOaFFQTHpTdXJGMEJZQXJRdjdsR1hvRVNIZ0tyNzcyc2E2Y3hId0pUMThu?=
 =?utf-8?B?SWxPM3poV3B2azJZcUFocXozVUcwbmtWYU9VUHhPcG9wNndIclovZUplRzRt?=
 =?utf-8?B?WEFZU1czY0FBenJKN21uaTFVUkpVaUpLamxjYWxWc1V3d1VoUGtOK0RsK0hR?=
 =?utf-8?B?VWNPY2FudUNMcVYwM1VNVVRwZlV5czJ3T0hsdTBPWHhLUkVlVUFaaVZuWE5u?=
 =?utf-8?Q?AmTnEpkmRjxeEmhQGo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ffa4c8-d2d7-4459-eb7c-08df46ee44de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 10:08:48.1429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chyk9OejWG0k9VN2ARhF0xv8cThYbPTsOEgSNNr6RfbzRrfyRZRXAoOcFRdQROv7UgijJ8i9WMVVnrnRGnvf5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10967

DQoNCg0KTlhQIFB1YmxpYw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBG
cmVpbXV0IERpZW5lciA8Zi5kaWVuZXJAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IEZyaWRheSwg
Tm92ZW1iZXIgMjAsIDIwMjYgNTozNyBQTQ0KPiBUbzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9y
IERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAu
Y29tPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgUGVuZ3V0cm9uaXgN
Cj4gS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0NCj4g
PGZlc3RldmFtQGdtYWlsLmNvbT4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBrZXJuZWxAcGVuZ3V0cm9uaXgu
ZGU7IEZyZWltdXQgRGllbmVyIDxmLmRpZW5lckBwZW5ndXRyb25peC5kZT47IE1hcmNvDQo+IEZl
bHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzVdIGFy
bTY0OiBkdHM6IGZyZWVzY2FsZTogaW14OTMtMTF4MTEtZnJkbTogRW5hYmxlIEkyQw0KPiBsZXZl
bCBzaGlmdGVyDQo+DQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gZi5kaWVuZXJA
cGVuZ3V0cm9uaXguZGUuIExlYXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBXaXRob3V0IHRo
ZSBQTUlDJ3MgSTJDIGxldmVsIHRyYW5zbGF0b3IgZW5hYmxlZCwgcHJvYmluZyB0aGUgR1BJTyBl
eHBhbmRlcg0KPiBmYWlscyB3aXRoIGlucHV0L291dHB1dCBlcnJvcjoNCj4NCj4gICAgICAgIHBj
YTk1M3ggMC0wMDIwOiBmYWlsZWQgd3JpdGluZyByZWdpc3RlcjogLTUNCj4gICAgICAgIHBjYTk1
M3ggMC0wMDIwOiBwcm9iZSB3aXRoIGRyaXZlciBwY2E5NTN4IGZhaWxlZCB3aXRoIGVycm9yIC01
DQo+DQo+IFNvIGVuYWJsZSBpdC4NCj4NCj4gVGhlIEdQSU8gZXhwYW5kZXIgaXMgY29ubmVjdGVk
IHRvIHRoZSBsZXZlbCBzaGlmdGVkIEkyQyBvdXRwdXQgb2YgdGhlIFBNSUMuDQo+DQo+IFN1Z2dl
c3RlZC1ieTogTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4NCj4gU2lnbmVk
LW9mZi1ieTogRnJlaW11dCBEaWVuZXIgPGYuZGllbmVyQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0N
Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRzIHwg
NiArKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLTExeDExLWZyZG0uZHRz
DQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtMTF4MTEtZnJkbS5kdHMN
Cj4gaW5kZXggNmU4MzUxZDEyMDE2MC4uZmJlMzU0M2UxZWU4YyAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtMTF4MTEtZnJkbS5kdHMNCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtMTF4MTEtZnJkbS5kdHMNCj4gQEAg
LTQ5LDYgKzQ5LDEyIEBAIHBjYWw2NDA4OiBncGlvQDIwIHsNCj4gICAgICAgICB9Ow0KPiAgfTsN
Cj4NCj4gKyZscGkyYzIgew0KPiArICAgICAgIHBtaWNAMjUgew0KPiArICAgICAgICAgICAgICAg
bnhwLGkyYy1sdC1lbmFibGU7DQo+ICsgICAgICAgfTsNCj4gK307DQoNCkhpIEZyZWltdXQsDQoN
CkNhbiB5b3UgcGxlYXNlIG1vdmUgdGhpcyBpbnRvIGlteDkzLTExeDExLWZyZG0tY29tbW9uLmR0
c2k/DQoNClJlZ2FyZHMsDQpKb3NlcGgNCj4gKw0KPiAgJm1xczEgew0KPiAgICAgICAgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX21x
czE+Ow0KPg0KPiAtLQ0KPiAyLjU2LjANCj4NCg0K
