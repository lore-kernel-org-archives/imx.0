Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA23DD85C
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407486; cv=fail; b=niQKwWte3YQtzJcjYzhipOLDHmz5rDC06xl4kTdEwGdDnsXGiyZ8GSf5zx4uLYffnjQvy6vyQ5zk+nTwGHlp/ZBepgLpl4HdgrhVpGCnfYCIc0hscscYgAKceSg+SCpmBsXvPh/8nRl1ch+i3FNJQi4O5u/fu7ZPQY0MpdgDH9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407486; c=relaxed/simple;
	bh=s7hXzhLGhYF37EkzzkVPEy7gNW9VFZ4yL5wU2sm/aZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJE2Mns/6pcyijmsv2uerhaxU7bxEAqn/1Xh8lkJ3yG4IyzCsRaNxTNdAJ+eqz9Y+zRP3PGiXpCL4D0DnkLzANxaE5wvzBM6uOw+pLeke6jFwwHunU2pyQ/JY3gdhcJBxYTqWYosoy4DpZyzj+tnxWkN1+kYKx0yn19cvT9bngY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sGaKt8lK; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sGaKt8lK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZYSuPmgXirBZQj7rWwZXA8GIgdo7Zbf2SwkVVKqDQO+tR68i/JIsAStdbwFl0gWW1LPUAaVJ5x7dmLjhiP98ikjnYn6vog8tv78oAkl4cuBy6xpeRNji988GkW7QUsfui8YpfYNd0mesiJBfaBEMdlXLw+E3b+lJQvFzCc8DTrdIpLcnXyOmrrlsCYbJpXwGYzsj+f2W6CCYGqrnnZkpOtbYAA95DX28O1F4DmeQ1/tjMDZt2i7BohO1nkD/YDn/5QxiUBzdSwmNHz89i+C8E/b8fgeGg9iUXH/l0Ke3v6uCF4y41xCK+G4kLTX1iVs8nFm+4ooMNEEEHi8DeWvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/nYR5Wz6U27G1xqz42pAbXImSyNsnaDZzjz+oYabgc=;
 b=l2eEBWprZdFKc2PnX1vLuq3kqpSP8DXD5YH6mfc9HJuZQLtuK8QCD30vRixomCEEi7oV42uyCMRgEoheC+wtwgY2wB2QKKmcuSn/VhcawOjr6AETERWlJu8fKTJxhz1vMLgmWGz0Dsy53PkVyVngeDOv2HobhuV8iVrMTu62N2RZMyOuThavU0XexybS75asxf8geOpqc0IOd7yq+dTSsvgFagbxHbwgLXHXhTgYDNZmmzB8NcvxPm1QitAsECWOK1nMUyay7JQtoI4adqNS5I1T8v4IjhgQlPRsyoDzOfxmH0L2EqDBN45aDHyrsWy9JACCzXIicqeey1KHkr9Lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/nYR5Wz6U27G1xqz42pAbXImSyNsnaDZzjz+oYabgc=;
 b=sGaKt8lKYbEB+/LfUoXZszrrBhXzhvSm60hqCv+bx3kGGUJtkB8NJN0Co4dY20wbzrA/if3cW0SCuXTE3naYhws7RH9yrh9Nf/7C8RoMY4Sa8C+cJnZhTNdY/S1MO4i3dH4c/76XbflKTc3v6HYLT8ElbmgSh1B9Xz0JqniTe9o3M0iA/KZ+WRyTMlxk6QkfSndKhmbdqheF8TJTGzKToiitfINwxPKN03+BXxA0xSdMUikPtNZr3EMMckFudCTWGP+4Eo0q2dYqyKrmqRg+MQtWKE8SBrdB3S5HwiBFwSuKIV3N8aUFx2Q+6zJF6n//o4Qe5fUmhtQpp9i7mEPZlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:58:00 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:58:00 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
Date: Tue,  7 Jul 2026 15:57:23 +0900
Message-ID: <20260707065725.312450-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a582b4-180e-4d7a-f9bc-08dedbf51534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EWqp6S+ccYicAk9waj/WBg63QPNpLPi6oqi8nQoFz0TKmGW9ociQGWeaypukFC7AexYHc3r5dOGQQ1OPtDoIduGBLbbUahipDjDZ2Ai5rjMtxNpevCMfqCb0REZZjFHhFTDGrRmpTh/8YeUhTUi1/HFX8evEgO8TOAJU4E3khk0H4q52oxFoRH7MRysR0Q4A6JwRqbNb75rfBnR8c8ZfruPoPk2MdSLnO36aBXdiKZWCZ/i1oHmvFlefNiE6pB/gcBqb5T9/BfavzPS7LaW7nIYk9ld3mOlui4vwbOISc9aOoMww26e3KIcudTtMW0TlVzhA+ZY2FFUTUj1QxBTJLG8qyLO2DWPNbGZvx0/ku9V+gP8RBuIHnT7qB2nrSyll8H75Dmk90LkQIA9OJip3j8TMWwODionENSBgeEBz41J1lrMYOymBGva9SZoEg1UpNVhwj2BojgC28jQYVEKSOJivkUdjfKo4G/fob5PIr3w8Lmqyvf7SN7bbMDmh7U04McTw8QoIfKT67ZTRp/nHafem0LmrHQekH+jik0Z/ivQnwbpaVPFXzluZZ5ynehvYhlwncqgHAepbUWEy47xGus7gGoJB3bYpFXM21NrJqCG9WiZw2WdvMWwm7jSOorASsgu+aAm8KR52RvnQN7ntqDDa4TnOzBhUp7BcSIt9Cp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?asIqIgimX+ZZrfrinkBjJeuP+qQGIKUznojiX18XuWsZa56AC+SnhHkcjTlE?=
 =?us-ascii?Q?YKogNi/SxNJbd7JRIg6pqBaKVKh9lbhaVLXlGRBOzCofN3TxN+jR0zpYIfrL?=
 =?us-ascii?Q?BYQHH6i5hcCtH/6ZeYaxPwUOZlCdWpQkWUzIGQlwSKYc3WMr2QWbxMWfDbzH?=
 =?us-ascii?Q?LilkVOITJuzlzj9WE6ONmhehh0njO6uoql7mqa1eO8t03FoIqHoV72RRKkAH?=
 =?us-ascii?Q?IEjS/PKzVGULqd8ZaaFVIAVKDqCcz7GlpFnlTuncuHdrXL8SkrYujYu8pM1H?=
 =?us-ascii?Q?4r2joCtijPj+fRf0ZTOFMu3Zy01Ty2aAncEcu0OOhdvzaqbkOhVVcfn2jqAQ?=
 =?us-ascii?Q?OH65zIesFd8DkGdYjGaV69RRyC3M7CtW84Fk2Pigrc4oATvxmEVqoHa3Htc2?=
 =?us-ascii?Q?e3dEijQlNhbfPaZ4WFowyE9mDFHKKpdcP8rwN8eQ3GWsdwIHQegPMKr2MVeb?=
 =?us-ascii?Q?S9dgOPpwpnj+jQHXRrlZLrC/8X02KtTsT0/CFy/klnUM07tIRkg2mGD3Omxi?=
 =?us-ascii?Q?ygL6aFyKm0iHdJRxE2rXCA9VTAlUgyIg7Y/3VU9TPuPpvN2jwMH172B9o2ls?=
 =?us-ascii?Q?Xh5IYFdGm8L3vTqqb2Qlfa1PblQwLaU8KFaHyAm5tCdSCge4neZKGgiG985S?=
 =?us-ascii?Q?poJywbnjv/ptA4pr6QuKy9yqHU1YlSmwQxCLo7onq6E7xyj6p+i3GlrBorOb?=
 =?us-ascii?Q?O2U+8pswD+56n81xL8MuntHGYoDSwJBwkNIuRgUwQPPCfPjMvY6i3zDtdXny?=
 =?us-ascii?Q?E4MVAp/Smm3atELcnFVqzhgib5grwFygPGAaYvsHm/ezfi4Hu9KT/YlYLsD3?=
 =?us-ascii?Q?JQ2UrxIs+4Bx6N2uNM2D09iCVURFN9xYZNOeB3mfDmCilnrhNug92NncsGXG?=
 =?us-ascii?Q?mEpK9XDYfm7/RPxyDcoSx6e8fkVgKCW3oYAJEk6x7tPurGNTibXthZgVNfUI?=
 =?us-ascii?Q?iy1Jd48AA8/nykRZhtGRw0KLQHCwayAziWsrz1JymyTpQe9bvHwoyPi/gAld?=
 =?us-ascii?Q?dyCNlUsBPWdBiJPWrAXFLekU14dALdoPLPMLOh30flOBRtwHlsg1eA46q/M/?=
 =?us-ascii?Q?rIMX66u9bfLKe7+695brN8l/sLDHhnEbgl7jBOY8ttwrYr+C8bB3hTBPzsnT?=
 =?us-ascii?Q?UAZBfqqkpixVZjGwQSREg+6+dm56iDxMpU8CpoFuRdA18VBXiNpzqoE5s1U2?=
 =?us-ascii?Q?X293tuks2ilRFq/b2YvwYvGniukelwd00prWcA1XU28eu0oXrSMiP9yzNSRf?=
 =?us-ascii?Q?iMcPO21Yjig2Td7VEYT7E+KcNYzHNBwey0CExdlKqIsAcJGw5qEgdE8ZrrXz?=
 =?us-ascii?Q?HwkDXOHDQunDZ7VMvlkPrQhHrvwjPEqPTtnGunkjaDnoRTMFrj0dy7jFxPIy?=
 =?us-ascii?Q?AC2018GykC8d58ivhEqYAsdoGBB9gNGPPH79l7/e5KiZVcta1PWBINRw+Boj?=
 =?us-ascii?Q?S8q6wgwdGn5dTFX+3+9iqMP3cE7MsXb7Ya8XH1n+9AbKu8J1Uf3X2VMjMtWZ?=
 =?us-ascii?Q?Nzbod5SdIQG1IDmVtCPBF/cHxtE5MsYtZ8km4gTPXqYGUZubpMP0k+V6vG7A?=
 =?us-ascii?Q?dysyf2eKiging3MzaNKZbCaEfneS+1yFhqMSSYr+DGoLkpey6tNReC4ziZyX?=
 =?us-ascii?Q?ZvAAjHuA/SzoA2/OAb4X8/P+e4bAVhqnlnx/jy0Gnj/yBfPeCQtt+8ppiFkn?=
 =?us-ascii?Q?upDnc5ZO+9/ZgGU26zgdrr5mairyN3vATbZv5wjAwRotgwvUoh10Aa+TSNKE?=
 =?us-ascii?Q?WlL3LdXAKYR0CkF/d6Jbl2GrTVb7y8CHg+TE9Xwi+rA1CcnPF8+g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a582b4-180e-4d7a-f9bc-08dedbf51534
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:58:00.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uokYPulGpaVTpWZw+ro2gTn64uL4z908Wv1Zk6CQNKmvJz1YcLbzMILkCzek19ZHXm4T18ikXwwWuMq5OSsCMFimI0++sf98ODas89QpuOG4/zOWGxEFMiRdHeuXpmkq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

From: Chancel Liu <chancel.liu@nxp.com>

The board uses GPIO-controlled muxes to route shared signals between
different functions.

Add the audio-related mux states for:
- selecting PDM or CAN1
- selecting SAI1 or M.2
- enabling the SAI1 audio path or not

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index ea8cf14e0bc6..1f2d8082d255 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -30,6 +30,55 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 17 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 18 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_en_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+
+		m2_fun: m2-grp {
+			mux-states = <&sai1_mux 1>;
+		};
+
+		sai1_fun: sai1-grp {
+			mux-states = <&sai1_mux 0>;
+		};
+
+		sai1_disable: sai1-disable-grp {
+			mux-states = <&sai1_en_mux 1>;
+		};
+
+		sai1_enable: sai1-enable-grp {
+			mux-states = <&sai1_en_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
-- 
2.50.1

