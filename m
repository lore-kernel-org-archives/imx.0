Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585B21ADA0
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002867; cv=fail; b=QeWcM8OTrOYeO71fuU8P7W3V6+n7VL/umLglVPPItH9ULcKdEVwqvAiAnu0Jty7Yr0W7F0siWBBI5VzqCH3mSunRGwd1b8A+lbmAyjuMEMGjtpCLoWNuFLJ87bTkXeCwrqK5DkOTTad4aoWltCO4PA7UfdDtd+7KNdzTQJwGP9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002867; c=relaxed/simple;
	bh=tRb154qA3miZS7cafuYR3FaC8nLXuZj/ptA/gUvUnlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WraPlL6H34PmSit8y3jiaSa9QYVEEdCLv9j8PDZhBFr+/ytPTKjovEdvHNitp3Z7/gEP9Lr7nfz4gAHP1dxCZBqWmYqeDigZ3sx0pFzlqd+P7fqu1thUj/pl+vCyu9sR+dXThE3s8DAHnHp0vyAO5sp8Ff4Vgpb1UMxkKRcKYno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SutFZh17; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SutFZh17"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4DRXMJiMMdq85Wc0joM1lVcvEMB8HOTgzFECDCAvNteNkg0hI3CY6GRVRX/Zga8lf255/Cb1JXDgm7YYjR4PBq4ZMHRCaH/c5T2NUugH3NTT9Ys3opu4SL8ISOiiGqlIgmO+kGgI56arrMsw9QYqNh8MWunPLrzqVJ17vEGtOUE61KOoatooAidNMTTP/iSj9ggkWzKsoJujI0x409IuFHEQ6xrgIusscAFU9CvqmZQpxq0axciRygCVnkq5nvcCtST84P9oyuXvGbM2KeaN2ptvyfOr6O1icrGTelTEWgNK6m2dKB8W1V53YTW7vMNV5U8cbT5Cm4QrHOwkbUMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9UwbL1DvD9EpRZX3AhxZo/+d5i2i6tgwki0qdunN00=;
 b=iwWbmtp3R6PIRoN8TyY21vugoAmr5BH2WzU2i0Pm9pnyZ0qVmp/I83D5+xCR3HlyHBzOVN6/PsHC6e556lJMD9tmFz/P+a1tJK4YWmzrFxVGE8J1tkcRoOAxyk8dU9lKPu9gmQKFKVkETNBId6p20sCqKL8PNnmC7VGHISo7M/GW661LDckB2nbuyRq9XD026rSozaRBEWXhedWmSQCfEwxnwC58dhzOWLn4EAPXsTtgOtASfb0eiK+HudaIsEnExSX79JgvSPQfOUTO3qCcNRXEEyYb67iMBFdA6nQSp0dtMobYxl5lkqMTpAKu/pEnH3s6aVzfSVsgR8LyFwbX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9UwbL1DvD9EpRZX3AhxZo/+d5i2i6tgwki0qdunN00=;
 b=SutFZh17blnM4w4uGsCCBzctDBwDgvaMWLEORYvj1jtet8KgnsomsphMCiGxieCGcEBgNdFKcRy1yUilLvIGJMdikwTLh3rVUxGudk5IK/NygWlVSHHKX8s4nukviuSXIfNfysbKH31HF5pxY2MyosO8/Sf7ElnjQTqUnu36O3mbbkpqwNr6SobinokDL/g9h7tMfjLxeG1JWfnF4zmqcB0eWbhaMdfiCYr5TsjOWIPMGkH4UVxgtOPoC+lytBpbx22XqsRrTp2Zu3XBJnMTguUEpOWsGeeEHgyDelOrUohWXdkFSsH1jIREsszMKM8Qygme37AFYGAENVk8Sv0hTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7458.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 08:47:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 08:47:41 +0000
Date: Wed, 30 Apr 2025 16:43:43 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	swboyd@chromium.org, heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/4] usb: typec: Stub out typec_switch APIs when
 CONFIG_TYPEC=n
Message-ID: <20250430084343.v3mu5sm2rpvmyfu5@hippo>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
 <CAOMZO5BrENeZ2A1erDupCTfMypX-Pd482o1N1eF+wKEL3X7HZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BrENeZ2A1erDupCTfMypX-Pd482o1N1eF+wKEL3X7HZQ@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f1651c-1990-40b8-3b4a-08dd87c3aad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEgrUkluemlOamIzV0gvNFJicGFlRnJvVGEzODN4N1lMU1AyUmxySzZRYTFW?=
 =?utf-8?B?RzdISEdpTDFYRHloNWNjaUJycnpDOTU4N2tIbjQxTmI4L2s0QmlvaXVaZjE0?=
 =?utf-8?B?MXRaQkdrK0x5RGxqOU1EZ1RyMXIrMVV1UFFrVWgvWDFUWWdZUTkzL3BLekhw?=
 =?utf-8?B?cUJsS1BDdFhuN0VBMEpxMmR2ZzFQVGcxVVQ4R0NPMEFHNmV5VU4wRmFaK3lS?=
 =?utf-8?B?SEt2Lzg1RmQ2K0xObVBzUHZkZWc5OVNQT0xPL3hSRFlpVHEvTkRMOUFLdm5Y?=
 =?utf-8?B?QkFYSDVlT0JmUE5LVmxFVzZ4NURwTHBiay9BVGkzdDhMYTNjRjJ1L0cxN2N3?=
 =?utf-8?B?aXBMNmxXWjczRTJxdUJxRTNLaEZveGdhR3N0UHUrMUZnM2FCTHkxb2hCQ1M3?=
 =?utf-8?B?THgzZ3VER2pONFdEZzZQM3ozTm1qK1ZMcGJiWjJOQVA1dGo0U2dUb1VrS1hJ?=
 =?utf-8?B?cFVGYXZuQXlKUkJ0V3d4bzJUbXdDb0FxME00Ym9zMmpkWkxod25kTFA2RGlS?=
 =?utf-8?B?SFpZN05VdmJqZjg2VVVwQlVmSmtZdnJQdkFPV0doT2x4c2lGTWVBR01uY2Mr?=
 =?utf-8?B?WlA0QldKRG1yL0U4Q2svRFhHZ1pyYVA0eCtocFRtVHFUc3pWdTBnYTJMN1E1?=
 =?utf-8?B?OWVRM00rYUhmZjFOdDRSQnRBTk1WOFpLeGdSTnI3MVpSTUFHSGdndWJmaHdt?=
 =?utf-8?B?Ym1OTVFVSE0wZ1p2TnllMDN3NzlmRk5UZW1sUFFNN3VyTXFqU3c4Q0tiMEdl?=
 =?utf-8?B?OEdsZDUydzRGMnJwTThmbG5ja0plRlRQbUgva204OE5yM1Qxb0dFeTNSOU03?=
 =?utf-8?B?SjNnWDlkN3FwMy9IeFQzaHBQbEhHWGp4aFJmTVcyMHhzdllmTDRLZW1HR2FZ?=
 =?utf-8?B?VnhSc0hmVE1XSU9lQnhuaytUcDRJSFd5S0VidzhHcy9tQ3dIZzk1RXFqMVJa?=
 =?utf-8?B?Y2ErVmpCTXRacWdiY0JMdWZyUkxtd29aU2UrMmtUYXdLU2h2TmtNdFQzRkJ2?=
 =?utf-8?B?QlJ4QmxTNUhqNEdqNWwxYlVURTMxa3FERVRZVWNvZVVZWm96bXYvM2Z5Wkc1?=
 =?utf-8?B?bTJxelgvclFJNWVMYTBQK2JPTFozYkxhWGRYdDMvZDl1bTdadUsyR0FnRHg0?=
 =?utf-8?B?MnBMSXdYbUVCcGw3T2NCRGRpcGJJY3lLOTZTRm5FVENKazZSMGtwVklONWNr?=
 =?utf-8?B?TmJBcnllVGlnNUxTcDdaSkZqR0psTWQ0MmtnN1lhZUtUVXhpZCtNeldKZVg3?=
 =?utf-8?B?c3pMQVp5YUxVRnUrSHRGRlgrM3VNdW1mSUIrQ1JXRmNQcWpuek5uejkrMlkw?=
 =?utf-8?B?QlJIaWJGKzhyaFR4VXcvR1RLZy9MRW95M1FiUXAzeHlJcFlnVHVORlBPOW1v?=
 =?utf-8?B?ck0xWVlCSEZ2WjVTR095eGxSSDN1ZHc0S3h6Kzh2WDlKdDhST1hkTGF0bjdE?=
 =?utf-8?B?T2xXeCtZbGlFNy9qSHZ6QmpJbmxOcTJleU5ucjU3Y0RraE9rLy9sYVNvSE5O?=
 =?utf-8?B?cjYwdSt5bTE4djVWUGdncDBaNjNIa2RpUFRndTUvN2g4TTFaTjFmM0NmcHRC?=
 =?utf-8?B?UkNrOU1RL1VRNXJ2WW40M1JLYWdTcUl0VnpXRGhudTVHVkJ3dUUyYlNEWmZI?=
 =?utf-8?B?RjEwTUJxM1R0QWFhTGpQdWJoVlNkR1VyYkpDdzBaR0RFZXlwa1RqQVFHMW11?=
 =?utf-8?B?QlhnbXNlWGo2UzE2VVlaTDlic0JmekdiNXJUdkdBRGpDa0xEMWpOTm9zK1RN?=
 =?utf-8?B?MnpBWFIrVHN3ekxuellMY3BoSTJSZmQyKzBJM3VuajFrcmpZU3hEWUc3UU5D?=
 =?utf-8?B?UEErb3R5aEQzeDFDRWxtOVcrY0czb2ZFUGRndGcya3RXYWhOOWxxUXBaN1hE?=
 =?utf-8?B?WlZiV2o3Rk1vZHY3RWFORjA0UjJiNmlpVXVVVnNUWmdmc3dMMUNaMHFZdmRr?=
 =?utf-8?B?Ykl5VnVTb3kzSzNvN2IyUXBiNFVaZzBua3pxZFQvTi9jYm9Kb0tEN3E3M050?=
 =?utf-8?B?VlJSaVQwZmNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXkza3d2NDNaWnpSWlYxRUlqSGFCZE9nSDlBNktCNWZRWHp0cjdQZEg3Q0dN?=
 =?utf-8?B?UXVxZDQvODBjNUFWVWVpb2tGTExzSklma2pmYnBCd0xLb3JzbzJ4VWFFS2xp?=
 =?utf-8?B?SFhyL0loZ0NiWFkvZzJ6ZXMwVkMrS1czU1JvQ0FuOU5xbGNyUndvdVNRMW4x?=
 =?utf-8?B?ZUdHQzIydTRDV04yZENIZXk3aUl3Q3QxMmRyYnNSSlliSUdQcXRXR1BhdXhE?=
 =?utf-8?B?eTE2T29IZkRNVVFiT3FQN0V4ZFZWS2hqS3l0SGpuMHR6bE5LSVI5WEJXNjI2?=
 =?utf-8?B?NThYT2NhNE14cXBjNlFqbDV1cVYzQ0RBSDBTOGVDZ3pDQjduSXBwc3o3SlZJ?=
 =?utf-8?B?Q1RaWVVTamdqR3VLaXE2bUxSOXRKaDFKelFvczhUdTZvMFJaUjFYdHNWU3R5?=
 =?utf-8?B?TitNdW5IMlJFMXpMTGJzSFU4YXl4U0RCek1RaDN0REk4Rjl3REJRT1lraVFG?=
 =?utf-8?B?TXQ4b0MrNDA1ZGpoM1ptdDhYb0d3TE5sS3NMV1lmTmtmbUwzcjhOUVUvSDNn?=
 =?utf-8?B?cmhibCtmQjdHL2hGOW1nanBreVZFNUlXU2hFb2NHM0ZEM0JyMi9YQlhYL2J6?=
 =?utf-8?B?WGxPSWo0WG1HdmZqWFJ0Y2dERFMrcHk3Wm5icWcrMnRJQ09SUmtQY0RQU2hY?=
 =?utf-8?B?RWtDWGdaUGVINVd4WEx1bkx2SHloVFNDdmswcVZVQXk3eHZJR1RESnp3bHla?=
 =?utf-8?B?WHdiVUdyVjE3dzlxbkV6TGpnSTAxRTVCL0NaQXJ3TDB5aEN1Z1FOL1FnaFps?=
 =?utf-8?B?bkNCbjkyNFQ3MFU0TjJlaWk2WWdENXRlTmw3NkFxc01sVUs2LzlKb1V6d3FH?=
 =?utf-8?B?OFVzZ0x2Y21zcWpGTzlwa2pobzJNL0t4UGdXSFZTUit0Z0FXSzZwMEo4SW9s?=
 =?utf-8?B?WjAwWi9TOS9aNjhFVWlEcXhpRzl0OW9xMWxEV25tdlp1cEZCbzd4aTVUQzl3?=
 =?utf-8?B?UnQ4ak1uYllJbXdZdWxGSERramN1WXNrZEdvUUo5L0puTjE0clJndklPWDNa?=
 =?utf-8?B?MkJnbDJoeWZ0cFJobUZMWVdJaDQ4SVcrUWtiN0FSSzlqQUw4enJGV2xtbkZX?=
 =?utf-8?B?WnN1SFhiTGFwS0ZTM1FXb3ErMXZUR004Q2dIVHB0ZHJIOS9lOUNnUm5SOGhQ?=
 =?utf-8?B?S0NNa21Xdmk0TDlTSU51UWZMOU50c21ndzNxSERiaUpzQ2M3b0dMZ0g2VlF1?=
 =?utf-8?B?bE04SkttMnQ3akU4VmdmSE81ek5LNk1WZ256WkZlZEg3bW4veVppTEY1bVMw?=
 =?utf-8?B?eXZBaFAxeCtJM3p2NU45b2l0SDhROEtvL3YzTXErSllLRjhSNzVqeWVodEx5?=
 =?utf-8?B?ZG41V3JMeHNMT0dyVlBoOWRNWXV6SHJKbkYwdDNDUmpvcDlEUjZBSGEzSXdx?=
 =?utf-8?B?amZXWmlsaFFkMzlxUVY5Q0NrWjB4azRxa0FpMC84d0Z6VzhBd0NkRmhzeGZ1?=
 =?utf-8?B?d2R1MnVEdUdrMEIyaDdQNGpyQmx2cUQ1cmZMNmhGQUdFSnhYWFc1b0oyMjVV?=
 =?utf-8?B?U3A2Y3Judld1WURaS1JCSFBWRnIraUFmSnJDd3VCOVBQcFhjVWRjVVhGaVEv?=
 =?utf-8?B?Sk1yRWM3dXN3K2lYbmY3RGcxaDQ2bE5GMFloOVI4cW9YeERtOTJiSlVPSmdZ?=
 =?utf-8?B?c0dlbDlJZzgzSFlBQ0plK25GR1RWYzFMTCtvQTZkNno2WU9WSWZackhYS1lV?=
 =?utf-8?B?YzN5VWttcnlGUjhxa2cySVNBSlFIVHRCT1dYRW5oMFgva0RRbzZ5WlFSZldy?=
 =?utf-8?B?OUhUN3ErcWJOendicWFXbHFyN1pNWmxLYVdJMHdnem9PeEdqd0l6dGJqWE9u?=
 =?utf-8?B?Q3BKYmNneHpOMlVIYmtWckxLRHhETlRzeTFBalNMci9XY0NCaUJkT1lYdUFz?=
 =?utf-8?B?RWU5algzOWg4akRMaXZQdUY0MzJkOHRBb25NSHlMR2NubDlvMjF0RkdjcE9V?=
 =?utf-8?B?ZkdkQnVISm8ra2FNYkRUOHhhb1loRC9wM1Z4aUpIaTlPdlI5eTRpdGsvYjBy?=
 =?utf-8?B?L1h3TnZIdWFoVU15Z2pyRXBDOEp4RjgzNHhXL2lpWlF1QzdTMXlIcElsZWtY?=
 =?utf-8?B?L1dSUjdTWlVaU0s2RUZCRm5RbHQyNWVQLzgrRDZNMXRZbGNER2trYXNReTN4?=
 =?utf-8?Q?lorjEKrx11cXFUCByfppn2ReB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f1651c-1990-40b8-3b4a-08dd87c3aad7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 08:47:41.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ompz2aDmR9xOSheplWVDQoN8WxTLrr33wqouAlFlvoEpbk2yw9MGttwneSGUChbVkDetQeu650gQrd5gjv19IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7458

On Fri, Apr 25, 2025 at 11:04:53AM -0300, Fabio Estevam wrote:
> On Tue, Apr 22, 2025 at 8:49 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > From: Stephen Boyd <swboyd@chromium.org>
> >
> > Ease driver development by adding stubs for the typec_switch APIs when
> > CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
> > consistent.
> >
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> You missed adding your Signed-off-by tag.

Okay. I will add it in v2.

Thanks,
Xu Yang
