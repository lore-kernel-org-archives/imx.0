Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020084.outbound.protection.outlook.com [52.101.152.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B413E009B
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109518; cv=fail; b=hyoQveBYKoB0/8lYsISMD3GlN0ZJtiVKAUP624flkC8kNhsGb/2E1RqnyapAatYx3Gs7vJJSuwtrHVopFTo0ktn4G0rYocMstu3Xv5QjPVtWpJqDoD/NeJiiwDwWbiKibvj0hcbJOgkSBbU8sf6ULWPi4ZWDpZXswiqcBowT+Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109518; c=relaxed/simple;
	bh=Q/Mastn3yfDqiqSfKGqoigynifZ/qGRfypEXgRENGQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pKxO8OhNV0gwuv1NAI4/q786VUN8ACs9BMkK/ye/r6b1e9wfjWyboA98fCb2CrmbSEOEWYftSUtH4HPDUc2mifUXqTdSbgMj0vcyjEhGMwIa2yMVeoGbBZ+/hjIEK1b0Asvjt+2x+xZvpYYpiLuGeVmCuEzBgNwHE7zD10qzuzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=52.101.152.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjaQxPxvom1lyq9BctfMSzeXjQhtsxKbMa8nABXoV3tteF8H+8Ltwz8oX7Fo3Gpzai49P4UPIS6gAq3ri7Frhk6ocPdfl++JaZEOjL+4JcPpLNB8bwVtdkx1/D44/OYcOmQAdafLFIPSTY8WhUXyLAd+Oa1hwepumCgrG7boQy7xDf2f3W3l3qhr+htH6LqD3cS9/OHxjvoNRzYqutY0dx6Kxgwh9Mg4CPvmJCJHi+a6e7r85bva7Q6+SNoewFJ1Ld+akSC1kFVW60YAo6dHs2OlQOa1XPrxz3HPOwBnKRpN+4hGBQXfpn+EfauNhpo3dignqe6BgOezuOZNmkkazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRtF6F1JXiCnT4LzQY/nQaeXVae1m7epZgujipJCM6A=;
 b=jFnn9yP5FOPA13QSu5UCySuxh9ei5jX/QFIMZvxn2VE1kx5X8Wk0mAsRWA3skdAuz6Y8FAid0XXkAigUp/2XRQZrEE8tXutPv0rtDzbEN7Xe1kJrOVa5I50D94Sp9TkrPof0wg0wQLYrh8lBR2GblPMPC0BLusVdWxLeE6h+shGkKcNstqfCCv6vPBp4RxI/GZiCIbJ8qDDjOxx9fCjMz69C8Tt9RACIZ4q0X0EbO5eKZ3vzCTFAHvjNfMPS1YVTYBj8eiUr1njn3cwfkVjERz/432xtAV+jE0ylrzflUXDXMejpIpPbjYkYI8qW7mj4ozIaqNZYBA6zZMIEXUJtqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:31:52 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:31:52 +0000
Date: Fri, 7 Aug 2026 13:31:30 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 3/5] arm64: dts: imx8mq-phanbell: Enable i2c2 and i2c3
Message-ID: <53d279af2eaa7bd3086366f0404fab19dd76ba76.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786107925.git.rudi@heitbaum.com>
X-ClientProxiedBy: ME3P282CA0023.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:f0::10) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: a74d0f16-6ce3-46db-3c92-08def4883d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p5UrnRZCbAzOVSFAUd93kXuDVibkQCExmfuL7j9pwWHtZGuuzqlhoJsmDvLXVipbN9cbAgL7bqT3+pgloBwkFEFkHHcofclPLP1q+CMv+NZ/X4Dj2AmgS2kF1SN0Wdzn7jk5Inqv3CKCoKJG0uzEZOYoZ2WVm15Zdhj1lvRXsEdUa83mZixudB1k/cM5HOlg0jIDj75nn6Lf7JO2V/VUs5sBL5zvXg+UaomD530dwOke7ovmFOxxovxzPXdB8Txz1baPE1GAVl4sp2j5eAMl12uO58DBxLyRju2+QMRbLjQ/QeWgO2s+9ELw6CO4TFhPbKSq1Zv5iQqRB7hfxMG0DwkR5IRsF6ShOyyMhTin9mwENZ+ji3TFHiIv+z56qePWjEaAM/gWlU4rxb1EXb34fOLJSui4TPbowQEuOF3UzmHTf1uOgKnVfxMcBsEv1dkdwCPl6Fxv48UvZyAxQSu4wHXkSnhVJcxKl36fuxCJwyDcDNOxCHmdqEJPyOdRJN6UvrWl61E5o/w2fT29goGRrClabNDaLJFQZmKGnD3hy6B1tRWbO+FcCitJ8oObijnkWVHruC2uqGuWiWpRfvvgt8GgQuDePAVM6Enjy8hj7T5DWverenV+rZpFCBxdLoIKpmFj+UOpDdOZHTUmueMYtA1cj9gtbj3UlfxVoooNwjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?837FF2iGN+vnilwFPyVxWFJNElS5ZmS1smKiJjTX3qgEo+AsdznFEAdxNIKG?=
 =?us-ascii?Q?NBOfIQyiPpyDVqz3/LnvCvUE3wZLF4yf5jk2OnRFzrU0CgAoktl/2Bg4t8Sh?=
 =?us-ascii?Q?bCeApT+ev4Ufy4CmTCgumUZEkKhzdukFbpAHkQhxXmNq2ly4oNPj05eFh7fd?=
 =?us-ascii?Q?FCMFrv8ejHf+OxHksygckDB682Cqf2gG01cfCV6Tw11spg0+ROKUutdfviSy?=
 =?us-ascii?Q?CkrHV7MZfDjQBQFcecZWQDhaU6sMcmXps3AU04iP3KT3+cb5rKFuCZbGBwYE?=
 =?us-ascii?Q?1YtCWuTOh2m5uraCpGl4eZMpfJWHMcTX2hotBT9LL5hD5VjzCUggY+rOiUOA?=
 =?us-ascii?Q?56NVa5Pes888W/RZ9blmbksthgmJM4zUCGbM585OtsAZuY2j6PYrqfoFULEC?=
 =?us-ascii?Q?tsoMQ4vYuLTUPbQOJQujVGIakii3cF2EJBRmmyZFRAnDvetljANBmrf8mPqo?=
 =?us-ascii?Q?+Q9L+pOWSa472DJuD0BgGpj5ddef18TgsF0mdspuAAbhOC3oE9VL7sx5YiCq?=
 =?us-ascii?Q?SbaGR5DUkcSp2Yoon6J/lHgkuih7bQsM6nZwOBaHyifeiKUP4ZS9GiirZ5sq?=
 =?us-ascii?Q?kFq0Knlj6JIWsQB4aVHSyeXkZI28JN/g6piiwyhQho6KwrqVWG3+Dj0EVlwL?=
 =?us-ascii?Q?DTBvQ8ZYOtJB9oWWK2BjtwbOi4Qew0JycvEEIfRMn5o8kYzaW2igS6kS6Qd5?=
 =?us-ascii?Q?l5uhZuD8tBv7y/AfXr4FZwz7N6S1NWneerNg7RN7Ffhy4IE1/MUzXshnAyq0?=
 =?us-ascii?Q?yUdAkMU8H4TYN1TT1zL8lxTf9L9iSkYT6MeJRtbgE5Zg15o00nTGs/St12oZ?=
 =?us-ascii?Q?WFquVgxYnJTVei93PP1HXuQ91z4pfiJ2aus8+iASwozjnfGKl8+q+Faz9kbI?=
 =?us-ascii?Q?1B2UdqhMqCXl+sDUoVrly+/UqJ3mWqa01OzLRnmMKetA3VS3DM168HkvW700?=
 =?us-ascii?Q?DqbSzEyqTzL2RvUTWm5EYHckpnDzHqtPEWoWOH9qVT77REAzUaDXbxjXC55d?=
 =?us-ascii?Q?+00B8NaaXdY+GrEKpVP9BD3GtgLwncQv8NXfkHhSfqgwXikw3/nNSbXrH0CY?=
 =?us-ascii?Q?8FG3aakuwKbBSGDBfLtQ7g2T7imscLR1dSsC18z6r6HCllv4du70xxDRWg+W?=
 =?us-ascii?Q?Cn+nljS6ZjFdcJCyq33B+FoHvzMKwl8/NmuSr2tIy0ryZ2f7mwPociFCtIix?=
 =?us-ascii?Q?404QnmNeQrqMp0fYluKAhp0sjolx347mkN1p+OdcS5Ppoe0MEPs3xCLAOHIs?=
 =?us-ascii?Q?9aazF6bfEAFfT+Av69eV5T6TRajQCU5jiq2u+Ph5o6JgP+9u25LvfbYazFup?=
 =?us-ascii?Q?cTeL05GxzZa5/SH4YxwWtyOeTuWDbDsOJmLqs7x63l7kiQCIwkfQ6v+9ta0+?=
 =?us-ascii?Q?yOosJmqFFZJdIabJC2lcDlA6tTIGutNkijUPwB29WYaDmJbh3XdNvXZ2Tx5v?=
 =?us-ascii?Q?K4Z9E0O5Em0I/2Sve2or6itf8s2z08Sm1EbR+VPgEig08Q9JFbfbedT7ADnm?=
 =?us-ascii?Q?CmvrJCGCX11jGLzg6oRJ0XZ+ztIiqm9vw/7libWLhyG5zjaKI1PIoEyyeaWl?=
 =?us-ascii?Q?BFZHOszW4RZ1X447fzQG65g5ZSufkHW8MdO89aosgqTsa1uHCfarUlkftP/V?=
 =?us-ascii?Q?RwUbf3boBPDVxF7rrU8S4wSKBf7Gn96+KYGkQDyUpU7bKnaq7jlQNMpfeDrq?=
 =?us-ascii?Q?0F5aX9DlGilU7+tfHffQ74eBlj97me9H1h/Avgu6waKSASs/?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74d0f16-6ce3-46db-3c92-08def4883d99
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:31:52.0425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zn1Z9g8VtrAyUJDmUYZjYW5HE+xvWY4Ss2BB6M7UlLEcHJE8PTbZZFGzKF3IfnkCcXnb7K1hKRH15rxrbVyhCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978

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

