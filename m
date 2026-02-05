Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60159330D4C
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770276823; cv=fail; b=kNC0nkhTG+1+Eib/9PTKO5t5L4fnE9/IWW6MyP+7h0/ocnnPUjVDHenKUAstov/3wBiptNQ6zfr8pz3SHBUoQl/PhcTzuWLX0OlRGWiv7yVG0BpmGaGog7HZcgwq1X36iGl+XxVUl25h9HYx9VI71PyoC2jdzySBqTE7VwDzryY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770276823; c=relaxed/simple;
	bh=Mv/16o8tbBLGIjKCyDt0yzdaMx1a4blGLUOjnaW4oT0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a2iJpzPw01vpIyBgr+fqZT1P2g+pDUwqV6DjQIqSmchQjrTOtmJeWRM4kvhlmisW48f8IHBS4ZAk01wxD9JGvJN/urFxoh04fIobg+rFmS0GM+VNca8wemLeIoYv8uyHj4DMRj3w2W7uc/ReWvdCtAbiIsGqAsqQwgmT/Y9nm6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Svjqb7a/; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Svjqb7a/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIJF2kKpnm1kQtMPvbMFtIcK2S9R3f5LXUptHqLHvpO0nHfuYza8lTKTDg8PtvQAQGgqPB0xFI4AW+mvaOWiaNznCUg4tmmhxrr0VSZSMavmGwfo2o6+bPbKNoYrDwpK0ADxDcdHABAbb/9xjvxEJm0hSzs4X6mhRu1fVN0aY8EEUfnAehVipP3uP0qsF8qpCgKdsgRmsq4YhmLzWcKdtyRbGleHKsSkMbjG6t64HVVduPgf15zkalYIhVzHpSJKcnn3CP5gXoboPPUeunVsAa6hxydB4OMYjujqxACg8b9Q9fB09PUwtOnnChu5iC2T/GGMZL08Zrh+EOv3UH/C7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od1djlX1THoJqqmk1vJ3FInniKDzm0CwoY+9aMLS3RI=;
 b=TLuiEKQGBN2xst5aMBbyjsKimK3ve0KDT71eYl640+qT82LUIkqESyreIqFzeHO3WrNxjiDFE/yfdBInkTS4in4mAk0jtVupaNyTbbGRPyDv6xHqVKRp3mpEZDGtY73Qo3GgAjIUA5+nPjykjOiHUv7bAK7pYwaDjjdlFryErS/XFArdTYqzk+6Rv+NqIhF0wxaeiAg3tn2N1uP4r4r7sD7WDa7Mj9djdTzup+X0WSmTnru1DkCsWcjWdaqs0D4jqcdxJpTkEbESL3E5et9EiArVgfETKlzm3QDdBv2Nj3bvE2qIfr3P91xBodJh1ro1dxirIoU59+UWlEN6udwfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od1djlX1THoJqqmk1vJ3FInniKDzm0CwoY+9aMLS3RI=;
 b=Svjqb7a/rrSA/ffThyjM6Ibk8isqtpdlB3Y4J7vexbyoaGuOkGXzUVgz9jVrAG3Zlz0+CxIjOK45KWGYz9P/HouOz+W9jcDSMatzVOxd6Os6G4vV+AYvSEoEriUEHS/QWu3gcXjxJkF8LRl6y1ZxLEKnOzM5TWEfxSEZIgbz4lR0sDzGPMCMRumevSBHOqFbOgnnjZCSFjM0NzOjw2VguXJZnITRW0pflSgsU+uDhUwsG8pGVu2wUKuMaxAO9uMfXkK89sHaGegs5t9OP0brGq/2uXZpdMHQrOtJgLkaj1yV58Kn4WgnXbiDqogdHWXq0U53KKQlOjiKtNMADt6eGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6806.eurprd04.prod.outlook.com
 (2603:10a6:20b:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 07:33:40 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 07:33:40 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 0/2] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
Date: Thu,  5 Feb 2026 15:34:52 +0800
Message-Id: <20260205073454.3709673-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: ef057e56-c28d-48d4-60f2-08de6488e1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I8tW9YbhA+NYAfW49ClYgbbxbtoYVx4cRoVKwavhK4ceIf9nyBx52DBR1007?=
 =?us-ascii?Q?ZDeU2s8lmVB6sFwzKLAHi9jiwj6Nei3U/rDnoKPL1grGnaK0T9P2OyjP3uxM?=
 =?us-ascii?Q?UYJ7luObvTeVrRGU1rDRAqax5vqEY/VW+ZsJw7ivFgVOQHzrmtCJVW68YCbR?=
 =?us-ascii?Q?3Vp2V4+/cP0HE/ezCtKI5bBDOF8IFSybZiJwO4oQDZwcug/Bb/kStOpewGqm?=
 =?us-ascii?Q?3WVR0FzuYozTElmXrduqmeDamqUx4EEgH/2HrhU76l4O1dlXtOHgx2ngUMnb?=
 =?us-ascii?Q?upNMv/W1UueZC1KExbuy0r0BWIRVnELzpf313pBF3gMRMwuy4WrZ1ByhYCvt?=
 =?us-ascii?Q?BAWqEBCnFNNnxzUee1NX1Uy5BztcI5V02r3Y3RA4jNulfoZupK3xjYJgxHKz?=
 =?us-ascii?Q?HBNu9WhPVBe22qOLGTjjhh1ze6mEweE9V2LANEeOgZX25XFugaePaq2NQTAM?=
 =?us-ascii?Q?AeO21CfgKSmw11iIwkFjr4XAJW+4mdVQ4CTEkAe686BhQmsk2RLtd6Z0OkHk?=
 =?us-ascii?Q?wYDhY/zP3dcek8mi1N/vdGVVAorV0GhWcrgMGSodKKd5XiZxLYXFx/zfYcvp?=
 =?us-ascii?Q?GFGOdD/0CTBpmLSr+gfC+blxHxcqtYhwjkEmchm8p8ALry0ws8nW6o5oqzgA?=
 =?us-ascii?Q?bqKspWtEOqJqBquEOfw5Vkc41Kc1Y5Y+1S8rqICXPr6ieaO643lWJSe+ImnQ?=
 =?us-ascii?Q?BdGzkW+7M4UOBeG5m0cpUHx1+Pm80puscg7JiNnNiIWF3+h6/RL1zOAisFpa?=
 =?us-ascii?Q?sWtRArKkIiO3K5yg4GyefY3ngSTFo3oQ2Uc062UdeV5KGZYwJDU95ignws1h?=
 =?us-ascii?Q?a4DZw1z+wtk2weB68F3kzmmoXeMrN/TT8MrelcmeT/WeaeOEmECOKFAV0tIk?=
 =?us-ascii?Q?MLi0fHhDuyKxMZAHdvQ1Tq6LlEYA8qkr9cXgTgIvnwQ13VoeuDGW1WDdZ6cR?=
 =?us-ascii?Q?RpZ7pzrc5uWlV6CyEROlI6vcPCfSwvJm9PhYfJ6ibjXODt4kaOIBiqoty6DQ?=
 =?us-ascii?Q?5Nhk+mN/jDUuWV4hrhhw/ZCGGVRRAwzwiaqgo6AxWqNAKBkO9GUPX5ZfFtEW?=
 =?us-ascii?Q?DLWRipxSp5bzOi8YKl8ZNNv3BIy/+Cn0uE9klptMXIFXtAjVRLi684VZ9bRE?=
 =?us-ascii?Q?238nnpQmTpQHUmeWLdAW6RL10uswJOKi1fZj1/9c8VKdkZjRdfIpXn1HZKQ3?=
 =?us-ascii?Q?Y5tZMv5vCs6/dddZk/zfQr/tprUVR3xg5siEkfkXsd3uvtE/mLLp057G59wS?=
 =?us-ascii?Q?89g9dVxliTauHGUp6as9i4oFbm7f29Qgy1BhbhiFv5E0t7u6bbMfwFgs/3y4?=
 =?us-ascii?Q?JHYutro+4zXrs3R+0zZyi1N6mgukSrakaAlOwuWHXog4NrOpFNO1B1y06mSv?=
 =?us-ascii?Q?DxtJ1vv+IUq3cd6ufEaxpwHc7FSlK3TEjneCfzEjRxdKdhnYKoQnjy5I5V8w?=
 =?us-ascii?Q?T+/MjpnrLWyfOQOqBLcW2yrQIGJY9BCYnTaMPMSfCvfU7AGI3bmJxYn2Y6q+?=
 =?us-ascii?Q?PXXLZrYLZuJ5N6WudXviZKLTx7qJeRH3AeC4bRCNLHZVBR4hposJhvPdpy43?=
 =?us-ascii?Q?MnObB62Tjj1RV72bXb1vNA5Hai4jPu43j4ZvJpHWa3TqsUb8/0G9yN+RpMT/?=
 =?us-ascii?Q?p11cIx0rdJtgNTwpHnORkH0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?prLhDTcqEzGCGNoO8IV4sF/vbprecys3hcjuclVJNA/ndbEGS7zPSUi69nT6?=
 =?us-ascii?Q?WbdZ/RxdmGTpEHD+ONoQO00AQQOVnJ35MYOHopQFmnJCHgId6jfWx+GfQMsx?=
 =?us-ascii?Q?RFgHbPCwXaEfa8gmJRT7je06hAkHJpcpIHEF5y++Y4LdnG0/s04aSQfwmfVy?=
 =?us-ascii?Q?kGJMQhKi/dVxMJnmYkXS4EksXD2qcH3lDLNVpnyiYQP4IhjAn91bTRQDnjcr?=
 =?us-ascii?Q?dh2TDRp0JEtcPzY1W73I1Sc10pkQVwnAgO2/O6FXEnKIAEnEQHrmUSDDQ4zV?=
 =?us-ascii?Q?eDu+fIbHKSMv9glrSqUWooBgH3mIQ5zn0QKjMJp5ZW6oHvi6dEBn+4o8cusV?=
 =?us-ascii?Q?Z8/6FmzKoqX1v3naTPYdVQKX8sSDqk+bD4yPRcFqa0OOKOFFcxoC4fTFlmx+?=
 =?us-ascii?Q?Re1StAJ+EHBxLoze60KDr/OQezbRe38BHfKzNM9x8K2yD+/s+nNmVcAjpInE?=
 =?us-ascii?Q?C6al8vk1lEGxYyfjdymckpcySGdaVWtas5F3iTJj9eq3031qG8oK9QnJOaiu?=
 =?us-ascii?Q?6Yzv8Cutzvq7Z6XzulQhlhwVACDK2OdLKRNM9Pap9XPxV0O+ehv1ERjV9XQY?=
 =?us-ascii?Q?xuXW6QI1PZQa8zVqFHjo2DTqRSjpE7JSnKmxzKoaiWq0RNBUVbbW+726SzUh?=
 =?us-ascii?Q?V02+lCqtZe2yKCuWSSGOOxkWAvLO4KbfUhU06IKHk+UHXA0HFMLs1jtfbce1?=
 =?us-ascii?Q?/bhIdpgrMehma2cHvdQn7KCoiCFzwx8Ud5OxghoMcGGkrPj92Y8aeqtZfWeQ?=
 =?us-ascii?Q?C2dUEYCYSL56de1Gz/iX2ATswYXb0BbgRTzhPsXdDnNg5jlqzzu7N34Np55r?=
 =?us-ascii?Q?jzQl/3L1RToD8nlxFAwSMG2Zy01W/LLtavFZQTpidlVXDh5v+y5Yg5m7J+1H?=
 =?us-ascii?Q?odOGgOOcG1orWzaqt/zczvyf1L3F/FXfrIM4yH457Lm0PHMK5SMpsFU/aWnu?=
 =?us-ascii?Q?sDgcX+uCTM9tTX4Wctbt5v5VcCJ7YoUJvicvENrIiF5X5h+bIA4TEIfaLOwN?=
 =?us-ascii?Q?dOXu0TKW4l7xl7H3FfCCFKqhtdY20IMEhJ2qdh0ObOrbqmqKdtIRdUDAgefm?=
 =?us-ascii?Q?bGbncXIBsd47jCxDx+c2+6Qr19E2geEBgHpRAD3tpR4Z+KfWIFGbsT1hZjCI?=
 =?us-ascii?Q?0wvVRdb8ErgOUzFxz+1m0eLBC0wwyD/Kkhuy5+1+iTKDDbBBRIIO8MNuywDX?=
 =?us-ascii?Q?QT1WYIZ8e8HB42OlgsXzCnjrG6Q3buhMv+Wma4u40g5bOHxORu4d/MszwRPH?=
 =?us-ascii?Q?cA5H84vLTDy/5D7VtOA0gxmQ/lLaVdmZAub3Xua7VrX5jm46EykEr9laJser?=
 =?us-ascii?Q?aC4665rgb+aoxs+oMunMn8ZuY02RKoarA+kwHno3NVkmqPhL/3xNrHBDsu2m?=
 =?us-ascii?Q?SpP8blDM881alzHeT3Lb9b3pBI++NNtkVvl0ugpkoHrBpKxiFahS6JsfgJB5?=
 =?us-ascii?Q?ob4ychxfR+eiW+cvRkC5Qu1KQKNHxePgvQi7Y0Wy9ZE/qMJ9FQ1zyYhdb6lH?=
 =?us-ascii?Q?GTTW79hFelMKD9eyFhh/Ct8T7dRYnGP2HLXhEWCJl8FOuG9cBDRi3xTu+Pc+?=
 =?us-ascii?Q?tsm+nrLujW6g+RhSj5YmUupj1/NKtnpeiVneRDXtyy5onK6tqgDpba++1YCR?=
 =?us-ascii?Q?i88jp9RSKQhON7U9pml6JZnwomED+kKdv1ijnf+jWnKdH0FiWcKEM5In+wb5?=
 =?us-ascii?Q?fepg9JrYGWWXD62kWcm9upvnayeMDDV6T/yqN+KcmkHYVQu12TZEbC3AOxZX?=
 =?us-ascii?Q?AaPhdNUx0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef057e56-c28d-48d4-60f2-08de6488e1e6
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 07:33:40.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4qVvzEy5keDn9/jGf1YeNqm7aPAFqLko8LHpc386yGYtHBAuwJwXFuUfFMlQwI6OLrNEB+Hpsw1n5jxK8s/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

This patch set adds usdhc1 support to enable M.2 SDIO WiFi on the
i.MX8MP EVK. The M.2 connector on this board can operate in both PCIe
and SDIO modes, and SDIO-based WLAN modules require proper power control
through the same M.2 WLAN enable line (W_DISABLE1 on pin 56).

Patch 1 corrects the IOMUX configuration by enabling the pull-select bit
for the M.2 regulator GPIO, ensuring that the weak pull-up is actually
applied.
Patch 2 enables usdhc1 and associated pinctrl settings needed for SDIO
WiFi operation on the M.2 connector.

---
Changes in V2:
1. Add fixes tag for patch#1.
2. Remove the patch which renames the regulator node from reg_pcie0 to
   reg_m2_wlan, instead add second label reg_m2_wlan to simply code.
---

Sherry Sun (2):
  arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO
    (M.2 W_DISABLE1)
  arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 63 +++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

-- 
2.37.1

