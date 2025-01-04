Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F31BBBC6
	for <imx@lists.linux.dev>; Sat,  4 Jan 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992861; cv=fail; b=q7wCwip9MIEf7U1DDDC5iQhYbiccpATPQAgnPA1YP82yi6+hG7I2Qn+6brFb1Jk5uQvqTA9AVb5JlIG/dM5gMnq1APWB41iYqVwZycjbPFYScbbv47eUmCrRTyZAuIOroolrth+ArnfL4SsRQDWaKNm5O+hK4qetGgzp7BoiWBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992861; c=relaxed/simple;
	bh=NptiY2M5/tHV6LllXGXcHUSCezJynSjPOiHj48IdDZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K+eLhZIATbwgjeiwOW3xpMKFHC64O3kGtRIDSk1rUIrvB1dtiRXEkmUVY8dIi5jTTUL0B1tbeQOQzNmnV9LRy68clvriynYm+84cshck1is1uXOJ8tFG01cni7m1E5sJYv4daeF59BNuuvGimEGtqdFR/y7mwqPxEk+OXsAgrTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jTkCnZgg; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jTkCnZgg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urjBeJfrd233FLRZX+SudPcW2N6wEAhwqO45pTr/zuCv46RbuXEufNS6/VUNy0mPuSehUiex7DK92D7l8R2l4GHehiiZ3FOyT20d6OMUL1GCFslF1xoNdQjWaJEk07eXZvkCtRPw60yXv+fXmNX0aMkesU+6kAP1Jan8A35/JHoYTCqTuE3EBc6HOsq5swMaX0c+NQvqqmLS/vxfOq8qHcVmB1OuGEfwYcivj98DE0OB0fmUU8nNpGEJMQvbM9GhXwEXSvmR6ToCTf0eCN9OTzgA4rBA+vPT4sgrmVkmknw7ZOChwcKoeOlgWZSjDge5oZ3rQz9gJn15hTVYDT+c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLH1oFyUz/56XWHC/eIy9q6evxpoBLgO1aPEh7aFGWA=;
 b=dz5q2MS4pMM3//5fkWOcXZf2Wl2P1LKeGNtUltXSt1iKT+V8K7Qf7+E0djQwy4zZ5VxY55c8S8nVvPKTldMsVhHYhJ+h1JqxYvOmxx7e9Mw3H2x0MpaPJdOLZjDz/DQn6slTUqZMCg4nKzVqr4ITYXMd/QehxTYQ9iDb+OCmjzOJB1xuZmMXtqAD8toGb34O06K/6Svmztqgx3M0Zo4RBkvYR/d9qkaBhuupxzoky7zPsXVZdA6AjJ9QB856OqUTPIFSlMh+kaGbaE12vKjIkglHE9U86V8xjAQWKb/3OJ0XyfkztM9voB2/0RgJsq3lwOzE5A5Ph2Nb5NFe94W2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLH1oFyUz/56XWHC/eIy9q6evxpoBLgO1aPEh7aFGWA=;
 b=jTkCnZgg6f8c9NPJWw6DJC69LyQyhoTz7d202lWl1DU0NM0aJjwifBuVpHRAuALoF0HaZAblNhaOKL0iXiOUcqxfMqoMXcYsDrsqnppYQcP3wNrWYerhnUDheSL9IoKdqRJxbbfokL9B8th1kR5eGWGNJbaqmjDOr33deslL0u96HBO8/8/xVgVKKaO+Nhhr31YrWa7oJH6hRZ+iIr1VMxKlLhOoSa7yzqe/GLwsnNG1KF5MiUDoqC0i00c0hIEnmzT5lFPhb/FmqM59xcabjhvscHCERqkhbr0Ud8BKcfmKQZOW9+oF17C5Jd9M68G0xH8VqhEO9GsBtD7ODpbUzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 12:14:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Sat, 4 Jan 2025
 12:14:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 Jan 2025 20:13:28 +0800
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95 compatible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-imx9-machine-v1-1-18a78e41456b@nxp.com>
References: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
In-Reply-To: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735992821; l=964;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4hRf0PoC/WPId5q6jiomnOLMrzTYxz9ArnGNDoY9CHY=;
 b=xfuinDkHp3QuQAcVw3zDYu4N59nB6Af4/A6W/N/fAw4JKz3N1+0bb/WVqODmL9/QvtLXQMVuZ
 j0TQlVyA5vbC8MphtxwuWc9XOsDrQF1vbgjD/XCe5y7mT48pNvQKKvz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dc4d8a-50cb-457a-00a9-08dd2cb94b7a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RktDY3pjc3ptTXJtZ0lXRityKzdiVjM0VmY5VzJrdVFWRjhVOTJmS3pPWWFa?=
 =?utf-8?B?S2RNUXZQZ2tHS3lLNTlvcHRHNlNSSHBzZ05ha0xvdWZjVDZBenhRV3kvUlR3?=
 =?utf-8?B?Y1ZNTUlJalNxTnhTd2hOUjEwU3pIWXdMdzU1WlFXZTdWbnV4NGxZWWlNY3kv?=
 =?utf-8?B?emRNZkxiYm9MaGg1UVplMlZhUU9yK1JsR3JaZGxPb2laMnlBdmE2V011WU1s?=
 =?utf-8?B?dmI5MVBmOGtod1lUUE5FYlF0b1RhUG9jcFVGUUxwYkJ1Ti92bXpYaUM5c1di?=
 =?utf-8?B?S0o1UkFQMllkUEVRT1M0a0F5UStTdnpHRmc0UEw5TW42dVpHZGZKZjFOdzZD?=
 =?utf-8?B?UHJ6ek1ja3ZORTIwdW5YdW9HcGVWTmp2emUvUlVrNmtzcDZiRGJ6TDQ1WFFa?=
 =?utf-8?B?ZUI2VXhCN1RETy9wMkk4cnRKdkhHc3BhZmZndFZGaUlQeUszS1VPTU4zN1Zn?=
 =?utf-8?B?bGlNdjg0dmhNSS96K3cvcmFLY0xzRFgvZGFUazhLOTRJTCt2ZmdadkV2N1hG?=
 =?utf-8?B?eE1TVTlUWnlDdXpIUTlVS1Z6TDlCbTNtaVZzUGNoclBUWWJxV1dhNmpzZFd3?=
 =?utf-8?B?clFGUEs0Qmo2eFhjL1JFRjFXS2lvcjRRWEJscWVrb08xMHVVMXlPMURrbm5p?=
 =?utf-8?B?ZHpvZG9QKzBXRFdJcC9qRnRCQUtQTG5FOGcrOTF6VUQ5dGxlb01uVTViMzZy?=
 =?utf-8?B?cm50NlJuRjU3OGN2dkpseEZVVTM2eGkxL0hyNHZQeG1SLzYzMGorbGY2T1Bx?=
 =?utf-8?B?ekdEdGFFd1JzMWtxOWRKSlZ6Z1luUi9POFdPZWlYM20rVlRSRjltbW9rZnFk?=
 =?utf-8?B?bEduQnBlb3dnT1JFQ0JBUzBtcG9KZUllTTlRRlBka2ZTbHhzaUYyR241SlBR?=
 =?utf-8?B?bi9yTzlLekcrc3BURlVIMkRGRTB5SzRDaVBUWktIejA4RHlJSXc5QURXQjdh?=
 =?utf-8?B?dFppOW0rSVYrWkpoYm9JeHlSeVIvSE5CRlRybU1hNTVJTlhWS2hBd21mVXBO?=
 =?utf-8?B?NkI5RGtMYnV1am0rWkZNNkNHQlhHdUFlVzdzYUN5MlZQMkVaQldtVVVyaTRR?=
 =?utf-8?B?Q1NJVDJsN0o4bmJ4RHVGR1l2NDJ0eTRybXJsZWtaWEhsOGlpM2NBcWFlZ0dL?=
 =?utf-8?B?VjJGRTNuNjI4ZllzUnZpZFRjMUl6aU5SR016RjBvY2RMb2twd1YyNmFGWUps?=
 =?utf-8?B?dnRHZkxIa29uNlJ0YVloMTdYbVF4dGRnam42UUNISW9rUTBmQi9OUENMNDJt?=
 =?utf-8?B?R0JDTDI1NElqQWtGQzM4RnBtQXF4b1I0aEh6TmgrSkVMdW5rNTJwMEFHcG9Z?=
 =?utf-8?B?Q2thT2ZOdVdaZ2hxclZlWFR3RlVkRlJqQW5HbkNiQ1JYM1ZOV0hyT2oyelov?=
 =?utf-8?B?aDNvOTVMc2xvNkx0MHg5dWFiK3dxS1FyMjFYMEtBWEJsSFpSZG9xWThPbzlq?=
 =?utf-8?B?cHVPTlRPV1RhMjI0TlRGZEdwOEU2SWJJU1IwaDhlcVZnd0pGdkFKcDdKdkJM?=
 =?utf-8?B?aGtnTFQ5SEpDQUJaWGhPdXZsNGVOKzVTbkZnalcyZ1FEWVRqcUVoajRiOUhX?=
 =?utf-8?B?UmZlUWpzQWhYMmZVRU1idnVMSEZST1FUN0hteXpKOTg4QVBsdXltenYveFkr?=
 =?utf-8?B?WE10QnNYeEl3S1hPOGs2bkZQRmQ1RDVHQW9OTkQ1L2pOcEVCYUVTc25jd2dk?=
 =?utf-8?B?Y0xlcXNqZ3VjeTN3NERLL3I3MzZxZmlmNDQ4ZjB0ZGVNRDVpb1J4WVdhY2tT?=
 =?utf-8?B?Q1ROY1ZnSWFUWWVZa3YyS1k2NjJFSm9zZzBTU1VBT3A1eU9FUzB4YjZXRDZj?=
 =?utf-8?B?N3E3alUxK2E2dnIzVDJlMHNSamtLd0NhSWpZT0lwdndGclFNdmovUzFiNEdM?=
 =?utf-8?B?dSsyWlNxSHlGRU8weVpxOElVRm9vWnNoc2tFMGUwRk1JQnF3bHhORFhodDdM?=
 =?utf-8?Q?FAGuMB+tfYpkPB2CW4YSJT2lHKfm5Ah+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhqdFp6UkJ6M3VLb2NuNUhESnZFOEQrZGVkblI4azlIUFNUREZXWmQwNUZX?=
 =?utf-8?B?TXVub3lxMmNQaml1SWRmY3RmRnFGdXk4K05zMVdUZTllQ0YzZ1RYN1VkQzh4?=
 =?utf-8?B?cjQyeVJVanYvenBlRXhjbi9BeGdVc2tSTlIwdm1xbmxjbDJyc2s0R2xibElV?=
 =?utf-8?B?NVp5M2ZDVVcwY2lJOGZRaFlnLzhEaitaZUE5ZUE2Y0thTzYyRDVJeXc5LzhI?=
 =?utf-8?B?TVNod0xDdWhuVjdpbkw5a2R0aDRNNWtsNWdQUkVhcjJSOWE2QU1BOVRHYjNh?=
 =?utf-8?B?UmRwMkRFam5mTmdUb3BuV2FLWVdjaDdUK3dvNzlpWGh6Mk8zczNJMGNSazNp?=
 =?utf-8?B?UU9lNmdvMDllc1VrbmtUOFBpSzV3L3p1dEcyd2RweVVYNTB2QmR1V3dMZ1Js?=
 =?utf-8?B?NzNVMm0wUU9MWTJZeXdOVlVaTGJITEpORGlkM0JpZys2VnFsZzZKUDJHR2Zz?=
 =?utf-8?B?VDdSN1pwS1d4V1hhNDRVWkk2RVVKdjVYKzhBSURJWnQ0NnMxMXBRTC9LSzZE?=
 =?utf-8?B?a0hFejAzWm9zYVlpZ044OHFUVXEra3Y2K3ZHbWpaU0JmbFlPeS8wSUd5SFhB?=
 =?utf-8?B?a1h6ZmZsbGN5ZlZaVDRPVDBHdEJtTTNvVzZ1YXo4OUdFbktIWWIyRFc0cThy?=
 =?utf-8?B?NmJFbXFLYXNLQkc3cVkzT1FHbkF4UStIbzNERStsbjR3OGFoYnhFNHltUGFv?=
 =?utf-8?B?ckg2YUJweGk2MllPSTlISHZMaS9LQ2orZ3FhNVd6czJkSDZmblB6ZXZJY1Y4?=
 =?utf-8?B?MC9FMTdXNy96d25RMTkzMW0rK09rY0E4R25OZGJBVHQvSzZqZlNqWWU1Q2FR?=
 =?utf-8?B?OE5scmo0NlpNSGt4YkFNUmFGWHRnQmt5QXdqTkFxeFBGblJwNXpTRVNmS3Fi?=
 =?utf-8?B?RnpoOGRldnQ3QkRWRWRZWEVxbjE2b3NBVzBubDJnTDQ2UHdFOGR5RlA3NlJB?=
 =?utf-8?B?UWZIak1hU3JXWEQ1L1RIZDBxMGF2Q1UvYXFqWmdKK1RLV2JKZFVReGFKaitK?=
 =?utf-8?B?SklIYlhwazJ1MTRETktBeUVIMVI4V2d2SUE3MXB0cjNDelRYU0JPeE5BVXBm?=
 =?utf-8?B?WE1TVHBhelFQaWZqWG90NU5VSE9aZk5hRnhTVkFGUjAzVjlybU80Y05yWloy?=
 =?utf-8?B?MFBCR0xPMUNNS1NRQjBNekwvcWRka2pOVWt5NjBuV0NDNzJteHRqK2xLSUhY?=
 =?utf-8?B?a1FRc2pvVUZQV0x2dSt4aEFJYjBTY29iK3prcHpMdUxtWEpDbStLWjBwck5J?=
 =?utf-8?B?eTZCOWF4SlNPK0JZRkl4bFQwZEdmbTJuclVhTDZ3dGcrS0J6L1FwcHZ0c0du?=
 =?utf-8?B?VTFweVB0djEyTU9MbEVhL2pGR0drZUt6ZlhxQjR1QTlOTlRPZUk3NHVpMExD?=
 =?utf-8?B?RDA1alBFTTRhNE50U0V1WGNoLzVPQzVvbWNJb3FZSnUvb1QxdjJGRTQrUzd5?=
 =?utf-8?B?NkNZZnJ0UmRhUDkxNXJQOFRIWEw3RjZTelNLVlFKbHRPdmtndk1oZ1lHNG93?=
 =?utf-8?B?cUV6eWplVVBNdTRXRkZVYVFONWNQS3lhZVJQcXdXb280dDZXcDJyNWZDNmdE?=
 =?utf-8?B?aW10OUh6a3ZFU1gvOVZsVVBJczNFeStKQzM3WVJzTStyVmVBMTNLTnRVWVc5?=
 =?utf-8?B?MjlxbUdxdDFqazUxWVhYQ3VEYVpVTVhCTVBlaVVDdjM0T2NOS0hkSVhpRi9Q?=
 =?utf-8?B?Zm9xT2c0bUhIdzBUQ2NlMy80QjYxUTZiSlVpSGpjbnJ5RE5lZmpaQjMrNGkr?=
 =?utf-8?B?a242QWkxQkNlYlRyaGtRQklIZ1VlUVkvcmQzUXdUcEVoT21KZ05nUHlpTDdY?=
 =?utf-8?B?ODBldi81SUVVZ01tSkVLeERlRXFENjdwMDE1NWs4ZTUwQUlYMzl3WWxzVnRP?=
 =?utf-8?B?cnA2TlZ5RTI3cGpFekU5Q2llUElmM2p2WGtRSlcvRzVXejk1UmVFY3NFSVk0?=
 =?utf-8?B?dDEzakNENlhtTStNRXhYbm83bkJlY3VENVJKL1B2cllDdE0xbmlhSm9Sd1Vo?=
 =?utf-8?B?THlKRGNOR0g5K2YyZStXSDB6OVpCNWs3T0ZyOFJ5SG1qdklnemk1OEdzODNh?=
 =?utf-8?B?VWZCanRWd2h6QzBXODZ0TUVjNGwwNGdlUWUwelV5T01lVFBKd2ZxOWdDeVUz?=
 =?utf-8?Q?UabzPXdyCqvpUJRDd1LvBNeWZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dc4d8a-50cb-457a-00a9-08dd2cb94b7a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 12:14:10.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKYGtgNGa/kBkWLoTohKjSYnBRWwQcrIN5SwOEgYpc4Fos4eOx1rJzIMTfQqmTPy96W/odmDXyJuH+wSIFiO/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features a System Controller and SCMI Spec 3.2 compatible
firmware System Manager(SM) runs on the controller.
Add "fsl,imx-sm" compatible string as fallback for "fsl,imx95" to
indicate it is compatible with i.MX System Manager.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3713175548637ec17561c068932123c558776435..4f4def9ccdd6211461238d90bc0d1a85fd77a440 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,7 @@ properties:
           - enum:
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
+          - const: fsl,imx-sm
 
       - description: i.MXRT1050 based Boards
         items:

-- 
2.37.1

