Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023106.outbound.protection.outlook.com [40.107.159.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E08343D95
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958991; cv=fail; b=As38k3n3xp0JMRqNXhEuhUB3pocHpGAVBdImjtZUpUq8+5G8pNDzyyBkGXL0Pc13qrD0FGbCwZ9IdkrTU9DgcgznJ165tMt9gFb0q/U+/GtxjbG+Cfz2oxf1kfn7yiq11L0HxLuBlqyGuB/4OMBj1P+jocM0+XiVRpFNi4yi/hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958991; c=relaxed/simple;
	bh=dHgE/U0yhhR2OJjH1/RQ4TCKUIoLvvki2WXL3ZNheoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cxAs3kKdRN1hnKSlcZnkOkqdh7ZkxBVcAQW9K3KOFK9qmtmBF3PvloxqZQO7/48tfnlCMmhKxCyAOU9N/g0V/g1zJ9akX+aa96WubN1SXxB9PZ9OsjfTI8AxVm5M3iNzH14hnMJJiYP4GbG/hBe2pFruD3pbCxHaUZqsMbCo5oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=YmqLU0fg; arc=fail smtp.client-ip=40.107.159.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="YmqLU0fg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dlqm+DJDu2MwDwcG6mlo0xb7/aHnMIwCiDOcG/RuhYP6DJnS3V9fuDiUFWJnttjqcN26m+iD9oym39LERTHeJFwTiMegshZbtzE4mK+wLnt6XW/XGWDmrDmJ3nXKJC06Rqqq048hApcRvo4iBRtYREb9NQXVEeJY0FBA0ubIHt4JoOhrPdvCPnykppi4oBr9wDtHBynYXpy+UUZjRhK7QdQCyN5EDirV7Vv45tbbpgsyOQNrU5HwkXwBdtBVnzJHWrr/5SD3Y4mGso/EBIYE3sYblpI2CPBUjCm95Fray3aiwy3HiUsiSF7wCTN8ddy3o7YYYmNlU5rP9KJR3bf2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPLJTF0ZuiaXr3K9CtXMsZfTsma5NKvm593ijvQTP8M=;
 b=tiidrkWXEpR/ZaIi8/YgJq4D0UXsUILKjH4VMOIMkqGOh9vLQfPKITlhcqriJfVCDakwhUbVKZ13UDVYYcovvmq/9klbMHKRlwE+8KkPg5J0KNwK1eCNFjk4r3sQuao3iB1xPO5FpcWpFcnL++bAAvAQMlabJ9+tV5E0/zvIccMnirGnB8K+OcpIrKgyJ6xTtgRGpRTwgLv7EZ9ALNfDmAtTVuzBk0BFnQ6Gtq2yIvQXOA4aDRfQXqNzms0rHxBk5NTYAiesw4QHxB4SArY2q+bO53XFLEo318ca5IaNpcb8MY4+YKAvNhT4i8rqvAnvEDP/fVu3gcLdVqUmcTqYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPLJTF0ZuiaXr3K9CtXMsZfTsma5NKvm593ijvQTP8M=;
 b=YmqLU0fgM2NjQcqOG/ua7K+YWE2dV7aAZT3izjaNuv727ECFnlh4PAg8b5P39xko2pqRG8mM40f9Kr6/httdlQqR0zyoXMIT1u/P8T/QpSYrMuo7QYS35Kf1RwxHpfa19Bu7Kd5OvPpCFt7OcRmvYcYWuCC0auaIK9c195udjKdT0J0OuQjduF4XOGshEi1k7Ag/CyLB5EUzDoVv/GA/7n4viWe15ymKwQ2sU1mMMiiROSFKDJDZm5OwqPZnGIoWSshnzKd+lQrvXwNmQsPCf7HMjTPF5SAYyH8pOTQBH6mrjwRp7tYCIhgKYIM3h6GeL5shM7Op2s4O/bMsi3LoBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:23:04 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:23:04 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som-symphony: Add USB support
Date: Fri,  5 Dec 2025 19:22:56 +0100
Message-ID: <20251205182258.50397-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>
References: <20251205182258.50397-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a816cc-c1b9-4978-e753-08de342b549c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ch3MLgY8Y9kRMnpEbSXBv3JqjxmjdWKRJ/L5olYAdTLjzlvPkN+ZZV6Z5+g6?=
 =?us-ascii?Q?mZNokZ5csWdfTafDQ7LOlANesFR9AGXFBc7D1tNDxjYwJtuL0+eI9l00M6Ee?=
 =?us-ascii?Q?UuEZRblVZd7LOZYWup7BYLYnIuNEkITb0LNoVzeEuxYxTysA5k/vDld2joXr?=
 =?us-ascii?Q?uSzipH/BkESkaQxiqyZx/nfU6dk5juZ0Dc6/HAGdK8ek4gZ/tXRpqOIE0mSE?=
 =?us-ascii?Q?p7yaTrypQwLyBxByfWyaQXkmLeRSWAA4x6NVG4Y4AAb/7AGADcmFfSFWlpqg?=
 =?us-ascii?Q?ITin8PmQ9pstSCBebKJ6a9ZkhbAx0g5lugqy8SWyCm6J6ZvcH6kNw066+6B2?=
 =?us-ascii?Q?WxaIuF27fptSXapizyWNqCS+2mgPHg5QG3Ld2N988Mtgsw9EeDP03Kek2Tcz?=
 =?us-ascii?Q?rY5YIC+hzJSaSgjIywPMwPlA+PFBw/asiIzcVbi5O9DF9Wr0/PZTggCMJiCd?=
 =?us-ascii?Q?D+ksr992v04+K9bmdicEcZa4X6+Rn2mO2Dkw860mrDfoiBDs3CjdTvvecLGR?=
 =?us-ascii?Q?nB+khIG32VKBnJSh86vgGxkZqtXvJMEiVe1eVM36S9jtF1ELH7nuCuGzm5ox?=
 =?us-ascii?Q?82PdQPI/dJhr+WKJwLW1OtEQQ0Hzs4vfYkYaI6fWEmvItiQwWWtHazMQnNAZ?=
 =?us-ascii?Q?8AuLQH0QU76aaIrwNcr1iSMm6j0tmtg/RW9vbstVDnk6UE6kktNxxXdR2ROT?=
 =?us-ascii?Q?NTbzvHozyWNhKDWIs+UERYn9P6HwO8blbU/uce2SggXgboILBYUNmwDeK+jN?=
 =?us-ascii?Q?nnaUfyQ2m8JN/16lmIwnY8Y8yvpDG/3DkKY75ajOcNtzFTMhTPp3+nUsTXpo?=
 =?us-ascii?Q?at2B7RAYtJBXbytb2WMP2Cavodr+uOjsPnW4ypFuEFdVAJ73XGY2Hj2MfWKM?=
 =?us-ascii?Q?MvF6XSTgIkUuB58NAlNh+I6oc1h3ejMvot3d7Rt8DGzDtKn7C1zpZwnkE4R2?=
 =?us-ascii?Q?MCJt0w49bdqfz9XLajX7d0t0iElysTFIm5lf90BTeNgbGeYmFcPv4DXfSkTq?=
 =?us-ascii?Q?5O3BE0+IqtlUTp3vKFLP23FYgYGx2sMKHAcTj/XXo5DSkZLpOq0RRFMXSy1L?=
 =?us-ascii?Q?zNDdqWQn3KneTfXJ3PfETX8NcFlB0dMy/qLrx1WmscVjptOiE0X1Hqu8LFwe?=
 =?us-ascii?Q?2eSJ6hQLVGge4dAnW+DcdxMYucoSqXH6WWcrccML/DpUTjMO/InkkmOp2R8h?=
 =?us-ascii?Q?Ewmni5gDbCP8Q2fmqwRjeWJpNGGNjq95vATpg1YbZEunl+kj+0bSTIsjx5gu?=
 =?us-ascii?Q?L4E4BL/KHM+j3LGxbzjQliYlBx6WXsfo3k1IKfZOMwoF2t+oB/bbu37foYcI?=
 =?us-ascii?Q?3gUFiYfvFPjsPJH6cUh/yTobl6SMGn/zR9/b8SilE1MCQAYGn5OFQSO+Th01?=
 =?us-ascii?Q?NqdwEwwcrQY+ihoZgne9R4qKpazPFMMSNvW1sjOl+mNP3+lhiEBtRBFM+vKM?=
 =?us-ascii?Q?TKfBoFzsRWlLcbjWDis9x1JF7Ryife0f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rHSSCjZXpSn+NkhjBZOhLb1jOUkvaZ2ncC50KYDYhTU1KjR/UROJqyg8d/sB?=
 =?us-ascii?Q?AnUXFFujLN5g5w5gSZCYLjgp+aH2hljlDAr43ssvZsw085GGVOlGIN9/BaNB?=
 =?us-ascii?Q?O2BS2CUGzFKnmXYbX3sCL6BFq8SW+BDJ8YMpiv3ioEnRalAJeTJBjp6nWjgo?=
 =?us-ascii?Q?t3F8uXJJ1MamGZ0LM31dsc1b9Kj9Mn6bdZkm2eFvyJfAXGnMd3NRDPburMsl?=
 =?us-ascii?Q?2UzVpoTd3YilY1tPrLmQjbwLwpmFVyLSxlgD27SZyI4s4pMRwYKSmk2aSpyl?=
 =?us-ascii?Q?HtjoQqFlx+w7nXhm2o64Dcal0Bb1zObee89XWP3Dpz8CM8WKkhZO6Obl62rw?=
 =?us-ascii?Q?J1R4h7alJCy2jaPU9pI+oRbsko4y5Xve7TiFldU/chjl/zJzj2r7m80QI9cf?=
 =?us-ascii?Q?Rq7Dmiykp9iF7Ae7c95m//6mMHUZR1W/OzVjiQ6JUKH27klrBjOeUV37Olty?=
 =?us-ascii?Q?tGb6BEmJO4WN4Ci9DotLz/CNlOh1txafLf//2czcM3cU5O0OyAn+32R1YTdh?=
 =?us-ascii?Q?7Eu+G5wjNr/YiBfBewtgOZ6rNHUye/gZ7vvnkVl40nlOviLA9xG1wInKNgmK?=
 =?us-ascii?Q?zVXC3wzvLvArByoY5k4IqwSpxbFNCWJklj9vkhO4ycq2fi11gcUYUtjL76rK?=
 =?us-ascii?Q?AOSHmlsyKGmY6+yPgZrpNWeTirGCl1+U6FfgvshFGP4ZU2SyqBVtHiBOZHL3?=
 =?us-ascii?Q?UmyTaErW0JeB2BjsACtx3cNwEmcf8xNflb8X8YvqfQp+rZa7HyTm4VaW50md?=
 =?us-ascii?Q?cULDRS6dR2r4hHycjkj7pBXU9GdFVgGQD+2Um8JAnhqrsw4vp+ySSFivmmqg?=
 =?us-ascii?Q?7fYleSiFoQgaQ8t9W5RbkR/ik3/hQF3GOaxcnZqeBn2WXXlp4Ggopo3ge+8l?=
 =?us-ascii?Q?ILyvTeGwqc5+tVh47C4aUTz+YAq5kDm6sawOajyv3jg14ToAZ6F9oM1FIa5G?=
 =?us-ascii?Q?2eYjHhTvhP0WxWANOQu82PJZkHN8pBbbZ9YCq2VStSF2MHVHJ8Im59C/3l5G?=
 =?us-ascii?Q?UCMFZpFPuRkFtWZpGYY5nojSJHX9UQyuKSvCaQI6EPX9gD5MSOlsG216eX+w?=
 =?us-ascii?Q?6a7dtJHEXxOuSU+IZMTph2c08hGN3dpa4zSlGIWSDFLW8OQYXUzQ+Gyk5uTm?=
 =?us-ascii?Q?eavOZZNw9ypxVRsvUojNJyw2vIxqeprXfAT8+Yg3077V+MMm97UR1paO/W4f?=
 =?us-ascii?Q?ePTCyh0k0AkrOzztFnTPELFcGRkigvXUkZW3pit/B+Ht8gDrwNnTCJ8X3LZ9?=
 =?us-ascii?Q?HAu+vwwfY8gw/o5gPWYlEVhpU1b+3oFdkVMynDUOgcZbJ9A8sXT4grorBRKF?=
 =?us-ascii?Q?QC25s6BWTkrDfxt94tx5ldRadF/jIFw/cEB+nwHvghfuw98EsyeAfIAJVmOZ?=
 =?us-ascii?Q?4j4OBregyNSD7YG20UFI566IifeRcItiFZgEY5FK9DxsZntKHid6sNA653JF?=
 =?us-ascii?Q?pxc2qdfxRU2lzTr2jFyLYb0eIzYOvFP5lIRt2LEE26yMXf51Rfxq/uiudZe8?=
 =?us-ascii?Q?YPQccjxh8evQ2ebTbUg3Q+2UF4hamMhdsLpyiTFaaAGLEKiu/RmsWGNQ4/R0?=
 =?us-ascii?Q?Q6lqvk3yLAXweDfOXRKC6ZeFmWSf4rulP1m6vQfabGhz0bkWJanqJ5JgjDxE?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a816cc-c1b9-4978-e753-08de342b549c
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:23:04.1694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yNpuXRNSBH8+GHuC8XzpPCwmIF3BtyZ5yRJX5ewvm9eQhcJqQ8SSCNB2edfq72Tec3lV20+XYRW626PvWrOLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

The Symphony carrier board includes a USB Type-C connector on the USB1
port through an NXP PTN5150 Type-C controller connected on the I2C bus.
The PTN5150 provides cable orientation detection and role switching
information to the USB controller.

This patch adds the PTN5150 node, its interrupt line, the required pin
muxing, and wires the controller to the USB1 OTG dual-role device using
the USB role-switch framework.

This patch adds also USB2 support, that remains in host-only mode,
matching the hardware capabilities of the Symphony board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 39bfbd0428a9..ee69d6b268a4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -251,6 +251,22 @@ pca9534: gpio@20 {
 		#gpio-cells = <2>;
 		wakeup-source;
 	};
+
+	/* USB Type-C Controller */
+	ptn5150: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_NONE>;
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
 };
 
 /* Console */
@@ -267,6 +283,29 @@ &lpuart6 {
 	status = "okay";
 };
 
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
 /* SD */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -351,6 +390,12 @@ MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

