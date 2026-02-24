Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021103.outbound.protection.outlook.com [40.107.130.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414B2417DE
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931888; cv=fail; b=QHaIb8jjKDEhWjEgMbOCqF/OoLe0fjdxALDkIOJTkBrof8CFvYkmDR5+S2Qaq1C5N+mkyVO8JZbyPPp1vIJjHIdtJnMg1dNI/JK/hhctR0rXPHUXWcxlk0w0nPZmCcutUnygD4e039sKAXGUvWffwkfyK4gkeouOoXfmabX1QtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931888; c=relaxed/simple;
	bh=lSmavBiF1o96NWamOfYb8CSsa1Sk/eF26ucFWhIavmc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WYOTEm9Gi4rYbt8g/iaVT2gdQ8abPFkC+wY/jj316vaC6usBpDlaZ8ELUOLvtXflo+UnZtOyu4KduXVqzFqVxIokuDdgrb3LNt/1iilb+v9lfk1xDCK6ellzPkNcOHD7urdYDdn7f+3BeEDubTD5H4d3gXSevcLv7G3bY2bg2a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=TYz/Xsg4; arc=fail smtp.client-ip=40.107.130.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="TYz/Xsg4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPaMCPriaXyXejoCMdd0mFjpFnwKLSxJ+g6suYwsNWYpKOhV9ZyDPaPpWtlrJrvxMTzPYR23faW15m6rnjquu3+Sit/NGK37W2YRCTTY4w0mFhdpRxpWb58GRcBBD0JJGDA3yXffyhkpjpUpNsIUpMuGyewwwPJFa1KoFe4enrmiEifFKtgIh48WXkOJ8s6OOwCFqlaAlQjXFGPQFsw/luo8W7Cg3SKsc8j+q9Msiu+XiXNF36PiwsQ8Of3M09+iHxNp9R10mCbEuJSXFvWTTWIUlTNBH1L2/VYXvdIb12d7arDqRrlN4KX00P57c9fdRzlhoHiu+nMkMWVkgYxgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBXeZhdUs6eYFX0yZR26fzF1Tp+CywU7T5fe3RrbnaM=;
 b=hcle28NHa3JzxneAtAr8qwtvpApO9h7snKPMqJmfYFNcYkpU4wVhg0HU973hVrX/+PkjJXf8C7h8vsaBVFEpE+JgG2S5MCd4gxZYNXwK0gtWjEbwJIfNIGhtH8P7VPnusaCnjPDeCODK7Q/oKVUvzqlh3EbVNKxF83ew+cM2ZCb7fRpHrfNCDhUjhn51tG+qjre0RWHoEAkSO9lpizFG2/h1UKl9BT33sOzxHBXiHbwG877xbIdakfThviVuEoijD3WqR/ghEAy4SNXY18YQtpPgM5eaHIjZ7VKYv6+RfKo/E8eb3c6UcHIvtfSIya3cGhKLMOUkBL55xCJiegU1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBXeZhdUs6eYFX0yZR26fzF1Tp+CywU7T5fe3RrbnaM=;
 b=TYz/Xsg4KvG2pIm4IUF5ljOxE0Rhmh34KnB4CP/6SDfrroaOeLm0EHpXY4l0rnVbymtMQTvhzS5bgVjO5felhM2414/HZGfFmeKr1QxYsPWozm/Eysv+DBE6giRbZdB0uV3FdnkWFf+U7IMz/5JnzmsvSp5vQGc+bO4AlJ3ugS8oq5VpAvOVPA/Yu/oiCTsCLZ9qktecu+e3ws9DkdevJ/j4XBbyl00LunWUAWFpN44WSY9B0ybeuVpecoptgdJ1hp2uLMY+K31k/+vJStC0lCJcAT61GyReSDFeZPiNKyVv6Ub6lMgK8gFmylOe4luJeOlyOpl/AvHRyVU4uL1auw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by VI0PR10MB9334.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 11:18:01 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 11:18:01 +0000
Message-ID: <0e1dab92-b4a3-4450-be59-32df5849b5ef@kontron.de>
Date: Tue, 24 Feb 2026 12:16:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <20260122-imx-se-if-v25-3-5c3e3e3b69a8@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260122-imx-se-if-v25-3-5c3e3e3b69a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|VI0PR10MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: efe26d38-ec95-42d0-7a71-08de73965f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmRrSGVLaXI3ZUI0aUNvb1NoQjN1aXJoc0xYVmZ2YmhZRjRxZEFINW5mZVJ1?=
 =?utf-8?B?dlQ0cHhFTHdXdGRxUVpSUGtjSExjSUhVdjFlWVZ1WUo3OTRqN1N1enhIU0V3?=
 =?utf-8?B?TTF0Unk2Rkw0TDM2dDRqVUdMVHNUWFg0QnI5aWowOWE3REY4NXlLN2ZqYjBm?=
 =?utf-8?B?UjZBZHZrYnZDeTNHa3lETVp5SEh5Y0hjWkRJck1jVnU4UkpSRDJpbnZCZXJy?=
 =?utf-8?B?akM2QWg2cmFzcEhiNGlqNnk0dkg5UENXbXd0a2ttdkZIbWt2N3VGZkVNSzFX?=
 =?utf-8?B?MWMwZ1hic0owMGl5ei9tNmlqR2xyZFlLZEE2aUZ2U1BLbHN0K2RDbmh1bHJO?=
 =?utf-8?B?QmhqMlk4TE5TZ1NTSGFjRHJDRlVqQXFicTZrSXd0ekJzWWl2MEVQRitRckZj?=
 =?utf-8?B?K1VQRlhZU2ozM2J6djhITmJqM3pYdzhJRXB1Q0dwT3JicThxZDY2K0ZiRzgx?=
 =?utf-8?B?TWhOOUZlOXBVTGZDRjFCeW4raUFFeXZ5RnBPcVNPUGlBVTZYbmRvUU9MQU95?=
 =?utf-8?B?Ly9zRDlESmdyMGZUQUJROU9WbXB0NkNNcFN0NmtHa3Njb0VRdjc4WUNaUnY5?=
 =?utf-8?B?VkZGNFJzMm9GMVBvTkhlSUx6RGFkdlBUOUNsSFZwQWwrOUZFb0gvT01SNUtF?=
 =?utf-8?B?aDFMQUZiNW9JVlM3VFFBRTFkdUpkNzBuVHpLT2tuTmNCbHhIa2diVG82UWdw?=
 =?utf-8?B?eEVlZWhlLzBpTHpZZjRiWURRL3dsWlE1cVdIWXdXdUgrTmhybDZtMFpRaXZV?=
 =?utf-8?B?aG45SSt5SHE5NGE1SzVYUDBkQ3NpcHVXeFN6ZHhUN3FMUy9wc3R4ZW56WUda?=
 =?utf-8?B?U3p4bWNjcmlrWkUyc2RwNlRqU055N2FKUmMwNmZ6YlFLaUZJWEJlR3draHJ3?=
 =?utf-8?B?by90UHExNGV1ZDY4Ykc2bllPMUlnNVVEVXV4bHdDVXUxWlVMTHo5UmlVMFF6?=
 =?utf-8?B?bDdFZG1mQmJta3ZwTDAzZzUxVVF0NGxVbThTTUZzbStqT3dYaStMSG5XSWdp?=
 =?utf-8?B?dVpEOWpKSnVmMzJueW1NYlcvaWV0UjhuTUN6MVNWVHV3M01WSWZpSVpmUHl3?=
 =?utf-8?B?aUNyVWowZUhRSHdyZm5jbVQrajlGczNKV1NHb1JnUzZQL0NUVUU4YWRQaCtW?=
 =?utf-8?B?bXRtNzNlektJdzVMSW9uaWZxRDZjRzJRTUw0OW5JOEg3L1A0d2RrZ0NnZlg1?=
 =?utf-8?B?R1RTcU9raWZEVDgxSU5KWVAwZWdMUTNmS0NKeUkyNHplYzI0bVAxeUJ1M1lx?=
 =?utf-8?B?R0VNN3VESVl0cjh2SGJzVE1DU0s4UzJtTWx1WXU5aU1vVUtEbzVpZTQvS0hH?=
 =?utf-8?B?M01LMjRZWk9MbnZSSUlDMVVPcEtiOXVlSjJzaGUxREl2U3NpWkEyYjQ3WjAr?=
 =?utf-8?B?WTRydE5mNmlNNVNIVVBpelc2WW9KalhTeHFvcVYwT1JBRE5JczkxdDFUZWVT?=
 =?utf-8?B?V1d5cy9rZXZTOGFQVzJJMHdUcHNrV0trVHlGbmFhV09wL3lkeUg2ZEVCNldk?=
 =?utf-8?B?UGJ4NGY5N1llNzJCSFlwV1Z0Z1RTRjJDTkZwRlB4VEVKOExVOWRzUG9GOHJ2?=
 =?utf-8?B?Z2F0b1hCRk8wNzEzV2l5eVBpbHpkSm9yY0dFWjNEZFlDUm42eWxtZDlYRXhD?=
 =?utf-8?B?RmtqSldlMUQwZUxxM0pGV0xQVHpqWG8xOHVSc2lZYkdGMm9WQVJpeUozNzVK?=
 =?utf-8?B?Q3RQWVIzUnRRMk1BMEI0ZG5oTVRVbld4T2hRQmE4YmhldmpTZDFCdmJZNHg2?=
 =?utf-8?B?d3RlTXBvWTdRQjhKblQwSVczMVNqaU5Ja1ZWampuMXVZOU9NYW9tWi9lVVli?=
 =?utf-8?B?TU1TLzBJWlFOV3o2WWJpcnJ2WlRIaS9JNzFXS1pjcExqaWZrOTRGN1VyNFpq?=
 =?utf-8?B?UmFucUc4ejg2bHVHdld0a2J3QVFRU0xSWTRRemw0M1B6MktFT2EwVENTQkh6?=
 =?utf-8?B?V1RPVG10a3pPZjZiQk5xbnZDZ0h5S2hWMGF3L0w5cTkra01oOVM0MldDSXA1?=
 =?utf-8?B?NnJtQWZtVDJQbDNVWWZ4L2IvcE85dFNBZ1JpMENkbnprd0NPT2dwTHlWbVNP?=
 =?utf-8?B?Vngxd1JabW8reFBveVFseENBZ2xWbWdwOUp3dXpKTzdTL1BSd1pKRmNNS0pI?=
 =?utf-8?Q?FBiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lVV2MralJMZ1ZNOU04SUlKK0IwUThCVDlySXZzVEFxTTU5azljbGNPQXc2?=
 =?utf-8?B?WkFJZEo1UldScVM1R2tUa2l2a3BzVkpia3FKanM4MkJ2S25QRjIrNmQ0ZTlS?=
 =?utf-8?B?Ti9oY0pBT1BCMjN3K2hFZ3R2QmJzZkkxYkxDWGdIZUNYK2tucXpIeWtQRUNz?=
 =?utf-8?B?aWRxUGx0WDZmczNKNzVOK1FlZzYvTk10Q3NKelcrTStvcW9xOSsyQURyQVJ4?=
 =?utf-8?B?QW9ibVJFSGZTRkUwZjZsU21NME83T0ZhYlluWjVFTFF4dHlaSXE2QzJyNHdp?=
 =?utf-8?B?Y0NkOUhtaUhPdWcyNnA1azFoM29mbWxGb29tWXh0eXlsYXlVcW1MK0hZdHNk?=
 =?utf-8?B?V1pLSVBHR2ZyeTZKTFFIelcrcHlESFBSNnludDM3NERJbFlNWCtzRkJwcjBT?=
 =?utf-8?B?SkR4cUZKQ2w1QXUyMEgzRDZnc09maFRnNVF0TmtTT1NFNFlUVjYwUUJaU3lH?=
 =?utf-8?B?WWhoajZOU1MzNVFyRjdnams0blJCTGxCeXFEeDNmN1FJWEhpZ3RFWDA5b1RS?=
 =?utf-8?B?cjAwdE91Q0xhMFRTRm5jeWxHS2dodlZqWlZCcXY5TnZHdGQwbWpJTEVhNjV0?=
 =?utf-8?B?d20rWUlhYS9POTlkbXNXeVdEbEZRQjlCd09NRitEVWlQSy9xK1pscU5mNlEv?=
 =?utf-8?B?KzZSNDhZMkEyOVZzL1pPdHNmTnB2TndGWTVHNDJQcmtTY0NJUWxoSldSdXht?=
 =?utf-8?B?Y3E3WjVOUitZa3R2T3BhZWVIQzE5VG0rRlZ3VUZSNExuempxUC9HS0ZYcmN0?=
 =?utf-8?B?aDV4Vnh0VjBFZFNNRVVXbWtOaWhxK25xVW9MeVcyTDg4b2IydE5pSzNhdEdo?=
 =?utf-8?B?c3VLdWc0MklwL0psV2NzMXVFTkR2THlGdEFnNTBFbHFscytFdW9nQmtUQy9o?=
 =?utf-8?B?RkdMZ3MvL2laVG9MQWhRQlJGek5Yb0NHOFFmcDFKNnRzYm5tbDl6TFd1dUhD?=
 =?utf-8?B?WUJIZzlZbVc2cmlaTzBUQ2o5QjBCR2IzdmNnQ2JlNFZHSUNoNWVWdDREZlIy?=
 =?utf-8?B?Vkx6Q21GNnVneGRReWJhL0s0SEhYRzhlRldIaG51K1dQN3VSTTZMSlc5ZlBK?=
 =?utf-8?B?cHMyNnBTcW1tNXF4RE9TbjZlcU9udHp1ZGJDYXdMWG9CSFR5aUZod09UTVJR?=
 =?utf-8?B?NUpNTW1vK1MvUTBNbVdsUUxkWmY3dCtHcVh2dVZQd25qQUE1NVFVcDNoVkdt?=
 =?utf-8?B?eDhyUWY4dTRkZlV5aGkvS2k5NlE3bFhGbnJ2dmltTG5JV0QrNzVHWlcyUW82?=
 =?utf-8?B?eFUzRVEyL1kvUVN1ZXM5QjdpendRMVVYeHY2bzdUU210bmZ2RTVwL29ta1Ri?=
 =?utf-8?B?WU10ZjdRTWx1Wk5VUk5LRkJSY0NnQ1NlSkFQanh2aVRFWEw0aUxaOXlUckoz?=
 =?utf-8?B?eGphVFRkcCtoZk5QdnBWU25xNzBxR2xDUk1tZjlXcjgvak85MUlXU090Y2RK?=
 =?utf-8?B?bUYzVEdERnAweWJTOFR0MjJYdXkzRXIybWhLbGlSQlZrMmdZSVN2ZXFWOVU4?=
 =?utf-8?B?bjF2b1FIcmhoVm9CVU1GQ0kyU0NVQjQ1OGZkQ2NXZ2RaVy8vcURZOTVGU2R6?=
 =?utf-8?B?eFBLVnpjMU82U3VWbmhOaC9JNXM0dGVVK3RERm1JRU9xSFMxVkRLREdKZFdy?=
 =?utf-8?B?QnFwRDdSMzBFZVh6aWE4Mkt2cmRZUVRwQkIzMVpBdzJBS1NVdGZMZDNyU2Yz?=
 =?utf-8?B?L2VLcXJEa2tnNFJ3SHBFSWxqRk1wQ1J3bU0rYklvNjJPM29NVHNIY1NTK29B?=
 =?utf-8?B?WUxOMDRDT0ZsWVByK3BPVnM1alpHck85dDY2T1N5RzNDSW1uUUErZmxDdGtY?=
 =?utf-8?B?Y0ZiWjJiS1R0b0xBeG9jcEljSHdjcTl1Qkt3UXovUTZ4STVnK1FmY1lnRGhQ?=
 =?utf-8?B?UGhYaXBLeDZxK1JiUzJGSUlJUHdNZnBTS1hEUklzVTltTlZCcXlPejVCMXBF?=
 =?utf-8?B?dGkvNERLcERhRGgwc3J3WlBNdjhpekRZN0ZlTnlsdENBcUtNeC9sQXRHTEpD?=
 =?utf-8?B?eWZGME0yWDJaWjJ6WkNuV1Z0cWRmM1pJdjdFbWtqVzIwV1lvbmNzSWhpK3Fq?=
 =?utf-8?B?a1BFRll0TktJTnBFR05uM3k1Vm14MlVlYzNoVjIxL3pDemhtMmt5RktuQU9L?=
 =?utf-8?B?S3cvSGlIekpaU0NhTnJnemVPakwzRU5HUXlrb0lpZmY0dWxBMldJeHFqbVV6?=
 =?utf-8?B?eDdNQWVOeE9TQXk5aG9GQS9jaE1FdWc2UXpqbEIxejBTK1pvRDFTSUhueFpZ?=
 =?utf-8?B?TWRhbUtiQk9rWFI3UCtwK1p1MTZOYWd6Wkw1UTA0cUF4d2h3eUFFSmRqLzBK?=
 =?utf-8?B?enhkaFBjVUJkTGo4VEFRSDNxeTdCRUgva1VpdUF4SmJHK0luMjNkeU9WN09o?=
 =?utf-8?Q?CuQxRDRkQNlWsj+s=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: efe26d38-ec95-42d0-7a71-08de73965f42
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:18:01.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jib84hFayle+hGeKQAYG1AA+DVt4AXbZMUH4C5XNMfG0RYjqN3TkprBkEo69/5J7xYMX7++8oVg2kewKWcghrlxevAYogi+PFNOaE73/KOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9334

On 22.01.26 12:49, Pankaj Gupta wrote:
> Add MU-based communication interface for secure enclave.
> 
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
> 
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
> 
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>          managed by NXP's secure-enclave.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
