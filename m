Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23782185BB
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734589793; cv=fail; b=o1X2w/X3D7GaFZ2tBQJOCto6C2ndpLjIMzmsIvG21UttDGQwI5K3c8gnW/DcwI7xBrPvk9nXKnBXq0XIUIIPRWcFLQWlagLBUrWB/aIm9nXdp9As8NzndWxFwGw/F7u/fkh+zzBkhZ3jUpOxgJYXaKBRNOvBPMAKjc8ylObUaj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734589793; c=relaxed/simple;
	bh=S3mxJk7cUd78KxtFy8wwDF9eXP3MVre2TZlhCZ/uRyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0UvSCoBNeAH4+tWdbg5A/Ic4qHbRTGoSzdXPfe3dC72DRWyhlikd0QOQNWL0VfFV0izTJ0sByjZFCADPlNh7rO+10IYDBNrJWRSldMx2KZEkUB5J95iDCba4g3+LOuceGNRIXoWfx51XT4+edhHhJ0y1YOY+mjTAvJVog/g4M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ScSR0+d/; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ScSR0+d/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6WajQbndf9afZZOO5MygnfiNoEhKL+x3fK/7WQbwhrWtoH/ky9yVwiFDUI2FhLO4GhnszngZAM8UV6fh0iXrXgZkkfk3IkNNl1Etb0tkx9I9wSTZUxYW5ltBTdi6l6cVgX9YstnSOal3KofZHkMWJ9HGt8giZutDeIm2gdkNq3u+igNM+ZXh/xlwxq9SuxbaaOl45oMfzyCsAk9Z84tx9yXAf8U0KdhWzfFgrQas8n6lnSSjqtsODvdkJyJWRtOgB3S9GzuPCrCuIiufUC1ILwMFFPVVwQrIAlli9Ku/sB3KI9slkSHvPTR3hYY1OXSOnOPDLHJnjWJPoeqxmw/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgHvylmQzIm+01IEHntVj1LxS+bkF+vbHZVZnlGDztg=;
 b=CDkHc31iOAt07r7UehwhWnLzvMj5uImbx4WVJZyk6pg4TssSQKqtqOFa2WhY8vsUibbeGrXYi7BSaYH3EaKYx/i/gLomiI9nr6Vn8lhHugXDxi5NXBhX+yYP4Vjhsa44A+tnndgFUdgiKELsKdEgOPu5e5EsKutUQnKlUlrnzAAMuLkIHkz+W/dIQd39OD7iTABAabgO7SskItjDruW4fa9TQJwXELkhymchQuJXj20DKxo/70zPoVRKubxkBNqUWFrJnIA9QeQXkqAmvmxluoE1RuTH5vPhE7QqlU+EWe+K8t7LWuH9ejQcE5cu/R+rsnQSa0Whtxybc6UFEBdrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgHvylmQzIm+01IEHntVj1LxS+bkF+vbHZVZnlGDztg=;
 b=ScSR0+d/GwwWQjwWDo12EiM8qDdI2amPuf7TohaCXFpyyajDsomE1o7mM4rGboExMpIKxm7wC90Wa2OgeHPbCQGI0jmHUe2/Ap3TfF8ie/n4Trl8E86ELmO16ueIZDeJhjWunHEVs0kTRLNOTwdJjM5VfReCUXXJibg5JKlGKbPyF03qHL5y4bDG01s/szfEZVoq2pEFwildbfH7HCIWFXvF6M5mh98d8cG8xYxgZI21vPonhDv/AWQaNxFfh5UY6Sz25GrOPZaQJfqt38hJ6azpbpBehKU2vz06kKNBIuuZDuglWU64e5Q9tRNZ/D/AIh8xcXgNTHY3b1YhVqeQjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 06:29:48 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 06:29:48 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: imx95: add NETC related nodes
Date: Thu, 19 Dec 2024 14:13:39 +0800
Message-Id: <20241219061340.1633173-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219061340.1633173-1-wei.fang@nxp.com>
References: <20241219061340.1633173-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: c4127de1-989e-437d-3c4a-08dd1ff68978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbL2LjOKp88WLLyimv9DapAFYSSwZhd7p3jzoAcOexrlBwrDCuOdMS/Qr0ny?=
 =?us-ascii?Q?HdIdXpTxic5Lg2a6snLQi3eHY0bKg2tapOKFoxsRtx14RW9a1TJdR1uE7cqn?=
 =?us-ascii?Q?LOiCLaakf31E82Sbm7rwK1lrfyz6XDc86618oGYLv0fN+sf5DTJzmcOY/Lr6?=
 =?us-ascii?Q?ftBWx+mdmrbfLI6EyCxLwL1cN7kbhhcmj9++ehTXHxluTZXAA9qNUBwvX609?=
 =?us-ascii?Q?JNVM8zWISwMCnqnDFYZ+L+qHeXi8/7EOY/8xzit5mIEaPXLSxgRTSybW35k9?=
 =?us-ascii?Q?tKP3c2TKSyxiIi7A36/sjK2yIY2X08udXuT96kjgQGBSAOMdTjL7HhwCq8nz?=
 =?us-ascii?Q?lP/DC8GQ/TBYpo+H3vT5waBBWq+gQH+Uy/wAnbXC9MHzBBe1sDGXVdKtbUBx?=
 =?us-ascii?Q?iuM6HjYl85KhmUdNmhGisra1UO3TUmcRcKBG3pSmVavxkO5VHtNQ8sAh15KZ?=
 =?us-ascii?Q?pE3x7jeCZxMewvuv4ZMrACgHPrcp8YgWaVZtQDSPrHvpC2reIcVv0t9tTfIt?=
 =?us-ascii?Q?D8hPGhLOAVsBLbARuws5Up54qRzjiLmg0EQqVpJh8oZCzPfT2xTwRBGbnunS?=
 =?us-ascii?Q?yXDuTSvjxzxkSm4Rz92ChGNC4i8JBRiPeOSKY6t39xonbG2dSQUPqNundrtj?=
 =?us-ascii?Q?c5N0u95JPfk717tEFnETDvUXJoYmMu4hPwL9EQXa+pSFzj0hr+34dyBxYsUi?=
 =?us-ascii?Q?IaH3Re9BEwQLWVBwTc3+AdEMp1MemznwqZyOaFiffW26JBtgG2hS3vzd5P+z?=
 =?us-ascii?Q?wD/g7femVXEFR9+1g+H8Og/gspkdSpiatPVNgjY8onUPaXi+7BZH28AWTTcC?=
 =?us-ascii?Q?h/0B4ucbl7LuN3HqA8MJBRDnsf4r8pXQkCGqLWk/InrVwhr8WIJVBczezkLR?=
 =?us-ascii?Q?6mD9zbSCfkD4DjC6/BMaONIJmGjizbpdvZgQgMwepH8qT+nin5HwTbNdGtq4?=
 =?us-ascii?Q?HZBufiGqRtDyPTNqv4PzI+X+Fnv8iZZGcSm7tU4XXGxmSmFlXEPdKIJ1pagg?=
 =?us-ascii?Q?yZKW4uzsw/St93HD0i0x9XiQdsy9IYxjWo2r7hpZXgz9jk+z23+51G6iqA6u?=
 =?us-ascii?Q?ntLlC/+U2fTcBSZHd0btclIP7FKHJ82fg6ayyCpECkj5pM82SWKxpLHpye+O?=
 =?us-ascii?Q?sbeheZQy1eKJ+VtiD5zXxT8f61A+De8/edHTTFg63W0ehS8E1J7BT0aNYBXl?=
 =?us-ascii?Q?6glvJLb5FzkIensDgM8F68ejzcXXbWppHvqcKYpry1zXL8MZX6yrgc5fafhE?=
 =?us-ascii?Q?mF7Kg1rNmokgsf4Embn9x2DYzWevC4lm8RbGRWkiDAR3tiygzRN5Clmxwv7U?=
 =?us-ascii?Q?rnY8X4EuFsG6wWA86UUhmcwFqxHrOBg64ZQ5pHHl+YQ5c6RtttTwzB1b/vlj?=
 =?us-ascii?Q?jkacIFffpScWjdwAOUueU46OZ1lPOE1fB1PdPY3VQ1AQGYfdTkEve+y6Iguu?=
 =?us-ascii?Q?PzUAxdLn0pkhPepiDksjARqmiHpWwGO/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+9cQrM385yXDVE6r8BX6K6OwdfeRhbi4EmTFHPsgEEx1+AVfEgH44NpXvTM?=
 =?us-ascii?Q?qVKKiVxekqJo7yO3m8Sis69iHfJm7AnvYfh/6KMNkSVRoW46fyV5y/4sQaRd?=
 =?us-ascii?Q?e1xWVKqIwhqLkcY4nOlX3YTB6Wb5mqHHG/6Wd3JknoSYvb1g1da8DXHeUteE?=
 =?us-ascii?Q?pG/AAwLMRAnRQHRLQ3x2adrM/BLwfDFogl2ZjM/p9onsRC7LQG2jGa714uI3?=
 =?us-ascii?Q?kxw7RDDMKNa6x4EEiSEEzVKyJwGS2W/eyGmFN1p+Ag3D0reEVKdcE89k95Qy?=
 =?us-ascii?Q?EXKr2B8rjSGX5ro2u8Na2nIvl7oB7/31zR/pVf8WesnMGfwKuNLPKyCUwFOY?=
 =?us-ascii?Q?ShCF60ziFmNse5L5gqu4vR01A/DgLbg62ipXZagJ5pkBf4xtMmZaDBybuk00?=
 =?us-ascii?Q?95AKT718NDTPWUGWyF+hIxbvJ9Uq6AhZx0zzBNxy4af29oKeDQX+hUj/KbqW?=
 =?us-ascii?Q?6UksLZxb616w6A5+Uv4xEPN94+0MIZp+UIKrmdJmJCsNT/L7E1HA9Sq38+xW?=
 =?us-ascii?Q?xjaZWnQTFqHbHhSYx5ZRAByWMWHSryMCNH9LLoAjexFeHf5+NitRrvBhIuT2?=
 =?us-ascii?Q?6zgovubiDlfPwkKMHRFD2HRo+SGjoLlkIMjQl4R9GjqRX/IaRESiBm/y5pcb?=
 =?us-ascii?Q?1paKGYTj0A8w1/0pjfFL4g9eU9Xht+SNuhJ2XKbw9SVzVl4zefasjecgYM94?=
 =?us-ascii?Q?6ljM3r8KArU4QPTdLLiEDpVmPqp1ZhOZc8ZT2PrKOFJbV2OHqLouKEiLZ1fh?=
 =?us-ascii?Q?74bbKMguEUwcy3W4+q7u1KMKHS5c0/lkgJNftpM9FFMaQHZeSNbQN+/AESk4?=
 =?us-ascii?Q?3fGNhW3uBiCKPsDvE/PSFSNhePdGg88coUSOwvSvD9WIsp9kIVlACGaY18BV?=
 =?us-ascii?Q?liYlrJ7vJxJH4FytZQ2Gykxo3FIj0TaOx5YL2dAH1A7/YysD8Z6iST0yusfu?=
 =?us-ascii?Q?RTGnA16c83Lj6kwuRLuMEXTP7EpgLWD/ooURINmvv01Sgd6GXyAG3oA6LObl?=
 =?us-ascii?Q?anoXRMz5YO6GuNJlqpwx3xWS3sV9SpT7QKHISHkiatYF/p55Xyc5nYfCbZCC?=
 =?us-ascii?Q?VcRQ6yn7EK0pAgUgSY4WMyPfdLGw1+jhXpDOxzzCcSvKwgKK86QKKrhk4+92?=
 =?us-ascii?Q?dQUqDXmCKPRgUMydvQFS9c7eGcwsRSiahU2Qu1YNrLc3i8wIZPB5gtCRS3wG?=
 =?us-ascii?Q?354i6JOX5hdNWD3j+JfZ5KO/17PigYfrWssiXRvumgMWc3Ghy6SfZ0HEOx6r?=
 =?us-ascii?Q?IkZgmbSz6RXjt+70/ECOHibRP0TgHJUAF97KkHZjxbDwb2AhVQ9Wb3UH8WhQ?=
 =?us-ascii?Q?06ul0jLNBE6MF6w9c8aB1S/TbR+CcFUyRVmzfWWQSzGN8WvUi/+NFJxbpbNo?=
 =?us-ascii?Q?2LRUxPHeYBoABElk17ixihLvKA456R6bsgjrw+GpoD3QlzOia8SpWgODAOmG?=
 =?us-ascii?Q?2mRGJFafAfR1XBNYvX2MqdAZMk7sdNs5+Dt0zLbGq+f9cfez//Qyq4xJI3A9?=
 =?us-ascii?Q?bOlnOJMXKiWvJDMFd7o1wHwvjLJf5m7Y/7z/9LPm/FBYzlVKxlPpvQch3jXe?=
 =?us-ascii?Q?+VbgqXTo/sSDWZIrI/E/NbJxlmUcnV2cuZXOl2ow?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4127de1-989e-437d-3c4a-08dd1ff68978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 06:29:48.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7HWApNzBzKdIoUYtO/sjyfIh1a8nu7mIlqxp0e2MKVxRJhReIW/t+9TU5DAkjbnl2X0lUFfzTyv+RV6gg5Xcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966

Add NETC related nodes for i.MX95.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 94 ++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index e9c7a8265d71..8b0eb1d835e8 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1697,10 +1697,104 @@ sai2: sai@4c880000 {
 			status = "disabled";
 		};
 
+		netc_blk_ctrl: system-controller@4cde0000 {
+			compatible = "nxp,imx95-netc-blk-ctrl";
+			reg = <0x0 0x4cde0000 0x0 0x10000>,
+			      <0x0 0x4cdf0000 0x0 0x10000>,
+			      <0x0 0x4c81000c 0x0 0x18>;
+			reg-names = "ierb", "prb", "netcmix";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_NETC>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_ENET>,
+					  <&scmi_clk IMX95_CLK_ENETREF>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
+			assigned-clock-rates = <666666666>, <250000000>;
+			clocks = <&scmi_clk IMX95_CLK_ENET>;
+			clock-names = "ipg";
+			status = "disabled";
+
+			netc_bus0: pcie@4ca00000 {
+				compatible = "pci-host-ecam-generic";
+				reg = <0x0 0x4ca00000 0x0 0x100000>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				bus-range = <0x0 0x0>;
+				msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
+					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
+					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
+					  <0x40 &its 0x63 0x1>, //ENETC1 PF
+					  <0x80 &its 0x64 0x1>, //ENETC2 PF
+					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
+					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
+					  <0xc0 &its 0x67 0x1>; //NETC Timer
+					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
+				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
+					 /* Timer BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
+					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
+					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
+					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
+
+				enetc_port0: ethernet@0,0 {
+					compatible = "pci1131,e101";
+					reg = <0x000000 0 0 0 0>;
+					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
+					clock-names = "ref";
+					status = "disabled";
+				};
+
+				enetc_port1: ethernet@8,0 {
+					compatible = "pci1131,e101";
+					reg = <0x004000 0 0 0 0>;
+					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
+					clock-names = "ref";
+					status = "disabled";
+				};
+
+				enetc_port2: ethernet@10,0 {
+					compatible = "pci1131,e101";
+					reg = <0x008000 0 0 0 0>;
+					status = "disabled";
+				};
+
+				netc_timer: ethernet@18,0 {
+					reg = <0x00c000 0 0 0 0>;
+					status = "disabled";
+				};
+			};
+
+			netc_bus1: pcie@4cb00000 {
+				compatible = "pci-host-ecam-generic";
+				reg = <0x0 0x4cb00000 0x0 0x100000>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				bus-range = <0x1 0x1>;
+					 /* EMDIO BAR0 - non-prefetchable memory */
+				ranges = <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
+					 /* EMDIO BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
+
+				netc_emdio: mdio@0,0 {
+					compatible = "pci1131,ee00";
+					reg = <0x010000 0 0 0 0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+				};
+			};
+		};
+
 		ddr-pmu@4e090dc0 {
 			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
 	};
 };
-- 
2.34.1

