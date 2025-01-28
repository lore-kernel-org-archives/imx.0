Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FD1E50E
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098985; cv=fail; b=tQVuPTBxeA8Rb1S9Iw7u3ZGgctFodHMrfOtnRtRjsfPasCcaMQ/5uhFGbuc1a9dVQdbCWAYWeCzhqd7g7uZAtK6TGsjUAp4iRhNhlgt0lfHNuVQqzWY/FCnsXWDjQLgFtAVFcISuO/Yh3+ohEEK6juwLdu4knUHjyj66l6o1j/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098985; c=relaxed/simple;
	bh=BrC1ip2W6pmkh7htXyZSFAbL3FUeOb63hL/yBliLqAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QlnVy8nnYxE+/7yIPJbMdFs2/DiY5qrWHokbG7GZPkI1Kn/UAhz9UGK1AyNtnaY5HFuJkl8gJOTzS2wcBrr3JpdghSbUZ3gAHwYKkGHNsr9LP9EMlgNDK3I/hf3SVA7+5vw+zrIk0jYrImky1RvdUjBm+IOtPT8avgkv/7NkXhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G0RgnpYv; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G0RgnpYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4vtYl8OB6zUx4ZYEtCIDxFIXPKGTTRdMdRlmcXZxeHg+8QtCW3WIMko04Wd/lat1VRZufV9A2WRmJSZqja8J3zwEHTqskDpT0QcaJAmWt/k1HA1XU+kay6rlDRDiz9C539JuQ7Jj0gKIWIjCc0aLEHJKcbgQzZiprX6moY/i98KABbMmeGymw1v9sJeJ88WwIPRB5DprFxJVIiOKFwq8T2Gajpt1UQ9DaR13vKlXqtm2aE/wkhasziFtCEKgCZ3L0Hi8jbGuxWK6JhMTvn6UF2GA3HxL6SkS8FRcYAFuE8AMlW/6femUhXMAgob9iHWcVaWYtOlZKErGYJQmycr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6++BG/X9/sjeDxV4Xl+xgaNor/bh/Nlge01o6Q3V6k=;
 b=QVEoAsdalvoF9UL12tGMEI0sz1VxEgHThJMpGkpiVbzj4H3Fk5khKVZceFNol0lcr9Pxr7t8xLtY8H2QQ8zd9sraTJLsHm9U1j7L6SCE4j1eiF/6SRX+1gmN2Vbaew/be14jwuVGgvjwbxMrkKWinxABLKH4oX3u/DDfmA/sdumMR8p+YEybyOaCGPUdfVKlIkcOo0ebxJp9NxwLbLda1qZKIKozpT40zTP/bF3MCBl/LsHV+QKEksYA91rCnGyB5dLBwQxnbEWzVBK08RcMuUaxF0weyIH6GwrLc0B84e+gTysYELKAHQqiZ6B+9rpUNc0CX94SWiICfKhSO2o2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6++BG/X9/sjeDxV4Xl+xgaNor/bh/Nlge01o6Q3V6k=;
 b=G0RgnpYvjsJA01pK6vPAss1RzIqcK/RRwk4x47wBwpsUp3efcqquvES4wej2eJnIanwrv6yBC0lK8/wxdMxr5ye3qe5X8I4+WS6CDmdxyLq7Dy0Ptmh2P4mlpFuTQ+YnA0UCtYG/InJEYYotqZzA0RBJKeXBIL3Ku5wkEfnQ0OnPiR4NVVbjt+4Vt2lkU9XRcpHZqyMUOK6SoyN+MaAREmt73G/wXA+m7hqx9RbfGvg0ZNgvmbwuoyMRum0BnefnLshmNi1iOtnANAztUz1rF+tWakoGBsGDfqwii7hwKdn9/Eiyy5yBCr/F2NMMnZ55QTyHd9OJFTogWNOj21qsLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 21:16:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:16:20 +0000
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
Subject: [PATCH 2/5] arm64: dts: imx8q: add PCIe EP for i.MX8QM and i.MX8QXP
Date: Tue, 28 Jan 2025 16:15:56 -0500
Message-Id: <20250128211559.1582598-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128211559.1582598-1-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6809338f-ad63-4993-cfee-08dd3fe102df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q5hijTFnF0WQzcK6MCfTu+5Ois/o1N8wRzxRUBKEdbi1jQArZWV7PPWxT5Gj?=
 =?us-ascii?Q?8jvQ0cPfy62hidk+eAjfVllJLUMr1Cp6HBV+O+XpTwvt61aztI83k/y53Ngl?=
 =?us-ascii?Q?IkCO2W6DlfixjbKSV+YGgX5pqtwWjjcw0xWVBmwXwE5XpgRihkjL3MVjcEW3?=
 =?us-ascii?Q?Iqtnd5eeYdL0cN+ixVxG4X6b8LUMTO8woCWSMNlQb6Z89k03NZttkSxl88kX?=
 =?us-ascii?Q?wAWVklhsQ6egS0PRuEnGXAc76wUTpB0lUyLkChLgrkJ6jpSSmpInIjacDuWz?=
 =?us-ascii?Q?FzKhBDH89Ak1O69mzUKRS/2mkfnCue3RQugJfSqtzToNEiPn6KZU8AdCBGnH?=
 =?us-ascii?Q?zISqortgNPvy/3o621JP8jZC7u4YYqhsbQ0BXDCP2uwa+xNdRXevi6sPZ2W2?=
 =?us-ascii?Q?tCVfVghecSJpvVHKiE8uOwnC5HtK5uIFghdxpeucM4VOymnddpxJkT40NTQZ?=
 =?us-ascii?Q?kK9eVcUWSDYVV05YoEO7wgNXWtrzBlnnmdE98p8BCgPgvW/1HV8oYqFk00d4?=
 =?us-ascii?Q?e0z5GWubFd63rjxfilU4nuRix7qNSoEEe6XmUjajson3I0k6b53xHiwZX1Xn?=
 =?us-ascii?Q?tRzD3OeVIjAunSJ1pe168RozVPE+xXHEt/tjkZN/pDvYjCVxg5cYK45jNn+a?=
 =?us-ascii?Q?lj1cgs8GqwEmd2adX3Po8/aEVZD1zckYlBUMVxrH0lGwsfZftewwQBWxf3ac?=
 =?us-ascii?Q?yNCfp3+yBZirgvaqZwvY11nT3zwck3mKe+HGgAMlAs0LZleRfvrq1GrlqEXF?=
 =?us-ascii?Q?N2VPj3phslWUR/27SS+7S5PNgpZrwSsaEt0S46xZvkebkVqKXNiRVixw4rCa?=
 =?us-ascii?Q?6vK/8wbcZwHW/k9itqA3Cm4JcqUthnnw18iLP6yq+qOcaM0CSt3a6XN1Jary?=
 =?us-ascii?Q?VnmPepSXfIUjfmWTL6eb9ixFpsd8QPWScjxvKvIFWOp007nP+Eic626KPV1d?=
 =?us-ascii?Q?vW86jsfDeXzsOmnM8ZVaMmfBKBvNWgYIWfzkV1rk/93B8ckwg/zUmKdjl1QB?=
 =?us-ascii?Q?731aYKMZKkg/JW6/WHfRaJO/WmaowiK+zc4+2drjfUzvn9tjqJS3EuBaMEyp?=
 =?us-ascii?Q?2rgRAv9cN/aWG0EvXbrhWR8xVEaalb7krjTp0nlL0qx6LoMw612i4ko9v/L2?=
 =?us-ascii?Q?BSO7zfB2yQBgWgJYnelWI4aDIGLSFLWX0ADLkHK/1dJYsDIuNidS4OrL1IaR?=
 =?us-ascii?Q?6SNnG/+2/6bDQ2OjS0Doz2rpLyma2NrkVA78sLezyx/KyIsCL3rZPM7vlfoF?=
 =?us-ascii?Q?WiXGPGRGCDXZZaHBCoQy/qP1Fl9s4/eyPPbY5PHoMtsRch7IxwFhNBLU9V5d?=
 =?us-ascii?Q?0MIly3b6mH8MS52iAcK8i/hhN6U/525UWHKwH6TusLUAEnuCf69S5PHOLQXt?=
 =?us-ascii?Q?ru7NL6gHowsuAYSSpQzxlbeOt9d7ZJqp3ZB1R/YWbhNETwtwYHB4p1q3mumb?=
 =?us-ascii?Q?fLH3Cnx7BEwC0eLVWu48i0ZJG3W84xx61n0IYucEtPFI7zDANixmwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z2XW9Giff/cUFWEq5VayDPMoWWEnqsCn2TZTpPUFF8HvisR7Dni/Il9mHORl?=
 =?us-ascii?Q?hHInZjeqFrzTdMgH56xcINJ5ZQjvHZAw8COZVPoGzUX6fy1xk4EcOAnKsDii?=
 =?us-ascii?Q?pKTjQxNtj21pbIP1sJqzFAX0dGI7xnqxDH42TWjjfj2v/TsRI60lKadci8NO?=
 =?us-ascii?Q?BjjISnwUB7vkAiVtgYVXCAFRTh5TjjWntNBcs9WOx5jd0rzLiKDc59DKm7qv?=
 =?us-ascii?Q?hDzoSbzWdUltTZk/BYO7frdVTs3iGDZH2IPp42p2o2uRgQ3Ol+bZ0/2QZnFQ?=
 =?us-ascii?Q?CRemytND86Ax7i2wWGtLa44NlMlBdjyH8EprDFR80ncCmUdwk3FoA1WtF6E1?=
 =?us-ascii?Q?rDWZ2CKb/u78Yt/yEkQxImPKE0cUcMMOoIYt7aKFfrWak7j0ABtXVNy1oXdh?=
 =?us-ascii?Q?MuOlMzHnjPhJjg/8fcEQO83ewGKtsCWOyuBe0CF9V2y9Zdd+Mwxd87qH5sOt?=
 =?us-ascii?Q?C3+64pFgXLvJGdBPR86U31mJFhmvBUh0ehjAunU8aYBxWtC44xqGl2waXKTX?=
 =?us-ascii?Q?5gQ4mhfE2tXNgraUpsT9uP8r9dEHi4OtgrDGQUfoe+IoHw7MwjB+ZOeS0AN+?=
 =?us-ascii?Q?ybWtfnwANEd07kurJCE1DJie11acIRrxc0x/bAtSNcn4s4dxI55LfBNAAySh?=
 =?us-ascii?Q?Jv8/D+wXEJf+Qff+bexJnLtcR3RnUQJwwVMuBfdXFohyztOOu7zjRORVV6bG?=
 =?us-ascii?Q?krc8DdwsuWBM0MGPodYK1+RjFicLnGNV4g1GB8sq9wc4+KVsZzAen8Z6l2Gm?=
 =?us-ascii?Q?MiNKS2RpY1DB/rwz38m5itpMlY41IFLz7ntG6l1vVINhyox0EzXV9wLgMzHq?=
 =?us-ascii?Q?12LHdU+Qh25Qj+2JdDqPPXhsHKXpWNuyoSnufeS8CRthciA3eFBj4iGXObuK?=
 =?us-ascii?Q?BalFGIFRXwfuOiHgG7Y5kJm5rsvB4NznvrIxJQV2Qzu2XiIsTo4ekb/pyPvd?=
 =?us-ascii?Q?zuGTlvmNHhO6VJnkuIKm+HUiSFUpPY6OPvFywXYzRUdNS9xDWGPs9gA4Gchq?=
 =?us-ascii?Q?bmXv0YRfcke46WfsLRn0HjLobEwPm2Pe6cQEjq8Vr5DwQMfXFSCFqmcB3TAW?=
 =?us-ascii?Q?mBvhRKMDu0d1CIbUr1zB1Q5xNXcIbqF+DIsvl6Yy+buzl7exs+eIbHtp8zN1?=
 =?us-ascii?Q?VxMuV4UaPlcXRscwLyzKbtxH+HsM+bJmxjZMfcCrKe8zL0jCHPRumc11sZsg?=
 =?us-ascii?Q?ctR3mqRNDdHB1zkmZuIAFD0MtnE2Eih4m0M8rF0udh8Zdtg3kXGnHHuRQbka?=
 =?us-ascii?Q?obyVSkELFQEk6z6egvpq4QQunU3wuN/8MCWYNQvceWc8NhjiE4hNUYqBxop/?=
 =?us-ascii?Q?07/vWgsdeup3T23ZEZSnmMAl/jwOwP9hoiz+lojB+PxIkMKd2k3l7eb9iakn?=
 =?us-ascii?Q?/kWICAiw1WQH6fM3eT2f8pEu0N92oyrRe0ih6/Pl3gPXKCcou//5g+VyGKOi?=
 =?us-ascii?Q?Bi2BpDwRkpB4Hns4ySX3hRCDwOLCpZAr7un5FrIPK9tOE6DVrrsY49zXOuIr?=
 =?us-ascii?Q?CW2+Xuq6m34T0c6cGDN3MRiB4dKutfyGNJ/GTPw1oEoO7Y9O48DvHeJqTqw7?=
 =?us-ascii?Q?DmEW2yJEkhF7FDKYpA8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6809338f-ad63-4993-cfee-08dd3fe102df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:16:20.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huP4n3yazFksWQcicEkWHdgjWWzoUaXQr4W14GESml4LdMbxkrKf2xem0i5Wt8vVRrBt2xA3YDZ5PlwkCijG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

Add PCIe EP support for i.MX8QM and i.MX8QXP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/freescale/imx8-ss-hsio.dtsi      | 19 +++++++++++++++++++
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 635b1c801cec7..8ec6df02e6381 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -79,6 +79,25 @@ pcieb: pcie@5f010000 {
 		status = "disabled";
 	};
 
+	pcieb_ep: pcie-ep@5f010000 {
+		compatible = "fsl,imx8q-pcie-ep";
+		reg = <0x5f010000 0x00010000>,
+		      <0x80000000 0x10000000>;
+		reg-names = "dbi", "addr_space";
+		num-lanes = <1>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "dma";
+		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
+			 <&pcieb_lpcg IMX_LPCG_CLK_4>,
+			 <&pcieb_lpcg IMX_LPCG_CLK_5>;
+		clock-names = "dbi", "mstr", "slv";
+		power-domains = <&pd IMX_SC_R_PCIE_B>;
+		fsl,max-link-speed = <3>;
+		num-ib-windows = <6>;
+		num-ob-windows = <6>;
+		status = "disabled";
+	};
+
 	pcieb_lpcg: clock-controller@5f060000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5f060000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index b1d0189a17258..d52609e4fc455 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -42,6 +42,25 @@ pciea: pcie@5f000000 {
 		status = "disabled";
 	};
 
+	pciea_ep: pcie-ep@5f000000 {
+		compatible = "fsl,imx8q-pcie-ep";
+		reg = <0x5f000000 0x00010000>,
+		      <0x40000000 0x10000000>;
+		reg-names = "dbi", "addr_space";
+		num-lanes = <1>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "dma";
+		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
+			 <&pciea_lpcg IMX_LPCG_CLK_4>,
+			 <&pciea_lpcg IMX_LPCG_CLK_5>;
+		clock-names = "dbi", "mstr", "slv";
+		power-domains = <&pd IMX_SC_R_PCIE_A>;
+		fsl,max-link-speed = <3>;
+		num-ib-windows = <6>;
+		num-ob-windows = <6>;
+		status = "disabled";
+	};
+
 	pcieb: pcie@5f010000 {
 		compatible = "fsl,imx8q-pcie";
 		reg = <0x5f010000 0x10000>,
-- 
2.34.1

