Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39A342C80
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136700; cv=fail; b=tcFqlpmKqsWlUF2SW4nWodZI6pqoMMVRl0yqO/74tgxWT3K4+OXqQv4EB8kK87txOYPfbNDCjTa0YC2fXB6HZhfWV/fBHUIEQcNn9yplpE4ZJZ7JxiU7MvZ1gYjz5AfkRUMh36r1Tfoh4BaGYKzwHZhCsXwqlQfTq/MEOcCuZG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136700; c=relaxed/simple;
	bh=jMnf9//nHXWAQMeUbHPCv3hvp6HLrS5pSYkiA9AkxPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EYUp9blMWdX3ugfi15sbNScxF9OAMhIieEy4RQFgDtsSEjOzqq6rVq0qZnPiPdm9qMnFAgB4eYvSi1AFlFlST6hN0lD3/px32ZpsAoqG2KVJNPftyRTXo8jKcpgDph0eWNSm6OrkolTksVBPiXMVlFCFRiVbwPDUAIdKE1PU6nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U8DbRl09; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U8DbRl09"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/UZysGceP0yEmkjGtG1uRKnU976Y9HQWcDiTZMeLwHptSOKyg+0eKdrhxPqZ1SVE5bXHQ35On5a0Tq88os4vMbhaB0UMvBXk+hhX0iitQvOhIHk/mMd38xopnUn1r4mjeP7rd2uR+XMwO1QZqxeo3KVYTPpRiQqZiSC5uy4nGSBAEFHnaa4U+qhnpfA6hvyZ3IXOIP6vE0lNeB5v+FQeJnEQOu1mru8s4QsPFQnatAylgRE8hQk1fDHEzuELYRUSLTNYe1/4iSHkCbSsy1j7T0sRvv5jaBTmQXoFGJl7VnfIRwhhlJG1wNQbv7onJN/j84+B9XWq2MDwEA+OCTaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB/B5eCZzUOV15XNTpU2uQCMulu4NiL1JRANB4OUz/s=;
 b=Gz6GwyeBL+5o2jFtgcdKiuEEepTg79AmhoUaQlzPHNOl3uQ49JEqiSX9GIsxJ6E+AMDnXp4D3mNk7OPLnJWnmOqAaCUftR3AljJIdfL/ZH8YIMhzGtuY0w+FpZt+bEIWDqOfFYxAO/avWVd9b9UK8MZ6G2Nk8+0ZZvy45fITJbEo6rPVbOFSwQaMnSaMc2Li7b4x/H23TFZI4UN0PbVYT+k415j7Vju8Q+klOIXHLoFFlP+DtEHht1UtrgGlY41tUukkxaIrbVg4NVAPv02so2XEIt1oifZtg3YnMDiT7oAvKtMHLmx4QR01aoPoDgMHY4IfwTZCIzVIYBHQp81wDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB/B5eCZzUOV15XNTpU2uQCMulu4NiL1JRANB4OUz/s=;
 b=U8DbRl09/O7M+/Yv97O3yzVID0SYJSguFF1K4CTaB/mRc+ID2wT8TBuNSPuj2WPA6KzqYiISKGtKssAwtfFx7QkcWUHyX6ugD9kiz0VP/YDx+T+mtcgF9c0m9LpNqPCb0+5M8BIZdA4YNvIK8hXPEOtH8bSmC2KpqvtnCnyBlVokkbJQO0QZ/c26FZu7g47wQZOrK67zQ9kcQNz9Ffg8dl8cVFfP3987ARlmBHX6cfBJSlKA250qVURVhzeaKrJKJ5WfJbjJKYD9jT8b9n2nvdiVKO7f7n7kWl+MU0N5Xk7D6URF0y1BmM9UKCnGdDQGQAQDegySTPd4zQfv6vx5QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB9759.eurprd04.prod.outlook.com
 (2603:10a6:150:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:51:34 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:51:34 +0000
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
Subject: [PATCH V4 2/3] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
Date: Thu,  7 May 2026 14:53:29 +0800
Message-Id: <20260507065330.516142-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260507065330.516142-1-sherry.sun@nxp.com>
References: <20260507065330.516142-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: c57ae53f-162e-424a-6dbd-08deac051414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|19092799006|366016|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wyEHm4/O0s6+RzW78DC0iHje9+oPmfivQJioiNFAlzmUzI0MjZGnhX5zVoYluaszvN01TmV1kRzeu3tFL7Ul/YWJa7IAdgYjFRHD9uHccvuO4zVZFXy9LLUsSzCEt/Nch7AY6o1YwV3RwNJpMsJqo4EJyDJjnMCjn3Q+nESR5b1Rc/Ftq0afEdyvm5gnLumGHnAaRCF3/snDeHc0RfV+FgpsPuIRfIRYYNNNOewbFYuOBdWjumoWdU53WLJgIZ1aNCaiYLfrP20hDKOT3gHS4XK6I6St4rsAzm+3qSPPw21Y2fcz9yfg40vodKi99jKURqZJmiI/BFnRJgaiqAIhBuaIKUS7SCnXDkoX/nYUTQSUzST6SFQOefo3z0c+BDf72I6ksQ0LB4zJFkqkhwLmeRoMsMaEFTUWDXr2XChWi/GLMkMw4IsVz70BGAlY1o/lcNut6fLDRzj0z3qs1+Ltmrqwr5Wixxc1kAPOBcGZNBMBFlMb9kYmxNekd9t+ezE4CUKac+keYxwk9/1T7mwG8Hi111/PgofA03Jx+FyfaIely/Vm1bLPrkBf0DMi1dYLwP/zdVI1FnIpja23C3Tm7wKlxK7tZELbGYGOre77l9lcx0KOa4RjEsVaAVYbUxW+KTNEdykLN0qH1zGhnmIfiWtfh29zkeMr1naR1RZb5huVTBCWtn9M3jpp44MoZFXDp7px8ZLWDgeN4eRXpzRaKj6fQNuDPeLViY/eEfD2O2Kz/JUPn1FBPwFyyW2oPcDR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxlosdWlavm9X63p6GVRuvmyn0N76uNPHckvZyo05ZwjImL8dVSZfs9C0bMO?=
 =?us-ascii?Q?zQ+c4mYtLr8ucpSDcg62gX7TxWMggoJhN7rFSrBT/2StOKU4YHm30tpgoQdp?=
 =?us-ascii?Q?p1qiHLPF8hZtFLM7qzls0zmXq73Q0rt6Q5jfz2irlTBxxJ+Hw0dYuYUESIT8?=
 =?us-ascii?Q?tsS+NVG3HzC3wmS74IGVb0++vU/H/TIcX8R2UvFtXIHB7E188BZjQ5+xce9Q?=
 =?us-ascii?Q?AnytcO9QzBaP4ycZdFvinBLbpeGqadCvWXm9JjsQQX2WIExJMAHaSetLXAft?=
 =?us-ascii?Q?VT7hq9siBbpnsfR32+6rg5b41swaLSe+PfGb8G3OWhdIYzB7dA7In9F1QR49?=
 =?us-ascii?Q?aDuXaSPB+9fduPYWNByWseoYTn9U+GJgEz1lToJmQnSTNs6tjcXEBQ4HOAxR?=
 =?us-ascii?Q?fKgpRa+8Vuy/kEF805njVi0gBt0ULw1GCYJNyg/f84undDJ3JgIGCd99PW6Q?=
 =?us-ascii?Q?hsZchB7QVoZdUNiqPsqo+3PED9ejhdPOP6xAQ/JwCUeTlsyKBCtnntNLI4CZ?=
 =?us-ascii?Q?Ah1NnjaAeJLzgjq93gcsmY0jINvi0O2fvX409Wx/ayKtuaCps2N75Kx/vsGt?=
 =?us-ascii?Q?HDf/PGKBmuzG5tXITJOwD2fheEoe/Ax49mkd0QfoKH6tQ5VwBguN4ugfZeDe?=
 =?us-ascii?Q?2IWfm6QsuR5zfIH6h/DuIq6wD9fO/2mmKqQFqSAMAhv4bGuRV0DNimPJbqwh?=
 =?us-ascii?Q?Ra59GO3D5he/J5+LUKVWmYjp06tLELvuus3D+a1B+hq3dsCtawfVJf1HFw3l?=
 =?us-ascii?Q?Wc1tWS8CsBXRqDTYDE8jRH6Lt1xEKbXS1rGpxXg6VqcWRnxv8pGLTflsGSgm?=
 =?us-ascii?Q?rWSXbl6BY/VryF9i2ywQVLrKzy/uewoBpGk69qZsZizCAJUWR/rOTOHgBWR+?=
 =?us-ascii?Q?ycOWtMQkTo0NV2/vcZJdOq2frp4kLjVJVv0dHH8jws4xNg0uVNvy7NbkFobx?=
 =?us-ascii?Q?8F/IWbVTjI3UWbo+VVLWS7XWpcBjyG28xaGg8jrCNgHAJqZ5BrtWwElLkrsd?=
 =?us-ascii?Q?ar6hwM97AA7k744usWH414fYLqVJf4ss8wr/I+2yavPing9kXPm8aSg3i5Dk?=
 =?us-ascii?Q?P8kysIKwiN9MZPYQxXhOe1X0Bm7BpVsWEm516eOVaVDHK2A//EQma7jKhaMu?=
 =?us-ascii?Q?i3ntS4xrdKsMDwqbKS/0xQX0I0ATnomZYHkSkVAjzrs5uUZldF7LjdgNVTml?=
 =?us-ascii?Q?9849efmKNpsi0iSrjBX+RTm0l7cl/N1H3vvPnFvos0qGpr5TaBGvsdH4jYfg?=
 =?us-ascii?Q?FaOgreXPJaVIcwuWRBCsjLHgo3oPsb0+IqXFbEVKb3m8xGF92wTu6w7CFppm?=
 =?us-ascii?Q?W5tk41ZSux6YkIArv0krXVy2EPb9lA5Dsbqvj09zz4do20d8y23+SAjf6nUm?=
 =?us-ascii?Q?5bGFSIVxr2zs0u1MthukKct2j5hX3wBlWhCTlTJHVw8VKlZmHHSNYEJ9UadP?=
 =?us-ascii?Q?sx8PzebjLbRQsvLsQKwJv14t6vIh4ulaJ6f+g3ayTfFBTadruzofY/eJNjVp?=
 =?us-ascii?Q?Km3ttj69E79nD7IK5tn+ReYjJhJW6eAwGLAPzQp+QvBTDlbM5W5RyKNXv6Ec?=
 =?us-ascii?Q?s28YDdC1956A39a3aGU+4OP/bYa2eAcHCY4IpQdqJDBCUqh7atNlc/XuhDxN?=
 =?us-ascii?Q?Ez4Aod1ICL8MyWvA5qqOXKn1qUbCl1dgVDShrOAPl/6gYOrmGiuJJ37D4fwb?=
 =?us-ascii?Q?mW7scTmB/j3aD5Icb9vW0dfJ6k91NadSPLC6fT55qOXFLn6+4oNsfLx3SeNS?=
 =?us-ascii?Q?qF8ypdL06w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57ae53f-162e-424a-6dbd-08deac051414
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:51:34.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xy/6W4P8JXqaQgigsctu62cmuTXQhPwNVSjJW7rq/HYBD+DLURhOuyj4+trO2ih7k7Gmu3SOEYWgvWc3+0/qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759

Disable the PCIe bus in the default device tree to avoid shared
regulator conflicts between SDIO and PCIe buses. The non-deterministic
probe order between these two buses can break the PCIe initialization
sequence, causing PCIe devices to fail detection intermittently.

On i.MX95-15x15 EVK board, the M.2 connector is physically wired to both
USDHC3 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
enable SDIO WiFi in the default imx95-15x15-evk.dts.

Add 'm2_usdhc' label to USDHC3 to support device tree overlay for PCIe
modules. Users who need PCIe can use imx95-15x15-evk-pcie.dtb (added in
a follow-up patch) which applies an overlay to enable PCIe and disable
USDHC3.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 7eb12e7d5014..e4649d7f9122 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -557,7 +557,7 @@ &pcie0 {
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
@@ -1137,7 +1137,7 @@ &usdhc2 {
 	status = "okay";
 };
 
-&usdhc3 {
+m2_usdhc: &usdhc3 {
 	bus-width = <4>;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
-- 
2.37.1

