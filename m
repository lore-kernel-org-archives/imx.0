Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3DE3A8759
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562202; cv=fail; b=PvXMAo+RiN1ObFmFxPgRsQ3GaXiieO2urJlFhZrJa2R8g+S8slt/GNSiDSRR0nfVhpdWZW5EIwbzMmpTC1JXejAwUHhIyozn488kj0JG34yEh5nDyIPDp3WFLaFlpDIb2wBdG54HAKWzUAXhKH+IXdB2HcXfayCbCSsj+uw2xD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562202; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TZJqzAiJ0V9kw5LqHzhdcsixqLpV7cUmc5DpHLRpze6HJR4O/fQ+jwREWl90iXy0XdLrOexNJVoLqyg+brQxogkkTzJwLo5jEs5avZRCtHTBzvPpJVpwuvHOur1wpHz/hcxAeoSZ6Zl6bXhJCekR4dLPsQKQlvNiypscoVwGmUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e5LAE4+d; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e5LAE4+d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXnqMsS6hxD40VuoUZ0AFByZpHutzUNsxG1pAOf+lQmIj6OA+fyktEaTd3ajfngA55q2GMy5jMYUV0JcxdnR7P5WVi/t8L7Ia9SdFSyNuObRqWmrDC3Ta3hqI8yXxew7C2AXByYy9KowjhS47GxH6meRBN3PIFxTX1fXWxnbnnA+qCV1ZdN7V0QRXmVuJTz3syVigfeUhHpzRRLeP2EGj1vfn4UYxyKwuIzfan6wy2Or4nCQDYfu66YYj7Kf+R14KGoz6EK2R9jB9eBx6gfNSAdQjNxJpT/ND6/5gm1r8aqJqb4kNqEFaDdjOxFXqwSCyhkFIuyJKR+AzLr3Z8e7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=qle4ya1BXk5X6l+B4ddj84GThHnWsKz4V+OvAtN8StRxuIeKKPToYe7z8spKFAheR3PKymWp9am0CtCQFkE2xvxxc+o5rWTR7JDonvYZ97Z8iK9XX66+d0fuji7VFEzSy6+RBuRE54h85hBi42tW/5iLc3ApYidLUWw94C+M9qALG7KGhkSDaAvPb9f+YYXOZT/aN08J0afaH4noGfzrX9gH9jRohARXbRmGjfxnsgwNuQw2WxRPuAO4B+men3fmncFz6VcMMlLoRVnmn3Y1SklgjOsaN90RYmulvC4qqFJIiq9DNiqbISMIj3YAJ9PmozsgZ11A6H2PfreRxUD1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=e5LAE4+dBVqbILvVA/Mq1ySqTKY4KViCR15KXW8L96nNzZw4ZOi/Z3yyMD76EfLrQLCJdH81Bz19UNcLtaLw/mJhxznHSVzvxyH0k6KaBQ4PEwF+fMBRnRwl8dh5SdSeV0+j8nRYoLPdvAKZaxA1jeCnJiO2SEQaP3CO2IZNRzTgOJIv5UUpFfE+C7tRwHb2KV5yFMO5eFn0DPEwpR/sCLqrmsvFIi+U/o68bUFwPqS6KdoahH/VKExgBY/cIi8QFHLcH9KBcvDVSk+VmZayNgjkfE4iQCc/5ky0YpPKR/s/aUQtk7Jy8xyYRKLklnu75kTAPD6kDF4HSFC1FFYJmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:03:14 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:03:14 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 24 Aug 2026 20:03:26 +0530
Subject: [PATCH v41 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-imx-se-if-v41-1-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
In-Reply-To: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582007; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=WUw1ZSaF0xpdB6wRbQyM12LZl6VUCgVy7k04UBbVEUtcDG5kIQQqqjySQjEiKhLxg6EQh0SQJ
 20AnH7t9gTBBpJj/8jW+xtNv9W7aP+npfhJhT4OM89PIdx3/eXeTyeb
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6524b5-d4d8-469c-8551-08df01be8738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|11063799006|56012099006|10067099003|3023799007|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KsumAmWSyzmU6ILIUjtdRbyUT7ZbfCy1s7AlJo2HQQZG7NtkJP3GojYiRTBP8FrgWpGmzny97Ue6nhA6LG4SKPBd0rwh47ldGr2lxnwAOEOJewLgXITXKXa4LyldI/Rr+KxZidRlL8DFYD/xWhQl0Cf3SQgpk6oHzzwTrTMM8fQGiw/wNpYdzPiVMaAaHgm894FiOJxmuZvErfTvpt7/Jt9jfBJfl7UHzYd8vu5wMe4D1nyjBcKjNMDMQ3J1hMQSrop1kCjQV3KCBYmqqOavqSFfjzrBRfSD0Hf7mrvXgYhbWp4kvQCFXrC3Tn7PdflI0Y65Wjo0QFbD4nfIPFg7jj6FzyG2uxxqjQp04OGMq8XiS/fBsuB8IroQTbA6wbe6Cda9VXhE6O9g+8piCC8w+i8ALJd8M2F8zUCGxN/8De++NtxLOgvx7ceUGEKdZ5IgpiL9BAokYy/pq18I6SDRiLgLN/BeIQRvFUx98bGH+ErdqbWPaC98uKmeP+6r3Kgaxk4r/GzQBRQ3LmlHaPq/+IxXj5ZJcihGE3HOMR1YN7Eady4WcrJSLnFG/BdzdD2dfOprpju5PPZzROxvojqaLwGrO6W9azv4dpRNBqLEJVSQ2wc4ZwweAcifOXmtnWFe28Rq1W3xYYsEntGM4JcYw8yO+GpTqixeTmiaTOZdhMul13E3hIaPe2Bb82P5coS6UYHBMdj0OAacsxbWvpKpbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVFVVN2cU1aRVZlMDNEbndITzJydzN0VUFLT2lWb2RTU25uM3U1OE9zVU02?=
 =?utf-8?B?QzV5Nk96SkptVzNWOXU4T1NFREdjbVJBVkFZUDdyL0tYYmFFV1NkTmUrLzhR?=
 =?utf-8?B?N0UyeG9ORDJaZUdGV0lmdWNMZG5UQUQyTC9qWERyMTZrRVZOVmYyQTRsbGVC?=
 =?utf-8?B?TGU5czRQN1paS3I4Z05aMmc4N1NZY0JkdW1PY3YwZkNmNVVvZEp2K1duT1Iv?=
 =?utf-8?B?R0dKUEx1cnpyWS8zSHQ2VHpwaFY2Ym0zUmZ5ZVdLc2h5TTlVVzBCdFRWbGty?=
 =?utf-8?B?OC9tMm1vZGhsYXVQYVg2OXVnTVpVUXhPNDNBZWF6cHB0Sll4Qm96L3BIY1Zz?=
 =?utf-8?B?RTU4SlQyR0Y2K3JQeFBYbG5lQ2g3MG92L3MwdDRpcHNtMXlvUGdqcFBrenI5?=
 =?utf-8?B?dkdVYi9zeGFHNzlQZmJzVUE0NlBYdm9Ec09LZXZNbTdhS05LVnFTR3NuaW16?=
 =?utf-8?B?S3JEN2lQblJLdXptR0MxN3ljSVpuSnF1aXlLQmJDeTFLYXRoTVpwWTVQRVVW?=
 =?utf-8?B?WExrSUtjakNINzRIdWU0dzNyU0R6a2NkdE5VaTNTaC9YNkRQRTJ1akF5b2FY?=
 =?utf-8?B?TDdxTnd2dVM2MjRpS0NtY0JJczVWdHVtYVV5YjR3SlB4Y2ZheHRwcTFsYWVE?=
 =?utf-8?B?N2sydUxGanNGYUxNMXVsQmwwZ3hKMUlPdnIycmZPY1dUWUZ2OEIzOUt0a3Ey?=
 =?utf-8?B?a0l3TFBZV0dEYUxaRlBJSlAzbWZsQU5NVmdnUzY5RjRyZXZnNUoxY3VLNXdh?=
 =?utf-8?B?V3V1dlVHUWljRnZDelY5ZjlXZUZ3TUdXN1N3WDFhVnpUYXFwQ2E1Qy82Skxr?=
 =?utf-8?B?NjVXeVRGdU1ZZGE5SnhlZmtWWDVBUVVDOUZzeGlSRmRzd1ZyWHJFd2pGSGkz?=
 =?utf-8?B?UU5uTHZOQmsxeDNyS0pmNUpEOW1qRDV1Uis4MVpJR2Z1UVdIZHp6WnlQM1lV?=
 =?utf-8?B?a0hPYzB1QkQwVk5NcUtTVlhGN0tUYklvZE5taXFKVjVwV05LSEcxaHhnSTk4?=
 =?utf-8?B?Y1pvcDFIZ3lGOUN2bVVmNkZrYkpLK2dKSHd1elJ3d2haWDJmUXk3UzkrelEy?=
 =?utf-8?B?UkZuOFZIaHhkY2FsVitpK2lWRDZ2T014OUlHdTBybkpFWHMwdnYvZU9FRE4w?=
 =?utf-8?B?SmVob3dlWm1pZG5ZenNzQmJGY1ZJQ3ZVYmRzVXhzZXNDWjlVK0dFYTduU2Ev?=
 =?utf-8?B?UCtscVpMNmljZFFsMncwV2ZXWmtIeW1Ic3pZTjBxSi9RSGp4eE41VGhRM2tU?=
 =?utf-8?B?RlVna28wOWpRRzh1b1B4WnU5bDFmTjl1dVBNblRHNmk3MGVOVG12U3MrSkxt?=
 =?utf-8?B?QzRMbTZYejZBbFBRTzNkQkwxMHNDMHZNLzl2aTBCM0FmVE9kSjJUb1pCc2Qr?=
 =?utf-8?B?RWpVSjVoVCtidjNMdDJCdDVxdjZWSlFDZ0xMbENQMm1tUUJ6UU40M0VCQW52?=
 =?utf-8?B?dmlTQ21KdnN5N1FBZ2JUa3hWak11Zmd1UWVsTEtTQTFMdDVEL3FZVjh5OHlS?=
 =?utf-8?B?N0ZlY3pLUzRRVlBHUGxxdWo2ekJyc1M2dW11cmY2Ni93b0VGdkhZcGJmV0pu?=
 =?utf-8?B?MzlQcndXTjRpZ0xnQmJvQ2ZHblRSdCtRSkI4QUM4V0pWQ0pwQk9jMWQ0QkVF?=
 =?utf-8?B?Z2VRY2F3WGZYdHgvc3lDSUtkRUwyNWY4Umt1cm9iaVd4TGFycWhybW9paUhx?=
 =?utf-8?B?OFBjSHFBNlFMcjRrSlBXUC83Q1NiSnF0WjNLdU5nQlkwdFZXcHFsUXpJMXdz?=
 =?utf-8?B?NnpYL3AzQmtoZzh6NmFOdXVrVE1PVlNTMDBtNDZ4WDkvUk9LZGRka0JSRjhY?=
 =?utf-8?B?YTcwdFQ3M29WYnVlMHFoR1ZueGdzZkxRT0dkUllOZkVmT3BOYXpIWWprRDB6?=
 =?utf-8?B?eGtQd1E5NG5ES1EvR1c2SHEzM3NnQzlibDZkR0gzN3hmSlc0TUJIRGZ3L3Ry?=
 =?utf-8?B?em41TmwwNnBJWTA2UFFSVXZ0SURkaHc0aHdKUTJsd2VNY0NPTE14RnBwTFhl?=
 =?utf-8?B?TDd4VUI1ZW9YUzZ0YmpISDBnalNONUtYQjM2NTNkbjE2a1BvdGlSQ3ZoQ0hR?=
 =?utf-8?B?eGFzekZTeTROZHppOStEYmNEcTdTdE0rU1pjdk1oSDVUL1NpMWp0VHZpNjBz?=
 =?utf-8?B?dzVINHMwN1dkZStDVnVjU3BvcTVIdVBwVUpVL1YwemJHdEt6OERCSk5HY3ho?=
 =?utf-8?B?cUkrUnBISzFUQ2t5VkU5ZHM4NmZySWk0ckNkM2cxaFNxbFloTVNNUWJhQW9q?=
 =?utf-8?B?NVdYRnIwUFBXT2ZHL0t6dG1WdnlRQ0IwekdaY3d2aldiUXQ3TmR1ODlSZld1?=
 =?utf-8?B?eGFyRHRoblR1c01zeDUzRUM4L2hBdlV5L0JrVkdKN0h5dXZIVlN4Ym1vc2VH?=
 =?utf-8?Q?2zNjBdnj/kjSTfwJ7pQDsrPTpOjimpbJV5XUg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6524b5-d4d8-469c-8551-08df01be8738
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:03:13.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIv+QXt+bRpR7wR0Cs/xNyY17qW6kQXBe+dZjHiG6rJqhitfpVdksuqGcVbTcd+VFppv0uKf245BMfmqBTvGdMyr5I+xynUPwoRhnE0N69VXZg2brR7fnucRyfflcib5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

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

