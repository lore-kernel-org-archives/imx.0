Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022075.outbound.protection.outlook.com [40.107.40.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F038B3C9896
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786184028; cv=fail; b=ui0awUsSXdX/5XaLLTR3DKUodAicqqYZpyu9kIw0hcs3k2TRku5oWmp7BrWSMekeWBuqHFb1FNtJqFk9Z943T8sMZDcxGUNwjfOC6RjWn7KMRNyciejNHmPZkoLMtYuhtG114qRCnqhmQHS5VfIjZrbCJCdxUMAHytyXwmgWQ1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786184028; c=relaxed/simple;
	bh=Q/Mastn3yfDqiqSfKGqoigynifZ/qGRfypEXgRENGQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V+SRvQ3VJR7CuPjPEA3O2/E86fL9dnM8NAvLTuz3jGT9WNG2InPe3HfLa0nigfxfgD9KeLAgL8ynVaaI1MyqPuKc91pV+XwqC6DWtPtW0fIDaMidysvOCZOvRBX2vziikNUXgSE7nR/26POcWlPXdVseEfwL39l7yb6EEVYvAtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=oZ5BlIaY; arc=fail smtp.client-ip=40.107.40.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="oZ5BlIaY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1ccj73AEwwo2Yz8knNtrIWAFfdWNSwivYKft+IE5ox0giIefX+H+C17j6pnQ2k9AV9k58vEmFpbjkpoGtS6rAUgnK+JEOQ7ScaRJZiknI90NqQqa7T+FHNkA6z3AzahQN2ld+AoCmQVIXpp2asv3W/7VSXOOf7sy4m9LDXOa5MoUJ8ml6Em4jQ+nVI5/5LaICkfOwbvdzqyECILiHG2EpxNs30GNKQvuQOpwmeRyUwcpravJXHiLzQyxPkPJhlX37A/hoMCTNoiCaCWNl0CTU7sOqpmWCjacoq5IRxM+/OfI4nzkyfQFaUAYgB2ld9dlqQWbhi/24Y0HnScSw96Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRtF6F1JXiCnT4LzQY/nQaeXVae1m7epZgujipJCM6A=;
 b=LgyAxGKMdLEjNTdfhmoVlkvefmiXCZYgjGE1yREh/rhjP9QR1T0MOPnWImAfYVt6STdEa/647W2B7DGDmJbTNjAIDPRogIjRvftEuoFtvTvWeb+rT+Ab60js/9mai/zel9TmtwcLIjCIWiIuWaIotT7Munrap9NXnCWvZLBn2MW11nLmyrPOQ3xc7sQmtN71c7iCF3bFtyxLacQsqb3ZK6ckWHQJBLWC5dn7RuSxz5sAmGL1a35An3cBoyQNrLFgYyNOjq0wYigE2YWr9fhd2oXM4Kq678qma1QOAB5fqPttJw98XeH7xwgHhCFZRjR42jnZS4LEBLX5fi0fwl+ctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRtF6F1JXiCnT4LzQY/nQaeXVae1m7epZgujipJCM6A=;
 b=oZ5BlIaYgHCtlhzpo2rqhRoWzeRfHLuVcc/dk3LVl83AlUf93Uhng+VHA75xa8+/pf6kZSJmaNEeR0IuLf96KbE2vOO8H9QdgRuX48latuOVvml4Bf3yGlSLiN2FRQjt3eNxxF7eRu88n77ZfsFrNQFQei8acjqyOMIAAEme4p88yJnELfC+beFqSMAoxugbQjFMUKRPFSw0VHVWboR9VyCB5yy8/t2kawgHlJM3hVXSjLGVni2auTpgOhm8qDz8Af/m36vQGhQVzzx1X55Ky002G+gFWkaqltuAcUdX0CB8Uc6RfVqSuZOMJt0Km/xnK3+QeMBcbvCJiAJZFvdovw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:13:40 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:13:40 +0000
Date: Sat, 8 Aug 2026 10:13:27 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 3/5] arm64: dts: imx8mq-phanbell: Enable i2c2 and i2c3
Message-ID: <53d279af2eaa7bd3086366f0404fab19dd76ba76.1786177290.git.rudi@heitbaum.com>
References: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: MEWP282CA0149.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d5::13) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: e08fde5e-890b-4a0c-9053-08def535b850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/4Oshp1cG94WT4z82BlLt7MLJBz327mESOr0dbepgCURyy/knQoXfmCa3iraShVg8PWsclZeJ1EbBibyP6DQD1eTfPc58PVUd60weg7v1kK1LPSwicMSiBUHsH2EP1Qs4fQLV8egu1vP5ls7vByPatgvwZN48oaVdjoFQYBn4KSE1Rdde5OZzV1g/8M3Si6l51iWwFrBzYIIc73Wf5/oJTE8BXaRjkotnv/mHCRTHZGjjZBCt72PRJtSzAtguWGuWrhLI9j5qr5I1FC1p0QYQ0SxaRhSy29/i2krGj2i4V2CGP5xk81IDox9DPw9Kz6hcy7qExLtrS//dR4ITaLH+SoI9UoffiRFr1ECabUL294y3eSMtmHptDumYUPl10rpGg9IYZoxbaAPJtehvh8wxQsh1dKwMIF3i5PTB5f/TVjhJlyPQMHjOFnLrVKFKvKuhY9lM2m4c2tPVMgCiW0V0QOnjgZcmN+zzVPK+VQp0Y81f9XGCyv1eYSvU/3MyIs58i/W++ucqPMWPhKTwxzX73HAx5Wrvf8SWN+byrVsNRe2NvxH3ABxEOLI53Wld6Q6UDiU7eHZs4LlqsOBdzuVdToEN7lq8fdMiJeQ9lpeOc7e3gF0YvkNe4w85MO2J5C64eMUiJX/RS9W+ZazbPMHM/GCNcULehh3byH5R+x3aCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Wx7vG+uF0V1aD/AQ+n9Tqezl79L90+4jYMSf2+y0EiN8CJfFIu+mt/eW67x?=
 =?us-ascii?Q?EB3/vQ36AnPiyvxPAn5OlxmTsSy9nqw3iNahOvq18dtvfwAQm8IYDzPMnUze?=
 =?us-ascii?Q?3Y1s1AOF28XXGYb66N00aFceiM+B7X8DCZ994Rh3FMJEpcym4FsjDdadTRk0?=
 =?us-ascii?Q?t8VcGY5NVkhuDYbhiAUaR8Di7T7h7NEw8fH4Vc4TaY8GHvgGTddGot9xqjB6?=
 =?us-ascii?Q?e3oPnVMmA4SWxADsVHTAci+JsDI3Tme1bb1zzy1rv56xu2w827rYk25kj0oH?=
 =?us-ascii?Q?IgrFauadEu4its6Na0HEIzvvVkdK24zMKNbn51vtMtNH2U5mNIjd+Jdq23Cn?=
 =?us-ascii?Q?J1goPiZTJX7xyA2hZRrgfzfkkSfMmt/EgPuc9gIhvRfsELF2h78Th9V7Oidn?=
 =?us-ascii?Q?vkoYfiYvYplog7dyL9oxNQcyQRZ2zG6ylOA08li1V4hxVuaxRXt7eyYE2DGq?=
 =?us-ascii?Q?N57aoclQl7i/34nIxDJ0FNTctABYSw4OkfDL4ZeTxRMkSbVoX6p5lNxgAmVo?=
 =?us-ascii?Q?HTjkn6v3zYHqv9U/BuJHYV1zFoW27B1V+od13gmEcl8W/w6FaXQSfnqSO9Re?=
 =?us-ascii?Q?fKQpFJMcFTqwjXDFcnpDP4xXeRahi4oJ4RWd3SViNJO2kOJN5d8hjswYIT1J?=
 =?us-ascii?Q?4RmbBDcP2KMiAJnfZn2wFHqFZPpFdWX2fmkXcxFBxnXpi0j+5j98R1k+RkH6?=
 =?us-ascii?Q?B9TQNyWKvH8HzNSXq7gsml9/6A64ilHVE3GMP2iYvST3OuuMNv9mF9wYU8At?=
 =?us-ascii?Q?Kxh0VWZpRSlqf87tfPnqOfBe3wkZOg1h3g3rIhEOPh2gRL6vQF7Iq2G593/Y?=
 =?us-ascii?Q?mEQgkIu5B+bNs32IpvK7NjlWTtlpfnXe0dAxPEmJOvi59VBARrClkQRy9CnZ?=
 =?us-ascii?Q?VnTsOSDgtbzlNrRhxKDOgW025uk8ctdIhFNe/afUxcv46AtTgwFQBtWV9Bq5?=
 =?us-ascii?Q?qC/tnpfEw6ZtiDFv9alP1SJ/xc9etP73Sd+BO68xxMi8cl359Ye6KKFL+o1F?=
 =?us-ascii?Q?to+vxQnTTEMKNep32hSdfLd+OwYwzY5Mti83TUdydrprjVUEBYhvOMhLwOJb?=
 =?us-ascii?Q?y/SdwBFGklzoduKjjkhfYQRFngv0QHAPcL2ReBzwOjd7BOeSQv96wGfs/E1b?=
 =?us-ascii?Q?KHy9aW+gnlLzaEOkFkGx7ZrkYt+eG3iVQfENnKGPmBeGp8klwjZlTWSUTq+1?=
 =?us-ascii?Q?HYYL/oEM5mXm7PpwNxmpDXhEkQ5K4Ip/dyBoxZpoiBswUI61ltORCzobakYZ?=
 =?us-ascii?Q?QEXFrGCmptRKvy55a8PtL6x0jTAJp16Z+ikTa86oMeN5mLcpgqtSfCnnJwv7?=
 =?us-ascii?Q?whKXM9PZJqF9c6wycqiawx/7EN29HNd5GpY8w6eV0A51onKnpnDuujGwD1vy?=
 =?us-ascii?Q?UyESrkh0L9qQKYUy0Sur59XFcjOV9g05XpjsTjoNX1bUuIR2QaG2MpDTwpx9?=
 =?us-ascii?Q?Qbl+X3+haNTCcvFCFDBG9GuBKeE8K2R6+MCIVfld/OGzpWKFsRUqYCxsYLD2?=
 =?us-ascii?Q?hXKtTkTwGOePIwbce87cg30/2PcBuCVdJsDwXRtM2lOYwR0wmId/aqtu9x1h?=
 =?us-ascii?Q?pz1T01F0DF5YWt+EulGyBFiLEcP2D12cfmTwuREgke5Oyu3KBvUovUNitgnK?=
 =?us-ascii?Q?M2qAzL3BqnnlNryWRpIFivkEl7Xp18RSFtopo3iRntdFl49IHa5cPs3z6Uy+?=
 =?us-ascii?Q?B7xQYMOS3hnm+mUXkIYk+Z/qIuoamJBpaCDYPoF6WoXy0StNbcBjzG8GCAFf?=
 =?us-ascii?Q?fcp0bosA4A=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08fde5e-890b-4a0c-9053-08def535b850
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:13:40.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PIRxqG5jZr5CqyPO2zBgjNpgMfxei8hbY858uVCembbO8NxuWJ5AA6ymBtVoO+SFr/+PhUoKTMF7GBNba44Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053

i2c2 is brought out on the 40-pin expansion header. i2c3 carries the
board's audio codec and also reaches the header.

Both run at 100 kHz, which is what the vendor devicetree uses. i2c1 is
internal to the board and carries only the PMIC, which is why it is the one
already at 400 kHz.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 4ad206f5a9d1..58f7276eb557 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -260,6 +260,20 @@ ldo7: LDO7 {
 	};
 };
 
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+};
+
 &fec1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
@@ -367,6 +381,20 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL			0x4000007f
+			MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA			0x4000007f
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C3_SCL_I2C3_SCL			0x4000007f
+			MX8MQ_IOMUXC_I2C3_SDA_I2C3_SDA			0x4000007f
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x41
-- 
2.53.0

