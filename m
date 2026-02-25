Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642D2BDC2F
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001969; cv=fail; b=TfLQvv9hEbo2N3KrEypai1/b8sVrl758aQQy5YzACVKtYhcH+S7Z6k34tXqiXZGW+QAoY7H87x4ZSMUdFhti7YPpMBN6uYaWaZ7+QQZK3IHeVxpsWOws0hsbKQYyTT7l/g6ZulilEynnx84jrOK//eSRapxrJaKa2UkrFIWXAK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001969; c=relaxed/simple;
	bh=2RRMLPlz6K5BvT9L2d+uoo7ngjB1JPtZJzU9HCO1aeQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FTnu9wZ9k8uGy7N3D0R0pd5ceABqATrEpugngWpNbkeJzXzKofkZIh3aKYW4gqcQ1T4qyb8sSNt89xJ44k+U/EUvkV6L7KDk13co0iEbK46W9qsEdpq/8EM/TOao15pdNSDRWnWeF9fUHbxFk2YKilrqcQ9mSKhVGFhK1ilIKw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bNqGGVO/; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bNqGGVO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvmsckuXsphNiKhrRcX+D2Rc9YrdOz0tYeSdecoXMHOo2Yl4IlMX7cUgu61oIPVW+p2YvipGKbQGy9+QlPvAkF3OBSBZsq2kOHmMFN3eHeqtydMXAkkGzuHFwuh8G4INX2eDKapp4C5/oknsLioHuB3akuAzcVPuUWFddLjvaMnGraVGCTVoZYae1HuxWAZw4g6gI+CPBeffTOt2R2ZCbxOy8hVl188jNiiQTlXm0IcyJUTzibCT3xoXJ8ze8ZOvV0WANeiHcUqZtd7LiPnQ4vvZZecHeiq8KIUeCteh+iU8w4TQHwIxD/wpRO7/q5d+O34ODfPnQgxhld7P/r9qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNrHjqfYXgE8U3cxPb9neqRMhWE3W2Bf/jN7gNfA7xg=;
 b=DjqOm+Be7KYYRwK2yzfExecsPxtGm/bVZoC0Ga6GCQCLzeglMXVqZwI0JR3/Xm8P4ZXo5Ry1/AKOx1rXMCeUcTLpcc8jLarKnYSC9I2ro+GBQznVaLRkJ52Jy/1y2suY/Vitzhp5/PO3X7CnyozP9TllHi3CmiKbTltQsdiTmVHaljqx1c/MpoZfGUX4t9uV/dGuKzaigkqVo/BsUsNdEXtaA6pEdnx9+ddsBMSrSmDo5auqh6ulb5MkPj1fFi+z6EuKZ3c80tp9uL99AjRG7JgmJRo3IapJTXP6g1Ky7m7hbixLhkv1y4rulZOMkOkbyKJNJktU/iljoN9N5Qo1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNrHjqfYXgE8U3cxPb9neqRMhWE3W2Bf/jN7gNfA7xg=;
 b=bNqGGVO/0j6U1it4J6oTvQZOL1INFnPYjD2Lvkji+w4toj/9FswK+84TUQL8FtmMST0DyDfpdGHpAhy2ns7rnAh7dExVkmEHvwQYN0/+pKyfBnaNC/fvCjZI+aRNhvKmgxz37kDkBBS+pBoRLku51kkXSb5/fkfM/aLHRqZAsmyi2pt9yQuvnDQOvYqT7WdHjv8haEK5i/QSUyZR0FtNQzaMXvhhIlY/T/MJ3ue8NuTGfw943fF/T/kRjiXLVySG3kj8WUoiJX7acdbpCc/NsFBaPBPptSes5+cGr+I6tmtLwJcO71kTj+OwHcDKGmZLPvF3mb17FCrQH2fKf0o62Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 (2603:10a6:150:328::18) by PA4PR04MB8063.eurprd04.prod.outlook.com
 (2603:10a6:102:ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 06:46:06 +0000
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908]) by GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 06:46:06 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 25 Feb 2026 14:47:25 +0800
Subject: [PATCH v2 1/2] arm64: dts: imx952: Add xspi node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dts-imx952-xspi-v2-1-c9ca27de356a@nxp.com>
References: <20260225-dts-imx952-xspi-v2-0-c9ca27de356a@nxp.com>
In-Reply-To: <20260225-dts-imx952-xspi-v2-0-c9ca27de356a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772002081; l=1384;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=2RRMLPlz6K5BvT9L2d+uoo7ngjB1JPtZJzU9HCO1aeQ=;
 b=+1DWWNDDBp6Bz+j6iyGgl6nL0rtgjASUwJ+1gpEYPiCwv5eAW/M0o/Ed1ODLG90Dvf1Jg7DNq
 ZSrlM4zfds5B30Yjn2QhPPAteSmlfdmJ8kgZGdWqWkYb9kf4AgdjViy
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To GV2PR04MB12272.eurprd04.prod.outlook.com
 (2603:10a6:150:328::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12272:EE_|PA4PR04MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 663c1769-5830-41dd-d619-08de74398d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjNCN0pCRXEzQzZEc3ptT05ETkVIMjFnY1RTcGJWNFJza3BmZGczc1kvS09G?=
 =?utf-8?B?K2VUV2xzR1Y1K1BFcnUyV005TG9qWTh0SmJPWHk3YTJZaDlmMmhpRXRxamRH?=
 =?utf-8?B?M1UxdWN1a1Z5aVhaWlpIc0ppMVZHNjlxMkg4NW0zblVpZStvVkt6SjY2dUJR?=
 =?utf-8?B?VEx1Mkt0VWZRK2FxUXFqWnR2dWJkREJadldEQ1BBSWQ2dHhwQnFzMWtrbjM3?=
 =?utf-8?B?YXltMXc3amI0clpjaUdTaXU4V1ZzWWFrMi9sTTJubExESXMvdEJiNXJSa2d0?=
 =?utf-8?B?dHJiMTBXcUVoa3VPWGxYNXJ6cS8yYlFFVy9kY0dlMVE4MERpRDI1KzNhZk5V?=
 =?utf-8?B?Y3VZVm1uK2crTnVpb2lGNUk5cHF3eUIrSlBjZFZicU9yM2NVSkpFcjUwTU5G?=
 =?utf-8?B?QXpLem5hM1U5WWYzNDZnQnhmSWpjRHZFL3FValdQUlMxSGFtZ1YwUEpFWnk1?=
 =?utf-8?B?bWZnWjdXNDhaTUhLc0ZMV1FtdWJDTS9qRmJIS3hOdGNxK0xmREVOVGVYMC8v?=
 =?utf-8?B?RWYyVVF4b0FJQkU3UUdCcC8yUWdlcVdIWU9vMWV2QUtIYWp1cUFTcXJ3ckhp?=
 =?utf-8?B?UFFoWFJwTnZEYWlJaWVHcDFieVRmQzl2YW9DMndBVkUrRHVQT0lvbkk0dFFH?=
 =?utf-8?B?TzlhZUlmcFNpd3JoMXVJVkZSMlc0R0orL1kySFVLQWFHUnNhQmd3eHZGNUdI?=
 =?utf-8?B?a3Q0ZWNMbVlyZDRPNVBINXdER0VzbG16OURyb1JBVDJ3Y2Z6aXZVbUFUampN?=
 =?utf-8?B?Y1NGSEhqdFBTT0hIOUZLTVBFYm56RTgxaHNRVGhmR1U4M3poc1VISzFMWm9X?=
 =?utf-8?B?cGd4SzJRdGs1UHBFelR1UUtKMzF3NVMwT0svV05GbzU3QUs5UGY5QjBlMVp0?=
 =?utf-8?B?Z2FhMEF4YjFpQ0d5eGFmRCtRV0pKMG5mNGw4bkg1R21abEVVaktvSVVVeWdn?=
 =?utf-8?B?Vmh4Q2U2MW5CSmZpSDRaV2FuYndqNmx4dG5qdGxqT3NaYkZudkM4VENQYzhQ?=
 =?utf-8?B?RFNuWEhDU2loRklUTXltSzRmc0xhRCtyRE4wQTN5M09oeHdmd1ZweU1lVVRX?=
 =?utf-8?B?MGlIOWM4QXRvYmV3QkVVbzlTNFc0QUdFUEhzZDZLeU8zTlBzVG5nYXdrZTZq?=
 =?utf-8?B?SFBPenVMakx5b2hXSm8xTkF6SGVsZU9HdnhidUpEWHYzVG5BVm1iODgxdTQ3?=
 =?utf-8?B?L0hJS3V3cU94a2lyYUFsRDc1RS9vQTdpbDE2eFJJUHNHa3FkT2NTK3c3SHNk?=
 =?utf-8?B?b0tzVDFNWWwvMXFXQkcweldhUnNFekhhV0tQcDlqTVA3c0ZSb2U0aEtFdm1M?=
 =?utf-8?B?dG1Ud0FiS0NqQ2pRamkxbEllRGQydFZuRjhoS2lnUjdJRWVzZzFJQkVCT0ts?=
 =?utf-8?B?RHhkalhoSHEvWnRNRlZvVXBLVHdndXZSbE52VS9ORkZySlU1RmRUNjB3dUhV?=
 =?utf-8?B?TFhweWhHSTQ4ekxlUlFlU255dVRZakxSVnZvNmpaVndsZDBBVE5lVXhMYTRP?=
 =?utf-8?B?K0lYc29aOU96ODlydEgvWTZsZllCeHJsZmszVEY5ZXg4SGovM0R3dElHcVlr?=
 =?utf-8?B?UHJzWWprTEtmem5FN1owTm0zbmJyOHVidURxQUtwbHNvbFdZNzZiWU13Q1dU?=
 =?utf-8?B?V0ZWaDR0K0tIYTVEZVRtSVhLbHRSVVhOVkhkdkREVlQxSjFuT1VkaTZGbk5w?=
 =?utf-8?B?ZzIvKzhTS2I3djBIOXljNGFjZUU1UGV1V1k4OXZJekt2RUdFRE9iLzNGMk5r?=
 =?utf-8?B?VHA4ZFZZNVpFUE5JVzRzRUd4WFh4Szg3RFUyL3BjSG9KbWk1WGxaZmRScmxV?=
 =?utf-8?B?b0wyZDVKa3V2V0NFRWN3aHhEZUhMR1I3NkF4OE1Sam5uQWtrMmczT1NFUU1H?=
 =?utf-8?B?OS8vUHdnOERyUUpmTGp1SzluSjVRODdoQTFScUVQWVhNL0NWRVZDTTc1MkUx?=
 =?utf-8?B?R1BVbFUyMmhnekh4d1ljTWh2ZmRlWHdvQyt3cnIxNUQzN2pWWEd4SFBZSVhG?=
 =?utf-8?B?OU04ZzJ4YmxyUFVjczE2R05JYlFISzdYL09PQ0tkU1lJUVlkcGJ3alpvdUI1?=
 =?utf-8?B?WGVmSFpnbTRFTkx1ZWU1cGhEdm03N0tEUktQUFVDT2pkc3BHT0JwNlBiaW82?=
 =?utf-8?B?WWl3ZWtwTzNaRXp1VHRjUjdLczlsUmZRcE1BSzhOdTMvcFJreDVnaWltRVJE?=
 =?utf-8?Q?y6h48jjzn1NH+RtdCUAmy/0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12272.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdGcWQ3dGExM2RLUHhwWSs5eGpoZmJLUjN6bFVsS293ZjA5amluazd2RVBZ?=
 =?utf-8?B?SU9JSkY3bWpSRTN4WEJ2WG5yZUM4S2ZWdVZMT0tUcU1TWkdMUTZEN0M0R2x5?=
 =?utf-8?B?aXJqSDJjRDQzM1kzSHp5NDRaQUJteWNmZkdBakE3VzRtN2Nab2svdmg0ajNm?=
 =?utf-8?B?T29oY0w4L05IakEyR1dYRHI5d1ZWVDl6V0pGSTlRWjVrNml1MklEcUxIdGRw?=
 =?utf-8?B?anpMOWh1MGJ0dldwUEEwQklGZzRRZFhNYTFaUUFoNjBZQWNXWmxVcWhBRDgy?=
 =?utf-8?B?aEVLVDUyVk1IRTdUY1pqN3hpVDJ6dXlLOTdvbTRjOTVtQ0FOT2Jyd0dDK1dN?=
 =?utf-8?B?NjFOUlhqQjJVOTRJL2oydU9QSUc4dmZTS1RzbW8rajEvS1I0NTRKT2YvcGNa?=
 =?utf-8?B?bnRpSStWOEJ4RUlZY0xGbmt1Y01zdU9ySFU4dTEwT1ZMazBJUTdPUXNDQlAw?=
 =?utf-8?B?VHNrQ1MxcEVsYjZzQUJpci9GYng2ZHRVU2d2ci9FWk5vcDYwcm9BTUNqOVJo?=
 =?utf-8?B?SWl5dHUwRTlobVVOY0pkR1RjZXcxdnM2SjFYUDJpTHcyUDFPOUJ5cHRTOW5r?=
 =?utf-8?B?M2NBb1I1V3ltVFIzUjV3K1BOb25LcElLOHc2WlQ1Vk8zV3hEaDJBbzloUG54?=
 =?utf-8?B?eTA2Q2pVT2VoU2tWczhBdHBxcDhCTCtnNlptalB0alRRaCszWGhRdFlodmM0?=
 =?utf-8?B?aUtQVDV1ZXRRZ1NsWkkrVE8wNXF5L1A4ekJZUWxURDkrdlQ0NVdvUUlHK3pC?=
 =?utf-8?B?ZnR1T083S29aM2F6K0kxSmw5RGdndWV1dDk3QktVNFJZeXQydFVhT0xkNDBQ?=
 =?utf-8?B?U01UQldLMFVzUUprUm1SL3loOEliM1czem1TdzJHQU5tckVMUXhWbUdVcUR2?=
 =?utf-8?B?cnlWd2ZmNmE3NU5aK0FBb2todHBpemIyUjlFd3JySkpxeGhXaE5vZDFiS3FF?=
 =?utf-8?B?V3lFcTFKazh2Z1ZLNEtIV0hTL2ZkQlRTT3pWWTBpNklzcDFBOFZWMTduS3NH?=
 =?utf-8?B?OHRwdjgxbCtPSCs0QkdvblhUQ1NoQVFwLzJzamlUU1dOOHVDWkFxWFNKUGkx?=
 =?utf-8?B?SGtCNjgwZ0Vwam9ZTTE5bGdzdjhoenlId0dNT1czMjhMRnlYcTlvQUhtV3BQ?=
 =?utf-8?B?Y0trYWpmc2xnOVdFcTZMRlE1NytaT2pQcE1RT0dNQ2g2Sno5RUJDZU9vbDZD?=
 =?utf-8?B?K2orbDVMYmFzeSttelN4SmR6ZFRsZG5lL2VKNG1WdGdCNU9mOFZuSnpjUGJJ?=
 =?utf-8?B?US9sMDJHYlI2Z2k4c2pWYjFsYnRDZHIvaDRQTlFaUHhuSUFGdFY5VW1FQU1w?=
 =?utf-8?B?SWFOdm9BV1R0bWdpYjk2UlZ2RythTnpuSENFQ1hWWUJWRUw1cmFrRjRUYnlE?=
 =?utf-8?B?TTQ3aFhNN2FKQ0pwcEtCRDNjZkJLOEgvM1JzaUFPeVZ1RmhHWmtkcHZCR1Ev?=
 =?utf-8?B?bE1nVU5KNk50bnh6aGNZUWVnV0RFMXJyK3E5dDFaajFIbmVvc21NbTJvdHB4?=
 =?utf-8?B?SkFscm9DQ2szOWcwWXE1RklWS2RFbUVaeTBrQXJubnFRM2kvbHYwYk1qMlhK?=
 =?utf-8?B?MUVVVDFna2ZKYkwvTDZoYWNkczRYZ3JHZkZDTnF1ZTNSOXEwY0FsMmE3MGkr?=
 =?utf-8?B?Wk52NWR1eHBvWmhSVFV4MVNBL0VHZERoQ2VBcmttUFJTYlUzdCtaN28wTUMr?=
 =?utf-8?B?UjBsVUpIQkRlcmFYTGhtOTdVRWVEaE9SRXpmVkRiQks1TUN3T1FxeEIzRTV2?=
 =?utf-8?B?TE1rUyt5V1N1bzdCKys0MHJ0V2R6cENGR0ZRVFEvUDFIRnZwb2dZWkkwbWYw?=
 =?utf-8?B?a3VaWnFISW96QTJZcEJJYVZYMkdXc2tNMVFCcXdVVTArRlR6VzVPMDVoNXkr?=
 =?utf-8?B?WE80amdiUUtvKzZxN0JENUxUNGVxWHRreVhxSkE3bWxwQzJuY1Z2dTNiMTE2?=
 =?utf-8?B?TVdFQ2FOMnpLcndzZ29QclptZlZKbDhWMGt3andaRDlUR21XYUpESFJWZ0hw?=
 =?utf-8?B?REFXOEZJK0xBSnpqT2VIdDh6SW5YTGFtVzVZOStRcmlzYnpsOW1PZmRlejNU?=
 =?utf-8?B?Q3hDbHF2RldyZHFtMVROeWZOSGoxeWRKTWVxL0tzVDIySkltWGh4OFQyL2F0?=
 =?utf-8?B?bmxwdVhsMmJTUWpUeVU3azNwczRsZE9TclVGdVkxMldJVW1Ga1JJbkU2Tnhy?=
 =?utf-8?B?NXNJbkFlWGJmTVVmbkI2OVZNR0hwM3F5Z3BDbFllb1Bzc1AzclBXSGhadXRC?=
 =?utf-8?B?V21UanBKZDBoM3VYdFVONUN1dmFleUdwMjcyL2pSWFlZSUlzQVhyREIxbFhE?=
 =?utf-8?B?Qk8zbnlCSlJONmdVQUdsek1lb29jZW1lelVpak85YTNCUklXOVdoQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663c1769-5830-41dd-d619-08de74398d02
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 06:46:06.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twXs6XThS97Ljasxx6T46jBYCdEaHZWgnuQEQwBEMQqsleU+OMEi9kaeIA9doa9q1r4Zu0mP+oIScsphxXuO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8063

Add xspi node for i.MX952

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 91fe4916ac04d1d6337c2670374865c6f73163ba..0f86b5626cdd813c205f90c22abbc34ab0cee7d6 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -672,6 +672,25 @@ mu8: mailbox@42350000 {
 				#mbox-cells = <2>;
 				status = "disabled";
 			};
+
+			xspi1: spi@42400000 {
+				compatible = "nxp,imx952-xspi", "nxp,imx94-xspi";
+				reg = <0x42400000 0x50000>, <0x28000000 0x8000000>;
+				reg-names = "base", "mmap";
+				interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX952_CLK_XSPI1>;
+				clock-names = "per";
+				assigned-clocks = <&scmi_clk IMX952_CLK_XSPI1>;
+				assigned-clock-parents = <&scmi_clk IMX952_CLK_SYSPLL1_PFD1>;
+				assigned-clock-rates = <200000000>;
+				status = "disabled";
+			};
 		};
 
 		aips3: bus@42800000 {

-- 
2.34.1

