Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB03DB65D
	for <imx@lists.linux.dev>; Thu, 14 May 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747212; cv=fail; b=tIiNBqE483Y3JB6Kz+oYWwpGNeunvM738QyiUqRhIEoodvFNOHJQy+ky+AtoVYrXWxNlKmrc7e+AInnouBh2zGC3TdMkBmy4fLgITOytaX49C1reNkVUnDE2Bue9iJXmRoWqky4z9dmmkcUDnN0N93r8antTarA3v/qCmHKPpPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747212; c=relaxed/simple;
	bh=c3I6BYER6Yboa6MeglcEQgyAD4HTbI0ndb4a0es89kk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bvR6faMMbkLEPv6TBbCdurK3bPvSoZSucDyltUx+HFDbRe7xLFFjkmpaXw9j5oM9TDLLGqiqqztJw9HhREJNqYxlLSsWDNOypjtO22EXu1zMY3Tt00eRoCQjaFYQvtAbwdbnrTKc4UMDWIXJxK/DdM8ndAD92mRYA2ih7Jsi1L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfodK1Iv; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfodK1Iv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5+LRiocnWG6ahvOzkCx50rqrjm3M81tHHnj68gAboAZY1N01pf2UThn7F74ad4NrZeMNvRoFU93z2F3t3IkhIBAhW1wkvs+WvYkYgcXG/H7PmOVEDc69Aip7a6U8Ljs0hlS9RUQZTmCe7bNG3shT6mrWZBMD0l6bmEHuQ7QcG31lzvsVz40Zsi9zgWdaPBPrYDWemZrOjdhRKsjosay7644b8NFVRxlMk5Nlt9IKZIIiu+4WcrcShzxLZM1X10/nmRgncYtk5/CbNTKLDmGXV9cmzyUBj05yjiXicHK5X84hou7DdQoX1hHtM/NEa0fjcgTNQJJAWGZbYxlepF+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9j7VTl3wzAlWqw5YysdwceCnIU1yGTaS91uAcAJudA=;
 b=isI41qQJT+w5hda6oIh7vAvbIjTcjCEMQkAEkaqPQvJrJ+8ZQXkkid22lEsJCPINY3q3YqJocJyYQ10KRsGuAc6JEQfs/oXNESn88c3EVcVPYlTXFqJeUmbj8ky0Nnm8Mc3ZNZVjv0uHAQyKHrpn+zjKF7aE5PUCF1tdnRGyhUaCHnDgiZgjrx2qFAxThyCUuJBZdRH35Y3VlLqVcH6nWNHogMXHb/2aekbcFiG3uLKL4a/fefZorytlZQ5xXCZES/ELGxoQOqYjb9WlpkUxySSAUdn4pxXbdjrUTTxkm72XrlskfTqRafDXbz1WIELjOa9SbYvbrM/RCMOBdDNcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9j7VTl3wzAlWqw5YysdwceCnIU1yGTaS91uAcAJudA=;
 b=XfodK1IvZhJXenRwHpGRsogaIZHwlR+x79Y03uCCJo+kVMWjXFKGrrviuw6i23crQVuv5LhBIHlGgV8qcN7SpFMhbBj6WvQNVmNOxP0YbbdkCf73h4gWQKJjYk6bzCUM/gQGZ6LeZsFg2dumW0xBjNC7a2t0+y4tMxr61rAuis2AD9RMux8NLzPHUUE3NzqTU92HIvMlM59WznlWlYupf3DeaA3yqrs2iZhIBmeg7N9CdEqNE40eTe6efTxe6k7G3aOKuWJrshY6VRyMZxtRCFUiNvQo95WSz0xF4oMULMRp8f9PTdBPVFEMvWMrxklRJkuHcgGDjcx/ANWTa4TnmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 08:26:41 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 08:26:40 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 0/1] add SAR ADC DTS support for S32G2/S32G3 SoCs
Date: Thu, 14 May 2026 10:26:38 +0200
Message-Id: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 222f032a-d4bd-4684-0096-08deb19285e9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 BJpKeowQhP2R/rnFA99CbdHwXHNXzs+B0MqAzRGZ/kCw5Aoon5YcZh6NDzi1izJ4farDf9ttd7mKzrONREY68xWgA6fVmJehCry1ikZDrOkHzCxDdy//tRdlDrO+kjXFy5qzTUpFZsHRFJuOZMf0ox0AGfxvXgWMI/9RzlJQV3UrGVqMDhyFxEpuxHEzs9nMd4mX0qFB+e2luRszfbgVsYckCAop+B17Pfa2XmdWEf7ILuADy3do3dFdvhIAmoyemDIHVPR019OmOkdT2q4wwUWAfZOlbF5BV4TT6cWFjqMkoaId6vnmpuMvNGrtl9MPUyetMudCcEsX91SUCF80U/ZYt0x6epQ5lprZ7te3aidpH234N4OcjM2xiff+1N3JdNqAKt7wbu7BA/SdJybUs+EaWa+jimR8dlUgKRWkZXRH/jCOHfg2zFHfpQBehrONaGryPUTGnY7JODJxNspImDMqPcYIApTjTPObJXrvjK0EkW8wxsvHXlHuh8LMKK6JAmeR+YoztzD4kxlaD195z/lM1TlBmxc6X5xT+ttGW+acGdfQYWTotZ8HKWRhny01/bTI7wxXC80UH9tICECsEZiKRi3BMN7vyeLaWtXfxmUEq15RvNn8gRRd4/x/KJToGJfmW4vzbqitFtxrbBkxT4/5cg2NgyHnCJaGokEqjkZzPdpYCSVhRp1UbZQa7dWm
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MVVnUmptMDF2TC8va09VQVhiYUpocWF3R09QYkowSnVyQm9NTFcvRWRKaWFU?=
 =?utf-8?B?VUV5UTVZcG5lZ3ZqNjdpNmJCNHRhQktZdVoxY2NDcjRsRWJ2YmVsUlFHYTM4?=
 =?utf-8?B?NW42bEF5L2lTWnpsVkNJMnZtVXdVdHhOZ3FDU21mRnBUWFdYZjB2UVJaY0Jp?=
 =?utf-8?B?MlRKWko1SVBVYXNiaXdyaVp5Q1JLc25EektRa3FHLy9aUFhiSHNjelZkS0Q5?=
 =?utf-8?B?UTdURWNMNzVpOFNQdU9oUDk1VlBRVThsODd0V0o5THFwM1RYUHZ4SVV4T09Y?=
 =?utf-8?B?MFZ1Q2xKbVQ0VStURmpCamRpMitBS0FjVjRLUUtGVmQ3TEJjbzQrcnVNQzd6?=
 =?utf-8?B?M1ZGcDFVZ1AvNWZ4d0pUdll2L2NISGdLUnRzSVcxTjd0VDJHWVJyZm50bWQ1?=
 =?utf-8?B?RVczN011S2xFemcyREp4eHVTZ2JoK3VzdVhYTVlHMHk5MTdEMWh0emdWdkhz?=
 =?utf-8?B?YWRaUkFXa29yTWp6VnlwQVpyMXFOQ2ZPV3E0TzA0dmtmWkZWNlp5aTBEaUQ0?=
 =?utf-8?B?bmh1TCtSRU9MMkIzUHE0K0c5NVFSMzhLOXFjVDlrakQ1T211TURicHlpckxp?=
 =?utf-8?B?NWxPcmdUS2RzTjh4aDZYMVpmY1pSNDA5TGVidThsTzBaK25KMFBhZ2c2MzFs?=
 =?utf-8?B?cXRUTWpLY2RKdU9SMjNjN3JLOEFROTcwQUFyRWdJeUxMQ3dTQnZFcmlpaUNn?=
 =?utf-8?B?UmF6RE9pOThaSWx3RFNrMEdBV28rUTNzTGRzV2xRYWhEZ3B0dlM3cFNEVXdu?=
 =?utf-8?B?VXh1d1d3UHF1NUZ6bUFKTytMb1RhYysvVUFSZEhrclM4Q1lBeFJiS0J0Q2tU?=
 =?utf-8?B?MGluWEc4Y0w1ckRxYlkxQUJOenR6S3lDZkp0QzJkZ0tOWTRwV2ZOOHNmTWdp?=
 =?utf-8?B?R3dFSEJyRUpYMXZmQmVUSi9DUmhkWGcvREg5dCt6NmNWa3hUczY4YTM4dFQ2?=
 =?utf-8?B?NXRRY3dtRzFycWREb0tTd0EySnpIN3JFUGdsSnhIaE1MaWF3ZWlTUWlBeHVL?=
 =?utf-8?B?Y3hkV0xrNXV6cktXeDRtQ0xaRThUbVI3aXRwNmdUUFJPdWU2blg4VEdSOERK?=
 =?utf-8?B?d3c2MDF3ZndhaDhCL0NCWWU2NWNnTnhkZHpsRGlPRnpEdzhMNDFqZndOUEd5?=
 =?utf-8?B?aGdtcmVuZEhGZHR3ZFAzZlk4SXZSRlhPVCsyTXhCOFF4S1VnTllYUDNDWGJN?=
 =?utf-8?B?Rkozc1dIcUJRVVVwVm9qeFB2SXVLaUJOei9qNitUT3dKdVZaVVpWdHh6SVlF?=
 =?utf-8?B?TGhZODFYSmVTeTdiaDY3M0xoTEJuK0M0NFRnWEtnOFltV2o3ZWlRRWFzcWQ3?=
 =?utf-8?B?QW00eS8vSy8vR0JLUk10TTZCZTJyRkdZRjV3K3BFR285T2VVcnNtSUVsWFRy?=
 =?utf-8?B?WnRpSm1QMkJ3Tnl2T1J6SzdDakN0Zk5jaGg3TEtqbjJ4R0Nxa28yNnBiSkFL?=
 =?utf-8?B?ZGtWb1NkZ0FQNU8wbmZRUEJaWUpGR0ppcUEva0tMVU1ISDZwY3kxY1NURy9p?=
 =?utf-8?B?RWF3cnZUclgyZVhHZ2p1aTlvbEZ0cUZNbVUvc0FQYStJZUdjSnhFekREdWlW?=
 =?utf-8?B?WkdrclBXU3VNa2dyMGFCeHM2c3Y1Qm1aTU9Na2kwN0MycEMzbGVYSytlNWcx?=
 =?utf-8?B?czNCRzAyeld3YXJPdGtVTVUwZjkyRlBHRmtMWHp6NXhqMnNMMUVMdFFZbkVv?=
 =?utf-8?B?MVBWWmd2N2RKK0FSY05wSkQrUE5uQVorcVJDaUdjamg3KzNhTjZQcWh2Tmt2?=
 =?utf-8?B?MlRqZGlkaEdsRzNBQTRSYW1odU1JT3YvVWx3elIyV1NKRXRJd3VBa0pPcEtt?=
 =?utf-8?B?YU41czlGeEtNR2NYVGVUYmRqRWtKQyt6MERoeUNjMC85NEFValpZUU0yQUto?=
 =?utf-8?B?ejQ1Nkt3U2xGVTIzYjMxbzBGazBaYnV1YnhQZjc1U09aaVptOXNuNEt1MFli?=
 =?utf-8?B?aTYvSzhYdElQUEt1cTJCNHVueEtzUFlnNm9GaUdvOC9kTGFFd3lKcTRRM1Vk?=
 =?utf-8?B?OTY1bXEwK2NRN1FCdEFvTWM4bVUzK0NXVVp0cXJXVmk1bFhlV01kMnY0bjlB?=
 =?utf-8?B?US81clllNi9WMVlabHFGWnlzek4yM1ZQYndTdDlYSVRGRlRpc1Z4aHEvUFBj?=
 =?utf-8?B?ZXVQL1dzZUVKYVI3TTh4SEQ5MERhZlZuT2pWWU8wdnBCUjZzMFNPdjYxNFZJ?=
 =?utf-8?B?R1NNeCtlZ0dXaExYak9OV2FCeVdEcEllUmt5K1grK29yMlpmZGlISnhuQjNP?=
 =?utf-8?B?UGhGWk5BVm5adVQvMXlXS1JiZ0l3Z1pQY05NTlNJQWxtaUlZQktmQ09JM1RO?=
 =?utf-8?B?N0JhNXU4V3RldWFWeFE4MDNVSWVaOUxGTDNpSDNwSFFrcENxRjVPVWZJaENh?=
 =?utf-8?Q?lMA3fwmFXoZJBqLq8S2awHX3N/JtVafCi4+Rz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222f032a-d4bd-4684-0096-08deb19285e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:26:40.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuLVZO71v/2Fa6u3KnEqhFdVeLXAEilzopSOVe0CyRYp5Fl/19Af0CQr5+Og6K1BQKG8n3s5qBS+Ghy/7t+zcEblX2GTxWnBUViiEJ4lQzGbVJyvFPi8hEIp2YMMvugF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add SAR ADC dts support for S32G SoC based boards

v2 -> v1:
- drop 'vref' property from ADC nodes
- reorder 'adc1' node to maintain ascending
unit address order

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 22 +++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 22 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.34.1

