Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D531B4148
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735043659; cv=fail; b=YUqW7S5xNtKZxx3gVlEfsZBuU3MaOfTmf7ereF4IKDTY5WhfIO/2yn6QVrWu5Navaa1VG0eT/P5EeUuOSojvMF8CdzLEMFyJ6qU5GI5txm2Jtb6H1YG3Xw6og6ed8OSuIL0JFnGT3sDwsPcj8Ylr9eJDuKVgSx5Om9KGlGLfriE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735043659; c=relaxed/simple;
	bh=sHc7sZILOMI5ENN1LUZnrgG+TaLP24kgGObgp/3WANQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=YvAda8jc/AsHtFlVJNwWpc7c7ZG9pwT1qHLEa6uCxSaeqoORptC/e6J47fIkmQwiCpe3Q+X+LhwT3lkkdbBWh97aFLRgDLBot343ozYTAjJoqDfFNhDrBbj0SreIya8sFe4nVKWmtBJsW02UYa6P9xR7E4YmXQZ3VGuZq1ul4HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZxW6RcEC; arc=fail smtp.client-ip=40.107.21.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZxW6RcEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ9PgJ4If5OWpAVnj5mY+Erad9lA1m0WbYKcoQClPL+VSwlOz9btY+8z0R6/skMpWRbfhF5660TqlN9mkFHpCfueYAeKFO23qfj618502195uSE6KB9mKahvw+cSLnhJUoX6XBOFRatMzJx2SiDqZXzCiMLjG+3ynF2YnE1EPZOCcPRYGe3hCKqzRZ1DDSodNoOCWhSKMGvS9N34xjMPnqdSZ68hXMnHpQ3lHa53mVVcaXlfWCVJJkvCm2MblcZ86/+DLirqNFSRg0J2MHQuL6SIlXYXftY6v25uPgtHEG6sN3g8yXtKiWwqJBzqAcVTZoPbe5cqH8q2SEUk61SZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjpLo8JuTY2o5ASvq89P2DlnIs5OyDhuSStLXvfugsI=;
 b=K3yN0d62n2WlcuIa7YmHHva8XlLxqcnWSCsmzXW0qffPuVh6knQGHOYc6IvcO/UbG2kwQh3tYV4zZjeAGiLUadx2YhGA04dbzyYTxhY0u+mq/1/IhV4IpYPbEVhKYJa+iwmDz8WT3h42pdf9hrXtK/1GK6NXArjm8cME6VnePHKewjLLYE7E+Rbbv9gR2AvXogYT/OjAW/17zrq0l+5FGGYxQMQQx0LpQmpjAfdDI87FBW8XrNK722+qa4Qn7PbswVPODRc+T5F2Duky+PkPW1/7kqo+paCv1tffeuZHULWf0Hlqu5j2nR7+AX3fW5r3kHzd6KvOsUjs+iUUaeeHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjpLo8JuTY2o5ASvq89P2DlnIs5OyDhuSStLXvfugsI=;
 b=ZxW6RcEC0et9CwG4nVd7BoNzOi+Vu55b5po7beOI6xtxDLKlzT7NMuchWMqqAb9wKwFuruQJRtZx+fGWNV+/ROmnKIhSHWud+oAimAl3sUnCpMZqHhPxTLn2a78XkMSSM8aXksoNO/dyWEXpNLm82rNH/TBmcHT8/D6nTUpEvGLq6LUEuxTv6sdmCRaOLAHanNuV4CSoiPrFc4p0oMi03T8ZXg0IhNl6a3OH7m8Urx90UQJYoZ4AynHN8/oEkpk2FkAEZCjY0m7RXro1aD8469GAPf4fuO/4Q2hqLFCycfVxI0WOPDkBqUWPyk20/KcHhuhCNFQS0kXyfetx0Yjz9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 12:34:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 12:34:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: Enable wdog_b trigger pmic
 reset for i.MX93
Date: Tue, 24 Dec 2024 20:33:35 +0800
Message-Id: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+qamcC/23MSw6DIBSF4a2YOy4NLxPpqPtoHKAX9Q4EA4bSG
 Pde6rjD/yTnOyC5SC7BozkgukyJgq8hbw2Mi/WzY4S1QXKpeSc5o7UYxd4YZmZaxGHorFBaQj1
 s0U1ULuzV114o7SF+LjuL3/qXyYJx1qKd0HLUSpinL9t9DCv053l+Af1/dEGiAAAA
X-Change-ID: 20240820-imx93-wdog-95ddbb8a1342
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735043627; l=932;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sHc7sZILOMI5ENN1LUZnrgG+TaLP24kgGObgp/3WANQ=;
 b=KFV94D9yM8LbQVDHOFIcqr1LtNbpPtmESXIWiQI7bfJqfj+YoT2pl7BHaraB3CCIyQscIQycS
 GJ9cZqiS5ZvAswpqugENCFakm67pSkXyirAmZpbv5k+r5ZIVt9q/6IC
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: JH0PR01CA0093.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9aa6c6-de2e-40eb-7037-08dd2417432d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnhJWVMvUlF5Y2YvdDQ2WDFVc1E1UHFmS054MEpFRmU3dE9TTFBXWnBvdi9a?=
 =?utf-8?B?U0Nmc1FiRFBOUjFwK1FhUERuTTJ2d1ltOWlMbStQZ0d6aU9aWjFNb1czRkRl?=
 =?utf-8?B?cUxTc3Y4b2pjZC9Xbm04cXNWZkJKTVY1bndPK25FRk0vTUZPYWpFY0ZueGdW?=
 =?utf-8?B?bEk2VGczNW9ZdjFFb3RoRnluUkZseTA5ZDMzNnpEZFF0ek1mUzd3Tm8rOXBx?=
 =?utf-8?B?KzI3OFpTMEhPWjdhRjYwbGd5aUlvaStkeEt6dUQwbDNQRUdkeUlDSW9KeFlq?=
 =?utf-8?B?bVRNVm5GcS9vOHd1dHJqSVVmY3ZQK1FPN1BxekZvOTFuRlNKYnBVbGdETjIz?=
 =?utf-8?B?SGQzcDVTQlgvcm4vOWNPZmZOdVpXVHprekZqUnU0dE1MS3ViRkFlbmNBWVlz?=
 =?utf-8?B?am1EV1k4NHI2UWxEOVIvWnlSbm95ZUl5aHVhTG5vWFN6OVBwWWVQSlViYUtn?=
 =?utf-8?B?UWJVN2VoNExiNjhhbUFkaUU2ejgrYXhNVmZFZzZ6cFptMG81SVBxRmsxZVRT?=
 =?utf-8?B?aXVmT2M3MmlDSERYS1E5VnpsLzBCdnRGUXRjaFpoRkJidWJmQVN2c0FjVzZl?=
 =?utf-8?B?L3Jxa2J6Nk91WjdOa2hYTE1TVmNRZitZZnVJL2JvdEYxSk1wUjladUNnQS82?=
 =?utf-8?B?dldoaGkvRWl3NzNiK1k2ZHpraUdoZFlJZlZTRDRiVHAzODRKVEU4eFlGaUNT?=
 =?utf-8?B?UkpheDlrU1BXWE5BZk94emZ2aXJsOGY1QzYvVXV0cnlYMG5ERkJPaTNYMWl2?=
 =?utf-8?B?eHlkODRRM1FadDl3NjRPZmxWVTRudlJLUnZKbks1U3dVSEJ4QXlWM3ZyWXhm?=
 =?utf-8?B?YzBSTHNkN3FncG9XN25rdnhJeTdhME5OL0FTOElmUFdMQzdXSVVoODdESWpV?=
 =?utf-8?B?Wm16SmV1Yys5b0tsQ1BHSVFpRlJqQnBSMjNycW9lQ1k5M3ZaTGJRbUtrWXlD?=
 =?utf-8?B?OFhUOEk4MUNzUWJ0WUZBQkZzd2dDL2ZaWWVEc0s0QnVtWEVmSk85U3c5Z2dD?=
 =?utf-8?B?dzJ6UDJsbFRadHdPTzdzMDcyLzBpMlF2NE55MEFUNm9IRXliVkx4ZGsxenB5?=
 =?utf-8?B?dnlrNkJNNGNVbmRoNkZ4cm1NNEhjcHNWdUFyc283OGI3NEJHSWhwYkhPeG5s?=
 =?utf-8?B?R292eXArNEJKeklKaE1rODBrZGp3TEQweVJtaWhaUDJTVXdYYTFqZ0pLVkU2?=
 =?utf-8?B?NHZDalV4ZnFDUHZSdVhpZDd6WTBTUWJoVDZXTjNybDBuL0lkUEdaRHc4VExT?=
 =?utf-8?B?Y2FZMnBadVNpK0ZZdUptcEJnSDIrcitiZnJRVjJYam8rQWpxelhxbkdWU3Bs?=
 =?utf-8?B?VDF4djBKMEVoSU1RN2FlOXNPazVjUEIxcUtkemFiWkJuVVgyN2g5YXd2a1Nj?=
 =?utf-8?B?V1RaaHdBS1hib1AxdEN6UDhJNWJWN2Y4TGZyR3JyOXdUQTdwS0VjMjFBWjM0?=
 =?utf-8?B?cm5rWUZRakZEZ0xwYnhZaDJVc25rL3pGc3ZnNTg5UCtPTStKbUkwYWpJbzZj?=
 =?utf-8?B?YzdZTTJOZjQwU0Y3YkVkOUxHcUlKVXoySjBJcFYyZUhvUW5mOXFscDNTNWhz?=
 =?utf-8?B?aDQwZEpRSmRoVUVKWEdRZkpSb2RjVmVuSnZha3N1RzRRS09XMGdLVk5LejlL?=
 =?utf-8?B?b3Z1QUdabTY1Z0MwK0cxaExhWlBvcS95L2dwV2dvZkF3UTZPQnhFMjFrdWNJ?=
 =?utf-8?B?dkNnYVpjOGxaL01IZE1TYnp3WFJkQVp0ZTBMWnVDc2lkUjAyQkYydmRCWTFk?=
 =?utf-8?B?YlNsQU4rek80TkxrVU90Y2dpek1jb1ZhUTN5RnJwaXdRTmF4MEFzMUJNdm5C?=
 =?utf-8?B?L0Y1cXNTcTZGQ0xZRDAyNW0wNGZENklZVE56R0FxTFVCMnpUWjJCaVFjVll6?=
 =?utf-8?B?VjluOUR5d0RZckFrVmR6ZmtIOEh5NDlncEF0cXNlN2MyWXB5K1pqY0l1aUZP?=
 =?utf-8?Q?CQpve+vMwRuQePbeTlp8uzYWbLwXx+Xc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlIMEUvNThPai9VelFUcytGZTNHNFdpeWd6dzlWZWdqY003ZnhJZjh6aldX?=
 =?utf-8?B?ckZ6MFM4Yzl1bk5RaHpKOFoxQUo0ZUJMWUlHM3F2TXlzMHpEWUxsN1BmVk5a?=
 =?utf-8?B?L0xhOHEwNUg4VUpNYUhIelhkZ1Y0ZFJ4NmxZc05uMGNVWDdGQlk0elhqblRB?=
 =?utf-8?B?OTgzMzF1ZDV3Nk0zM2o5M0tvNklhR1VmUm5ITlhPM3BCTyttR1RZLzhkR20y?=
 =?utf-8?B?TnRNMU9EYW5QS1pRTW1qc3lsMlJOM1FFT1RFNzVlQy95R3lEckRwbEkrdmJJ?=
 =?utf-8?B?aG55b1R4ZURHd1FSQU1EMVl2V0tUMVlEb2M3d0RCVkpOOEJzVm00UW1FYVRP?=
 =?utf-8?B?eVZSdTdHRlg3Zmx5UVVXL2MxN09oNzdsc041Y1crQk5GN2xycTJtR1BOb3hH?=
 =?utf-8?B?N3JOdjl2RUh3aXVKMHMxRXFzWlJ1NHJLMUtEVU8ycldGWkN0UXNoamFWR2xr?=
 =?utf-8?B?ZTN3ZHBGaTRmcjFjUlc4YXM4SXdHZEJMU0lMRHp3dXJaVkZlZ3lsRzB4T0Nm?=
 =?utf-8?B?SDQzOC8yT21QMkcxVXVQVE5SSkZsbWNqK25CUnRYaHpzajBTQjNQa3JLQVlU?=
 =?utf-8?B?YkF6dzU0YnJSNnlDd05oaFZ6ZndNRFNrZVpRajhCeUc5ZVVQV3FSMHhJZ2lC?=
 =?utf-8?B?b1IySG82dmxrVDhNOGxRSzZXdGUvTHU3TVB4U1FPQ0VjOTIzOGF4QVRpZDF3?=
 =?utf-8?B?bldua0FOWFdpV1pzVTlFZ00rSXMvdFFzdGFhd2xVU0NIR2hkbGhyVno3TGw1?=
 =?utf-8?B?UVhyNVpMbVV3MXFrdnpQUkNkenAxOHZ5RE9GWVZDK2FweHhTWHlocWNFN0M3?=
 =?utf-8?B?dkxxdGt5Yk1tOGJxWTl6OFNSbko5eUpmUGMrczkwRG5vVjdwazNGMTFONE1x?=
 =?utf-8?B?OG1JTkVCblIrS3V4WUNkaDhtYU9WZExUSUtqMG5lTWs0MlUySWJNbklBV1ZD?=
 =?utf-8?B?NjQ5djlxeStneTBaeEdYaG9kQ2N1eDNSZXVQbWkxVElRT1ZaY1MzTkZOWkFs?=
 =?utf-8?B?QlNyRE5McEZxUDg2NFRRNGhON0ZoNkR6TDRmNGNuRTIwUXI0RDlNaHVudWNk?=
 =?utf-8?B?TWlUcE1nekpaZHdlYzlSRERNOW5KZTNoeVNqZjFucndHcGRyYVB0M2ZXNlpW?=
 =?utf-8?B?Q0pQc2dKbkFCdjA3UDVNL2hzM25obENDZFczbWhZS1VVcW5pakhGdVNyUVRz?=
 =?utf-8?B?NUREN0UrYTVGaVdUNlRhQ3g3NVhvRmdJdmFWcmVPaS9aSmtkR1c0Y1ZhSVNS?=
 =?utf-8?B?MlFyMkhrL1JnVDc4TlZrOTdkMW1SbDQ1eC81aDhPa2pxRGlhQnRRejBlQ3ll?=
 =?utf-8?B?WU5HNUs4ekZhSU9xTDVvWGwvRWtVb3FraWxpMFB3bXljUENENFBpaHM2YTNz?=
 =?utf-8?B?bjBLOFE2dnZsemJhbU11KzBZaW1GTmZVQjh6eG9ZQkh0VDJXamxnbWN5elFQ?=
 =?utf-8?B?NUxrbDVscXFvQXFVcW1EUmVSd1liM1BvMFZyV1F5U3E2WVNkK005d3Q1cnZv?=
 =?utf-8?B?aEtMNXpnc1J0cmw1Y3RzTDlMaVQ1Y1REQU9NVkUvZm1vK25RKzU5WGs0dmh6?=
 =?utf-8?B?QUJOcFdGSVY1djljM3VtcVZLQ3hwR2JpUThneis1TUdtai9vKzhoZjBMMXpG?=
 =?utf-8?B?THdKbXkzTnlxNjNnZjNkTXNSYkd5TE5wVVV1N2xzallTN3g0VW1sRWMzOWF0?=
 =?utf-8?B?dERZcm5kaTQ3L012a1N3d2dURms5Q2JScXVDbXhSZ29XbkN4ektDTzJNL3NE?=
 =?utf-8?B?YnJDaGNGN0xaOUM5cHRET0xIcDZKN2tKU0ZNVWp3aXlFNGZCZDh2ci9iS2U0?=
 =?utf-8?B?cjRxenhwZ1NZb3k2b3dqU0xjdGJDQzJHZ1lyOUE3R3ZxMHg2aGF2SlhDVWJy?=
 =?utf-8?B?QXZhZG1SUFNpZUdZelRjelVjZjIyVXh2VWZBVnZlYWYzUmorYVMzNExwT0Zv?=
 =?utf-8?B?MFV1WmlGTXoyc3NnN0JuY1U3dEZGYlVYNG9oT1lIRWZoYzJoN0wyck5qZllv?=
 =?utf-8?B?UzZ1OHYrd0hrQnM2S2ltb0NWYnFZMExaSWZ2NjJBeVYxSERhTTEvV3kvQVBu?=
 =?utf-8?B?a2tkV05pbHZRa3VlVit2bHdKN2gwZTJGT1k5S2xKNGZsaW9xZFJTODQ3NjI4?=
 =?utf-8?Q?/ScoN1j1nIFb//YfAIf9Z5vZt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9aa6c6-de2e-40eb-7037-08dd2417432d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 12:34:08.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8X0isO0xDjZ51rGF9HEmRxgfs/Nywaim1gHWafK/2bdrcpPsse9kNSNuWbSotugRz5z9AQ5tBWVOO/miioIgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

Enable WDOG_B to trigger pmic reset for i.MX93 11x11/14x14 EVK and 9x9
QSB board.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add WDOG pinmux settings
- Link to v1: https://lore.kernel.org/r/20240820-imx93-wdog-v1-0-5dafda0d4319@nxp.com

---
Peng Fan (3):
      arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3

 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 9 +++++++++
 3 files changed, 26 insertions(+)
---
base-commit: 2d32679c2bbc1570e3bcc429f4f922ff6ee59ca8
change-id: 20240820-imx93-wdog-95ddbb8a1342

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

