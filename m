Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6371ADFE0
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451329; cv=fail; b=QVaPzQnLWJd4hyxyFZbGLb9moIsNLkDri/1lzWfuqVP6dgMDoY+nFJtyJYkqP8n6ph7nljteaKqvYKKLEykQFK/KTPAhAd6qR2hf9nrFAh6u7PbHNCgE4YwBRho7+WqSietxDrdtNiN47efuxoY/XN6BCgnocws9ifOW6E5jKLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451329; c=relaxed/simple;
	bh=SfnCrNbn8Pp+aGYW4qwv+oLFBRszuX6EBs6sFeUTWvw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EI2JOzJkjvQHqUORyUsR1e/TlXufytdD7W1G4tRiNWpFAf2kYB23t/PyCrL17shAJ52DsfG3Hx6uMKWP6npsfEVEllXvL59weJC6MC6fYJRbhN+2TCwJkfHgdgTEu6V04N8+Fol7etko91Vmjm2OdjZ2BJGtRKjD/QKtngAj55o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jc+EqVJh; arc=fail smtp.client-ip=40.107.162.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jc+EqVJh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5EITNgn9NmXrxz2XpwzaoHr61WI4xNLygMJ+iHhZ1zdp4n8pRK84fQVAMVm+pygz56rPZRgVuUHyT6xBqN3/h3I0c9nCDgyDMmNkwoOe6+Qt1hLeJkQBuf4mUGQJJVoRIgrsnpxSoMn1N51XlwpSWwA89xKNJLDB7ZySad9UVu/0ES1Xlurp4YGeCyg1CkGI1Nj0sBvMXrLDGqGACvN+75mmRNv17hXltaYQ+KCc++pw00RiKShhPAxORPFW4H9p/AjvaCo0Fb/JDizZ/K4WxThXhIDBtgUAHM60MtMw5WRpiVeG+lVBIz2jG8GYq+pSJVrgQwJ4Zz489Ww76GHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfnCrNbn8Pp+aGYW4qwv+oLFBRszuX6EBs6sFeUTWvw=;
 b=ZYo2rh4F5eqaK31hd5n20l3+rxUjmrF67ss+TG9QkLtzCb90K8jWPyVmL9QlLYlji/kzEBjTJ0h/uQ2Sa2/EsNpFC+0M/cXnpqoTVl2Rzo+RyvoVrr31wteKAahQq08yCt2TI40uvpjBo4qAnNXImwrxj+bv1Xn0AX39WN37TitUrV5V+Pr0Hnbu7uloSySAHo4Ib91RVIYyLgbicjVNsIhznI+EvLjatS93BunUJL2eCXUphRkszKhOR9u81MqixPDYrVRc3KDtsTdR6Lf/zjX/v/Nj0O97GrwAwXPecnpsWTMueJGQCikVnGdNgPLJZKKJKeJmn/hAYNC585CguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfnCrNbn8Pp+aGYW4qwv+oLFBRszuX6EBs6sFeUTWvw=;
 b=Jc+EqVJh6h/w8QbZOZscXqmhi50QkXnRXKC+57g94yjic+40H3/s297T2eblkzm/aZkziKj7hWmxfvd82ECHcNfXau+SoP/KL35habFWofibcO730kbbNZnvCY/nLC5vtmRjBEtYcEuHTOquIM/Ra14O7WnhZESEVd2ff2wdndydBZsjWaMp4kxVMYQWl5UlamoH5jfZlyWT2nZKJKSQALDwqlFcdRUkfdizLq03FReL8WJZAvFGoNssIs9nYvDBx5S1o9l28KlvyNkGPmvdpae+h2D2EZ/oOvMH/tqTzI2tbIOSn7u68+uFagdwVHlgfIN6CBzWKYGoumVgYPu6iA==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DB9PR04MB8479.eurprd04.prod.outlook.com (2603:10a6:10:2c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 09:22:03 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 09:22:03 +0000
From: Joy Zou <joy.zou@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "joao.goncalves@toradex.com"
	<joao.goncalves@toradex.com>, "marex@denx.de" <marex@denx.de>,
	"hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
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
Subject: RE: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Thread-Topic: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Thread-Index: AQHba9f8KK+k6aGIQ0eDPMEoYMk64LMg2kiAgAAIyZCAAAwngIAAAyNA
Date: Tue, 21 Jan 2025 09:22:02 +0000
Message-ID:
 <AS4PR04MB9386C4E4F419ED638AE12051E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-6-joy.zou@nxp.com>
 <870da365-bb18-47a7-ab78-62ce8a663559@kernel.org>
 <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
 <20250121-belligerent-elephant-of-courage-ed8caa@krzk-bin>
In-Reply-To: <20250121-belligerent-elephant-of-courage-ed8caa@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|DB9PR04MB8479:EE_
x-ms-office365-filtering-correlation-id: 83e15d86-d8bf-4be8-9868-08dd39fd10ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGVKdjIxNjNzOExpZi9NWk1EOW95TnQ1Z2x5M0dpUEtRNkJFbEVGTVp3RnM4?=
 =?utf-8?B?YURYY2x4dENHS0h4WnRYUW9GelRPc2FZelluUHYwdVZLSlJ4K21WSjhnb2Vs?=
 =?utf-8?B?dkdncnZFQ0ZJUFRuRkJvb1h5S0dUNWl2RFpLN29rR3NpRGRoVTRDMVB2M29J?=
 =?utf-8?B?bXJ5VDRvQ3ZpMWhuV3VuMHJ3eU9PbnpoTWlwSG13S1dXSThJTGJsb0tHeEZX?=
 =?utf-8?B?NC9SVWJXRE1Ecm9FQ3hVcTUvZm9RZHg3V1N0dUczMCtGNDRPVUxhMmt5UFlS?=
 =?utf-8?B?cGhWS1BIZThBRkorc2R2dVRmVzFJWHhHNmppQUlDNlBEUFVMRko2Rld3Rk1a?=
 =?utf-8?B?dzhxVXJvVWxJeTkwUTh2R1dzWmZkeGtuSUdVZlFxWFZ0S1NlLzRpckFZQ3RH?=
 =?utf-8?B?QkI1dG9oSGhVL29mdHdCa2xMbVdSVnI1eWFxN083d2ZSWnArb254L3dOZXY5?=
 =?utf-8?B?ZmpYQWh2QXBhTHJ6bnREZDJZSlNRUXJhTi8zK1FwcmxRV1dRa0dscnZWVEpB?=
 =?utf-8?B?ZHBkamcwTkk0b29Cb2pNY3ljbnNMY212aFV2S3V1QWZnNm42Z3dKalhUMzRz?=
 =?utf-8?B?N2ErSGwxNGpQYzRqUlFWemlWQzZoMTc1eVJpWFhHVzVJTVR1UUVlcmM3cXQy?=
 =?utf-8?B?ejkvTU9RSnBLcFR1RmU2Sm05SWdFUGtFY2RlNXZNdVJXK29SV21ITDhjRHZv?=
 =?utf-8?B?ZmRxZENqNXJXa3ZVdlh5VFVLSTlsdnZBSzlRU2psbXZPa0hQSTZqSjZ2bjdO?=
 =?utf-8?B?K2dtaG02M1ZVeFZacmxxcDI4S05BWlAzdHFscXo1bEIvVW1wR3l0akZ1NDlC?=
 =?utf-8?B?ZnNFRGJkUVIxR2J1Q0dib2MvYnhvNEZENWVxVTRZVUhPclpMczdYd1d6REE4?=
 =?utf-8?B?ZEdTVnNPRmNtNG9ZN1hHSWkvNW5iejQrZWtHd0JoeUVKSURwREJORUFJNEc1?=
 =?utf-8?B?TFJybWlXc2xFL0dLZm9hUW54K0RwV04wUXFkUi84OWxGMzJFZ3dZbHFyVzVp?=
 =?utf-8?B?UzRWYnN5Z3B5aHZZMVRWTmo4aFRpYUE5YWZRZ3RCeWJjSFF2ZDRjQXZNRHNX?=
 =?utf-8?B?b0djYzNMSEVlQ1ZUcEUrMTBuUXF0YWFBcXVKMGYySXRORDZTaDZHT1ByQlhh?=
 =?utf-8?B?aHlSa2JUSEl3QU5PSk05SXdETXlrWmlIQnFtYktwYk5lbldtUWo3K21VR3lQ?=
 =?utf-8?B?VVhmTFdsdXdFYjdqYTgxL3ZPSWREeExSaXdkZHh4Q1JQcHhLamM1WEg1Y2hY?=
 =?utf-8?B?VCtsdU8vdXVQS0VEMFVqSTZkeWMxbVUvZUdnL3NXTWZZWCtoZE54L21KK3lB?=
 =?utf-8?B?N1VpVlZwcVRiME16M1hBUnJpUXpWZjhkQ21sMWVZVzMvK3pQaFdkZWpaYWF6?=
 =?utf-8?B?UzJLQzBSMGtDdzRMVXVleDJtZGlWNHdoeHdFcXltM1orcXJ3engwSGkwTXVw?=
 =?utf-8?B?cW02ZFB1Y0tJaW45NVAxSHJMQ0cvbXU2MGxyckxPMk1VdEF1bzFETjJzVmxk?=
 =?utf-8?B?YTIvZ3NENkFxN01BQStGRkZ1UzArOVJjbjJxaTBIOHFZMlpDM2hzcnErYWtF?=
 =?utf-8?B?Ym9rUXNzd0drcXN4dFR5em8vVTZNSDdjNVZRUHRSM3ZFWC83Qk5HUXgwVlZx?=
 =?utf-8?B?enBxNkhWc1pXd1BNQldERXBkK2lHc1RQNTlLMUNUN2dGVkFmRnFNelBDeVJv?=
 =?utf-8?B?Wlh6MUMxVy96ZHI5aFpDTW5hamxRVUYvVHN0MzVnc21oeWdyRUdRZ0VvRVov?=
 =?utf-8?B?UElNeWlTelh5MUJwd0QwTG9uQUV5WmoyQ0FMNTJST2RUVnpJUERsMkVGRVlr?=
 =?utf-8?B?MUR3V0hsRzdDelFsT0VRV3hRdEs1YVg2bk8wNkZ5Q2tkbHBQQkM3L2hTSGY3?=
 =?utf-8?B?c2N0LzU5TmFlS3l1aktjRDVyY2VSTmJ4bGdoNjNSc3VwYlI0UE40c21NVnZP?=
 =?utf-8?Q?5nMgALAMO6hRYqvyQpkGBHc+3kj9frNH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0JUWkM2OHpnblhvdTNxQnlNWTJsakFRRjgzOXg3Zk9mMkUySUJ3WE1kdUhO?=
 =?utf-8?B?c2pNRkg3aVA1ckY4cjZsSjdRZ2R6THdMU3JTMXEyays0KzlnakoydzdyZ1Bx?=
 =?utf-8?B?NWcxdHpyd3hvOHU3RnRWMXlFeFNhanA2NVphSDlpZHUwRTAzNmlFbHUwZEVv?=
 =?utf-8?B?OGppenFLRGJjZzFZdVoxVzhBdUlGU3AraGl1QThIemxXNzBNeDF5c0JsajJZ?=
 =?utf-8?B?Sk5rVFlqSGw3UUR6Y1Z2d09FZW9lU1FKQ2xuK0tRbFdrRWFxZDUwb3QvdS8z?=
 =?utf-8?B?M2wyS09yUGFDbmYyZ25qbGNpc253ZUdhV1RXbmxYUzdQZWJoVklSdVNBalBM?=
 =?utf-8?B?VFlYVnBGVU42UGtBTG9CL0U4L1N2RHFDRElScUp3Uy92VFpQaHNRajN3SGx6?=
 =?utf-8?B?dkN1aGRMSnlNVTRMWmcxZk1ZeEp5MlFTSnVhU2xJRUlrYTJwMDg4SjVkMW16?=
 =?utf-8?B?cWZ6Ykl6dTUycmRKOUN4T3ZyT2duU2VWWE1rMmFrNUNQaks5KzgyNGJERzAv?=
 =?utf-8?B?Y2p1c0JOUEVNczkwNVRiZmplR0ZWdVQwWkg2U0NDelBTbzZuWGVsWkhOM09z?=
 =?utf-8?B?Uy9RckVoNWxwVS84eWtrdXVGSVd6RXd6amgrV1VaTmRFYUR6bEthQ05IV1lv?=
 =?utf-8?B?ZUNVL2FhTDEya3pTTjdqeEhGTUhPbDI2MmhtYmJORG5wYmx1RUE5V01BT1Jy?=
 =?utf-8?B?TUlSVDFoblgrT0sra2RqU09qSnNOc2VzbmJPQUIxWkVDUTJheFBKNmdTWmMr?=
 =?utf-8?B?bjVuQWZrTXE2NFpFNFgyVy9TSGhKcWZlWHpTSCsrKzFXbkVtZEFFa2tTNEll?=
 =?utf-8?B?OS9YY0UySzR4Q2pTd0l4TndrTk5zZmY2SkF3a1h4MXJwcUxsRXBnN0tESmJW?=
 =?utf-8?B?U2NLbktDaHRFQW1nOXc0VjVRNDdBYkY0TDlKVml0Qzh4SmtYZ3JHRlhEMjNG?=
 =?utf-8?B?K1EwdVVyQW9HSmRySWp4WWdaTzRGQUluNEpYV0dTcG1WekNDam9FMko5OSsw?=
 =?utf-8?B?QnBxTjBXeitXZnVzd1ZraWwrWXBFYUwvVjJ6MEtOYXVVaVVYNElNTDRGc1h1?=
 =?utf-8?B?Wk9rVWUrTnBRUWF4RVNZaUxOTG5YREN4ZkFSbllqeW1Fa05aTkdJYkRrUEZS?=
 =?utf-8?B?YnNDZkpjOVlzWUw4M3A1YXpDSFdxL0RZaFE1akFSTWlOSEg4aFNmYy9kaWcx?=
 =?utf-8?B?QVA4SDVlV0UwcFlPNDBqWXowMytrZzd4M2lCREdUMzN1OFVIUkIraEJBUEg0?=
 =?utf-8?B?WlpBSmdXZGdxc29Kb1oxRXVCOTdJL3ZBSnJQSFQ0cGV3WHYxUDRFVm4zdGNI?=
 =?utf-8?B?SHdpbThaQkM4Nk9tZlBBd2xkSDF0bGJyZW1JUHdpSXNNYWt3ZFlvLzNaNE1U?=
 =?utf-8?B?STFQTWNscnJDUGExa2JEUk5JV3Z2Tndkd1lQTTNiWm9tQXQvTDVNS0hrekJ6?=
 =?utf-8?B?eHI2Nk5vNWxPUXJvWHFYc0VlOHhuaXZLSnlJNy95SjZrbzNvM3ZSTWlNd2JN?=
 =?utf-8?B?UmJNODdSYmlldk5SVGpGZXMzcmhUaG5ydUxnMXVjeGRmbzhyUFdVdTRQRkl2?=
 =?utf-8?B?UFVhdWRqc01PeDB4QUFGcFh5N09RT0daUDVZL0pEQ3lzZ0RSeTdSM1h4OHV0?=
 =?utf-8?B?b24xNnUxN20xS2FPaWtaS0VrQ2pjbzlSZXlUSzFUZzFTSi9RSDdWTWtPRU9P?=
 =?utf-8?B?Q0taMkorVkhhZHB5dnJrK0RZRGxHL3kzSlgxY2xiUkdYbERRVUNjK1pORmsz?=
 =?utf-8?B?OCt2UEpVN1R3MlRpK1d4TFQ2bnBLeGZsa05PdnlCeHRvclRFWWRwT0F0Mmw1?=
 =?utf-8?B?ZG5sVWVoOVI1S0Nnd0hyVUtIUHVBLzVtRXd3S2Z3V1hacUxZZ2JTaExpUGhm?=
 =?utf-8?B?MXFSamh6ZFhydlZLRUVvRUhjLzZXZXl5ajRnelA2QUFsUE5RbjdieWFGa2Jq?=
 =?utf-8?B?MlppVDhSZjVidi9RZmJWek0wTzN3RWxiRXBvTWJXcUcyQkVYaDgzWkJrRWRr?=
 =?utf-8?B?Zjg4SjRSWS9WVkloekdOT1A2S2lWSzJZbXBtS2V4ODJlK01lUGhkTEZTY2k0?=
 =?utf-8?B?LzRDamo0Z25LcHMxbDRPSm54NUtuL2NDK0p1eXluNld2QVU1cXlhTURzZjdU?=
 =?utf-8?Q?xSkY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e15d86-d8bf-4be8-9868-08dd39fd10ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 09:22:02.9585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1Q+2m9IQb3X92M/VCY7nAzu+0U7+wygJC61XvQhquH5P9b0wHNxP3sdiLd1aYG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8479

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI15bm0MeaciDIx5pelIDE3OjA0DQo+
IFRvOiBKb3kgWm91IDxqb3kuem91QG54cC5jb20+DQo+IENjOiByb2JoQGtlcm5lbC5vcmc7IGty
emsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207DQo+
IHdpbGxAa2VybmVsLm9yZzsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5j
b207DQo+IGpvYW8uZ29uY2FsdmVzQHRvcmFkZXguY29tOyBtYXJleEBkZW54LmRlOyBodmlsbGVu
ZXV2ZUBkaW1vbm9mZi5jb207DQo+IGhpYWdvLmZyYW5jb0B0b3JhZGV4LmNvbTsgUGVuZyBGYW4g
PHBlbmcuZmFuQG54cC5jb20+Ow0KPiBmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU7IGFsZXhh
bmRlci5zdGVpbkBldy50cS1ncm91cC5jb207DQo+IG0ub3RoYWNlaGVAZ21haWwuY29tOyBtd2Fs
bGVAa2VybmVsLm9yZzsgTWF4Lk1lcmNoZWxAZXcudHEtZ3JvdXAuY29tOw0KPiBxdWljX2Jqb3Jh
bmRlQHF1aWNpbmMuY29tOyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsNCj4gZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBhcm5kQGFybmRiLmRl
Ow0KPiBuZnJhcHJhZG9AY29sbGFib3JhLmNvbTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgSmFja3kgQmFpIDxwaW5nLmJh
aUBueHAuY29tPjsgWWUgTGkNCj4gPHllLmxpQG54cC5jb20+OyBBaXNoZW5nIERvbmcgPGFpc2hl
bmcuZG9uZ0BueHAuY29tPjsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+OyBDYXJsb3Mg
U29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFU
Q0ggdjQgNS81XSBhcm02NDogZHRzOiBpbXg5MzogQWRkIGxhYmVscyBmb3IgdGhlDQo+IHJlZmVy
ZW5jZXMgZWFzaWVyDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQ
bGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2ht
ZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0
DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0
IDA4OjI1OjUxQU0gKzAwMDAsIEpveSBab3Ugd3JvdGU6DQo+ID4gPiBUSEVSTUFMX05PX0xJTUlU
DQo+ID4gPiA+IFRIRVJNQUxfTk9fTElNSVQ+LCBAQCAtMTMzNCw3ICsxMzM0LDcgQEAgdXNibWlz
YzI6DQo+ID4gPiB1c2JtaXNjQDRjMjAwMjAwIHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICNpbmRleC1jZWxscyA9IDwxPjsNCj4gPiA+ID4gICAgICAgICAgICAgICB9Ow0KPiA+ID4g
Pg0KPiA+ID4gPiAtICAgICAgICAgICAgIGRkci1wbXVANGUzMDBkYzAgew0KPiA+ID4gPiArICAg
ICAgICAgICAgIGRkcl9wbXU6IGRkci1wbXVANGUzMDBkYzAgew0KPiA+ID4NCj4gPiA+IFVzZWxl
c3MgY29tbWl0IC0gdGhlcmUgYXJlIG5vIHVzZXJzLg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21t
ZW50cyENCj4gPiBIYXZlIHVzZWQgdGhlIGxhYmVscyBpbiBpbXg5MS5kdHNpLiBUaGUgaW14OTEu
ZHRzaSBoYXZlIGluY2x1ZGVkIHRoZQ0KPiBpbXg5My5kdHNpLg0KPiANCj4gVGhhdCdzIHBhdGNo
IDUvNSBzbyBJIHNheTogaW1wb3NzaWJsZS4NCj4gDQo+IEVpdGhlciB5b3UgZGlkIG5vdCB1bmRl
cnN0YW5kIHRoZSBjb21taXQgb3IgeW91ciBwYXRjaHNldCBpcyBub24tYmlzZWN0YWJsZSwNCj4g
c28gYW55d2F5IHRoYXQncyB3cm9uZyBvciBmaXggeW91ciBidWlsZHMuDQpUaGFua3MgeW91ciBj
b21tZW50cyENCkkgZ290IGl0LCB0aGUgaW14OTEgZHRzaSBwYXRjaCBkZXBlbmRzIG9uIGlteDkz
IHBhdGNoLCBzbyBuZWVkIGNvbW1pdCBmaXJzdGx5IHRoZSBpbXg5MyBwYXRjaCwNCk90aGVyd2lz
ZSwgd2lsbCBidWlsZCBicmVhay4gV2lsbCBhZGp1c3QgdGhlIHNlcXVlbmNlIGluIG5leHQgcGF0
Y2ggdmVyc2lvbi4NCg0KQlINCkpveSBab3UNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNCg==
