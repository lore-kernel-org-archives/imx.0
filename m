Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E347140C
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317670; cv=fail; b=P31rlX9fRRCPlnja3p8qEsPq4DjpIy/m+5/CGcq35dhE6T51q9U+saT+U/vtiZAD3QoVaVc5qDxnS7jzp4doId7jeTkV5wd3ggJAr/D7vSaUd/jDD5Uu2ETacv8uAMzrsKxJQCy5fEL9WLcINqrQmwkrzM2R8eM9tUwu93UYCkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317670; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rRMzYRG2I9zj4lMII5cIbmDzTotk6NbPNiYqq3MR2xtukiGO8m6Bsj96H3Pt+ZbPNIiR9vZp2FQ+v6fAhpBQDu3QcN0UMEpbk5GMDI0n6wy0wyWJblIbb0G8emJclTZyhpiSAnut3PnIIEAeNpZhCA2usMuX0FBXbZwp0WC07fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GouM8MmB; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GouM8MmB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRlEM2gOKRcPeDPutZdst3WSEm2Ik0qLCVXwY67fO6WdQGjBWAOsGcgm4X8iA09xkNFqDqcns4zUVPDwQqD32vUoOahL44oq3WL35+Ip1nFg0CCXpOJ1L5oRein0FIPMoAK5JLMim7kTNtWZHj/gC9iF1CqoJqdrZ3vwFLwTocHAv03RMnwnUsdd/XswOwKQuC7+HggyLl3v7C9d7qR2AxpuqiifVDpIN6bLY814+Mf6v5pvTDabixWf5qTqg1wpexlldoNusIJeVb4DhKbuVDGBPSi2Ak91PMUNcFfd3kTja8S4JF1UoLHcIQHiTH0awhbZPRkHY5nNBmArlrLGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=uNQb1Zrm8/Vru5XpozHOr9rEwBfzi5I+vwDjWvacr+eWvhwb6DuDo59vaqXB5XzyxASTcwRnd65ImlXllHuCLOfK5CtQFzGBhZLmfJYzeS3c4e8nPCNSYQdbNv6STGCxmu/CE72Au165D1oNVRvVFexLaZsyy39f0D3xgDcfitCDZDtVg7m8pVG6v/bd13japsJV5lWgbW2SQbguHPBMDrzTyz/E9m1PCfe8R0+F2l4JvVAdj5v8EMC0AmE4e6NktBa3wZIjFK35TTMOsPdw/3+P0pf2jvhlQ38JYU9MJlo2Z19YwOexN2x3uNTrc6xmfVbqI7Hm+2ZlWjbwQsKqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=GouM8MmBU64fx3zg0rfhjlQl2StIS/x6NXKEVchA9idpWSjlm7fhX8p4kKkMvpGFVDLflY2GgArmxq1deRE5yuFAmksX7e9oZBsqsS9XCHg6mtKhTgBWR2MNWNKX+2TMATbHtqx1N35DseXQzbhUqdPaVJs7wdoTtlqJmxlJ6lh/JtBQxD6yj9tHrDNiKTPBTGlfiWIQ0z39ANSOhugWBOOs927O+PNUP6R0mheq3sByPVyNagZHc1iinym3OdRlHNk9fCsCPUiKv7jeKKb5C93SGJaf/a1hoIRP+69ivcgkRyt1Bum7WG8PHddOV0Sgz5Ix1TEmNckIx3rFOqth9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:07:45 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:07:45 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 22 Aug 2026 00:06:08 +0530
Subject: [PATCH v40 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-imx-se-if-v40-1-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
In-Reply-To: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787337485; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=vYGZASJaHxwCAg8fW8yphhc+GsmoczMiKjWdE7oo1GNrYoiQSUTeOHmec+G0Pm8Xpl3vCjCT1
 gmV1eDVsXm/C8RSv8bjxWEUfkz3jFd5PRVFRO4VpQkVXUSbG/sytKwY
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: 424949d6-2822-4b51-2df1-08deff8530e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	yVzXb4zHYNA+4awiNHJlyPci5iJ2s0RzgPh+BuiZo/KoZwkcXYzv2+8ZWMuUHFK+on8F9d4LgZjB3OZDW/apAAsIIh55TLRuI7z73bojDRlyoJUJ4r6uht3i2eFTMtDykHjiZgQKcsaXHTjVA6DppDqF99+V/2fzdnCARdNpjuKUxPEvGpbGvnB47D3c80r9dtb+FgXWaqzZP7mO2EH5wXDxIzF60N4VwMOf4Mbsi4+TgCYEXZLVZBZmCpN1vJBzBR8Y4k/FIjdJBn8SY/Df/g3tp21LG9YbMx2tEx4BLrVtm/UpI4V8CQUyVeQGhQUcl9uNfZtduhF8xrsLu8cF9ZxebLBjHj3IHcPaskKtCkAPStAum4EDu216DLBQuBQKLwZ5+d/3FNZ47xlV+urboY8YORO1V92QfXGeIMi42W4YHUdjm9CycRO3h5H8TdPwua6dEdOaflGMqfkCAEku8q7TMDe0tSIzwlqkbrRfk6IvvHCgmlespI9EGFQgQ3q+/x4G37yORKItG1HFyh1YVx/lUmMOFlsQHTnq+Mbf3sfD+XtKqwcIc10lwaTTH6kTbjo6IsY8lgsQd3npk1EFMDxZDVs/zDBonnH9eutIps0d10eHxGprkbs0+7z3Cgrf/RFUhQX0LsTzrJEfGFAFIl99R2bogb3jVTzF6c4G7/rL98gKelJ3Rb1nhoeRjTlWEjtW9BExYwHC/g93fJ46vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJraE95OUhWM0daUXpzN0NlSU1mU01TRlhjMTZEeWJvdndXLzdwdzkzNmZR?=
 =?utf-8?B?aTFreFlrTTU3Slg4N0FXLy9ueEVzV0pEd3RKRVBXWVJOenc1V0JGWktOZXZn?=
 =?utf-8?B?dy9HUkNZVHFPU1Jxa0locWRieXpFUmVMbHdCTElMQlZIM2xYaS9EaG9qNCtN?=
 =?utf-8?B?SWdwNUNVcW56eTJHT0VGK05xbmd6NThUc3JOK0dKMFg4d2p0enJkUGN3bEV4?=
 =?utf-8?B?SlZZbTZRR1pQSDNWOWtnbExyNGRpeDJraElwSXMrNm9nemFKS3RPNjgzV1lQ?=
 =?utf-8?B?STFZR2FnYTJmUEUrb3VtcVJTR3NaeUV2bVpjazFqQWNpUmNrMkM2OHRmWGJh?=
 =?utf-8?B?RkhNNDRzbVR6RzlyWEVXRUEyR2F0TVVYaFRnNkFweDBaR2lOdFRvYkw2LzlT?=
 =?utf-8?B?WFhtQzdEQnJVc21OOEFkN05ObEpXbjUvWlFJWURGYjVaQUlhc2QrTHJzVVVL?=
 =?utf-8?B?Vk9ZcUp3blFCOVBoZVdidkFtZjFiek9VajZMVzVVbzdTYngxMGdrS3RJWVNx?=
 =?utf-8?B?UXpZWmVCSm9WL2dhUUlFV3ozQjltVDFGT29qQlhueXdUcXdVZlI1bEtuUDhW?=
 =?utf-8?B?Yzltb0pqclhXSDRvcnR2ajl4TkNEMHh2STZnYkJCbUp6WXNia055cUNJWWNQ?=
 =?utf-8?B?d2JVWE9QVlljbEJDUlJJNklUT0d6UkEzdmZHb05GcDJCOVRmS0hjTVAwMkNI?=
 =?utf-8?B?N3V5U21HU0JLRHQ5YkdvRUplZEpOckNnZTgvWkxoYnpZTXM4UnEvWEluaS82?=
 =?utf-8?B?ZzZtRk5hbUJGcDBNcDBrci85M2JEMmwzWFI0cGpteExJQkptc2NQdHBNN012?=
 =?utf-8?B?cWNRazRDcjFTSzNWSFhZa3dPMktQUU1mRGZqSlpnbGVacUhGOUtEWjRERnk4?=
 =?utf-8?B?dTBhZGZoTmVNaXZWaTBCV0pKK2duSEs1NlNVL0lsZ0dmTG9yc296MEF1V2xv?=
 =?utf-8?B?dDJlbHJwaFh0SGs1bmpXbi9ubW5KSms0V1pBZHBUUVhxaTRBUkpINUFtOW50?=
 =?utf-8?B?RHhPamdsNlV6Qm8xZmdwR1R5ZC9oVkRBa21JM241V3dUellUU0E1NnJ1aGhM?=
 =?utf-8?B?L2tIU2VrZERodUlhWE5qbjZTNjdvM2xKR3A2RGpzbWdkVkc0Z1g4ZzFvQ1JK?=
 =?utf-8?B?aFpVMkw2aFBtRmpCTlA2UnJKUHZtTTVWYktmcGRTSEpCNkNnVnlKTXMwRUUz?=
 =?utf-8?B?enVyTHQ5LzBMeVdDdlBNd0QvYVRPVlpHYStHUFMvRXBua01oWU1PZFRIN0FK?=
 =?utf-8?B?eWFlT3NyRXpkRXcxTFlKZ25VdjQyOGRManJzVTFoYTRMVkRsUWdWRy9sZDFN?=
 =?utf-8?B?Y3pLSEFTNk00TmlXeW9KemxKTURiNzJ0bzVjeEp1YkwyeWRiSlBLb0JmUmZr?=
 =?utf-8?B?Skl2ditzOE5EL0FQWkVneHNxdHgveTVZeHZWRkdrbEFlcmRRSXZGYjlwSjF1?=
 =?utf-8?B?c2xrc2g3cVpDdnpKOGI5VmxidlFIdm5ENFBYZ0dhMmRlTG9jc05STDRwNUVk?=
 =?utf-8?B?TXFycjI5ZGhYdmJvOEVSZDdaOHlGOEQ5WmZBemhKS1BvNW0ybnRqREhrcWtQ?=
 =?utf-8?B?amlNREM4ZVFSUTlSUWw1V2RVN3JFR0Z4Y1VMNVhvaXFwemE2U3BYMjFSelEr?=
 =?utf-8?B?RHlsa2JKbkt5NFVSVTZCU0pZR3Nmb1lGQ2FRbHJTOXJLdzhLbnVMVHdWM3J0?=
 =?utf-8?B?SlV5Q2ptRGJpOFYyN0hXdFdKZmM4MzlROWdLWnRiUlJ6L25SRkFNbjZtK3Fi?=
 =?utf-8?B?Tm93aEFCQTFvcW5zOEZJNHRRdmxWcm5LcWhTYi8rWm1tekdHbXA3dGlHQTEr?=
 =?utf-8?B?ZlErUXAzNHdVR0pmb2x3YXoydUxKVFhoT1VHU2FBeUJtN3F6c3hjcXRVRmZt?=
 =?utf-8?B?QjRDcTRIclRhWFAvRUovOGNEMXNjMCtSSXdQc0E1bWVBelR3czc5YjRVOWEx?=
 =?utf-8?B?OEluREpBTnNtejIrN1pjeDJZQ0dQWUZRdnVHL3NBRGVCN3pqckJPdEdUUGJJ?=
 =?utf-8?B?SFJmZktsVVNMK3ZIcHZtaWxFRFE0azhKRC9ZMlRydGdGcUdCTFBTSFQ2K2lX?=
 =?utf-8?B?akRxcmdweHBxYkQ0NzRLVDJOM1J0S1h6ckZNeEtzOExqaDRqakJkbTg1L1BD?=
 =?utf-8?B?dVNlUDFyTDZJM25jSUlyUlRhZnQ5Y0QxTU8wUkNaWWo3L0xyVExkU0h5OGhL?=
 =?utf-8?B?SjVheTFBNE5ZOCtzOVJxbXowejFNTmxURjZDQVBFOCtHd3hWM004YUZ2NkhL?=
 =?utf-8?B?TFdmN3pzQm9MY0xjWVlWMXRqWWVqODNLVEpDaGxCZUlBK0N6dzFlbTYrTEFx?=
 =?utf-8?B?VWUrRnNSMGRhZjk1V2FCeVdvck1keGdST1p0ZDlzNWM5cFJ6SUw1REphN29C?=
 =?utf-8?Q?eXXVRVGwyOLfEOoamxqNVoBtsCAc2XS8S+1F3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424949d6-2822-4b51-2df1-08deff8530e4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:07:45.0597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx1JV4N+kqxndY/+0G09ZPap6OX9N++rvt4xMJZnxvEw+3zBjPL3W4HI7iBrSSd8H9sTVX/wI95QeEVEtOcdkDk5qoEFcrsZs4ccSjyiRGGWGQ0Y9hE+jTBTgINPF1Zr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951

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

