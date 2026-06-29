Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664103BBFA0
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716684; cv=fail; b=COyMuIAr6viThgA8jsExxTdZ9vKxm3kG2ODZazVX8980XqGXiaRwKwJ3H90R4/JSDa6BBXcVwlh4gOSOVAm1uz/OHI0+X++M2IrTWwbKZOnyyMcFOfQlVAstHbkjaFey+GaoggP+DUEg5Pcy1AhvVwVwt5rL8lO2NXBMpDdbk84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716684; c=relaxed/simple;
	bh=/5e7C2RySGtJJWcuO2rr374k40ZLgEkpG1HBs2ivuwI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FfXFPjjOWaR5LrwMHPMiqZdPjKKXJHZGZB2YrNz2AMQKYJ6sr9tMmxUh/RXwECK+bsYLKIuiA9rvXDy5+UjBKn6GPDqkHEziCOcnTYlNLgiQwp+TcVXmM526KRxI0fp/N1nrn5scw1RIMxIOIriw9e7DWmBaJu7xXw8S3siCnnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O1Oe1Gd2; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O1Oe1Gd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuOvs43sDd32HuTPEFkoSF7/FqZljGvkLZaaqgtcRnHa5CPEmxXm6gOgDFHaGmE9uxWVuIGDMgZO6W8tFNsC60MLUJXPBFiulLl+rtC+XeF34l4pFJFkdrXskr6yep4LIC+U8ekao3gYNE+fu4rXH+YsedQe+vZmEKbgPsd/xVqlUAmBnT38cPJmH535GOtMyeST0+btfi5n1rEgjyR7T72vPkOegWr1neXbuh91vJLEWK8eVFK6JR+VLIgpWKcaV/gXBMJCpap7B5k8p6Nr8ANqyjXuphuh/xP2AV817vErN/PQ6+gNHnUfZ0KS/2IbpjfNro9fAvuZnksKUfTBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ0M5pL/ns1V5NnpkXUwBA/kV3UL2bJ8uyRxZlJSO0o=;
 b=pu++TWS/peBeNHdJAHcQdaKMbQrVk53bJ13c/vRxjrjKilM4jLaIDCGEiEvkpyT8c4OBtjGiiieWJnvi1CnkuVRoUHHVQfmtV0wTo4NjKwOiNZaHSedY8xDOKMTtpD5QefmEj3N9cjo56eemwQ+mEWC/MiJd0ec1454Nu7Oqxu9iK43LE6ni8Wj4aERlgJTwlfaeb3Fn+Cl+SHJJBC4O/7cwu0WEuwMh6SQc+0qn8z0+SvnT7+u0kHFnYdQFAyiUqSho4AyeKzo/YJwUMppyUHEk45mW8mE2yRVcm+kKhoc1BPc+pk1vwTJRhToYjdQ543B+2CxiZvxZKy9QiHsX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ0M5pL/ns1V5NnpkXUwBA/kV3UL2bJ8uyRxZlJSO0o=;
 b=O1Oe1Gd2860MrbRpJeioopAxCPIjIafEWlgskXVzodmNBXGnKJsGRQVoDYx9+Y8RfoFd8Sf7zBJ51fg28Ik0r6633Av5rMTdwohuB+Xnr2zDagVoSBhmw6iXD7iEPIXbmiUND/9Ej8vdvdUlIm6uEyaDQs7IfNsFYcXswbftCJ7HnNYm1dPhqWPUvxwy3WIQABlfRhDkBVoOwffxg908sEDEbJr5cfYRamrGM8xZByoluonJ+tVZEVqsJvi4uvJiS+IBVOiCTQk6xK970vyBQM+JG4MbPwmUznelTFfT/Am1GuZHNAQxU+6fbsALzZbQcnywkh7jz83kuF9Y5AuC0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:37 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:37 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:52:01 +0530
Subject: [PATCH v26 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-5-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=54072;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=uqpxTURtfhktPPThvsRB+czIVVzMrNHJkicy5A3Um9c=;
 b=ILWF8p+sdeEF+w2HFA5/KstingDb1pXocPglLAcqa5T4dtSxGQueW3xCVDSUkd2pKbGqnDhyv
 VnNoHiHaqkfAzkNiXmmFjjT/pXSlxu8IENVh2ZmeRFQPOurEi2+luKk
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: de4dd001-c2b8-471d-30ca-08ded5acae80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|11063799006|22082099003|18002099003|3023799007|56012099006|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	Y1l+fex5hAwS5/Y1CgQzM3zD3G6eK+IzoIPq9c9jWINMRkL+uDlP23XDQDo03U6kjLxi27/kDzN7JrHyZ8H4f347RtZgURHYbVY23QmlsnW8CEyFt1PUt4+qHhJKscMVvPzBL5h3xI3oYn7gWOe0gW2HNypsgOVIDg42XDBJqRL+8iWP9OaIxhxwragvlIC7k9yjTvAB0CL6GdAtfmeOHwr5PcuZ4wCyYNOkNe7AZJX0Wsg3hfHdTnm9pTIeB0vCl4vXhhJpILv/zt4WPUaXohb10k2U75zvAnxiYKm27voNILQ2kbZeAAs0Vb9TydPKIuoWkT1RLqZtlQG2DOd0doGDP+ZMSLkd69Emxhj76UzpGILEuu0TwOZ3ra4CelbKLYn0y0Ech+c917Qa3AdtdgMxJUBpHZkVQdoBcWvkpSE3d3ZTm2b2eZ8hw6KOWRCiUG7vf27DMdwzMOF152Upzhcfp/hB5augq2UoIYUdkGokKhYgXO259mCyVQFcnkiXqFqQr6TIXv0eKuvJOvsAs/ciXhH2hI4wuzGOblEpOwug2NVaQgMsaDERwzSpLAmuRlkpiNEnVYkpNatLHDKUEdiYVcOjLddyepxFAzr9JAjxssD1i/XHYI3rLq6c1vAPlb7s3OHyfLcgXhbMdcN3sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MllRRDBqY0loQ0w3U0VTZXhBUUxqLy9jNjZDQjlScnFzMUlFa2haMXp6YXR2?=
 =?utf-8?B?dHJ6bVJKS0RESEFDamI2VVQ1cDJ1S2NFOE80UUJGbi9aU2JoeGZPbUNFbFVp?=
 =?utf-8?B?MHoxZE5HdFNaQkQyRHhoZStwMXNmYUQyWG5NRmZzZnBCTnA5KytNUVZvQzRT?=
 =?utf-8?B?T1poS0V3R0JJZERRMkZWc1VYMk1UUGtjUFdOazNTL0h5S0VtUTJITWhXU3Q3?=
 =?utf-8?B?SndKNUR0azdTek1aWnZtNnlqOVk3Q3FLcmZ1UWxXalZMcHdiaUJlMis0dFpT?=
 =?utf-8?B?cDR1TTc5bXVaTXJNeWIrYkRma202MmpnSVAzVnJBdGhBSHZUL2FObC9KajVo?=
 =?utf-8?B?N0xNZDRZMzh3S3RGUmhtdlNVOGtMSGd3cXpCbDVrNnhJbk9zOHZVNEhQbzhz?=
 =?utf-8?B?bVNPeVlUMy96YTB5cC93WGptSUhET00xWGgySGpXVDR5OVl6bm9CUnNiWGxO?=
 =?utf-8?B?S2o1ak5ZWER5UkVSZVFpaGl1b3BITjRhWnlSRTRGU3NwUzY3SFpRK3ZOWnVD?=
 =?utf-8?B?MUsyczhrTklFbGVtT1pmZ0RjZ043RXc2QWlyc21VeFlMWFV4YU1HdHlvU0NL?=
 =?utf-8?B?dWNtblg3akxGZzlQNWp3MkQvUHY2NTlKZHlBV3JxK0dSaUYxV2VXZTRNMlN2?=
 =?utf-8?B?N0NYbVkvblVSaGI5QUxMK3BKNkRIYzRTQUV6SHpwVUNwVE1PSTZiRVlhcHlo?=
 =?utf-8?B?Y2dLOUZ2YVN4UkdzQTNzMXd0TUtGWnljazBJNS80N0s3T1RGaHZRR3dTend2?=
 =?utf-8?B?Vi85M3FFYklMZ2FERnJZTU9lRE9KNFBZUlFNVGg3ZjgrSmt0dllaSEE5Ylhk?=
 =?utf-8?B?bU1hY21YdFpabm1jWGZKS1JzMVVGOWNmMlBsUlU5cWIwN3RUZXBQaXBxdEVS?=
 =?utf-8?B?WGl0MWlLS3IvQmFkeE1NdlNNWUFhb0VBY2ZzWGhiT0VNMDEzNzVEcnA5TzVk?=
 =?utf-8?B?NVVsbkFzNUhGS245RzlMOUJHbm11M25QVjZiTlZOcm1XL2RKWjU5dGFEWEZK?=
 =?utf-8?B?Rk4rZXlSZ0xRTDhpOFpkc0lDcjVMSWJLcDBLQXJWVGN5bVBqdXZCMnd3SGgy?=
 =?utf-8?B?bGFWYm1pSEVKeDJHa0dIcEp1M1RKalRHWllyUDcwT09NZkhFUEdSOEtKVmZl?=
 =?utf-8?B?dDdFdGlrVnRPMVlhbmp5Mi9uU0FnMmRLcEp5djdKQTd6Y3NrKzBmbkpIZ0hL?=
 =?utf-8?B?K282cjlYa0Rjb2RaTnFSSndOb3pTRXhZZElZajNKVE1LT1B5TjVGanVCdHND?=
 =?utf-8?B?TFRhb0doRHh1TDM3cjdldnAwWDEwV0xESTZ2dVNKZXdneXdObzdRYU9XV2p2?=
 =?utf-8?B?MHdYWjRHU2lEZFdnMysycHY3dEt2SC9MVTV1QXhybWlXRlJzT0xBUHoxbXFS?=
 =?utf-8?B?OCt2QmN4VXUvSXpSNHlKQWxJV1JJRFJQVlVBOGJreGtUWXczZlBYVzdRcGhj?=
 =?utf-8?B?aXQ1bmNRcmRwVFpXZ0tXVW9kTk5FR1pycG9wK0lkeHBXK3VsTytBRGtaMkhV?=
 =?utf-8?B?SXFXZ3lVcmtjd0cvbnZxK2YvR0JtSTFHVE9HRWhOOTV6NUhmZHhiZnR3YlZG?=
 =?utf-8?B?MFR3WnU0b09wSTBvWXpNOHhMSUt0RllzY1h2MEFLenZSb1FBNStOYVlNd2tO?=
 =?utf-8?B?clBUZk9jMWtLbjdtYkEyQlVmTDcwNml2SHo3MDVraEVwUEYwSUdxWC90TllO?=
 =?utf-8?B?NmZDOG5DZjJpUGhBSGIybmVGdlZoUjNTSTZIMzJiK2hUM0ZxNGhXMERacTIz?=
 =?utf-8?B?ZWNyamFFZ3I2OTRzaSt2SkMyOUFRdGR2K0hBVlp2Tk5lS1dkWkVOdTcvTGVX?=
 =?utf-8?B?TVB5djE2SWNYengxWlIzNnpzOE8wdm5tc08rVGdwRnVHdCtnMkZoODV2clVJ?=
 =?utf-8?B?a0ZQOTlCQng2NzdVTWxGc2xGazhUaW9aMVE1TkZYWTFzeDdlMUJ3dFAwbFRl?=
 =?utf-8?B?eFBnQ1p2TTh1dXpNRUFHbFNVNGo2eHRudHp2bFpvVy9ia0JaNXFBVGlLaVpF?=
 =?utf-8?B?VndWNDlMWG1HdWcySHhwSTVualZySFVmdlByNURqdmJsazE4eEZkOWV3aXlm?=
 =?utf-8?B?RFFGV2UwR1RheGNvSXNMZ0ZrdXE0eUtrVmMwTFRna2I3a25wVWczYzlxQmdi?=
 =?utf-8?B?MWpuaTFlaWl0MjMrVS94OEJEcG5HNWVhbHYrUm04bVhFYmp2SDQrK2lHOVl5?=
 =?utf-8?B?WEowckovMWZla3JPcDVXbWhNcEJ1WWFrbkRCQWJKVUsvaldFSnJNazVONGNB?=
 =?utf-8?B?OTl0R0F0Yk1lR3JJWTJnNHhORTJuSVBQL3I4enF4WU1VWWlHK3BiZkN6dlF0?=
 =?utf-8?B?VFJ0dGNuMk1DbkgrR2JuY28yM3FySWx0QmgwYkZjSWFqQ0xjTnBRNlFOcmFu?=
 =?utf-8?Q?IjK64jejG4uzUydhAqTbViz7ArztlYRHtoje0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4dd001-c2b8-471d-30ca-08ded5acae80
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:37.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqA/z2Vg/dknXyshw1LYAGkQ9PbrcdpJsne3ktdYtp8ISb8FWyic77pVxaUpoBHsx4CU1ESHqEcJaQcf6rrk6hf1b6++N9G/MicDzDv0QMxVTgolVz4usII2fKDntc3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Following checks are performed on the incoming msg-header,
to block exchanging invalid arbitrary commands:
- maximum allowed words,
- check if command-tag & response-tag are valid
- version,
- command id validation check, to allow limited base-line API(s)
  and restrict following:
  - exchanging power management commands.
  - reset requests.
  - BBSM configuration requests.
  - re-initializing the FW.
  - RNG init
  - CAAM resource release management
  - SE's internal memory management.
from user-space.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changed from v25 to v26:
1. se_ctrl: serialize command receiver registration

SE_IOCTL_ENABLE_CMD_RCV updates the global command receiver state in
priv->cmd_receiver_clbk_hdl, but it is currently protected only by the
per-file dev_ctx->fops_lock. Concurrent ioctl calls from different file
descriptors can therefore race and register multiple receivers against
the same priv instance.

Protect command receiver registration with priv->modify_lock, a global
mutex lock, which serializes modification to priv structure members.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1

2. se_ctrl: keep priv alive for already-open device contexts

Open file descriptors keep per-file se_if_device_ctx objects alive after
driver teardown begins, but those contexts retain a pointer to struct
se_if_priv. Since priv was allocated with devm, teardown could free it
while existing file descriptors were still able to reach read(), write(),
ioctl(), or release(), leading to use-after-free.

Fix this by moving priv to explicit lifetime management and adding a
kref to keep it alive until the last already-open device context is
released. Each new device context takes a reference on priv and drops it
on final file close.

During teardown, mark active device contexts as cleaned up and tear down
their per-context resources without freeing the dev_ctx itself. Existing
file descriptors then fail subsequent read(), write(), and ioctl()
operations with -ENODEV, while close() performs the final dev_ctx free
and drops the corresponding priv reference.

This also folds in the close-path cleanup fix so the device context is
not freed while still inside the fops lock protected cleanup flow.

This ensures that priv remains valid for device contexts that were
already opened before teardown and prevents use-after-free when those
contexts later reach read(), write(), ioctl(), or release().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1

3. se_ctrl: pin active contexts and serialize during teardown

fixing the teardown-side synchronization for active contexts.

se_if_probe_cleanup() walks the global dev_ctx_list while close()
can concurrently act on the same se_if_device_ctx objects. Add a kref to
struct se_if_device_ctx and split global detach from local per-context
cleanup so teardown can pin one context, detach it from global state,
clean it outside the global lock, and only then drop the temporary
reference. This prevents the cleanup walk from racing with concurrent
close on the lifetime of the current context.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1

4. se_ctrl: preserve ioctl error across cleanup

se_ioctl_cmd_snd_rcv_rsp_handler() can set err to -EFAULT when copying
the response payload to userspace fails, but then immediately overwrites
that error with the return value of se_ioctl_cmd_snd_rcv_cleanup().

If cleanup succeeds, the function returns 0 and falsely reports success
to userspace even though the response copy failed.

Preserve the original operation error and only use the cleanup return
value when no earlier error was set.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091446.3331006-1-pankaj.gupta@nxp.com?part=1

5. se_ctrl: copy userspace messages before header validation

The write path and the synchronous command/response ioctl path validate
message headers directly from userspace pointers before copying the full
message into kernel memory. That violates uaccess rules and can fault on
architectures that enforce privileged access restrictions to userspace
memory.

It also creates a double-fetch window where userspace can modify the
buffer after header validation but before the payload is copied, causing
the validated header to no longer match the data actually used by the
driver.

Fix this by copying the TX message into kernel memory first and
validating the header from that kernel-owned buffer in both the write
path and the command-send ioctl path.

Also reject userspace-provided response buffer sizes that are smaller
than a message header or larger than the maximum supported response size
for debug-dump replies before allocating the response buffer.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091532.3331051-1-pankaj.gupta@nxp.com?part=1

6. se_ctrl: roll back iobuf reservation on setup failure

se_ioctl_setup_iobuf_handler() reserves space from the per-file shared
memory pool before copying user data and linking a buffer descriptor.

If copy_from_user() or add_b_desc_to_pending_list() fails after the
reservation, the function returns without restoring shared_mem->pos,
which permanently consumes part of the shared memory pool for that file
descriptor.

In addition, add_b_desc_to_pending_list() failure currently falls
through to the copy_to_user() path, which can return an ELE address to
userspace even though the setup failed.

Fix both issues by rolling back the reserved shared-memory position on
pre-link failures and returning immediately when descriptor linking
fails instead of falling through to the success copyout path.

If copy_to_user() fails after the descriptor has already been linked,
unlink the descriptor before rolling back the reserved shared-memory
position so the pool state and pending list remain consistent.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091532.3331051-1-pankaj.gupta@nxp.com?part=1

7. se_ctrl: detect round_up() overflow in iobuf setup

se_ioctl_setup_iobuf_handler() aligns io.length with round_up(..., 8)
before checking the available shared memory space. On 32-bit builds,
round_up() can overflow for large io.length values and wrap aligned_len
to a smaller value, which can bypass the bounds check while later
memset() still uses the original unbounded io.length.

Detect the overflow by checking whether the aligned value became smaller
than the original length. Valid alignment must never reduce the value,
so this catches wraparound without relying on a SIZE_MAX-based check that
triggers tautological-compare warnings on 64-bit builds.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>

8. se_ctrl: pin miscdev-ctx to serialize open during teardown

fixing the teardown-side synchronization for new open attempts.

se_if_fops_open() can still race with teardown after starting
from the miscdevice and attempting to reach priv. Introduce a small
open-gate object associated with the miscdevice. The open path first
pins this gate, checks whether teardown has started, and then safely
takes a temporary reference on priv before dereferencing priv state.
Teardown marks the gate dead and detaches priv from it before
misc_deregister(), so new opens either complete while priv is still
valid or fail with -ENODEV without touching stale driver state.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1
---
 Documentation/ABI/testing/se-cdev   |   44 ++
 drivers/firmware/imx/ele_base_msg.c |   28 +
 drivers/firmware/imx/ele_base_msg.h |   19 +
 drivers/firmware/imx/ele_common.c   |   38 ++
 drivers/firmware/imx/ele_common.h   |    6 +
 drivers/firmware/imx/se_ctrl.c      | 1013 ++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |   55 ++
 include/uapi/linux/se_ioctl.h       |   97 ++++
 8 files changed, 1284 insertions(+), 16 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..c6b8e16bda78
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,44 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git,
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 66bae4c7d464..ec718d322abc 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,6 +15,34 @@
 
 #define FW_DBG_DUMP_FIXED_STR		"ELE"
 
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header)
+{
+	switch (header->command) {
+	case ELE_PING_REQ: return 0;
+	case ELE_DEBUG_DUMP_REQ: return 0;
+	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
+	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
+	case ELE_OEM_REL_CONTAINER_REQ: return 0;
+	case ELE_FW_LIFE_CYCLE_REQ: return 0;
+	case ELE_READ_FUSE_REQ: return 0;
+	case ELE_GET_FW_VERS_REQ: return 0;
+	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
+	case ELE_GET_EVENT_REQ: return 0;
+	case ELE_COMMIT_REQ: return 0;
+	case ELE_GEN_KEY_BLOB_REQ: return 0;
+	case ELE_GET_FW_STATUS_REQ: return 0;
+	case ELE_XIP_DECRYPT_REQ: return 0;
+	case ELE_WRITE_FUSE: return 0;
+	case ELE_GET_INFO_REQ: return 0;
+	case ELE_DEV_ATTEST_REQ: return 0;
+	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
+	case ELE_READ_SHADOW_FUSE_REQ: return 0;
+	default:
+		return -EACCES;
+	}
+}
+
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 {
 	dma_addr_t get_info_addr = 0;
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 74f87f57d96b..75e65e279193 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -15,6 +15,23 @@
 
 #define ELE_NONE_VAL			0x0
 
+#define ELE_OEM_AUTH_CONTAINER_REQ	0x87
+#define ELE_OEM_VERIFY_IMAGE_REQ	0x88
+#define ELE_OEM_REL_CONTAINER_REQ	0x89
+#define ELE_FW_LIFE_CYCLE_REQ		0x95
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_GET_FW_VERS_REQ		0x9d
+#define ELE_RETURN_LIFE_CYCLE_REQ	0xa0
+#define ELE_GET_EVENT_REQ		0xa2
+#define ELE_COMMIT_REQ			0xa8
+#define ELE_GEN_KEY_BLOB_REQ		0xaf
+#define ELE_GET_FW_STATUS_REQ		0xc5
+#define ELE_XIP_DECRYPT_REQ		0xc6
+#define ELE_WRITE_FUSE                  0xd6
+#define ELE_DEV_ATTEST_REQ              0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
+#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
@@ -95,4 +112,6 @@ int ele_service_swap(struct se_if_priv *priv, phys_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 			phys_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index b37ea1f14f75..79be0f8ed825 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -6,6 +6,23 @@
 #include "ele_base_msg.h"
 #include "ele_common.h"
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
+{
+	if (!header->size || header->size > MAX_WORD_SIZE)
+		return -EINVAL;
+
+	if (header->tag != priv->if_defs->cmd_tag &&
+	    header->tag != priv->if_defs->rsp_tag)
+		return -EINVAL;
+
+	if (header->ver == priv->if_defs->base_api_ver)
+		return ele_uapi_allowed_base_cmd(priv, header);
+	else if (header->ver == priv->if_defs->fw_api_ver)
+		return 0;
+
+	return -EINVAL;
+}
+
 /*
  * se_get_msg_chksum() - to calculate checksum word by word.
  *
@@ -42,15 +59,36 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 timeout_ms)
+{
+	priv->se_rcv_msg_timeout_ms = timeout_ms;
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
+	unsigned long deadline_jiffies;
+	unsigned long timeout_jiffies;
 	unsigned long flags;
 	int ret;
 
 	remaining_jiffies = MAX_SCHEDULE_TIMEOUT;
+	if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx) {
+		is_rsp_wait_with_timeout = true;
+		timeout_jiffies = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
+		deadline_jiffies = jiffies + timeout_jiffies;
+	}
 	do {
+		if (is_rsp_wait_with_timeout) {
+			if (time_after_eq(jiffies, deadline_jiffies)) {
+				ret = -ETIMEDOUT;
+				break;
+			}
+			remaining_jiffies = deadline_jiffies - jiffies;
+		}
+
 		if (wait_uninterruptible)
 			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
 							  remaining_jiffies);
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 5bac14439d7d..bdc13d1b715d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -12,6 +12,11 @@
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
+#define SE_RCV_MSG_LONG_TIMEOUT		5000000
+
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -42,4 +47,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index a4823f485f88..0ea062954baf 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
@@ -16,6 +17,7 @@
 #include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -25,22 +27,19 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
 #include "se_ctrl.h"
 
+/* Maximum response buffer size in bytes for debug-dump replies. */
+#define MAX_ALLOWED_RX_MSG_SZ		ELE_DEBUG_DUMP_RSP_SZ
+
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
 	const u8 *seco_fw_nm_in_rfs;
@@ -133,6 +132,13 @@ char *get_se_if_name(u8 se_if_id)
 	return NULL;
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
+
+	return se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &var_se_info.load_fw;
@@ -199,11 +205,235 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	dma_addr_t se_fw_dma_addr;
+	phys_addr_t se_fw_phyaddr;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/* allocate buffer to store the SE FW */
+	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_dma_addr, GFP_KERNEL);
+	if (!se_fw_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	memcpy(se_fw_buf, fw->data, fw->size);
+	se_fw_phyaddr = dma_to_phys(priv->dev, se_fw_dma_addr);
+	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error %pe: Authenticate & load SE firmware %s.",
+			ERR_PTR(ret), se_img_file_to_load);
+		ret = -EPERM;
+	}
+	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_dma_addr);
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static struct se_buf_desc *add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+						      struct se_ioctl_setup_iobuf *io,
+						      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc = NULL;
+
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
+	if (!b_desc)
+		return ERR_PTR(-ENOMEM);
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return b_desc;
+}
+
+static void se_if_open_gate_release(struct kref *kref)
+{
+	struct se_if_open_gate *gate =
+		container_of(kref, struct se_if_open_gate, refcount);
+
+	kfree(gate);
+}
+
+static bool se_if_open_gate_get(struct se_if_open_gate *gate)
+{
+	if (!gate)
+		return false;
+
+	return kref_get_unless_zero(&gate->refcount);
+}
+
+static void se_if_open_gate_put(struct se_if_open_gate *gate)
+{
+	if (gate)
+		kref_put(&gate->refcount, se_if_open_gate_release);
+}
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	const char *err_str = "Failed to allocate memory";
 	struct se_if_device_ctx *dev_ctx;
+	struct se_if_open_gate *gate = NULL;
 	int ret = -ENOMEM;
 
 	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
@@ -217,18 +447,723 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		goto exit;
 
+	mutex_init(&dev_ctx->fops_lock);
+
 	dev_ctx->priv = priv;
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->cleanup_done = false;
 	*new_dev_ctx = dev_ctx;
 
+	gate = kzalloc_obj(*gate, GFP_KERNEL);
+	if (!gate)
+		goto exit;
+
+	mutex_init(&gate->lock);
+	kref_init(&gate->refcount);    /* device-owned reference */
+	gate->priv = priv;
+	gate->dying = false;
+	priv->open_gate = gate;
+
+	/*
+	 * The miscdevice storage is now owned by the open gate object.
+	 * priv->priv_dev_ctx still keeps a pointer to that miscdevice.
+	 */
+	dev_ctx->miscdev = &gate->miscdev;
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret) {
+		err_str = "Failed to register misc device.";
+		goto exit;
+	}
+
 	return ret;
 exit:
 	*new_dev_ctx = NULL;
-
+	if (gate) {
+		priv->open_gate = NULL;
+		se_if_open_gate_put(gate);
+	}
 	kfree(dev_ctx->devname);
 	kfree(dev_ctx);
 	return dev_err_probe(priv->dev, ret, "%s", err_str);
 }
 
+static void se_if_priv_release(struct kref *kref)
+{
+	struct se_if_priv *priv = container_of(kref, struct se_if_priv, refcount);
+
+	/* Free priv_dev_ctx if it exists */
+	if (priv->priv_dev_ctx) {
+		/*
+		 * miscdev storage belongs to open_gate, not directly to
+		 * priv_dev_ctx. The gate should already have been detached
+		 * from priv during teardown.
+		 */
+
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
+
+	/*
+	 * Be defensive: if teardown did not already drop the device-owned
+	 * gate reference for some reason, release it here.
+	 */
+	if (priv->open_gate) {
+		se_if_open_gate_put(priv->open_gate);
+		priv->open_gate = NULL;
+	}
+
+	/* Free any remaining resources that weren't devm-managed */
+	kfree(priv);
+}
+
+static void se_if_dev_ctx_release(struct kref *kref)
+{
+	struct se_if_device_ctx *dev_ctx =
+		container_of(kref, struct se_if_device_ctx, refcount);
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	kfree(dev_ctx);
+
+	/* drop the priv reference owned by this device context */
+	kref_put(&priv->refcount, se_if_priv_release);
+}
+
+static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* check if this device was registered as command receiver */
+	if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+		kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+		priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+		priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+	}
+
+	if (!list_empty(&dev_ctx->link)) {
+		list_del_init(&dev_ctx->link);
+		priv->active_devctx_count--;
+	}
+}
+
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			goto exit;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		cleanup_se_shared_mem(dev_ctx);
+
+		kfree(dev_ctx->devname);
+		dev_ctx->devname = NULL;
+		dev_ctx->cleanup_done = true;
+	}
+exit:
+	if (is_fclose)
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+}
+
+static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (is_fclose) {
+		scoped_guard(mutex, &priv->modify_lock)
+			dlink_dev_ctx(dev_ctx);
+	}
+
+	cleanup_dev_ctx(dev_ctx, is_fclose);
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+	dev_ctx->priv = priv;
+	dev_ctx->cleanup_done = false;
+	INIT_LIST_HEAD(&dev_ctx->link);
+	*new_dev_ctx = dev_ctx;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+
+		return ret;
+	}
+
+	/* Take a reference to priv for this device context */
+	kref_get(&priv->refcount);
+
+	scoped_guard(mutex, &priv->modify_lock) {
+		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+		priv->active_devctx_count++;
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_cleanup(struct se_if_device_ctx *dev_ctx, void __user *uarg,
+					struct se_ioctl_cmd_snd_rcv_rsp_info *cmd_snd_rcv_rsp_info)
+{
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user(uarg, cmd_snd_rcv_rsp_info, sizeof(*cmd_snd_rcv_rsp_info))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err = 0;
+	int cleanup_err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EFAULT;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOSPC;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			    cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	err = se_chk_tx_msg_hdr(priv, &tx_msg->header);
+	if (err) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	if (cmd_snd_rcv_rsp_info.rx_buf_sz < sizeof(struct se_msg_hdr) ||
+	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+			return -EPERM;
+		}
+	}
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOMEM;
+	}
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+	if (!err)
+		err = cleanup_err;
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				void __user *uarg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user(uarg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					void __user *uarg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	struct se_buf_desc *b_desc = NULL;
+	size_t aligned_len = 0;
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, uarg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	aligned_len = round_up((size_t)io.length, 8);
+	if (aligned_len < io.length) {
+		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
+			dev_ctx->devname);
+		return -EINVAL;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, aligned_len, shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    aligned_len > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += aligned_len;
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			err = -EFAULT;
+			goto rollback;
+		}
+	}
+
+	b_desc = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
+	if (IS_ERR(b_desc)) {
+		err = PTR_ERR(b_desc);
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+		goto rollback;
+	}
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user(uarg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		if (b_desc) {
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+		goto rollback;
+	}
+	return err;
+
+rollback:
+	if (aligned_len) {
+		memset(shared_mem->ptr + pos, 0, aligned_len);
+		shared_mem->pos = pos;
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user(uarg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
+			return -EINVAL;
+
+		if (size < SE_MU_HDR_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
+				dev_ctx->devname, size, SE_MU_HDR_SZ);
+			return -ENOSPC;
+		}
+
+		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		err = se_chk_tx_msg_hdr(priv, &tx_msg->header);
+		if (err)
+			return err;
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	size_t copy_len;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			err = -EINVAL;
+			goto exit;
+		}
+
+		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+		if (err < 0) {
+			dev_err(priv->dev,
+				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+			goto exit;
+		}
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0)
+			goto exit;
+
+		/* Copy data from the buffer */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     priv->cmd_receiver_clbk_hdl.rx_msg,
+				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+				     false);
+
+		copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
+
+		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len))
+			err = -EFAULT;
+		else
+			err = copy_len;
+
+exit:
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+		return err;
+	}
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_open_gate *gate;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	gate = container_of(miscdev, struct se_if_open_gate, miscdev);
+
+	if (!se_if_open_gate_get(gate))
+		return -ENODEV;
+
+	if (mutex_lock_interruptible(&gate->lock)) {
+		se_if_open_gate_put(gate);
+		return -EBUSY;
+	}
+
+	if (gate->dying || !gate->priv ||
+	    !kref_get_unless_zero(&gate->priv->refcount)) {
+		err = -ENODEV;
+		goto out_unlock_gate;
+	}
+
+	priv = gate->priv;
+	mutex_unlock(&gate->lock);
+
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
+		err = -EBUSY;
+		goto out_put_priv;
+	}
+
+	if (misc_dev_ctx->cleanup_done) {
+		err = -ENODEV;
+		goto out_unlock_misc;
+	}
+
+	priv->dev_ctx_mono_count++;
+	err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
+	if (err) {
+		dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		goto out_unlock_misc;
+	}
+
+	fp->private_data = dev_ctx;
+
+out_unlock_misc:
+	mutex_unlock(&misc_dev_ctx->fops_lock);
+out_put_priv:
+	kref_put(&priv->refcount, se_if_priv_release);
+	se_if_open_gate_put(gate);
+	return err;
+out_unlock_gate:
+	mutex_unlock(&gate->lock);
+	se_if_open_gate_put(gate);
+	return err;
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+
+	dlink_n_cleanup_dev_ctx(dev_ctx, true);
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	void __user *uarg = (void __user *)arg;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV: {
+			struct se_clbk_handle *se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+			struct se_api_msg *new_rx_msg = NULL;
+			unsigned long flags;
+
+			guard(mutex)(&priv->modify_lock);
+			if (se_clbk_hdl->dev_ctx) {
+				err = -EBUSY;
+				break;
+			}
+			if (!se_clbk_hdl->rx_msg) {
+				new_rx_msg = kzalloc(MAX_NVM_MSG_LEN, GFP_KERNEL);
+				if (!new_rx_msg) {
+					err = -ENOMEM;
+					break;
+				}
+			}
+			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+			if (new_rx_msg)
+				se_clbk_hdl->rx_msg = new_rx_msg;
+			reinit_completion(&se_clbk_hdl->done);
+			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
+			se_clbk_hdl->dev_ctx = dev_ctx;
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			err = 0;
+			break;
+		}
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, uarg);
+			break;
+		default:
+			err = -EINVAL;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -258,6 +1193,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 
 static void se_if_probe_cleanup(void *plat_dev)
 {
+	struct se_if_device_ctx *dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct se_fw_load_info *load_fw;
 	struct device *dev = &pdev->dev;
@@ -269,6 +1205,49 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	load_fw = get_load_fw_instance(priv);
 
+	/*
+	 * Mark the private device context as cleanup_done first.
+	 * This prevents new device contexts from being created in open().
+	 */
+	if (priv->priv_dev_ctx) {
+		scoped_guard(mutex, &priv->modify_lock)
+			priv->priv_dev_ctx->cleanup_done = true;
+
+		if (priv->open_gate) {
+			scoped_guard(mutex, &priv->open_gate->lock) {
+				priv->open_gate->dying = true;
+				priv->open_gate->priv = NULL;
+			}
+		}
+
+		if (priv->priv_dev_ctx->miscdev)
+			misc_deregister(priv->priv_dev_ctx->miscdev);
+	}
+
+	while (true) {
+		dev_ctx = NULL;
+
+		scoped_guard(mutex, &priv->modify_lock) {
+			if (list_empty(&priv->dev_ctx_list))
+				goto out_done;
+
+			dev_ctx = list_first_entry(&priv->dev_ctx_list,
+						   struct se_if_device_ctx, link);
+
+			/* pin this context so close() cannot free it under us */
+			kref_get(&dev_ctx->refcount);
+			dlink_dev_ctx(dev_ctx);
+		}
+
+		/*
+		 * Local cleanup outside the global lock avoids ABBA deadlock
+		 * with paths that already take dev_ctx->fops_lock first.
+		 */
+		cleanup_dev_ctx(dev_ctx, false);
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+	}
+out_done:
+
 	/*
 	 * In se_if_request_channel(), passed the clean-up functional
 	 * pointer reference as action to devm_add_action_or_reset().
@@ -291,14 +1270,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 	 * un-set bit.
 	 */
 	of_reserved_mem_device_release(dev);
+
 	dev_set_drvdata(dev, NULL);
 
-	if (priv->priv_dev_ctx) {
-		kfree(priv->priv_dev_ctx->devname);
-		kfree(priv->priv_dev_ctx);
-		priv->priv_dev_ctx = NULL;
-	}
-	kfree(priv);
+	/* Drop the initial reference - priv will be freed when last fd closes */
+	kref_put(&priv->refcount, se_if_priv_release);
 }
 
 static int se_if_probe(struct platform_device *pdev)
@@ -322,15 +1298,18 @@ static int se_if_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->dev = dev;
+	kref_init(&priv->refcount);
 	priv->if_defs = &if_node->if_defs;
 	dev_set_drvdata(dev, priv);
 
 	mutex_init(&priv->se_if_cmd_lock);
+	mutex_init(&priv->modify_lock);
 	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
 	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
 	atomic_set(&priv->fw_busy, 0);
 	init_completion(&priv->waiting_rsp_clbk_hdl.done);
 	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
 	if (ret)
@@ -341,6 +1320,7 @@ static int se_if_probe(struct platform_device *pdev)
 	priv->se_mb_cl.tx_block		= false;
 	priv->se_mb_cl.knows_txdone	= true;
 	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 
 	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
 	if (ret)
@@ -365,7 +1345,7 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -407,6 +1387,7 @@ static int se_suspend(struct device *dev)
 	struct se_fw_load_info *load_fw;
 	int ret = 0;
 
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 	load_fw = get_load_fw_instance(priv);
 
 	if (load_fw->imem_mgmt) {
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 5d7cd10b4d02..49e619e0b7f8 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -15,10 +15,20 @@
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
 
+struct se_if_open_gate {
+	struct miscdevice miscdev;
+	struct se_if_priv *priv;
+	/* to lock to update the structure */
+	struct mutex lock;
+	struct kref refcount;
+	bool dying;
+};
+
 struct se_clbk_handle {
 	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
@@ -45,10 +55,42 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+	bool cleanup_done;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
+
+	/* Add reference counting */
+	struct kref refcount;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -98,6 +140,19 @@ struct se_if_priv {
 	atomic_t fw_busy;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+
+	/* prevent modifying priv member variable in parallel. */
+	struct mutex modify_lock;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+	u32 se_rcv_msg_timeout_ms;
+
+	/* Add reference counting */
+	struct kref refcount;
+
+	/* stable gate used by .open() */
+	struct se_if_open_gate *open_gate;
 };
 
 char *get_se_if_name(u8 se_if_id);
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..0c948bdc8c26
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0

