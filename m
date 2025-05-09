Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3926D4DB
	for <imx@lists.linux.dev>; Fri,  9 May 2025 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773019; cv=fail; b=LmrYKIQ8/UFNwRgc5JQAcGt9tAAgDOVkKFS4lhDIvxHHo/MKoMPF0HAozmnRBehCIdsPE/RdWXAK3UsXtWGDbXRSQkymO8PYsumlgmqJ32i4ULgeFFht/W57UX/EQ+XEjpzfPPX8+KGAlq2bYiPUOToU9CjvVxQzr5TjoBpRgbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773019; c=relaxed/simple;
	bh=jI+fcOwKaID/aDptOcXZMdJu0yXVqOHMF6jLF/YXLPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YCrlrDhG0QquvvfTzS3xQo5zObtKeg6IxJFLGICvfcG/Rgzx14MvX6zI2zgBr7oAiFanor8A0Gur4DYGNaWB5MhV16mHu5438zO64hx1DYmq68B0R8YaDaJSG10B2S6lD6iFUNGnuTrati6DjLgq21k7aaHNKxC4LLWBp6FwdqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j5D51KFf; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j5D51KFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOIH3cG4DFm7kEK9DzRgHsy9hD33bocPYVDwXxSU3NmY2D6UjhNUJ0teCPLyEJB2HRsr8RGpOzcxTjLBs0j5q3QCt6RXwh+/lNThm8OevFR2LPpZ/DPyZoWXEFAyXeqgPmk7eeUXr1Om+8lhZPmoIAF9ibMEUXEW2wnen2336AvzNOzA4jmLarxW0t7FwXPPJxtqrohX5/JfyVO1CDCZRt+HlNzZdHQetvv54FOW927SzfB0wAxJIckjKqm3jF9irXQXBvT9mwn4GFskjqy4DY+TxFj6EDuIz9efAQ3ZNFgczN+gEFnz2EkemmPXftjC1RTpxI0835W8nD7+ai7VOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIRo+nLyHHKA1D99K3CxAA7v75JFr+ZJ4aPK/YsL6yI=;
 b=in9b37QK75+oHqNqPQ/bTQqytb2o19+nWwqHHIP9RSOspLSJlb4JWDdzubuEW5nRP2AsAQGeEDpkN/KWKOieu2SpM4aXghsz5LA+P604piOTqMDp43Pk69ZVdEwYYMMfFr6dVE85NvxoGAHA+GBkspoXT8oSwwMG1BWwV7CbdREeCqUw8gQMnYLwSK+t7El+n1hNgZ29Ok0IfGHzqLkpw4yNVjiuT+J8x1roXZ/SWGs+Lx2Nd6UzmqKLYR5q+77O1mMFGLFPGJ3HsZjvdMeJbg/AfnpU/6HSdU6PONk4Zb27Re+etA1ToENlB98QGWU+v6TykSK9JprlOEt4sxcs5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIRo+nLyHHKA1D99K3CxAA7v75JFr+ZJ4aPK/YsL6yI=;
 b=j5D51KFfImgp9pBYyxETyFMV9cEG4Z4c4eYrR/ZtLTAODArSlpz7j20+jcP9CXzzFXFWE+/H/XTydTVIcmsrjbh0WYbAV0HjF74N6Omu9RUtsyyVc4tlV5XPxliU3rLQllBDembxmL3jtjdRuTtSKaeUJxdxaBm8Ceu7jzXM6yrh2Ks3jz2JTEcsTMGTPcNqhn9Exl4VFz5lopTqqd/cj2ifTmqDwOEJdo1o9SRi5bQFCVJoUBGu84utjP/2X4J5fh9SSjHOs3y07NCLaYYc8LNavost8WukyeXezNn0n3o673asbyaCwNRIyDccoS+epqJG5yXwUpC2SuOhLfHzFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 06:43:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 06:43:35 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 2/4] dt-bindings: extcon: ptn5150: Allow "connector" node to present
Date: Fri,  9 May 2025 14:45:24 +0800
Message-Id: <20250509064526.3767729-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509064526.3767729-1-xu.yang_2@nxp.com>
References: <20250509064526.3767729-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e025609-2017-4fc8-0ce0-08dd8ec4d255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nv1vRR4bH27NG4La+BOBd/oQDLLk33QVxHfZoohD+mAviLUzTcHiyfTDl4aL?=
 =?us-ascii?Q?odv0Ky76RbXdtpqjVy7700qnHsd7AuzEqXtA+YXX89kKgt233lI0OvCXQ2FY?=
 =?us-ascii?Q?WvJDcrzXZNkk5WjV+IV+f+77o9vxPYuLkxlu6qiJ4gCom7DCHDaD4+WVwkUM?=
 =?us-ascii?Q?BNX6dlBU/3bD6gwHxYU2XcwFSl7pn8dGNDi/exe6hRkEZBTwc4q6MEeBwDaC?=
 =?us-ascii?Q?Pi4c1aQFVF4+26drvO2qxvDFjdvrB/1QWY6DztIpsEVq0cm2+aVRUuqz+ijg?=
 =?us-ascii?Q?kUByiWNpRZAFmEGqbC1oLB7WwHoAF0FptgYzq9ywiuqyEk5fbqANtbA6+sY8?=
 =?us-ascii?Q?Qaf/taLdyDRICnROKWJiDmqd4f4UPfkctbHBHdTyul53GtBZcb2gEZ5Vdmdq?=
 =?us-ascii?Q?GCR+rnI70NGTQQWdITo9xWVhQ6HG3pyyM3uJYCzFLffRvcUFPtyn1p3ei42D?=
 =?us-ascii?Q?3JwwAQxS/KE/xOir9bRfRhMMBGSj1ND7pSRNfSWK5UVw0KbHkU37wAEO/gjg?=
 =?us-ascii?Q?t1OjFVJ1JBsx5bz/7qCac0Ja8ksdLLVodaszu9cfmHmbJIyzcaKa6UubR+n2?=
 =?us-ascii?Q?O9ewbjcONV+qn6XB5SHykjMp8AjVQ0KkFlQLCe84/q90T9KABR37F2nHNs2w?=
 =?us-ascii?Q?XU08Hxk/zdcUejZ7WGzPO4i+szL+lPYuDNAwLz7dOvppTmPhqBykAcZ7f3xn?=
 =?us-ascii?Q?UfbN6XLjweOWBR9L820U7Mifjkq1hd279FkfdAByMeo4at3gImpup+CLyfBN?=
 =?us-ascii?Q?qCsqu+yLVQOxme/9hXkgN4NuJ5YRJQomT4A25qfL9t64oWjbTu/6afdcwOFg?=
 =?us-ascii?Q?QCzTMl2ML4AaOo0wP2LhG6ljowFNmVRfsdzBDpnazr19OzEmQ94Sld06T28W?=
 =?us-ascii?Q?8yb+Dk7Z0nHuDgW2UTTCPkKra/PrUgA6MHzOAsUuCESyZnoH6huHf1P0lK2H?=
 =?us-ascii?Q?5xFljZ8AHDsXVGsKbaNZD8sTyXfGDVJvrHSoqPxmfjRGlM/6hg9Ak0bXV1/m?=
 =?us-ascii?Q?zJb7QHvIl+hKm9VhHiOvSX+qX/IMzRURZFnDNem/9dA7y02HTt3efREerX09?=
 =?us-ascii?Q?SZzI31hfFH4D2Uwq6+K+mf4+8Mnqq14BrQVHZyYqjb8AmXuYaqfbUSS1+wnX?=
 =?us-ascii?Q?dY64X/NwHOBlSLPT2zWFRSxmAt89uxFnXmMEuihoU/C5H3wgnFZYf2UYOzwv?=
 =?us-ascii?Q?gDF5w1aFhvgdfgPknDRRbNtfJgxbHBTEkrrsI54U0TwhhqcDcN+Mv22oDPvT?=
 =?us-ascii?Q?RCPZuMSkWlnY31iHVX5rkXq5s1zqFgU1jAgTEkCJE+Bkdn8p/Rxr9pAgSpz/?=
 =?us-ascii?Q?BuH8csJdf9d+DFVSDNrukysgJTV5CUB4ADXMYO5RCYgQIVF2pkXzayeqwSOu?=
 =?us-ascii?Q?aqOOIsD9lOMU9+CQIhGVdE+6lNGX7svwd4WAA2WckDmNJt8cJiJ/CS4RyjMR?=
 =?us-ascii?Q?feXHC+Y9kIWOOLRJio9Ab2uQQ/KLzGnpHQGGe3C8iCWzPRp/iOdgCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfVvtbKEllAU1XgP8wbAa1SbO6VfcaZDc4KmcATLkqC4DOyr70sNc6E4ym2d?=
 =?us-ascii?Q?iFbV3ZO4slQGjeVR6XB0M5ik0sma30zU8fIDG0qJv/hd0rl2hHopnvWjzMxK?=
 =?us-ascii?Q?y3u/E9JTW9o7jJMMKRfPnT1dQuWLcVb4avItlEoowe9ZTQ04CV6D0gZwrr9g?=
 =?us-ascii?Q?0VkMwM4HNhwDxAQhYKJMukgN2XPQG5OD5+74H/cD9Tf11GA8pXMpa3hxyt4r?=
 =?us-ascii?Q?Im0iq6LBka6x704H8SuvsUvC55L7ok/X18pJUIV4EqXlRI+mmzzox6a8J3qn?=
 =?us-ascii?Q?QoT7+yaWEfk+NyJrU/BFDvB3pxhmT7578sC23AUo0BoXJQMfuFCnHZWxT2xY?=
 =?us-ascii?Q?ohSByUObEXjJFYiZTcT0PSxSQtL7PL9sdLyVi+PGbXQtvARaGqFdZ9LHeCL6?=
 =?us-ascii?Q?bbBg7I/LqJK0GbRAdeUcd524UENbp9T+y/R/pbL5dszlWcYIO+amlXelDPAh?=
 =?us-ascii?Q?mUXsrVb1+PNu3hwCdr+SZH57qQfWTNSBRmae+cOGo0cVd/HWw8KQN+KViSeD?=
 =?us-ascii?Q?1uS5K22Z0fciR7ROE0LPJIqbf5Ocsgm2ZSeY5pJMyzYN2cftPhraw7qtLamq?=
 =?us-ascii?Q?SX0lUG2zSRq2FX0P8x6Cq5/hZzbtH8PdHpfhkDi51ecsAxpAX0R3r4CGNc8/?=
 =?us-ascii?Q?VvZtQVDc6XKmCWNMjEgYyrZlsLpsUCrNxwJEX3oVm66/0Ons6zJsu0497agd?=
 =?us-ascii?Q?By1XTqfvElvn0+xAivgAKbGgyaCKlLxK4r4WJzTZiNNmE4uuuLxFKJaPWpaP?=
 =?us-ascii?Q?tjfQcdEBYdgQBb/BAyIuYelAoOqwNiTOZsYsE8wFS7fExx3l5dxfMkGGjKmG?=
 =?us-ascii?Q?uGW7ncwYiYiLNMovuO5oVvVNal289Haq9913mvbRrPqpleVu5H2FYDIAUVL0?=
 =?us-ascii?Q?x1ZXrtOV1iyTtD/D1qzDDr1BP668MgqvTopyxq/JSpYc6sSFuU+rXzUWeUAG?=
 =?us-ascii?Q?JFfF6SSDfF2i1sec2ociknUeMHa+0P8IpsFaxivIqRu220gAyrS2Pwlcw09N?=
 =?us-ascii?Q?uyNNw1KB/9ISovrT0JRMZkXCWB9uBeN1+nUwXJ+gnnB74oDQDHtAtznWMFhL?=
 =?us-ascii?Q?xjfKT5lg9XUZtf+T0xi4u9OC1t1G5S0MDBCydWb0a95iRY4RA7uTw7o681tD?=
 =?us-ascii?Q?DHKKoHyBLJopQnyVxEMbH7wvLrzituwQaAC0yjssp5T3Gbl32WHr8sRb5mtG?=
 =?us-ascii?Q?84jUfbe3bpaqg8vXXePv39NtPkJ+n3JXp33cOcGSdWMVM8oxJyPuCgnejeve?=
 =?us-ascii?Q?C0S72x9RUTzaHJJHEq8Z0260sliAlZEVOparr4qg5cjyEXC4JtYNvDWkelCs?=
 =?us-ascii?Q?xUmIhiOEU+McKNLLWUCGseGeu8vgDrWLjetzWzGY6CxAHPvgJXwjVqvve3Lj?=
 =?us-ascii?Q?ot9a3fx6Rt625933LYPU3OOzU7HLUMOK9TdA99FKe9P7ar5qqTlqWXC2hRc1?=
 =?us-ascii?Q?BivHHpx0xofh7CFkgBu+11oDw8guwC25p0NpCc2MlZ0+DXb9jrKgwDZM5UUC?=
 =?us-ascii?Q?1DNnfJXtPLyIin+lpdhBvWq/vIgSAV117+Hanp7ulcI4h6S2ZegtoPZjjQW+?=
 =?us-ascii?Q?sMwCcUR2wrtWZMG6cAr6jvb6pcItseONBMjpMvsA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e025609-2017-4fc8-0ce0-08dd8ec4d255
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:43:35.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNmKPl2YLO+BCh1RcFtNL6ax1jIRmzrVrKrkFACF491zUmhvqPoWUKfNgNSelVbXkY+Fbg8oRAKo8vo1DXTPGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

PTN5150 is usually used with a Type-C connector, so allow a "connector"
node to be defined under it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add Acked-by tag
Changes in v2:
 - improve commit message
---
 Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
index 072b3c0c5fd0..79f88b5f4e5c 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       A port node to link the usb controller for the dual role switch.
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
 required:
   - compatible
   - interrupts
-- 
2.34.1

