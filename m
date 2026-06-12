Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A93F0A9B
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270490; cv=fail; b=X/uFlw2stX/Pv3SQqA1MY74x87IBCw+GKETXyZJOfFRR5/EXUEDYNVd0qZjguQ5GKPLYyKTo+w2EvbMAnwcY9EQpW8Nwyl/SYC4JjTMlMRRFgSu0IDIJseFPRuWA6GZqy+ZWbetzHbBFr5kuSWSUx1zF3NNt1lRjNgJwC3BUeXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270490; c=relaxed/simple;
	bh=0hK/hXS7WJ8wecx79eFip1XZgfkn9OiPZE/gzJje95w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dWm1cINEB81wsYWpY3f/FZ6pUYLHpWAFIKIPhmpHNqfnopIKw+oLwHFYnsvj774tob/ckxnWfZeLvMWeDUnGg8Gke4TPupTW0LTNINf2Ma1OYnzrsjd9awQCU661bLYlUC+0mSD5/UFBCKo7/1zgj5FXVNV4F0mMIEVAPSrC6bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dat2nXjF; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dat2nXjF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL1HQRGBIiw2JX571OwNdadTPjRzm2fEoOxETjzSnHfIHBnkmkt89mLXDNe/PRAi+tbTzCz8uW3Gy+FWVqNZYTpGUklU2g8zzI0+zDK2DETkPfxu1jldWKbaWsI2zHTMYu1Rfc2ghieEg/kEDWwAjZJf+V5zVZj3Dcr20HJ3sJ7Xue2hro91K4VAWzKgH1vLPk1CwyU+QGuJReeWFqvqrNifsil1MDhX2YRDFukla+V2Pu3gZylD3g5GBQuTnR6+NMulGoUD1YFZEPvswYvYCapBTym0oNtNszYydK/nif7J+ujM9C0bhj0FAe003Na2lo19uRCO/dI5AdoTGpjWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJzQOBCcjH3xzbHxEtV2bLiFQoRMPVPrifUMWfuI5eQ=;
 b=Pa0EQVrHR4J5LJK4zpJhIwjlrKuP41jMjJDhV7tIe0HnltSLL4BpceWkiVo91qLaN8m8Kc0fwSb1PictwTcaOC6F+O2rbuMR99zti/8g+emd+394XRJ7Y0OXz96LXCit0MEEtsGAgsfrfIG2KbqJZmQOY6e560SXqwGTHdTn2tKlAagDzqCCnOFQNjcxwEt2y1oKUOe5XmOAVHHL52sqcaROl3AAgRvIEkzI/6XZQ6mJ/NOL42WZ9u+fN6dqTceSwgh7LToyWH6AXvE3T/wUqF4zN7AM4T+nyO8reZCHB8Fi9iWh66Vu1XpsiDNfxXekVvv7DqmkGWpKksrUKDFWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJzQOBCcjH3xzbHxEtV2bLiFQoRMPVPrifUMWfuI5eQ=;
 b=Dat2nXjF8fmOwiwf/8pdKccmld9dPG9W4DLjSzVm8//ftt8H+8iJHTKqrBfHkzIm7fpWNUHM5ewJaIX1nTmH9bXpJIoXvQd2DWHITvkEKqAzcX6HvMdZb7gf/QGlGhf2ec9top0DvMQ0HAY0Kh9B+n+Nvz+6qz2aMeIFeC1ft4CeHbgcX8oy0IhXVep+y10QlfSNMDeOh3RisDTYJAz7cQHaTtXugyIQC/hx/Fv5MAHcNjphFlAOBfaMlljMcMwlZjIGP0gpvkerVdIQma5EtkSfolErMVzo17ozNDHN66b6tkutpPal5aSu/Hu4L9FPOmrE72Dk3QQb90YoTaBNlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:21:02 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:21:02 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 8/8] arm64: dts: freescale: imx95: Add NXP neoisp device tree node
Date: Fri, 12 Jun 2026 15:20:39 +0200
Message-ID: <20260612132039.2089051-9-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::18) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d09e39b-fcf4-44d8-2364-08dec8857307
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 vs9cvFfBCw9XQu721lkQU8poOEgfQENiJr75gMctZsLCh2PqJ4hsUzL3zi++z9NVoHeEe9kIcfjU4cwFP9JwcQ4rD28nIvJWB2X/6rwo388K4JqynblUMmNK2e/pDSrt6iVkWTP16nOEHmFXdpAMBWV3PIsB9L5a2Wh0S9MlDmcPZlY/7awhv7HvpNfdHggc7lJriiGTdWQ2SHn+X5WMnnoE3KrR7RN6DpyXxFrvwGo00U43rYPgTwogcSPb74MAPmu1jEQBif/1LdJEstQCz+lzR9z/PxOPdmJdxzzO/swgS92/fNd+vj8F/stH4pwvc2P4n0nYzbn9qR2NgDZm9801nXTS5yyCaFTKAap5v0/1MpPsaxEWxs+MrzhlWFYuZ6BM/szoukzrGnyj6H15Jh3NYtD38gfPQOhrcxAkQ7up4w183wUgOihLfS0sXt4rVTq4yMa3ASoIsGkdHa3bVN6BmVzHJ6pvDG5V+8R+0T8eLQBvXU27vzj3h4niH/zWazOQy/xANlNq4ICEuK5Il53tEzGhQeVCM2bI9QLa6cWEzdKjkeiTLTwRE4nGFWKwAcJhuSrbdFogOp+yWOy66GFBLgP0o3NRawVOCylQBHZwMdehdkMWUjESyVaF01OuvxiINVmYipkCBaV32rK7f9xHVqXRL1oMH7vC8yvdkhrbuLMPdrzT2rl1+edt6ROYJWPBlIajw6DyhW7n0dWHGMb66ZLlRTf4REbOuyuSDOA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VmONU8USgNRIh60KtpAjGjpzfiSfTSlf/qnZAu9cdrcxG1L9mXYEvwD3iyaZ?=
 =?us-ascii?Q?rEeFWIyfI+QyTiYkNMyAw5BE8qpH05oFtDfHJzScmfp4llj/l0+FIquzQErh?=
 =?us-ascii?Q?dzNL2517E8o8t3xeLJj8Iv4yK638uy3tzGZzda/J6/YiquSqI3su66oPj56y?=
 =?us-ascii?Q?UuMPSaXiJhUX/78YYjXHVV0Zok1OjD/Dwd03ki/JrHF+0wZQTZNTzhhVH4D/?=
 =?us-ascii?Q?xvsUkXYKx+z2WLOOG8bvXwUmrJmS0NS2Nf2KhyEYAogoWTMoASbLe1SWhiiQ?=
 =?us-ascii?Q?DXLVJzOsOijhtAfXuIrALjr+aBQT/fwtiauhlBWqr/kqxLlh9I3N55NwL7e4?=
 =?us-ascii?Q?c/DB5vkvTkgxsH7fnsFYtBg/9C6Ca5PxdDQIYo+Bk/3DkVJe4bK7AECy13za?=
 =?us-ascii?Q?D2IGUttHHQsWvVvTVDSEuNVHUA+n3GG3Spuiuu5EqT5/dvh+yREPDTXxJ52Q?=
 =?us-ascii?Q?jKV18iLqp553YnP8Iy1FiwVJc645pY/4nG65l32ITjSsM15CB7zXXwx2jDcy?=
 =?us-ascii?Q?jz+gqQuDVsQIGno2HJOnIiCR5aZfsZPsOL1BaaScHvfGTw5lpmxKQIAcXKsk?=
 =?us-ascii?Q?758RLXB2as/b/4Ch1jA0Aj71aj3SvIm25BI9mjsKTmfClm3fHFOINDN6AuwS?=
 =?us-ascii?Q?qnaMH1qoY6BME+1jh3Ej9OP2+czUcr+mgGjPtOmwd8AUWBfDFz0MSx0WtZgn?=
 =?us-ascii?Q?7sDXovTmy8BVMkbQQaX05JCffxEAadMQIncM3H0KtCx59PRpRbv3V4bAwqy7?=
 =?us-ascii?Q?S0U9MeVQpaj9wgxHH5+Y2JU8poS1r15yj2gghWZ0B1TaOcFSYb2H7WG2Rkwb?=
 =?us-ascii?Q?dRhCvUeGM4BCInPV7xzfioylCDwnvx4e7V+kK1EJG/XD5nkuKCl9QxLOfr/m?=
 =?us-ascii?Q?THWg+b8rDRhXTdG4t35It9QnYuEBgER0C/jxEd79NlZENm1HWgxWgkYubl9b?=
 =?us-ascii?Q?MIl4PhOxfDolL36ndqzy4J2SS2OYpf30EOPsLA7WEtb0rv0zbeobHmvgIbm8?=
 =?us-ascii?Q?hw8ku7X0hnLegLfh+LbMo18xc4clK+QxgnrwF6aueMlkiI2++3aultrWfpw1?=
 =?us-ascii?Q?qkD2n+wBCyT8twsyV9g87VGb1/xRSAh5qmfPA/waBGfvRKg8IVsqCSFIhv3d?=
 =?us-ascii?Q?SqPQkAsdEL7BpYeCJhs59jlSBQ2aXaydjeUBjo8MYRcXZWs6kYK1mUzlLei7?=
 =?us-ascii?Q?BOfyrurwXNsRZMkqeEA4KIdcTgtAeN4BiV/NzHCZxnhjlUnEGHfHVVbPeJJd?=
 =?us-ascii?Q?jgOeVZ2R6Wk8tXSDlHm2FhtsconuOgeoIYJePUpIsn35KTp7zdNGUZv6K+V7?=
 =?us-ascii?Q?M32ahV9uqvuGl3MccV9NLG8AvGE6oIRkltb1/Y+DUHd2A6gpSlRtY9KBAS/q?=
 =?us-ascii?Q?Osv7CKtLJ1/oKfBT9tnVfXlgzZFvcLjMJaiErlBvp6gvoVtmelfVPLHqsvrn?=
 =?us-ascii?Q?8+kP2lqlg2wZDs/yiQbPHsOKI8+chJTEqPU/kT+xZ/kxm2ZdyLLn1EQQNdt4?=
 =?us-ascii?Q?HIh+i1Y0sARRH7odpBJQhRDl0fZSW4voQ64dnSRm2y6M5zzVRqrI5EBY37Yt?=
 =?us-ascii?Q?r9DwyhAUcyEZOvuVHztV9MNUPejr7VEeMo47T6PWnPTqNPQOyMOBFES+3owe?=
 =?us-ascii?Q?pNdggJlGT5/w7Ze0X4tPIDSQfuIl085oRJD2UmgeW4EHNQZO5yvbGvrwu1bp?=
 =?us-ascii?Q?gJ9svyMWhab2PAEDopIiqQeJKP+yn60SDD0CSkWe1rW07tXiHyKEwQVPSFv2?=
 =?us-ascii?Q?+4L+ggzR5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d09e39b-fcf4-44d8-2364-08dec8857307
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:21:02.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PU6qjN8jxTw8Iwhw63/GPVr5xVsE3HssqGaxg0tqmh3gq01pAYVJeBux4GM343hIRmjaid+1oeUwy9qlx886A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203

Add neoisp device tree node to imx95.dtsi and enable it by default in
19x19 evk board.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2e463bc7c601..306593585c74 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -511,6 +511,10 @@ &mu7 {
 	status = "okay";
 };
 
+&neoisp0 {
+	status = "okay";
+};
+
 &netcmix_blk_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d6c549c16047..5543a6cb1250 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1867,6 +1867,17 @@ pmu@49252000 {
 			};
 		};
 
+		neoisp0: isp@4ae00000 {
+			compatible = "nxp,imx95-neoisp";
+			reg = <0x0 0x4ae00000 0x0 0x8000>,
+			      <0x0 0x4afe0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
+			clock-names = "camcm0";
+			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+			status = "disabled";
+		};
+
 		usb3: usb@4c010010 {
 			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
 			reg = <0x0 0x4c010010 0x0 0x04>,
-- 
2.53.0

