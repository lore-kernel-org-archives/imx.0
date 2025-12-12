Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAA431280A
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530999; cv=fail; b=eoExBiZ0RQvTMqd6Jo0VV+RqbSqzx+pmNkPIFZztAJA8OHMAT+POxHDFeTPcd+FjGk1jcJuwqv6pCcb0DYBBCgGCcjCYA0D4O/Nb2jwCFX0mc1Bxb60jghNyieN9terrPK93Xi+hhxO3qo8FWHTxgqv6pR4B6g5FZuR/Tn6f4Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530999; c=relaxed/simple;
	bh=ywk8fTv/5t75TDgDgFv21pXfcjOqTGpDGGQrrTFJfoI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YpGHcDv39N3Oh9V7ib1ZOnCRK/GiY2X7PIo3bCAIgmhj84LysGiEtFaq64+h+kmlKPKt6RtZ9nBH99PQfJTxSBUd98bOiQzLGCL5g6RAgGRFzfM9Wl69Dix2MBhJpMRjHUA9BHYFDhhdSGigwAPwDF3JO6idPJhJr6o/8BqFlZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZpHafcxO; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZpHafcxO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG8KXxbGJn6h/2BrI5Fvf1BBV/pIPPgG5jeVA8TVvc5VFofi8P4RP4V6YUKOxFcF00yxM78iNeW9XjoPXzCPLlGJEhRCYiKUovLnEQSQI9HScbh9YHvARIS5foVB7c5ZL2IicX2RYdbm7l04IwpfMcXas4UtbXWieOvyk54LVbZT6qmVYXDxbhsaDf6GXdEHHlY6rQLfczVCvMdv9eAw8xs8NoefdW4bl9Rs7PP4ehTD6SjtUCmzikClKF5OvFvWw7jJbBMOIUcc71LEqjp0+lvozvmzq2mZkhYKH3vgbtCyVaZlgPfMU1sw8/c5BnV2gMjRzri/7STN3YqTwF5LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxOOJo6BBfKDdWMCUq3qkrpbfmQ5DO3XCUZOodzQnZ8=;
 b=ThycoD+H5i4HSQYlF3T5sXrt4rSsIJ+/Uh7UxnRNOTQd4d7cyu/obb2c4HGgjsrhkSNvIZuX1KSxjsMlOIH9slj87DUebapqm6wlstgXGghE39kmZyQW/6LrSOErNxle5UtzVL5fLhhvaRTqAbqLiTAvpKNuz3FlRHRCG2K5A1ThZ0iRSWoZzzyqW76JfjMpByCegNTiwBkfyal5fdYvRWDj4bsP+yTa3vrh3SQBgA6pBOVEQdpGr0Dzo1UIInvr7lD4SXHbazH9DdXMhX1rO4O3t6IDSIiMBX/jN00kM41N9IZogvWwd8//bkd6l7q5b+AzdIlP6bOwJ4ptfWtxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxOOJo6BBfKDdWMCUq3qkrpbfmQ5DO3XCUZOodzQnZ8=;
 b=ZpHafcxOipN5yFfmifos7Nm+E8rPFkZBEUYGU1zM+BINGBt0Du+1XmxbsgGBIx1U7UWTatfrYx+fvW/DFPGQQOOdxlnmzjxvcx54qxudmjRg2KfPZjmWJSxR89Ep5S6NUT1TSKRNdxJMkAvodGzOYoKxBteueL6WmNoOGegMPcGEig6uguPrnj6siXAfBk2G2A9KpveX9tvtlY3i/HDDxRTbtjSV6leUiCJi207MkbXtmDPZFimaaOiZg6/o9ogKRvoXBI+VFJc2YRA8ayPTdP3ieqhg2KZ8y2mDvPwN4GSiRIq7EBkRbsBn9X1tcwGs9gFwGhnf/F5tJbymIgvmtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:16:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:16:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:16:08 +0800
Subject: [PATCH 2/4] arm64: dts: imx91: Add thermal zone node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91-dts-v1-2-2bb3c13762dd@nxp.com>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
In-Reply-To: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a23023f-9291-4919-a1ed-08de395f24ff
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnpld29XeUdYRUpIYXdGMHdrY2Z5dkFLcW00a3dGYUh0YWZNNlVScXFBZWwv?=
 =?utf-8?B?VlJKMms2OTZjbnV4b0JCc3VnWCs3S1YzU1VUS3A4cVN1dW1kWVdPTk5LcGRs?=
 =?utf-8?B?TFdCZ1NRbW5NaEYrV1IwQVZCYjMyUFJJVjdrM0JXMm9wcHFwbW4yUjEyRGJz?=
 =?utf-8?B?TTlQd2hKWVp4eTBRRW5yTmpQSE9wcXpFNytySmVoSDhFQmF6eVpRd2J5YTBn?=
 =?utf-8?B?QmlFd1Y3TW0xUGI2aWZtblk5V1VPWGNQbnpYQThOTjdHNWFLaldZdTc2M1ls?=
 =?utf-8?B?czlZY1VqRC8vN1BaZXlsZUdyUWJyY2FjbXQvS21IbnRpemRrNkRBbEUydGd4?=
 =?utf-8?B?MjdsM2hBdnZvNzFSTHdEM1JVRDBHenR4RVliMDhwOVh4Z1BQWEVMa25DZ2JE?=
 =?utf-8?B?K2lUc0Z5N1ZhaTQ5UEhURHV5TkxHRWtaeXBvWTIzTWU3Nk5MNDRJRHdweGdC?=
 =?utf-8?B?YlByd0cyQzY0cW1DdDQ4UVZnK1FkVFJWL3lneDIrRFM1YlY2SGJ5ejRUK1Jk?=
 =?utf-8?B?Y3poQ05hci9HbW1zZ2dhQ292VXBzbDk5ekttS3djb2toeWJKS0dwbHMvbXF2?=
 =?utf-8?B?NmlhYkpyaU5lUDVXRjljRmo1aElxMWluYmhUME50Z29YODBCNTV3cHdnV3E2?=
 =?utf-8?B?cDcxeS9vcDdOc0pFbDVkTTZIdGZrK3RMbnFCVHJQRkswMWhmd2FqZHViZyt0?=
 =?utf-8?B?bHhieDdOWm00RzhxRDFRa29jUHVrMVZxSUhHYld5MzA3WEhDbFZQRVZZeE5D?=
 =?utf-8?B?blR4bjdHY0w4YkxWaVRJemM2aEFvZ1k5WFZCLzJXR2N5TTM4WGUwTVg3N1Rs?=
 =?utf-8?B?MzBhTVl4MERIeW1zMTZ6U1JEY3V1eVpjUzM3WkRuMWhQWm8yYXpZK1NCYjl0?=
 =?utf-8?B?d1NSaTlpN0VTNlJIL0xidmwvK0g4V05FTTArTmR5dEtuSUNncWZlL2x1dGlB?=
 =?utf-8?B?alg5OCtYSUx6eVFGbGp3U3h0VzcwT1BtelFWSFFLZzcvdEdOU3g1cEZsT1Fp?=
 =?utf-8?B?alMwa3I1MUg4RWhvU1VtUC9ycXR0V2FmOWJSMFdKaHNIUzZKNERSVVVEclRB?=
 =?utf-8?B?bHpBWnNuK0JwM3dHRTU3V2F2b1lTVVpsSEx5MW54SnBiZGNpMThrdkFRZ0hF?=
 =?utf-8?B?eWhtaWU2RTREdHFQZWM0N0N6MnVqamNyUjJFeWtEUlAxRjVlRWVEbkxPZ0E1?=
 =?utf-8?B?eDlzUGF4ZmNJR21MUGZHKzNieFdwdmwxVWNXM2lHRmtjOGxzaEpuT0ZnM09u?=
 =?utf-8?B?ZHh2UFEvUVJvUzRTQU05VkFWVXlFTG5uVmxwanFVT0M4Y245dHhld0MyQ1hn?=
 =?utf-8?B?c3QvUy80N3FuNzdNeGFuOHhmcFlxREFTQ0k0NWdSRk00Y215WjR6WXBYS1do?=
 =?utf-8?B?NjNTQjkvczJId2FwVnVBaDVYUTFpREkzc2xyUDcveFQ1VFVsQTJ2U0VYKy91?=
 =?utf-8?B?OVZoNmFNdWZYNldLUkdJWVZvMEVwek1TZUV5ckN3RFhpcGhxdm9peHkrbUJS?=
 =?utf-8?B?ZW9yTFRMZk5UODF2RUNOTFh2RXhkbEphT1NFTWcvWkdrZ3hCQURJNUhQMXBO?=
 =?utf-8?B?MmdxWDNSd0RxdFhMNTZ4L0Mrb0hSMytEcXJ5RnRiV1V3OHdIZ2xXTUdRTmEx?=
 =?utf-8?B?bUZzUERTeWU2b2krbkFTVkN3L0xXL0NYZVgxUmt0SXFDYTBxZWcremIyUXZG?=
 =?utf-8?B?OUhXVHVSbEF6akFpaWloUlRaK2FpS2lkRjdOVHNjSXhrRTJ3d28zRXU4dGRr?=
 =?utf-8?B?VGo5bnFEQzQ1SkdOMkJSdloxWDlkNHNTN3BzQXpLVWY2cXprK01JcGMvVkx6?=
 =?utf-8?B?emJ3SzhGT2w2SFVVZGUxMDZCRXRQOUdxQ3daS1JKVFdWZGRNSGdEb1dtNDJ3?=
 =?utf-8?B?RmllSlhuM2Q2TGxyVVNBdUtIdkRmZ0JBR085L3RibTluU3gydzRLY2ZiQ2RZ?=
 =?utf-8?B?NkRDdzZaRklLV1pyL1JyVU1yZW5PV3Z5NXI2ajJFYjB6Y2NHRnBlWmZENzZT?=
 =?utf-8?B?K1lFQ0piYXBVcHFNU0JiNWNZSlAwYUE0ZDFkSXF3WUFtZ2pnVU9mSzdPWFAz?=
 =?utf-8?Q?/c0W+z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDF2RlV5Q3JpUkZldFo4Z01Wd2xVNXRJbmc2YWVHay9uYmlRb1ZFSkxKYUJh?=
 =?utf-8?B?OHpscWNCZXpjMFVTODFGQ2JneXpXN1BGa2ZxVm9Gb2VRK09ZWGVqTGN2MEF5?=
 =?utf-8?B?QU1kZmVKeHJrd2trUGRYUmJvN3BmMm5Cdmdyc003SytCMkVDUXVIY09mdm9X?=
 =?utf-8?B?a1J0SmhaWi9pY0F3WHNQY3hXcXJweXd6RitkeE5KckRVNkFpYnRmbFh2ajFt?=
 =?utf-8?B?aWV0b3ZhTEo3VWgyT0JHanJPWmlLZENKRVJrQ0dWQm92TGJTbmRoR2Rhd3dz?=
 =?utf-8?B?NUtWN0MyeE9PcVgvTFZmYzRsdW5OWEI2c1lOdEZicVJpSFNDNlFFMlUySytn?=
 =?utf-8?B?T1NBeGJHdzQ4dzdQbkJjcTh4bDloSDB6TzVZV1BzVUcwenZZamxBYkhlbm1G?=
 =?utf-8?B?QmxLRzlCVHN0dDFMWE1zbTMxR3NVR2hXREszbGhLdGFQSGJabDByK25RdC9p?=
 =?utf-8?B?V0hWT3pNcEFOZEJsVXNBS0p5SVRYMUZFZTBPSDVZeUVYczZxbVFKY0JGSUM1?=
 =?utf-8?B?eVhYV1E1cVhTL1I4ZEFPMWxjVmkvSUdlWEVyaHI5Qkxmc2l4dmpiekFPQnVu?=
 =?utf-8?B?SHUwdmpPSEwxK2VRQXpCRHJlbGFyc25USnh1ZXdLTk41WlNmeGdHOVhGQk01?=
 =?utf-8?B?cHNUZndEcG1rZjA1WXdQazVJUW1oT1pUcnBnUHVYYzFpSmlDbDB5N2phMHFi?=
 =?utf-8?B?Yi9XZ0w2U1hkLzZONnZ6Wkw5RkNIZGIvU1k5TU1uMmNWL0FFSjRoRHhhR1Vm?=
 =?utf-8?B?TGdQQSsrUmNNajZSZldWM1lFTVRBQkk2UEVYZXZ5ZFAvenRWOCs0bmRFNFlu?=
 =?utf-8?B?TitLN2JlMTEwRVNkdko0R1pDRWR0Ui9IN1ZWVmFRdkJkdzNQTlljSVgvTito?=
 =?utf-8?B?b09qRkFUTFM4N0ZSdVdaeHdDU0VweUpjZm8zRjNNaHpvQmxwd2kvMzdYdDBj?=
 =?utf-8?B?N0ZOVThIbDQ5Mm14NDJFK1ZuSXZsQ0FiMjl1bnFTcG9sL3htSnR5bnBicWRX?=
 =?utf-8?B?Q1ZqYWhPdnFrNTVxcE4rSVAwZnVFOW95akxsUDZDRzF0YXV1OVlpcEFjUnNX?=
 =?utf-8?B?TVZWRnlOZkR1WWFFeCtjU2F2bWkrdWl2WTBuN3R3Q1BkVVY3bmxxRVNMWDBy?=
 =?utf-8?B?QjNrMkZVMFovalpLWXZGRWtWZmZmNVRtOHBvM0NGK2hnTEdTQ1lsSVV1d3Bv?=
 =?utf-8?B?eUpINnRtNThNd3diMGxYekdUa3VJeVJpZlZ3SitLOTYvVjFiZkt4WjIrbVQv?=
 =?utf-8?B?eXQ0MHBOVXJvL0xleFpVSEsyL1RJUmxWM3lMZXVscXhCUmtXSHBxU3R6d0Uv?=
 =?utf-8?B?ZkV6UlA1VGNncm5PeWFtQ0tzbXE2clpHR2FQOHRweTdiekVhbE5hOGIvTTJ3?=
 =?utf-8?B?Wko5RVFobmE3YkEra2N3NUZORXZzT0FqdWdGcXlCZnptYmFYNmRyZUUwaTBB?=
 =?utf-8?B?ZzFMNnd0eUNkN3cyTXhuRGFpaXB2RERJVTdxN2E4bEhsbFhla0RGajY0K29W?=
 =?utf-8?B?QVoxN0tRaThEYlppcmp6bGpLZXZEVGg5b0RIeUxvd2pVZ2EvaVhxYzhiTzNa?=
 =?utf-8?B?ZVZxNEtSazZFZlRDc3g3bGxza1pHejNxUTVUVlN4WHEzOUFhVFdzSVlpbTdG?=
 =?utf-8?B?U3RvbXo3VXFWVWVPRUhYRzRUenM1bFFhY3VEd0podzJCYVRWNE5SYVNlQThW?=
 =?utf-8?B?bGFEZlc3b255RGsvOFpSNHowYTdLbXJUNjh3cTJxTk1kTDNoRGxzTkxUUGQz?=
 =?utf-8?B?dHNFNHRDMjIzRHRlRUVEZS9hWWhweWJyRStqd0F6bEo3ZTBZTWQvS2ZtSE1x?=
 =?utf-8?B?RXBJUHozOGdWd2IvZTdtMlU3d05IYVRwV2JENkE2QzByUmJYMFdzYTZVNnZJ?=
 =?utf-8?B?YzM3aEdNbllvbDFLOG4xOEZvL29lMXFHVUhGSGNKMnlLTkhldUZJemRVQmFr?=
 =?utf-8?B?VTJxSGJXZVpsZjIrVG8zL1ZtTFpuQzU1djA5YnpQVE0zYk9HenpPYVhRbnp6?=
 =?utf-8?B?ZDZBS09NeG5TcHVDSDFKYm9jZ0ZuR3VRUTUwNUJFd3YyRWtEVngwbVhneldZ?=
 =?utf-8?B?cnZQb1FlbFVpdUhhTHZLMC83S2hYdkFKRkcvT1AvenNpRTd0MVNFZG9ZbFo2?=
 =?utf-8?Q?iu5Z8+ZmRDr6vjqbtJDJbickP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a23023f-9291-4919-a1ed-08de395f24ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:33.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpovGvq/ihRWPMBBVsKJin9Ahd18c0fM2OeqvS+pcWLc2f+5Qnc0MrP1iXMWIXDXLKttBdOT/3u2k8Qb+3aZew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Peng Fan <peng.fan@nxp.com>

Add thermal zone node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index c08db08ca9607b9780a77e215cdb5997e4daae4e..d8b5e188949f59b7452df54407d2126a5e1a54e7 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -6,6 +6,37 @@
 #include "imx91-pinfunc.h"
 #include "imx91_93_common.dtsi"
 
+/{
+	thermal_zones: thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&tempsense0>;
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device =
+						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
+
 &aips1 {
 	tempsense0: thermal-sensor@44482000 {
 		compatible = "fsl,imx91-tmu";

-- 
2.37.1

