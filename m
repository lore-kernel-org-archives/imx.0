Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E1518159
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088976; cv=fail; b=MjNSMCBoY4bEbk3dQan1Cp31FwpGcKbwKqjOoZ++yjrvVFmo68qTyCNvCPUrqWonMZrtccn4F/7n3MLnxFRnwSV3/AYZM1XZ7GlpT+a1nrehaImnS9l7s/jw4e7gyMJUOJtd9tkQntxfxU5r67aXferxMFc2DuFhK+kNH37dOig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088976; c=relaxed/simple;
	bh=2Qq9GnDnIs+uGh05jZ+UoqfZV7o9Dxp6+azpsx1xOGE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CNgAT9mCz//rVrk5A6LubRysOkXxI1r/rPTsj0Q5Vh3H8WHe+Kk6ZMfLeAjM+cittaIjLt6/GvdRclVCY64DQACioPEk5Z2BRMRswx9+5e6acGAiYqZPQx9eM06oOUPsGuUQYrzDRT4rlqgqI10H32ICrb3Myj/hHcDofAR1eUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AXRReQDp; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AXRReQDp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPZbNMDC91VZjobim8OqcLqSWIlVSaBvNjDBhMPmEospd/yjaMl3D13dI28y2c9RvHusaN3Em8v3WWe8EH3Us2XT3es/QRZ0WjcSu7hSDuHZH5rW474coJsIk37G/au3+adgKwWml4hiKMopKyntT41IfbMo+ld4W2NJHvVeXKuOhYO+RcZnC6k6IYR2Gd52EJQLRXeXvSwZ+k6VqpPXrC9ENlhRopKTZ2Jof+iRrhfEzccpGLQHym3dC0YY6ob88CvvLmD/IwZs0YcRRxD9wvWQ3oj1H3ywQV3rC5c2lTNMAa1yi07kTVUnCZXhLTwCgXhJuC2Z476AYz1RlQMq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5kdI1ZCWVWioI3fnPr4kUKevXHYurIMQ79y+mAHCK8=;
 b=dpveeVKxVrks0GqRV/6JW4L3LkQFMfTu8SGFwxISe2tM6iUN7HTOdKHCs0M2Xhawt2po++eElcjnqQIuQrKE3dgNOx0wz0EDdN0B/RndWWrhv79TYU102KxGoJDNgxbHHo3cU+UwURI4sJGiKRysJOf/pn97UE0Y/dumt5LtoSKgHN3Cj6g569TywhmtdYyR5KNp+pEvV2AdRAhPttC5iWNJJONoAJgZYCbGN2woS0eyzbMAxw+2cFGdVLA0C01hKsPuZ0T8uZYJG/ZvqVZfyioi2bFTwuSsD+UHqjbkQ+Df3antn9UR2TpNFEhYWYMevrDZvgoxkldwES3wTqPPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5kdI1ZCWVWioI3fnPr4kUKevXHYurIMQ79y+mAHCK8=;
 b=AXRReQDpO62X+mobGkv9StO3AlDrJpxAVC/UwuNw1gLSc0jlBwDo3D7ggTj0ZbcQMD79vXDsnaLXEoh9fVoVB/jyDnIZvZ2DPhwQj0hCqQz5zrhRAOlk/tw2NpdfzGZfwpIzSo/29e0WT5sBfljNk5CordQXyZ4PI6EIlN4rZbMiwacOsuf6BE8Vm7fB9Ffd7blx0MdE7AHrzNZdiSfpYAaZHJ08pE7vR6ZWQPlXsthMLFRR2W/ZYbWsq2Jajps1QovRumNy467fpAWaS7c0dV6pkA4bfiNoIzmCdGsRPBxAuqP2Bp5K34Bn8+uE+bmIl8W6W/gFeyJZv6kCpcX+dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:56:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:56:10 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stefano.r@variscite.com,
	vjardin@free.fr
Subject: [GIT PULL v2] iMX fixes for 7.3
Date: Tue, 22 Sep 2026 10:55:59 -0400
Message-ID: <20260922145600.2249087-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4419fe9c-406f-42d4-0a97-08df18b9a388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	QF9Vq9WhFqsbmoadoTQf/0Lw17ee+Iqu3FrD1Qh97qKE3u7Ewt67GL+95xQw6782SGgxMAqaT6afMqYPxRWjYyQQ8RYq0QNFknMkIKMuWgsX2HbUSFSFJ8UEp3uOtOaBUZAz54Ua58QXpb6qYwhmjQlQF8Wh5G9ALYv6nc0gFaXcrFWhMPU9SMhqvaig/cYt9CRyyeN3J9t5yJO+Jx9aF/V0d9EuDNBLBtA/wCBvuBdeA+pfuVR1M4bDGneB9N+tqapL84ZtfseYbWepN9MYwMTNPOIZIDHIrCwqRSHxU+7DWHbZ5yWaKvNAjAw09xl0LF/6l18ZTlXZzeUhlc4BGkQb9ksUsRAmLQYiWOm3TT5OnDCxROmJ7qzDED18uZfRyn1V7vaCS7uNO3cKbMjiAn45qhpSlugyLAI8f+/bb+VbOkWOajYKeQZwA1XgeopFGQ79T0q3jSsqHV4jyMgCWR3JTd/JKTSiZ6szAnRggq9ANiZ3W5Bv5L3gAYf/Ae23cMwOJiXti5Ud57NbwTDHU6hSotrG1IWYkGFt0FhK2ZHCFCXqaRQTIHIECtWE3mlQOwso7XyoMNHs1gKLp1RTgbbuGbovqZCiIJXTe6vJMb9kPgfszDVUEVQJCNLFtp9nE4GQHj8C0z5p8MM/HwmDUeEnWSlrzptdJFlzYKbzVI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DK0TOiTuVHPwwGrMlMrx4mjPmMnYnJo4wq2saMLD/sb1R75Zm0iKKMlenpDn?=
 =?us-ascii?Q?tJp5n7sLL207xe944q1dDsbyB+RZNx1vIV4oKeFUT3zYFw8YM8CnzvVN+sCn?=
 =?us-ascii?Q?ZNMFsGS+pI5Wo8JK1VNc9PVEyJ8zrxgtYmbfmbG6xuNx62lvo1MHmK65CvHP?=
 =?us-ascii?Q?6dF626HnP2rPgTM/hh/Xnzk+DK7DT7FcRLGKdWubqPfiSB0syLW1VVlVcOZW?=
 =?us-ascii?Q?68kGsncI0nLkgzvFVWgdrvo8i9eq0ZXGw6iwYarRQDKgTUO2cm8o0hI6frWK?=
 =?us-ascii?Q?T8gb/ILG+dPsgqpVP/2QG8S+T8LkcD74ooA19Oyo0yVwF1vBxaA50aHch1Kg?=
 =?us-ascii?Q?yhJg8ANhZXWtm2RksbboKWnrllBghDgoV1GVNbif+pJqy4trN3Ne5aTlEyjG?=
 =?us-ascii?Q?6l5zJ/XoFrH3ubDc5D9/M8MgvPqPlAa9wF5VfhjYAtNJNMd3jTLDpptPmT8T?=
 =?us-ascii?Q?b7GEVgoe0DP28F5nkEbE1LrjWHps+JatZwRp4Kk82OmUkR3kJISycHk7QuBK?=
 =?us-ascii?Q?sinRA6W7Cs67Ih/VhoFgivF6WDrODmYetf9Z5+R+CXkpghM25+ipJQNNfJcm?=
 =?us-ascii?Q?2GzIWh4GLVZernv+q4NdLFcaacydOkYvqr9mgcwq8yYrn6RFnHJ2c1mFMlTK?=
 =?us-ascii?Q?rvIEKb6sTXr/e+jnMAIABo+97osvO1X9KroWjNfcoiycSteePWjXmOc2hjJe?=
 =?us-ascii?Q?JT5R5pHUid/b6WRVy8TtL94gij7Q1xiSYCyHebDvD2fGHDF+enZT9aNof+9Z?=
 =?us-ascii?Q?oVtaMbpT4Ju9To0fKWuWoMPheOjvGZceaIW5jk+neRpDC0c+r+Lqwtq6cJhs?=
 =?us-ascii?Q?iB+S2LhdDst/6RmRV19JdmGoi3p6tdh86Z36U56wBLz1IEP1sRpp0m+3QOWo?=
 =?us-ascii?Q?nOTTOWy3Nd58GIGdm4CmZBSP0i6qhW9k1qaEPRTWrFw7SGca8kVzlg/TrtWN?=
 =?us-ascii?Q?OufMpGArNFf7mHjl3gEGnPCBywD5a7sWUho/6m/0HOdrD/fcS/0gUBhuzkQL?=
 =?us-ascii?Q?dedszEIF/dAK2PFWxA/p8pxbFNm5BWYeqOXYHYF2fqu3GUQvKUao9zFqZUuT?=
 =?us-ascii?Q?jwgdpHfC+rggeYv0tQBEkyuBZKD+qJSE2kVNGyUsBF/R4b/q+7L+PlV42NEv?=
 =?us-ascii?Q?rxUbc9m6/esumiZSVZ4rp51Jexqmr3DUfoiWO7nN65fn30JXYKE0l1VEtf25?=
 =?us-ascii?Q?CrfnKDsSj77UgQnSwHWc2T8Rq1iKgOPuuHX51RhmAlpvtWue5BxNSjbRcr1k?=
 =?us-ascii?Q?omjmrDUWbzeRpVDOaTUlAO3RNlmLC5i6vKZrSiOzgPfXTDUOdxm/wYAuM56x?=
 =?us-ascii?Q?XiMR9l9bH3LrfxQPLPwDEtkmHA4I7hvh+UsvaGR8MYgOur36h5e8kYGdDi1L?=
 =?us-ascii?Q?+9rACAGpj6R3tJpIE50D5LSLIPq/od4KJagzRTxIkZvHuKcXXGpKZWJqFY9J?=
 =?us-ascii?Q?Adt4MvkgntTPsviox2IMOH6PIbdVJSE+G63UM5NLQyWgjJwTU2SEhSCfNFq/?=
 =?us-ascii?Q?5pew5e7EYlCbc+LPFAWvYu9YZMav27r0BWbZ+44o5J6IUunzmGOdwmACMXts?=
 =?us-ascii?Q?wZudKvt62qljSH2hcD9n+rSlVtqg5sldJx8l0oz8Nf81nfhJDRLAgODxz/Y6?=
 =?us-ascii?Q?7rOrAipQKriyczblSwkljrsdiMxQCJu7s1ohhU/7sIONWeXFrYwl9kvDHcq/?=
 =?us-ascii?Q?eFp9f3q9qh/w75j8hcs0qNl5N/opu0FzJtkTSOetSdD3HyZUHTuS9WSnK2tK?=
 =?us-ascii?Q?XAloArdDWN//16wWh3jn5k21lvEY8UaBEDhdrVoycFPGvHeGh3+0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4419fe9c-406f-42d4-0a97-08df18b9a388
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:56:10.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwLIhbR1GAojKKAivny+k1KuEIZJk4KnjbeM0Z9mw4nzSmE33bvLcddaNP+Rgs8PuRr08cCOg+qzRMhbkamY6Mw3NSvAdX/S4NSNsnHS8ZdQJfB+ren5tjXCBxm3SvP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.3

for you to fetch changes up to 7ba5290db6bf365e46fb70bf13dc2a47048165ea:

  arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply (2026-09-11 14:50:09 -0400)

---
v2 fix tag name, for 7.3, not for 7.2

----------------------------------------------------------------
iMX fixes for 7.3

- Fix incorrect pinmux values for LX2160A.
- Fix Sonata SD I/O supply to avoid filesystem I/O errors because the kernel
  was disabling LDO5 during late init.

----------------------------------------------------------------
Stefano Radaelli (1):
      arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply

Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi         | 19 +++++++++++++------
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts     |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)
