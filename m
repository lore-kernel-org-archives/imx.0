Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED830E0F3
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613763; cv=fail; b=B8InRQHB23jfLkL/7Jqt13O7ze2+PsAwUFyJRAI4re/TCZLH6IBu2RtMdlAJmyLy4DiI5WBZONF0lSO+KNGgmorJggN2r4EkUQg54AdQEpzc4YT26HHaNNQpihtJFX24ViB8Y7P2bPCCUep32xSI8i6n1WOJ6iz6WQSGjCGFQf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613763; c=relaxed/simple;
	bh=hvR/ZdZozELkBkGy2MU9cNWAoMskhaADpiKbhRmpjWE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J7NkeeTJJdwPX/wnopGAs3zblJaP4jZ9qXBOibJ66+zztduSZN0T1yNoKIKdfRHint4KhMIemjXW3ujPqpza1xqRjpuYE9QwJaOUU0SghEBS2djOmQX7piGhIb7BNb67Hw3QC8J/dbRWdSRVclrP2jloVd4k1129ST6l/8LAN/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sLW57m5s; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sLW57m5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy/HNwZSvM54y7rdByD3OY+I7FOdqehSMNR+JUnQEGyeXnSVFvwidY8hE2pKD01Uf5O0Sf/dVEbJ44AgjZPHeBst0ZHkYc34d0ldo+obTmABCSLCTYrNrsvMPxsj8J/dYVObZRhPaWV2WmZUofe5CwxgjqXiq0z1+XC3a6BEuxRDJ1OCSdQ34JFMnsuLlgO1nkYfVxXPd5jQ3+3C5x+P5RqTUZ4WnNR7lnGZWTT/gGqiJGGtA7E5HUlTKwSPsO4J5M7X1dHBNsNyWz/lqT6t7YdGNaC4Y8SK/8JBLTBFLMZRqoG8y2pE3E0pw2vcLzssL7zVtXF2FM4xdiMVmNT24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqNzgWkBV3kKDS43gwia1hqEzlRXxrNYay/ZHQSg0bE=;
 b=W6gT6wjb6kngleS5vjdw/T8f2UqiRQGk0ouim/m6gOWPLovQHwLvH6SHo1Mgp/F4i7LRy0r/s/z05O4Ib8tzY2u+cbKaqmQYHvBqg6jYwEkmzWHuM7Mp91CaLJx2SBD4gV3B/qZsX5KlPxqv2RqpV77hUqvF4xHdSDhPwFtx21pdGAEx2txiM3owWiFUoGjnEl8ckY0LJ1T5tG0L0qutnfSSUBoPF/KYADC+FPKzr3hqLcQGcGQNNKsw4TFyzw1gmyFyvNhnXd8j3vnRRALEmnKWKDCoBP9OGQoK71DYJUAKu0rODkujD6v5nOxPsv6fhKvYJhwmrE853MVfBEVsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqNzgWkBV3kKDS43gwia1hqEzlRXxrNYay/ZHQSg0bE=;
 b=sLW57m5s0bHRYL2yMd+Tct7Kan1sr9K6YvRfi87u4ORzlPM4Sfbg501INR1/bXQX4+Ytrkd2DwEaUBn6FWiX0vB+Ocie6FdFxOcsbuwL1Q8conmAcNfOXjgiZjClL7OS07WTKodT6ziuFHJQEip3WHlcl6MhGmohuv1eAR4qGg7SfSskM4+aq4Z930z0K9rNdK9kPsPe/wGmCfyD3TSRq2IsqLSTbR5VO9necoz2zf6zb3PLNTw88H/Tvuf6Hx5hNY64eSPWvTNWxyioZUyYEB/HGcWT67n4+FzHeIFoN7utNkF/gV20oMcdjyBQbKJah9zWxIXsAACXrkZpOdatxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:43 +0800
Subject: [PATCH 4/7] arm64: dts: imx952-evk: Enable SPI7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-4-68b5a4d69710@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d93c3cb-12e1-4b15-d49c-08de4c5074fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHZRczMzQjF4VWYvb1Ard2lWdUhEdVlXZzc3Z05nNlJTZU9BVVNMd1lYMk9J?=
 =?utf-8?B?YVNmVklUT0JBZGVDQWlGTzNkL1oxV0t5eWlzR0ZZRDBjSEY4QVBqVzdWVHU4?=
 =?utf-8?B?RzB6NmN2UFF3VDhRbzFKeHBzVnhlcXY3NGZRS25sZWo3N3hNVnZZbGxSY25x?=
 =?utf-8?B?OTBzY0I5eXBUeUtnL3RqQndYRlduZStsNmNlUjBiSHlEVlJEOHZQTGpkOFJV?=
 =?utf-8?B?cTliTEdTZ0lkZEFHMXFhNHpVMy81ek8wL0RvZUtNam9JemVIVUI5NU9mZEVi?=
 =?utf-8?B?TWdNZFZhelRsS0RUWVBwUEJCNXZNUUcxUWNhbUNnRHd1UnRhclM4aW8zdlpF?=
 =?utf-8?B?WktGeGpaT3k0T1RaajFRL3VuSDJVNzRsNGpna0Qxeit6QlU5VmxXQ0N1bzFL?=
 =?utf-8?B?T1d3TG5pTFlFUnJvMFgweUdkZmNPWEFXTlMxTjZHYVc1QjEyMzk5YlpQd3lE?=
 =?utf-8?B?K3VoNjg2V09XZFdERjdGcmZGSUlQem1CcVdQNWRtZ3NiNXBwWDVITzVDdDNC?=
 =?utf-8?B?UDZRUlF3M0J4VWJhZDFFSTRNT0lEZW9GbDRFSWwzQnNNa2VXZ1prejJOZ0U3?=
 =?utf-8?B?akk4V3FkQjBza1ppNW16Yzd0MnQ3QzlBblEvd0V0QThDY0d4cVpieitBMUxW?=
 =?utf-8?B?eU1DOWVNUWN1QTVSUWJlYkdLOEd5ZjBnS1grV2tqTGVwYjNJeDRKVjRYc3lk?=
 =?utf-8?B?VjZNcEY2NGhNTU9iWnNjNGxlWFM1eEpFV09yczR0SVAxSFpuaStiaEdGcGph?=
 =?utf-8?B?U0loYzExWG10WHlPWmNmMWRHTXNjZ2UyK1VuWlQ2aHBBcU1hcE81aHkyZ3lL?=
 =?utf-8?B?TWpOVVdIOVZTN3BHSXo1YnhWbUgxQUI2bnVYLzJBZDBUaXRoUnRBb3FicDV4?=
 =?utf-8?B?c084Y3VzM0ZZZkNVWnhlZmgxM1lYSGtCWjlrcm90WkxoSWM3YXpROEpYaVNL?=
 =?utf-8?B?SUZYQ2xFVEUwY0tndGFVV09PdGlRVTBmckw4VEFyVHZHTFJrVHF3aEd0SStN?=
 =?utf-8?B?aWlKZjc0SGxiaTdKZFY0MEpVNithRklnbnF4bmNIci91NTJiMlFEdlV3M2Nv?=
 =?utf-8?B?K1cvVUF5dUM1SmhzQzdyK3Z0Y1prT0d3ajVvSFZBL2ZYRnU1ZjBCMGZNVThQ?=
 =?utf-8?B?L05ZM2pGWVN4dXlGa3c4MzRmdTNucUVzRVd3dWtQOEhNTDdHUitCa3JpK2dn?=
 =?utf-8?B?WDJWd1M3dHdqUWRPZTVTTVBYbjFGVjVkUytRYncwQzFUdGsyOVR1YmxQSkZm?=
 =?utf-8?B?VzY0MzE5NEY3NzF5clk2MWhxN0VyekkrRUtBcTQvZ0VPZ3BRUkpFbWt4TzRs?=
 =?utf-8?B?OHZZeWNnMWJDVEoxVHR2TFFyYzlVSzl1VS96VWphc0ZhQWF0Y3BOSGlUdmZl?=
 =?utf-8?B?YWNKNnBFNzM1ZUtWQW90VXNRZ0pBMXhhc3JxWGdYVmVQVEY0U2xQbzlRS0Fp?=
 =?utf-8?B?dmliOHFMcmpsTUZGNnVSM0o3TVM2ZmI5aXIrRExVZmRUTWV3LzFEMkFHTUhG?=
 =?utf-8?B?dGE2ekxLK2R6aUNWMndwa2NLOXJwMlJPbTU1cjNHclBTTkJUd1Q4MTVQbTFE?=
 =?utf-8?B?dG1tQnlEUXFyeE5wTlZoMGJxOGNRVlBWZHlMdGU5cEhEODRjcjVqUDQ5L2dH?=
 =?utf-8?B?L1M0cUVrS2dDUDEwcm1sMG9URXF0dVZFQ2s4Tk9WMUlwRlhGbWw1SkVYVThs?=
 =?utf-8?B?ZHFSbkJ2bkpWdHVyUGh5TGJ5NjRJR0NaZDFFSjFOdVNkaVdzcVZMUFN5S3gr?=
 =?utf-8?B?UHhyN0JHWDN2WDNaZGZTTFR6UjFFYWR4QlloZzJhbzFTaWZmdDlRcEFNTlRZ?=
 =?utf-8?B?V0diSVd0dnJUWlhTUTk0a1I5cVV1N29vUGVwUmZHZCtlTGlXQkF0U3l5VUYr?=
 =?utf-8?B?bWh3OGJ4VWd2b2piQU5kSGhiYmtUYlBnRDhvTUdYaEhySWJLbGZRZ1NBNlpL?=
 =?utf-8?B?TGlzMXN0SjllSE41NnhXNHpUOGVWMHJwMWxIWVp3UGVoREZZbnVWcTdubm1j?=
 =?utf-8?B?bUU3M2JhVFRCTVQrdU5oeXgrN3JMZ0QzWngzUmk5Q0ZXNVV0Kzl2OC9ZNWhm?=
 =?utf-8?Q?LqJwg/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWowTUtBNlFMUFQ2TkduSE0yYVlEcmFJRVQyQStJL2w0UzlYM29RQXUwMVZU?=
 =?utf-8?B?elB1QW5wcGFNZkxpL0xocFhFUmtVMGJEOXFQNUxMd0Z5OWNsZGM0K2NOMnUz?=
 =?utf-8?B?STVLWGl5czdrcm1lQk5RcS9uNkRZNnRTTXBEVnl5Mkp2NTI2T1dyZnhVV0pY?=
 =?utf-8?B?U3JpTVBiYUcxQk91emJISml6VlN1dWdtUXM5THRUcEVlaTRIbEhjZ0g0QVNC?=
 =?utf-8?B?USsxVDYyeFJheHBYVlNIN1dpSVhYbGxxV0orY2tKUlkrZjlCR3F0Z3VRREpW?=
 =?utf-8?B?ZjU5WWNMVDdHM093alB4U2crUWt0RnZzMHFDTVRXWlQyVThyWUJHWFFBbjNX?=
 =?utf-8?B?YXVzZGVGeWVRc0lKWGFndjIzVWRDMkJvR2tjdzJzWVVNaXJ5LzVPam1VSFd6?=
 =?utf-8?B?NmtBcjJKN1V0MSt3RkZxbVpudU9qWmJpMm1nZlB3MGc5OCswSVNQYU1UYWQ1?=
 =?utf-8?B?YSs4YUR6WGcrRnZzZ3AwU0NJbVk5YlpESnlwcTRuazV4aXF2dmhUOGY2L3pC?=
 =?utf-8?B?TTJEcUhvMXZFOU5ON1o5SndGQ1dPN3ZsRVV5aHdBV1I3OXZOckRYRUpmTUpM?=
 =?utf-8?B?OWdsQTliL202aWg3ZE1nZ3JjcWhDMzNDYXlvT1A3eUw0WDdmTEpVZkczd2lj?=
 =?utf-8?B?dEw3SDA4TWpsYTEwRGZ2ZzI0RkVkUDdrakdqeXF3SmhlMWh4ZUhjTlgwbmkv?=
 =?utf-8?B?ZmpzZ29rUm9EQW5UcTgxRDFJN01PNjJ6R0drU1M4S3hLR0N2RjEzRC9HK1pY?=
 =?utf-8?B?dmJ4UlJYQUdXTmRSczIwQ2JTQ2t2MjdZSWZkQU42MEZrSys4U2gyRFMyQTNn?=
 =?utf-8?B?YTNiVnFKcjk1aHhaYVFwNFRyU2dTb285Nm9UbjFZVmkwL0VuWkd5anVhNDU3?=
 =?utf-8?B?Ylk0LzNaTDZCamVMRXJ2T0l6YTZXU200S2ZCTkw0Si85OUM3ZGFuN3J0UWQz?=
 =?utf-8?B?b3lNY1hWdlRJZG8wdmlCdW5GU3NTOXlLVjlWOCt5YXRLZG5FL2Y0T3J1QW0r?=
 =?utf-8?B?YTUzSlJadldoT2h5dElUNTNjV2pMZEFnUWZqTWZrTkR3WmsvZjhTalhrQllK?=
 =?utf-8?B?aXVObjBqZ3k3TCs3S2diREdNdlJBeGkzdGJLSUxmUHdicjFCeDlSV2hIQUFt?=
 =?utf-8?B?cERQazBBeTl5Si9PNklPLzZDRVZIVjVjOC9OM3lmbkZYYnRZZVFnbjZuNkVE?=
 =?utf-8?B?bnlzK3p2dTlST2lFOW85aXgxdGJyTElVLzRNOWJNbG9DQytsRnNWWVZGQ2Zz?=
 =?utf-8?B?SkRPRXMveG90aEM5ODdXUk1TQlpRcWlaMjBGSWw3WnhhVUpHZ0FiNjltaEJn?=
 =?utf-8?B?RGtJL08rYk0xN2VHVkRocWdRY2lXZXQxejNiTmpVVFptRWxTak13QVlNN0FZ?=
 =?utf-8?B?bGRpcXBuRDVlTHpudEl5WFMvMVFWMnhUM25UM0MwVUplcHUyWEQvanZycDRL?=
 =?utf-8?B?SWcrV0tQNE9JZFl5eGhQQ0dudHlQR2NLNklBOXliMGtYRmxNSXFJdXhTRUFB?=
 =?utf-8?B?MTR2K0cwcUV1L2dqVHIvbFFCOHBWNzE4UWIrdytydkFoMEpadnpQQklNN0hT?=
 =?utf-8?B?dlVRS01ob1JwcHMxbndKdGpVb2lHdGxsdU5PRHdVRFB0ZFl3U3F4a1hGLzdx?=
 =?utf-8?B?Sk5SUWkzQ0ZkN3JzankycWFJcDdIU2l6eUxmWnNrTHBuR0JBS3JQa090UWd4?=
 =?utf-8?B?N0NYbThkRGZoUEFkbFdRanMxSWNwMGpZdU5ZSTlUT0JiM1dtY09MZEVmdlRK?=
 =?utf-8?B?TVRiRkNwdW8zTVEvc1J5UEhQeW93bjJ6RUlGUmh5OVZWQ1hIdFNSVDlWd3pk?=
 =?utf-8?B?YWc3eEcyUlNKcElpRDJNTlQvcVhZSzZ4UlhRd2M4ZjRFSHNVMHNkcHJTQ2dX?=
 =?utf-8?B?U0ZETHZkWk9iK3ZNR0J4STcwRjM5S1RQcHg1dFlJallVY1F5SDQvR3VhRTRW?=
 =?utf-8?B?NWhGWm9IRU44Vmt4MWwyN1JWeGVOdXMrUzBKMzBrQlRnMk5MS0pkeVdRQnl1?=
 =?utf-8?B?amNPUXk4NVBvaCt1Rm13VDBXR2pMTHUxazFaMWtYT0grSzhKQkM5eHFsRGla?=
 =?utf-8?B?WGl4Q2t5NTF0NmZMOE5iVFFqYm14cTF5RmpNV3hzT1JjcllIYjZlOE1VOEFr?=
 =?utf-8?B?Nlo4RzdaNlc5cWxqZlo4ZzFpaHl3TG1pckh3U1VQY1ZJd0JxWFcyUWVCem9r?=
 =?utf-8?B?TjFPLzlweDlPandFd3JaWXU2cERwUi9way9KYkhidGZiOURTQWJna1Q2N3dn?=
 =?utf-8?B?TnFZZ1hPTG9KeXQ1TFpsZFpkK1NtbUJtci9MV0hJcHZtUTl3S3BhdFIrbk1X?=
 =?utf-8?B?S3Q2NDkxb3ZjcHVacnFicDhtbHRtUzdNbVJFN0ZSQy9Fd0JxWGU3QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d93c3cb-12e1-4b15-d49c-08de4c5074fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:17.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FymaG1jgwRwOoJg+ljNq+aAD9Jg2JMkTIxLMtGL+TkGUMVrbrJnCNbx1qX0laeTtkIHdrSoQuaT/YVFik29kPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

From: Peng Fan <peng.fan@nxp.com>

Enable SPI7 for i.MX952-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index e324f9d4e22c95f36f8c203bd44097ed383d90a2..3b5b345ef6fea037ad8b98366527d1c13415a269 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -29,6 +29,7 @@ aliases {
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
 		serial4 = &lpuart5;
+		spi6 = &lpspi7;
 	};
 
 	chosen {
@@ -211,6 +212,13 @@ bluetooth {
 	};
 };
 
+&lpspi7 {
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	status = "okay";
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -278,6 +286,15 @@ IMX952_PAD_GPIO_IO09__WAKEUPMIX_TOP_LPI2C7_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO04__WAKEUPMIX_TOP_GPIO2_IO_4		0x3fe
+			IMX952_PAD_GPIO_IO05__WAKEUPMIX_TOP_LPSPI7_SIN		0x3fe
+			IMX952_PAD_GPIO_IO06__WAKEUPMIX_TOP_LPSPI7_SOUT		0x3fe
+			IMX952_PAD_GPIO_IO07__WAKEUPMIX_TOP_LPSPI7_SCK		0x3fe
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e

-- 
2.37.1

