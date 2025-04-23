Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF093266B65
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401469; cv=fail; b=uMvUSHjY6RbBkdBUmUru8Isr9RI3eS7n+pJAvKbqkyFR/WDOMh7Lyh42X0xj2etrxw/RPnhNnASCxfhtc6DRwGv8ov70Ow0OXNpSC9DuVDLPkGrU/IjaS81yafE7VqKjg6OwticqSlctv48V+2fN0phEjSoEMhaD2VCmNG8Ve8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401469; c=relaxed/simple;
	bh=05GEaluGI3cpy5RshjMOHMtO40X2+AGllKmRVuIHLo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=trly6Jd/ox5veeMsx9d4gEw/MWK+ZEeO+NyDwiVhDh7XGi0sxDzE/M531OMHLn5WjHL/RfouTchP8j7/Gq0yXTxL5NC/f14abo7OrsurWAzrdb+LBRUaE5TDCgeZ6igllnYcC0IrVQ/whSgVERrFIQLcRT5A46gFLkwx69osK00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kb5R2Z9s; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kb5R2Z9s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7Ont4+dnSmHmUxlAuZHYhizM3dBPzoJNlGcl0N84ZiLcoRtM7p0GaY/1sdUPI+XlbBl9kFqtoOLNEeDYvhM/dEPk0owYhwYOfUlA8Oo5mn1p86cpR6o5fsCZI5WhHIQ6hPzqydZAmOWLp/OzXKOftJe4mH7GjCTfVyfBUO2ji5KXBTYi3sH/T3/xIwfcp1Z3gYykg55XVv6aY5rxkG0fy6wvzgCsSXn+NgOuS4DUMvvlXW9MLr10ZXRF4T6PndQ/Hhrygu/o+X7t9/aEnsuOz/dpQ0wZYibBAdQDTG5VzROCdWWHn7mJFcIGOvRWKKAdYuK8RNlRNCatf5NPMQi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a86+q3yMpFKgrGqczjoKyttZ1rSUhaOSOfjgva77ax0=;
 b=K+UvvyUw6yHb/B0xyFMu09b1di9H+P0/4dnZ6KCpaQGlngjXoQ3GmG+zrih8t/5ykXKslhqd/M/u8WKHb+0Dhew/WFXNawHdiZ6dqeLTZH/XBa8XvaaXPc+n/zSFOOcA5osgTiyExkGC7Zl32xG8xorcHPps1WImZ78FUO9iecQFENw7sBu3XqrMxR+6/91X4RCVwi7DInxZCIx4uKsCfZmnJrhfKiNpEqmCyeAjXf8RjRK/l3IyuwS6DQFX5rp/r+x3ZCpTbdOpaCfkbBJFAtxPdVZhX9j2qWMWGysON9KXp+SL3/NH0+0xd6kGrs8GyTtYOOPDArIemwmXi2fR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a86+q3yMpFKgrGqczjoKyttZ1rSUhaOSOfjgva77ax0=;
 b=kb5R2Z9sRCFcQpeAGcZWrzaOduMOau2n0TuCeo8cbU1jYUNNYMsGLYIJJkLTNfPsOPqzYABhTCPdP1iBjKkgGuVPh6mmmYkhOqwJ6cRXd0IpzpENbDEfSFjqhWJVqel50p8IIfrGhIw0Xrc3yltDLchgSbvUgIcR7CsWeeIxr4KomZZZaL+ZsUABCA5YhIR+VIyTv1M2FxNIR1WBoPLWjYkTUYi5CYkcpVSweyMP1WQ6+OsQwBJYCOp4JAi5MHHcI1ferhLtAnYJWUK4FMud+eFe1dHhyJ2IyBbkghvBq5yydO2y4DUrgr5VHaBs64cadsBGm9adST7/Boytp7R3EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7338.eurprd04.prod.outlook.com (2603:10a6:102:80::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Wed, 23 Apr
 2025 09:44:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 09:44:25 +0000
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
Subject: [PATCH 2/2] phy: fsl-imx8mq-usb: improve some tuning parameters and support i.MX95 tuning
Date: Wed, 23 Apr 2025 17:46:07 +0800
Message-Id: <20250423094607.1029429-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423094607.1029429-1-xu.yang_2@nxp.com>
References: <20250423094607.1029429-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed710aa-8273-429e-772e-08dd824b6eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbF2EVweKsXa3a0MHRsNgl3QatinBSeKiyMDiOtMuFtX4pMkSEe853Tba1q8?=
 =?us-ascii?Q?pwSB/6/pGsJYpSde4f/HuvWMRfUdXOthVY+Tqtd4hPiX11PeaCeYrbQaOUHz?=
 =?us-ascii?Q?h0W7vuAOgjeBB4/RvdRQhiKY1iyBpfEu/kSnwSYCAMTlT2jCg6vc0aXVU3+i?=
 =?us-ascii?Q?vEBdopS4ajOTe+Uvo4R/IDTqGwryBzbZLWR1TAa6Us+XDyO4il3AJtTt7ePt?=
 =?us-ascii?Q?ncnLRGLmRbemVhDWa9vrKvk7KAZ0bhPqhd/p8+wpWQXOtXGkwqIECORlzJZd?=
 =?us-ascii?Q?3T72gTA4QMM6Ebm5Xdt45OOuX31Vu5aRusz1kF4pnfVqsqvp1ga628MG1zRy?=
 =?us-ascii?Q?UEuFvVxQLi9BJHBqbpAuqp2wZzm8+ywqlJsUDW8NKiIfgYvPmPfioG7pubxY?=
 =?us-ascii?Q?aVtw4rVDylmM+hDe3uCpR2WTKpYgYhdwvEFXPAyAsNqqb7T+MCflcIbWRxaf?=
 =?us-ascii?Q?86zXVXOS/zUzmWgjRVS+Fj5ZAf5IYoCVKyHrHX3F7gMSYiYphhtKBJCGrgXg?=
 =?us-ascii?Q?gP5s8wvKtMNZy8GEkUTgqYIrSkZ9xXVt4G5+/QccwF6n/UtYHNU0hyedX4WJ?=
 =?us-ascii?Q?uCWaWvvShwLAvaoabWy69Z5NScFPKzXOIy+cH1ZR/YEpTN50EHoKAAIPCjMZ?=
 =?us-ascii?Q?5XU8rH4hMG0CTdtnKbMZPFD97kCv/OlO5FVAtJhkBZAtIm4MsQytVSmk1dAU?=
 =?us-ascii?Q?AeLdJgoBhDDse2eV3CBTs5NzEyJQzWkeuhctm7cWD7FeE0Pp/xE4NkQqK4mv?=
 =?us-ascii?Q?j2VFFqYac6DCxnW1Iam0wGunxM502p+VKRBly0msnye/oTzt/u74vTFNXJHS?=
 =?us-ascii?Q?K6KVe6/f7bnfnvwKHuXNqgrRnhgmaPh14Vfza6t7dzq4NKvn2c6j227LQ85R?=
 =?us-ascii?Q?EvsU3Ofr5fN4LHSpJgVMW4g16QavLVKArSRuzXamSF5lelFgQIZiTe3/ktJU?=
 =?us-ascii?Q?aPdJki8G6SfqEtPDeRWkww4VXNl7Xe2Sl/X3tz36dHXE1wAdM/oIu9ov76ss?=
 =?us-ascii?Q?UPPgNi2bfYX4X2CpK+aSxEkbYyXyuEPQ2ysDkSVkav7At/GYIYw3LODtmZPB?=
 =?us-ascii?Q?TUS+Cxnb+JShKU0lxIlt5YgYe8TqBxJN8gt1BcrEg/ofNr9igjoOTEKga2zu?=
 =?us-ascii?Q?nXPav5EI7Gs8Jb32Q8xn4iU0+G0vQKziswRIzizkwuP30rndGXnG6WuPC9JZ?=
 =?us-ascii?Q?cYWv5vyII5NWnaRx4jHLMh/LPxHbkojcCdZ0zxA33r0ofu0geQkibXaqjhfx?=
 =?us-ascii?Q?wzOyBBjBuL2PMrNa3R8IpzdI41wqbbG+QoVEK5BEAbqm7eSVCtJcc9hrtGZ6?=
 =?us-ascii?Q?Bw/pn9qidMEby/5KCrAuc3HiSlSYLseFm5gS3vjbt5z/FAigss+Gb6UcUHRs?=
 =?us-ascii?Q?cT0gvwit7kXctq3i1r3hSR61nWgFWErRnwyLfBW4tsSHs0c94dkVLoHNS0Tx?=
 =?us-ascii?Q?H1LXsDhKDJOOU2cfq5Tbde0DLbIwZxiXJeDFvku5QuuaUTNeE2XDvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4Ewg7you78EGecRW9e9QAO6boDm/lupft6oUd2GsHUvuGY1iD4CJeF7UAsp?=
 =?us-ascii?Q?U1zeFFWmHX30pP1mTT/L/5AC0D5006e2z89LSCm5KgN2VEBwtIGMTOZ9lcFU?=
 =?us-ascii?Q?mJvmdtgJ50ebX9EdlDqxIRXhUNqskPm0a6VeSFx7hPWXCg6cQ2oa25i3xyZT?=
 =?us-ascii?Q?3RJOTOogLnYsD0mh2Hfp4U5OGNHNcXLXGpSx+/+QokwwbAHMV4fz7BesJTM+?=
 =?us-ascii?Q?1X/2hPSLTUmgA2yMw1cKVMiFJDtpMviSD+H3tHtMTJVACBJfBOkdcDlgmMuV?=
 =?us-ascii?Q?jKBmUv0dyoWLRUxJK+N1po0oG2kCADpIEajgyslpea8Ri+2ZrDo0uLVagOQV?=
 =?us-ascii?Q?JGeCU+L/WfGpCV0gLzYO4utJ2XDDvM/T9JD+GMb/lpHyQOz1rwxbjXK2SV0H?=
 =?us-ascii?Q?ezg5CGFq/bognVL5IcYb+yDtqpgnpBTFVYjjWqH3xP6XzDF1gnGXkt7IEyZa?=
 =?us-ascii?Q?4MCf/jEpGKbPQDRrJaBEz/c0cPQe6tX0u1kClHDxI1GiGXCnX8dDGXrUNF40?=
 =?us-ascii?Q?ORbLFY+yoTLVTpE0CzPgGzqA8kEOdPdoHt1wOopi88InrP2U4xxuON2R8vdJ?=
 =?us-ascii?Q?NiIDTtLy/oPd7EGJj0A0GRIr0z4cdmK/oKm4dzdELKIzVs5Qan/7W21+MgCH?=
 =?us-ascii?Q?T5s+F5Vjzqy4EY4aUmtLusFxxz0q5GCrfCGqV44OgtK++W9JT+D4bT+czHaM?=
 =?us-ascii?Q?kbHahIT7SpAivZ662xdAABcGiUIxzITV+F2njzx3LAIQGjh7k8J7IOvrYbjy?=
 =?us-ascii?Q?FL3X8cSFJ724iwvCP6KoIk7poOfHF8sjkdhtYdRgRbnqR6RaaCxzY5bcIMSY?=
 =?us-ascii?Q?2bLtIotlDPURqY3yvEw816t1Mubpc1c+C8o+UGQ0ITFiSxxiQnYDxKD4xisf?=
 =?us-ascii?Q?bYmXkS97vXwtHbj9/3fnvTcfd3A6Mk+22BDpaeYM1a6BAjqUFLILmTb7Kw6v?=
 =?us-ascii?Q?DAh0qtIb+4tNpeh+2y7VemkcL6iJNtPBU/LPhoOqAHAVnHTdHNG8O1EgTYZC?=
 =?us-ascii?Q?zASVHk9Qrp1Mb8ikxqU6slnt8GZEmrz0byexwRShd7/mUkrLYk8fc2Ti1ZiR?=
 =?us-ascii?Q?Ho3RyCNdvZvE8ankw8+3rWy+XlwRSEzgmGiJmLjFRZmUPj4fQmElbRLWT2SA?=
 =?us-ascii?Q?ML9T4XJPnvBa1L6s9I4dGuC5faXmwhTqhrmjqANi2cm096/6OxXP6hC3wYyj?=
 =?us-ascii?Q?h14vHaAuEkFcM2hNsgoxS5cIUqOFTTRokTOTyNxEZSVFYcGyVmuPTZ710L0q?=
 =?us-ascii?Q?yClVFKT+TCe1qL5J+GX8J+unqEpAJNu+fysH+/2mJVxcJZWTTQ6ZwsxiFhiu?=
 =?us-ascii?Q?RSGpp5iIlIQKXWiOwqumMxEYg/ZguwNVwIXdHr6SdCwdjTcoz9Idy0gCSVBl?=
 =?us-ascii?Q?YyLnUxOkut0CA1WFXsB6r5Qe2shukUHOKxFUMZHRY8/5vl0K03mmNFduQjrv?=
 =?us-ascii?Q?EALKrNmu1MnOGY05iFdlMSETXtA6amv2byN1hQWJImREEtLykONfS4L28+dy?=
 =?us-ascii?Q?sqA1yNKd/f4Tw7OwYDUbC4wN4ikMl4RmsYP4meMNPFF7rDzrekp64/Fw6ZMC?=
 =?us-ascii?Q?JKoUm50nvRWNG3ypfnA1o8T5uFsSD9r9l44AlQRC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed710aa-8273-429e-772e-08dd824b6eaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:44:24.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIn9ONadC5Bstr8anXQDnzV5TlLNILZJdKJoR8JTrqk55O1A4uZDKcvWCdUaxvhc0/634ECAbmemp7XQoRUPBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7338

Since device tree support negative number, this will improve some
parameter parsing functions to handle negative number. Because i.MX8MP
and i.MX95 USB3 PHY have different tuning parameter for same tuning
field, this will add i.MX95 tuning functions too.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 94 ++++++++++++++++------
 1 file changed, 68 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index a974ef94de9a..59b9b4704b03 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -113,11 +113,11 @@ struct imx8mq_usb_phy {
 	struct tca_blk *tca;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
-	u32 tx_vref_tune;
-	u32 tx_rise_tune;
+	s32 tx_vref_tune;
+	s32 tx_rise_tune;
 	u32 tx_preemp_amp_tune;
 	u32 tx_vboost_level;
-	u32 comp_dis_tune;
+	s32 comp_dis_tune;
 };
 
 
@@ -286,24 +286,45 @@ static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
 	tca_blk_put_typec_switch(tca->sw);
 }
 
-static u32 phy_tx_vref_tune_from_property(u32 percent)
+static u32 phy_tx_vref_tune_from_property(s32 percent)
 {
-	percent = clamp(percent, 94U, 124U);
+	percent = clamp(percent, -6, 24);
 
-	return DIV_ROUND_CLOSEST(percent - 94U, 2);
+	return DIV_ROUND_CLOSEST(percent + 6, 2);
 }
 
-static u32 phy_tx_rise_tune_from_property(u32 percent)
+static u32 imx95_phy_tx_vref_tune_from_property(s32 percent)
+{
+	percent = clamp(percent, -1000, 875);
+
+	return DIV_ROUND_CLOSEST(percent + 1000, 125);
+}
+
+static u32 phy_tx_rise_tune_from_property(s32 percent)
 {
 	switch (percent) {
-	case 0 ... 98:
+	case -3:
 		return 3;
-	case 99:
+	case -1:
 		return 2;
-	case 100 ... 101:
-		return 1;
+	case 3:
+		return 0;
 	default:
+		return 1;
+	}
+}
+
+static u32 imx95_phy_tx_rise_tune_from_property(s32 percent)
+{
+	switch (percent) {
+	case -10:
+		return 3;
+	case 15:
+		return 1;
+	case 20:
 		return 0;
+	default:
+		return 2;
 	}
 }
 
@@ -317,12 +338,12 @@ static u32 phy_tx_preemp_amp_tune_from_property(u32 microamp)
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
 
@@ -331,27 +352,35 @@ static u32 phy_pcs_tx_deemph_3p5db_from_property(u32 decibel)
 	return min(decibel, 36U);
 }
 
-static u32 phy_comp_dis_tune_from_property(u32 percent)
+static u32 phy_comp_dis_tune_from_property(s32 percent)
 {
 	switch (percent) {
-	case 0 ... 92:
+	case -9:
 		return 0;
-	case 93 ... 95:
+	case -6:
 		return 1;
-	case 96 ... 97:
+	case -3:
 		return 2;
-	case 98 ... 102:
-		return 3;
-	case 103 ... 105:
+	case 4:
 		return 4;
-	case 106 ... 109:
+	case 7:
 		return 5;
-	case 110 ... 113:
+	case 11:
 		return 6;
-	default:
+	case 15:
 		return 7;
+	default:
+		return 3;
 	}
 }
+
+static u32 imx95_phy_comp_dis_tune_from_property(s32 percent)
+{
+	percent = clamp(percent, -60, 45);
+
+	return DIV_ROUND_CLOSEST(percent + 60, 15);
+}
+
 static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 {
 	percent = min(percent, 100U);
@@ -362,10 +391,17 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 {
 	struct device *dev = imx_phy->phy->dev.parent;
+	bool is_imx95 = false;
+
+	if (device_is_compatible(dev, "fsl,imx95-usb-phy"))
+		is_imx95 = true;
 
 	if (device_property_read_u32(dev, "fsl,phy-tx-vref-tune-percent",
 				     &imx_phy->tx_vref_tune))
 		imx_phy->tx_vref_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_vref_tune =
+			imx95_phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
 	else
 		imx_phy->tx_vref_tune =
 			phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
@@ -373,6 +409,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-tx-rise-tune-percent",
 				     &imx_phy->tx_rise_tune))
 		imx_phy->tx_rise_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_rise_tune =
+			imx95_phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
 	else
 		imx_phy->tx_rise_tune =
 			phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
@@ -394,6 +433,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-comp-dis-tune-percent",
 				     &imx_phy->comp_dis_tune))
 		imx_phy->comp_dis_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->comp_dis_tune =
+			imx95_phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
 	else
 		imx_phy->comp_dis_tune =
 			phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
-- 
2.34.1

