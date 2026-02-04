Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BD2C3254
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172273; cv=fail; b=Pyb9RAHf1whKt6p7ocFqyhFpRATBte4qxOKMms5GTvUU4mUk+C35MeKKYaFUDQjICFoQIpSWBS9BI+FGBNq1ll2JjqHS/2jlDC5CDoSLqgpSQI5JHQlUOGpXAZolufj8eaMz5z9GJqUgWN0FaIeounqL7Q2qKkMePYdD/yGI8qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172273; c=relaxed/simple;
	bh=XIwVWTP1sKrbkWnpvVcu9OSDarp+pR2IuvLC70ZTbJY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NW2wKuKKMzWzXBwd31bm7FtjA9SFL8CtgGIzbgA2T7iXp/4sgkpewDkOpJKW1oOe80/DrX1KZ5qFB2dc3i5m3IhesGWU8jAlx4ANoApCyxema0NGWpPKJ+c/Nxwt67+H8+AY1ayfbOVR/asF50Rh/7KnJTdN0pX5BGRIe5nLsbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S++NonsX; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S++NonsX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXIjDlzXbb/ottst6/jHufq9XzXTHIuqvNMn2uah9+kJPS43k0V7l3eKL1sXXfOpHvlpZrr442t3pTWkvMQlu/S7FUHaGsnwmvR4NPg4XjVaRFbbCA/bGUWIpwsz5kSx8u2N3P82UXSZGBnHfXm8nXuIiaSzg/XbCyqFeqPAzFgi+46BKRMdEubH9m6SeEi8UTTN149psXQ+7m/cg/4X1DNO4aGSQ4EELENWGGdRW4buwY49cXWw8/20a7i6sVzbkEc3+HN6ZLpe0eb8+5YPmQJ4fvTm5E8gW5Ch8J1yZN+nFIci3X4R/7239XhMP9UztAO2VHTgaVvhlKFMsGF+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIr3lcBTY35/NbRBET7sbR0u1FODvnPxr4GADAd1gQY=;
 b=VA8Un5VwaIZPurpxN1uRy2QD274oqgTXAM2Qzg/cvIIUTrUsAjj3or3tNHemqNzDQ+ciJKhpn/gU+yYVFXmnMcAjUqeeKwGOLcWunDaSS2CYoBFZWyp6KL5wnLhmmD9g0UJ8b5OrkEoKDSaDbM/9wie7IyaN/GtlAz0KL9LRv+A8jYt5e6276l0f+JuDWwvlrsx5ACirdkOCz4oMwu2ERRoMrqUbm8fyqe1ZBJipMVArcEmwJyblrKUF03Mnw6y+qUYjBrRBrS3sGWlyAIakqeng9gx7akK4gIhU0fiVzCYFD5hvt3+vZxPe+ovF3TzsDBGehZQePVJt4oeA4utAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIr3lcBTY35/NbRBET7sbR0u1FODvnPxr4GADAd1gQY=;
 b=S++NonsXyfXYjhUFHOlWt2cBM6pxNWChPdsEQvHWH4o1DHcujhDIwVaY6WjCT4jIPWT4/R0mjI4dwxLZhHGnbzWiUk/CYCfj9pLISXTfVvXV31VIRyoJDk9I+5ziXfRU/D+1hBT+P08+kaZ8GyFTP+sP5dKl491exQmiDT3Pieu0D3NCVFqqccEdb+Qv3Dut+gw5WulYZ5LZsbcGuCiG42G0DrxryY49py6bJTWBO/T7oNOW6AOP/Zve/zTldjWAR1AZAee7aBGNp1M7h/jbe0L+xh+qIqiJhfiTiF2BmDc271xlTpp85U2xi4V1G/6/uc2Gey7WX92tI9grMYpSvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB10432.eurprd04.prod.outlook.com
 (2603:10a6:150:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 4 Feb
 2026 02:31:05 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:31:05 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
Date: Wed,  4 Feb 2026 10:32:01 +0800
Message-Id: <20260204023204.2382433-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB10432:EE_
X-MS-Office365-Filtering-Correlation-Id: ce90c40c-4126-4e01-ee6d-08de63957260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LyPYNCDBh2LfuYS6YIyiXZKa7WCVRV2JB9JQMt2ueGzRIGLuwJza0xoLrZ5E?=
 =?us-ascii?Q?JyFKTnwX3Kgp/MqgNXPomZCD2gI0Zr2kYs9hgFsxUxz0y0hdNNzlXTJKUBmA?=
 =?us-ascii?Q?/I/r/N5cMSRZvUVzDgYL+ay9GFN9l/kzbzWiXUiP1KsQIotFtOxoxP92urZ9?=
 =?us-ascii?Q?XI62N08+MqcWENfrsHqf8vr/IFBeZ7EcP2IXfEfp41ccoiJ0R1FdUOV9dYlm?=
 =?us-ascii?Q?4HO0n6Nn5j6ZFa7Ti86knCc1hdT01uNu2pb/5HwMIgSrw4t58eE6PNUZqyNz?=
 =?us-ascii?Q?zxfWTDKxkHQbeofmiONlMyewjm1aQBJu1+IKMZwII8a3PNhABQpNyUyj7faG?=
 =?us-ascii?Q?5SB8NePdalWXST8x1+nkABfvZlF+XsJVwDL7HBywLLmy+GU4JpVsOzine3LX?=
 =?us-ascii?Q?6B4WM2qnheiBkCtFrkFZ6jxAJawHgrTy+A7v/mj8lX8QSaLEpV+LBbi1XIgx?=
 =?us-ascii?Q?2QysiRa7IgdD0mwX0nLXoThqNiL2A416vUTDSfqtwHwQR/yqH7tECP8fbaD4?=
 =?us-ascii?Q?Cu51EVo2H8OFVQLO2P9ilR5YTpdzivss5tHyn8b4x1UNQ++tJI8LtBru0uMU?=
 =?us-ascii?Q?gw3FclhA8uHf3jejD1DAHa+GSpz2DoOXKDfVnALxHLsCxPl6D/5nkEs6ocef?=
 =?us-ascii?Q?5ePJ8No95D4opaiyCQAKO6y1A+juc1h6V8otM1/iYLU0TvRmMvFMcg18PrB3?=
 =?us-ascii?Q?9BAdL8WB5XfQpZscRK2ii/RCdSqXS7hwaLzXQkeXCrRwKWA8h+LPUMsBo/Ts?=
 =?us-ascii?Q?RnufMtPO/kJ35/YCNsSl4PD838rfdiV1d/xbHJAe6/46d88Q/sQl/BKYFuJk?=
 =?us-ascii?Q?cpArnjm83NuwXYWyqyhZCnj3yR7OW8Sc1PwCR5CWR6mUIn22PDGVixh1rjCY?=
 =?us-ascii?Q?Pmk3MAws/51C2/p5cKEvmJ14r9oISovRGko8WKO+RCwrz9wzCqkVEq49OAL8?=
 =?us-ascii?Q?ocTvFwiZIN9yCkGTQ5aGSKJsQrZpbLcpTz+pXtxYxr5W6Ym2+52cPi8/UIym?=
 =?us-ascii?Q?JpckQnM3Rdtx1q0lXkkCfZ+q6slGrAWaw4F1b8j3O8AIe1G8euawN8KK3Sb9?=
 =?us-ascii?Q?QHIQcyf4BoEE4LLHc9NLEAT48WmAyB7VAjETZ2Ea6Xxv6DSbWIXk7gksHo5+?=
 =?us-ascii?Q?Bt6GQmjgLXRSBsD9rhcRPPkKuyf66qWOm9KtN+8rH5JB6vq2jb1Wh83bCWE0?=
 =?us-ascii?Q?CXRB+CRU0xaXEiY3pmTgCZIV4in1WNwBLGuWb/tnXOo9aY0HXBSxG9YtCVrQ?=
 =?us-ascii?Q?Qj2y8cikKo4SGhCUOxgDppC/4Q6XwrLNl2Muial5Mhrj65NZVuzJ7YCkGETz?=
 =?us-ascii?Q?SSRF363a2WAkuWvorJ0nPCq8PsSYivh3w1/VapwHhrR9w2S1NYIO4xy+5ViK?=
 =?us-ascii?Q?WW/5Tej1WyXRlbpuMZFl8WJkB232Ys6HsAQ6cu980pEoa3EXWiWv/Bnij3GC?=
 =?us-ascii?Q?00COBqI5zRRKjyM8ZSR/M+uSgPOt6WZsRfGs71PHJVF+eeoXfKErKPXGDcwx?=
 =?us-ascii?Q?q9j3Ir+wXHiBqahs+5aiv1B5XtbsayEVSVjXUSwFBtgVVZ+WsQemnYDGAwJT?=
 =?us-ascii?Q?PS4yotxzop88yuD/nfMcqfwkOeXGFNDAYuMliZLAj8RRUD06Cp/aAYt6dtre?=
 =?us-ascii?Q?CxBZ7EyZVhRtZNr9wUcmLgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+0mFD2IlCWwyd0hTZZSYCREOWi7EyqF8FiWswYRihB5c3pr+8g3mViSZYiPe?=
 =?us-ascii?Q?dEhxvVXnn2z7twI3h7MaMjQU3XcnrO9psdI+uIYT2TLjdrrv0YCFw/DOFjeV?=
 =?us-ascii?Q?XHz4DmJfn4mnYhRaLauugZ7Tk35pPSJf7WKRtRdVjVvz0kDCT0uGTsW0BV8z?=
 =?us-ascii?Q?YRenkzNUUJQmsOUHMeYcmbq3Lhcqx1AmvetlVWCSmAg80OwDdrLioaDQpgY6?=
 =?us-ascii?Q?U1+2+0/5WscpoEA2Pk49iDywxsbbuh1z6kVoK3ykRcOE0/g8vr7FxCKhwiyv?=
 =?us-ascii?Q?aXwdm1UCc3DsOpumEOcQ2+x59Jq1l+PK7Qj7cv5O7eR6Ok6eKYpJ3NYkC5cC?=
 =?us-ascii?Q?8mZjwJTOeGLmSaOzfpmWSfRchgQMmGBGWTIoJK1yXvW3+3QHFUe8eaxhpBiM?=
 =?us-ascii?Q?MHFIx5ZxpFj+PieYN1faWJ6lkAnlw9Whg2S955EqpfkTbs33skTWMsuyhL7I?=
 =?us-ascii?Q?8Inli95AckGhuF/D3RnNg20uAvdvhiqKOcXp+yC2aNgO020cXj8NKRqVOOuT?=
 =?us-ascii?Q?2PHKFSCignEZU7rYG2LdGDzpGRybhT120GjkQiNwel4cV2FesYk+navDqr8b?=
 =?us-ascii?Q?aoo83dzB4KQSRfNNSD6LxOwIuPo653rfjQ/9noTvlO/Zisk38SOrw56k5VXB?=
 =?us-ascii?Q?0roZX1+hlGplwmFfuPjX/FGHitFMnOO5+B3V9lXkxsMIjpq9wFs9JrkO+xeB?=
 =?us-ascii?Q?qjbtcOvRDwUIP+6eJYf4ExD9d367BG1JxOv7vtHeHFQ5gum9OW7+wiUPF569?=
 =?us-ascii?Q?PrUtoIVXTzSk2fBzUPFksFWJDnaSfTio7Bwkm6qp14oYsYi9bjylK7EO+DJD?=
 =?us-ascii?Q?OJxsE5H73EXx7qFgKy061DnHNtpBVJbZb8/LSXR5816eCYtdP86MkiMONfqt?=
 =?us-ascii?Q?mSLxyNYXiTrcLjV5RF23rynUg+fml1TzhCi5EPCUzIKx7rTCknH8Q9WOGuJJ?=
 =?us-ascii?Q?qangM/KgTeK0/jbIJ+cdeaO47Lm7GAfaaGrSeecp0Nle2diNw0r8CxXdiJpG?=
 =?us-ascii?Q?VMTHRApk1LBJyFaYzG5ZaBi8THwIDrBeTFSF6PmwEep8+fymdyR4keETobGG?=
 =?us-ascii?Q?N6TYKmQpoP4Cfe96yuT1k5cHXD9zmRSCRRcyhqTz5buT6V5+b5qbeMWQdleM?=
 =?us-ascii?Q?Tf7BxuD2zU9+0gxdfFrOT3BFQ3zalU0IoY6FjDvdhSseOrB1ePSIc6FIqVIs?=
 =?us-ascii?Q?Vvq9Qvso2oyJ0/QKbU9lZJqvFVMEH4+uajCdB6wWk7iBaeMdGKH2BOnUHA3X?=
 =?us-ascii?Q?vT+iGpKOqSdqBetB7IU90e2/pw8fdxNBtpLMsP84FKbGrO3/sYKyHaq25Ri2?=
 =?us-ascii?Q?cltoQyXwF9FzbDFHgCQDAzviYMLkep/GAg5sBKfoaVfmUVmUSy8I80kvyB09?=
 =?us-ascii?Q?OCVz1pSlPqE/vLL8jJY8GY3si7hrvpQ9FYHHXburc49rbdX1pZq5Jrg0OgVA?=
 =?us-ascii?Q?aBLVQB0pPW0HmKhfYN4aMKtOJ2INTJW1X78d0nfZAftDq+I60vzrVTu59xNO?=
 =?us-ascii?Q?0VfETEFYuez3XbOcyWCBUEMOtra4KGKu5yvrGKoKtSSIrgB7/QxWj0QqvDU8?=
 =?us-ascii?Q?Xxnp79rnJog1nvQZSNW5xyeUZEcRkIYW43cijbeXEHKnPGnZtHHTPLkM8bac?=
 =?us-ascii?Q?bs9jONZvZmh9zp5ZPoxRACnmlQDHbWzXip1GGUCs+tvcxEYj3O5b+LCJZZpm?=
 =?us-ascii?Q?MiPng+b+xfVmMxwZrNXGECVlNQsxjK8Iepg+mePp8O7lVlOdfvEGyGVp0GXR?=
 =?us-ascii?Q?FyS5Af8JlQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce90c40c-4126-4e01-ee6d-08de63957260
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:31:05.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cu2kHt9fUQoDw9PxiglIhKNUDkgMpve/IQ+/wKZDIT+W2gAf4iEGNfQDSfewxSJbcIjDZlKeIdnqwC9T1mqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432

This patch set adds usdhc1 support to enable M.2 SDIO WiFi on the
i.MX8MP EVK. The M.2 connector on this board can operate in both PCIe
and SDIO modes, and SDIO-based WLAN modules require proper power control
through the same M.2 WLAN enable line (W_DISABLE1 on pin 56).

The first two patches are preparation changes:
  - Patch 1 corrects the IOMUX configuration by enabling the pull-select
    bit for the M.2 regulator GPIO, ensuring that the weak pull-up is
    actually applied.
  - Patch 2 renames the regulator node from reg_pcie0 to reg_m2_wlan
    so that the same GPIO-controlled power rail can be cleanly reused by
    both PCIe- and SDIO-based WLAN modules.

The final patch enables usdhc1 and associated pinctrl settings needed
for SDIO WiFi operation on the M.2 connector.


Sherry Sun (3):
  arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO
    (M.2 W_DISABLE1)
  arm64: dts: imx8mp-evk: Rename PCIe regulator to M.2 WLAN regulator
  arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 81 +++++++++++++++++---
 1 file changed, 70 insertions(+), 11 deletions(-)

-- 
2.37.1

