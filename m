Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268037B000
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187985; cv=fail; b=XC9XevIL3fRBcfMemp94oz84y2Sp8KhO/L4lFscIDdACww0snET7ls6UtGFcR4dhtbQ/dseI1PpQ9fp+D4ajhAgGtZrjUarkKn3TDGT2gBi9hJTy/IJQPEwf9iZxBhWw/SDrJctTmRxAqW+h99z+WSPUVcg6Cf8t4kyMt2SqRgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187985; c=relaxed/simple;
	bh=FtWoLvAdH/irCHl11H6t+m7eVRgjYbez7v+3OwC0Vzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmx+a/7Z7kQ/wOpIHGRdgKHDmQ1cpjkDHHoJ+QFooefc+wzXBqhE7sFzPvFfPjm6QaRk+7E7zLdCdZ4PBPMMgOr7RvRgOQNAKGeubL9Uchv0MIpCawOvTHfBg/Co5tAGjnaBiOFdHYrgkUW1TScLviqSU2XuBfh0S24QU3i/JXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u7R7YNh6; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u7R7YNh6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/H7VbEsM5b+BBXi9DzB3i0cR12P0YWoNborbOuXyxk1/m/dF0QFfvJrqzVTZG+92+7apWBdbdRWYqD2HqsEpQvM9iFzk6pa1Oc7JBfAQX6/itNWsuQPbsJ9NPL6UIEblfKdY9Fh4lktJbuES7xMaHe0iiDsr7/DLUrk3OlWhlCjsjqBWUYwMqR7ZnoN7AgRUUTgc7NmFqboIT+n6TsgMMAbyJOsbUZEk4JNpUC7tiEF7uu3hFVgqrAGtGBxv6u8Jr/8PUyanDRY9RYfd3HoEBRxYheNvlYBxLdNNz9G93Ai0j9DrvtoLuKxMygVJPh4xOD59IlZUGqTOwR6UCsM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I2i/Nj9tOCh3Tntf0K5lX8wR5VkPuEBN5az1tH/qaw=;
 b=NxDNk37X37Dr5R0F0687ao9WJshMRdVeLBLnkW91zSyXABHUME6d35Cxzlaea6z6/TinprVWklL+Gh/sgbc0TWA2Mmff5ol6Q93uVskWwTd6em9Ev7qLDnZNwXFoWGyXS8yP0Hf4Hc9idp+pY2MbUlYRpj91OcTL9m6tCw7nPT+m9V+9VuDxS3E6MVjMejk2bereOcgHe2SnquiToD5j0xrDdYA6CF/C/c1ezkyx1Ei5aMOMdpQKaTAD5rgUaE8lgwjlQBBz5cxrhWoFPaoRtktnfvOkJ02d/Paw5jVAf8blpHsHVcEbaNDvQh8fW4+1oUdNHLgQLlRXHLSen/2gLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I2i/Nj9tOCh3Tntf0K5lX8wR5VkPuEBN5az1tH/qaw=;
 b=u7R7YNh6mErEB2zW0foVD1AEBXQ0XKkV1wxgXrrqvOVfSfSTOh38BDanWVe7VEqzYG5Vayw4IRDQAGaLPXR86xDdgH/NvODc694AcBNuYxe7BjUxVba2UztTzHEjzxT1CHxjW7xcbi68Wc/CHF6LGQahB0hVs7n8beSN3dWF1GojuvbxRtXqQMl+guFtD4kcbBVbYfHt8a+qX14X7QP0Yf/j4LkP/KLsUzzn54OiqqEBTWrFkm7N6cd219lLqltaSmhpayo2ZLU5xa7SycWPR3rnH0642dMTgMenS/CMdmbONkWZuWbDerFB6jkG6R0TUU1Nl68sn6CXnGtFobnDpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 by GV2PR04MB11633.eurprd04.prod.outlook.com (2603:10a6:150:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 10:52:56 +0000
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b]) by PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:52:56 +0000
From: alice.guo@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: freescale: add bootph-all to ULP watchdog nodes for i.MX platforms
Date: Tue, 19 May 2026 18:55:16 +0800
Message-Id: <20260519105517.3638614-2-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
References: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To PAXPR04MB9644.eurprd04.prod.outlook.com
 (2603:10a6:102:242::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_|GV2PR04MB11633:EE_
X-MS-Office365-Filtering-Correlation-Id: 24144368-6aee-4734-2258-08deb594c8df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014|22082099003|18002099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info:
	c2GmirVwzBMzu+owjHDsNydLrWbTvxmWpkfnTe1MTTWs1QA2ubgKne2JAfDWxcHGLHIPitUoMN0XEHoqfk9t8AwBEe3k5/GJ5l+gYr86+1fViTlcz8cBVz7SnB+MNVQqBz2VhmluUP0SeHK7meD7HQqs0lf9Nz4zGbUWoP1wV6acRP6kbJL3CqFKNIKQsGJVSO6H21dX8avLWYA/dhtMJNNycrpBfFPn11eTO1ERRKQssP8LxYgsdLaWH+VGo4lOlpivlU5wl8oLFrxjmJKiddn/AUzLmZFTFyXiWLSu940tn1HrwrhQRrpb71yZa8I8vaoawAIt7tq/74KPA9VZZqpL9nlQ0Gz0pbb+N0qyqBkQaKUz0tCmf8mNaInUILK/57J+Q+ROzFw30ziLv5ac1X9YfiVddjEIR69SCPF4iYPZcAA7lp1/ESA9N11Z0nIXLYW4P5V4O4eWc2N98XCQLLu9Mrv/dfQxDgpzfe//NHVRz4f80OIqWkZWeN/e6mSVIAZ2c/51Cf0S55rJKteYfu/iJfp4ACLjJL6LmLOkYJXSX6GD4GhuTFXh/LsLGu3Yt6ql3BOsYH17OQtoHBbiNtyGB0y1kV/fwsH4nlEsQ3lnhzp4CjznTHAqm/o+NG0gFoWaZgRf1u4Q6CYjJtBsCXgOrLHTqVnjVRALYuACG8I7EsaMjrYlI7d5IRqMEbLAc9f7g9FOCen9xGD9UlwDGE4E2pXjabkxPtSX6OoWC6EKJdUftU0pykNL2trKEb1H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LD5gEixenhZMOqeawkez4mtQpJNG1WyXJvRpfGgZtT7psnHfrNJNEb59oNdH?=
 =?us-ascii?Q?X+4NRBiqXsuOhNi4lAn1fFagp4dz6XimVJq5s1Xp1rvz2eyZja+GaLOxj1q3?=
 =?us-ascii?Q?N7rgntc7nWpUegOc8F91iPwqnrwDZHHvB7jdP5jvE1MSlDVmyMWxSbadNRIu?=
 =?us-ascii?Q?rrgXZr78Mt/0xFMhG+q4XsNFygDpN2zWa521rKWHLrD9RgdRrWhp663/72OM?=
 =?us-ascii?Q?D1ELF5pjmDuWdaM/EyB3OmYUGnU9LCGxDxeBxRPZF/VHzIlKQt5SvIKhB0Lz?=
 =?us-ascii?Q?nHJj4ammI5E6mQD4So8uqwD70E1MbyfBjaovzr+Ls7IUlkV7JpLHQDg3x05M?=
 =?us-ascii?Q?oFRw23vMwslGr+mx5442h3MPPLha5ZZfEM8Xl6XAE3wql6Kmc1J1DyxUpsM6?=
 =?us-ascii?Q?jeMY4eCMXkhVMwPKWNUXY0dTOWnM95ri234marZs7UHIWjvP9i7MjOjNuraI?=
 =?us-ascii?Q?L4kacDD3t5U7OxhzbXMf05pQrNQ6lHEGoy5BU+yBYXiuI4oo2fTCLJjS9NGF?=
 =?us-ascii?Q?CR32F4NaLCouuY5nkl6RQ1Bn2RG6/c5xhFjWlePQH1lMkeuVyV9H6YhACDVS?=
 =?us-ascii?Q?I7vKRP1CQgd8xdJQfFuhbUIAdb3qTIO4gccbaAlb48ApuiAQ+hN4NzmRzIkc?=
 =?us-ascii?Q?MPX7PPbfxh6MpqGVi44JoOCuMjgOcdKujDhxJL3rCb8ODv1iUYHLTQQ0/Oes?=
 =?us-ascii?Q?4ewq3QXi4UYOUTegXporPWGvFzs8R0sTRMw+h0ggsNZjsU9xmpvFKcxUYTvx?=
 =?us-ascii?Q?m/URIvO4Mv3GhbRroRHiZH5mPM2OPUXkVQ8fGV3no9zufbOmwwxXWS7g2qv7?=
 =?us-ascii?Q?FwtRgix1t+TMlqDW28SivZJ8Yh3QQpLtZvM7ZBk0RXmrKmf/GRxCvUyIyvdB?=
 =?us-ascii?Q?Qm4Qu4EDTnwGgJGpmsCPFMmuw5d+HggDAi8C/PH93PdegnOmWjlW1IkKEbOv?=
 =?us-ascii?Q?q4QWIzSEkByRjZAJEbrPfTlIgGfEPk2bifn3H8BOPZyFAe4qkm53EhpYLFqu?=
 =?us-ascii?Q?xikmjcN1TC3DlPg4eZilmehL4NtrolZvSDZeVTTpPVjcAPJJ2h8Y8IP08JoS?=
 =?us-ascii?Q?jm7ZKl+0I+gJskXfE8ksVP2Fap75XgaJLtde4Cp7sA/WeXQcAg8qD3Ko9fof?=
 =?us-ascii?Q?UHhWQ0P/1nrl7kNwqS4PjsRNqa3NDJOq0idb3VzakA639ZuBOlBpVu7+/dF8?=
 =?us-ascii?Q?eXWktPkGmTiU4ONa3dg0joAmJqHg4JUj1qNIl31nnlwzdmpLy20fll8qrPab?=
 =?us-ascii?Q?8FepnTeZ5tWlXrQiJCScbVromkyNIi1bSKRjB7JWDosp70V2JnXjvjPDvrWh?=
 =?us-ascii?Q?c3s1zWe1EqVQ7H8epQZSlGqbwyK/o9q7UQ7BsJRq/9Y0bcvR/XoCudvM3RKs?=
 =?us-ascii?Q?c95Hbapkaf+A14lNwAcOzpvipNSnxdRBXDg6/ZcEWn99euScXmjPQeN0okVy?=
 =?us-ascii?Q?5owj14TAAFQsp8n+lnvQYgIE113qPSMgCQDA5b1iwv56ZTCxs3KbOjZbmhvz?=
 =?us-ascii?Q?VqF77TfhMreCyz774WB03gkqzQmG7XAca1zuUodLq4bctucbYgSaFkAz8yil?=
 =?us-ascii?Q?fSmcJiHM6HiFaQ5p8yrmdXfw5gy9YzhikiWbwcoEBamZ037BE9FT8dPwAMIN?=
 =?us-ascii?Q?4NLmYN/ekGe2kD887E0/WYknhXuRvX5bcvdyhg5EnSF3Ktuw3BCDhgKuPrbZ?=
 =?us-ascii?Q?rM/MTr/gM5FGnETUbtHtRZTKGSZ5jWPIrT2ViTML14t31SSOP4KGARVW4OB3?=
 =?us-ascii?Q?qVS7amxQWw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24144368-6aee-4734-2258-08deb594c8df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9644.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:52:56.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8t9/hFiTs5vUkWRsI85JYMpmuvg2jxZVkCwN7Cfdz2/AQhkiJ+qPWy+EncLJMo8LXTQOEoX0amM81q68JuReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11633

From: Alice Guo <alice.guo@nxp.com>

Add the bootph-all property to ULP watchdog nodes across multiple i.MX
SoC device trees, ensuring the watchdog is available during all boot
phases.

The affected watchdog nodes are:
- imx8ulp: wdog3
- imx91/93: wdog3, wdog4, wdog5
- imx94: wdog3
- imx95: wdog3
- imx952: wdog3

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 1 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 1 +
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 1 +
 5 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 1de3ad60c6aa..df06f03624d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -302,6 +302,7 @@ wdog3: watchdog@292a0000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
 				timeout-sec = <40>;
+				bootph-all;
 			};
 
 			cgc1: clock-controller@292c0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index 46a5d2df074d..a1a7e6a0571b 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -525,6 +525,7 @@ wdog3: watchdog@42490000 {
 				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			wdog4: watchdog@424a0000 {
@@ -534,6 +535,7 @@ wdog4: watchdog@424a0000 {
 				clocks = <&clk IMX93_CLK_WDOG4_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			wdog5: watchdog@424b0000 {
@@ -543,6 +545,7 @@ wdog5: watchdog@424b0000 {
 				clocks = <&clk IMX93_CLK_WDOG5_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@424e0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 379429b3072a..b88975fa7c8d 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1283,6 +1283,7 @@ wdog3: watchdog@49220000 {
 				timeout-sec = <40>;
 				fsl,ext-reset-output;
 				status = "disabled";
+				bootph-all;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..8c0b590d6ccf 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -795,6 +795,7 @@ wdog3: watchdog@42490000 {
 				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@424e0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index b30707837f35..4d8ce92db483 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -349,6 +349,7 @@ wdog3: watchdog@420b0000 {
 				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@42100000 {
-- 
2.34.1

