Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4F3A63FC
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982744; cv=fail; b=HnXACN4LRcIq6n2MHaG+PBt5gAN9dogADcDIppaF895f1yRs2UGAt5E97Ck/m/Yv2X3ntHdlzjGT6YBKqtHBtvI3nL+bA8yMiCv7zmEBgSlpu8yiazRCXTIfCzkCZ+x+iYYQZXcWi3B4FqYXOd3fxpjd2GXA7NOIG6GunwxQh4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982744; c=relaxed/simple;
	bh=sLQBxwRq1NUhLv9TwyFh7JiZM51ylTFJbNL78OJc7mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fzew3arQMmMzZeW6A5lslf/O4urYvSh5iaF9lyWmnLjHqfaZ7PMy3Pcy2CZBOJwb63rcBRdxvUrmnp//vv41ODnhk+joQo34t7XOjBqm4Hj2MXy027KQegyUbwM0sYgw9XJdRFAYwVZArYiTyB5mOiQcMNFSeWTIwegeKCEm5f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mM2bKchy; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mM2bKchy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2hjAo1weeyL9OudWyloaHtHyeIXWHqdznEMTzg1o5LBgrhX7n/6cbRr3V+Shv2TOjnDxg3/WjxQsm0r3KSUD7Wqghl5pPERa5xWo9bDylHdJX1Yj8L9y5xDwJntXdtB+TlMaxSRuxD8rDqauirvlX6nBimTj5TRZi2Q6Xhm0p2Wo53vr/Tk9UoDtd6GOOUJD1ERODLnw6QMYYWWxvEtz1Od5lL+XDCQuJ/OWrMdBCifUAHzqWdI2PwfhW2BjtJh0jA+pCQb75v32LCBnGB6zEjKRwBaQoNzRkrbuWk0Zb8y0ZarzGYdQzZHgRXqitiTWkDog1ZnYRoYHkSKVwqmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLQBxwRq1NUhLv9TwyFh7JiZM51ylTFJbNL78OJc7mw=;
 b=LhV7NZ3vLS1Jd8KYiJ2BQnpd3D9NxJmbpX3Vss4lMtWenMWpbbZQcGGzwYO2pwnlYeoNc7RTwpSuAo31uHqXc+Hr93Thw0AGCcdH4Mp/PwMLzOpCrNKiPQ04VpyS0Y6Jy8DHFMk3miy2cnSyzZERuUYZ4ZetIK58xJVi8IudzOhcDsTVWfNpa8fclcV5zdHobCXCW0Vjv8hogKUfkTAwxVni3DHtJRm5v70YD/ocw1S/dPwU3VBjokNKukca0xhP+qjsfb+2PamvRm7kr6nsUvr1Wx5NePkEU68UXjVpQVbYaTUe7YoyRFUCqL0ufg7jKToek4aTB//XgrSLCUF0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLQBxwRq1NUhLv9TwyFh7JiZM51ylTFJbNL78OJc7mw=;
 b=mM2bKchyAO7T9MP8SBDANgnM47I617KIUBx+NujdK1/lZ5OIEKRTenCEnKcHfxXc7facMsfoTlIh/ALKSOikNb6iJ32iFysx9U8zJIJXI4KMdqaTJAKdxA8Ja3+UuG4C9k8/OEJ5Q/iugKTDMAHjkn8VgO9mesAV9yuLsxNayDppzk/uXMuPcXUar6wnetrFxzDdX+C++GBbbQZjY/H7gKBnadv2mA34excKXKvD7tCD+E5646+qZNf11ejXjgLAiIJsfCplpVdwk9lCR60jBvm3Bjh7eQDsDxZFqpWqyWrJg9Ecvk8O7WfzryQr54l6DvBdFBEwmfjKHMCt5q8BSA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM9PR04MB8081.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:05:31 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:05:31 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta
	<daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index: AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRCAAEjGgIAACMag
Date: Wed, 21 Jan 2026 08:05:31 +0000
Message-ID:
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
In-Reply-To: <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AM9PR04MB8081:EE_
x-ms-office365-filtering-correlation-id: 25d3b668-5ff5-49e2-bd59-08de58c3d91f
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmpYaXgzVzdWejd6NUFZT0ZDMVhtYlpFTkpUQlVuYi9YYmVYYUd0UnJvcEpk?=
 =?utf-8?B?a2tReFRZZ0l0bE9yb1QxV0h5a3JWQUhnN0NsMFU1MDU3VHlxRmtaUmdkbG11?=
 =?utf-8?B?YVZsY25tRkRWWUd4MjNDTzhGc2JvTERoSkxodC9YdnNuSUttVGExRFBveGtG?=
 =?utf-8?B?VnQ0OTkyMGhHRGtIM1UyMVNqUithcHFSWlQzZUdlQ0NSMHN6Zk9xbHp6RVJw?=
 =?utf-8?B?ZEMwczUrK2tWSWxZNUVrYzhzYmRyTkpqQkxoYzBpODB6U2RYZWViYzQ3bmFR?=
 =?utf-8?B?UzhWeUkyYmRxOWhlaDZmdGo4djJMMi9hZFpyQnJWUVRzQVFpajFCWUQ4ZDhG?=
 =?utf-8?B?M25OUlNzMGIyQkpJb2cyVkN4bC9EN2U0aFNyNXBLZ01EZXRZZ1VHZHd0L2FF?=
 =?utf-8?B?VmRhSmJmZXNvS2FEdU9rdGU1bENTeXNKdzZPczNZRnozRXpSNHBMWFZQZ21O?=
 =?utf-8?B?cW1wQ3RjSVdGaUxZb0RMTXdJaXk4ZGFJSFJoY1Z0c3pBU0pMb0p0RVdzaWxL?=
 =?utf-8?B?Y2xQNTFFNHRLZzQrZzdYR0lNNXliOTRIV0MxcHVqbzlPWkxHVnZaMEo4NUh0?=
 =?utf-8?B?ZWV5Wm43Y21SaUJqNG40YXF3RXhhcGZxZXZkZkZleUUydHQ4bVp2NmdIYTVW?=
 =?utf-8?B?RTExUjFDUVgvZm52VXB5NlhyNTBhRi9vYVFiWkYvM0VaeDVpOHV4MXpyTVZZ?=
 =?utf-8?B?QTllMW9mUzJoVGtrSENsVW9JeHlRUUcrb0ZhTkowR2tldWtIK1orWW1raEow?=
 =?utf-8?B?b2VuS0xNbTdUdWpQSkZvY3M1ajErR1h0OFdpemNnMEtvdmVBTU9nZVI2em1a?=
 =?utf-8?B?NzhwRFJXay8wVWdkSVd2SitVUUt6U0Y4YVpLa2NRQlVTeVRaQkJNc3hza2xy?=
 =?utf-8?B?bTErVzRpWVYwUVR0RUlmN21YTkM0M2FmV2FtN0VtaXBiaWp2aDBvQWlRbkNy?=
 =?utf-8?B?UmtvdUNubkdkd0U5L1BpK3BtTHlJWjN3Z1FreFdaSElyZjZOZStIVjZIOEkz?=
 =?utf-8?B?OWVNcW9JcndOWEd5MUlXSUp5ZDl0RVp0QSsvSXBvREp0WDZrS3RCbG1FY0lM?=
 =?utf-8?B?VDU4ZDNhcTczNGJWU2NnaWNzd2JKZU5jcXFJbzE3T3JFWDkrd2tFVGFIM0dB?=
 =?utf-8?B?d1E0ejNkU21rTXZjYmtqSlZ3d2hvY250Z3BtZ0tLQnVqeDNRYm12S2lNT0g0?=
 =?utf-8?B?MkVGcmtjVTdFcHRaalBnb2gwazJtTm95TUZ2cXJuL1pOYTN5OHFxYWdyalcr?=
 =?utf-8?B?cWlHNmIvSlFGYnBMZDJlMjFiUWFvc0thUlVWbGVFQXk1WEQweUpiS1dVczRO?=
 =?utf-8?B?eld4VlRRZ21CaGY2NmdhNzZLaFVKeVRJckhGVUQydDBxRzlJSmVFWDI3MG53?=
 =?utf-8?B?eER4RlRCMUVOaG45YmVrSDNBWTMwVERPaHNEeWFOMmFjbU5tWVdiSC9NcmtF?=
 =?utf-8?B?ZFNjdytRY1ZRQ3o1WmFtS3pMZDRyWjlKWlo5Y005TWlHbGg3S2g5YjkvVGs2?=
 =?utf-8?B?eGkzZUdWUFBwZnF2UlNIcXRrczZ4WXZqQ09DRW1JTUxqekdaYkN4STUrUVEw?=
 =?utf-8?B?Z3oySThpelloMWFlaWFSRDM0TEh0L2hCbGpzVHg2RVpCQTk4M0VZVmJSYnBY?=
 =?utf-8?B?amhPeXFzaWhtYVNJczhzYmtIbnNjSmthdUxPdUNJZWJhNjliR25HempSWVRV?=
 =?utf-8?B?WXZKbHYzMlVrdGw2U05BYXZlVnVlZmFULzZlakVhOG54NzRnSlNycUNKSmE3?=
 =?utf-8?B?UXJvMDdqWDBxT1BKU25pK0x1LzRXNnZya2xQS0dCTXd2MmZBdGx4YVhicWtn?=
 =?utf-8?B?TDBBQVdzN1M3WjFZaThJRkY2ZUowSjVMUkYzaVBwUkJoanlFRjQrRktHenRm?=
 =?utf-8?B?amxoTDdLU2JZbzlHUi9rZUxWNDZRRUh4b1gydlB5eWpQSUVoOG45WFYxOUk5?=
 =?utf-8?B?ejdxR3hUS2xWNzE4WTZ5WDgyUGZhUzQ1ek5zVmUwazZyZ0tyVXFod2pGTWg2?=
 =?utf-8?B?aExEN3dxK2Q0OVRUeGJUV1NmMHptMDAxZGlaNklaUlFnbThTMG16Z1AxWDBR?=
 =?utf-8?B?aStORnlma012c1J4MkdNMDQ0UUdITnNId21pNWlIc1hvcDFFaFhyaGJOTmZy?=
 =?utf-8?B?cCtVMUxveWVnVGdqN3V5YXJEdS9xZXc4cmRXRUNzR0VJdEIrSVlYejhtSm1v?=
 =?utf-8?Q?laCsPj0nZX5bs3mZV3noUGs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0lUeGNPSEdHU1BEaDlWSFlrcWVzVndxcGFNM1M1bEUzRFZsNGQrQWIrL0k3?=
 =?utf-8?B?ODJ5cXlOZkJOeVlPSC8ySUdpUC9WQUl5bDRCVGFta1BvaFF2Zk1WdCtBUXZz?=
 =?utf-8?B?ZWNiYXUrdGFpejRLcDlzOWxHL3hqK0pkUGk3ZnliTXdMV0UycFlFS3lGamQ2?=
 =?utf-8?B?MUNNUmNzMUVYNU03NW1ueWpzNkkxc2pyWVlUWCtmOGdzT2NKRld5WHp2OXQv?=
 =?utf-8?B?clA4eUVNQzRJMDQ3MmpMRFNwbFVxc29lQlJxTDVNOExCQjd1bXJoUks5b2ph?=
 =?utf-8?B?T2liTlVlNzhMWWdIVWtvNG42OS9zR3FlOWFXQ2VwdW1tSEFyTEZNeG9MT0l0?=
 =?utf-8?B?NWtEOEZzRmxuc3FGaHZ6R1lxbWFUWFo3cjU0cXNXdm56TWswcXg5czlLaTV1?=
 =?utf-8?B?dFZDWmp5V2Q2cC80a3UrOGJiNVBlV3loQnJveDN6RUo5ZmpCYitUWk1Pcjhj?=
 =?utf-8?B?eGpDNXBjR2ZDTm5qbzlVTWlBcmNKeko4NE5tVkMrZFZvanNwOTdCMURDYVNQ?=
 =?utf-8?B?cXlwTldGL214Uk4wdzRtNmpXWmZqQmNIeUtobFh6Yy9idHBIQkdCNXI4YU04?=
 =?utf-8?B?ZGxROU44U2lBbEZFWFFRVkF6a01zaDN1Ti9tMmRhdnNQdkE4YkhtRForRnUw?=
 =?utf-8?B?L0haNmdCbVVvZVBFZGhnR1BxMWpSdDlyQ3dTZU8yNFowUGdoTlZlSWkzcC9S?=
 =?utf-8?B?ZFh3Z2p5N2VPSExZYVZRWkZGcmhZYytJNzJXMENudmV2MjZINzJwYjJqN0xo?=
 =?utf-8?B?ZzJUSC85UVhtOTArQVAvQ0dmQnRsaVIxVHFxejNWTXZPaUdlaHMyakxxUllY?=
 =?utf-8?B?Q0Q4a1ZacHNRNDRRL0RnSWp3ck5ZamV3Zm9XMDhSVFRGRHJFUTRoMzM2NTQ3?=
 =?utf-8?B?TVJSV3lLRVgzdjVvZzA5WXlSZWNYMlg4dUp6NVh4TmQxdm1iMnFTNGppVitm?=
 =?utf-8?B?WWR1SUMvQlROT1QxVWVnSTVEVkdSMnZkNTJzSml0c1lkRzcxZzcxMHdkWkwy?=
 =?utf-8?B?U29RUXRYWW1TQ2hFRjkwRyt3NUFJSU9OTjNmdnVidk9oZU8wSS9OVHRibElI?=
 =?utf-8?B?VDA3L1dleFZzMUVWZDRCVUx0SzVMaGN2cnMzNGZuV0tKYUcrQVVSSlJRM2F6?=
 =?utf-8?B?TDcvWGNieXVPb0U2ZFhocXdzNWphMzl0Z0xXVDV3VDFBTXZRNFNXTXQya0Vm?=
 =?utf-8?B?SW5yazc0K1NLZkVkL3FkdzI0cEJLcHpScFFYbk01VSt1QUNuanBHM1BFNEdR?=
 =?utf-8?B?SDRPTWl0dS9vM0FubVlsd2IwUWdLWDBRT3prRWw1dWRCRTRtZk4xejE0cnZo?=
 =?utf-8?B?RzBhRFVsTzJSQ1I4SDJiOW9sOHRrNUxHTndON3I2K21uNHVhV2ZVU0Zvb24w?=
 =?utf-8?B?dXdPS1lBM3NsdmlxZTdZKysvTk1GdU9YOFcwMjk2VVVIVDR6anl0NDNjYWVt?=
 =?utf-8?B?T1g0OXZ0Yk1sanR0RzdEYk1sZXREemhNamhmdGc2K01Yakw5WEYrS3A5dUkx?=
 =?utf-8?B?K00xUE9aY0dGb2g0NUhUOVRna3dnYVUvVVVrdmJnTEEyd0dvNG1OYmJVK3pv?=
 =?utf-8?B?SHBvTitxUHY1SUQzZFRYaFNKYUgycEw2T1ZkVElRNnkvUmdvNkU3Z0plek9p?=
 =?utf-8?B?a2p1Sk0zRXBQVmNhekM3Z29GMHJEcjhxRHlFZVZKZXJUR25kNVNBNnJ0a1dN?=
 =?utf-8?B?aFZ0bTB4cFIrTTJUaVQ3QUhZODl4aksxTkhjL0Y4WmdvODh5VTNuMFFDWVZI?=
 =?utf-8?B?eTdsaithbTI4TVVjbGFYUEZnRUl4dldTZm1VaFdDRGQzZ3BySjhuNnM3ZDRw?=
 =?utf-8?B?ZXliYnVNUDk1MXhJQURaY1FabVpGMjFLWUpWVzEzNjY1SDM5c3EzQ0h5TVlN?=
 =?utf-8?B?NWpNdjlMelNhOG5sZVJaWkljSlB1Y0hzd1grVm1iSmZjVmZKRFR4RCtnMFdO?=
 =?utf-8?B?UzlGWHdxa2R6SmdTQmpacUJPWDdEcUFoNzc5VGNrREFUZmQ5eUVtR2VNcVpV?=
 =?utf-8?B?eVd1V2M4MlZWWWZvdmhKQ2tBWGNSTWdWYW5wZTNGS21VZ0lzRXZraUpHQkhB?=
 =?utf-8?B?UDhmd3dqL0d1NUt6R1RqUGszNkh4NXJ3cDZyS1BBVXB1UjBXMUpHKzk1Q1Np?=
 =?utf-8?B?ZEh2NG5CRkRuQVBSQUI3Zk5kY0F0d2w5Q2kxSE1qbkJ0QjY5YVUyWUk1eTNL?=
 =?utf-8?B?MnJPN2U4QXdkQ2l6Z0lnSHg4QmxhTGlYbGlYQVplL0Vac09hVVNrTWQ0RlFE?=
 =?utf-8?B?eWpkT2Jod3lxVGFQa2lDdldFTHltTVdSTGd2MlpET2Jia3FhTXRDUDdQUGJk?=
 =?utf-8?Q?yvM5DQdICYWD0h3hEP?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d3b668-5ff5-49e2-bd59-08de58c3d91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 08:05:31.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AyvUN189JxVilrbo6Gotyr7thSo9OLK6aKm8FBTBCLctVihzqbRE0uEdsMr7MfOeDTpNIOtMHmJrH2Xd7mpaVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

DQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBhcm06IGZzbDogQWRk
IGkuTVg5M1cgRVZLIGJvYXJkDQo+IA0KPiBPbiAyMS8wMS8yMDI2IDA0OjE4LCBTaGVycnkgU3Vu
IHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRp
bmdzOiBhcm06IGZzbDogQWRkIGkuTVg5M1cgRVZLIGJvYXJkDQo+ID4+DQo+ID4+IE9uIFR1ZSwg
SmFuIDIwLCAyMDI2IGF0IDA2OjI2OjAzUE0gKzA4MDAsIFNoZXJyeSBTdW4gd3JvdGU6DQo+ID4+
PiBBZGQgRFQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE5YUCBpLk1YOTNXIEVWSyBib2FyZC4NCj4g
Pj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBTaGVycnkgU3VuIDxzaGVycnkuc3VuQG54cC5jb20+
DQo+ID4+PiAtLS0NCj4gPj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2ZzbC55YW1sIHwgMSArDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vZnNsLnlhbWwNCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2ZzbC55YW1sDQo+ID4+PiBpbmRleCA5M2FkNmYwMDI3ZDAuLjE3NjlmMjQzZDcwZiAxMDA2
NDQNCj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNs
LnlhbWwNCj4gPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
ZnNsLnlhbWwNCj4gPj4+IEBAIC0xNDMyLDYgKzE0MzIsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4g
ICAgICAgICAgICAgICAgLSBmc2wsaW14OTMtMTF4MTEtZXZrICAgICAgICMgaS5NWDkzIDExeDEx
IEVWSyBCb2FyZA0KPiA+Pj4gICAgICAgICAgICAgICAgLSBmc2wsaW14OTMtMTF4MTEtZnJkbSAg
ICAgICMgaS5NWDkzIDExeDExIEZSRE0gQm9hcmQNCj4gPj4+ICAgICAgICAgICAgICAgIC0gZnNs
LGlteDkzLTE0eDE0LWV2ayAgICAgICAjIGkuTVg5MyAxNHgxNCBFVksgQm9hcmQNCj4gPj4+ICsg
ICAgICAgICAgICAgIC0gZnNsLGlteDkzdy1ldmsgICAgICAgICAgICAjIGkuTVg5M1cgRVZLIEJv
YXJkDQo+ID4+DQo+ID4+IElzIDkzdyAxMXgxMSBvciAxNHgxND8gY2FuIHlvdSBhZGQgc3VmZml4
IHRvIGtlZXAgYWxpZ24gZXhpc3Rpbmcgb25lLg0KPiA+Pg0KPiA+DQo+ID4gSGkgRnJhbmssDQo+
ID4NCj4gPiBJTVg5M1ctRVZLIGlzIHRoZSBvZmZpY2lhbCBib2FyZCBuYW1lLCBpdCBiYXNpY2Fs
bHkgcmV1c2UgdGhlICBpLk1YOTMNCj4gPiAxMXgxMSBFVksgYm9hcmQsIGFzIGRlc2NyaWJlZCBp
biB0aGUgY292ZXIgbGV0dGVyIGFuZCBkdHMgcGF0Y2guIEkNCj4gPiBwcmVmZXIgdG8gc3RpbGwg
dXNlIHRoaXMgbmFtZSAoaW14OTN3LWV2aykgdG8ga2VlcCBhbGlnbiB3aXRoIHRoZSBib2FyZA0K
PiBvZmZpY2lhbCBuYW1lLg0KPiBJdCdzIHNlY29uZCBjYXNlLCBwcmV2aW91cyB3YXMgZnJkbSwg
d2l0aCB0aGUgc2FtZSBhcmd1bWVudC4gSSBkb24ndCBjYXJlDQo+IHdoYXQgeW91IHByZWZlciBp
bnRlcm5hbGx5LiBZb3UgbXVzdCBhbGlnbiB0byB1cHN0cmVhbSBhbmQgYWxsIE5YUCBib2FyZHMg
YXJlDQo+IGNhbGxlZCBzb2MtZm9vLiBOb3Qgc29jZm9vLg0KDQpIaSBLcnp5c3p0b2YsDQoNClRo
ZSBzb2MgbmFtZSBpcyBpbXg5M3csIHRoZSBib2FyZCBpcyBiYXNpY2FsbHkgcmV1c2UgdGhlIGku
TVg5MyAxMXgxMSBFVkssDQpzbyBkbyB5b3Ugc3VnZ2VzdCB3ZSBuYW1lIGl0IGZzbCxpbXg5M3ct
MTF4MTEtZXZrIG9yIGZzbCxpbXg5M3ctZXZrPw0KDQpCZXN0IFJlZ2FyZHMNClNoZXJyeQ0K
