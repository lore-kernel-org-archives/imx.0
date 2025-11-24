Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694C2DF709
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978123; cv=fail; b=dXpFIqi1D7EedCwlPGg+5IkTJJaVXg3oNEtwRwe35f93P8HnYRvr3pO5+AapT9ic0W4MUKMvsK2pEdmk67y7amiBDGHEZ/3ITxoECA3uFDSk3Ju+r8TorXbebbffeFZLRuj6IhUjh6EQ8kdgrmcjSHmYiD3YG216vZNzxVpzWMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978123; c=relaxed/simple;
	bh=YWM1XJ/vee8OnVDbNJ5n26i/uFUlFjwYc6TCQfHw2j8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M2OHR/b/rmn4EMUiVQte4GtjfLQ2Lqh7Cz+KPOesYUyh/3sGGfqEvdzq/G7p6tc/t/DAQt0oT1LkZrdddvGDXEu8nw4TUOZOeb/GZhnTkBpkAbec/RCHc65BBuenDKQlSoVoskY1hOQ8C615mOKcsI68whpat3faov5zmdlzVhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IqBO5JlJ; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IqBO5JlJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNcBvxMzhPCteoa5oXQJTVyBVMyUS2e4GdN/rjmbd0+PZR+WTtyWx3psG2wAKPbWRJ0IJTPF6I+ezoVlpr26wWAOFWABmCKxQYRdHoY5VS7nKrJatCKEQAZl6znIT6zcxxvgplHaDX6ulTdTqtPtKZRVjNliddoWkDYkh8yAy4n9T89zfGQ8IoxIW3aFJVbpugxMrhWfYGozWq6ZOZxz4+9/vYm7zYAuF+RaoSdMQloV6VBuWB7YbAKV//TMjuPOelyspNFzhncE3x/GVn4RYcpWZEIYrtciUK2DEBlqt7UcECM7tOFoWDXWtbZOlqJHfXCaE9/54hmr5G5GDolhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKlVw/q/j/bQTmfKzBKjecqtYtCdogT8jykkEAmGbYc=;
 b=BlL7Z3xm56FYqvvImVC4H0qoMtUmp41Dwqq2BoWSDrzQ16Tjc+NKsDHtdOerUr1GqFjwotdxws5uA4sKbX8koz+zhOtWwy9yZbc8TBXwgVtD8PuhJaqkQwJ5QmxgMbCG8ZiTJPVrkEsrSxQST3ncNNgKoLJH9erM38LU2oriwNVqWiA+S2QAhswR3kZqXbeLaqHW4327Rvyw89dkR+AkcdQJRO9Gm83NhyKpzGN6xxhBakBPLUpsim3/2V6StZLH3KcOCca9PqRCr/gzZH4EovnjeN/SaSZMvtYzzm1+tBdair/3QTsAvmxTcwggcKf2xVoUFmwswqLYPm2Ug5IANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKlVw/q/j/bQTmfKzBKjecqtYtCdogT8jykkEAmGbYc=;
 b=IqBO5JlJcdiUv0XmaDnWVqTD/FBJ8bpyVSdoZgOoak62o/0RkNEboSVTUWDRG2IxI/iRBb82eohd7waNsfaM9sxC5I2peDwEWkwlN7iX4upgD5O8adJFQ3SfJZengOzd4EH98AmW7x0GSQd+rEp2VZvTz0xZA+NgD6gsE3lBi66KEq0z1/yWpf5IfjQaHbbKLvaDodOZ4dY+mrTcoUcH5yFn/eg8CIA1boBn6RxIKQBN557NbRcl1irBKRl7FUhU0vET9YI/PLo4h9vgRbuY+mepNF7knRsIiHckX0D91E7l3nouFtU+0hkaD3ykVWmpy/6DqzGwVUzdvA5BXgKj0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by PAXPR04MB8991.eurprd04.prod.outlook.com (2603:10a6:102:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 09:55:16 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 09:55:16 +0000
From: Dong Aisheng <aisheng.dong@nxp.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	dongas86@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	kernel@dh-electronics.com,
	linux@ew.tq-group.com,
	francesco.dolcini@toradex.com,
	Anson Huang <Anson.Huang@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file according to Rev.D RM
Date: Mon, 24 Nov 2025 17:54:49 +0800
Message-Id: <20251124095449.4027676-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DU0PR04MB9299.eurprd04.prod.outlook.com
 (2603:10a6:10:356::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9299:EE_|PAXPR04MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: da3ba7aa-23e6-4dac-2332-08de2b3f91df
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?51dF5XqUQ3EkXG8UtNBVXSRuDARJ+trSzKcKk3Wm+2+qb8h+NYiB+08QEtSq?=
 =?us-ascii?Q?eSp+TP2wr7CEcxRrSmzSQYJwHy0CgLFdrfeWzRRwoA7rKd0YOS6XzmmvyGht?=
 =?us-ascii?Q?Z4mRt0ouiEVbQU0btZheLF8GYGkl7+WCnDEGWcTL70Pelh5mD6s5ght5Y6z4?=
 =?us-ascii?Q?KU6DORqa1Mu1R/jqGssSNWk1PMwnqNIBkIKruYSlM/tin34uRZqGaC4INT/y?=
 =?us-ascii?Q?QAnAnRmINNqWhLvrLEHurmiqBI5hX25DlscvQ6z+Q0DdrCXCiY6vnV5di77k?=
 =?us-ascii?Q?qp7bf7iPOqCaXGbBHB+dvhZdannlUowhXL/C5D7KL527zrUozoPguwZ3zWdC?=
 =?us-ascii?Q?NPfxwLqr4IqRxGylNGNctGRIGNBI0ryoANuCVRyUu4l6UCmJvnxNTB+a3FXS?=
 =?us-ascii?Q?8O8ehBzVQjY2tX81zaleopLo62HlYqVppsqI6F4bshEhMbpiI6RMTGhY9NUO?=
 =?us-ascii?Q?VUgTLYXzelmoQXvCcYu3Lk3HxwNq8Or9JYpUFdT4BpJZyBzLkJFS/uhGUG7a?=
 =?us-ascii?Q?+e53fA4UVj5KLlnprky3hwGxnub1g6VBB2hdFGdv3ZCAudwwG0aQDGdxBMRU?=
 =?us-ascii?Q?Ykw/24m3df5VwYqxDkHsW6daBTQ8WE92oocDinwvYrIElbG+3to5G1i5j77v?=
 =?us-ascii?Q?pJQhphbEAp8OjnNCyntlorCrMv5spNHwNfeVGocWtOejWI7s4c1aSjXZF7tC?=
 =?us-ascii?Q?rMk64XTX0EGIHnn2Lyzpklnm+5+UFPc75Zz8axg/F097I4AjDLWCNl/0Cp1m?=
 =?us-ascii?Q?XX0SfpDTo1kW7xPD96fO0bZ9HzUKRQpCBgsXoGRE2BlIveTE+9MpxydLldUk?=
 =?us-ascii?Q?HXTNXMSMd/E8E6YU1id1IV5SGDDspj+rd3RwdWJRjDJWXoq3+FB+pTbo3SxB?=
 =?us-ascii?Q?5t9Q0rgXe4K8YKNrjgd9aQamO81ypHI0B5McjkfDVads1r94FxR6gXq30Jrg?=
 =?us-ascii?Q?PIpMF8tYglADmqvSvKFIhVzGnVqNjWefJpaIzV/vG0Gsl720IS7UGBegRl4u?=
 =?us-ascii?Q?mIAGVTXgIxcg98e22MfeNKsXBAGamzzF61rBQhZ+59UOZKWOqqst72s77zbz?=
 =?us-ascii?Q?Z452aOw0jt0LfjYmo3+ZHiOqW7+wRqyLqAVpCib1cZ1d0ywULxOZom9uR78i?=
 =?us-ascii?Q?J5ptzSILKL7fyzizTGF7SCxnRfoKtBH4JAI+I9THDv6kDD+WSepdYFYj+Lhz?=
 =?us-ascii?Q?xxoiR5ga1Z3Z0AvJmvNaXz69MyelyME7lBE0aMTwcZqKh2X3p8/66zF9rciL?=
 =?us-ascii?Q?SsPQtZckuN0N0usw8O8hZzV3cdgt2GmXlvwWMR29obtQKtcPsbwbjsb4z9CS?=
 =?us-ascii?Q?Q+1kComiHyEs1FowPgcxKmA1WgHLCRImpGAidk+c0oG/E3gFNbkI8icvBu1n?=
 =?us-ascii?Q?bbeA083b88VjjcAFUVgHZNCqo4XfnkmXON4l5pgzo2umti4mTMkLsh062/5y?=
 =?us-ascii?Q?oJz9cAaeNgSl4vSB0GhB6SyuKS6QTG+rW8koSCRxqbtHA/GJI2tJ1zEIzvWk?=
 =?us-ascii?Q?EBX3aPZZA1BgqSfm24Gy72UAEMpmwpow3C5y?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ytOoNuL3436aK7tbl6IJv2MP5aKmHN5BLo9/NxgGEnSPkPDyUwMw/zh5lM0S?=
 =?us-ascii?Q?RTGPCU3/Tvt6xiWe1MUl5zxkk/z6SS06Ef847kzK1dzDYwar0H+hustIMupz?=
 =?us-ascii?Q?rRvPvl0mKUwAURJuwKeyb367HGZ5EQVQhokqkNrQZ/Y63rzZ5S9qc2UPhuVk?=
 =?us-ascii?Q?Y8rh13ee4+dmxpspTUIr4saanFXz4F6B8Jnj17tME7mm7JOJwHVxwEKj0zU5?=
 =?us-ascii?Q?99TPXT17BrS7qTxY1cS0fiCnBsnzuD8SKrndw/SEUY2YqhNrnCZrXjF+QsoQ?=
 =?us-ascii?Q?R6DHEXo3KQtYDu9T/bVgwKVMABKXcgke/N9Z5Ry8g3txYI02Ut5FdN9lNkOf?=
 =?us-ascii?Q?Fx1BFpilMwO5JLc1LrV7AdsSNvWmYFnXfcz2kJ3v+e4tZCrmp8FEY0wrAYA+?=
 =?us-ascii?Q?859dSOk3d93eEQPdHC0fb3SfeWaxBAuyLTc+RBBJI6OkTfV9iR0ildtzb2hV?=
 =?us-ascii?Q?/YjMAnMFT9UIE7I5YbV0HD9fqQYxSW4OVfRDDFkpatwlc3jKtdqsilo2SYD6?=
 =?us-ascii?Q?9uKklag9cBJHOo/NTq6l8S/1pVVEA5fdDB10zhXGBGaBb9a62JaBx9LO177n?=
 =?us-ascii?Q?WLbSTLtsTwZrXySpxHsOgBrsrZS0e3sO12dbt2WeIIGLnAd9yAAcZ9ui2fDx?=
 =?us-ascii?Q?xMFfSJqFqVe1Nm5LweRqsv+7P1zAPnzo4y2zA9GKqE5kNk6P+CwuQacmMikH?=
 =?us-ascii?Q?+RauqvgWMunSUGO4vqOONgpGwKLB0QgaB0lzBf5hLv/wu5jDPIV4iOfxUESa?=
 =?us-ascii?Q?cu2VdZEbXtZOK6db6SaB/F0Xpz5HToFRhEAAkewZ+C2dziXO1m7/nsNgyepV?=
 =?us-ascii?Q?baC+ZQBprmOkmW1d8Dj4RxVTtqB7wJpTT8KQI2TBkNVdHYPEGwAl7b2alzc7?=
 =?us-ascii?Q?DNjA/wRz18iyS6Bi9/r6tSOW8vCqmZEr5Xx/iPqo52mN9gN9rcn9dUcVtuK0?=
 =?us-ascii?Q?3kFfif9FFt1cOsJvi1mO7BmGh2Swkiict7kANWEpXZ/C7E9QGdHqulagyX5W?=
 =?us-ascii?Q?3PoXdCXlaRk+iP1KKrQ0HhTKgry1UL/JGdakTfA0UbNOax6+b33NvhMLfH/A?=
 =?us-ascii?Q?Os5WejkgMDmdYcmt1eNsZ7EsaYHJy57pfaeiYoDf2swfVCtlg4izoNvmcy1q?=
 =?us-ascii?Q?Trw2m9KsTqnURUtwHOhNEIoJnWjQ2SLYVn0YMilrOu040/fY95e/TcT6ci0j?=
 =?us-ascii?Q?1VbBiQUWk2Oj0ttKWVx0QNs6dhOFdqF2TRCeOuIHERkvHsWzKh9kPG2upDdn?=
 =?us-ascii?Q?Awv0RlIklDbxLF5o+LwlNrlTkrD5afDpaDh+W3tIDeGa01g8dnrqAUJ1KkbH?=
 =?us-ascii?Q?eH84kX1+MdO8o7rZeDEGR1yCPOarWAm7zP8WoUAdGMCCYTulxOWKMvmthV9d?=
 =?us-ascii?Q?iqVvaPR4eCmCVJVq0Ms6r7AnNh5zAx7Oc52tA5rD0DtcFJHna5Hj5FSTK63b?=
 =?us-ascii?Q?FQrMgOJqNC1fjh75xLxCv5R3q8L28JNpgUK6Qnj4OvzUOjYZkqLRwbaeYrqf?=
 =?us-ascii?Q?KQfSeycL6r8MLU+WfIN8XidSGDPcELFhqOcCNMH0XuOoVZ/ZxoNT9e2yDekF?=
 =?us-ascii?Q?u1WlvGuMeIBhxNWUHyCPKPITGAu4k/Pv5/qLTrrf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3ba7aa-23e6-4dac-2332-08de2b3f91df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:55:16.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1FFgPEvDGaHneKDM3snAsya83De7Arn4hfhsVCNAf+rsxZ1diAZGE7EUVwcIFbl1KZgvQ4Lc8hiRazC9NwtjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8991

From: Anson Huang <Anson.Huang@nxp.com>

Update i.MX8MP imx8mp-pinfunc.h file according to reference manual Rev.D.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
NOTE: I met the following checkpatch error, could you advise how to
handle it?
ERROR: Macros with complex values should be enclosed in parentheses
+#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x014 0x274 0x000 0x5 0x0
---
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts  |  4 ++--
 .../boot/dts/freescale/imx8mp-debix-model-a.dts  |  2 +-
 .../boot/dts/freescale/imx8mp-dhcom-som.dtsi     |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts     |  2 +-
 .../boot/dts/freescale/imx8mp-iota2-lumpy.dts    |  2 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  6 +++---
 .../imx8mp-nitrogen-enc-carrier-board.dts        |  2 +-
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi  | 12 ++++++------
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   | 16 ++++++++--------
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  |  4 ++--
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts  |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi |  2 +-
 15 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 16078ff60ef08..7a05e0692d78d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -1085,8 +1085,8 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x4
 
 	pinctrl_usb1: usb1-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR		0x6
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x80
+			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x6
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x80
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 9422beee30b29..2df6434bde652 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -485,7 +485,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x49
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR				0x10
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR				0x10
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 68c2e0156a5c8..755ea967bb9cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -1061,8 +1061,8 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
 
 	pinctrl_usb1_vbus: dhcom-usb1-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR		0x6
-			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x80
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x6
+			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x80
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c6facb2ad9aaa..57accd33ec62c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -1088,7 +1088,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x19
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
index f48cf22b423db..f66c6b9236fbe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
@@ -363,7 +363,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x0
 
 	pinctrl_usb_host_vbus: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x0
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index b97bfeb1c30f8..6de4d4ace8a73 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -734,19 +734,19 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x1c4 /* USB_A_ID */
 
 	pinctrl_usb1_oc: usb1ocgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0 /* USB_A_OC# */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0 /* USB_A_OC# */
 		>;
 	};
 
 	pinctrl_usb2_id: usb2idgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID		0x1c4 /* USB_B_ID */
+			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID		0x1c4 /* USB_B_ID */
 		>;
 	};
 
 	pinctrl_usb2_oc: usb2ocgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x1c0 /* USB_B_OC# */
+			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x1c0 /* USB_B_OC# */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
index 1df9488aaeb22..9ffeeb382bad4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
@@ -406,7 +406,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
 
 	pinctrl_usb3_0: usb3-0grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
index 8b0e8cf86cadb..7b5c402ff9f27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
@@ -579,17 +579,17 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3_TXD */
 
 	pinctrl_usb0: usb0grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
-			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106	/* USB1_ID */
+			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR	0x106	/* USB1_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x106	/* USB1_OC */
+			MX8MP_IOMUXC_GPIO1_IO10__USB1_ID	0x106	/* USB1_ID */
 		>;
 	};
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
-			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
-			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x106	/* USB2_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC	0x106	/* USB2_OC */
+			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID	0x106	/* USB2_ID */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 16f5899de4152..50f5e674a6b71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -46,10 +46,12 @@
 #define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                          0x014 0x274 0x000 0x0 0x0
 #define MX8MP_IOMUXC_GPIO1_IO00__CCM_ENET_PHY_REF_CLK_ROOT           0x014 0x274 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO00__ISP_FL_TRIG_0                       0x014 0x274 0x5D4 0x3 0x0
+#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x014 0x274 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1                        0x014 0x274 0x000 0x6 0x0
 #define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                          0x018 0x278 0x000 0x0 0x0
 #define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                            0x018 0x278 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO01__ISP_SHUTTER_TRIG_0                  0x018 0x278 0x5DC 0x3 0x0
+#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M                  0x018 0x278 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO01__CCM_EXT_CLK2                        0x018 0x278 0x000 0x6 0x0
 #define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                          0x01C 0x27C 0x000 0x0 0x0
 #define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B                        0x01C 0x27C 0x000 0x1 0x0
@@ -91,26 +93,26 @@
 #define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B                      0x038 0x298 0x000 0x4 0x0
 #define MX8MP_IOMUXC_GPIO1_IO09__SDMA2_EXT_EVENT00                   0x038 0x298 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                          0x03C 0x29C 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID                         0x03C 0x29C 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO10__USB1_ID                             0x03C 0x29C 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                            0x03C 0x29C 0x000 0x2 0x0
 #define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                          0x040 0x2A0 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID                         0x040 0x2A0 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO11__USB2_ID                             0x040 0x2A0 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                            0x040 0x2A0 0x000 0x2 0x0
 #define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT                      0x040 0x2A0 0x000 0x4 0x0
 #define MX8MP_IOMUXC_GPIO1_IO11__CCM_PMIC_READY                      0x040 0x2A0 0x554 0x5 0x1
 #define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                          0x044 0x2A4 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR                        0x044 0x2A4 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR                            0x044 0x2A4 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO12__SDMA2_EXT_EVENT01                   0x044 0x2A4 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                          0x048 0x2A8 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC                         0x048 0x2A8 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OC                             0x048 0x2A8 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                            0x048 0x2A8 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                          0x04C 0x2AC 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR                        0x04C 0x2AC 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR                            0x04C 0x2AC 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B                         0x04C 0x2AC 0x608 0x4 0x0
 #define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                            0x04C 0x2AC 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1                           0x04C 0x2AC 0x000 0x6 0x0
 #define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                          0x050 0x2B0 0x000 0x0 0x0
-#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC                         0x050 0x2B0 0x000 0x1 0x0
+#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OC                             0x050 0x2B0 0x000 0x1 0x0
 #define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                           0x050 0x2B0 0x634 0x4 0x0
 #define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                            0x050 0x2B0 0x000 0x5 0x0
 #define MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2                           0x050 0x2B0 0x000 0x6 0x0
@@ -291,10 +293,8 @@
 #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF1_IN                   0x0D4 0x334 0x544 0x3 0x1
 #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_PDM_BIT_STREAM03            0x0D4 0x334 0x4CC 0x4 0x2
 #define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                           0x0D4 0x334 0x000 0x5 0x0
-#define MX8MP_IOMUXC_SD2_DATA3__SRC_EARLY_RESET                      0x0D4 0x334 0x000 0x6 0x0
 #define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B                     0x0D8 0x338 0x000 0x0 0x0
 #define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                         0x0D8 0x338 0x000 0x5 0x0
-#define MX8MP_IOMUXC_SD2_RESET_B__SRC_SYSTEM_RESET                   0x0D8 0x338 0x000 0x6 0x0
 #define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                               0x0DC 0x33C 0x000 0x0 0x0
 #define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                              0x0DC 0x33C 0x000 0x5 0x0
 #define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI                        0x0DC 0x33C 0x000 0x6 0x0
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 59642a8a2c445..50c8a7c2a7bd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -976,8 +976,8 @@ pinctrl_uart4: uart4grp {
 	};
 
 	pinctrl_usb0: usb0grp {
-		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x1c0>,
-			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x1c0>;
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0>,
+			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x1c0>;
 	};
 
 	pinctrl_usbcon0: usb0congrp {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 4bf818873fe3c..162329b403d30 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -219,7 +219,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x146
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index 76020ef89bf3e..02ea0e8bcc6ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -318,7 +318,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN */
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index 5eb114d2360a3..2b6bb9fcbc7a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -359,7 +359,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN */
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 7662663ff5dad..6d752fe0d1bf5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -1060,7 +1060,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140
 
 	pinctrl_usb1: usb1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d43ba00871269..28f5983a78469 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -1316,7 +1316,7 @@ pinctrl_usb_1_id: usb1idgrp {
 	/* USB_1_OC# */
 	pinctrl_usb_1_oc_n: usb1ocngrp {
 		fsl,pins =
-			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c4>;	/* SODIMM 157 */
+			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c4>;	/* SODIMM 157 */
 	};
 
 	pinctrl_usb2_vbus: usb2vbusgrp {
-- 
2.37.1

