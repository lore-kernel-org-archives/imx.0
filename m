Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C5F329371
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427453; cv=fail; b=YeNfu/6Ui/WTunEoH7moVkZDuAZ6zClqf+cLm6uEYWmfV/kL2yw158F1mvcbXaTZMP0CH2TpD9ZgjJMpzK1UfLiR4zlBphteXvojyKzNygt+d+4WLYKTdXIQDvoVG9WdIW7+h/vnjk8vihe1pORV5H0XBtHjtqAbwATgNox/vQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427453; c=relaxed/simple;
	bh=BNyLAi6X3mz8LV/VxJIZQ4JjNUY6m3OEIWDipYW79cU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tHV8klLk9s8NmU06gvfH3e9D3gpIRjZoPSch4Lm23DFA9S3zKcFJhUbnNSGiHubSPVtoizGFkmyhx/DZ9ZJ3JFwcLOqv4ZNwmG2ox4h8f8D1cjs+UL/UiQNxDfC6EAcC6nDfYTyXlUVyv1cxFCzCV8DYdG4kJPZwqadKfialLYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IpdGhf0I; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IpdGhf0I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqwn/pagXiZq9lvKXg7SezzNXtwD7I4HC/pXKx7gtaezY5VpL3kMg0nVfSvZORBIuaUnPPhnxyPze9AH8WFNNZN0m31bWTm9qRU1S/s/HsSdFd43TZl11XG6lBIBhP6RU4oC+nYTxVdLuE815eoWdKWpoMEHxPeJVq/DkYnefrXs2ryyIoTddyP3OqZjCkSFTVc26+yMUL9FKM8uqDcDhKKyveGtl51NgNdqGSW5mj5yRQI84MzvTf3GewIBB9WVkd8xcn2YS1CatQBPDlRG8E2PZwLry4zUSGR0RPDrPVq3QU75xTodcRwW1dZcFwLOzWr8lkVAXpr0wPd3aUkRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhva75X6EoYC9n8FHk9VI1Vo8eZvSZug9HGms7Mg4dM=;
 b=uEp8rhiwTwCbfbmmi01ejEKxFZftz/tU0JngZQGPggahih2irEWs7putxff9LcgOesccAzNha8h2lDYN5FcZHjo2ui2oerAvh2xWTCv1Xc7jCTr2yyFxRngSROsIC7r1quhTy0SfOOIZC5YEK1HJzXPZv4mlTtSDrlEoUx/qRBtubZQ3ZdwKBbfpU/iiwogBn1DJNI/AuvW2KGOsJ8Y8eLux6bNnKs7b0DDo1PJXwR6t2nYtzlsx+9cj0C0U9giUMhftZMiZlkdtBSnSTeLv5vmNzjL9+22lTQ1jjkBhdYguhDlHwoEOObyN6TQDqiaiProM50wzU/U/EFp6KktyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhva75X6EoYC9n8FHk9VI1Vo8eZvSZug9HGms7Mg4dM=;
 b=IpdGhf0IU5ljoXZoWb6XG9w97WuS0u+rwA6xlb/+6zaV10cuY/egHOIB+PHt7k5atP4tMwvRxXGqUmiKBfMIGgXvr3DD5aRQHSBhlmvvB/Y9jEftmwvIiiSuI2auN9thoEEvL/jGhywxEU1VHFDnIT1vhO+5eRmE9pLLGVZLUBZXRYfEzegc9/qtKcN9SnYUDe8ukJWn+BwIJjESPLXIgWdvE6s/LLfQ7TC2zzB6TnDalUg6hHPV+ioH4d5xE8jWbkwpPqpY9rA+Z9flA1+yAANTkX8mfoha8W2oh2LqAWZ2o5Sy6iX+dgVR6ivhPdPBX3oSYa2kKEkmFHsv646uTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB10723.eurprd04.prod.outlook.com
 (2603:10a6:102:491::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 08:30:44 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:30:44 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/3] arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
Date: Wed, 25 Mar 2026 16:31:59 +0800
Message-Id: <20260325083201.2637520-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260325083201.2637520-1-sherry.sun@nxp.com>
References: <20260325083201.2637520-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ded1945-77ac-4bd5-d2c1-08de8a48ce68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	w3q89BA7fzK3o/S9Z6FPdY367f2+/YlRjZweCGw/6349AcvqgxRITrMRyPb43EF3ZAjGon5zQUrCHxie4Enx+12ULdVUYMu75+6zF6wHhCVdLJWI4QInNVpSDYC1JoRXcbhz0BMBr0tyAwEvbth7lIb8L2BlCB5ptqmzacBTSShgeUSISfPaTXdgZkjrC4DMTHLG55x1sSABKy6e/KGMBAAk+n7o8SyI51gfjf1ND/piAAWqkXyEsTX1FqL/UD/94GYPqANdbEpNYhMbm0ya+sPo09M5E0M9fcmM7JWhJ1MaiQtwWKWy9Ez9Ke+8gwRp/yobRSp6ytz6xO2ctHAzo+f3SacU3BQ9VcMpOsFjO1xntaaSTFndo18/BXZQ2evtN3RYD/6jkSv7eqHO+4q5yzsAHJOILLWx13cstTh7ozk+GqiqWrC/SkOX4tY7yVzw1nMCiq2oAbj7cxd+jOPy7XYi5cqfMZcN8A/cUEjYwQL4uvP6ny/ssCmXzKaC+iD4uYJLN07VqWTkEmi1HJyWUuPe1kJ5HPK8pskfn0FCkxNm4nTaYO2OesTqewmlRwPYeM/Y37XAakxlgX60qwNXRAwvaVmWeAIO2XGR0fJN+LrWoRq48EnRfuikRtBhsmnqnvxo6Io1QqqNG6skSZ2uttTq7hKer+HQ9omMSgOitHrivRtm7iCY7hPO5pLFmx20TFnX4DrZp1h20Ztg8iXnAWxkeTG+HS84OZ/q8A+Ve1GbWjLDREodjotrPfn5b7mzDkOxT+E2V3VwBth1IGN7ISaPjNEnLbUjMgK5Obt3DfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghncruKCllPsgZNV2sZQDaBgBZI0bQp+OPIzhgaiIVAh0jBrzD/73x37blVF?=
 =?us-ascii?Q?h9QTBGfmu3aNLpAB9EBvUv6dfg8L81T04y7jBLnm1Js5j1Kqh9n7Eia9fG1x?=
 =?us-ascii?Q?4GiK8Q5M88P+o7mw7C7IHGbD3VrpHJ2qQaW3ldsnYpLZ5dPvjPttuPh08ZHY?=
 =?us-ascii?Q?dl6nMnONv2k/OY46UIEp+rCUqP/yzK1zX0a0mDUoVGyPom5DNlvccx9fe+PR?=
 =?us-ascii?Q?3nCOAvBMAP82KBnRkk0Se+z1YxLFitO1uE/rnJRbnX8g8ejAQI3fMsPOb0gQ?=
 =?us-ascii?Q?/GlhQCg0DBhUxLOF0AIVB41s/O9KCI6lEmvc6/670bidoAtw/uFHe5xYPflE?=
 =?us-ascii?Q?ETEs5NIgWkPa49EBcL27R3HESGvTDmoan7fLE8I54fUn6Irkp27FACK3cXGY?=
 =?us-ascii?Q?Mt0Drx7awUdxpd8HmRZbu3njmoOUCTswyViPJlzrZOxdWW0y/OAGW+BqRIc6?=
 =?us-ascii?Q?/SwUGikmcfF8M7nJAGlLhk4ojAH4AGoBC8++pW5/X07u9zi8zYybm4uKiqd+?=
 =?us-ascii?Q?SI2WWXjgu9j977epg8AuP5fRGRvpSbl+ddnI2PuUg+2BYjHp6NF8wY1m1+vb?=
 =?us-ascii?Q?vS8s5SHDd/UeuKrgeT3ymaHMJux9xMRwo/nMjdY6fH6FdQnHu9C48obVYoMy?=
 =?us-ascii?Q?whf6ELScPB80YykNmQ9A1jNc1Yi7VJ7GcHoebGX0cRuXyn/T6FywB5TXG9jo?=
 =?us-ascii?Q?8ULbgnQvrUEO/G8gT6V8hjB4QLE690ViD79+K+94Xm2unK3TOYONr58t6rTy?=
 =?us-ascii?Q?5EEMBgTr7LTt5+IDOgzallR3/tufXAD+MWnsPyRFt7nsx6KXCE+RvPSxLv6o?=
 =?us-ascii?Q?4j489m2FCeM8TuAK2XEY/tKGyKIuI+oQ8Bov/lIC6K6RSiIJB31GvV9L/24U?=
 =?us-ascii?Q?uZ0VTUi4Ko+Nglkx4UTgo62rWj8hXEpw9sH7F9NLkVPtUD1VNpT23j7ZAsHW?=
 =?us-ascii?Q?9bd1GTyiJHI1Kv0oxkqT97Vr+8yZA/yy7usoxttEKK+0pF79VhfVSujgFdGE?=
 =?us-ascii?Q?oGK2ai2s6Rf117x+U/43kxC6ZpU6tmVAcKE40WRs64AKZqx2r+lTbdq1c+HC?=
 =?us-ascii?Q?2ZT4guKu8+uzBwrztcoihdqJYN6btiooEhNbanoWm/FJA2/+Q/FG0BkWxIbV?=
 =?us-ascii?Q?pVKaALPWVB1oUpTekjWPYBr2G29fxwJoZ/P83bEtElJKhqbnVhwaZaWmSZS2?=
 =?us-ascii?Q?lMQs4JV9ylappBncT/EDNTC7894CR50iCoyJy539na+RQ9NccOwTDMYr+LhO?=
 =?us-ascii?Q?pEVZFFyOoFCW8SlwrcMWGK95jCsunSE/uFOeM7xpdPNneWV/SVovblIhXtju?=
 =?us-ascii?Q?qlXFbwBKowoXm8dwrfAmYpj7c5mF73XCtUCJbsH0t62lVNY9PnUxYl0ESzls?=
 =?us-ascii?Q?ojUbH3lOqokxtMxN1tzMgSKWjhoF9HuPOMcgqFvfyPqmmX8X06SzaW0ezuss?=
 =?us-ascii?Q?eQZP7/UC0p2NixBjOHMzOB519o7apEe3cVf23khd0+nXnI4lAThP3zjuONFe?=
 =?us-ascii?Q?N9qYuI+1O4GbZsHT6aSo0ofS+i9zp0t4hsgGNs7cU9WKe3W8pydJsa83UBNi?=
 =?us-ascii?Q?DA1e5RV2Q523mvfetcot6Q+ie5k2trQQJCpy/oSN1Lkqyi0IE/F07Ivvz+IC?=
 =?us-ascii?Q?o62gzoz/eSv647cVh1BywByV1HUCF6sT65eZVID/eDTRdc3J1SWPYbZUiY1F?=
 =?us-ascii?Q?Iue7KUPg1YX3SyNUnA07f25O29QXdsUAfgvvGi5LiK5RP16Fiu1X3A38OTMQ?=
 =?us-ascii?Q?TUmJGwDHdg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ded1945-77ac-4bd5-d2c1-08de8a48ce68
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:30:44.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVQfa9FjgxtThWI5nC5LEUHHqNVC5Kw8KfEf5Nt4XIUnAU4n+Pj1loj0itVsNHcs9jIlZ7zJ+mZDBIQG8lic8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723

Disable the PCIe bus in the default device tree to avoid shared
regulator conflicts between SDIO and PCIe buses. The non-deterministic
probe order between these two buses can break the PCIe initialization
sequence, causing PCIe devices to fail detection intermittently.

On i.MX8MP EVK board, the M.2 connector is physically wired to both
USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
enable the SDIO WiFi in the default imx8mp-evk.dts.

Add 'm2_usdhc' label to USDHC1 to support device tree overlay for PCIe
modules. Users who need PCIe can use imx8mp-evk-pcie.dtb (added in a
follow-up patch) which applies an overlay to enable PCIe and disable
USDHC1.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..315a4e1c5809 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -773,7 +773,7 @@ &pcie0 {
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
@@ -869,7 +869,7 @@ &uart3 {
 	status = "okay";
 };
 
-&usdhc1 {
+m2_usdhc: &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.37.1

