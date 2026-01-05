Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED29326944
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613756; cv=fail; b=K4KJM3z7h1Wpk6/fi/qTUX2P36bl/rrMRi+B4UK+/sT9mssWl1TAungJIW8+pCocE/lXp90UmEGaKu+/cVGiBi477E7CXQ1rc7kMTWb5YomXfcf+oWYA9182liKmaRH/jji1dFSeGRZmZWaYDZ0usUGsV99vpvoJFkUTq+dYOPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613756; c=relaxed/simple;
	bh=6CvQ1zrHvKhnpoSS+QirrQ5IRNLRrxWc7u4TndVoVIk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C/JLcPcqQjnGPnE+oFH6rcIc//zoa8L6Mwsv7x6bnKqhvjxLnax36/tJ8c+K2njZp77YQGfDC5ZLJme2uU0T9gvl8daUOTqRygAXfhyh4Qd1nAvqEmCyJsKtpWdAgdHSIlJnlHKoZRFcvOW9TQnqb+YMXHN6cAal7VQ+8EXxGyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HeqGkWeW; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HeqGkWeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmqbN8XvL2LVS9yQX8N1hmF8lsbKCVgvpj1cRmCG3oA7Z7rAGzWR0eOLC6c4ECmtsm3SD417pl9eGxb5kpip7NCClhZZ0SMeDApJF6z/TpfkAKSGZHuIAWLEuuKmlbQDJmgaSNaOBAG8tB9ZSc52ZZrSBnbDVvrq2LymReSRqRfJImFrFGWRP5ZmV2v6Fsy9YWD51ex9gv9cZ57TScb111Ej1qbF2KJFFheBIDPBSnj+KGCRi9wnpZ0uRqkVxlCEVM4/5pXZhEBgH2Cey/eNDAxUbNeZm4EJFYvXlP4rRy9zsZbTMj6DA2Az/CHxlwzhy8F8BK7Y9gIWMC3p1rmJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydIae2gZBJMAfV5fakbzA9Vu+Dc3FDoM6zoCuetWDWk=;
 b=MuCHhpvJSyoOObYB3vvzHIjSZXG9PCk7E2wrxJjtlKvGibAAuvvXbit5hxMkgvVFk6X0lO0a/v/4VZM7PYHsLorSaP5O7cLn1lY+a+7rnOskX7l2TV9o8MGDVrByhSt8aDWpQidaUWPQVQkK+znRG74JXU9OKq/53qxZ3D8GIUCXQIvDNn2w2eNGeY6YdaQ578fgncDETbmExHeGDynyVkAhukZqME7PUgB7mA18jWB7rcFfqMicWEmrxuQyy+TpzSzzeXcuKvAk+seZjHrTTaH7WDj7nQuyKsd46X7Jx4vhHRkLhWcnxK5rMBFZWwizLXuYMi2nc/PEiqrYyVoBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydIae2gZBJMAfV5fakbzA9Vu+Dc3FDoM6zoCuetWDWk=;
 b=HeqGkWeWqDdzHeU3keiqWzWwOYbmmucYq/3JBWvatFWnoWXizLFXFFZZWs8kAi6w6tiWOClHipi9hn1fmGiN02ynlP+0yiLNSLxnRUlXtiggGSLd0pyB1otdkal9kOIvgYazIrvK6hAksyZuxig2x5RmUwP2I6rtvABuIYjBbcEcwbqgaSvk6xKdxk1tgO1FugoVVWU5h0He7BblF4vaTrhU/RprcsI3YEY9hsgVqLqXHa/C2hVEGbyRJmYXlXZopxNrNfNB9f0i7reoE6rPBrd6EZSWjbFPaLOBOh9JY6pyaIwof6ozCzGreEQXF55lUvieqgSSfY1xuK0ftgwh8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:41 +0800
Subject: [PATCH 2/7] arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-2-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: d4dc3941-6124-4f36-b6da-08de4c5070af
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTAyUDdlNmxWMlY5ckJBMFh0VEJlQ0s1NEpmUG5RVmhFcHR4VHhiRGJicmd3?=
 =?utf-8?B?UXdEa3RNUHBEckVHNml4Qis4bUxoa1RlYjhpVjViTlNNNTNGOEZFQ2s3QWF6?=
 =?utf-8?B?emlGak9JQWdQOHBVdCsvYTcwak85cEhXVUZ2Q09rSCtNcTVRQlBIN0N2Wm1W?=
 =?utf-8?B?YjJnK0dEN3k0T3ZNcDV6WWFYd21mem5wWFFsUmZIZGo4WDcraS8zM2U3S2Jv?=
 =?utf-8?B?NUhuMHZUdThFeWE1eUYwSUVVOHQ2TXJtQm9EMkp2aHhiYjBRMmVHckFvT1hB?=
 =?utf-8?B?QXNNUDltbGFLaDhleGtZTDdMT0IvcDY2Y3gvaDc0ZEN5aFhYdmFJWHI5NXB3?=
 =?utf-8?B?ZCtLR3pFQ0JGblZZc0NNOFFHSGMyRm5OeHJCbUtWSXFsQ2RRYWJQRnkwcldH?=
 =?utf-8?B?WVJkYWF4NlJlSjFOQWpqaHBLYlBjQUh0T056MWcyVXF6N2FzL1doemZXbm55?=
 =?utf-8?B?Lzh5ZFJieXB6N2Z2Uzh1bWhYRnlHUnpkZEVRbmRxRVhBUnZkT0w4THNiMy9R?=
 =?utf-8?B?TlRNZ3psaGFSNkE5WkFXZk5zWHBwNUp2R2RSS0Z4ZWVFNE11bWd3Rks5NkRC?=
 =?utf-8?B?dHkzNFlHUUQ4OEM1NWRreGhPUGlpNDZIUVVFOEwwMVZrcjZqdy9tNGpVK3la?=
 =?utf-8?B?S3FvUkdIaFlPNlo2bzBacUtOc2JXMVZ0c3dPblFUZ0R2S2tyRWpKS1M0Sndz?=
 =?utf-8?B?Qk83N2lteWRFV2NkVjN3b0REUmJOS09jQk1jWnl5MXRnYWdETXRwb2k3NGRL?=
 =?utf-8?B?aHMyaW5zaUNoTXlEUXNUYzdXOFFoY3ZQcUNScDkveTVpL2J0azRNQVBvME5j?=
 =?utf-8?B?Qk9GUzBZTjBueGJNd2tOUlR0VkRac3V3eWp5d1pYU2h1ZlpaYmRtb2tacDBn?=
 =?utf-8?B?dEs0VngxMzcyeW5sbjBnNVFWRWprNVo1V0JGZjN6M2t1RjVWN0hzdWZ5Nkds?=
 =?utf-8?B?N3lTWTlESkF4ODRYa0lNTXBmcHVlR2VWWTE4NU9LdEVTY3hSMGVVS1VwNFl2?=
 =?utf-8?B?SnpJSVB0eVA1L21XVXdKU0JxZ2xnZ0tWUVpaL29xUjFGL2hmNnIyVjNrZE9j?=
 =?utf-8?B?RlNaSVp5NHZNM3Y1UytZY3ZTL0ZoMWI2Z2czREVsNjVhQWFBUkwrU2hZOFBq?=
 =?utf-8?B?T3VSN0UycDZWOXlZdWRtRnVHM28wdjl4L0lyUlFGREs2dlRXN3ZrU2tLVzB2?=
 =?utf-8?B?UUtMajBYb0dCWXJJRCt3K01VSWFoTjk0WXlINXFMYWRUbHJoOTNHeDZPTDVF?=
 =?utf-8?B?ZzZIYXlINmFRVWtNaWRYTWpkZndreWo4ZUYzNC9tc3N4Um1PMFhJT2U3dEhj?=
 =?utf-8?B?THMxSmZoR3ZFaER5WXRGZXFleFdNM0NSbzh6RzUycXB2SjlMcHZlbXRwUG04?=
 =?utf-8?B?MHJ1VGw2Wm8vTW02aGxhOThNY3VVUklIN1ZMRXowaE5mbTduT1E1UGxlVUE3?=
 =?utf-8?B?ZDhRVXZPNGtoZTdlYVBLcjF3MkhxYVVpWk5hK1ZEZm9zZUowa3c0UExqSFBZ?=
 =?utf-8?B?c2FkaFFVTXBNSStUM3FGa1VQUjVOSE05V2NNdmVHTThnUEJhQVBjaDhKM0Zp?=
 =?utf-8?B?NVlJOUttbTM1YkkwU09tTzVpOHFZRFlnYTdwNW9zQW9OdGladnkwS1ltY2RK?=
 =?utf-8?B?aDQzTFlrelVQQTV6dDBVUEs2aW5vT3hWbDN4NFNTOGFZcXhZK0M2V0g4UTNJ?=
 =?utf-8?B?M1ljTEVrZktaMHdUUTBNWVVkNTRTM3UrSkk3R0Y1M05lNlBOUTdYTkNucy9E?=
 =?utf-8?B?SVFITU1jTm5rYktlK2hEVU9UdGRGSXNQcTRGK21CdHZ1SkRQRkZOWGRub20x?=
 =?utf-8?B?OGE2TzBWL2Z1WDJJbDJTaElYUmJESUNPTWVBdUlYQ09jZkt1cnpTRTVkbXFV?=
 =?utf-8?B?WVBGZzBXZUpFc2xSYjFlbWM3STF6YnZWZytxTDdyRTB2ZHRTazVDdzE3OTV6?=
 =?utf-8?B?ekVxemxmby94S3VOTkJiaWo4ckJIZzk2Z1VzNGN3UlVKYnljSVB2QVp3VjBZ?=
 =?utf-8?B?UVV2Q2lUeDhxRkloN2ViQVZNVWFoSnI2N01qbDFlL0VrekN6dmFKZDNnQlNj?=
 =?utf-8?Q?TPPaYP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3ZTM0phZTY2SHp0Q2Yza0QwL1BQd2JXblZmWEhpRUVuYzFobll0UmRuMVNM?=
 =?utf-8?B?WWNwMjRWem9rdFZjZDMwZFhoZmQ3L2xOVlpWQ3V5clFKYWFIU2pCb1p2bzhO?=
 =?utf-8?B?aEZITUFoTUV3MHNtZmZoMStNQzJuR1p0OE5mSzdHWXN6MURKTURsRGlRRnhi?=
 =?utf-8?B?SVhhOWhYbmxKREFCckJpQkZSc2t3Y3E3c05yZ1pJT3owbDBTOGJPelBTbDQz?=
 =?utf-8?B?TDM4bUJtUzVRcEJ3TVp5N0l5NXZBdW1VbU5nL2p2WnFIdGJUVDdXZlYyUzQ3?=
 =?utf-8?B?eVE0bmpyRHlJQTFSbW5WR1lsUEszSyttZjJnUlBJMzZMbm9ZSWZZRkhBY1hZ?=
 =?utf-8?B?SUVubG9waDRuR1JOSERtcFVNck1DZVN0SzV2SzljN09HZ3pEOWE2aU52d0xF?=
 =?utf-8?B?Nk5walhaNDBXcGcwbWczbnk3MENHUTdQQmlHYUlhcy82eGwwQk5IMjhoVUF1?=
 =?utf-8?B?U0l1aW9taGRrazl0dmRjUlRpWlcvdys5aXcrbS85OUdKeVZWaXltSy9CZjlL?=
 =?utf-8?B?K1FXcTZ0UllIanNNNk9kZHRSWi9Va3pFbzl5TnR0RDEyN3R0RzZHaHIxNHpF?=
 =?utf-8?B?U3VHNmNIWEpTWldRRTJrM3hXazdnNXNBTmFKVUFqNnB4VFFGUGVsYzljdThv?=
 =?utf-8?B?YmlwbmJhM0NWWDhDM2VhNXVIQVNLelZpUDNyR2JiRk1aL1l6NkEwdDVoenc0?=
 =?utf-8?B?YjU3V3ZaZzE3cHJnQTlKK2FVR2lpMjRNdWZSMHZ5V0t6T0xtTUQ3VXg4elI5?=
 =?utf-8?B?bVpQUk8vZWVWSEVZSUJCQmFRZHdLaXI3TFU2Q2paT0N3dCswTTFEd25RcXM2?=
 =?utf-8?B?M1RreEF1MjAwMjhNT05qMlhxUEQ1Uk1XaEo1cENRellMZEljd1Z0cStLQi9S?=
 =?utf-8?B?MjNZcEE0QTFYNkdYY1g5VVFUZk1DajMzU3B1UloxMTdvZGxFQkJEcW5ud1JQ?=
 =?utf-8?B?TzlvUDJDVThIdmFEZG5ZMklHcGFGM2VGaE9YNXhOU0RWRk9meUNPY0k4WWxk?=
 =?utf-8?B?TEloaGdzS2x2emcxTXVYWUw2MEpTbEVUYXIrUm5BZjJxTUZMeGI1RVRzRzVr?=
 =?utf-8?B?ZjRlV0ZJTFU4allkSUJHYWtSZ3k0OFkyRmRoK05LMXI0c1IxTnFZNFIveHVn?=
 =?utf-8?B?ekxaUjhZV0RhdUNRRnlMREdPMWdMditGVzZFc1kzZ0JhNDF3MTBZbXl6UmdY?=
 =?utf-8?B?MWpUUGZHRjJnT0hUaEcyeXhFR1V5WURHNnNPand1Q2ZSelVvMndRQ0FPL0xt?=
 =?utf-8?B?dXFGVVYxS3FYSlFHYzd0eXhsRGdEY25QOWxINm43VEt5RUUrcVJ3R2NzMFZX?=
 =?utf-8?B?ekdvRzZiL00rMlRjODJGMmExZzFtZG1vL2JVMEsrSUQxeG41N0V3YlViM01z?=
 =?utf-8?B?SFlPcTlpNEp6ZGFYcjYxM1VEMXRPdlNGU1h2STRNanB5VEd2MGZLQ0pKaW4r?=
 =?utf-8?B?YlJkKzZiSi9BcjFMVk8xcmM3UWZZMi8yaFVRbno3d2NiTHJ1T3VOeExEcFVr?=
 =?utf-8?B?M1U0ZHdnUFpBRFM1VHRMUkU1TmluM3RKTmwzdHhRM3ozUGVNV1RQYzIzWTl5?=
 =?utf-8?B?RzlOOHFzQVloZG1Ed1I3TWNzTVFwYmx0aFFEeEFsUldKcnJVTFYySGl3MXhV?=
 =?utf-8?B?OW1OZW4vdFNqc1hnUUxOSmpZVVY4ejJTVkt6am9RMkZXcGVET2V4RFk0S1Jh?=
 =?utf-8?B?SjM1QkJicUllVzhub2RRNTRGOXdHZkVLYVRYVm9Xb094NkR6ZFJsZEF4Q29X?=
 =?utf-8?B?bTE0TzQ5LzFPL2NlVWhVUUsvN1kzZnY0c1NtV1JEWGVuWERBTGFSUDhETzNo?=
 =?utf-8?B?TVNGSmgzZDN1ZTNhVXkySWNkbk5uT1M5NVNpZlZFbzJKL0d1YWY5eUhMNVhy?=
 =?utf-8?B?RGp4QlZhSlNZZkkxd0JmbTVNanNSenJlbzk0bDFaTE1BM2VySkNkblZqT3U5?=
 =?utf-8?B?aFBNN0ZnZXFJS2k5K3g5NWtXOGluWlJad0tHbjJHM1VOMm1vMGc4TzVnaEhF?=
 =?utf-8?B?SjJzZFJXaWpPOStHYmVmL1psQWtuQTE4RWJ4L3lYdTB1MlVtTnBWY0oyN2FF?=
 =?utf-8?B?M0xjMlhlUnVVQzZWTS9wdDI5VVZtZ2doU2dJekZxVFcyTkh6UE5HcEoxV3lr?=
 =?utf-8?B?ejFhTHJSUkZBZWRtMm84NGVZaWE3bmRMNVZMSVdxZk1XdkpuQmpYeUMvZVk2?=
 =?utf-8?B?bm9CSUZmLzUxalFmL0xwQnp3TnplWVB2cjJxQUt1ckNCTlZUaktScTBXbTQz?=
 =?utf-8?B?L3FrRHZNdUhVbTZmNmp5RGtWR1oxS0hkbGFXN0x0MlZObjV6cHRKa0tpNVpS?=
 =?utf-8?B?NWpia2NXcFhHMk5IeDdUVU4xb2lKVmsyc014azNsK3RpMGpDWDhTdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dc3941-6124-4f36-b6da-08de4c5070af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:10.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLRD1+ob9IxChw1sHe0ekDGZ5CKsJCmGpjTFKfX5weCQYB+um2NGNVPKpxfAzWFJpeuh65sTOk0/DtLi7vJt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

From: Peng Fan <peng.fan@nxp.com>

Enable I2C bus[2,3,4,6,7] and the io-expanders connected to each I2C bus.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 166 +++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2c753fcbae3c5d545f5d835bd70492667061d626..53cbdf8389b670e9fc6d294e912736f51dc35aec 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -17,6 +17,14 @@ aliases {
 		gpio2 = &gpio3;
 		gpio3 = &gpio4;
 		gpio4 = &gpio5;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		i2c5 = &lpi2c6;
+		i2c6 = &lpi2c7;
+		i2c7 = &lpi2c8;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
@@ -79,6 +87,111 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-reserved-ranges = <5 1>;
+		#pwm-cells = <3>;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	i2c3_pcal6408: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	status = "okay";
+
+	i2c4_pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_pcal6408>;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+&lpi2c6 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	status = "okay";
+
+	pcal6416: gpio@21 {
+		compatible = "nxp,pcal6416";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x21>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416>;
+		vcc-supply = <&reg_3p3v>;
+
+		pdm-can-sel-hog {
+			gpio-hog;
+			gpios = <10 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+
+		mqs-en-hog {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+};
+
+&lpi2c7 {
+	clock-frequency = <1000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c7>;
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &lpuart1 {
 	/* console */
 	pinctrl-names = "default";
@@ -112,6 +225,59 @@ &usdhc2 {
 };
 
 &scmi_iomuxc {
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX952_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO00__WAKEUPMIX_TOP_LPI2C3_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO01__WAKEUPMIX_TOP_LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO30__WAKEUPMIX_TOP_LPI2C4_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO31__WAKEUPMIX_TOP_LPI2C4_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_i2c4_pcal6408: i2c4pcal6408grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO18__WAKEUPMIX_TOP_GPIO2_IO_18		0x31e
+		>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO02__WAKEUPMIX_TOP_LPI2C6_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO03__WAKEUPMIX_TOP_LPI2C6_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c7: lpi2c7grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO08__WAKEUPMIX_TOP_LPI2C7_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO09__WAKEUPMIX_TOP_LPI2C7_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6416: pcal6416grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO36__WAKEUPMIX_TOP_GPIO5_IO_16		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e

-- 
2.37.1

