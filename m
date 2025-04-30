Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013068.outbound.protection.outlook.com [52.101.67.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92969246794
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006199; cv=fail; b=mIsaz8FeuO34g8roDhSVt8IT1pf01BaNyOitd7VWKsP98F72cDQxLbHAtGUUD7WMcbFQpJ6Xbs/EueylnChH7sMB9+l9Atz4udJBVbqADSFu6m7UjYh6MTt4IsRq5Lcu/bp2q1rJqoRUkXLg5SA8lmU903cHAg6bv6HkeDYdPjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006199; c=relaxed/simple;
	bh=G9yLmiiH3H/2HUC2AuAR5CG42NPT0814zjytrO6EHJI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hc7S8Y7scwVfguZRXTpehqYMv4Mrv5qz3o3DF/9LcLptLUhgtJjlh31PKQOh1F5MMeak1XR6Fti8YOCYCOG/E8BHC0Ghy2kpNxZDhqVaEvv/rqFR3+aQj0WvwCPVOsHGObhxG3LtgRkNfZ0gwOCxBEHMQeweKEXXESP0jExrqxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SNelJJH+; arc=fail smtp.client-ip=52.101.67.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SNelJJH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcQqAJ+x0QeZioQkP2OrCE8BaAjgE8IGy3zfC7oDfankTraDsHFr6ua90NiocGfbXzCbiZFq/GbSU17JKzN2iZlX9kDpKqzzEjT20b3F+bM7cZIW1g+o0IZcYWmbCRAXt1sfAYTmLHUpLD4w3BArNlmctdmEj8Zq8I852N2qB5ywQSTeLSJwVezJjoWttlvGdbZSoYPL/xO8VE+H07jbLzCwnJXM0Bx/slLr96H0oaQ8il+ZMpMY3CDlw8p1inQVuBsAMbcZSbZrNPLtzGJT+B5Jh+DZJOpj1vhHOggi2DXo8Ulc5IZ3pEHbkJfZ2oLeEBp6K3B5/RBtYybpC3/F4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RETbhTCGLuO9i10VqQR0v0fS+j26Hk32ShBYZQmOvDo=;
 b=SeFLBDojxSz3OJbNL9CKWyg/tN1HFCwKCkxNjiv4Mx7ymUXxLc03a64UHV7zyexZktp+7bcyAY/GA/ElMpcNM0ZuN522qg5yb1yDByc5hcD1J4tDPz8r1erBWl5M7u4bCf6aNJs63alWVE2ZuTvmmwATIqgiraQA22ftOeBLKhgNeve6VYDzLODVPILatHxHlH4tqoTtkmFeee/hOZg+XAF5vtYA+KJcmS+3JVD32vlSvLXf0Wh26Lf4vFj0HBo0SRhRe0SlXJoBecRNXX0R40YSMgyCn4eGtsT+ifThvniw8eBZ2hj3Xh1Cm38wkPdnsTgtGKhveqQjvlSs+MX3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RETbhTCGLuO9i10VqQR0v0fS+j26Hk32ShBYZQmOvDo=;
 b=SNelJJH+QIrQvqUpduVpgL60LpDX5nm4RxjCPvIqlLC49yQZyhEAOq9A/bEJ0rxUU8gMTEYVcl2UOAQGpd2HuC5tLOKEsxViTtKkUPzGfzfwIqqjZScPij1Ic2qKrxr5sneTh0WU1mXPgFwRRo1ZA/RrX0fniNrHzDg+7ZwlCt0qJgpBfSjd0NXGXgUee5Ctj8Ttwco2p+Wcsii6y0A8dazfWJyxFEfv1jny2vrCUkOKN9w7rT4S8giXdkkowvIfQkgOB/j4+Uzm8ADFmP/PnfEkkNUIwveiIGbdIOTr1gGT85iiCg14Nu9wDABAbBlk0XPOs7APyr5ioXxV0w09OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Wed, 30 Apr
 2025 09:43:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:43:11 +0000
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
Subject: [PATCH v3 1/4] dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
Date: Wed, 30 Apr 2025 17:44:59 +0800
Message-Id: <20250430094502.2723983-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 8fd58845-104d-45ac-f3b2-08dd87cb6b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?to9KNxZw3zZR01LodcXDvy/ymaJsUkwZBHExkSnngxjtHDGfjI0ziWIyLh2N?=
 =?us-ascii?Q?8SHxE8vbU/VKBhCw4JKy5D2JN4lXzihwuiiMVaAYbeBgJEm8uOrTQaFQeljS?=
 =?us-ascii?Q?GpsLsi9IpnoG7qmjrNrcgjGqhJIll5auRIrKO/zwvTdogf5m1kzFRvhQezee?=
 =?us-ascii?Q?20JnOszmrc9b4pNWrUTPoj3riRbertdBncE440ni59lP2JKZJreY1FZEz/RY?=
 =?us-ascii?Q?7k+IZYf9Jmj1WypcFpsPKiNHcm2Fs4HdQtuYG97rhVnsPd4zw+YbxVEYBKzv?=
 =?us-ascii?Q?QCRYwcrOSb6HPtbsWAryI23haVQSHDv24Aiyy99l7q6NclNZ6rBSwQO/LC+Q?=
 =?us-ascii?Q?WWrTmyrZbdmKf6MaScn9pb2PT7QivAo5lxNxTT1sXW8sdncXtwzzBVkCc0mB?=
 =?us-ascii?Q?U3xQY+aebv6XsLOtDoTvnpdLIANGiJ/QU+/F3vSMcUmv37cUFo8ncshaBUaZ?=
 =?us-ascii?Q?Wpwc7hJobWQ9cWiS4zcbKdyiopM7yyXu91qAfwN9FGpA2KpiHfPWEhDGMeR6?=
 =?us-ascii?Q?4o2bClcTqXOnzD3mwabXrUOpxwCx9v17ifvpcw24L22Mc7JXgfQ29uj/gOJ1?=
 =?us-ascii?Q?J3CjfQuLOcCN0NZmdC24DcTm10gVIDC3YrATzXNsXM4/jhMkINenmix6CqAy?=
 =?us-ascii?Q?Vm1EVkrMymo2v6UY/J8r9gfdsui59zUA3LPDT0Q9wsa7cRhy2Iu9o9EVl2VA?=
 =?us-ascii?Q?E6dGZDNBJoC9Qii/r2DMGnwg7lMFwUwZshMDBSVNXS8NdqgYgCzzWqCnatMI?=
 =?us-ascii?Q?U2jQygaP28c/997WaUXHbe1wHvMBXYq790RwYvdBYXWySY/WOurrmGtCPBTe?=
 =?us-ascii?Q?DM4DOM6BjQul729xlRmtFBVMQz8MKY/YWfpq+wNCqa1lqQhcKxBmuSqgEFxj?=
 =?us-ascii?Q?6CNRV2PeF10EQEdL+hRGdryG1MHI8AlnIj2P/WZe35c8dFWC1zRXhucX53WG?=
 =?us-ascii?Q?HiPa/P09jhBJL5QcHqc2arRpWv1UmEUiqJ2Eb98ypCpvNKXf1RQCkofy8FNG?=
 =?us-ascii?Q?8G3A7rkXoZSbQulSGhGWNVrG68HQjvFQyn+8hOSUh9OiAZH1rnoja3Tbo0w+?=
 =?us-ascii?Q?Ca3YBVJ/7Gpi3syrA5GQmPduv5h2TEMvdWOnztMH0j62qu+LG6S1TKRXfiMO?=
 =?us-ascii?Q?urFOwStuwFOS44EL1ODu+logJyl1jcwNqiyo0DFgwPwBtlMRczVcF625JK+5?=
 =?us-ascii?Q?5G1Nazk/6us8AMmJabci/rwwUOSMBXN8J+VyKpKqVrkVpIOZyZV0CF0Y5TZ6?=
 =?us-ascii?Q?kXLyYadIUm+vAFNOOXs5ex3Enmod3WvU1mvlBzvz3RSB4e+HHX2YABXzL80+?=
 =?us-ascii?Q?CjaQMRlz21b/ExENs8sazYsehPdxpalJK8ljAkXt7tdNHsilMAN/nCX4aJWF?=
 =?us-ascii?Q?g3EXXvLTHOQdC1+gTs//VEk7ZBlU/c0QiPjvbk8cXsLTNdjwwo6vhRU+CmQg?=
 =?us-ascii?Q?Xo5XuUVGO6Y0iBMurZFylH/iPWdAd2kJGfxnpGQK3tCbefqoADH6aw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCdt8goDBtCEXu5q5jphN001wTY97cBPmkbyvN4YlnQePr3SajbhSEjx8fSL?=
 =?us-ascii?Q?rOQ4KeE4F6TSDzZrLlUgJ3yVKyMC24Ohu7MMEZo/CieifMZpXyQ++YZ0wMdT?=
 =?us-ascii?Q?ehQ5ZN7CBs1r5mbC2OWGBkR0RdCJWdy63Z9z+nKibUk8b8dXkD+BVBPTbk1Z?=
 =?us-ascii?Q?NHLLcFHg3fQwKPLRVuDFmPPnhqtL1w+24NjXhltrKmb/oq7SuSOFzVuBVM+l?=
 =?us-ascii?Q?r7bVIUKBTcOi3ELSG5hLHDyCPwltSol/Pvf68/u0Mv2UUSRD2p8XtJGDzz4r?=
 =?us-ascii?Q?NJwtCoHcS7ptUrbvgFsDSk6Y5bRPHrs4UL4Sj4PfdJ/tLKEITyDV3DVQDjz/?=
 =?us-ascii?Q?EwBnWr69kmNA2Rml3IgAQuKFngZ3uOGsJQm2Q+S2qsMFHDuE5KYVrA+2nm8V?=
 =?us-ascii?Q?4D6AhZHtiDzFKQj7zSCIOzk6DMBZhXhlSlsdbIgl1JmOy1a5bTL3VhzATFYC?=
 =?us-ascii?Q?hcAiKer6GOKNJ80MicnZYCc9KaZvgzlIs0sZHr2CppHlRdoLhuiGLYGTHg76?=
 =?us-ascii?Q?679G0xAKmO2glVOzArzS98v2CNVGhW235FyoLg8oxQYPsfIQ2kLatfLR9CEe?=
 =?us-ascii?Q?JFz0W1eT1UopACuH3rrAr9Oz9NRPRhwoxk4FzEm7XEMB0DebZROp9mNW08Cj?=
 =?us-ascii?Q?y8eu1kPUwJsQEUe+PGXGjhd2orMgnkCrumEqOsxLHzsqw+Lwp6iQKisuHITM?=
 =?us-ascii?Q?CnxBxj0jAFUD5RB5Enkqxz7XLRtfy97ZmxQuVJo4ezBwLTvhyMPe0IiXd/Ne?=
 =?us-ascii?Q?qK7rrUzytawVE8C4vj9SUSfMSZjw5HenODOQ0zQfBUWKYkMzGImxQOR+OAaK?=
 =?us-ascii?Q?J7ILvXtn9Ysq4Ux48+3e1kGSJUfGerKioPqsU0uwBQan3gsuSlGuD44ymwUV?=
 =?us-ascii?Q?hMsOjIQK5DSFpFshRail+ANmbqOdCLvfOLhAlQ8nV4ynYCzFvNCUJIwmEVOL?=
 =?us-ascii?Q?jamikTVJ1Y4pIpYMKUTl1JhBGaFlFz2z9V5C6oAcOIZKjSXriTkHczlulA/A?=
 =?us-ascii?Q?7Q/W0A7FGojyq2L4Ofxkx0wScp/E3p5uHNqvVnUDq36egkLfkJOradxXmQch?=
 =?us-ascii?Q?bSAuDNN4TxdS4BjcaGnrj7WKlpAOlwji3F9wEuBzWv94nOanvvHBJTpK7Wl2?=
 =?us-ascii?Q?9ePbomNTFOuAM1EMGCRGIzXXuw/z1P0ndemVnCawHYJp6+Sz2ajqXyS3Nsad?=
 =?us-ascii?Q?iB3sqh4A8n6LjBJM+PFQbTBIDH1/aTpCI2VcmwM1uLRvANbFqReC+nAyQYkU?=
 =?us-ascii?Q?YebwK5uYfXLFrefjg2anLRsy4eMV7cK4mOuF9zuJmx9vnErtV8HnfX4ZDq+Z?=
 =?us-ascii?Q?74C4RDkTjQVnhd1NHJDBr1RuCvfrBI4D8DH0rhJyQbhf3WRKGzUwsDYf3ue4?=
 =?us-ascii?Q?Y2qYu5rKMUO9Bsg6/XZG1sxsQLUKsAg05V4yaKIau+7hR5TsUVi6fk4bJZFI?=
 =?us-ascii?Q?lGWX4On4QqSNiuVAb2CYx7nOj+2v6gtwBiSrXhvO3t1lGceTbvecif0dl/Sp?=
 =?us-ascii?Q?zZeWXUTjhGQKyVHkCh3g5o6CmbPsIqkHpvckgacsqSDicP7S10ujr2EhMrYn?=
 =?us-ascii?Q?QzFhhiteEfMcPelFcfOtJBk+9d3trIAyjtaEYwF7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd58845-104d-45ac-f3b2-08dd87cb6b7d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:43:11.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4aiE3rlJgs6nj/GI5Z9A6jVvylY9ItSzQP/vNCGDx3pHhjwhiE1d5vDVP7tOW00NOutWfJT4YU93nu3+LIJhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246

The ticket TKT0676370 shows the description of TX_VBOOST_LVL is wrong in
register PHY_CTRL3 bit[31:29].

  011: Corresponds to a launch amplitude of 1.12 V.
  010: Corresponds to a launch amplitude of 1.04 V.
  000: Corresponds to a launch amplitude of 0.88 V.

After updated:

  011: Corresponds to a launch amplitude of 0.844 V.
  100: Corresponds to a launch amplitude of 1.008 V.
  101: Corresponds to a launch amplitude of 1.156 V.

This will correct it accordingly.

Fixes: b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning properties")
Cc: stable@vger.kernel.org
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch, only fix wrong property
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index daee0c0fc915..c468207eb951 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -63,8 +63,7 @@ properties:
   fsl,phy-tx-vboost-level-microvolt:
     description:
       Adjust the boosted transmit launch pk-pk differential amplitude
-    minimum: 880
-    maximum: 1120
+    enum: [844, 1008, 1156]
 
   fsl,phy-comp-dis-tune-percent:
     description:
-- 
2.34.1

