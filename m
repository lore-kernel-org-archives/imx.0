Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F791714A5
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448523; cv=fail; b=itT7vVAidjlJuPRBjHksZ1gPjjeEZ6oIwwthNBVWetMUbJuywCCWKfILSht3vsf5uCO5n0zCPjDttwvQqi6HQOaHgHm/azlxRinriS+tBuSJAxM71LIl32j5RCgANCDOXPXGWQJuZsrw5blBShUV365MCgus7UO+M+Jw+TjxJI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448523; c=relaxed/simple;
	bh=V6XxvSK9jMWrmoBQii0y0NZiDVijOqZMF0MJk/iulkE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kERHpE6i2+OGlrJuVTwF2oHvn2hWjScZbUXvL6JlJDZ7CRlB2CWTP9M/vAUAF7A70tyqv/ge3Jwscwsk5uHoDaye2Cg1xxUEGoo8pE0rwxySfNZSTnoEJvOOuuvPxNEz57XFMfAF+D++CEuPZC4kb5MYQVbqNMZPoEqfDAy4D4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RhctOAWp; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RhctOAWp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKupyvbKbXZ3zFZ0fsVhkV07d+Aoa9o9IKvgI728CUGgkOKnt6miJQuYuEiqCS0Z9c8IRGvzFAIWv9ydty0WPM0Y41KJPA+pOHUE1xLzHur5L5VOayIRcttL1+NmdXlJr+qzmf8rfR53IvMYh0hA073dbtMLUVPQvdbP4c92sFb4Eg00RptKBtOzqpHysYW1p66fFKwKhpRtX8ru17Rx5yOVbv4khedcPAoq8DL9Zy94iyqIbMg5WtApJsKyNA3noZ1u6m2Il/Y1mFYt2RPK8+oyUFIvFEYs4T4Vb93C91f52jrreny+I6jbb7H3upJ695B85UjStHRrz1U/4NQorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6XxvSK9jMWrmoBQii0y0NZiDVijOqZMF0MJk/iulkE=;
 b=gUrB00ppSTZPFpKEdWYg/qyLw4ROrIu4H58uzf0Asm9hU5tJltVrl6Y9/or37FE4hhsf8Py/bg9jfr0kF9eHPm/rhzxJCzr+up/4jSipj40dliMcSeGtvc2DF+EYcJtm+UPTNNnzWHiStJ/wn3rrK8BKBy7XGXjixS2yyjhHFjm4z56+dJlcpXd1uH8TATv2v1PxCcBJPYKnn37nap5Vo7OMUikrY0ftpUdxFjNF5mAV1YfjTDfqWo3CCXkEuxs6CNyRDxqGNnI9uN2i4tRZo6gCxdbRUyncX/1lbPzKs6EJ7J+cN8gydg6VxyXGM6c6H0zkMV+m52kSIOBvCt9wxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6XxvSK9jMWrmoBQii0y0NZiDVijOqZMF0MJk/iulkE=;
 b=RhctOAWppId8NPGdkpEQHGZGTx4tso6aV7d/4Eurc8WEF0EAh2DShEO2Q/FHOdc+ozYVqaqZYYiOpFEr9S5D2ZiPSODbkVT9c+d39+UWUMg9ldNQ7ySRV2YycpqshjvoTLd8jTMrPbxTQYxe4PdRlXJVofrLgS5Egh+L40ksBq62ZvR3zUR2igEnwwvqHzMSv8MJVQKqRX2UyNucCmO5JT3hR8DkwzH2sC5qQe5W/AWWLaXZX+nIh+1lk0ARK5X5E3I9vcmm0Pr6W+D/e/W2QGwqudRW2XYpTLDt3l5Yg8K1l8SyAknOjIjjO4/2OJbQfMSdVOexlQs/M/B29cPZGg==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PA1PR04MB10399.eurprd04.prod.outlook.com (2603:10a6:102:452::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 08:35:18 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 08:35:18 +0000
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
Subject: RE: [EXT] Re: [PATCH v4 0/5] Add i.MX91 platform support
Thread-Topic: [EXT] Re: [PATCH v4 0/5] Add i.MX91 platform support
Thread-Index: AQHba9fZyWX31rlT8ke0iRjuDBeVDrMg2mYAgAAKGXA=
Date: Tue, 21 Jan 2025 08:35:18 +0000
Message-ID:
 <AS4PR04MB93863BA6D5657E1161FEFF8BE1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <8c8ef847-0d6a-4859-9e26-dfea993f9d7f@kernel.org>
In-Reply-To: <8c8ef847-0d6a-4859-9e26-dfea993f9d7f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|PA1PR04MB10399:EE_
x-ms-office365-filtering-correlation-id: cffa9e7b-77ce-4fa3-c69d-08dd39f68928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXFMMUFsNnorUzE4STI4cjQrY3plU3JiSlpmbHJHN1UzOTkweVZLcGhuMXFa?=
 =?utf-8?B?a2NqMlIwYUxVVUwzbVp2SFFoTGQ3WE9IVTlvUGhGbVk5Z1pNY2dKcis3Y2k5?=
 =?utf-8?B?VXgwWTVaTlBSK2hzYWZtZVg2cnhPUmlac1RGV01mSDhMTnNtOENIM1d1ejhV?=
 =?utf-8?B?alozTU0rOTNnSmQ1NU9Ic2JKVC9zNmFBbzFHSlR0ckJFUDZHWnZwYllCREFu?=
 =?utf-8?B?NVpReS9SNTFzK3lpd25uV2pobXhCd1p3NFRzaEVpVnR2cUVkM1pncGlETno1?=
 =?utf-8?B?NzF2eU1Ya00wVm9pNFNLZFUvOFNUcDl4NDhObnBmRW8wdy9jdzE1QWJQa21t?=
 =?utf-8?B?UjV2U3RkUEJBNm5PYjJKQ1BwRVR3TENuL1ZqR0p0eWMxTFh0UjR4UUdhZ1Aw?=
 =?utf-8?B?YjlKb1RzbW9WdFpuMjJMbWZmNjVmSE1FdlJZZm5jYm5kV0NBR3ZsVjkydVAx?=
 =?utf-8?B?VFl4UDVyMG1odHBGNTNvOGFKb0xBbHEyalArbS8xTk1NNHlCMk04VUtyUmVY?=
 =?utf-8?B?WitBVTkvbkxza0RNNWR6OGw0dDBqQjJQVmN2WEV0WnFsWSt0QzY0dVBGRUJE?=
 =?utf-8?B?T1hCVFVpWUs3ckJXVVhVT1FJTkR6ZjE3SmNGN2NIUTZlY3hzUHl4Z2M3ekdP?=
 =?utf-8?B?YjhFYmtoMkZZeHlDZjNraDdxNHBVMzFiKzdhdHMrOTQvbTV2bXdLcGpnaUpU?=
 =?utf-8?B?b0dZYTZ6RWdHYTZ3ZnV6aWJ2M0FWVUxwc0VQVmV2S1h2MHFhV1dBMzJVNHlZ?=
 =?utf-8?B?VXI3bWNxL2ZpU1BzWWlOaVdDdjI3dmg2WTlVOHJSZmNQNzBXK3AvbHZFV2pn?=
 =?utf-8?B?UEJ1ODlTTDFyalZxcmhaYlhoeXdtRHNTS3MwcTdacWg5TS92VDRHSHQwYkxJ?=
 =?utf-8?B?NVEzQmU4VE9za0c5akZpYllDL1Y0OXVsMFdLcXZkWHZoTllNVGtkUU1OT29o?=
 =?utf-8?B?OUJmZWlRT1RpMUVod1lOQ25BUGZLZFhnQTcxMkN1eDdpU2E1WVlMTVpVeGN6?=
 =?utf-8?B?c1ZRTlU5VGhhQ3pGeEFuWkZYa3UrTXcrOFlHek16K3dLcXJPd2JmL3FmTzNU?=
 =?utf-8?B?alB4SExnQy9XWWs4L3M5dkFDckJPbHV5VUllazZUb1BuSzZkU05nZnIzQjJj?=
 =?utf-8?B?WEVmK280dzdBN0xWcWt3SGdBQnNER213cUNWbk9yQ3pocUVDWUQvbGQzS3Vw?=
 =?utf-8?B?S2d2eFpOM0ZXVVRQRnRjMUN3M09tRzBaaUcvQTF5YVFIWFZoOTRyZU9kQUpu?=
 =?utf-8?B?L1JFMWFVU1JvN1ZsazRUamxSRmhWOEF0aWVLZDh1N0t2Q0p2enQxanpKenpl?=
 =?utf-8?B?UXo1U2llaENkWThuZE1rUDA0eGRNT1h3VDB0cFVqRllBcmhRdmcrdjg1dXVN?=
 =?utf-8?B?Zmdnb2JRVXRGT2tSQWg3L3JmblFlSm5Kd0U1ZjhIVjlqMlhSdmpMK1VKSGJJ?=
 =?utf-8?B?RWNQNUxSM2FWZG9lNnYvREQ4d2hMWjRybmRTT0Ftb3lvTFY1Qi9hd2lpVGhu?=
 =?utf-8?B?bE8yREx4ZFJhZEsrclRJRDY4Zjl2WjFGWlVEZDBJT1N1dVpMaDY5MUhCdGpp?=
 =?utf-8?B?SVNydGVhM0I2bXI1bW5laFNycUtUb3E0S25hSnRIN2JuR3AyVUJ5aDRRYVor?=
 =?utf-8?B?aVBqbDlzQUIrYkQ3Uzc2SDNQN2Z4M3pscDN2ZXAyWnI2bllyZmVTalFnRDln?=
 =?utf-8?B?c3pTbEZSa0RYL0x6WXJqZ3pIZGxZSjMySXdvNnV2cmlpeGFaZ1JhOEk1V0di?=
 =?utf-8?B?anlsVW04cGdkWk85VTlBMVQyMGZIREVudStBWUhvTFk0TkorUW5rNmRGT28w?=
 =?utf-8?B?SjlCTDBKcFBYODZTZmFaaEs2RHNBV29iZTlzUWFwZUJNbkJjZ1h5WFR3SnUz?=
 =?utf-8?B?cXBGQ2Zsc3dOUDNCQWZaZHo2NjBKQXluNUFVUXYwREhSVVB4Q3h2ekE1REMz?=
 =?utf-8?B?Nk1qODI5ZzJ6QU9FdjZnVXluRnZQdUNUK201L2o2bVc1RFJGQnJ4QUlCYXMw?=
 =?utf-8?B?Nkx3YlNnZm9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1duNENwbUVKelpZWmpkSE9XREZvOWVHQVZRZENnaTJlVWY5M2tuUGVRVkdL?=
 =?utf-8?B?THdzVCszU1J1S0V3Nm02cXlFZXRUUlA2ZGJxZ01IVVYwWkRxRE5VZlRCdFli?=
 =?utf-8?B?TjZqZ2JreTRjcGFKak91N28zeTBOdmkzRGpYM2R1ZXBNejJOWTk5V3MzY3pK?=
 =?utf-8?B?TDd4aDlnZDl2TWYwK1N6eGpuQTdERnRaOGh0ZWJoZ0RqRnR4NjV3UEc5UlUr?=
 =?utf-8?B?ZCtyN1loS1R3cTRxLzIwOTByVzBqbWVlQWpYNXQ0OGtSTDJBbHZUV2xGMEFo?=
 =?utf-8?B?UFkxQ0d5cVIyenJicnA1L0pOYis1Z2YzcGQzVmUvWVdXNEdXZ2VTMXB4Tkd5?=
 =?utf-8?B?NXVBQ2ozTWUwVUc5TjNRZlFyRGFwMGZFQ2wwTHBTWGtZVmNLb1FNek9qQ1pM?=
 =?utf-8?B?VHo2bkdDcmszamVJMUxiaW51OHRJWVlLelYxQXhYUzYyMVQ4S09PYzFyazdB?=
 =?utf-8?B?NUxFZGVBVEtoZFdtWnNJbHRVaUx6WUlpQzJqTElzVit2OC93T1ZGUE5xZUp6?=
 =?utf-8?B?RXlEZzhZdWxWNE1wUEhBVTJNVG5mb2cvZXdhYkppc3dNQnF3L0xzdHN5YTVo?=
 =?utf-8?B?aEJrYjY4RVZZMTZTZE1vVHl5REVTWlFKRE5ha1VOZGJzVVhrTjBlOEovUkVn?=
 =?utf-8?B?OHljWnlDYVlCZGtCME5SS204TmhRS2M2alQ4MG92L256YXRqTWlpRC9ja2ZB?=
 =?utf-8?B?UFRiK3ROajRhTEFxeTVWNEVuV2ZsUnZaUTJSSkRsaXVYbWlQTUNyNVIzc1RK?=
 =?utf-8?B?Y1pxN2pPNW1ERDhYMGFVeGx3aU54MXkwcHpVOG1MM1lJZDJDK3hzTzNnY2Zi?=
 =?utf-8?B?cm5mZnU2cjhlSEc3eDBXN0p5Ui9RKzhzcUlldUFtVlp4VEU3d3JZSEdWeHFl?=
 =?utf-8?B?TjN2RFRtTERwTnJBQ3F2bmQ4WXlLM0FTZlo1MmVxVjF5QksrbDdkVlJseG01?=
 =?utf-8?B?RXdKaDNTSlpvTlVFZnlpL05sdWl6VkRrSmpGUXFES283R0VlcmZpMWRNUmNs?=
 =?utf-8?B?QnY3VDkyRU9ENkpZMEhRVUtnSVNyOXErYk5SS3pvYU9aL0FFZVV4MmhPZWZ1?=
 =?utf-8?B?WHEyZG5qenJGT3FLSG5JSjl3cWRsb3pKeXdSUGZuTzFtYkJ0OGcxamc4ZVBn?=
 =?utf-8?B?Z2dNa3lmZTJ6eUZmclc0WHJwamlWaDRPMUU1eGk1eDJyZGx5b3VEd1ZhOWht?=
 =?utf-8?B?QktjNlVxVWVtcFBaV2xjd0N0RklrN1ZvYWw5Tm5MTFVSaHdNaUhQTDlLL2tx?=
 =?utf-8?B?Yy9vczVOTWIyZnA1SFFEOWhkdGFTVWZvNERBbFB2NzZlTjYzMXE4dnBTWVV4?=
 =?utf-8?B?ZGM0YTZWanpPdDhqN1ZGVGNHdno5K096MlVZMGxuUm9rZ0x6K3lQSmFFeFV1?=
 =?utf-8?B?ekdUZVpjOXRXYXhGU1JhaTU5TnhaSDYvNkJwZmRWZjZad1g3VU5jMzdWQ1pZ?=
 =?utf-8?B?dFpxSHJWK3NyWjRvbzJIN1JnQ0dKME1FMVlrbWh0VHJGNk8yNUg4NzIrR0V4?=
 =?utf-8?B?SlRjWUZBNFR1L0xXaENGYU5yMXlNWUp0cGM3UEZaZHY1cDVYTGxQU3B1V0N0?=
 =?utf-8?B?R3hXOTRWMzAyYThNUGRpUXM3Z2cvUytWcElHc00xZFBIUTBlOHVtSHI2Y0Yz?=
 =?utf-8?B?Z21Id0NEakR0SGczeVJoaVV0SEZ4cXhCdjJEMkFRL1N3RXBlSURQT1JOYTZE?=
 =?utf-8?B?WkVwQi9PS0dPWFpBbTB0aFJqc3JhbWw5aTUrMUFCMTBBMjdzR3hJbjhXOGY1?=
 =?utf-8?B?UTVlbVFxVmd2SEtMSENVTHFXZzg3NGlZRWpPdzlJVnVFSzBKeXNqSllHak1x?=
 =?utf-8?B?ME9aczRMTlJRaE1hRVZJUU1hN2xtQlVsVjlrczJiWkV5cFJ6NUdLdmFKVnJZ?=
 =?utf-8?B?ODIwSStJZnBnMDgxVFpyZVFJV3NJcHkzU1VvenY2cm1kOGtvV2RZVnpzdHZj?=
 =?utf-8?B?UDdTN0oxdWhGdExrcGNSRGtycmZqamhnc1FaWWpiUi85RUFSUHV2V1laeGVL?=
 =?utf-8?B?aUxqRjRsMWF0dlozRzFQbm9ObXc3b0hyVnRUdFhYY1dlQmhJQURvL3I2aWxl?=
 =?utf-8?B?VHNiWTRlbnlsVnJseFVUSmZQSTk2dGFMaGJYQk94TEpTMlZ6b3ZGNEEyTU93?=
 =?utf-8?Q?HDbo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cffa9e7b-77ce-4fa3-c69d-08dd39f68928
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 08:35:18.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XwPosIZYK1i7mRdKP7iwj45X1YopI6LJygJcQyY579B9Hs87uY/SuyFV8tG18ov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10399

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjXlubQx5pyIMjHml6UgMTU6NTAN
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
VENIIHY0IDAvNV0gQWRkIGkuTVg5MSBwbGF0Zm9ybSBzdXBwb3J0DQo+IA0KPiBDYXV0aW9uOiBU
aGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcg
bGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRo
ZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiANCj4g
DQo+IE9uIDIxLzAxLzIwMjUgMDg6NDAsIEpveSBab3Ugd3JvdGU6DQo+ID4NCj4gPiBDaGFuZ2Ug
Zm9yIHYyOg0KPiA+IC0gY2hhbmdlIGRkciBub2RlIHBtdSBjb21hcHRpYmxlDQo+ID4gLSByZW1v
dmUgbXUxIGFuZCBtdTINCj4gPiAtIGNoYW5nZSBpb211eCBub2RlIGNvbXBhdGlibGUgYW5kIGVu
YWJsZSA5MSBwaW5jdHJsDQo+ID4gLSByZWZpbmUgY29tbWl0IG1lc3NhZ2UgZm9yIHBhdGNoICMy
DQo+ID4gLSBjaGFuZ2UgaGV4IHRvIGxvd2VyY2FzZSBpbiBwaW5mdW5jLmgNCj4gPiAtIG9yZGVy
aW5nIG5vZGVzIHdpdGggdGhlIGR0LWZvcm1hdCB0b29sDQo+ID4NCj4gPiBKb3kgWm91ICgxKToN
Cj4gPiAgIGFybTY0OiBkdHM6IGlteDkzOiBBZGQgbGFiZWxzIGZvciB0aGUgcmVmZXJlbmNlcyBl
YXNpZXINCj4gPg0KPiA+IFBlbmdmZWkgTGkgKDQpOg0KPiA+ICAgZHQtYmluZGluZ3M6IGFybTog
ZnNsOiBBZGQgaS5NWDkxIDExeDExIGV2ayBib2FyZA0KPiA+ICAgYXJtNjQ6IGR0czogZnJlZXNj
YWxlOiBBZGQgaS5NWDkxIGR0c2kgc3VwcG9ydA0KPiA+ICAgYXJtNjQ6IGR0czogZnJlZXNjYWxl
OiBBZGQgaS5NWDkxIDExeDExIEVWSyBiYXNpYyBzdXBwb3J0DQo+IA0KPiANCj4gV2h5IGRvIHlv
dSB1c2UgZW50aWVybHkgZGlmZmVyZW50IHByZWZpeGVzPw0KVGhhbmtzIGZvciB5b3VyIGNvbW1l
bnRzIQ0KVGhlIGlteDkzIHBhdGNoIHByZWZpeGVzIHJlZmVyIHRvIHRoZSBleGlzdGluZyAiYXJt
NjQ6IGR0czogaW14OTM6IiBwcmVmaXhlcy4NClRoZSBQZW5nZmVpIHVzZXMgImFybTY0OiBkdHM6
IGZyZWVzY2FsZToiIHByZWZpeGVzIGluIGlteDkxIHBhdGNoZXMsIHNvIGNoYW5nZSB0aGUgaW14
OTEgcGF0Y2gNCnByZWZpeGVzIGludG8gImFybTY0OiBkdHM6aW14OTE6Ij8NCkJSDQpKb3kgWm91
DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
