Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC3137E
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737447580; cv=fail; b=NxU0ifjHvclfTWUqcRTz6u0gK2qQuTfRNL0wh730jOWwBZyNRj7d+Q0duPDnnEewH/V1GWoeWicitBcclur4mOn9BP+Es5IkjBrsEzUGDojfQWJZ0MZ31t1h8xywpBRigijFXytmRlA0XCC0dLJmwljlEAvcmMCYHAr8mHMsWVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737447580; c=relaxed/simple;
	bh=OVDUXe1r+UqU3Zlb+VvNvXdDPDBksq0nIHvBdfTm0F4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IoZuqGItc5G4Izyu46hpNNx0vqsOYKhLNp6QFG804lTYu5lC7zDiVAFoaQTQAoUqUVHnwQVloaTR8iDYcosWt2/W/hUBy4tSukrfL18WQg9eXHUx2cP7SeMeb+0Mn7SZtRPitGvGsxpVBxOsPR9hCb4QaMmZom/n52meu/Q+5S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rgsybo1b; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rgsybo1b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVecvEZjJAXQC+d0dTwciq1KAZGQhUZKAjQQV8np6VKwtSokgs0/+pMWNzKiKE++sC5fU93RPjqVJ35bX2iEZ1WseDv5mLJNPan1lOmiP6nzITWTqGhVGDovxtIk8OH8XvdPGFl4PVBZDon72wIIYI2JLyMxXTNctfM3RFtdTU3JSmhQYZyHvWEszIXFikni+Aisk5NnYtNJc+lFgAUxyosalTYxcviu0cLpRd9pFipfPnlIcCLj9UfcG+mDnX+5cSOGlGljZ7SRJg/iomLvXDWyKwBO74EI47uwaW1J9WpGHM9MESLd7PFXAJK/SviRLfifXdcXmVeIoNzqLHiO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVDUXe1r+UqU3Zlb+VvNvXdDPDBksq0nIHvBdfTm0F4=;
 b=TKvUicfcxvqFuYAJAGh6dPblwuyWIOw0t0vdz2ATUOwpRgxqINZQkFu3xDQXxZjiez8CrBgieXdywIT63qD/0y6d6jq2lgDyRo0C8r71g1jouppGHv+O2SLShYqzNKFb2bkDJ1pbzR5E1vf8VJA1IJ8Syzd86HcxQ44h+j5V0iscJVE/xC2wdjwDIP2Rbu4Nl4K+q3BrvVWScTARTCjQwfMn0r4pMF8LrhHJd6xVXaIJ+a40YC+f1xr36pGYcX5ECpIolBDH/Ly6QXhjFyi6LSESp2c7a8kIobLcP9XJEvVi45PgROX3C64geihpK4UkEsZa3IUm7lmknBQE7FZ6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVDUXe1r+UqU3Zlb+VvNvXdDPDBksq0nIHvBdfTm0F4=;
 b=Rgsybo1b9ie0QC1kEWm04iFfP+KzjzKX6OqDvXKaOFgYgshxzhp2nyxBkHnRRFa350fi8R0yhURHETofSppG63m3E9vi3gyemDruKmT+JVBNbd5eBVOHSQ4+g/3RhyqZvyhxAUkt9hTNQq/K95lSZUP220Y0uW7YWP8SEGN5Bue+J36PSQWD91Zyolegm4wNNfBUfrJkA5DFOsYoHX5f7vrZtJJ7iih28041fIxDWCoWp9LNZ6OuznwZ9qiR1mBKeI1bbZMCdpA6Ska9jjiyuvGQtyCIsJR4TB2vEO40HNOaSmcvsiNbTj2/TyneIsczWVCEGZ86kHWrCcVw7R4gcQ==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8832.eurprd04.prod.outlook.com (2603:10a6:102:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 08:19:35 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:19:35 +0000
From: Joy Zou <joy.zou@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "joao.goncalves@toradex.com" <joao.goncalves@toradex.com>, "marex@denx.de"
	<marex@denx.de>, "hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
	"hiago.franco@toradex.com" <hiago.franco@toradex.com>, Peng Fan
	<peng.fan@nxp.com>, "frieder.schrempf@kontron.de"
	<frieder.schrempf@kontron.de>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "m.othacehe@gmail.com"
	<m.othacehe@gmail.com>, "mwalle@kernel.org" <mwalle@kernel.org>,
	"Max.Merchel@ew.tq-group.com" <Max.Merchel@ew.tq-group.com>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "arnd@arndb.de"
	<arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jacky Bai <ping.bai@nxp.com>, Ye Li
	<ye.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Frank Li
	<frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4 1/5] dt-bindings: arm: fsl: Add i.MX91 11x11
 evk board
Thread-Topic: [EXT] Re: [PATCH v4 1/5] dt-bindings: arm: fsl: Add i.MX91 11x11
 evk board
Thread-Index: AQHba9fixiRU9hGtWkKMDCh7La/gT7Mg2z0AgAAG17A=
Date: Tue, 21 Jan 2025 08:19:35 +0000
Message-ID:
 <AS4PR04MB93863EEB3D94DE0EFDD88255E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-2-joy.zou@nxp.com>
 <6693f1ac-6390-4e87-a0db-6fcb60242230@kernel.org>
In-Reply-To: <6693f1ac-6390-4e87-a0db-6fcb60242230@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|PAXPR04MB8832:EE_
x-ms-office365-filtering-correlation-id: 8db42b7d-3e7b-4830-eecc-08dd39f45710
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUhMMWdYWjEzRDkxSzRNSU9maVpUbm0xRVpMNjZGNE5QNFNhYmtGQ2JCRlQx?=
 =?utf-8?B?SlpnWUYrelJQODRSYklVM3dhc0I5VjlJcEdwYXpKeXMzbXFGSS9Xcmh1L0Vz?=
 =?utf-8?B?S2hTdWNFdlJPZXd2K3FFUy9BaGYxbEZvRGE1dllkZFBFWnVxSmJObWhWUjV5?=
 =?utf-8?B?V2hWdm1QKzlyYzhFYVJKMG5MUVdZS2F1SVhHcHdWWlNuQWpzd0FsR2JPYXpq?=
 =?utf-8?B?Qit4VjEvY2tkQ0R0UHh4cVVndnVMSlpkR1pSNklRV1U3TjFRcDVYQ1kyRUpo?=
 =?utf-8?B?d3hJbDVBS3A5NmhEM2dXRVo2MGxPT3BVVEpUS0ZTUFpVRXlIVG45Wk01YW4y?=
 =?utf-8?B?aEtvWmw0S2NBbHBzNjU3Y1o5aEFzdEUwalhCQUhSS1U5ck5TV2N1S0FkQVZ5?=
 =?utf-8?B?cWdidzdjbDFlWVdZem9PTEt5Ykh0YTgzQVB2SU8vTzJBeHd2dlhvME1JZmlB?=
 =?utf-8?B?bEVVaFI0cjdhSHM5N2tlU2R4ZjRpa29BWTR1d1ljODZNOWVYd0pUQXVZQ1pz?=
 =?utf-8?B?OGlsVGVwT2kvQXdMVmhxcWw4OGVsdFpzTU9HcTI0WU9RUGVPSVg3cUtLZm9V?=
 =?utf-8?B?dkNRNUlJWi9RMUJIR0NwbktiNUFxb1E2ZTBiZkhqdU9YKzFkaTdxb2tvZGV3?=
 =?utf-8?B?Vy9yaFRPcW5kSFJESGdBcmpoaE95Z0FkMGJxMTJiRkI1UEQ0MkhEMWROQ1F1?=
 =?utf-8?B?RHJPMFRVZDNZSHBxY2hreHRBWWRrdHpTZUhpSGFVYW1zSDBOSUd2UU1ScE9p?=
 =?utf-8?B?dFBOWm1VUzhSTjV6T282QmlOQVFqbGJLUFNOMUxvbHBPbUxYRlZEM0orNVVh?=
 =?utf-8?B?Y1pqL2hERnVuNGdGcE56c1RQcUpvcFV2cU9maWxIK08rRFkvZTFxTUhEdUFW?=
 =?utf-8?B?OFU0emJBUHVLYnNudjdTZytXOUgvTHZYNk5qSTdyU1phWWdWNkRvTjNXK0hP?=
 =?utf-8?B?MlovczJPM2gvdFhYZEF3Zyt1VDc4YzBHd2ZRdUNwQWtESGhZNjFwWkNrb1Vl?=
 =?utf-8?B?b0hYNDRNTWptRzBJdlgxZlg0dDg4cVNKazdOdVRUdUFGd0VqU25yQzQ2NzlK?=
 =?utf-8?B?UUxUYlJJNHM2WXRlaWJLN3JhZWlkNUlrQ2V1TkdBUjkxWm9sZ2tpWnVUYjVx?=
 =?utf-8?B?ZWtpRVpqZmhUVjl5NzZENVFUV2NpUXFyNTFYeHV3djlQcnlucXA1MlNlUGls?=
 =?utf-8?B?M2gzbnpnWHlDQXpTYis1K0pjNm5zUVhwdW9pa3pIV3R1UHpuREdpUDM2QzNk?=
 =?utf-8?B?ZUdiMEdlQ2E5aXNvWWRZMVgzeGE1RHVMeGorZ0l5OUJYYU1vbUM3ZDdicWRh?=
 =?utf-8?B?eHR1TUZvZVk2ZVlvUnU4eUVobTZVeXplV242TDhvWFlxakMyQ2FFWHdncTll?=
 =?utf-8?B?R0lzUGlIbkxzb2twZ2xPQ0xSNTJrRVdaVjNRNlNabWNqdVJBbkN3Y0dzUVNo?=
 =?utf-8?B?cWg5eVpwTG4yRUpITVBZK3JoRHg5UFY0Yi9NRnVXVFg3QmZJUHhmN3ZnbmdL?=
 =?utf-8?B?ZEd3NmtXK21EcHJmVnlySEQ5MVg2NFc3bmxXMkdERmFNR2d2RmtnUVdRQlM3?=
 =?utf-8?B?RHFneUpsR2hKbGlTQldndDRVc0V2R2labXh2UWtqaTFUMkZ1eWZ4eStUa1p0?=
 =?utf-8?B?UW1YdXg3MjhTSmhxeDduUTA1YjJzb0dzako1MkJ6cm5KZjBDdWpmRUVSeW9z?=
 =?utf-8?B?VWlUbnRGZm90all3MnJBZ05hcXpvQ2Q4cnVTeVkrRDRtN2VwMWtYelN6TzEz?=
 =?utf-8?B?RC90K3ZLbG9LTG1XQzdGSUpKOWo1RmthSG5ObUdqMi9aZXNTTFhENk91N1My?=
 =?utf-8?B?Y1V0czFNd2JHUlhTdVpac09uNExUdnAydkRxeEhNUDBaV0hORnVjY0UxUGQr?=
 =?utf-8?B?anZYaGZWemJtV3pxWTV5K3dxVEhsVDljS1VvbGE2WEhlZC9aVzA5Q0J4b01Q?=
 =?utf-8?B?dXpUOFZkZTNzT1N4U0dTeDZjM3hvSm1JcEVqd2xLZUk4cWVwUHZSM2EzTkx5?=
 =?utf-8?B?M1hVaUR5d2JnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzRhQWRsQjNQMnBLNkhEeS8wSXh0ZUhpN20wNW9oN2xCbXVvdnlaN0Nna01Q?=
 =?utf-8?B?MHg4YlFlbkg3Vk1ydVRXTVNqV2orSWNIVHZ0TFVac0hCaXBGemdVcFozc0lJ?=
 =?utf-8?B?cktrZC9UNndCN2MrUVFqaEZrVVdmcGEvUVYwa3l1QlNvQWJWdk9RYnpJK2M4?=
 =?utf-8?B?NGxFcXlaM012UnI3bWx6VFkwbVg2MFBzWmJ1dkpTVTVLTzR2T3ZaMTJMWXpx?=
 =?utf-8?B?SWd1UzBUSytZME4zNzlHYlFWYlJqRjJrNUJBRVprREZENE1UZWxYLzkwTGMw?=
 =?utf-8?B?YlVFRGl1ZzY5M1h0bnErSUJoOEphUEo1enoraDNGQ3M5VGdMWGV3TjZtc2ww?=
 =?utf-8?B?cE1BTXlUWFBEcnZJUDIrV0FnMWx1a2MrNjZZa0MzZFFrTUpQeEovUEwyZW40?=
 =?utf-8?B?bDBvbmltQ01JcUlLak1Nb1lZVXY5aFlnYkxZZUZXVlJRekhJWkVjZkk2Vm1z?=
 =?utf-8?B?eHlXT0hVZm1zZ0c5Szh2a1Q5dXVMTnpwTzFzZ1lGbW1jcW5HbTdtbVRvbU5I?=
 =?utf-8?B?RlRiNDNORHRzV1FScGE5WU0yZ1krWW5DdlhQWXAvQnYvWURTWldsM24ramhK?=
 =?utf-8?B?R2daa0ZGa1hLTWhDTDhTQnFKOGZ5cG91YzM1TThNOHVHemhWQ1BVeUpLNFNN?=
 =?utf-8?B?UGduSzBZamh1WXNab0JyY3lqd3RoL1ZpZmRJSjJZMndNYkFJNHdTWkJEeEd6?=
 =?utf-8?B?TWs5RFVrcHUyVUord3RmUTB6RVpQdWllamw3d3VZa0hFZVdySzFjcVJoQjZ3?=
 =?utf-8?B?UGJBdS9ibEg5UXR0eFlIb0hsTDBvWmp2MXM5NDhhWTBzRVMwdnZkblJhWUNs?=
 =?utf-8?B?WDVJRWQ0UmRqVXFjdlUxMThjcVhCbnFsS25NRFJ1bm5lOFBUQWVyU2RudmpV?=
 =?utf-8?B?OWVtSVV4OHZrcnFPUzV3UU5NVTZOZkZnUVNmVDk2VkRQa1VubllESWpvS2c2?=
 =?utf-8?B?QStoaG5vbXNPM0daWWJ0cjdIVHllemhEUGk1OXZGL1lpMW1pWlBHbWlyY2c5?=
 =?utf-8?B?TEFlQnpNUDhMTWliOGRQbGd1R3YwdEJWSlVqeitsYUppQzFCZlRpMjFteTVa?=
 =?utf-8?B?dWVaRjBIYTVhLzhNNVg4dlBBRnI5OUpBV2VCUjRPcDBEM3Uvekd4TzZ0NGg1?=
 =?utf-8?B?bUVKbGFhTmVibGZxeU5BUkJsU2JIbTQwcEhKNVpoYVZaTEMxQ0t3K21ucytV?=
 =?utf-8?B?T0tQckpRODVtWFRXVEhoKzVma0ovL1ZuU0tXNENaNkxReFNOK2pUOG8xRVJh?=
 =?utf-8?B?aERIeWh6cEsycFFjckZ5Uy96Ym9jTHNveUdYV3J6ckEzWWg0NmtocmZiOHdP?=
 =?utf-8?B?ZS9sb3lkaVVRV0w2WnByNzdCNjZacUlmeU9Ua0w0THgzZHgwQ0ZFSDVqSWJ2?=
 =?utf-8?B?SllGN1dMcWxVYVpvNjc3cUd2RE1zQWpCb0ZiRVQ0RzF6TWsvNHhBd1RjYURm?=
 =?utf-8?B?TEpKekZGWi9PZ01ram8zZUtTTHNpWTVYcFlnUUszRENjZWI3RGtkV0ozOUVN?=
 =?utf-8?B?QTEvQVVKWTkwTmp6T05ORWJPTFg2dU5ML01ZdE1MNDY3aDE4T0EwbnJ3NDQ3?=
 =?utf-8?B?djRJczE2czV1S2dwMlVZcDc4SjRFa01ZZGtHamRtZUh5SXZMR1QvTVVXRnNl?=
 =?utf-8?B?Wmo2SVJhcVhybmFYNEVmbTQ0aHBlY2NIazRPSU44dGhONmN1aTM4K3liMWw4?=
 =?utf-8?B?NVF2enBNRkw0K3VzdWxiSFU4SkZzSjg4Q29HKzFydkVIOFhvSkpOczF4NWYv?=
 =?utf-8?B?dzNUREZRMFI3ZkswRVVTdFEzeWJzdlVlS0M2UEZybHJvVUVlWjY1Y1F5eVFW?=
 =?utf-8?B?Z2UwSkNRNG1ndDFpSlk0Ty9TSnp2ajRZaEhjYW8zVUk3cFlEYVBtNEhwWTJP?=
 =?utf-8?B?R2RRc0xGNTg3d1dmSjRZZ0NUUGNYbXRadHJvQzdqYjBxSm1jVW9kU1lRdk9k?=
 =?utf-8?B?OXhMZ1VHTzRZQWN3ekwyWGdOUVlVUzdwWHEzbnJJWDZUVkhBMjZoOGhCeE9P?=
 =?utf-8?B?T0N4TkJabTFGTDlWclV4M1d2YlZtUjlKNloyS1lEVWlrTkJiTDZEcTV2UERK?=
 =?utf-8?B?RllhTXBLbUFMODJBYU1FYVo5dmlUazgyMFNXRXRNSmlnZ1JkMFVyUm9KckJK?=
 =?utf-8?Q?10Cw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db42b7d-3e7b-4830-eecc-08dd39f45710
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:19:35.1625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4r0pXYAh+QwDjKklek/ZCHqPC+h4oc/ycBO+2ukd85Mt+eoiFgIkSGqKq7Ha1elu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8832

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI15bm0MeaciDIx5pelIDE1OjUzDQo+
IFRvOiBKb3kgWm91IDxqb3kuem91QG54cC5jb20+OyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRA
a2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsg
cy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4gY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdpbGxA
a2VybmVsLm9yZzsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb20N
Cj4gQ2M6IGpvYW8uZ29uY2FsdmVzQHRvcmFkZXguY29tOyBtYXJleEBkZW54LmRlOw0KPiBodmls
bGVuZXV2ZUBkaW1vbm9mZi5jb207IGhpYWdvLmZyYW5jb0B0b3JhZGV4LmNvbTsgUGVuZyBGYW4N
Cj4gPHBlbmcuZmFuQG54cC5jb20+OyBmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU7DQo+IGFs
ZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb207IG0ub3RoYWNlaGVAZ21haWwuY29tOw0KPiBt
d2FsbGVAa2VybmVsLm9yZzsgTWF4Lk1lcmNoZWxAZXcudHEtZ3JvdXAuY29tOw0KPiBxdWljX2Jq
b3JhbmRlQHF1aWNpbmMuY29tOyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsNCj4gZG1pdHJ5LmJh
cnlzaGtvdkBsaW5hcm8ub3JnOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBhcm5kQGFybmRi
LmRlOw0KPiBuZnJhcHJhZG9AY29sbGFib3JhLmNvbTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7
DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgSmFja3kgQmFpIDxwaW5n
LmJhaUBueHAuY29tPjsgWWUgTGkNCj4gPHllLmxpQG54cC5jb20+OyBBaXNoZW5nIERvbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBDYXJs
b3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRD
SCB2NCAxLzVdIGR0LWJpbmRpbmdzOiBhcm06IGZzbDogQWRkIGkuTVg5MSAxMXgxMSBldmsNCj4g
Ym9hcmQNCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0
YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBX
aGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhp
cyBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gT24gMjEvMDEvMjAyNSAwODo0MCwgSm95IFpvdSB3
cm90ZToNCj4gPiBGcm9tOiBQZW5nZmVpIExpIDxwZW5nZmVpLmxpXzFAbnhwLmNvbT4NCj4gPg0K
PiA+IEFkZCB0aGUgYm9hcmQgaW14OTEtMTF4MTEtZXZrIGluIHRoZSBiaW5kaW5nIGRvY3VlbW50
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVuZ2ZlaSBMaSA8cGVuZ2ZlaS5saV8xQG54cC5j
b20+DQo+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+DQo+IA0KPiBZb3VyIFNvQiBpcyBtaXNzaW5nLiBDYXJlZnVsbHkgcmVhZCBzdWJtaXR0aW5n
IHBhdGNoZXMgYmVmb3JlIHBvc3Rpbmcgb3RoZXINCj4gcGVvcGxlJ3Mgd29yay4NCldpbGwgYWRk
IFNpZ25lZC1vZmYtYnkgaW4gbmV4dCBwYXRjaCB2ZXJzaW9uIQ0KVGhhbmtzIQ0KQlINCkpveSBa
b3UNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
