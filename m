Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9887207DFF
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698368; cv=fail; b=Ipn7QlM+5QL7JXkEAWfgGVojuArUoDEjvA3mhogHUA08r5yurtF/f6bpn3/SKJx0UPopR8l8IcEyXyHx5LNNUIXSVaJTyYWtAN5sQK09pJlMaUIL54wxgda56sMhqILxqQTmWa0v9xB2luWTfk9RJiZ70SRewC0MAMMaVVcLFBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698368; c=relaxed/simple;
	bh=5d5g+J68C3qmw2zdQWcZpWTBXlazCviwM7+Z4rF1DO4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CYYygA1E26m3b3mbLnwdkgAoNyBas3/WVjxHHc1VrACbgFIarYSyiXyPT0P1gZ6LECT0qTiF+/IzTEKADOf4ZsWwcwR8m6hxwAL9pAfRFVlG2OaoPCkvX5aSXoC7IrXMPHzH25hTU47polaN1AQbN/8KFwjveIJ0ijCP3u5jmP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dQhdsDi7; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dQhdsDi7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgB6bgji92cpUeQGZIPk2cq/tFCN7OvSfxZkL0O4VNleQ+U4lbalQUs0Bh/SZqpr3/vK6vXl4o+oUlrxQlVD4TetB85+K8BX537xEG/T+EWkhPIF1OwbVatQ5sbtOCyb9NC84+fio8+TO1GOSLH8EGYTvUUe7e9yXd+y23MG7EBWFEZvUXnpylz3FHm7zt6q3tSyCDk8u+KhE0zoRcKb22sgtxZw6yNWzqOFELR8fG7oYgDNk2pbDyA5yCBQT0lwy8fDaYTLJ1R0CazJ3AxSZXI8f/E84PW1a3+e5lvFD6Sku02jLp3U8/WTD5WU6iIe4HObQHRoCDyQ6E9tsBo5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf/9rGHENxjT5ACZhjcMUIW0LdrLcyaqsAvGTatcyLk=;
 b=DM7Z70AnC5/dsyCQoZy6vemWv8hrJ4M946/xO1axKnDbJBrUTp7giJnLs4YsLmehlCzlOWn1bNLX7mtUC1rrBynI4d/b7JFsKKLuqAbHHOMLFnI/X1AzWgbMorLT+WLFC0K+MrWN1v6NhH+038/q6cn5i1du4hfM7KqmFrxGDpOui8i2Yy3Mv+Uh8OUfeBMOqLNQyAZZgG+DelUOz8VUkAHLlRLJ83V1MtjN1nqjnhLpRMii94S4RyFeoem0MkWoUjSPP+BS6em+HfWofXeruQr05QjBLLZ1cqLxSCPxTjkq2Ugk8+Wm7SeOGCRvmvqmtRGnL0djtjYxwOcj42Mw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf/9rGHENxjT5ACZhjcMUIW0LdrLcyaqsAvGTatcyLk=;
 b=dQhdsDi7LW5IJody8t9DSdkcbNXwbJk1D4NTFnLBo5iPFbA9IJyoHKEpEGulimMW0Mg/D4jbTa2GkVw465R0QMHOG1Snp7095kSt5zAf8QRkDe3xkZLYYtvDAyengKDF8z7trWj4ZlviQz2n+CDjW/dBaHU3v8CfQaxBkgTy6FTVYmYCyVMP6K3LM1lO7aHy1pWtPl0adZM9ohatmsmqIzWlW5htrLT0APZiJSCWZkBNB91O2UrPf69fS1D0p1xldIXjo9+rip1vVwgnq28r4vgeAb9oSsrZMbX4cnGZk6Xh1iDbjVxn9E0sAoyaxA4kfV/kKRbQ7z3kZ3j+M4mz8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:39:23 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:39:23 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 0/4] add I2C DTS support for S32G2/S32G3 SoCs
Date: Fri, 20 Dec 2024 14:39:12 +0200
Message-ID: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::31) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bec7dc3-ba0a-4efd-2a32-08dd20f354c3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUc2aDVTOGFFMkZ2SU5yTVo4THRIeTgrUXJBZ1BybnhDaHFXeFIzcjJiSnpP?=
 =?utf-8?B?akxpY2I4ZzRrNW9zR00zZE1BdU5uQUExZTFEU0xPaThLSGc2b3c5ampQcHBq?=
 =?utf-8?B?REhiSWROUkljTXUwazQwODN0U3FOVlAyMWw2bUpBcEthTzZ4bmh3MmF2S29U?=
 =?utf-8?B?TDN1aTdKbS9tZWxsSVdEcEhuc2hLWGpKSm4rQkVNY0ZyeWdtVG4ydjIzZ1Vl?=
 =?utf-8?B?VE5ZRXFXWG5oYmUyMW45TmNKTGpuUDlKTVloZTRLazU3RUlhaXFnSnpGSjNm?=
 =?utf-8?B?QmtKVmlZMEdtK2lwTFloT3Nib295R0orYm5vTlZBNGh0amdJbGo3NW9veDFs?=
 =?utf-8?B?bXhwM0VrVDdWUEdoQzNIaVd6ak5WMGVRNVB6OHpwdWI3eU96VUxqZmZ0aTVD?=
 =?utf-8?B?VXJHOEE3U0RNaTBsZlpwTXkvZ00wSzhYVFB4Lzc0aWdTOUFWTytaT0tZeFlN?=
 =?utf-8?B?RVBqb2EzSEtMM3dOYitVNVpVNFBiT3JDMXNVODBiaENvZUNtZ2JxVy9HUTlZ?=
 =?utf-8?B?YmF5bkFDN3dYM3hPU1FnbXRBdHNnTE44WUJ6TUFJUWl1b2VRa3Z6U2VuMThZ?=
 =?utf-8?B?MVkwUHlKZUVwRVdsV2NTcnErdG9WdDM4UHkxMSsrOGtIZm1NZGd2SURUa2lh?=
 =?utf-8?B?N0orZWJFN0RPODRTSzFsaSs2U3llZ0RzTDQ3OW5yaWVNaXYxckRYSTgxd0xk?=
 =?utf-8?B?emJEcFlxRlN0Rlc3TUMwTXlwQnBENEUyQlMxYjZqWWR2STNxMmpPWGNWWURq?=
 =?utf-8?B?V0xLTSttTzd0cy8rbnlvYmxBdzQzay9vaWJod0pSTmhPNXFuMFk2ZG9ZTlh1?=
 =?utf-8?B?bDNBRWNnakY4NGNDcWlWQU84TFpWOHpkekpQaXllRXUxc1VvYTFkS0ZhV0s0?=
 =?utf-8?B?UzhBNytSRzR1bG9CV1JvRHRLK2NLUktWU2x6dDdVK0JuYlNsV2ZXNFJ4dHN3?=
 =?utf-8?B?dGpxS3Ayamt3U2pJdGFWSldsUVhVa2ZrV1RtbCtNbDd6aVp2bWlSUzFnMG9t?=
 =?utf-8?B?SzhKb0l1T3pqNjlTL3IydUwvK2hzeWs3QlFoM2tZdmdRdjZTd0pxcGduQUhl?=
 =?utf-8?B?NWMzSHB2aHVWVlQ3Qk93Zkh2bzVMeDdTcmlKcmZ4WjNvbUtkeFlsOTlDc2pF?=
 =?utf-8?B?aEZXZ0hCSTlEZEJyeGZYQ1hpWFpYVUJPRWVKV1QwTGZjNHVjRlVmK1B6SkpV?=
 =?utf-8?B?SGVSTkN2TDN0UWNPOE9pajBWbTgzLzdtV0ljQ1VNYmdQYVFNK3VMeCtSSTIw?=
 =?utf-8?B?TVdGa09IK0ltbFdvN092OG5pbnNnM205R3cydnpGUXZBME5VczZDb1RSREc2?=
 =?utf-8?B?VUJCRkUrNzZPSmVwUGRvTmpnc01Kck1BSFVxejlNVmluRERHZE9CS09RM2Vl?=
 =?utf-8?B?TDFPZnc3SVAydjVuRW5LY2NoUHkwc3lyMStwRmRVZUdXMk42OGUzWnR1M3ky?=
 =?utf-8?B?NHRnMUp5YXpOYm9KQXlyaWF3K1M0SEl4ZzJaRHZPd1U5enBubTN2bnJsZ2N4?=
 =?utf-8?B?RS9aVzdhVE1PRmxFckV1SnljWm1lcTlHQ1FvdEN0ZUYxdGROb1M0czZ3cSt2?=
 =?utf-8?B?QU1Lc214Vm5wd2JoOXFKVmJxeFAweVhBZzl2VGp4aFFselNQUUxKMXdQNVVD?=
 =?utf-8?B?bVI1bFhZblh2Z2pnVkVlVFNqTHVjTUFQTWw3azJPQ2xlSVV5VDd6N3MzVnVw?=
 =?utf-8?B?VTFnYm5WKzdqbUN5N3NpVkx0VVlWd3l2OHpjOEtoSm5ZMjBhNGhNNldpTWtK?=
 =?utf-8?B?bUpJVFdjRnp6OXV0K2F1dm41T0MyZHE0eWtTN29VUWMzaldtQmhDSHdTR3pS?=
 =?utf-8?B?bmJUMjhEbDdPNUtEM3V5dGtWTWY3ZUppeEtxL2owcHlITitaK0tJT3Z0Qkg2?=
 =?utf-8?Q?sbMOHfTqGc+bs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFBjNEFRZitIcFdPUXRJT1pFdlp1NmtpaVVJb25sZ2ZtOXZ2ZU4wTUk5TUxL?=
 =?utf-8?B?cHFnc010NGpNVE5aR0NqaUF6bm9LT29GaUxSVkFLN0FTcDh0UFhJVWxLS3ZC?=
 =?utf-8?B?N3hMSTBIWE5Fb0dNL3QvRWJWc3pockpKOExHUGlmMVlxcUVGN0hQU25NWWZD?=
 =?utf-8?B?RGpyaE1vMTFvclAvRGV1dzczd2FwM1ZkVGluOHZrMmcvRUZzWDZORWFyS3Uv?=
 =?utf-8?B?SnNSeVh2MFgxbE93VStEa0RCRzNlcStjVk0yZ1QyZDkyL2UzZC9JbG8zdFVt?=
 =?utf-8?B?Wk9iVU9Wb1BXU1FBN2JreWQrNzlMemw4Y0lLQXlmYmpNUmZGdTRYSHBVaFJh?=
 =?utf-8?B?eTF6OFBmeFN0LzNia21DWWoyS1dIZTNNcnY3SHJVL2kvWmUzYUExRUEvcDBl?=
 =?utf-8?B?TTRDT1RudGdRMERjNEhvMHlmeVFwbUtWRE9Gd2tIMWpFazg0d2pBbGRPbXlu?=
 =?utf-8?B?Q2JLbDYvYU82ZjdkMW93dFd5Tlptdy94NkZiMW4waUVIelBPMTJ2eXlCZzl6?=
 =?utf-8?B?NU1sdW1lQjRPRCtXbzdZOWFqNGwzNHRCMlpQOEdIVXExdjF4TURZT3lUN1R1?=
 =?utf-8?B?T1k4LzFMYk1yalN4dm4vaU84V3A5dEVhTXh4bFRCcEtoYXBzQ1JGOCs1V0Z4?=
 =?utf-8?B?SFNZYURVT2NqUkZIaS9DWGNsa3pReWg2elZibWRQT3AwZ1d0R0xQejFlclV5?=
 =?utf-8?B?Y2lDM1VLZ3JrcGZwNVdDWThKaUF1QTJJS2kvc0xBRjlLYU51NDVxSjRCZXBO?=
 =?utf-8?B?V0lSQnc3ZGdJZkpDYi9hUnRZbDhEM1A3NWdlKytmMGxrcmswREtDcXA2alR4?=
 =?utf-8?B?TDRrYkVXa3FsZ2Z5amtIN1B0UHp6NXkwTDRhKzIrMlZWK3UwRldVeDJvUzFI?=
 =?utf-8?B?dDhUOENsaUdEQUdZcFU5NVFZcXp2Y0k0UnV1UWFjNExNYU9MNUExTVRFQzhr?=
 =?utf-8?B?T0pReWF6aFlyaEtSbTJEdjJjZXl0ZThxbnpXUFpBZGc4WDVDcDJUZTNndVlh?=
 =?utf-8?B?WXhTMzBBR09Ra3JQMnBDNWxmNG1IVFl5SmU2dk00VG51WnRlS1ZoVkh2Nlp1?=
 =?utf-8?B?ZXg1MEVwQ01uU3JnRmIvNUZrV3crWGNrVmhjWnhnRXpYMDU0bldsMXNhc3Zk?=
 =?utf-8?B?YTcxSm9xcjhxcjNrR1poMHJtbis5c2d4enh5blJuQkEwckhpbTMyc1J4VnU4?=
 =?utf-8?B?M1ltbmtBZXJnVldSMnljeWtFVXV2THMwYVpMZzBub1dwVDB4U3dFaXN5dXBl?=
 =?utf-8?B?NUZ2ZERjRTgyTGlxc0QxbTFwWm05ZU9CbmhhWlVud2t0S0tzYW5CWEQwZWU0?=
 =?utf-8?B?b2NOQlAxUXdLV3VIOHZqOEQ0UTVVRERoVms0c2ZSbzZhTjNLOHB6ejBpeHdX?=
 =?utf-8?B?WE9VbWJZcXd0YllxQ1hwS0tpcm1tTmJvNE9wZDJMcTZuUHE3bi9TNHR6OEtm?=
 =?utf-8?B?UE9TcHZkY2VkR3Z3TWM1TGJOVkkyNUZkOXFRQ1NWYklXZlhTVTIxVXdEVVhX?=
 =?utf-8?B?ZEVkb3E1T1phTGlOa2tOc2hDRmt6ejNNbDI3d2FYR28zUHNGbVNLdVpvbWd6?=
 =?utf-8?B?a0dtVGprU212eXVhNEJid0phRHg3dVJlQzlTZzNrMVVES2oreDlEVDhqSTh0?=
 =?utf-8?B?MitXaC93dzBNa3I4LytlNkdLam13c3BiKy8xVXpVL2VvamV3NzJsTGtIdTZ2?=
 =?utf-8?B?ajZzajIzWGg1cElCekVIdjRxOWlZWEs4cnAyQ0h6OXAvb1E1RzdXQnFJSVpo?=
 =?utf-8?B?K3VhNGpLY1RRbHgxaTN4TU1yN3VKcnRkY0loWk5ybVNzVmJvdlA0TWlPQmZK?=
 =?utf-8?B?Y1BENmR1eTBIRExWNDM4UFlKNW80QWxOYWQvZlAzb0I5bGMvNGlMa3NLTWZQ?=
 =?utf-8?B?YUZmNkx5MXBJNDNIOVFnbkFlVXl4YmkzZlZ3OE1lZTkrUFBZZHRDcmllbm91?=
 =?utf-8?B?WXlXVGRVVzd0bHlIRDIzUERuWkxnUklKeUtEeWtZbXpIMU95dW1iQ24yZGJz?=
 =?utf-8?B?M0o1OHZGTWo3NzRWQS95OFZVQmNZS01URUc5Njhyd2N4RkpJRmtrT3hFdEZj?=
 =?utf-8?B?ekFDTm83SWMyd1hUTjVRMmhVSm9IY2huaVhOWkNUdFlnL3BEQTVFK2dZMkpz?=
 =?utf-8?B?Tm9aZE1IRWg1ZHNOZWFOVHNZWitndEhzS0twb05qNXYwc3NHcDFHazIraG1t?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bec7dc3-ba0a-4efd-2a32-08dd20f354c3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:39:23.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8czxixB5KMXj/vL/rXwn0fI22ullsTyOgMdvq9aPdpqa/xZR1oHzvtIzwIzfxgMphVmp0Zy65he8F2gkz1QWfXS5p/TQRmwyBvsQo+jFdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
- Adding I2C dts support for S32G SoC based boards
- Centralize the common part of 'S32G-EVB' and 'S32G-RDB' board revisions
into dtsi files. This refactor will serve I2C in this patchset, but in the
future it will also be used for other modules such as : FlexCAN and DSPI.

Changes in V4:
- Moved I2C nodes '#address-size' and '#address-cells' entries from board
common level to S32G2/S32G3 SoC level.

Changes in V3:
- Separated patchset into multiple stages: common 'I2C' dts entries, board
'I2C' dts entries and the introduction of common 'S32GXXXA-EVB/RDB' dtsi.
- Added missing changelog for V2 of this patchset

Changes in V2:
- Moved I2C end device '#address-size' and '#address-cells' entries from
board dts to common 's32gxxxa-evb/rdb' common dtsi.

Ciprian Marian Costea (4):
  arm64: dts: s32g: add 'I2C' common board support
  arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
  arm64: dts: s32g: include necessary 'EVB/RDB' common board dtsi
  arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4

 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  55 +++++++
 .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
 .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  60 +++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |   9 ++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
 7 files changed, 398 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

-- 
2.45.2

