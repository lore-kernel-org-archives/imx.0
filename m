Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F62BE03C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288131; cv=fail; b=NCJ+CyTxz2hFuDr/NNMVZLuM/1zGaCEioCfsHDjJTuZWbogi8aH9hPf+3BSPRlup4XnfSmPdL6cgtaaYQSVIq6LHHTSbRda5Mtp01ned3+pa/QvKh8qIm8iPuiRNcldD2JOV4ez8dqMTM4JYkhbBBcgozaApUfkZVkjcZWTf6fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288131; c=relaxed/simple;
	bh=I3Cicd/Wu3EYj0MpC9MTeQzCyxQZcM3Is6uBmLyRoHQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NZbg9gOFQJm9Fh3Lfl2ptXuyKlvykWQhMezqmN/jU+xuCN7+wXS8MYdIrI9RtDLjW3VrAcf8ekhWO9AushEiMr6gWDf/OMBl4/cYjwY9elhlBs4WbBxuqHCwXB9/TBpEVYQ20HPChMywsff8aeisQyBPNdIgxlVEDP7jbyxdzYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QmSJq+fm; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QmSJq+fm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs9oxMNomOeO9IAKPyAwkYBol7HFQvqTd8COVbKq2RmYBbUJKGPeYj/C/f8SsytfQJ/KEErBLso/McN3PMmyjRX5ngmpI8bpXyyjbMislM/hphULeKo+rLhX6KF8id4j9FjvHlCLfb0tIrAXEKEBY2EbhyvdBYCMYsSBi7RUwaWv4XYElHfNCnBoBsxnSO9BpWfYhvqKpKsKhVXeBYC6/cEkWPae0KsmA6PFa38vpIidjGQwWTUSA27Zp1j4iR53l/jr1emVtCtSy6B4MM5fcMdNTktS8qyVwwTxeuDtt2SLuHt8GMtCOPBFDEvfIaKDVXpsBjhhSw9QVR5oYsRj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m5hqKtG0hUkB13PT8+rzdi2fo4uwQscmA4N5Axw8ko=;
 b=uBXS3lsiuachTiFG5HIziKj0VFqIVckRvOSRWALdK4Q6k2aNGq1+Kl51oTY/4PbL59pZhuJetX/XmXIlnJRZ8X8bXCexCaJoki3iEwphY0wInVspkFAVPgu3yhZUmlfsylijJkNQzNA0xAJXvGUsI02y0kAq0BP88XZZpxtW8u3p6CPC8+wxDdu4XIanSq0ZogYcdoJdBtCD19a6MwCtTl8fZB9FzfC9vCZ0bxEz1JRKsAcH7G0zNPsK2Y2i2lD/Z++2SlRmdwnefX3C4nG8FgU7WdYi+uhxAtV/J59OakOFaL+d7/i26xWuX6cmuiZzf4cDvnAYZlf7kw11nPAP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0m5hqKtG0hUkB13PT8+rzdi2fo4uwQscmA4N5Axw8ko=;
 b=QmSJq+fmmznQC226qHAUeBvJFeyA/B9mFyq1Obwbe1iu9mua/bQftfeJ1SN+m0XlxEy39bk3iiNz34rB+Da7i8K1eS10eOYDX/hv2JAYBSRouuF91Rg5PDWasbT6uySiICR92LiAwItGqnJZZNkqi2VpVnDpOgdueNxQiMB8RJQdyCbBTo0m1tjIDWP7ybztemwdscJ5nISbYWaJZbiMg5UZvNfAUDMRXFisxX4AGwXSZxsWjsLDXuAKLV1qmeaEHE5YPMLjbDxJRwAXDdarGyE/DOR/mbFuGNPV4lrF743cr4PHUtklzTbLOAgLS6/coyX2f69tFl/PbEHY86WsVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:37 +0800
Subject: [PATCH 2/7] arm64: dts: imx8qm-mek: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-2-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 164cddbe-f301-4906-f813-08deed0fce3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CWXdIyxZ12cZ9iZ+f2tb2T0KQuEDarMv8uLxCGdcevNPB5+olmLeyDD05/uKKnaH91Q4UMnYg9ZDFgeToXnqgRb/aK3seWJzlxvYRjoLg3KnhLfFLAIALM97Yu+ESjCb+U15umy+GLZxW65BZZ8U9LJMCXsT/ijNwv88IhDp/kkAc9VpbSfQNIg+Lzasu4ow/DXed+FvUT61WsN3soXyD972s3mDRztiiHnX8USJsy8uC945Qn1OYLbw7f9+Y/2XnYL6Z4NY6dA5SgEiSxQlCrAmjLqjfKDnaTnH4kJ2wLqUBur8dT63Ak9hMwLMPkwW6DixkYNXSiCpTpyqH2N/IvEUPX9Vj+QwCl70B0hbR3k/BO3zHsh0KwtuICQ4Aihs9ayocRAuvhg4NBahX4Kdm1kuHFCY7FP6aaYK0J9qOo2eEEnVNE9Awv2jiNHrWquj3oIpDPSv21rZJiP9lPXppTPQjhSDhAOsITHQKvI/4A43vL5B5wQezvhA0Jn1Y+WhlcUzUv/x/on276XzqP9qzFB+tTc8oyH8atNmJJP4RCdVukQ9KGPyQMo5dLFr9UgBHghK7Tls3gJq2C3nB8BCz9ByV/AUyYS+AO+Qrwm+zYN1eORYa2ACPHwf+os5VlwykkDUUpqbavy8P5LA7mzQ3FylUAhPyzmzAqCVeZpMR1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cSsraGlpK3JLd2NjVUlycFJaUmliUktOR0ZBbm9EbllndTJGYjBlUmNqQTFo?=
 =?utf-8?B?ZTZDWW02MW56dmxyTHo0UCtuZDI0NXhrcXBlQmM4dFpTcE1sTm1XZ3ZrRWp4?=
 =?utf-8?B?NCtubTliTHZ4ZmdaOHdmUGxwOVp6OVNrQnFsNHZuRGUrYzBhKzg1WDU2U3ZW?=
 =?utf-8?B?aXVkeUt2allxaDZPMGxrYm5UV1VtOXl6a0JqbzBMRm95SUJTNGJtYlFQYklK?=
 =?utf-8?B?dFJTZCszcS9xQzI5c1psT0JYQSthdk9BalZXM3ZjdWdVbm8vOC82R2FrdUhQ?=
 =?utf-8?B?aXBzMHVIcnZiYmpFLzFHdytoNHBUWnFmTktZQUNna0xEZ0s1QVlGQWdkYkI2?=
 =?utf-8?B?bnRLOVQ3Misra01oSmZtbzRxT21TQkdZVHRMc292WXE3NTZHS042TFRacHNs?=
 =?utf-8?B?TXRtTmNwNnZEbVFUQkg2Qi9DZGptVFRXS0JxNHZlZnVrNTU1MG9iaVc2WmRV?=
 =?utf-8?B?SVQwZThYTTQ5NnpHei84VThTd3F4c1BXQ1BCdmxITFhoWTlGbWhTNzNYQk15?=
 =?utf-8?B?d3pPUU9mKzlqb04xQTE4M25VaU1ZRVZ1RU5obHdpTmNaV0hkeTFFTUMzaE5E?=
 =?utf-8?B?SFYrWm0veG1KUUJUcnhKK2drN1Q2OHdEWUlVdm1nVHdLd1d3SWlOODJ5b2N3?=
 =?utf-8?B?SzhYZFR3bVFpblNqd2FmWXgvVk5BZ0FBdDUzTVJsYVBoSG1aeG1VQURjczZ2?=
 =?utf-8?B?MTlOdGVSTUdKR0xFU0E3c1U1eUc1ZWtUOVRLcEV4SDRCSFU3dk01VTJaUHpQ?=
 =?utf-8?B?a2JFQ2RiZFlxYUk2dVZUTTJhaWtvbEVvSi9XeEM3VlA0QmRCM1ArYmZLNExJ?=
 =?utf-8?B?V2M0SnB4ZTdLUjVhc0tkdmxxN08vaWEwS1VsQzJBcEMvZGU2ZUx4K09wMDUy?=
 =?utf-8?B?NnBWOG1aOE9MQWFySnMwSzVVQWNJTm1IdkpHeDljWTBQKzF0Q2Ixd2g4YjZ3?=
 =?utf-8?B?ZzdZN1hZczVVdVlxcWUxdFBVa0xkT25TaGRDbnI4RVZ0bmgyKzMvczJQVEpu?=
 =?utf-8?B?azgxU1hJM2tHRWRaaS90TWVtUGdsNWtISDVoWXpOM3lNcU9VRzN0Y2d2S2xo?=
 =?utf-8?B?Q1dHS3duNTdQa3NnWDhyNVd2a0UwMWZQWE5VZHFJWjUwZTJNUWZHaXpVdzZH?=
 =?utf-8?B?d2pDaFFzRHE4UkRRaytFQytLN3YvdzBzUHZhZTB1YnhCRnZoV0FQTjlsSTlz?=
 =?utf-8?B?T0dITVo5T2UrOTkwTW9tandvV0VVYzNuSTd5cmRvY2ZiV1BncnZKdk1SNDBy?=
 =?utf-8?B?ajZXSmdUWm9OWXZVaGhwc1NCNXZWdTEvWWQwaGc2UG1DTDdWNzRNYVZvbDRR?=
 =?utf-8?B?WERSSHc2dUM3cFYyNFVEMHozaXpLdUR1YklDUlJieVczcUpreUJUcWVGL3pF?=
 =?utf-8?B?U1U0Wm5NZUFIVzJmS2NMSk1oMG96cGsrUnpBM3NseUVuaWZqY0FMWU9JOTJK?=
 =?utf-8?B?bDhCVnFaU0hlSlloWnRodkxhS0huY0N6czVnclpVcjlnd2ZIMGh6WSs4dXNa?=
 =?utf-8?B?ZVp5Q0gyM3YreE5zZUZGdzhBV3JBS2Q5Ym1hSFRoQzdDdStFZ2dzb0ZGaHNp?=
 =?utf-8?B?V3JjemtzR3Uwcnh1VlJYQnprcmlhbEZSQ0c3Y2VLaUxmclhaenk3UGplWE9P?=
 =?utf-8?B?clNRMWlUR1F2dW5FWkI4bTA4blNzNTU0VithdGt5czNrYVlZWi9mR08wZUpl?=
 =?utf-8?B?M0NjVk5aVG9mbUpmQlZHY3UwNTAvVFBzTm1tUmJhcVZzUlc1NFpnNlpNdzh6?=
 =?utf-8?B?Wnl2Q1d3d1hXaHc5UkhEeW45eXVjOEJXdjNOeG9DT0xGczBnYkYyVnZ3OEpD?=
 =?utf-8?B?TFhtNmsxMVBva09DZ1JjanVIL21YUVN3bWFWa2xGMXJvS0g3NmtWTmVZMmpD?=
 =?utf-8?B?U2x4SHBoZnAvbUlsdGc1aFBxS2dmMGFnaEd4amg4UFFqdHZ3dk1ER2F0SUZt?=
 =?utf-8?B?enRTUFpxRXVpSkZBcTNCS012UnhhdUdSSDA3T0dnc2JybGpvRERtUy9JdE9p?=
 =?utf-8?B?YklqbXpwUWtaV1BCLzFPN0ErQm5TakdIK3pDSHJvRDhzQS9MMHo1SkRVQVBT?=
 =?utf-8?B?M0lWbEQ1U1ZJcUlUeEJuT1FwZ2E1K011ZEpyanVhUWx6aEZlanY3N2R6VTlv?=
 =?utf-8?B?b2NISjVHNlkzWDdoZGRybmh6SFYyOHRKa1VPLy8yMnVMbnpUdGxRNXVKeXdC?=
 =?utf-8?B?QnJpbFE5Nzd0NEZnd1FscnFQckthRFNNbGN0YTJ1NGw2aHAyV2w1QzdkYkdo?=
 =?utf-8?B?L0dQZ0x6ampPUXZDckQ1dWtOM1F4NmNKOVNSckMwZFdueTRIZ1YxekxhSWc2?=
 =?utf-8?B?MFZxZ0RJaEtRQ0J6UDBkdXpsMUlZVVBrKzZjVHArWmEzSkQ4MzVkQlVPR1Jz?=
 =?utf-8?Q?USokTC4vJuxgGytVhOMLITq8/C699milSOC5B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164cddbe-f301-4906-f813-08deed0fce3a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:07.5827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bMvKUk5uoElkZIddkSJ3vv8TKl3AH509o6WqMwSYG8Hfq2iwICh1KxH1VPiaRUSxu0j8MdZ0gHNsMHrEVARcdCzPdqxlh3F/94YfhIoab/8tzQ9s/iVItHzOq7a5jwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 52c9971edd4f ("arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 9e49ac377162b..50aa1e3419651 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -94,7 +94,7 @@ rsc_table1: memory@901ff000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
@@ -456,7 +456,7 @@ imx8qm-cm4-0 {
 		mboxes = <&lsio_mu5 0 1
 			  &lsio_mu5 1 1
 			  &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table0>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
 
@@ -471,7 +471,7 @@ imx8qm-cm4-1 {
 		mboxes = <&lsio_mu6 0 1
 			  &lsio_mu6 1 1
 			  &lsio_mu6 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev2vring0>, <&vdev2vring1>,
+		memory-region = <&vdev0buffer>, <&vdev2vring0>, <&vdev2vring1>,
 				<&vdev3vring0>, <&vdev3vring1>, <&rsc_table1>;
 		power-domains = <&pd IMX_SC_R_M4_1_PID0>, <&pd IMX_SC_R_M4_1_MU_1A>;
 

-- 
2.34.1

