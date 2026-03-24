Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF823B7B61
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377934; cv=fail; b=B5urv8eCDjntfw7bPOrdE0XWXBBmiA/utfpEpqu7appoBhnHlKDhgbzApwoD++0tgYpmu6hukWWQV69O9ATBuyJLzqtzAxiLQLPGn0PdFtF6SmL2iwH7CjAAMiM4UoM0EQNXiCpLOjLx3nmzwJGagpPZyO7nvrMwWsmzVxtjiJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377934; c=relaxed/simple;
	bh=RF/9vyDG2E/O74YDg/zUrHmOFbLlF88y7vEnEdFvM+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=JRgEkYZtKcKl6w7/G58e17svrmw+qrl1E1cC5Pv1YAvB8CMqaA8J78HDf963hhjjL7dk0adxuIyHm+SDr9bXRDdjgMpDIYF/zbQgRqGFgZvskS7fqP6rYd2dPZsAR3vWQCxWhY+rb8sbgZrK+8SULgtPNq9PAlAMA214e0Ac0tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ipc9douJ; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ipc9douJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3tqelS+8i2JRUXUDZpQ498lZXEf+aAqZKU9ukUPrtD5v6v4YZlSwSBMaPbfUk98vaV/mrHOgNp2kF8Ep7beVqGnyN29Hjq0AgryxY1TcWLAkGwY9dHy+onTv7wU0m06vK0gr9XJPPdNh1G4XDNP05A2FhJqHzldgrRiZ1/jBXdOQr45AApw2XXLUEZofC1JSZDGkLjeRCpUWNLMbPkdSMT6GAE4E2msOLsPA1aVEI+zmcxXHT16CVN1/qqJkqySFOXJTT3eZuioKoPH6/KaVudxUqkltTXZTJKUuwt/guLXqkDnQueqg3LEqsBmObEW8IZoqA72rdDlzxzPytzY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfmfAVK+J6xkKSvgDk0VDOeEEOLCJyW+zadLJ2SUjYA=;
 b=eTOoBruavf6FDgyrDl1aH+TVaNxKHNCyF20DuWzGNDUPVgpLVntbXnmcTmWly0GdzOTaNzY88fSqlfX5z99RLLVJEFjDd5zPM4IsdUeQ7wj8WiyqYgVSpBZhnRVFCEEl0/pwKkvRw2AAaTLIRItEtQ5ji2A3jxwGBoFaJagOkMZ1JkrW6d2GQoTmyad1uLw01r/s3JTxCfnz5GWAKDxmEq16Q+faHqPLQL79/BDIdMmygPiDa92+0o/FDqVsNV0hTT8yP6EUnsl1fdOPRffiKq+EC0iyS6Fy+KxByZ2skpj29bNhUXVXGhTnvqI/+K3fAvQuiEkjJdiNcSrKF/nOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfmfAVK+J6xkKSvgDk0VDOeEEOLCJyW+zadLJ2SUjYA=;
 b=Ipc9douJRn5SZiDIQfi3YFDCKLmdw42rqKansFuRErJW+GfsuXnSJT3xPGijj51hzt4oDEo60C7ksFe3XEs7QsYkHX83VWDF5KVKywP1rZpJniBjjS2TtH9wNCre//aiS+li6Fp1XHxNf6St9qqTkPr3wNVQpgYT+yvK45fVfP71MKWl9jD1ATwbr8RldY7cU7/HTHuwzv2frfv1ZspfCqomTRMs114A7LtktLasUJQjnfxma8DIq/QZhGzANjNsYYisV5c7cw+4rSTmTw40ggn9hUIAlhEzmwgxiNifyklPS982h+CAkCm2oalj0q269bnk5gYkeMm/SzGxQpgdhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:45:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:45:20 +0000
From: Frank Li <Frank.Li@nxp.com>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Stefano Radaelli <stefano.r@variscite.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Primoz Fiser <primoz.fiser@norik.com>, 
 Markus Niebel <Markus.Niebel@tq-group.com>, Yannic Moog <y.moog@phytec.de>, 
 Josua Mayer <josua@solid-run.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260225170347.77841-1-stefano.r@variscite.com>
References: <20260225170347.77841-1-stefano.r@variscite.com>
Subject: Re: (subset) [PATCH v6 0/3] Add support for Variscite DART-MX95
 and Sonata board
Message-Id: <177437792440.2244983.2345357433103898596.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 14:45:24 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f79fb00-a9b9-48f2-b411-08de89d57fae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 bP5HkDOWMHRjB0PP7/otdIus1a/dohtgecTZmFP2LNr3NP+qOfLKpKNFj3/ua0igY1AqaHEa1An2s/IiCwqLEh2mVX8z0C/JPF+XgTlx7LmhEZKx/hbv5e6WlFGML4yLPoSId9X18dI3qDK+j4FmtkSegD4PLCkZBh6tAnvXAqFEXyCTZMpazBf9I3kNwvzy1XYxj0KMkWPOcZr++YHUpcWw5LbR7r6s8K9YYc2NYdgKSh6ttSnZoQH29OHvjUKzeQ9usgx7pv8DQzx4KfVR+5UIK0BHVJtIW1o6vrjAmmI2RIRow8XlIkW/a68D1arVNgQXZ8ffK2EyBhW2a3IH/Kg0BEhlhl29vJok5IDbNcfOQdp2fdG7WXLEJVuoNTCcPFaX9bNtF6DQDuXJH45IMiXt6wbJrQkiPne9QIyvXvHohbyImN9nYXQ4boZBRayDda0PcGNj8aMfcT/E3hNY4ABrPUZGTscJ77gD51v6UCAr8zbAKqgijlJZ5jqtx4Mvmp+3TO5ikVjRmPksnxYMvCy6lUJblMD97S+P8VT9zhXrjjyWsf73JlhQXs48vdnNXmJ7tjWrHVmzw/HTbxAzcHmcMXTz2eiFi1pqfyGOwdk/TeqrAc47x9gI6F8r0ClvlOVb/n4KgGt+vcyY5nHt9p3iq1+Py5Dn3nJwTflQKrSmD+GYrPriwoV7x8Mp163uFzH7qzaOlVgzUSnJVtoAbIzGTDDO2/H0XPMmyl4RY4lNtMkG+TMUju3Uf8qZHBdMqfPJw/xHaMrKpaLwORk4DgBlRwRLVkGAwXabqjRuFt0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TjMwbTBCRzV2bmluaktoZit1WGxFaGpxbEhNTFBnM2U4WDc1WnI1b1lETU1k?=
 =?utf-8?B?ZFlXcDh3N0xGeXBKemZtdmJ2SHRKUjZ2RlAwck93VWxnNmdhck1Ua1ZLN29v?=
 =?utf-8?B?Y041R0NPd0Y2dVlwbHpIbFVlZUQ5czBjVnNWd0FEY2dab282dVh1MGhRWmky?=
 =?utf-8?B?Qm82YytackdoVE81VVY1N0V6WTJxbHd4a25kMUJkdHA2OGJCTWFKdXIvNTFr?=
 =?utf-8?B?VDVYREtqcVdNRjA2VzBUVkJyTzc5NHBueFJkWHhDUU9SbTFyaSt5UzdycG9n?=
 =?utf-8?B?T216eWt3TGMvekpVNkRpZGpIZnM3WTNjMnZjeVdxSmNReTdYMmlwR1lxMVRq?=
 =?utf-8?B?bE81bERoa3BFQ2lsQ0NneFBlbXdFMHlKYzlUcGYzMEVGek1mT3l2NUFsN1Bj?=
 =?utf-8?B?b2JaMjlrczBGbkU5VkdRVEVUT0dTVzFmV3E2V0h0c1QxQ09Gd3h0clZ5RFRM?=
 =?utf-8?B?c2ZyaTVwcXQyUUFyNStoTUttQWNzV1VoeVVRTnh3RVU2b0p6MmJhbkVQV21p?=
 =?utf-8?B?UGdQUWRHazdBUDUwT3dTUzc1elFRUjEvTUw0L1luTEZFSTRUT2tkVlY3Y1Ro?=
 =?utf-8?B?SGdWWTUvSEhpQ2VMOElEczNqT0c2QlZiNUZsMDVKTEJyWGRJVjE2T1BBOWJy?=
 =?utf-8?B?bzNRUC9JVE1HUzlHSmxuUGYwcm5Sdm52bC9VSDNvYXBrMVhocERNV3ZObHM0?=
 =?utf-8?B?Mlp2akZTaEpPVXB0WVk4SU9TN2VwcENVV2YzaFQwT3J1RGdDVEVNd1V2Yyt4?=
 =?utf-8?B?bi9qVTJlamRnamFVZkkwRlFXZVZ1amlYdzdRM25qYUdyNHpOS1krOGlGc01q?=
 =?utf-8?B?VCs3ZEdoVVEvb1hiYk9ZNTM5SFZVWk14TU9udWFiaG52enFlNVRreXJ5ZjNT?=
 =?utf-8?B?L29lczhiZWpEcVhqQXhHblpPcFNXbms5eTl0NFhoa3VnSDYwdUhmc0g1RC9n?=
 =?utf-8?B?RUZSTTlVa0pWL3J6ekVwTVR4a0I1U0Z5bE9zWWlBc3M0b2Zld2hhREVLcjBu?=
 =?utf-8?B?VXA1SktDeGpTUXZLamJwV212MG1PcjZvd0I4b2VoeEMwZWFvNUl2Z04zNHVr?=
 =?utf-8?B?WDhMa3BIUmhLOExNZTdZUTR1MzdPSlFnazJpUmUvUnRiNnpRa0FzVmJoWmpp?=
 =?utf-8?B?bXpMeUgzZzJqTVNYYjBZU0NCN1JCTk9xbFB2SzNnQmpSMmN3Ympkc2JVbm42?=
 =?utf-8?B?WXcySG4xcTFJdXBBUCtUMXZLcnNybnFYSWJ2anlNbkhVWHQvZk9Ob2JwUldP?=
 =?utf-8?B?anRBT2tQVVZoc0hkdnNtT2VhdC91a0RFVUUzcDU2R1c4cVdEYlRBdjNUZit5?=
 =?utf-8?B?OGRvSnJacG5UWDEvRHhraXBXR1FGdmF1RUZLYThIM1l6YmdCelgzOWpXVnFm?=
 =?utf-8?B?UGNBdVdCR0MvQTFjcDFKclB0Yk5qVE9JVkxuc2FZVzVFZHlSMFl3Y2N1NTYy?=
 =?utf-8?B?YXd2YU40OXhWZDRNUVJDY3RhYzRMMS8zbkpPWWF2bHNIcldNWnJIZ3VsUkN4?=
 =?utf-8?B?cDZmWXA2VHlyVWt3ZVBqd28rRXRjY3BvektVaWVDSW00UFlsQW8yOVRzZjN6?=
 =?utf-8?B?ek1KcnAwdmhrRFhoV2t0aDAzbFFUUUhSN0JXdEFmYlB5UkFnK0NjcjNZclJq?=
 =?utf-8?B?R1FUbXR2M2lFaTdNU1FVMWJMWGpBREwyWTFTMmtsNWVLZ2VSbXR6d2JoUkU4?=
 =?utf-8?B?R212RnBpTGZXZE5JNEtCdnhjWGVLNkdrMVBLdzh2VFR5anpqaGhLMSt2RWhC?=
 =?utf-8?B?MFJVeUpWT0hhT2RsL2N3eUgrd2tlNHdSdHFlbG9TWGV3MUlrVHFsWEFqQkUw?=
 =?utf-8?B?bnM2cmVHLzFWSHBTOVdWWHdZZGd2ek9randuckR0SElNVjVmbXk4SE5IWm9G?=
 =?utf-8?B?ZHVzWndhYVN5bmFQZjd1YjhkQWZpYUpmcFFqUnRZcGlLWStpalBMNDFUbTNa?=
 =?utf-8?B?L2RFYnpkYlpIcU14TEVrdzNIcW9DdjJ1ZXRES0lvaFVvZTdNWlJhb3RXcTJH?=
 =?utf-8?B?UkJweXl4MVlBZ29CdGpRWFZWTXo4YmFBNEF2cnlodTNPaFRGU2lOK3NLellF?=
 =?utf-8?B?V2ZpSWRQZitVTUcwMXFLYmNBeUdsWDFpYU0weWtBdms5QUJRUms5L3E3UW45?=
 =?utf-8?B?akdLZG1MbWtBMmczQndzTmFVa0xCQithVUYzaytvNk5SOHA2b2JXUThTZThp?=
 =?utf-8?B?WElOeS9ua0o1Z28vVS9ZS1ZRb0gwUDFWNnF2OU12ZGhNd0duTkdTMTh4SVVU?=
 =?utf-8?B?SStSK1R0WmJPdUtXYTN3U2hld1VkOG1nd2RTOUMvbzM1UmU0RWRhYW5uelZY?=
 =?utf-8?B?OGpQQWJyMDFxZ1NqK1BLYjBGRE9sZFRVVXpKTUhsLzVOcENRZmE2dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f79fb00-a9b9-48f2-b411-08de89d57fae
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:45:20.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+qpONcGPO/3/jdOUxkeRiHIYUZP168JrUP/QOgyBq2YWBwCL/MM2ejFEuaag2kMBe6FTB38cgg580NXfSkOcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806


On Wed, 25 Feb 2026 18:03:35 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX95 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
      commit: 5953966f26f5f825cf1fed6f96c1f3138bee6d6b
[3/3] arm64: dts: imx95-var-dart: Add support for Variscite Sonata board
      commit: b5fede0246d012e0fe66588e85825c2bfac626eb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

