Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1B819C566
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356953; cv=fail; b=uCVjMhuZF/hdnIzgzKAdAj+1TJJHP2fRekLuAP15A7bTFisIVgZCXiyHcdV89Wx0v6AQSOKUToOked0EExx5ThudN87xrthUs+jShOf7fL5ab2yU+szPncQtEZruw2vlt2YtNpCV5FaBMN4rYnNipE0xL2D9VEztC5pkpHYWWaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356953; c=relaxed/simple;
	bh=wt5TuxXhckJFcEddFiG8RIcr2yRnfEF7ixC8kvn17Lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tMybND+Kv1ZBws6h9LBzfRuQAWmLYCy0EXviukVznxeZFM3wIkKh5SuhWAUlLOur3d6BDzSAld/eIOLJCvkhu+dMFB4+XSEeWiK3Ot2f888J8zCXcjTOVWzJxXDtKrz4Jjui3XZJPof3O8HDQGq4boicXGrt+t87g80CLDAhu+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aPV2Uhu7; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aPV2Uhu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb7qCBKvj5QEk8plz7jWWhUgmHC0Fh5fHCGI7Umutd+gI2mDQD4T62VxYPw3ktj4gtQCUDbZJ2Fn13EXCdG6/9I9TwxPsfw0FltnaHd1u2M8LIpLAOVNSsLywo6JCcOeDYUzH19CmHBRgt16YNmd6JwRQS9sPUgGBR0ON6Mw589u1vQId+Cy924j2yL/O0SfeEHk0/JmxV1yH+azKqgD5LMcWogWsyiwSVnBmADnmvLvOujnKCxEQu4r2NVxl8ArXuC2GrKzjkXyeYPLxabZY3kmdqsPcxEfSvXEeIkIOToblacKw8J0r4CvCzFuYb1r2QtkGTHJaPJLbg3pViBV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxmIWff3lPaZk5iojGmJrACT7Gl7a95WVd7pM807eXE=;
 b=sE+hAEYSGRnbhP+Ir9d/YvrNwUhmMw66wYwuA1vsGC2XwMhYul9sdBfMdFVk7oGtryr8Smo69v/BgMSKndm1/MOcYU9zbn78z0npTtS2Kga+DqP+5SlYPz81WwMljD1nwT9LtRwEgIZZYCKyemxgO1+iHkVTi3gPa05yHRPhApj/5U8ykM0UkDAc9PESAulsOP3pc6bopnvs/vBHoZiSkGuSI7k+q9gkgcMLsgpqvKfzdE/NmRJfMcSb/YBhAMShONsOHrFa8LpUus+CvE/UZ8BiGrGd5O4TL3md6ZRRq3HCll0OdRRmzKFHdo/dR72kK5xUevA+ZbpFixZcwTM+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxmIWff3lPaZk5iojGmJrACT7Gl7a95WVd7pM807eXE=;
 b=aPV2Uhu7A5+Qv6PwpiZYuftENnZNIwXWkTG24t0guvnP5Gu8R9L++lSIUSmfT/1szvezX1VSJArMo3RsQ4sM1nj7c/4GHpouNbzJQUrFN/veNthgH+wS90OrCKaqnavUAmHVG4vcSflxyoOmk9HbswGQK+8ZKr05FbBPxVbDCZsc+gkDT0paDX6qRGoJKubTR8jeuyHUB01r4A5oxxx0915ig2SlN2IKOUBbri6Twy2z5mTduoChfkEP7utL8M6hfzBqoi/dtneyYiPxmYQJjMKZDN+Ir3UrEHdTe65/DY2Gag0eFqpR1xjsgk5MdBy7Cet2Nuj18BiH4/6CIATiIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:49:09 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:49:09 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
Date: Fri,  6 Feb 2026 13:50:05 +0800
Message-Id: <20260206055007.3995679-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dd4099-55cc-4d4d-35ff-08de65437285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7RWylcdFFpkLjwCL8s0L720ge+kyZ6iyQRwfDrASuReTWayM+0yOwmKKThbb?=
 =?us-ascii?Q?Hi9RHoz6febQ0Uqc/rJDCC92iNsJ2lfabljuVwyrdR4EuwRtGg2u4A0ag99c?=
 =?us-ascii?Q?rmabV5huOFT4To9MlbtrkLAGaHbdcpyg0R1U4TP+dGZW/busmo4t83fL3lnF?=
 =?us-ascii?Q?wyj4m9B9KqYFl3l3OdkdyGkoCYS/9jlHrn6F4alZxlItV34AxHJufR3JdWDd?=
 =?us-ascii?Q?hO2FsbyKni1DgcHFrqxHCx2Eq9z/JtSNqPb2expFf0B9s6mNWCnf/OaCWYVF?=
 =?us-ascii?Q?6YH8mUj4DnXctFAM4ri2wtV9Vhg2Af/4CI/u7KiVY3SXYYW6R/eXT21kXO39?=
 =?us-ascii?Q?9WYmal7Q4/UEQD0VAu0l+oVgKsiK1E8XX/MCfWYaFeELqEvUNjLLtp/jG8hN?=
 =?us-ascii?Q?cggMEh+tDGPbX2g+36vtQrdXmOUSdBFF6/uqlg058FIWg4v8HS3JG3T6hrIK?=
 =?us-ascii?Q?hmeKMtCkd4tPGqtXjh2O1wMis0YGNkMr/kIjC3IlfWoSU9eixRUFcHRKYYhm?=
 =?us-ascii?Q?PBmXvlKtCP23PSrdlrp6B63z8JrUoFKUiffjjcMPZIkUt43ViEDIr0hIaBUr?=
 =?us-ascii?Q?E+iMotTvnF7Md9d4Mfm62mmsDt1jrT55EGHgc3TMlz8x13uM8UpqjNUTks/j?=
 =?us-ascii?Q?KuBJiT3rDOwqy7SaGZsHfdeYdWZrKkhZjPPM7E4XhMT37gtT1czJhmAW+F9j?=
 =?us-ascii?Q?BLyZfiApeyjYb+c44cRMLjRWwpl26G2hXYIoYoFd8WCUw4x6evcTXQ19qffk?=
 =?us-ascii?Q?p32mo/8yUhAODMtBrDQZ5A2k0iBkKh7mueyy3C2PsxIlN4XMgZVI+7r1pn+U?=
 =?us-ascii?Q?4JY9qfWgpqslPbBd2O5WY5X8Nh7xhIqzeaBVO2IbK5wvbbFpzCLFet53XAtd?=
 =?us-ascii?Q?+kwi4RW289QWiDn9JWlEeN7WpfP0b47LPsuoFE67iEzGLNppKgUm13kqyws5?=
 =?us-ascii?Q?4XFdKXOBjgMOJAit1lw532UYx67GjyRRQk5EXvZwq5ljywmrzLmSz9dC2N88?=
 =?us-ascii?Q?qgekyfnyyCmRHnwU4TYjryeanQe7Ar9tDE3kLBybkAl/oOGGKtJtkyGjMY1y?=
 =?us-ascii?Q?I0DV1H2RbMCWJOuE3+jMtKMDbQVPIPW7C3RdirhfeV86pOwSzhu1Vq002Z5B?=
 =?us-ascii?Q?814mUA3MQ8KXJZLZsBPPFUcixeDTrliJ9sSslgOjniE9TCq8D/phKCdjUcQq?=
 =?us-ascii?Q?wuoTOkRSRqsR7czGHS0OPmdIE2V1EwCI9Dh57thFBBlVWLDlLocHIZiPECH4?=
 =?us-ascii?Q?r2Iimn4uJjfOAogOjfXIpwXbVjkvbrH+MUbq6A2sEpykEgdjEAVggx2pXlTE?=
 =?us-ascii?Q?tHdERhXwGLg7Mu28yDHznlC8uFpxbEUixUNQpit2ms9R78IvRMUwj3vMNOTe?=
 =?us-ascii?Q?kSyoP5iSrigWNGuuzLB6gGSLdHUJc3tjHA0pVKpIcL/RIbFDBIfT+NtXELG7?=
 =?us-ascii?Q?MNhg+KVmEdW2kzb829NBVAwV4LUOgRvPSG6LDlW/4/8VQAGw/z7TrrORb8Fo?=
 =?us-ascii?Q?B4HIXyw5sn+NwzCrP2FEZ9uxvBLs1tqBml7YphDtil6xwB1Uxn1Idj3Kk7uj?=
 =?us-ascii?Q?/7SlhmeFvaiL26txPcg22lTPLngIrJpJNnxmHpIejAwHXjshSG2cBuRaKR2e?=
 =?us-ascii?Q?IVw0lHTlX3AOnpie5tYKQHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0RIS70kwJXUG0Ie7RLI5s39pRpCtwmC7y9FJMksRhEo2w4Q38GtKpEUNkgYZ?=
 =?us-ascii?Q?vyxEjrtYNdxwr2kUudmWway5TY1HtawO4ShnFcLQw3eVAjuLoyoT/Sd3cbxA?=
 =?us-ascii?Q?5Ja01+qwpRyXX/AgOWYlUSxyDPn1IyTIj1uliXSUYM5cuoRCVlFhx+ogzO2B?=
 =?us-ascii?Q?tHkd0ADIl6pMTuRCAk/lJrWbj3+oFvSZV4p20PLMH8qlWLAXzQnGDBRk5ePF?=
 =?us-ascii?Q?0I7L4qUJ4BD4rfLbtHLs1eaT+kKm84JB382yOea+65Be9IugUEufU46+HCb+?=
 =?us-ascii?Q?zhwMHooe4NDXF1ywFs5Lin+c315vJxjumCjrjKy76e6ESYhtwqWeEG7BtEfx?=
 =?us-ascii?Q?I/pAufLBMXM690dxMsK3533nYspAVbVx4R3afINQxiOMzSo2/TdcrXANsBXD?=
 =?us-ascii?Q?+4MSELt8gnEcmzHM2UxnqOamKjBhWl+7Ya//T68DmIte930OdHqzxakjcSdX?=
 =?us-ascii?Q?xyqfawGLEWpNToMoHguF/dY7bCFTpN25GR540o4j4IYMl336pFB7xH7o5jVn?=
 =?us-ascii?Q?0YEtheFvYJKDX4Dx+weGo7Oz9XQySMrdTyjZWOCb8tC11MbgXcriOSCXSopW?=
 =?us-ascii?Q?ZiS/VTBzGUQD3A5i3cjGccNaSCUJ7lZ6lrukAFIOqEbqUk8cRMXvZ+aTEZQd?=
 =?us-ascii?Q?JLYxmKJTrXqoBSHOuCz9K1X9dlMntD7c4whUryK71RXfZ3YjFeV+NoZw5Mei?=
 =?us-ascii?Q?3vWCbgEn1fPDlE14CJF5tcmXv/HQTeCINkeEkl1Sj2mkL3etipnoO0fyqxJr?=
 =?us-ascii?Q?vi84VG7ffCw7HkEwHKg2j2JGWUMOyd+eeeOU12SMbUMkk+JGFdyxDuKZn12G?=
 =?us-ascii?Q?NglgdQCLEXTpdo2Ui+GN6OWx6t2+IStFRMkR+whWeRv46ZWEsqcaaCL3nsYA?=
 =?us-ascii?Q?xijnZCJz2gE4Vsa0bEgLDPakZBMSBndrIWPDQeUkDsUWu+3Ba2SME5hwb9SW?=
 =?us-ascii?Q?ZR0JRwy7sbQEw5NVP5wX3xz3Qs7l8WorUtQfIqGOudRUJSkNDa3UfQhwN3tI?=
 =?us-ascii?Q?nwwgfbC0knWs5Xr3c4xhFHqu7G/cjOrMDZm/cALNadxlkYyUj4pEYgQkWnOK?=
 =?us-ascii?Q?I7Z0mUlq0+yA7ELU+mE9wOMGm26nPGinuaNVh2VPquRocHwPeT75TZKtJVWP?=
 =?us-ascii?Q?G1303pvXjbFvUuTLrRLrVI0zfnedenAJk4K0SXqdOahRTnJqzUt704G2S8X2?=
 =?us-ascii?Q?/bkR5z3nHjDJCdhpRmH9hiieQ+YePieX0mtVFNdnKhzTza0qqBqqV6Fmct61?=
 =?us-ascii?Q?tNQQ32Jcjyhftm3Efjx2Yhf18f5oVRJRJcbWvEyfsVtA8Mrd5+rl/Kah8+JT?=
 =?us-ascii?Q?u9vrPrcmnMnkiIPMQJl7gZ3NnRYckRcqzcpdHxl6tZ9uT2Dw+vKeE3fhemhj?=
 =?us-ascii?Q?PyDYwuubEl1YbyWh4YNNJmTXrfKxEvbVzWLEMx15GaDlQp5M7s6Jq4P5uA5/?=
 =?us-ascii?Q?Uun8C824JR8TpVMVTt57Roij+Z9bF/S9mKlhy4KT/UqRJxi7QP0+IATmjflA?=
 =?us-ascii?Q?fsG9K9L8+Y+UJcuzsa9qm+x8LPlYMY6FB+8D/RVofNVKxjCFptbG3Ha+Vw5A?=
 =?us-ascii?Q?BnIieCT+EGkHLAZbC9//6HFlvY5qIljJpT7gUMDtWKqYiuonQBs441IHRbDB?=
 =?us-ascii?Q?DWy/MB9Gg16a8tvQ1Wjc1hYOVz1e0YKg/zmUhAjIeTxx8+C7DyJWZE8kzXjT?=
 =?us-ascii?Q?oHAOTfZemlNwp//A8qHhS5EbMwAuY0gjc82pOXD9bxpG9UokEEtwlBR4/Txc?=
 =?us-ascii?Q?/bHOwoyn7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dd4099-55cc-4d4d-35ff-08de65437285
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:49:09.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOn+AvigjDKt+CgSxydb1XkhjqmT24UXk/Q8X8XddAVV2HfYXHEkOwC2+c9D0yM4mY2hFDtGF3ITN5EHc11tqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803

Add pcie0 and pcie0-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6eb..d2fe6e0aebaf8 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -38,6 +38,13 @@ clk_ext1: clock-ext1 {
 		clock-output-names = "clk_ext1";
 	};
 
+	clk_sys100m: clock-sys100m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "clk_sys100m";
+	};
+
 	sai1_mclk: clock-sai1-mclk1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -1366,5 +1373,87 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			clocks = <&clk_sys100m>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+		};
+
+		pcie0: pcie@4c300000 {
+			compatible = "fsl,imx95-pcie";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x60100000 0 0xfe00000>,
+			      <0 0x4c360000 0 0x10000>,
+			      <0 0x4c340000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
+				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			msi-map = <0x0 &its 0x10 0x1>,
+				  <0x100 &its 0x11 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "pme", "intr";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie0_ep: pcie-ep@4c300000 {
+			compatible = "fsl,imx95-pcie-ep";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x4c360000 0 0x1000>,
+			      <0 0x4c320000 0 0x1000>,
+			      <0 0x4c340000 0 0x4000>,
+			      <0 0x4c370000 0 0x10000>,
+			      <0x9 0 1 0>;
+			reg-names = "dbi","atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x10 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.37.1

