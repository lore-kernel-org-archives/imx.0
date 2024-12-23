Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC254C70
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 00:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734914815; cv=fail; b=EBzzC22rbbxyr6KsHEDQsPqtYI7wb7j4p3HAiBCDW0fDZnTD0AcSs3d68/69w4Zyc6OR6v6HcbC7SZS62UWCE/V5AeuSXPOe0HF+kGK6bwvhZphpj2TKcXVIIOM6h/2NO4gM9cs7+buDg8SE3yAZmqAZ/rptY63TSP5FN7Vjv/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734914815; c=relaxed/simple;
	bh=j9W1QmsiL4ZM5YYJDPTXeoKJGBgXw/CDksoKJm0NaX0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sEhmaTaPdLba5ni+r3Qz1hH5lbDn7MEMTQJQYpWZEQENWnZds+RTjThHUF6PSM4rxnQi97+br0qaphG+Fij6pPSfhEoXOy8PgD8GcLeNBVhVhaX8I94A6y+WQ63Wm//yQy61kPBv+EpMYy0m+pbWWmrBla1LBScaQEzppvIK90E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=veGBszxx; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="veGBszxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDJ2oig1ubDtb4DG/IvZSYSc+fv3jj4Otop6eo+lgxaORd7T6LM3JQxWTi9yxZwG1lIAECChZhYyteaQFBsfpB+rNtylci65wAkkBq+Oknj3+YC4W3D/GotVFleex3o/e1WpY4dtHgZ199rWrLGLdGBX4dEUSivUfJUp4JPlSUw4kJEwLONTO2GTrmNh94O3RStcV1HBoHaM17/rgRY+PKJPd0BZvkdneCOIXGI3TLqtSjK9C7hyXQey6koJHNGevJiUZDxaHyiy0bRHgMInwU9laS0jOzvCLag+qEyrAE+1Do5bqVjyzbrt0yj9Mw4tuFywyPoZLa+F9le22gMXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=EEp/9DsdPkIZbaxJyvv0mI4dzbIR7aSpdV/Y/AytN3DUS/N7tQy5jp1WCFieVkkpzu4tamZvaUDAOV6eJxiXga1YK04U3PT3dHbJ49eGHOx+3s6RtAfp6Yd72KprQS/57DShRSBlW9Z3YcFk34lh6GTiK7TnA4WF8BC2Mv3iPZAJCzzpCa73zzgGG+JBB02kOEGkwavu2yZdYgbW0FhDqZXglMionCScKvR6sl/mEOgZo+ZDgdKkcbVAP02wgj9X9HgrkNU9SyfpYLCfsY83yt6GPeQEB0C4dWRxgK9YFw4zClLaRvFLRzMNyXmQNwxiuPvMa00+mtsZsfkgnraxiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=veGBszxxBIxQ3tHO0VMSiaxwRV5MnpMahFzCgA4gqOIGr0HHK2WyP/9SmMuUEK3Vlys8P+B7gyJO0s1zd0ybJG6DI6D3+ckQBMVXMDncEBOPk3FiOczzUEqrGHZgivHr1LBsFN3+cI3wtSx6tQJnL6KhcXsmCDF2SGYUyllQR91S52bdEx6LWgWY+HqYK0NBaXvFuTMvsSTOO5Y4EtRYmMZlog1U0WrrDWDXI7bQWW5friqDHeHpJxSGMXtuMO/zrueJ6laxLKu2+F0T1VI8vzQ3Z9yMp6pnQW9GQKogRzphBvv3GVBaFJGED+EKq3aVQNzAt6t2JaqhaVUilhY7Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 00:46:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 00:46:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 23 Dec 2024 08:46:13 +0800
Subject: [PATCH v4 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-imx-ocotp-v4-1-f504c1420640@nxp.com>
References: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
In-Reply-To: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734914780; l=4068;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4MXzYq4oLyYtlA95EQap1UQZ2xOM248M5j3t6NvUUFI=;
 b=K4oE7C3O1As6zXhEb2v5Y2o59RbpiVV/TreKSVlwwee+gtZSeu0u062kLOUx+ky8ie7PaDLF5
 wkjZQ63rTnfC1caRpd8kwrNRl6WBSSDWwqmRdo9UlEL3c2TLZScmjRt
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5beee755-c242-49f0-6a47-08dd22eb46ef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0JzLzk0SndTU3RQM1QxdWt0V1FTQnREaG5LYXU2UlFxSlJYUDFtSzlKVzRh?=
 =?utf-8?B?RzlpV2h2UWpldG9DSXZ5d3hPa2VlQ2k4eSt1V3VDREhFY1YzVVJMNS9LU2pU?=
 =?utf-8?B?b25zYVVJdkxmdHh4NE14VFhVaThJUmdsTnZVL29BSWxQRFJnRFNxd292cXpG?=
 =?utf-8?B?V2hqZ1ZPaFZCU0VsdWNEVXAyZVBoRmRkM001dlBKaHE3Zy9wbTFFbUx6WVlh?=
 =?utf-8?B?S21OR0FQKzVGOERQZVMySEQ5QnNyQldmNkRBNzVjckJ5OGdVMTFrVUhNeGRQ?=
 =?utf-8?B?U3JzM056QXFGaE9BalVnYWxqY0VmYWVCT0FvOFBlWDJZMG0xa1ZNNnJLdXZm?=
 =?utf-8?B?dmlTd3cvY3k3YjNiTHBDMzdkaFZlWG5mMFNmc01YS0JHcy8wZGo4bmQxak9w?=
 =?utf-8?B?RjQrenlaRU95UWFUajdOcEx2c1JIT25FaWp2MW1TV1JEYVFreWNoZmwvajI2?=
 =?utf-8?B?b1dSQkVXQmsvUTg3N25GcFpxZTRZc2xzb3hkUUhkR3JFSFRmMGlzeWZ6RExR?=
 =?utf-8?B?TmtGcjBjZVk4SUIzTmxtcStjYUFscEU5TDZQRTk3NUc1WXB3Tzk3dUVJemV0?=
 =?utf-8?B?U0xlMVk0d0kyU29BdWlvTXhrYS9Jb3NpNUdlTkNVaTJJY2p5Vjhnd202aUFw?=
 =?utf-8?B?RnJ4QXRWMk1Fckh5ZW5LSHRrMk5uVEdCZUhqZk8wN3ZrQmltWTduWUZnZzl1?=
 =?utf-8?B?OGQ2bFh1NkRYU0ZFNFhyU2RLM2FkdC9JNXp5SzYzZThaRGg5Y1NMZ1BGUHJL?=
 =?utf-8?B?NE5PdEtiWmVvWGp3M3ovOE5pdWMzZkY0emFFSUsxRTd5bmcwQTFVSzFVcHlX?=
 =?utf-8?B?T1FTMEt5QUsyc2ZUcS9laHpyMVpJNTJkYk1GTWkyNnQ4N0hGUEdSN0hxZExQ?=
 =?utf-8?B?WWlqUjFJTHV0NG9VMFJxWStiM2UrWXROYTFtSnZNTW4vSVMwaDhYL2YxYm83?=
 =?utf-8?B?TXJDRisrcjBRRC94MDdpczRSSHFQTzArU1FpTGRoaVIrcEJacGpwWFYwL1g1?=
 =?utf-8?B?ZGxaUFNnWVRFUkxIQVBWMnVLcjJBMjVnUE96MFhXWHVteHhWZWJCanJxL2dz?=
 =?utf-8?B?cG5LYlVlZlJ1TUJwTzRUNDlyZmlYVkpSb2xqUEh5dnBYV04yRVA4VlBzaGRw?=
 =?utf-8?B?Unh6TmRNZk1rTUVJUW1FOGY2SkxXRTZyMEhoK2IvUWVhSmdUT1hCazFrcmZj?=
 =?utf-8?B?RStWUDJQU3BUOHNNQURtbkUrbHdFdFdIcHNmMy9sT2VVaWg5c2pOMVVQVkFW?=
 =?utf-8?B?dHREWlRKZ3Fxb0cyVXlOZFFFOFBTMk01T1VVcXg3MEpwUUJqWW9yWnJnWUNB?=
 =?utf-8?B?Y1ZPeVV5TUhVby9ONzdWam5VOGFGbkI5by8zUHJVMXVxMVBkeFFqQmRmUlJl?=
 =?utf-8?B?WjNYcld2Zlp2U0Z2L2daeGxxQUhqandKRjFBVEFITzhPeGNhcTdFS1A3cnhG?=
 =?utf-8?B?T0VxaWpnZGwvUXBmVWlqVnltV0xDTVNYL0p6OWgrS2V6SVp3c0lqMUMrQTZz?=
 =?utf-8?B?UjJBTXI5UkNhSlVBNmJFNXUxOGtYYkVNMU40WG1iTXV1MWpFTWpvN0dQcFVy?=
 =?utf-8?B?WUdqZUgzYmNJVzVDK0ZYV1hvSlB4WGZXQk5FU1JUQTBNaTZhZFYyemVvOFNB?=
 =?utf-8?B?VFY4azZkSDkrK05PUWRCL0xCN0NZZEE4ZkovMnZ2UC9haHFMQWtDSUE1NjJn?=
 =?utf-8?B?ZzA1c1AxVUtvaW10UzNZZWJVOHZqL0NvTnRWNnpXTUZjOGNpY0pEZ3RkTmh5?=
 =?utf-8?B?Vytxd25WbHgxb0RVeFBTck9PUDliTDlTdlZ0cVR4bDgrUTBpTVQ4U0kwdWxD?=
 =?utf-8?B?Rll3ZlpCcDY5TXp4VktScyt2N2hNQVlGTEZVdDVlckVTSTVlb2h5d0RmbThi?=
 =?utf-8?B?SHdVczhxSlNLcnFiYVdBNXpPb0pQOXRwakJBaHA2Sk93MlJxKzIrT0U4S3FZ?=
 =?utf-8?Q?EubYh/wXX+cF3asGoNsHHL+Hfg9XAXUv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjlQcjVsUHR1QXVRbUhZWFE3eHFsQUlJalg5T3N1dkVaL2Vhd2JaWjZmaEZu?=
 =?utf-8?B?Y2x2ZnpVSHhNbTZQOWZYbkRwYlZobnpmTHV5SlRCV24yekswSWdtK1VocDVq?=
 =?utf-8?B?OVhtVzE2TC96QmM3cURxT0NuazlWeEJmZHgxUVFrTFFtVmhOSzRHV2ZmTVpF?=
 =?utf-8?B?OWVFdHhia2lEUUNQUTNtd0FHM05KWU80Yi9SdzdRdzM3MFEwN3lWcXRZQlV3?=
 =?utf-8?B?OXprNm1PRFQzaFp0Q0I5ei83NWtpaytKc1RIZ1pNaGhvVWVaRFVtcktrR1Ra?=
 =?utf-8?B?Y1Z0NTZUcWpGSVprdDhJSDhseUluU0lsSUdoWW5jQmk4M1BuM0JESWMvWEpP?=
 =?utf-8?B?Vi9BeFZSYVM2dXNKQVR1YXE4M2oxUW9HWjg2ZTBLOHZIbmFvbUJ4T29QNzY2?=
 =?utf-8?B?UUNjbEordGVuRHdsR0NUcGtLRUoxOWlzNmxacFNySWRzLzhVSUlSMnV0aTNk?=
 =?utf-8?B?UnU4YkZNMUh5ZHZ3Y0I5N0hsOXB2TjBHT1pRcE1sN0drSGo0bC9XMUZHMnF6?=
 =?utf-8?B?YS9GdVJRaVJ6YnFjbkZxZkQvdkk4YitKOUdzVXVKZGlxaUhtRzhPYkdIUWxL?=
 =?utf-8?B?L1VFRGc2TGV0QWt3ZFdVWkJyTFpZNGZKZ0xBVlpkS2NqTkNjemhGUkU5Z0hy?=
 =?utf-8?B?cWpUaXNmdkRiZUltZ0l5dDFDZnlydFpCaDlMdFdGMlc3SW9jam80UlAzT1JQ?=
 =?utf-8?B?Z0RiSzZUdVJtTUYxbERaNkpwRzdmOXV5T3FhLzN1TlkrSjQ1RUtXRkgrbUp1?=
 =?utf-8?B?QVliQ3lpK3p6YXphQ24vV2tjcllhcU1XRHdYaW9mUUFMcGgzc2VQbnd4L2hW?=
 =?utf-8?B?OUFLVnRjeTdQZENNcVFLbWxqdEdjTkFEK1BtVHBvNDZkSCtsTDYzRjFJL0hR?=
 =?utf-8?B?UzBrdll4VzJndW4rblZTMkUzaHZMRURZZDhBMmhNNVRTR0E2M0haTTFBaXd5?=
 =?utf-8?B?by9WZjhFT3oxZnhCZnI4b0RURTcyM3NBYVlMR3FrQ21PMjlDNDZVUFJFMEVZ?=
 =?utf-8?B?RjBsS1gwcnBVT1craXhaV2RMNHJZZnp5NHRsQ2ZPTlFEZlVwd2EyczJ5STl2?=
 =?utf-8?B?cHd2U3dOTDY5Q0MzWE41WmRDcUEzUERGUXVZUlpHa3liQTBNaGp2VzZRQVFo?=
 =?utf-8?B?TzU4eVo1U2V6V01QdG1nZkVQY2phVjNlVnBlbExseElaS2syMThiN09wR0Y5?=
 =?utf-8?B?b3cvV3NMVnlSQmcvME1KU1B3Z1NmYU9YcEpBMGlLRmVwU0cyTmNkVzVNdkE4?=
 =?utf-8?B?OEFsS21xbDlBaGdqSFhqeVAxWDdLbTdYNnpZb2FmMmZiNjFESEdVcTdhWlpQ?=
 =?utf-8?B?M1g3OXNyRE1RMk5nTFFFNzhkekZNNXVmUHVFYlZxZmxha0QrdElUdHNWbTJR?=
 =?utf-8?B?OE5lSk1rTm1BdHp5ais0cUtIOU10ODd1dmJodjIyMCtXWlBvQU5xc1VVNmRD?=
 =?utf-8?B?WStWQzAreUNlUGlWY0pkcnh6SVY3ZUE4aFVTY1k3RFBvTkpJZTlSelg0RGhy?=
 =?utf-8?B?NGxKQU5iYUVZTmltSmtrRUw3NnpISWNwRmI0UnJ1Y2EvL3JhWGMyZEIrNW9i?=
 =?utf-8?B?cjIvU0JuL3kzUTQrT3RuUUxlZnRSM25URmlaV3FJaGtodG1aWDZmRElQQmtU?=
 =?utf-8?B?SmVyb254clRCYlV0ZFcwQ0xRYmVweDVHaFAzWmlYTzIyVWl2cTRUZnVBL1Ro?=
 =?utf-8?B?L1JpNk1xc3V5NlpjMVVQZUtvNG9QR2RBWm1RRWJHWXhvakd1UjZiUmJZbkpw?=
 =?utf-8?B?SCtIdkg2UDhTOWxpb3ZGODVOVEU1Yk5EWWZJYzdtS0ZmR2FuVU1OZ2hRN2lw?=
 =?utf-8?B?eXpWWUVoWjNROG1SRUNLbzdiSS9qLzNwcXIxWmc3KzdDa2hUVTNiMDFwM2RU?=
 =?utf-8?B?ODRVZUxhc1Z0RjJXZjhqajlRalNJVE5DN2pnekx6Ujc2LzhDVHY5b0VRVDNF?=
 =?utf-8?B?UTZncUR4eVRFbGNQOEl4bGRNdHUwbjRFVEdLaEdBRllzcW1sTVZzNE1FazN0?=
 =?utf-8?B?M1V3M3ZqQjJIcmN5MnNzMnBLbmVQL3NYNGl5YyswMERVYXB3TkxaMHhYVVYz?=
 =?utf-8?B?aVdBVkxRVCswbDBma21na05kNndBVy9GY2IwYnRBR0JWdVR0UE1Ua0kwUUxv?=
 =?utf-8?Q?J6qvwm+kcSgiQytt4JJFLSmXc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beee755-c242-49f0-6a47-08dd22eb46ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 00:46:46.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEdL0SqunRd1moDXJ0WR8sUGMOg+xn3W4xh9AHPXf+VZAfAtH3pTbAQ3KEqSO/vfYHDyzKnTI+GjjuVPtgJI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5a17e53a14f71362
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..2d21d1f690974d0215c71352168378a150f489af
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1

