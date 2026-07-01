Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352848096D
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906689; cv=fail; b=b9RZBtQ4m8thM84qs21zocqYy3B2Xm2GCY5aa3qH4tUHsPc3afGIzG2jFynkd9pvylCQ22+vonh79psrINSEUhjG7h5K+SAhm8r6TWRMPj1ypfMC1Xwye9BX/wuvuZYaLdbt/QFwSdi6JmtfNbjHGK8RZ5DwhVQ//s4hnEmtSf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906689; c=relaxed/simple;
	bh=dQXEfyvdTS9ayO+6B5FuDmFVffaQE8eiN3JnvZQcX9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aK5fr5WOxjQJyg92JhwnyFdBRagDZ2irW/EIWrND24WZwvmxGDK9/5uQmXgwYPnLpJu83wX9OF09QOLvMp+tLdHiC8OCvB7hBqHBP1SmmzQR+TL8TqbzChKutPhiEZB79VoEDwjlrWC22lp8jcXQNpdmF3jXC2AtOXTyOlgwJfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ONw7MF8R; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ONw7MF8R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxlUeoHRu1q3r+gq7yyU4iG6PiwDkRJj7YFPkcuQVl6t8EsYFMIlGrosp3elxjA1TLeMdm5LUVEUkIGh/VmzXSnegIz4i7OoNXkc+uZBMpfXTsumxPjvWYpp59J2sDH3fQoWLv1VydfeYwCrrh15YJOlGbtxs6LnDGq5IfpOfD8m/wsv3TS5HnnYk4xcybjBaj8jgUxHXxX0sfw+VskZSKyf2zIKLVjqqfW8zHqPz4idI24i6Ez3UHxHX02AtlaexVN6JGfN4qbt0szm1Qfd8pfsXLbF+oQxrvvpcKg8pl/aYxthNsNdZlZv4ZZyc0dg2FSSDbp2VFE1CTuParlehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO+jCRTlkAFgZb4kIptvF0xqL7i4CvDwr6ckF9p14xs=;
 b=yifhcvP/ddmKgUFOh3UdAKlvX+xGcWPXv0Ohl1rd9XJVOrvbI1Ja7g87mU7d0Yhduxz3C/z8fwJ+Dl7cjEP/MjJOHzYutFbfyDXhtre69efwJxtIFHlw3fQPdlBb6Xt2GcWbCHDhrQV8uvPTbANucn+VrZeKcjjTbnA9TAUKuzqYTtpzcDzY8fA2zwjwNW1AnYkgGRBC4A8nU6wud/Ogd8kOSNHsmCOdUZ9qqFRjAy7QLnxh3LKKzQBwnPByg1q/Q9f7zdp/oEDf+A+YMHMj8+WEgv3bcRbZg6eKC6u9s+bOJK/bq6xb65ZwwqdYh/O0BG2fMte6Rxc1SKhAQWU67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO+jCRTlkAFgZb4kIptvF0xqL7i4CvDwr6ckF9p14xs=;
 b=ONw7MF8RKbuu20JUlTE4mgdF252l6iDqXkKVAMz0cbTzheXKa/ANFwucOWj9BwqdW60kKW7qJSoR2IyBGc0ihOjKlIss92SR2nJhpv/+102MKeuPP8NA1WA5ISVtbwL+aYIyD+2FGmOBHJ09s10TM0IpvQmJh/jCmyiEMfrwzJ5X5x/hGyS8rzglfoj9QD1LS1+x7kgXpdujtNPtVZVLGKXZQ+PFeI10EfR0gYDxTQjphZbl1PkPnchcqp9lCJl0waC9Ar1dPs1xtLhOYPNC3u6PSXV0Zz7VwrU0hVi6/gOmdpV3HIfDd8TKm4HxeufPKMcq6KaERrd5iEOPoykEdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 11:51:24 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 11:51:23 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Chester Lin <chester62515@gmail.com>,
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
Subject: [PATCH 1/1] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Wed,  1 Jul 2026 13:51:20 +0200
Message-Id: <20260701115120.1115494-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701115120.1115494-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260701115120.1115494-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::11) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: c031bf4b-038a-4a66-21c7-08ded767133e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|921020|18002099003|22082099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 mdbWjFQyUSsDOOQbk4uPQea/LW9lKGGuqyKlimpb8bwEqtX9t5wrlyh0RRdr+Lr/KMz3YjFW5btt2wodcF//GPKRKu96+IZxzPHkSd2S0+ORHrGqNjODQyuPWQ9mYh3/EIs07jnYhRpBRy/TuN8AaphxXqXqRc63uYJvwWU90iM0IpyEafEIwLf82mUIR0lGw/LNuTqncX20Uv2e85twk2oz8pVriH1aJx+VakanQFNyJe+9//o2HkqRkzRXbvJ5ExgVK1tXl5uQItT32R7GyRGVL5K2gxWS35Zd3zhPM/2v8L+D4LJIR6qmHVH8RMJcUhVIWpSvYQYIeAeEvC4T9SyPZHaf7ZdWALB61CDgOaTg+FM6GbK4ugZOieMLAnVZVt4OfQQHNLRzJlaQZLidQDDZee8kybpJBSS7aBE9P7cBiPFWxGtdYLjr4HOvFWgyETnzTqDxCbbX7AXfdLtCVPiNh03z8uwtXkQ6vOxX55YLyPTjMN6LIzahs+bN2VzMmSVPb5sYqauIUiWyOP8lNrexLGhXXH4X8zoDf8wRI3dqH4Rgen9juAVlli+IX70cb04W67pcBRN31aYhmTyH54IRKFYGW7N9Ag9a5Agc2ZzL/NR2ap1uojqbBeJEg2hKYTB9nxmJ3bpF+WX4VmQHgtCQb/7RSSMFK9wqZlnA/YfR9GyLE0TAzh6jFwiKDm4nm9URmZlqF6c0taOT8I6dYg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MnNtd2V2RU1FdXFBMk52elZjeU5BdWRqVG53cGt5WmtCeG8vSGVCYzV5REU2?=
 =?utf-8?B?TVozUm9wdmdQNHM4MkZCblV1c3B0ay9RNW1xK3RHUGYxR3hCdm1jNUIvK3dh?=
 =?utf-8?B?MlpZek1SMVVDa3RTbmRpTFR1NXp5TTVTcGZhUUs1WVlCZ1VvOU43aTkyMWRB?=
 =?utf-8?B?V0VjdWJHYktSc1lTNjhwWDllaXV6YURramh4ZUNPYUNnckFnQU1leTFkWW1q?=
 =?utf-8?B?eFBHQzJZNVZFN3Q4VDBUYXBDaXNIb001SW1FRkRxb1loRWtvdkpkaGwwbk0y?=
 =?utf-8?B?QzF5ZFR0TkNGMVRFQ0k1VlFkNFZZSXhHSWtaZlVVdDdwclMzVFo0YjdzbVZh?=
 =?utf-8?B?ZWpzWlVTQ0JzYTZlclFHSUcxZkV3ekNTNEFKc1RlYnpIQStlY2dqQkprVGJW?=
 =?utf-8?B?M1pSczlpT1VVUzJTc3lsaHN4UFFTTlNYV0ZCaHN6cFFSMGZZdDYyeU9CWmZS?=
 =?utf-8?B?S0dCQ2FRaUdQNmdyZDFxWE9pUjJ0M0NlK0QzblNnYnVkeHNKY01nRzJNTVRE?=
 =?utf-8?B?UUp3U0R1Q0M5Skw5WWlSTHJBdnNMOWh4WUdmOWJONFJHai9ueklWVktjYzRv?=
 =?utf-8?B?RWZFd3RySjRvVDdGNXRYM29NRVA5YWlhUDlmOFpkNWpLb2xIVXBaM0U4bFFx?=
 =?utf-8?B?SUNzMlpVR1JzU21uWTduRVJFNk1nWW5mNXlVWlFhMGwwY0FiZUd4NGRRcUl1?=
 =?utf-8?B?dUo1UmkyQlJuNk1CQzl3WHdKUHZLY2U2YVdMSnpPOHkrUmZZeGs3SnpkellO?=
 =?utf-8?B?R1ZvSFFxbWFZc083WGlqazFQSU1BbG9HS1FPQ2YwYVpYNlBWNGczbEdqeXEv?=
 =?utf-8?B?OGR1UllSdDVONXRHc1hzcGc3MWZ1WG9Qa0ZFRXJIeDlHdVprV0NHcGR0UjZY?=
 =?utf-8?B?bXc3NzdEVG16RWtCcGY3bGZxdzBtTGM0VGM5Qnh5OFZNMG0xMXU3eHdnYTMx?=
 =?utf-8?B?clVIenM5azlEWDkydktQS09hVW9LSUZDblJPMTdSL1hKcUlvOUhUUE94UVRa?=
 =?utf-8?B?MGNSekVBdVRhMTFKZ085YldleFVGRWpTVkJ0Q0tvZmw3UDl6MytJTkFkL3pC?=
 =?utf-8?B?SWlFSHozRzNWT2hsaVVSVGhCY2RDSTVncEZ1Wk1rR1dLa01nMVU3bWtNUVdE?=
 =?utf-8?B?dElMcnVvc1N5aSs2cnd1S2hRWDJnc3pMTmR4KzFMb3UzNXNDMThWaURkakx0?=
 =?utf-8?B?eEFDb0s3T0pkZ1IzK0JGRy9MSEhwVHk0RGsreXJ5RGVXVU5BTU9Zc0FReUQx?=
 =?utf-8?B?ejJ4eURvMG0yNFNwbk00RSs1clNhRVIvYTBLWVhOa3RYUWJQSFNMNUIrTlFX?=
 =?utf-8?B?OGdUNHNvU1c3ZTltVzc2K3JnN05TcEFlZG1RalU1MVRUL3lEcjFrbUlObytn?=
 =?utf-8?B?OFFYbUVJcU12MFdtQ0JmYzJpT20vRHZXRnp2Z2RTdjREUTBzS1JnRnQ1S0hu?=
 =?utf-8?B?U0NUaDBPc3AvekIxZlhTUTR2UEkxcmpSelAvcGJCOEY4d1N2OUJBbFZUbVVz?=
 =?utf-8?B?VlRqU2VSSGVBTktWb1pTUnRDalVIaVZIdzA4MDNkU05ML0JjTUtTZnRiQmtP?=
 =?utf-8?B?ckg5VnJ2ZXhWdFJGSG5VZWdSbWdFR1VhWDVxVWFiaGx3VU5LZkxqTlNlcWFl?=
 =?utf-8?B?MkV4SDZjc0dCZVAvYzFENGl1ZkI4a0tRU0ZTb2YyRGtHVDJYVWttWHY0anJW?=
 =?utf-8?B?anVxRWVOd3IyZ1NYL2hOejhYUS9RV2xYeldiWjFDYyt4QzNzMDRXbXFhWWFB?=
 =?utf-8?B?R3V0cE5zak42Si9OL1Y4T0FNWFlJM2JuYitmTllHbm5oU0lyQlgxZkVrMElS?=
 =?utf-8?B?bDNuQWpmTW9Dd05Jb2d4RFlFMEdWeCtBQ1MzSTYrckJmVkNNUEE1eTJTZDha?=
 =?utf-8?B?U3dVTzZBQ3AxVEJ4VTRwaVRNSzBRM1lNV01QelY1UklEZGVqZi93RjNSVENm?=
 =?utf-8?B?dXRnQVZXUlA3ZHRySDRhcnFlWVp0MFplaExKLzJOeDBzTldEamhkZFZCWVh5?=
 =?utf-8?B?cGVCOHJ2cE1nQ1ovSlFVSHM4MHlyRSsvR3RjUEdDS1QvSUFpZ0dSdUxXVm5j?=
 =?utf-8?B?UEtnQVc3QnZSMzBoaWoyMUxiZzFsZWZ4dko2WHdwS3c2MGRMWndBYjZoQ3o1?=
 =?utf-8?B?MWFMNjE5UE9iNm92cmFsMHNpSis3SkNFQ0N0bDRjMmNYTkNHVDdTeGw2NWJM?=
 =?utf-8?B?dnpJN0c2aWF3SFJUNm5hTE9JK2N1ZmxRWTNnM295eVljRDNYY3ZqMnIwc0ha?=
 =?utf-8?B?YTE5TjFQdmhneTZaRVhSWkZQaklVQW9kb1ZFdVJncnMxZ0VIekdQY2VNSWFG?=
 =?utf-8?B?MnptTjh5azRwU3pFRHZRS3hiQjV0aWZGVlJXTkd3ZkY0MCtIbnNBNDI5TmZV?=
 =?utf-8?Q?tANSVaUNwz/klcZyNqxWLulRbqeVp5us3IIx6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c031bf4b-038a-4a66-21c7-08ded767133e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:51:23.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/p38NTldhRzO5U+ZmpHhmZfuoRy7DQNy2MSKxGOkAxzXkIcJJ341KjPHXxOQ805XpQ4UY2u0xTQdHRAYDBSCJqtK4K1bFjqw/YlAQFWGpW6rAT+KqQJk+TmzcNnuO2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

The driver supports both legacy pinctrl-only DTs and
extended DTs with GPIO and IRQ.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 21 ++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e29..8dc0c5d9f368 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -135,7 +135,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c..129d6ad8e5c6 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -193,7 +193,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1

