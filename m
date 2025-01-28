Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912B1E50E
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 21:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098982; cv=fail; b=ksc/whDOmbqfoeNVdF9MD+3Oz0pC1g3o4Rg1dx7AUVRrf54SQspXwEZOmanMWLQTdGoFeI0sevTwvAQAPZxK4CQ1Vbp3rmc/NKut3lgIC9wKRITCObP8kL13vg9WLLxQK6riJpDyYZ/4Ce9tkq7G87bM3YYAgesoRinFxvCJPV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098982; c=relaxed/simple;
	bh=YpRdhwtgB0DdpvMqeJkHu515CYZrBZxhMbWr96Kj5Zw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i8yctquNQKjHgdcpaGD0wQksTMsHkVl0qPEufbfnWBoKXvONJ17Qh/FmuvSrcadfUjwQoe1UrQlUHPzfaBJEKiDza7KThTV1gqBS3E5SbCxC1A3pqYSpG8/zYgN/ScTTcAsVhpvEd06IUzDUNYRWRqQqVOELTqEG+Fj/tc4pfMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jlOBqb/J; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jlOBqb/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZL9VRRwI0NeUddHLIDXLy0S8/T8oPFykC8fA/SjJheiFx5a5hWCeffj0jBNTxtMNO4g89kfDB5Z91+23BW4c8EcbX7jtKJ6lO4w07GAjGL+OZrtqxkItiMvllusKj97hZYbSIdMLk9O4QTBCbzFNYtlNMyjZ8jvhxl4yEdp2CoJ/I7AJal8R1MJD80qgtu1WPrKDOAzg7QhambYPea9LG9lby626/bJr0w3fJEtJduFXjaDWAYcXTzpgEkHV/c3OHQtbW+Ob89TwovEAyKUQ6jSxfh7nwALRTZPSyh7Gv6Agg09f2uh+sL/b0V+OuA2AMnslJkaxpJY8Dd3zywgJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe3eJPqA7IQ5RM09tdSyvRE4GkiDmPAF94ZvaNV3QXA=;
 b=kKe6H3wOB2vyh6tEqsaUf50UkR67JRjq9Aj+CCpCsWBA+G/AoS038Ho83U3cTPiE5ygTf1f6OjQXC0s6NQLeDAaC6rriLRaIBXoMTl8yMhqtei09fJcre9V3HC3HIgmPqDpPcrVKu/zXTZ60L4OwJxxyskRtCzy/PVLJAnm8ljREX28VAjTe/D2/4XMW1Kom2CDsyd/4SmJeDSrEBMja3+oACbzKcra0SriDGvZnnVRSRufLeJm3vviPZUASptNYiFlkq0hMmzBgLOqa1sbpb8Rj30pUbQnZV8+oDf+1noyefWl4KanKtEn3zHI2dlARpXLvib8u7Ppmj8xEmnc6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe3eJPqA7IQ5RM09tdSyvRE4GkiDmPAF94ZvaNV3QXA=;
 b=jlOBqb/JVoWF6ZPL5cNCaPNG6LeqOx5v5k5/+6M+GMbgB/2EZ5jLk+8zAabYTdEKVJYHdPGDKXum6FewWxmEGNhb3T8ap6og+fFz4k2lS6NTq/axjNnBvSYiNGa5rQi0zulPOJi9bjlvpb5jrmD/U7lXwDByskrOpaVqc2X8Wds+Pm91la/FwtjUKa6nChVkuSesuKPKxIycE0+7a5h0Y6G8Eco9DwvDJAYmN2Yt46EnvTi136MS8lPdQMrxvtWnyPpr6USiH+WAHlKAG0qaqmWHGNULqwa4Yb65wD9vQFm88BU5vm1pUAs3r+UMhHnMTJMgyV5qg4hrOE/TtKx+Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 21:16:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:16:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	hongxing.zhu@nxp.com
Subject: [PATCH 1/5] arm64: dts: imx8-ss-hsio: fix indentation in pcie node
Date: Tue, 28 Jan 2025 16:15:55 -0500
Message-Id: <20250128211559.1582598-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e20e344-488f-42a1-2614-08dd3fe100a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bm37Iki7P22m9//x3Sx2jCcoK2A3fnVrrb9TePyP9F2S/ZsU6KcA3as+ylN0?=
 =?us-ascii?Q?r/ebvuqm6x4fBBHiGnF/XzU/VuMyvWqUFnAdO+p8Fo6K4J28EuAauPWT8l+I?=
 =?us-ascii?Q?iFfbYBoqkggFV5U4dzqyMHjQ8TKp2gs1fOrl49AmXkAoj9YaslBvSjKGQGaY?=
 =?us-ascii?Q?41FZuWYvH/cDSsy9NKVWN6cOSc971aCTykY6TwucN11ozFnMW+HIOwCtF3rY?=
 =?us-ascii?Q?G5+HrdazDoChm8zXH1ooUBhIf3Lsq8CPttRjbzOQO3p1tlk0T5zdzi8//J8B?=
 =?us-ascii?Q?cXu3e1wPUeo5ILpfjJ0WNRJLVZjZonkump/fzhWPRuWQVzw7eZsMm59LijBL?=
 =?us-ascii?Q?fVguoGnyK9V4OupCf5dcWEH6AdtGHYx1Vp6Qs+eZNU4EG28vU/BfqUoG+Nwe?=
 =?us-ascii?Q?WL3HE4JxSlzzNLsuhrUSKW1dY+lEJbYrbEmTT2hk2/Ngdy6dtJAg8wl0xLv1?=
 =?us-ascii?Q?t39c3EyO/JJhofeexW+7cIicHOW7J+UVA+BsG6F6Ffaf8h9vtO3KNb/yuNg1?=
 =?us-ascii?Q?iONKAa4UXD08pWvVK/tsPwgUxRcLR0yceG0c4hoxt7GROaaFw5KrHKPoEA6r?=
 =?us-ascii?Q?KZmm1zNARDdO3DohJD1rKFVeFD6E7jupdfnkidOTapcR5NL/spON8jdlhG21?=
 =?us-ascii?Q?xgqQBuCdEZAuf2amUGe67is5v0qTIriL3IhMrtgKmbl5H9hNr+fdhwe2rBzI?=
 =?us-ascii?Q?tpcX6FDXQBJTojUhbgnQBTxvz2Y9MAsAzU4POFxgl7iApgPhl2FzzbfctNGg?=
 =?us-ascii?Q?dBM0vjWGh5eUTrIN1/FifhaXsEzZ0CFhvbE0O56nV/UcnRPcRdVep5znEYxV?=
 =?us-ascii?Q?Xq61YSQeOH2H/cXEfKzS30xkZ2tL4dudVR0iaE6HURSZLdb5ifbOWnjFxRzp?=
 =?us-ascii?Q?hfpbXZfVYbDfR5D/o5ckI8GUIvu5fo5BCt4bx9s5nQpgr8tFV9qSsSzLLAhh?=
 =?us-ascii?Q?GmNa50tRj+uhuY5/3W09c0/QvidXuZq6zIFZyjeo8R5jrZ8cb4ksjTK5THA8?=
 =?us-ascii?Q?+CcCNAhrx/HXLf1zV81lqKLqChH73W2LpjYPACdnUBc8SkEgWcuNZtmljL3d?=
 =?us-ascii?Q?mW5f5Pg6MFBI0lhTy1xSz3mgivnC7cDCpPDbL9895HynIp1TR+nq1n7UqL/9?=
 =?us-ascii?Q?tSeqBTgs4e0eCLrATpIYR4iN3HLpFrQqLGeV3ca7UpxdPNZCiPF7Jh4TLPP1?=
 =?us-ascii?Q?bSbc9ZMG6mexM/a+MBC4dCFppZt6w5e2wpR9zJtb5eC/F363F9+OKYcYBXAQ?=
 =?us-ascii?Q?glTgrIpVez5MQ+YVHL+QwJLz8H+s/OW/Mex5jDH34Nr9PVOukIz+rsQ2gmLR?=
 =?us-ascii?Q?JadcrFpFYLNEU/OcuZT0NyIzNLY6IMDStBlERNBsWaMnx0eEGeR9HzsuUKcZ?=
 =?us-ascii?Q?UorXjR1xC6vObGvq7Q72ztd0RRy3HQMwX68E4RNYcK/BKU1bJR8cHbB8kKcQ?=
 =?us-ascii?Q?SnBHQpWvfyScKvlIKx6A4OQlRGyHOIfhgHeVc3auqfqQW4UaPMkPmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAK2qQ59bazpla9I1AsICdimdQSrnZpQIKG+SjnoWfp1tiNnuwit1lhm8QQ3?=
 =?us-ascii?Q?oBkF+nBUXb1OWhiVmdHWzolJGzKHJmVXBS7w0Szmudmq0ertI7OH5yQCxzxZ?=
 =?us-ascii?Q?iI7cKX6aUO1MW7/ny/VpLIKUgm9mlduyW9J7bi4SE+m4HOr3VYhDsS6E1+rJ?=
 =?us-ascii?Q?t4nuBXCCeDxjlXKoCjCiF7U1vJIqeLjXFdRkb6/2Su59ZJ4qmRKA9SopJP1t?=
 =?us-ascii?Q?xSsEElyFtUr8qqK3Be/hl8Wq6UQnT8ctE3SiWk1XcrXNlujNTofS83NlPPXz?=
 =?us-ascii?Q?XpZGRSl4KZkuN6bWaw1RTPWCNH49ocYlZaTmxW/iD863cDpOPKBLAKhFxSOt?=
 =?us-ascii?Q?M/6clUvyyBagGifjUjNsXR9InodZOep7IEz9Xx4PrpR02cX5Us6OJeL4yMyH?=
 =?us-ascii?Q?dw7aamYECpAAJvZjTgb//lEK8uZaFn1RPCB49l7usxz+Pb60cVJFT7aQTA0j?=
 =?us-ascii?Q?KqPqFwS+QrYOOlsQlsXgLWn08FqB1QGArph5eg0BWm3v/qu3tAIzcct+2LO/?=
 =?us-ascii?Q?98GXFBvIx+hVdqoyGf0qACsNdn8BhImomkF8Kf6w1jnTbnO5WkmjAplihkV/?=
 =?us-ascii?Q?uU+7Cun1iz/1jc86cKsZAjpLQoOW+D4nMafOTWANSPxNtMIn5jotPSqenuig?=
 =?us-ascii?Q?iAzj1bJXhc83OzBz8jyiJ9R57cOkPllWbGTGad9DH+GNlac7KdyCMZEjYS2V?=
 =?us-ascii?Q?6O7+vb5DF0yguu9/J0lGg7wAQspOGE0u+6MBWtSx3Z2zY36bzxnfQx3JAFEe?=
 =?us-ascii?Q?+JZrhzpkTBb7GHzyLi342x3WeiarEXZtvdAUvSWIXJhJArf9QrH1iKwQZXgH?=
 =?us-ascii?Q?xQkHYB/gGGBeQcGJTuXmA5w6FI2/KCXW0K1GPejO30GXzOegHQpdc1Y15pDJ?=
 =?us-ascii?Q?n9WYzUddqC87yv3y6pabcBGfENr7MjeA14QfzoytLSJ8o4hyH88QfSxpHEnP?=
 =?us-ascii?Q?eY2FuJpcBN1uZhqKPT1nlorGGt2GGcOt40b+wDRd9XEKra1zGEaHhWa55H0r?=
 =?us-ascii?Q?uenCZRzY8ueO1xIZ58H4s82K87mOtdl2nck2+ueOgUvpCYr6QSbmJFCrsF4i?=
 =?us-ascii?Q?qkbWQz+7nUlYvsb4j73FyOwWDHew7j/F4n7XRq+kfMuagEb8zwmkN6oWJLGV?=
 =?us-ascii?Q?+tvQwGvLEVwAzkWM0qZxf0uG/FbuWblZdffBU2YNY0frwO8obASMKiew9TVU?=
 =?us-ascii?Q?+AD7LIaPMWrzIU8A3Atf8uoLIvXgCuRotKJJnwZk+ksNDPweS3IEepokt6zN?=
 =?us-ascii?Q?XQCU76YYd2lfkDr2emHshbaKc+q7qKV0pKI+O/wGDC4D/KIRErh5G8Cl0NEl?=
 =?us-ascii?Q?+lRkGNO28qoZVb12JGxQHYWNWxvhc1PiZadiJCq3cCq6eOWmq5dWkOoxjoZm?=
 =?us-ascii?Q?q4jxK+HdOvWrSMylDp6nQwK75l60krjGveccbCh0XWkoB0Odzs2JhwSSdaSU?=
 =?us-ascii?Q?hcqPrrdr28jJfsJrQ2oFINt499teg73853DfaQ6/GR6Z9fGQsnXQeplonDGd?=
 =?us-ascii?Q?8k/ECmpHmgLcH7quwmgA2+4KSuoZWQcc9tIlxJQp02+mClMW0J/zXLuM5ovE?=
 =?us-ascii?Q?9eAPgGQrxCUeN/VQsRk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e20e344-488f-42a1-2614-08dd3fe100a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:16:17.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJHx0BZ0zLJKvXC22bo2PbTJlvHijdRDbRod8E7dKisBFT+7BO/uiSrUYmgENXJaJf6x5v4KbPhaIaBD75h8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

Fix indentation in pcie node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 70a8aa1a67911..635b1c801cec7 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -68,9 +68,9 @@ pcieb: pcie@5f010000 {
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
 		interrupt-map = <0 0 0 1 &gic 0 105 4>,
-				 <0 0 0 2 &gic 0 106 4>,
-				 <0 0 0 3 &gic 0 107 4>,
-				 <0 0 0 4 &gic 0 108 4>;
+				<0 0 0 2 &gic 0 106 4>,
+				<0 0 0 3 &gic 0 107 4>,
+				<0 0 0 4 &gic 0 108 4>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;
-- 
2.34.1

