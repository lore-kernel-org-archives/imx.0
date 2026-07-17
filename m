Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F63F8EA7
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290023; cv=fail; b=u1azw18X8ej+ToBYnd63/FSq5XJ72tcUxaCpKpvYEOdBys/wVK4WdgDUWbZIugBZosytVQBhnaK/knQCIx92HTyxFQSrCucnVPLUGMbCc9fSeGuM1lwnP3vqek0FrWeZRYInjefps7DMUuX24pgiPptp9YdPWGNue8+8D+8PDus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290023; c=relaxed/simple;
	bh=wW4it0j6E2wTzVYlLr6qCu+fz0oWhzeKgo2rsLE5zH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8z3PSNVBQqPf3JD7fPh5QbyxvDjw3SHx+fBENzefbiNGZ7PIbIiOe9HUroxsP44YXgZGEuJ9l8Lb1mElbWQKtBFmXPEiPZqlD9Bezu+VDk82iOGWKA9Am5YAAWNL9+V5CJCYrEcw0fH7YdJ1HblLrJ5VY9LQ1jyTfGm++zUICo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S5qIltOI; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S5qIltOI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXHAPzeu9+qu/KNkh6Esb6dN1M3PyNUVCu7Os02ykGPlPui1EWipxiDDcvdgyeZqNcteHm2gOLbxo7DcbTTeJ5YYefW6i/XKZc+u9SlD2qE+j6jPHJThNVrzQyXeJroCeKTwW9X8qfElmTVYpohbUjB+oNpGZiMF0JVP+Ufb4Pbs5r5vQ2LgTbxwQIT1ZAcVL9NjjwFd2DbLrTT2D3GesXqjS7cC9Xa3SSrNw616vRLZehXAWBwbNtYi+nwHGLhbo1sgBVwDd1mJOQ9HdUui2e7Xl9ayh+T8OrxVQlPw8wXSgkZKPHej6zJ7ykz+Or6zJoJuJ4sAVZdkT2ZSlp/M6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK1FdXRO/U5R/WXL6QSUkSWMsl0VzFcwaz5pMPFOvgM=;
 b=hN3uc1WR+Ez7r2gcsoJXD1Ez/58G6e4JeqVKoZhrJoImEbrgmQUF4wWKzpvC/CK1AISwAKeGb8SzUSxl2UAroIwGOIasyk4yflnAk40j4fxc/rifxNkgnEyJvjCBwQonhrM44BdOY8Hihu2vT+zB2ETNKoScjH/0TKNW1aiPNtosB3tQzMLwAtafZwmRhB+CNHS1RRJ63c/FsF1L2kLqxC5CI8DZzE5ubX5vrR+KhYqrwSFZh9nB4PJcFSaccfT45i39EqbyrQlBO2Ps35LDwXnMP9P4lLI/vcwPJJj3aEd8srTJT8IQkc2MF2cLJJiSUv9sOZvVznJUvzbqj2djxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK1FdXRO/U5R/WXL6QSUkSWMsl0VzFcwaz5pMPFOvgM=;
 b=S5qIltOI2Zxt+9uEkpE27P9yMfOKG4ed1RYECAuTP+WzxNGN3Px06Uuu7Nkm3g9k4zNwlHAmWCUBIZAHWJdXnpOxU0MN6dWbOWfxrokttkiPk/dsJroBPpJP6OafC2MEi9q+3yHsSX8nuijVCs8L6pV18cFg3TTYetyJd2kJ+SZqhm/Kl+Owkn8fKJwFNkna1OZxtAdtkCX2k2mwODEkY8Dw8+cpiIo0/eSjsrMI90vWoF4PMF5Kbf3ygKGtjZjH+bXqJMrzww4JhXuLFPeWpoOEoxHvsX8+NLOTgf/IDru3R+uw2lgUDayLxg42CHxl0H+VcHCyFkDzO7MMPtODCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:58 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:58 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 05/11] arm64: dts: lx2160a: split the dtsi to avoid delete-property
Date: Fri, 17 Jul 2026 15:06:29 +0300
Message-Id: <20260717120635.2118610-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd22ecb-e65f-4da0-f2fe-08dee3fbe6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	evoipKMhcJrYtKkdpJN4JnJ0xMw8IBKHrK8u3xvYnlByL63dGjZd6j3xEMkBReibeYTFD0rej2MYSfCSPfIaSatAKpxD1KbuQmTIapsXvmKHCOQTks4emqfS3YY79YsGgydgzQBvS3jh1y62vXHH7OTHZ2z8D+eUIFiPbKb5KmVU5xHBLyvlcBG53Q+M0ZpLzEz/K4XE3uUhcAAnpLsJf0LTEBmEgjBj2vkxze4J+J/Y07eDrDRGOjO/cwZ5mcoNdQds0vhtymJi/OOHK45V2K4CALJ0SArAAjWpHBmhg7gFp9RNWHzLGC7k6wUpE53UPR7oRrs0g0M15Dtpgrx4LBU0PrweONEq/lWs66zaM76ZRgRa+ALtQuRmj/a0ENdk5XjmfOWeGg9jXTqt+A4fVaQIYv8Yp780ZRiUWDTPRnXTkai6P0WoeelhmIVoH5V1aYZwHNA0dWHiHLi+XG9Kr2eQatOn4PKjoAJRQ1Xj0AAkrrLv+1Xk3dsF+ihHpyMBQAIVyZCO5v0kgff84DP2F+3dEoKnaQFu8zGZRhgllKHnIX+bO8YZCWLO6W/OLREBXxX5o1qo8UdqmGSV2/N+NNCbFE84XI/r7OphadBj8q+vc+mJ7OlR7IZB4lmbqS6t0lkG+jpg2UDNCkjvthnmeL8+LQhr64lvUUV3TIZGXmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+W4Veuc+77szXrvSqR8HHTTsdPSzYZ4cbgO8xuYbtsMui+ro3q0DUZQHdOUE?=
 =?us-ascii?Q?1J2hWVvNRBSdEAwNc/uGdehiL0KfAJ68Eiyu0EroGKQhvj2c3Oll8Ct1sc/4?=
 =?us-ascii?Q?PZcVCq/+RwSge78gY4er68P06FgmeyxXRCZbV7V9I2r0ad0FtlFMrBzbSC5r?=
 =?us-ascii?Q?BsGiidQhZYf0WyGm1+5Z/jyJr7XzCs/lTx+77uBsGE443OSc4tlf+1thAn1G?=
 =?us-ascii?Q?6z92NqyM5pnAChLFbucgEtkLgH6y8KWDHcX14V/5m62kRxUIxhrtXo59Ut66?=
 =?us-ascii?Q?waRKhDVwsvT1fuA6kJ0Mv8b1l7L13hCsyYbW0/8to8xHdnF/ym+bMiAJwFBP?=
 =?us-ascii?Q?4cImeZSoNOd3QmIfgtamUlL9VTLETKxz4KMjfSWo151cCmp+MSjqG0PgrEwB?=
 =?us-ascii?Q?gkQly8gjPi5DXmgn0U43JMOE/1zFtuVSesubxZWrN56jkhRMdbVmHmyXTAa2?=
 =?us-ascii?Q?LC752GrsG3oJgPtnHcNC8sL1D8+8io6eak9KOkv+wkDy8rcmsHe2PWjjGWnI?=
 =?us-ascii?Q?Bpk+A2HIHleMUWV3V6VAoUROc8UTmMhf0l7/9FJCCEIF82ZygzG5C+gTvzl9?=
 =?us-ascii?Q?zcbrZI+Npf9Rs45PF8Bb+vExD9xfEdT1RMPdlTUhOXXkpwCdUWDYgxGtZJc1?=
 =?us-ascii?Q?cpNgCjQceVHdTdCIINa6PFTRtG2Dh0qpQcZ40hwyMFUFAzFQENfXh5JJY1nM?=
 =?us-ascii?Q?Z+fdbQAICcFVl3EKngfh5tQJ/bBB9fjNOGt5N1Rs2VcfCUAC/XsTR6J+Bdhy?=
 =?us-ascii?Q?33RaparQTMo5wcIbqv9bqnascXc0nejr3iUQMOaRlAzvjOXcxIhfC5KgG+1n?=
 =?us-ascii?Q?2AxTKtjmU1ByRHmb6g8OuRXNhODjzvjv5Kxp6s4U1ETZX7Dhn+nqomcW26JM?=
 =?us-ascii?Q?4T0I2DLBAKiy8TYIbBvWpL0qP9NgR5lRTsALszO8iDg9HrFFqP0zkGZ2uqfW?=
 =?us-ascii?Q?4jbTgkErKobDOSNie5DPgvmv0poYUL103LyN+EvFU/rYLV19OB4CgAKZqcF5?=
 =?us-ascii?Q?kDbKMNL4+c5PoL0DD/Yf3gSFz9Lr2PFEeKui5GVCsIp58gmj2qkvdDOnQcEu?=
 =?us-ascii?Q?6F1OBuvLwLCZB48y6Ce2dSZ1Q+Iaqim/FTpz249ezCJg79HIJPQG4eMOxrm5?=
 =?us-ascii?Q?cmJA5ZImZxcIPc+Y5NfZAjiM1m9q91824fUKHqUzhyT2aN6I9vh194Av+Z84?=
 =?us-ascii?Q?HwiPQ6JTXpbLWBOsRMqyHmQDFGrImf3K88SMwjreAZejfvwYleSMGXyC4lEi?=
 =?us-ascii?Q?p4v6rOZrH5VSdzPRRpQxRqpPBY9EpqkraHaYxzqg7PdhMMaq1Ff7UWhEaUb+?=
 =?us-ascii?Q?jEa+p6BZLZwXrsVXh2hoXf47tl2HJboLSdbtLPchK137JZ0ImuMAPakc1ZSj?=
 =?us-ascii?Q?yVo3NBrKFuc0AqUhdKX0TYD+NT+1cQi9bsZ8y4WaHtJT/x8xubluLxdsey+/?=
 =?us-ascii?Q?o8DKHhvYxTPA8Qc7m3gdiNcs7niDyYjzKHA5W0hOorVKzuPzkc6/vLNnRu6q?=
 =?us-ascii?Q?r337vYSQOwnntst/LVHO+BzZVlPe6d0/9MD4W+8w9zDwNGXpxqSmLD+RAAi0?=
 =?us-ascii?Q?4mX/vVMPu+uKmMqcmyy11HiumO1GvYAA7KceryOwgn0/BuxN2e6E7e/jDTfM?=
 =?us-ascii?Q?xDYim0P5OGpXmUljZ0QcsIF9ZS+7/BnttFfeQ0RiPSfUxghTsXrnyadrTqVc?=
 =?us-ascii?Q?XS0miy3+5rS5QbMp+CD5vk1OaMKskTMImTrW0sfS5ildPNXz8PKmrz4jv5NR?=
 =?us-ascii?Q?5IuMjoIY/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd22ecb-e65f-4da0-f2fe-08dee3fbe6fc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:58.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGzSQbtHyxc+d6PY4c0HeepTgIQ4Ww55o8TGF6WDYE+ORfTxZzTqaAtQMNUqOHh321BQ1NbhmBZbMHUUdHu5zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

This patch reorganizes the LX216XA related dts/dtsi files with the
intent to avoid any delete-property usage.

Taken into consideration the differences between the LX2160A Rev1,
LX2160A Rev2 and LX2162A SoCs, the following structure is created:

fsl-lx216x.dtsi		---> fsl-lx2160a-rev1.dtsi (PCIe gen4, 3 SerDes blocks)
(no PCIe, no SerDes)	---> fsl-lx2160a-rev2.dtsi (PCIe gen3, 3 SerDes blocks)
			---> fsl-lx2162a.dtsi (PCIe gen3, 2 SerDes blocks)

Each PCIe integration or SerDes block instantiation has its own dtsi
file which gets to be included only by the necessary SoC level dtsi
file.

The dtsi file describing the PCIe controllers found on LX2160A Rev2 is
also changed so that it does not work on a already defined node but
rather it describes it entirely.

In order to decouple the LX2162A from LX2160A, a new dtsi
fsl-lx2162a-serdes.dtsi file is added which, for the moment, only
duplicates the SerDes related nodes found already for LX2160A.

Any dts which previously included fsl-lx2160a.dtsi now includes the
-rev1 version and any dts which is clearly intended for LX2162A based
board now includes the fsl-lx2162a.dtsi. This patch does not intent any
changes into the final dtbs.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- New patch
- The only changes in the final dtbs are phandle related ones.
---
 .../dts/freescale/fsl-lx2160a-bluebox3.dts    |   2 +-
 .../dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +-
 .../dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +-
 .../boot/dts/freescale/fsl-lx2160a-rev1.dtsi  |   9 +
 .../boot/dts/freescale/fsl-lx2160a-rev2.dtsi  |   3 +-
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |   2 +-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   2 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../dts/freescale/fsl-lx2162a-serdes.dtsi     |  21 ++
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |   9 +
 .../{fsl-lx2160a.dtsi => fsl-lx216x.dtsi}     |   3 -
 .../dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  | 304 +++++++++++-------
 12 files changed, 234 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
 rename arch/arm64/boot/dts/freescale/{fsl-lx2160a.dtsi => fsl-lx216x.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
index 042c486bdda2..e035e4456867 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev1.dtsi"
 
 / {
 	model = "NXP Layerscape LX2160ABLUEBOX3";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
index 802d7611c647..4e47bb389af6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev1.dtsi"
 #include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
index 2b1e13053422..1a603decd034 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev1.dtsi"
 #include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
new file mode 100644
index 000000000000..7538dbdc8093
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree Include file for Layerscape-LX2160A Rev1 SoC.
+//
+// Copyright 2026 NXP
+
+#include "fsl-lx216x.dtsi"
+#include "fsl-lx2160a-pcie-mbvl.dtsi"
+#include "fsl-lx2160a-serdes.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index c2a18cfd8efc..47a42347c230 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -6,5 +6,6 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx216x.dtsi"
 #include "fsl-lx216xa-pcie-gen3.dtsi"
+#include "fsl-lx2160a-serdes.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index 89a4765737b4..cc6b6427ec8a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -5,7 +5,7 @@
  * Author: Gregor Herburger
  */
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev1.dtsi"
 
 / {
 	reg_vcc3v3: regulator-vcc3v3 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index df2568ec7f1a..63f161610caa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -8,7 +8,7 @@
 
 #include <dt-bindings/leds/common.h>
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 7a595fddc027..0ba56b9819ac 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 
 / {
 	model = "NXP Layerscape LX2162AQDS";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
new file mode 100644
index 000000000000..23f05a138eac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file describing the Lynx 28G SerDes blocks found on the LX2162A
+// SoC
+//
+// Copyright 2026 NXP
+
+&soc {
+	serdes_1: phy@1ea0000 {
+		compatible = "fsl,lynx-28g";
+		reg = <0x0 0x1ea0000 0x0 0x1e30>;
+		#phy-cells = <1>;
+	};
+
+	serdes_2: phy@1eb0000 {
+		compatible = "fsl,lynx-28g";
+		reg = <0x0 0x1eb0000 0x0 0x1e30>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
new file mode 100644
index 000000000000..b710f6a8eb48
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2162 SoC
+//
+// Copyright 2026 NXP
+
+#include "fsl-lx216x.dtsi"
+#include "fsl-lx216xa-pcie-gen3.dtsi"
+#include "fsl-lx2162a-serdes.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
rename to arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index da139e7fa30c..ae6e37870c5e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1840,6 +1840,3 @@ optee: optee {
 		};
 	};
 };
-
-#include "fsl-lx2160a-pcie-mbvl.dtsi"
-#include "fsl-lx2160a-serdes.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
index f405b21e68fc..068fbf9bf04f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
@@ -4,127 +4,39 @@
 //
 // Copyright 2026 NXP
 
-&pcie1 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
-	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie2 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
-	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie3 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
-	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie4 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
-	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie5 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
-	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie6 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
-	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
+&soc {
+	pcie1: pcie@3400000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
+		       0x80 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
 
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
 
-	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>;
 
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
 
-&soc {
 	pcie_ep1: pcie-ep@3400000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03400000 0x0 0x00100000
@@ -135,6 +47,37 @@ pcie_ep1: pcie-ep@3400000 {
 		status = "disabled";
 	};
 
+	pcie2: pcie@3500000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
+		       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>;
+
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
 	pcie_ep2: pcie-ep@3500000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03500000 0x0 0x00100000
@@ -145,6 +88,38 @@ pcie_ep2: pcie-ep@3500000 {
 		status = "disabled";
 	};
 
+	pcie3: pcie@3600000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
+		       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>;
+
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
 	pcie_ep3: pcie-ep@3600000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03600000 0x0 0x00100000
@@ -155,6 +130,37 @@ pcie_ep3: pcie-ep@3600000 {
 		status = "disabled";
 	};
 
+	pcie4: pcie@3700000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
+		       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>;
+
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
 	pcie_ep4: pcie-ep@3700000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03700000 0x0 0x00100000
@@ -165,6 +171,38 @@ pcie_ep4: pcie-ep@3700000 {
 		status = "disabled";
 	};
 
+	pcie5: pcie@3800000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
+		       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
+
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>;
+
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
 	pcie_ep5: pcie-ep@3800000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03800000 0x0 0x00100000
@@ -175,6 +213,38 @@ pcie_ep5: pcie-ep@3800000 {
 		status = "disabled";
 	};
 
+	pcie6: pcie@3900000 {
+		compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+		reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
+		       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "regs", "config";
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		bus-range = <0x0 0xff>;
+
+		ranges = /* 16-Bit IO Window */
+			 <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>,
+			 /* 32-Bit - non-prefetchable */
+			 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0x40000000>,
+			 /* 64-Bit - prefetchable - 16GB */
+			 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>;
+
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "intr";
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
 	pcie_ep6: pcie-ep@3900000 {
 		compatible = "fsl,lx2160ar2-pcie-ep";
 		reg = <0x00 0x03900000 0x0 0x00100000
-- 
2.25.1

