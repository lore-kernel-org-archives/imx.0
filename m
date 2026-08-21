Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E474078F7
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290791; cv=fail; b=ANZzJ8F8zo0O+gKL1DiRVXuOCond1Yw1b5czJwRppkF0I+qYp8T9zmvmpjR2FffLdxVPZ/fEc2C+LJAIBk5WgHlCoLnI2eVwhl2t0S5dht0WEorVxJfsdn+XHlNMjnZJZcELghdyor3U1o7YDX/IRapiYuNh6Qj5N+Gi6j+oWFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290791; c=relaxed/simple;
	bh=4ba24k5MMZAj4jex/bjw2jyX7qk6kc0t58u3fGZXKps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VCkCnoc0hCgZnBXui8yVOZ8ISv6khk/SVJNe1kOglu3mUiMra/D/BXQiuZ54+Wm/1aKZbavJxvmA/CPxcOZyQEznl7BvB/tGiYCuvoY5TwED3bxCCSxL9iotjE8hK6saoOIr9Hv9agFM/Ub5B6iUpH+6NBt780eeBHJRkm2Kp2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l5LYn5C9; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l5LYn5C9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv4uzlakvKjCYC1YDuoeaG1hyratAv6ZSzAQTT+IY/Jm3AEMUtv8M4FQHaALcwfBDYMgVwguorFnWqSerarB259nsc+WJEMkkecMAlgUH2eGMVi5hnOLwhrq0qxbKgNayDBFIm2Yq4JOe/t+5rVequCukJ9w/qzhX/flMdwnAO0DkynfsOLTwe/RstNcOel5vshbrFVeQqnIHgtreQktfGWfGflE1XT79ZYlm1pGMC+KO/TpT4fsm/uwio6P7NbpPX7zqPuCbeTZx8rXSFKu7T/WaPaT8wI/Cj/vx1I1OFeIKyN/GxzB6y9zNFzRNNMiGD2Vmmo36/NqbPYj0LfCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o71UdCzqo9mgBppQOsDOgx5wz15ah4ip8Hq+i00rnk=;
 b=vpeZsZUQKyugdRKo5vcff8N+as8Vna1MT0m6qVIVh03U0ZE8XAmMsl81AGHVt0jWbf8AbOInWyadsL3fuKlmR9VPDEDoiKbnfYvS8yULGTmvqaGIrXuztBKg+N+oCnE/IqgtmcMbDNnE/vfN+xGugsj7B+NtEEUFiNidc3g8O8loNaWF6jhbZasMAZ92F7rNNazCNz+udhSgEGuPCBge7sjEqDQ1Fw1tmFytxcrBWJtxbPXSZK9ELBiHJu/dgvzhQ7ZzVUM19BWPubgeO8wsgHRxlMPorYh0OdkK4ntVnCHQ2pvUBfsu8SFqk1G5+XkSd2veF1er6mYVIoL2ntexnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o71UdCzqo9mgBppQOsDOgx5wz15ah4ip8Hq+i00rnk=;
 b=l5LYn5C9pEsnYKO7OjLkk/qbqb6TsaByF8iIlMao/LgIusey3Uya6IIjoENBL9GU9a1rkSCVsMvvPoq7QNvkDayB5L3gvA2gTozU4E9v7bvLlkqlEpAYTiX4zf+4bK9hnU0q2ijGObSCyJa6ekE7OSKAISAPWvoZqSp1SO/HVsO7JqsnnFXIl4qB8Xnu4xuxiLqCnjku9qJUHAZy41mXM0zz3uC9pviUdZvB2luuagnCK1w2ZgTA3omImxlSJ+K8tBSKKLa0UBg8S3xQ3V9o70tQg8jhY57GwwTk6KCYxz6eDvdDn8mrDirQDd8HmqIgVWs1uCHVpcdZiKqkavSwAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 05:39:46 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 05:39:46 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 2/3] arm64: dts: imx94: Avoid 32-bit PCIe window System RAM overlap
Date: Fri, 21 Aug 2026 13:43:33 +0800
Message-Id: <20260821054334.1277088-3-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:295::13) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a6f0dd-2e38-4190-1039-08deff469c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	x1H2cmYLkFPO4zaojJ671EJB4bw9CXIsDypdVqV/Kt9KV3aTlx9ZKD9ZXoP296vc4VcQdn36puiL9mJIHcuxbPlEMWfICbKpi27BB9Wfm1+oD8BWWgONBZ9a/GJuwOIlv/CL/FMbcW86vztcOHtHTZaoLurho3FUk+z+ELqTMNpIx2M5OSfn87HKz6DAYr6pmwodZxNo+hisa6zJi3lMmRbxcaStA2bXIl4V4OdifabPgEmZ4R/TTDQ8OWnyDQRBIrpqZgXu/JNXfb8c6xFiHrFZyoAWdHa1lDdAaG9tnmng5nxeGjQOuib7XYTmrazXE0fun9/6bBqavuMeGGPy8XB0l7bzLdbHt8vvbSAxoJUMhO2VoC7cJ9kwrdJFU94H/viVa4VbRL6pXIq6XGhDtXkFxJSZekecidb3vw9EtqSQNpJvOLQaqJPLKeBTcszd/5PuakclLeosL7o/t8u+hiWYT768moCBspAdfAh19lj/f2mwF8Z74tmsOYoUoAjG8yte3MM5/ISpo6bbfwJ4vpoxITp0CLoWFZKMyXVLXiKUngDhqBu2KPzftxRQnvZo5V6m4/JKPKE/u4InO4xeP+G5RFSHuXIu3x6s5dMhJVMhKp5YfT70ZlUjLG7/NSYkpJ9BmJSWkKyxGtmhb5++3ytdZ6relN2y3sGMxWglCR0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qvL+y5Rph1eiqQO0X77LntEPjTYxbWjkEVfDMwxE7L27q+c33liL1ClEpoD9?=
 =?us-ascii?Q?mIXSMXIw+YIlkMFeTC0OEf4EomcZh2FuZslsDa6L7+DxUoidKTkTLJ+T7bUP?=
 =?us-ascii?Q?6JhZyfmaFC5SHeqZ/r4vbXpxH/aiRhsf41F0inSlTWkRl+NxLNQjn0alo/Df?=
 =?us-ascii?Q?3c6HB3pBMXk9wvBBm5TYxkPwYYSgDqd0Iwo+m3tWd69Sjgq4J+G/7+PlS3L/?=
 =?us-ascii?Q?QgdH52lN2P4Rm6qZd4ENassfY0GPGiQ4pcwqK3mmRIdxDts2OXMZmlFdS0Kq?=
 =?us-ascii?Q?fVmSuSel6QLMH0CXh3/czxCnBK25Xmtdnx3jD/jQOTHWa353Rjm8UZ5Rh7CP?=
 =?us-ascii?Q?GnlTckym9Kmic5+wDhDeVdOpktW1WP+91hLMfGn6zDUym2U91NYn+N6n8k0L?=
 =?us-ascii?Q?DNM7deUJ1bsqdtAjgbeiGGtjDWUiEPhu+TOycGHokNlJvvRlTvRBbWndO06W?=
 =?us-ascii?Q?D99y3PxXkfGcaMSEmB/UbTrugEBISc0V6X6tcSJcEiuetvenEhTgD21c+PW1?=
 =?us-ascii?Q?PjUGHD/d1yogwJQGH5rQZAw4PJ09mdgXGOsH2xAWKunRa807K4/3kB5ODiEE?=
 =?us-ascii?Q?4L26K125GwXrjxH0Rcj3Fcu3wUoGR50RFsVFfIGzI7Ah0hKTgCzRCdl30c6d?=
 =?us-ascii?Q?BpFyLasHbF+kAxnE/1iMR+zwQer2k0TGFQpJyagZQv6xAHM1MQNC/Z9jHC0g?=
 =?us-ascii?Q?mgkyRW1vvLog2vhjiz0H3YORvXFQgQUt+5FDasCQv7AOetEdRYn7GKUYtYPs?=
 =?us-ascii?Q?DI1dB+0R/rQ66TZZBnyNuVCISKKd1wEkOEmM6Wu+/xd6kXQoAAfGTcGD7tLi?=
 =?us-ascii?Q?7J+DEJGkTB6LLeH+4zL7WHmdB3tX/Tf8wsk72oVlSPHsXt3qIgY0IPw0oltk?=
 =?us-ascii?Q?o/XEMrHEZX6eIK6EToIqbykv2jDrqI/e/B/I3MFhJL1IcBoiG8n+WM91ySZa?=
 =?us-ascii?Q?BPJBwDlLakdXDBFGm5Al3x8HOTh6/hUrgM0MBow9dTBlhEQ3eYeEfvviz7o8?=
 =?us-ascii?Q?NXI2IrqSG6hVJMffbnGW+ofxSO5b2KFCfTyNXXZdzrEEd1L4U8cyS+kmi+33?=
 =?us-ascii?Q?qTP5uQkrfu64urxvkOmDrmbvmZfPYNbizbVZX9PPjrAkX2G9v2ha1dksph0q?=
 =?us-ascii?Q?p338ns6Wrxb8cflrKwlGttmBdqiNSIN/9nod2peqaRXbCkgtOz8YkCbo8w0I?=
 =?us-ascii?Q?7kwMuwk/21VeqQbkXGm05ed8rL4ujW2P8tsYN2rfm+97U0M49Ug7wQur3f46?=
 =?us-ascii?Q?QFi30p92rH7sCPSwA6qQJNqkPE7peCD8yi41K1ZOPsvM/jhqy+/0KluuVmkZ?=
 =?us-ascii?Q?TXKz6HveAlmaDL/Fx8EYXm2+TwLuxg0yUZB16npbg2nDzQkiES1Q7bFtlvul?=
 =?us-ascii?Q?jjZ2S9xhnwLfinaFqzlRTk+GT3v/4ZHn+FDPW7qVdTFe7v0Pgi07IlG1Ndgp?=
 =?us-ascii?Q?Px7prL9Rcur6xZFYatTjIMLNgiGG37Uuz9pMNkxycr9HEfnAy1K9Sn+1oK1g?=
 =?us-ascii?Q?0kSZy7aDq1in1Ve+4mDbyPMGubH63YsqNXcTi/6FTnt4Pts+UbypfcOrbGyA?=
 =?us-ascii?Q?W4g9kgoZjDRxfGT8WAzW5AQEz7pL14R0E82UNLi9IPBwu/WzgJDwpRJKacSR?=
 =?us-ascii?Q?6q+k7XaoPz0V9z2QYjYDApZb4iZysE5opqmXoy2JVgP2VFOMEJdyV4ZF3N45?=
 =?us-ascii?Q?1HYDpoKwDFid8eZaT8bI2W9RfdXNTDJ239Dy7m2nPTSIRUyc1R3ceU0hc4xl?=
 =?us-ascii?Q?fBOeTatQwgtRKmfFmgiv1BZbjHhzE4ACd6nHqK8iqU5kbuEWywB8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a6f0dd-2e38-4190-1039-08deff469c3a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:39:46.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1roF1CxSowgIwK/Z6Ci8mtfR5g93vFVlsLA/87oR1ayxbYgx6iCu4lwckmMZRYSE6jJn/cksJip3AGV95OojEoy6BpgRMNMFmW0iMYO6SV/EaWeY12kRcXHgztTsp6bT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory PCI bus address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: ffccbd6804e88 ("arm64: dts: imx94: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd796..afaaf70417d23 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1379,7 +1379,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.34.1

