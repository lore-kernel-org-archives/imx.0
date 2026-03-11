Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E53B38AA
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216740; cv=fail; b=GWjbHOa3yQn0lwHVPCGTAyKwJfspywyuQjEPlmludeMksSHyCdfOfNsG4/UoHyLPcZUYcT0Jecz7XnHeB4fZxQdPHe3GxmzaLYvWKxwI9zKsJ6NBD+odCP7MHakbgE45gLD4Wq/7HT+2qvKegunpHzwnFtMKEzYgabDiRiHWvlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216740; c=relaxed/simple;
	bh=srwFOP26/LhqQeGngdrZr+PQkMzumgbe6HCaVj3XMbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nviw5bviypkXIU98m8kAjkYJ8iHOinvZD6gk9Tx7OX6COBZdxQrWHcSJgiAQAbpTAapjkUo1EysxrUimBMlfHCRP1/Dp808VaWkCBe8CkZZRGpQpzex/DD6Uveu+xIHKWAyrXabKYL+Ztny04/iEAeOp2a6nwsst5lkljuYaNMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SKR2BQfZ; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SKR2BQfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nN3zvvR17KrhTw4GZ9+wU5+wwEiFGsQRB0dSrA6z2Q+9/wLeoijdWCDzFN/uWrQ+M2PBb86h+z81CZ30JqdoLeCicOXaeCArbQfkXNk2145K+vAXxfoBI1zo/T5IT4AeDyaZL6wEAvbXVsCBJ0Fkk73GD2DTNMABFo8KSuBjVvMv45imNVnriXiLN0tIts4sbBUcwI2f3cuAtxdv9UBe0f+16MAT36Uu8vPkVjhV6PiuN7GFQpjZqYdvtY3Z9kaEuS+XvBxvvxhz0L8DwsgE+WuETRI0ygQ1n/mDsIiVm1zp08k85slWK28X6TeUBaAX/5mWNs++6zvif2p2Nb5Tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f6tJDxO+YDBxoQ2sgE9H0AbR9iXMTu4rMgME9tppII=;
 b=SKvIyKclZuyvzdYPgCB0XC5Usjw4zSfxjPDpJyMHY3S2Diiok6sW3hT3V6SZPsC+urjmOzUpUr0hrTvnJzJIGNmcC2lqagzbGfjiB++SJE1/X7g6uM48klV95clbiwoaw1R7tfGJbJj0SlR7y5tywS5ok9/Q1PGF4I16yzu8AMijlYndVRvfmPGbDd4vCWCk9o0HjXqFU8M+Q5/S3fWVE42InzbFhLu5VXT8t8KwFsVi9DjewuGpr8KXg5qwj28tiyJhTYI8OOfko3jcXGPm02bezyYQMFM7gavjoEIzvc7Jyhv+uMsjJ5Kac09yRzmHoU9YT2M01VZMTTlUFcbe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f6tJDxO+YDBxoQ2sgE9H0AbR9iXMTu4rMgME9tppII=;
 b=SKR2BQfZpbzweRprBcdoTtjN4dn87pCKOOdosxaMHuFtaGCt5MXjRzzYCiYqVaLUJXF29UgFQovVmRjpfJ3gD0c7JyKXRHd6N21jtCv6Ugcscd9HuX4hV1S8Y0eAYRyKLkQC5GVJUNI4LrA7rmxcDiu2RRiIMK3gcjVr4E52wBGoTTCTERCLIfZ5Pymai56B6OgiU+uEF1ZrrGncaSznnVHU7aGCtr5YMfZ11fICmK9hG+JPkRJh3UzdNk9sdlPoK7kryWlN/KNOcPrJem8SFyExW5mUTqboLcPGDrL/3I0LWGLqx1c32tg3vL3GfJF4hx2hPjPcHfBOZ0n2mAFvmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:12:05 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:12:05 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andra-Teodora Ilie <andra.ilie@nxp.com>
Subject: [PATCH v6 5/5] arm64: dts: freescale: Add NXP S32N79-RDB board support
Date: Wed, 11 Mar 2026 09:11:54 +0100
Message-ID: <20260311081154.381881-6-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: a568b6f9-35bd-49dd-8188-08de7f45e1ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kdKzGm2vYoZ7YhikKf2ad0qb5rcrr5HWhYbUywdM07OKmmditPdvKgi1CttKNTZPog2u1esoSoLr9kbLSNJZo8de6PbvrNish2uQQ7Jt9lL6NWbpVKAHrnKID9QGATXjty04cJ7XhV3NelLn1XdMQwlQ18i75QqYmI862AUUaJH2E2uCb/KfjqTRBselHnUh94v02Wj4AFJnXhV0i64uduuJlYI/VejtGcFgwFs9hlLsrbndNSRmRLEcWmbAxla5n7pj8PSAuWM/iv5LdYP3vmDf8SPiA9RP2Syd31V8QpSoFIuotutFiKE0uB/h5IW3mTaWHrUFUvx4jxY59sfhIccITl8agt3UdcNFkG6cMho5aOLHwSrMYC2jvdLPk/tpaHhDCImBzgIr1udO+J7VNCVigalq05uR3rsQsLzA6nwR2zWbaBmsD7pbOO576Qp4lSQvVTcAT1UzoDHcD+YnDNQfnko3uMfD5Wfto036i/HugUQOiB1/xBwi4oCHq+5YYC3Ry7Fu2TKKwa1Nts1ZJ50sUkHHLa1Fck4f1DVuwYL1BM8JHv8qCZQeF6D7RSikxkgAM+ec8ScuHQJBhIgLqRHf531TgKqBieXJF1387rBWANqXw9Jwr4bXD7fbknsj6kFtWXxtZYB/RjZCsa0UfNjf4fA3alV5esser3oDGChN3K1MUYnlpYAy/f/7ubY+PSAvrnWTaRpRq/+NE8ptL+LBfkkQNg52pX568Ofl0b0UrQtYmSMfLa6tLGnRgFz2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzZnRkNKZld0V2ZqVlJvL012WlNJZFB1b1R4Nk53THFzUHp6clBKU2dTYVk2?=
 =?utf-8?B?TnA2L3cwaDZhV0ZzWWlBLzhZYzZwNlFBTlBaNkJyeTExQUdON29nK0czRjVB?=
 =?utf-8?B?QnpVQnJFaEU5NkdMZHhhcTVZM2tIUzI4U1hPblNNUmVKT2Z2Zzc3NWliSjFv?=
 =?utf-8?B?NE1vam8rUDY1ZE9oZ3ZjRjZxSDduUkJyVWYzdStsVzFOdXNLRDVmL3VEM0NO?=
 =?utf-8?B?akpmdkRTMFlmSWgzWTY5dzkzR3ZoMS9IWnlZNVAzeTBvdEZqcXY0Z1NLdVpB?=
 =?utf-8?B?bkdmcTI1VWhkeFJac1VVNFVTMHYyUVNINTJsOGVod1g3VmJjZG12YlRlZmRo?=
 =?utf-8?B?bkhtZXlZSzNRUGJhVlBNWEJLb0RHRk5oa3JCWUppUm90My9wY2o4Mk5JejBS?=
 =?utf-8?B?N2pXNlhWQUlKb2c0c1F6R3JnM3dEZlp6RG9DelhCUllkSTF1T0dEVWIzekow?=
 =?utf-8?B?VHlJWUJqL3hCZVJZNzBXNlJmK0pieHNJQkVZU2l1eGFsSWhoc1RiSGlJY0Jk?=
 =?utf-8?B?aG9yejNId0k5dGhPMkRkeVRlT3libTl3QTkrNGc4RkJLS1NTZkdTTnRKUm9a?=
 =?utf-8?B?ZXQ4MXppeDRaYmllTkkwSXk3ZEphd3dDUGlFWU5Kakt1WjVyWmhhRDhjNzhh?=
 =?utf-8?B?REVOb1RNSm1aS2d5VmEvRGJnbUxKUkkvUUx0SHBwWjVPd3NSbHRXTGErcHk5?=
 =?utf-8?B?MWlDMnZHTDRPMmdtMnc1WFM5cUFGbEZnSVRWMkxUVE5SdGFzM2djSFlLSHZD?=
 =?utf-8?B?Nk9oUFlaSXpNOEFyc0NGT05oMXBWNzROWlZGdm53MHlFMFRObllBd1BHYmxD?=
 =?utf-8?B?NVVwaU11UkdnY2NsQk9weDRlcmtuUVZ5cHAwM04rajVITHdaaVZ1UVBtREIr?=
 =?utf-8?B?WFROcUZya0tjc0JYbWVtRUdwck1jV3ZrRWU2bGgwc0p6LzFiYTBnaUxoM3hj?=
 =?utf-8?B?ZFcxYUs1YVQ4N21OSkh6SjFQRWp5SEo0ZmRjWExGTTUzbTN5NXhxYjY3RDJo?=
 =?utf-8?B?SWxsa3BDS0c1aUxaV0hSbHA1cnRuSExSakxjR1R5Y1JJcXVzZVB3c2drUm9H?=
 =?utf-8?B?ZVVGaDRRdXNrOWZBbEZxaUpCY2lBV0gzdE1NRW82T2lCeGNDeDJoRzl5NE0y?=
 =?utf-8?B?QzFBaWhidkVFaWN2WWZvWW5ld1NUNHlmSTBTS0pWWExYOXVLdXpTRUo4cUtv?=
 =?utf-8?B?bmY0ZWRhNS9vS3NWWnl4TVkwSTd2NzY0Z0xTSng0OFAxdWc0SXF5aFRlSjZK?=
 =?utf-8?B?ei85UGNRbVRuWnQxR2lzWXNqL1FaRE5HaVVpSUJqOXlqN01QSW1BdUhUV2h0?=
 =?utf-8?B?SW00VzJ2NjVJY1JQVjUrY3VZWm4xQnpPMDFGcmhxRHlLTklmSnJlRGZMSTRr?=
 =?utf-8?B?TWVoajNBek90cmZmR01iL3ZSMG5JWnJVb3NlR2NBSHdpeTA1RHlJTXg2T1pz?=
 =?utf-8?B?ZkJ4ZTFOdzB1bmtvcy9DTzdUdndQelY4OVRDeFVnSzZpNDUrOXUvR0ZIZVZ5?=
 =?utf-8?B?K2F6TTJvbUlyY0RzbmduM0pZQ3Rob1hyV3RsbkdCbFNOdzN0eS9yTEN0ZXhr?=
 =?utf-8?B?RnpYY1R0TGRQNVFmdGlFYjluOEJqN0t4UlRXVmxIZTFLbU8xcWxqY05BQm9n?=
 =?utf-8?B?bU1abm45R3Z3eE9IRHhhNWI5VWt2TUFmek5WbE84ZEJkQzc3YkhHVG1YNmVT?=
 =?utf-8?B?RFdJZWJUUmlLN0VzOEI0Q0xndzZMSmd5Ni8wYUkwRU9qdGQ2OGl2dmFEU2dK?=
 =?utf-8?B?RDd3QThNY2U0Qit6YXJKQ3AxOStnQjA4cWtUdStacmFCWXh4NzI3VEo5azkr?=
 =?utf-8?B?KzlLUzRBam5JSjI1d1VXVU1nY0hXMlVUcFM3d2lxYks1RzFXcXFPdXh1ODAv?=
 =?utf-8?B?eW5GTG5oQ1lzcjVBcnJmcm9nbWdWSnBCeTEvUG94Y25YVFFDeFE3anUyTDg5?=
 =?utf-8?B?YzJ0V3Rvc3cyY0U3b2U5RHIyNzlnYk5teWhtOHFaYkc2N295aUUwRVBPVSto?=
 =?utf-8?B?UTFOVHQxVmt4bjZ6d0Q5bHN6clJtVEN6ODlvQ2dRZnpFZHBvWXVabWxTakVo?=
 =?utf-8?B?aC93L1NXREtJSHYxc290NFU2VFF4SDZlbUlQWmpBc1ZyTHV1NjU3Witzbnhr?=
 =?utf-8?B?QVJHQnZGRkVJSW9VV2dNV1YxTWNDZEF6WVhCejdTckI4amsvdWp0aGNMbmZj?=
 =?utf-8?B?Y2ZMUU1MQ01uTzJjK0FKa1h1TGJQS2hzUXpURFdTaWtLc1ZYQ2pFcU1uaTB1?=
 =?utf-8?B?QTJ6OU5Mc0ljOVJlQ1F5bmxyNXBRMm53MlNqRE1BMjJTNHo2VlZWUEUyTmFJ?=
 =?utf-8?B?MXJUL3N4eUtCczYrb2k1OG9BbjVWRllLNGNPQ3JWSjNaNmVHSVpmYndIWFZQ?=
 =?utf-8?Q?iDun5cyL2h+5D6Lo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a568b6f9-35bd-49dd-8188-08de7f45e1ee
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:12:05.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6R7Sui5Bb/Co/6Q58gGuUbq3u1G3KV4BiqNG5lH56toZTqAcuwCJpLZEMma2ZEe9D7xSXokGkw43yRAGcr+dsvS6cwywHM+q4BtlMBKn1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add device tree support for the NXP S32N79 Reference Design Board
(RDB) [1].

The S32N79-RDB enables the following peripherals:
- PL011 UART controllers (uart0, uart5, uart6, uart7)
- uSDHC controller
- IRQ steering controller

The board has 32GB of DRAM memory with 28GB usable and 4GB reserved
for ECC logic.

[1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  1 +
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 70 ++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..e79807bf1820 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -501,4 +501,5 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l-rs232-rs485.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-evb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-rdb2.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3.dtb
+dtb-$(CONFIG_ARCH_S32) += s32n79-rdb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32v234-evb.dtb
diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
new file mode 100644
index 000000000000..1feccd61258e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * NXP S32N79 Reference Design Board (S32N79-RDB)
+ */
+
+/dts-v1/;
+#include "s32n79.dtsi"
+
+/ {
+	compatible = "nxp,s32n79-rdb", "nxp,s32n79";
+	model = "NXP S32N79-RDB";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart5;
+		serial2 = &uart6;
+		serial3 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		scmi_shbuf: memory@93000000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x93000000 0x0 0x80>;
+			no-map;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x00 0x80000000 0x00 0x80000000>,
+			<0x88 0x00000000 0x03 0x40000000>,
+			<0xc0 0x00000000 0x03 0x40000000>;
+		device_type = "memory";
+	};
+};
+
+&irqsteer_coss {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&usdhc0 {
+	disable-wp;
+	no-sdio;
+	status = "okay";
+};
-- 
2.43.0

