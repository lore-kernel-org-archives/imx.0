Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319748AE2B
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330285; cv=fail; b=jaaMRpj9Typ5kvXpjmY5YROp8SWQza/FlCInWe47Tn1vrEm30I0Dt6juynYLAALBwT6IGFYBPjzUVqNVMVV35ECxkMk+QkuDkvYJ19f7TxlicKuU1W12TNMQmxLEa5H97td9/K1HS7YmAqDgvVioQkBDsREACMeq5iEd7qsECU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330285; c=relaxed/simple;
	bh=zJIz6mGAC8codJBOEwbmJIPnjtdj5pBxQvP2MHGSFBs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OkZ/92iFwivawquiAAHmlg+Xl+REzGh+57VQcYyOVRrrZ70nxS3ih9+iEya0bXjHa5vvSS5/h4QXVj7FHQ+KTU9uQwuXvrwzIKZjAafEe5ttAqT1pVx8YjvP7RX4NrOQbCvPffgi68czNGG059NFLEh6OkBiViVovKQ1dTyjieA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jSWzbD5P; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jSWzbD5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isyh7WOhxd4j/CxpMqp6fYI9PRsytgPOGmHKAYCMWdesfdn+YbhYfgvkP9zOZyHZycrNuoldhUdmSOaaJeGvk9MaJULi2dFv5fwWssoyU1PhZ1K74WNunmoiLrKIQtwvVciM0yk55aLUE159lkuUkazkur79/okkUJeTXvNwq0XVq120Pi6LGLtOOufhBlFihop9YJyIQbSRMaaJMQuCpzibr/TKyN6wYMD7271xUtfBvBjYhYKKoYdeeHcsrKSW1/XYNJWX9aYnsR4J474Y0+JAN3C2CHR04NbRJT34M36YNbQWEhRKJmvZgOs2i8qA9DIuN8RnO/stiHmRB2P0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K++r2HAC0g/sm+f2J9O0JDxPdLYAO7jjZqxI3X50vPQ=;
 b=Vpk1TvoMXzm8MWQBkf5mPlt2PixE0iLYdnHjhWRZ/YP4svuytJovzrv9NRhEEWqpOb7fWmRoCBT2nwXLiDnxkr1fffKNRLz2Ymne8l1+SM7caCmSpXEO4ay4+Q9q5abBPRvoFpPUXx7qwJhpsIrFkaI0CpiCkVdVGTaoJnq7l+iJMxQd9eSTQO/sSVOqxiQpGVDLBuqN7Nc80k8zpHp5qZ6oGwnODoxw03XpRJYUDQm3tihkkh069haGDdjr9Fsz+uOIkDmQmwLBec9oVF+e0w7GG3ZVM9gXnIELLZgGADB/55A3VrjFC3JVK32pml6Oyt1IDVg+wg+uxk4Wkafm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K++r2HAC0g/sm+f2J9O0JDxPdLYAO7jjZqxI3X50vPQ=;
 b=jSWzbD5PqaAOfA7vrlAIOnRYP3RHfRyxg3dOnHg2PTXmKMsdZoqSbr6BVgQgN/k6YuqiQoXnV4u2f+T1dcPBMlclcy84gJVHSwfLGLhFZzVM8Ng8As9vVeWuTadC6Pzy8Q23aVLP8nB9Ij3y71sC1oKPJ6CNc4eSHq7gAW7NqRUNDmiGdRQQmpi1/xNN/sBDtK+gQS3WE42hPsKlu+I16OxHGfpszZPLtGV4aEEKEi+57WqpFvAHEgceN7ba0fOoWX5iHriaLyHnlUiWMLTpAkeYYlo8ym5iehF3BuMo40l029JrNWX47PjQPpW63uZsB+tU6VLH9ttQVP55sO36uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:04:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:00 +0800
Subject: [PATCH v2 04/12] arm64: dts: imx8qxp-mek: fix reserved memory node
 names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-4-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e6dfe8-bd65-4380-6598-08deed71f346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n4bf0DCbgRG70SzVmAEKPllMeWPbYlmpP2kXSsSjiDyopIDaTOA/sL7sUQMOTJhiknNzmfV8s37zdmQqoHehp36sLj4YLo6VXF/CVzEBgiak6E+Q/o/YpSryDu3g/3nt2h1sPYJcbOS6K7bDrqlzbo9HR7ArOq4C7lNtV+Hzvwd4DeofN7FMOoI+XpL3M+UmPgHrGYKfwB6k4s2tH1O9/R3Zy/UKTjkAvhSx3krJUFJBbqh1NC/tQRg1/+0F4UmI4f2dcDY7So/wqR+8DtF8sk82KUhxnkfXV/+44E1euPeGWL+Zh57HqBSMrdJGZGXyvfDiRKKOfzvch+6NsViYAG280bcRdip84UJ5BNEOuIeBVV1KR6Y30EN0jqcOnvK+XSr+daxteX3LqF2dJUJILba3ux2q/eItn6pTCx9dqPHqW0DL6KHEnG5UoWU5gD5wZmXK55nPooF0F1vBRdWazuikRu/TeK26oyf0GgxII0c51lhsj+SG0soCA7Ia2yvgbOEpb+LS0Vk2XufdLi9BeOmgap4HaJyktlvuEMfzaLqcjns1k57fsq/TfVRFCJ7DIVzwe+JEJSgBq0DIujCAY2asEQerx3EWQPMdBlGulDKzDqApJmpBI/R8KRR2exgiwNJ2Yd0C8Me01lRX1UhGNZ2wSZVRV4AF4xu2WA0BCys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUJlZFE5cWFPYVFOcmMxY3hOeTFsT0g3dzVlYWl1dUtFb0Fia2ZtV2YwTmdk?=
 =?utf-8?B?S2RERXVQY2pTNEJuNUQwK2NydDhvWnIyY1FBeUEvMUw5S0hKZG0xNG94Um9S?=
 =?utf-8?B?YUxrSE56N2UzbkFHUXBtZ2lVd2l0TG5jbk9JYXpiVGdrR3dQT1ZQZFVkTU1v?=
 =?utf-8?B?K3NsZ2NSZUhWWVRVMWVubFdNaWNHWVQ0VGppeUdOT3R4OXZHTTI3Y2MwSVh0?=
 =?utf-8?B?NmxmeVhKTnhtczNyWFArS3QyT3psQm1OZ292ekpSZEt3Sk5CRzhROERWVXNw?=
 =?utf-8?B?R24xM1dlMWJWWHRTRmx2dFJpUDBOeTZSQldlaFNqbXArNklHSm1QSVdwblZL?=
 =?utf-8?B?OEgvZkV2MStUeGI2aExBTDkzbGRyQzBNUHlESHlDWmlldE9tVDJaMnNNVFRI?=
 =?utf-8?B?ekRPS2VYdzI2dnNoU1BhQUNqZUdkb3JxQ1hIdlZ6YS9wb0J4SDFSZEJzWUcx?=
 =?utf-8?B?Unk1b1ZwTE5qVGIrOFFVUmpGTnJtZjM2dm9BdE1kZkxRb3hKUTZ5NUNrL09l?=
 =?utf-8?B?dlQwNXZBaDRkbGRWeC9yaVVIb0NQTEI1d3NZS3Z4TGtOQ3YxZG9XaTMzNXRz?=
 =?utf-8?B?R2Y1ay90MGUzTXhwRUVZUzNpa3UwUFprSG1Jb1Nxb29RUXFMREs3dVY2Y000?=
 =?utf-8?B?YzNvb0ttdDZ0N01VNzV0ZVp1R3NaU3BmV0Y0SFQvSG9hVHhDNDlsVHFQbUxr?=
 =?utf-8?B?WWdJbHl2WDhJaStsWFhmT2FaMTI2ZDF5UmUzUFJObE9xb3pobG9ZaHJDUFFJ?=
 =?utf-8?B?d3RTWE5mR05BTXd0Q3RXZEkrVG9qeGVDcXl0bGd4dFU2YldLZnZBQzdBTFBx?=
 =?utf-8?B?a1pZbXo5dXkwZEZYQnVBdlJKdnFzcjhLWWJOcmhqUDFxRTNMS2dhVi81YVB0?=
 =?utf-8?B?TW1hQ25rSGMrWTVKYVRmWUUyS0lqMXBpMEdJbEE2b00reHJZVmVjdUVJZU5p?=
 =?utf-8?B?OUVDQm5wTlNDNVpUcWx6alBucVF4dXpMNmFzMWFMSlA2VnNSZ3d6cnFuNlBo?=
 =?utf-8?B?cmNqVGR2NnYvenEzY3orZXFCczdaMG5rRlR5Q2tScFB3SEU2WkpQcUJNeEJH?=
 =?utf-8?B?S3R5SW9UQ3pBL2pYcXhHSldGdDF0QU5UWjduR3VQeVdiOVdCYk55NHFKQXJS?=
 =?utf-8?B?WWF0emtEUTJoV1ZHdlVkSFUxaWlKZTNtVitiZi9jKzhRdW9DMG5FRis0ZmFQ?=
 =?utf-8?B?WkhSZXNyVGJETEg1a2xvOVJVa0hXcng1VUl2aXRhQXk2dTg2OEN4MGx5eGNL?=
 =?utf-8?B?WFV4MlhEcTA4aFozN0JsMlBJc013YnJXdlZ0YUtJb2hBbjBocFhLbVI0SEEx?=
 =?utf-8?B?WnYzeitMZWZTZXQzYVpXbDRyS2dBRCtxeHlMMlZtNHZpNWtXVFoyL0Jka0Nk?=
 =?utf-8?B?RUZFNjE4Y1Q3NDZ1WUpDN2oxRXRwQjlTMjlQWjJTT1piT0hsbVBkajRObWJL?=
 =?utf-8?B?RHJEQ0h2VC9nek50Wms4aFVCcHY1SVYxTnNvUEFYOGpaOFdrcWtleVRZcS9W?=
 =?utf-8?B?YXNhQWxURGVGamN5NkFxUFBHdW9rd3RZRXRXS0Fsa0g5ZzVWbkR1bEdjUlNE?=
 =?utf-8?B?UHcrUkYvYkZKWTdlU1ZaU2lGMnRRelZoUTZYOWlrdWcrd2NWVXBJQjRoL2Vu?=
 =?utf-8?B?d0ErQ096SGFpZlJGRzRKNVJxSE16OFBJc3YxdFZVSTJzRGZyVWRVZS83bXZx?=
 =?utf-8?B?M1dQVlVUaDlFOTJKQWpwekpLQzdTV2UxanNIdWFVd2EvbmRYbjI2UE5WMzdk?=
 =?utf-8?B?b1ZnK3llMlZxWkNLS2pCMXVwN2J4TmlFL2hjcnEzNHdicE4ybkJaY2xXZlA0?=
 =?utf-8?B?Z0x2bFJiUTFmN1hjalNYSlQyaWg5SXE4VWJhSHEwY0ZaQWtXOVZOZVBZb1VE?=
 =?utf-8?B?cWZoYTFxMWVCWE93ZFlKWlpCV1lXYW04SUkvNytCb256NjBiOTRFK253N2s3?=
 =?utf-8?B?Z3dlNHp4T2U0TTNnUmxaeVFBU3RWSDhPQmZBekxzc04wRnBUNWcvSGdDaXNK?=
 =?utf-8?B?c3FYVXk4L09FODdnQnhhM3FTeG05NUFSdDZvZlN1eG5DMFN4ZlNBaHV2WFNX?=
 =?utf-8?B?ZStFTGxJd2hRSTBBcjZ0eDJ3L094MjRpS0VubFRxL0NHOGlJSUdCSHA3aUNF?=
 =?utf-8?B?WWt3a0l1STN4OHl5Q1lJZEQ2SGFNZldMYTdXVGZYSkxmcjZGYXBMbTlPMytl?=
 =?utf-8?B?enQ0dUFlV3Q1RHRRRUFtakM1TUU1bnNYKyt3aFA0czg3aHQ1WGVUWmJsdkMv?=
 =?utf-8?B?UjJKOFl6YTF0RFNnNm5CZjVFcHZpZkdEM1htME1DMWxjNVFGUjc2MzE4WW1x?=
 =?utf-8?B?cFg2NTFZbWRnQmM2akptTDJHRGsxN3doNGt5azA5RElzMmU4bGdFZU9wdDdv?=
 =?utf-8?Q?+D8eWcKk1TbM8bvZzkGnP0S4H2jK4AMOgj1gq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e6dfe8-bd65-4380-6598-08deed71f346
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:40.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+zrABAUBS2mwAjoHUZ3BysI4EOQkdpByA3nd/qb6uRQjWy5GVexIi7xbk0V5ha5HHtFC1zvWfIE91SnbqEpx9LC8X7C9eCaod+65x3Eaz1eNWz2U1N0GVWFpgD/Pu8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: 5fa302590f17 ("arm64: dts: imx8qxp-mek: add cm4 and related nodes")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 857a6e5122283..6322ff471175c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -27,7 +27,7 @@ imx8x_cm4: imx8x-cm4 {
 		mboxes = <&lsio_mu5 0 1
 			  &lsio_mu5 1 1
 			  &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
 				<&pd IMX_SC_R_M4_0_MU_1A>;
@@ -242,32 +242,32 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		vdev0vring0: memory@90000000 {
+		vdev0vring0: vdev0vring0@90000000 {
 			reg = <0 0x90000000 0 0x8000>;
 			no-map;
 		};
 
-		vdev0vring1: memory@90008000 {
+		vdev0vring1: vdev0vring1@90008000 {
 			reg = <0 0x90008000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring0: memory@90010000 {
+		vdev1vring0: vdev1vring0@90010000 {
 			reg = <0 0x90010000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring1: memory@90018000 {
+		vdev1vring1: vdev1vring1@90018000 {
 			reg = <0 0x90018000 0 0x8000>;
 			no-map;
 		};
 
-		rsc_table: memory@900ff000 {
+		rsc_table: rsc-table@900ff000 {
 			reg = <0 0x900ff000 0 0x1000>;
 			no-map;
 		};
 
-		vdevbuffer: memory@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;

-- 
2.34.1

