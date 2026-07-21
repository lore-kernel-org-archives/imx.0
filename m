Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879948164A
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630001; cv=fail; b=WyYm5cxknaMW0MypkmPHXCl2yvlp1hNx6WCBbfaYHLFZ6L1AP19hz/VWEfdect+upmY0vHVqD1FN3VLHgpsXOHoJ+IeM+bmI03eueX3Wv4NpIFYf+pJ7khuYg0cWTGEyKSV1AwzDfwtakMLK995SPuQDmKICK2QGLfTwABHr/5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630001; c=relaxed/simple;
	bh=C/vHWW6+U62IVM2OMy9HbLU5qevAgXfIURGlGC8CCcA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=M5BuENYjUOp2JGNefzUh9V1g/eugQoqGYNOrHUPQoJhQlH1B4xv0h3vBZxoeVd/JWISCBVxE291oSHgw49lpE9D7Rv0vyxr36qHN4k/CuJnQzucDqdju3igBTb0nH3LnqxccN68DPxdmoyu/pnC7vXS6QoYqvhDHaoub4sR/UXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NIv8FUUD; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NIv8FUUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ4v0ggE4vjaAi87FwrMjh6N7Y9JpL/WDmlMcyXPlgnkrJXP7P+dISBuRNv2SRzsX2gjPShG+V5OGAyPxKA8ywL6i/2kdiZ+JXy6VungfFnhxJ/CH9wqkMop+SE3LqZ0/N5AiNdKDT0Ee64QXHvNWW6INpx2LdyI7gxrtuoZ15EKbPYSrLvN5pKi0cM7sVL/GAbn50kcW93i1MsqVECO4ucYah+j2Xekjag3or7uRkZMvL7r1aunRTJwLpLI9Mq3X9oaFPZSceMI5DwxasFSADXCByUPGaVeTiPpdt3vF8/fwDVgMEbyOPSxe3EGM9DilzLYtS7yELwxTCCXV1N5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+H3j298+pAr+GvBSH8p30FuVOmD6tzbBr41KPa1w9w=;
 b=Lxf+KNpN9Mo+SauzWYonmVX6bbxvQRrZoGl3w6cRzEsOXAvTMePch6WsxyT7uBGMCQaBYW0V8yLBbVmThi/uiPUFHLbS39nz5QeQjV9JWnTvfwwHrJ9551L8xy7Hp3b12DP99l3dm1UlLbsekv4jSGy/kcLg+qr1z1ZwNGFKju9OVhnAsPC2IDi9CrbSAhDEZpkduH1ofnjLa6TNA3J6KnnbRN2e+ZPr8R+QuJb110wXDRAxNH6zYdgIhFj6fMnvlGZI2I053nVRuWVWRjbzqWNvGxBc0REdFxXjKSUMy5Xrhdx5NPrfGA9/w9U+aUy2ctj2rK8X6iVzNGTCKkjmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+H3j298+pAr+GvBSH8p30FuVOmD6tzbBr41KPa1w9w=;
 b=NIv8FUUD0km6x/qlPsac5ZoVTklGWi6UCg1Xi19gLXe7Qtgu65GNV5jfEgsO7nsoXsFdqLsccP/80hAk06fGn6bgHgdqyur/hro/mzm0wdtIETByfxnYHbyz171OmMAMzveLlnU76yRPLxMwpWXx3qgWkmMh1ZJSthw9VIv52tM3lZlkICw1cpwKBc+rvqcJV8G4cqLPx7L2kKsuaP9tnrENSAY1UXBpfxjTo+YC4Sf+8s9GcpvfUjkvD79HMvyJ7zOLBPn3mTRW2EsuE43ov6h+BI3G7yp4NFOGH8jsxcL7IfAuvgJiEJjeVKcDZBTefT7SnTJSPm6xjwiAPXc6pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:11 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:10 +0000
From: pankaj.gupta@oss.nxp.com
Subject: [PATCH v29 0/7] firmware: imx: driver for NXP secure-enclave
Date: Tue, 21 Jul 2026 16:53:31 +0530
Message-Id: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALNWX2oC/2XUzY4bIQwH8FdZzbmpbGNj6KnvUfXAANOdw34oq
 aJUq333mqjKAFVOg/LDfPzNx3Kp571elm9PH8u5XvfL/vZqHxS/PC35Ob3+qqe92MBCQAwCetp
 fbqeLjW6nxAAiEF3JfrH/v5/rtt/uk/34ad/P++X32/nPfe4rttF/syB0s1zxBCfSLMkrR/Tl+
 +vt/Wt+e1naHFfqHLnekTlDW8EQk7g4Onc4j/2qr85c0kKh1CSZ0+j4cArSO271qABAxZBwWqd
 0Dql3Ys77pDGCS0FpdL5zNDhvrlbyZtZA8zr1cBG4d3o/l61QWpXJ8+jCwyHgsL9gLqKwC1ZUi
 xtd7J3vXTS3lbAlyMA1raNDOCCOC7UYwGndwENwOUfdJnlEBonGyLTMQNbqpWiqOtd8hEYAJ9l
 Sk6VaOWFRyJN0h3RWpZctNzFnb1stvuAsuZM0BA5bcogwMofoqE43gnJIhlG27FTnAuWaSwKcp
 O9lHGRLjzUFV9kco9ZJaidpuE7U+9kGQZEkUOaa4ZAex5otQTkGF3FNzHMnYzxknE6oZahg1Ro
 9ZMQwvQGPDIld5/gItAwl4ETWyiQyZYiwk2NbEt77S4u3h6UEnmtSL8MgW4ZAGUO2drbNTNL1c
 jghahmS7FWdvSPuv30+MuQtt0P6iO+5JaKyCeY8vSIkvRz3Kfeartpv9THNNf0hPY2rbRlC9na
 VFER5yi3pIXV8SqhlaF01s0Qh6/BJhl4OSaCWIUjRS2ztHbsMfX5+/gVDrqlkrwYAAA==
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=46550;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C/vHWW6+U62IVM2OMy9HbLU5qevAgXfIURGlGC8CCcA=;
 b=PTFObAMwGP0KIBb+AK925e4okpdqEYUEdjg9t7quohcxoW8pfvrN6DpUHj7Me5G59fFqIZtLn
 W8RnrKie0NPAmFHhLj2KQK09WNSP7sJquFCBRCUObcYK9te9ZQ+hju3
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0283.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 972347da-c6bb-4e6d-f9f4-08dee71375da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|3023799007|6133799003|10067099003|5023799004|11063799006|56012099006|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	tBxsVTDlVLS0FFPtYc1GcNPWMX1NK79mC1Bhoe95Zms3JP14zHclF8jMB4Q8cyw2yC54IEoxC8ma4t09FJfPUZGJ4+5APJ/sCdDE7oFLNtavA2hC7dAJAqeI51xZVZex1PUmPYhplsblAnslT5vbVObvNe6PzYfdp3AvGkugN/L7YPkSOPxfZL2Sc8MOHrBnheW2Ylxgyz8/ScJhP3i9FoYf9FUJuLTtSMecsBHkebEjNG7qoDbt3wpIL8vcxVozGAThekBUcRGq+FUIOX373eMm33i2ClwPsIKa7rYZa6D02+XwUskXQ7zETjMEWMjjL2eRAy8xKXvF0G5xf9YbFpJb9VNv98UXpcJed+8tZ1YTusYZIQspAfRppB5KFb4ChUHkivvYiQurMiaEiGAgCr9QTyoohNg1Dy09iZCsiW6AFX1O3b44DD5mPDGykzL8F67YPdoRqEJekHkwwZ5DXBtaWfw2TZwiSsC7R/TK8IJxvim+Wi/uYH1HrKJ3XKS75ZZ68EkRiAUR4nfg/s5uD8kaCM1QWxvNedlDkWYx/yoXa1i/BUWgqoJm6XI/sYWn/94pdOTpdGZrdNB3ZmdCF7v/9MQ9sZHYtd5C5kcu+2H6H5icaHZg5eipXhG0hUpSmtC2IKj0b6y8TUMdKJnrwvWsZ4sEXt1xi8wivNrdAk7H691wqS/GuSo61SjFGWmxiG14btXL2gYALYDhAe24OQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFNzaUhhajBreU1ibWNINmFqUHhlemUzZDlrcjJZK0lSWDJKSTNsSFJZdldj?=
 =?utf-8?B?L3RmQmNaaGN5RVEyZnJ3dXdQQURuYmRLbXhaVWxCSWdHY1R2VWpnNUJqaWRR?=
 =?utf-8?B?YkNSQUh2RUxLUHdPSkFGaGovdnVVazJ4d3hWYVRZOXVNY0xmT0ZBUUhlZlpM?=
 =?utf-8?B?TEtKL0JZLyt0N1d2cXBETHRQOXB4R1B1cHlSK0RTRHlvZlJDaW5WZVVoUVVa?=
 =?utf-8?B?TUMxSzZldmEwRVdDdmRIWHlQaVVqTUVjcTlhNWVzZ2p0bGdTNXlQOEtNdkRi?=
 =?utf-8?B?K3FSc0ZXbU45bE05U24rUkkwTHR5UDhPK3B2V1A0QnE5VFE0VFFCMmJLcnlX?=
 =?utf-8?B?ZWllM2kwSko3N3VzZFU4dis4ZlZaTHZ5QmZOcTg1dXVYUCtxbEZ0R3RvdHNO?=
 =?utf-8?B?V1lPVWdhcHFLZ1VzT2VTazdUOXpRanRjM3hNaHNZRUVzcFpmbGhuNG5VU2Fm?=
 =?utf-8?B?M1ZZSkYvVElwdXU0cEFuK21oNmE0VUV1T21YZ0hTODV3Q2RnLzB4RVorbEhD?=
 =?utf-8?B?QjB2N0tkM1FqWjIrb0FpSjVpbm5KQ3B1blFuWUxkTFVMSzlwZTZFMUpjd2o4?=
 =?utf-8?B?T1V1YjdhV2lwalJ2ekVnNUdoalJuTzIxenhGVUtnUGZ2UFdRb0hna21SK0p5?=
 =?utf-8?B?azk0cDhOWFU4eHQ2TklwRmhtZzVjSnRkaW1aYVRGOG9wOFhEald3NEd4aGgz?=
 =?utf-8?B?TUZ6RGM1Z2Nza2FuU2NFdW1scWRXeTFqWi9ocFV0UW5rMHRNRmhqajRaMVhE?=
 =?utf-8?B?ZWs4SlgyK0VtWm95emN2cmZCdVFtZDFMeEM3Rml3YUJaZVErQ2lSWnUwM2JD?=
 =?utf-8?B?QXpOV3ZzM0dFaTBISGhZSXVQVkFPVGhHaDdaSXJKRTF4cVpXaHRCWG53bmho?=
 =?utf-8?B?bHhvNWFaSTRiSEpSNDZTWFpPemxsMHZOTjNlVW1JZERPbHY2dmh0VVEyYm56?=
 =?utf-8?B?VSt5MmhQM3Z6QVY3anV3N25sR3I1d1hkV2t5VUdxejkwRnN5MVlYdHR6RC9p?=
 =?utf-8?B?NHYyQ1plRUdYeFplOW1wcU9vcnprMXhEUUFaOVI5ajRmdnFpaTdxc3huaGFa?=
 =?utf-8?B?KzFmS1hOY0Vrem12d0dmdWhId29uSW1iS1ljTlYveXpYRENnckpITDdhUkY2?=
 =?utf-8?B?clgzRFNxVHZoYU5HRld4TXVaekVmRmx2WklYR2VadEJkdW5NK1Uxd0RCRTRl?=
 =?utf-8?B?T05UcDk2cWtYdUlRSTgxWG1JenpuVVpHdTVLQjNRZHIrUzhlY1BXaWc0NU1s?=
 =?utf-8?B?QVo2bGVUOFRxTGsyUkJrb29majlJcktJbmx1N21JeG1mTStZNXRLSWJlUFVw?=
 =?utf-8?B?ZUhZUFh5aUs4NUgrUkVvT1o0cG1yWTBvc0VGanZIcmttVzg4ZE90U1lsK2xv?=
 =?utf-8?B?S0xTd1ZXRzBXb3EzQmVsN2xkWWtNZURXbzBJTnlTeTVUcUZNdnRnL2crRHFH?=
 =?utf-8?B?NEJueXIzbXdReCtEN1ZlOFA5YXNzdFYzVitxT0QrWDl3YmxyKzR6Ky9KaTRL?=
 =?utf-8?B?ckIzd3RMUGh5MUE5dGhhQTgxUXRhMUtaYUVhSXl0a3k0WWRaVUcwUXNRc2pM?=
 =?utf-8?B?ZXlRTkgyZjBvc05KYjJtWkdRN3QzU1JkMmNZSk1qQXUxcmhab1hiK0hhZlFH?=
 =?utf-8?B?SHRjNENBVnBlWDVQWVlPOVhWdWRxMDRTOE9tcHFYQ0NiS0ZTTHdWTnhjeFE3?=
 =?utf-8?B?UFFQRHVhOHVBTTlJS1Zmb3RVdFFwWEJMa3huNXJ0M2srWmI1SUp3SmFGaFcy?=
 =?utf-8?B?dkw1QzdIbDVpQ3FBZExycXAvMVVDNkJPNHFaMUpzTFRBYU5FeGN6YXdMaTdT?=
 =?utf-8?B?YXJhRXd4U29NNnFDakZPTS9sdmlTcElkMDBJQ0ZOQjZoaklkd0ZPbVdDQlpx?=
 =?utf-8?B?a1N5aTdPbVFmRU9iWVNvcks3L2tsQmNTZWEyVVpxcEVEdHkwakdvZnpkSHBD?=
 =?utf-8?B?dHVtRTZHbzVwbWZ6Qjh3SjdlUXZpWVhCT1Rad2ZKVTlPalNrZlJCeTRqUk9Q?=
 =?utf-8?B?dHVnS0dLUXBmZmdNYy9rRy9pczRnOVpKNi9hT1BlMXIwYVMzRDR1dHZVSVpx?=
 =?utf-8?B?RCs1NWJIOWxKUHowcjYwYTJiSkNFeHNCeHphVldWSnM5OFNFaGhvZk5wZ2Yr?=
 =?utf-8?B?TFJDaTdESlZ1Wks5bXFDeHE2ME8yVUMrSnZXcXR5Yk9ZRlVmTzY3enVER0or?=
 =?utf-8?B?NkExQnVTeEh0MnY2UGxlNnNNZkNaaHRNTnhEU1R3SHYzRzFKamFQaTFWSHcw?=
 =?utf-8?B?ZTVRSmJia0hXa0VjWDZlalFaeXJ6VGd0aXl2WXZRUmZzemJGRjZBMXltZ1Vs?=
 =?utf-8?B?L2FWbjdmRWFCRllodmhZRytlY012cEkrZ1NsRm9WRThBUm9RMXRPMU4vYmQ1?=
 =?utf-8?Q?2+igUTV636ECf3szt6l7Ri5rg/LnVguAresTg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972347da-c6bb-4e6d-f9f4-08dee71375da
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:10.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXtCofcfQq2OWS/zVr0RuOk81v3NRYZMbnKgtJYd0vzkJIvAs9rnz9m7llOamf1nVlrqLo7QAEsPCCi8uPlJVlyhsQ16HSlPwYRPRL5lZns25v7l1g8vs5C7rtNdjXOh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
enclave within the SoC boundary to enable features like
- HSM
- SHE
- V2X

Communicates via message unit with linux kernel. This driver is
enables communication ensuring well defined message sequence protocol
between Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications can communicate on single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

-------
Changes in v29:
5/7:
- Fix ele_get_info() mem_pool path by initializing get_info_len before
  gen_pool_dma_alloc() and checking allocation failure before using the
  returned buffer.

- Add a probe-time comment for ELE_GET_INFO timeout cleanup. The SRAM buffer is
  used only during probe, and a timeout means the secure-enclave interface is
  considered unsynchronized and probe fails.

- Serialize internal priv_dev_ctx shared-memory allocation by taking
  priv_dev_ctx->fops_lock in ele_get_info() and load_firmware().

- Move load_firmware() to use priv_dev_ctx shared memory instead of a temporary
  dma_alloc_coherent() buffer, and skip shared-memory cleanup while priv_dev_ctx
  is marked fw_busy.

- Fix init_misc_device_context() error handling so gate allocation failure sets
  ret = -ENOMEM and releases previously allocated shared memory before freeing
  the device context.

- Release priv_dev_ctx resources through cleanup_dev_ctx() before freeing
  priv_dev_ctx during priv release.

- Guard cleanup_se_shared_mem() against being called before coherent shared
  memory was allocated.

- Fix se_if_fops_read() initialization by assigning priv before first use.

- Avoid modifying command-receiver rx_msg_sz when read() is called from a
  non-command-receiver context.

- Rework se_if_fops_read() to reacquire fops_lock after ele_msg_rcv() returns
  before accessing shared-memory lists or command-receiver state.

- Snapshot the command-receiver rx_msg under clbk_rx_lock and hold modify_lock
  while copying it to userspace, preventing concurrent command-receiver teardown
  from freeing the buffer.

- Clear command-receiver rx_msg_sz under clbk_rx_lock only after consuming the
  message.

- Keep shared-memory cleanup in the read path under fops_lock.

- Mark priv_dev_ctx cleanup_done under fops_lock during probe cleanup so open()

- Register se_if_probe_cleanup after mailbox channel requests so devres LIFO
  ordering runs misc-device cleanup before mailbox channel release.

- Initialize firmware-load state before exposing the misc device to userspace.

4/7:
- priv->waiting_rsp_clbk_hdl.dev_ctx, priv->waiting_rsp_clbk_hdl.rx_msg,
  priv->waiting_rsp_clbk_hdl.rx_msg_sz will be updated after
  acquiring the clbk_rx_lock.
- Create a local variable "const char *devname" and assigned its value
   under the clbk_rx_lock in se_if_rx_callback().

3/7:
- Remove file descriptor, shared-memory setup, and userspace send/receive
  working from the initial Kconfig help text, because the misc-device UAPIs
  added later in the series.

- Replace unaligned u32 pointer access in GET_SERIAL_NUM_FROM_UID() with
  get_unaligned_le32(), avoiding undefined behavior when parsing UID data
  from byte-aligned buffers.

- Add SE_RCV_MSG_DEFAULT_TIMEOUT_MS and set the default response timeout to
  3000 ms.

- Replace MAX_SCHEDULE_TIMEOUT in ele_msg_rcv() with a bounded default response
  timeout using SE_RCV_MS_DEFAULT_TIMEOUT_MS.

- Start handling mailbox messages with IS_ERR_OR_NULL() in se_if_rx_callback()
  before dereferencing msg.

- Fix SoC revision string formatting to print major.minor instead of
  mijor.major.

Fixes for issues reported by Sashiko AI bot on 5/7:
- Move se_if_probe_cleanup devres registration right after mailbox channel
  requests.

- Split the changes into two so that:
  - Initialize load_fw_lock and firmware-load state before the misc device can be
    registered or exposed to userspace in 5/7. Setting load_fw->se_fw_img_nm and
    load_fw->is_fw_tobe_loaded before possible userspace access to the misc device.

  - Keep IMEM management independent from runtime firmware loading metadata.
    Add imem_state_mgmt to struct se_soc_info to separate IMEM save/restore
    buffer management from firmware image availability. Enable IMEM state
    management explicitly for i.MX8ULP by setting imem_state_mgmt = true.
    Allocate encrypted IMEM buffer based on imem_state_mgmt instead of tying it
    to prim_fw_nm_in_rfs.

Reference:
- Link to v28: https://lore.kernel.org/r/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com

Changes in v28:

5/7: Fix 10 of the 13 issues reported by Sashiko AI review

- [High] se_ctrl.c: se_if_fops_read(): reacquire fops_lock after
ele_msg_rcv() returns before accessing pending lists or rx_msg.
fops_lock is dropped before the blocking wait; a concurrent close could
free the DMA buffers and pending lists while the read is blocked, leading
to UAF and list corruption. Re-check cleanup_done under fops_lock before
touching any shared state.

- [High] ele_common.c: se_val_rsp_hdr_n_status(): guard msg->data[0] read
with if (header->size > SE_MU_HDR_WORD_SZ). A header-only response (1
word) is valid; the unconditional read caused a KASAN slab-out-of-bounds.

- [High] ele_common.h: reduce SE_RCV_MSG_DEFAULT_TIMEOUT from 5000 s to
3000 ms. After a signal interrupts the interruptible wait, ele_msg_rcv()
switches to TASK_UNINTERRUPTIBLE. A 5000-second uninterruptible sleep
reliably triggers the hung-task watchdog. 3000 ms is well below the
default 120 s threshold.

- [High] se_ctrl.c: cleanup_se_shared_mem(): call
se_dev_ctx_shared_mem_cleanup() to free se_buf_desc list entries before
releasing the DMA backing memory, fixing a leak when the fd is closed
with pending I/O buffers.

- [High] se_ctrl.c: se_dev_ctx_shared_mem_cleanup(): skip memset of DMA
buffers when the context is the fw_busy one (command timed out). The
firmware may still be actively accessing the buffer; zeroing it would
corrupt the in-flight DMA transaction.

- [High] se_ctrl.c: cleanup_se_shared_mem(): guard against calling
dma_free_coherent() with a NULL ptr (probe failure before DMA alloc
succeeded).

- [High] The command-receiver rx_msg_sz update is now done under
cmd_receiver_clbk_hdl.clbk_rx_lock. The read path also validates
cmd_receiver_clbk_hdl.dev_ctx, rx_msg, and rx_msg_sz under the same callback
lock before consuming the message.

- [High] se_ctrl.c: se_if_probe_cleanup(): call se_clear_fw_busy() before
cancel_work_sync(). A late mailbox interrupt arriving between the two
calls would see fw_busy still set and schedule work on the already-
cancelled fw_busy_work, causing a use-after-free.

- [Medium] se_ctrl.c: cleanup_dev_ctx(): remove goto from inside a
scoped_guard() block. Use a local already_done flag instead to keep the
cleanup path flat and avoid confusing ownership semantics.

- [Misc] se_ctrl.c: se_ctrl.h: add SE_MU_HDR_WORD_SZ = 1 constant.
Make se_is_fw_busy_ctx(), se_dev_ctx_shared_mem_cleanup() and
get_shared_mem_slot() non-static so they can be called from ele_common.c
and future callers.

4/7: Fix init_misc_device_context() to return 0 on the success path.

- The helper initialized ret to -ENOMEM and returned ret even after
successfully allocating and initializing priv_dev_ctx. This caused
se_if_probe() to treat a successful init_misc_device_context() call as a
failure and abort probe. Return 0 after assigning *new_dev_ctx.

- Avoid a possible NULL pointer dereference in se_if_rx_callback() after
waking the synchronous response waiter. The response callback used
se_clbk_hdl->dev_ctx->devname after calling complete() and dropping
clbk_rx_lock. The awakened ele_msg_send_rcv() cleanup path can clear
waiting_rsp_clbk_hdl.dev_ctx under the same lock before the size-mismatch
dev_err() is emitted. Snapshot devname while clbk_rx_lock is still held and
use the local copy after dropping the lock.

3/7: Fix several issues reported by Sashiko in the ELE driver:

- Add cleanup helper for ele_get_info() and remove the goto-based cleanup path
  that mixed manual cleanup with scoped __free(kfree) objects.

- Document the mailbox TX buffer lifetime assumption in ele_msg_send().
  The i.MX MU mailbox controller copies message payload words into MU
  registers synchronously and does not retain the caller-provided tx_msg
  pointer after mbox_send_message() returns.

- Replace se_get_msg_chksum() with se_update_msg_chksum(), which validates
  the message pointer and size, calculates the checksum, and updates the
  checksum word directly.

- Remove the stale ret check after se_fill_cmd_msg_hdr(), since
  se_fill_cmd_msg_hdr() now returns void.

- Validate the encrypted IMEM export size returned by firmware against
  ELE_IMEM_SIZE before storing it in imem->size for later resume-time import.

- Add a mutex to serialize population of common SoC-level information stored
  in var_se_info.

- Add NULL checks for devm_kasprintf() results before passing revision and
  serial-number strings to soc_device_register().

- Set a 32-bit DMA/coherent mask to make the ELE 32-bit firmware address
  constraint explicit, while still relying on the reserved memory region for
  ELE-accessible DMA memory.

- Keep mutable firmware-load and IMEM state per device in struct se_if_priv,
  while var_se_info only caches immutable SoC-level revision data.

- Keep the SoC device unregister devres action and devm-managed IMEM coherent
  memory handling from v27.

Reference:
- Link to v27: https://lore.kernel.org/r/20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com

Changes in v27:

Address Sashiko findings around:
Changes in v27:

Address Sashiko findings around:
- Encrypted IMEM DMA address handling, response waiter cleanup,
  service-swap address validation, SoC device unregister,
  devm-managed IMEM cleanup, timeout classification, signal
  handling, firmware-load serialization, UAPI compatibility, and
  timed-out firmware transaction cleanup.

- Use dma_addr_t for ELE firmware authentication and IMEM service-swap
  buffers, store the encrypted IMEM DMA handle in the IMEM state, and pass
  imem->daddr to IMEM save/restore.

- Reject ELE service-swap addresses whose upper 32 bits are set before
  placing the address into the 32-bit firmware message field.

- Clear waiting_rsp_clbk_hdl state under clbk_rx_lock on all send/receive
  exit paths, including ele_msg_send() failure.

- Keep mailbox TX completion handled by the mailbox controller/core with
  knows_txdone set to false. The i.MX MU controller copies the message
  payload into hardware registers synchronously.

- Move mutable firmware-load and IMEM state to per-device storage in
  struct se_if_priv.

- Register a devres cleanup action to unregister the SoC device returned by
  soc_device_register().

- Remove manual freeing of the devm-managed encrypted IMEM coherent buffer
  from probe cleanup.

- Fix response-wait timeout classification by basing timeout handling on
  the callback handle being waited on, not on command-receiver file context
  identity.

- Use fixed-width UAPI fields and u64_to_user_ptr() to support 32-bit
  userspace compatibility.

- Add compat_ioctl support for the misc-device UAPI.

- Bound userspace-provided message sizes before memdup_user().

- Track timed-out firmware transactions with the corresponding dev_ctx so
  coherent DMA memory is not freed while firmware may still access it.

- Serialize firmware loading state with load_fw_lock to avoid concurrent
  firmware authentication requests.

- Fix get_se_soc_id() to use the correct match-data type.

- Fix command-receiver lifecycle handling by clearing command-receiver
  callback state under clbk_rx_lock and freeing rx_msg only after dropping
  the lock.

- Avoid unbind/remove deadlock by not holding dev_ctx->fops_lock across the
  blocking command-receiver read wait.

- Initialize dev_ctx reference counting with kref_init().

- Add ELE FW API command filtering through ele_uapi_allowed_fw_cmd().

- Move FW API command IDs and FW API-specific state transitions into
  ele_fw_api.c/ele_fw_api.h.

- Allow command-receiver registration/unregistration through the supported
  storage open/close FW API flow.

- Refactor shared-memory slot allocation and rollback in
  se_ioctl_setup_iobuf_handler().

- Fix hsm0 device tree indentation reported by Sashiko.

- Address Lothar Waßmann's review comments:
  - make se_fill_cmd_msg_hdr() return void and remove dead error checks;
  - remove the trailing comma after the final empty of_device_id sentinel.

- Validate the series with checkpatch, sparse, W=1/W=2 builds, coccicheck,
  dt_binding_check for fsl,imx-se.yaml, CHECK_DTBS=y for imx8ulp-evk.dtb,
  and headers_install for include/uapi/linux/se_ioctl.h.

Reference:
- Link to v26: https://lore.kernel.org/r/20260629-imx-se-if-v26-0-146446285744@nxp.com

Changes in v26:
- Folded kernel test robot and Sashiko-bot fixes into the series.
- Added MAILBOX dependency for COMPILE_TEST builds.
- Hardened response waiter timeout handling and late-response processing.
- Serialized command receiver registration and callback-visible receiver state.
- Added iobuf round_up() overflow detection.
- Rolled back iobuf shared-memory reservation on setup failures.
- Bounded userspace-controlled response buffer size.
- Preserved ioctl operation errors across cleanup.
- Added explicit priv/dev_ctx lifetime handling and teardown/open serialization.

Testing:
- checkpatch.pl --strict: no warnings
- sparse: no warnings
- coccicheck on drivers/firmware/imx/: no driver-specific warnings

Reference:
- Link to v25: https://lore.kernel.org/r/20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com

Changes in v25:
5/7
- removes kernel bot reported warning errors.

3/7
- fix checkpatch --strict error.

1/2, 2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v24: https://lore.kernel.org/r/20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com

Changes in v24:
5/7 & 3/7
- removes kernel bot reported warning errors.

1/2, 2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v23: https://lore.kernel.org/r/20251219-imx-se-if-v23-0-5c6773d00318@nxp.com

Changes in v23:
5/7
- removed un-neccessary 'kfree' from the func se_ioctl_cmd_snd_rcv_rsp_handler().

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v22: https://lore.kernel.org/r/20251218-imx-se-if-v22-0-07418c872509@nxp.com

Changes in v22:
3/7 & 5/7
- reverted to previous change of using "__free(kfree)", by declare-and-initialize __free() vars next to their allocations.

1/7
- rename the se_fw.c to se_ctrl.c

2/7, 4/7, 5/7 & 7/7
- No changes.

Reference:
- Link to v21: https://lore.kernel.org/r/20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com

Changes in v21:
3/7
- smatch warning fixes.
- Added "COMPILE_TEST" into "depends on IMX_MBOX && ARCH_MXC && ARM64"
- removed "__free(kfree)" & added kfree();

5/7
- removed "__free(kfree)" & added kfree();

1/2, 2/7, 4/7, & 7/7
- No changes

Reference:
- Link to v20: https://lore.kernel.org/r/20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com

Changes in v20:
5/7:
- adds a func "se_chk_tx_msg_hdr", to check the validity of the in-coming message from usersapce.

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v19: https://lore.kernel.org/r/20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com

Changes in v19:

1/7
- Added 9 lines to the Introduction from line 73-82.

3/7
-  Update the commit message for " For i.MX9x SoC(s) there is at least one
dedicated ELE MU(s) for each world - Linux(one or more) and OP-TEE OS (one or
more), that needs to be shared between them.."

Reference:
- Link to v18: https://lore.kernel.org/r/20250619-imx-se-if-v18-0-c98391ba446d@nxp.com

Changes in v18:

1/7
- Wrap both diagrams above in literal code block by using double-colon

3/7 & 5/7
- Collected Frank's R-b tag.

2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v17: https://lore.kernel.org/r/20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com

Changes in v17:
- Changes to 3/7 & 5/7: to wrap code text at 80 character whereever possible.

Reference:
- Link to v16: https://lore.kernel.org/r/20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com

Changes in v16:
- commit 3/7 and 4/7 are moved to end commits making them as 6/7 and 7/7 respectively.
- No change in 1/7 & 2/7.

7/7
- Collected Frank's R-b tag.

6/7
- commit message is updated to wrap at 75 characters.

5/7
- func add_b_desc_to_pending_list, removed the initialization of b_desc to
  NULL.
- variable timeout in func ele_msg_rcv(), is renamed to timeout_ms.
- struct se_if_priv, member variable se_rcv_msg_timeout, is renamed to
  se_rcv_msg_timeout_ms.
- in func load_firmware, move the label exit after dma_free_coherent.

4/7
- commit message is updated to wrap at 75 characters.

3/7
- ele_debug_dump, updated the assignment of keep_logging.
- ele_fw_authenticate function definition is updated to take two address
  as arguments.

Reference:
- Link to v15: https://lore.kernel.org/r/20250407-imx-se-if-v15-0-e3382cecda01@nxp.com

Changes in v15:
- Patch 3/6 is split into two:
  - 3/7: arm64: dts: imx8ulp-evk: add reserved memory property
  - 4/7: arm64: dts: imx8ulp: add nxp secure enclave firmware
- No change in 1/7 & 2/7.

7/7
- removed the se_intance_id structure member variable.
- replace variable name from wait to timeout.
- used 'goto' to follow the common exit path calling "release_firmware(fw);" in case of error path.
- removed TBD string.
- Used ARRAY_SIZE(pending_lists).
- moved init_device_context after init_misc_device_context.
- defined err as long to avoid force convert in func
- added se_rcv_msg_timeout to priv, to control probe/suspend/resume per interface.

6/7
- removed the se_intance_id structure member variable.
- Added dev_ctx to the structure se_clbk_handle, too.
- Collected Frank's R-b tag.

5/7
- removed the se_intance_id structure member variable.
- since added se_if_probe_cleanup to devm, se_if_remove() is redundant. hence removed it.
- rename se_add_msg_chksum to se_get_msg_chksum
- added check if msg-size is 4 byte aligned.
- Fixed multiline comments.
- ele_debug_dump api is updated as part of comment disposition like single setting of flag "keep_logging" & adding if (ret).
- moved dev_err to dev_dbg, for imem save/restore functions.
- moved func get_se_if_name, from 7/7 to here.

3/7
- Updated the commit message.
- split the current patch into two:
  -- 3/7 for board dts, and
  -- 4/7 for chip dts

Reference:
- Link to v14: https://lore.kernel.org/r/20250327-imx-se-if-v14-0-2219448932e4@nxp.com

Changes in v14:

- Patch 5/5 is split into two:
  - firmware: drivers: imx: adds miscdev
  - Introduce dev-ctx dedicated to private.
    -- Base patch before enabling misc-device context, to have the send-receive path, based on device context.
- No change in 1/6 & 2/6.
- Copied change logs from individual commits.

6/6
- moved definition of func se_load_firmware, from 4/6 patch to this patch.
- split init_device_context to init_misc_device_context.
- Different value of se_rcv_msg_timeout is required to be set. Receiving the response of 4K RSA operation can to take upto 3 minutes.
  This long value cannot be set during Linux: boot-up and suspend-resume.
  Hence, it will be set to default small-value during Linux: boot-up and suspend-resume.
- func se_dev_ctx_cpy_out_data(), in either case: do_cpy true or false, the clean-up needs to be done and it is implemented like wise.
  Once do_cpy is false, no need to continue copy to user buffer. But continue to do clean-up. hence cannot return.
  And every dev-ctx operation is done after taking the lock. Hence, two operations with same dev-ctx is not possible in parallel.
- func "init_device_context", for 0th misc dev_ctx, which is created at the time of probe, the device memory management is required. hence there is a difference.
- func "init_device_context", dev_er is replaced with return dev_err_probe.
- func "init_device_context", devm_add_action is replaced by devm_add_action_reset.
- removed type-cast from func se_ioctl_get_se_soc_info_handler().
- used scoped_cond_guard(mutex, _intr, return -EBUSY, &<mutex_lock>)
- combined dev_err & dev_dbg to one dev_err in se_if_fops_read().
- removed the structure member "se_shared_mem_mgmt->secure_mem".

4/6
- trimmed the ele_fetch_soc_info.
- removed the function ptr "se_info->se_fetch_soc_info" and replaced with ele_fetch_soc_info.
- moved definition of func se_load_firmware, to 6/6 patch.
- Different SoC, different ways to fetch soc_info. Generic function declaration for ele_fetch_soc_info() is needed. Hence wrapping ele_get_info() in it.
- Updated Kconfig help text for assertive tone.
- func ele_debug_dump is updated, to remove constructing the format string.
- removed the macro usage for SOC_ID_MASK.
- used low case hex number.
- Condition will never occur, where msg_len satisfy the following condition "msg_len % 4 != 0". Err msg is added if it occurs.
- Function description is added to se_add_msg_crc.
- timeout is added to function ele_msg_rcv, in 5/5 patch.
- local variable "header" is initialized with "tx_msg" and replaced "return err" with "return tx_msg_sz" in func ele_msg_send().
- replace function name from "exception_for_size" to "check_hdr_exception_for_sz"
- replaced "return ret > 0 ? 0 : -1;" with "return ret > 0 ? 0 : ret;" in func "se_save_imem_state".
- func "se_restore_imem_state", to return if the condition is false to proceed.
- removed casting by (void *).
- removed devm_kasprintf and done direct allocatiion for attr->soc_id = "i.MX8ULP" & attr->soc_id = "i.MX8ULP", & attr->family.
- Followed Reverse christmas tree order, whereever missing.
- There is no return if ele_fw_authenticate fails. Execution flow continue forward and execute the fucn dma_free_coherent().
- The loop is not for retry. The loop is needed to load secondary fw followed by loading primary fw, first. This is the case when ELE also got reset.
- dev_err_probe is corrected in func "se_if_request_channel".

3/6
-

Reference:
- Link to v13: https://lore.kernel.org/r/20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com

Changes in v13:

5/5
- Updated the commit message for imperative mood.
- Remove the usage of macros- NODE_NAME, GET_ASCII_TO_U8, GET_IDX_FROM_DEV_NODE_NAME.
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- Fixes the check-patch erros reported with flag "--strict"
- Replaced devm_add_action, with devm_add_action_or_reset
- Removed the un-necesary and obvious code comments.
- Removed dev_probe_err at the exit of function se_if_probe().

4/5
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- fixes the check-patch erros reported with flag "--strict"
- removed the un-necesary and obvious code comments.
- variable received msg timeout to be different at boot-up & suspend/resume and send/recv ioctlis.

3/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- updated the alias name.

2/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)

1/5
- No change

Reference:
- Link to v12: https://lore.kernel.org/r/20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com

Changes in v12:

5/5
- increased the wait-timeout.

4/5
- rename flag "handle_susp_resm" to "imem_mgmt"
- moved the buffer allocation ot load_fw->imem.buf, to se_probe_if.
- setting imem state at initialization.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (7):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: device context dedicated to priv
      firmware: drivers: imx: adds miscdev
      arm64: dts: imx8ulp: add secure enclave node
      arm64: dts: imx8ulp-evk: add reserved memory property

 Documentation/ABI/testing/se-cdev                  |   44 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 +
 .../driver-api/firmware/other_interfaces.rst       |  133 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   12 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   11 +-
 drivers/firmware/imx/Kconfig                       |   12 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  324 ++++
 drivers/firmware/imx/ele_base_msg.h                |  119 ++
 drivers/firmware/imx/ele_common.c                  |  542 ++++++
 drivers/firmware/imx/ele_common.h                  |   50 +
 drivers/firmware/imx/ele_fw_api.c                  |   57 +
 drivers/firmware/imx/ele_fw_api.h                  |   18 +
 drivers/firmware/imx/se_ctrl.c                     | 1735 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  190 +++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |   97 ++
 17 files changed, 3448 insertions(+), 3 deletions(-)
---
base-commit: 78be1e893a8196d509f48064dd7370274f8851b8
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

