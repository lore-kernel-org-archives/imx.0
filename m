Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F333F8C5
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136693; cv=fail; b=VmNB46kXmD9vZ2P6p5Y6jdJUa5bzF4GKOdiLG9xwCcr7zaRWF5YhmTnW8SreGSb02Yj9sGjmzaFhpRl5lFk9QkoINqPWX9GbI4l/vQjLcBpXSzC/FFhPyafZFveYuOuxIaOgF8Fl7omVaPSSFfbLZMjYcpzaaLEm+2orh6kdF04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136693; c=relaxed/simple;
	bh=k8+7PYlcecLHbb/TAr8W8hu+KRH/EhHVLxaUDc+XuS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H+MRme1oOh1GHXgKKiU+YbfHkE3yB7ti0LlD53Vn+fsFihnptN1bhvh0rcsVac/yUjhSX9EWDZ4mpaBwwwk5gHs5HOHTFBdeG4qJsxfjYv37/ofW+hhgZwz17UbDtRIHkrlk7zF8ip4wwnXmYN1a1Yhh4olntwB+/LAyzcLvB2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HB3S/l7/; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HB3S/l7/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc1ac5TwK8HV4mbcsMEyy8/CHhBMfWVQpldUfci9phY7yfv/EQwpDKBnShcWtDxpWk05OAlfgawQ3W3ekcFzxxEK71VnW8TmxqqAgxXiYdIkYpM4O4MiXmfPBv28lnyE0Xzy8TV3I7Kdb+qRxaivmiJ+jiII/Qwc7pKiVlxtrnr/FCAAEgQC0hEHVTL1caSfi96DrqtHLZkfPonj7KoSZqaYKuovT2ZIKverkUe6mL+jEvIbLZtoJtTMhMX5u4/o92UgU2V5JSm0YHXhnnatnTOk07bfEeY0acyrhAlY46PiZ6/fDXWiacQ/pfgPlxg8xrT/82znLe47RyV4gXuknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eavzJ1iCjvXxquu9JK34VWQSmABs3YXRpnFLjsTYBhY=;
 b=XtB6lk9hOuwy7bYGhw33IPAideDBt34Yfkt0BSuyeUjZSh3xFEAoPAFIXgpqI6+9zvZ8hOXLWg7Ghk8cb2HpONJvUVWWI7MjoH0ULVUiI0jYdmKjYy2DAiVHDeF5cCPhL9+S51oMXR+Jp/PufIMYA0dfmhpAlsjjbCBNaoLg2pWSZBJiEU9YKhE8JZ2FAYJeuoEx9veN4gz/ZlhW33/lvememKRtBE3SLWlZ6A56Q+Sm9qZ5kG3mnyp0957e3oo4wkMhKEdbnE9C/o9dE7+Y96alplOLjTp4NX0Hy0W5HTl4vdIw/BMyc3HV13HLILHo/hG73VF8+rHBpLgC16SagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eavzJ1iCjvXxquu9JK34VWQSmABs3YXRpnFLjsTYBhY=;
 b=HB3S/l7/x96dE5BaeGGlb0t3TFXNkwZe9Ow+i3KjIYGJVm4/ebJo2Gp8a13mLTHHfi9xjNme3WrJSBnXvWI2mp/+hmzLcgvgO+SM8hdh2Ga4VLnxBVobdYpVqJJ/cofZKXtasLBjg69WkxBOlCvVkK+DlgS8Zho1BjR+Hz3JF1YqdRCBDUqdGra8KutoE6NVGEDzOa+dWoQZsF7kdMZ4IhWeNOTI+8CeU2CQ7ataJiM4yUDGdNdhLJXIPB+a9OsTPqyO2Uc1qNxUUs/gmXvMO4DEDWA5HIMHkZP73CpVdYwWD/wJiyazDAZCIiauwL8Ld4mQL5DrXO2B8ZiBGGwHGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11815.eurprd04.prod.outlook.com
 (2603:10a6:10:622::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:51:29 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:51:29 +0000
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
Subject: [PATCH V4 1/3] arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
Date: Thu,  7 May 2026 14:53:28 +0800
Message-Id: <20260507065330.516142-2-sherry.sun@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DU4PR04MB11815:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c8db04-b099-452e-2092-08deac051101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WlmiaMFfCX50lfwecCbkhqPYfTj/xu/4h1VUcsZCobHfUnnq37vwDHT1MWAr+OQS8St3J1PZaQw5o8IIYnnlJFiyioncq2vmyE3gNAcY40KZ6eT81HU7Ok1Xrw3PLKGW/ii9Wu3xnO3zSr3w3rnwqxgecoMlQSmg22CEWoNeROKj0aXvha6/yb4KfSjnCHilW1jJWIRECDvMGU0VayMtXYzdl74Wer8rxdD61KD/XHgvslb/WU3cfPLElKhCG3q3LhM/MIofqLRtwNhUbQI/tJlKaF/GXaO7XeQKXecEu7ky1Iyno4wOnzlWBnKw/OMoS7ul62v2Prh4RoE42OPXtIB36R46Qi9wrLpq158S+j6CW0nc7X0qv9nHHYFrRb9UJmGLVcuifnLLBKloIjbK68FpKnjJM1ztAkOpr34FVYzptbhzppZnmxDSbFoAtgYgPMDNHg13x0PKKMJ0tmw5T51T5pl+ODCz3pYx7UQ0OiLk2K3mP3kv/CwwY7PgoQUwouEB6AqMXhfar3nMcOEfjSKi47Vt6gR80caK1MsbnX4NC9X9TWcrBfkQqjfWN59IM/n5pK70yBRNJU+cfnckKxwIlKy/pBELhWxst9MjXPzAignOZr1LKK1Gjgsz2PaZC4JhDMZMaP4819+4R7Tkp/5KTjntcyqY54Uk/no5qm395j5bAhexWQqlutXtSEevJNAO0Jz+YzXcnnjIdXavqhPyriFyFoudWyVkldkFnjTQbb++gBo3C3rh9ucw/t4P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g6KvbvaNBYAB9Qnx0i8Oomk01pysR4XysRerRKwB/fAAt4lfCUsU8a1QZG+W?=
 =?us-ascii?Q?H0hwHc+Zlm5U6nAoZjBqd5iUTiD64gPKWEM12cnfwWVR8QJ1zMA25Z5O2ccs?=
 =?us-ascii?Q?dB33X7DbOf6rxmipByEuQjc9w/Zz0npmQCoZcujwyG02XIgDeJRZOzyXX/OF?=
 =?us-ascii?Q?Lc8hU0DvqG1Ceb0Tb05t7yBQckuV9g7jFypjbhQddUpPVhdSFLjs5UdtTJKv?=
 =?us-ascii?Q?YmsK8N//vfzqN/ppefq+TvXmBGXw2OzI1rHgTvoiC5DVI+LhJky94bZc41V0?=
 =?us-ascii?Q?DJ3iozrdbyKeIikpE8Db8DKDdBF1MixRQ3zcEe4iGhW15CMEmrvPueA2IJxC?=
 =?us-ascii?Q?tookLXKRYufpWjooCxRwUVUmO6VJ6iQKeAZXiXARvvHXQi0wkhzsZurtzE4t?=
 =?us-ascii?Q?N+geMFgK+20b1fBziNrKJkrb+57oFkl+G1zuvnEoK5RN1nRPyAlgtZ3O26Ny?=
 =?us-ascii?Q?YJvcGacX2UxeBQJXi+8eb0T21VYXA4sqw2lscQEkPhS5+s5eZ3mjUXLwL39W?=
 =?us-ascii?Q?ZQrDl5yu0U16PcXdhvVYY9x6f9gjt3Gq14KWh0yrghpa/VSLtFre/VDEz1dP?=
 =?us-ascii?Q?vngOf/D3U1jLtg0l5PnsiJTr8eDa5A8mBVHLAeBbiZWmj3NUkH7T4wH1wB2z?=
 =?us-ascii?Q?UksU+Wf/GHk0/X8vQFxIRlIU0ccCzQSUZ6zEqXOHmNTQe4G3qsk5thsOU9Fm?=
 =?us-ascii?Q?lRN0f/hkQCdsrAs2XqFytaSSVlru722MqzMNfyw9cKuxVwRKM/RClpj8fC+0?=
 =?us-ascii?Q?GE2U6tBzc3zD7HYMMPQihwzSaNgbjn8+kurBrExEMcEmSOvYtKg8EKWNu0a/?=
 =?us-ascii?Q?teUzt9HdZDqth+a3YthNMpX5IRWHD0o3pcBap68DyPTs90zeWh87xJuNpzNo?=
 =?us-ascii?Q?UHXBgduYTrbw1ES9HPhUeNiFC0TBTGu3TJX4IA2EFii2Hv0kzTulq97lpRMG?=
 =?us-ascii?Q?A1rXRLDcItemZiIukGTFNVHxAa85gGBDCIQuwAzIm9rNFxztxCer/kQ132OX?=
 =?us-ascii?Q?avoWHlrhVaDJKsmGxtgEKM7xRnANqSX3sP/n07Q3qtnYIpOAJvwc/JYrcSHI?=
 =?us-ascii?Q?KXiUCTe38vcucVwcbbM7A57oiVkvNoSfJQ6ZijNhqNXqCTPOeT+BRbDYCndE?=
 =?us-ascii?Q?lH+Uk6VRcsjPhFlaviI6RlVtP9+rKGUIP6Tt6Cw9MU5Qopc9ZebBjbbtFLpe?=
 =?us-ascii?Q?B0kOsFZWCQpYKgZADkA8OMmvzrHdt833biPa3zfu/1VcYkTE9/7TGakEybff?=
 =?us-ascii?Q?ySNrtW8EtFF77t4N0J1KRLoOFl2aQUkNPdbqUD8294qh9yELOKwwT9nJQHW6?=
 =?us-ascii?Q?u+Rgjj/2ifHI2JdAbLIQzEPdLxBjb63Vcw4Ctyry8TVIDBsXgehBs48rvfVo?=
 =?us-ascii?Q?qugBlUlPbKenJZkrRq54EWTapICue5MSt4u7Hd0oizSVh3nT6jh/PhzKlVuu?=
 =?us-ascii?Q?1rMCogQQTLmjaaQ8jrhyceYMEi8t26sIp/pQ6nsyjHO8+NsFmyb6V8okdStm?=
 =?us-ascii?Q?aTbPU0eyWIWgEmGMA8OvdWl6nMMHxx9aGQ8dzQT+aakEF3DcaP+D4+tzyXEi?=
 =?us-ascii?Q?1HhPHFiYrRfZjT5JNcpiFZzkLeXNh+iJfgTBCoElklOetNAA9SCxiKYfQNNm?=
 =?us-ascii?Q?C4R7wZ6JiIpB+U5vDMkUK2UM55eiouF1ABTy3bwOMlS9QXZ1RwaHTY7ZUKcC?=
 =?us-ascii?Q?VbLyPAoQVMA9UtQL8LLtXUvDw5frMnKy/1PJNCw9yr0MPPDhRfpVYCimG7qE?=
 =?us-ascii?Q?E1/14+lihw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c8db04-b099-452e-2092-08deac051101
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:51:29.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMBJw+nBymGaM1KMAXjeNCZ39ND0/2d9yRetWZ2cGQdXUdQkX1qNBaXQ7418zFP/ijQSlUrsVzBey07A2gNI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11815

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
index d0a2bd975a18..2feb5b18645c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -774,7 +774,7 @@ &pcie0 {
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
@@ -870,7 +870,7 @@ &uart3 {
 	status = "okay";
 };
 
-&usdhc1 {
+m2_usdhc: &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.37.1

