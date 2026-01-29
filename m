Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425F37B41A
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673767; cv=fail; b=eEu2q4bODXthAj0fvRMmw7tk3VT1hYGhWsAoBdRzco0J1D3fXxGUk5NqSIr/U9Uon3aUgMQoHVm1H1ANEt15bavEVsO+RjKi3VyOUxPLBMId7Uqq+VDqvCGOCm5q6mTeeYhMRWQWel00WBturqIbu9+9TD0MyL7/V4nas2TFW8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673767; c=relaxed/simple;
	bh=Derd2n9dDAso6vgE6+f21fadIW3lN7N83AVVRS8NQbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NvDJ6IfKHDQteYiJBJ+j7Tq871TJmIrpDHRipKXJQyQJfPSP/9FaWcM33WLDMPzbov8gYm3mXgjglxGDI+vGYi8y5/bMGiwwqpM/X+4kadVycXUKQFSQNPwKJEnrCulJI4BrGdKn89SU+6Pz7PBmJosjQoZjYnAkeieRQ07x+sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=btlFuUBt; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="btlFuUBt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaholyBqRYNy2p3+kk/VWqC5mGgJHlw9RnRYXGzn26x3wV84Nl+wQwSEnQkXU+LZlDp/MzJ0dIYEcofN0wzb4/uSp7JYc3ip5c/kA+NFtXQJ8U+6M08z2uJCwQICtn9YEAoZwzA2WpsXAgCu28xKm+9pvPZ1DegfhkB3FC4QZ7oMRtHjMy0Or6dwAQlcJPIWe/hvYeOVfs/ty3CEBA/mOWweRdfUVktGvqmiRGZCtxG7Dv2E1xwGNX2RX9xL/3WJiSGsdrl5C2jJABCN9U7YNtB09gpOLheWz1Q3Ky0zD4mmKj/NUemuEc+FTlG78ACodb9IhAEKcQpugY30OhIylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlBGO0K8NMC7KP0Me8ayf3NaAIddpV3EWhcKzrHFsfc=;
 b=W+vg20k2gQf9i9d4Pp1ZC5jgR7aPxy0foL/6KJJWrJAjvm1J/hOKDQU9/srwF1PzbHGzfP8yVP/hN+YahvJgxD3cAskSgte4PEhvlFU84EiKRAqGSZnSGbW17UVvpjLmFR4qFBJHz7KmEhDRGgLI+zY2zWVD24Y6AdIltWECgFasck4ygIOpR4jVvMw5daB0lz8lMYDHLKxHl5LNfM2sLvqhnW/ij/0EXelKMU0zVOUKETKLc4dFyF6/o2u8s4VU+F2IgEZxRyGrJVLRa7m/Hzzzjd7vnoyHChr0wfaBF4fpm7kcGF5PdzGUUtMiNbPbXHarBp+kcRaPTc/eF9dn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlBGO0K8NMC7KP0Me8ayf3NaAIddpV3EWhcKzrHFsfc=;
 b=btlFuUBt07oqN/vYfafpT7GDwjsi2hd8z8cfJkgQydAe4ZW2y6cB2vfE2TSdOEjN8ox/k8OHy5iS54OhqAaOwbLwifBqKDjR/QqqizsxY2AZYxCEjPnYr2VAu1B6jDw2TXp/lo4+q14si3hnVGgCihMyAGgcvBK5pxQ/drO8jEC1bdZhb2TtQMfA+L7out4ChqgV8aDUVOGt8QJUhotf9Gz+ZtUTRANA9HWCUGM96AsexIPCc2rA+7PfWSwDQRldMbXIfYKWpqvBU9IG9QW9Sapu+7UdVuHvLK5qxa3Wp6oHJNX1KEI5dx96BPy05337YfcuCEHmdRwI/4grl6YZxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by DB9PR04MB11693.eurprd04.prod.outlook.com (2603:10a6:10:60b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:02:43 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Thu, 29 Jan 2026
 08:02:43 +0000
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
Subject: [PATCH v2 2/3] arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and SD
Date: Thu, 29 Jan 2026 16:04:38 +0800
Message-Id: <20260129080439.2910727-2-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
References: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::11) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|DB9PR04MB11693:EE_
X-MS-Office365-Filtering-Correlation-Id: 976aa957-5a66-4007-a2bc-08de5f0cc7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l21BDNDfaZaj7IMwD5DDg6KG7GSvWgu+j32lNUAeRc53s9jzuLuaZhQnEYFt?=
 =?us-ascii?Q?HS+HHCBAlvw5lmiw4WON9SWopxtmgJc20j/8L7zHkWkr04+1KWjaDO7pVbRX?=
 =?us-ascii?Q?M1SMw0tObaXTVy35W61jMQqgequ/qZu+UH8eMRNkkhZddbwRP4Ek4BnpWRfY?=
 =?us-ascii?Q?X4l65Ncvez/HWOqbi4P0m07/dIRK8pYOyNFkgIKq4waNy0Ixj6vd84LziRB7?=
 =?us-ascii?Q?QXHNCJI59mwilb+vMdGqdX2cypxt2UMVJFXLQvQKoixUNtCr+eWjMhbiScwV?=
 =?us-ascii?Q?FwvKxl765N/enJlxsRlernRbb6WjsM3AlYEFjuUK39m6SX9aw+v6z/fcvV7x?=
 =?us-ascii?Q?MnSaI8D3dloRWvg58UimJWZGuw6Po8yIwGgrdKWehkkg2zFI5cw+8Cop5oT6?=
 =?us-ascii?Q?IvCey3XwB5J8vAiJl6VgmrDUJCZwQJLV6ngeZCRvF06jhpq5up+CZ2kgh0b/?=
 =?us-ascii?Q?lTDvmqGIK/HXC8kUNI2Xbhy0We0YuJNVh7iUamDpD5e/9VaVxwJ1JDrmNdWC?=
 =?us-ascii?Q?BGlkhV/v+TiY3N1lRCmzgwmRSgoj5x+sGB+Aw5pRf/IiGxPRPgAcppfVNoPF?=
 =?us-ascii?Q?bbnY2wsIhH1C+HPm28RCk8BsJTyUNHqENm7+OWsphGHiH6tZ0Ewdl+wvBzLC?=
 =?us-ascii?Q?pT1dxgYT1mux5WSqNRsYqZbuAXqt1tAFDbGJFTfylilCs5vEDH2QaggVMyU5?=
 =?us-ascii?Q?pnxvddCGjRguFfD0+N6SAY/WB2+S0IPqlcLg0fPIZnj4odZZRppO6+6BW57T?=
 =?us-ascii?Q?J8fFK+hfPDvNam4BTvUE03Fkdzq7TUt12UkH8oxeC3zk5dV/SScGRtkI1n56?=
 =?us-ascii?Q?0tcXWhiLob7d2AZFTR5hEl0tL7VcQInHKqI58jVy7Xp6TDpy2IxF2hZrUIsS?=
 =?us-ascii?Q?i2JF451PLjvTZLnRMrs/Y3wbSU7PD8wBtM6+9GQqYHiDftp36BEMcEi5YqZZ?=
 =?us-ascii?Q?wzjvvqnhV9sJtmDv6jcHl3eEeT6FrE5mrrKtm76RbJCTGNRDhxwFwR6OXo8L?=
 =?us-ascii?Q?aYn1/9hu5pPtehobzUMnpjvidEJ9q0YBUK+Mv3h7lzmQ1Mr1xry02SkY1BCQ?=
 =?us-ascii?Q?9H941M3wSASaEnZTaybn6uljMZmJZJ/pw+iyrMEjfrJQY0iNGfLnmgddipwk?=
 =?us-ascii?Q?X2jZ99Xc8kEsRdsJFW6zX/Mmh+cAFhHobHOQJcHF/y/s1X8QJBodZaYaC5LV?=
 =?us-ascii?Q?z66YL2txAGvOhD16e0c/qzPzEw1vg8gHQH7MZfS/FWLkrRH86WB1wH7y31Zq?=
 =?us-ascii?Q?ppV1QQMyHk7I8PX3CDqc9fUJS4nEz01B26TOTuttJJQdE+nerv1FC/9gP/i/?=
 =?us-ascii?Q?7RsDG5CJm71yuUMQvt9CncH87T7mwAcF/PYfnSLA1ptu8DvEz5CUY+ZH35iW?=
 =?us-ascii?Q?AomzkoT+CSj16vvXK6+HbX27UiWl4o4ZtpggTAzdrKwYrdl8izZCEwP8ATTB?=
 =?us-ascii?Q?qHLeOGDv8DxCTBafO2oYkRpy51DmkbVUpiP3a3MVsSYZvfg63YyuY08tVNyi?=
 =?us-ascii?Q?5qtG+9mRcWogqJlEv6tSlF+P2ITfxoY0zX61yrE+SK2A5SUf2CH/Zp+Z2NAr?=
 =?us-ascii?Q?/TEnVZwk95ufg9CfzJ7EpBLzvrBBrmEhrqQmAovfBtju98uJic9Qu4w9r+wI?=
 =?us-ascii?Q?Tj3Znf+1iP/rvOhQFB8x+fM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lHduWLKJe8RLYEQpXNDlSqSpUML5nrCv33aygUgvIYaeT7wMj9OS3kYyr30L?=
 =?us-ascii?Q?dnvIqWPBkX7wn22v/1lI1Q0U6vEZTemXWrwDmq+lpAHx1kVzt/CLpo+2UFly?=
 =?us-ascii?Q?fDZ1BlPhSpcw0VhC17hgryoC9vRs+BQdj2zcec6/PSHqpx4j5i1TaXfqUOea?=
 =?us-ascii?Q?RTMmlngv/47pln/PViGoxkY+hWNLUa0QXIATBRjWN2MmiJQ6RziMisHIvvIQ?=
 =?us-ascii?Q?SBpRZJxTjB14t/mPIrnTvSOp16EGnoEm98zIKR3wxoPV3gQf8c3nWtYcJ9Kp?=
 =?us-ascii?Q?aL0NZWR6W5yQDjz1E2+dl+x/hpaAIFfEdE3ZmZmlQbfkIAzvqzMwQWeG3U5Z?=
 =?us-ascii?Q?rsk0sPGggM6CUvBBCGgwDt6eQxU2GndlG4UPAV8YAlYHjWJmHkiCipazgcDI?=
 =?us-ascii?Q?M+V44gTqrlLcwrFr1flfdDZClG4v64iwnTH4KunCO9MGK9pEWTRULZviveMw?=
 =?us-ascii?Q?eSs2fxUUd1Bxb57Qx0c2gt+2D1sB24/AQmEXqFm1oIgbul9Bk1ie/WjSEzTN?=
 =?us-ascii?Q?xkKOapzYL3iiTT//oitoVi7NtwBJX6AJYUGAmWR5r2wcID0cI4d2V1m8frVa?=
 =?us-ascii?Q?ExypXPRbqsr3loVtC4p8aMflOOXdte2rGkyPEdI+RT9q9syympvNK8aWxigb?=
 =?us-ascii?Q?Qr24sifcg4aHhg/K5N9243U3AMVA3Jf/AZ0EOZjhUmrzZyYD1ESJU+RsVh+W?=
 =?us-ascii?Q?fmjfnh4qxsZ6Rgexzh+VOnAvNlUeSO3YONs268SEsabtUBXRtC6VdNYVNPyU?=
 =?us-ascii?Q?y4QeERPfJzIXRu6viULTVtfjDa7kpihSrdc76+TyJg8DtYSHEeXlGHlPsxTs?=
 =?us-ascii?Q?27BkMOaznZsaWxOqKasW59lRXIlVDXMLQ0SP18P20q2e3ipOvnspL/l/i9lW?=
 =?us-ascii?Q?RQZnUo6mt769rfPAZgdk1EyEamNNvskPgzFcL86t+gDM7VdXqdXqLYBVzbOg?=
 =?us-ascii?Q?oqZh7KwwsffxeM0zvSYIlZjNJeor95iS/Qoe/sI9p9NwqUcJAap8UZZ4mmEr?=
 =?us-ascii?Q?0jdQhYR+8jWJkS3zQdkretDSqtGckEaSx0FR63IKgz3zA6A7maOv3uxgA/qO?=
 =?us-ascii?Q?fN1PcJggZvTT/rVC8sIBGVTA2hCVKVG6VRjeA2S2jDecdfT01xYq/HVJGn+6?=
 =?us-ascii?Q?56DdMn/TuPAwBW9fZRD1lOg3mCuGiqeHUkEa6j/A2GsX1Xcez/LIxinHIPbM?=
 =?us-ascii?Q?6aHXaAQYIGM+ieJPmJSDSboTrUJoiIlFjJ6PzsGZusZBhhQwrmV1Z53Kzucj?=
 =?us-ascii?Q?ueT7sz54oMzuvEtSh4ME0SOLcutOlZxwNduNuoR0Hf9QyetySMImv88Zvq7m?=
 =?us-ascii?Q?/BsPFoUtYBMqZ7UYcXroovJVdqgmRHu6Bqc0Yr2xiwJKWCOHSIzr0GaGO/Iv?=
 =?us-ascii?Q?XKiyxGnATkMvv33u/O6BQXBf/GBFJAsUY9gdlCY+xrPh168QtmvNfusXcX3i?=
 =?us-ascii?Q?gOciQpcwJnE+vVJzqLxuBFasSMx5fyWq/hvO2qTnSg0o/UihyxqnW1bGkBsA?=
 =?us-ascii?Q?U4VpuuWtyJTvVQBKfogV+TEsIh+uns81VP6MrnvjjU2y9Rir9aQ8VcJP2TnA?=
 =?us-ascii?Q?ZOVVN425a+d12YZSpEGRVO1SxjRShYNkuRT5xetCJZI6oNAX04c5atg5yC4j?=
 =?us-ascii?Q?fhCHAf6s2QJ8t3+UCHRc1UuHRiipzQ4g7YLbITRZKp6sy/PRTWXcgqWd1d82?=
 =?us-ascii?Q?7cOvFA8tbD1B552TgzStM5o5isOBD62J/OWWY08mS8xvsGzLh35/QR44DmNX?=
 =?us-ascii?Q?Id3ptC2pYA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976aa957-5a66-4007-a2bc-08de5f0cc7cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:02:43.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O878NugrAFEwqll9gOTMkoXd2+IXrf1YoP0TTmIPUArobmzcbE878GOJpcetbyTWpFGdNKS7vLgD6NEHxqgmMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693

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

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index b94a24193e19..6da2d25acbd0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -632,6 +632,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -644,6 +645,7 @@ &usdhc2 {
 	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
+	fsl,tuning-step = <1>;
 	status = "okay";
 	no-mmc;
 };
-- 
2.34.1

