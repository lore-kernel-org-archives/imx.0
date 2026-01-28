Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021127.outbound.protection.outlook.com [52.101.70.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571F30FC3D
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.127
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617372; cv=fail; b=A9t6gzULOIi1J9RXhGp8cu4yEVcK6NEfoqac2/jPZBvDYz8KZCc+SMCnzk/ev7PvtJKCkKWpWMaS8m4KPJ3wnwdfDe+itW+PJOPfAud66i9GHQ2rcDGibff1/0tSGu/4ZrpXKGwFT/IOrxNSmu5j33JZh8oz37hG4oeFNJmIUnU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617372; c=relaxed/simple;
	bh=Dk/wn7d68fWDHNJs+1BlZ4K8F2ZYzkGyzbp7Lt7eWHI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=phqJdRxhGQ2PZhnf8T28cIYOIfhgNtuIIXjhDuQs9IbhwtFpBtBHQlg7pxi2x6wW002tLsy2pCPA4kHmIV3IOow96LwqUxjvMzG3kzawqJktHEms7rwdPbV7kyzEuUa8zqoKqKM9hn8d1UKdQkPmhl+JR6cAZL5ynutDAFTFN7k=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=IGTMTu5W; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=IGTMTu5W; arc=fail smtp.client-ip=52.101.70.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="IGTMTu5W";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="IGTMTu5W"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ex1N0V3nHg5C0iqDG+lTipvXe5fqAM7uSQxsy/TmaYsQ2oVw81j+ya0z7zhHlsTAeC7q5g0DUz+RNX5gkVQ8urN0LTVbvWqVut3IePaivHOxZaLdd4NjCeEZUiJ8vSnya7Iq9gk5MGToJiW437h2ZFUgyelXtqNWsPeeefLTN47crg07WVRTGPNEoHylQ+JsFgbwR/dUHSGm8YQKFawPC3voSd533gDXfRA7g0mF5aFD43NWPTWO7nFhVlGiHqMoqM+bjw9a0xdNydw7118hW7a1K3kln/vpddspzLjw3gqn0FjAUTqVSOdRsXxI3HF71WRoBjcO0Qix2up5OAmyAw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ4H2IYVsolszdiDB8cD7Yhj4uQ/GoWsUfN5P/Vh/wY=;
 b=okRU07cxukpD5xidaiQVIRrsOhmJ5ioY/EpMh2SNcKdur8pHRHVeHNryXGLuEaI+Qe7i1WZQxsOJOZMDgXzfu/AAQ4eA3c528Y4mqjk/1djigUyCnGL6WvrsWq8lSPbzOSkKY+8VXGOO6cyTvpN8aPGBXUA7iKQ4VNOV7k86Aw3VoAQVDBDltW+0OCE94cX/clZ2VjhccCu6swBtxwlnw3V+znQ5jL8Sl/SlgpFduSF0ZjXUVOuN9ha6+6xIGi5AtnEkrwxZICCPRr2HwvAMRs2GakxzTxanmY+iNfQR8jHdvFG3zg1DQtJmnhPLQ6wSLi2j1YMCrH1cfSFCMZt2hQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ4H2IYVsolszdiDB8cD7Yhj4uQ/GoWsUfN5P/Vh/wY=;
 b=IGTMTu5W1Zsmkjm7HX8Z+Eyyd9jjDgXFTdX7/eoJ1Pv+Vyv+2uXd4SZksD6WN4MSDiPd3dysrTZXbK+NOTAdusrQ0Q0Kk2BqpOJf/n8QWfVxBOwt6lKiQW+XSeZXII6SHrDeGJ8eS5RDxiZ+/hjJF0zSKHykNzp/fAP27QBI9j0=
Received: from DU2PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:10:28e::13)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 28 Jan
 2026 16:22:47 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::a5) by DU2PR04CA0248.outlook.office365.com
 (2603:10a6:10:28e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 16:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:22:45 +0000
Received: from emails-2547891-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-155.eu-west-1.compute.internal [10.20.5.155])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2415F806B8;
	Wed, 28 Jan 2026 16:22:45 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617365; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=RZ4H2IYVsolszdiDB8cD7Yhj4uQ/GoWsUfN5P/Vh/wY=;
 b=kJWdCmRUnpuasIRoU1BJ/y3uqS0j6KjERJMmMk//IYt7i7oNiOO9dmemlAL1Gaj+KcaOx
 n9856RkgIMhvfBH9Z8LQz+0ojgVaB0IDtyfG2RAIb1DmyaPYU5qSZHuF4gzBOV9rq4PVq3f
 b0E547zU5uhY1E6ZNFzAe1vBUuW+Obg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617365;
 b=ejiG3mzcY0fYYjfR9ahnmL2M/KUa20TjPUcWlZcPPdB6NGg2IRGxLslUzsBhSZsUncnJs
 /b81OfPrqBiBd4RW9cMhcnp7DNv5xZFvUTzujFqT888/nq71ySnMpDL3qZBXDNRIbgvPUdP
 65+85vNLkBq1d4q4FdL8hYILvU81nEE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+cvk75q5wzKmDxdXZVigAXqr9C4TRtm87ML2skAcGHMkkqb72GhJWb2NMFnSd+Z0RCBOTKZVYOlgPywX7Q+Mhi6nfxm07Mm0GTpZ+Chyn9x5pin5HD8dcowi29S/tKqvIQ00ciApnyYoFlmt+JxVSoXKIvNJfscHuOTobP6FCASa1CGGWUJOs/Dq/w3zLKz3OsgD6xE5eeirxV9qi4diHC+j0CSFZTQEO3bHcxfDPYSFMl/gRTqT8+DCR20sTkg/76j80GCY/WB2E2d/MigX2XW9Kxx352DxFEhbpjY1CBdgBbEGAkyAqg/PKNTWjySrOnTNkCA97tvEBos8XNZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ4H2IYVsolszdiDB8cD7Yhj4uQ/GoWsUfN5P/Vh/wY=;
 b=Eg/SCQXhzM3L9Vg0u0RtgCpDTFjOhUzpkapj3x0SlRa/S44dyrTtJMhkph0u+u8L3XWcXnw/mHrO0cBGZEIhyS3YWtgjMcbsqMDy1uKaDQ3ZRMBwTg/uVWUACvUtmzMt5IamLiHmsAkFtw7mNTQ08djojdGWBv8eOJYHonmxwj+z0SJbFctXfKQ6IlvtEmf9lx3+pCQzPzL1TZlQhiSGwr3oF/3veART6Iej7sT4UmRc1+NqJjBLBEhooxg23Hvm7RnqSedLFlUT6mHSGbiWOlksLFMce4oTDX/2wvmEx9kRvshED/EskBbTqXy/THI0OEEsx1mxSRZNjStbjOvZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ4H2IYVsolszdiDB8cD7Yhj4uQ/GoWsUfN5P/Vh/wY=;
 b=IGTMTu5W1Zsmkjm7HX8Z+Eyyd9jjDgXFTdX7/eoJ1Pv+Vyv+2uXd4SZksD6WN4MSDiPd3dysrTZXbK+NOTAdusrQ0Q0Kk2BqpOJf/n8QWfVxBOwt6lKiQW+XSeZXII6SHrDeGJ8eS5RDxiZ+/hjJF0zSKHykNzp/fAP27QBI9j0=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:21:32 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:31 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v8 0/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Wed, 28 Jan 2026 18:21:24 +0200
Message-Id: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ3emkC/6XQTWrDMBAF4KsErauiGVk/zqr3KF1Y0qgW1FawU
 5MSfPfKgZBQa9flG5iPx7uymaZEMzsermyiJc0pjyXYlwPzfTd+Ek+hZIYCFQjUPA0XO5x473h
 K+cwVKiekI+o0svJ0miimyw18/yi5T/M5Tz83f4HteqfMX2oBLri2MlotlbFg3+b8lQKfvsdXn
 we2cQs+CBB7AgsRLEoZKLRtSzVCPhGwJ2QhXISu8VHFzlaJ5kGggB3RFELJIgTtEVysEepOaAE
 VQm0tpG4dkvDCVAn9f8I8EWB3hCkExbKSBmgrW6zr+gsgwgEvQgIAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PAXPR04MB9447:EE_|DB1PEPF000509F6:EE_|VI1PR04MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: a5dff4d9-1a48-4bd4-4c08-08de5e897830
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aThEUWd3czY2eVR5bFlzZUR0VnlxNDdVOXVZdTJvVnlHS29LdDhKeHlWWnl0?=
 =?utf-8?B?YWhLVDFDRmd4UUdQODVxczBjL0pVQ2pNcDB3Tmp6OEwxU29JT0xIRnozUU84?=
 =?utf-8?B?aUV1VkVwaTVLdnRRejJlMTEyMWN4d0o2aUlFcFBtOFpNUkZGZE1ybW9JZHI4?=
 =?utf-8?B?emdDTGNuWDVPSmZUR0VnQXZNalo2Y3BvdWp5MElkSzdJdjFNWm1BMmhsUjEy?=
 =?utf-8?B?V3c0djhXblQ5VE9XR3k1TEE2ZzhiWWptOG1ya2RZREFRQ2xkM2ZjR3NTRlVJ?=
 =?utf-8?B?TmhyYkluTkgrN0pNWjJ3S0ZEZlNiTFJKM24zY3FVT2ZGVlhMcTRHZnhNNmR5?=
 =?utf-8?B?TjBDb1h0SjJoSS9NQWFYQTMwT0Fib3d5WWx3OGQwU0RZV21tQ2dpWWM5Zms4?=
 =?utf-8?B?Ymd3dU1MamprM2dydDBzVEViS1ZyRU9ONHVvdTRXblp2eGpWblJxZVVqRS9x?=
 =?utf-8?B?NmhaVkQybUZqWVV5NktjaVoxU2hXc3ZGUWxQdGJ0dWk3UkgyekVnVURCU1M3?=
 =?utf-8?B?QUh0a2pDa1RIZmQ2dVUzNU9MSlB6TjY4UWsxamY4TmhMbE9vWkplRGFueVJz?=
 =?utf-8?B?cnY3YVF1T2xyZVIySWRYejdIdzcvQ2J2YkZDTXVGN0l6S0pwSE41YTl5NE9p?=
 =?utf-8?B?c2N1MFRnc3Z1RjQ2V2JROXVzR2dXb2hnRFYrREVLbFNWQ3BtNysrcThmbStm?=
 =?utf-8?B?azlUKzhIZDl3eUdkU2o4Tk5vV0MvZ0xqeldLTjhvSkhnbGQwdzdXOTdUczcy?=
 =?utf-8?B?K01uc1dlZ1ZneWsvRHlxNFdRbTlOR05JM2JqSGdPR3FzRml0SnlZd0paYlFY?=
 =?utf-8?B?SkFSc3dIa05OTXhkUllySGE1QkEzdjZEUXlNcTFmOTl2NnhOV1lXYi9naW5Y?=
 =?utf-8?B?MDArUkZFV1pCd3V6K1RVdXViWXJjdnh5djBkSi8xbTRrYWFFdWVHcGw0N1pt?=
 =?utf-8?B?OExNS1FJQyt0TUJFRUZETUNUdDhQZWRBb3BNbkxPSHplaEV4UDVKMzdxbnB0?=
 =?utf-8?B?MjV2dnFFM2hDUkF1aWY3bS9FUnRwL0tZRzdJWmtrZDBtZUJpSTVjbHE0ZWpF?=
 =?utf-8?B?NnljdTJSUjZkcExQbTZiY0hDV3RBNmxCZUMxUmRGdVFDeFFxMDh6c3R6czNr?=
 =?utf-8?B?ODF0SVhGVmZOVFEwbEtyM0VhNnpPUG5YeGNtU2xrcmpVVVR5UFZRa1QvMFRw?=
 =?utf-8?B?TUU4N0FWZHl2RXY5c1dRNm80WFBMMkxVakFGZ2JreXFZYlcxb3h1TGFBYkZW?=
 =?utf-8?B?eWpLd3ZGNU43K0VnRWNzZDJnQVJuMlpIVHNpcWJBTU9XSmhuYnJBUEx3eFZ3?=
 =?utf-8?B?UDYwYnhiZHhjRCs1LzJuU2luOEIxYm56V2x5WVpxWTNkZlVpQUhUMFRvaFli?=
 =?utf-8?B?Qnp1ek5xQU93akUrWGkyYThNZXJmckNDT0szbkdVczJDMk9kUWd0b1gzY1Yr?=
 =?utf-8?B?dy92Y0pKc3lsM1Q1dy9HZXRGZWR6a05Oejk1eXc0Zm8zQmxFVXBtVGszdkVo?=
 =?utf-8?B?bHN2bHZNL2xIQVlUb1QyZnpaa3ZYcVdtQU8zbUc2SE8wcnFyeFY2MjdRNm5i?=
 =?utf-8?B?eEt3cFczbitiSGZHZGlXb0VuTWlXWk52bXFXQkF3bHY4aFNubjBBbWlMQjN0?=
 =?utf-8?B?S2pOWjZGaGxPejB6SUpQeGxDSG5SaVBIRU53NFJ2RHJncFJBZTFnUm04TnVB?=
 =?utf-8?B?V3JQd1hranNSQXM5V1hzN3NGZFZlTFc2R0NjWVZUT3lxdnphcEdGKzJ0WGxQ?=
 =?utf-8?B?VmVneFZMRkRiQ0JsSEVSVEdVbmJVYTZ0aHNpNlN6bUxlbXRJVElwTVdNZXZ1?=
 =?utf-8?B?NXpSUWRjb01UaS9YeVFBRndiaEt0OC9qS2xQNlFXR1F1dTI3bVcyRXd0ZGNN?=
 =?utf-8?B?ZHVYc2xQZklzeHMvYmtWSTFaUVVNRWUzRzJNL1A1Ylh1eDJ6azdhaWtqYXUy?=
 =?utf-8?B?SlcrOEZnWHdFUHEvOUhUMko5YmRUcGp3L1pyMmM0a3JRWUJFemRVSmZwNzJk?=
 =?utf-8?B?YlBuL2g0MGYwcU9WRlJzd1NuNWV6M0J1bldMdUlTR2t0c2F1OGQ4WnMvSnM4?=
 =?utf-8?B?ZlZyYTJtczY1QThTNVIyNm1vRFA3WlJXdnkzK1hYRWZQMUFFaXVIRlNkb0s4?=
 =?utf-8?B?aVZVN2pVaXMrWklCbGpaSUlDTFJMcWY4UDA3bTVMT0NST3lpMUNiWUhvQ3Z0?=
 =?utf-8?Q?zLQr99TbxeztyVgwy0TrCJQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e93257aabbd245bc8752fdf97ddeba5f:solidrun,office365_emails,sent,inline:9b090c66d9ef8042e2fc0e00da84b2f1
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ff3a331-5e62-4791-5db5-08de5e894bf0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|82310400026|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEdwRk5Ia0VJeWpSTjFwRjhTTG4rRloxWUZTTjFpRWtTeG5YVERLUzlSOUJl?=
 =?utf-8?B?cmVnK1ZMa3NWQWVqQndsamhVYmJ4QU9ST2J2MTc0amQ2RytvQVZad0JsWVdh?=
 =?utf-8?B?UmRtMjVBeGprN0toZWptVFhLU0tMZ1dqMFJPdTN5Qjh5VllEaC90N3FveWYr?=
 =?utf-8?B?Tkxkd05vNDEzV0Zpc1E3ajdrTTdORlJJNTMyVG1zU0NtMGxqd1ZiREIzU3lP?=
 =?utf-8?B?TlNwa3JCUHhMcklhaUJLRnJOaFhVN3hUa1YxLzF3UDRHVmh0Tnpub1lvbUEz?=
 =?utf-8?B?UXNmTFdMOW5TTUdJTm9ydTRiOWlvdDBBa3pwUTFQa1BHelY3NkxtalpFaWUr?=
 =?utf-8?B?YnhaaVRMbUd1bHVsaDNJVStSYmsyNnZDL29ObWQvUHpFYmZzUTlYRGVIKzJp?=
 =?utf-8?B?dnNrbFpjQlJXYm95M0Q4QWZUeXIwbmRhVWpoNHdvT0pkYnRRU09vMUxpL2JP?=
 =?utf-8?B?WWNxekpBSitScHlITlhJZVdsazJ6cEwydk15b0xKVUZJUko5N0RNRnRDMjlm?=
 =?utf-8?B?RVl6RTNFL2p4cmRydm9INUpoMVN5bnJaNmxrcktlVDlJMnJ4dDR5dy9YYllC?=
 =?utf-8?B?Q21hSkpscGNuVUdkaTVKY1dCdGNCNmxzNnhwRVV0cUtjT2h5c0sxUDJxajJM?=
 =?utf-8?B?Mlphakt6TXpiZkV4bTc1OUkrdjJ1cXN1UU1ud2p0bW5qZmNwM0pzTkhDbDRF?=
 =?utf-8?B?RXFDdkxaNFkvV21KdGgwZXZacG5CZE9oRjd3RzRrRXpXUWJhTTB4QlBSNkxp?=
 =?utf-8?B?eWxQMThROEJSUW0yS0tHZ0tBWEp0b2doRHdYUDFZT0U0ZDVwdDhmUGY5eitB?=
 =?utf-8?B?T2s2U0VTR1pUeXZaUTZCWnpDd1p3UTlMTXpBNDZ2bEpFWXJ6WnpIRnVwd0pr?=
 =?utf-8?B?aW1rQjRtYTNyTVFkdytiMWRmeUl1cDg0ejdNRlE5a1RlU3gvQ1pPY014YzhB?=
 =?utf-8?B?OGJFUU9PREt0UlVUQzZoWEF4NVVDdU1xUllqbmZTZXluMVJ6UW1UaVpJN3hM?=
 =?utf-8?B?QjlDVjBFajAxc2JqU05rZWdkbUN1LzVDL0M3TEZXVml2L0FaR2d5b2hrdkls?=
 =?utf-8?B?eTBmVXZsdk1ZWXZJSU1PMUplWWRpTlY1bi8ybDFOOHp5L2N2ajlQcDZSeUhm?=
 =?utf-8?B?cHdsbmdkMlpFV081eVRIbTk3VFEybzlhVE5YZGdWMElKZlZXL09INDVtM1d2?=
 =?utf-8?B?djc3V1pJekJGU0llRzNPSUlCcWZkdG9DbFAydkNFUS9vUlhqSWordmlEdCtk?=
 =?utf-8?B?cldjTE85cE4ydGVrUU1KYVFTMzl4UnowYVVMK2ZEY2ttcitycEJpUFRVUTU1?=
 =?utf-8?B?OWdqZDMxNGc4SE9zSG40Z0N0NVpsWDRIZjVYVlZGd1E3S3I2ZVRyS0JTV2VB?=
 =?utf-8?B?c2wrS0dtOXNBRUxvL2l6QTIvMWhXYUErWERIV1dRV3pNUWZSS3d3ODlLRFJa?=
 =?utf-8?B?STlVbFhIZEJXUTZGNmNYRTc3WWY2RTZSMWY2S3FlRkwrcUlqTGdvdksxMnRY?=
 =?utf-8?B?MERlVU93NlJEU2p0TVgyNzZwc0lhMUNOL0pJa29kb2ZYUldWY0VpVkk4Z0NE?=
 =?utf-8?B?Tm4xMjJyZ2J1d1BJeURwUGF3VnBSSko2T0VPZVpiUDFhQlV4a1oxbTV2Mi9i?=
 =?utf-8?B?NEkwQnFia1o4eWQ1V25MOFlBTC9uVFhXdEtlYU82SWRHek5kRGduVW4zbHc3?=
 =?utf-8?B?UHJKWkVINWVOUXdBZm9GUzlKQ0M2RnppZXVqVlV0T3ZtUjlQM0ZiLytDcE02?=
 =?utf-8?B?WGozMDlFMzN1VVN6RWRtVE5DUm8vL21oSGY3TkhNZkg1cVlFOHhvY2Z5aXF6?=
 =?utf-8?B?TUpXT1A4WFQ3ZEhjMkVZeGdac2dVQTJiZmhZa0FheUNxUEcyS2lvbkVpSnlG?=
 =?utf-8?B?NXBvSEp3a3Q3VWdOZ0JzdlI0VjRPYUQrWnBIWFpTVWR0ejhzcjBVQUVOTld6?=
 =?utf-8?B?aVYrV3BRTUROWnJOa0lUeUd4c2JxUHdYeHk0Q3pBa1JLMDBTWkpqbFBURmJo?=
 =?utf-8?B?MVN0cGtYUlo1RmtHT0IySktNQ2VKUzMzQ0ZXcWFWMlhPN2pvS0krSDBDNFJw?=
 =?utf-8?B?RS9mTFV5dHVIemYvczhLVjl0cFU4N1JUWXNTeGxpSmEyb0xwMmZ5ME5FMGlx?=
 =?utf-8?B?cy9LL0FXcUdxUzVaa2sxWXdNR2V5OUxqY2tGT1FtNisrVEFTdUJyQmkxSWg2?=
 =?utf-8?B?ZTZUMk5yV1JsUnZmcDRuYVJLbGRrVENld0k3alFkSGh1MittZnRRUEEvZVhI?=
 =?utf-8?B?WmRwVTJhbjlrZHFiZmZER2hPWnh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(14060799003)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:22:45.2744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dff4d9-1a48-4bd4-4c08-08de5e897830
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v8:
- sorted most dt nodes by name.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded hb-iiot commit description.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded commit description changing dtc-flags for imx8mp-sr-som based
  boards.
- set DTC_FLAGS before dtb in Makefiles.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- fixed spelling and missing paragraph separation for mini-hdmi patch.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- Link to v7: https://lore.kernel.org/r/20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com

Changes in v7:
- updated Makefile to apply each addon to the base dtb, for better
  coverage at build-time and dtbs_check.
  Fixes Rob Hering bot warnings.
- Fixed subject version prefix (v6 was prefixed with v5)
- Link to v6: https://lore.kernel.org/r/20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com

Changes in v6:
- imx8mm-hb-ripple: sorted i2c devices by address;
  removed unnecessary newline.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- hb-iiot dts: sorted aliases alphabetically;
  fixed gpio flags for vmmc regulator;
  specified led@3 reg field in hexadecimal.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- Link to v5: https://lore.kernel.org/r/20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com

Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (8):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add support for SolidRun i.MX8MP HummingBoard IIoT
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  23 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 721 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 13 files changed, 2548 insertions(+), 9 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


