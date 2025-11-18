Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A89A770FE
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454582; cv=fail; b=N7vRglWCD0Tp+mtto8O7I2OttVTs9hTQSsXpCCLPddOTBrFidcUTYGUac9jyKlUvkRmy6MO/m1QEh4z1E6JFeofRhmuUr7DwvBKQz635tXYB2WD7fTPAsl8KImI6/E/IzLbC0qH428WewwMOBqwQmVbVoUFUcDPK3ORpa8F/F74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454582; c=relaxed/simple;
	bh=HAkzd6H2SFbJ8vwhhF4KOZS5qSJqQwiOgqa7CLDA85c=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=LjGEMbtVU9nBTzxvsAMN+dQHs7BIP8N6N5zDQFAJLIGV7YsqVslwUr5CwcU3GmK13L6S4/POdStOjkFfODy3ULC19dLaVS5FiiGcjrmNiSpcyhaCJd9qVSMB42fJD3YzhH6wB2erd+Hg1opWl5UKUgF7BAgzDymsf85eO28+0+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W33KYdGn; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W33KYdGn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDn/UiH+4EyMxhMstT2lBG+H3C0y0LX47JzW3uHcRxv+6A+UOPr5nI1UbRH4zljGYx5oSbGDJs9cijXoBsb5eeNZh/icXItMMbadhYa5Uoq2s/T29BJQC1jn0KAx1F8AaZrIdoVzVzboSwivubzKmICohjata0v851vkFnanWrvuWHz+WsdpMEnkFoBVOgJJxk7UNzOBnyQaaFEQUFmvNFBJv7J8k2rJdFsvtWOLWwfflH157q6be+bxPafHooJrGQfIilOPInZm8OQLk2UUZJydYqbXbsW8kyLrQ0zl7fENyfVEhjeuJ3raLhARp6zORFllhW/E8LLMwfi9IKjYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXl+u5N17FlADSLj+Rw7FoQcLX8DS9DFaTHPdN9Qq+I=;
 b=F1e48W2Zkvgy9xa9VK8peE7rBEDqe3tOztdtk4s7NT5uLZw8WUnfTtEZrUwybJFVjm4m107GNiif3lom7hktLnS4yzZaz2um04oJ8lNbPrMZ+2ICl/HiZG37DKftG9E56VgDVrmiKe+EQOKXEcmU7p7jeAOlok4BMPDOiIBMeV6LSh6+6giymiGaflphQlF4S4k1m5Vjrq++8ltb7qP/0O+G2+OCwbs5PCnF6s65B7qvDu03S6KVmB35SZ38yTIs7Fy4wjOJflxXFL9AZcXoIwwRN4z8Fpj2lZaBpixr8bg0zi4CiR6Cez3oGedIWOX+20EYAvsI3kQrQ/jUjZYAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXl+u5N17FlADSLj+Rw7FoQcLX8DS9DFaTHPdN9Qq+I=;
 b=W33KYdGn4GTtNmklStFTnnBHqbUfyXtfSDwp69J/IT983nCWtLLml3IupW+fffeVFqcMbEznKTPeP4DqYwB5xmYWckh+r3FDgVnGBn+YmD/ROG20GU/x8N8Hv4eyKkb9ZRPDH9uGNofG1V9U2YfHXdwiykrTccfou8XxCjjZ7ehFLqjjMl+q5pZ5KAk/Ih69W6jsjEb8kooStAFFsTLTmx1oGPO1YocAejpiPdHzjGPHXGxrWKDXUgiEVeY5hM2oC/7bQvFEGuaA1yYZfujnGw9TrYtMDCJ3k7asEolkdnu3n3tl855lJFSBDGVkTxhZDTetBXqZeC97s543swOmuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:29:35 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 08:29:34 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH 0/2] two small fixes for imx8qm-mek board
Date: Tue, 18 Nov 2025 16:30:16 +0800
Message-Id: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJguHGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3ZSSYt3M3AqLwlxd86TEtERjC3NDi9REJaCGgqLUtMwKsGHRsbW
 1AGIo1fVcAAAA
X-Change-ID: 20251118-dts-imx8qm-7bafa38718ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763454631; l=480;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=HAkzd6H2SFbJ8vwhhF4KOZS5qSJqQwiOgqa7CLDA85c=;
 b=9hA+XQbI0Id1zOVuI4aHnfHAniFBMKInt8Ya/iZPCTNZx+3hCr+bT1hCZZfcfgSPbgXeZOGcu
 U2Le6wsDm+dCOECEUuO68PmRbjc0orA5d9D3WHMryv7NK7rZxJmObFp
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d5829a-71f7-4725-80be-08de267c9a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1JXYjc0ZDRSRzBlZ2owM1JHbVd5dTltcFE2NXBiL3BrclZzZGppVGFkRkVI?=
 =?utf-8?B?aE55L0R6SUU2UHhjWkxsUVU1WG9ublNlQmZUNi9MSTR4d0dZa0N0cEtWdFdU?=
 =?utf-8?B?bytaS1ZVU2MxTEhMekJrYlNrYzRWeFBpZVFtZFJ3T3Zoa3VhMEJlUzdMcmZ0?=
 =?utf-8?B?ajJUa0ZZQ0VDNEJWRXlGUUZYbFpBa0hHM1E5a05VTk0zZnBGWk14aGRCZHdJ?=
 =?utf-8?B?eXM3ZnJZSFFGdzR5QmtyL2pCK21FTE1iMFpvYk12b25DYlFQTEpWelVIZS9X?=
 =?utf-8?B?dHhzQ1VBOEFOOHI4KzREUndEQ2VMazJDQVk1KytpZEVlMEdDUWZzV29CQ2VL?=
 =?utf-8?B?U2JCVmNEeXdYMVJPdEo1MmFRSDZNS3JVMW9xWGE3Y0dMU2c4TzNXd0V2dlJz?=
 =?utf-8?B?QXYvajd5UTYxcDhFUHhjbEdQOVhMTDU2VE51RUhRSS9QQUdXSmdkaTBPY0J2?=
 =?utf-8?B?blhBMVV1M3AzZkR6bm4vM3VCNTQxY1VLU0MvY1F1S3Z0MXdzSHl4VGFWVUxa?=
 =?utf-8?B?WE5pRmRobVhTNFdld3Y2U3A3WjBzNWhoeWF1U0YxendpV2MyRDFxZTFWMndB?=
 =?utf-8?B?bkxaNXAwRURMNVFZcjA3aFBNV0pjVm9tV1FDZWJuSGVxQlN3UWc0VVc2ZE81?=
 =?utf-8?B?WTZkUEF5djAwem9VU0czRXBxbUN4V1NZcE1rZTFReGRkekR1K3Y3ZFp4SnZs?=
 =?utf-8?B?Z3I2bk1HWnN2dzhnd3N5UkJzRlIwTW1jSWdQTUd0QjJMY1pNendoSVBYRVJO?=
 =?utf-8?B?SkVCZjQ2b3dKdlBvcy9MT08rVTJaQnVwT3FSN3ZYbkNUOW5KbmlISCs2Z29r?=
 =?utf-8?B?VjRQRGpyRzBhZzhBTDd6Yy9SRzRwbHNRZmFlZGFyWnpOMW84MlQrQjFJTHAx?=
 =?utf-8?B?SGxQeTJkSmpMZnVLS29KaS9PcXBCVlVOVjFpZmZ5NUxLNzFWdHNsK0x6WVc2?=
 =?utf-8?B?S1N4bDRDd3g2dkprZW5JSDBZcSs1UWZ3SnZlZnRvdm4rcUJYNVRTVStXMy9n?=
 =?utf-8?B?ZmlKeGJnMWptZW4rdlhwa3EyL0ZMYTZnVmlKd1RPcjJBMWswZnhCYXhTaDBG?=
 =?utf-8?B?QVRKUjdEYzFkZGN3bHlOOU0zWXpWQ3Ixd29YN3JPVnY3bzc0UmZQRjFVSVFZ?=
 =?utf-8?B?cUtmY3ZwT0JRdmhIb1pZT0ZmcFU1RWx6VjdxclJlSndPUWUxQlNvaDgvNlZn?=
 =?utf-8?B?VFlZL2NGVU5DS2dxeXBDMlFrL1B2d3hJdFVIVktmcmk0NTJKNzRQWFFzT1k3?=
 =?utf-8?B?ZFNMWnlwZG9uQkRDa3JZS3RnUk1rSzk4WFBhTjJobWMrZkdiLy9MdSt6MmZy?=
 =?utf-8?B?dFl3MnNtc0ZvRUdFUWxEQTVqbkFwZFZHV0xvQlYzOWhPbUtEZFhrdFBhSktV?=
 =?utf-8?B?TGtrTHhLaXZjRlgyaEpRL1cwckk4a1R0QmdBTVZmMHF1akIzQ2VHZTdBcGpu?=
 =?utf-8?B?TUR6Z2FmZzNlWFJSWWRqaURsaHd2K2xNQmExOVBMZ0JaQ0t2d0FOUXNGZkE0?=
 =?utf-8?B?ZU1DWG1DMVNTTjU5RWtzcUFYaXdRQ2g4WUY0RDZDZkkzRS9VU1ZyMzlHVTZJ?=
 =?utf-8?B?aEZGZWxGaW5XcjJXZzlyaXRKaXBIdGIzeDFkNnd6SFdGazdXNU9ZMWZsc2Ft?=
 =?utf-8?B?dmRjZHpHSDF5cGZEb2loMStRK01RakpzVzdZRk9idGJhRGVXNkptK3drWjlH?=
 =?utf-8?B?ZVkrdy9mVlZSZFV4eUtpL0VJSWRBWTIrN2FtK2hiVC9SbXh1YTh0L3VnTWt4?=
 =?utf-8?B?M1VtaDJjaXVrUHF0M2lITWFteFZ1U1ZkcEVHWExJWDEvTkdmakkxZC8rWXlI?=
 =?utf-8?B?U01TaHJHNURIUDVJSXVSN1pjSXRzOS9GdldnTmtEN2ZwaVpBdE40REIyU1Fr?=
 =?utf-8?B?VmUxRTdNNStyeEhSNU4wNmRnVUE5dzkxTEI1UlVFeFBQalNHZzkvcXhsQmF1?=
 =?utf-8?B?NkV0ZE5BanFPV0FTSzRGTSt3ckZLOGNzdkhNYVNMWFJuTFBUWlZrVHc3UXk2?=
 =?utf-8?B?M2ZmZHhCM2VmQkoyYVhRMHRSa09KUExMZjFIZGRHM2NlVlJWcjZvbnJZREFT?=
 =?utf-8?Q?oZfhS8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1E3Z3FhZmhndHVvZEdoTkZOWXZDQ281ci82cjExQ0FUb2c0akk3UE1zSzZD?=
 =?utf-8?B?bTd0VW1JcTJDWU9iZ0FsTlpJMzhNU3ZvOEozWjFUb0ZjaklrR0FSMkpHb0c2?=
 =?utf-8?B?T3ZHMzZVOUk5N0YvWTR2RWdQUjJ6UFJwNjJBZnFaak1IbXVlam5lanhodHRF?=
 =?utf-8?B?Mk81dTB0VWI1c2pDNDdLb2VrcithdmxqR1l5RlNiRS9aQ202MWwxTU5BMnFY?=
 =?utf-8?B?L1pkdHhJVW5pbUFsbkNLMUdvRkNyZGN2WmlEWHhnNjY1ZTNBdFl3S3BlQXlL?=
 =?utf-8?B?SjIxeW56RGpzVGVsV1E4bXZqb2JENlF4UjRySVlKL0RwL0FPV0VXM094cFkz?=
 =?utf-8?B?bktYbHJWM212K3cvNEEyckpiZ28yOGFEVHNrZlgzQWxVejhkdjFkWGRrckY5?=
 =?utf-8?B?THRPUytBRUs4TWhReEtPQUgyWGxrb015WG1NYmpzUnJ2SElPYlBXMzAyeS9Z?=
 =?utf-8?B?Wm9nS29udUJpc2FUOHY0TU4zOXNpZUFLRFpLYVpETTlXNTZJckNFTCsvNHlJ?=
 =?utf-8?B?ZzF0STVBMjZETVFleHlDd3h3VjJaSXhGekZQM2FZamQ5M1RBZ2pCWi93WFFK?=
 =?utf-8?B?ZHp3VWFJTERKSzRhUEI0M1d5S3RhWmF3OGNaQkxzK0FVVlFMbjdONWlrczJr?=
 =?utf-8?B?M2ZBNER0Nm0xcWl1MTVQUEd4YWRqQVFXTHhhcTlZQTFoMXk2YUUwRXR1VmVp?=
 =?utf-8?B?WHNHY2hObUZTdkhRTGh4TCs5a1JaMnNOQ3ZIcGh3dTVJa0tJbWx1dmRTZEs4?=
 =?utf-8?B?Y05oeENUZG83MGlmdVFYL2EyS2FFdmlVQWtDUTJXZHZUUjRiZnBad0drUEJp?=
 =?utf-8?B?TVorY1ZkaW9vMnJBZkpZNTlYNDFla3ZoQXRLYWdTcFZHNkZ5NGZVb3FaMzNB?=
 =?utf-8?B?TmZncnNRK2VpbjA1SmM5Q0V1eDJ5SVZUaXFHVnRIR3pDVmRWbFYyaDhQbmZE?=
 =?utf-8?B?S0Z0WG5aZTJoZDYrUUR1ZFRFZGlob2syNFBuY3ozVFJ5VmZnU2J6aFl3L2VQ?=
 =?utf-8?B?MFNQTkg5OU1Candob0FpN0h5Q24rWkhkcmRZUEw4MDg2d0NOY2kxNVNiUWN0?=
 =?utf-8?B?K3RYZS9zMkFQTEgxVDZVcXVNOXpETm9pMzdrSktVMUQ0NHphZVpVSzlLSVZN?=
 =?utf-8?B?OC9CY0puMlAyZXZRZjZpSHhvcCtlVTRVeU5TUVRnNGNtOE5RZCs1V1hTRkxY?=
 =?utf-8?B?V2Q0b1pPM0N5alhJWjJ2ejIxWENUbXpRQXpLSzZubEhnb2tVZmZRand2ck1G?=
 =?utf-8?B?eW5SUHpJYzhzVFpwaVkzL21QSjdkbHp6bjBqb0dvcHprdkFJdWpOdm1xamcw?=
 =?utf-8?B?UHBWc3Yyb0MwT0F0QzJQc1hWN0dEWmd2cEs0ckkwYzhJSTNSb1gza3F6Q1VJ?=
 =?utf-8?B?Z0luQW9yZitzdG1kR2NQR0IxQS9ON0x1VUptc3RWd2tqTE5hVnJSOUVPQ3hm?=
 =?utf-8?B?bjNpa3I1S1hZN2V5L1F6NXdNSFo3aU5LOEJtTHNFRis3NXpIb2s2dkFFZ3RV?=
 =?utf-8?B?SjJwRkowRFRvODdqTzlZRmxJRW5GL1JwZ09meFcyeUxHK3ZMTXRGRXc4WWZq?=
 =?utf-8?B?WXRyYmcxRmRNSGR6RFNSeTVHRnJqdjVUNkQ1M0ROZk9UWWxFTjBDeGNhcnJP?=
 =?utf-8?B?WGFYTysvdGdmamloU1c4TGgwSUV1TjRETHdzMzVqV2tISW9hU3dvdlRoWDMz?=
 =?utf-8?B?NlhZVmlhWElZcTVMLzBVZmZ2Mklvc3lwUWhZZGFDbmVWTXp3MUdHSmJ6VXZH?=
 =?utf-8?B?amllUENqLzRQRnFnQTFaWk9Bd05uYzVPRm1uNWt4RkV3VklIajZGNjZBaG1X?=
 =?utf-8?B?YmNYRTU0QWxKTis0U3dPRHZFbTZ1UlYxM0RXRjFKalJtVjdPS29Pcks0R2Ux?=
 =?utf-8?B?SGN5MVpXek9UL1Q4SXZRRXZDaU1WOGUzSlZ6R3BMZ1JxQmwzZDNiTXNIMUJr?=
 =?utf-8?B?NlFvZUxEb09TWmF5UndMSHMxU2ExQ1pEVTlYV0hMVXNRS2xKN1I1VDRaZE1u?=
 =?utf-8?B?eDlFS2Q5N3JKK05WR3V0Y05OZmtmak1jL0xhMTh3Y2dxbm8zTnJFcUJidlpR?=
 =?utf-8?B?OXBPVElCUkdTZlQvQ2Q5UkxFbFY0ODdaNG8yRE41bExzMjFRMVVoU1diQlNU?=
 =?utf-8?Q?JYWV5fzDMxHjZYwNWBtAIZkmE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d5829a-71f7-4725-80be-08de267c9a4a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:29:34.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igFVE3Q+8t/9dLonIC+jre7k8S1/+I93X4/VjmkdJEitQnA5xbWQdn+HOwzRxEQ3u+ty+SgtOgBovT05fj3Bmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Haibo Chen (2):
      arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
      arm64: dts: add off-on-delay-us for usdhc2 regulator

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-imx8qm-7bafa38718ea

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

