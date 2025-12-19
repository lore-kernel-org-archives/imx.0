Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AC246768
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121714; cv=fail; b=Lp2x+lEBWKkxaWUSpYtBTHS00CTnXlgcYwE0ZO3XMnft0lb2BovBcXMhjzW0n29pXEHdLjODQMGkD8XHbeANKUQXGRMNODjOEhf5QUrjbyikfls/W5/YEGa5DcsZ9kjhuZ4/4st9T5AFK28jfrDM61JGo2h8AvmPLBMqPkrJvh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121714; c=relaxed/simple;
	bh=TV0GbS6sa+fT69oeLrThOrKoJ0ALdFTVT4rjwumigpw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Ow6X/b/Iju7Xadkg8ISwlBpD8gwn6OtIznI/RqJnFrgB/f3dFwqI98aP0g+jdLqPUXcPH26f/Gonb3NrxmJIyH1nPp8PONdw6fXGGufHoFdPYbNguWotYNUIyjPEYTjwJ4j1xqaL2sMVS79ogLYs55+B+nwfHCgzu8OBEIb0qag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y3FHnThS; arc=fail smtp.client-ip=40.107.159.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y3FHnThS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osJQUxDbMpmUMAj1L9JyZBBuVok6FQhvUFMUcFhNRKY3JnyKGUfA6Jo7qiHCY6XpQl3Q2HpSKOhRGV0/zOFF0gzHRWbY+0E2/zHi1fusud5oNjAEp6c25cbLcPTEWfSax1EDeoMI8lbRDfLeyFEzGC5T7n/4wmwuA25skch2p/3tpc30Xg/q+NzE2IB9Hs0Olnv/4pnYyDuDMOPbWh+CfdvP2X0xUw9Mu8bMH/yRvwsQ/bdmhoT3fU7GMcQJcNmGBlWIBQ35F8p6eUSzoJxPV0p83TG4tacAHCioTWJ8sxNAPsmKdeyH8O4pAKcN0GdQBJmDof+e9P09AE2tn5BNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzV/3shLZ6FkuoTZahHEEoryGCTvJiDyDftdLCEGC6U=;
 b=SyoyEDTEL+o1chpwMKPKrHimSzGMghoPjAJbTytEN1LSeBU+m6ZTFI1ojruKQ+F5fVP/NRIz2MUhHAL/zvxSb7odkPPS/aPcrPsUBK93muKFS8tbxBvie1eR0JFcyjydf2atqd578/lhORq/6pvY8+SBcpIQlp+z8jX4hEdE7TQRd43uIwqVyqC51wW2pqGhEP7s94/OF6lNvu6tPeNnjHHWIqcJu2JWyukPmy1rIht4LMdrnINbQgdhq750KKwPcLu6pst/gm0xVMXfBQ7cNY8OT6i99QlNV5Yu/Kz66sFdNUxS0qeiUvica7f7cjl5369QLMRRjO9EAsbCxy+xog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzV/3shLZ6FkuoTZahHEEoryGCTvJiDyDftdLCEGC6U=;
 b=Y3FHnThSWRAuc5eACzO1drH6wzVmr7QXy9fXJEk/BUU+H1bvMDlwRvsf+0iFa4ZDQhPlS3DTGbIyNtFHMnClbBmQs/ZlK/+f6Lti9nMAxZ5x2HlK8yi97Xj6ikuOFoQSsdWeLIiORckWem8BBZtBBfXrB34CixobQFhHovwTgOsVLW/CE7kiYNB/il4l3pbURqXpqTC28IaQGOrTFLO4P6tVap+NC/+rJ+tpYddnbqm3y40j6c0Yu8EJlaVzpnNdMPGbhBUHn29AFnOfLdhQpBNkjBFKTTcLIrxmzX2PIA82dnwMyjrnSjUsf7I/rM39szXADpMtMDfP89UHV+OZ2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:21:47 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:21:47 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH v23 0/7] firmware: imx: driver for NXP secure-enclave
Date: Fri, 19 Dec 2025 10:50:38 +0530
Message-Id: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbgRGkC/13UzW4cIQwH8FeJ5typbGNjyKnvUfXAAtPMIZtot
 1qlivLuNatqBzgOmh/m428+l2u97PW6PD99Lpd626/729k+yH17WvJLOv+u615sYCEgBgFd99e
 P9Wqj25oYQASiK9kv9v/7pW77x32yn7/s+2W//nm7/L3PfcM2+n8WhG6WG66wkmZJXjmiLz/OH
 +/f89vr0ua4UefI9Y7MGdoKhpjExdG5w3nsV31z5pIWCqUmyZxGx4dTkN5xq0cFACqGhNM6pXN
 IvRNz3ieNEVwKSqPznaPBeXO1kjdzCjSvUw8XgXun93PZCqWTMnkeXXg4BBz2F8xFFHbBimpxo
 4u9872L5rYStgQZuKbT6BAOiONCLQawnjbwEFzOUbdJHpFBojEyLTOQtXopmqrONR+hEcBJttR
 kqVZOWBTyJN0hnVXpZctNzNnbVosvOEvuJA2Bw5YcIozMITqq042gHJJhlC071blAueaSACfpe
 xkH2dJjTcFVNseodZLaSRquE/V+tkFQJAmUuWY4pMexZktQjsFFPCXmuZMxHjJOJ9QyVLBqjR4
 yYpjegEeGxK5zfARahhJwImtlEpkyRNjJsS0J7/2lxdvDUgLPNamXYZAtQ6CMIVs722YO+fX19
 Q9fBLCmUwUAAA==
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=32483;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=TV0GbS6sa+fT69oeLrThOrKoJ0ALdFTVT4rjwumigpw=;
 b=VwRAZjsdibDpVtZ+uH0Uczf4KvvnR0lM7w0zKxhS6vQk9yGioFDMcU/JObxprzLsKStESraiX
 MgIXz2karzdCGkszdj6zuhJ0pW7WuOMgIdyX7WXmneUnI73FEP5fmEj
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fadb41f-051c-41db-bbeb-08de3ebe815a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmlNNjQ0MTd2bkwvOCtsMHo3azBmSjZQZGYyTElUNnNiL2RndHpLSmtWRFdu?=
 =?utf-8?B?OXZ4MzVnV3UreDFmQW5ORVdLNkpVK2lwYWMyZ2lrN2dkZXJoaEpmWXNXem5m?=
 =?utf-8?B?cWhnRDB4aWVaSVNFZ1FKU0Z0bnowaVpha25CT2k0T0pZT2hCSlFwSEpuOGc0?=
 =?utf-8?B?QmlxVzdRYThpUllOcWMxZEpnVWZFL0JzTkhYdlRFR3ZXVEI0Z0VTbU5BeXVH?=
 =?utf-8?B?Q2h1L0hLREwwbjhNN2FkdEhQT3dMekZpYjh0TE9wYWRzT2crUnhENFpUeWJE?=
 =?utf-8?B?SURBMFRSMHE2WG5HVXRVZldZUHlqYVBDSHhDRG94TTl5RjVTMzFoRTY4WU9n?=
 =?utf-8?B?cGwvZlpWZ1N3RWRkNWIyWDFwRm5DTGJoSUxmSFZIblFoOTA3MHB2dDI0SVRH?=
 =?utf-8?B?b0FFeVRNYzNyZVBsSDhMUVF2NlVadUJEU0R6WFZFT3NCZmExTk13elA1cGVE?=
 =?utf-8?B?Vk5lbXEzZkRTd2VkQWpQUU9GVVhnUWFOM2dHKzR3SEFHSXJDQ1g0VytleDFQ?=
 =?utf-8?B?dTkzRlhXMWd3a0VVMTBsZGZzOU9NNDN5Mkl4ZUR2WHFLOXY5OTlpY2tBZkFJ?=
 =?utf-8?B?bmNuZVdTL3V4RGxxOUYvQXpOZHhvYitWOFUxekVTUzR1K2VBSU40R3hvbEpu?=
 =?utf-8?B?QUlLMTF4dDYrYms4bHJzUlIrWXBxUmtodHFueTVjYzdkbzRPaWpTaFY4M0tt?=
 =?utf-8?B?d1FGSXowbXVrRUw4RUxnalE2aWkrWVE4NFRzbXh1MGFFUzQzaGVrNkFUNjB5?=
 =?utf-8?B?MnorajVXb29qL1JqM2gvSnpWeHJ5YjBqb2ZFTEVsekhrMzlDQVVvRFMzT09C?=
 =?utf-8?B?c1JwZXhEZlFIL0RJTXIvc3ViVTBQSHBvL0EwMU5od0gyRnlWNTJzY1djVjc4?=
 =?utf-8?B?dGJEMSs5ZFZsNjFrTnBuRzJseWQzYzBZSFkxc2FsSXdtVHNuVEJPdk1DL01K?=
 =?utf-8?B?Nkw3WEtKcHMvSHRNMDBkSnd2K3NSQk9sMkhPeDJ4WUl4SUFtMTJqMDN1bzgx?=
 =?utf-8?B?VmNVSitrTHVDNU1IZkdqUGR2U01xb2ZVSUU5MU1NRUpBMFVsVUJSSEJaeW5y?=
 =?utf-8?B?Mkt1dzlJc1A0RVlRSXVuczdpdGxuckd6eXJFOTJsR1pReFVURjRXVm5HVmEv?=
 =?utf-8?B?K0p4MkxldzBpVHdDZW1lbzRYZURlR1ZtMG1VT1p5VlVHUDVIY3MwZkNYcnZo?=
 =?utf-8?B?KzRDYmRnYjlTVVpKdFlreWY1VzBwM1VyQmxxWVZ0VzNzTmdXaEFhZGxPSTJx?=
 =?utf-8?B?VGNDSGhDTXk0M1FtMlBxMFRlZGpBWDF0d3AwQmM2ZUhscGFaMjJkaWRyVnN3?=
 =?utf-8?B?ZHJqcE9GaEkwbXRXMlppOUg5VEEwWmR2bEJyaFpoVmVDUTNhTVZMOTFNMWJB?=
 =?utf-8?B?cU4zQzU1V3lPbjdzck1hcFcvOWZtSGhOR0NiSkhxSytvR0lZNDR1dHlaUHlX?=
 =?utf-8?B?d1VzdXNGTW10UHR6TXJwajZjalgzWCtCOFcra0Jyd0ZHb0tVREV4Nk1xZ3RQ?=
 =?utf-8?B?WHBhSHJ4L3ZsVUFENFYzTStRWE9LajkyaWlUOXA0ZXZVVXhTM0dESHdoQ1cv?=
 =?utf-8?B?UWZRejJFV3Q0RjFKZlpKVjNiTHlUL21McHR3S2E3cVl1TVlCSHB5VHh1ZGw1?=
 =?utf-8?B?WUpCTXlLeisxWko3cEhkVmRPeXg4U3NsVzN6MHJPL3Z1TDNyMTl4aVp3ZGt1?=
 =?utf-8?B?RC9hMVdnQThUb1ZlMjlpS0JBUURwOHRUL3MxU3VRQjFHVzJaR0xXaE9pdGZT?=
 =?utf-8?B?L1c5cDR6dGZDMVNVSDU5VHpBNTU5Q3l0K3hKTFpVb2FmSzh6VVJ0cFIyMktV?=
 =?utf-8?B?ZmQ5WmhLUTM2bjRXbzNkZVNmK3pFWkk1dXVxajA3SExvNlBiVVUzc2lHMlRC?=
 =?utf-8?B?c2IzRGNncGlwTnNINVIxRjFUdldtOFVET3RvREdSbXd4THhkNUJ1OTFzcjNv?=
 =?utf-8?B?L1Yxd1FWam4zenB0WDlSb2luZHBYWUh1Nm9HRlhNNksvaEthdTBDZC9IRWN6?=
 =?utf-8?B?ZlM5R3NuZytoblRBaVFWOUNIRVZ0dU9LR3kxWHg1ZDZKMisvclFrZzZGb0sx?=
 =?utf-8?B?SkY2am0vV0QyenFyVjB0a0hFTmVBMW9Lb2lvUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2N2NTllQTV2UEdOR2E1VlVNYzYvWHF0NnlaazYwSU8rQmMwdmlOTUlYWis2?=
 =?utf-8?B?eE5QQ3ZmVVFIOE1MK3QwVGhiMUhYK29CbWd3MmlNUXZzY0VXVXM3MmZBU2Nv?=
 =?utf-8?B?eGp6Y2VJVld3QkFvcmNSMitmU2ltYjEra2VURDRLSlhpOFJjMWZZejBIU0pt?=
 =?utf-8?B?RE1NTnVLZkVMcVNabElGODkxaFk1Vm9Pem9pQURHOEQ5Y2ppZkVWZnFieFNZ?=
 =?utf-8?B?d3JyNkExay9mckt5TVpXS0pieS82NzVVaFJPUndJZ3J2eCsvb1A0bTlWMFJs?=
 =?utf-8?B?ZnFoa0FmNE5Danlxd1h6RWhJcEtTMGJ3NFpranh6WkdNOWk4djBBVWZaK2Qx?=
 =?utf-8?B?bE0rRjloU0VORmxDd21taHpleUxPUjhwU2lvSTcrK2ZObWZubUh5andKM3Er?=
 =?utf-8?B?aDJUTlc4S3d0anBZRVJvbEJ1a1J4MkNSYk1MdWVLTXhwNTA5djFFbTQ5T2wy?=
 =?utf-8?B?WFlXYk1kM0NkTGI0NEtuZXNZeVBza24xeDhwOGtFbkRESG40dXRyb2xsdUQx?=
 =?utf-8?B?akZ1ZzFzWDdOVUxMS3RlK1JsdDNMVU1FYkxPc1ZBaXBlbUJ6WHFMV3lRU1lT?=
 =?utf-8?B?elVNM3NKZHhHaU1XQThaR3M4Y2QwVFM2aUQ0STlqL3o4N1pVRzNZVkpSM2JY?=
 =?utf-8?B?ckZ6bE9zNmYxd3o2NVc5dnJ4enpxMmphWEtaUVpkN2RoQTk0ZFJhcWcrOGNW?=
 =?utf-8?B?dUxtUkFtZHFKQzd4dnZkL2V1LzZUQW8xSFdqOEhJOHVzTTE2aVdzL0FYWEdq?=
 =?utf-8?B?bUliYnpUZ01KRzR3a2FrdzFCRWtZbFZtbkExYXBPNU9qOGRDSDJIalRGNmk1?=
 =?utf-8?B?Mk84Wk81RDRDNkNWY3RQeGJ2azZKK2lGRU96UVR2Slg4Vlp1U2tORzhEVUNx?=
 =?utf-8?B?OEVPVzU2K1lQV0xUSGRNV1Bmek10RVVtcHVZODFFUVhsZTdNZno0Mlk5VnVX?=
 =?utf-8?B?MnVlTnAzb1hTbE5WWjkxQmxFcUs1dmEwbWdqQmlXdG5IRnNMMlFGWk92OGFr?=
 =?utf-8?B?QzVMb2Q1SnBKbTRGY1F6Nnpra0F2Wm5QeEI4aFk1UlBDMzRHcVJ0cjZXWW94?=
 =?utf-8?B?UERRNDVCL3Z0VG9iTm9XR25JeXUwS0taTU5XdFY1QWswMGJxWjhWUTRFMkty?=
 =?utf-8?B?ZXZ5aHFOdU5aTExYNitWdWl5bHBkc1lhM24wL0w2bCs3QzBGWkpUUUdrRFhV?=
 =?utf-8?B?WW10aHI3alBmVExPTlFxU0VhdHpyUzJFRG1nMTkwelgwZTNHcDJFU3ZPaHVQ?=
 =?utf-8?B?Y2J2ZU1IbVVndVhvZWxxTlRORTliVW1seElZZXhXdGtzU2tGVyt3a0JEK29I?=
 =?utf-8?B?SXRtNmlMaXR5S05sdzBMU3ZFUVdPQlpZRE8xMTZHQlZwK3NMVmdlZmJheGx3?=
 =?utf-8?B?Z3czaWlUbVpRQzcvelVFTS9oY2VKTWFYcm9FUDUrYmZndm9nOGk4cE5sZmRT?=
 =?utf-8?B?WUZUTUp6UEtDYkQranZ1VUFreXpTMTM0eE13YmRqLzNjdkQwbGo4eURqZTNm?=
 =?utf-8?B?V3diMlpueTN3MmFsOFZqang4elpSN1ZtL3IxeDdXc28yU2Y5bmpOK2x2TXN2?=
 =?utf-8?B?d293YlR5YkdPbHJ3aDJoZjlvRGtuOHlBeGZKamVKNk5ndEpuSE5vaWxuRWQ5?=
 =?utf-8?B?MFB5eDhJaWVTclQwS3dpUEt6ZURvV2FleFY5aUs0ZHA2TnpFYmx2d0xYaVpo?=
 =?utf-8?B?d3JtQnRyb2wzSVNqMmlrL2FwOVZqaHl3eEM3enV0UWgvWlphcVNBNElyeTBt?=
 =?utf-8?B?ZTRGMDk4NFdoN1JKbEs3bUdaaXZEVE5tc3hiMzNwVjNiOU9hYzNRdjJ4aEIv?=
 =?utf-8?B?S3RCSGFjTkhnemczczZabjhVaGtzSFJ4bTFYcmhEUWdMaDkvT2h6SzBWZUlZ?=
 =?utf-8?B?Q1FNTGpjRE8yTlVFWlpyY2kvOUNWakdOeU52OHY4MUN1NkQzWFZ6QVkwbjlt?=
 =?utf-8?B?enVXdFBTSVBhajRJdG5SeXNWMmdkelIvNEdUUk9SZnM4SExKeXNLZEVDWXdu?=
 =?utf-8?B?UjBYYURKQmlISDNCNVI1YVNmRC9zaG5XQUhhSWFzaWRzZHFPSWJZbVdqcWxj?=
 =?utf-8?B?bXdpV0MyTnlpeEJxclZ6TXhORDVvL0FIaU5mdEVYME42RjlaelJRRkh3NEdC?=
 =?utf-8?Q?amCWJf7RaBpA34V4enP9SWQ4d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fadb41f-051c-41db-bbeb-08de3ebe815a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:21:47.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR1dXcPW9O5+880ZwvCdM5FUPnuxoGQC7Bt3fK8aRg42DzdUvxMT40W+1AJpdUoAVr3CRCAu6I3VFFklcSh5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
enclave within the SoC boundary to enable features like
- HSM
- SHE
- V2X

Communicates via message unit with linux kernel. This driver is
enables communication ensuring well defined message sequence protocol
between Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications can communicate on single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

-------
Changes in v23:
5/7
- removed un-neccessary 'kfree' from the func se_ioctl_cmd_snd_rcv_rsp_handler().

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v22: https://lore.kernel.org/r/20251218-imx-se-if-v22-0-07418c872509@nxp.com

Changes in v22:
3/7 & 5/7
- reverted to previous change of using "__free(kfree)", by declare-and-initialize __free() vars next to their allocations.

1/7
- rename the se_fw.c to se_ctrl.c

2/7, 4/7, 5/7 & 7/7
- No changes.

Reference:
- Link to v21: https://lore.kernel.org/r/20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com

Changes in v21:
3/7
- smatch warning fixes.
- Added "COMPILE_TEST" into "depends on IMX_MBOX && ARCH_MXC && ARM64"
- removed "__free(kfree)" & added kfree();

5/7
- removed "__free(kfree)" & added kfree();

1/2, 2/7, 4/7, & 7/7
- No changes

Reference:
- Link to v20: https://lore.kernel.org/r/20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com

Changes in v20:
5/7:
- adds a func "se_chk_tx_msg_hdr", to check the validity of the in-coming message from usersapce.

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v19: https://lore.kernel.org/r/20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com

Changes in v19:

1/7
- Added 9 lines to the Introduction from line 73-82.

3/7
-  Update the commit message for " For i.MX9x SoC(s) there is at least one
dedicated ELE MU(s) for each world - Linux(one or more) and OP-TEE OS (one or
more), that needs to be shared between them.."

Reference:
- Link to v18: https://lore.kernel.org/r/20250619-imx-se-if-v18-0-c98391ba446d@nxp.com

Changes in v18:

1/7
- Wrap both diagrams above in literal code block by using double-colon

3/7 & 5/7
- Collected Frank's R-b tag.

2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v17: https://lore.kernel.org/r/20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com

Changes in v17:
- Changes to 3/7 & 5/7: to wrap code text at 80 character whereever possible.

Reference:
- Link to v16: https://lore.kernel.org/r/20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com

Changes in v16:
- commit 3/7 and 4/7 are moved to end commits making them as 6/7 and 7/7 respectively.
- No change in 1/7 & 2/7.

7/7
- Collected Frank's R-b tag.

6/7
- commit message is updated to wrap at 75 characters.

5/7
- func add_b_desc_to_pending_list, removed the initialization of b_desc to
  NULL.
- variable timeout in func ele_msg_rcv(), is renamed to timeout_ms.
- struct se_if_priv, member variable se_rcv_msg_timeout, is renamed to
  se_rcv_msg_timeout_ms.
- in func load_firmware, move the label exit after dma_free_coherent.

4/7
- commit message is updated to wrap at 75 characters.

3/7
- ele_debug_dump, updated the assignment of keep_logging.
- ele_fw_authenticate function definition is updated to take two address
  as arguments.

Reference:
- Link to v15: https://lore.kernel.org/r/20250407-imx-se-if-v15-0-e3382cecda01@nxp.com

Changes in v15:
- Patch 3/6 is split into two:
  - 3/7: arm64: dts: imx8ulp-evk: add reserved memory property
  - 4/7: arm64: dts: imx8ulp: add nxp secure enclave firmware
- No change in 1/7 & 2/7.

7/7
- removed the se_intance_id structure member variable.
- replace variable name from wait to timeout.
- used 'goto' to follow the common exit path calling "release_firmware(fw);" in case of error path.
- removed TBD string.
- Used ARRAY_SIZE(pending_lists).
- moved init_device_context after init_misc_device_context.
- defined err as long to avoid force convert in func
- added se_rcv_msg_timeout to priv, to control probe/suspend/resume per interface.

6/7
- removed the se_intance_id structure member variable.
- Added dev_ctx to the structure se_clbk_handle, too.
- Collected Frank's R-b tag.

5/7
- removed the se_intance_id structure member variable.
- since added se_if_probe_cleanup to devm, se_if_remove() is redundant. hence removed it.
- rename se_add_msg_chksum to se_get_msg_chksum
- added check if msg-size is 4 byte aligned.
- Fixed multiline comments.
- ele_debug_dump api is updated as part of comment disposition like single setting of flag "keep_logging" & adding if (ret).
- moved dev_err to dev_dbg, for imem save/restore functions.
- moved func get_se_if_name, from 7/7 to here.

3/7
- Updated the commit message.
- split the current patch into two:
  -- 3/7 for board dts, and
  -- 4/7 for chip dts

Reference:
- Link to v14: https://lore.kernel.org/r/20250327-imx-se-if-v14-0-2219448932e4@nxp.com

Changes in v14:

- Patch 5/5 is split into two:
  - firmware: drivers: imx: adds miscdev
  - Introduce dev-ctx dedicated to private.
    -- Base patch before enabling misc-device context, to have the send-receive path, based on device context.
- No change in 1/6 & 2/6.
- Copied change logs from individual commits.

6/6
- moved definition of func se_load_firmware, from 4/6 patch to this patch.
- split init_device_context to init_misc_device_context.
- Different value of se_rcv_msg_timeout is required to be set. Receiving the response of 4K RSA operation can to take upto 3 minutes.
  This long value cannot be set during Linux: boot-up and suspend-resume.
  Hence, it will be set to default small-value during Linux: boot-up and suspend-resume.
- func se_dev_ctx_cpy_out_data(), in either case: do_cpy true or false, the clean-up needs to be done and it is implemented like wise.
  Once do_cpy is false, no need to continue copy to user buffer. But continue to do clean-up. hence cannot return.
  And every dev-ctx operation is done after taking the lock. Hence, two operations with same dev-ctx is not possible in parallel.
- func "init_device_context", for 0th misc dev_ctx, which is created at the time of probe, the device memory management is required. hence there is a difference.
- func "init_device_context", dev_er is replaced with return dev_err_probe.
- func "init_device_context", devm_add_action is replaced by devm_add_action_reset.
- removed type-cast from func se_ioctl_get_se_soc_info_handler().
- used scoped_cond_guard(mutex, _intr, return -EBUSY, &<mutex_lock>)
- combined dev_err & dev_dbg to one dev_err in se_if_fops_read().
- removed the structure member "se_shared_mem_mgmt->secure_mem".

4/6
- trimmed the ele_fetch_soc_info.
- removed the function ptr "se_info->se_fetch_soc_info" and replaced with ele_fetch_soc_info.
- moved definition of func se_load_firmware, to 6/6 patch.
- Different SoC, different ways to fetch soc_info. Generic function declaration for ele_fetch_soc_info() is needed. Hence wrapping ele_get_info() in it.
- Updated Kconfig help text for assertive tone.
- func ele_debug_dump is updated, to remove constructing the format string.
- removed the macro usage for SOC_ID_MASK.
- used low case hex number.
- Condition will never occur, where msg_len satisfy the following condition "msg_len % 4 != 0". Err msg is added if it occurs.
- Function description is added to se_add_msg_crc.
- timeout is added to function ele_msg_rcv, in 5/5 patch.
- local variable "header" is initialized with "tx_msg" and replaced "return err" with "return tx_msg_sz" in func ele_msg_send().
- replace function name from "exception_for_size" to "check_hdr_exception_for_sz"
- replaced "return ret > 0 ? 0 : -1;" with "return ret > 0 ? 0 : ret;" in func "se_save_imem_state".
- func "se_restore_imem_state", to return if the condition is false to proceed.
- removed casting by (void *).
- removed devm_kasprintf and done direct allocatiion for attr->soc_id = "i.MX8ULP" & attr->soc_id = "i.MX8ULP", & attr->family.
- Followed Reverse christmas tree order, whereever missing.
- There is no return if ele_fw_authenticate fails. Execution flow continue forward and execute the fucn dma_free_coherent().
- The loop is not for retry. The loop is needed to load secondary fw followed by loading primary fw, first. This is the case when ELE also got reset.
- dev_err_probe is corrected in func "se_if_request_channel".

3/6
-

Reference:
- Link to v13: https://lore.kernel.org/r/20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com

Changes in v13:

5/5
- Updated the commit message for imperative mood.
- Remove the usage of macros- NODE_NAME, GET_ASCII_TO_U8, GET_IDX_FROM_DEV_NODE_NAME.
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- Fixes the check-patch erros reported with flag "--strict"
- Replaced devm_add_action, with devm_add_action_or_reset
- Removed the un-necesary and obvious code comments.
- Removed dev_probe_err at the exit of function se_if_probe().

4/5
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- fixes the check-patch erros reported with flag "--strict"
- removed the un-necesary and obvious code comments.
- variable received msg timeout to be different at boot-up & suspend/resume and send/recv ioctlis.

3/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- updated the alias name.

2/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)

1/5
- No change

Reference:
- Link to v12: https://lore.kernel.org/r/20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com

Changes in v12:

5/5
- increased the wait-timeout.

4/5
- rename flag "handle_susp_resm" to "imem_mgmt"
- moved the buffer allocation ot load_fw->imem.buf, to se_probe_if.
- setting imem state at initialization.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (7):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: device context dedicated to priv
      firmware: drivers: imx: adds miscdev
      arm64: dts: imx8ulp: add secure enclave node
      arm64: dts: imx8ulp-evk: add reserved memory property

 Documentation/ABI/testing/se-cdev                  |   43 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
 .../driver-api/firmware/other_interfaces.rst       |  131 +++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   12 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   11 +-
 drivers/firmware/imx/Kconfig                       |   13 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  298 +++++
 drivers/firmware/imx/ele_base_msg.h                |  115 ++
 drivers/firmware/imx/ele_common.c                  |  373 +++++++
 drivers/firmware/imx/ele_common.h                  |   51 +
 drivers/firmware/imx/se_ctrl.c                     | 1160 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  128 +++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |   97 ++
 15 files changed, 2536 insertions(+), 3 deletions(-)
---
base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

