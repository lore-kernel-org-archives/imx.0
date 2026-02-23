Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DC37FF71
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 23:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771890391; cv=fail; b=u98CWyePSSYKFqgyqDhhuH60ScIx2JgymSQmZFyEBP5J2IPW2qF+/6a5wM0ktEzg/ySLrTG0xhoQ8+3i6et1n0o/QOAnUrA2U7SmJ8EeRJiX264opWpf48rkeXV2ozbf/Mkm2peT152rkeTn6MAieAhvrePtCG4+O5K508j3Xxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771890391; c=relaxed/simple;
	bh=DVb0TmHL7KETlAvSYSAzcivHXr+oSecQaGrUEODUVas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bqELfxBVs2b0/E3Fz80/NKyAVc45Ns2RbXBtwFUge028p3LxCJzR1MDaCvaZkoTy8y61ntzIwixPpeQZWmKUjq1htS/Tv0yFh17bE+zWLJc6pmLr2OmG8Hqx6NYn7U3IQhOipqmTmFTctGPFdyI0hsKgm6Kpe7+dEj1RG9ngqE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EOOZ5ZDz; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EOOZ5ZDz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJl3vOculq87abxLxSwaExgdLlrcRDKTjUGfF77J6Wb0/VfFgw35pQw9+dDG76J5u2nZXU1jd5BTO4bKk+VFGxrys96QC6fjtQNzNotavmZZCyZLbhK37k+GXDTYb6/ag9A6XHMI5Gc1ObxyhvAwy/B0AcWfOl/j8jSmlacXZRC8bDmTEjubaAFtW1J722tEwOlscebmmLa/cVWinSAFeR0SFGynto2V5NN0VyDujzg0K/Dev9grNr3DBWaPhghIKBGvmcOhnb5/PQR3gr6z99uhs5daHo4SUJcUuT8HXs20Ns0fiE9UlUS7L2o+nobHcjf8t0PU88ht3rTh/zSFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA/N2kC2Xsgj/F62Fc0XWXYg9H/Qh2svKWAzxhJI8tE=;
 b=zAZPMxzQw30OpFRpsLh/SEhAbbqKBEQNn4xb7C5k9LGNy5VbL7Z8dsy+tLk7x4ZeaqKEcnO0YZjbp7lA/Hj3tIBWdtcWwdNek+abROfrsB4DGi/QW4k6gmCys9XnjNUn8wbdV/s3GeXR21eSarwVHKbd4kd7Hc50pMv69cVjaEHKF/UgoLHmeumzdoAyOTswV15MVgSVNDEyFqHjUBHw8ROwAEKQ4POu4ej6ochcEqppxHh0VgWpwZp3KnO5MQxS+yGn5Kg6o3RSozCl0tg009RlX6nwsyif9JE5CO+6iW9+62f+uq1ndZJ/DNUWBlegNq1HTJByspA2sKUo7ZCcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA/N2kC2Xsgj/F62Fc0XWXYg9H/Qh2svKWAzxhJI8tE=;
 b=EOOZ5ZDzH4Gh4FqznQFW5YK0/5FpQtNtZGP2PrvaRNBXntM9DhlGgpq5zNrGctgWtNCV7YQ6Vx853nrdR7jHSQ7Il5KPXLnn/4mTigDU2EQVnbn0DPDEr01PvQUMElFmRev7pNyX0QhZTcjLnesMUeZ8DdRRGgZYQqEbOr2Brc8OjdNXQhg0/SeKMe6HM0hqa2bpslNh9iHvAumwtXj/c7DczD8WaIRj43ZOiNq7LzNXTYNTRnwzu2H37Kns6ysdz78fx9gFxiPOmujiWsKFGG7ysc7G/4icpB24t5F/p9jP/YLPxXGOeGX3DFuZs6iQXlx/SoykdlZ+HP+NY/UpcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 23:46:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:46:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery
Date: Mon, 23 Feb 2026 18:45:57 -0500
Message-ID: <177189004309.1044816.1414377046286089771.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023103426.3606647-1-primoz.fiser@norik.com>
References: <20251023103426.3606647-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: bafc4e31-7f81-45eb-5217-08de7335c2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmR1Wk9Zd1lUck5xRmxaYWFEeGFZeHNwbEw0eFVrRzBWUXAxTUdSQVpKU1pE?=
 =?utf-8?B?T01XRFpnNS9HaS90SllZNEU2ZjYyeHVDN3JjMGFzSGQ3SjJ3R0ZZb3Uzdmpu?=
 =?utf-8?B?ME1zanVVeCtFb0FiWGJBOEhYZnNZb1h3MGs0SlN6eWZvNW4xR2xrV2laeWRy?=
 =?utf-8?B?MisxTTRrTkxDaklFclJ4MkQ4dlYxRXd2MmJSbGdSb1JMMWN4emRybE9XajdF?=
 =?utf-8?B?VGR3Z01oN0EwZmZYb3NaT2Fnbjczb1ZuazFIMFB6WDZtSkxjY3hHaWNtUi9a?=
 =?utf-8?B?dXpKelVxOHI1eTNlOWdkVE5oTUJvOElHS0lhYURtamVTZnY0NlRRaHl3UWt6?=
 =?utf-8?B?OHpoeDVQRDYrcGZFS3IxNk11bnF2UlRXcTlsSDI1S1hYVHVyNlNkN2RtNXo0?=
 =?utf-8?B?TVcvOVdMb3hRTVp5dzRLVHVPcDhEd0hWZXBqbE5GSkNIWDdsc1pndC9xeHdX?=
 =?utf-8?B?V2p4cWI1L1pteUsrbUtkanIwT2xvMjc2UVcrR2VvWmpGUnNkN0Y3ZXJCeGpm?=
 =?utf-8?B?dTlkL1VQRlhWanRnTjZ6Nm1MNUlHTmtqQUk4NkcxYWlGdnFQRWZrVHVuQ2d5?=
 =?utf-8?B?YjlTZGttdnE2bzVXNFUwaEJUQ3IzcTNYbmJ0U3lYWU5OQjBtSHVWRVQ2NmFZ?=
 =?utf-8?B?cFZSMHJ0b0U0NlZzN0ZmakpiUVZKQVRodzJYdWVyTDB0aFo2K2hrZ1c1K1U1?=
 =?utf-8?B?M040RXQ3WXNPZzREdTFIelpEdHpvUXpQYS85VXpvZGY0bi9wR1dsZDNjNmx3?=
 =?utf-8?B?UXBYdXU4N3pjaXZ6S1VWQVFGUWo3b2cycjVWejdsd0d5ZzcySFJBVE9wRmQx?=
 =?utf-8?B?cWdnUi9pQVo1MmhtS3pEcVJVZzN6eVVkNUFneGtjNzNvMlJKZWRxZXowQ1pr?=
 =?utf-8?B?ZHVMejV5MDNCc2ozVmVzSjNLN1diV0VOYWtzNmR2WjZZZzZMaGNoNmltTmpU?=
 =?utf-8?B?R3dwUG5DQ2lzYlBFV2I3bzdKcS9FNXJ6bEllajUwR0VuZnN2azgwRVRvT05m?=
 =?utf-8?B?NS9nV2RuVXZXY0t0ek15MjNKdjlNbFlFYzhmM05uQ3hDcmk4YjdPZGtLTHBv?=
 =?utf-8?B?bDFvUTFiZ2tJenFZQkE2UWdVY3JJZ3ljMk5ldm8wZ0R6aWxoQXM2MGdpTFlv?=
 =?utf-8?B?R1BCc0JFTHJSWjVwR0x0NUY4RHVBcWtaWlB0Q2JmTVdmTkc0VlY0dHlueVd1?=
 =?utf-8?B?ZVVXUTRsWEN1TEIxZ21oNWt2Y1RQV3ZoZGZLbGJMN1RVWTV6V0U5MlZqZ2VT?=
 =?utf-8?B?T0p6ajk2TTRvYnRIZ1dFdUVvR3o0bUVIaTFES3JQSEtjazBHR3ZiZlJQN1Ur?=
 =?utf-8?B?ZUdtOVRVSENTNHpkVml2TzllUEpRN1FtbVY5UG5oV21KMWR5dWhGazJMQk0r?=
 =?utf-8?B?OExzNExxNXFrRVYzNkkrMUhPTitEaUlvdi9CdUM2VmpTYlh4WHdpVHlDODdR?=
 =?utf-8?B?UVBHemRKQkhnTG9mUnMxZ1VMUXR2WU1rWFZzbkJFUWhHS25YcElWN0Zka2Vu?=
 =?utf-8?B?TnZ4R2xqdS9lYWV5YzdOU2VvSG9vaklKQnEySkZGa0laT2hUeDErb0Zqd3Jp?=
 =?utf-8?B?TSt0bEl0cXExdkhNcldsMHBYdHpkN2VyU3BzQzREbE9OQzRPb3JoTlh3YzlB?=
 =?utf-8?B?Q3N1eXlEak00K0FjMWkvU1l4M09mQ0lrdnEzVHMwY2VVWkhNUHUyM1RKMWtk?=
 =?utf-8?B?YUI0aWJJOENSYWlPQWJOSCtoN1NRaUhZcHFPaXRvcGl3UG54M2VtRG96c0NG?=
 =?utf-8?B?bGxUdlhiK2IwcWh5dDk3bzZ1SFA0TXoyWTNDQ0ExM0Ywd2Ixc3dSQS9KeEpw?=
 =?utf-8?B?NXVFaW4raFNVNHhFbElMUCtwQnVMTGg5a0VXRVA1T0RwL3N4N3NlK2cvcVAy?=
 =?utf-8?B?djU2V3RBRHJEVzJ6Y2lzRThBdndWSXFsMHN2RHJzZVViMkc3cVpSdS9tZll3?=
 =?utf-8?B?TjZabnpoaUQvalgxcXArUVVLNFk1TU9UWUtWajdKSmQrMy9FYUdyOVlaZ2I5?=
 =?utf-8?B?S1Ntak9Wa1pUSi80UG44MkdtOHBBdkxmR2owSWdnQmhCRWx2di8wMlh4S2ly?=
 =?utf-8?B?U2FYQnd5SjJtSEkrWnNJOUkreEplRDZjVjNENVNOcUlpemJ6SjVkUEpJVUlx?=
 =?utf-8?B?dm1XSEw5bXRBbUtIYUEyMTY5R0Q4QlZFV0wwU0FqOUxBWUZMZHpTRFgzY0Va?=
 =?utf-8?Q?4QKsAHmoYNqFORaFlwIqI6c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFkckErWFNqbmJ3am1RZ09OdkU5c1ladU1iTnlqU2h1emdUSHJ3UC9kVldQ?=
 =?utf-8?B?YnAxRXVBcjBlVzArUmRWNTAvelUvU0grQkZyb01pWFBMTDExZXRkM0RUVzJE?=
 =?utf-8?B?V1NUT0NCbzdrUXJBQ3ZYSWJUU0J4RVhiQ0Q3QnFBeS9Bd2NEMVc5aUNwMGJ1?=
 =?utf-8?B?NFZjNG9WT2FHSE5CMUlUYkVxbk41NSsvbjlWay9Sb2tCa3dKbGhsVC9QVWI1?=
 =?utf-8?B?RU41Yzh3MVZkbDh6ckxJR0dVVHZ1czVTMjVkbytjR0xnUEJhQ0lKK3poRnpz?=
 =?utf-8?B?RXYyV3ZKZjByZzI5ZmxwSVF0SWpieUU1NjZrTGZXa1M2a29kbzhMcWRadHBI?=
 =?utf-8?B?ZDU5Sm4vVS9OM1JOZzRjTmNrd2ZmQ1FRS1dSdVlGcXJpSEpNdC9UdDV6TGVj?=
 =?utf-8?B?ZTlZNTNEdXFwNUh0bEFpWHNwQkhvMlZSblJPOWJscWQ1ZjAxMDRlcWdOUndS?=
 =?utf-8?B?ZGZhMzhZUlkwV3lMVUNFNXYxRmNveTNJMVFFbFZENnlnUzRacDhsY3B5c2dU?=
 =?utf-8?B?eXcxRTZwbVErNzM1TXl5Zno1Nk5TOXFYWFE3aEdyY1lQSnY4TWNvTGRYUWd3?=
 =?utf-8?B?TGZEdll3cFc1M2xoNzNPM3UzZGtQcTk5SlpIL1hvTXk2ZGZtbS92OXBNTTEx?=
 =?utf-8?B?bFl0MUhpdDlZUmJzOUFvUWhFZVREc2VkSEdvREEzY2VSOTY2bUE0U1FCc2Zm?=
 =?utf-8?B?d1BFakxrQ0JPcW1WQ3pJcDNIOG51MjVidE9hTTlROTNjaHNNelJReGRzZlV3?=
 =?utf-8?B?end3Q3pLYzZTR05mSHZwaTF5SUphWUtmbXFZWEVTK2NUK0RWSEN4NzlSM0pl?=
 =?utf-8?B?YnV5VGt4czA3SXRERXFmZ2xuQTMxWDlLejJZcFJ5QlZiRTV6VFdVeFFPQzlJ?=
 =?utf-8?B?Q2hRa211K0U2VVlmNDJBMkRtNmQ4NXdHWUo2Q0UzQnVhT3N2WEJ0SEUvTVVv?=
 =?utf-8?B?TDQ1TGhKbU14OWFTQ25nQ0hMYlJsV0lLZ241OUxyQXpjdE1TZkR3QWpLREpm?=
 =?utf-8?B?dGZzOURjbnlWb2dwejYrdlQrNVRIcHpNSVNTeWdXRXB4eUlMYkh2ZnNUVTVs?=
 =?utf-8?B?VnpsVTQ1UHE1WjdWL0J5cEI3b0twaFJ1NEdSZ2cvaS9Ram9CQmUzVlRsek5O?=
 =?utf-8?B?bVp5Qkh4Y0Y3STRsYnBuOTBkYnB5WFg5aERJNStycERNb3Z0WnFJS0RTM3Jk?=
 =?utf-8?B?a1RNSjlxNTQySFg1NkZMc21QZDVlMTJsYmN6alhRTmR1a092OGY1ZEliM3Bj?=
 =?utf-8?B?REFBaE0yTDlpcENIQmFDY0ZFR3JOdGZPV244NEJjVWRVM2c4dlVhM1dTSkxM?=
 =?utf-8?B?ZVcrdmtWSDJ0NXd6b2dUT09Sd1cwTWdlZlZEOFpzR09QY0VYOGpWT2llVGc4?=
 =?utf-8?B?eTFsWVFlR240UlRXZDFmb3hVbndGeU84UlhrSElVY0JDQ3AwY0E2YUpIL094?=
 =?utf-8?B?ZEowSkhyQ2gvREhZMVI0YWxtcTE3c0pEcWVrN2JpMHJvSGFFYnFXRUNEYzVP?=
 =?utf-8?B?eGhhRkdOY3k0UEJLRjdWYVZYRk53dHpzNklJdm5ibkFscTRISzdCWUF4aVhP?=
 =?utf-8?B?YWU2YnVBb1Z2Y1hUK3I1c091WlJ5MUZtVmVObUVWd1lNdk9BbGNVaXNuckZS?=
 =?utf-8?B?Z2x1WEhuL2JhTFVJMTA2bXgreHBOMjMxRlpGZFZ0OGNsQURhU2tqTHpFZ0hI?=
 =?utf-8?B?K1dlNEJVaUtkWjdyTmJpamFuVEFHZzRBbnp5MEtnTFhVaXIzaFgxS2kzZDJL?=
 =?utf-8?B?S1MwajJUWGE4YkVJUFJ4M1BBOGxRZmkxb0wzMGg1Y2hRWWhiWFFVQjJncHY2?=
 =?utf-8?B?NWtEUHpXY0YyaUZLWlNlUU9nM1I3c3lwU2dHMmswdkNMbTUvQ3NlZ1lDRnd6?=
 =?utf-8?B?dmtvQUs2WEovbHVyU1FrSDRiY0twS010dU5IZGJLb0RxUXFjS3dOYXNFSGtF?=
 =?utf-8?B?VEdxN3Rua3huTGlaSmRXdXRyQ1dBMkpPRWpKc0VKRmlWNmd6K3ZlckJPNVBv?=
 =?utf-8?B?WVlMTU9SalBySW9tdjJMZW5nQ1pSZkY5MGxhT0RTc0U1NUJ4Q2N4TUxWcWl5?=
 =?utf-8?B?WUtpb1dqRUVKR2pYaGpzZ3JDbmxodXFMdXcySVE5R2M4M2RnSXJpQ0JRQXZ3?=
 =?utf-8?B?NFVQKy9pc0xqQ3pmYzFuZzFBc2xNQjI1ZGlEd1ErdHJzaTRFNkhRbWU1a3Jl?=
 =?utf-8?B?dlNJRUZweXpSK3p4cEdLN3dNemRmL3I2S2ZHemlReEUwTDVPV05pdk1jZllU?=
 =?utf-8?B?UzBQWHErbmNTNXZRalVYbWF2V2VGLzZVY2FHME0xZXFpU0dRTlpTY2tRYVNj?=
 =?utf-8?Q?jVWKdcHzqfQZVlI+6n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafc4e31-7f81-45eb-5217-08de7335c2aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:46:27.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg3rxY3FHUmXCrBK2KTPKN34sFuc/MojMegbaDEhPAZ5aa9GIC9QHD5oMYUkijXfUB7bRzTLDVYYjTra3UTWvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299


On Thu, 23 Oct 2025 12:34:26 +0200, Primoz Fiser wrote:
> Add bus recovery feature for I2C buses on the PHYTEC phyCORE-i.MX93 SoM
> based boards (that is phyBOARD-Nash-i.MX93 and phyBOARD-Segin-i.MX93).
> This enables the i2c-imx-lpi2c driver to recover the stuck I2C bus by
> switching the SCL and SDA pinmuxing and do the I2C bus bit-banging.
> 
> 

Applied, thanks!

[1/1] arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
