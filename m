Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E23D9672
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272219; cv=fail; b=fYYVimoDFdHZ4K1lWMfYUPbO7J0S32G+BNPLtvL/MT9w+iZMcwN1JrpCxEnJjUqeXLsUnvgT81dR4weCxboMdNMA7oibyn3w7u1Wt+nP72qklPJ0oqFIl2OuFkF+ySeKHZm6Xl+tYU3Nf20q90KXk54MMab9SxZ8f2NNsaeYFdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272219; c=relaxed/simple;
	bh=lErc8L/KWQOJ3EVXcnmIxk5EiJ48Wbwa8H+JpmLO9Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gu3diK/aZHAjmG7BG9eqBdaldy/Ic/Rqw9jhR3J7CngXDzwdE4hnbm1PGKUIvQRj8OGbXX4BDE3stnal4pu675Y7ArAPve3uPwq3U9fM0MWXa3F45rRl5PwPIU1osYW9MXLOZwMnVxahCGYjWHWT+kbhlSU67PUdfb+x7WDs1Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JsMN28hz; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JsMN28hz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIZlbZBww6On8rac6ImQqT5kbr463bPP5larSqkiO9LAvq+uhdDSl0Z2rhrer49iZtjrUbIcJ4sZCjCuMkpWbivZab3zhGJlxcOMnOqKpaM7mhWU1d+gUc109q6wOOq3ZA3a3rP1gNMy8Jibl3pJybg67yvFL9D8+BqLtMP19Wyge386YXgyXxi/5jGYZekIAnhWTE4JOueDycTAmcEEJRv2KMg6Y2TCkNlVr8js9LRaZ5wRSJxDWytV/GpGIREyQ/FRztzGaFGzOwbwQ0/3WBMTXZ8EfJFiWfG0Mq5ZvmfZLYskkiuu3TpElu3M1Qew49h7xs8rIuo/Tuf8RGpn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2u8Xqi+8sT7KGPBz8NKY8DLaMS5d5q+JcdczSn+cqM=;
 b=foJtAxUrpjy3q+8IbHV6RRtyqZ5Ed8BFldq8zdYuWdtBXybVBsY7mA06efD4fm6z2ivDffr6Frb1oAYOwilQiHioA1bg620p+4mShnlha8PQ2N8QvWRr/t57Ht9OWBQSRsbKwoKjOq5DCdrWIzHVnB2Sg+Kt/uxv8JobjBSOFDXJGRYpcHg2Uiz6ZVM0x057roxbxUprqOTCF77cWM/yaT9U5f212AjLh0/YkalTS3tUthAKQiix3ZHMBmkfRFIgdRVNVBVQsnFyWau09KK+UT0xmlzcUoc/d9JX3uZ0C5XIPfaWHcHeVphjusBJh6XZnPwi14Acub7cjbnDgqdvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2u8Xqi+8sT7KGPBz8NKY8DLaMS5d5q+JcdczSn+cqM=;
 b=JsMN28hzggPooVezmgHkKBzPC9Vt1me2hHx/JDLHWKOz377dMhhU12zG3CeCp3KZZBak5RJ7xkri2TNDVGQKLDU1hp0KQuvjoubxKPP5oIaOiqZCnIIphqtxmOnBDLKru1B1l4qCmPg3ouz0srMpkFVGt5BbiVY/8KES8ItKOuTz6SUhqSTDFZNS/xMLz/tm873uf8xB2KkEr8E6TPRvV6pp5cEeulHwUcOwMsDpONbUWp0Om/L+BzZGtqyv/XmfusqGj3MpkgjedamC4hmrlSd/rmyyasrnJ8l6pLi0CkMzJwvoXIq9hrXOZBTmAEuKv4KRAJMSrVGuF6clMu9QwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB328951.eurprd04.prod.outlook.com (2603:10a6:20b:787::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:56:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:56:54 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Tue, 28 Jul 2026 16:56:40 -0400
Message-ID: <178526691518.3668106.3450727316312989152.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407211850.79881-1-marex@nabladev.com>
References: <20260407211850.79881-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB328951:EE_
X-MS-Office365-Filtering-Correlation-Id: a27525cd-d232-4141-f83f-08deeceac0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qC/DgEt/tTwaM9xWMJxS6EM/AHRoiUZ6aD1DmCmoRt7j3a+MBDnV6cVKhJUTQYllQR7ekQ5E0/LMlSQ7sTm3+5CTqrICaR8zC28hfWvS3XU5Ko0EzvRuwKnBWYVuaLiXqT6sJHGEdOTQUYcfoQgebRgPTYLG7bWo7CP3igy1iZ1VmO6wpnZf2PYmk787OQ0J+OxwY9b7Br4o4YjNPMLwHGNW0wObUbiOtnbXfX6VAJH8XiLVo2vNsBI+vEIh3nl/LpHFlr40OA/wtnrylYxgr9i6QWND8iM7bNHslOxUhEbUGjDgPKHztFzW/LWdhs2RuxtIT2b6OBTou6sCA2ovz6SlwXVnkjx4xOh91iW879jyCPmGH5aDnkWGU0UtGwbP2nfuKYSbXHo7gYmMdesSI9sPVWSdU0XVV8iybAxv1oYAYDUMh0ra+fGj5HeFp4ciHtMSTE8y/5U9GU+p+EA4KOR0PLQwpsdzwRC4wiH4u3HiPBBq9b/XjmqGOhdIfbUI5icLxPZWIp6sTMO+aDYUTyw/Ht9c35A6Q1gDETPn3KdJWS11x/xNjy9ztStsGihBIi2jShwHZDbN9c+eqghOcDwHz1jmHHq/nm8rhRz4sSCNZFEc1nGJ22MyazXMzYKem2ar2EKPIWjG31FkdhbSRUEVyTXzex0kCwvVZGDjxOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnEzRlY2THhaUXpkSW9hbHh3OFJ6ajZkcHhLTVFXVE9DVnVZZGZYVTdpMlpw?=
 =?utf-8?B?SGs5aTFGWDRHVXNMbnFPbTFkSDcwUE9YU1NrN2MyTjhXMlVTb1BFVHhrWmpz?=
 =?utf-8?B?L1ZXMmErRmI2NGxDRkh6UGtvK3g1M0VUTjNDdW5VTHF3RnR5aDRNbS9NRno5?=
 =?utf-8?B?V2ZqYmdXZU1GMnh6bnNIT2srK1BVWXFSbkZOdlZKUHlBQ1F3ejM1cERkeFdS?=
 =?utf-8?B?UW9VU0wyOHJoci9BNml5S2NLR3lHOEhJQ0JlRXBmZHRMQmtUNHBkN3d1Zk5t?=
 =?utf-8?B?OWhQZmFSRWQ0b2E3NVJtZWozT3ozNUk4RDBLaDVWYkhQNWJ6RFJXTC9FNVJN?=
 =?utf-8?B?eEhvNlFHT0p4WlhkeEs5eUZWellWc0t0a3RJSGNoYk5STy9QR2hnOUtZcGpl?=
 =?utf-8?B?MjhsVDFCMEZtcldNZGYxSm1ROGVlRmk4cmpkeGZBeHRKWm5aSGpiRkJ0Z01v?=
 =?utf-8?B?MzZVbUNHY01NNWhzaDI5eVV1a1g3S3BaWTdrTERJK1NjNGhUTDhBYWpkSldC?=
 =?utf-8?B?SUhXVFRldnZwaDlVc05qRU5GVjkwSkFXdUI1VDMrYS94d1RmZ01ZRW5kcy9z?=
 =?utf-8?B?Z2djOVZiWkl5Y2V1QWF1RlpOd3FyWkZDelREQWxNWkVrWnQvM0lQZmpDc2FK?=
 =?utf-8?B?YVVTb25OaDVMYXFhZDEzcW1qNWRWazdtU1R5T05SNEVFV2hlRzRQR1pSWlAv?=
 =?utf-8?B?alpsQVdqRWROb3ZCVThUZzdHVTc2ZGtsVnZ4QWxFNDlZN0RhaW9pYUx2b0xD?=
 =?utf-8?B?TnBCYkY0bWdPUDNTelRPTmdOekdnZ1RTTFU3cWVRTWVyQU1GNmplK0RHVzBD?=
 =?utf-8?B?N1hOUXU0L0FhVlEzL0kvTzlSc01lbEpBVGlzY0hpWVZtNGNVT2ZIM29NWm9C?=
 =?utf-8?B?SXdlV2kyY1EvUk5lTW1LTHJqUVk5M2g4RmRZZXRETmFkYXpzSERhOVJ1ayti?=
 =?utf-8?B?R1R0K1FlUTlMUlVDZFNhVTlzVzdTVzlncGtuVU5rUnhBVVo5eHhaY1FBK0tH?=
 =?utf-8?B?K0FMTGpIQW1zTWFIQUhzak9teUVXTkFuNFk4dVRhb0VjMFphQ1d3Q0t1ZVJv?=
 =?utf-8?B?bkdQNC9HZWFaTjJOWGZLei8waU5vdlkwSUt0aUowYkJpb3ptdFlMOWVHWmlF?=
 =?utf-8?B?VXRGNGx5MzdxQkV2cTVrOC9jTGc2Rk5VNkxVVXh4bEVhcTBoeGk0Sk41MFVz?=
 =?utf-8?B?QTI5SzRzZXo2aTlWeWZqZE52TlVrR3BqTTc1c0ZPR0htS2pIRTZUNi9wUnoz?=
 =?utf-8?B?ODkwSHI2U09BblQ1eXlnSEpQUWt2VDZ3L3hLYmVOQ1B4MDV5NFNjYk96aFdi?=
 =?utf-8?B?aUlhUGVYdmxJOHFCUUV3eXNJdkZlT0hBby80bk5UYmkwZ3dWTWVFbGI3MXMv?=
 =?utf-8?B?QzBYdjNqd0t6a1k5MmdTUlhKRGZEUWNlOGtsWUVXN2ZLNzdmek5LSHdjQ0sr?=
 =?utf-8?B?K3A2RkY3TkNFZlRUcVlmaU9rRWpRVHBGNjkwTGROR0xOazcrVzgwSmNnYUFw?=
 =?utf-8?B?RGREWjFJVUdYTVFRS1pDdCs1MnpmRDhRc1poUTM3ajRIOEVyVjY2TTFLRlh4?=
 =?utf-8?B?ZXh6QmpXRTMzUUhXSG5lbUsyOGd6WWVnc1d5SEpXSWxEOGg0WTRZSERXbE9W?=
 =?utf-8?B?b0h3N1BjVjZ1dVRFQkErNXVyaVNSNTVPek9XRnRWQkU2Tmt3NXBOa1NJQ3lK?=
 =?utf-8?B?UnBtV1B3ZE5aQ0pWRWJHclJEWDI3SXMrTys4cnJ0VWQ0aVZFRDJiUkpFTWNv?=
 =?utf-8?B?NkdySDQxVmpCckNnZTZkQzNVQkxDSzRFMW5DVUsvbTdab1VZd3VJdHhSam1M?=
 =?utf-8?B?NXh6eFh5Ym00bW9mOFphdlEvSDc5SmF4TjJEYjd1Kzd4Z3FVMFhYTUlidW5y?=
 =?utf-8?B?UUV5eDM1V09MK1kxQWxRSllRdWxmVkVwODZYckhmbmtibWs1TU5zMlNCVVdM?=
 =?utf-8?B?Q1N0dDgwOVMzT1RENW1lbzdLR21VWXgvd000UW1Dalp3eDVOYW9LZ3JmNi8r?=
 =?utf-8?B?K1kyaGwxdU1rWjdhKzVtaGV5SG94LzE0VHJZYkllZERVUkZMR0prOWE2ZjZE?=
 =?utf-8?B?VWoyUytEMTFJS3FGbS84RXNQRndVZGh6QVJPRGtyMWhRdDZSU3EyOEZqazA2?=
 =?utf-8?B?S1RBZDFhOWo5L3N1RWtxNzlBS3JVSGFYbXdZbVpkOG1va3JhMm44UnJwY2tK?=
 =?utf-8?B?SFRDbzE2NHRQQjZIQ2ozb1MycUc4bGljWHZkRzl3WUxVWTgybnRjVjNZMFF1?=
 =?utf-8?B?ZjZZcFRBQ3ROaTVlMzFWTHVZenFNanNYYjlzRk9VNjRzazdsN2ExZFExbDE3?=
 =?utf-8?B?ZXhWZ1l0YUxPZktOZHhmdmU0YW41TWpaTElMN3ZPeEJKTm1MUmQ5VVVpbG8w?=
 =?utf-8?Q?nng5TksCeycVtqBPln3B0ovQDWxQXx27sAZp4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27525cd-d232-4141-f83f-08deeceac0d9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:56:53.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQ56eZC+MRl2iyuqqgFuMTNk4ZnNUr4hTqGgjXgRYQ0UKvcnLm8Zr0/1MlZZmSNECCb7hP42ieCxO/MNXdYCtaLMDSvXE41eppwTt9KlhN3bTtsLbD4lk7fkep4+GZMF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB328951

From: Frank Li <Frank.Li@nxp.com>


On Tue, 07 Apr 2026 23:17:27 +0200, Marek Vasut wrote:
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:
> 
> - AUO G215HVN011
> - Innolux G070Y2-L01
> - Innolux G101ICE-L01
> - Innolux G121XCE-L01
> - Innolux G156HCE-L01
> - Multi-Inno Technology MI0700A2T-30
> - Multi-Inno Technology MI1010Z1T-1CP11
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 3eacea24d258ff5169d84a419b07cb5828e91718
[2/6] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
[3/6] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: cfdee13eba802665ecd8751fefa754a759f414c4
[4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
[5/6] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: dca8d10e97bd121494106f54f4577291a9bb0f13
[6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
