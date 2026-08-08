Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022096.outbound.protection.outlook.com [40.107.40.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000C2D7393
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183981; cv=fail; b=gz9A87tJHmPJUFmbKHu4YnB8iNzBR2fVvEhCYGOu83x/+1zzTaovMwZVw44Mog3Ua0J9Lo1aC01LH3EUWYPFieW2JeJEIs7btGG6RCOP48dGNAqksnPkggZhvZMFWupKUMcLVhOKaawE4rYZ0SbW6riQfz9M7v/7pqfPjCZucTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183981; c=relaxed/simple;
	bh=hawGu5G4evDVM8NhGQdxGIzZI2wdIoVnDGYbLw1O8KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDWKl+1AcWu1T1gAjCXaRADGyxVZLSrSEzFG4ASz3K16PJWIFcPG4MqmuD13P/hQjXpFTvO4vkgllvhhw7oVzwtZu1CMOtsnZRxQNxnpm4leVVlPEsAfHEZV7eNZWqW5/BRfymAixNfa0p8ISnWGlzstzYKPPmXl+cWRiW962MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=WAH8XzJT; arc=fail smtp.client-ip=40.107.40.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="WAH8XzJT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbJPB6K75Mtn8QHYl3ZXg2PmNjjXgI1+pKi3m6KwFam2S6cMBVHtHzQQmwYpFiMQeNNNES0R1B/qbJA9i/RhYJBj0CSIvgmeuCBaW9dX/pERPjSMX+STFmmItJzN4omdGwleDohiY4EUZIShmRY1z7GCcGLKyAQ9Deg9G9hJ4/9SMtddLdV5LI913o4Y7a6p/GoDgiNMVLiOHcBDZ/2hHOfrFMWhsOdEkXwk/5mq4Mqo3AEzWNQ8PQ+EKFK0LE2bQjkOqtqBza8BzBAZIZTDl05GOhgbK3Ldqujvct3vH/KPOqY+74kaCX0WQS5wZVGGSqzdNQk23YzZoW4o4bVMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xB1PqqKtW+InLTFLvgyxq7SnBn+1bLkzhjZJTc5N2g=;
 b=AnZAYZXfsk2FoR5IG6LWW6W1ZF+KOmsfgta1paNVyVzf4/Pse2eYnInFmF8jRGTrDR2nddNXaBFUZdPnrjim8XbL6fFLc8LXijWdFyUOIlRhTSGZiKTPzzeZeU70f7ehUwPKXcci9F/aPA2+ZWu1bJHHDGUKRCpPVvlQsgKzOOaeSFa2kJK269hS68OzL/ervI05/2ykwEZZmDl0TQL1NPXlxz69SHrzBjNeS+hX8GQcbVQHWM/jT3ArQIVd+nnFjFJZvXTyi1MtnUkrzISSkwy0bxzEUrB2H8WxVZukSEnwuYHTMm9TM2pKKGtpJL2yXhX137DwODBozs+pqcbtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xB1PqqKtW+InLTFLvgyxq7SnBn+1bLkzhjZJTc5N2g=;
 b=WAH8XzJT1yalvG6GotsD5MhgORj1fV6eeDcVpC7vaObioE7h4TMah8G0iHgcUnicsAy5pHClQ/3DxyFjFvu5MkMTs6BEqjf1hcCUD4bpuXmgtUfIXgGrDtVwF01Fopb/jVYTtxo9GN1rzqVvKDoVgtTvce/F4bJdpnzEvZzoaIwNnQiXd0YBRoSO3VCnf7K2zWdd9j6KU6gggCZJ0PlX0x9bGDw6VYYlTfoi5u1nLNal2m1gfwAE2EufTBHgw/gNpjVszJ8JkpqJVsEoIHlyxE4PG3dORGPbje+hHhXiIASjUjMe9cw0bTf+FpkKRxUAKuZyT/ZS8zsf7iEU+xCzhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:12:52 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:12:52 +0000
Date: Sat, 8 Aug 2026 10:12:38 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 1/5] arm64: dts: imx8mq-phanbell: Keep the GPU rail on
Message-ID: <29b97e0542a825ea957167911de12fb2c2fa3d71.1786177290.git.rudi@heitbaum.com>
References: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: MEVP282CA0065.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:202::10) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ac7c8e-7522-4066-5d8b-08def5359b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aifEVnmmNhDPLBehQsR8q5aUbebo7gyXhybxDKVTNA0SkbdEuV2riVppOqZvHWlcAGB+brMKMUKCkjK4LLVI4d8pE28EC47GWKKAOkxyDtEQvrpcpxVRBJfI+CXliRaTiAX2+e3bfCf3damvSqiSKxd7+yuFmZYFc9DxhMJZ2q1tlfi/9LquTbMWkxCjqTT7iKx0p2jlbxIDmWPeD/2Nry6FsVlaZ4L6NDGrJWnTUWP/EyrPF86csFHPCbSqYiIBnxT0zuskZXxXvJzKeBIXgxePLR4tlULtsdBMvdv5jZjCqqxgQOAzuCLUzvgQfuwDrEWtoFtbhpyGA8ZnpoU+AjzJOjJMCjo3ojVQRgEg2KybUi410MBPbuBBDY7YgrUGS69w+mWcffpyL9zcCjqfjDoVms7FdrF74SzFO5ESxrqEpeWtlb0GBOhBVEszjw9MtJCynbkgZLi2owU6dGjqM1vr/MqjXwoHTKsO3gm6vywMwzbhOOtiJ0G5Ina8oPBAAgJdWb9tqLE9nNV+Fo3pCu8zYode9bCQmZT5UyGH9AZjS+frc4L7l2c/+QnLJQ4Iz5GV2EEZsd3zd6sWjRyw50jxhk+UM11PO2jReiFv+fCPr3Znzcl7W0+CLXnP5pI5JWv9S77gr45gonDVEAzj4Lq7PJo8AfXqTL968Hz1YHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0rvUbGqOiDsURSZvojJEEa7BcWqg201PpihJT+DPphiUkPmxznzX3oALPI5U?=
 =?us-ascii?Q?RzgKGKw2St3lH/44vdw4T3iKuiTDNR7WPswmvoXThjU9MREvg6jmSLj5HOE8?=
 =?us-ascii?Q?OtJ7jIY9a1CN0naBjLbKmx4EBfRLECw2/Jpe0EoiPGBONO0nv0cBNBcIAOT+?=
 =?us-ascii?Q?kRq6Of+QZEcjwYH6s/g+lXzZiRXcd5QaR2ufeciWuSA3bIbG39xCaodzfDTq?=
 =?us-ascii?Q?XMjUl4HbARjeauVHFVUhYKecJhAbyrIbMRd3KGzJdVME11zk8g5wDUzpqqhY?=
 =?us-ascii?Q?5FHgYJxDuNyuPlSPD9jJNrX0Bfjeic/cjV89CJn1aVmye/Atwc+xiz2cQ8QT?=
 =?us-ascii?Q?OQ8x4cO2EsOvkCOWqAkkSCFZiJiDxT0QEHrtx8ooCJOqu+ud6rD/cbBk5JSd?=
 =?us-ascii?Q?nl4G047Oh43JzGnjUfK9Ia9D2P0hic/Kq5+OZe3osCJTjkaI5uSymfNJJQn+?=
 =?us-ascii?Q?VekUIa0tS1tIN1UOYSPfWDZU+0jflySEsZ+SdPFzw0DNpgC+6E5ie08YY2Ty?=
 =?us-ascii?Q?2h0iy2emBwy2iPL/oyvuEgQLZEm0fNxDLzXAbe0ltmPGSKMAJXNmE9kaiLWj?=
 =?us-ascii?Q?4fwcaBpdgAuWRP6u2Ye9MhWrL8QWS7dOQi0pdN3cUzBEYlQhRz8aBqBGC5KO?=
 =?us-ascii?Q?kS+ySiQfmxuPWEsAA44tZ/LTOWkOW81sn7MNEjqJHg0P/LB6u9Y+5twMf8Wo?=
 =?us-ascii?Q?uc3YgCCxFfYEEf+Gts/OmeQv/v5i/SQmpIyCcc3uw8uYwf/cOiTWZnqId3eO?=
 =?us-ascii?Q?NXKnpaxfMldyh4wgjbBtvmoJ55tHWbQMf7JOsRj7HvsKq48Y55mgKGEuZhKU?=
 =?us-ascii?Q?DFCjZKUbpZqIcM+ZtJgccKwYsVlAoiM5EDjHmmBtlfnZeTuUhncYLIAQYhHs?=
 =?us-ascii?Q?hXxR/hMIxxktIVfx5c/kqsr5y1P1AydfKMU/tZiy7DHJlw4BKo7Yr2pRnklB?=
 =?us-ascii?Q?kHL0efo8I8X7Ib4My0YL9TOY52tSaSRwit32mC1GU3c8ivxIFAEjXtZAXA2z?=
 =?us-ascii?Q?pzq0b+ZPqkb2ciFh99oavl4iJNcilFGwpJHpajGOIfOlnMJnOjl2PmJBG5Zt?=
 =?us-ascii?Q?ukT11YjcMDjgzBe2zR+Tc8nnlLEsx4ClfV5XiuOY11jk2XYAJFjDG0iHCXnW?=
 =?us-ascii?Q?nCYykcrzknyc3KSrlEZ+1R7x+FTOPIuuhz6HNdGNzljOHLxyZwIMlFDC3ZVG?=
 =?us-ascii?Q?rCGWkUAqKAErXh6nytatBmM7bVIGshrOUXIBJj2Jd2kOOX9COUCgevrSCdJG?=
 =?us-ascii?Q?2zzXiyddFlsNFsL94pPUw5N0qLED4QRCRt5QBV3Ob9iI7UBmHBarvA6KbqEx?=
 =?us-ascii?Q?srZPNkF+R2v1b1JTeRcecMRiAxcOKMIh9Imj5jJR7o7PKksNdQ+hAgaVo3Ti?=
 =?us-ascii?Q?yrZB65PjY0MxAi9iUB4t6MROmXJ4O1M3w6iAGmMAKrUQveIpCy2KMHWzYf8A?=
 =?us-ascii?Q?Vri/Ym9Gx830mulwzleIMp8Or4GAdwTwGYls+lZPHxRHy30CsqNRS3fKWY/i?=
 =?us-ascii?Q?7t3pqMQhIZxcwg7PWN7xpsRripKoiZDSbr0ZeCiFQz7TuRTHaAxxpTsQP02h?=
 =?us-ascii?Q?8mLvcYqpiBVMgP3rKnkuFgwjg2dxqxh1mf0ysH/HyWClT9CRxCsEyqy7oNF3?=
 =?us-ascii?Q?WaZaAoxbh2gtMuPRsZDoaee1iUB7c9VmlR/66Wt8Lecn+VwACNO5GuJMJwhX?=
 =?us-ascii?Q?2lls+0f+aeoEqoAe+LF5R5UvbZktLOKZBTewslOWWgZ1ZILlHrNrcWoiixgg?=
 =?us-ascii?Q?E7EUQlaPrA=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ac7c8e-7522-4066-5d8b-08def5359b88
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:12:52.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQGRQS0usF+/wktOQkktNvzG08IfZntZP6TggyrwXMe4i3KgfAco4OlpCfnMKesWu2uveXzcZJojpya+NcmpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053

BUCK3 feeds the GPU rail, and unlike every other regulator on this board
it is marked neither regulator-always-on nor referenced by any consumer.
Once a driver for the BD71837 is present the regulator core finds it
unused and switches it off when it completes initialisation:

  buck3: disabling

which takes the board out about thirty seconds into the boot.

Mark it always-on, matching the other seven bucks and all seven LDOs.

Handing it to the GPU power domain instead, the way imx8mq-librem5.dtsi
does, describes the hardware better but does not work here: the board
dies silently the moment anything first uses the GPU, in roughly half of
boots. With that link removed the same image boots reliably. Whatever
goes wrong in the domain to regulator sequencing on this platform, a
rail that is simply never switched avoids it.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index e34045d10a12..c06a787a4013 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -156,6 +156,7 @@ buck3: BUCK3 {
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
+				regulator-always-on;
 				rohm,dvs-run-voltage = <900000>;
 			};
 
-- 
2.53.0

