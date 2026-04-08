Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895B27979A
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673546; cv=fail; b=TUtxZJ92GdJx1K8xBNK+n2KayDTn/4Svnwc4ncr9TadNvgXOACwjnk1vrsUcegt/ckJj5XryK7UjE+FNo4iSb4pBhF4ZMQ73pGUw6LX4zBQ1m9LOOZU41N9pejs8RF9I0KTLyn0o6f6b9CRTezeiJG/qJ6jOa7rHyP3sBmoDLFU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673546; c=relaxed/simple;
	bh=Af4jsNxvygixol9UcXJR7TVdhJLDjrgb+2o4Ck4IAB4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=hrZsdjY0gbC3VYxMxsaSX6yPeeCZDSycYzznYETz5kknv/vhTTbc4X6V86h754VavfSASOrDL29hoXaELNLxTvApGznWtXG3lB4rMqZtkf1onFnDeGDZqy224BxlrR/INlmQcTQXtrz0q43pOM4iKhn7WGgx+AFb/AsvzM7Bw78=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dvOTIprf; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=dvOTIprf; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dvOTIprf";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="dvOTIprf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WdF/5VtZ8mLWEd+oYzai0TsriqfRZ3jKlBd8xsUszgxItHvgVlktQeKigHDXPqC+RxvRhkR/2m+uty7wqx3T2tkCxmy6wdDhuUBhmjpdCffnSW3bjyvVEkcOm9rNO7fJcgnwxHvbsQWiix0FbKGp6Fxsz8FzRq7rS51N4MHmympeh4GtKv9Jr6cJZKkZC0D9WJuo8SC+nF96S45zec65O+gDFccpEtHYtXudxs406Mkbq7qisgJ5qPeJmpJ6Do5b8fpZ+ptP+hFG8IXnzKBhx6iwUxYMogSi35bSHAbAL/HJgMGwF2vYzto3seGtH+OhEpIKPm5xD0FBED4SVR4hZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0IIItktE8q+xUrHoUgcikkefqd3v2lFSzsmCh4UvrU=;
 b=r3kQOKyVsURYr6/+XU1ebU7NUM+RFWGEYx5sxtvk5VZuLyW6h1OdEYVVYpos6RKAjQct5oPf+cQgdbM/Gsk91RRa61SFYcKK4J1b5msHvb6EFELzG9GoIoNvur9GqWYXEaAMQSuxJl2dlcs5u4G+EX9Hv0c5hpndOCleEcTmojcsaWnyWt58zdUL+Fz4JIIWkBm9VHspHbO+eyJKefobCmlW3uv7GodH7qR5XijMcWZxyAv4EiwwLGILrrsbjVnqKsb6LKrIrgtyK8t4klX1tP/O/4Lrrwj57jVBuC3yzL/WvfqDrKxVycws/+C80UZ9hAhOxvoT7TmxFyFmPZFR4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0IIItktE8q+xUrHoUgcikkefqd3v2lFSzsmCh4UvrU=;
 b=dvOTIprfEuQF4XLslo9NzKc2KzP3oWMlxqlOrFrf8p7U4DXbVBG2maYsiZfnaNOZEpISeGuDI0cVoHiaHnNKgRbuluHXMl67SAlbpQqJpMGw4//uPiVfuvng6XvHxWRopGOsA9Pjz2dqRy990e+OYNpc0jK3I+7G2Q+hJiGJ1jhZXOzmRqbdVIc3VB/WQ/2i5cEz14Qqd0h7tMsNL/V1djic/HK8RJsfeMzTpwmxctjtuQAMnQ1Y4jWS8FdlvRbgpKfTbDukutkjkqFZ0ocgjTt0AMU1K90csKhmpqYAOVQcLYoZAgcf6WQJ7114NONmu6DYifbbJfTRHqNRDDMwhw==
Received: from DU7P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::19)
 by DB9PR04MB9724.eurprd04.prod.outlook.com (2603:10a6:10:4c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:56 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::53) by DU7P194CA0016.outlook.office365.com
 (2603:10a6:10:553::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 18:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 8 Apr 2026 18:38:56 +0000
Received: from emails-8631603-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-77.eu-west-1.compute.internal [10.20.5.77])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 33058802A5;
	Wed,  8 Apr 2026 18:38:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Apr  8 18:38:48 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ+SdvV3mRHjEiaAiMFN0GVey6uBRqtolmPC/+wOLNJw2jZuM/ogoIF3KcvYty0Rj4lNDAWG3ZKt5bYUH7LqfbQn+Xtb3ll09KVSE43kgHUqcxMw+QFbp8+189ARlQ6Zj7LCExRXfeFPAPvllVMq7iGYwA8D/XM3SnfhpHwluHXykItCUGV07MmGxyf0LSpESjMvdtghVcalHJ0tinCuTF7M2nTggenB3rGESc1JxZsNcTZEUYNZTJHLBR+Jgodn96p9RaVFNwW3sBMUASkry4VeNtfxjs3Dq/6BKYLaU44p8Y09lz2z2PtcC3+2s5s4UzJqV8QtVGOrhk6QlWoAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0IIItktE8q+xUrHoUgcikkefqd3v2lFSzsmCh4UvrU=;
 b=NPUXQbAn03ctHqZJ+1r6wqxMnhcRfXKf02UVpWRWeJh8pynjQuUY6RMAIGDiqHewD6lQRHftFYaavLMrJ2adIE1GdXnGGxDQJSIKxy9aVbFPIi+7mbBGDK18BDlr//KMF2xAwVQYp/iEPSl9An1DDkQJcfnlARnUpccqgVGc+OpSlmORP2uMOKnUIyUO4v5mUIw8x/5if68hAI0ouacLk+0dvjJorTEkQktIVxTwna9UtJTmBOb+0JQPOkar8OVd7Z9ss+J6ZpIyhtNi7ccWDyggSpEyprD9kdGIBXv6gW9lpMxIikET8aTMKF/6qSnViBdXIwqZ0yzbd6jD0pjewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0IIItktE8q+xUrHoUgcikkefqd3v2lFSzsmCh4UvrU=;
 b=dvOTIprfEuQF4XLslo9NzKc2KzP3oWMlxqlOrFrf8p7U4DXbVBG2maYsiZfnaNOZEpISeGuDI0cVoHiaHnNKgRbuluHXMl67SAlbpQqJpMGw4//uPiVfuvng6XvHxWRopGOsA9Pjz2dqRy990e+OYNpc0jK3I+7G2Q+hJiGJ1jhZXOzmRqbdVIc3VB/WQ/2i5cEz14Qqd0h7tMsNL/V1djic/HK8RJsfeMzTpwmxctjtuQAMnQ1Y4jWS8FdlvRbgpKfTbDukutkjkqFZ0ocgjTt0AMU1K90csKhmpqYAOVQcLYoZAgcf6WQJ7114NONmu6DYifbbJfTRHqNRDDMwhw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by OSKPR04MB11391.eurprd04.prod.outlook.com
 (2603:10a6:e10:99::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:45 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 18:38:45 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 0/2] arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard
Date: Wed, 08 Apr 2026 20:38:35 +0200
Message-Id: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKug1mkC/x3MSQqAMAxA0auUrA10QsWriAtpUw040YAUxLtbX
 L7F/w8IZSaBQT2Q6Wbh86gwjYKwzsdCyLEarLat9rpH3ksfy4aSUc4dk/GGgvPOdA5qdGVKXP7
 hOL3vB9PH3NJgAAAA
X-Change-ID: 20260408-imx8dxl-sr-som-f141ec343173
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|OSKPR04MB11391:EE_|DB1PEPF00039234:EE_|DB9PR04MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: deb1b17b-9f78-4c79-5bdd-08de959e176c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 scguDOQTHYxc+EFyfAAna+C9b812hnyvvqY2DtJ8NzxDrxdXmkrZ7GSQHF7wmmBeTMiZzCXzdr9k8DK3gtlGkrPYrQi5tIWynF28WWDWFO9JR6rnfM7TvHzpavfOAK6IeTjTDbWo7k3J6LgLjysPESBxEugJYJxt7uE91B1x6VQ5r/+AraBJQp0b75FanKbsm6+1W7xKiG/FPVw39xUB200Ld187fUEIuLSAQxAl7yvnGh3NFg14B2QBiQsA9ZGC/yWXl4TdLlaJO/OcXVSQgMhiZG6Ic1A8Q3w8oUK0qcxl4isGvt6y5KUlOhtwjS9/iAxPt3J4XW4Oa06ujbcY+kj29dAFc4G3urJ3VKFgcEVz6fA4Svs6NzI/kWwKJB4JobMsyQ4y+Y3RV1I2W2gbymyROFaGlvjsVBvV2uDhfy0eoXM5uyafjAU4gr3RIxIK/04y2RHlvhgVFZrVnT5XEoaNnkxlf+t9inRT05D2WFlmA7/uNMUzmT6EByumcWr8v7LOaIq2E4q6l5IZ5SV0RzysJQpVseeSVU5rg3eEOIWOVveeSDHDdMMzYejCpYPuUC8F9HF2ZRB9W/f/0czQTC9+1Lj3moimzLVF3sis6qFZVIQJI1TDnAIW5AokWwKOV4BDFnn4ufQ/JZRuliFW0F11myhGlkEp+jTlhjI1JPVMGXbVpTo+7j7720Wc5DgS9WbeFraoRAyu7KJaUpQz7TQD5e45L0LOClCLu+E4NpjMrnx7UM1LOaHOc9xMNdrl+/FAZ0UASnXewLoKAjx2ZMZ33FH4UMyC6z7to3SET2o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 r/LwYpdxoEMdqJFfJ0AaO1+PPrsUlemwP++63MGUUpw8txD/LlOUwLLNV9VNC63JGDyFmyCEgCzbJxnznU/sWf9ufe6oDLSZTM4z07x8rsapEyO/04RWx/xwfYLJQeDK+vTufLySqZ1ewX7IPJoxEEH59nqATBSFzvg/V17JImccFH2diBK+HYc8XRYYO8UALUGd8o1rurhB6t5BSfrkHyAEIEypOsHsAMFlawdwmQr3o0sWHos5ju6f+nx4YYBOvWFoQ5jmbzoZSLTzxEB6tExasLPh1ZvLM3vkC1M3C9LMZ/oa2I+hE+asTGhAmia92ZAlsGM8xvDrkTk5tT0nDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11391
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 77d4f2a320db48b09f4a8aca6571a790:solidrun,office365_emails,sent,inline:8816a70946a0cdd47e43465ef0b43aca
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd0f1805-e20c-42e5-be93-08de959e108a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|82310400026|376014|35042699022|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7sEqdlDXUFAbaMChU8ZLnyNFaj3SFtv0VTl8KQlif0RJOACEE0z19uj/nkxclfuKLIC81hxuVw0gbL84ui8RJTmGPQ7anfvzaYEigyaKXs8azcCdL6gdUUVEk+PclbXpzizG5rbAonzSvPGCPmj12XHshAfuqUVm1+QfLN4NU7ulqOxNPfkUXGfMb2nMgu/v4Mtr33MksqRxgKWnyHo5nUl3uB/e5eZQKUUNcXXmcZksyB8/L/C8y+OxTD0T+srtQlLAonRGdp2JcxxpmgbzdLGPY0ON8wy99mMbVtZVhiWeopvsxISNJjeqcVHPS6EXqJAIg+SrckGXU+UAMaxtd5aX6KYIqfxLScjrVvpBsVr7xBD8ES1lFVfdXQHfhvT/HU8d9viuZW9QNLcZbny+DWhWQliTrc2BkJj95gVvdxc18WV0bOzxeQSEaFGSVLG01fKyAozqHZ7W/USASO8RSujmHkYx+VjlgtGN4/eocahB/LzoAIC3tiMLCOuHX5FCX6X1DJ68On1JkJXDWwMIBbKFHYohNBSiFbj+8Ezo/XOYYpnBTMEDHk4jKIbz934jW3nD1jglAzZ/8WlFnRd+y52LQmdixgvMhRaBaGeJi9EN4vfVw/x4mPChQqZMt+VSWk6shnJk8xtaFRSHTO1MmBkHYRD2TBI7xVq7RGYDZHypZiJqCJCsIqLoH5hWKoKBae0O2O1Ill2tFbtwPh9cs+/6x3xUHaT005T7IpeVKbtG7rQKk0s7fQ+7/9j/ij7ITPMyrtSQ331ZJc7MNn8ghg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(82310400026)(376014)(35042699022)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	weW6mkwnR0uJanv0oh+P1tNykK7ohgnaq/w6cBGsR83rCMFzgmIlyq+zhua30pdD/8ZSIDe9DTvsJaxP9ASHPYMR/1suvYZdm02gz7Mdv33koVDyDUleZ2TAmxRqXa60JAM9cBI0el+7AvOaEkOH9T73U9zl2ZOkx0RZZOb8JpfWJdYN4Bv0CSiZIOrV56MSrUJi6W/BSJjOWdGjh9h3JW5W28tPjn9rC1pRVxT1zEfiMNTOX9JFV1d2LWRvmhj0/NLqxE+0oxGn84im+wWRmbhPFdNW9LjLM6v3XLqaoDN6aUhmqNElBM6PKUOe2BGm0id9MtP9rUuD9nLxWKAZFIvvbOpOHpl310BM63SBNI99U27pQB7wYlYUU3wQZt73n6ISBq0eeXmscJYOBnHhxWP7VxOZnsTcZgcGGEnlV6eDW9Wqf2HItbAWBkWqA5o3
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:38:56.3103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb1b17b-9f78-4c79-5bdd-08de959e176c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9724

Add bindings and description for SolidRUn i.MX8DXL based SoM and
HummingBoard Telematics.

This patch-set is based on v7.0-rc2, because rc1 was experiencing
deadlocks with imx8qxp clock driver.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (2):
      dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and HummingBoard
      arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../freescale/imx8dxl-hummingboard-telematics.dts  | 536 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 460 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |   1 -
 5 files changed, 1005 insertions(+), 1 deletion(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260408-imx8dxl-sr-som-f141ec343173

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

