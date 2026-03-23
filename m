Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5633F5B4
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264046; cv=fail; b=CaV2g8RzzlMCEvCECNXGvdLEpb09sAk6x7XsND7XUTLxW1zvL/DmBZbrG3SPYY87d+8E+ACgcc0CjTCEhjWn9g+JdZM2reNN8jDHWaBRrTGZ9NOP9NITP0vCw3lBkIdON9EZYfbD4KLtv+RE+KXnfeB9Af9JjEg3VF86DkFHD+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264046; c=relaxed/simple;
	bh=8C1KWErQskpgLU5PHL2hMQMHXda2Abx5eR7hDxsBCFY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WBREIBypuuCi12KgcQqQz8eB6JHjrZeLABr0lUciEipUKQpiZPn7CGOdL0UBKqhteR+k9q5gLuO/FTOTeVs8CjKvSJglAY/2alQBpzwm2A0yLCeSYL1X+teYsLaTQRVeDPdbh/ToqTtnpwLbMyZfi6dj+hogf8sNfkSWdyDoHmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VMZf2Rtm; arc=fail smtp.client-ip=52.101.84.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VMZf2Rtm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKPM2HdILIZB0Naw3oDSjIT0BM3pRu2hvyTf8gYLXJEdLh9g3pwzmWNJThysI2LdJm8LtkxoLvaYZhs2VK+epyVfF8vpbB4WBRW0P5OSC8xXuIHuRTRKGq+XNLg9NBaHMCO3BycFpOm4cEyYkTrJ/gwwrHVqo+7h2TYl9RPq0ODA92PdYnXy0spwfSNEJBtNvzG0dmXeUpBdFVVBMLuAwXr8GLgoNr1vhtkhZcnf0R3QIrGBOI3R732UFB9EF4kgHMS/8DVTXiDaIMNWPRDJY3aMnWYoXlLeACo0zeQjC3Gf0/lC1TDelB0hT9yJLzpio3BXXW1w10fe2wTEPavIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecra5OkPgYdG07LJaMtqGzRwvl0g11Lc6UhKZpDuS7o=;
 b=ji7VrR198bL2V6BYrnJyQ1e5muD1bCQ/c8i4KqkkxzXXwKfRmo9fjSwwD3PuuGQS/X3MuBAJIMk+JGZpPTKfseKuaKVjxXxTSMkOo6rEc+FluGvTzFa6ATJ6lkIlOPI/ckeyd1h44271rYd6uhQ36mfb4LpobqfNLv3N8KrRlJYbRclVnv3lmTfaGU/sKHx/p+6o9702XjArgtfnMeehyWqGIGz43gk81FCKwv1ncdZaSNfF7bEfoKyrHz5qtBhF+e1J4/s6oM0Y5eyMPR5CHgu8oO3ZzB0ELjxZvl7jEWPDfGVGJctuVXksWpXEMBOg7iNxwTBHb8Ti4OZfZwRdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecra5OkPgYdG07LJaMtqGzRwvl0g11Lc6UhKZpDuS7o=;
 b=VMZf2Rtmasm3mczX2H/jzb+Nac/gvT3fQgL2Nx2AIfARpxY/AGZcLuqFdFVqTqZeFX4J9XFSr3AKCB6QgdvuE/7Fj3ZVgJJl5pLgqKS9CmoD76FNEkBIWbPIp7QGMyGY8HuwbZXT5UlCLi442c2/tWvI5gRc+P4JrRB31stX2X5zf/UW4WMl991NBWEqGZZECTygGurIbIqawTTPTN7H26Zvt2liKDqg6OnpfV9SqfS4t/H4cXEepQ6YmcKFuasIXMY3IkIwMCrxzWq8puE/INx5woJ+W+zf+yueE7Xo7T1btd9ijgn8o3DVzlgh5j4+i3FOi+ukdY/mJ+nvqp2CbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10519.eurprd04.prod.outlook.com (2603:10a6:150:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:07:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:07:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 1/2] arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
Date: Mon, 23 Mar 2026 19:09:22 +0800
Message-Id: <20260323110923.2567366-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: 167f7eea-b7ac-4238-9a65-08de88cc5a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ydlWYVsCs42K/oWywEsbm8XqD16AagMOJtms9vE/mA9zSLEd2U1edywkEbgi1VrjcHkXLwXN77Oz7zTgukvBar94s2vRI/G8YOLpJXjvJhUWdiwvh4Ipxs3mmylJcsJX/IHoyLLEndbnG6+JSzqPg9o8gpUXKhWwBO4JRA2hNzPNJPv8yw4tvEl1TYe6Ne/7aS/bLZzzN0ExW8SyncGP0Y4AcIcKL3a3oZlBjv1vVmBin8yTOwJQVsZNRRcV08xI0s2CxIdJTNJS/xox7JI8zCAgv0xYmMqPD/Dwc0zhu3SLkiqw2OoAPOzjFjy2zCF5m9gL7pUWfwtohiw0epkZpRE+Ifok7yDAX15DU+QzmVdez4uBeIiDbOUP06K7mXcYVEiyiZKsBCPbus0Hl6DSxiJIUMot+gzm3P/RqgWbmNXkttdir++pUOPAN18g62fWGM54DonK10mJkMQeQKBIBI5YA6UQvv9Xd/39jQsO2jxGy2WtXe4aHDFEQQP/vqb1GYF5PQiuQIJrQq2r5rV2BCKTB2aa01k93OQDHNSildbIxkAn/rxF/xvTpKmsYje/1/Kb3jbhEICskDegp4OOfKE69q+R3FOhdL3HorsKG4rz0K9kkFGyjylr+dW6aE19GYLPOTUoc/ZLorjX0JKrXQpBg5Uu719HjS2ne0GOfWGfrYNxIJxwCXVHktkqGxO+axWH5FFBmpI9Ln9lI9jX896w35H0AaXWNygfNZ/73gTAhJgAVz2zLig0z6WFXjuRXOVdGysLZIoeqXs6wwuj3X5QOEetIv0nn2kQ9u2Klto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQqE/igFpi9rTYxVcKseifcMwPM80mz7q4WEdlXOlVhC2pPiFzIlkFGMiWLX?=
 =?us-ascii?Q?soVzVkRdMFlz7mwbORa936HymHoxlswK/2IuEVbQBSSDIqGfxEt5M8Bd9jBE?=
 =?us-ascii?Q?eX34UmtpOT7z+KWvfDFWNOTBeJlmPDY3eof8pepy+DakMnu6J2sgSLSozzfH?=
 =?us-ascii?Q?ElPgTlidwZL2Chkh0rNHivL2R0hBvxKEDY9pfbt8wNJr/tCTnAi7Ctn5R1HS?=
 =?us-ascii?Q?Oybr2jNngC6NYN5hhVAixZhdVy+S8KhTtkPf/DQOYkQSkVoo7w1cORjSbEP0?=
 =?us-ascii?Q?XQvCWyUXSI5cC801jMvG0y/dYVEhdDGT7xuR7cjUVyCfyfG+moH0L3wWBENO?=
 =?us-ascii?Q?0WiP84k5ke3hIm5qHIxjzWIozXExXz6KYRSPo8OTI1le26hXyGq0aSf9m4U9?=
 =?us-ascii?Q?JGY5kL33jMnybV0xHQkbsBukcrQo7gsW4AXEZXX/OINfCBAdmPI5wz19RzBo?=
 =?us-ascii?Q?vpIYRquHNG/aY+jIvAugS5OxdebQJ18ZlZmy1oNn9B/jSPKzQ/Z3PepSu/UR?=
 =?us-ascii?Q?Z70keElktm6VkVGuIXtg6CMy7wk7cs5LI3eVIzVcXXLhyJ9xuhqs3gtDjaOx?=
 =?us-ascii?Q?9bvxH0IMfKykWstC/YdzefR24L8zkM9yRl76YOzjHteiZQllrcraYJCl+7Wx?=
 =?us-ascii?Q?eboJ7U/72OzNa/VwGGK3JhOVwx4/iY6z0vi16XCJ+WsuKzLhQr4m5Ly2mlkC?=
 =?us-ascii?Q?alxgg2hwnz6hCuUy0kgljAJnOr17RUKMHVUU8slSn2JWiGWFY487uf4ZIh/A?=
 =?us-ascii?Q?pDc6o31FCCn8Z4rIkS5Hfg1N7mrm8XJ3WLRT7XAKlHqHwYHzoJFg9SqF0w5x?=
 =?us-ascii?Q?+Fw1CdT/ZQSbLd13vWTihdfJAgSKoxomk9Y9Ukd/lxTjeVSKaZmTfc+k7MmR?=
 =?us-ascii?Q?r+InJ70Fuk51Y4tYDeShClEydNVBiKbZYKNttrP+5/FD6/o8ZQZe+ntNfq/i?=
 =?us-ascii?Q?itJH77G5yS2H/C/b+QzQJ+uNv5tY2/ql3LAZzPAMPgVu0W5Ze+l8jYJPRYTu?=
 =?us-ascii?Q?k6aitHscPsy9XVxlH+EZ9/WNcO8ir3+AgureLOTVTh3HXyHNHly6vZIXYftH?=
 =?us-ascii?Q?cMuI1/+Z54dxyQ5j+cJbw36N9ANfjMxUWd7zaV+Ev+H4sCadmmk9Sko85/ul?=
 =?us-ascii?Q?xGOlwWfo+kWWCYmx9rMbROaEdRgRs+aKb3+XRdbIrCTHPYLTjgx68LWwhMuL?=
 =?us-ascii?Q?xxINx59SMUd9IgMBgWU3u+MdW+kfkZbHHjI5C6mNWJnH5XpychxQVKhjcsx6?=
 =?us-ascii?Q?d8V2m87RMWAjdRIn4tkNXp+e+lvngPPU7/1+B8A8DS1Wjoi3CvdhwMadNiaN?=
 =?us-ascii?Q?TN5cKvbxQbB6qIn40uBiZbhb18YnIAv/bTx9jy/C6z52nFCwLttjCVtIGGpt?=
 =?us-ascii?Q?ebw5Zk4xDB8GUmrgyUf7QRhKbHHdwI0WGX7S7WrUnrlEFoqK/Hr0PGM57pci?=
 =?us-ascii?Q?+MYe1hX8dY2Nd2gtr8GFey9ZHR3SqLFJF3zIDd0LtGEK6Zf6MP48701gc2A9?=
 =?us-ascii?Q?vLWG3h10UYC1mghlMWVakAiQGQDFea+C19fkurWgVCNOjsFrvhp5KkoYILRF?=
 =?us-ascii?Q?WZuJvdJHPQ2fJp60nw0pdNEncgQmXFAd+hxmLKv9L9ra6YleCvuHx9wOTzHo?=
 =?us-ascii?Q?IYh9YVTK8K/Wpg1U5p1Ib8FqIVAajBT9EhnN1W7in+qBefyWO5yhPYq+svKe?=
 =?us-ascii?Q?sC++R5mkTS6tfpNQc69ASfE4R9+PViEAnEPnu1asWifzuNRq09G0rCDxDQld?=
 =?us-ascii?Q?m21wHIpimw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167f7eea-b7ac-4238-9a65-08de88cc5a49
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:07:20.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWimXplZWua5qCbK8tlsJo6jK3WQdiOXWni0HISPCBh1UV+kTKbY/HCfhz0sPXpJxUs+p6mrrdts4bl8WPsAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10519

When attach to PC Type-A port, the USB device controller does not function
at all. Because it is configured as source-only and a Type-A port doesn't
support PD capability, a data role swap is impossible.

Actually, PTN5110THQ is configured for DFP/Source role only at POR, but
after POR it can operate as a DRP. By switching the power-role to dual,
the port can operate as a sink and enter device mode when attached to
Type-A port.

Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
to control the 12V VBUS output, to avoid outputting a higher VBUS when in
sink role, we set the operation current limit to 0mA so that SW will not
control EN_SNK at all.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index dadc136aec6e..8a832a0e105d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -611,9 +611,13 @@ ptn5110: tcpc@51 {
 		usb_con1: connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
+			power-role = "dual";
 			data-role = "dual";
+			try-power-role = "sink";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1

