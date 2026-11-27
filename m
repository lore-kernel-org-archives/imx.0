Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776528;
	b=LPYe1Y7NVnJ+wpaBWs5KG8/ALJXrHGKDhPxnMe8odkUlBu4vpD+XdeRVyXKMeBjVXHyK
	 8sVU2updYTf1Ef+7gp4uG2FYKb4QYFWW8Sj+DDIfHeU8ZztO7rNW3EdgoAeZxZ09rfJiX
	 3PEV6/A6Vyc1npYXORG2VJd+105ap6h1E6/Yo0miRBo0KC/UCK4zdOUatKYKz8o/Hueop
	 LdWn101zxa2V0ef0zHMB3KIAYr/A4bL1FFwnk5Yf/MA6I8x23Gnjp+Ed6vH+BO+hEdrIb
	 m22ZrixeWnz5X7Q+UgUlzdo05Qe4B+n/880/Y4YdFTNRnMV3xX8bCmjk1430mh9VZPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776528;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vBNl77qW+Xr0MeE5f9V9IDcx5LAdJmwPd5qM5ecwXto=;
	b=Kaiy5uSTJj35KJ5k9zClmwLx1dMOIqiuLhoCFJzZyAsgMI2jVWLYgc1FQb9BmCuifJvT
	 wTWyfKw2S9F6yesYSbVwwQjubRmprVdGewQVxTILQaCTLR/w0kHuBKVo067hwCF2CeLlC
	 Aez/J1uhERoI2h5hs8p15EVuwWHnDxBvQsjLgk7TedzZ4iAtvcJA9hn2lTU1b83+oeQ4B
	 s1Vpc4puuqH4BLTSIpWyDm+HoaHLKAuL1C/5ZdmOYbrUV1beUqqfdjqmS+4x+Ewr61jmC
	 lX9EpX9J3RUnUWbpqPUwiu+ktYoTjaJy2H9i7gJiWAPGH+zj7USu+Cv23wr0yOmgiYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="l0Kop/HW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD7606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FD7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=l0Kop/HW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3g8B1vU+VeBBrp+t6x+5+u4Yzh89GrG+YjqoD9QxOcWvHIEVb+FJtncADXEyRi17msiZPhL/mYDf5c40CBA38cSGjL3zx8f2V6sBv0351zEXmeuKn6FrMghLbzMhbM4sMxyn5yOsKkRJRP3Kk60QqDxvqhphus/DGBHeDKQLyEscuq0AwyYQ1X3/sXu5vMfZTFQgFnnRmLL11fevNL+1brpx7KC6CsARYoAqtCuB8DiW6Rr655D7ruMW+noMOwHwoXEt+ITheDUTmPt8Uu5rfEZTfj2ILDopID6xs9IzRJLcH4jk0sis3aj3Lv+6NusN7Fz9xZWMtyI0w00dR8MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBNl77qW+Xr0MeE5f9V9IDcx5LAdJmwPd5qM5ecwXto=;
 b=ZJxWqBGc+UPJvr7QGQGLnLOtt76mmCaAciEKXO+qk91lEPJ0JVXQk93RH6EVUXRWlIm2yiOpSZ+nFyjID1W1CK6KQ4f23HAcDFAsZhc/Zu7Y6UIlS43V8w1l+BTdpt9n4UuVAW0/SMJ4j4yJdscqvnhfkdxWZzW+IPA8/91AQXqALnnnDee7D/TPqFifCDpvAZgNVdWaoDG8BivNpJgB8YwQqV2wtTZJZVO6WUYYBensnNxHnoZMJ9Rmg/GmkvTUsHQ3AqK9A/om//LM6H+t1xZbCJYhHiZ2LJ8yHeigOCHWSSjLU0Wr1r6yaePxp4+FOBYht+E7P8/aim4Nz3tldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBNl77qW+Xr0MeE5f9V9IDcx5LAdJmwPd5qM5ecwXto=;
 b=l0Kop/HW/1Ljm5xPYeVuyBAJ0cYKkYIZuklPlT6N3nFFPlxQ0RH6MPBXAABeyF8VOxAhuMEFREJkB1AcJmkQmf05jIbnW5qesMJp3TU6mdmvdjiSroFDeLKVEFE1yeNYmsZ3E86erEVrdBXq3LgP5P01UG471vNu3TL2iB4a7YfiEErE/irmQs0yuzwD7dQipf3acMGM9ojK3c7VeDKvBS3DLY6DISWDlVQ+YuDdpJCtZyUl+C8ogv/lXjbjERFGZrtPZt0hvLb85MALzXt1W8EStD8FHW+7qEFjc2/S1pVOlT74v8LWGBFCvaLXY7siRqpzx8pifMWfexzU8+ITvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB10270.eurprd04.prod.outlook.com
 (2603:10a6:150:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:48:45 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:45 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.dd,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: ls1088ardb: describe the on-board SFP cage
Date: Fri, 27 Nov 2026 12:48:16 +0200
Message-Id: <20261127104820.1990733-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
References: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: 173c6628-0501-45a2-f507-08df4c740290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	ZRyNp/7xZuFUF83Nonw4zSVS8aRAGZ4Dzno+V1uiCRDyStW1E7qyGLumsCVhWRalTJcpaVC2ekyJIpG9SmDXDU/Sr++Pkoki7zP6H+jZY7KL1h7ENmYeiOdLS2AYStkkuFLYr+6TK6mlHJNTubXl2sSW+EDKCyCLvvfQCp5BH8nb5iM7OabANoKWnVsyki6XmXTIwpAoGoNzlGb902qLFQFBhHfDODWbgLUbsPi9KYf371RjwssfFDBVIULQBeOoTH/+Aio4udk4tOWBa/42P70fRnCGZNNVAGgxYFLoS1g9i17BazM4lySYQh35cZF/ODDiPTon53feCJ3GlGrH/Qv0k7cjnfJulMiasilvIec4T31G4eYUDNuRe3b8cvjoNT09IkVpPTsBtU1uP1ojbaUhiNrR3FROCihR1/SpGwwUDe4rys5ffQhfM5IjS1WxR7QrQ2yoTOxeMCOXnqvSK+d3eLLbXvod1lIpR3JugO3+wYeCh+qMNG4Uv9J7dgpedCoHAnd/MAE92cqo6s4Wanz7U8ZZMU5Xz/41nIB7tV20MQfeQBmptNpm5k8g8cPszXJJCMzPQzFY/uhV8J1Eaoew1zKiA/PDuKgTOyPBUCqsGJ/TWDhalU8EFRKVW4T4+o+I8KKrDPkqPWKm9JVi00luSos4e6ihXwidvcdKTYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nJfI1/DkKLEI8rVClqjCiU3tBqfQsHCDKCyRQedblStN9Imu52yy/SgvHq4j?=
 =?us-ascii?Q?WV1uMLb7mm345QJS55Ys4vrMgJ4TMVdXup7xjNqyEPW5ta8V8WBWJikTt0ab?=
 =?us-ascii?Q?m3NsrrnHF+qn6gXi8O49nn+enVSSDzTXPQQxUhdwBstliOeNCpH3kHQc2Kc3?=
 =?us-ascii?Q?7rBTph/R138HRtwY2GozXIDYh8p1t5Fydd8zb2p3PpEwclFH8C/kGcMVzV4l?=
 =?us-ascii?Q?Z7JpFUlU7o4YKubSEh1uIzgeNr22ylaPfvTwuUQy8JL6B+p5KDp4l5Qm0NBj?=
 =?us-ascii?Q?aFZEswYmh+zaHpH2KIxF+OFDFSRu9Q/gwWmkYOD7O6emAsVevTs6ajfPebOw?=
 =?us-ascii?Q?Kbu9siR2uFPFvEMisYoHOVH4SKOfG2VhdPy0XVdoLHRTdQ66Ul6zE8Duon89?=
 =?us-ascii?Q?4g0XDEe/NTMOS7GB8aTAlJhtE0VJByHC47Atbe4M1IJtr9fd331mogmD2ogK?=
 =?us-ascii?Q?p/dL8wBncoaus9fyQQNb5jMvnBqkTRs2rEzcXgIYwaqV7ZMget81m1+K5Pz6?=
 =?us-ascii?Q?w2XmQyCbzlqCzGMGOnuam9ZwAifVpvcYMwVBK+9YOpld9Zo+RYV4rP0VtXNg?=
 =?us-ascii?Q?WWGXq5qAGmFTEwvMFm7CqYNQuvyaEwfPAmhE1gzU2dQNJGVGr0R2XjaVHSDv?=
 =?us-ascii?Q?M6hPEz6A773iFphZ0jCxF3530TaRQkplZfiUpjYLm563yVAXN834bVTvbgWn?=
 =?us-ascii?Q?NS/tY0GKYY2RDTz7mDKVx8Zxnr52Gztn8iTD6wpZNvOigbpIcoIRSFvkHQem?=
 =?us-ascii?Q?zEc7XR62AGBXhZY86HwGsKSZFwrD1idH1+BSxDLRzR7PMjzfVAitDtlEdfjy?=
 =?us-ascii?Q?IFIrQbdCtSUGYXqszSWCPB2AtpiS/bMljRJ5SkdE5YTXiKlZI6TlFzJ2w+ig?=
 =?us-ascii?Q?jysxw7Vs6e3f9dw0fPZPDyd93bKBBrSFXOHQcFFcaW74N8jlHWQKnyi/j/1m?=
 =?us-ascii?Q?8A/JUbBhmuvkL26rJeWU98Lbl5WCoEdKHlGiJGFmJOjS+14Noq7zs+HLTkUR?=
 =?us-ascii?Q?CttTLBBuKzIOyXmIOATogUD2Ulvidrr1zH4eYpKxY4pQKCuKDAryKLqIGA5t?=
 =?us-ascii?Q?3i7nrkCeoeUf6/U2Gdo3tWUy612yCFxKEB9xfFBa8lFDbchlw9cG6on+dIx9?=
 =?us-ascii?Q?GK+g1vNdGjf0rL5jHhvmOM2QnlrFF2vbo2Mh2B/+MRTyb2ZlKkV7OwGBTRp5?=
 =?us-ascii?Q?SYiBWW/mEDY7hFfQOWV7BsQ64bBTufdm8Uhce9WNAj4+FO2rc5giT53FV7hn?=
 =?us-ascii?Q?jgOiTKubqrWgwqqQeFQrM6NyUFWWQrerPqZ+Z3g9lmxLjTeuIU3o2NpyI9Wm?=
 =?us-ascii?Q?kY8Lc+IDkrOLth0kGo0juur67O+OFgT99rL7gnuRFi1zX6qXAMIcMasBCkad?=
 =?us-ascii?Q?GJ/W9UhHJPGMb/86uYN0Xsw0jYoWNCsfsOSUWGZ+PrBD/t92SEG/49tw3+XD?=
 =?us-ascii?Q?8YkfxY4E7ch6bhz3/RufwaT2Sp98+i0LpgPk5fgf83ENf4yXWC3EuNTsLJcL?=
 =?us-ascii?Q?U2kZXLxJRFykt8GuBU2y+m5fJn/pnu72SZXAmmkrMRXcj68Q7FBlj6ol1LfG?=
 =?us-ascii?Q?1UWh4H4dwlIJOpHbe1omR0SULnRWAQLkezKyFRgpfKZJ9S9GQG/F9ay6Dv2Z?=
 =?us-ascii?Q?a9JoGxNE4TbI1IIa7sUfUSRD/ZS5OLZ65SNbVBdi3Rhpd9jqZB4jYHKfeTBJ?=
 =?us-ascii?Q?jeshX6mwvtKtJPioCwTXJrt5f2RmYEr/BHlO4XNLWi1sOsw0beGPcu/G1vlT?=
 =?us-ascii?Q?k3MhzKDAIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c6628-0501-45a2-f507-08df4c740290
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:45.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7co9D4zVec6T6Y8iagjiMlVnKoJ438+JFVs3Kr7OSIjtZxZh9tp1OLIEBhkWHiG9Z6/LigPRNHcbElZxfGEovA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270

DPMAC1 on the LS1088ARDB is connected to an on-board SFP cage, whose
I2C bus is reachable through channel 6 of the PCA9547 mux. Describe the
cage, link it to DPMAC1 and enable the internal MDIO bus which holds the
PCS of DPMAC1, so that the port can be used with in-band status.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 2df16bfb901c..e23f5540b485 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -15,6 +15,17 @@
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
+	sfp_cage: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp_i2c_bus>;
+	};
+};
+
+&dpmac1 {
+	sfp = <&sfp_cage>;
+	managed = "in-band-status";
+	pcs-handle = <&pcs1>;
 };
 
 &dpmac2 {
@@ -178,6 +189,12 @@ rtc@53 {
 				interrupts-extended = <&extirq 0 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
+
+		sfp_i2c_bus: i2c@6 {
+			reg = <0x6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 };
 
@@ -210,6 +227,10 @@ &esdhc {
 	status = "okay";
 };
 
+&pcs_mdio1 {
+	status = "okay";
+};
+
 &pcs_mdio2 {
 	status = "okay";
 };
-- 
2.25.1

