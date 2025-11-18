Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F82F99B3
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449730; cv=fail; b=KOcX7zx5dJ59kZd8bSijKvwBlHHG4PqRd/WeT0Aej4spv6p9orMyuN0+1XGIf7XMwWCOf+kkWWD3Mglz4rGGeIsoMZaXR3RgUd66k/JWL0AzwjDeogqrHDZgjYiGtXpp7N9ibNQ9t3UH0jWCStUNNSrBa6irvNgPJ7a3gwuifDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449730; c=relaxed/simple;
	bh=my7dlqGZ55L8+U0KI24wuJnQ7CO/SMLIu118YEYjaak=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=PzMaPsbUqGksJFbaa9DGsAYt+yswQ5VMj+RjCCm34xjh9gEqIRryXzTe19BEuooQO3I+cMs6BMYl1m7gJmDHT4WXAz9rJXZU0ML3X0eQRKR1Ul/ODYapLCyEOsDqzgPCE4Z+diA2/zk7uyUfy9G7C06VWw00/PCtSsGlVFfwTKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F/vs9vSx; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F/vs9vSx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLbCsrxXTMicAR+/mSj5KBQl1XcNdi4KJ7vUhPb3ZemAXbPhJe0J/B07/gb4kzBxCrn5CquUeNVT2Bv5KN/0/smOpt8iHWQ9wYF4polWXWNX8z7AvPEZV4n62nolR5wPNLpjoJVzxboISDO0zrlr3Rp74DKgc65LAmF9sfR4c9yXKMBSV7IyO0g3Fg5RRooYdspKihjcJlTKTONu95cj3FGl0i43BNZbeWEiz9O8SPB19WCvN9nxezG0EcMgQWDgiVC+HXeJaDkk4I5stoUS4qdvUQzM7KRJNc/pKUJiXp1e9L+x+7mun0ZObFzVF4CIDGnsVclvSo5XbRBtpjji8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFXp9eWMJ8iLRg+LPJBEIuA2UeZOtGwuLCx9OTLNptU=;
 b=kTtsOgwDaqp9tRdLEt9mDNwVmwwygNrrdxNdqIE9yK9VQzqyY6gQjrn25EKBAuZZsYC+Cyxo6OlCzsSM7ARUvhSXYt1lgoOdXKNIWJf11GU1D6HgKB74OjjHuL7uAGNkB6awL+kh9WhAcpXkmsR7yPpb3wZI4fdQ3NAnT5fn2eSqwOcN+QM5rSLmnGl+bzXgew1WVs/qMtOlz3V1yvQNpxG0e9MivAVSiT9aN2J03zqhIbi6x9ZSb/vAEP2EoJOLOHZ/8QCxL5XXvEDb5uC5kppaZTM4xPOc6wR4Spzdp2IU7ze84PLnookGbcDRvagp0va63HqUCfAzRSOoag163Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFXp9eWMJ8iLRg+LPJBEIuA2UeZOtGwuLCx9OTLNptU=;
 b=F/vs9vSxkdNEVBFMz97psnzqKtf5Gi5mbPSm8tHvH61XowNUV2dzP2J/TpcEHxhD+aFl77TBfD1xpSjolWINZXV7Ne4ge5pOouDomwQK5JthkL70EgPQp3oa43is9GaYhCGzf7C4FNWFUFGc0czGKVuPFQuwekYSBd6II38HLwDdvgsq6/2XHzshMbE55pdriwszMhhu/GI2F74Q1Pqv5nb6oeryJjcfjgElbOcVTMN/aPP+OvplXD2zRf3BoI500m22UvI78kQGuL6sQPvaXIp72CJaDLp00lTkhfnLULVL8wB4j9n7jlQBIiaIp8R1HGl31Ab3v3/3tTxJJ1PgoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by GV1PR04MB10847.eurprd04.prod.outlook.com (2603:10a6:150:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 07:08:44 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:08:44 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 18 Nov 2025 15:09:24 +0800
Subject: [PATCH] arm64: dts: imx943-evk: add flexcan support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-v1-1-81b6249f455f@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKMbHGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3ZSSYt3EFJOkFJO0lMTkFDMloMqCotS0zAqwKdGxtbUAGSGAqVU
 AAAA=
X-Change-ID: 20251118-dts-ad4bd4fdacd6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763449783; l=2168;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=my7dlqGZ55L8+U0KI24wuJnQ7CO/SMLIu118YEYjaak=;
 b=W90xrdfRJDE5EuYaugYxRVfkROlmRqvkfdkv+WdjOnS6ReupXAewTUg5h5A0Qu3RiETkLi0OK
 cn+eT1Zk6aJDYN4Eqxk6gagiGUlXTy9hmc+UKWkpAnO0IOpPhXQvmfn
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|GV1PR04MB10847:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a4616b-6e28-4769-df1e-08de26714fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC9hTHdMZFV4cFQxZkFmdGYwZCtRSHF1aS9BeVgxMTRnWUtnK3FmVkY1TER2?=
 =?utf-8?B?ZFlSd1BXRXk4eVhnUmhabjBSUDhjRDFmbzE1MFFTTDdTekNWdXpYZ2ZIV0NZ?=
 =?utf-8?B?Vm1RVXBFTk5hWFNVTndjWUR6ZVZuVExockltcTh1bFVUKzF4Yitsb284elVt?=
 =?utf-8?B?SklEeGtkMGttNnVvYkZBb3Voa0NXeVozRUpDZSs3d3VIa1g4cXo1Q1lnVjBh?=
 =?utf-8?B?VDNXZmVndzgwY1lRcldkYWIvbDVEQ2E4UFVIRWZNK1NSZmkrcVl2TGFSb3JV?=
 =?utf-8?B?ZWJrUHNBSTNlLzYycDV1YjFlQmlOYjF6NVN4NFRDMHZKQ2laUExwejBkSTVX?=
 =?utf-8?B?Smw0SGlPYkxhSVovczhLOFRQeUZNMWRiM1dSNzZZNkVHMG94TUp4M3g3V0xV?=
 =?utf-8?B?NHJjSVpDcDRjZjBRb0kyL25PeENpS29NNlBmaE8zdGZNN0ZkeGNOam40NENY?=
 =?utf-8?B?bDRWc2U5Z3ZnOVQ2bjA4S0dmOEw0RzEyVmx2bktOZEtvZU5VbnRkRTh0bnFU?=
 =?utf-8?B?ck45TStlOGZGdjc5TGgxemFsZjFNdzhCcWdvVVdHbU52dFNacGx1UjZEck5C?=
 =?utf-8?B?NnFJVEZrTjRuQkd0cTNuNzFSdEYrRmdDZ2RoYndYYlAvVVZyZGVKZ0NHdlc1?=
 =?utf-8?B?cU91eUpIMThoN3dwRFl3MW1aRXBhdGhFMFJucU5sWkx3c2pCVEhpRzRCNlls?=
 =?utf-8?B?V2JESDVINTNtU0VDdlVvakNsTTczaVFqcDZXUjVoL2dXVFZhZVZ6OGZnUWx0?=
 =?utf-8?B?WVBpbXh6YVNtdU12WUorOHVRcnJXWUxtT2FXMStDeGpiU0RPQmx3L2VYZjlq?=
 =?utf-8?B?V3NJRE8xdDZNUStidHVyVWVjSTFjaG1WM0FSUUMwdVZBNDlYMVdxeVRqUzZs?=
 =?utf-8?B?WlNBWHQzMis2T2x2QzF0TkU1RERyL2EvdzNZMHdTc0MvZW9vL3dqZlp4TUYr?=
 =?utf-8?B?NFkyY0R1OVU4ZHl3dkdYUkswbmlLcXMxaW9nTmxvZERFdUdXUCtnVUNYaVd2?=
 =?utf-8?B?TXFtcUs5SUV4STlBajdtTWt4VVd1YjkvWDZEcXVzZDNPK2NKVkZQTmQzenda?=
 =?utf-8?B?eU94WWs0N093ZlZjY2FWTUI1akEwQlpJb0JQY0pPeVEvTnB3WTFDV1NjSStQ?=
 =?utf-8?B?SmsrdEpMejVtV0krMy9yNFJNaVJ3VEhkdzBxeXNoSHdVd1ZTeWFhd2creEQx?=
 =?utf-8?B?QmZmZEwzS2tyMkI0UHJOL0Z6aVp5QXZKTUM0cmkwUUpPQVVDaWJ3encxc3Rp?=
 =?utf-8?B?SjViTGphRVdVMkswKzZGM0pQZCswbW52bWFFV3BHZTMwakdVUUlTSlVXaHdV?=
 =?utf-8?B?Q3YxOWViVUM4N2pnRXUxWGNIeEhOYUl6aTZ2ZDlFLzA4RmZMckcrTG1hVnVo?=
 =?utf-8?B?MUt3VVZQakJYTWRySXZLZnJFaloyMmVoK0w3b2dyTFJna0JGS05obG5rWUpU?=
 =?utf-8?B?VjBkT3dRaTdNQkNoZ3V5RUVJWHVxbTVaTUdKbndpdEpVOFhST2VDelR3eDhr?=
 =?utf-8?B?RWwxanI0aERjazJiU0tONUtMcktvK0RBMmkweitVSmdtMG1IZWJhNFVFZ0Q2?=
 =?utf-8?B?U0R0QnZyYU5PNURYMHpzQmdBUmpCOUhDR3g3L2FnMnJyNi81TGdTckZCTjZw?=
 =?utf-8?B?cDJRVnpwN3U1YWx3d0FzTzhpTzdqZWtwb1BNMFA4N0wyUGZpMUQ4T2xQR3cy?=
 =?utf-8?B?SG9CZllkSkhkalVoUkZqK0o5eWxIeTAxejlXRlMxYUxJUTZYNzZSbE1iVzZx?=
 =?utf-8?B?ZVJOVzJibW4wZHNiM25lcmd2YXV3YU1xZUdUWUEzUE5jRU9qUjhva1Jnd1Nh?=
 =?utf-8?B?T2ZFeWZqY1Mra0FIdWlYYnpUaGdHcDIvWkt4SGlSbEFwTGtUaDNzL0tjV0JN?=
 =?utf-8?B?T0xLTHFSODZjcklaSlZ0T0xDMWJEQ0lwc1U0M3UyeGpNaVVYOGFBYVdnMk9T?=
 =?utf-8?B?ajdNZjQzR3VzQlFmQlRkNHZuT3RTUGJUQ2JyR2JJVFlPbUwxSHRNNTcvSUI0?=
 =?utf-8?B?RzlFMUpJZkN5cXM2TktzQ2NxaTVKN0NQeDM2a1RycmhlVG45U2h5YUFkdVdW?=
 =?utf-8?Q?hqtMP6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkpPdnlQMUM3eTRJU0g4MVhNZHRCcnRNdllPbWN6Y1VoMlIyNS9iOGtKSHZC?=
 =?utf-8?B?YUZUOENyYnMrdVd2WmZyR2JjcmpFRVYyTGR3THltR2FGcmY5YjI2REcxU2dW?=
 =?utf-8?B?RFQzbjdaSGhlSWFYR2k5Z1B5dlVCM21kL1NhSkVOOHg4RUVoSWRjUHAwMGN0?=
 =?utf-8?B?d1JrQWJCR2F2Njhxb2FtbnNUUU9mZExOcnVLTDRWQStmZk5CRWtXWGJCdTF5?=
 =?utf-8?B?aDNKN2NpdGlmRWZUSXhQMDVka2Jmd01EZTZTRXRMSzgvOVdTdTM0KzlVTzhu?=
 =?utf-8?B?QUovRS9Rd0ZRanE5d1RGTFBoRlo5UFVmS3JoTDdWRCtYU3pycEZuQ2RwaXNC?=
 =?utf-8?B?TktidEY0aTNYS2ZlV0NQV1pxaUlEUE5WUUxDOUtCK3NYWHFsb1JCcGd2eXpz?=
 =?utf-8?B?Yjdsck4rd2daL21TT3pKNytGeGI0ZXNXenNEVGx2T1dUZ2RORFAzamdIZ0Jx?=
 =?utf-8?B?QUh1dGx1bXp2QWpTL2twRzhZZnlFRlVmN0w5YWpVWHRZc2VneHRtNEcwNkU2?=
 =?utf-8?B?ZEF0aTg2SHhFMy9vVWhHUU9reXZXYzUvZGFBdnFFVUNHSUFUY0ZqdUFmZGRi?=
 =?utf-8?B?T0pTb084T3lVMlJpdDRZY3J5YXd0NEFjUXo4R3NjTDR3UTh3eUFJcFJnbnZn?=
 =?utf-8?B?a09ESUJHaGhiOWdCQXlvZmkzbG1SWS9hVUxzLzJKSzV6S3pVOXVOUC9hRTU4?=
 =?utf-8?B?Y1Z2UVBLVXhTZUtvZjZuVTZrUlRWcytoUmx4dW5XbGJtRGIyZ3JiNE5Xdmd3?=
 =?utf-8?B?akF5TFpTMGhLSkRTb3BnZXVlcWRJOTVHTWJSZFZSUUxmcElrZFhuMkNNU2ZS?=
 =?utf-8?B?R3RoWjhqcEk1Q2dVeUdRVENNZVQ2VjVwa1VITUZZcUE1Rm1vL2dFdkw0SnJX?=
 =?utf-8?B?cEZCS21JZlNwelBLcmtKUGFQK1RiQXc4R2g3TjhPUVByME90T1A2VXBIbXlN?=
 =?utf-8?B?RUM3NjdBU2hwK3pCdUtjR2hWcWx1cGdEMmVodHBCeWFUUjZSUmlHdGJZVjdV?=
 =?utf-8?B?RjYvTVptWEdZZjlWcjBYZ1d3VU84eWZ3UTlJWnA4YjZYaU9ybzA5ZjgzRnRC?=
 =?utf-8?B?ZDJ6a3NvUWtUM1lWZzhzM3NUVTdqSmhzaUFJdVJqOTJPYWlsQ1Z2SzRaaTVn?=
 =?utf-8?B?ZEZKeHBhWGE0Z2ZYaHByWlNrR0kxUGpIcW8xK25QV2VUMWhCQUlnZjkyZmds?=
 =?utf-8?B?VDNuMUdDeC96eHZLTWFTL2hXVWcvanhmVVlCZm5MQkhrQUN0dE5KSmVjcUxq?=
 =?utf-8?B?SkxVb3E2R0srdGtFSitCWTBSWWJjb21iQ2h6NkIvODl2MDhvN2o0QjUvblVF?=
 =?utf-8?B?MHgrY3NKRVFVdThwZlhOOWZyMTRsTGg0U0FLcVpqZG1jRHJXaTBIMnE3aEtU?=
 =?utf-8?B?VFo0b2Q4aE5DTGluN0tOZE41WVZZc2RQUnZkcFFaeGZWS1NieUlmYzdEOUZY?=
 =?utf-8?B?SXlaRG5DU1FETVNFWi9OZDRQVFlmOHBOQTdWOGgvSWV6RkQxZmNtTmFKMlJy?=
 =?utf-8?B?ZTg3Y2ZOdkNtQngvN1VsZFFNNG9nOUNmK1BGbEI2emFvbzNkNWlUQzVXZ21o?=
 =?utf-8?B?N2JoRE5NbndGVy9tc0kxNy9sRkhBby9DWmplWTc2WW1pdmcyYVlkY05vY00z?=
 =?utf-8?B?N2xNY25ZNTRCaERHRTV6QUFTVWlRTDExdk91a21xYWNlaW5kSlh6RmpGdjhX?=
 =?utf-8?B?Zm8wRDM3MWl4M2hLL0pUdHZFdnl3RG8vM0JtdFZHL2M0NTJUNnpYTVBEY2k3?=
 =?utf-8?B?SUwyMlBnSHdjbFZDUWVKNDc0Y0IzQUJZVVRZODdCUnA5WER0a0RWMWpYTFlT?=
 =?utf-8?B?bHZsOHB1bmZjdE1tT2tlTzRqeVRhcFloZ3lJUnFuRFFmNGZ1WW9vdVpocGZl?=
 =?utf-8?B?RkZ1Tk1KVzdQN3FrQXJqeXNmRFo2S1I3MXM0cTVuTnZzZC85d1I4cmt3dVdV?=
 =?utf-8?B?WmJaaWRFUCtCazlUZDAxTFhOajliMy81YWZvd0FTdnR3VEx5aHM3b2VwbnEy?=
 =?utf-8?B?TkhYeHpUUXdmNWk4cTFNVmk3WGpUTU1POVF1OWI0NEhJYTBsdWhzOXkrZmRT?=
 =?utf-8?B?QXVoQTZaMXF6Y0RvWTVob3diQVdCTG1xOTdnRXlkeEtrTEZEWEhVUnkrRGZh?=
 =?utf-8?Q?/TEj7ONdran8lpOfZ2dPBYR4d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a4616b-6e28-4769-df1e-08de26714fc8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:08:44.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqHssySaUXmz2PhopculXFgSI0APf2B+RNk3V1+5xhhvHTybE4/wF0qKuc888VhhT/QL9CyFVXydsnRMChPWpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10847

Add flexcan2 and flexcan4, and related phys support.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..9b2fce25532fa0dbca3a14041399adec0f753e68 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -34,6 +34,22 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	flexcan2_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&pcal6416_i2c6_u50 3 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&pcal6416_i2c6_u50 4 GPIO_ACTIVE_LOW>;
+	};
+
+	flexcan4_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&pcal6416_i2c3_u171 0 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&pcal6416_i2c3_u171 1 GPIO_ACTIVE_LOW>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -127,6 +143,20 @@ memory@80000000 {
 	};
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan2_phy>;
+	status = "okay";
+};
+
+&flexcan4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan4>;
+	phys = <&flexcan4_phy>;
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
@@ -431,6 +461,19 @@ &sai3 {
 };
 
 &scmi_iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO34__CAN2_TX		0x39e
+			IMX94_PAD_GPIO_IO35__CAN2_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan4: flexcan4grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO36__CAN4_TX		0x39e
+			IMX94_PAD_GPIO_IO37__CAN4_RX		0x39e
+		>;
+	};
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
 		fsl,pins = <

---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-ad4bd4fdacd6

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

