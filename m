Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013049.outbound.protection.outlook.com [52.101.67.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787001E9916
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491762; cv=fail; b=KLFjwRCEkNrhf7QlVWzpVOL5Q6m+APr8LX1LeYZYXCPurXQv70gSBbnxCNkCsM3S02DG6/rHWh0+C53kdxcYbkuWNzYUfPK5ObKazi4bzEW/DAY0zF+FWagIScNm/4XBvAzxJbyV50MRymBLH9D2SITUtPnxWX/nAzkT2Al3flU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491762; c=relaxed/simple;
	bh=MOIuH7nr3EO6fLeQKJi9c5HKMDDcTF0IeGKAf8E8ZTg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BOVMSK+X1kXBjQGFl7MRA+OoHULhhBG/LrOUW6Zcq9tURg9ZBE+EmIpQR/7JURMvX0dmeTebnM1heSLo82x/GmfD7vBkXRQ9FpdO1eztSPlJ8GuIzn4x/Mn13Kj/ChVvZq8Qi/ekU+RPvwsgzKFEecrP4L5fsDudueXirJkSr7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WeMlvZUd; arc=fail smtp.client-ip=52.101.67.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WeMlvZUd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD1dApgi2cd+LGAawR1SfYkIYD+tAklCmF3IpLmPtxkaOLie7BwmrWtzyutTMoX/JWJSrX7NY1nmpsb1otzAWpkpOCUNB2xOgi5X6hv872AV5KP0vu5lYvY2hKJpxtu0O/uU0Bwn7zMRXIhVDiOwRizPel4UmKrmGuDN5ZFEm4RxzYFCUngTMkB/U1wSo+MPmsuA4K4bMDD7r+SY3KiUWAitMAI64slbTfqtps/TjdzM1INAQgwNbBf+eMgWD6+cE31QbeZ484hixNzkfUGTUgpv7HJMjpayhiwG8QzltDuPAzeJhBmJk1rXA+69hGlC4xi+PYZEAbGFeGQT8YKScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZB2eE4TJ3FyfgCChy4an/lCNt3Am0j3DviIBtxrECQ=;
 b=afz9FmeONbV6OQV2U1vgQubzphTh0Kvn/u4I6ITR4rlnxXgDuia3PYcTpb/q4/VWyYG+PEXCVoJk/T00SU3Xu5SXZte9fHCO2YJ/gau/L6+paMwtshzZ6gpRbhzLJ7Sd1u57SiQ1ITL3y4sMbUSg2rBK0cOXYHCwtOqA088fzNPMDsYtiyDBZ54ynieK+HbYvxuhPj2CqtEIJ5Z+UmpVgSHLbQvfDS62d1t9dgCf6WwTWzTs88TyEQkBfZAj+p63g3AsmrXR/HqwQpuWGD+mCDr49Un67PuJeJNiatRDOLKsqyV0qzPGxM2U0bQ4Gpv7aNUdLamaBCjNwVCz+RerTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZB2eE4TJ3FyfgCChy4an/lCNt3Am0j3DviIBtxrECQ=;
 b=WeMlvZUd84L28gLF5elss2b7L0Sb/7n7L43vOuqYp//Ug87F52MNNB9pGwAJPR5Ut71k0FRB8luEtp4urDCUjtO1jtXqbUH4Dv6+XBCrcA/lzECGKNENEvnSIaNxKH5PFb4S7K9kDqScvD7XNlaYenLHTXbZ4as2qbWQfJ2w5X/acoUqUaDQd+O+MOV30g2vrShq7cO/XGT5e5bfcDpncqeBl3pCG+RF2KYi7e/HMSHV14Bd+tMkvhsKAvUd5tNc2CzSOcAYWcg1mjYtgSL2ZVnrKLCn8Y0O+TVXyg2Ne/qQlqct9rVVKUMfjBGYqXoQBxhNMjTNuX6kR6wt1RxpqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:15:56 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 07:15:56 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v4 0/3] Add i.MX943 basic dts support
Date: Tue,  1 Apr 2025 15:17:06 +0800
Message-Id: <20250401071709.1138872-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: 758f8fbf-375b-4efe-7b8c-08dd70ed0b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5BPNHrRyt68msyonJvBJgKVkgrf6Zo/GLYlv53E0lcWlO7B+bzcn1cDKxovj?=
 =?us-ascii?Q?JTkNl1l3W9jVQrRnfElBRdTLmpbgN8h5VJh1+0dpJw3mwo+w1VUC+PXWqWXx?=
 =?us-ascii?Q?wkKgoPiGP4+S+LvPlA5MKDBW9rBy5jIUlN+j9LVpSGMwp3cvi4jLL0tQ5Ur5?=
 =?us-ascii?Q?ntCHplQq9A3D654O6tyt2T9QtNt++hiv0Y7cNr58liNgA5XTUbuqE+Aiispo?=
 =?us-ascii?Q?/qeL25pAy+JfpugPFI7SwPFQh1y3jURwprX4KM5WgYHD3hTBBNUORTN3GjYh?=
 =?us-ascii?Q?gvSRQh/5XNCNrrhcJZTgcRSTXJyBwxj3iKLbm7PlMeZDwqQ5CY8yh5EGeJjx?=
 =?us-ascii?Q?jzsqPX7GmR2NKWO7DJF767/uYZpHeM0rbM17dsLDDNhRpmlc0SulrE5nLXPE?=
 =?us-ascii?Q?az3xTsNJ2R+39BCxUWzGIBFuDcBh4BksYRKy3qwwfcKk3aEJhuGLuI6WN3Xz?=
 =?us-ascii?Q?CHo7RGhJa4OVqrId31rBUSPxMxScgs9w+k4bUrJ/lbgsHh08OhRv1H+BWBXD?=
 =?us-ascii?Q?wxrXUVIS+31++xvdd00qh1WZ9mlbGJoFwkGi9cKIBnaDLPwqBg9fvYFwmaTC?=
 =?us-ascii?Q?Fn1pIiClGKXYjBGEwh0FWLkIeyug6s0mFcv56HK3xOcJnVwsmHn7yTQXAfPm?=
 =?us-ascii?Q?Zc8yox+IXpBsDMbkyWRScz0nA8xTTAywNESDZldXjnwAYO6vBV5XUau774ZF?=
 =?us-ascii?Q?EpH7hoeUWFq7WX1JyuhBaEmA22BMFqsL4qI+tiaHCpzUJF23OKYTyNAva2AG?=
 =?us-ascii?Q?q0X4nK6LenklfVTkD3xUhFfb5Qe7sL9oura2QXZ8kjZcEsP/0/sJApr87+0O?=
 =?us-ascii?Q?raiy+aiKwZuIwqjJHqYXzIMPgElJ21PAuJvefRWmwkuYWD1hkNZdXWZeqYRv?=
 =?us-ascii?Q?UmNMXMgRbMa2JrKSdmWLlwf95i5iC/rwJVmjFIhcmeG+K4gRH5G6VZ+zfE+T?=
 =?us-ascii?Q?JMrrg14wCy1y5psw0r571RkLJfih4IEG9mMf8oBhOcNIlm3aWxIAvc9+MduQ?=
 =?us-ascii?Q?wqpcbGS2CmhF4UEEMK4H0wr+PriyiAhFiEPrMyn7WeNBpIsyr0e5WKNbA6s4?=
 =?us-ascii?Q?e4imeAFVVwtgcB2+89cw+9v3XiT7MSZqchyV1B9mi2s9y6sHSODuTJ77D6IC?=
 =?us-ascii?Q?r0jwCmN8byxxzoNbVfDrl2ZQ+HiHLBpSzMMfmQxXAh67RZ3MHUkTgcl8FtlC?=
 =?us-ascii?Q?6pKYT60Qat1moI5M6d6NQ3oMlFV8s6QowZS6jiGkcPtcywqiI6PnX9m+ZNGX?=
 =?us-ascii?Q?MqAlM4uWBDL6ZmWa0pxcXOBuaqIq/6Mrd/L7GOAwsROT8+FgjpB+zJwgLJCU?=
 =?us-ascii?Q?CUO2rMyD3b70PZ+W53TnK8/j8CCFczLfWh3+tMqXP2AAqg8g0YInFSFXxWUv?=
 =?us-ascii?Q?Gt8O7BOOcGEC0vZ56IrJAgTBVx8/VYtnPmYUnVQ/igYeJiFRLRD5wg3ai788?=
 =?us-ascii?Q?IGBgxdc5nII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UVFV2ESJmo58+Kt6UFfbHXlGdNj9FkxQl2eMdv5425/kpjpxziledhzmnYqJ?=
 =?us-ascii?Q?/LX62Y7qcfAPuPE3k2rvJWgcXjPQYi43udc7VftJAaJC2CmjtGNK/LBfDf9Q?=
 =?us-ascii?Q?I38tGBAmdYJdxIbnWenSM49ajE85vA5qIbQVhu2cOMFRWcR183R/GmiP/o5m?=
 =?us-ascii?Q?Kd1wkedxcHZGk66DF+D24dqsLl0EqVBhw29LXwtdavFq3iWNFmt+h3Rw43JO?=
 =?us-ascii?Q?/sRduMatx7YnL0r5e2lAC1BYnjpuSBPk9CdLYm+rIBP05k+ZrOYxOt6UBysx?=
 =?us-ascii?Q?EYZrDRcsmvFozbGQCk9O8SK0wppGofeIzOCMqO8QBwMI+hhZHAcv4e4297NG?=
 =?us-ascii?Q?tEK0IBebSVOzpcjUXPFTm81OBsJ9Hi/bujL1y0TZDwcn9wg644TWjEVxClLL?=
 =?us-ascii?Q?C+HT8AonYVg+ctkRPAGYNLqqRAt1QBOV95L4j0AapQ9uOsgoUZNAQWZgjRXL?=
 =?us-ascii?Q?gDOnYSa2WYm+LYoLw4PZFkGzin3ByMvWCbyVMv6frp4//Q9t3pavc79nj6qj?=
 =?us-ascii?Q?G08PX1ISQO9F4pho2XmQplg/aAXMp1SpuqzuJQ9OaYdsW01tMZAnAvetklfy?=
 =?us-ascii?Q?IuCywljY3Y+6ZkRrCt7av17z0imkDG3HmcnMlsS8XA4E+auwSrE+MZNggbdu?=
 =?us-ascii?Q?fH0ejVEZslaPqjuqMCku7xg+kNj6+KrGBZKuqJFon0XcJQnCguvc7HO3aVPV?=
 =?us-ascii?Q?AJRaN01lLiF/bvxur4cwMRH5F/LkB7Sb775rIUKSc8XRdIG4I5z9w8dAixZ9?=
 =?us-ascii?Q?Ue9XtRm9i+Eq6AAzd9CM1c1DX4FpQOTzJwULX58rW4Bu8d2hDy2bTWxKo+kN?=
 =?us-ascii?Q?dUZfOejeZTo8hkl/F5WRGH67dX2E1rI6baAmygRkJuBkTeQiU0cRPv+O+wQR?=
 =?us-ascii?Q?aulyTj9dlqX8slcXrojoWsxfPFeRCL+FHZ8jFW7umLlp0fxqCqFofIBEWTz1?=
 =?us-ascii?Q?Vk3s5nxP6LYksTU/xnD1ZRUTjxQZyQ7BRXtTUbSzXvv1eMUMPURasPHZyAOH?=
 =?us-ascii?Q?x3nb6EJ+73N5JZEm9YYiZPm2BKUJga15oPozrwSDTNjzRGeMop2Ttg9mmz34?=
 =?us-ascii?Q?Ewn3d/qQBtZc7yQoN3WMducQ8rGmFzpwgkZSphq6ocz89CqtgVM2NkDa33L+?=
 =?us-ascii?Q?SUEAbxVLP5JfbtGl+TqSYBLgM7aNO+on9RcAbDKxwpLgCEsYHoLdzX1prkNh?=
 =?us-ascii?Q?wCVs9ueWZI7nz1+qHFH92GTO4tDNeNkNC2oowhVBmvS4XCMMjUdpW/9480oh?=
 =?us-ascii?Q?oHEQc4rGHpLVKtE1nkak2IjN89Ump/gwKboJQNwrNh9yauIcHx9TakLRH+Ec?=
 =?us-ascii?Q?/xTWTqkD31tm4FCYbLGSLX4ses3n7OAb9bEqTXqNerGsJiACz5ytOREA6mmZ?=
 =?us-ascii?Q?/d5AvSeXXc9hWy7zTkUGKmluvXKzbim7+7tZOicWigBhTgvj67JNDVV7OQcZ?=
 =?us-ascii?Q?KtcVKLcjz/bFeX1dCCemd2WiExOGT+RZ4Bc/O3bZat9W70PjVqJfQHYX4XUB?=
 =?us-ascii?Q?IQiLJKH8ZFe3Y+3m788Yuzhrf74jn/alGDhiGSkiv0Jn4SRpfQoyBACOt02N?=
 =?us-ascii?Q?0Uor8ThOLt5wcYsNzL4vjz7hnaS7mt927Xhu4RO4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758f8fbf-375b-4efe-7b8c-08dd70ed0b66
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:15:56.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aygZ21xE4oGCcn5MQ//QpLKnvBxRNltvic0iyOHr6Mgkz7H2C3G/NYou6u5Y/uPCv2F00jJEzI90goAOj9VmMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611

i.MX943 is the first SoC of the i.MX94 family, all the SoCs
of this family are pin to pin compatible with only several
peripherals differance.

For i.MX943 device tree support, we split the dtsi into two
part, one for the common dtsi that shared for the i.MX94 family,
and an i.MX943 specific part.

This patchset has dependency on Frank Li's below dt binding changes for i.MX94.
those patch has been reviewed & acked.

  - https://lore.kernel.org/imx/20250307190816.2971810-1-Frank.Li@nxp.com/T/
  - https://lore.kernel.org/imx/64d7d06b-337e-498a-87dd-03ae41e6a2de@roeck-us.net/T/
  - https://lore.kernel.org/lkml/20250306171052.244548-1-Frank.Li@nxp.com/T/
  - https://lore.kernel.org/imx/20250306171013.243332-1-Frank.Li@nxp.com/T/
  - https://lore.kernel.org/lkml/20250306170902.241057-1-Frank.Li@nxp.com/T/
  - https://lore.kernel.org/imx/20250308143214.6dcc41ac@jic23-huawei/T/
  - https://lore.kernel.org/lkml/20250306170810.239489-1-Frank.Li@nxp.com/T/
  - https://lore.kernel.org/imx/20250306-immature-ether-d92fb5b8f18a@spud/T/
  - https://lore.kernel.org/imx/20250307-scion-comprised-03e8ea95abed@spud/T/

Jacky Bai (3):
  dt-bindings: arm: fsl: add i.MX943 EVK board
  arm64: dts: freescale: Add basic dtsi for imx943
  arm64: dts: freescale: Add minimal dts support for imx943 evk

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1140 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  |  196 ++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 8 files changed, 3297 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1

