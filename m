Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07BC8E0
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734914817; cv=fail; b=b1NqiM5tCBQGyWcBBH//3PIDOQE2rK+DSlk7G1YGxO0Z8er01oBMQUO/sPfhtJLW+eQLKiVPElIIP3b1LvUM5T2nJkNiSJL+Mw/Lbx8hiPHGGJeeBTmku7YIz0n+ezW3sGYw3+sxGkMGMc8SUyO1PdusURo3+9M+VJyCf0BFlGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734914817; c=relaxed/simple;
	bh=OyVAx8Ot2y1Looj3JKF0/XHgiGUdlY/P5wEoRUxP/wY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mz654KpMh3mqKow7CBKnZAbEYNAUPU9fJdPgM6ddCxR6huglDclJcSjP2T+EDrzgue5swzwuj/1nQjpyjoE47/atsIomuCe3GTuEGRbR6YMYzqbO1em1/xrV+aTQv6c/3vkWII16Ap/uldbttJ8f93WawV6nh5rZ17oDkWFng1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ekn9GRg7; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ekn9GRg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMtDbJxh0Ul+7u7M12WHhZ2WcZLV+ZHnY27qAWF+TUfwWcnD2GE8rT1aUbOuab8y9ihIZqCH2lGv+m2oWKF86uSFpsK4GkpAHV7S3jO9CHGDddI2/CVFV1XxdNxU29bcUPigAHgYY1d88dJiinQUjPJ7B0+wzsq8f+kr2FJGPlMT0BdMcqpIOOkypl//q4eCK67TSit7ksBumI3gJug+B0rihrs4tm6e4yK8s9JU9QFiP6Bh0KkaGSHrq5YnoPG/L5h/61rCfiDlE2Sj9wohAqIRu07DMICZs0KR6yKdWSvNR1DLjkbg1n2NOnwtHobVISNuxfvcpCr+Kke5W1C2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xVgXFE9hKcU+iNGR3SqhVUINRKr3uSZbjYMBjDK8EY=;
 b=KsrVjLqnN5RrWX7QwVFBGSm/NDFBnqB/2tSL4LP8ea5xw/8X1h7IaqJ851D4QFnw4ZDgFIzJQ8G0PCEMLDqY5TOn6Dm1cgxG4s7v9iFUeiN49NctLf+aamnjH4X2Rks0cjbygnSdtq1Q6/1YUDc0PqYyS3Nac1wXuUUrl76R166LWmmo0jFgf8XIfTS5Kir0xkLeY1gS5SI8hprAn7phROhmZrrRmejG7kgCT0bnTFbeiSMaO98v375CKzWc650PWNB1vSplRYqluUFpeX8Erwazqvm71e47vsiAK91yhEl4XWmTTG0BuJYupMc8pmvS/pX13OOcrm+xYNqjHeTLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xVgXFE9hKcU+iNGR3SqhVUINRKr3uSZbjYMBjDK8EY=;
 b=ekn9GRg7KaQWV2kh9FEj+8sDecE0DhwMdtO6F9etjK65RnIHbN1362IXJgu0SJ66GbDv4THX4yAzAHmDvIJ03Kn1rNuJ0G7uyMiaQBoJRwRVCnfRV3UWhV8k8WSsnq7m2C2qRb828kjMR5hux4a28S2HpNwhx2SiIN0I3LUC1HrcRv2wj0ca4H9JPswqTYRm5GCzaxyKLICzMdqALonAf3/vB0ou0zymDzP3u9rn0s8/4V/iGnNCdwybhRcsGhBr/uouOQb7TTGvyDZx/Dm7K/Ofokc1yN/h1zKtKNjp/EjJ2ns7ZxIknqywuavUO/c/EkISBFgVjGTXnSp2p5L+UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 00:46:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 00:46:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 23 Dec 2024 08:46:14 +0800
Subject: [PATCH v4 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-imx-ocotp-v4-2-f504c1420640@nxp.com>
References: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
In-Reply-To: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734914780; l=9121;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZbEz389bjgOA+PRwzrpvSDmNxc+V7u6O/SazhmHSomY=;
 b=DIWvOqcmT1B1oEY9szC/adot0AFABTpoq6axzNos1Gfky9UjXT/VSJecf1v/epmFOOhom7MAU
 k/gHMDZpqjlCOOViyCNCN8RON9cGxvQJMfAnLoh6ireQSEl599zE4wB
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4df582-f941-4e3e-d00d-08dd22eb492e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWR0THQyMDBMYktIMGU1SWE2WWxOT0hhQlpOUWdWalV4OFRBMXJ5WEZwMzhp?=
 =?utf-8?B?aHdZcldtSlV1VWtxNnptMEVFRFd5VW4xUDNzUGJBUVYwQktQVEhDM0VFS0lK?=
 =?utf-8?B?aU5jM2ZlVlRURDBXcUpOeUNmeHJ0L2dGVmVCNEtBTWMxREZkVkNxVHJkK3Vi?=
 =?utf-8?B?MkhhT2xvT0g2ME95ZTVLVzhNeDNFZmNRMTFCMWwvQk9EWlc2bXpCd0Z5d0xm?=
 =?utf-8?B?dUkraVN5b3JhdXZvNXlkZy95Wk5ORFdYZmJjNUViN2htMWNqUVo0RlB5N1di?=
 =?utf-8?B?SDJQL1F1YTF1YnkybE1ZTmlucUYxMWxGOEJvWVdwTEVqcFBtZ05STzRMZmUx?=
 =?utf-8?B?UDNyRFZMbzBwSXRvOURKYng4Z1NjYVNOeWtWak1adHQ5VEVaeWtET3pwZ2RJ?=
 =?utf-8?B?eTZvVTk5NXQ4Q0RkdzdYeHdyb2lFYzJ1TnpjbTJhS085d0pQdEs3R2dsODl3?=
 =?utf-8?B?YWJQZkQ3S21GUDNjcVF4VDh6cFdIRzM1UzRlYmtWN09QMmRVZVArVlRaYXEr?=
 =?utf-8?B?MUhwaCsvbjF3WVJWRW1ZSmZZWDk1clJqczVnaU5zUU0zdng1S2dIQTVWRzdU?=
 =?utf-8?B?S2FJOVNZOVl2aXhUOC9DeGoxNTdtZ1o0VzBMNTRqeUNlUXhMWTRLYndPRHky?=
 =?utf-8?B?U2NIWWVuZzdxNEZYd3ZGWHY5akFUMnZiNERqOTMrM082VlFSOGMzMklXMVg1?=
 =?utf-8?B?MVZlYThRVUsrczB1aVFHOFVzbEl2ZUJjSllrS3BTVDYrMFh2T0FjVzFuUTd2?=
 =?utf-8?B?VHZiZUxXejhpWGlOQTB3T3NBTVd0dW9pSW5ZZ3dmTUg0UkU1Unl6Z3hnVDlx?=
 =?utf-8?B?MGxKcGxaUlpPZnFMZS9hNEJ3Tnh5MlhNcVIvM3VqT2lIMUYrOGNZUXU4TWp5?=
 =?utf-8?B?ZUJqYjV5c20rK2dMbkxiOEViL0hVOWtnbVRXQmpNN2dRc0hQYnR5dkRvWjJn?=
 =?utf-8?B?Tm1TUWV5TTFlM2paYXJFdWlxakpqL0FKcnRqOUxRejNyemRueVlwelJva2or?=
 =?utf-8?B?WXBmQmFiU2ZOck1iZ1JuRWMzNkZEdVU2SElLdE41RVFSYzJzWDRLeFh0NkQy?=
 =?utf-8?B?eHpOVnYxajU2TGhpMG03YURRNVp0NEFrZXllK1pjTGk0RnhCZEZTM21GVXVL?=
 =?utf-8?B?YzExMEpUUm1HUE15TWcrQkdCbk45VWdIb2VseUo1ZXRjTDJ4LzdJRkdMREpT?=
 =?utf-8?B?VEQ3OGY1dFhaSFBZb1JZNDl2WkRqc0E1QTZEaFM4cWxCK1VveHBaQk1LL0Zm?=
 =?utf-8?B?bFBnQ2JPZlkxOEdXYUtGbGcyQ3NrYWdJSnQ0ZFlnSFdUOE9uRWhLVVNWY0dC?=
 =?utf-8?B?RnEvaVdIelZOSXB3VTFvRXlTSk4rOTVuZG9HS1pCMlVScVg4NmxodFVodDh6?=
 =?utf-8?B?a0lmZktuSXJGWE5TeW4yeloybW1QSUs4VUFFZVZUM2I1eGo2VDBMV0J1ZFNm?=
 =?utf-8?B?WS91VzRMSGtJWTVLMnRaYlR1SC9USStnUi9hMWh0d3ltcVZHVGhsTi9xcHdi?=
 =?utf-8?B?dUpjUWlBMTNpeWhVSndLU0tST05lL0EyanByQTRUaUFLejNzYXJZeFQxYm8y?=
 =?utf-8?B?UnIvZVFuYlJQanNLNW9LOFBXUFd4ZFN2cEt6eXdPS0xORzVRYVRnTEtJL1Q5?=
 =?utf-8?B?V3VwWGRVZU82YjJpY2JxdEFrNUoxSncvY0xtNmdlcDRRcWhKbjVzdlpmbXlT?=
 =?utf-8?B?ejcxTjBnazBlNjR2b1dVd2FWSXRJZ0hUNUVVYWVtbG1MbUdFR1QzdWEvcm9E?=
 =?utf-8?B?eU1NV2RHNkNvYlRoS3d5bzdDNlh4YzJtN3U5M0ExQU5nZm8vaVlYUVdtOVVC?=
 =?utf-8?B?N3JVRXVaSTN2VU9WWVBmQkV4WWxwOXlqREQzekd4RFc4bE51MFEzL1UxUkRr?=
 =?utf-8?B?dGs5b0lHNmZPZjc0blpNMU1TTjQwRGZLQ0xaYm0zY0lQNVVja1BUQSt2S2tO?=
 =?utf-8?Q?R0Viere1hu8QaK4i6LgX89iqefti80KO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFRNUt6T1I4UE1yM1Z2Y3ZoazNpOWp1c1JCd01rK0p5eE1hSk1zOU54elJ0?=
 =?utf-8?B?S3ArTHB6blJCUUxYWnNLdTJkcGgyN255Q0lsZU9hSlUzRFVmc3lXaDlyaktR?=
 =?utf-8?B?NWx4bFdIZjdvbDB3OHdVbDZvU09rYWNoRXMyNVBNTVAwYmxKR3IvUDhobzE2?=
 =?utf-8?B?QkNMbVZIT3BRb0s1VXIzeVJPSjRrajM1NzR0MkdESVhhekdMcW81NisvV0g0?=
 =?utf-8?B?T3lic3dLd0E0SzBwbG9wNFEvaWdpMzRSaml1cXhFZVo4cUVBNmZCdCtBRFNP?=
 =?utf-8?B?TERPTDBya2ExVFJtRGQ0S3Z5cHB5ZW4wcEoyZHkybVFaU3FHUlF4dnMyMXVl?=
 =?utf-8?B?djdaVUF0SjVxaTNuY2VIc0N1WkZkdnRTWm9MNXdPYSthOG1TenQ4TUY4RzI4?=
 =?utf-8?B?U285R2Z6NWNNV0tTK0ZGWjNyYmxkRHNOamF2Z29YZjJNR3RvVHN2S21VQURq?=
 =?utf-8?B?T1pOOGtDZVdSWDYxbG5acWkrWkg5WGNpblRxbEJCUnRZa2Zhc3dITlh3bmVJ?=
 =?utf-8?B?Qng5L1lUWVlEd2lCZlJEQUFjdWh5OGtkWVl1dmlQL3VjUzlnYU9GNUFFbEFz?=
 =?utf-8?B?Uk9LTitaSXVhSDBWOElOOFhXZGdnaVpsOEpYUHVReWR0dTFEKzBRclFkNDAy?=
 =?utf-8?B?b0RyNU1kTHBUQ3I2MjV1NzRRa3FrTGsvOEt3RmNNdW5PVWVGSHZ6MkFyUWZk?=
 =?utf-8?B?MytXaGJzRkUzTGRzY1h3UzZwZC9DbVM1dVBBNXNZYXlRRjVrcDhSeUhOTmtN?=
 =?utf-8?B?VmhjWW9INU5EWVVnVmw4WjB6Qit0eEs4bEVVaUphcTFKM21DMk1LUVFWVjEw?=
 =?utf-8?B?VHgzbllDKzJtL3VJOFVQRHdvTWxlbkhqcWZ4SWdIQ3NYMHp4SDVrMzh4RUZY?=
 =?utf-8?B?YVp5Qlk4TlAyaWJJek85dmFDV0hUVC9ja2FPTUlydUExck5sVkdLMGZOanNS?=
 =?utf-8?B?SVJIZ1BEMXBQUWI0YlZXdEc3aG5UeStaN3JjOTR0cDIwVUV6R2VQT3NBVjZJ?=
 =?utf-8?B?ZVRCTEI2Vm54bW1PZUZGR0c3MTkxZDl4UmNmSUZxNGF2OXNJdmpMSmYxSldt?=
 =?utf-8?B?ZmxPVXlNVmJlelZicU93aERsY0JuK1VrQ25pTVo3MUZlQUhEcnR0Y3VQK04w?=
 =?utf-8?B?emdZRER0b0ltU2VrNm5uY1Z1bGxJUEh3b1d3QlBhaGZ2VG5ydTZqb1FscGZ6?=
 =?utf-8?B?L0o1L1BNVUdJOWlMc3BaM3FuZDBDdHovQlU0K0tjV0Y3cDNyNW81WTltZ1RQ?=
 =?utf-8?B?NFltMUJOT0VldnU1eTRqY0hSUGsrMGJCSWtZQzdwUHF0Y0t0NVc4L0tjZWFY?=
 =?utf-8?B?czVRUWs0UDZSN3VpRXFjQXN5aGFOT1BVOTg5NUFWVEJBM0VpR1dLcW9kMUIv?=
 =?utf-8?B?Ym5nczh3VTdQOGlwU1V1V0hsZFRkRGY2azk2aUhmMUZOOUg1dndhRkEyZGVn?=
 =?utf-8?B?VXVYSWVxWXpxdkZUQ0JMWm5pb0R4Y3dOekNSVUx0THlDYzZiUGxHRU9qUkZo?=
 =?utf-8?B?UkR6NUtJSGV0N1dQZHdtNnpPcG9RZkN1RE0vZHJPSnFtbERNcmQxdEVjcmhU?=
 =?utf-8?B?NlMreVVyRzNicDJBejNIWWRqV0NLN2NpTGhzQ3pOS2R5c2xweWU3SWw4Z0tY?=
 =?utf-8?B?RE9EdkI4MkIvWUhweXRLRWczSnR5dkNLUnpvTkFJelIyenhIYjFqY1daTUU1?=
 =?utf-8?B?UE9JeGpjR1lZY0hQaGNZcG5XcFpjeG1IWnYvOVF2YmNqNFZTYkcydkpmSXBz?=
 =?utf-8?B?L3Y1SlhKZUp2YzlKUXFQSE1lWTV3Y09CMGp2L2ptMEpCcEwxRWcycytIQmNj?=
 =?utf-8?B?M3dvNmpuMEljSVpGMWtqMGVCMHQyNVV0aHgza1ByWE00Z3ExOU5mcWpaMmJu?=
 =?utf-8?B?eXVJamRHWHhYVlpnSVFFUzdPVzRvdXBYVWVVM0UyVEhPck4zay9hYy9PakJa?=
 =?utf-8?B?THJOQWZyWkVMU0J5K1g2MHJ0RG1PcmdmRVRVZ3FxbXZTbXI2NUdia3A5Q3RD?=
 =?utf-8?B?cUVsUXMyZmVURHZUTEV2VGtjNkpaMi8rMXVLdzNTbXJIU0I1NGdOSEVkdlEy?=
 =?utf-8?B?TExib2VZUmxwZ0wxVk8zQVRMdUFXTVBiWENnTUx0UGhLckpKbnlXT3dhRnBB?=
 =?utf-8?Q?DBPBBKihGRAFdAf5GKEYZNhXh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4df582-f941-4e3e-d00d-08dd22eb492e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 00:46:49.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwqG/a1cHh1ZgmAQbEL9D/g49DN+t+2hjumsEeeqj1hV55ukMYh3L8t8jnHmekyaVBbH/YB7w+BwDIU0DXMhtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/imx-ocotp-ele.c | 184 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 183 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5a07d8b780ecfc13874cff338d6926d0e2a87c8a 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,11 +39,26 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+#define IMX93_OCOTP_NUM_GATES 17
+#define IMX95_OCOTP_NUM_GATES 36
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	struct access_gate {
+		u32 word;
+		u32 mask;
+	} gates[];
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
 	struct nvmem_config config;
 	struct mutex lock;
+	u32 value[OCOTP_MAX_NUM_GATE_WORDS];
 	const struct ocotp_devtype_data *data;
 };
 
@@ -131,6 +149,97 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct platform_device *pdev, u32 id)
+{
+	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	u32 word, mask;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(&pdev->dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	dev_dbg(&pdev->dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (priv->value[word] & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct platform_device *pdev, struct device_node *parent)
+{
+	struct device *dev = &pdev->dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_iterator it;
+		int err;
+		u32 id;
+
+		of_for_each_phandle(&it, err, child, "access-controllers",
+				    "#access-controller-cells", 0) {
+			struct of_phandle_args provider_args;
+			struct device_node *provider = it.node;
+
+			if (err) {
+				dev_err(dev, "Unable to get access-controllers property for node %s\n, err: %d",
+					child->full_name, err);
+				of_node_put(provider);
+				return err;
+			}
+
+			/* Only support one cell */
+			if (of_phandle_iterator_args(&it, provider_args.args, 1) != 1) {
+				dev_err(dev, "wrong args count\n");
+				of_node_put(provider);
+				return -EINVAL;
+			}
+
+			id = provider_args.args[0];
+
+			dev_dbg(dev, "Checking node: %s gate: %d\n", child->full_name, id);
+
+			if (imx_ele_ocotp_check_access(pdev, id)) {
+				of_detach_node(child);
+				dev_err(dev, "%s: Not granted, device driver will not be probed\n",
+					child->full_name);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(pdev, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct platform_device *pdev)
+{
+	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 off;
+	int i;
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	WARN_ON(!root);
+
+	for (i = 0; i < access_gates->num_words; i++) {
+		off = access_gates->words[i] << 2;
+		priv->value[i] = readl(reg + off);
+		dev_dbg(&pdev->dev, "word:%d 0x%08x\n", access_gates->words[i], priv->value[i]);
+	}
+
+	return imx_ele_ocotp_grant_access(pdev, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +270,43 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(pdev);
 }
 
+static const struct ocotp_access_gates imx93_access_gates = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = IMX93_OCOTP_NUM_GATES,
+	.gates = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+	},
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +321,51 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+static const struct ocotp_access_gates imx95_access_gates = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = IMX95_OCOTP_NUM_GATES,
+	.gates = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+	}
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

