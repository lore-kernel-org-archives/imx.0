Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350D32863D
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461570; cv=fail; b=C5p/SRO1p39/uT55xapldgFj1HIrd8AJ7VGLgbjEn23Kp4FodVuT/spvTHN0JttZ038hHmxZsr2v0GWkdHaqvhM2Vctsq1+KgK9U+NEL4JUwHJ2XtZQdQt3UJP6ZPk/4dPV2jV6Jbf0WD6jwjY9ZfUxnAvHYBeQPCjsebvKb3I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461570; c=relaxed/simple;
	bh=ocfURwZvL39d1S70Ovgzp1cIqZGHE6nFxr2o1+NFHRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d8DZ404Br19IdUog0MlQP6Ezp+BffxgkxuWRQXlbkYK4OR3HeCpezh4SNf8W/FqMuJFlEF5ZSuBDSzSRgEyaZIa5QGCkShWJ1PviQVBXA3AlM3/zp7mFSrh0LQcCHgM2YsZ4n4kHtQJ2ubVcrFK5uwdBn/R7Dc/p7gkcvacRIhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FCAiqDy6; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FCAiqDy6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7pgpdpVS+GmS8FLCErDo8BUNvAeOGL/YrUkwF+0jxQFZrZmeA974goZneJNNacwsukmdx2eCNB371oki07wgG3v2gCCNbq9BFDcVkNDRshxnhMvusdjmTc0WhjGuI0uV7a8Oqo/+JAJRFZFuP1ORjPeOE7IlUuEH+tF9znycJ2eqL9BsHpblD6nHwhbSJfKkgJJRpOxDT0EYd7vkhiIO35FY2zxFbUoK0Xmfb+NDWqbvUiXOFYv3rtzNw90Snso3D8ZpvolAntoUhI3OQUaWYH9USxVWdr+UxKuqOcaPb/L/R9bw/2Ky65ioBjq/d5gv/2tF79AlK6QBII6Q+lqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSiL+0Rsw61hKFNYhbENEx0/lOLStHGzZEheFsmmGfw=;
 b=ymf6SoavWqOW1p326YSPqzFGxXkGvptxwZVw68LCrBa2rQ3cAubuCJsvrlf3PEzMTn2Er01x83hhXZTLRFfv90krTodIRQRrsyt5K74TPldGWlBEcvfqtTU9p/oPqifwwLqISfeheWTz+HE7sxoFvwU6eUKrdoZSdTJLnWKIaDXnXhvipkpYTwRzIjRQ53TxKIrlVH3edDkZWHG1hgkQ2uFQy1iVXOhGjPWGnAs1N4eVgSVdgTMQymfhcRJpDOmQd1jC+4idSgR6+w0A8Il9VoA+gOLepniy34oK7cUecAxtGms0zoYPYSga/6bSx6oV8587RDoKJlvRThDqBy2twA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSiL+0Rsw61hKFNYhbENEx0/lOLStHGzZEheFsmmGfw=;
 b=FCAiqDy6DB90dBfHQylths1JUz5wuu5JeR392LY+1uxkqsdCvUE3pVMzVMq+7VDh62fkMZG4zqKMy3jv5kbH6GuCRVOeQ0OafITxoTqqmB0GvmDx4Wdxocj3HO/19GcT83aKQ+/N6TUDp6Jfk9y4Hej0LIpGXMjzTsanTsqpx8io9UknY7iEcseFuhpGoV5Ld2eGRcpJRaD9G+gFG1bGkUm5J61S0macCMdG3fIde09Pxb/OzcNe5fKSFXV+0xoOFniArf2KHR5e6bYl8NIToGhhoFTxzssvLYp8Kcc9zFwc5fFHKSpxozsYqKn6QKiRFjg4B0EE1+OZYi7QRWQotA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7322.eurprd04.prod.outlook.com
 (2603:10a6:102:8e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:19:25 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:19:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kwilczynski@kernel.org,
	mani@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: imx6q-apalis: Remove the deprecated "reset-gpio-active-high" property
Date: Thu, 15 Jan 2026 15:18:14 +0800
Message-Id: <20260115071816.115798-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260115071816.115798-1-sherry.sun@nxp.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ddc384-694c-4538-8b86-08de54066965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gSqiuwf3PmyGCZt0yjiqjCWy9vUncA5lnfCB33oe3Tj/qOoryU3dpAM+3g48?=
 =?us-ascii?Q?4HMOCqi5M4FBLS3f0XhD1x91Vmk9fS1Tf+xalYIIzmuR5tDex5KJZ/YMPGop?=
 =?us-ascii?Q?Gg3ItSI7aP1UDy36RLmWaT2Tk/v4RUEOn7P6AZIPNc4uNxmSX0AbAwHCFQD6?=
 =?us-ascii?Q?cLxHYotuLGF2N4VL+SbeyMKCOWyfUcf+5pvHfAAot3kcE1AjC2PbvO5cxELy?=
 =?us-ascii?Q?53MRaEFaPq4urjlj9Kr79pNKOCNC1E6FIlesiS9Ap4ag87fmX7t65VWFdVzw?=
 =?us-ascii?Q?iD9PbwtX1O76eYqJvdJkCuf4X+7BOTs0kovakHvVlUvARg2vcnyuP1C+CTwX?=
 =?us-ascii?Q?kP067UAAdGwMP3XIDsRe/3mNbb0+4ObXYvdufa3tyvUvEsDhqeqAEtXF450H?=
 =?us-ascii?Q?4JTFSxs4gyjK0NGLWFglpD2QeshnbsTvWjeAHHAV3SsLyC5WmgCq/alkhV5G?=
 =?us-ascii?Q?SwiA+dy6ZDMdcy/B19y7ZL7CSArDDT9tmE/Cg5E0BkAVolR8CDrlyg6d/LML?=
 =?us-ascii?Q?fDvGNpUnK+kwhldQYC3K1KY3LKLJXs9x56xO92D1nkQt5m52oMyfTKWf3Ibc?=
 =?us-ascii?Q?ltaz2l5lQqaZBuntCxp/AVLz6NUsPKPljanN8gsu1CuYt31X1LHoynB8AzC2?=
 =?us-ascii?Q?Nm3mc82z3pv1nx6gza/wkp39raiL9dY2WCTuacoMvBwPN+SKlCC9ZqmC8svM?=
 =?us-ascii?Q?0/QLSQ6QNwvdEh8QG0FWOK/JmylAhSF/U05Ia/AtrxYmSz1nPOWjAQiVFwdB?=
 =?us-ascii?Q?dV2jYkQ7ktE3cYQzBkNjYbNIx2RSNbnHCS2RqK1/kStDLqVzFowQLPKbqr7h?=
 =?us-ascii?Q?TirWdu5ofmqVsS3H6Lh6ULCPgfHmm5ewZhaRtfhZjnZsg51uxI9uoOlQn2dc?=
 =?us-ascii?Q?ryotJAlM3MKC520kZcGq9PH4z+SotOO8EWhVLBkg69ZwvALnkuaTT75+6yL4?=
 =?us-ascii?Q?ahu3dEC5PTx6kEa4n5DShWH4V0Rf5aZZmgzUj5xtCbLQ9h1r17q16n4aqMh2?=
 =?us-ascii?Q?yTAyvAyFjQLjq0PN9vrJgzEAeRpH+H3AyJmjj5n+t42afsrm2o6SVZ2q1MPM?=
 =?us-ascii?Q?xkXTfFsoG1G6EJOAlViAnHrp2Tv8NYUtmLG6HmexobfxnbhPPlkZfnJOrDtY?=
 =?us-ascii?Q?ezcSKt0ITGX/7pp/rq+EpNLHLO4he/XQln0lJRIMGlciioEiEmL2/AYajyX8?=
 =?us-ascii?Q?Gjw7ejRQnU3HrKO9BzucH/Ejsl8c91pI+8Uidl6XPOCsT8aE0Ze+y6RJihsm?=
 =?us-ascii?Q?nzhI5z4mDbkI72agpKrWqwD/u3BXwhF3HgyX46JEavKttJgbPLpE6/9z7mwf?=
 =?us-ascii?Q?cOcYQGh8Es97LTm5s0i2KkyZKkLMdanaiDlsYdDjh2oOsxW/V/58y4NjEix7?=
 =?us-ascii?Q?skjZpYzrn9bwn6n0xXRpbx4ftVfIO1pvM1nPKGX3r2t6ZyXXzo+cjv0fWnA4?=
 =?us-ascii?Q?yQYSwLj0GCHMSUqMr0L8JcGZ1IIIx68e75xBcnPFn3w6rnnjfgMNbqNvygnV?=
 =?us-ascii?Q?PPjEy6tvlfhKLQLUIzbWv34ozGw35/jbjrky7KMs+7eQgaMgHbHzjMEQxva6?=
 =?us-ascii?Q?rkh0Y9w/P4j4xmiFGMhMkebx/zffxT6xFu10xufw074phUYHUNsNz+uJRjep?=
 =?us-ascii?Q?777TouwQEVGdxX5TASgWMxpdljgR2rupWKuMwZjNPTPP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dc8pSq64Jf7ldzry1rzZaHvWqE9xh+4rhmZf5rmGBG+m6z94YbUYxg8smYYz?=
 =?us-ascii?Q?llfFEAspnhuSB+1sPlXoDTl6XmNqgwMjfgbPwkzvhZlZF3/T0C8hDE6FMfk5?=
 =?us-ascii?Q?HokI+ou2+EOw6gcwJEdY+SmuxaMZTykzr7jdwp3ZsOWIPhCWX+iydZwsVEyF?=
 =?us-ascii?Q?lQuxYDgdqU9/9tM5mYLWpq2kBVUN8KgFa0hqav+N20KekpWMZ55WvTvAoOMY?=
 =?us-ascii?Q?wFff6MEG80yaw3G9s5OQtUWHyZEDrBqOcxCQs+XUwIKJXMko/2VqRzVgm/nJ?=
 =?us-ascii?Q?OnZVCRrls4ThzDEM7NuR2TawpvDB7UwM6BAyNFu5dUgfBmD3qdY6SzmZuHaf?=
 =?us-ascii?Q?j/y15HVzlqhtOdFPupa5YXQL10X0OgFPjHeEMKo0KWC1IfZOINB6YCUD4eFE?=
 =?us-ascii?Q?1ItmNh5lzMuryfIGWxYkOCbhdC/uAY1mtwgftZjSpGYpIcD+u5LHIml+j8Cz?=
 =?us-ascii?Q?TF8/HlwUWh0WntfSXHf6Nhr+XtlI9099oZgYTHd3r1dsJ7vppPw4A+WwT1Af?=
 =?us-ascii?Q?xHsevxEX/0L74P2Vr3Ni6z5hdSYLyo7nE8HKvqk9NBbgbzAR5jaECDirXmIT?=
 =?us-ascii?Q?Ia5jDmP1qPmROLcP/bKCkiRmx465ZEel/dYie/TRBVZtxarhg1S+i3D+bcBS?=
 =?us-ascii?Q?KLTWGNA9SyZvYB6wLaJmccdeuuJiuqOgqyyS73W+wxU5lfo3E+/rYjw/oYc8?=
 =?us-ascii?Q?5Mx9z4SkgOrS8CuWUrkxEdb+KaJ1lDtLU42nbFYW2SsIbT90czObf4waZrAn?=
 =?us-ascii?Q?AsuoYcnudRxjDi847V7zqxpSL3fWeBovSAyz0K6JCYQ1MOLLTz+auuFQ563M?=
 =?us-ascii?Q?5OE7hB7zDWZy0+QLPRiMe9Y9UgR8ZaFeCr4nZ8ZVkHr/8qsfwsQei4e214QX?=
 =?us-ascii?Q?x3XEysrxakk7OY7+D7eScPz/Gkz/fhWxRJZE0uFe/6VBjGhz52viUl05Cwcg?=
 =?us-ascii?Q?Cs66IbSkaogISXHijpLr3vu/Ny4pZ36aDQcBe9eY1Ja9SP8nQR8+MFKTY1va?=
 =?us-ascii?Q?yidxJLDSr8xf6p7BFulahrSSrAyjuLqRwdC+8h09Apt62+vsq/5A6g2XJOqd?=
 =?us-ascii?Q?LyxJAmthcBjd5GzSFfrtipimWqMEqdTkrlGFJSRK5cP9Wz4n8cQzPi1ANAY9?=
 =?us-ascii?Q?4J0pME3yvI9Af4NiVhTOKsmkPZ/kEyMESTNGK1l/xPHWJhpQ67K5SQQx83HJ?=
 =?us-ascii?Q?NUEc2HN4i8Cyae6ZYEo7RUNuZOUfUUNQ5h89+mpFNm3P21KRgj/5lsWFTeoF?=
 =?us-ascii?Q?Mib43IEiKWj97qcY623Bojmb94MW41iTeC53Smv8XJeDa+eLJkrxMal2XZL1?=
 =?us-ascii?Q?gLgyJODWBBE/0Yrom1medVk47vWqySaQAs/uxxntrFA5NftargoLl/p1Z14E?=
 =?us-ascii?Q?Lo+GxfSs5UKQrsrJ3e+6NkZFXQ8JZfL+PF9Oyp44iQX/Ns6p+3/zsVku+JO/?=
 =?us-ascii?Q?ypkKWzv18oBLsu4R9RI5Cc1FrlCTxHmd1kDrIpV57CHOxzHa0fWVwDisS9xY?=
 =?us-ascii?Q?1MprIBftXpUrGnSLYbE1SLZGMnR1DYdlfeNHsuFa3U/fYF5fB0/h6OoFZ0M1?=
 =?us-ascii?Q?FWsmrbSj3HI5UwBMQss2iHNhRC8B1n2bVNgVxLWt8p6n+FdF3IGWkhSUhauy?=
 =?us-ascii?Q?20OpYZzUqfWZgL+yWKWPl6EJ4rty28Ce9DYgS7bx5ebQYJh/ISjKXB6cwkWv?=
 =?us-ascii?Q?qSXClGjcb4eI56P02q58TZ5nTPXKqk9Pv3AXOlmtj4L++ayca6b7CRC0Pfuw?=
 =?us-ascii?Q?zVyQInLQJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ddc384-694c-4538-8b86-08de54066965
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:19:25.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R+7nhLu+abx2kQtTntLUJEv4GJuL19Amy2Y1FXa3SOF0/BripUVgejsfKwhxF0JTTjDYfqHfv9sscJ357EHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
deleted the "gpio_active_high" flag in pci-imx6 driver, so currently
the imx6 PCIe driver doesn't support "reset-gpio-active-high" property.
Let's remove this deprecated property in imx6q-apalis dts.

Fixes: 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 1 -
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 1 -
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..a5f3273e03e6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -56,7 +56,6 @@ &pcie {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
 	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
 };
 
 &pwm1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..f70351479995 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -147,7 +147,6 @@ &pcie {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
 	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..4fac26e26a4d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -94,7 +94,6 @@ &pcie {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	/* active-high meaning opposite of regular PERST# active-low polarity */
 	reset-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
 	status = "okay";
 };
 
-- 
2.37.1

