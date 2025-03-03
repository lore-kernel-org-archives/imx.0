Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012069.outbound.protection.outlook.com [52.101.71.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000632135A4
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010185; cv=fail; b=IPtetOWW3Pjuqa86/tgLvsumwwZS5A1cJB6WryR/JEvvK9cmsBiGBujo9n2WQ02GifYqoSu7gGyYgBs0j8Xu2glYr41+ZSEOqJ5Br08tW406wm/O+q5N+xl2j4nvdOZ6FrojOew5A2AHL+Px8G0FRCPRMLmpjGrmRVGiRFHt2D8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010185; c=relaxed/simple;
	bh=hXBpSrxBtXL/gsN5Ku5KwxLwSr8bCoov3kP3XF3zsyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QhT67ALJd8Gv+hmqCAUgChxPXgd7AhMnzSaLiJaxlXvYp54lSKvNo5266usm3zYjf/Rik5fW9EnSd3PpY1TfYmx5xFctLcgrZwGLQWsEs73jLzMGPee2AyxjvgciMq/22h0vfU5ODPBn24Q3jeawR8c4Ho281jWkA9Fgny0GNq8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GSTmujm5; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GSTmujm5; arc=fail smtp.client-ip=52.101.71.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GSTmujm5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GSTmujm5"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zPVYXAwA9Y6lRck3QCSviVt926l+RSZpDarE4+p/mSKS5xHss1BXGUfSmnEv6C+Xibw6u7F3zLyJrUz7T+z5zlhdMGmXPT5xy9wv/Gz0xhJepgaFxZAs2Ab6sBP/IJheL2mweyDhiMLRRCmZ6OvfT8J+xnNhdmtxygtXlCgXVvYu5rHlzA9jv46Ueo/Okwn/AJ8FOqxEdKjwcVynd4UOO62dR0Zccv6AGPlkdkapM5HkFDyFs9c3cs8MdZwyoJH2XyaEeAvlDS4YWBao3DArWoEZHHIa6cSnKG0NlakN4VFvtVwvyeEKIawXqcBb5SAo7y6iOQyBSqc29YI1CJdaSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=j2tPkSBFL6QBgyWfAVrIPfvKM35pGdRgXWwObJWVS/PIbJHrE8yy2bnkPH71ocIM9NFvX6uxzJ9ZkWg0gnNyIHJ4PFUuryoTYkKadKvLyQI+r2shNHDLnc9RTf2oegf3Y42NAAYtCsNHc8mUXsMqbCkaBZmN5hNZvckVCqepEE+ZcuBjlsFyEdbrSzpruVlfNQvRP7cHeISAbo1EAdoM1wzFVkpOGe8/QdzV6CyLvrOXJmbNn6ZX6xW16PwA9+3NHezZqKfUGUiR/+wcAf+Wpy0fsWNPa8QRprQvho2aeNUnFsXkrrmRWE2sd6QHrtfaLGKpxCr4lRpBvuw3h1Ow/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=GSTmujm5oxmIixmsPSr4mkroJHeYM/Mi1xPUZYKcPd6fDVzc3/QImKc88vwrlmCoDFKs5YnPzfkyJcXOktKlvSFo75lK2z5JeSZu6D5X4o76kmRo6kKRmLunD5XbNISry2kR0QD6KAh9kg/zrMDL22d7Fn4uLyCwNjoNT4iOJKQ=
Received: from PR3P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::29)
 by AS1PR08MB7427.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 13:56:12 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:102:57:cafe::7f) by PR3P250CA0024.outlook.office365.com
 (2603:10a6:102:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.27 via Frontend Transport; Mon,
 3 Mar 2025 13:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 3 Mar 2025 13:56:11 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Mon, 03 Mar 2025 13:56:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 675ab306485041da
X-TessianGatewayMetadata: NEF7rxruAlv9aKJeRaEwzT328NOGKWKi/lVnP0KXPCa1hnRkkF9a+k6ZgUNL5I1B50aouCHPPlq9ADCicwJkOwCztA5bc/MkfCsmmOO3CxCGg31MJaBxAh6yiJmDxK+suW7NDF6rVNDvKmfmx64IMn/3UYjmPjkcnuswhpGwb14=
X-CR-MTA-TID: 64aa7808
Received: from L9eab541c29d8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A74E424F-E043-46D4-A728-B38B0FC420EF.1;
	Mon, 03 Mar 2025 13:55:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9eab541c29d8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Mar 2025 13:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCdYl7fYglrUiL7p5VKYcMFx1sbbej2eCwOjn49LCOydlDpHzGHJHt/Vxj9xTJ390++OWciLR9Q1y47mRTIvWaWNEyQgPTaPGEeb3Mg6NvA+53TIlycAAdYMKoxlkpr8DIG3JsXHhM7LJVOLpJsdrcF/S64xiildkxEyG9PNPdcqcUVOmgxwyvYMy92jw0/YlAqiUfKISPj9l4lFiNJ6XVmXuUwBtHnl65wPiF7HMqvUH6SVTbZTNZaBnvoJ29hyVB7rBm8RvTu8GwQvnAnFszZGzID98KCZLwQGV7yKI9iUtL253oh8tEVUZgou8qF2SSSmir0koYu4XM4wX/wW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=cQ2/0S3Ph3uiMkqSZe92KeOW4yYBmndTZn7K/21DdAP9kcC6KeIUHIQ5Ly9mSg9X6CLoH5KXKE6U2008sGD4kVyRnYQrqXkcsTfjfUZM5iL3hq1cqKFL7CGIktD33/lrZiAmXyxEokI+DZej9YxxUlXmy1nK6+4cfw2WgxPoUyPCr/joJoR1WkHVCbCCKfNJk2gK6phNKUls1t6gUz/s913o8ZKBSzuyqT+N3JBUBs49yUMRXSam7/NunVCiQiciWDpFO3K+QctNG7CEp/Vj9bfM4HTG6v9xBs4D/S2rGj+GgRdVLWSa0XFOxy5bEmu7trFsoeeRbB49jWpmxywzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pOb+PVv6DtzZuQq9+IfXDRC9avKT7RKZXbPt4VkKOA=;
 b=GSTmujm5oxmIixmsPSr4mkroJHeYM/Mi1xPUZYKcPd6fDVzc3/QImKc88vwrlmCoDFKs5YnPzfkyJcXOktKlvSFo75lK2z5JeSZu6D5X4o76kmRo6kKRmLunD5XbNISry2kR0QD6KAh9kg/zrMDL22d7Fn4uLyCwNjoNT4iOJKQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 3 Mar
 2025 13:55:51 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 13:55:51 +0000
Message-ID: <94f65cda-02bb-4165-ae6e-be19b7cee55f@arm.com>
Date: Mon, 3 Mar 2025 13:55:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
 <887a6d8d-9eab-44ed-9fd0-9197598231f4@arm.com>
 <980075f9-5ad2-430e-b139-7e9477bf415c@denx.de>
Content-Language: en-GB
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <980075f9-5ad2-430e-b139-7e9477bf415c@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0479.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::20) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS4PR08MB7925:EE_|VE1PR08MB5758:EE_|AMS1EPF00000040:EE_|AS1PR08MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: abf32239-6ee3-41f0-adc2-08dd5a5b283d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?a1RzMGIzRDdwQjhGZlVYSkQvSFh6bU9QMGthdnZJbHE5ODF3cVkxbG9Ka0Z4?=
 =?utf-8?B?d0FYVGNHbGh6SnpOQWYwNHorV2J2UlNEZU16NEh4TFdRQzRDaDNxZFRmeUQz?=
 =?utf-8?B?WVJCVnd1MG5OeW16OVBaNEZwdEFHVi9kYWlMRUJ2YzBoTlFrTUdISFRXcnhT?=
 =?utf-8?B?VVR1RUI1SzAwbGUwdkt0RmwrUkJEVDRQWS9VbkloaWhUaHV1SDVscmYwK0Uy?=
 =?utf-8?B?Uk9ESUI5NEVMSHNjTnNSLzZFWW81TElVU21GZEZWdEErRnVKd2laUyszM3hh?=
 =?utf-8?B?bnJxcWExdjBaVlBROTZtVGVTWXRpRDNuWkVaYldhTG9FdHo3N2hSZW9jWXlh?=
 =?utf-8?B?Y0dUeU1kWG1IUlNkTCtPMldGcFVXemRNaU5EVCtDUS8yVEo4MjJlN1hEV2dW?=
 =?utf-8?B?NEtGVmppVXpNdzRTRysrMTJxdUhlYXVYaXdCOTljZW9vWE8vZ3dYM2daKzdI?=
 =?utf-8?B?cFR5eEExZ3h1NU0vU3FpSGxLWDBJM2ZsN2tqMTZlY24zMThvNkxYbUNFWEZs?=
 =?utf-8?B?cHhYR1QzdkJpOVFKaFdkb0FNeG1NUGgwYTBnQ2kydDR2UFhZSE9iWkRjRE5M?=
 =?utf-8?B?V1dpeTEyc1RJLzlqY2c2UWFuZWd5WDhvdERXRkR6aUM5NGpJVVhncGU4OGhi?=
 =?utf-8?B?SW1GN1RTN1dzTm5tcUg2SnpEN3dzd3NyWFAydlRydXJBVlhlN29yYXJjeFJE?=
 =?utf-8?B?M3ErKzVvTk1EMWNGc0tETFhJM1UxckdmNytVZ2IycXV1OU5LZXBWcDVMYW5E?=
 =?utf-8?B?Y2VXc0hKQVRIdklBbHlsYnZqQ3ZiaTNZQ1FTU3JwWWEwSDVoK2FVNjdzaGNv?=
 =?utf-8?B?cGVOcmJ1bDFTMVlYYURVQ0kxZzJVenR0MzZCWEFMOTJWSWNJek9wSThoRTFO?=
 =?utf-8?B?Q2tROVVOcUpDZUFhNXhaamtHb0FUR0g1L2ZEVHlNVW14Unc5dUIrdHI2VW8v?=
 =?utf-8?B?cmtiVWJPeXcxSzMvS3BYUTRNcFhlYUZQZzhiR3JnMExEeVh0VmdrM1VWRE1M?=
 =?utf-8?B?cktQc1ByUEI3Qlp5aVM2K2RKQVpNaHFkeHRhL3gvRXdpRUR0TzRyZ1VrRldw?=
 =?utf-8?B?TW9NamZoekdIOTR4V1cwblF4REs4SU5uRWc3c3NtcDNpMzF6eFRsdGFiSXNO?=
 =?utf-8?B?d1oxSFFLMmlvS0xwVXFIUnJaQUphZnl6SDJudHpvM1dJTTBBTU9nWi9QTDBu?=
 =?utf-8?B?WnN6TGxGc1hiNVJVaEdDY3EzTHNNT1FIZWhvYXFON2syZ25qTnczdjFzK0xn?=
 =?utf-8?B?RHF6Qkt5T3lOSnJ6dDNnNzJkQ1pVcmdtMmRMR1ZjcUpWY01ZZGRTbURNenhs?=
 =?utf-8?B?eGxuS0pzbDdKZGNDeDZKUjFJWGd5eE9yRlBtUWJSdGtQb01MWVhVZFhKeGx6?=
 =?utf-8?B?R2EweGNVTlNqY3E3Z1NvcndPYm9EVnl4S2ZaalIyNU9ZZXI1L0xOZTRMVTE5?=
 =?utf-8?B?aTdBWmtuMlg0NVZjb0piVXMyTllLem1DL2ZuVWMyQmt4MGZnUUxsQ0RFcTE0?=
 =?utf-8?B?YUV6Z3p6T0J6RjhDbTVUZklYUXBUT0VqM1FodWVQUG9ySTlLRWd0dmcrUGJS?=
 =?utf-8?B?c0lXS1U3THpsckw2YXg1ZDlzYWhYSjVaTlNHNkM4UXMyeTN3a2hiNVh4S3Vr?=
 =?utf-8?B?NlRNRXFIWXcyVU1wZnBnODhKSmlEeithYnJwM3ZXWmp1cGlrRHdhVlBrMUx6?=
 =?utf-8?B?aEcxKzNlcDdOSVZHTktudEJTVVkvNm4zY2t5Y1ozQU02Ly90aUJXOTFNK1NS?=
 =?utf-8?B?YWROTFlMNWpJOTlqRFJqVWRESUlxSVlnK2ZjZ0V6d05nNmtZMXVmNDFQQ2tq?=
 =?utf-8?B?eHZmNDV0NCtoWnZxTkpPM2xTcEs3eHdoYUxzVkJuTmRaYnFoVEFGb1RmTVlE?=
 =?utf-8?Q?IuiHDYTlyjBi/?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98136230-b4a5-41c2-0319-08dd5a5b1bfc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW1VaThwMTlMYmJMVTlFWmFaRTJkb1ppRElTSXcyUk1MK1pZOHlaU1J3VlJa?=
 =?utf-8?B?TnQvNDhDNTBnNG9EV1hTc01Cd1lUd1A0ck80Y203L04veFFOUlFKRFY4U1Ba?=
 =?utf-8?B?clR4dFpSOHl3Sko2b2krTllRSDQ2R2dvVFpMVVlrLzRyYlE1bzg1cnR3TC9M?=
 =?utf-8?B?SkxaRlFIZWR1Tlp0dWFnYnBWVkdSanYrREo1eFpwRHdKbTMyaEhSdkpOczJU?=
 =?utf-8?B?d2QvZnRYT2pYUFJkWnlYVHdGSml2RXU5WEtyNHl6azJZSTlpTXY2WnJQamo5?=
 =?utf-8?B?Z3B2Ri9UM1UzZnE5OW9pY3pBekk2MjkvQjR4czFjSkovRk50cGszWjNlL0NZ?=
 =?utf-8?B?dXhUWXVLMmZuWkM1WEZjaUt2Vk5tTUJ1NjgrbUdaeWtJelBURUZsNUdEM0ZS?=
 =?utf-8?B?TU5lWmc3eWVLSFZhNVl2QkFNemxWdzY0Z2FaNWpHVTdhZlQ5R004bGtqMGY4?=
 =?utf-8?B?dFNHa0FBWlBBV2pyYmh3MXZOaTZYUzQvbitCcy9ETjUrRStXekh0SFpKRmcy?=
 =?utf-8?B?QktNdkdVQjJELzVKdUhMSm94NUJwcE5KblVHM0tlOG93Yyt3QkRIS3hpdXN4?=
 =?utf-8?B?UWVYdVNHckEzQ3pyMDNpV3kzME0ydnhmSXBsQitKMFNMdDJVU1ZlUWZCTEdy?=
 =?utf-8?B?VUtVWU1wOWxNdTFJYTJvV29yNllIbzlWM0ltV2VYSUZGd0pRQXVHZkpPQncv?=
 =?utf-8?B?aEduOXZhaFhJNHFQaEh5T01CRGFiTzdVMXh2dW8yclZrVW95ZXBVY0lySHc4?=
 =?utf-8?B?VXdSbVJaMTBrR09NRE9KOWFrYmk0Zm5qa3Q1dVQ2SzhGejJPK1o1blI2dlgv?=
 =?utf-8?B?SnRGMktuYzFGeEJuQWJWRDRQSzZJamQ5eWVrSDdHUmVnQVhxTHphdEJ5MXZq?=
 =?utf-8?B?RUZaYkF6a3Z1ZnR1bEtFdkJSaDJJWE02YVg5QzFENW52NkxERjUzUjhzd0dO?=
 =?utf-8?B?V2hmdzlUdVhFZndTdDV4ZVlIMFgyM29tU1c1OXp5ZWxqY0FiV1JXKzRvZ3lI?=
 =?utf-8?B?cjhSQ2xHMTZxN200VzYxRkY1NnJSMnNTRHh6L0ZCRk5kSkdwWXNrMFBwYXk0?=
 =?utf-8?B?Z29nMzd6aTBOY25pK0tqZEd0M2pkcVpGeTUrRG9wR0hOQTRZMHgzVWZ0M1RW?=
 =?utf-8?B?M3JqU0RtQndxV3FHa1RZaks3TzNYNG9vYW9YMk04d3pQRUdVZWFoMzNDZ3Ax?=
 =?utf-8?B?d1FJZGhSZjBldElGeVJtL2lhTEMzSWg2M2lRaUs4K1IzRm40bXI0MVMwTFVC?=
 =?utf-8?B?aEdkWHhEQkQ5UnpVeVRZNm0waGZQbjVYbVVXT1cvSHREOVRuKzduU1c1L1E0?=
 =?utf-8?B?cWsvY3hOWmlpeXM3U1M4ZGtRYjlqU2lhYy9HdklWdzVFbUxMV1lWWUx4eVRp?=
 =?utf-8?B?Tk1HanRpUFJyMmwrQmVrcERXRTdoRWJKdzFwNkVlZ0Q1Tms4dUZvSk9uRGpJ?=
 =?utf-8?B?NXhSTVlaTTNDdHdWUTEyZWxtNXRwNWlmRXBJdUhDdEFGOWorRUFnSzVxbXU2?=
 =?utf-8?B?OUFCRkdMRUd4Q25Vcm05eXVZY3NtUTRrd0tJaCtZQlBYMzFySGFPZ0YyMkxB?=
 =?utf-8?B?WjRiSWtvK24rT2ZmSXlDUW9meEh4R2VvWDh6V0txbXAwVnA5ZjhkY1RFbU9E?=
 =?utf-8?B?SFZ5K0VjZmI1Tm9DUHhkd1JyRldueHU1WDgzemZQZFFGckRJQmRvL1N1UFhq?=
 =?utf-8?B?ZjR5NW96Ujl4QTRKRHhnOUNzMmtHQ253S1RsZXh1WEtKeTVrRzBxVC9aNXJV?=
 =?utf-8?B?dG1jNmkzK0IxUUtsYkVFUEhXM3NPcEE3WkYzWnIvc3dESGZ4Y0w5a1N1MEJj?=
 =?utf-8?B?Z1VNUjd2bVRJMDlGMG82bTNvZWdHS3orZ1diUkZacitwU3ZjVGRCN3luS2hV?=
 =?utf-8?B?MHZTWXc1a0JCcGRKOS9oMXVSbzYrSkZrVHFXN09LQ3dFWUdUaU5CUHJLdC8w?=
 =?utf-8?B?VjhPT2lxYUFHQm9pRGVmendBbWRMWTNaUDNWWlRnWHBIZGQ4V2lOblRycnY1?=
 =?utf-8?Q?int+2b2H5UKho+VXSckjgw241WJXDg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 13:56:11.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf32239-6ee3-41f0-adc2-08dd5a5b283d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7427

Hi Marek,

On 28/02/2025 17:26, Marek Vasut wrote:
> On 2/28/25 12:23 PM, Florent Tomasin wrote:
> 
> Hi,
> 
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/
>>>> drm/panthor/panthor_drv.c
>>>> index 06fe46e320738..2504a456d45c4 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>>>   ATTRIBUTE_GROUPS(panthor);
>>>>     static const struct of_device_id dt_match[] = {
>>>> +    { .compatible = "fsl,imx95-mali" },    /* G310 */
>> No sure the comment about G310 is needed.
>>
>>>>       { .compatible = "rockchip,rk3588-mali" },
>>>>       { .compatible = "arm,mali-valhall-csf" },
>>>>       {}
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/
>>>> drm/panthor/panthor_gpu.c
>>>> index 0f07ef7d9aea7..2371ab8e50627 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>>>> @@ -67,6 +67,7 @@ struct panthor_model {
>>>>   }
>>>>     static const struct panthor_model gpu_models[] = {
>>>> +    GPU_MODEL(g310, 0, 0),    /* NXP i.MX95 */
>> We can remove the comment about the SoC. This GPU model could be found
>> in other vendor platforms.
> 
> Maybe it is a good idea to keep track of which GPU is in which SoC at
> least this way ?

I am worried the list gets bigger and bigger.
Maybe a comment in the DTB binding would be me more appropriate and
easier to search?

>>> Are you sure about 0, 0? With this I get
>>>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
>>>
>>> Using GPU_MODEL(g310, 10, 4) I get:
>>>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
>>
>> I'd agree it should be GPU_MODEL(g310, 10, 4). Unless the GPU
>> version has been changed by the vendor?
> With the fix suggested by Alexander, I get the following output on boot,
> so I think 10/4 is OK ?
> 
> panthor 4d900000.gpu: [drm] clock rate = 1000000000
> panthor 4d900000.gpu: EM: created perf domain
> panthor 4d900000.gpu: [drm] mali-g310 id 0xac74 major 0x0 minor 0x0
> status 0x1
> panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1
> MMU:0x2830 AS:0xff
> panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1
> tiler_present=0x1
> panthor 4d900000.gpu: [drm] Firmware protected mode entry not be
> supported, ignoring
> panthor 4d900000.gpu: [drm] Firmware git sha:
> 8e5cfcfec20cc8aff8509d37e72babc935d34a3b
> panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0
> Instrumentation features 0x71
> [drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0

It looks about right

Regards,
Florent

