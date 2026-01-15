Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E81D7E42
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441951; cv=fail; b=aOgwrkcxE46cc8mbXMe1XvKVso4P231fxutljJyqbEcmPJfsVSf9i/Uo/7jALP6LiUXOeAr5g60lvOc6vFMHjpWBc1BspO88KmoBQRAcOSazfwl4gAZUCwzPL7pjiZ1NMLwRsun/5hUpm4YRLr70gxvWFY9/1OFXRbrlTpNBYnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441951; c=relaxed/simple;
	bh=QwogeNkqYh3cj8uKkncFY4QDtNjyj5Lfqp/ej0PtEP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KDalpeM7y5AiCIXV+h5o9Y/1UqTQ3kQaG0oclOXP3PPkJHIoP+cOIDVrPccEOS24A6wovrl35qDxcR4qVyNQxzNcNa/Ee7Bgg5SCqqgKRV1+C3OUs3VR2JKm5/izibRLRTPa/38bV30d1Fxa33lk+CnY+AKDRbwdwZ+SsFdgfZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TrkWqnr5; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TrkWqnr5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=immajw2xjhP6YJXASlOY6T+rXDwAGvR34OzmaE6uGXju21KlFs8g8b9CyADPR0i6pMXl8Lz5p1uCqbK3OdnXLjegO7AXTgcCHkG7QjIWBFV4or58rlsTqlmfaAdXqSE9EPtdFWWVWcZRVyHr9TDs2Hlffn5J4ucqFalnrkGf+Sv/Vol57fT5qYADaytHc21JRhO7YHhYJZ9Xqwcu1QpH0NyMz4MA90eRBrDkCCMzpxHFTZIG8k9hm7BWrdU/OthJQ5h77bvunt3il7J8GDSBE2n+I9hqvvUkVsQJ+VGvFNauOAqQe/nGPeVIKwtnQ7MSsAcee+ufPzMDe6KKa0fKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwogeNkqYh3cj8uKkncFY4QDtNjyj5Lfqp/ej0PtEP8=;
 b=O9Bu/OQMrdWdf63SJ9uHtA1YhBY9iGx51vqqtA+cFZ50lJIyw1kNu4mV+ZpzfJ5k8JDVa0zM/YoEMNybMNMydGPAH9CS5XslkOPXifnaNaH4H/nLPE5JMCF1zp3AY/xvDkuObIBKNEab0dM1EUB5Fuj/3tptdOx2irxgsxSeYGwhKjtjVeXVMoEB4VQ8JDxYmTGLmsB9nAR+ARLWObwsD+qAFVgjy48hH8IvIi33wMTzNtoqbwIjQJZfbFdYOApPhreNcRn7DdUidExlcBZ/aAlWnwf0ld6A640IZNq+oYtxxJmCUVr5BUdPKo4c0aQF4xEg0dZRTdyIumWEwdU74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwogeNkqYh3cj8uKkncFY4QDtNjyj5Lfqp/ej0PtEP8=;
 b=TrkWqnr5gyUdTcuuNQ42c1/JPoguwhnwpoy0pzCWmAkaQsryQD4xjx479e6zUHjecThdgLEF0vPeoxqYKSn8kRqZhbE09eKm9gwu20CzneXySweimDT8h+MqR0V/hYGARiNaS42Gn2xH+0wJZhSuON7WhB4jdt1SWHT1zPsKi8f9va0kgFRBLx9rNMp/gieRxRyvdGWy9s6FTEF+oL6mm3wGFPiSncGH9jemIa8bJPAeaypLV4TcNakLfZ9t3pJ/MvkCdSXkePA3SHiRBWDMGVrzRU9gCqhWcYVn+M0NHPNX3PaWsLVVq0wv/g56Zeefph071hn0d7slX/jx0VsW6A==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GV1PR04MB10379.eurprd04.prod.outlook.com (2603:10a6:150:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 01:52:26 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 01:52:26 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Thomas Richard <thomas.richard@bootlin.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <frank.li@nxp.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer dereference
Thread-Topic: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer
 dereference
Thread-Index: AQHchXXpkyaXBTvj90mASUO2Nim6wLVSbgWQ
Date: Thu, 15 Jan 2026 01:52:26 +0000
Message-ID:
 <AS8PR04MB8833F590D2D499143AEE29C58C8CA@AS8PR04MB8833.eurprd04.prod.outlook.com>
References:
 <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
In-Reply-To:
 <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|GV1PR04MB10379:EE_
x-ms-office365-filtering-correlation-id: 9332f63f-cf31-4928-f969-08de53d8bbd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?gb2312?B?THh0Rk14YzhUYkZ3Tm1GeWZjWmcvQnRpNkwzNW5XUTI4eG5xRWZkSStFSXJZ?=
 =?gb2312?B?N3AxY1BtK1FReEMrSkVVbm13Qld2V0t2b0ZrbitCelBaYzBXK3g1QjJIN0lr?=
 =?gb2312?B?U3gzMnZvZkl2S2dTQ3ZaaXBjM1E1UmhUQmJ4WmNyZ3pMcS95YkpyTlpoRVBI?=
 =?gb2312?B?VTQ0cjU3S2ZydnhCQmdOVHRMVmgxVHdYdE44UXVIWERkT0w3eWd3ZlFBSENB?=
 =?gb2312?B?TW85Y05HT3JqVnltU0xQWHVpUDJEWUQ4ZTFCMzFISUR1ek5oTHFldGdIc1dq?=
 =?gb2312?B?NTdoWXl6bzBidGVwbUxsUzZhaUdoK0JSSnk4MXY2aXNvbFdZTGI1TG9LLzhk?=
 =?gb2312?B?Rm1rK1grMFV0UEs5cW5BQ3ZHeldMZUltRGNJUW4wYXJoMlFEV0hmWU4vRE5l?=
 =?gb2312?B?bVFDOFhIMkx5OUVDcWJpS0VzNjdJZU9lR25rT2N0T1FiN3c3a1o5SHgvTDAr?=
 =?gb2312?B?dVRPcEFjbHpJWnh4TEI5cG5mcDFpaHhia3ZvTGVkejlvUWZJUnpUaldJZHZ6?=
 =?gb2312?B?UUtmSFY5Q09UM1dQaFRNNGs2RkQxSGNMc08rL1lpVnNyNWdNbGdYN2NuVVpr?=
 =?gb2312?B?SDJaK2kraEZPRE9wL2I0d3RlWUFhOEpzRHUzblBaMVQ4aFVGMHhqRzNZcVkr?=
 =?gb2312?B?WnJtVUt6d2JreFJmMmZ2M3NubWcrQnhiTG1kN0NiaDl1MDRyY0hBb2lFdS9t?=
 =?gb2312?B?dktHekl6RGVlUDcwU01qN1hWMTgrUmlMRlk3amhlRVA5K3JSY3l0dFJ5Vmps?=
 =?gb2312?B?RFlrMGNXQTgxbzlFQkhPeHdKaGJlSmtYblJPVnpIckpQSy85MWNuTnFsYkVY?=
 =?gb2312?B?SlZTZU8wU3JsazdCaGJIYWUwb09aVnoxc09vdEl0eWNzTWhPdDBwMUl0YnRW?=
 =?gb2312?B?QUV2RzlXT3piMnJ4V0RlZ3AxSUtCRlZQR3BvWWJvT0cwNU1RWEx2VFVLZHVP?=
 =?gb2312?B?OFVQbXhBcjNVaDZydzlSLy9Va1RncXVNOVc5ck5ZdWJHQ2FBbkUwaDg1T21o?=
 =?gb2312?B?Y3ZsdUt4Ulg2R3pSMHl2WWUyWGMxbFdMbHdrbTZuMnlDcEk3blR5MzAraGVk?=
 =?gb2312?B?bDZnekExa25UUy9UM05OeGFnaFhGM0d3VDhHSjI4Z29DOVc3WndCUVA2RG9E?=
 =?gb2312?B?VFNoWm1BcS9uRUxJYUR1V04xTE16eUpvVFlMMDIzaGpCSEtGNGhmWlgxUHg1?=
 =?gb2312?B?MGtBTVFFWmhoV1l3ekw4dG5vNWR5bmpGd2F1V2xWczFmOUJJTFBPYmJYTWM2?=
 =?gb2312?B?ZlFaaldwRXQybUZjcGkrQUk1UTJlZUFFUTNWL2FTYXg5azBzVisvZUprTFZ1?=
 =?gb2312?B?Mm9OUmlrVUNpY1dMUnVValE4TllObTJsd1NPeTBpdGhZbHdwYnR2OXlBUVp5?=
 =?gb2312?B?aTlZYk8yMnR1R1pwWFRMS3BhV0lCOUhzTGRGaGlwMlhEaGhwWVJ2RzZ0bU5u?=
 =?gb2312?B?ZnhBN0hWSmNCMlBsaE8wZDNVYisyYWdKbmRheHZEdVJiR24xZTNta2UvUmdD?=
 =?gb2312?B?aTdLOEJEc09rU3UzcnFkMC9aNUxXckRMYVVZMXRwOWFTTkJ3Z0RGRGp1TjMr?=
 =?gb2312?B?VThDQlg0L1R4UEZDTVB5NzVFNnNyNU4vM3FiVFBscFVPSUNDVTNSYWowNHU2?=
 =?gb2312?B?WjdVZS83cnI4a0t4WGtjVVJHRmQ1Vzd3ZFNldDhERkY1L1duSXpnOUFqMCtP?=
 =?gb2312?B?azUwalVVTDlnT1Y2WWtobjkzTHJlaExITFFqMDdYQ0RpQ0NuK0NNMU0ySVNs?=
 =?gb2312?B?Y05BRUVHNHRSRW5RQjlra0FMR3hObDlGNmsrT3FDRS9vVHBlRk9BZk1UMUZI?=
 =?gb2312?B?TzkvZlhMK0JtcVM3VWgzS3BiNTFYV2JsZHRyZHFRSnlid1o5L05MTWRwdGJw?=
 =?gb2312?B?OFJEUTdxYWIzZ0RoSS9VSTk0UEw1WFEwbDBveGhlSE5qZUJFaU9PcmIrZmUy?=
 =?gb2312?B?SmY5Tjg0QXpqUndHSWN3bEZXSjlGVzZiVjR0MU9UWmlpT2VLeE5iS3dGTHFy?=
 =?gb2312?B?V3luTDBubWVEb0g0a1dYSmhWdDlSS1Nibk1FbzNkeVZkdGVpM3krdERydmJH?=
 =?gb2312?B?N1RiTlZoS0xQQzJSSm9HTTgvVDRXL2FLdTd4T0lNYXI4UHptSkRTTUJKWkRo?=
 =?gb2312?B?NVdJNGtKNzdpdjlPY0wzY05HVDFVZ1A3Y1QySlVpd2VBNGNFZ20zbFJmalZS?=
 =?gb2312?Q?snjbW+mZmUMIYXTjbpohfgc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dGdaT0h4VzNFL2RxU2VXbmhDeDlwLy9UL0FZZGgvbFFYWXVEVVVYL2x6VXNJ?=
 =?gb2312?B?K2Q5YUk4ZWpzRUVleUxrVVFWVHB6MC9MU1BzekRGcmdUMmxtVlQzUDR3UlhB?=
 =?gb2312?B?c3J2RmZ5c0ZlazdrQVBrYTVzN0g0M2JKU2Y0NFMzeVFOMGZRd0hsM2ZsRmxQ?=
 =?gb2312?B?SHFSY0Y2aDVlbkdOdlNxd1hodnJvTTAxNEF5S1VmSkgxRGJxNDlpRTY1NzZy?=
 =?gb2312?B?QmdvelZ6elRYKzRNNSt6VXRZMVhUcE1qeXBUaGFhbEhBVG02dXdTYVZYMjk4?=
 =?gb2312?B?QS9MT2pyclkvVFdzek04S1BKMXRkdXFyMnZZY2xYOW83NnFoT3FYcjBxK1k4?=
 =?gb2312?B?U0lKK1hhL1FNMzlMaGwwL3BNaFY0Y3AxNXZ5UURzRFBQM21KTVd0a0V1eTht?=
 =?gb2312?B?QlFodHFTVVpsY05BWCs0OUxWMkY3cXVWc09XMmFpU3hWNGNJdVpvWUU5UzZI?=
 =?gb2312?B?aldGVEpUZmh1Z2VMR1hpcXhQSkdlT1haeHhaalpzYVo4aGpvckpBckdGTGlq?=
 =?gb2312?B?YUdzbHRTYzNxNmdXVXZwaFBpUndUaDBtSTU5cXN2a3k2ay96c0F5MlRmVkFj?=
 =?gb2312?B?SVRYS0lSOU9kZEg5aHFtYVVxaUYxYTZRY1NkaWRFRUdaS2E0TDFTYW9lRWVz?=
 =?gb2312?B?Ymt2U1NoaDdHanpvYWkyMm12ZDB2blZ4ekVwdjRoOTh3dFhqaWZMc2JTek5H?=
 =?gb2312?B?WGFVZXBmQkNHRlQyRnNCMjlVdmI3MlkwWm1KcFBuZ1NBc0ovV0xidXBoMXFY?=
 =?gb2312?B?Q0dneXZTWDlldmZmR2tBRWJlOXlxNk41MXRGSGE0YXV5RjV4VXRkS2pQMmVX?=
 =?gb2312?B?MWJYMW1XenhpRjhqS0M1NHNyaFJkbmpCZm41TDBnZGQ5dGtxV2xMYndETTNr?=
 =?gb2312?B?T3Zid2VYTnNyUXcreUJvSERrZW1uaXAxUG1FaUlKcVFvU1pGczAwUEpKRDRk?=
 =?gb2312?B?WE9ja1dQcEZtSnoySyt5Y20zMjNjZ05IZnlweHArZmVrVjZ1MkRNY2JhZmU0?=
 =?gb2312?B?TjhTN1RjRENIUkVlZ2JZQVAxV0dhWEtYV3NyZGlLNjN2S2lSVnNOUWVKMWI4?=
 =?gb2312?B?d1BGejlUOEtyUEI1OGR1dzh2RnduVDdTc3p5eTA2aGNnRlEwMEh0VlhqejUr?=
 =?gb2312?B?WmRWR05ZQkVQZGNXUVBYNkpzYjkxMWhsdU1qSVJKMFJOc2lhWHBmdTFjNnFN?=
 =?gb2312?B?MS93TWZwS2ZzQm9qaDlibVJNWERhOXEvTHJCZGg5ZlBuai81dm1vSWtYSW4y?=
 =?gb2312?B?c29LSVNWSldTQytDUW5DdHdKTnFpZGlxc25qS04zMGZ1bWszMjNWQ0FTd2p3?=
 =?gb2312?B?MUNJRWV3emN0aFBkZjErUm9KRlVSWnZYV0EzQ2NrYmdtR2tDY1RoY0l4R0dh?=
 =?gb2312?B?cHhmWFlsZWxLUk5rVEdDbW45NG9mMDllYnVvWW1WYk5NdTEweWxVMXpsV3U3?=
 =?gb2312?B?V0xwNTNNS2FaRWZWUXdseU1KK2FBam1mSTgzL3o4bzE2c2MxK0wyd1FIaDNy?=
 =?gb2312?B?TlBaSHIvbXhuV1NrU091c0RhenhKRCtRcUNmMG90ckR4NmlEby9NQ1NXK2Ev?=
 =?gb2312?B?bWVGTG96Y1RWR3lpRjV1dHBDYXkzSUpDK0s2NVBORFRiT2JMR2NyTFpxUUFM?=
 =?gb2312?B?UHZsN1l0eldFUnp3Sk1LL1hsMlZYVlUwMzVLY1pxU3luSUR6bDdMV2gwbVJt?=
 =?gb2312?B?UkdCa1ZucUdFWkg1YXJDYzVzcnNTOWcvUE1WbngzeHJPL2laSDF6a29lalhJ?=
 =?gb2312?B?TDYwT3NRcG9XbXRzOXVaWjJzTmMyak9FNjgwMDlQajFoRU83cTJ5YUFObDhO?=
 =?gb2312?B?RTlMYktwaW55RDFhY3VFSW43Zy81UXFKWEZ4NFlWT0dlSktlRlYwRDk4Q1Jz?=
 =?gb2312?B?eUY1YU9CQk5EWENIVGNvanJLaHBwSlJ3TTB0cHVsZjRTOS9jeXJ4ZXlFSy9q?=
 =?gb2312?B?aURtM0dLbzk3b09wNmM3UDZRREZtTGYxRXdFYnZPL0FvNjVsYUdGcHBxdmRi?=
 =?gb2312?B?K1RFaUp6d0ZZT1hZaDJ5eGVWdXJ3YUlKbEVFZjE5Nzhia2c0dng1eVphNWt0?=
 =?gb2312?B?RENKRDJoSVFPR1NDQVExWkU3N29hUi9EeXBuelBwQjE3bjRCRE1RRzRhYkhu?=
 =?gb2312?B?Z2JoaVhUUENHTXpPVkF4T3JQcHp2OTdMQmNVT3E3K2Q1TXZKNVNaU2g1ellT?=
 =?gb2312?B?VHFmK1BDYjdyMWZFaURvMHE0c3F1UW02bk5Rd2lxRjNWZnp4WVl6QUN0Vm9o?=
 =?gb2312?B?QU9TbDZiY0lFQndRZUlsclpKYm9HczBKZmFKZjZVZ09FR091NGdXZlNSY0VB?=
 =?gb2312?Q?4Tm2xzWzjIOEa0Vu7K?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9332f63f-cf31-4928-f969-08de53d8bbd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 01:52:26.2190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+n5xd0RSo1MeYJrNQQq7RocBA8e1iz6//cOITjOQmYB6Xk0as9ccNLSqqXo9ubckGsC3v/OBs5XQ1L1ApbX4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10379

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgUmljaGFyZCA8dGhv
bWFzLnJpY2hhcmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IDIwMjbE6jHUwjE1yNUgMDo1MA0KPiBU
bzogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz47IE5laWwgQXJtc3Ryb25nDQo+IDxuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsg
U2FzY2hhDQo+IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgUGVuZ3V0cm9uaXggS2Vy
bmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0gPGZlc3Rl
dmFtQGdtYWlsLmNvbT47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgSG9uZ3hpbmcg
Wmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ow0KPiBsaW51eC1waHlAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBUaG9tYXMNCj4gUmljaGFyZCA8
dGhvbWFzLnJpY2hhcmRAYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gcGh5OiBmcmVl
c2NhbGU6IGlteDhxbS1oc2lvOiBmaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlDQo+IA0KPiBb
WW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHRob21hcy5yaWNoYXJkQGJvb3RsaW4uY29t
LiBMZWFybiB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IER1cmluZyB0aGUgcHJvYmUgdGhlIHJl
ZmNsa19wYWQgcG9pbnRlciBpcyBzZXQgdG8gTlVMTCBpZiB0aGUNCj4gJ2ZzbCxyZWZjbGstcGFk
LW1vZGUnIHByb3BlcnR5IGlzIG5vdCBkZWZpbmVkIGluIHRoZSBkZXZpY2V0cmVlIG5vZGUuIEJ1
dCBpbg0KPiBpbXhfaHNpb19jb25maWd1cmVfY2xrX3BhZCgpIHRoaXMgcG9pbnRlciBpcyB1bmNv
bmRpdGlvbmFsbHkgdXNlZCB3aGljaCBjb3VsZA0KPiByZXN1bHQgaW4gYSBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UuIFNvIGNoZWNrIHRoZSBwb2ludGVyIGJlZm9yZSB0byB1c2UgaXQuDQo+IA0K
PiBGaXhlczogODJjNTZiNmRkMjRmICgicGh5OiBmcmVlc2NhbGU6IGlteDhxbS1oc2lvOiBBZGQg
aS5NWDhRTSBIU0lPIFBIWQ0KPiBkcml2ZXIgc3VwcG9ydCIpDQo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBSaWNoYXJkIDx0aG9tYXMucmljaGFyZEBib290bGluLmNvbT4NClRoYW5rcyBmb3IgeW91
ciBwYXRjaC4NClJldmlld2VkLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hpbmcuemh1QG54cC5jb20+
DQoNCkJlc3QgUmVnYXJkcw0KUmljaGFyZCBaaHUNCj4gLS0tDQo+ICBkcml2ZXJzL3BoeS9mcmVl
c2NhbGUvcGh5LWZzbC1pbXg4cW0taHNpby5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aHkvZnJlZXNjYWxlL3BoeS1mc2wtaW14OHFtLWhzaW8uYw0KPiBiL2RyaXZlcnMvcGh5L2ZyZWVz
Y2FsZS9waHktZnNsLWlteDhxbS1oc2lvLmMNCj4gaW5kZXggOTc3ZDIxZDc1M2E1Li4yNzliOGFj
NzgyMmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGh5L2ZyZWVzY2FsZS9waHktZnNsLWlteDhx
bS1oc2lvLmMNCj4gKysrIGIvZHJpdmVycy9waHkvZnJlZXNjYWxlL3BoeS1mc2wtaW14OHFtLWhz
aW8uYw0KPiBAQCAtMjUxLDcgKzI1MSw3IEBAIHN0YXRpYyB2b2lkIGlteF9oc2lvX2NvbmZpZ3Vy
ZV9jbGtfcGFkKHN0cnVjdCBwaHkNCj4gKnBoeSkNCj4gICAgICAgICBzdHJ1Y3QgaW14X2hzaW9f
bGFuZSAqbGFuZSA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOw0KPiAgICAgICAgIHN0cnVjdCBpbXhf
aHNpb19wcml2ICpwcml2ID0gbGFuZS0+cHJpdjsNCj4gDQo+IC0gICAgICAgaWYgKHN0cm5jbXAo
cHJpdi0+cmVmY2xrX3BhZCwgIm91dHB1dCIsIDYpID09IDApIHsNCj4gKyAgICAgICBpZiAocHJp
di0+cmVmY2xrX3BhZCAmJiBzdHJuY21wKHByaXYtPnJlZmNsa19wYWQsICJvdXRwdXQiLCA2KQ0K
PiArID09IDApIHsNCj4gICAgICAgICAgICAgICAgIHBsbCA9IHRydWU7DQo+ICAgICAgICAgICAg
ICAgICByZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+bWlzYywgSFNJT19DVFJMMCwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIU0lPX0lPQl9BXzBfVFhPRSB8DQo+IEhTSU9f
SU9CX0FfMF9NMU0wX01BU0ssDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGM1MzdlMTJkYWVl
Y2FlY2RjZDMyMmM1NmE1ZjcwNjU5ZDJkZTdiZGUNCj4gY2hhbmdlLWlkOg0KPiAyMDI2MDExNC1w
aHktZnNsLWlteDhxbS1oc2lvLWZpeC1udWxsLXBvaW50ZXItZGVyZWZlcmVuY2UtNjdiMTEwNjM1
Zjc3DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IFRob21hcyBSaWNoYXJkIDx0aG9tYXMu
cmljaGFyZEBib290bGluLmNvbT4NCg0K
