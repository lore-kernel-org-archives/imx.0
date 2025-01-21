Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333B1922F8
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455542; cv=fail; b=j8f43gRW3Twtk+1SeGYFWEiyhmlheMXy/EKUidVQjhhD9odcfn9nx48ttbqNFIWJ6M0GzuVNrmaK1NxuWsQuo1/ac8ovWqUaMs5FN4t1D9pvJfxU+khuYnIkwr41bssAKs7WUHUUA0p5yrfcRDmw+6aQ0JkBbuXF6nTC8uKKSXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455542; c=relaxed/simple;
	bh=cobDxsW7Ne/zh18d2D5107biABLI4IVHTGMmJLcJlN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KPKKqQGGvbkXpowV2JmlAuVDKPeZKtBKJlI3BbHVlcVfKdg0Zth+HOvcltxfJWf0nXMxbjddbJfJFjZKMl8n2IY7Pbk6McA+O/5+9FBwwcvXdkFokqxQaYeOpmt8Uuh1DEne1Tr89kTuSiNu85BmQEzVJmhl4jifJ34h9YYrts4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUKRM70x; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUKRM70x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYlEuzNhQNtGe424NPq1KWO6juXlE7kqEutOkR6q/BCr3I319IH2fZp7LtSrW5CKIfg4rrjWPuqNCykVY3iN/sxkf9qugizt0Ejvzit0ZZ/WC9e8U/Qyvp+8djPH31gk4BSfju/sQDnauTdMyb5vDds6MxhIc7KdoD/IqdaD/AMr+Rkn5F6Q8k8NTb8CudMKS23W+0764U03QoeB+jIFPYaEA2fr1P0n2bIFlbF3nPnqncBRhSYjwPK/SRKoMAHzhzy1uq8T+wxp4FFJFhA++bLJzc45i58U+K0xQecPIbZP7gSJ7+qeKp4yN+rQockudeBkb9CfundS1WzoP9VbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cobDxsW7Ne/zh18d2D5107biABLI4IVHTGMmJLcJlN8=;
 b=iSYLrVNbdxNjSHvtku6vPVPbXDWez1RDyCdRJLNzz//HRn8E7YkCC2WLSwMuYF5CCZWHSpw6HB5Hoj17Mh1BJbyUc1tW7ckYjttrMwwppDVtAfBuXUj5AflU9DmIwnQXbkkGqasHt29OQlOeKiq1XXW6tLe3Xtr2xHGV65w9J4NJwmrDEX8AO9gllk7PTVxo8JUewXQ5mTqTqT0OS4SMUqC05FRWDqvtY8tAr/+VjxJeDn8vmKV1qR5Efxb6qtf8v6b4skSMmLsCd+xAJdMmE2hUkcBxTsge6mzN5RDQBOzOTEVidgC2J3uCtsbanGXP80+RDFXFKmM8erNACKvK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cobDxsW7Ne/zh18d2D5107biABLI4IVHTGMmJLcJlN8=;
 b=hUKRM70x7LVIX7wcRe6Jangb1BikAiqvHK/nSJaAN5fyJCa/IER1UMhMTw/SpSJxRwQXZLIV0JIQNAKfF7yx49dzXYP19UxaiQx153pu+OWHbNVFegbTHBccidDSI/jOAfA0DTGDI8J6YO+MHQpJEXW2U+T4ECELfbkGAe4c0DRxkaP5jdlMUIbX2hgSvva5Sh3WshZ72luRbaMw03DJaAmGp9VYwK1HX+Jb5g34rbUBqzDUs9xMhw34PxfxY6znhP7DtCtB0+H2YJkBbvR/PNv8P5PuYmCRze8/32Rzcs6cp8xYcu1psxU2T5IQFyTP75HhbBFDPlAVSeyUHquS9w==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 10:32:16 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 10:32:16 +0000
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
Subject: RE: [EXT] Re: [PATCH v4 4/5] arm64: defconfig: enable i.MX91 pinctrl
Thread-Topic: [EXT] Re: [PATCH v4 4/5] arm64: defconfig: enable i.MX91 pinctrl
Thread-Index: AQHba9f1n/Et/LFwv0uwTjk7cy1GWrMg2p8AgAAsu9A=
Date: Tue, 21 Jan 2025 10:32:16 +0000
Message-ID:
 <AS4PR04MB938605E7CF77BCADA46A412DE1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-5-joy.zou@nxp.com>
 <7344eda0-a217-46d9-9006-5be1e50c98f0@kernel.org>
In-Reply-To: <7344eda0-a217-46d9-9006-5be1e50c98f0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|VE1PR04MB7280:EE_
x-ms-office365-filtering-correlation-id: 541771a4-5692-4744-d7d2-08dd3a06e036
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?T3NLMi9ReGM4cjVLb0pNWGhocFNUTVFFTkdmWHh5MUhPVkV2N0g5SmVNWXB5?=
 =?utf-8?B?ZUg2Ym5YWTBxU1YzR0E5TEtQV2FvdGJMaFRKMk1XRU9TMlRuei9JbnIyNndl?=
 =?utf-8?B?MEZpZmFqL0lpdmc3UVpxeGRZRUo3TVRVdnFQSlIzRjBOR0FYd09MbEpYRHdL?=
 =?utf-8?B?NlhwNCtxVzZLY3VQWTc1QWhHdEN0RTB3YmFOS3djaXZSTklNWk9DaTVWRWRv?=
 =?utf-8?B?YjlvbVBlM01VdkUzRHpBRFlZcStONFY2dTJ5bXBJRmF2SVZ0dmpjamc3bSs3?=
 =?utf-8?B?Um5iV00zams3UFRRaUR1bndPODl5aXFvNDRGTDlERERFUjY1cW9qYmtQKzY3?=
 =?utf-8?B?bHc3a2dWUndZcFR6dlBGTzhMdm9scU9lSldTOUNHVFl5TE1sakV1dWdlNXRi?=
 =?utf-8?B?MSttK250ZlpPbHV5R1BhaSs3NFlURjdhZHhTcVJRTWJvMzlVNUlSZHhnaHVq?=
 =?utf-8?B?dDRGNWFDcHBnM1IvNEs3MG04S0FoTi9XeStRTXoyNDZaY0dDellRZEpvbEt0?=
 =?utf-8?B?Y2xnS1QxRkExZzhWbXZlZXBZdnRvY0Irb1FZRzU2YUkzZUtiNlZyOGltM3J5?=
 =?utf-8?B?dmxnS3BFZms2Yi9VUDNwWUp2ZURUZkdYSmlrRHN6TGs1V2NDR09ZaFZrK1Ni?=
 =?utf-8?B?TTNTOWRhaHhsUlVtMGdwdFNoUU5ZK0FGMzlxVEp6dklJdjQzK1FDRDhVVkpZ?=
 =?utf-8?B?NXh3L1RRdUttT0tDMDFET29tRTNwRzhJUmpTR05LVERpNW9ZcEZzRzROWmg1?=
 =?utf-8?B?SEpJWjE4dmN0WjlmQ0dXRGkvZlVoOElIY0pVSUVqcnljdHhhUDBDbWpBMWJS?=
 =?utf-8?B?WmpvVHhpQ0VPT2cxM0NIQXZvU0hLM2x6UnRRSXp1NGhySnNOQ3FQNSs3dnQ5?=
 =?utf-8?B?WUdJTnduc1RYVm5SVU5GdnhFNHFPSWtOMUFvVzFjZnlxbkEvRnJoWVhML3Jr?=
 =?utf-8?B?MEgwWEQ2bVIvd0cveElRWlh1Y0QrMFczM2dUUzdKdThIZWY4Z3hwejZHRW9p?=
 =?utf-8?B?YTg3VGpNdGR3Z0ZoVkZadFBFVEtnck5scDJGdnc5NUs3czVxT1IxZjJRN0sv?=
 =?utf-8?B?THIrVVNpMk5NY0RUMks2cVdHYkNPdHI3L3FzTjcweDNBMEQwa1JBbVZOU1hj?=
 =?utf-8?B?NTRuQkNQcm5sUXJMUThjTTNYeEJaQUc1OUdOV3FuYnRHNnJMUFh5VXp4anh2?=
 =?utf-8?B?YUUrVytDU1pGL3BJSjJma0pBaEFPMThlUmh5aXN5c1VlU2Jlc1BuYjRVeEhx?=
 =?utf-8?B?S1F0aWZUSHI4UEh2VkxKbkF5RmFsNm02bElNZ3RlWXliYUJ4VzlXT1gzVmlq?=
 =?utf-8?B?THZmckw1VHNrQ1MwV0duTmVicnFzZm1tUnAyWmNJNzEzVnREQkFUSTV2bUFH?=
 =?utf-8?B?MDZNbURXdnJleDNMZ2I4QVkrTG5aZG1ZakdYMmE1UGkzVVhYYmJOUGNybDFD?=
 =?utf-8?B?MDJXa2o1dWRmVE9oQjM3OGZKVisrTEc1WTJ4ZkZwdml4TmRmcW5RWkdWNzZL?=
 =?utf-8?B?anVUVG15V2pramFlV21odi82Z2JrcUdScFFmem84TDNaMWhxT0s4NEtjNDFk?=
 =?utf-8?B?WDNQdzRuaTN2WHN0alVMdVpjbVV1T21QVWxmNmxFdnEzcU9NakFZVDdyWUNL?=
 =?utf-8?B?eWNwOFFZTGV6dGVCYnlIYWJDSm5Oc3ZtbkhHdHJ3UHVqeFJTc3hKVDd1UjVD?=
 =?utf-8?B?NGM0bkUzeGhtT3UzTXRTQ0NJaHBFZTdhUjdlTHlEWjljNmFDQ290OFNpV2ZB?=
 =?utf-8?B?QzN3dS9pRUdsdGViU1NlYjhTWXQvQmN4dG95UUpzRGpSV0NqOHl6NnNKeGxC?=
 =?utf-8?B?TzVFSlVRV1kzb0VWOWNDMm9tL3JqOWFXQ3RPK1hrcENOTFRkTExuMmZrV2lw?=
 =?utf-8?B?SEtpeW14N1BPaVdmcXp0aHFmSDN2Ky9rRnlqdWx0aE9rSWhsUW9jUE1KTjNG?=
 =?utf-8?B?RUFFSDRicEhIZXJUSlVQdXVUdGJVRG5qTnU0NDgwR1ZJNmlIV1IyeU54elpw?=
 =?utf-8?B?V3dwZEEwaE93PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEF1K2NxSlMycXlEY0FCVDB6K3hKVXBHN0dRQnFuWkVUN1ZGZm1FK2RGZmZ3?=
 =?utf-8?B?cXpWUHdUeTNPeHQ5ejNJSHRwQlJLYjRPakhuOWhlWU1vdnpaMll4a2hYM0tm?=
 =?utf-8?B?VU1LVGxyNGxWcmhCeTBGUE9WdWFTamhNNnBNL2drNk9wQUlmSzV4WmxydW9M?=
 =?utf-8?B?NVRkRFUwNTcxRXY1c1BIL01TejlkQ1ppMVRzTVQ0K0xyVUhsbno5OUZmZDRR?=
 =?utf-8?B?ZG5nZWNBYlRYZmJuZDA1b1M1Vm9ZM29EdzhWd2xXUy9NbGdDU1Rlak81bEp2?=
 =?utf-8?B?OGlUZzJDZzZ0VllRdlg5Uld2YVFiRnRsWnlGKzZ5UE5MMUZMQ1pBT0hiQ2Zy?=
 =?utf-8?B?SkhtZkNybE13T2JlWEhENTRqYXFCMmozaU0ycHZQR3JKQ0REZy9CQURkS3F3?=
 =?utf-8?B?czRnWEhrTWVyeWU0Qm9uRmdmMllXVk9aaDRVcVlsb0o0am1XM1NzZkQ5UU81?=
 =?utf-8?B?SU93M3RYZ0kvZ3ozc1F1Qkp1Qmd5WkNuNjQreHBZbU9aTUlDNFFhc2w5MW1t?=
 =?utf-8?B?ZkdKRFBXSTBleGpLQTQxM0dUZ0ZCbVhsazdxQmthV1pScGlyaTJaU0kyMmxI?=
 =?utf-8?B?NU9vcXRKYWc3elZoTU9uRkZrUnpZcysxTTZNdTVHdU1xbkMrL0JKT09QVXY5?=
 =?utf-8?B?c3R2REZJTXU5citxRFBGNFFBWkQrTlNCK2FLSUNvRjZLc3lPZWtJajNsZExO?=
 =?utf-8?B?WEdGVERCbkNJWGE0bzk0aXNjTmlYRXFPdE5qbEI2ZE5NY0M3SjNGZ1FjKyt2?=
 =?utf-8?B?SFA0SVViRmlSQ3RYNUJucm5qSkFRNFR3VW9XTW44SnZ6V2xsZjl0NElaMU4r?=
 =?utf-8?B?eDI2RmZTWFJ5amtlSndTTk03N3dlZ01WcTMveTdPcStGcUw1b1pQZVRTWWVY?=
 =?utf-8?B?bVBMZHhUTThxZEVlaUpnM2NKeXFXZEp0aG1LU0xsWk41cXEySnhXMksxeXdk?=
 =?utf-8?B?L3JkeXNvNmdLOTdZdGpnNmp0dnBsNHZ5Z25MeXZKUlIxVWlzVVMwSCttdmk5?=
 =?utf-8?B?NXpBcGFITXE3ZUprdzFIT3pETlRUNDdvb0FkWjc3L2swSUpiQUpBdW5TWVhx?=
 =?utf-8?B?Y3pEZjlEWlBJY2xlODNXTmxiSnBtOENURHJhK2cxYTVXVGRlZXd4ZXZWRGZJ?=
 =?utf-8?B?YUlEMTJwclhBUGRIRDlDYVY5N2I2UTFFYnJ5dkY3TWZUQUMveE5jbkd6NSsy?=
 =?utf-8?B?bnVKZEE1a3F5bGk3OFhkSHhORlVnSVV4Q3lONnZxdFR6NDVSUEhzeW93bDFq?=
 =?utf-8?B?MGRrZ2dNUWd6SVJOVzdXbHBwZUNveCs1emIxY3ZROXJQL0hwa25MTjhENmNS?=
 =?utf-8?B?dU1GbmJ6U0Q2UUxQYlE0NW4vQW4zS05OdDkvbnFhY3VrU2lCRStUUmsrMmJy?=
 =?utf-8?B?M0d6ZTdRMlM3Rk9LT3Y5R1dSOGNJSG1KTy9RclM5bTdmUW42U3pyeUpwWW15?=
 =?utf-8?B?S1BLUmEzRW02WmF4NGJwOUlHcVFHRmR6dFFCOTUwMzRTV0lFUmZ0SEc2VElV?=
 =?utf-8?B?ZkJNNDYzV1dLYWFmKy9JTjdTdVRFZzlVTnBVSnpZV0pvR1I0S1BnSFpEV2dp?=
 =?utf-8?B?b1dOU1ZWdHpjZUhKTXJyMFFZd0RtbXBqNlNXOHg2dlVsWjNzNkJ6OHJGK0ox?=
 =?utf-8?B?d282VG1SODVyM2tnK3E0T1pOTTRaOXp3Q1RqaWI3NVVqRXlwSklwS04rZFl2?=
 =?utf-8?B?YnBLN3AxNU9sNzV1QlhkcVY1bU1xWmlWOENyTFl2clNyVCtTcVBlL0lSaFJN?=
 =?utf-8?B?YUNSbXVPYVhtZUNkUGFTSHVoTjdrSTdTekFxK3haQjdMSDJaa08yWWpVa1gy?=
 =?utf-8?B?cVVFWFVxMytDL2pRYytIMlpkUVVMY2RDSUdKbHZDVUpxZnJkYWdLS2pWNnBs?=
 =?utf-8?B?NUJZVzNXZUJHWXhNZ1lodmI5V2doMytPNkhGa3pEeXRVQktUaFY3aS9aM0dy?=
 =?utf-8?B?ZUFHL1lJeldtMFQzSVpnT3RxM2NYMkErWGhWN2dlRjM1Mjl5UGVOaytsTFFC?=
 =?utf-8?B?QTIxRklXZ01mcUVEZ2wyMFJWQXdYemdmM2VNdzBmZUxYd29HQWNiUmpVSVVK?=
 =?utf-8?B?NE42SnlROGNPd09iZjhISDl3eHZZTVQxalVOSXp2ak03VUZ2R1hENmpGUEtD?=
 =?utf-8?Q?3rUY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 541771a4-5692-4744-d7d2-08dd3a06e036
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 10:32:16.2108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojqwY6kHiNZxh5Cyk6i0M4Jzht8Dm2Tu/ojRvNFbuWMxui06Y1K1DHdgZkwgybKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjXlubQx5pyIMjHml6UgMTU6NTEN
Cj4gVG86IEpveSBab3UgPGpveS56b3VAbnhwLmNvbT47IHJvYmhAa2VybmVsLm9yZzsga3J6aytk
dEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3Jn
OyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0KPiBjYXRhbGluLm1hcmluYXNAYXJtLmNvbTsgd2ls
bEBrZXJuZWwub3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNv
bQ0KPiBDYzogam9hby5nb25jYWx2ZXNAdG9yYWRleC5jb207IG1hcmV4QGRlbnguZGU7DQo+IGh2
aWxsZW5ldXZlQGRpbW9ub2ZmLmNvbTsgaGlhZ28uZnJhbmNvQHRvcmFkZXguY29tOyBQZW5nIEZh
bg0KPiA8cGVuZy5mYW5AbnhwLmNvbT47IGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZTsNCj4g
YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbTsgbS5vdGhhY2VoZUBnbWFpbC5jb207DQo+
IG13YWxsZUBrZXJuZWwub3JnOyBNYXguTWVyY2hlbEBldy50cS1ncm91cC5jb207DQo+IHF1aWNf
YmpvcmFuZGVAcXVpY2luYy5jb207IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOw0KPiBkbWl0cnku
YmFyeXNoa292QGxpbmFyby5vcmc7IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IGFybmRAYXJu
ZGIuZGU7DQo+IG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tOyBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRl
djsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBKYWNreSBCYWkgPHBp
bmcuYmFpQG54cC5jb20+OyBZZSBMaQ0KPiA8eWUubGlAbnhwLmNvbT47IEFpc2hlbmcgRG9uZyA8
YWlzaGVuZy5kb25nQG54cC5jb20+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhwLmNvbT47IENh
cmxvcyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BB
VENIIHY0IDQvNV0gYXJtNjQ6IGRlZmNvbmZpZzogZW5hYmxlIGkuTVg5MSBwaW5jdHJsDQo+IA0K
PiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdo
ZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3Vi
dCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0DQo+IHRoaXMgZW1haWwnIGJ1
dHRvbg0KPiANCj4gDQo+IE9uIDIxLzAxLzIwMjUgMDg6NDAsIEpveSBab3Ugd3JvdGU6DQo+ID4g
RnJvbTogUGVuZ2ZlaSBMaSA8cGVuZ2ZlaS5saV8xQG54cC5jb20+DQo+ID4NCj4gPiBFbmFibGUg
aS5NWDkxIHBpbmN0cmwgZHJpdmVyIGZvciBib290aW5nIHRoZSBzeXN0ZW0NCj4gDQo+IFRoYXQn
cyByZWFsbHkgcG9vciBjb21taXQgbXNnLiBZb3UgYXJlIGNoYW5naW5nIGNvbW1vbiBkZWZjb25m
aWcsIG5vdCB5b3VyDQo+IG93bi4gQm9vdGluZyBzeXN0ZW0gb2Ygd2hhdCBzb2M/IFdoYXQgcHJv
ZHVjdD8gV2h5IHdvdWxkIHdlIGxpa2UgdG8gaGF2ZQ0KPiBpdCwgaWYgdGhlcmUgaXMgbm8gYm9h
cmQgd2l0aCBpdD8NClRoYW5rcyB5b3VyIGNvbW1lbnRzIQ0KV2lsbCBtb2RpZnkgdGhlIGNvbW1p
dCBtZXNzYWdlIGFjY29yZGluZyB0byB5b3VyIHF1ZXN0aW9uLg0KQlINCkpveSBab3UNCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
