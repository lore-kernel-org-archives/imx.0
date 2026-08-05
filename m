Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C933E6386
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916485; cv=fail; b=ZM/EO0Pa76s6EJ2h6hA7GQH9u6XgeU9JxUfEzIDxv4iVKjNqy/AcXLpFmduc9Wge6N/9UBVz/aif9O84InAGlqSwyjKPv1HqdQZhv7Ja/h3+gPsMLzKhSaRrABSVfEukujP/GBaUuAt9N9F8vWUxnqSd3SLvh+PCyOMgg04SOkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916485; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o0C8qvwac5/Gilye1ZxbbnILqQTOObadlJbmqFjFcfk7aUyKA2OkTL03Gv4ytgvGUSvtE5+/M9ynaChoWXsPC+x4TRx+PeNaUFDUw6//Tpv9DSIiETlIcQ+38OhkFWegmbcSZXSfrnLrmEGcmvtD9HtbUkhfdO51K/d6dubupmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fe1B6FH4; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fe1B6FH4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJIzzpvm8Y/Mt+KpSLg/UuBeka5Kx/UJYRXoXVcvkYnOpPd72plb1Llds8bZAGnqfV6fAhGkVBKemdBRYAOaAwwmQ5DrNN8umaY8pi65JHiO/4DSr2gEeZ30FT2N9rV3hopxzDPO5f04cf1hIKqrVhC1x4Wf7XvOoAdtUBOFUyJS+8SmgBwLHYx6MikbnXTJdIsyU3k40SwDFuFjPMzQkgwlEP2vttaI9EQzoOPjygOKzNMAwQemtomOAdewjIk2HKybZlnUP8LlRdEstygpoy4PusM/MGre6ekGfXenF3iczOLZbTT9QvHgVzIqDSHC9q0lo91rFudB4Ft6o9j5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=Icr3+1zBe9uKf40RsBtW83QjXajkaDbKJfWsF+hUK1KF9NLRzdJFGEPx5svpJW6xkGygqb8pqYzlddFG5/aGUdJ9zsVX3gnkPPSRs6FITRiwpo4QCH1Wmhqq7xlFcdLpSBf6e0B3Qj+3SQXTVNtaUgKgq+XKw6yALal54F4u1vBYqjgC/0lKdJSTJBmT/7bqHhih7RTWjusoozC+u5spNfOwi3AbteAUoj6u9pVKGmXV+ek9mfpcn0bO51BpsnYKidCy04cHt2UlFtT6AO4N2ikUv3Smo8nXT6oH/qmyMqrbIIwMFz2InN3FP1YLE3lKtiqt04KYlf9Ll1swulO94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=fe1B6FH4qpoLm/MR1etzZsdN7NQixkhhczsgsmihGXsF2rwqvPnL3/7WAuHOnpdDotn+uIMwVsnw0uZ5n3iCtC9bTkS7AuyZ72Nd7mVC8glEFHfAqxlNX6Tz2Gg07WWISiUShGy1vZ8uZDbYXCoU+gUt1KTg6DPqc+3JT5vJuVQbZ6jmIHkqTo9mJIZRz1QZHHjeDuX5ZEsvyHkdGNYkL9WQXy81oq05lEuXHPvrgVrzRkxd6t5uuctlUVsNSVv2Sf2VhApTitBGLBYiqYCr+aa1ld1iSyGs+8nQKHriGFuneSpc/inbbptnG+Ij9L4l/CfjKumOINVXovME7HJp1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:34 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:34 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:52 +0530
Subject: [PATCH v33 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-6-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=1532;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=MxIrMsX4qANJTeEf3wfkBhzPx1KhGBhZtY+ICEshrZirCRXq8YeOCRDQHZl71UxYTALM7k6J7
 vm37SD/K17YDB2ARVvNOnlQUBr4LXHSV5y+AlxCYqbhPOjrcX+2YBCe
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0266.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::14) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 2046dbe4-abdc-43bd-95a6-08def2c6c9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	nx84JVP8B3PSnFzhnt2PPbo8/nAyx8lR9SqDteLyrEegngm0jlxgJ00bT0FLzUwdxpmTLnS/apyeLMDgQfE8n66y+kNcccVjAxJQwXfmnXxqyb4Eup2uzHls3dO9ZCDRUeBOSKhdcdjOTtDos6PkQqcTBjMIA5q3RQKBo7tGp+a59ZwEn7FxaL9hZiNdRo1NA9Wf6JkQYT5URu+HpVRBlb1uKIBSVnHmQ8O1Bq/9VhT/FTlx9EQr2o39gezBiSapB7l7Diipi30+js79CYXIagh71SifpJqxuNPgzgoTLhGk3t289oh/XpONFIDnO1pu+Zx2RYsRYAp+QUrLVhWk6ki9Lvp6sojSvofikMKj1mMDXY+2g33TPMOpYMHXGsNQ+/7NAahGnnetdBE4cTOw646ZT1dsvpEQXB37Q4bdPISJYWYDhC6BfMDg4PqXptmfpAoSleNkS1bEoDzkEzJStLwHjh1WQmvczWiVNY6zoMhiluRDSZxQ2dnNErQNjkAArs/2QzHIm6BdaIxDjOWDHcamPYRWsMrBEd8XWyQ0Ux7C03QHAbU9BmK+HiwStLgLgKBeG7t1pHfnQqb8zQwsXHLxoLgL/Ro5guUDMhWPq3gElUGO/0s6XqxxjuFUMqXGeJsRTux5OM3knphOdsuvPlLxHtKrtGGF4PdA/8YcjTPbwBjezW2gvv2qhW5KVHL11veptmwLeXMGIssKaUiIAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTBTU0xFRDdPNVhuM1UxTWk5NEZvRjBQZ1h5NnM0NE0wVFhlWHY5dTFhcG4r?=
 =?utf-8?B?WkFIZHRnRW5CU2VKZVdvL3BFc2xjb3IzZTN4Z3J0YmZCdEkwYU9xQzZJM0k2?=
 =?utf-8?B?Mnc2b3loTWplbW1EakZWYXcxWGJzUEpKdzdRblByNVczVEZZT29xRnl0dDU4?=
 =?utf-8?B?SHJVbE45dlpYcUNlRnpBMmMzdllOYzZqN1dVNFdZSlcyUjU5ZDdvTk9LWFBa?=
 =?utf-8?B?OVZva0NFang2VUxGdDdrUmtUai9xU2lwYnQ5enRCRUZCOVp4MVhPcVJ5bVhS?=
 =?utf-8?B?RStlU2V6MVVXZ1gySXdUc0dURzRodENEZkQyeFV2TVVySndWYSt2SEVTaUdl?=
 =?utf-8?B?M0xMd2t6WlBmZ2toN25TOHRkUWZEY3cvc2VmeEFQUGhkM1pMYndZdk9pMEl2?=
 =?utf-8?B?c21IbWNnalliQlEzYnh3RDA1YkNWV1FlNnNDemVTVVRFQlZqYXEyY1lveC9Q?=
 =?utf-8?B?U0VnbE1UcTlYcUV1YVFhbmF2WW1mMTI3K3FUeWtCMzNhdEFsOStDUjZnNEEx?=
 =?utf-8?B?Q1FZVCs2Mjd2a3k3TW5DL243ZFMybnVPZk1USjJGMk5NbmFHdDZqZ2dWUk5O?=
 =?utf-8?B?VTEzR080eW9Qa3BZWSt5Q3g4aG0rVDJuOTA3enFwT3hacUJYZEQ5cE15d1pS?=
 =?utf-8?B?aURHelN1TVl2dlFQZG03Y1M4Zk5qdnU0Wm9haUtLb3prVE9FcEN5ZkVzM1pj?=
 =?utf-8?B?MVo3VDhnVmZIc2hjOERZNTF2VlV6NTlFcGhlQmJIYkhVSXc2TWZBQ25tZHNV?=
 =?utf-8?B?eFNkUnFCZGU5UkI1ckxCcUp1Q2xUZTNPOWtSM0RWb2xKaVFOeER6QjBrSmhZ?=
 =?utf-8?B?bXRIWTJEMWZNUURyUFdKZCtYTnBJZlVQelAremxwOElpcTloeC93YzdlWFpN?=
 =?utf-8?B?ZXhsVnQ3czlBUHFUb3hvYm5EdW1xS0FMbkJMRkJXdWNLUmFSUGNKMWgzR0ta?=
 =?utf-8?B?ZEs1QmVUZ09tREY4dFZXdG5kT0U0TnFlRmVzZC9KVkZ3QlRoamNlcHBLTExJ?=
 =?utf-8?B?dUNNS3A3Z3VpdUJGcWJrbUJYalFwdmFhK1diZUhCVEFBV0oxOHVaVjZ2Y2N5?=
 =?utf-8?B?b015cXcyM2FxeU5PWXd5azA2dXFOVVZFaStvc2pQWUFYbit6d3hXaTVVdTU4?=
 =?utf-8?B?S2NqOXRlTEkzS3FqV1daVEZaTG9mdFpVT2IvaURQZTc3enB3SDRnSHYvcnFG?=
 =?utf-8?B?T3JYaC9sZy9MZ1RDSUZVVDBYcVowQ3Zlb241K0VsVzc3V2JxT3AxdHJOaHRl?=
 =?utf-8?B?OGRpemgycXdwYUFsUHJkQzlGZFRuSjFnWVlubDZxdHlBanRZeVZmazgrODlv?=
 =?utf-8?B?Y2xxS3g4S1o5TnlweU1hRjE0NWNmeURCOENSa3F4eWRYUGp4UVNNeVNjSVZx?=
 =?utf-8?B?OS81Y0pvVWN2VU9RWSt1djBoOFZ3dTcycmF1VjZNYXYxRitQRGdnWUU1TGZi?=
 =?utf-8?B?Qm9aWXVMb1l6d0ZUUTJDaFBiSldCUGdoQVNwa1RIWVA5QytIUHUra2tPRkhG?=
 =?utf-8?B?bmdIclExd0VNbUEwRy9hTkorNFc1dFh0dXhMSHp0MFhIWXFUVlJqb291bkVy?=
 =?utf-8?B?cHAyNkNyZmR4YmM2L2dSTlo4RXdkZXBOc3orSjZwRU02UzkyRi8wT0UwQWM4?=
 =?utf-8?B?U1FaMC9kVHZ6L25mSjRoRHRFZ3RFd1Zvd1lIMEVwUzdDTjhpajdtR2RMOENx?=
 =?utf-8?B?Uy9jNzJMbFRTYmE2bmVxVFcwTDI5Q1NJVWdFTHA0Nnkrd3pDeFlTM2VXS3p0?=
 =?utf-8?B?dFdCODB5N1UwZ2FsQjhXWnZrRWVjS2VxK3NuNS9YbU82Unh6c2poRDEzbDNH?=
 =?utf-8?B?VnVjVi9CTXJOV3liSjVIQlhicVlMcUtNQm5vNTVSKy9wSnEvMUVGRjlwSXpi?=
 =?utf-8?B?aDE1bnRRVkhaNzBoWEJ1Qm5HaWt5TUZhbUY1Ymx4THY0WExyL0RlWnB6eXU0?=
 =?utf-8?B?OUVuMlZFSFNJTXV2VTA2cXpTVU1wakVvczZjQkpkMitFa2R4RTc2R1RxRzZO?=
 =?utf-8?B?N3ZPbXRQclEvQ01GTGd3VWxveUx5OTRNR1hKdjB6U21iazFVU05yT1lscytm?=
 =?utf-8?B?dTBwRTg4RUhaMHJLYytpQjZHL3BBMTU5TEQzeEpsYi8yaThvVDc4K3NhbThF?=
 =?utf-8?B?SXBGVjdNMmh0bkI2cldLazc1ZlNzSFRnNmFld0FoWE5wRkg2Vi9oQnFwcm1q?=
 =?utf-8?B?ZG4rMzJLeGUrN2VvRldjK2xrMVlRaGh1d3FHWkpUTWFzc3lraXNtV3N0a2Ju?=
 =?utf-8?B?MkRHemE4ZDJvTEFlZVVZVytsWUE1QW1zbVlGUEtFWG0wMkk3V0x6eHFNZEM1?=
 =?utf-8?B?Qm5IZDBQSG5vSUZBSFg4STJiWVpwcHlBYmhMNkdXRXhuUW4ySWlLSWljOFRD?=
 =?utf-8?Q?4EP1fFn9u/zmq6rM/nyju1T0z6duJCs/NHe41?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2046dbe4-abdc-43bd-95a6-08def2c6c9db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:34.0832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAvJtdraR1qASDFQdRVRPEOc15dwplqcbb8pbheCFZXBP44hNkPbc2Ct8rQ5xvIgyRkZ/FDriZrtb04ubjjG5ThOM4P7w78PBpmm12rX+d3BOocBylA2p2yZEMIT27zb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

