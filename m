Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705657;
	b=vRa5onQiNS8Iy4n88cjSGZW7qoBrMBA2HG0N2kBxZ+g79EvB4b+DSGD/t+baZYlAXwtN
	 N/q/fhl6VjRRPX+dw7TxI458xiIyEBuTHkMmv3FMG7KcP5FRTC1VKf2eO+TgACRjOb/R6
	 9Vz2YLY9y8Ve1C77v3LbCMpTiQR8rEvkEd4oLAHP/t83wO4IBmFxKQcEsGCF5+zhQsARs
	 dgGzqIkkLSvaRZuTmJxgCfd0Hg6lP3JKEB0DaUs7AnF5D+LbZVYYXLry4I6i7yF3iddxv
	 YVveHBaN4Hm8z60xSvH5lu8GnvLb6XBdBkOX9CeRpBU9ufRevk2LYbZe3y1XMqi074g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705657;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hXWda2/6VG5DYNtdQ9zV3VDb3VbhqwexvOzeSA5VZIE=;
	b=YBvS3hEKTSK74RdaEHyJR1AOs0BIzegsNna5Jo4XqRK+IbRhQGFayK7jp+lgzYxCd29p
	 0LYcSUOEMfqcVDgwgZww9yXNAAPQv5gd8ZOHcnvVUguQR7aslm8lX5sFkwP4YyRYIz8uq
	 Z7JABWkMWH84u2zQRhm2elFfJCzte9DJaW94KB1Dhg+bt5rsZBB2PmVXlpTiip1wdqP91
	 Th2uh9JsS5OHAjkWQNbCRh33QUdaTkuOs1bMK0hYJ+an5Qo2IA6wSm+0xS+uwJ2QFi7eV
	 HY69JV+BjgY6/jFh290IWowIoafl8+uTQPKSh8HW/sMhjRzmakc8mPRJRdW2QUQpTtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dMfQJUMk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65618606A330
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65618606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dMfQJUMk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAIpmH5mJoebB+B6dZZy5BOJiAKc66vyTwGRmc9U6yFK+vUoqwh9v7nVOnMypP8wRT9z75ypjTV9RUbpixyV3I8p50YZSWHUD8EoX+UracTdZBwJW4ah1ZO0Si/7flpBoMthZKQR2GLoSMD3XbA9dlY3Nqi4Y8/CaoYD2X13J69dplZxLKeRL8NWiSk1YIxcqHkl8JHEbKlWE8579lnHi2C/E9sM1du5hxUMKMcg0i+Ym5AKgN0BQthYJT+3t0S/H9iyrGUJm5+YgNf2IC4nWtjxCbL04t6sZOk82s/sHv+lx+CFP1v2LX3s9px1h/ixMDBngIwTRbDTzJLHRTTFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXWda2/6VG5DYNtdQ9zV3VDb3VbhqwexvOzeSA5VZIE=;
 b=e1WqPfG3geu2Kbb4pnR1PlWavydH9m6h/jUYZal62Y0fUBYSTQpsSIIDdcVMze6U9n3XvDw3pmXCFRxSCyV7qWxMxEwgRt2o4YQlSLfF0tXCIM8gdKwQJTAL6oRaryTUyQ3ymreGdDd6NL95sjhJ+xP1bXcnHR5ABSxLvkOQl5TFFFxrcxMfcX7/OYBfCRfaujmvrYO1DYCbqfdCdkh+7CWnBr15XzvOYCCgVLp1pJSse4qHtJ7/AbU+gJ/o7WQKdCKf7rdbQ2Ut7s17xD9dS9Ki2HIhrlz5wJQpJ/5pQc0R9AmU5YIn0HF81LIW+DnEm2u0wJiaC650nLmmkjHOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXWda2/6VG5DYNtdQ9zV3VDb3VbhqwexvOzeSA5VZIE=;
 b=dMfQJUMk2izR/vxpOmuUGtVDlyHcJHIGjk+5U2matBfnt2HmKmHXyJ/3bWHgP/CDoqPwmBvqWecUPUkur621AtmjG6VkusmfBRVYU0S5rwPchE7JmfA3iLxzJwpuX85uhQiMcaUPZfnaTn1bxXZTj8MMKLxBp+Exab+deGwp6SleEvc7ss/NMU8qgCjaZLBwEYovhqJMYi1y7bbepRfBCCup8Gl7XyebNzQYUAjlKXEyQOAVx7ciWc26CJUyxLZkzkRQo1+8ZcGheWG5bZNK/wnWy0PrffG2uKpAdJT/26Gy1UrnO6umCbhgmmedCiujeNrjIUzTEgFmxAq2yxLy/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by MRWPR04MB11286.eurprd04.prod.outlook.com
 (2603:10a6:501:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 15:07:34 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:34 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 4/5] arm64: dts: ls1043a: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:31 +0200
Message-Id: <20261126150632.1560355-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|MRWPR04MB11286:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecfeb35-6a89-4170-dad9-08df4bcefff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|11063799006|10067099003|261021121427099003|261102123227099003|56012099006|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uyg8hcSFTT2/ffZ43Z4ujSdeD7FCP0qIP7fr+fDHMYEWwzVS5xLQUyDoj0WzCupj1NZy6MYQLsLWSA84c7cI1lc3pMtRfSU66Ocihk+CyHeeeNja09pI66b8o3G7XlzMOPWSRXxHj4NBvBg5Ocdk9Ekp6VPS2+UQIvIk7paR8m2IupTxnXtNsrJoFd4RnBPONPFJdl1Gxibcq5lLzhq7oE6xW7SfkNZJSYBI/74UW6Dd5bgE/1nQGxvThiCwRLttoXYsHF1nHo4866AA+URXfQQwNWmyJ6+HOY8XHmSV61XcWMqFUhPuxmlEqVchqUSntX/L6P/OItuZW0ecNd6DqBxOC88fUju5DXgZeMN9BJjhhlNcNP7VNRH7gwq4EAfiZ0iCs9fwcM/N1WrcTv23LhWhweVaTVc0mqNyEd7/+fyWvOVbf00Rb4heyYS+lLpYnqL+w8PR/1XNVj4ESnaayzT1kyoWmfd7sv2yJujNS+krquZKjFRQoIMEbbUMEQRfVOIUT1vk4O83PecgsWjBxyLoZ+LrGMr9MUf0Ok1NlTDhpGzlO+vM+kTG9ujmfyFLgtYOOsNSr09ZwJhZy9fUcgNKf9q5kBoxSmU2Tfm2ZakQD1SjOTCHfunJZv6dnJnn0Wdd+tvioBjV1V3XimqynLSQNETPmxzdsXAKAIHgaIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(11063799006)(10067099003)(261021121427099003)(261102123227099003)(56012099006)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zAiNq3EXv5uNk4OugpbNZDPYtU3qznKzjOCZLANi1B5qIAz3vYtBuHVZQaZN?=
 =?us-ascii?Q?A/dgW5Pl/jVdx5xSOGSd10kgl64IoElgUIwoNzqrDSg5VLmsy77FV2qi4VlE?=
 =?us-ascii?Q?G5oGxwTihqB9fKrUsaTc54t5EYsrqypMl/ffbR89XWNCj3w/y4DDgxFLGtyQ?=
 =?us-ascii?Q?qgd28Q87ZCxdrNQxtCQamDYL0/AQxDv338ED5oEk2g5O2YBU41++f4ewtEXt?=
 =?us-ascii?Q?aHG/Uh/C9YzsUThO0GKoqHZ7urGTMwuDxo9H/Wutq+zqezsr9CzzNGju4o3q?=
 =?us-ascii?Q?/e3cLJiOMP/xEgm/rWhRWWciqoJXqX17G3NpgSrzAGWA+c+pnF0Yn6g4K1BN?=
 =?us-ascii?Q?tDKymwHAjcvCvOiqGEj50heXM9JGI93z4fDe8CcpS+f5G1tDTYo5ZhQSZlz+?=
 =?us-ascii?Q?eYxnh/pv0jvF/9+9poAJBNLMm1rXaf5IFA+VMshvxVF7kPZm6ws3bEwRHbkb?=
 =?us-ascii?Q?6YAE7NUb4nFQ5CZ9ubMk8CXcPqvIKfxAc9rRvbQOMQHKF0JOZ/SDWkKcYpak?=
 =?us-ascii?Q?TFgPVzXOAv3sa0oN1Scallj/Tv5jm/CDA7nMZ7bxo3RNHWfaMbx4hVMn7/CJ?=
 =?us-ascii?Q?v6qpnCiPGOtMjZOi0qG09gaEvIynZuPPQ1ulaYhxudfnphYYPbS+tYxwtG18?=
 =?us-ascii?Q?YRVMJPmPRt44Y38fRp/N3248oUQwvj6ZIoxwkKWaifVTIcl3zUM1NhhdxZ2g?=
 =?us-ascii?Q?tCc+bb87ipZKlrrQ7X0Y9MZSjjFqouQn3TH8v3Wl0WXMVL2uWuXb7vGGv48u?=
 =?us-ascii?Q?qqnNXyk5y0SplYJ9HNTFTGGiiSipyV5eFEl88zgZHYBpR5DsKfbfvGQjNjm/?=
 =?us-ascii?Q?rPJzQhyWSmj+5tqSV5rMZw7Zu7iI3lJ5Tsfz5dQjqMEVKX1vTtdRgT5YqfX2?=
 =?us-ascii?Q?MP8CwkfGvcoPkxG3Vrhju57Eg4CiHOSJ87Iu9JNidpC7yE6SnFXDIYINoYTy?=
 =?us-ascii?Q?Z4VnzBuFwfFhWP+/8KwaSzshqkdMpccTt/sH2xTws/gamQSOPzLFOYUkRT2x?=
 =?us-ascii?Q?M4IhVC9tI2DzlQQcLKIyeKeZNrqFJwf0FxvtqY0b1blsI6SAq9TOtcIwwsNU?=
 =?us-ascii?Q?gxUTqeFLH9H61LOHQCDMpeexJ4n1DRlFl1peprTjjP+FEHgdMwkpAPPnfBfq?=
 =?us-ascii?Q?nud2uFidhGRudSyfkPVJARJu2//Mf5u+vETzsfMOS69g1WZ8+YUYRPbkQ0x4?=
 =?us-ascii?Q?QvSNg/xuJmF6dWLf+xigoXPELtmCv911cmXOsqr9CVjfHajPeUVNEtr5UReg?=
 =?us-ascii?Q?BlOinxtTu2f3k8YOp5/dz3/Tomv7X3X68VtHwgxffJnKRhHvP1VSXfvhiH8P?=
 =?us-ascii?Q?bJg13iw+fE9LwlBDM99L9TccXK+sTyktTW6CWzGNmT/3RbeSfX5fsHIWqmJH?=
 =?us-ascii?Q?W+O9tWLCGFr8YfHbtK23LFHQexBNI1HNcS8WVQRH+4QjLOb1tPTMvXu0qrZS?=
 =?us-ascii?Q?pUiMeSNlLz7GFIaVpGCrSTMaD5kESDYTpypHIGZpEgA0QUT6y8uxTq6O/n84?=
 =?us-ascii?Q?vi2aEV5JuIylCq1xTFdUHipuAkUR2hVNkc7amwuWy1878v4Ob7OeNoCEDETK?=
 =?us-ascii?Q?gFKPcMlp41/da7DXrxzmDk4CmCG1KmdXBtTk6sUZHpXGshXWuwk2ZXG2e7P4?=
 =?us-ascii?Q?t1QuLKm44/6tYAZuVxLYjfSdHYXiLiBgp7ZfwgFbJvCpp7kRBW1It83RJ5l0?=
 =?us-ascii?Q?yjbi1VTexpSTg5Gcu1MdXgkGgnITiTWgHWCpnqrhsyOgnMxATZrF63QjsjmD?=
 =?us-ascii?Q?/J0MidVJ7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecfeb35-6a89-4170-dad9-08df4bcefff2
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:33.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlJl+F17wHrXZq+8/F1z7FaxtgvEDeCohxyGVpTf5wYGDhTv8z8Xt1hbJ1I3VpThpzlkHjSdq/KvUK1ou/+4Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the DCFG_DCSR region in the DCFG node of the LS1043A SoC as
well, so that the guts driver can make use of it once RCW override
support is added for this SoC.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 50d9b03a284a..c5ea5f212be3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -399,7 +399,9 @@ sfp: efuse@1e80000 {
 
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1043a-dcfg", "syscon";
-			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			reg = <0x0 0x1ee0000 0x0 0x1000>,
+			      <0x0 0x20140000 0x0 0x1000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			big-endian;
 		};
 
-- 
2.25.1

