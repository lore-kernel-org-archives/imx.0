Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37C33C1A5
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135289; cv=fail; b=Cm0G7CzKr5jp0kfFWRDFHC5wmf3N8IdmV3OMHrwH49eWOqFFGZ+ZgmiIfnpvvr15qHjbwLD/UZ79Qn3+NZicbudcBvsLiuOe+JTNnlUESbuCFgFOoXWd4ZU+dRg7C2fqjVOVXao2F1UceBLsVeWxo75DWzg0RKyizzl8SpkCr1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135289; c=relaxed/simple;
	bh=RTORoJzu8CqC1VRFS9yz3CCxnlJGXtz/dLGVIvsQ2ms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZdP2hcZXwFk3vt/oZjPP+gXxUkw8DI/eChAMeZrigsPObCzTGtl+U4rUQvmYPanq7N25w0LjkQ+Y3Jp/9BozHDu3ESN5PWqP5OQ/QiYsIZ76hkDB8+inV5kcdbXStvlzegpg+80wkcMf39LXr0jTNnN5Wyg1LO0x1rRyxgUvtSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aCaVwPor; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aCaVwPor"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnMyhqs5XXQsGUKOG78NcDv03gvUFR+2cbvLSplHlYjENoWFTz8/gtunwvTsz3PsDzh0f0nCM0r5G3vcP2RbS+lJn2Yrl+xg2tgh1PgOcx20Xj+rlUOrhHLlMe74ZLNFeokXAS3Iesh3hoPvkJxppQKrL5bf7wVdPUiBmkBQG7NWbNkacGoiOTqfjIskVSZv4AEAXDvCqmJpjT2cN3ifom+5xT7QHKvsc5cjZclaq8tIRBE2Hqcj83cNWIfCbCKBi6ZkWgxtZ9TQZW2tVZJcmOed96us8lfa7adHCjTatDdxXMP7vtKd+AZViugSGVnnMLCgSf4J0PEamJ/EoAvM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfUgW5nSzZpyJalFhlUX1i2HytukRBpPhT87+7A1iEw=;
 b=HgXwI9MZY0f0hffcVuQ1gdoys0VQKFh/u/4sNweR7T1RMRhIDrWrEyVYFqTZ/QejCfHAqf0/IwXbmQ8t2zYK5bLztwknd7+CW0EsPxzPHUNRET7vjosnrdmIDtKbowPreAJ+1MP/PhBy07kRkvJSiim7wR5z3zQdHlQ1HOp2LMitRgtDKnpaydDDs65Ex5akfJe0eYRgNJ42w8rLv7aqWkIxZbqum/U8C0Ab78AGNI6WW4DojI2/w8D5h0mwJvCXNAcryhIRHWiaqei/t/ZVhAtWTK8nV07IvYGuqYRcVxZ9GqDm+yGFe5HfekWL/5BgwwjNcmuvZbYXwQK3IEGJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfUgW5nSzZpyJalFhlUX1i2HytukRBpPhT87+7A1iEw=;
 b=aCaVwPorBo4YPQBUCDag1EWH8JT6L+Ff2QshSR3bSqBMFSUCMuApMwkOhf/Ff9adPLjJH867CE3S+AmLnGz5DS09BtOK6KUWP2Nn2yh2qApWU7477o4m1mQUIvfan7UW5LjX8pJLA0wl1W5O1oMVs3XYcu+dRAlzXui9lIMOy07lFfC9IbDbfM644yLA9+QJlFRWJgkV7wVIedH9vtH97aMW5uyx6nDUIH3Y232tnFJNOWCNcENG60WmT7Q1EGK9Ys/7fCVLDoAGU0NJQl8oZRXwv7xlH/+447aHNIw8p7OtYhXziJ227tcDkDEMlvlYzSHyt/Hlzd3802KF0n8sFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:41:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:41:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:15 +0800
Subject: [PATCH v2 09/10] arm64: dts: imx952-evk: Add flexcan support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-9-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afa1ec8-02b3-4b18-242c-08de510eb4f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkZnRjRDYTBtbUF0Z0o3S0JIdUkybE43M3VTdUpGOG4vVCtQaGY5bTFkODVD?=
 =?utf-8?B?aGhMWXZRYVZMMDR4UWVpY09CT2xXMFdXVWF1ZkFHYVN3VVdTSnBkckxQakJY?=
 =?utf-8?B?RDlFNUJ0dmZaZlFDazNvMlNITXlKUVZzbGMzcnlGdjgwcXBOYnJ0TE56cUhT?=
 =?utf-8?B?QkRRL09DNzBmZy9zejl0bFMvS2FZSVFrcURyTFdYcHY1UXVTSUNpamZITFZW?=
 =?utf-8?B?dEU3VjZTZTgrM2MrZHBieE5MVjN4S2hvTWQvZmlXV05LSklNbFRlZ056RjhQ?=
 =?utf-8?B?T04rQ2k0OUJndndUQURlV2dsVHR2R3lpZFJLcTBkY3RKOHF4K09MalUzUk8r?=
 =?utf-8?B?eFBjb0tVTjNCU3BmNTJVWUcyNkhjOTBGbnpxeDg3ZnFuZFlvcytwc2tEblVZ?=
 =?utf-8?B?M1F4N0wvL3IyUmF3NktnZm1hV3hVMVdwRVVCdHRJYlBBbUkvU2FVdXBhN0xZ?=
 =?utf-8?B?Qmx2cjVma0xqNUtnWmtxeGN6dXNwN0FENVF1Z3lvRk5SK0NqMGtjd3puOHYr?=
 =?utf-8?B?K3VGYVRvR1A0TXJWdHlVTWQ3a01lOXdZbFFPS2FkMXlMazVGRDJpSy9FNGdK?=
 =?utf-8?B?c2N4TDZoY0JPSnFYaFRONHh1WXBCTnh0TGg4OUFiMUk5NFA3S3lHS0kxbWc0?=
 =?utf-8?B?VEE0eXZuYU5iUG9tT01SMERISFRzemZ2bURoeERscXRrWmloOWhtd3lpTlBG?=
 =?utf-8?B?UVNhSUJjSWZ1Nyt3TVYvdkZkY1JaU1gyLzdGbGJHNUJUV0hxRHdORHByQnhz?=
 =?utf-8?B?UFpEc2JFaWZ5RVZ0Y0ljV0hRdGt2T29QSm1IWHBTaHVweUF3VVc2c1UrNnE2?=
 =?utf-8?B?blQraVM5cks5Z0FBcG4vVkJ4WElrbERXSWtSUnFoWVVQcVh4N3pmdTlvaEQ1?=
 =?utf-8?B?UFJFN1EwSSsrNC9uQkZTWFh0VytuTy9GT3I1RTJpVi9zSTNqekY4cTdjQUx3?=
 =?utf-8?B?a2xhcWloZHRSdWNhZlhHUXVTT1hFRGo5RGRqWEN2Sy9mNFk2M3BFM3FKL3JR?=
 =?utf-8?B?UU14VWtZSUtqK0xJQWZ0NFJ3TlNKckRoUHkyMTB3Y3o4RUdJTGpJTWpvVy9G?=
 =?utf-8?B?a01GZVJkNk9zNlI4TGpZaCsxN04zdVZrc2srK2ViN2s3aXhrTUExc3A3VWxO?=
 =?utf-8?B?WHlUYjkrVmlFUFl2WEEwM2J2a05Nb21ISE1BeHdhRnQyeUVFNzQzTDhHc3pS?=
 =?utf-8?B?QXVackEzdklkODQrU0lKVVdiVkV5bmNDMmp2WjFTcG52TUxPTGpCODhMdHNk?=
 =?utf-8?B?a3hicmZIM2ZzZ0ZKcHl5L0FLK3NCaGZ6K2tHQzRsZE1yODJQR0R0UlZWKzVE?=
 =?utf-8?B?QzNRdUkzVTNLblFjQTZ5ZHhuemxNWDI5V090RENralRMU2tVeTNNSzVWYU1M?=
 =?utf-8?B?V2xQNHpPM0VZelV3eFJ5eENZNnlLNnU3dU1CWmh6VjNtODJhZjk3cGFuMG1k?=
 =?utf-8?B?QXkrMSsxUkdydmZVNjNnR2RZZm1uN05uRFNzbkJua3RRNWU1TmlSK29kUlQ5?=
 =?utf-8?B?QmJQZXNIaHI0QklXZTZwcCtuM2NnN2pLV0ozQThRcTBXdmp1QzlUSjV3N3pH?=
 =?utf-8?B?WWpEQlVtVEtWRm0xN0gxUnMxanpCMFlEV1Y5K0F2R09aOS80TXE1Ync0aHFh?=
 =?utf-8?B?cWZRWGxRRmxNbWJpYlU3dENld1JPWis4dCt5L2VCTXNxbDR3enZUaU9zelg1?=
 =?utf-8?B?MVlrSzlGQklNSnVIM0FpanpvVTFuL3dPZXQ2eTVyMkZ6U3NuazBzRHFqOXR4?=
 =?utf-8?B?WllyVDhjM2JyMzdZVWpBV1FHNHZtUkV2OXo5UW4zQ1hXR3BnRE9Obk9jVG8v?=
 =?utf-8?B?WGt4dmZmQS8zY29QVXM3U2VEUTR5SkJ4LzFsYVYzQlR4c0Q0YU4rM0hHUSs0?=
 =?utf-8?B?VW1XM043dHUzazdOWm02cE03NXhRVkRGZEVCWUNsV1lzTGpOaXhhcGFsdXd1?=
 =?utf-8?B?RS8rNE5zbkN2dmc1VUpjVmtKZXExVFVFVkkvUG9TQ0RZR0RLR3BaZmFvV1JF?=
 =?utf-8?B?TWFOOGxZVnArWmROdDBkUng5cUJFNXZGbi8waHkrb1UyVzQzS0tISFN4MWVU?=
 =?utf-8?Q?WH3yLF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0I3RUwwYnNoTkpubFVCbnM2R2k4VU1nN3JIR3YrcGF2ZWMvbHJJRjVxTHRD?=
 =?utf-8?B?VmZobW42eHJJUnRWSGxaajJQOTZDcjNVMTBOL2ZNbGsrTExrWHZ1Ym1kODFn?=
 =?utf-8?B?YklUcmZqOVkxM2JCQVhQMUl1ZHFVb2cxbnZTVHpVaUN4SUtTbUtXa2Vhalp4?=
 =?utf-8?B?QW1rcVhhY3l6eXRkdlQ0M284N3dxbExoNDdTaDVHakFPSW5UeWZWNGRHVG1j?=
 =?utf-8?B?SW9WaVJtc2RxVEQ2TUlCamJITGxqWG9vVXhheXRiYitKdlRNbnRScG5nUFV2?=
 =?utf-8?B?d2hudmcyOEJyVG9RbmFwV0NxRlNlVnZFbFNUd3lSR2t1MjYwQzllbi9CSnZa?=
 =?utf-8?B?c08rc0RLVmhvdGZYS2pNamU4L1R0ZTFQcUpSTUhudHpoZHgwOHNTaW1jaFdO?=
 =?utf-8?B?WUdNUVEzOHVhenZ4Vy91ZnI2ZmJVT1MwMlVDZHVEYis3QkRUWVN3YW16M1M1?=
 =?utf-8?B?Qi8rQVFtdWY0SUxmWS9xZUlneTY2NDY1cno2aHVxdnZMZzR3UnE5TmIvV2gz?=
 =?utf-8?B?MC9jSUhwUFBaZmxIN1JOalBlUHNTVXRTL1c1NkZBYlZuNVBHK3d3elpYUVla?=
 =?utf-8?B?b0NpZnR6b3FQZFlrSTYzUHNXNlNPV0pjNXpYZjc2cVJBaTN2SmhQWndMdDQr?=
 =?utf-8?B?ZWtGSkVMU1pzYVB1b1h6aU9XZTJOVFV2clVkbFRjQ0grTnhyNGc4NVhCblhm?=
 =?utf-8?B?c2tCS0s3YUxIa1BtcFJscGpJc2I3aGRTWU10QW52Q1loR0hpU1QxMDN2OUtI?=
 =?utf-8?B?QW80dVQxU2w2akJ3QUpTSWJIN05lUGgxY21xWHlWcEN5MU9HVUh0WnhwY0FK?=
 =?utf-8?B?c0p3NCtQUkFvK1E2OUJrbzRGS3M4c2JPNXZpOElNMG9OTVQ3amtTMG1xSlhN?=
 =?utf-8?B?bjJFUmZQSWpWNkRkampvL0dyK1dxRGliSHI0VVZpckV0cHgxN0QrRFpYSGFR?=
 =?utf-8?B?cjRURUJKTWtwbnMyWTFKV2ZaRTJpUzZLTllDNDJoVm10cWh4WTk3K1BTQXQy?=
 =?utf-8?B?bUl4MExkM0lseVVFMVRiQzRxRFFrT21mN3hXQ0JaaUNEOXRBVFlQL3FneGR0?=
 =?utf-8?B?bXpPd0dNRFk0Q2FkUWxnNlQ5TjBvUmpEYStqcFg3R2JNUDBHNjdydW4xVmNh?=
 =?utf-8?B?TjdTN2F1cUVldmd3R1daVFBWeFQ2NzJjWlpyRkkyc3NRYU0zUUMxalc4TEZ0?=
 =?utf-8?B?NTBhRlZ4TVlNL2NKUDFjSkpZdENEQzJ2akh3QmZCZ2kyN1Z1T2x2amJUKzVw?=
 =?utf-8?B?SVBsV21TWEU0ZXJYcWNCVjVmN2QyelBldmZlK2lpUSsxM3pEUE1MSFRFd3ZB?=
 =?utf-8?B?aUFuUTVwQ3BWbGtETWxCSE43YW5BeUczdmRBenNXZ2JCc0tFSjJmTCtwSUhz?=
 =?utf-8?B?WmdZWE9ocHU1OW5ERW14ZnVNYlpibEt3RzBWMW5iVVEyb1VrVDRvb2d1STFN?=
 =?utf-8?B?aUZzQ3hnRjhJODlBMVN0QVhLa3MvbUVScmFKSENKMHBlNDF5NDFYNUtLY3lk?=
 =?utf-8?B?OVFJWkZEcEVkUHZFOFZSRDJwU1p3a00zcTE3RDlvVHhLN1RHdjJWUzJCbm12?=
 =?utf-8?B?UnA5SHhONUpyaVJHOVRKWVJ3QmRLUVJ0SlYzZEFkSFFBVFBYSy8zdHB6TlZ5?=
 =?utf-8?B?Z0VKdFdyQy9vMEx2aExiVDAySmJ4Q2hscXBmWTA4MkIxTFg4ejBFMGI4RXN0?=
 =?utf-8?B?M0l0SVFvZG9PRXZIWjlmZ3lDdWlaS1VQN1NjMFdxZlJuMFkyaktIT3d2MUNp?=
 =?utf-8?B?b2ZuNnZMc2hzVnl2S3Z4THhTYWFuOFJnRUJxY0V3eWE5RWo3RnhOUWdMZHJI?=
 =?utf-8?B?dFRFMkFDSmVlMThYUXhPSDFvZjVKQ0xaOC9nbkhTaUNONWJIYjdiR0JMZVdS?=
 =?utf-8?B?YmxDeGVGWERvc1EyVitkckVNaHI3VnRhYWFjNkJWOVpEQWcrVFlrZUc4YVF0?=
 =?utf-8?B?b25wVTh0cEoxM3dOS2hTaUtKcVhlYzlvVVJSWDNFK2dLSHZpSFZFb0FqRXdF?=
 =?utf-8?B?Tlc5cEtOWUMzMXU4VG9VWUJ6NGRUZkFaYjNtektKU1BSdmIzenhPUCtUbzNK?=
 =?utf-8?B?clpXN3hwYlAyQWpxL0xzU1JqelVlZEI1bldoTnJZWS8rbGFmQXAzL3pIUnd6?=
 =?utf-8?B?bWJ2bmU0czluTk44NDkxMW9Oa2N1RmtHaGJHQ3UrdmlhaHN6WXByNVMvL3Bv?=
 =?utf-8?B?WXhiSFVTaHAxZWs3ekdza2ZUekFsT3B4Yjg5VWdoMjU5cFRhbmgwaTFTN0Vp?=
 =?utf-8?B?Q29sM1NlYjRoQTNJYllFeE9Kb0FBOXdJZUJzQ2JrOGE3YnZ5MWFkVzd1SU0r?=
 =?utf-8?B?WWZFbUlCdmpmR1FFUG1NM05DYVExS2p2WVAvYzUrWWVSOW4rVEZ4UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afa1ec8-02b3-4b18-242c-08de510eb4f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:41:14.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gX8limYTrd8AYv6HqbDUpkEyNrmRTvyLckH1AOYLKlMrvIxbv1Cpm4WnI1WA5oKe9TZhtDtULPFbWa2FNS/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Haibo Chen <haibo.chen@nxp.com>

Add flexcan support, since flexcan1 share pins with PDM,
default disable flexcan1.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 21b951a2156414819dfb589e5e7e736e7b1fe48a..bae7b88f8229babc42952b7abbeb912cbefc10fd 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -64,6 +64,22 @@ linux_cma: linux,cma {
 		};
 	};
 
+	flexcan1_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&pcal6416 5 GPIO_ACTIVE_LOW>;
+	};
+
+	flexcan2_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&i2c4_pcal6408 4 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&i2c4_pcal6408 3 GPIO_ACTIVE_LOW>;
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -108,6 +124,21 @@ reg_usb_vbus: regulator-vbus {
 
 };
 
+/* pin conflict with PDM */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_phy>;
+	status = "disabled";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan2_phy>;
+	status = "okay";
+};
+
 &lpi2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -340,6 +371,20 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX952_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX			0x39e
+			IMX952_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO25__WAKEUPMIX_TOP_CAN2_TX		0x39e
+			IMX952_PAD_GPIO_IO27__WAKEUPMIX_TOP_CAN2_RX		0x39e
+		>;
+	};
+
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <
 			IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e

-- 
2.37.1

