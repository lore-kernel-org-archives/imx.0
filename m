Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9C4335073
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117677; cv=fail; b=dHLNvVGsumkVhhR6OzBTGpBbKt/cd+L9si7XPWWGpl77nRPcghS+fJ2FEDQgRA9K6crpLxL+6gpcwlQ9ZfwwW5KWfg4Tev3eYevHhuKAPNFmLMoW0l6YwEr18z5TEAwc5r3mUSCeANw+nA8zMWaNl4r9GSUoukmUzS9maKhXY9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117677; c=relaxed/simple;
	bh=m2Awvlu3eqjMTQh3EKJCU2H9caie7+CVuusKR8OgFpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uq0AIzYbpLiAc+bGftqdH1IXkm/3EWiAWiXRGZkoEq1u5W5azr5C6kT4OxNBR/qhVny+LxXTCAKXaOAHXBVuBGRiIZQeNSuubksJMWMuguEfvPvg0VP8bNjRIMJuogK2yniCmOFMHvkuNXbuo5+Dla5jyV97AgAlXL/DsBTix54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PKZvXJki; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PKZvXJki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcSZOMgDGLLZelQz0YMpgFUaBiPs0a+EJAoZfL9c4j/EXumj9wWucHi0WRDPjL3NQCWG0ljnY30//JmObrfowL3Pgk16vJ34bra5KVqSrM/ivuiggjWa6MP2/aZP6ZWt6yDNcQxRcHJBQg5klIcJVEAuk79/5qKk8clkOfOWoaVEVNvqbIXFtPMi83hQTmJrazH75PFcAnrFaF3y93Ow/meABEg2IY+7cKOKrgGZmVp0/2Cp76//yVlp4Txq1tNJ6oN/xft19lUZUIxB/DB+I2JrxAlBWAJWCHYZe/LEGr5E7Drc8ZWO2RPfj65qwztPDxdGmzlkIjBE4RoSUI2LHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QnX6aTyebT8cDlL7Mbno+97vy9ktsmRX5sKhHpEZrw=;
 b=yC9X+JsHOHqjoyaRrPHT84hRyif4+DF7V7YeU6f74twcEjP7zweUgs4VK4/GnYgmNwjUdlpzLgNMuwA3BgLVq3KUBkcYp+bwvVZb1bpoB1H+DvF0O9dAE2AnqqkumzXpWAsxERo2k9pGV8INDf3Kx8tHkH5PhPawafmqsms0H/O/mxTjxIFs2z2aVy6e9ElxHS39Kv3N2jFyKZP7bwX8Od1ucflB1maYB8T+P3HDls5QTGGIUAsVB48P7rtNhqeXTizboy7maRhvPV+cs+2+x04dtdSU6LwJ7uVvKho1mqMWyDLU5jJRwfdo84ysKcfjhpHm7TJM02g6KMyiiXeZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QnX6aTyebT8cDlL7Mbno+97vy9ktsmRX5sKhHpEZrw=;
 b=PKZvXJkis58pZim/yxgZYuXq0jegSwO0spWRryQzR9Mt+8x6c3D5/PQNLMlsYBYZlRHBbBhb0afKVAziFM+bZovqD78iaDOC1fCiKvarYZaPfQUXklD/mdCks9708lHKT8hlJUsgpbybsuB9ruzYI1MKPh/ihtE1RKrIsiwqIlllP+T4A+Ot/hO2b9qrhTtA+YtX2bdMFdkQBHmmPn2ofs5SOQ2KURSYYaO6mVKDuZ5RmUj+h49PgYLm5HUNPwFnXNc4Co/KFJ0Aoc/skNz0onl4t19VpzTpntSkqNKMoAUi2x02QoMGaIEH3qqLZuRG34m5heWq1ligPHlynCPZ2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 11:21:13 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Tue, 3 Feb 2026
 11:21:13 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Tue,  3 Feb 2026 19:23:10 +0800
Message-Id: <20260203112310.2956389-3-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
References: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::29) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: a76a66a1-bfc8-47eb-8b95-08de63165696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XYApXHwTclDKPTk3G9bwFihSWLmYz2ss5Bwh6C+tNKej5Cao7xoegQMu2txN?=
 =?us-ascii?Q?CwFgGhwQH3ne086miw7Z0puEl5BSdbWvLrfdNLQzP1Ozx16u64K+HcnbbK3L?=
 =?us-ascii?Q?v7DWLDoHnPygcuwhShsQccswNpmN1/BsoP/rRnd2piHoI1ZJchsj7QN/h6EP?=
 =?us-ascii?Q?ZDgQEf67PA2fFDVfmBHBncWEhKEs3Xk36NfW4VuAwo2e3C8p8BV/hqcq9pCW?=
 =?us-ascii?Q?XF70yte+1BOHFE3ah8DfkRLiF89yj+Wv+XZcl3aPAPXp4Kx/LZ4zn1EiNmXU?=
 =?us-ascii?Q?N7ZS5bdZ6dO6pUlU55XaIywSuY0PQO9HFI6iUm02WnKxwtzT0KKEgNoSnrpG?=
 =?us-ascii?Q?ecBelJvUXb4QmjRXvG8pe+I3Gl4ULGIBWWgjccd5aUDsLHicHrbu3NWzIylF?=
 =?us-ascii?Q?wQ+24tL9wigMa/iofPoS/Rz8cqpMUYUAzC5lRmY3Xd5rZSimZ0i+RSrkvA/Y?=
 =?us-ascii?Q?rITyNVm8RAAsOCzgu526X2PBqQaRXnXcT5P+DEOVM92IHaJrzRH16HDoR8dE?=
 =?us-ascii?Q?kaF3t06cWSmyhqWNNcnyR0kD679c836Nun6+Rzd+9wrj9VrGwT04u7ra9L4a?=
 =?us-ascii?Q?4S/D6m4EHqdb5CRVdcyfb8wjoVJpJ9Hz5mAGopcdzBnLcbQH8+zbKZFe9YfM?=
 =?us-ascii?Q?EzWZxdR50jePn/BUwkCaabTQOhAxg5KIvImGcH2xDm4fJRc9eFWF1CuIQXEK?=
 =?us-ascii?Q?0nwPYhP/lM/jKavIGBvoKcOKUCTs5kDJaqNot2UbB0esHgdRSgUCekHnGBNL?=
 =?us-ascii?Q?ivG6GyF4YB2pfsLWIzM6D9Y/SXpL+bKrKw7QBhwSl2qA25iH1j0gHIdmxhw5?=
 =?us-ascii?Q?7gfK+o++TFVH3hhw4y53YfHDqMu/B9opoODbydVAUd0LkLYwXWeS+Z5ndbJ+?=
 =?us-ascii?Q?PSxuTtrcAIYxnUfO/BNjk90d8WmGJB+Q6a7840lYYqnxHwZAYNyeGNZKLVm1?=
 =?us-ascii?Q?TI7mZDPA6gKLX7oxs/YsdtE4LFUkTVRmevQKy3ugiaHWfP3rdsM09smlGKkM?=
 =?us-ascii?Q?K+IYxiJbrbDv2VrZ369kNJwe4XPMeoN4XNVjg8dw8LaEO11AxVLvd+SzZRNv?=
 =?us-ascii?Q?agwWn4C21gjVmAve7EDMlxRcccwPVHHmE7c3TiT4ufKnAyj9KFaWTKSEKEKn?=
 =?us-ascii?Q?biC2i1h+eCLg8CEPtq+/2P29hIDym+ltcG+EjonjIGscm23ctfBheAmAVPD6?=
 =?us-ascii?Q?Qi8phfJ/YVlFKXMKB+kKIySlU3RqXa7EXe+0tVvqZahZSIuyakefexNdeiRc?=
 =?us-ascii?Q?X3vGvTpy74s7f6yHa3iXQxJnjueLD4ozRqJJ6UjbU7zHoif6f7cqb40Mpi5U?=
 =?us-ascii?Q?VUJk9q4rsZmIvazcCQC4jfAPH3PODQD9SipUcftTuc09GIJLk9C+PX428qdW?=
 =?us-ascii?Q?8zp2Ws5OGrbxmRomcy4V9NwdcEgDtLHA0zBnmcEuobVWlBE+F3Ln7V4SkKJ1?=
 =?us-ascii?Q?yyiKsW2COPfSLFSsOLIzExE7wBnAoWNaR8YKpiFPH5rs1FnEutfILA11cEhy?=
 =?us-ascii?Q?jLe8svWNELXhHitgrarE37NgupZb4gymUvN3rCaGEo3y2RbayYnsrdyxk7Uu?=
 =?us-ascii?Q?4eQZZWFcXP12fBHLYW6TryLXLOItUnA0ypl/yHaZko3PwLifthFbCRyZlK09?=
 =?us-ascii?Q?mHvhWvnmFKzdceNXP9Z5tXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G/quIPz3wB3PwzAZ3EIOVYbQe4mH+C9LTm9JuSOsbyVI48hniU/zvjOq9Slt?=
 =?us-ascii?Q?WlHocRtOLyFAe/BcALZw4j5o8fXqe3XbPidqltsW5O42rRr56Pupc/EWo2LK?=
 =?us-ascii?Q?YJ553Tf5VdfkpebHMIUqthihNfROR1GJKsArsSeiBtObTijAwQHbNVDgZjrb?=
 =?us-ascii?Q?Jf6PUc1EDf7fgSIMkMnf1Xo2E/1SITuKkL4elovo14YZCBRGvxsNRfIHq5h+?=
 =?us-ascii?Q?gW25gWbghWVZ8nHVpk4q2Ny9YJl9mXEtyrm9aXE9Lw+5wv0kyCNw6D+p8OPv?=
 =?us-ascii?Q?zEmcr4f0S77eud8XqkOzFoF5rNZxmHoJMIC1W8PEy+7asyQfXDSp9wvESqta?=
 =?us-ascii?Q?mZ3flNA0g33wIhSaXMFzugr0DKdTNi782sekqExRSCY8iVn8pkRO3S26ZvZc?=
 =?us-ascii?Q?HK+yl1hg/lIWqahLsCDl0kxRnxEnsYncaoSFuUTjcOBxRpW7GFTqkYiwTOGJ?=
 =?us-ascii?Q?1Wq3Y1YY7E2S374TqEQZDJbyN98K3oTujTGvG4ZTRzdBAFRgbmGHIgXH1XeA?=
 =?us-ascii?Q?wCXnvcmupvxZ5tQaOF+NiBYNIrfO9Pg330KvpWDLUBZXiFVMb0zdDyGBmYON?=
 =?us-ascii?Q?ck4PYf3LCnhvOLB3Gz5/lipEuYipAZr0o0OsDLVZBYE9YQICybIKkjBfotlM?=
 =?us-ascii?Q?4lvDwFtnrWDO15Ah8labhK7FcM4KvegHMQ7g7Lq79AqpObckYMagV+aXPsc/?=
 =?us-ascii?Q?rrTGaHpMtl7X5QdG6oB/5ShqOQncrp+/s3qrYI7Q9GZ2NN078/zlpjg7GEY6?=
 =?us-ascii?Q?Q4ulM06RDXDom/zDbwQFjEvNR6hj2ded0M4IwmHnI6CKV9FRBKLZ7QU3VSUz?=
 =?us-ascii?Q?hK371B4ao8N37UIVwUNmCjPp5wiYpGncKz9D6SMxWN8xZ8GtwMEzoj1NPRgj?=
 =?us-ascii?Q?4vSMorUJzAIDg2m6IcsnQKfawTuTHmTC6pj8EEDQmiQJS6FVeUfyYV9svxA7?=
 =?us-ascii?Q?oSEWg5hIEiXSgZOU58bQV/nKKGujR3ReSsz7NBpeGOh5phOxdhOEE2daNYq4?=
 =?us-ascii?Q?aWc4PKE/JzxtzAYo+536NI7sE1c6qc4+U7JxVuxminkW9JQ3Q7v4d3CWHK5I?=
 =?us-ascii?Q?o+AVVliYCEWXHReknLbEUlZgbLSkKGMsAGvgQ7NPi8G96C2fZCHENi7UIb4F?=
 =?us-ascii?Q?4qaEPU+mdHu7jYoLw00KgKZiJob9rU15hrKMP2AMO1RsuSU6wwycHLLMWzM2?=
 =?us-ascii?Q?YcS6t0mj+/1tWPS/V6/ijq8oKUQZ9y2x4D6j0yUPlD8C91kwBxPx4v9t8tGk?=
 =?us-ascii?Q?mHRGX8qOnXWa2MDJ8TDCVEApV4By7wG6dEitOC5GA0bnC57ATZDtRBcUQhO/?=
 =?us-ascii?Q?HwDxQjh8XO+wC+iyhrN3smiprhLhFdqal8HR19iPDl3jeEa1J38Auv5E5E4n?=
 =?us-ascii?Q?nUPlE76zz6E7DEO8OOg8G6a+Eo0SukBr+3FBygK3gQZUz2E8CHo67GYTpV0m?=
 =?us-ascii?Q?uVmLb2uHq123p2Su9bEuHUJOjgPrm39xo1dpKo+kyye2jCQkBgAXMbpC4mY7?=
 =?us-ascii?Q?qJCUtAiFf5AA5J2r4EQWcKvW26mKWE3O+mo42DZa4gitwQnCJXCQ9iHgE4v1?=
 =?us-ascii?Q?4aui04ADDFcYGLFZF1850ngLhrywlV6Bt9QHwOF7fxdSx+2/PZv4A+nNS/tv?=
 =?us-ascii?Q?j5kQePHKWYKKtFbEUtYnbJu/T8m4l0RiiwDLWAJLpe7ekTl2ZFs+pZo1tmEe?=
 =?us-ascii?Q?pPimAap8PZB5q22unRHzwv/5dGZMepCu/yjexrph7vvb5JyIoc2mLzuUtaFJ?=
 =?us-ascii?Q?pzqr/I3BRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76a66a1-bfc8-47eb-8b95-08de63165696
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:21:12.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkvY/WUolRxivHQQQHJKRIw91lfEA79hfVINsKOmL53XUgqVtl5tVzj0jw/KrS5csWI70AdNo3vfmFkcpsWzfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

From: Luke Wang <ziniu.wang_1@nxp.com>

During system resume, the following errors occurred:

  [  430.638625] mmc1: error -84 writing Cache Enable bit
  [  430.643618] mmc1: error -84 doing runtime resume

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a wrong delay cell near the gap to be selected.

Set the tuning step to 1 to avoid selecting the wrong delay cell.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

Fixes: 6772c4cffd87 ("arm64: dts: freescale: add i.MX91 11x11 EVK basic support")
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 03f460d62f7a..6a066a0d86bc 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -514,6 +514,7 @@ &usdhc1 {
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -528,6 +529,7 @@ &usdhc2 {
 	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1

