Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020106.outbound.protection.outlook.com [52.101.69.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C162C2365
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.106
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279978; cv=fail; b=QdVbVG3aGF+7X9ZoJhX2ywH+Jlklr51UcQqIFvgBobYlbOw0f0I08QMgiSTLyzf7jMmTiG1hEi7jko8mho8404NQB0zPHoZ1orOj4QWqBWD9SiJ62jBex25CZX1pLaCz4K3Jf0pUF6znYOarRH7psSVPMWky5s1XBOajtl9L7Is=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279978; c=relaxed/simple;
	bh=TKDwjr+sTWNXaJ7GZP3sWKxqeURBaU+7QHjROieDFhA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=evGmvB9pP2SOjpmCS5e111fv7yi2oOrBbwbKVQXWPWJ8lacMpT5zrNMBqF/SUddgyyRhPurF4uGMxBnLh3Xhx1SPyAD1R7lRK4GyHzAG0htpNxAcmcfEnlTZnUkjMuaHSSgItQhceJbhIQJFVXGHDsCOL4ZbHF3vrKOfD+z0M04=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=ewL77RjW; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=ewL77RjW; arc=fail smtp.client-ip=52.101.69.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ewL77RjW";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ewL77RjW"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tHk4vtP2HMGIGRPmvl++IOVwDavlSFjLfRc0zdBk6FqlDNcX/xGvLfkM/MnwcwUQDfGvEJO6OuWZqNEq//IECyanjg9igFZ07XaKEw3Fm22BPGqNyJ+iHlAoGiDnSnG9ZHrmVvLOyhIDyXYFCbpxnzqvy+ogFkiSOwbk430h1+sfTsg1YgNR5ILFnOEdZNN0NiOLlpXJbnuaJnd1ZgzWL4yp+jJuWaluI5gyjt1T6P8sN5kXfaB5GonnY0aecLkcLuCWR4k7DsVn5zUZ2/UjA2dMvitCOnUQLyvE0bROTMBtcvnidZenjUiwN7ceKIAQtauxvQ65iic4cOzCqZgsfg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu3k2YcgE+IuvkGeeH8YPaVFgquyY9JgmPGeXtv5FMc=;
 b=lPeCM8aincz+8ETXEkKv+Ol0lT2I3hoAdqJHkfO+GX08jQR4QhZISCXD9gzKcDHcNbCEJ1KttJpiyqh5dpzvDUrWrdQCjE5+ADR9Q/qGklRjfmOptWc9pFQhMMH4AS7dCSTdk2xw0oDsbFIgFC9iLhxgW9EzHkcUXdDx+6LZYT6zKYk06NxON7P041eM4LekclaCiqLdvYvNz1WIkm7C2QiTDrcitYmYegu5LqCkAwjwwJEMQjB29HUrIFNpYb83rnq/orplqXURSmbtwLneIGZtU96vTxvP94JvyP2KynlRH7+dBqkuwFp0/Tz5AYokiswnKBoJ73SjMXDJmbwBQg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu3k2YcgE+IuvkGeeH8YPaVFgquyY9JgmPGeXtv5FMc=;
 b=ewL77RjWBF477P9Q8zvUsYhqwZ4vTo8lfki7EOE00VkuqU8VTWL3BIDMuCo8wbl8l7ojFYAOUldXTALsUcH6hbgMMTBD+1LuqAtY103yfgEXu4cM4k/IS5lge/WrMegCrYS/cvV+zIOoLUalW8YOEL48To4EfQgEBwTS+WFKi3M=
Received: from DUZPR01CA0353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::16) by AM7PR04MB7000.eurprd04.prod.outlook.com
 (2603:10a6:20b:104::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:11 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::11) by DUZPR01CA0353.outlook.office365.com
 (2603:10a6:10:4b8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Thu, 1 Jan 2026 15:06:10 +0000
Received: from emails-6700196-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-24.eu-west-1.compute.internal [10.20.5.24])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D0D15800D2;
	Thu,  1 Jan 2026 15:06:10 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279970; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Tu3k2YcgE+IuvkGeeH8YPaVFgquyY9JgmPGeXtv5FMc=;
 b=MQsWPmrPQY1U4iInDE9hY/Ux6s+wKyMAXdzqB0kn1OgLD81LlMz6YFVsyPPsERXuhnT0n
 AfZY+jjl8VE9vX+td8YIJzfbCR+BV6U3tM0Ggnio7Oqa3NFrvrPIekjHWkE7ch+LQZ0yOWN
 ZSRFOIwArSvwfGSA0+jfd8YPhFulRyI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279970;
 b=lfESpzDPA4Q8UObWT2mpgYtyv6w7k1772FbrwmO1LqHGYa2QlPawk6wJMW483nAegFMtF
 vANvdw79RBlz5du9s9XhAQBcOFKJqeG5xnJz+CA5Fzu20m/mxjOdLLfXadoNFDAkhPfpMjR
 vh5tCmeZ5ehETo4Hp32q6ul4eS/r558=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4zkQOilsFcIgYIaCsRDWLqJ+pzI1LceiiAwtChcbs2OA11FpOpvFJKworUgcWJPWhKLmyul456iVsJKR1uv/zDIzrt310B29t+0aeEH4f6t42CwzkYIa6tv4NMXoVobGgT3DBRW9mZo+LkPeNmRLhYcw1mJHVcsCWndOlvGuoUGXU9tcynOCO7jIkTAjN2WTvKJAM7J6gaHe+OqIX6qnqjo7OSMZVTiWTJllO4eK5q55DVTE6lDWMOzSkc5TK/3zBfOswJLGCCWhKHw70i58BC9gL/3Kt/RRuO9buT9jvyMKaTImZy/CRrehZvm5p/bxQjQEqkb8D8pWT8HtHd1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu3k2YcgE+IuvkGeeH8YPaVFgquyY9JgmPGeXtv5FMc=;
 b=TLSRwJKZHsKNgJrxm3SBCl1YfEcfLEp9Eke8M8MsJ5H64MgwEkXoJkD5E+mWDLKFFvVrRX1Oop3eEifhFNdyRoOGNT4nsFQEZDp5VU7rc/KHZKOlUTFFSTr2k1aOBPwlFMZVPislEafMCXEyQTOZe6AfMDjdWT6O3MCjbdz8jYCOGoAaXV/n6Q/ybx3Yg6/tGk4XNTSbUsKjde/Iri/JaXYDhiNU0I1YJ8h9oRR617aCk4K91Wq8SpGWV4g0DpvZQo81bRKyvR7y+tsh6UEyaCMFWE3x83kdE06Jgl7GPsIF4WFEjrnrYnPYDw6wWoJJfbrQrEMambBwxTqbv4FzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu3k2YcgE+IuvkGeeH8YPaVFgquyY9JgmPGeXtv5FMc=;
 b=ewL77RjWBF477P9Q8zvUsYhqwZ4vTo8lfki7EOE00VkuqU8VTWL3BIDMuCo8wbl8l7ojFYAOUldXTALsUcH6hbgMMTBD+1LuqAtY103yfgEXu4cM4k/IS5lge/WrMegCrYS/cvV+zIOoLUalW8YOEL48To4EfQgEBwTS+WFKi3M=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:55 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:55 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:45 +0200
Subject: [PATCH v5 5/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-5-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|DU2PEPF00028D02:EE_|AM7PR04MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a427f1-92a5-40f7-9ef6-08de49474ca2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TFRuZGo3MU9jM3pVcHppYWxOMFNKNmYxRitDZmdoSnJmN1lGVXdhb21iUmpv?=
 =?utf-8?B?d05HeWNLRTFrQ3dMQVBieStBTmQzWUNmSTE0NGtHejRFK3FVakFjMkRiRUI4?=
 =?utf-8?B?SjFCa2R4WmlYdWxaSXBHSkxpemZtSndrYlAzS2txZ3hRS3NvYjBveHdtNTl5?=
 =?utf-8?B?cFlmRmlPSy9xbUNHaEJBZjRGZTgwZmp4VmEwdGdZbmQzZG9pbEo5VS9DSkdH?=
 =?utf-8?B?RlJRRk1CVWlqODk0Rk1VVW9QS3pRd21LbndOTmpIR1FEZFBXdUMzZEt6YkdE?=
 =?utf-8?B?STBsRE83VjRiU2pMckhGNkxRZkJsckFFSkR5c2tGcldObVlrRStlZEFqSldm?=
 =?utf-8?B?ZTNTM1hTWFlaajBvTXYxK21CVEd6dktodjZ4cjRPN0RKQWtxZ0JORzRaYXlR?=
 =?utf-8?B?bG1TN2NWZlBpRC9KMG9BaVV6Vm95Ym1XdDRSdmoxSzJBMjZHSDBYdVVkaFY1?=
 =?utf-8?B?cjAyQzJWcU96Y09sTGRvcEZwOGdBL1NUVVFNQXA3bWM3SkhsdzQ4dTdMcHBt?=
 =?utf-8?B?UjkxNFJxVnJ4Y1BKQ3V1M2o0M3kxSEJhYk9laGhxT25JeTBBR1B6VFhCQyt1?=
 =?utf-8?B?dUpIQlB0MjE5WFAySXNxbjNPQy9wamkzOEc2cTNqRG5zbHZkMnIzUUE3Q09P?=
 =?utf-8?B?dTVkRHJvTnp6TWJ0R1cvd2JvOVdHZGNUcDB4cGYzcDBpTStxVWZJQ1ZQT3d2?=
 =?utf-8?B?LzFGSllTUzZxaWxScStIdmpnRUFPVkljc2pIK2hQcERrTkFUdWxud3VLeUJK?=
 =?utf-8?B?a2p6Q1NNK0xPOUFOVVV1NW9vRXVleFh1aHZLd2prQzV0d0w4MWM4QTA2L09W?=
 =?utf-8?B?NnRRMWtUNHNTMnhEZWMyS3RRQ3dsUzlRMERJdU01VVNsMngwSW5oR1lHbUNG?=
 =?utf-8?B?L2tEekcyWlE0NU9GTFFLUEJJa003dU9HbXdwRWE3M3p0RlJwcVlkNjFpOTdH?=
 =?utf-8?B?VmRXMDVOY0VLbW1qTC9FL1p0NytiREhBUERzVlF4bzB3VWdzS3ppT2p2NmVy?=
 =?utf-8?B?a1NWOEIxbzFDenNMdjVLMjl1aGFSMmIxVCtkTUt0Ny9QSVpRYnp5SE5JRUUy?=
 =?utf-8?B?WGNtMGhmUkRkQjJKb1Z1dG1VWm5VWVZmOGxzaTJSNnI3ckFWSzB2NG9uK2pU?=
 =?utf-8?B?UHR5ZFRyNzZuNm1YR25xSkQrbzkrUUtuK25yMVh4TzlQbUxmL3VQblk1VFg1?=
 =?utf-8?B?Ti9rRWQwbXNRaW1WRHljdUlsU3M5Vkw2Wml0UXp0K3pxN0ZybmZJUlRsUHBa?=
 =?utf-8?B?aDRLWXNYelVoT2FOdVlsMjV4UDd1V1RRTWpHSmh3ZklCajZrN1ljbCtqWTdS?=
 =?utf-8?B?N0ZCU0REbEE2YldhNlJyRXRweFlaby91VDVsK2JOc2JTblNsZVdBQ1cwcWtn?=
 =?utf-8?B?bkdCWEppQW51cGlJY082cHFxVTBZR0NGbWpYSXhPREFCMTNUTDVuKzdaMDM1?=
 =?utf-8?B?SFdIRG83MnVnZVQvcmd0blNUdEJWOWNPblpydEhQaWpBdGR0N2lJelVERm5v?=
 =?utf-8?B?aXhUYmlQY0VNN3pndmxxWWdjQWJKZVdSQUl1SFdLc3p6eDBIZ0xmUTV6YlNy?=
 =?utf-8?B?RWVySXVZZ0FPUnBzMlhLZHhVYmpTK3llc3RZZkp3eVpQQ051RlhhTlJwbXdF?=
 =?utf-8?B?RHFVTXRQTEhreVdYbmFTZVA1elI3QlM0STc3aDVEN3A0TVJlS2QyTTNrVGJZ?=
 =?utf-8?B?aGVEQkM0UnJZY2pCa2VSSzJHdVpSYkkxMmphcCtFK01Pb0NBNG9VdkFCSGFv?=
 =?utf-8?B?QTIyQ2k2aVAvYU1GeWJxczVNbzViYXBuKzZESDZVVWdqMzF1R0RJR1ZoSUJX?=
 =?utf-8?B?bkdUWTJDZUlOUTR5dnByYVd1dG4yYjdSRndJMmtLaGdXc3YwWWNYNGlkNS9a?=
 =?utf-8?B?VHdXc2VFNmwwM3N3ZkhHdjc1T2VmdzF3SGtwRUhheFQ0QXd2aUhpOC9yWFAx?=
 =?utf-8?B?aTU5Q01BWlR2NEdXeE53QzZJRE9RNjFWcU5KZmQvc0tQUG5iUTdUUWhjRzB2?=
 =?utf-8?B?YVVWUWFhRjlVc2N3Ty8zUEE4NXVJOWFVUGM3WExPT2lIcnV3NEpTdkVSUkxs?=
 =?utf-8?Q?xcne1X?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 374e1146650f454c996829d199a8809a:solidrun,office365_emails,sent,inline:113452bdee034aaec32088b4b1e9092b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e172c2b9-ec7e-4450-6766-08de4947432f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|7416014|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?di9kK2VuTVRRL3UwZG00aGNsb2E4OGhqelZYVFBEMFBsMzVzcHlGaFdHMldN?=
 =?utf-8?B?dVNJZDlGbk52d2pUaXcwKy8yU1RLeXRER1JmZzVBTTB1czVvU0Vad2piTjFE?=
 =?utf-8?B?Y0V2MXVxaEJQWWFReFhQS3ROVmlFWklCQ2dMdHlobEJYQlZZb2U4SnAxNkEv?=
 =?utf-8?B?NWtrMWJYR3hncGw5c3BLVmRMRmlLYW1kRUVrbzZibmJkc0lPZWh6V0Zpay9u?=
 =?utf-8?B?YlhkV0RMVlE2c2hVcG16bE5hSkZMWHZuYkNWNXlvQ3ZDMVZBUDlYQWNjMmVj?=
 =?utf-8?B?RWtrcUFFc3VEUWxQSmZEYU0rQVNqSEYwQi9lRDNQem5RQ3YxMlVEMUF6Uzdx?=
 =?utf-8?B?OEJlVHdDcGxVbnA5Ynlua203N0lrQy9tcStreDVWYWtsWGhHeDlkVXNkbjdV?=
 =?utf-8?B?dTNiRnN1ZkJzSGRIYWZhMWd0endkemljKy9BRjJ3V1c2cnpOMlRPc25LRG9F?=
 =?utf-8?B?TnJqTVI1U1NWMThWRUxXTndLakk5OGl0cFVSWHJCZ2M1ZGpLMC90azVXSERI?=
 =?utf-8?B?N3MxQ3loZlZwWUNSN1d5T2N5cjl0Wi9iY1liekk5VDBEU3JJWFVFN0ZkcUxo?=
 =?utf-8?B?anNhT3J4aXhGM25CKzArRmo1bTlPaTlDMHNtQ0RZZUhqMFVYWU91aXY5Q3hz?=
 =?utf-8?B?djhkL05YdVNDWTVBLzJrcGVncWpUejJKdm8zbEtQeXk2TURCRjMxQmhDcnhT?=
 =?utf-8?B?cHdiclRpTzZJMWU0MFBTZDdBbGZKc29hR3VTcCsvMm05YjRDbXdxcG51Qlo5?=
 =?utf-8?B?Ukw3bFJjZEZxRjc4UEh0djV2VFRGZkhrckdkUzlJa3p1ODUyVzY4dXoyL0Vz?=
 =?utf-8?B?ZnFzcWNHQnhRWWVDRFhOVTFMeG9CMDNTMnBoM0FUSU5FSTN1dDFxUzlJV2Qy?=
 =?utf-8?B?RGZIcU1pbnM1ZUxhVkhOZDlSd29PWklNTlRHWm84MFA0MFZNQ2g1eTkwbzhh?=
 =?utf-8?B?L2E5WThQQWd4TU9Wa3hGY3loSjY5MFp6Uzh0SjE0aTEvVXdGNEJIdURFSmZp?=
 =?utf-8?B?VE9RQ1JiWG1KdW5odmZWNERLMHFQdWx2NUZCakxmOEhEc1VycUFOL0lxeUlW?=
 =?utf-8?B?ajlhV2VmTFhEdjZpR2JieTdrU3pMeXAwTjIzLzB5eTdJcnh3NXI4azJCdzJp?=
 =?utf-8?B?M3k4VDh3RVhobmQ2N24yaXBrU0hhcjRsMHRMMVFyNXNaVlpDMUNSN3NSY2Q4?=
 =?utf-8?B?Zlk1NkQvdjhnQ3I2ZS9Mdmo1cUdtOFRvUjBKbC81VHY2RExzSEtPaGM3V3NM?=
 =?utf-8?B?LzZqVXd5UjgvWm5SVnUwa2tpNG5tY1lKcllkaTZTRUc3dFFqb0VVM29jSVJW?=
 =?utf-8?B?RFhxVnBiWlV5SlVMV1RYQldwMFhVQzh1WE5QK3FPZ2NIT3B0dE9aMlNIb04v?=
 =?utf-8?B?YVkyaTR1ei9hVzJxOWlwZTZhSjZOaGhnYVE0TCswV1dISTV1RDU3K1Z0UHdP?=
 =?utf-8?B?OG93d25FdzR1VElPWjhvOGNMdlV3NlFTSzRkMnZhUVFNYlpWVVRDbUpkU2J2?=
 =?utf-8?B?QWFzam5OTjRobGxKaVN4Vzk1eW5yRDlhTG5iaFNUZHlGUldmR3BwTVVFSWJG?=
 =?utf-8?B?RmdoM0VCYktwMkFDSTJ0M21JNFVrekpLRVJiZFpTVE9zMVV6VEVWZ3RUNVNw?=
 =?utf-8?B?T1hXZjZyeXpqL1ZvVHY5TnBCK1dsKzFwZXV5WWM3UjVTbitLakhrUGtnRzhz?=
 =?utf-8?B?K2dZS29KTmQ5R0FmaC9kMW9YNndvRWcxQ2VOdkxHZEZrQkRRbzhiUE1mcWlU?=
 =?utf-8?B?eEVQOGoyR2d6ZTJnWFgwMXVQNElOK2dhYXIxUlJ1bHp6ekVkeG5oTjdkWkkv?=
 =?utf-8?B?RGpETXFJR3BFc3RxU3FNa0NJYnBwd0ljSEdDNkg2Nm1uc01jRzBzRWI4YkJ0?=
 =?utf-8?B?bERCNjhmaTNCQjd5TjZYRXJOYXlvUGxoTjQ0ODBReEN3QkRmM1NpNFZCeWRv?=
 =?utf-8?B?c05WSG4vSVU0TnlvU01vZi9mNkxyOUZBZlJSTTh1bHFSNHpzZ2V4NVZ6MHY5?=
 =?utf-8?B?b3ZrREowSlo2OG9VYXlISnE5TlJybXk5YW9aK1l3cnB3Szg4em9sWlpXZHVv?=
 =?utf-8?B?MlRCMFZxSW0ySy9ocHo2SlR4K1BYOWRVcHlzaHorWjJOZ2c5YUJad1VkL1k4?=
 =?utf-8?Q?8rgg=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(7416014)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:10.9988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a427f1-92a5-40f7-9ef6-08de49474ca2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000

Add description for the SolidRun i.MX8MP HummingBoard IIoT.
The board is a new design around the i.MX8MP System on Module, not
sharing much with previous HummingBoards.

It comes with some common features:
- 3x USB-3.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 M-Key connector with PCI-E Gen. 3 x1
- 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
- 1x LVDS Display Connector
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

In addition there is a board-to-board expansion connector to support
custom daughter boards with access to SPI, a range of GPIOs and -
notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
to this b2b connector, or a termianl block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb addons.

Four dtb addons are provided:

- dsi panel Winstar WJ70N3TYJHMNG0
- lvds panel Winstar WF70A8SYJHLNGA
- RS485 on UART port "A" (default rs232)
- RS485 on UART port "B" (default rs232)

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++++++
 6 files changed, 935 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c4c6fd6de963..97e600015464 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -213,6 +213,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 000000000000..e66ee2ce69d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			data-lanes = <1 2 3 4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 000000000000..f8fb7fd0e4e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..7bbf800b78fb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..d4bfea886ad1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 000000000000..a85569052473
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,719 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard IIoT";
+	compatible = "solidrun,imx8mp-hummingboard-iiot",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos; /* J10 */
+		ethernet1 = &fec; /* J11 */
+		gpio5 = &tca6408_u48;
+		gpio6 = &tca6408_u37;
+		gpio7 = &tca6416_u20;
+		gpio8 = &tca6416_u21;
+		i2c6 = &i2c_exp;
+		i2c7 = &i2c_csi;
+		i2c8 = &i2c_dsi;
+		i2c9 = &i2c_lvds;
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		regulator-min-microvolt = <11200000>;
+		regulator-max-microvolt = <11200000>;
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <250>;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		label = "m2-b gnss";
+		radio-type = "gps";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		label = "m2-b radio";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both flexcan1 and flexcan2 tx/rx between
+		 * expansion connector (J22) and on-board transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches can bus between different SoM board-to-board
+		 * connector pins which is used to support different SoMs.
+		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
+		 */
+		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			label = "m2-m-wakeup";
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	num-cs = <1>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	ecspi2_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
+		spi-max-frequency = <166000000>;
+		mux-controls = <&spi_mux>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <43000000>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		/*
+		 * This reset is open drain,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+	clock-frequency = <400000>;
+
+	tca6416_u20: gpio@20 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "m2-b-reset";
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_u21_int_pins>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "rs232-shutdown";
+		};
+
+		lcd-i2c-reset-hog {
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			output-low;
+			line-name = "lcd-i2c-reset";
+		};
+
+		m2-m-clkreq-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			label = "D7";
+			color = <LED_COLOR_ID_RGB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <0x3>;
+			chan-name = "D8";
+			label = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupt-names = "INT1";
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		/*
+		 * AM1805 RTC used on this board has only nTIRQ pins wired,
+		 * which is for countdown timer irqs only.
+		 * Driver does not support this, disable for now.
+		 *
+		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+		 */
+	};
+};
+
+&iomuxc {
+	can1_pins: pinctrl-can1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+		>;
+	};
+
+	can2_pins: pinctrl-can2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
+		>;
+	};
+
+	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
+		>;
+	};
+
+	/* UARTA */
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
+		>;
+	};
+
+	/* UARTB */
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&pcie {
+	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* M.2 M-Key (J4) */
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};

-- 
2.43.0


