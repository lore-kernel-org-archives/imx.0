Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AC313267
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802068; cv=fail; b=TDw0CYhJCj9bRU8kCMIIbyrikEzzmwd110s+UTl0cjfPPo9wd6oWncX+qDUFrkHwX/Hvc+5TY1Bj3u7RRgo1QaHrALtXbZcMO/7TaZyZVrwNjMethFLiOxaqk5+H/uRZOMXYemzpdNGZk6YNd077re91jYRg0ojGPMMfZTiBTsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802068; c=relaxed/simple;
	bh=Nycpnz0Hs+K1IUXmPajNwv1NflDSWVxqR6ZUnnVrT9w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TMvFpJJ5uLxUhZGxDkQ+B+wQmXYb94enKQP3JZ913bck0Btw7UBK4N2+fkzz2brsUXpRqImRlQyxsbeHwzeTMtps1nYwDE5etTn7WW1eeioYIZgRTPw3ursNRukx7nw45sKsFl0noFcAuWHBx7h6hlwMVyNCmonp5TOTjJOu7dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PrvlusdI; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PrvlusdI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcfP3IDXYU34cvJh/iTSMq1IUA529iC7sA/hvCX2WTCcvr8ykVDLkrYv7RS29lZEXg5ziUhOH7xwmqglVWDPLsPvspWV8G+Q9g7TabKVKaqE3fAvt9cb3CxxzxNMxJhOEHYiTpKlgxyStbje+VU4ouryZgwAfmH9u+QeR/EAn0XRB9UPEYH+YcnoWLrfsEItyDabim6GELZkKYnt2ClkdrAwvVb3CYjQWlxGuhmQSfEbVPktAYX2f7dY3ydzrg+F27xOLszhsMIQqRdHX6dTSldkFaRj5BCez4EmXsBGOk92HZ5tKNF9fDNiGO6WG0E3OUeSghIHAgEZgTrZ+hUfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFxjW5WIGjceNxqjqLJjJrbxL3KO0wtajHIJL6qanI4=;
 b=ajtzR66gAb9oi8cCr9nEfBOdbriPIRWCobB/XyyJLkGzW0GSLaVSeABmFAuOo1rIj0hYU28636KmS0Eiyvlf404YIu/5wqWjEBTSyv0gWk71kxRmmRIx/W+31od/0bSn8CWTdczPpRAA5LOe9GMdxJOS04QZcBaWxtr55MSHBa3sKVNL/HgxgKaYnN8vGT+zN6ox+rDPIk4fJHGQh/TNXKKFAt7rqjXI88ew3674DFT7S7vn8rSxFRWmPvTERB/tBP3iytjTmDfBwJGeUddW7JJiw+J75mY07eg7GhIhQ+2uof0odZlvkX5pLZAam5Sy6kVg9kdQFjPwhTbMxx+t5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFxjW5WIGjceNxqjqLJjJrbxL3KO0wtajHIJL6qanI4=;
 b=PrvlusdIB6vB+wN9EfLxVRugsdt+4m7Y1JYc03Vy2RctvQK/a+Awb/w/MdFKk9QayZCUvQerIkYp5EWc8pGlok9GhYE6oRuy2krTyty2BEHWgByOVVGciQNsRKi3yWrRo5Jx/UmgD78QfW3gbXhnTCLfsf/WcSBuvzI0SSWraZG5AlfsHdk52+UD4mS9G8JXS/DPWdLkIOIesg2qp6C21BTx4+E3xluRd+AyC0Rq/p77AOAsRzfLiO5yqch1Zg5QNbqWxqw5ULZbITiW7PJi8F9+WfEAKzZ9GL8Q3pTO86bRFVsYJlIXOxss9eADgXvs7FNC1BqtIBBIqgODRqbSSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV2PR04MB12020.eurprd04.prod.outlook.com (2603:10a6:150:304::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:27:41 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9564.016; Wed, 11 Feb 2026
 09:27:40 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Date: Wed, 11 Feb 2026 17:28:23 +0800
Message-Id: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdLjGkC/42OQW7DIBBFrxKxLtXMwGDIqveIsgCMGxaxI7tCj
 iLfPTiLpK3SqGL1Gb33/0VMacxpEtvNRYyp5CkPfQ36bSPiwfefSea2ZkFABpBABi3zcXYsC81
 SJcDYhGisRVGR05i6PN90u33Nhzx9DeP5Zi+4/v4hKijrMxZbxhAR6aOfT+9xOK7WFwhTqFcO1
 Hi4I2tzoVdtVFHPKoID4Odt6gkSmJrY6dYa5/6JgHaNdxa1MfbnQPVtoPo9UEmQjn0HHFJMjh/
 osixXfPPfNrUBAAA=
X-Change-ID: 20260120-b4-imx95-v2x-3e01c7bc6881
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV2PR04MB12020:EE_
X-MS-Office365-Filtering-Correlation-Id: abc1f764-00f5-4847-4dae-08de694fcdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUZXU1c0QUo0bDBUZkFWT2dGNHpRL1EvUHcybkMvRS9YeXVRUnBvK1lPYURH?=
 =?utf-8?B?Ty9oZXZLZ3J0aUE4T0RnT0ZWZ0pBNnNHVzM4by9sSFh5V0RzYWp6RFlLclpq?=
 =?utf-8?B?UW9EKzlOZHN3eklaY293TkdjakZoTUhKSmgvYVZkMkl4R2lEYTRhZG1OYUVn?=
 =?utf-8?B?RDNaelQ2M2RuQnJlNEN0UkN6SEdTdnVVUUpwY2txdWw4V2FTQ3phRm1vcUtm?=
 =?utf-8?B?Qzd5a0ljY0lJdG9vM3VrcEJONzZ1dW5uaXppUDdieXh6alZzKzBpRnp1QWtD?=
 =?utf-8?B?YjJ0YWJuMnJPNzJnYVJmREVpT2gxeWZpVEhkNHVjMVJoaTRSajNFdEZDQ3pW?=
 =?utf-8?B?SjY2ZXRSQTRYNjF0ak1EaitES3hBK3FPUEsxVVdIdFB6RDBNSXVoT2VMclBN?=
 =?utf-8?B?T3AwVk9obGthcDNlbmZTVEpNbUFobmJMSjY2b2U3QWVQQUhCeVZRYUYwcjRS?=
 =?utf-8?B?YVowa1BwSWNybkJkbXowSjdBZVZCZXlEbk1PZDhVbnFXREdUclhjWWZ4RFp4?=
 =?utf-8?B?WHhVTk1ZaXhVNzRiR1J2bG5GQjRlRlVjN3lUVUZub3IzT0NCNUtqUlEyVVJE?=
 =?utf-8?B?cUhqdHVIUjY5dGFWTmlSWkNwdlc1bGwyWnhmVUZYVGFJWWFiSnFJNHV0WE9H?=
 =?utf-8?B?c1dVK3BnYXpHbXZHSjhweHRXY2lneHBXN2k2LzZaQWFCNXlrdjJKc2RnT2pM?=
 =?utf-8?B?RFFsS2FHc0tRUDg3dVIvSXFqNlZoS2h0RXM4VFJNaGxCZ0lSL3cvZUgvTjg0?=
 =?utf-8?B?N3JOakdwZzRXNVp1Y3Jua2FxNzVVRkNSL1B0OWRyVWlVK1QyVkRSWldtUllw?=
 =?utf-8?B?UUs5T3ptZVlQWnJHb1lzMlMvbE45bWlsVTc3Zyt1TFFkLzVVc1UzclQwVmpY?=
 =?utf-8?B?RHY2MStmWk5wWEp1bTNFQmkyYnV0ZnlqMGs3Q0RmSDh6TlkwYytqNlpNakxu?=
 =?utf-8?B?VWVBYVVkdW9XM3hIMlEwWElLSjBxZG9DdEVhZGRSU1FIOHlmRlZxZjAycURI?=
 =?utf-8?B?REhmSW1ZOTI2R2xOcDlsOGhGSmx0dCsreVQ4azgrbHdvbEkybGUvZ2U2dUZr?=
 =?utf-8?B?YUtoUnh6eDhlU3Zrc1ZhMVpObGErS0U3eFRWN2RwTWIvZTU3SGFjTy8yRU9h?=
 =?utf-8?B?WThWYnpzeTJYbnZTVDZnTE1reUhyelV0TEkxRjFUaTU1TFdkcFliUDBZUU5H?=
 =?utf-8?B?dVUzb3QxMDZOSlJ2eTQzdWlVU0s5NS9WZHFaRzR6ZmZxYXJ4d29xZWZqSXds?=
 =?utf-8?B?bGJsQTRGRlZwbWRSejlNUlAwNm1VVkZRZFVUTisrc0I1NnBoUEhhbTg3eE9S?=
 =?utf-8?B?VGxEcGQwYXJkakJ1WkpLQzI5SXd5b2FWN3VuRUtGTlVub2N4UHFsZXVLbWJN?=
 =?utf-8?B?ZmZMZyswM24xUzVQQUpJUmxEVzZoTEdVQzhRQWoxRXphZTJaeGltTUwzUlZK?=
 =?utf-8?B?TlMyMFdwcTlKNkVpNGltK2haR2JjL2ZHUUpRWW8vM2duQVNWenVNWEVCU29j?=
 =?utf-8?B?N2NSZldtYzN5a3VELy9qSUI2SVpNWmJHYk5IZ3VpUVowelRVUHc1N2wzK2pa?=
 =?utf-8?B?TzJtWDdXQmVRMWs1WWIrY3VsQ2tIbmhZc2k2RFUxMXN1U0p3cjdZb3gzSFdQ?=
 =?utf-8?B?Z1JTM3VqaWp1bTlnM0RtTHh4Q0RhQUFTMnpYb3JVRFlPMWpPVHh2eWJxdWpB?=
 =?utf-8?B?d2U4anh4V2ZzMUZNN3BIdWJVcDFIVWs4YnRiaWE5N0o4TzFqSnNzT2ZGeGNt?=
 =?utf-8?B?TW1pSC84MEhNTDREYWo2bEEyUnhIUEE3N0RoM2wwUG5uWGRleGhKeHJYMlFW?=
 =?utf-8?B?NHQ3VDZlSDJKVmovaWludTkxcjVBbTFSS05OOEkrVlhRbmdSK09WTXNiSHQ0?=
 =?utf-8?B?VHhFakhFWnZOZU1OYlp5QWtGdFdlNHV3L2l2WlpsSGwySU1aYjNDYktXUUR1?=
 =?utf-8?B?ZFNDLzdJbllaVFY2Y2xicEZkTnVYUGVXTUowQ0F5MDkrbUZ0dFdRcURMTndk?=
 =?utf-8?B?ZWtkd0wwVUExUi93cUNDQjA4YTNaaGRhRU4wa01paWY3TXhQZEN5NUhGRU5x?=
 =?utf-8?B?cDNwV3hLY0xwNmRYREFXallvSU9aMlErTXZZdzBsNUI1TE5MU2lIQ0xMaTEw?=
 =?utf-8?B?SDNsYWxzcTExbnhsYS9xdjNSR1RDb0RtbU5CVlViRjV1alZJN1V4T0V6bUF0?=
 =?utf-8?Q?aTUVvAot6UqG6HQZxP2DNtM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVo3a1Q1Q3Vsd2pocnJOWW1HVU1yY1FRc3RjRElldUFwU3RBOUpMaHM3UHgy?=
 =?utf-8?B?blhrZ3dIeGxSY2VjcHhQcFU1NWR6d0tIZjJyeTc4WEtIdEN1VythL0t4SWVF?=
 =?utf-8?B?WUlYcE5TUSs3YkZrTm5MN1BZMytQTXdwRzZ0ekVWUkZRL3FDczNBZTlaeUYy?=
 =?utf-8?B?MFZDeW1tcUsrTDZKdFl6WCswNlY5UmpOcDZZS1VrWHJxN0FtbDdZSFgyTjRV?=
 =?utf-8?B?dnVQQzFPMTdncVNmdDB2Q2xCcDQvQWgvdXJoMzlMUWtXZmNQZXlPc1laMzZQ?=
 =?utf-8?B?YmtDOEVITDBKVHpERi9qRDA2alB2TnRuQ2s4MlpNTlU2QWFpdlJJY3NGSHQr?=
 =?utf-8?B?UmQxVmwrTDRrcEd5V3Jma2RvdWM0MGpPb2NhM04yMTJzV2daVVFLdHhBTTh6?=
 =?utf-8?B?TnhOUkh6MFZKblZvZDJPTUduS1pnUTRRMUVZVUpyNlZBMDBxWjhmaFZXZkhJ?=
 =?utf-8?B?bHFFblFLNGJVVlkzMElNWFZmamhDQ3dRU0d2bVF5TGlaSjEzYW50NVBxdXlK?=
 =?utf-8?B?U3BUaHBmVzdMdjN4dFh0STRWWTR4djBZQlBqNGIxVE1TVnRMMzRXWEs2dTgy?=
 =?utf-8?B?bmkrbFpMQmJ1bU4wN0k0Y2NhOGExdlAwS0RUWk0xWTczVUxCbUU1Zkdqcm51?=
 =?utf-8?B?NkNhM3RzaUdhVDc2N2pGendueW1LSEZiR2hjeFg1MmwvM2c2dmpCdEp6aTVr?=
 =?utf-8?B?RDNvS09EbDFFSG1iSjB5bE1XanlLRHYydk1qaFlOLzE4OC9BcnJKNE5xN2NN?=
 =?utf-8?B?aEhtOVlKWldmOVFCdVRKekRkM2dCaHJiaHhkUzJ2OFpPbEwwSVZFTk1oOUVm?=
 =?utf-8?B?OTNOdlJCQlFiZkFJMkNBS29JcUJPNTBNZnY0dXFwb2xEOHhybUlEWGxyN0pI?=
 =?utf-8?B?VitEOGM4amJYVkE2RmtjVXZtM0hGUUtFU2w3S0VPNmxXc2FJOXBOcy83V01C?=
 =?utf-8?B?R0FYMEZDSi8vdU1tYnJjNGFjRGd2dmFpVGFycUZyL1B5amZWMmJDd1dVWENp?=
 =?utf-8?B?K2t6NzZXRndkdHZjUGNHRUIzTi9uUHJWT2t1MnNtMjlWdGtiL05Db3JIYkla?=
 =?utf-8?B?U1dFM1pFeFFZWnYvMjlnZnFpZnVCRnJaaURwSkg1bG1leEQ1c2xhVGZnNDQv?=
 =?utf-8?B?MGZTOXFaNTZEbUdYNkExOHcraURLRTBNRDkrekJvcFlOVE9RTTdWWlZseTBW?=
 =?utf-8?B?WXB0S3JxYy8yUThGdnR1OU04eGhjcU9sVWVBeG43RWJYZjdhK2hSMmJ2VG1o?=
 =?utf-8?B?ZWtIOURaT3BabnAwQlc5ekRoUGIzbDBEL3Jvemw2U0FlNHZ1RVV1MTg5ck9o?=
 =?utf-8?B?aDFnMEF0dmdYU0hWZWRaRURueno1ZGxFSG1kNEF1bUZRWTRkVkt4Ry8wY042?=
 =?utf-8?B?dFlkY25HMjM3Z2ZsZ1FwZHcyVm9CN3BlNU1NclU1bkhpY1hKUUtVclkrS0V1?=
 =?utf-8?B?UkxKcnI0dm1DR1ZnUDcxdkFMd1dFLzZubXE0eis4N3VYQ0J1QlRzNFF1bnRY?=
 =?utf-8?B?RERkclU4bXVLTVplSFFxV3h6U3Z2UUR4am14cVliUHFITTFrbm5PUjd3VmxB?=
 =?utf-8?B?YVJ0Y3FrZmJFN1I5NnZ6WVNiQmNIVlFUdzI0NDk3eS94elJhLzRSVTlnUnNt?=
 =?utf-8?B?MTY4M1hESmFJbnpETzhidWFyc2FIQWFVbHI0ZEdPc2tReWhuM3NHWkV0cWpu?=
 =?utf-8?B?cS9CYm4rVVFBcVhtdDlUa3dJWHlQalluWjd3RDh2Q29YSUxkQ2Fnb2xTZ2hO?=
 =?utf-8?B?VVN3REhKQnRoTzUxMC9hQ0l0aDRCKzhZdytmTVpyV004NWdrTGZSOGtBTzdM?=
 =?utf-8?B?YThQdFV2aGw4OTVjV2loOGtsVkFzYURObzdoNDkzcTZheCtKamJBVVRMQ01j?=
 =?utf-8?B?bGU0b3dYQ2wxbEFBMVZYSklDTW5QSmtJS0hFbEh5aHA5N2UyR09wb0lpNlgx?=
 =?utf-8?B?RmFmZzZMMFZRNHFPZmdXOTBrdXk2R2U1a05JaFZXNnU1cVU3a0dGbTVtT3dD?=
 =?utf-8?B?bGlPZXV5ZWRVYk9KMmZJcVVUdVJlelQzYno4U1AxdHpaTjdCUkVmeVAwL0E5?=
 =?utf-8?B?T2tQcWFpaklBeUhxSUJnOU9FMmNwdkgxKzlpR0MweGN3dzFtUUgydEJxeDNE?=
 =?utf-8?B?U1F5QTRESVpmaERjUnVkQW5PSnorbUJsMnl5bURESklQNlBLUmxoSnZDaEll?=
 =?utf-8?B?TWZPRWhpc0VyUVVMbWVUd1gveHF2WTFCbXRnaTZodGRkTlNPVkZUcE4yRC9Y?=
 =?utf-8?B?ZnZ5cnhkUGxmUVBXMFFIWmR5NUhrZ1Z5dENHcDI3WHlPUUVLNVdWL1l1MlVo?=
 =?utf-8?Q?vsOGRuPzFL2jqIF+7s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc1f764-00f5-4847-4dae-08de694fcdaa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:27:40.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5nxpfWewjXUyiczgxXX1yXoJpzTFg4wiIvzBYuYdTf3DYH2vJaFVTsETkTMGrTm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12020


---
Changes in v4:
- add dt-binding patch to document dma-channel-mask usage in the fsl-edma binding.
- Link to v3: https://lore.kernel.org/r/20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com

Changes in v3:
- extract the imx95-19x19-evk-sof.dts changes into a separate patch.
- Link to v2: https://lore.kernel.org/r/20260123-b4-imx95-v2x-v2-1-0497a9814668@nxp.com

Changes in v2:
- modify imx95-19x19-evk-sof.dts dma-channel-mask property.
- add comments for mask channel.
- add Reviewed-by and Tested-by tag, tested on MX95-15x15-FRDM, MX95-19x19-EVK.
- Link to v1: https://lore.kernel.org/r/20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com

---
Joy Zou (3):
      dt-bindings: dma: fsl-edma: add dma-channel-mask property description
      arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
      arm64: dts: imx95-evk: update the dma-channel-mask property

 Documentation/devicetree/bindings/dma/fsl,edma.yaml   | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi              | 2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)
---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260120-b4-imx95-v2x-3e01c7bc6881

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

