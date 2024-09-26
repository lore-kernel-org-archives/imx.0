Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85618E02B
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336350; cv=fail; b=Yppz4hA+YkRXd7em5362ms3xs/XEQeqhxvi1p0MvOl3/Kryk0ULvPGNzNd6OJLG9NRX2KGnCaTolaUnNELXyNmw15h3p8vWd4o7Ghd3HMo6frGWxvXVSjbP3Gl+VPiN/hz7fDKtD7zBY4KfRp/5zpV9P23LVQ2yHL3ikuMzyxlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336350; c=relaxed/simple;
	bh=IxD9RzTCKkmXE3q8KQcRPFxsuhjjN/gsy/784fYY3BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X1pqKFgIzNA9CAy22cC5wvg/8kYQgqEH4KZzO4tdaxzA76DsiCAxqYWEY35jXcygVBciJZDBtKD69wWMTv+lopXd8nQg4WXBfBY+E4ADuM4Pie20/v7ro8YoU73aptaxDJY+Ev3vq3S5ni/OSpEPhQ2+LIrXLWbC8l0QA3XLN2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ReuwxH+k; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ReuwxH+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYAzUISi93zdMVBWcIfLen3Tufs54GRDIpHY5nl0UBsbAIsAqCmv7V+5nQUui2Xf2BTRp987oxxvvtuWwGSeubktL2qDFsCZrI4z9szHHf9SO9cX+xfcR7Rcdd+ypf/zXyepZgNeHfpFeNhwYXpBLBuRXsacd/N0X0da/In/Ng7nE2X3kZhRE+N0Dd2ECXNo4d1ta5Izh2EDey5ssRvRFA0vx8ARdJo4BZVNrF9ilJJbsnA/kpJ8WTcLQG1Bct3twMp/58UhjCe+K3JRf7z+2Rv/GBoEQpQWDeH+iBraWAvqBgOWQbs6s1tAEESsmiCShuqKOQi7tMNdbV4IYPylRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2D25/u9PLbOXY5hpaxGkblnPa3uZKffBK8XExB21FQ=;
 b=Y1XIkFA7GPbDpwq7VmKx6BUQSoDAmwIENTsoIcUKCTaOrC0oa4fS0NjPcg731mjzVRQOexgUAQ/txjRK1S6BZX6FC8jyhpPH8Gi3YVyXISU8mPuuNbm+6Jt6qL3Wq977JwFtlEn6Q1P9XYBYST2ftadjtDPgvLd+lTVQ1n4f8m9qM6PXw5dgi2vmCLr/LBaRYWkHNpuMDE8lABOoDDEq8Tyhn5Kqf73LViEzoPTlsdelCtXZ0m1wOrYvNcjf8SI3QGqg+bqz1o0poq9ksPFi8cVrXmcQa066wz/1IcG0PfHd5/SvcdIi3SxGco1uS4/RodLg+6msYeSZofsFGdvIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2D25/u9PLbOXY5hpaxGkblnPa3uZKffBK8XExB21FQ=;
 b=ReuwxH+k4zur4AygW2P+nTZeEZc+73zEiCpZ3uqxSRcy8fw9Z8pWarVW0CkZKhN9/+QyCNLP9OiS+L4kEVEVVdOlOjExEiDlMGCkHyZvClpfZVB3R+7Aff1WWYaa85CnHulTxeAwqt1EK+R8sO5oUsiYJAYZLbJQ1NJnZImRVtT351HhygSN/j3ghgLmS6FMSB9uHMcnqDlbv5ZUwjZZQ20nvVVOFpJQU6XJ8Bt3pE6K+k3Hs6VpFzr021OF8el9n10o7TRy6L6W2Q271J7d9IGuVnMydLmzRZ06Zzek+956FwSUTVU/+YYzvzZBXZdD2nvkx1TDazuZrwa7fnd1tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV1PR04MB10893.eurprd04.prod.outlook.com (2603:10a6:150:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 07:39:01 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 07:39:01 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: imx8qm: change usbphy1 compatible
Date: Thu, 26 Sep 2024 15:39:49 +0800
Message-Id: <20240926073951.783869-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV1PR04MB10893:EE_
X-MS-Office365-Filtering-Correlation-Id: e0061f46-3661-46d7-e2fc-08dcddfe49ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yV8ggKKoGr1Lgtdc1TQ5bk+fDBIJhVBuJEQBm2uAYYtDEiypUvRaYhC5WPOe?=
 =?us-ascii?Q?5loJavYGezaM+R2t6Qp+UI4s+uGd8o6m967mDujVgfLx6vPWlXCXCbDj31LQ?=
 =?us-ascii?Q?YhNz24+R73FHSQ4M0n0mwgFW6wazd4T8u+XEZMzukW0C54c5OcU+L2exVeY3?=
 =?us-ascii?Q?tl47ZvC32qXgta4FqKlyp4hPcxiEq9fiwD1zzY9lpeDTC8daaBLceYqleSdW?=
 =?us-ascii?Q?YB2pWgMlK2C/3BscEjSugb+X41xmx+kYRmJohX3h/zaYaZWcdMd4sJTtzWLy?=
 =?us-ascii?Q?/74/TnaNBFa15ThKK80g3pFTX2CmrO3kaUGMUvOTZpVsWj0JghOGQJcO8v5D?=
 =?us-ascii?Q?gK1zQ2TZHZjMFhd5OIKc4Dm4cDjh/x5qN2wx1ArT1/negCEa0XC6aJY2UI1O?=
 =?us-ascii?Q?jrWU7ChJLpFAnbuvYjXa6wFdnKD2qSeY97EzH2rkQvYnQttpKF9Pufn+Rb6l?=
 =?us-ascii?Q?DRhd8Bk5jfnp+N9TqD3ESb7DdCFUu2Bz4jn2mKiHyGyV8bKoj4HTaPgJQ6/T?=
 =?us-ascii?Q?s1fgpvxGtqInYJOlfYEK6bko4oELD7PiE4zWKdq/VIgTEy3cPlPuRvbbxObD?=
 =?us-ascii?Q?2vn9WVjDgVW+hdzHfoWoHdBEdkVpiMFX1HyxsY2OxZCktuTtEfQFOSbvyOBH?=
 =?us-ascii?Q?GJjdUmZiAJ3w5OfF+HAvdjNAYQaHIk60+fQ8FPBiM/Gkg0r2D40RAmwTz3I1?=
 =?us-ascii?Q?VmBmasMWMXHsyYUbjzxDEn9tL2Omg/vgRWFzaYvHGXx7C9Dul8AjZPaLlX/n?=
 =?us-ascii?Q?AJB1rNVz28AX/ppow0y8IF7/mGOg5jw+xK5e3rGZZuWZEsaebv97UfughQb+?=
 =?us-ascii?Q?76A9UZuOZ7vjdz3EzpNAeM9uknvw9SDAF0JziOGNAQDY+7is8CjYFFIob92r?=
 =?us-ascii?Q?FLQiNiqa2+CuLXExvHpxKLEKz2YOK2PYK9P2kg7Uucx1JhmCBO1uf5t60WgX?=
 =?us-ascii?Q?U1AQtjDIAthqQiommntyO9oc7pNaQdZpM8ZuoZRG3bKnFOaJUv2ASw5Wf2P5?=
 =?us-ascii?Q?RQ5s2zQ2/X0AKOGPg+kh29Rt5E3QVMrSD7qwnhScJ/FAHivM6Bfd3kAuyIgX?=
 =?us-ascii?Q?i5Jdq6u9cCD3oaPwgCN0jTpk5TZL8qlttueZLrUgoojNtbMKQ6wo2X54+dGf?=
 =?us-ascii?Q?y3KP7zcTR4OFTlZ5iJirZ6VBayLho/PLjA9WHX1dmeB1TtA8BSyRLDmrxodv?=
 =?us-ascii?Q?nNNSzs6LXlxu4L71vpa3Qyg9gHoKHXAw2asR1cSts9wshxYGWNu5OoC+EDQq?=
 =?us-ascii?Q?lTjNW17yEWzOZLNPdlzGBI5RefwzzErwEJgvfhhmTOkEkcztTNBHHno2jDRz?=
 =?us-ascii?Q?8Uie/BSzmUfMmY4n3jYKpNyOgxR2PTV8XT+Wn6CI4nTnOfEs0IWr3fmtTC1n?=
 =?us-ascii?Q?m3XOdPe/WesGmy/twMCZwXDWzDtDKKlsbnnWi0/VufFTPw4Nfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjRwfzYhqaXUXSwTx2Ant+oDCXdFGA4E1YHbOt5j+dJheMGVLUW36hoX4R+Y?=
 =?us-ascii?Q?oz4iyuPEptd3uvetQn9QV3vC6U01pNOqQueq8/7J4Z9Gp+PzGqHhqoJ+GrIp?=
 =?us-ascii?Q?4lyHOR+3tX+FQLPtjh9hSwWAaSINyJsK8A4/Lgc+jlcItezbk1KJRv7eAyEi?=
 =?us-ascii?Q?OteQRMORjB7kDGOieWX/Q6lGaO9qIMYDJgaacUMze5M896idxDKz4lr4wyEl?=
 =?us-ascii?Q?juozBsDKXdQxlogxPSdJTrpRC8VS1cweGdNns6h0KyKRcQRLebozMACuDPFH?=
 =?us-ascii?Q?Ma1xrmuncKG/AmtKVyd0HiCQuW5UH+KZ41PYt+dUQ2y40vRVl9YdJF4DlQ8A?=
 =?us-ascii?Q?32ALQnUsOlCmrD6ogT2RHSxNNSK3dVr5PofSbrxANRzzZc6NJegnzOpJ8Md6?=
 =?us-ascii?Q?Ka4F/BEXceJhK8BFnCsisFOxwTy/tSL1iXZ1R9TiIo6c8yFmjIAhPGXfR5y+?=
 =?us-ascii?Q?mDGTPFPQKtHAWEthNwDa42yIU4clqFDmxSwL39V2nSFTVxHyY3QVHEhbVEI2?=
 =?us-ascii?Q?FwJsTkgZK1PlRdyf1Eu6XH11vMDpR+xU21TzJAx8DQyWu9QY9TXkrO8KgvvQ?=
 =?us-ascii?Q?d7lJUaS9m9aLEci1cQs2lh+tYRF4d6Vv87qkxlKGvsFpdJZnYjFuILDxjX3j?=
 =?us-ascii?Q?cwREEOOfURh9nS22sPAOApsGnruqwfY79RyngLMpIQePUnqjrPt0pjwRzOSa?=
 =?us-ascii?Q?xicGOhSbnErz2LW1t4BPQPoIzr5G39NpZwGM2vSnhRngc53PfC883acqDX0m?=
 =?us-ascii?Q?OCvxz/pRPySO/KoRaOX8999b15cqcixJmkvVjqCZJuUfa7unP2pLdSKmD7uF?=
 =?us-ascii?Q?JKhnqrCItJseijW8jdFnBtgS5d9W1R4o7npYIaDZNCjqjjruZNNq2d9Gtp8n?=
 =?us-ascii?Q?q/BP270ZB+7t0kx1NXN8+tOYjP3dYvRembiogJQf1x/gddqVR3NBaYSP1Lxz?=
 =?us-ascii?Q?3uFZ+12W746L/d22CwvFPkzgm1KHD8S/ZZAG3uVfUt0jokmn4lhchmzG9byF?=
 =?us-ascii?Q?IsJNB6wWmhnxLJTY88AYUTrG1v4a5tdxnfZebxy0MxaZlUi/iUSudfpxW35d?=
 =?us-ascii?Q?37piMKCS9BKlGkIjQkcwr1eFD9TuIIoYekuGnkgy0Sve5QLxXbDaDSHGZSk3?=
 =?us-ascii?Q?ALy7N2f87pGFSK+3CKkFdoKti/m4SBYV769+w0F/5HTJXAQy4tar4NgJmN72?=
 =?us-ascii?Q?ogl7IDR0M0VhqcOk9E9+aG0umoUSkBEneZdJK02W3klQnzyRr5wYx6GP+uv2?=
 =?us-ascii?Q?U/4miXdwKpVNvgq/JMWBDvmOUkl8yvCJHwOKidqvEv9g/5rQTjWMcJnxrIWD?=
 =?us-ascii?Q?9xyTWk6/lmfA/LPxyqdxvBWkkMZsSIr6D8n3wUgiHpo4IYHY/6jV0zRWFjqS?=
 =?us-ascii?Q?j6bJTyovTX6ynjDE1uQQaOHmLxvPSj57Z1imFwuT3gUbqGPD9JGwQ2bo2pQQ?=
 =?us-ascii?Q?Jz6r9j1Ok/5Fpvf5wPUGP7wP9d/KakfkM7EOaEEZB1lbWel9E+F4hKZ0dn4O?=
 =?us-ascii?Q?qFpOjx8vWhkyqVRn0NBxjOFpcG23lWh3myHzzEmS6Cjg+mJCF5WWZkOClfCD?=
 =?us-ascii?Q?97P+bn/atkAYRlQA7yuEx62V8wspIagXrIMpVk2L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0061f46-3661-46d7-e2fc-08dcddfe49ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:39:01.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2qDzo3+JVh1VOD9TtYO7OjRmJmhbpfKko3fCo2wyjSXXmrFg3K9JjPQ46Bk3BCwAQepN1MKl9UDUTbCYBZ8WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10893

Make fsl,imx8qm-usbphy compatible with fsl,imx7ulp-usbphy to fix below
warning:

/home/nxf75279/work/linux-next/arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index 545e175c88b3..ccf9f510e0f8 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -4,6 +4,10 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&usbphy1 {
+	compatible = "fsl,imx8qm-usbphy", "fsl,imx7ulp-usbphy";
+};
+
 &fec1 {
 	compatible = "fsl,imx8qm-fec", "fsl,imx6sx-fec";
 	iommus = <&smmu 0x12 0x7f80>;
-- 
2.34.1

