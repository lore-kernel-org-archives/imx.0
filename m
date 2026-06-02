Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBD2C11E2
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395845; cv=fail; b=LSPAkt1FRhAiJJIDrYrJK4oVUACptv1yg82qzkwFAzwqrwjR4pK727X6VN3iqt+9S1o4CeZlW/9rzTzfN5dDy2EJrEowGhjgt7luma6BaviKob9eyeJ9DKAhmUi8fs/DlPqCWz4oExFvz9uEHULwqiLY7j/B+ercz1i/AIIpbpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395845; c=relaxed/simple;
	bh=SS2i6B0OC50uaTBkS5FKu4UHft7SP97ZpwjeuB+pUp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nw8o64vY4bTmTkqX2kHmK3mgUjEcaI376tlVBgTfZkrS79s0Eu6awEqpEmUwNSDPtuLprDEpxSBX5CYayCGrMGTqSFR5pIc5mtTj/OamQdtzM+N+Hu35XaaZBXoIh/8DI51r4DmDme2S9s/yJOCFnu0V7GSHOyImfIC1Dw+iJpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y4qNx2Ck; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y4qNx2Ck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5nVq6yOcx/Kg/x5Cl2mqq4vjhD51MCLzdILq7z8hUWWtULdXhytgwIso3Qi24i1T9XQ0sDfI5dPiXS6qdlcWUpL7fPyqjZwJ//6gLl4s5MjNrxjqevF/RETL9mnigfnm9/f/X1UBxB/dEHM+x0y3K5Y0/0ghxmcbilLy/9IXODdBEjlkiHVrPf45XRo1LQ1eK6pymCZCNonzDmp8tM9Fr4Pu/pBq4QXjKH4LfOelYIu+VvKqQM9l+Po0wLup4fwpxlDfA0SazQXqVitWUAyeNWy5+nf7DckChJADuPssVmaHcNbf1yn6L+H4Jlf4h5qrQeqhIIfCBbsebvx4zqCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCrZ9FT9Sao/v3inohY3E/Mt4/94SGvti/8TW/gd6RA=;
 b=hTeZQF5B0HEYL2mzAPXP95x9KV+6vMdgAaVXx0MOrFby/b8R2RJUSnhejBJmxhMfUSJ32i6SDiQZK3RhRs6fm14jc7gfYf4yGNEFwrkKN/7zYoXz3ap647roeehpJVdA3OYgOGElCMlFp0RHXaq71cgf1vPGOCGNS7yVWiREEZb7gYzhO6meDLIR87crTLZyiqqHPzSwndX0360c1vPJ7laHPP6Pqslbj5ddcOrWpFhgGpQjV+VrEajNrGvO/tvu7vYkrwQRTVwm3GtLbDDS54a9QtcjyXEPzwSJj0NFmhaTUiP9HxV23zmAVhSIaymyRtPbnOx7WzsG7Rr0nxomnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCrZ9FT9Sao/v3inohY3E/Mt4/94SGvti/8TW/gd6RA=;
 b=Y4qNx2Ck9QgqnyTPC0P+/o77YDesEAmIzn6TIgpIAb8vWa8lWgPH2iGnMwg65UnlQFLgrEWuGXUb2VBvYq1lH2yyW9yRRTFgE5YAne9i48NN/k15J4mU3dzZAeIdryWkqJNi+zjElZadP/XYcW4ozdMPaicDT6yBI+ZZtIBKx/iBJoOBoAOMj+Idmq0yul454V+oQu5wlxo+4OpgCCPweT9Y9KcGP1f5BduBS7WBit2bGuWTwU2fMjmau6qTfK7deJ9ebrffEzmlPEHDJt+7FjEAH2u25e5UT1y3qbREmEubnBQdlSuEh2/Kgp8TbwpbVR7aU0nVKV11Gyw/oJr0lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GV4PR04MB11849.eurprd04.prod.outlook.com (2603:10a6:150:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 10:23:54 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 10:23:54 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v4 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
Date: Tue,  2 Jun 2026 12:23:51 +0200
Message-Id: <20260602102351.3477106-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GV4PR04MB11849:EE_
X-MS-Office365-Filtering-Correlation-Id: deb8b2a0-86e1-41a5-f0cf-08dec0910c6c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
 OnpT9S9kfglqQLN/oKQiyt438m34/9l1mwmUR6cgAHq2ZuWW7b6A4O+BEPZg2pWuJFe/RW+Q4q6QxuYJvRQQrNpicngMxSP8fcOAvvDrLUYERzY1l7UHvxPioaIZvn5rtHZzdeOA0222A7pwVHZNKxSc7bu3a9KQJv+CNVuRfPUxZHRAVGLkrtlDJ6dGEmH8syW9kLOzwGhcC6Qp01gywk8lhzCCS8KrezsBrV/O//Xibl5N62Q6TC+4NoOPdeyzpIEc4e9LgBDKehsDbyQZ6QRLrLMzT+8sGMdl0Ei2Gg2iXW+9SVFxUmtYEjG/Um8z7mbhmhkjPcrUwB17PJ0AvUtO2WfeZHBcgucvp9OEaP2r/K0S8oG0tBX67Xm12ZTiE4BH2Ga0931Ll+lxf2aYah/6vgd+iXRyyZylPe4So5Bkj2QIT+uWWyvw8hl/bNR94+W8bjalgTdO8DiernZSNMFHhRsZAuuvb9ducVEgfIYteNd9i7y1glISRqOiWUs05rZfCldCi8VPr87ctyjuebocx9D5vUVBZ9CfoixO0hNCPLdJlhdXS36PjWx2zhFu55yxbvm3qc0ObMu7jV2K81zk3zDHYZG+LvQMD4rtBPipar55/yWPJdoyMIGwHPkl4HOOWy98Ihbvz4Iro+krzCSXY82+4g2GsFjWihuYxUAfwQ/opcsShZVPKH9cbwrq
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WGQyVjRXa041MHp3dEdJS3d1R1JZRnJSdkIwTGZ6RUNXRW81UjB2aGhsMzNR?=
 =?utf-8?B?eGFNZnEyZGJSRFFTdDMycDljcWlVQ2NqSi9HVHNxS2pRbmhDQURRVDhMUDhW?=
 =?utf-8?B?a2xLTGlmRWhQSlorUDZVdy9lSlcrbXZKSW4wcVlnSDU4cDVYUGQ2RGxBOXVt?=
 =?utf-8?B?TjlyT3ZMdFVkRzNJRU1IeDBsbVNlWTUwWUxVNEZLaW5HdmpMNlZHRWs0L05u?=
 =?utf-8?B?bWgwdzFIcm9nVnA3bjNYWEpLTWgwdFQ4L1dSRFhlSU0waEVPODhWQkMvTDA4?=
 =?utf-8?B?bUhFdWhtUy9jcS9DS3hHSUxHSDh1SllyR1RMejZzSkVzYTBXczdzVG5JSDlB?=
 =?utf-8?B?ZXFETjNXRGhNdXkySGtmcUhLUERSZ0llWjNLdmlrd3c0UHNzejZpQUx0aU9o?=
 =?utf-8?B?RG9rVGRqYWxUSDY5SzcrKy9GRHk1VGM5QWFTNTNlTEdKN0tXSVpCc1ZwYWhm?=
 =?utf-8?B?NldjT3htM2lKM0dNTUw4MEZoQ29lMUJScW5sbDE3UVh3VUNlNVZ6MVJiaHNu?=
 =?utf-8?B?dzgzSTJMLzRoL0ZHaUtUY1Nnc2ttQWNPbUp2QlNVMVY3Z1VWTDIwRnplallJ?=
 =?utf-8?B?QitNODhKTHZRZFhIWlEyUytkRkpoeFk0NVpmMDJZeUhrQWUybUIyb0tSekRw?=
 =?utf-8?B?MDdhcHlKQXV3MDVSL1U3ZkFSTjlqRnh5RXR4TmoyYzFwb0tjZnhUUGt2SzV4?=
 =?utf-8?B?bW5WdDlLaUozMHdvSFliZEdDemtYaUVmeWlDdHA5YzB2UmxMNXNvRUU2YS8v?=
 =?utf-8?B?a21CS2Z3K28xeCtNajM3dGRET2JPZ1hLcUUza0hEcTVRTUo0bGQraXNIc0VK?=
 =?utf-8?B?cW5tQkx3ZTA1YjA5bXVzOGtJdG1TT2I3MjBpU0x3OEYrdndGS3V0UUtiQ1dK?=
 =?utf-8?B?eTRuT2VpbFlsU2hKZWUvaFhhRlp0MTNvY0NiZFRTV2FKTGpwWTUzRVMyNHZa?=
 =?utf-8?B?WS9hNEhvOGZVUUZ3N0Nma3Q2VHROK3NraHVTYXNBV1g3VHViMFZTYW1icmMr?=
 =?utf-8?B?YmJzSnlpeGNDMGlTM29tU2pZRzVTK2s4V0R4Z3RSMnk2S1loRkFGTnd3ZFJr?=
 =?utf-8?B?Z2NQcGxTQStuV0g0Vis5R1d6dFpDZWExa0hxNGJQcURBazVvNyszcmZPMndt?=
 =?utf-8?B?UDZXQTVsSVBtdkw0eHBvQ1NLbmhIWTBsQjZrdWd1WGloYTFmU3RTTW45dHh1?=
 =?utf-8?B?bUdiY2ZxR1BVaDBMMmpBS0lITkNtVUwwZEMvY3lZVDl6UEx4aXZvOEtPNFYy?=
 =?utf-8?B?eU04M0FFbGtESTUrOFdMNnNnS1FvdHVwNUZvdUhORTVFL2RFQkl5emw3T3ZQ?=
 =?utf-8?B?dTB3eDRVUHNRSlp5SkFrQlc1akQ4ZTZjZ1B1cUtCN3J2cWdzT3FiSnlKbHho?=
 =?utf-8?B?dHRGb0xEbnFaeXpTRERKT3kyY09BVm1qQUJxYnlLL2x6eSs3cFlSS1g3QmhI?=
 =?utf-8?B?Mm81Um8rZXo4YWFNRXVOSDE4VXNtMkFuWkpHWkF6WkxVeXRxd2lmSXZrTEc4?=
 =?utf-8?B?bUR2LzA5WDNIMnNEQmppNnBNU0NNWFMwc0swQVVUck9lVkFERFRtL1BlcG96?=
 =?utf-8?B?L3VoZEIxQmFSOVJPa0xrYzNKZlBHakppVi90OEJ0ZnBWRXBOdTVURys5T0dS?=
 =?utf-8?B?ZFRNZTNFdFBBZDA2cEhvWnNOTkpvOHVkYTIyN1NOWG5uQ2lwWWJjeVhBWU1X?=
 =?utf-8?B?dUFaSFZNTFk0c0lOTUZxTUNCOUdBamVlWks2WVVwejA0NklZTzNXWDF2MlNS?=
 =?utf-8?B?eU9saHY4VEI3YnNxN0FqZjBWa1RlQ0tTUnFXYzRDZnhtY2EwckQvQWlPWXBs?=
 =?utf-8?B?N1pjdld5N2VuMTdPT3FRSEpOUkVjZWU0TUMwTFFNZks2MFhiejNBZitjL2pM?=
 =?utf-8?B?Z2FpYjFTLzliaDhLZkJpcHRWVW5CbndPQzJadjgwUHhabFgyOXF3bTZEK2Rq?=
 =?utf-8?B?bVo4VWZSc0NHMklSbFBlZGF0N2krZ0YwZ2tNNTFNSTVuNFZHSCtndzMrcEVK?=
 =?utf-8?B?aVlueE9oVnJrMW1XQ2RvT1lkZDFsaWxSbkVHTWRzblkvSlk4c0hFSEs2UXc1?=
 =?utf-8?B?NXRmN241WDNianZsUkJZUGZaMnBPc2FyWjZiKzcyWktVQzVxNDlGTUc3SFVO?=
 =?utf-8?B?SlljeU4vV1YzbHZNdklrYThQNzFOU0xvMEtCM2pJRnNiTlZudWdKdjBaM1ov?=
 =?utf-8?B?YWYwcjZNSUpzUFdTdHpUdUlhZFNnVXdQenBIelNGcGhqWVovaDRiQW5HeEVK?=
 =?utf-8?B?MnRNNStPZDY3WWs3VmFDYkFBaHNqUnJnOGw1WE9hTDAwdTRUK016QVBGRmtC?=
 =?utf-8?B?TjV5ZUpKWElmS0lNL0tvVlZmYkM5RDU2c1k0RU42b2U0VVVobGpqQWpQeVEz?=
 =?utf-8?Q?aiVV9A4Is5BPOb2uQPDWV4LvVAEqKCutIBVQs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb8b2a0-86e1-41a5-f0cf-08dec0910c6c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:23:54.6223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 028kZ8h2ozo3I37Nz41FLdhuaLzJDq4sq2Luy25q2xve3e9G+tyU3bmSb0u3GGt+PF+3JoZ5/fNwFhA+Ac/m7FgbRNSfZjGxU/9EehmpvspV0dbYOyS5/ShLPnnBTM/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11849

Add PWM0 and PWM1 for S32G2 and S32G3 SoCs

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 26 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 28 +++++++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index a1f33197b4b0..809019ea0e29 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -563,6 +563,19 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		adc0: adc@401f8000 {
 			compatible = "nxp,s32g2-sar-adc";
 			reg = <0x401f8000 0x1000>;
@@ -745,6 +758,19 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		adc1: adc@402e8000 {
 			compatible = "nxp,s32g2-sar-adc";
 			reg = <0x402e8000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6a1e0665d73e..22e80fc03f9c 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -626,6 +626,20 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		adc0: adc@401f8000 {
 			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
 			reg = <0x401f8000 0x1000>;
@@ -820,6 +834,20 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+				     "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		adc1: adc@402e8000 {
 			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
 			reg = <0x402e8000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..be7b645afa2d 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -245,6 +245,70 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	ftm0_pins: ftm0-pins {
+		ftm0-grp0 {
+			pinmux = <0x2912>;
+		};
+
+		ftm0-grp1 {
+			pinmux = <0x122>,
+				 <0xb42>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp2 {
+			pinmux = <0xb13>,
+				 <0xb53>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0-grp3 {
+			pinmux = <0x2904>;
+		};
+
+		ftm0-grp4 {
+			pinmux = <0x2925>;
+		};
+
+		ftm0-grp5 {
+			pinmux = <0x2936>;
+		};
+	};
+
+	ftm1_pins: ftm1-pins {
+		ftm1-grp0 {
+			pinmux = <0x1d3>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp1 {
+			pinmux = <0x29b4>;
+		};
+
+		ftm1-grp2 {
+			pinmux = <0x29c3>;
+		};
+
+		ftm1-grp3 {
+			pinmux = <0x1f4>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp4 {
+			pinmux = <0x202>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1-grp5 {
+			pinmux = <0x29d2>;
+		};
+	};
 };
 
 &can0 {
@@ -293,6 +357,18 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm0_pins>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm1_pins>;
+	status = "okay";
+};
+
 &spi1 {
 	pinctrl-0 = <&dspi1_pins>;
 	pinctrl-names = "default";
-- 
2.34.1

