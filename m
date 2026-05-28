Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55C3AC0CC
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959916; cv=fail; b=KM8QBijksRo60Rlmhcw2+njrgcHJqnZGJlDIGKIvZ4AQ7Y7nXj51oxNbbE1b5AYccBn8apm1lL9xCIqg0BYHWPOGzDrD46mBRAnJEs9sQRVEXUS9fBqQ7g2T5oMR5jcneMmNtyi+AvKpw7sEI+0PQzU3q/wg+BsfR+sNo0zz0Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959916; c=relaxed/simple;
	bh=KDMd13UR+Wx+LIb3gQU7ekJb/m+DcJ5zzxVVSRjid2I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GL3QfporuKHxDEPkFYvr2tbF6IcsBxwrNiShe9/eUw3/8KBLCgjKKW2WPc6u9a7mpjhHCnLwHOgmOMTgvogx2eyVmvXKIchAsY9pFUyz7ubotvtUuooZAxX2HVAEhJnHfp7/VPbTGLKBFqz2ACz+V/iwqX1Hk6i1C+oHSGkSIPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PGFAPWzl; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PGFAPWzl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR2+E3s6tauXDYvQfMLCAhSE5YW1rp2gmiXB8BI8OSFFuwDqM7J2kslzq4NcBuy6R//0R4fWjZG8O+Cx6Iz8oBjgEjdXy9GEQjusk/FL0OmfLgyl8xbWAc/0eaVBB72s0hYfuMPUTISrjFc+gbhSJey9DnVAZRCzUVQwI0pK0VFnLMkdsoWWGD5BpPaCU3YS4MxzKZXU3peMKEGxhO4De86amRsqtlfIfYD+vgd0dAn6mWW4SZ+HM2/R0/BgkyUGqaB4N/RDVRhnXR+0P2jTIscLoyeK2qHEpzr8LhkAOAyR1+LGZU3ZBWGvqZiS1dZ4sN1XjP2J1Z0pr7mCXUL8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y2JimDYXGcTlxorQTrsYkIoqafhjefp2FiN7hefoRE=;
 b=YuMgseb5v8RmSq3YG6ieQNEc6OuS5aiSCgnzur/u3xONxvcUTbfDFlyIpQsMziq1dCzeq18QIQaWuMwqBUfj1A2OuArFoXMX306PCK1grjPvq457KCtf+nX1qTIDT8ShNEhmhkJMvNF4QeHr9IhwK+FLq2pFaqJVlinSD/lTD8tDLEX6EbpqZGsp+rCkBpfpD07N360ieTs3vepEbBl+RONE35U4R6ByHjufur2XiaN4rhkjt5phvk9uhbzdYrO8msQ1RN3CET3HVU/zzMy2OFC+Uxv5+UXT/FSi1F8o/6lKMgqB+wrYoui/mYAPPMcGOuhOA0IUkIMwCHb8ISvycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y2JimDYXGcTlxorQTrsYkIoqafhjefp2FiN7hefoRE=;
 b=PGFAPWzlLpjLwLlFw6MlRhJsA0/jhSV6VL7mk3ZpjV/NIIcoUFDzSp4CbfHA4D+OKTkYCh0b/lxSQHy9R7Wp4Vs2apyr4y/XcLJ2V5SRZo8pRiKWhJ2WALgi89zdBEVv9SLzZGlK0vxzqonH3GEYdpZq3usVI1JW0Z0Yr7RkL1ztJf8CKjZlUWvb16MjbC4kVBvLsKzGTpqN/DkhjqWeI1eZXbtcZqbTqm0B14TxMcl1saiA2v776ZtkhS02mU/8EB34sRIQAT8CbG/0Ri4j1ML3dXdQpbrAnw+G1SCya23FVlcf8kBQivXek2efCRMSs+EF6eiK5AOj7wbQBUL6ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 09:18:31 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:18:30 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev,
	frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] firmware: imx: depend on MAILBOX for EdgeLock Enclave driver
Date: Thu, 28 May 2026 14:47:06 +0530
Message-ID: <20260528091706.3331114-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::13) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|AS8PR04MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: f83d14c2-222c-4a50-a2b0-08debc9a1585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	LNd9+a2xIhz1EUsL5Cky2LjNaUdy+u+0T46FxeL/DJgiMMcQiYjJa7b37Ac5Sl1bvJ4nMLEQXCfKaPITpT5LxdJb5dnLLk6rDXuyCISLTMP2u+5A6udumDV0zWwAr8rr09FJn3pD4WG5kr0fz1VPatiLjJpMYsXbpIllvUEhfmVhTgE985Y15Fthg1EUQrt+QxK0qbvNixI2cnSlhcfnZ6l/Hab0eeFfL/Txqj35lxxzd8jJ6RsUv3SgrMXFkaFpWMOluq6tMI0ViFqdJSBEA5y2/okjY58YbxS2slgLJsyyChDn4qBliHZxTLfthwdEGHmMPJL9UTkSU/MChZrasX3ayrN5AsgGX3bebT1KQGLxTAq28LLadqi6dBFGer/hSMu9HeYO0NZKgYbMEuCmlwcPtYGKO43GmPyzyJ9hnIDQWHDCdgbUHJm87r5VytZJHWn6B4NNthsSeRjBmB9wkKFvwDiAbiLoOa6VFLmpQwwlIyuqqbksg3GXJIC1YRT6zGQ6sQxSxtZuf6HAfSvBd25/jhwibOUHwYgtgpRI/DWKBtIll+1x8xcl+sl8GevS6PTVu0vmrgdzb7rFiVmlCZD/3q3PCNx8eiBsJTqbC5MJQpPwGrhrmsoZ2njTqCxSP0cvr1wubOt5Jzmj8kVTvyCsSd6SplmLiDwP+StyT/xak+9w0t2Qpp7OHZhQDi06Y6AWjd2C+iNwqmE8WhBmY0ecVyU6aKDhNfInwEnhet2RngTA9fMh8PAk3n5cc843
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QKBGWWevcxyT1vh7xyXrE+lDTfnPON48FYsFIYxHoCfYuGBYr3NO+ga34wWZ?=
 =?us-ascii?Q?9ZXl1OpMvljSzLFzKLgdUdUj6gUZxNmSgPu497w8l6EldDI+I/NYREds1tVl?=
 =?us-ascii?Q?PH2doa6q5/j0ce0PCDOwSgi9QlMeBTgtFiEQrRklQMzwY1Ldzqy3h1lB6Di2?=
 =?us-ascii?Q?gZwxggW7wiZV/K1RaI1slx6uS7vTaKYbYbdzFubBKRXcLb2DJzdULyCHvM27?=
 =?us-ascii?Q?ivZpigcjvsHEIGUTFJLAiG9h76oCyo0kyCTWXoUNIEENpWXYdwv4KrzQSU7K?=
 =?us-ascii?Q?5Cwp0mpSOOCV8sBeQ2o3zwkxaph7uRbDQJy69NmHFSSvH6BtDRltZmxmAaaG?=
 =?us-ascii?Q?B++7UZAE9PwQE8Shw/MezFSl7g3ULCQ+r0wl8o5mhBzYlr6GQHUl2YKDf7bB?=
 =?us-ascii?Q?ONamLYAteDzShmpeHZbyYLa/dPNK+Ll/3o1D58ho6ceyD5S/Lb6MpXxDvVEA?=
 =?us-ascii?Q?u2nUclJoOp/mN1OOKdq2N+VdA5IIUrHPF/xBdw/lkqw9f2NxwYI2oUwXuBKy?=
 =?us-ascii?Q?gKmif4FfsqvD9SZCaVDm9pNrX+6Uk/BGP5sX7bGjgzIshaW8ruSkWgGXmcz5?=
 =?us-ascii?Q?eYUGt6wAVEN1kBfjgFWmzSngfqodFfjCCHYIGqJNJcBixdRpxYKxknIfm0GX?=
 =?us-ascii?Q?knqXz8mqvMGhADGPXuCc1xfQWHGUZD7XTtHhqbr4yjq+Ly4XCmYktrVRM3wh?=
 =?us-ascii?Q?VZPaq8U2uWshllH4OjvqtjJLVSYpb96VecMOIMiOSCbco+OfVt31ke83x/sM?=
 =?us-ascii?Q?BZ4SxlbwmbYIKFJb7GugHdH+M8yaCa0TTk6DmXN7hDTcDWDWpNmU2wg0fQ5D?=
 =?us-ascii?Q?yv+qYMiYp8Z8q3KkNQWtP1HDqm+go1o/Xs+JywGTeZhRW6USQbxQGLdGVggD?=
 =?us-ascii?Q?Te4FGACfysW0kHZZyBeJWJ4F61K7KLj8KZSEoSmtpIY2e7zP0L/9yI0ew8NG?=
 =?us-ascii?Q?X5JdiSNHk4fnlUg6p22QHm7aFTKBnV+RGDhjVq6njGEBkRQPybWk4awCFXZW?=
 =?us-ascii?Q?4FWf60wFjkXFZoCOmR7JkSd7WpdZaNtQ9AuwLiklKEDuVnVelH/ILlomZtlN?=
 =?us-ascii?Q?lt9mB0um5t559rpYl0rQxL9930jaeKQFBl7pKMXmZH/74Cje+yfxfAiG71Li?=
 =?us-ascii?Q?XT9sZf5Hu4Znm7+dqnpHP79Y06JVSx+BsWheKRCOVMEhujSpzLY8fdqhUO3x?=
 =?us-ascii?Q?RAfNzhaxYXLyYl/aeeS9oJ0cInIKW2pOi+0TnuGQefGRJFbygoatv5N+FKun?=
 =?us-ascii?Q?iTlCgVl7SbQp4iHZej9wUoAJ/M5CBhOL7mFwHizVq5IFdzmnV8UXDgAN5ncW?=
 =?us-ascii?Q?Br2W/g6Q5h8Rqt1qDONfIv7gn6uUCP8IogwVbMtVNQOZO9RRZJwWtgV2AqYX?=
 =?us-ascii?Q?r8nRj2HCTO12SPHd7ui5gHK33fi3ppuZ3LewoDCm7XSb0KN0ViTsjx1GHeTK?=
 =?us-ascii?Q?0n/u/GAYQw+P2zxlJF3JaohpxFPPhXARKYsFZ5hZIuy1ZNim5QoCAOSCq6B6?=
 =?us-ascii?Q?fwb8St4yXCiteCExgk65Xr40DQJRgxXKmM6NUejoRCrFELKO0/O7/DIKlTBd?=
 =?us-ascii?Q?5Hc6lbrpigV4lliK2X4Q13JxXE1LXFddZSD8IyAc4QyRrNq3gact0ZURkjwI?=
 =?us-ascii?Q?Tr+N2cu9pW8dOuU6LrIs2Or3OzBU/jmMStUeUviXoZ35rwNoWE16nM1hIzH4?=
 =?us-ascii?Q?oBfl/+dPUfN2tMqtjlkgQvQ5/AUu90L73eomPwoPf+7oVDbWb1ahKMaF36nJ?=
 =?us-ascii?Q?GxosW1PZrw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83d14c2-222c-4a50-a2b0-08debc9a1585
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:18:30.8716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SpygTCzPxf9fjZv5OZ0UoO7jd4Bueo0IbjmkMVZwj1ra0i/SqmJsTnkABdt1LEklc6I+ADnRsQBO+osVqDMNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

The EdgeLock Enclave driver uses mailbox core APIs such as
mbox_request_channel_byname(), mbox_free_channel(), and
mbox_send_message(). The current Kconfig allows the driver to be built
with COMPILE_TEST even when MAILBOX is disabled, which leads to linker
failures from unresolved mailbox symbols.

Require MAILBOX explicitly so COMPILE_TEST builds still include the
mailbox core when this driver is selected.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605270101.2FFpzoFg-lkp@intel.com/
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 1f89dd140113..e3cb7f965e70 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -58,7 +58,7 @@ config IMX_SCMI_MISC_DRV
 
 config IMX_SEC_ENCLAVE
 	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
-	depends on (IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST
+	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
 	select FW_LOADER
 	default m if ARCH_MXC
 
-- 
2.43.0

