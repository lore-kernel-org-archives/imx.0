Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705661;
	b=aGIsDHWr9iXXdAGsNOvyyRYhYuxl3/vH3eL4o/EzmM/DKTgoMhyMcKHIwy6kx7qC/4pv
	 HdFQuM1zqCmd6pfmHrW9fsoeDTxpGNki2rpBXST1eIeobwf3df47SlPzfhMbd699H7oDj
	 go9gXunf9e8+3lxQu50mZsJ9JbOWHbdpsfL5P5JBb9QAPBZqbl6/UmU1Qsa/llfI+X8kD
	 /baFURR72hAe4A/yXcMWTetlLkGQ2tWdvc1uocqaX2G3YLdr9XhxGdeqzrNKpEqDS1tQT
	 J0FTijwGS8l0+zVRiSYJNhv6+Hw7MS78zb6vEIF3n36zOCiQMgWNfFGnOe3evjAzW/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705661;
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
	bh=Rc482dpfpoaZP6c2uzkKpm9RS7l04m5ebyvYpc0NWBA=;
	b=Ku9L4YY09tI121fkrzftu/XkrISDJ8Y7diZsiIPhMZT2HRbt4YtOhsJ8qoighLUWg2Y3
	 J8FVN+5HTU+xEVL6UaGMzjHLd40k+o+lIZTHb7XtmhyQlFTTNuKxMqsVSClHAymS/1Zk9
	 KFKX8ldobGXgHlFB7GtKR8b2P+V/NloiTBoGszPv5G/wqulgeLL8VIbiuJHoAN8IhbXLU
	 CHen1KtdCdMR9Q194eZQkDX2T/AR3h0Oi9Gr+MKMOYLPWtFnag/W1lHVnMA+IaKmQwUQx
	 iZFnXScnY+BR4rIs1ayP17uGCRHDypdDyisp9FH60AI8V+XAvChwPpup6eUrpEk2wkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="TqPJNKD/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C98606A327
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C98606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TqPJNKD/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNupI1wezbLXD8RLQQkrshUv11TOcFoxWx/WzoiFgtdGBptmDrIFlWvERW+5BT4GLoJN/Bt+/dgUw3v8guwQEKePcuNo32WfqCRpwgjJhcyKmf9u7zpyWBTxTO7FfweoJGxSbHFcJsy5k5tIj3PgWzlNa3a2sj4a2/NOFMXxCaS+TFj7c+sdd7aZfNalHI/R18qLjOC3Tbs/ehnsodIHhv0crNYcmU8+doInqq74I+QwcIAA68/YRS822izoMdDZ6oJtcEqNl74UYX0bVEJOnkDcplvkc+dI/qyUj9xxi8j/dyF0/MNjFFloSYIM0q/xRz8x8GaKzTqIn8dNc9itkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc482dpfpoaZP6c2uzkKpm9RS7l04m5ebyvYpc0NWBA=;
 b=A0tMVTg/4a+Qm0pbk4ARYz6KRHbv6F/GxWPk4LFoAyps+oBUe3ifuHeu7VbBJaXgfHTMyL3VJYida4uou8l+M+2ezvIvQRn8XcUXX3b7u84j+QQcK2cYwrw+NTKz7bvtaNwFDLUTcAvcKOFgGsyzbjfGjUFbuh7PJNAnIjmE34sVdq2JYp8d8u6wTn1h2N4LBNTZ9XeZs2Q2I0q0ktsMq+CodfkMOdLBnqiNok4iqqgZXfAD2dFsYniAHlS5E1bTBVrxOkHgo+V1xIElhuQ2+sHJzvFHrNT/G0a9ju8mRa2O9vCgAHOtJaCCp/2dZkH162V56LxPY46jaiXIEwCzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc482dpfpoaZP6c2uzkKpm9RS7l04m5ebyvYpc0NWBA=;
 b=TqPJNKD/ts3vsOzzm8OzsH6tdrIQl8xpeioDhGM2vAfeyhHCEdPkpk3gtG4GUI2zZU4hXr5/M6MeWNaaVMbfCWHBEQWdYUPqpGGQEnRLQtIM6C2r/rnOY27RD2tCkxQMBxoRymt60nrb5DnlG0bTPhiOf2fCITwy2Fro4CBf/W3E158siFCSwSnO1PN1uIdSTPZ+4Nnb3WVGSBs4qWBo7AXdoeITffCweyAPKmBbWwAanmjwG/IgPJBw7todqnu5VdEQDCQblIpEn/RIgkXdDq2ikDdbs4FiYBmBvuvHclXkCEihBUsg3hUyrj3wb0/nQjqn3uA36rSs9fXQFPC30g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB9851.eurprd04.prod.outlook.com
 (2603:10a6:150:118::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:07:32 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:31 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 3/5] arm64: dts: ls208xa: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:30 +0200
Message-Id: <20261126150632.1560355-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: 979d5045-c13e-48d8-b1c3-08df4bcefeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/Ugcr9dQ//BBwQLdj+yYVWNzTQ0Pr9rjlqt1FDP/UH8K1/t6DPajvYQrBrDwubZ+qMNsuxaYwtdx18cbUq+cGqNGPXw+9CfgqT5zEEbnY60aBfblhgLuf4BuG8N6G6Ogcv/zpBlTsDkmnC2YE5cZvfUDQQM5i2vrfmxubLeJ/rgbj+He9gkddGtKhLyQE5jxJI2ZXQ21N0ey/nBessIKK3vJvqGDQJ3kvtJTGlBXxh2iHLjWyM/KwUBY8AZ6y9xMa7S9s9o+gEmkoayF2WS3Gsuqwkv0rydVJXCyFCDG1aiyK4BvMqz/R0au0MX7mVvB4pwt0WhCa2yOwqoicdar5tzhRh3TEK+/UarShAdip/5YaAPZzgMvxOikR+ILLYOGPknsfUtYZxxXgVGLTBZWMUwx9lYEBRkwtZ5+bDqtNwPMkKjmFwWp4wxOm8n2hFNgv6hfdIy0ek2LBbRaB5XqDJkhHOwidW+YtDONy2we3ERqhU0J6FUWX+7d7O5RTcB1RGNLqCakV5S43kB1OVhGBV/ydiCiiE/NPdDTkWQ41r/kDSOwVe5Yl6U7eQtfZ79ppV2ehnlgfXDTn+KG6mmX5olqE3JSntTgNXJyIDL1Q8nMB9Tk1DkIVd0bq0Z41eOrbhHqBmusTP143dqLfPlfpzCBAbHOfqx3RsMlGJ4cpu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W67VHC//H0So4dJpk9kS0vmLQkIbxSRBTZeKDGUh2yKGUEL9S5J5v1DV1vq7?=
 =?us-ascii?Q?kbWmMoKi+eWa2NZuOxbd4gPeg9KqrU2yn8HEM/zQfAD8spDAuY+0bJy4gtcA?=
 =?us-ascii?Q?WoyqVdQke+RvAewxI0nikPy6kBj1vfhI1A7AG3XI/fTtcQ2iMSCazUrkP4lf?=
 =?us-ascii?Q?H70ZLPbXPyMg1eKePBVBj7IjqASgE6kRCF7LMqUHVKNKj9qEVCLT3Iuq+8MC?=
 =?us-ascii?Q?5imaabp35+D4M1P1+wJk+kZUPdIJETnNPEK9+wUSvKcMpz12e09m56UspXCF?=
 =?us-ascii?Q?LT3SeI8voUAY/flBhSA/ECsEoWvT83B7K0Aldzq2DLqBHIXNpTjtQVH1Z3pm?=
 =?us-ascii?Q?/x4ridHs67Ai+DLAPsqjlAITQ3+NeMk0/7XpsPDH7dRQRXKDaQiUA4T+ytWR?=
 =?us-ascii?Q?kQe5xwlg+wRN1Eb+fgsDJkh8pUq9jwn+5ajNLEA3iI7G41EhDEbiURee9rJS?=
 =?us-ascii?Q?Px0EDX+aua1woahow+dncQjXpl/g1AHqwPH6rFtZeS/WjRQmlTP48lx4wz9r?=
 =?us-ascii?Q?kP3xnCF2r3WrU4dcTCc78DYHKKVY1XWyQXCzFh0kMbhWaxalcFAlsRYQqgiT?=
 =?us-ascii?Q?pHolraY20sdFpd9tFVlbYe4i5v+NV6ikGI1RUSw3cBHz7QDkPl+4Pa60kKzN?=
 =?us-ascii?Q?PK7MoCTAN9y8L8ogg4OChzupwpFsewJNy5cYA7GIoUEq+Gr94+uKS1ZC8z3l?=
 =?us-ascii?Q?8tRFthkwbs4TppS64KvW+VFUwShePRded+of8NjClvHJdGnQRN7Ips02vzRw?=
 =?us-ascii?Q?4KK25jt3z81r4iqkZMpkW8a8KmifKpOdis/AnVWA1hnbrTy9tg6Gb+ThnNtq?=
 =?us-ascii?Q?9oo3YuR7n1n9WGxr7z/gsgX74vz4EgVLF3rwC9XtAo/UtJ3u+e4QgGP4wyjM?=
 =?us-ascii?Q?d/W9WfOp2064yAfN22a+Grj1uVafytdNhQSz60XgZxWB0iKCYEeCm5dXfJgy?=
 =?us-ascii?Q?khZDcLgvCOTybBis+o3QsnW6dqt3uXeQkO2SSB/tj7QbusOGX9IGclfLzgxS?=
 =?us-ascii?Q?Ip+FZpIvVe7Jlz9tBmxXTQS5Wky4klD2BiRNUmHDZpU6kBSxBOvjgofgCRHo?=
 =?us-ascii?Q?3qb9YUdhoK2uZfgOKgPI+2s7h0yWX9XQYu472QDZROgS5/nUt2N9dd1kIF3N?=
 =?us-ascii?Q?9KoddpnhgYJ9KM8fTQJlwezU3JNbXHd0YtG/GjNpbRw9wnbpZ0AgqeiGplo2?=
 =?us-ascii?Q?z2tRowsCxuu7FRLfiq3BIrhHO5lVmngTTXQo6TDv3hAN2Muf1mP52O5xGaRL?=
 =?us-ascii?Q?4KGGPJ/Y4XrLsF8j7vQzX2hfrEvxQg1cnjOQ46MufTSK7OMf+VvB56Q/KeLb?=
 =?us-ascii?Q?SmjsgeeOl3dTrVOMWWLzSc4j6BxRRyqSXY0ASfPf3nANfbGj35pL+o7dJMlo?=
 =?us-ascii?Q?RIkEY0i3cbnJhmEfRiVdtHIUcakyA8dfwcK3xdKCbM3yHJHetOAFHwRSh/n2?=
 =?us-ascii?Q?LCroDJrqRam6tjGq1ZSk3Yu74yWfI3jLqvabBPHeVKjhOONSDEVD7ADZWgkd?=
 =?us-ascii?Q?FkfQLtJCyldbK44l0awt5YHxIsJG+RuTpFJ7cOr7XH4aRuRL0MA+lDV9XVqV?=
 =?us-ascii?Q?LtixARJGpmQ5tT2FzkSQK1/5fef4aPvoGqkSdH7L3GMKXisppckFxqXJXItO?=
 =?us-ascii?Q?hKoEBdqoRjaDp1XE6fgYWZOqa+8C4EshImkelNMAbF0Yltt0X1SCY1vNBA4U?=
 =?us-ascii?Q?iEBm+ahdknLUy/g6bWyOcpdEZQyml7ute+7Wm1Fx0yu+vRpIa6wlOV4q/Rq2?=
 =?us-ascii?Q?8G9PLJgN4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979d5045-c13e-48d8-b1c3-08df4bcefeb7
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:31.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJMRHxxUoCPP7k51H+Z2b81nqgEcWzNyarArrsifWbZLZSCVPda2qVCamKhq9ggxAJkmXsfrPGm0n6eO8lAuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9851

Now that the guts driver supports RCW override through the DCFG_DCSR
register space, describe it in the DT node for the LS208XA SoC.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index cc1a64e63ed5..ffadd2ae45d7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -268,7 +268,9 @@ clockgen: clocking@1300000 {
 
 		dcfg: dcfg@1e00000 {
 			compatible = "fsl,ls2080a-dcfg", "syscon";
-			reg = <0x0 0x1e00000 0x0 0x10000>;
+			reg = <0x0 0x1e00000 0x0 0x10000>,
+			      <0x7 0x00100000 0x0 0x10000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			little-endian;
 		};
 
-- 
2.25.1

