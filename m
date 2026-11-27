Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776536;
	b=Cx3/jnq/TvvtUV8DHqJLj98Fq3i7Xl8N1wwgenh5UWP8WE/dt8TtwK7aH6ruUBipDYnr
	 aKpN/0p06NRJTmGfbgFSYn3DFfXYxdfJDDl5sxJLRArZf5SI88dQq97BkulMsaGtJMrDe
	 3jwmqr/HAW/Vai1vjvppuL8w9+jS5LZ3ceTh0Gl/Vcq3C08Q4tTMgRlo/obsdadeL9wvT
	 Mg6WUd1+uNE898SBTOT8n57A6C11luzJzH+j8CmCuX7jQhOK3woYjHoWo6EELLimx6GdT
	 oxd6Gmlle06Neii9XB+eCTh9G7X0Rz1CnSA8hZxW5Yu890HpjCfqc6AYrL0V3HjwJYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776536;
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
	bh=PDEJ9XbmqbGCeQcukb/Ae7SaEsaOYTz37Xk98JhsQQE=;
	b=TAYdoGkSUBJr3mMcqhgvu219aWCO2gtVfy3qnEMJrGGgrfSkDjkOsNvGWwQbWwFD06ys
	 0eaBnrnWE6bQvqyTmKh1IfK1u0ef6LgFZue+yKOb3o6XBXNMggPIMxKSOgZ8VKwvj1N+w
	 P2HF75LfUOjBz7j4Uj2t0/c+GSVro7n2P3t4eg5wdxgL7OhjWBr+1zAzb+fBRZ0anOitE
	 shIcfWfSwbUkYkw83pHMAztNfI36XwG6MKI6KxD6L5dtBGny/moWXl9RR8nB7UO/TBnI9
	 XmLwMqSrf/qf0VWhbgEMhqDHdt2tgC05a7kFUxoukfJ4b3XEaJcohx86gq0qeUzF2kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="fx0PcT/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F641606A333
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F641606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fx0PcT/P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTPFERjmj+ZxUh+NxzbB2HuBdT5ghRhZo4u3mCxcDuoSkjkj3Ke8uRPUq21wL7eaVbA66MO3c0fNWvZ4qj/ZSEsKugv+vEpfvF9RpOh+5x3MH0byy6uWIuj0UC9j0RRXyDYPbWvU9yuxBAsyItPT66r5KoLCPLGKQVLn0PKAXOIRDxmS/XL3WU7QKWu1ecsBzQX16a482KLm6N42Ik8Po0Pq91FL1ESRn4tusJcuqohJY7p/6ORkUNcFDvMyGkgL/LoP7GBh8zVGIFAv/Pq0QpwLarCKwpjAByEBuFowFk9ctxQv8VTdzOQalMauzR/gNJIIxUxXk4vrysH+Sxt//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDEJ9XbmqbGCeQcukb/Ae7SaEsaOYTz37Xk98JhsQQE=;
 b=N46r8Xl/ugys/K+eMdSaNXbV3vXXNEnOyTXJtwSilO3AUnDwclyAU4nKxF3DqjHqLPxfUpp7g2bEWflfL+h34ZlB0lP0fD1zxYJzj1IW4OPmpz6X1MHrl32CuowiMI57LeNK4vunPi9JIQ/r0vTUtQKGzBsojVIa2n5mj8EdzzFN0z+672ZVtb4XBm4TJsqujPKaK1rEg0UmIlN5usWFhezNnNEry6d8VnpxHtjGKRxNoFkIDZkPOXLIoGPU8KhHrJYpycX3GHEtkLlMEhtZBwFxOVHNKsZ1bUb8k8UN3mP1nPLZFXKOfhicGZOaIWu9lS1QUC9WYxXnQ49mcJaOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDEJ9XbmqbGCeQcukb/Ae7SaEsaOYTz37Xk98JhsQQE=;
 b=fx0PcT/PoKpz/6w1Ajheb2pcBhyumawYC5BzkGlouTAu5+QACwcPUGL70DGP6JEfhcrxI9HWx6zkcLs8gbETiTQAvsQ+xMamNE0+SIf6wp63cbZwcjua4CBgSw+i2ct6UQIR8Zf1VNguO2TrzHlomHKvMx1iYlhklXJYtkCUZQldxg+1RXpnPAejBX7VxM9ZFIWr20oht04iqAPYIs2ccYAKElqBykyuR2nYlKsgvqtO3JA6YHl/amRNWx/9EW3Qi0zx5bDltQbA80sYyIFbRhStDnB2cnn9tJLkGIc9eI/xsM4nmaElrijbgl7I4dDx5AzeYx2WKs2FjFG3ge8Eug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by PA4PR04MB7999.eurprd04.prod.outlook.com
 (2603:10a6:102:c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 10:48:51 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:51 +0000
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
Subject: [PATCH 4/5] arm64: dts: ls208xa-qds: describe the on-board SFP+ cages
Date: Fri, 27 Nov 2026 12:48:19 +0200
Message-Id: <20261127104820.1990733-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
References: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa4fd06-5c9c-4459-daae-08df4c74062f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|261009223027099003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|10067099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	aF/KBJ2sp6/xJmg3d2SZpqC66XRl8Nf8QvU0VgALsAYl5rP9+JX7bSPpRuyqKLTN8tiDTzvRDpe401TkoUaG34fjy5YjKplsISLnQEtghAl8xdzyIv8TY1Z5QNXa7L+vGA8RxR/xCAqFSkmlRf0H34ZvVEdNoBdD+9XVNUMOwfaBgROXwdKJ7eMi9G5g7kMfsZrDtE5nqoQVuNIa2HwAeMiex5KCOLvziySmbB5Oe+Hd0K4ESjE3Paif3PNAtiYnBg4lEuh7W2AAjLKLcyGK63MwsECc5ayLgZVoCu2z4lZRbk7KUpN70NYrtrjwEE2P+AFlwTsua/y2UrtrWeSivA7d7mrSVi1yucOlnrrR+j+rxzgq3pbzb1pbxojLKjkErRvB+neC3LL7YUzXenGAt0/YLoKwzimR6/3X4pxUdReNqn4+2aJIJ+HQbCM1AOGTc09lwzXUovmrNFNXA5dqvU/ArOQj/HmqD7keGzb/vEk4z82edX34De/qve3pC+vVmQ5K7U60xeZvMERudwva6r4+nLgWen0O00H2VEhFF3XmJYyj0ImNPcLXq9CEewDzZCX9oMb5xPcb/hTinWDel0d8mXXHbxNGhIzMjIcpad9D3+KoamCtT6i/ux89uxRD0yJHO6lvDegKMViPb4xQLf3QQ0TSePDkUxf+mz18Dp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(10067099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9aLleL7IeLAbuHq1OxFdCoqYEviIvzaM4yEJ0WQOgOeoANApPN9Kf4QKMMt?=
 =?us-ascii?Q?yot5mWFHEwq9we0RJQkDpYzx0LujUvkloXkK2fcRJ8tSFkxBM8ZIB/8qFziH?=
 =?us-ascii?Q?fXmqEDolt7kn1rmw9XwyB4Tf3kZHxFAN3LTaRB21df9GOuuYIaClUw0t2e2g?=
 =?us-ascii?Q?WU2WbeYIxLWEea/5U0gldUrRAg+RPNDP/W0Bp6UGHRBI7vqvTjNxz0p0BXk3?=
 =?us-ascii?Q?Gj5h6dFywjkc3vzWAGJqO0zA3gvQZdJROyE40CfzFOuU9BsCxw/3Rz3DmO/T?=
 =?us-ascii?Q?zyOg5Af483bHtTFE4392mAnBjpZiJK3mhgznsxXzmgaiFVzogtSXZEnGv3oa?=
 =?us-ascii?Q?aH4YoerPolXTwzPXWtLRE9oiGyuj2+jZ1NzM/sf8/xHuVO3HqCrS3/MyYSW6?=
 =?us-ascii?Q?qbHIiTv2dOAHH2LPBWQL3Iu+mGsRqM0HCQGAoXUauiWSXR5TS5Df1u7ut1m0?=
 =?us-ascii?Q?k8v3QNsTBos1Lr718iI0WTlb2Y6WPO1eoXgBwqllENvFZhqfSijbD7fPUjwB?=
 =?us-ascii?Q?XNqLH4goHfgbx81BN9bJwJPD/X+UuuYprb5r1ykSqIxAHmkO5yvdpqhNLm6r?=
 =?us-ascii?Q?fZxrHZsSexDgTXJTk2F4K4Ywj+IDkY8uLrp6ry9XCfHZCX7nQmG7Mps1UDmR?=
 =?us-ascii?Q?RH8uPslkGkDIC97e/F2nXQfha5xqnP2vky35Wf+gwjX1QOELgbwroS0raBIx?=
 =?us-ascii?Q?ZFCVWWeibjD26NOYf7IGq5P79qubdOajI8HgySibj7qeKRcpAbvX24OkM6U3?=
 =?us-ascii?Q?3M7E1ZkY7SZyYSSSY/x/769H1Kmipsa6QzTsU5FS+K8AgLHQfonBxt5NsRDi?=
 =?us-ascii?Q?Hcyo/367nWdhBRMI3Sl6bj1GdCcTHWXXPA056/eGTN+RqLucUP5K9voYk9vB?=
 =?us-ascii?Q?4vBCjr94844YSwOWwu5wGWUUIyH5ys1JntF4NdkW7LuvX6bOd0vLS7vRqSa6?=
 =?us-ascii?Q?5B3ErthmKUC3zUiduXNYymlScqAIF3UWtCSrnyQ7xbOZW6HOsy6PjCoy2SBu?=
 =?us-ascii?Q?XB7QQU97K3xEA7p27EEpeusov4z0ackkC94/rfijOZF2UZf+BZXbSn82A/kV?=
 =?us-ascii?Q?7Xqzw3vW/P3F3W5BFKMYimKNqMcMw5/OXAypoAkCJvT7UC7COqA0oyCAMJ3u?=
 =?us-ascii?Q?fGoRqSk5JFcmaMFRLUtoq7R0PpBVN+B849Kxf5oTT8ykYm8W9EGbLewUYyfA?=
 =?us-ascii?Q?TW4mNu5Ydv2Bnmj128zuiwuQsvFXxMI2gyMa+s0487dcfX97aTxgvXPJvHEk?=
 =?us-ascii?Q?iCnGETp8QYslJJhaVK61lJ536ep3JacHpB0NF6HVjMEanvHbUIeFzWKRQUI3?=
 =?us-ascii?Q?aRvOS9e21aT1ktYwLjv0Nl3aE9SiPMpzB2NK8HsbkAoPH8gxeTU1dU9sJlnP?=
 =?us-ascii?Q?Kiu42DAyawOlSRCjti0i0BTyT6cz+mYIdnPpKF2MFtexKmwRCuQRXmvt0cBy?=
 =?us-ascii?Q?fP50B6hILFJ4fzqgRBa+3vLXx8ie1usy8tVhlTmGBGG7aexGnZ3CtfJ4TyOK?=
 =?us-ascii?Q?O1xpn1/zh8QaGmKQnzbYQ9ZhZgcg9VnLJpCqfC5kN9FWkUV+cIWV3VRMSsMe?=
 =?us-ascii?Q?qhKMwK0dIUfTtPsFxDNSa9Tb8odyExEpJb1YB9RI8IC6K5HtDCMAsl6i5qXs?=
 =?us-ascii?Q?pYMVjNP4iuyC6auMYb6IPCgH0aYNPeNQ9vHoa3uIz1dzBhz1ljpGlArTLuqM?=
 =?us-ascii?Q?nbq90E/TW11X5PxKs2Vd1baNBHVu7Qzx1b6Lv+CC3ZQC7B5QNu3WdzOnuQ9G?=
 =?us-ascii?Q?7+ctdZdpCw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa4fd06-5c9c-4459-daae-08df4c74062f
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:51.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxAgMICYZ2acGFV9JTMQFC8BUrHCWgJrE1kdUC0GuOyw5S5+WMrzxnjA5lEaHg+KzqJEtSs3vcO5dDyxSSb5Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999

The LS208xAQDS boards have 8 on-board SFP+ cages. Describe all of these
cages and their associated I2C buses.

Even though these SFP+ cages are on-board, only with certain DIP switch
configurations and RCW protocols the associated SerDes lanes will get
routed to them. This is why any updates done to the ethernet nodes will
get done in a separate overlay file which can be used when necessary.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
index 556d8c5f3180..2d2dbf1fac74 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
@@ -9,6 +9,56 @@
  *
  */
 
+/ {
+	sfp1: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp3: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp3_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp4: sfp-4 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp4_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp5: sfp-5 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp5_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp6: sfp-6 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp6_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp7: sfp-7 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp7_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+
+	sfp8: sfp-8 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp8_i2c>;
+		maximum-power-milliwatt = <2000>;
+	};
+};
+
 /* Update DPMAC connections to external PHYs, under SerDes 0x2a_0x49. */
 &dpmac9 {
 	phy-handle = <&mdio0_phy12>;
@@ -146,6 +196,67 @@ adt7481@4c {
 				reg = <0x4c>;
 			};
 		};
+
+		i2c@6 {
+			reg = <0x6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@75 {
+				compatible = "nxp,pca9547";
+				reg = <0x75>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@0 {
+					reg = <0x00>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp2_i2c: i2c@1 {
+					reg = <0x01>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp3_i2c: i2c@2 {
+					reg = <0x02>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp4_i2c: i2c@3 {
+					reg = <0x03>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp5_i2c: i2c@4 {
+					reg = <0x04>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp6_i2c: i2c@5 {
+					reg = <0x05>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp7_i2c: i2c@6 {
+					reg = <0x06>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp8_i2c: i2c@7 {
+					reg = <0x07>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1

