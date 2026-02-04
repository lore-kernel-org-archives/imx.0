Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FD7285404
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172283; cv=fail; b=fOV5DANHXl/Dnuq4jrxTKJmIcmLWzDstJA7+LWwdfAMZiMo+4nvBXajkqgD8X4qzGdzpd2Kf8bZ8PsnqlY/JJMf31YDGmAJgoGbTCysdniLoiQI+tV2dMYx0Og67Ky0WdT2LEAtvhZDb/+0C74iGrx5iYxm2PIiUHSH8dW1F6k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172283; c=relaxed/simple;
	bh=WMPrdC45r7FbdmFjELaxdEIXJa4UrUTRmXDFxQTj1UE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tjkxN0F5MDllYHri0Nh4XVvX9koYZ3Fykc06w822YVVKOqqOaSEIL9gfk1zbJ9TS8k+rQJLjbXy99nVflR3Zs3/gIB5x8rFc9pF6u7PEzrbZxKUJVWjk7/7bbJZ/hzoRoGwQagHqbBrKXhFYmmUfUM61g4pXB9+VdwJe7niNTBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HbccU3KA; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HbccU3KA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVBhLZ+AbQ71miSYXFNJCIRbonDMMhVGJ1hzxarADexL6cWi9mGQgsGaVUdQGBfmlGHJbTzRQi5aRtZLJ5tyvJDKsWHw3cGBAUXa6gxDHIddj9TZZ6f9TFTZ7h5l/kZL0S6gTG/0wdlN2BEySJud9ofzrKk+ySdPFaYVu2yNC3S02DStAJRIVUX9NKO8w+CnXbwDOJEdgroh0yroBqiMEXqVoSnIyw67yaMkSHxVYRurUOy9U8tGKwEg/pgLwoH6V2rjyDGKJ+f60WKYIoDrK19UNcP1v1nP4oRfiAmqom4QWdgtvKBp9wPBJlQwAUell+n/54r4m9aVA7MF0qpNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYw/+AtyxvVT0CGr6I/fWA9U3ACeOvTrSzZ+30BOs6A=;
 b=AzZw4k7j5WR1AT5Ev7CFwMTUW/tEviE2fpRnTUikjwybDkyxN5oYGRLDMLV98LC89rLESKJMr6NshmkvQgO+1BHcZRo1Hd3s6xBGPaqF4l1TDzsxREhoUvyeE0WyUy0kMzoIQGUocysPH0lj3HblEbzGTlaqyrGzfTYHVAuuebZVh7Ifcw0oItFH4Jmoc44hLrs7hi6ZrptxmZ3iJZs3oRObVBXON2tAN9od1D+YVwAJTXhnHy8vsMcDu05IRz3g9ApEn5V+QSIp5i3IOVzKRlV4UcTtcBtkX4D7xqy4Ea3bIvHJdfydBrd4AqT2wEphmY2s3mT0YQMUVK0a6g+ScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYw/+AtyxvVT0CGr6I/fWA9U3ACeOvTrSzZ+30BOs6A=;
 b=HbccU3KAY9QzFAGZOXOnb4G8NLGqwOoxgAA1aDGBKhID2v0cYtBDSIAR4KqTv5savU3w7nie/dko3t7yCFSDYm35rknc0ok9UvG1MPjCf+pY5H+FB1Ry5H4fGwWuYSCAqm9YeHUKlrDmJ/EIz8eyR98kIdMz74vMQytrJSnzr5uDEJEodgH886KliO5BuL7p7ieGqKFX1RB6/dHGa0VAe3Oca9HOubAFmziPQXVhZT65DqjgugwqIpUpV2ma+Q6NXqBwYG0EoS04CNIWnMnpqpaCJ2svWiLjwwmsIr7uNudqBY0CqIfAAI/36FreMXMpvJ1FTzkQh9bJ8ZEltSd3tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB10432.eurprd04.prod.outlook.com
 (2603:10a6:150:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 4 Feb
 2026 02:31:18 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:31:18 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: imx8mp-evk: Rename PCIe regulator to M.2 WLAN regulator
Date: Wed,  4 Feb 2026 10:32:03 +0800
Message-Id: <20260204023204.2382433-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204023204.2382433-1-sherry.sun@nxp.com>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB10432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3586fd21-ba41-49a3-d0ea-08de63957a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zjX/0MoGkGgPohA62dBdGsRHraHwbXLnXmXU6q2ogcJDp/bfdXhBXX7mZzH5?=
 =?us-ascii?Q?KcZrMWTUDIGmJhhhSnNYpQO/qof3WJjm9a2AX88PTcBtnq/419bLebtxZMPc?=
 =?us-ascii?Q?UYatAYEKsgfWQND2Xo35SNVAxHC24dMpafFDa9afMxMrVCVAq7mdGGi3MGLn?=
 =?us-ascii?Q?u85PDKllwwFiJ985JxO4pca4ACx6+VYciAxBY7+qEH++HGvgfLuxYXXIQMvM?=
 =?us-ascii?Q?Cyyo2POUdKfYYYxR5ENZ0qkSe63aX9pUjBPGz1YLpOk7FoZ9deMYyruI9K/q?=
 =?us-ascii?Q?t9IRoXXIP3WKrDqWyBbH82mJ4kpZ917QlVIC75X4C9y+YuptGGG8c7DvaxHg?=
 =?us-ascii?Q?P6aiLxdNhVPbo6dwEUEXk9Kzkv2UXjTxsDBxfN1cVa7Sa9oKJpct6u56FMW6?=
 =?us-ascii?Q?zd8YfwTYePlHOQWK58UuRX3VGX6R20SJnh9S0A++ZXoEZDNpyCvFTTBkywED?=
 =?us-ascii?Q?05UQIl9dFdr0uZbZjlEg9A6/8Gsq72kqOmMQjwYx6JLJdueh+AHJkbDG+i3N?=
 =?us-ascii?Q?IMgEbCqqWCv1cjSuMPKMr5QPBVSuG8nWSGqBVTDFxVjj2gDMWTNF9vvZnHca?=
 =?us-ascii?Q?AQuP1l289XeHcqzj2iUsbUkdGg1Ah6V4KrW7J4RAy2+jWgp6QwMC4iKT7SdB?=
 =?us-ascii?Q?hYq1uDszK9c9OGmNavGMctUNtYtaeM0U/utOSOh1pNDXD+f2lMi1ufsp8ulG?=
 =?us-ascii?Q?UYFX06nmJr0QIy5MBwkbvDObHp3jjk3uLvE6OCIqz2BqojSF38N36PEm1gKT?=
 =?us-ascii?Q?XVeSO5z+uYAlPJ9oZOcJrk5gKMtFoneDWsB43g8PWv8PlnaS0aCq/e7q+N4+?=
 =?us-ascii?Q?wYvDBjQIWkKS+QkjZk28uGxKmfbdvRt1JQ7qdnNxWBRe1HOL2ZPh4J58Lq6n?=
 =?us-ascii?Q?zDXOHhAUq1HZf6FrZWqf3LJO7VhhuNomXuYaziz7kMkNlFF7s1ayHHQb3Q03?=
 =?us-ascii?Q?O/D6UVkfrBg5mftGlRJIMu6oHokrnKxYsIBdNuYQ05rx5BGlW2MKYNphy0Vk?=
 =?us-ascii?Q?esjP3okbF210cdlpwdhVU2KspS5ZwWHcuvM/pTZU1GdzGtIg2OZXJeru/qSk?=
 =?us-ascii?Q?tfir6+Pm+0LobGEvh9ZN4B9O8ZPmpxeU2dkhs/OYlZlHZ8M6ySEpC1DzE11z?=
 =?us-ascii?Q?gUQrQ97bD7o2S+KeY8BbIXIztzjUdOBWwjYjm9yltMlibDEwm3NNrjhV91Jn?=
 =?us-ascii?Q?45J2X4G5Awfe/WvXmz9fyAvsOMa3ru0odY3Y0T70Anw4LRa25rohDK6y7kSv?=
 =?us-ascii?Q?vispziCEw44CPLaDzr/lXmL2s8M9ArtadB3I6I+985HP2/XO0b1mWChtXfQu?=
 =?us-ascii?Q?nA7YAHTQAv3EufQmiVoY8wti2ytPbLkNF5zgP7XKm01KlAcCs0Wiu86vApA1?=
 =?us-ascii?Q?7nIw20Da4ix1jN07ky/T1sYFqM4ijNK0h0xDb8bSOoeRqt887fx+R8E2BI2U?=
 =?us-ascii?Q?XBxCBsY/rFwh7skA3Za2Jjh8R+W3EUpdeZNSjtIZWth1b7DUWttLwWjryjAV?=
 =?us-ascii?Q?w7rv1xYJIikn/vfI0MfMrSfx6nRLzUFvDeBJhtQmukq6mA/K3M3LUnKF8Whf?=
 =?us-ascii?Q?l8rg+UQgTcFZilepZvNW0AcCVrm8kE7Jdw6wYjm6kAUuvkTLL87wYVktqGpS?=
 =?us-ascii?Q?ZvObVasXIXvSPX9LYwQVer4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gl7wYVvJfjnaNfiawS1szJwn8S1Tp3MW0BAPZmsT6WsiNsrYy0njETD/hl1R?=
 =?us-ascii?Q?+0enAnO6vu4vn6oSicBOr3NjqQxsKO2EX0rDv2N7ZSzwJIEHXRg9WgOTqRE+?=
 =?us-ascii?Q?kJw8Ag9LZj2joI6CEbMhfFgHmEInmE0m6UVhwvCU9ohDWajx6i2f/UlmMWna?=
 =?us-ascii?Q?RKGtktQ0KYpfKRZtiuh2nip8eOZ0hzOgK9F1jvko2HE4KjUlw3Chs0oWMNXF?=
 =?us-ascii?Q?BVaYjGcUaLtpN1CSDGGz8suIT8FegGSPInsl+E4drF9ESIvyk4EmPdPE4bGn?=
 =?us-ascii?Q?c5Vb0FbG1Oy1hbdsAUcdWtKVINGzTP9/ZVMHBrtQj9FKb7EtxHnA4BfNrdCO?=
 =?us-ascii?Q?uiibYj0gajEPrGSosZ3zQXEEnaWAG7S08Nbu5b4bNvjWDBYcKGQfvxURY46C?=
 =?us-ascii?Q?y2K6QYv8OY16EFb+maRpuQA+Q0GpCh2SfvCgludB4Y0v9Tu6clVNbndk8/sm?=
 =?us-ascii?Q?GO6W2HBjucLkLPJqV9Ud6akK249LYQ44gNuCNg8/c8qB3lk4tUS3fTDkQzpQ?=
 =?us-ascii?Q?+4fgTU8DbdUmaZiRaF4eBJ9abQWsie8RjeBdh90jw2tmyhG4rmgCBzvmJqtr?=
 =?us-ascii?Q?n+qClS7wevvhLL4GMatT1hIo+mmpSDOcd0+cARTr0t1TMgfIbFSYjZFper1O?=
 =?us-ascii?Q?BpUYnC5qA/ODtjR+PwesS/AXN9xVIYs4qvw/LA93ueNsvqx53qwzbYCGtSNx?=
 =?us-ascii?Q?DEkbloJCXV9r2Nfft+IACpvEqfrQKgcA9onrhaTFvmbGlmI50A+qE1c8w99k?=
 =?us-ascii?Q?27o7mS1VAOHgcbR64OrQ5Fvsbtkc3TvkmaxUvXkytv4DHo91+2ZmLr3/0YN3?=
 =?us-ascii?Q?wF3G6St7M9cxEkX+v+Xoq8XYhZG8qnRc9EYIUCfYsbSIoSyh+HI+NKCnUJmR?=
 =?us-ascii?Q?6EU7vrGF8zTaZcFod/nEWtwEBq2wP+lAQzjvD7C/K0uQU/hZnkRBYJaVV2RS?=
 =?us-ascii?Q?25ibCP7n8rqunwH/9z8kvmAWtDcJxS5rhQEp8+eB8daMyQ4AfKdVVbDxndZL?=
 =?us-ascii?Q?vzLsfbGZ+LCd+zn/gIOVummc88Iy/JCvl3mwQNuanQZpw3Kk/egKIEwMLBv0?=
 =?us-ascii?Q?FmDaXu8dFtCEK3Q0CJ45cVHHMjJrfX5tE///rxRBKqhSGCkyeQcpfE2ANgBK?=
 =?us-ascii?Q?julslrHfUV7xgyu/vWpyH5wIAO9GHYHjeRsl3DWWZufELGakPe7eMR70expV?=
 =?us-ascii?Q?5MCgWJed95RN64R1VLYW4ElsiMM6u3C5acDRQk+HLPHpt7bQ3yIAXnPgAEXC?=
 =?us-ascii?Q?ZHZGlYbaOWggWa9b19vvP7HWXaPpe0qq1cSH9INEstypZEPoHseIlxtJk/zQ?=
 =?us-ascii?Q?zN4gCzRHJMVLzAROOEsWA77hTZRVNA5E1zu7yfpdc+wsUTpoePugyw2OwrnY?=
 =?us-ascii?Q?L2LaS36d2j/P1vmvIOlNdr38Z1n9RxP564DuzxGU1wtdHvIkaLyzU1i6iPM2?=
 =?us-ascii?Q?4Zt2l/r3QFYk0wtKhUWYaZLtAujJtacQODAD+7Y7+uBVJRJ6GgPmpeBAi6pj?=
 =?us-ascii?Q?OjyaPTGPWVjvfbQWVk4+34eTj9CVQx+eHqb6cWsafFX7rxLAwrppjFN+LTgE?=
 =?us-ascii?Q?WItnK+zAnBhDgvo5d5+9UyrS2hb4dO60nbk5+JjifmKVV7nhKaDM1yGI1846?=
 =?us-ascii?Q?25qGR654OXBnA5E0laZsLdVYpQEurl+BeZMbsaXsOacHUbN+br1Fp6uJf3+W?=
 =?us-ascii?Q?pQyCoXxKFhbUe7ZFPWDQNKA/bdq0oecgviLwseEeLFz9iciVlTBg+eNwQO5n?=
 =?us-ascii?Q?v8SmR7hPTg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3586fd21-ba41-49a3-d0ea-08de63957a28
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:31:18.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrHnFFrfIW6ZcMt8rjwUa104VYpBOexMfL78DnnYuRVZhI8hSFxi4miatVkUoYZXww2bQy3vhca5qvkAHa0p/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432

The M.2 connector on the i.MX8MP EVK can support both PCIe and SDIO
modes. The existing regulator node reg_pcie0 is used to control the
pin56 W_DISABLE1 on the M.2 connector, which is also required by
SDIO-based WLAN modules.

To prepare for adding M.2 SDIO WiFi support, rename the regulator node
from reg_pcie0 to reg_m2_wlan and update its pinctrl and regulator
name accordingly. This allows the same GPIO-controlled power rail to be
reused for both PCIe and SDIO WLAN cards.

No functional behavior changes other than the rename.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index a1269c7a6cc2..f86d6b428a47 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -134,11 +134,11 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_pcie0: regulator-pcie {
+	reg_m2_wlan: regulator-wlan {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcie0_reg>;
-		regulator-name = "MPCIE_3V3";
+		pinctrl-0 = <&pinctrl_reg_wlan>;
+		regulator-name = "WLAN_EN";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
@@ -764,8 +764,8 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcie0>;
-	vpcie3v3aux-supply = <&reg_pcie0>;
+	vpcie-supply = <&reg_m2_wlan>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
@@ -1067,12 +1067,6 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
 		>;
 	};
 
-	pinctrl_pcie0_reg: pcie0reggrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
-		>;
-	};
-
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_PDM_CLK		0xd6
@@ -1119,6 +1113,12 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
 		>;
 	};
 
+	pinctrl_reg_wlan: regwlangrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
-- 
2.37.1

