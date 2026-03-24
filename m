Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D83E6DF6
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350183; cv=fail; b=KWCh+TG/qp0OcF7dAHvHK6Cse3Ne9w47kLy2Gz8pHZXA/B40gusrxMY2zhKKVSMH4/DEZ9nkdEGttgnV/Z1PTM3avoGQTvJ8MOCUe0CNJ4eAZAjCRNVfZv3mee7l5SsP8iOtO9DsBEmkGYNpQPNmDV/IUsyAJIYgoWDOIcrxEGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350183; c=relaxed/simple;
	bh=RCjOe1ngiXeGDtQEoyzOoTyUYTRe5MwPxuwwjD6CGpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jKEU1xxYZPgshcEEwh4jB8uQrSaGDj0XoV8LytSyuNBgz796cb8SDFI1LdGDew9LRFm5iVY0PL9MbvnmSz23PImK6eiPxiprWaV12F6swKK+2Z0HG3RuaD4QJNitsjiSFtvd+5y5NN4xeVIcq4fQWv/uWSD+eviSlKHi7H/kmbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kRoQBGkY; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kRoQBGkY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c86+S82QDjYiYfT3R9QugxsA4r45sBIYFnInf2Gc6NzB6r85kkip30CukIqL2m6hqrNudSYJ3BhDIh0Xy/kFG0uGDqE2ymxLBDBl86r3SuXA9mg209rX0CThgQ9Y+u0N4lNPYvUvEwmQN4rKGdhgY4OvZuo3Y9WsVSJogQTYbdFTJYNGXDydYv2EcoFnz7n/i5H2MV7hf3HzSlIo8qMla54T2mHFOH3jTTm1TmgGzQ+xCb47wFO3JvSRSeqNKe3QJ8Od4lk7X9y41TYVC9BTdO/lhqrxxaqS2bfvL9X7OhwdZKq/ybVuzOIfphNFSIiv9so7VQ65Q1UiXJLJpd4BeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ6MyeFk/sd/C/YFUyOfdymuezTeA0B1hR12FgiVkXI=;
 b=XRFNAwBhC+mSN70A2/3LbMlQ4VAR560RH9go66uom0O77084CRjnZMT6QkKhT/Vd6cWvcclcXxXnJTLcBjfWQ3NTkqjAwh/+2OPaLjY5F4vfOh4Y1ISgSOH/TG0VPKg4MUxXXJ1zyz7/8WTFd1bqFbv8pRBldejkFJQYDZ9l8ssC85pFAwCO/qWe2UpxYRxj877lBOkYU54dKzm7LnIurPdX+P13NJw9oPu6zUTakAkX5QiJIClklHgGT9P3Qds3kKNtEaRBcJ6eVobECV6+eBu6AzrnaS+06o1yK1YKNZoKEnFmEFXEicLnRCSBCfPx/5GHhxft1uiG6vqbNdnn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ6MyeFk/sd/C/YFUyOfdymuezTeA0B1hR12FgiVkXI=;
 b=kRoQBGkYCuYSHF0d0nZKFHoZs4dl/3PLcET/Kb46WbAqyaJtaqczOV7RLr3obX+SwCbWa2MSgWc5K6pXG0uQ/1J9uQ6uNvaTuBa4C7myR8mgv8eNA4MnbsX2+zoaW7dOhIN07cb+OIaeTPCSg6XCw9oiz5dqrl04CRnpYGcG2467WfhFi13prdlLOe5I1tGoX/mXOr7sB1HmPIRLExDH7wZ5xxL0UAkXSstKgZTAOek7YpyNvkNEiG5YHLcGeyrhh9vLb4BC4zkXZ2tBp30VmDyV8T2GESwcNA5fFnExp0z8RYsZ1FgxzdBEoOspjG+Qm9reOrvzJXQ8t892PMLZ4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:02:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:02:54 +0000
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
Subject: [PATCH v2 2/2] arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
Date: Tue, 24 Mar 2026 19:04:59 +0800
Message-Id: <20260324110459.2838767-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324110459.2838767-1-xu.yang_2@nxp.com>
References: <20260324110459.2838767-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9c261b-a51f-4891-d1d8-08de8994e603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|7416014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RNsY6hPjEl15oIfCyXNwYZRUgSUJpjVX1RWWZllpicrc+cB2b/shdUJy6GwC0xzCxUxuEOYaqFvFQLibKKNsiXiOXuiOn2A86hnw950wdJSMOu0nsk3oBrbxvPUXFSuzLgti1UX+fc2LHG3KERHRQBsB9mzsuq2hljRYF+vuQdPNTZa/kq3QYo6VyDm5Rsm5dYpovinfiJegL0fcXaeejDry0s9fRAIJkag7dggANgXC0+Sc+fhZyA4iB48TYLY7EdWiZyCX/h7cMSQrOp8NhL219n1AFkcLMkjBwAwACoGz/yPyAs5zCUEh0l+c3gBE+wPnf3USlNrdi0hY78RUldf6CtTvvcmTmZTrpdGX8uX9WAws2yyGYWaGPP8Ts/FOTZyY0jSoZOAcqcHc1FXuEi6uE7K8zIRYs3vubHcGDLzN9kQajtmBkoAbpFZV2dYyRREciB1pZQwDNu5k2cOULp/CBv9PtxgE6ib6LumWo4nOdysg2dwNhTyqFSV1wJCE5AYYfD5U5cITgolMrTbj3vQsgeuxUSvWoKqEdK6XapllV7FZ3w7SYfGwwtx+RPbHdj/u7GzIxr9zSZX2BNRFhaoIslVyrbFbDyydyxzk38vCGK8s22GOheG+ZJFJCYglCW1SgcUXbSOH7ZlgRzX5bfu9DsXcPO4q+WOxKuEbLMz34gD2AspKRWYXJY5uWOCYEDY4xX1LzbILQQ2hAB2+aivRtGCHa7/U7hfEf9V3V6gmPI54YxbFGo9KaOaAazjqtifAEJIHhksh4QFy629n9DnTQBumbXnNMHeoTjCz/AA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+nekUIPPRXJEa39EFiTeN+feOcnMpZ07wRog8MCFvvyUhaH84Ewr+us1QhC?=
 =?us-ascii?Q?AXbDjmWWdGFZOSGfHH1igSCtnRONXghKVUfxWWAqRGa74H8Y1t03wc+Rgg0t?=
 =?us-ascii?Q?wi3tRown0W7YHIFNgG7WmNux6ELnICe2wILp71ib13EeTc9r9LGFpBSgPgyz?=
 =?us-ascii?Q?kybOKUyQvPvzmhKKRzemx1CLmp/wwuTYIh05CZPqdKsLKYgZn0VdX+tBLYwD?=
 =?us-ascii?Q?lkgPdlFsXtoA6GdC+wyKBf1sW0ZM2FZPTJE/gTQKLEYknZ5L+MPm1IFpQ3kz?=
 =?us-ascii?Q?jgvVZ3q7+Do10HLZY/rP+nqsgPFMEoVyn/HDOzU2elINo42eVTyz6LC9mTs3?=
 =?us-ascii?Q?ivL3G4pKyTBL/YLHuMJNV3iGM/KvDH/hUMPKKkyrA9NLgPhSiosNvbqMJD9e?=
 =?us-ascii?Q?FYum0Ub407oh6QLQqG7rTjD8olkQQgvVbG7b1ILoUWwEMAhDlE7c8olXH6kg?=
 =?us-ascii?Q?+Lp1VUK8FX9+NQ3wWC/ChGvU6W+sjKcyQ+WE6yVrPAERkjQZV2qDeP2qxtN6?=
 =?us-ascii?Q?SrjC/247/9hylqngIX2/+Ne0oqNoANa9ncCX14HRyxyVSruShAj/Lh79DUwP?=
 =?us-ascii?Q?khA7BNcFjS5LD3sxOapfgqIwKvzc5q4L1aXFK5EfNjXiZYR43f9khuV2YLtc?=
 =?us-ascii?Q?c+hX7a3/BxIwJBVGBJjvKkPVOaobKFghTVQOQCoLpo8ZbR02v68R3UJSC24p?=
 =?us-ascii?Q?1p87+k9LCcYxhht2LYKPX0DlgPzBzTxJAiNcXYqoX8sphzqZUHQSQMl1fEIH?=
 =?us-ascii?Q?LGSwOMm1ty2V/scpChJezL1BVRDMK/KPBRnt+52joFFETL8ISbKX0834E5i5?=
 =?us-ascii?Q?iAhEV+rVy1B9mDj+iShBmO9Ym+vxykdMwvCVlyrvwM/Vn/aAzBtq2CqK3Ql7?=
 =?us-ascii?Q?WLP0KTJLGvelMNnHtjYgKbhmxgh8BNMD47AMugGjMjTWkI/LePV7ZumtEzMc?=
 =?us-ascii?Q?SerJZEHUR65w8kIjbLeXCOG3nCuqzXZ5UxPfdQIoQNwqdpy2xxKaDCarMxtf?=
 =?us-ascii?Q?yqbrkN0lnSMgodCss1a/LavUEvajQAzjX7o6VJuk5tTZl3BGfSGqZkwqK2Xb?=
 =?us-ascii?Q?IU+000+e1A3LZeFyReeXvD7rt83tZcgmHTbWv4JzvIB1FpRa70agGl7wxMzz?=
 =?us-ascii?Q?RAfyJcmUMateV1cRTNpJbYc2TIPG9OcjNx12A6PtXYr/g3w+YvY2+idVozqD?=
 =?us-ascii?Q?HoElBrsqw2qA2/AaguN6fHr6bR3+v1B+QNoRc5oNEw5WqwQtVpW0SHfEH4gk?=
 =?us-ascii?Q?s5klbLjpGHR5kmEaWew7+PdDq+YzyRRAoAHlZOhUp+ALKByZkQde3M6LHT9d?=
 =?us-ascii?Q?pLPQq0bC/9Ko2HeYZsGIC9E952U5x0nAScJms6SKxpJR9jVMPx+pFfaPqDjB?=
 =?us-ascii?Q?BOp1G6FHoxrqq9dD4k4vIm5EjTbueSmf3wJQq3W61tT3wGBibxWDduOYlWay?=
 =?us-ascii?Q?IDnyJtHImw543lmUobSx2jIUXerdfuB24Bt8zsoYq8OrlkJOcEzAbjuE6JYA?=
 =?us-ascii?Q?FZx3jUzhXnlzXQHQb/J9CIMLpbovd7fT7sjBQOpxdS4vhTDcIMb3PTZpc0OR?=
 =?us-ascii?Q?zkTlIwD8hZI+4pF7U9M65nJ9P2IyHhXNyp3SHCEsIH1rwaYWbKZ3gRV94hW4?=
 =?us-ascii?Q?x4FSW0AS/z/hlC77pUtkU0gzd+300jjlmpb1bLnhOo6KSPGwNH8RPY2nrqJg?=
 =?us-ascii?Q?rZmMZUFu1kxIMU8mIF538Inr1XrVVSugc7Hg0pVYMOoQ7FIhiOW3jgoDJpDt?=
 =?us-ascii?Q?/BquPvbH9g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9c261b-a51f-4891-d1d8-08de8994e603
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:02:54.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL9G4RT1avC5iX4VrGwOm3z8e/0NLwaLuXpefQ7BI7nY+mT+WFRfDz91WNJgHulzBzet5YRmdzdHgFqCCgFdHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

When attach to PC Type-A port, the USB device controller does not function
at all. Because it is configured as source-only and a Type-A port doesn't
support PD capability, a data role swap is impossible.

Actually, PTN5110THQ is configured for Source role only at POR, but after
POR it can operate as a DRP (Dual-Role Power). By switching the power-role
to dual, the port can operate as a sink and enter device mode when attach
to Type-A port.

Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
to control the 12V VBUS output, to avoid outputting a higher VBUS when in
sink role, we set the operation current limit to 0mA so that SW will not
control EN_SNK at all.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
- improve commit message
- add comments for 0mA operational current
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 40a0bc9f4e84..623169f7ddb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -566,9 +566,17 @@ ptn5110: tcpc@50 {
 		usb_con1: connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
+			power-role = "dual";
 			data-role = "dual";
+			try-power-role = "sink";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			/*
+			 * Set operational current to 0mA as we don't want EN_SNK
+			 * enable 12V VBUS switch when it work as a sink.
+			 */
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
 
 			ports {
 				#address-cells = <1>;
-- 
2.34.1

