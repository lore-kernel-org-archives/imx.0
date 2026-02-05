Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957B149C6F
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770276835; cv=fail; b=lO+IOVYGm7+F27b5aJkketgq8N6Cp6FDxe+GwjDC+4nFgX+ELD9QioDV04CQCWN7axjRQvcwtytY0MNfG61iHHFk6n7H6LanEmBKmwPEhSr5pPIoUk0RFWQrATyWg8o442zu5VAfKTGp7xMwJyn8rEE0zzKMlnspXPWSrJpGHms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770276835; c=relaxed/simple;
	bh=HT2FZGAynqS3HST84GMZPbtvbb20H30QsV+5GRwylXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dNWF8gM5tRQNDp+JvIfkKXEkp0b2tbSaniVba8DJHxg/QQcHubPvZg+xRqPLEvsSzQt6XpU2j/0ZuKdjl4igiBR1POxuXlgh0tDLEt2llPChBljfQQMxTGvk1RK1WIUIUvChMSo3tjPIaKHALXvpPRDWN4g4S4/UfTGMipvj3pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NmsXTNUE; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NmsXTNUE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h56I57apI0l3zSm1WgkDY3/b+z+0N9cF34BogvRcQ6eQJwHbG0ZZhYNUdVjgHtHVwZ1+wiKK4SJY3UsUIt8NNoNgFqm9arZVF9RWxhoDC0DqiIdMAQR6VHGBzsv+HwX+xcH3E+4hTcKihl84+Ga8cIRDatyV0TJuc4eBXJGb1I4Bp5LUuK2sl60zVQaQZj5cArjA9N4w0en1zk2rN6kI3eMs98Bnr/wsMJJ5IHFZ26OD/v7/J7GAoxsuUvtleAhuy/yLgaN+IOBxT8GR+fqrpIWFZWhlInf/vvjNUFHz+5L6cGsYX7Q1sTpBirawINHchLHVrMFoOF3mEx8Qsjd+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajLoVKUERK7yUbfxnlpcpNABGHkTcyoSmp8z7n34tyU=;
 b=ZKOJcaohABWwutqpRa+SqmzWCGKoQ7IVHEdxi/6P0GVLkfiC0zne2BBaMBoM8m8Bo3aX5bihSMdxazWLjYowXTD89+GJ7qdH7f6lS9m8/BNDasRn3c0+wqLOQCanus447c6xOTnW0HmXW4B+BVKMlX+AunHckImrOluFscy17YRaNf9Vv3FaUcGUQfZDr/HnrfAegVAAPrfwXQrm/Jlnz318DicCAfU0a54ObnnIur1HIbNVNKRy8E+OAWTWwPvzXECXApRbrXExgjuYkECiACM1wKISS6i6RN434gYxaQ6Kh/6JWYH4ahjWnjX1iRAUv2fsLO73ECZ5KpwVe8Mb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajLoVKUERK7yUbfxnlpcpNABGHkTcyoSmp8z7n34tyU=;
 b=NmsXTNUE5d8cTnmvnOj3SNU5v4mGNqqNRjSOl5Bou1zYci5WvaMbEvpJQf0hYXM4ebQbk2/PUy8JI//4UlCmEpSp2Rta5VDWrLzucj4XvEAxAoi3pHAFFhAmVuoOS5HHK2cYp2iNvVRaowKX0WaX9lwt1SBruF/0+ia5v/h22IsYZ8RvKAnDJ2IjFPmWCBU2R/We7/AYllIEHNH+EuNrDg8x9zxpKbrDKrbJJBbbAA9660Prf0X31rcrfYDXxy5N/TfEg+jA6dNWT5GdhkQP9aHzUBfWeNM3chxtewOfIej4DmP64le4YgoA95StaBulS833wZPO27OtPcq3sj+Ssw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6806.eurprd04.prod.outlook.com
 (2603:10a6:20b:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 07:33:50 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 07:33:50 +0000
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
Subject: [PATCH V2 2/2] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
Date: Thu,  5 Feb 2026 15:34:54 +0800
Message-Id: <20260205073454.3709673-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260205073454.3709673-1-sherry.sun@nxp.com>
References: <20260205073454.3709673-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c76351-198b-455c-2b91-08de6488e81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lq42NTpOuRNdY9Gq4gp7gHN3gmXOzeNRQzGBQfK2KrxAfARLF7V/wgZbNim3?=
 =?us-ascii?Q?7YQQSlZsQb0Vt3qUIWB0m0Kj9vGrQzqnlO1l09l2mOQlva/YvzHAgnbFhzk3?=
 =?us-ascii?Q?bI7qQyjfE86tAZBqM+TsyncRxPm2zj8gBSmkHxdtXy5+ELoLfYFHFMM3r+xH?=
 =?us-ascii?Q?xPkGwcQ3OGwvvzimCSznzcpVEgCafuIZVkZB/aeuEYh1Rg3ihtw0OZPxpnJS?=
 =?us-ascii?Q?TLGaxpIO+Fqu0WGi19msvFXnru8PtSs8LES8fHMBCC0X9lSn2mubrlhn9GS5?=
 =?us-ascii?Q?EyklkM6i1XScu4WjyQvMjP0adPTrztkOHj9sVvya/KoNsrOKEF6kgAmGIbjK?=
 =?us-ascii?Q?LfivadELB4IPlznCqtVDN9aAcGw4+7I/tFOM8RI5JHPmjd8g1Ec2kSiddOVn?=
 =?us-ascii?Q?jpiPVaPxkaSCv0lDruS93GgY7RU8bGF2+de7O5vNOGt7eQfvrlD368nU6dr3?=
 =?us-ascii?Q?7jFwbyReySTaAvkMB7OSqfgLK4MmyzQyyW+jCzkP7i4SJ8AvC0tXb8HXcVbF?=
 =?us-ascii?Q?yg1/rMRD5GwwYglUIg4Poupy5h4je2DHoHSoc0EjnsUkDkwjn2lH/XXFoVSv?=
 =?us-ascii?Q?1w0YjCxFRXhaZZqFXMF/Kr3apI3jk5o5IjOvrAbPbP6Qx4dRhB2z6H4uwsdf?=
 =?us-ascii?Q?JnDbKE4c1aj6l6s7Jk2pcJy2mHH16YlF/q/abmKWyXetAlprmElGESDLKAdR?=
 =?us-ascii?Q?rwdzuelKZHZcE/6QHJesTuyPGnCtF6+p1j28bwWM/9QmSBYyp0iZ9c0dRqTG?=
 =?us-ascii?Q?u/xyMm8aOAREk8blgupQUn04WONLt26uDRbAbpGRxv1PQX46YLzgh+owf1oO?=
 =?us-ascii?Q?SaUr7k23R9C1QhNAWWk3IVVmWeuQJJPvE/zGEFkzu/MNQo+ffyB2UfYzXku7?=
 =?us-ascii?Q?SEO6bHzF8myqXoZ+lZZ477dPmtEEwu4Ifziiqjmp74CGGiPjEMKZOrh1i8SA?=
 =?us-ascii?Q?AU2UlErjSnvqUKveoyuIUtOllDZHx99EwoOfDNQvJ4Rm9bDdkhIw0QP+rYpb?=
 =?us-ascii?Q?TVMAY3zSBzkCd84Y43JgTRN42TaHSXVeyfPXfSRSq0e8OnjGx0yaRRM5k9Zq?=
 =?us-ascii?Q?EEISq19fv0R1woeymMnyunB92h/9E7VeC+w9ZXRI9IYFwP3vo5uOrC3U/95a?=
 =?us-ascii?Q?l9hJdBP+C88rqNLt+K2Qvaj4SMrEWlwFPpVj3VTBrjIivstqVeeRhvLUIsn5?=
 =?us-ascii?Q?n4QfWVHGAP+Fe1vuw7WWeVSGdx1Yn4n2XU1ZV5CyxvHnyFDwKFIlA8nJiEQE?=
 =?us-ascii?Q?KvgwU4UfRe4H/KdKaZPCmq/tD6Fqjy9TDCB8UJNL7K5Y13yPJSI0p3SPl0mw?=
 =?us-ascii?Q?6lNpQOFKomHf+qW7nyRq0my8+dxl2cJjs5AyWiT1pwap98LMIp16dzA7y7M/?=
 =?us-ascii?Q?wwOHMqB3yb/CB14ykLHyl6tTc2TGm63grUzx24sKPzPLud8ASG4hvMq6HQoQ?=
 =?us-ascii?Q?r4ztdjSdyoNK8bKP385xhlX+eSgvaLPC2onMYuLTNO0wZbNh3DC9/x4l+yyt?=
 =?us-ascii?Q?Jk5BZbi9iZIpYfeSGLllFga6wEJ5vjjl/v6jVl20bWwEj96ruQmwxf41knkA?=
 =?us-ascii?Q?bX82vbR1H/IHuUJ+UQ15fdyHceShz0m7tqKM0twcbxqbJ1KQb3U5a/Qfk0O5?=
 =?us-ascii?Q?JdceRQO8BeWQU0BXF/rNov0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FIKjBDlLbM7puOVSsggaKVg/L9660k+2fwKLW/7+LZJzJd9X7NUR6p1pSfI?=
 =?us-ascii?Q?XwB/rBldYxDFSt//eI9kAnmYnySANfY1i07yDplbBKYir0YEgRWqtCRNV82S?=
 =?us-ascii?Q?6hYa3+wihKaXu2C71frJFjkdRxXOUwJzdMyjB4aS1FOtNk31Z/to/e8wZxSy?=
 =?us-ascii?Q?UtfgT064ou4Sh4BjxkCcGfpq47cqOlqfOVB0Fn/aN5+FS0yYcvxRJrlh13xx?=
 =?us-ascii?Q?RqkiQyQzdG2vKhbG3O5dngVsVeZAQ303KDwcjviWf/v/lW9nHA1I37nbvFr/?=
 =?us-ascii?Q?atRbzzZCtaJLe+gSUvhCoJpZ5ffuoVekvguGMg/pFdvONlNswqIIKGQXH1nk?=
 =?us-ascii?Q?DPLtWN946hf9DHvvRCLSDnAWUwKlqFej0yyLeCoaGPV+FOyLYirQfushLTbC?=
 =?us-ascii?Q?T8pf5XbauRny4AhO7TJh4PogifLo2LnACarHegf5eU9GdyNaNdcwsZ7URFpF?=
 =?us-ascii?Q?t+Ks06OUhowpSxiI1HtpmJO8G4M4TrM9lEMX3Tpj79a1rH0aHw/TVblPTO/s?=
 =?us-ascii?Q?X7q6xGDydpA7AAMVXQMnf88DCNTEhu7hwaajRtN3hDS/BGhoOm1xiCuciYqV?=
 =?us-ascii?Q?UF3NsA8/k/k+FzXKuKokrUn2vmQGFIkt01VBgC6Uy7s2SkOHWQm85jGe64/p?=
 =?us-ascii?Q?v6HqHW05an9YmC2OcmT3f7fRSf6oYjHqP3YBbrqjFuGUWOJECWSh8y3N6QAk?=
 =?us-ascii?Q?BSZUzT+Re4fbJfI+mGWq7fKYtAqV+ojfo4ZkeZCwcqPiebYHwC/7sLnGvFR5?=
 =?us-ascii?Q?cunkl6gOU6VKu53/szJ2yXwcwnbMv+ILNvZBTi7y/hnsTYvXwhBZL+9XH6YF?=
 =?us-ascii?Q?NW2rjGa/qyivg38/dUlmb73L3HOpOFyX6ibnIEd0ic0aulpOjWTcwb6npYfa?=
 =?us-ascii?Q?dRfH9Hl9WGjC0ujpQXU/Olw2p+JR2Nhwn1UxMDIZwMjYoQxCPWI3Tvv07/13?=
 =?us-ascii?Q?19wKlGPZjSqwtoODFZfJ4wLuAHWSmtB2rVwd7Q5WvR0+/2HTTZlwWlvu5jDA?=
 =?us-ascii?Q?o85H6PoY1StNjlJ/iN+0pswORyn7Q9dJ1FgDBkxLlDolVSJ/IemthDKzQdRR?=
 =?us-ascii?Q?vlvsoQjIPi/gss2cQdW1Iccre/GJ3EWXIWCL9VyFJRoBi3qkWXzowRCPdJ7r?=
 =?us-ascii?Q?yF12Sx4WXzFHcNBvFPmIvHv5tGzI96O7+W+5sV8nqhXqaGzCwXHWXUjVVcI0?=
 =?us-ascii?Q?fgTo0BP1rR7uruTGrDB80gl2enDBee4mU7NEc8REnPMtTkiSv3ikFkskinBu?=
 =?us-ascii?Q?kbnpRt0bnmpmi3YeMc2bS6+dcNhptghkIecQpd5rHv0pa+AdX5iWQ95OP4cf?=
 =?us-ascii?Q?oNLyORUIFXEaSngJGd/El92K6iD6DvOvUDoxMK1qqV88NDZDO0i0umCYDQYU?=
 =?us-ascii?Q?VR2nnOadlFSIznrYjBo7+1/t/cEwAN7CfDQLNLxWn2tF887MPRV7NQiRB7wa?=
 =?us-ascii?Q?Ay0HJy10Vlmf4ZrKAf56XYJ5oDIxqaFWCTQzPbE6Q2I047baSgweWI2OK8nE?=
 =?us-ascii?Q?4vtl5T9mnuPpH9eS9rGxVHv/y8ZnB95uQb60TohBm6rzjocYeMWwWK+hCGrA?=
 =?us-ascii?Q?r+MqM5Soc4RQjeqpT20JdLtv/Epsr03nSCvnWA36v7d2ZKem8D0xzRcTtCt4?=
 =?us-ascii?Q?8XLqzst/07QN12ffxMOck1/4CNGwOtAZok8Oy1CbvV7MXZdKQ87nYhy6wbMB?=
 =?us-ascii?Q?+Hufi/Y9y8962jR5Zd9KYgXMqeLX/RetECCD/7CvS1SYL36bQvRUGiPp3mA0?=
 =?us-ascii?Q?eXEBprZDrQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c76351-198b-455c-2b91-08de6488e81e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 07:33:50.7170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jz08u4ORmB0cIz4sA5+rhQJOzfdvE9Jxv1Ndz5C99B3httPSWcpsO6MkFXQpXVf2ra3HOLVhe8uIbq/QbNcgDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 61 +++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index a1269c7a6cc2..dfcdcc739ec6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -134,7 +134,7 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_pcie0: regulator-pcie {
+	reg_m2_wlan: reg_pcie0: regulator-pcie {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcie0_reg>;
@@ -250,6 +250,13 @@ cpu {
 		};
 	};
 
+	usdhc1_pwrseq: usdhc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc1_pwrseq>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -863,6 +870,19 @@ &uart3 {
 	status = "okay";
 };
 
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	vmmc-supply = <&reg_m2_wlan>;
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -1169,6 +1189,45 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
 		>;
 	};
 
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.37.1

