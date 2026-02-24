Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C223B61E
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965452; cv=fail; b=YpX8Co4jwH5w+mlPDEFJChQWdCA2x361aFdecZsU7ZEK4CJQYMcxnNCT/A3H3S7QP3nlvA/ptbNxdXnxWM26o3Nnu3q5vzI1TQ2GdkDQkc87d5x9d5D0xZVVSQj2cq3uxWKgpPjWnXBxLGKtfKju6V6EGXTX8Ek8OHBU10d3qIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965452; c=relaxed/simple;
	bh=8a6bFNUgkRZC74eGrRJf97d5ic/OXdGjpFwQVrbKPIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GxeVI9gHS7XpOr0JwWNt9uhUHB9l3OE6e3PYgl7Z4aaAz6NDhIqnVhUBiIVctO5SxWw8sdxUurgCXj9I3FQpcbBEOfFj0I/FofB35Arf0qEGt2cbWjdWztvj5Ao2IHl3SbtizGW7kdsNmJbWT8qt3Hw9SQovTwmC3+3WNA7dvLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m6b4vd3T; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m6b4vd3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRpNATboK3WX7Es1ZtxHBiwG+sls69UrJZiqp283j1J7lBChlNYaL/ffKvm9nrVPG3DisW1mmuj2zpLi1on3i9/PnywsvEfXEDJHRFmA8pAxRAtRCU52ds+ibzhWMZevHGzQPw7m3LJDoQA6ntuYg4NdIvw5O1m0KOZb32TUVX23iWUcHizwCNeE4GAWHiw4nJKV18DO9cf8MeT1N1geA9zt3HevoYjs1TKLfEHaEek+wA8OdVNt3eozztEjz4bahBV45MAVhgshx1I4YLNXNzAiHmCT95LYoRLNhMSc1MlhAQ9LKoOh5KaE4d0ffVZsYYQXl2Qx8BbK650MVCiCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BQT9eNnONC328z1rdwJXA0moKrQY1RovGmp0NYq7cM=;
 b=Ju3TVV5BXnZyCp6pI1PGr3EIqpJiRVOglaRVJk8rG+gEFIq9nWNr1OvWZCcAlQ/V8AyRTY0ZFVzsuTAgaACicCAJAbwbZmb+p3sTLYTVLM7LFKjL6/Ik9A3txjSLgghNihyJX6giEwkACjVOat9M9z0riTgxmWNvxTdtUNPoylGB2WAKTVON2cGltZenleGN6Ku8Wf1G8boGiEtxWolDcoQ0V0Fsc42mzp7fG7v/iPPvC5e9KQ3f85voOhBeo9Vkim//0gqGV19AhOOJW7gacm0mYjZXEDYGzSOck8gEfMrgoFj70XuA29C7vJLrbN2BiVWKX0gCuAipNpg2Qa5GZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BQT9eNnONC328z1rdwJXA0moKrQY1RovGmp0NYq7cM=;
 b=m6b4vd3TMj+0PjSbjbR7ewo3ZACemIVgBcqkus/N7RxpP2xP/wBdvSrPX4O/3w/BcVJoxuE2LMOv4hQODlir+ukOuuXf9TkwpATYJeZhFYoMHfYf3tpKS3CoSKZP3nSqRzvxgXGzP46lve/WyMTUWKRXdCN6XM4/GbcEWLk9ZuDX06nRtwhe6Rl12O/p4C3oiAHiNVz8JtXWotulopqbkeocLZrjIfSECDUCZlCgoZQYOHb447U0Qwm6Ytwt0pVcR1feyq3lxx5kVGVaDz5NTzSDjqvAyvqsayO8UDKmEk2UUWay1BSW8qFPXHqKzKFWNCop05o2fn+vprqdAhKXrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10379.eurprd04.prod.outlook.com (2603:10a6:150:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:37:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:37:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx91-tqma9131: improve eMMC pad configuration
Date: Tue, 24 Feb 2026 15:37:10 -0500
Message-ID: <177196542653.3315318.7982448705732136046.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0080.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10379:EE_
X-MS-Office365-Filtering-Correlation-Id: 9793344a-9d5c-4432-2acd-08de73e48684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFRSU2xCMlRVb3J1WVprL0V4d2tXWkszU2N0TnZrL3pZZ0V5V1hwZTJVQndI?=
 =?utf-8?B?RGUwOWIxcVVzQUJEbFFCUmlLOFFvNDV0VzlCUzYwUUVaUWR4bUdqUHlmSlpD?=
 =?utf-8?B?NlZyU1VWTmhLclVhbC9MYUpBVk8zZEJ5ajh5RWdrQjFHNTFxa09nOWxGVkhD?=
 =?utf-8?B?djY1Y1BpZDJ3TVVCVnc1cGZlQ1ptZmZ6aTd0dUZHUjVhNXVVMC91bWJQQjdi?=
 =?utf-8?B?a1d0MW56SE0xekxEa0k2RnNNTFZYN2dockNSNWFmRjJHcEVWWTZWMUtkSnV4?=
 =?utf-8?B?alNJQlFwOUt2RkRZWlo1aWRJWEE1c1dkSGdodHFTRzFQR1B1K0VpbGtqeGVS?=
 =?utf-8?B?WFFwQ0ZGbSswMExoYVFucXBrYUlSOEhENXJLNTNmb2pBby9JeVVjeDYvUS96?=
 =?utf-8?B?djQ3aTI0bW15YTBJRnplc1RTOElKU0hYVHRmS3JENURBZ1EzV284UGVJWVM2?=
 =?utf-8?B?OUE3RnVTOEVWZFIwR1A2bDVLTmdqNWRCZWdiWFExNXgvVUJxWUFmYzBGVXd5?=
 =?utf-8?B?TDBiaytNb2pZZW9BZzVoWGNVenpyVzM1NXJqd2QvcFNDM0V5TUYzajc5YmlY?=
 =?utf-8?B?c2VWK3FJQ3laL0hXWEtFS0M4U1FNZXdORUdwK2hkU2FSZmpZNStYeTRVcE5S?=
 =?utf-8?B?QmhmV1ZHS1dsTUVDVDllVFJyQ0drZ2hrTXMydjZ1SUlCc0F4SVRVbEVBZ0FD?=
 =?utf-8?B?T3dUczM0ZnBxMklJTzFQalpBSlYzMDBBakVTb2tsOE9NcWRPOFFEM2xXWUFJ?=
 =?utf-8?B?NEMzTGVhc3p1V1hvVUJDQ0lLWEpWZUs1a20wOHF4ZlgwV01kZHRHUEQvaVJw?=
 =?utf-8?B?OTVyUk5sODNJRTNaOXl0N1Y1VDlQbmxzSVU3S09vZlJKSmxibkoyRFFHM2F0?=
 =?utf-8?B?aEVxdU50QXdCMkFKai84NTE1d2VNVXEzczlwM0x5aDZoak1wOEVMYWZUT2h5?=
 =?utf-8?B?b0prejFSS3JlLy9CSU8wV0hBdFNtbXREZEowaUovam5DMnc1N2g0MVpHMnlV?=
 =?utf-8?B?eG9ad2RiTDlkVHdpaXZlbWNZdzhQNmhnZTFxM01kYW5pZkpMS2xTMTFSUSsx?=
 =?utf-8?B?Q0NLbHp5Nng0elJPN2JDL1Y5Z3Z4WExIcVowa3BjbGxoWm9xWHVta0VJOVpJ?=
 =?utf-8?B?QUE5cW9kemRRS3ppMWVUZWRQaEZ6Yjd1TG9SSERqcStISXQ5dFNPa2dsaWx5?=
 =?utf-8?B?MTlzZkFWeEgxcDBIOUJqYlBNSkV6Y2M0ODQ4WkFKSVlmQUZuM1VHaGZmajhq?=
 =?utf-8?B?QnFYUUdkWkxoZTduWnU0cllnb0FnSXJ5cEwrVkNzakR0MjBEU040bjlHelR6?=
 =?utf-8?B?UXpJT1FvZEdJU1h3Z1dZbTE1NmprY3NJdk1IbXpXall0R1hqcTBnNlB2NmhM?=
 =?utf-8?B?dUhSNmlqdEFKbjB5dHlLMkhXc0h1SGNqbVZaaUhDTFdsK2VQRVpKUFgyNUJk?=
 =?utf-8?B?SDJnQ3VXZzYwU2FFand3TWJyVzI1TFlxQ2JrSjYwYkEwMktPV25pVnRIeGdG?=
 =?utf-8?B?L0JVRDhVeTRTRGkxMERRQ0FYZXNhQWxYSUw0S2RLZFZraWUxSEpoQ2JEOEZQ?=
 =?utf-8?B?U3QvcjlNM2ZrUTBFbjdxYjV3NlJGMk92MjZyQmx2MUxucy8wdXZkMG5JcXc4?=
 =?utf-8?B?aFk5SG9jWjZZN2d6K0tOdjFqY0JUOTkwaDF3Yjl6ZDVQYmQvR2s5alpGREZx?=
 =?utf-8?B?R2NJcjg4RDlUVHNMaCsxb29MbTRrTWxEbmNPWTNWS2FTdXpyY1lpcXJhMmh2?=
 =?utf-8?B?azN2YXNSWnZ4K0NXNzBEaEttNHdseE9md3gyTWRqZXJjelJxWnNqeDFTNzMz?=
 =?utf-8?B?TFFMUXVRYVFkRDNId2NaNlUyVnJheFFHM1I3dGN1TnNLa2NnOU1OV1owK1li?=
 =?utf-8?B?WGR0ZFh6UmhmZG5TWXpteDVieHo2T25YMzFVZUsybWo5WThudHEreCs1M3VH?=
 =?utf-8?B?dXlYMGZ4WDhGeDJaQVBTYjVmRGRNNWJGczMra0xLc21NcWpHVmdEZy9mVE4r?=
 =?utf-8?B?OEN5UVRFVUZWWmdhbkxzNVBuUXAzWjlmSW41TDN3N0Ntb0UzdUtiRldPZTlB?=
 =?utf-8?B?OGJnc2pmVDB2WjJINEZRUjVFRDY0YmZKQndsVllkMGZhdGFKbUZ5Zm9OdVli?=
 =?utf-8?B?VWNHQzRsMGZzdFpGV1pqZmZjYW1VRXFTMzZNMmo3cVNmWWQ5L2orbWY0cXJV?=
 =?utf-8?Q?YkIX94Onm17A1pVTeuasicI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEc4cDV4ejdEL0w1QXQyNkhBTURFS2dGSm9DZnRHeE5OZjV5QzdxSVU1NEtz?=
 =?utf-8?B?V05HNkpSVWtvZlR1WnBNNGJKa2NMTmt4ak11K3ltcHJwV0N0bjcxYXhnYTJx?=
 =?utf-8?B?emxlQ3p6MFpQK1NYTGxNTEk1TUd0WVV5eGp6ZlVBa1ZUSmE5djJjbWRFSGY1?=
 =?utf-8?B?aFd0MUpROVp3ZWJ2UHpjRWd0d0JNWTZiUmNnWXVvc0g0WVdoZDYzK01DSnJs?=
 =?utf-8?B?Z1o5QmZodkdJK2tOcXh4dVQvbWJlcVZLYTdHZ0lBYU1VVkdrWTJBWFpkWk1y?=
 =?utf-8?B?Mi9vNXNIUnVFd05ML3ROU3JnM3RMcE1TVTRoSEFaSFZrdGw2OVBhTlUrTFFH?=
 =?utf-8?B?MDhpTFYvVHhlaENHWkZ1UEJLazhRdTZRL0RwbmFLZnIwLzhWRUVIdmpkbnBX?=
 =?utf-8?B?OUFvMWJBaGhwa01RYnp3ck9kVFZucDliWlNGcE5WdjlwcTNES1NtMGh3dXdz?=
 =?utf-8?B?L2xWblhZWVdiVjMrMW1vRW9yNDhYSEtTQUIxa2ZFdjdnTndrYUVDVFBHQ2hF?=
 =?utf-8?B?QUR2czg1L2k1Nkh6Nk1qaU5LdTZwYTNWOXNqeXpBc2VXTVFZaEljKzF5bTM2?=
 =?utf-8?B?NTVQRlIwTXpIVGRTWmtVWFZadmI5VUZRYmc3TFUrSkI3SHQvU1pKanJ6b0NF?=
 =?utf-8?B?YWwxNFAvSHp3R0tnSzM2S2UvdlhadzFoMkxFakpSQ3RFYkVIbDdrVjh0T3JK?=
 =?utf-8?B?aVZmaXM2cmdVUnlHbnlhcDNPc0t2SEVkdFpqOXVOZHlSR21ZeDl1SGpvWmF6?=
 =?utf-8?B?UWJXNy9GclF6L00rQzZ3ejJBanFRWThvZC9jR1g0UEZLd2JHT0c0WDhqbEsw?=
 =?utf-8?B?Tjd4TFpUVnBLLzh4ZWxDV2tReE9GSDJ3Ymh2T3ZRWWZNdEFzMWpVbjk1dUcv?=
 =?utf-8?B?dENNZ0wyaDNudUgzZ0twaXZLZitjMm9EUE9IbjhtTVp3YXRpOEh0dmJ2TjZG?=
 =?utf-8?B?TXQyKzJYYUtiemt5WUEvbjQvUHRENi9ybnZIREFYNE1JNW1uaUxLaHJ2eDEv?=
 =?utf-8?B?a0M4M3lXNDY2ZW4xb0hlbDlTbkxtNnJLY0UrZVBaN1JhS0tSNWtybmRlWUVG?=
 =?utf-8?B?L2Q4a01HQTlFQWFLRExiL1F2eWxTRlZXWi9EcUdSdjlCdUtyR3pYMVNuV3Nx?=
 =?utf-8?B?YlV5dzdUcW4zSWhDVnZ0U3BtYWI0ZnhMc29sWE1jdUxhWmhWWEJuNlJSUXJt?=
 =?utf-8?B?WE5tVGJwQnk0R0o3NklJMTgzQVRyWTY2UjdHcjFJbFkzdXo5cUFpeitKOHpn?=
 =?utf-8?B?eGZhbFI4akNiNXZsUFFWbDJsVFRCTTM0cjYrREtTRnNNK2VRSjlDNThva25H?=
 =?utf-8?B?akJtYXMyMm1lMFR0ZytzeGhEekh4bmQwVGlPVWxJNWxzcWJxOG9nUVE5eHE5?=
 =?utf-8?B?TGtaKzhnejE3VDVpYlpLZ0lVNjV5elZWQmQyZ2VNNXUzVnNjcWdtQlUzbzVH?=
 =?utf-8?B?bS8rVStucXRtUmhGOXVycGdNaFkrbTJUMzE1R0ptQUJaeng2U285TmNPdVJM?=
 =?utf-8?B?c21xOVJycThSQTM4aXA5Wm55cW5NZ3YxQlZmUE5oOGVqcGFGR0tOTkp5eTFy?=
 =?utf-8?B?QnRVTGVQMy8rb1pmeE9ZMFl2S001RFBUKzRtYm1SSHYwRHoyS29ia0d6cVBv?=
 =?utf-8?B?elVQajhxZmk3QVJFSjJXMlNkYVdiV2N1aStESDhEVG8rR1g3RE80ZStwNStJ?=
 =?utf-8?B?aWQrTVI2eW44ejZvYkFiSkRGa1ZMR0JKM2g3SVVMNnJZMDdMSVU1cTlNM2E0?=
 =?utf-8?B?SWZMZzNaT0xkOEJZWSsxb3hHOHhQT3Y2eGhDUXF6SVJnNEVjNVcvZkxuMzMr?=
 =?utf-8?B?Mk5Ndk9IZzBnZjVheUoxQ2gwMkFaQmtEdTZrUzMvNHNCc093MDQzeFg0V1cx?=
 =?utf-8?B?aHRneFJRZUEzc0hHcXRjbURqbzZEMHFkMjRBM3puQ1oxS1AyNXFIUEdmU1Rz?=
 =?utf-8?B?RzZTUXZSTnFHM0ZtbzQzNWRtd29WR2IrdVhKdmNnWmdiOWsvTTBnMkRFZ0Yv?=
 =?utf-8?B?ZCtBV2Jqdi9rZENlWlQ3TXlzcytuQUFseVZKdWNHWWd4SjFyYmFDWGpzcGRE?=
 =?utf-8?B?K1E1UkF0YkNNZEtGU0R4Nis0L0FCYjNoTzdoQkpiVmdQb0tWSDdZcTVuWlZZ?=
 =?utf-8?B?NXpJcklzYm5vdWFCbnJENzVZS1VkM3VmVU9uOXhlYTN2cXNmNjI4T0VtT0ox?=
 =?utf-8?B?WVpuRXVGN0l6bHBjZUdQVEZ1Z21MSklNSm9iYXUwbDdBTXRET09HUjAwZFRw?=
 =?utf-8?B?ekhONklWUkl4RnFBUEZjM2hhT21vdy9XcGkxdkVrZ01GMm41ckkrNGt0Wldz?=
 =?utf-8?B?MGRwdXVoUUlNb3FrQTFvSGpWamRJQmhtK3hGZ2ZTSERabmRZdmNUQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9793344a-9d5c-4432-2acd-08de73e48684
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:37:28.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0U0jm/Gsm7SSStGWkHHOU7sKuXIXsPQLuA7ozusfMljQBYbflj3z+EbwtU0W8stI+75C/Mrk/ZdBsRzsF7V4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10379


On Mon, 09 Feb 2026 16:50:13 +0100, Alexander Stein wrote:
> Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
> This improves stability and detection at low temperatures under -25°C.
> 
> 

Applied, thanks!

[1/2] arm64: dts: imx91-tqma9131: improve eMMC pad configuration
      (no commit info)
[2/2] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
