Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D03379C49
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592809; cv=fail; b=Ve0pY+hOgG8HfhFBizacetXIQ99ln8P5qTTvgcPL8gUQ7p63f405aPd9biMnbTeRdfUaHh08f3sTDfqyuNxhLpfgaSF11GzseYxU6pAB5OrxGiawdix/iXVg/qTlXKIsqOBMn3Rvv4JNzy/tjGiNfysk4Hfl5q/Ykvq27biu+vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592809; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=icaGu/ofhY+My9ru/ZW3oe4uYKCOXjAMo1lgytdgG1XuWUlgGnRIstntjQamC9FZi5vzHN5zePcHw1ip/mLHUPt++MHROKpPGtbN89TvrBsj3X5za69LsQCKMPuhadKAwXf2zjo/g8g2vLn+3y5xcWTzh7fm/WEnibBOmx8kBSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JAEk9nG8; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JAEk9nG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6T4Y/A3h84A/WFRNppZdn3Fr/r9P4HklKqni8brBQ2nPAT6SdQJPnKwe/GjnGowztCQ4nJeLSQTLTiIOjf6WxBKvDuBGuebwl2MFSlKeCCcwbpQg42zstedKCbQXyodxe4fO7jAw5kjSyct5O2A3hDgaiFMYauck5gpxMAWvIRFPyd1YFs8FZRqiU1KmssHwCu6iuFHQE2tVJQ/b0kr900mHH3k758xQniQ7VUG0MpSr7vUOha7CJVUil0cm0VNTluToNXdoYTIztBQWMEib5N9QVOJVfpY43v6J6Lhzg/Amo8cl9OgWIYTlzpd54jgKBjh43dOoZoxO8zCxiI0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fdvK6BcUAaYlARJ9eNzrzl/pUCII6c2sN+xTcM4BZNfWuifm/cB+E1cx8U93et0VSyEVAIsPCZ12wsbXx0Wuv32GkDseVfnVussebR//c8WbrKWU9gov18e04wnnDXi2s6cAHE82Hw7FBtLv53iPqCH2uv8JGYlHqv3SVMHEP1qqKWYHWCKmacPsHvJ8YircPKSRypNsuhGVSvaDAuHQSowVi2hv5nogO79nCDg7k82Ba351ujdvNCkr3uFBpZcOBYHhIdDz6mPc99ooIJpFqzCZIh3IatN+6rR/Y99x0vt2deAlkWm96zJfhsqwjf+6xeVDofUPT2LdK+wwqm4sfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=JAEk9nG8wmvAkx2HCUKbtXyHweN25krVF8Cez1WAOKSIztkJ/torqMrqrydZYuLCdFLLybIa03b+ptyh21e3Yz3SOg9H6te/2sXS2EfsNbOVMCwso3nopNh/2nnUhVQuqGaMFciyBmU4JakPaA9OEUoaBxqBy51BgQrO24Tk3mn76HBQo9u1GSPE9JLlr1jbGKh9Ff+KF8XyZhj2XQKIPCTnqRXa9Jk9cKw5XaPYDNSqjXKeu7m4+qwJ/o1TcOF1+dIbxbb4havqyGL30nEl3g49sp0splXAmxhLH0QAQDgOLgI3e083/cTGlfHFfr0YyTfdOPCIDasQ4KjiQDJTNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:26 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:26 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:34 +0530
Subject: [PATCH v42 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-2-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=NnfUvqSJbdupgndpo5JaYSIxYV/ushESKJXxVkc57d28uqc4eLYPyB03vB/No3/7ov4MHw0Pc
 3OK+GHdzTzhB4nBSKr4uyVKo9X9x+vbECQxLH5ZY6LBWNco2rhvrSG2
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: a3aee5cf-2647-4817-d84f-08df0205cd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oYcT3S3bBa1LBUHYVi7jRbYA+j/mIoUx0rt87H2U63lhvVWn0uqxlhiHnG7MXvFsgGLlMUg+3n3o/AJf8/5X78kJ5/+2+9BPHVXXPNrCQ7Aa5Gxk+0baDcwyeKRdG7IdOJn6+a2radujfiMVYOfyrdZkgd5sR+QHgE6lGle2Xa3aZ2bRHv6KtAmMqH8UKSSs9L39FSvdE+Ulx3ed4gg1X8wXUpJVDgzz3/BgnAJ5W4sYx9GGlj+soGmTcZFapIswXOerj9ZiU4yWQBjE/8yDi5p4BtF/SZ0M6nNk1r32UaaWoPuSgpzBBzz6uningHBGnwJ1oSMMYJPW1mJXo80OPCQrnL242ttMG1fFf3bqmxKpgm4bw8FxFzvj9nNMU+OzzTrvb5i7vhM8ACSjh4xl4Yx9OAHPEf5qREmBNhbgdPzY9uoaCqLXRThj493iN+/3cXXLGzpGzUq8Q9hMtmojv5OfP8xHO3LUi5WrqjgPok6s64RWbmGFp5PNholEdtdNytozDUA0RyOKBS3CXzvgACfel1QCDYxI5Aj2tIuj3udXIQCmumIda5DsVF5m2U/MK4/HEYsudcC4vQKfbJyFBmln/N8D3uoD6+z+xqeWEDgyuLWlMVDNQOZdD8zfx6YV//HUOwv9MldfMvDEriwDucC1pPTdMUMI93xoOM+irqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTZSamVVN2lIdVViY3hjQ04ybU95aEpRMnZrNGRURktEM1RwcTVhUkZlS2Rp?=
 =?utf-8?B?R09jWnVMTXN4dW4rTDV6MjhoTm1VbUZ2Y0lpdUVLWU5mRGo2UzlPYmxCdmlK?=
 =?utf-8?B?U2VyeW5yREpVQ2pwNVdhS0FsaXVMY0ZWbmgvaU0reU5uY2tDalJqZjRXakp6?=
 =?utf-8?B?SkNTdHBleGFGK2NCakV6amV5NmFIdk55MFkvU2dzOWlxSlNmRlBtcnZoS3Zp?=
 =?utf-8?B?SWYrQ1pHcm93b2JWbEdoUFJ5aVVOOXBTOXJMb2o5bHhBVVVZeHNrWTdzeU9o?=
 =?utf-8?B?ZFVUT3F1a2dweVFVNFFSb2c0TjRUMVVqam1nMG1wZEpFYU5jZ2JYMWFtQnhK?=
 =?utf-8?B?b2tGNTdnYmxQc1BWOWtnL01vVmoxWDNTck9MVXh5ZStNWG42VGM2Y3AxTzZj?=
 =?utf-8?B?WjVoVUZIVXhLTHRHbEhwb1lLVXFKb091MXZ5YkVWNGFZanZwc3ZrUHZ3bG5D?=
 =?utf-8?B?T1dNQkpmRHdRTnIyMzkydnkyT2Q3V2lzWkdrV0pBWmZYMDhhYTJGNjVDSU1I?=
 =?utf-8?B?M2VDTU1WRXVOY3dqWE9nT05qWUx6OTFhSVNaS3BCQjh1OCtobFNRSWNDbUhq?=
 =?utf-8?B?OXpqTTdUWEZoYTcrck1hZWxaaFFjbnRwVnJmdURhaVZKRzNXZnZHbEo2NldH?=
 =?utf-8?B?YWE2ZXU2L09hMW0zQmxjQmxSKzBDZ0lWb2FRbXNDWU45SUVJS0tGVU54L3pK?=
 =?utf-8?B?NGpZVUl4eUhqU1AzdGFZNE54TCthZzVQcUVlNGJ1NGw0YW02Wlc3Mjh2SE90?=
 =?utf-8?B?SUtUL0FwbGoxWk9PRUpLaEpNTFpRZ1ByejZ4MkIwSVFwbWtNay9yamxpRFQv?=
 =?utf-8?B?M1pNdTdkUG51cmVMODJ0NngrMVllbHpHbUxyZTlJV2k3RjJtbE9NV2EveXc3?=
 =?utf-8?B?bkR3bjdtbHl6TkU4dWUzN1VweFhFeXhQdW5RVHFmR0Y5aWQ1UzRnZW5BQTJo?=
 =?utf-8?B?THkxYnBhMUx1MmJQd2JHTFFCUks3NVdLNXF3OTI1NWVwRGFsajNBNE1MVGxx?=
 =?utf-8?B?RkxWZUJtRjN1NUtmaUFIQWdMZktFWm5XTEVidmFWaENSOWFNVXk0Vm1oVWU3?=
 =?utf-8?B?bmMzV2psNDRobVVMQUpHcHZxQlZVVTQxOXBYOWQ2bEt4ZGJCOFduSWNSQlRZ?=
 =?utf-8?B?L2wzaGpTQ0VEc1grdXVoUUg2QXdpR3VqNEZRTlNoN2Q4bUlUK3c5ekpYWE9X?=
 =?utf-8?B?K2VIV1pZcmFxSTFkRkpiSkkwRzJHaUI1THdTL01rdm1mYXR1YTRxMmdURDNw?=
 =?utf-8?B?MTNCT2ZLR2lrRU44SjEyRjFvVWxLTXBqRTliOGRxTFF3STBTV3E3emJ3anJ2?=
 =?utf-8?B?TkQzMmNlR3o1LzhYU2dnU0hvK1VDMlUwTDdTK2VkOHAvWWRHb1M5MTdXMll1?=
 =?utf-8?B?MkVaZ0ZLV1lWeXkwQjNWVW9jakN2WkZDVHJCMWovUXZFR01PTWFQakFhcTBH?=
 =?utf-8?B?TGlMV3BEVzJWSXlPS1JiMUNLNGxIU3I2aUJhMUE5eXJoZ2RSTWxFUmlwaHJ2?=
 =?utf-8?B?REZsanNLdS9Ua0xJYXhYMFZuT3paclBYWDdBeXpmRjMrYzdKb0kyREdmamdY?=
 =?utf-8?B?WHFsK2VVSzZtZHluL2FWcjlqdDZobzM3L3p2a3BpVk81S0FPcU10empGZ0VZ?=
 =?utf-8?B?NHNuOW5qdW9IK2VRd1BRT0Z0Zkc0ckVtMXNUMWlVSzZMRyt6azFXV0ZUS0hC?=
 =?utf-8?B?MUhwb0NQU3FCNFg1dWxuZTdPQ2laU3VuTStjNUh2d1RqVFRsWkc4VU5WSHZu?=
 =?utf-8?B?TWcwenFtKzFxRGxGdEd6azZiSTZGMjBPWitFb3dyci8rNkQxU2FTclNaY3Ar?=
 =?utf-8?B?bjkvOW9scmJTbTB5N1lSRHZUVFVyRHhPSmpkVE1mSUZMaW1JRm1vS3RucU5O?=
 =?utf-8?B?aWF4UE5XdVRheS8za2toSEYrNmpYQzBkaFZ6SGtMRTZiYUtMV3pLbU5lWVJq?=
 =?utf-8?B?NHBMTE51ZjV4dXRyeDg5b1l1NkVFcENaNHRxNU5HNnk3WFY3WTMzcnBobk91?=
 =?utf-8?B?NHZnU1JmcEQwclZFSVhhUEgva1VoeStiWDR0SmZYdnl5Zktqd2hkMTJqbzhv?=
 =?utf-8?B?RzdNd29aVHJkSXRqdWNYRWNQcFBja2RDUUljeTBIRC9ZTlRYb3BKRVEySUV2?=
 =?utf-8?B?OWtlUi9kV0RCNjNGYVAweGNleHRCNmtKcjVnbEdkNzg3bjE2QXpoQ0JhcFo5?=
 =?utf-8?B?ZHFvK2MzMEpxK1N1cTdmY0NXQ0NqTzhzanpYM2tWYnB0dCt5YnFsZi9UTUhq?=
 =?utf-8?B?YXdVekxxeDBWdVV6SVR1cTk3b3Rtc29rV1FVQmxJcVMrTjVodkhDVWo1SFF5?=
 =?utf-8?B?c3RIbG1PbG9LVnpKVStVc241cjRGV0Rjd2hEWWppbjVqMDJBY3JSWkphNi80?=
 =?utf-8?Q?+k7+atJGEw8LeZ1Uyx48qY1j+ymDyRvbiQ276?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3aee5cf-2647-4817-d84f-08df0205cd9c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:26.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG4M9caUXhtT63bFAuvmS6e5iyQ8eFVqJLLseM6yx4H4jaM99ufyt3yWVc799HMcAObWhjZoq3QGVwXZ7RNB2oIMxVNt0LVfvr3RdLt/wXhkVY9y2MuZONWwqEqtl38T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

