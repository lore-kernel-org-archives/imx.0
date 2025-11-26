Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4629E0F8
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144355; cv=fail; b=q1SanVZyj4mS38rY2vDL3gxsU4VceaCRXrV7uBp10vghqWOqqwHTF/n/YfmMCr54PV56BRcSv8tHijeNqqzOrbdPJz1lOXg+uX55FAACP0nyKJdunJUV4prlC2S7U1fiuVlL1+0dlxGJfaKCQ8wXuhRrxMWOmeRg4PO3dYWfAhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144355; c=relaxed/simple;
	bh=AV99izlYvOSvwSi9O4+GqelCSqwg6LBw6T3o6KvbtTs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=hPKL91zbZDz1zpc5iQujVxeGtQ9F6XiIoI2l0sH+AYra3LW71/Zg1SMnoPs5jxq4XwZebqVK2eQFrSbjwWaKPsk6tbTO6+B6p6987+1hvSpV27H9gfQQf1a/cLr7ydn4Yo9CUA4a17mJr3nLq//l8JlAStiQJrkMNfXKeSe61LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VOAYk+fb; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VOAYk+fb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAWspurId3H2Asq7hIJjsclvq5e+fpJ/aQB2OGFLcI1HiduzCueNprN4bOEm6ycs79wO4xC68e3GjacA7XIU/yEoLSdkhf7BmcmGyuZ37Ro0rNUmH8BO4pgw5Lt6N1m7N77G+D4MgKpKm+AgTDUUnRxuoxy4C+ZeUnOWmBNGSANbcOssGn0NuMdCCY8NLNv31ojwF6zCT5OJy671dKGg/kqew7GtZjI21zx4aFIuXaoor/v53ZqzuogLO7b7qPpb/JazyNCqKP3X2UIteY+DrGyg/JuOhRE+FuodAT0ct1cPnaUYgG0luG3PKeOmu5oI9F9cRFt5msrl0LnWxmYm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xKl+qw2nBs7WC0qKCNTJaB8OFZ+/fAhRFNI4ZT0mJo=;
 b=TjBMNx7f96x6p75SGbVS+LeLSgMXNak0vidxLxsifIxSiL3hBO08lwrkt/1yieIUll8qRnqDkUxFb0Jcf7rrBdXhBUisQj7KrMssqCAb7OQvV27M9Hr420SDub0k6fkzfFWxpd1B0QW7WzHEDdVJJtnX/J2UaaSWA7cT6o08nOpCJ2cPlr/K4ry8sCGnoFdh4AEwczbohb6fYTEK//0FLJgesiq8EozErsFWVt3WHJOZ4dfC8BzBrYmwsRXiU5bwcS9vvXsVnt8OCn8Axw7VqvzzKF5GV/vIU0/voc9DQwfT02zZxAnM9+lE2OngPNoSJffJrnYZltRD3LvcOANaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xKl+qw2nBs7WC0qKCNTJaB8OFZ+/fAhRFNI4ZT0mJo=;
 b=VOAYk+fbGVEhqvMaonCxuLaB26ihx+bsGs4stYtlifQigBByZq+6Qq8lEnegj+ZnYBAR9QVU2ZRVgQWVG/r9gEVbrMILZ79Sic/EiKgwiYlLfcEpZB0OvT/aM6DrS13b5GUVz71/yLkbpnxDwg0Z8dx3TuO1kL+zPSB8p2Uw9nc/hFAHTc3318rb1RROv/wt8/YN5qGGecKjgoj0fFfSa7UXshW4VT7iJ+T7D/GLAMGM5MOLK2pO0rI+YyccU4OfAddWvoJ+ebphrxQe+Q+z9tQvhVzsKG1071moMs1ox4MyFYae1wVKvfHRGF+BNj2cCoOkTt6XUsET331tecNtpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8752.eurprd04.prod.outlook.com (2603:10a6:102:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:05:50 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:05:50 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 26 Nov 2025 16:06:44 +0800
Subject: [PATCH v3] arm64: dts: imx943-evk: add flexcan support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-dts-v3-1-7545d957e795@nxp.com>
X-B4-Tracking: v=1; b=H4sIABO1JmkC/1XMQQ6CMBCF4auQWVvDjC0prriHcQGdVroQSEsaD
 OHuFlyoy38y31sh2uBthGuxQrDJRz8OOS6nAkzfDg8rPOcGKkkhohY8R9Gy7Fg6bg1XkD+nYJ1
 fjpXbPXfv4zyG1zGacL/++4QChcauIlk7qZRrhmU6m/EJu070K+qPoCysdpprJF0yf8W2bW8ob
 EyCxgAAAA==
X-Change-ID: 20251118-dts-ad4bd4fdacd6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 frank.li@nxp.com, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764144414; l=2423;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=AV99izlYvOSvwSi9O4+GqelCSqwg6LBw6T3o6KvbtTs=;
 b=7lHjehsEZhS/XO3ibhJWikKEHsGSZ2I7KDxVuQeSf57opUxM5/cVLfugv7W+YkqoXdi4U4RiT
 ydfhCJdg47IAO9oionYNguUeCreHOfziNyCHHaO+1OSjXM9DmwYHEKc
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c8a685-fd49-4db2-aede-08de2cc29cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3JRclhoWnBuVjR5dGEwcGRKejRCdVlLTmJmQ3hLcXdScDVMVmhaVWp3Vzhm?=
 =?utf-8?B?TVhkQ01lYnpzL3grcUplVVowQzdycUdqejVkRERzcHlMRE41VVZuL1hLS0Nm?=
 =?utf-8?B?TG5JN1k5WXlZRVlIUWg0bWhjQjliMWxNVks4VlV2Tldmdy93V2JSQzdBZ3RL?=
 =?utf-8?B?dUZzVDNkN3VvMHFTTi80MUFIM3V1N0g4L1ZydmwyZ2RDNUpzNmEyUWtNMUhs?=
 =?utf-8?B?ZUE2b0dRSUUrbUFMUE5xSEVIWTZqL1UxMGNuVEZVZXl1OSthd3hzczMzYjVl?=
 =?utf-8?B?MEMrSU55YWptVnkyTDhRMk9hRTdUZzZVMjJKZWlhRXlWRi9ESFJoOThQKzRJ?=
 =?utf-8?B?elk2L2p4MXVZTmY5QWs1V0FsRWoxMWxjSUwyZDc1TmtwZGVVSWlPQlcrU2ZL?=
 =?utf-8?B?YUdFWFIvdGJpdHN0UEJucjRZYlRaTmNiRjFTSHlXS2FzYWpETWYyYThTVzYy?=
 =?utf-8?B?Q1VwT1ZyUE5xcURVbFd4SFZwZUs3RDhIVzVKK2YvUkEvNVQyYWFTOFpma1A1?=
 =?utf-8?B?VzkrZWJDY1VXYnJvK05HL2pBSWloT3lhRFM1ZVI5WGEySHY3a2g0QmJ1L0RG?=
 =?utf-8?B?RzZqdlMvSUJUT2lLRmhYZ1lUcENzRTkzVGNhZ0srOHNRSjBHYUxHV3BVTW4v?=
 =?utf-8?B?VWYxWmM0VzNGWjJBdndLRHNWOVh1Tkg2VmNCNHltclBienZIZitOakd4cTVG?=
 =?utf-8?B?VWloR2R4cFlLRHZUYkRUMnpEczl0Wmt0NnMvSVp1Ukg3bDhiZ0x3QzlEMktk?=
 =?utf-8?B?LzZGam1PUEpqb0ZDK1QrQXBwRHhEblFwbUZWZWVLdHgvdnYrWFVLUFNTWHlD?=
 =?utf-8?B?SmI1RWJSY2RiUjVuY3YrWjhwblBzK2QvRm9oNE1Wb3hDRVFBUWNCeno1MVp5?=
 =?utf-8?B?QU10L1pNbVRPdEVzYnJqZTNMS1ZoWEhkVTd3Tkw4ZUYrbnRFSXBJenNOZGw0?=
 =?utf-8?B?YXBTaVlDYlp1VEZEN1lzK2RJaG1tU3BhUzRFQUhtekYvUTlJbk5pVE9sREZp?=
 =?utf-8?B?NjlpZnFva0tkdXdLanpaK0N1UWtuTDZ5YlRSM3FtM1k2RVEzTmZlaHZEWVZl?=
 =?utf-8?B?MXZiWWg5SERFZW45VUxwZE1acWZOclR3Sjd3S2duWGxLT3VHSVAwTjJFcjkr?=
 =?utf-8?B?UnBnU3pDYjdTeFV3ZHBYV0lGaUt4aWRZcWJ2T1o4UmxqM2U4SUt0aTFmWTZX?=
 =?utf-8?B?YmpQaDlVQzJOK3g0NThnUVh0STdBdjIwbVpnWWlvWHN3S2R4Y3RkaUlSVjNt?=
 =?utf-8?B?N0hDM25EWktHYWdwSDduRGFqaU9oZVhCL0lVK0JaYWIzR1pnamNrNlRkMlM1?=
 =?utf-8?B?UkxqdTZ5UXN3MXhCUzFyUjhabHdvWGRDYjVhdmIxVDJDZzNZYnNuclg4ZWdp?=
 =?utf-8?B?VFNvbHh4NXZnQk9UMFFyRU8wSms2ZDdzeTNkUVZXS2F4TUZQd1pUVXVyNk5z?=
 =?utf-8?B?ZmsxWGwyWmZWUDhER0hUN3BZYTVadzdwa1FCQjRFMHlCVGxXZVNra1lITE1m?=
 =?utf-8?B?U2QzS1J4bGViN2pTRDhnZnVTVnYrV1NuQncxOGVCbWJic2o5bDhBVFk2dW5L?=
 =?utf-8?B?dmZ1bTFlUysrdGpZY0dLbVo1RkhNWktvRUZEaXZjOG1EYjJFNXlBM0tUSWsx?=
 =?utf-8?B?NHYzK3lJcjVkbGxaSGNjdkZHZFlEbjR6bm9NTjJ2KzZsZnJDcllCRWxWd3k2?=
 =?utf-8?B?Z2dBaGhPL0x1ekNXdEdKck9keHFsU0xteU5VYklTSU16VTg0d2ZrUTRpYXdD?=
 =?utf-8?B?M1Z3M2t4QUJNRHlJYjZUc2N0c1BHNkVQeHB4ZHI2RWZOWlgwNmJNbjBYUjEw?=
 =?utf-8?B?WkpKTXk4Z0Npby83UUhXNzYwb1VLN1Z3ZnVIbzdCblhrZU84Q3h3dHRVR1Y3?=
 =?utf-8?B?SGlDRG5PTFozUlQ0SzVIQlIyQm90NzJEZnM2WDFBRzd1RmZQWkNFL2lVSU5P?=
 =?utf-8?B?RDdJcU8vQ0F4eEd4Z0c5b3lwVVVnYmRMUEQ2anV3VHJJS2FwRkowczY3K1h6?=
 =?utf-8?B?cy8xTVR6QkRBREtScjdSd3YwK0R3MjQzNUlqZm5kNkFLNld4MWhoL2IrSG5i?=
 =?utf-8?B?LytMUExuUEJhdytxRVEzcHdjQTJ0U0VQUGg4Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzJNUHdNWWo4QlMvMmFaai9vZW9Kand6VWRUSTNFcVJva3dJU1B0VXBGemJ6?=
 =?utf-8?B?N0lzVTRWUEx0V2UzWEFWckkvR29BWXB5UkZSaE1KZXZGYjlJL1FuSmplc20x?=
 =?utf-8?B?ME9kMkkrRGZWOEhhWFdCMFU1RWpEWkZqNUtwN0tGaHdxbWNKbld2QWdCWkUr?=
 =?utf-8?B?WTNtUi8vRC9CQ2hEWVZvQWl2WCtXOEhNVG5lRE9sRXdHazl0MUYxdTdZTjNN?=
 =?utf-8?B?VTVnSVFmWVlocW0vcW85V21oT09qNXVEd3BCdGVmNHdsY0wvMVBOR0lSNXVX?=
 =?utf-8?B?TldFeFhXMUk4cjdtNVNzbDc0MS9iTVp6a2UrVERVaGRyVTdsUnFjYVNZODVF?=
 =?utf-8?B?Y2oyVzg2Y3ZkSHVqalJCd0xteXlmR3dmVENjcEs0UHoxZUlhczdpeU9NMFcz?=
 =?utf-8?B?SVZLWjk4YjRZU2dDb1pJc1c3NWw3UHFFY2ZhZi9RM2NrcDdMYWxtbHFJK1Jv?=
 =?utf-8?B?d202VmtUWUF0SE1GS0VDcDRoRmg4WGltaGg3YkJtS2MwMld2d2RrL2pEREtW?=
 =?utf-8?B?U3ZHamdHRUU5S2RNYTUyS2hpc3J3b3VwVGphOHJWSy9XZGdyZEtLNDBxZlhr?=
 =?utf-8?B?MmViYWFORzBKYjBFcUN3bVcyaW1uaS9DZit1RUNQby8vV0U0S2VGYkVjQ2Qw?=
 =?utf-8?B?RVNERm96ZTNwOTU3bXFLSm9DUURqYXEzRkFLOXZJS1VTWWhaS05aY1NtTkFj?=
 =?utf-8?B?c05SaUFBelA2eG92NHhUUmo4NkVPbXBZMEhSd3kzMk4rTVNvRXdkNEZxaGZj?=
 =?utf-8?B?VG82YUxKMW5qN0xaNWJnY3RjdmFzTERVdGVnRGF2dUFwZDdncDVHeGpsYnl4?=
 =?utf-8?B?enV2akovcW5QL1BNaTI5UkMxWHduUXNOUUYvRjh4MXNSellFc2dVSnU2WFVF?=
 =?utf-8?B?MjAyYkFoOUpBWEJTc056RC9KNFJmc3VkcDRZTlJVVWpqblBDdDMwa0hWT3Fl?=
 =?utf-8?B?TmJMRXlCR0hVTWQ0RWZ3bzFaeExCV09xT0hZMlFQeHNKNHFPWGRpY2ZZNUV0?=
 =?utf-8?B?L1NaZ25XalVQQWdYZkxESW1jalBuK1VyM1lJTU0yWlplRUFzN0pGVkZwUDBq?=
 =?utf-8?B?V0dkcHh0ajVEU0hJRm1BZEtkQnFudUlSMFZYQ3ZaNE10Z2dTMjNTd2FnNG1I?=
 =?utf-8?B?SEp6MjZXaE0razVUV3dwNmQ2djZYUjJqbVZwYXhTSlBSdGlaamRYRDA3cytU?=
 =?utf-8?B?cEdhV1IvaXdOaThTNmFDQWErbHhlZmRkMU02K0V5bmtudDk5Q0xVeGV1UGUr?=
 =?utf-8?B?dnUrNUlsTW1qMkxTNlNRS0xYMUdXRCtKcGRpRml3aEZhd1VHMGpoN203dWpB?=
 =?utf-8?B?enpuYVZKWU1YeURwcWFidCtsTjlhajZQSmN5ZjRtNGhtNmlmV2paaDFTUzR5?=
 =?utf-8?B?L1h6S2xPbkozSVc1RWwvMmhXb0ZTeFhvVnBueUExempxY1JIanp4TENrTGZy?=
 =?utf-8?B?QiswaU1NZ25ibHpCNkVjWG9GZ1RUM2ZBOVhRT1RmcldqMitMWkdpaW4yL3k4?=
 =?utf-8?B?RFkxZG8wUTVLN0ZFK0J5YjRUOTR4emhNakwvcll3TTFqdXpscGlqKzVTYzh2?=
 =?utf-8?B?VENnRkFtdXplMVd1YjVsMCt1Y3B0enY1RkJZMHpaMm1VbFoyWE5EMW1zTi83?=
 =?utf-8?B?a0s5SEFrU0d5Y25GMTZIVUJLYys1VVdjRDJqa3NpcWVOd3ExWXlwUTJMY0dy?=
 =?utf-8?B?Z2ppSDlsdUxjNFRSMjNkZlpBZGFyL0pKRFJQc1F6VFdIMFY2RmlyT3Nya0dO?=
 =?utf-8?B?QWpzN1FDZ0pRZzdlWnBOcFIwT2NESk9vTStMUVZrcnAwVDZKS2hYV0RGaVhD?=
 =?utf-8?B?MlR2MkdiTHZpcXI2YlhtSTc3aHNiME9CazRNSVFMazcvUkhqa2ZYM0YvQlhL?=
 =?utf-8?B?RmJtRXYwMjR2ZHd6akU1dTJRNk1UL2gzYkVHaXFYSnZVQ0E1UzlYbEZQam05?=
 =?utf-8?B?cjZ4ZWQ4NnZnOEhOZlZSNVJkRTdkS1RRcU9HWUJ0aW5SQkR4U0hkRUk5NTNX?=
 =?utf-8?B?dldBMGdqcWZoVXZ3OFUzM1JtNW9RSmZyS2gxVUNtNks4cDJGRC9RS2tCQzAv?=
 =?utf-8?B?TUxPSHZ0Slo3M2pGSkVFTnRIWUphZEVLWUhvQWdmRHV4NjBVUjZyeEtBR3po?=
 =?utf-8?Q?0lSdKKM8dLgWQ25Q/uLmvN/Kr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c8a685-fd49-4db2-aede-08de2cc29cb0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:05:50.0395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecZchr1GRFDjayjRyJk0TSpPTwcTVe4PvN4+e42ZccFVpR5pZGB4HJdUp8daSaSxMknzZMLNt4siWcYjpROjiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8752

Add flexcan2 and flexcan4, and related phys support.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v3:
- make all the changes in alperbate order
- Link to v2: https://lore.kernel.org/r/20251119-dts-v2-1-e8f8d91280dd@nxp.com

Changes in v2:
- move the can-phy0/1 before dmic, use nodename order. 
- Link to v1: https://lore.kernel.org/r/20251118-dts-v1-1-81b6249f455f@nxp.com
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..9f68f491fea07312be595fd6829617fb59413616 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -25,6 +25,22 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	flexcan2_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		enable-gpios = <&pcal6416_i2c6_u50 3 GPIO_ACTIVE_HIGH>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&pcal6416_i2c6_u50 4 GPIO_ACTIVE_LOW>;
+	};
+
+	flexcan4_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		enable-gpios = <&pcal6416_i2c3_u171 0 GPIO_ACTIVE_HIGH>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&pcal6416_i2c3_u171 1 GPIO_ACTIVE_LOW>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -127,6 +143,20 @@ memory@80000000 {
 	};
 };
 
+&flexcan2 {
+	phys = <&flexcan2_phy>;
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&flexcan4 {
+	phys = <&flexcan4_phy>;
+	pinctrl-0 = <&pinctrl_flexcan4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
@@ -431,6 +461,19 @@ &sai3 {
 };
 
 &scmi_iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO34__CAN2_TX		0x39e
+			IMX94_PAD_GPIO_IO35__CAN2_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan4: flexcan4grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO36__CAN4_TX		0x39e
+			IMX94_PAD_GPIO_IO37__CAN4_RX		0x39e
+		>;
+	};
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
 		fsl,pins = <

---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-ad4bd4fdacd6

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

