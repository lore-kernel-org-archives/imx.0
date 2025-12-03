Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927A1E832A
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745606; cv=fail; b=P/Kk8XuQaIhi5zZ4zrC8l24TCEbNGNt8yZrxa+dyxS2IsOvRb5TuT+mCEuQq/d1v+uzf+SSnriTthxIW3v0qZLH95rcbeW+5vccFhfSnZ9nWbETBl7Q0AOVZs5iangxH4JnT9KyZ7DQX5xE7BzhcUSDsKZPv2XotXZu9R548guo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745606; c=relaxed/simple;
	bh=jULIU7wuyzIGzeO6KP8fdFV8gOAjRRfLRkQWWxIMHh0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qSUtKIdLbZQMBXzdC2JPSt9WSSmluIodPNHyUHRtrh+VVdR361E9pNO37xbIvL8wMhytIEjwvjvtgr0f9mYsSvIafGajrktcUbaDl9I9OOdbZrTEdma23ifPVgYF/PdaEKc6c4yDu3D1UlOF7WC/T+HmOlxYE5DSgpKu4pWt/7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CtYp/Fad; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CtYp/Fad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sovs+JM+f8aXeNh5979aS6c2WvO6eGBTEEKwI7pEaLIHTViAztSw6PXwW4wp/JivA38qTJzp6t5LQKv4oaTdr4aGjSNHXQ0Ey/3O8nAJgX38jRzXaNAnuwzR3e/qT8qHfZ85SpG5NuxSkD8ISF13G3i44f4SJZgI5i0mlSj7KDnGOSSWxkrwXrMS3ChNHzt/46tq00IVQNtlHUA1C+Kr3Ug0aUTo1s47GPlnu2WMGBSBd5jd4lLGzxif0BpxlMlGglPVz2F9buz1ABdYlK3LNtoxYrES1L2X4kzu/2H27oNvlS4iqxQgDNeS5nvH0rjYwlxHXG8y8p9VMKh/kV97FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCkwVOXNSTtWL3H2l2QYaPPlFTIyqM4GGZNFUx6Kzmc=;
 b=uR7tiU6Be3yIJaazCS6GYPIfRZUCXAa+4Lv/x3hK11jp1hCD7gTH6E5eKJO+Zy/tHROybPNvgMgkXtSx27Ghb3nw3TbWCZCdBJYljZpwRqoqAu7A5fHnXBs0i/8+bgRS5GkS0ZaVoa1WDVn3Ix477GszJijcUwbBk0I01PmLOyDOXThMC3zIQW8vI0Sx5yak1qmA1GAY3HK4GjTCLr5TJIDW29HiL8hC8B8VIqJzOV5y6BTZzhJdDHHX2J0nJJFnLEajzjwBUkC90fzmj4sTpPVUxaXm1L/If5dcdhZkbEsoioQMjILayzrnAupfvUkDVnKQ4D6xSbP3B8k83wuKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCkwVOXNSTtWL3H2l2QYaPPlFTIyqM4GGZNFUx6Kzmc=;
 b=CtYp/FadwgooIqbXYmZatzdOLFkDzULQQrLrx0YQLGZr2W7LlD8am9AWtief5PMJ5QZS2uI9LEPBtLbQS4ZC2OtCbsShTPnSr1Z7gSSdQOhP8zmWgzfDdjMq9Gl6cdaJ5y9csVueutVU343KybeBC8EaFPDiwHjXJJC9yHbdBmFZpgiFl47wJU9a+3fz/MVz6tUTC3VISnTpdG7VCtRtsoT3ycjFwGpFeo+ijsB/6y6rLuAXegTztjG4yMN8NHHRM9gPv3p+X9GRo25tSi/gyEpBtq6hAE9jXsFwfve3vUblxOn6qyozIFOQurwhGGJjPvYTizzn6Hw7uyKLSgtJuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:41 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:41 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: imx91-11x11-evk: Add audio sound cards support
Date: Wed,  3 Dec 2025 16:06:00 +0900
Message-ID: <20251203070605.1868821-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 178a0d7e-dae5-43e1-31bd-08de323a8279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0u6XBme5ooQGgdnK/z/K/DAMV2yxpT/BtWwv/C4jq+P67AlMT568POkrNa9b?=
 =?us-ascii?Q?P6ezFjfHmsBUyk3foYMQzYBe8fWDQSfQgcT3GJT4bAWD3vUHezEtmy2LUrAs?=
 =?us-ascii?Q?1nFKwPNIbqRx0vyzqOBbDaWkr/Rus2DKNWiu36R6JMZlYRlC+o0gsVpzOgDL?=
 =?us-ascii?Q?JOq7bGXz2iFDR44xALQ5hY9nT55HQUz7Xu5m8vccmu8pK/n0lc95umFjMwmB?=
 =?us-ascii?Q?oZdUQRhW6Q1ZYlOZdl9BL/rv98gghCgmudF+1cH8qyWPH6q/kqAXaqh0O2/J?=
 =?us-ascii?Q?1oikFdRC+IyQ+H05fGNriRAjVpWRhYH41m9hfJFxVV3CDxWP0bn0x9ucqk4I?=
 =?us-ascii?Q?U201LveSYYx+JLozJmS9Eatdg7oH+EpWmQ8ZWDJJX+ZaHeavWKOOqG2ay0ej?=
 =?us-ascii?Q?MuiVx1cMm2vEVv7yC8iFgKlfxr5Hx99KTEmznRPAGZij+jOhCNfC+N4STxa6?=
 =?us-ascii?Q?Ppy2SVF95cPrNsV9B84T0R1r1Q2cps4N0cmZyKvcKyuicZUNssc4WDMrTThM?=
 =?us-ascii?Q?03LyaVlQ6eo48PgPLWUUyXvyCmPrRxD1DzlQ+puEHWLOXKmSi9448CadNt2k?=
 =?us-ascii?Q?wRdi42Weoh7uMggeEI8ZlK35v943mi4hmbEX3W2dfYdzcD6u5agS7EezT4r/?=
 =?us-ascii?Q?hA3XjFKsN/niV2zc6ChtPngFYVEtvgzvgWSSPzTVMQyuk2lZuu+J4SUwQ5Tu?=
 =?us-ascii?Q?fvCN8mjD2u+o+ls/oNbdOea7L2TFyafG+yAnd9NkNoVBwwcpv2nc/qOLPYL5?=
 =?us-ascii?Q?GP4tmYMeU/tmdqnx9gqbaQHyGsKjZT9NjZmjX8+xYgH0vn8pVYRrQYu6ROdx?=
 =?us-ascii?Q?5LbWA+ZLWqgEdc3olEylNodEBXuAOgggHXbtitc+lQgEeAdAaNvp6daZsvWJ?=
 =?us-ascii?Q?mYNTRQKHJAZ6dHTTNPzfaJdzo74EQgXxzGOu+uW02zYK+mnexqkB+LusPy8a?=
 =?us-ascii?Q?UevvzT8Spln8AqxQR2bGOIRgm6buU2WPjtJ0uzy0V9HUmNYUn4dh6ijA86TP?=
 =?us-ascii?Q?B2DnNaK+nkx3pzSaTCKGtVtrilqXgBo7wKViDyu41IX6H3IlI93X7IIB69dl?=
 =?us-ascii?Q?hP/zeLgNhg0YWejRl+Hwj3MFmDdOmKER4waz8noEblFkziIEcrdNoD4oV4OG?=
 =?us-ascii?Q?iLCnF0jIaydYWz/NcUxJ6xibSVjQhm4IIhw8SvWIR8eUOlKAsiBVlwurjZSp?=
 =?us-ascii?Q?gAhf85GIV6OlUfJx2NbyTihMo2w9jwEA/8g9cFp4Z15jZEicJdk3S2HjNnRP?=
 =?us-ascii?Q?0Rom1TUsStnxkh9H1B4A04o06oUAEtXn+KNfRwM4hg3sJtXrQoa82+5dgOsB?=
 =?us-ascii?Q?338b67CHo6Sx248uggreDlX0G8IEkls0KZ/oCKVEbAwdu+1tbOTBc+8ovwJZ?=
 =?us-ascii?Q?fngqX6r6rFb4LVWb2HHgl4rHoIV58qjMHAiR4ZIg8KabYF9UeMeAZkeJvJtn?=
 =?us-ascii?Q?romKeOSgl3+Nvh4tz8ozepI2OnLYWaTHY2ZvXZAgw3gLhbksHBexOX0uphXS?=
 =?us-ascii?Q?qsyabIR53LS++Ln52+F0Q6FhkQT8rjBakkQxwHawJwTO4Ib62vbC5aXHPQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WnyCzw6rcA7ZWQinwRLxDPuvfx4VphT3fowK97b1h5bsc3QjrbtByveqKriB?=
 =?us-ascii?Q?WLcX+ZqVypWIESxAzybEJr0MRcgyKjrotsjHZO18xhH0wu5MJtPsRu5lRzxR?=
 =?us-ascii?Q?rDwVdV3T4DcuNdEiMisaLoNy0e5y5kCKvIzIN9nlHSFZiW4QY7nW09m9GaoV?=
 =?us-ascii?Q?fFISmrTcbOjWmqloPYpCh6Q6iP2gXt482W11EhUiNuQcSMYJqrDk644wTj7Y?=
 =?us-ascii?Q?bCyhCyw+x4w0y9zDicgD0VOOk28TocjNmrZcqHr8IDQNrESnzhClP1X8A+J6?=
 =?us-ascii?Q?cr3ouNoe0BaXXXVfVSksp3ITGctW36XAd2V8sGdXXr9sG7YEdLeaeJHoITFr?=
 =?us-ascii?Q?CfxDrBIUSPJc76xsdZdIjZF+04wUr2pHcrpY9sS0bVlzrE2r+JdES99atiIK?=
 =?us-ascii?Q?hYHbwkmlWASfROE9yLEnZfXAGq6fHxV0CMkEoU7GiunaDOtl1qDvCrDx6nZO?=
 =?us-ascii?Q?+vfml7Rg17OermxMmClK3pjFB7MFKzT1UZwhaA8DyevvJaeE4UbmNzUm2tCl?=
 =?us-ascii?Q?MLc2fHvw41coWwMwZppuBony4JGMu5gUSLWUOBWUoOQmw//h3vHW++Bdzunu?=
 =?us-ascii?Q?8E7h/6devWQAop05IwLDPU0Cm64ESsCsQtGbC1db+xZ7fclg+5mSfWtrUyZk?=
 =?us-ascii?Q?JqoZR8jOlhW00A4hJyCXIl6bLmz0FA4oYtOmh50XTckGOzGp9kf4HNavTvg6?=
 =?us-ascii?Q?8yAPehOzFgUFaL1p4BDtGgwRHJyi6sdN0vFnSpdjdEeImworJcifV+R1gWt3?=
 =?us-ascii?Q?KTrBY9Dy2v+HGPtBkJMFbT/dzjMn1q1F8NhsdW+rHad+Jk2OLCZq/D/DD6AF?=
 =?us-ascii?Q?X7+NYzMXFmnwBPoYsrDygV6aXSZSErG8b963xhjbWEG58hByXHc65G2vGb0s?=
 =?us-ascii?Q?W7e04Fhv3+Bexf9KJJ32Myj3VbpTXelFg44O14PLTF4eX+GU0rhs2tnDU6AX?=
 =?us-ascii?Q?kMQg/2QzHCNVFVYCOwk44fK0XB2TA6gd4Z/wN5WZ1J3AIxKvzCitRP/bmnVi?=
 =?us-ascii?Q?tuF9VFvrtMxvzWEFel4jo5blmWJ1CKKhPeqnN7MKo6dtWaep3U76IKoeHZKW?=
 =?us-ascii?Q?ZBIcf1RWvQBY8bBP8iEX7VFVz4+In2Sp881V/QuyneoNB08L37MhxuxMy6C8?=
 =?us-ascii?Q?f+EqDSAlwSHzheati6k6i+LVJZi7JcmPYsNfobjIP6EQ+tldqj+gvqaZ0HLV?=
 =?us-ascii?Q?pBdhYotMrWkVTjk9hJzl7u2Kj89blFJOeHhm6JquIHTUpS+kH0RN+ayCeZBg?=
 =?us-ascii?Q?XL9zaCeZXfbyyr/2ZC7+GcRhYjZVKTqJCfB//Zp1Z+ECv1hVCH9ggZ3Vs6SE?=
 =?us-ascii?Q?WRaipYPPJ326KGdbxBaEtYO1nf++OkatHugkg47peWgR6fzWERDeJuMHoxRs?=
 =?us-ascii?Q?Wyg/Hple7PPXXHaz3FijoogbtE2ZZyhA+LcSMQuo7h3lbwmWqrItJ9I/k9Sy?=
 =?us-ascii?Q?XKBUm9FGHTwcS61YwkmFy2FTnHvEAgcFTmyftiv+XkLdciEfa9WGGBWO+uNu?=
 =?us-ascii?Q?YoSaaBFYNkE6oGwHsRwUgrFDL6b+RxoGNiOsOntvayrGRGwcZ4z8HUM2oAX/?=
 =?us-ascii?Q?hYliAdTBATbqTBWNkPA7Kp5eSZNeGYeO66yOaZgM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178a0d7e-dae5-43e1-31bd-08de323a8279
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:41.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U478dAR2hHXKTa+I18WGE6evjpdMtUKEMbIvC7pIhTYyzV/xDt2Q9MGcUy6L1vDmSLIWm9115srmnn05u7bjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

Add audio sound cards support including bt-sco, WM8962, PDM microphone,
and audio XCVR sound cards.

Chancel Liu (5):
  arm64: dts: imx91-11x11-evk: Refine label and node name of WM8962
  arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
  arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
  arm64: dts: imx91-11x11-evk: Add PDM microphone sound card support
  arm64: dts: imx91-11x11-evk: Add audio XCVR sound card support

 .../boot/dts/freescale/imx91-11x11-evk.dts    | 181 +++++++++++++++++-
 1 file changed, 180 insertions(+), 1 deletion(-)

-- 
2.50.1

