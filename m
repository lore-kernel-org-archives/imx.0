Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013068.outbound.protection.outlook.com [52.101.67.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3F7248F4B
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006204; cv=fail; b=EOMxbgkT38DSds7VNdnk727K3zBtB4ag5ZvrAE3yFW2jzFcPOUT9nIWtc1FA+Ag+OEOrHXXxpGPNiNCxBcs7rhMZlV3j8fmFX9f8GT5xD6JerL/MsxsH4TrL3Zm1E1EfOlcOtzJfvCbpl2FsaUP3X2b0CxW8ScoLpKrYn7hJFPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006204; c=relaxed/simple;
	bh=SICyIqMzWwe7fNbOGxEG6Kd1aCbmBkJw14DXQY7eNFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HngHFM0KzWIJwZ9HN7JC42x+d0C3rkCY6mu78yC8FuhYNaPLJZEl8jLNX56YMtpN9u5ttQf5n9wpLNvaeKZtalRxyYa14eE0gnCjeMzCw3lzXUeTQu0lskXXywoczZWYO1I2o7Z8npXHxVfU/JsL6JOJWleH+4thtrP3TTj5RxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MpiKNZin; arc=fail smtp.client-ip=52.101.67.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MpiKNZin"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smFtilWnG0rgTR/llEJFpcaSP1TzdEPHF/dGp8uRN7MRWii1rvmT3I0wAr+/w879bzmKt1GindzxmncXN7BuYMeNkUAT/S2ioq17vVn+WpABcIZ3DFsA6Dv/A95lQQw6VR+EDWA6YyzqtA7UNLQOS304uCee7Qay56fk5gy41om5UDM/j23/CvfY/nrUeZzPq+OKWwYbRdyq9h8yYJb1N3z1nsjBUBpajZ+rH+mjvdaNXDSt6mLYeSQ1b9SEEjeWDlRy6Hs5hKecm3Gz/lPXaCArUg86ojqUh9eZ36LxZZEXGBH55CzabtzkqC2rfQuR6evw1wLt9AOoKnVRb81gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFyuOYaxxx57xKDeS7lbRRaJ8INV6oxHICEYPvbWwxo=;
 b=O4ykbhWDSfl/o1VaNf4DawbvzB6X+PUU+VTwtMUd4OL6RNAZ+7qYAUdLqTBsNiLfHXo9lAtg2Q4oLN4xbYpS/VAv9C94QQu5uSvz8mDAQ6wnTugHAjy1SqBj53ESzY7MUOj0uwoNbPMA3m2fPbc5fq5Qx53ypEoaGlg+by9VT2ZVxnp9+e3nIKhQCu2a0nOEL84ngDUkQuzgCjipB+g1iCH/oavq5PxspqF8uzByFdEuf+i17dJuvq+GL4OsMaFZhRMA7lT797xuuvYGqF6MRl8fwDm2MjRfp8+FwmAQuysbCSypIpdvHOjztiw24yOHGhPK5D+Ajt6C/r2RdkrWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFyuOYaxxx57xKDeS7lbRRaJ8INV6oxHICEYPvbWwxo=;
 b=MpiKNZinfpkTDawNmfYA2pB3n/5VFlBmYUOgjDi9VB2TTGspjYAwkD4L4YAOBjrTGuyEnId2NtODaMFjzaT/Sl1QgLV5PtjED+dgdO+wlUNVrG6RhnjmzjSJ4iT7RGw2CSyLvTXlDZTqyjOPvyORQ2bxkHA3tJO9Lr5monOB/IsGW+yJwCC2zanYj78xli4rCT9UBkbL2ZmsLWd2XW7nqkadfvdZUsqmPXh+zGxdeMwt+6SVyYSA5S+Ykt2R797pi9PNk68rqpdKidUrm5jGXFWpbJ+bk+q82ZeHIeW3ViC38iMixbciC12E5L07LhU8gP1bQlEY+HzqSrs4wlLI/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Wed, 30 Apr
 2025 09:43:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:43:20 +0000
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
Cc: jun.li@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
Date: Wed, 30 Apr 2025 17:45:01 +0800
Message-Id: <20250430094502.2723983-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acf06f8-3cd2-4bf2-552d-08dd87cb70f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?arK/KLaGJYT9nMdvFpuvLmBA2jEtzSUpwdWOhcit+wFgg1Ld6X7VOE8yZgQ8?=
 =?us-ascii?Q?A8EcVnlFCQB2fWQDYwr36bq79Pyu/xEtmp1JRXNrK4GqZmqRLc8VtZ3fQhyz?=
 =?us-ascii?Q?9TInqA4DJbt1ybZ7+wlkCr50NrTr2Yq6gK6biTjoeBr64sN/5jboOg78Jycs?=
 =?us-ascii?Q?clqKLjhNleOzfMtoocEG8AGRwQZG/2dD0iwKL2JiAr0luo8eA+mZK/nPg7bA?=
 =?us-ascii?Q?o4TFW3y2ujhqbdIm1NzW2derhHkrLRFQN7sAeN7e6ym+fF+V9n9pNa7VXP69?=
 =?us-ascii?Q?ZMhwDM+LFubCgvoETIO93wO/mjBJz4haQCpeITnaOlWADdDOzBIHy3U/6pGL?=
 =?us-ascii?Q?Az5jYBJakvggI6dj2+tg2nbSYEjJ7LZ8tKII5kQwJoi77TDQUqCwY0vzPXSZ?=
 =?us-ascii?Q?5WHkGponho6jUHZvaNllXo+y6I5cPbs/IwLSOMtMwy+5QApFNaBpwd9hZcgt?=
 =?us-ascii?Q?EqEG7oVvDI1HywQKl0EjSvwucirxvoA87ZtARbHlEo+V0LqbZCPOacvLCEdX?=
 =?us-ascii?Q?QVwmzx+nCd8xk63tYmHnPpymhRQx6/l3x8/5AY+5NNIBNFK5sui8JUzXp+45?=
 =?us-ascii?Q?KNQqv3DIBESu5EjGkJoaLSnTf2HMKS7Bi1rG9QI9qoDf71lk0UA7NPJU4foh?=
 =?us-ascii?Q?6+Ma9cxCq9ONY84e0FpIQZbbCKxl6w61DR8DoVj2cKFR8tIY2/6vFnVQ4/ul?=
 =?us-ascii?Q?dVc+SQs8TDfbtk/Ze73OelD2oRwwzzoz7WoACWhfBB0ymjKtD/YiIE3yrbbS?=
 =?us-ascii?Q?Rn485tLbdLSYGZlMbdCJo3bKjQQY+V+ACWrWIEc5MRaCziBVwzag1v2GRNdK?=
 =?us-ascii?Q?42TEAn0p4W0uXGwU27yr+HwEGV92g2vJtNGWjbs87L9CZgApCfhmAo/q71gT?=
 =?us-ascii?Q?FOkys0RCUr5/uOaf+SJ+qxuacFpuh7bHy2ABC/SlxMJP76Mpv67oQSSaLnsK?=
 =?us-ascii?Q?u4T11+hmo9rrF/stwtndETbuZaSdTAHSpGZlINQ8U33Me6kVV2CLM0haFxmO?=
 =?us-ascii?Q?r4k0EEFfnfgJN5iHh9IMnM5A3cmw89Ayw2dYtHPhLzRUCRb8Zv28MuA6K1ta?=
 =?us-ascii?Q?5N6L4nf2LSOg07OLeeelIgJt5EiCqYqRUnIhku6FYk6zZHIZ2bwpJrinEHj5?=
 =?us-ascii?Q?iNSOPyvBgQn28OGxiCyF5VZ377qUTH+Sx8OtM0pL4YfvHhHG2p7txdNWSvmf?=
 =?us-ascii?Q?tin7F8anobZM/fXmt7iWcjXMKrb98soteI+37OVD/ME992MRgEyVeDABjEeA?=
 =?us-ascii?Q?M9BygafmmFnH6BQGyMJA7UFMid796z/eBIlpnmMlUUyj2R//wnQrjQDFeVSM?=
 =?us-ascii?Q?tx1YNHHX6BA2ByjaMerWHGc3yvnQBGAUvbRU327jS9k6ojdRIEe+qz4SSkrc?=
 =?us-ascii?Q?5Lq+8i8cLkQLJ/nr/uAy6TvO1EIZA4+3G1NW+yE5iQwtgqnVdhnX+6i8+ei2?=
 =?us-ascii?Q?4rI7Lo1YjhCsNO64I/4azUoYzk3JPZSw0RXgb3h6OUngs1KUwjbe+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HTWXQAbUnI+UrBpOAfWixFNsJk1jjd5bK6OI8rVoJ+4CIsY+57bPungDpFlT?=
 =?us-ascii?Q?TSqUXVD591i2ImhbGlODxUyLBBatahe78Rdyr51kkmjVfOdA3YpgydUDahmu?=
 =?us-ascii?Q?XZa4mk0o9+d+7qoFDjRwVBnlyq5WBRre9S39gJ7J/mg9sJLrF45igFEJf2pG?=
 =?us-ascii?Q?fADc2u0eM0/YVotgyVlHibba1vWkjSD6zFok8ZYEIHcYVGmUsd4IIKd9ZVVn?=
 =?us-ascii?Q?yMkNatSxbeD9hYWxFnuYfBhFpNJLpF3GEbdg00WXmrq2STSysHn+isGE01FG?=
 =?us-ascii?Q?jjfKGrNFs8Nz0Y9bdE/uiShGWbdSzYtjDBlhjC4sWXrwClzk1azwx65UEIAW?=
 =?us-ascii?Q?k5yfPqPtHwAhX+QUX/odtfOtdk/uWHMWXo39lEOpFMq7CIaw8oG+uiZ5Qjog?=
 =?us-ascii?Q?rvhTybgPe4b70x3CJNwvBgBpyPe19gy/WdSJ4LV71Rm+p442YO7DfQmbxqbU?=
 =?us-ascii?Q?woV6bxrm+poE4S7agGWvLNRNgJVvf3JMEjp1CaGGdIATyz5oNYb1+l89nm75?=
 =?us-ascii?Q?nMfD7QwFp6NeXrQ5uuArR8XKR/2w3afohhTakQg82rMk6+UWxhxS052LTadZ?=
 =?us-ascii?Q?TjK8hDbKLHuxkCemM5Gi7FJfihKzKsv8jgyPQqKFs5ta4U6g35pE5hB7vPHd?=
 =?us-ascii?Q?8ZA72JX9ULD6EdfigTDILrvfXPKgUrXlnp6nP+0/SfJZFF9j2Y12KgYodePU?=
 =?us-ascii?Q?qyPVj1GUhLusxYN6sQyal5ucK68PVVgg+sLR647Ma6qWOoVlBD00wpT4tmJF?=
 =?us-ascii?Q?f9TZ6qhEUuyc4n4abldDpS/hth/ghrkL2JDu65LXKKJGWVR+px3wWim79qsy?=
 =?us-ascii?Q?adzwaROSGkTP8Q4wRNwDXV0rSLWP/etsV6obNUWgnT0Pr3S6hzsjd0NjWd2Z?=
 =?us-ascii?Q?+se2y70B+1/Kz82InjNSr7xRWIjakqw13KRL6M+Pz/7Wo3sB9UM4m4Z7cZpw?=
 =?us-ascii?Q?DIPPwm6MOtpfU8LWu4cVD7Oz37zCcXLEBGxy1blgU/G+nPYXR0EiVsXrb95a?=
 =?us-ascii?Q?7utEiqEuGaIgulQQooUKiW7o06Vddm4Ocs9dPGN2VSDv3OYVjqZwRdZaJnPG?=
 =?us-ascii?Q?3KdCGiy41Y6SkiAvNgJghugwu2T+tqe8VV8l3OASUx8pcglCTbb9Vwug+zvI?=
 =?us-ascii?Q?sTMGDs/njIoNnA1llQKqreWoFsx4ucBZopWJPya9Wu1hC7IB1D9YerWKb+Wu?=
 =?us-ascii?Q?K9TQkLLduzhlhDw1HqKn/DVwPBhbPIPW1WiYrcS0HdBtsDkinE1JXLdN88wK?=
 =?us-ascii?Q?9KYvfFt84O4mEpMe/OMDV7rx0cMgzvXIKJalCwgpNthECpVx6UcohwEo4lrR?=
 =?us-ascii?Q?Wwe2e2+Guv/xiFnAO9khzYpVs8/3pyYYPIcC6YhSYfc496JtEqXZLfuTComE?=
 =?us-ascii?Q?/4ZZueR5GI5y93WPUTGY4AM4hytGBYpo6gRrhDYR5HLDRY3jrxnvPqnKQDaP?=
 =?us-ascii?Q?t9y1vDQmw5Lasi2s53+BdD8QGQO1vwsl6fXmMJfOtix7WZKnEEONnntL06Wx?=
 =?us-ascii?Q?4UkyaXAZ9So2QBOOrrUJgsJpSjMkeIR8hGqqOJ0wur2v7uQE8buW8IY+T1Vx?=
 =?us-ascii?Q?Uh/qWYiwzGCCiaA7T1RCAKd1nIr3KH4CrmjcV72T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf06f8-3cd2-4bf2-552d-08dd87cb70f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:43:20.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6H3HZerIKDs3rB9PhEq9k4VaBLBC1MEsOpN1G3n74+wozWnDnLHLjWe67AwfBJ6pbQTdQ7vLtW6qpHMeMM0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246

The description of TX_VBOOST_LVL is wrong in register PHY_CTRL3
bit[31:29].

The updated description as below:
  011: Corresponds to a launch amplitude of 0.844 V.
  100: Corresponds to a launch amplitude of 1.008 V.
  101: Corresponds to a launch amplitude of 1.156 V.

This will fix the parsing function
phy_tx_vboost_level_from_property() to return correct value.

Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
Cc: stable@vger.kernel.org
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index a974ef94de9a..9598a8073991 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -317,12 +317,12 @@ static u32 phy_tx_preemp_amp_tune_from_property(u32 microamp)
 static u32 phy_tx_vboost_level_from_property(u32 microvolt)
 {
 	switch (microvolt) {
-	case 0 ... 960:
-		return 0;
-	case 961 ... 1160:
-		return 2;
-	default:
+	case 1156:
+		return 5;
+	case 844:
 		return 3;
+	default:
+		return 4;
 	}
 }
 
-- 
2.34.1

