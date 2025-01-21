Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2048.outbound.protection.outlook.com [40.107.241.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91911AFB36
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737447956; cv=fail; b=D3LIihCUnoGF6cKxaFAyKl01KQ+U2PWUh1ifpG7hsfUp8Eh1FBWsT9RKed92p455bZuB8g3gp+2usk/s3xTi7CmgoO0xuI+sywOnSxKbpogSX1iDtx9iPs6w8/2PamzSdrPCyCxH7vcMQ1E1pw67O2RMfPISo8diKcbe+D4xSuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737447956; c=relaxed/simple;
	bh=NQkrxXlhZHo37O6WRxFu510ecTLGdkLZdnPNkRm+Y3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=evBivLap4YyNNjW2vFVG/LijlP+EEtxKQxEi5AGHC2ltNhI2IYJbif6q2hj36xeosDn6RyG0Cc0jRswazz3g4eqKfRP0+3ArF7mvVJ1uwcNIMA3FqGA16lXQOGevIwPXimPCM0M/IsbKGIgcxtu6qq/DBEokgIxEvzhoPDTuQlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D6dNNxCu; arc=fail smtp.client-ip=40.107.241.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D6dNNxCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7t6hUeAvEn59X+5u5ts/9jdNrHv4ef/EgEJowWJ0Arfgrdi0GlK9ZIT2jNKgEG3nH7bVb6Ltf+645LJEqqWRZUVm4j7BfenwyuCGE5b9z4knYTonFE8XCyKEPA/SqozvybG+A65AtMkWcWiq8SaZcD5txGYsGjQCzLmol36BHCV6SBD2+wOQ6Tb0PNcRN2mBe4gRfJ8bVnSKu9ysNw5yg6iyFoDqZbGnuTnQOfp3W+VXI0W/zj5GmCTCGq0vHImt1N++qBSLw+X6U06RWMGR7W+ef0m6i4VaqfpzN+p+3rnjlXeU9XNmGh6TpKQjFiSDa0F5dbW2pxrXPvvE74WMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQkrxXlhZHo37O6WRxFu510ecTLGdkLZdnPNkRm+Y3E=;
 b=GcbW6Sc7plL3SRH1qNIobQkgeUPY3vjJuZfZo4ihcEu/4TgBER/GzNfA9LR9WHt0RbkwURkCZ/It6vlWugIoqUF4fQDFnWj14nI+3EBgSoataPzXF4+Fu9I1nqORD211sgd8pPzTePtBNoEFjbXrFUtvpyrJrwN0mbqMEaOV/tLCGkRIDcvo30dgmlh8tALdF51BU19L/sG7vGHbT/UWQPfeWyEFvaQ0LQ9PuiW3pQltuv0OW80/Y1hSQuQ5iLlgGnIUEUlu93PM8armvWxXu9gy2KUM//eT90F16GFYXVM2Cws8FA0qJUz0tF9Scx6k8JTuBG/aLEA9ob0LdZ52Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQkrxXlhZHo37O6WRxFu510ecTLGdkLZdnPNkRm+Y3E=;
 b=D6dNNxCuOjEhjN0fro2i7Gr4nfZHe1wwdol31vGMuNsSnab4IuNQLT0l3okrz3zHtu68uDdWL0ME7EOXtpS7Ms5eFkyJPBYxZo9JSiQvqrtt5ASZsuK/9p2tO9+TXZLmVItOlvLPkc62HpDBaO1+jdeR3SP1Dv+w0YVGVz3mmT7ARjTQCUKtGdD3q6b4otidnYyEa4XO/7yO3fRIufNTKVCGxvfRieNLY2BUsdDA6YNL8YNnJ2RZfWSRuLlV+q77N7aBIRlTLTblM1PKed8NLkYfOEHZ95TcFT6zZEkkINMdLAbvVE87/U82aqB1eyAy2YQ3NtLyzdemcoZrBJ9J9w==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PA2PR04MB10311.eurprd04.prod.outlook.com (2603:10a6:102:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 08:25:51 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:25:51 +0000
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
Subject: RE: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Thread-Topic: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Thread-Index: AQHba9f8KK+k6aGIQ0eDPMEoYMk64LMg2kiAgAAIyZA=
Date: Tue, 21 Jan 2025 08:25:51 +0000
Message-ID:
 <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-6-joy.zou@nxp.com>
 <870da365-bb18-47a7-ab78-62ce8a663559@kernel.org>
In-Reply-To: <870da365-bb18-47a7-ab78-62ce8a663559@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|PA2PR04MB10311:EE_
x-ms-office365-filtering-correlation-id: 3c73273d-5425-4bef-22d0-08dd39f53747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2RTM0twUytFVDYvY1VaTzg2eHVuT3ZWQUxzU2RzUkc3eW5Tc01Zd0tQSE1r?=
 =?utf-8?B?QWIwdHZWN2E2ZHEyQU5VNGpCbUNsYlAzelZMOExPbS9pSVlhb3M4UWpsUHJ0?=
 =?utf-8?B?RXB4RVJmSkdkVk41ZS8rSzFndjdCcHRaTkR0b2c5T3luWkdRM29lcHNBWXdh?=
 =?utf-8?B?L2w1NVAzZTJsTzYzS1kzZzdVYktEZ3JmMW5Xd3hqQVJsMTFNQis2enlTQWJJ?=
 =?utf-8?B?UW9iWTg2VUt2cFZTbFQ1Wk5HNHdsbTlVM0RBTDJWbVRSVEx4cVhKNUYyY2o3?=
 =?utf-8?B?ZGltdldWVzY4L2tYM1RyUjBMU0wvajBpTkE1c3R4b1NkSkprQ3pIcnBrN0Rx?=
 =?utf-8?B?RmNIc3FTNWRBQjZFTTdEQkYyelFkL2FlTi9tWWg1azVndHg4YjZySzI2OERV?=
 =?utf-8?B?eHNIYjVYNnQyemJvL1IycDVpeUI1QjZLQmFBVXdQSDBTamJBY25TaFhoK09M?=
 =?utf-8?B?Y3V4bzM0OGpIbFBDUXFFcUlhVDlLRE1INHcxci9XU1RmdmNhTFJjbFBnOWEy?=
 =?utf-8?B?cEs0aElGS2dkMFR6SzAxN1hna25wTGZkandQbzMxUzhzdVE0eDcwc2hCV3cx?=
 =?utf-8?B?SVJUM1o3QXg0aEtzUGhsWTJaVnVqZUlqelQ1SDk3cWVoSm4rdFYyd2JMSW05?=
 =?utf-8?B?TmJhTU82RkFHb21ScjE5V0NkVXJFQ1ZreVAzKzdQVGdGS0M3a0lCeXJpclY3?=
 =?utf-8?B?bTR3dlhoelMraCs3WjNvOG5SZE84cGR4eFpDL255a3Y5OFhXeFpBV3V6VGk5?=
 =?utf-8?B?dkRkWGR1bWFUelk5RVB5UFRuRUVHWHU1cnRwcDRrT1RWZ1JPWldEZFNwNDV0?=
 =?utf-8?B?K1p4bFVqYUtpWUppSjVBdTNCcGl3VVZzUkxFWTlOWmFOOUp5and5akNxdDlE?=
 =?utf-8?B?UW5MbTNYek1CdTZpS0UxaXhPZTB4QjdoeG55RHhBRXV2VXNTdlhXZ050QStW?=
 =?utf-8?B?S1V1bS9vOEEwVVh4RWN0R1NIclZJM2piWXRONlpXZjk5RE9XdnVyTEVTZHgx?=
 =?utf-8?B?Y2JYY2JQQk5VSXdhZHU2STVlU1BRTE14WE5UOFZIU2hQSXlGWUpDOHYzWmo4?=
 =?utf-8?B?N3JrNmozQ281TFlNaUdqU0Z3Ujg2U2ZEN2k0N0MxTkVqbGZSV1UyZjBScWNP?=
 =?utf-8?B?V21YanhLbG5yV0pVandwaS8yclB1N3o3bmFGeEVYbSs1THNpSzZ1NDBFRU0y?=
 =?utf-8?B?dnNkcXB4aEtUMU1ySmJleHJFUkZuOEhlNVF6ZWxiK1B3a2lIMjF0SE9FdzJs?=
 =?utf-8?B?dnkwcFNCZlNkUlNVNEVGZ1oxby9XSzRiWnFXWmFVVUVheW5DbDhab3BxdG56?=
 =?utf-8?B?MEdFS3ZhU3VFUUhIdlBkQkFSZVBJK1g5MU9GVGJrWGhON2FmcXNIeUEyU0gx?=
 =?utf-8?B?V01KNTNBTXlTS25KeGdRT3FveGF0a0VTTDlvME5yaVZSMlJPSkc1Q1ZRcEFN?=
 =?utf-8?B?VHpHakYwb0ozZ3F6VmJaRHp6aHJpTkswd2RmVU4vVUgrR1Z1UmFIMFlWYktx?=
 =?utf-8?B?SFZLTjJwVE1XNnlsZSs2ckQ2V0pWNWJrbGdVQ295TmJYT2k3NjFLczYwVzRI?=
 =?utf-8?B?NDNScXJSWTFiR0JDMjE0RDZFbStnSGdzamcvcWtyWXZ1SnUvMElRQVZ3bzBN?=
 =?utf-8?B?K3NOWFRRVytCRHpWT0NiU3dVM0V2SHIxT0wrQmU4Q3BvYnkyM1pCcGZQKzdN?=
 =?utf-8?B?Ukpoc2Y2SGtybElMUHB5Z3pzNG9pQWxnS0Noei9NVE9uclRtRmZIT1liaUhU?=
 =?utf-8?B?emhVZU1GWmU5ekhQVE5URHZnb0s4ckxjd3Q4Y3RmZ1cwcUNneU1yUWVqVHE1?=
 =?utf-8?B?bmV1UTJtdUo1dlpBMHVBODR5WFFrb3g4b2VFMk5BaEFVME43MXYrbHFJM203?=
 =?utf-8?B?R0paSDJqeGZtR1R3TkNkWUZwYmVWalYrcUpVY2lMemRScmFxSk1tWE12TTYv?=
 =?utf-8?B?UXpPcHlqbUV6N2prQ0duSEgwR1ZjUTRoTUIreUF6NmJ1aEY2QVU4ZUY5MEtD?=
 =?utf-8?B?ZjRaTXFGMTJnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmZTYWtjMFY2U00vUi9zTlBDQ1M1dnVsUXpnZHZjaUhIMDMvYnNNSkVIRSs2?=
 =?utf-8?B?MUIxNUtlMUdoQ1FTeGp3c2d5QkJ4Q2pFb2NTeGo0bVFoSFpEdFZXY3BMcGlX?=
 =?utf-8?B?Y1NXb1krVFhvb0pOS2dnZm9HTDlzQ1gwOWJPNW1xTXdVTERycHNvMUMvTjJZ?=
 =?utf-8?B?NUpjNFZPQmJXSUhwYk9XY1M2elFVNkJtcmtGQUU1eVRHRHFqa1dNcWRGazdJ?=
 =?utf-8?B?RU91Qi9rY3p0bWxhRnM3NjlOeHVxOHdhMkg4REFmWnVIMVp2clVIa0xmYVQ0?=
 =?utf-8?B?NUp3enpSSFQzZEdrd2dpVDhBRFpPN2JOOWNNeWlxRUt5cmpyVjd3R1EvQVZJ?=
 =?utf-8?B?ZHhlb2RHUnZiVnh0b21kcEV6czBuSXZ1bHJGZmVXZGdJMnZxYnBEbmIrV2pq?=
 =?utf-8?B?R21tYjAzV2ZwNXpBUjZqbWxXUGdieEtCZDRiZUZ1aTZIbHcxd2lFYnp5L2NP?=
 =?utf-8?B?WHRBd1puZTJscmpuTzVISXJ4NXZoWUZoV3R1NTNTRzJnbFVRU213S2FPV2d6?=
 =?utf-8?B?cEJrSDJlNjl6RW5HbkRNdW5HbTR0OTBYNE5mMzNTQzlPanN1clU2SjF4bHB5?=
 =?utf-8?B?K3REZ0NRUjlnWmFrT2UzVWpKYlFJVWVaMjFzTmwyWWY4Z1RxOHJPUmIrT2hC?=
 =?utf-8?B?WmxIT3VHZDhDVGRaNzlQQVBpN1YzQm5oNG13R3BFd01wZVFIQnlCS0MzTmJR?=
 =?utf-8?B?cU5QaC92TERLK3VESEg5Smp0WlVOdTZCNnAyUkV1UWszczZUWHdNM1duNnQ2?=
 =?utf-8?B?V1dSZ2xyK1BRajdGUVlnenFSZGljaHFkcXJaaUlya1hKUXJNbm8yZFdva1Z1?=
 =?utf-8?B?a3BwL3grMHNET1lNT0tUNjJrMjZhUGhBTTFOUzFvZEJRdlVRckYxU0Iza0RF?=
 =?utf-8?B?b0VpNHVraTNHdWpYMzVTZ3ZmL2ZqcEkrKzhMU29uTHJoSWgwQVJsQ2VLVWd3?=
 =?utf-8?B?bmp4RmtxVy9HK2NOWlFuQ2l5U3RuZnYrUEM5WW83VTdWdUtKZ2g1ZmtWVGlS?=
 =?utf-8?B?RDA3SFo0QWhVemExQzZqWm5NMkRsL0cvYUtCL25oL3BwY3lFZjMyTXlacUZ5?=
 =?utf-8?B?bnRDdnRmdXJOL2ZFV1N0a2J6UmJ0VFlzMmdlT2F6TE15WDFJb2JiTHRINXJr?=
 =?utf-8?B?UmY5RURLdDI5a1VicG04NmU5QStVeVdFdDFmalJ4bXdZejZsU3FtSnZvbTYx?=
 =?utf-8?B?cFJ0cHpnUlRkaTNjQzJFMmxuQkNJQlNwWGNaTWNKdGNGdFVJTFV3bk5PUE4y?=
 =?utf-8?B?YkpEYmxKdkgwdjZlOEN5d3l3QXdJTFEvamNIWlp6N1pUbkVaQjVQcFpBVnRm?=
 =?utf-8?B?ME1VOUlPVGp5Si9POWMrK25tNDZzbjhSVWpoSDR0UjAzY0pma3BEN2tOQzZr?=
 =?utf-8?B?aEgzK1orQXV2WlVnb0lOME11MzRtUEx4Q0I4Z3dCU3Raa0JHRWxsV3lLRmJI?=
 =?utf-8?B?T3FGdGY1bEdHajEwdEVqUUV4aDh0UnoxS1BqUVA0OFprWW5hYXA2UXQ5SGJr?=
 =?utf-8?B?S3ZTUVorSU0zZjZZMitmOTcvZGRUU3JLU1R4VGxRdHRlK3FQT1ZaV2JpSFBs?=
 =?utf-8?B?RDBPVHpwUVM0ZEhsc1ZaNWVHckNmS3pTNk90QnNtSWkvYWhzOHdqRE8vVktS?=
 =?utf-8?B?MWZxREtkbVZpL1U4NmZadGxNeEU2Rmpac3czU0REL0VhRU5rRi8wMUtkNUhM?=
 =?utf-8?B?RHRESDJjNkljSFVZV1VEMEJJYVhncGE3MkdjYko5WVJZTEQwU3A1WGFOaFN6?=
 =?utf-8?B?RkZYMWo5NVg4WnR2Njg3VjJsNGo0eFhmUGNPcHJqK1h3eHo0dnFxRWNjQ21u?=
 =?utf-8?B?czRGZkw5RWNESXlhdkpCUHlnekZrSkVJaEQvSGFqN1huRmtqcXVUM3h1UnBM?=
 =?utf-8?B?dStCRnlaSEZGVjc5S3F3ZkJReWJEeGpDSDR1Y0prVHNmRWRFSDE3c3V2L3kz?=
 =?utf-8?B?RDAzT2prV0RtZ2JVNkdQQnBjczcrVWEzQzFBZ0l5anBRK1VTSVZTY1hjckNK?=
 =?utf-8?B?OExCdGg2c25VU2duTTl4N0VNZWkvNFdNaWFBV3dKeXVwSi9EWGdGVWIydWw4?=
 =?utf-8?B?NjRDZ0FMeE5mclVicFZzcmdIL3A4OTludU56M1Voazk3bDAxbEZSWFBLT3Yx?=
 =?utf-8?Q?M6bE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c73273d-5425-4bef-22d0-08dd39f53747
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:25:51.3306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ySuFHGQHpZCob1GzDMhSi5fLT+wQzXXSBuO8Td9+pXYjiFAMyQOU/nc25xDxdlo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10311

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNeW5tDHmnIgyMeaXpSAxNTo0OQ0KPiBU
bzogSm95IFpvdSA8am95LnpvdUBueHAuY29tPjsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtl
cm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU7DQo+IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOyB3aWxsQGtl
cm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tDQo+
IENjOiBqb2FvLmdvbmNhbHZlc0B0b3JhZGV4LmNvbTsgbWFyZXhAZGVueC5kZTsNCj4gaHZpbGxl
bmV1dmVAZGltb25vZmYuY29tOyBoaWFnby5mcmFuY29AdG9yYWRleC5jb207IFBlbmcgRmFuDQo+
IDxwZW5nLmZhbkBueHAuY29tPjsgZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlOw0KPiBhbGV4
YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tOyBtLm90aGFjZWhlQGdtYWlsLmNvbTsNCj4gbXdh
bGxlQGtlcm5lbC5vcmc7IE1heC5NZXJjaGVsQGV3LnRxLWdyb3VwLmNvbTsNCj4gcXVpY19iam9y
YW5kZUBxdWljaW5jLmNvbTsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7DQo+IGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZzsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgYXJuZEBhcm5kYi5k
ZTsNCj4gbmZyYXByYWRvQGNvbGxhYm9yYS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0K
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IEphY2t5IEJhaSA8cGluZy5i
YWlAbnhwLmNvbT47IFllIExpDQo+IDx5ZS5saUBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNo
ZW5nLmRvbmdAbnhwLmNvbT47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgQ2FybG9z
IFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djQgNS81XSBhcm02NDogZHRzOiBpbXg5MzogQWRkIGxhYmVscyBmb3IgdGhlDQo+IHJlZmVyZW5j
ZXMgZWFzaWVyDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVh
c2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50
cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0DQo+
IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IE9uIDIxLzAxLzIwMjUgMDg6NDAsIEpveSBa
b3Ugd3JvdGU6DQo+ID4gTWFraW5nIHRoZSByZWZlcmVuY2VzIGVhc2llciwgc28gYWRkIGxhYmVs
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpveSBab3UgPGpveS56b3VAbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMuZHRzaSB8IDQg
KystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDkzLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLmR0c2kN
Cj4gPiBpbmRleCA1Njc2NmZkYjBiMWUuLjQ3MzllN2NiN2U5YiAxMDA2NDQNCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My5kdHNpDQo+ID4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMuZHRzaQ0KPiA+IEBAIC0yMDYsNyArMjA2LDcg
QEAgY3B1X2NyaXQ6IGNwdS1jcml0IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4g
Pg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb29saW5nLW1hcHMgew0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1hcDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1hcDA6IG1hcDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHJpcCA9IDwmY3B1X2FsZXJ0PjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvb2xpbmctZGV2aWNlID0NCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZBNTVfMA0KPiBUSEVSTUFMX05PX0xJTUlUDQo+ID4g
VEhFUk1BTF9OT19MSU1JVD4sIEBAIC0xMzM0LDcgKzEzMzQsNyBAQCB1c2JtaXNjMjoNCj4gdXNi
bWlzY0A0YzIwMDIwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICNpbmRleC1jZWxscyA9
IDwxPjsNCj4gPiAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiAtICAgICAgICAgICAgIGRkci1w
bXVANGUzMDBkYzAgew0KPiA+ICsgICAgICAgICAgICAgZGRyX3BtdTogZGRyLXBtdUA0ZTMwMGRj
MCB7DQo+IA0KPiBVc2VsZXNzIGNvbW1pdCAtIHRoZXJlIGFyZSBubyB1c2Vycy4NClRoYW5rcyBm
b3IgeW91ciBjb21tZW50cyENCkhhdmUgdXNlZCB0aGUgbGFiZWxzIGluIGlteDkxLmR0c2kuIFRo
ZSBpbXg5MS5kdHNpIGhhdmUgaW5jbHVkZWQgdGhlIGlteDkzLmR0c2kuDQpCUg0KSm95IFpvdQ0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
