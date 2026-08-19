Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AE29994B
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145344; cv=fail; b=uwcMpqNZwPmXnqGkbgEu8oTBnoqs50mBao7b1SElXrMLPqzQoq4dkwprP8pq24B5GoNbWxxRkNKTF5qlczSqIyCPOxqO0byUdbkZZh97jKSvR155I5jh503iPPUhNcLC+h2N+nw94PAmz6JNdcnb78BfuV2Q3hzegIUNuKe7Tog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145344; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B+IVVoLkU7po1ochAy5JJ59NlW3GvoQ5EcSlu+bRYlM0tr/2eeEox1zDuQyt5vsaA6EGAHyZqc1LOriCMhIMfXudMMjpd83478lhJU+QtWl5raTDOJYMXcyup7Z0GYejWgpisVTxz9K+HZA7Lsvc3uXHLAYNoKHFf2AjQrwSyyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lQ7QsQbp; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lQ7QsQbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI5BYupGn5vH8LKC8MyBDihhfVFERpycsyPvyyMEVgezOP31RGmgcYbPYb4ltHJiJXf0SrZ87JQwpIdL6/nXDSls63quRmId3e2M/nqc7Z0Egir9a061BT0obPJh+f4ukfOb5TJz7/tUUEHd5sE+yNdnjjl5MU9JMXomJ0ioPcXoTlL5SMqTPAZSEGAXljGr5m1HbZrFtFyCcZ4+Dt05tnFSyayViOd7VfkQXvWQhE22tXwgMEMgH+Jgv8l4VYntjSrdMM3nFRsvT29o3Wli41rDAig5+1rXbXLHDBJUlccow3nig3UVonlKe8sFGP2f0Qv7wczvl4YpJp0GXAQUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=NKtYyL+l4Y+7gbkam4nxuqUkZ/SXlyliRE1bOMRkx61MoWmuogbjCjY4Yvr/oMfJpAvk8xc+CiA1ErRO4DBjJ0TEAxGMcmoj1BEBrH8FtVhgvGmfAhFUuEN3NnNdmvHwTWTNRmWVar+KVsYLdSHCQvT5Th9rOHvxIFqYbp4y2gBzvWXp94Yu1IaQz6Mj2yX2/3MJ5c+/U0jjBhF255fAnBnG6vwzAxmYJ1YtDy1EU2U/oupndVafd5JQ+hFfk6bOB9Td6HXhBZW+ThfSopp942jYaGkE2uSjxunJaDKUhzbOPWwUiI2LG7E9Q8rnEjZsObgGIrlcXKwnPY/h1xghfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=lQ7QsQbpLFJQIsnUk/4TmW5nGTH9issazfMChH4IF0SwTMYztpyJImuat2GdsulllHqJf6onc1JTS7OBWB0F66xde6lHNILldkKVAKdRG2CVHMVJr6sHzfnx1uYl2YFdVq88WmgcWAdHzz5W+jZTvs8QcoopMT//mgLEctSP0crFoxXjmgNP7SzSGk4Qa0CusvmHarEBOxQKqPfOXd4nz74Fei3bTMEGLHVJjyx+GX6AEzipvqQfDDNXDsWpOPVTfPHUjkn+ykjI5vBaZobkqYrNBduK4ewUkjEmQxfY/m8Ayf9t7c8b2O7+8hjuRsbiOn1lXqkrXIMsK6MpvcV5jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV2PR04MB12086.eurprd04.prod.outlook.com (2603:10a6:150:301::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 13:15:36 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 13:15:36 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 20 Aug 2026 00:15:56 +0530
Subject: [PATCH v38 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-imx-se-if-v38-1-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
In-Reply-To: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787165160; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=cU9DOCoAHpclFvXNkT6RlkDDu0yRGdJDOXgGrSZC3SFXs834P3f+ufl5rDZQ5YCuExZ3chm8n
 ufkcSFEfOo9CHqi6OGWC0D28iHLftml1U8rnupsUc6+txSv8TAbLtZX
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV2PR04MB12086:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fe216f-ff22-42af-d825-08defdf3f4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|921020|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wqB/tGm4tpa3UpSadaxQnWPpyG4hWtJt4LFgdURKQtBvHh8SyYCI0MmuyvDab1DMYHYU/nbwZsqVkvyGGLfnxp1+TvBsuyFkrMGv96jInfcu+/1kl7oNy5SpjISOAIdZhEid5GpN5GeyCFfNs/yfxWdhMaVjck+sUYYuijCuqFzMRyAWPnxR7DNLWU5sf7xigvCnGShYlayA6jhhP/vhbWAO//ARKTf3oFLvU6D0oMxiaeBqEFLpffExG7k6Dsnpm2sTCKRu1/k2U4jOp+t8Pof+evUhBRIbhAcIHMRRHBeB8yCflUMl+DuikFUL/P0p/CyVcCdqSn5CUWMM9JKRBVUpjJ74jDTFYZHFP0fpfeiiw1R8Zenuo1u4W/qYlckBLy5AonVkWxR2wGB+siBfIemQzfLtlQze1OV+IJQYVchSQr0pX/AfUvn8kuHORGkIEkJ872Is0ntsMQz1bQOD05dP0PervZj5ZJq1sLFtTQk8YQbjZ4CuGAIFtd5WSmNWkB8czHaY32wI7RAlTIunR0klKsS48AWDaybG9WGKvhi/WGAVQG6uucEfz+5YMV70OL9R2rv6yWEyigW1OMo09bHq9R4gihXorXJCX4n3WSesGWiHCw8IXKM7nZAsaHAQxbDuoj66TQG9mX/bjCwY1gjwCkN04kJXRAmNZ2Q3Hc5AQ6S64JiaXs/Rcu3+xSsW8LIJNJmDhqxG1muOTfHxew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(921020)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNWbGpLWkx4cHFyVi9LV2hoSSs4RWhFaW4xUGpuN08ya2dMeG8xUnVqekYz?=
 =?utf-8?B?RUIzSnVpNDNiQXp2RTJjVzZqVGFiVktNS0RlSElmSnFFNU9aZmZtT3Q0aHd4?=
 =?utf-8?B?eHBhY3NLTHU3Y2hISkFNdk9yN3o1WEFIeWg5dmIramowSWhIY1lrZnZSZm9W?=
 =?utf-8?B?YnYwazhINkJweXJFcUg5dUtQR0tVMmM2SjBwYlJyK2hTMWVkbGhmVWg4cXU3?=
 =?utf-8?B?ZFNkcHNuZmh6UWgvck9ZZDJrL0I0UTR0b0NscXNQVUliRG0xVVZhTEVObUR3?=
 =?utf-8?B?Mm1naWJieSt1YlhpTjhZTUVkZUU2bGNHai9ndUVQUHpNNkxWTldFUHhrV1k5?=
 =?utf-8?B?OHNUS1FMaG9GL29WcnVML256N3RlNU5STGRmTGxITkUvQ1lKWm5pK0xVRlFh?=
 =?utf-8?B?TzdiRVhNNXJCQ2l0aytaRFRlSzM5RTUvdUl3M0RNMG5yZHc4S2JNUmdZN3Zh?=
 =?utf-8?B?Wi9GMmllYm8rZWZ0WmZGV1BPYUdsbDhBS0x1ZlV5WGQ1MG1VYWNhcXdYWEt0?=
 =?utf-8?B?UFpOczdXY09aZjBXYlpzc2NSUzZxRGwvU0N1bjBjMUIyelRWMkNmV216WlQ1?=
 =?utf-8?B?eTFybEhPNHZSZ3JHU2N6dzBaenpMVmZPdVFFK3VoUlljdkRCSEJqMHI3cGI2?=
 =?utf-8?B?NW5BcUk2ckM0ZnBUZGFlY1FvZitTMGhMb1U1V2tZc21xYnV3N3RoVTRURW01?=
 =?utf-8?B?Q0tCSnIxRUFOQkNmWU1VbEl5cUVCcllvR0g3dEZheHA3YkQxNTloNVY4UGdh?=
 =?utf-8?B?SXlaazlQYVpzZUZYUWVveVBzcnllV3J3ejNyODlpSW16aEVnTHRrZlZQZk5T?=
 =?utf-8?B?WjE5ZVorS0xhZ2k5eGhrQmxyWkpTSEQ3REdZdDdNcmFNN2tUNzZsaUk5cEtx?=
 =?utf-8?B?Ty8rQWd0NjZQUWZaR3E3eU5XYXQrMEtleWZCRy9ITjV3Qy9lNXFJUVJ5ajRy?=
 =?utf-8?B?UThlOWdNenN4QWJjM2RMN3Qwb0ZkT2lkQjZCMXRpNWwyS1lQYU5PQWhnUUJj?=
 =?utf-8?B?bHVNL05GSzUyZHFXemdKOEhtd3hDbUt0enNmMytqaHRRZ21wYXhOR2x1MXh5?=
 =?utf-8?B?b3czWDgxMkRVMGJWNHU0RThoaytZTFJzK1ZleW1Rb1ZvSndkdWxmZWpodXZC?=
 =?utf-8?B?bm5KYWFQbXliaE5jeGtZemtrSzhKODdHY0JFUEpFeUN1U013TENqK055eGVt?=
 =?utf-8?B?MHE4TndpT3puZjdLOUFJTXBVRk84SWNqRnMrV01CaSs4MHVNWlV2VzNiakUv?=
 =?utf-8?B?eVpMSklkVlFiYUtPejlEVmdqdFhrVFkrOC9Qd3A5RkZDVjRmUi8waCt6ZUZC?=
 =?utf-8?B?TXFqQmYxOFgvdktZeXdCcWhnV1ZkemNFc0hTRFU2dWh5MXJPUEpaVi9lNWoy?=
 =?utf-8?B?bHRLV2RPSHJSdkRBZXlVQk16Qm1PQlBPMzJzRWlYUWtxcmxKV1dKNnR3Uzlm?=
 =?utf-8?B?b01BdDZ2VDhjcGVWMEFTMnV3dnVVa1VPWUgwYkdSVmNWY0kxakdRYnIyMFRk?=
 =?utf-8?B?MlRHdFZHKzR2Mm1hSW5uNlN5OUZRM1V5d2xjazRtZW5HRjVya2JiVmlXVG5o?=
 =?utf-8?B?NlNoNlRVWGR5dER1dmxEditXYktYdmljMHFtU1IxVGVuaS9qTGhTMmRMRzE1?=
 =?utf-8?B?U05HZFJ1L3RudEVRNGdVUy9iOVN0VTFSR2JyOWI1MnhsYWltUnNDOElsN3Fx?=
 =?utf-8?B?UlRYZk5YWkNjVmc1UE84Z0ZBUFc0U1dROFBrb0JxaTFEQnFkd2JxdlBQZzBG?=
 =?utf-8?B?eEdZT3BiUjJ3cW1zTDUzZXhLeDg3clN2VHg0aEdIOXJodTk0UHJUV1lsamRr?=
 =?utf-8?B?WXhzKzR1VE9iaTcvTG5PL2pIY21sZi84ZVU5c0hQaXhScEJhdDg1Rk5rWDNj?=
 =?utf-8?B?YXZpV29PaTlMVElhbTRGTzZzU21vaEJkQnM0TFV5UkRhbTVCK2FsUzVDNjJP?=
 =?utf-8?B?UjNCS2pMd1FFd2h5bmxnSnExSTNaS0ZlYXR3UmM5YlZvT28vNDJUdGNtempI?=
 =?utf-8?B?QjFkcnF5d2VzSlltdGRHZGIxTTFJNXhzUEdJdTQvSmpSMHJWVjdGeXpvSE44?=
 =?utf-8?B?Uzd1R3RFRGJIcUZieTBsUC9IZHBTQmlsZnJxZ2NLZ0lqWHNmbTFzdkFuaGds?=
 =?utf-8?B?L00vV2hYamwzNHc5YWliSXl1eVdxZTFBdlQzcWF0RVE1K3JYUXZHRTltZEdJ?=
 =?utf-8?B?MGJWekxTYUZCNWFBTnRFM0JEK2E2VGg2aVhwOGFCVnhDUUgxZFdzbk8yUnF1?=
 =?utf-8?B?L0VJb3phZDZBdXlJYnNVU2VlZy8wWkZDaStEYXArT0NCdlFqZDBwdkRjNTVY?=
 =?utf-8?B?RkpSanhMQTV4aXFtZkY3RDgrSGpWVWlVd2d1bTRVclVlMjdLK29pRDdXeHhJ?=
 =?utf-8?Q?pWfOPOzCYKivo3jkSd8/cqOer/IAxO3xB8jAF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fe216f-ff22-42af-d825-08defdf3f4cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 13:15:36.1066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U42mmrJ7uCp6eptUuuX1IBvkNqyWIvRcJV3EaZI3KZeAXKWbh1KOuLp/Qx+LFXa8My2MVuKni0gpq/t4TYnem8+ROYKAwpxB4VpgkT8ZjSahIRbukPH8TbyaKcWFC1nT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12086

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

