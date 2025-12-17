Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FEA349B17
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990254; cv=fail; b=EpIkCqIBJ6Uo+oyhubudxjzzgeNO+eKhPJi7/IznsKWZWSy2sWK4dvEGP2ovsizwSHWKu0xd90cKuu+erDrM9U4QZiJTZm6NMNINaJI0AD25BpVl4X+8BkML3/nkJErLUwKdhBrY3fJEYerDudQsTdRgJ4ZVUKfxR+1L7FaLnZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990254; c=relaxed/simple;
	bh=UtkYqW+9DJ7jC8fjBm5u75tvVTK4UPrL/GWpbIED66s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sWT2vKA2XfF9RULJV4tj2Ez97AblAMliFYIvuqD/9KeZCjoI5OrNul4nHsSu5p+WE8j64+DLrIx1z16a3wxzyfgGGMYzgIUjT17KJfQDAkqtYvCduH2ZAoy2Vrhw+mAeESXIcuW2U4pPxT8qS4ek3l3FdJ0x7vJ6bRyycc6dArs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IdLeRdiY; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IdLeRdiY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCQI0DSOFD/j0HOkD/Pkv6ssPIC1jjOQL82PcIZwI55CXtJtRvW7MFJm6Aw7jxL9V++watJJupqFzrqVLH7XrbruoptFphGvzFNh7a27gKU3m/VTW0RqiEmAOxumsu3RCiAH1Wm3R3Uwmn6Yy7AFVW6kCCDNP7WjNH3C6ChValpsbNzEXklB2SULWFBpLB2xqL/nhBmJ3aPke2ajIUJLQgHOxiJALRVlbEgJw3MccpHtZWrI9F16vpIq/CZrnLJAltQk6CzsPbFy25aNLcmhdJgks5Ok3Pu3SZXt8orfIL6Fl/TmUH68VHWRyqw0eCv2P1GDcGTU6LnSsHO98AIpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbH/XymzQjF1fgITNft2bKeIc/lnONp8IMCcgE29VkM=;
 b=GrBIGbiT3rG8Em6awXdwfgD3ZOkH3X6ZNXqP/QqcFDtaXZxpXCtMU8HhGQCLJk05VPRr7dxbhiQUUXVCXtf27wU7Tgcvj53dlhTau4DKsGzfOSZgwcy+DrvuU+5P6HQKimHfRHZr5VD7El1hwtwQdcEsESh3cOz5mxBGi9fBF6R2wcotFy6SHaZcOxDhMGBBT4a40fhGTE+n2iT6/QymwA3EGv+JFi4oUTunx6dedIYvPK09rmfLztnBSTTS9lRjzqDKRyq7hi0sm1M0VCEisvHGG3s9yS7WNMhloUMZm52CjhTcKSe6qxG8vbWP0aXXog2EEIIXC8Mlzdu1OPknNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbH/XymzQjF1fgITNft2bKeIc/lnONp8IMCcgE29VkM=;
 b=IdLeRdiYxHW3lOlQYqwXEzY4holNn4fTeRbAVgFmZ+kEwo97aig0WmA9UZJRj1RQRWSqYmTJhm7YOAUV11mr6gO2jG1xBzLbKK2nA1QJKVhZ6I5NZMuHAc0crlfszwcTy3+Q+zGp3CmwjRStivWtZurSznxDgwpzUUDXpUfVHuyl0teNV5XB3+8H/CsTZfR7FJKhUlEVGbUH7VXx16XunMMzeDitjz/StMuxhp1EKQa5JAH5GIWCXDX3RBTFYr2dq6ZrB9ax3d89msGV5W5BmDt5Q26z0vhWQ6m6f1xMntfub9HN/q28plF9so+5ztUu1WjwiSjkAFbWghWiVyBz+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 12:42:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:42:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 20:42:07 +0800
Subject: [PATCH 1/3] soc: imx: Use device-managed APIs for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-soc-imx9-fix-v1-1-0c763c2dbe29@nxp.com>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: da0cd01e-2006-4e59-4358-08de3d69c236
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3BYVUFRSEp2WkI2VjQvS05ab2hTb0pSR3pxMVpjSWxZQ0Q3bGFLVE80ZUJJ?=
 =?utf-8?B?cGZLcGk3enlHZElsQXZCb2xuRkg5SG4zVEpUN21UUGw5SzRDSE52NGx0bGZr?=
 =?utf-8?B?WVI3eEduMkFjVnFEVjlpeWk2dEVvQmhZTlBYM0E0dE45SG1pWnpKSzBEM0t0?=
 =?utf-8?B?RXEvRGlwZXV0VW9TR2pQQTltUkxXS01kdW83TTRlaVdBeDVqTC9EM3c0eWc5?=
 =?utf-8?B?djFtVXdpRThvWXhJenYxQU50ZVYzWTdTeHA4WlYrR21qYXpGWkkya2x6YS9p?=
 =?utf-8?B?d1JyZFRUUnk2d1hQOE5PSzBXaTNCSFEvZmFqRDR3eEtHU096TysxK2NFRnA3?=
 =?utf-8?B?Z3JHV2hLTDdSZmkxZ0RQK0tVTC9PSDFzRkticUk4ckNWSG1zKy9xTUFsRUJ2?=
 =?utf-8?B?Qm9WYWhsUTNEUjBRT01LalNkdlhOMDFtYXZYRDl2bEx6SWg0ZEIvRUFDYko0?=
 =?utf-8?B?YkNyMUJFajM2UXoxWFdlRTZCZ1BJdDNQN2JZbEFPLy81UXAvSUdJVnBIcXlC?=
 =?utf-8?B?UHdFK05tVXYvV3NTNXk2b3VNdndNZFN5dzFaTUhQVW0ranNQdGlyVDZ0Y3d0?=
 =?utf-8?B?NDd3dU9mek9CUy8xUG40eGhqOEdqYzd1Q1gvZnNRZHE5akZ0ZmdSMm5YeXhO?=
 =?utf-8?B?ZnlaSnh6enBQUDdGZ1JzOFZtWThpaVRQcTRQUG1XVXpwcXcxb3lwZXlEWmVI?=
 =?utf-8?B?MkNjSFhKYk9XN1dkTHh5dlNEaFBFdjVKQkRwZ3V3cTFpTFdiclNScnMvNFRG?=
 =?utf-8?B?dUJyVHgvWFQvT0l3VTBway9DTEhjZXVybFo0T09ZbnJ4b3M1UXF4SDcrUGph?=
 =?utf-8?B?TERkQWtia1NsZElUZzJDM0dCclBYWVJVSk9aVzVIbU81REFEa0h5WUZZVzZa?=
 =?utf-8?B?dklSblpYQjdLeFRNNVJ6YTgrdXRoaktFZXpyQjQxMW1Za2o4bncrb1NzVTZD?=
 =?utf-8?B?VTkzbmE3ekMrRnlCR2xFQitxcVVXdkM0SFY2QkhmMmRzQmNNR2xoWVkrRUlQ?=
 =?utf-8?B?TTNPTi8zWXFVMWM0Mzlvbk83TUo4S0VuK3prWS96cFYwT3JSRmZhNDFpUFF2?=
 =?utf-8?B?V01OUS9IV2hKSFZoRkFkWlN2a2kvdEMwUk1iM2doWkp0eUVsSGN2ZFJLTmc4?=
 =?utf-8?B?clBoNDY1RmlpK1BtejIxOHVBZ3Ixb2pEQkZpOFl2YXdGckt5Q1pybDlBcjJx?=
 =?utf-8?B?Z0tjd1lkOHloMzZIdlBjeGNPZ2YvZW9weGl2ZVNPQUVhcXdtdGJjQ1FEamJF?=
 =?utf-8?B?QjVDbmNDS0h2UklVeHozS0ppMVdRcWJ3Nmd5MDEwRm1KbGpvMG03VFplMlNj?=
 =?utf-8?B?ZXFWUEVnamlHcDFMc1JZeVhEMEwxcUVrMHB2NUtlT1dQdjZYZEVmQWpCWjRP?=
 =?utf-8?B?MmdNRXE0RVA4NUgyb0thV2tvKzRjTWMwbE9RT2RaRDFCbEs5UmxKN3B4aWZs?=
 =?utf-8?B?UXBERitEMWg1dktnS3NwV3lQTGpLWXlxK3N1U1MrRk9oMjFhSDhVL2c1R0hZ?=
 =?utf-8?B?eVVyWHc4eFVFaXEwTWVtRzE0c1lsVVpZL2poemNETUtkb1lncnN4ZUpySkM1?=
 =?utf-8?B?bzV4TzRVRHl2cXMvQ1FkcDE3Tnh1VDE5UXYyZkJEaENDQjBRTzZOcnJHR21o?=
 =?utf-8?B?eUNzRDZkMWFQYmFpb3BKcGFvTG9yZC80KzVLa08rWDdZajZLUmRISnJGdWdM?=
 =?utf-8?B?UHUvRnRjaFdSZ3JmR2JPdERtK3BZVG5OYk5aMlJhREsrVHdhNVRkTSszblFa?=
 =?utf-8?B?STkycWhzdmxodU0zdGZyZ2ZUODRkTVYzM05xWVJTbUIxV29zQUkxRHJzLzRK?=
 =?utf-8?B?TUhET0FMZU9KTkdBK0RYU05CN29XdnlZVjVMaWZnSmQxdDllcURZZ0w4VTBv?=
 =?utf-8?B?TklOWWlkVjhXUU41djhycENmanIwZUtHeTV3SytjRzR1Z3ErMjRXcDhnN1Z2?=
 =?utf-8?B?Qmt1OGtMRnlUNTBNN3JNYjZCTHRXT2o3cXJwUFdDYU55aTZzQWs3cEZqbWps?=
 =?utf-8?B?Um53M3MvZ0VOdFAyZzFzZW1sa2tvSUVNNWdKL2w1NVBha2xjQzIwaGFKMS9K?=
 =?utf-8?Q?23dsUr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JhNU5uZUYrUnlacXd0T09DNXg3UVBQZGE4Y3JJbXZ5Umo1bE1WZHM1T0ZM?=
 =?utf-8?B?aHljMWxBMHVyMUFXbnUyNTV4OWNLTTZITzZYemFqdUd6L2xHbUR4V25HaTdm?=
 =?utf-8?B?eEV3RFQyK1QraVBFelVzL0dqU05lZ2RuZTlxQkRRV3lrMmdHTTNzVEswTmdQ?=
 =?utf-8?B?YThLanptYjllWUUvYVU4cWxnOHMzaW11RGcrcTNpVFNlNW1teW50b0dhdXVq?=
 =?utf-8?B?SjVDZ0lIaW9NcUZ0T1V1bVMwbmRWODB5cEhCUHBENGJ4ZmhHalNoeVFQbk9j?=
 =?utf-8?B?TDlZdmlZY3BFQXZYMWxaQmoybTlzeHVqSWQyQllDeUt2NTNxUXhFWkhXT2FX?=
 =?utf-8?B?WTFVeGlDaDBEWkdSS0hrSk9BUTQxTkEzelQyNnhORUZaY2N5TjNoTWNSb01i?=
 =?utf-8?B?cCtwanFTMTBGMjRYRHo0RU0zOE1YbzE0dng3YmRtRHMxeXhYTGpKMnNRV2pm?=
 =?utf-8?B?T0NJTGN2TFU0emcxQnYxMlQ1OEVQRWg5MHhjV01YU05HSGx2TEpiZlZiYmp0?=
 =?utf-8?B?ZWNieVIvaGU4eFYyQXlWL0FLSjRoS3BreFNaOTc1YjNEdzJvY2FIQnV3TDl5?=
 =?utf-8?B?SUU3MHprWXdCVzhCRkdUa21heXVCYjdSNHhpUXFzMWlQU25qV2M5UDhOWnZQ?=
 =?utf-8?B?djNJS1FLbXd1U2VMeGVMNmRGSDRldWpEQ0RPd0pQTlUwRFNNWVNzR25sd04w?=
 =?utf-8?B?S3N0Y3hVUGdZd0xHOGN5UC9leDgvUGdaR1Mwd2RRcEpjdi9kQU90ZnJrVjJy?=
 =?utf-8?B?QnZNd1FYL29LdndQNUY3UkhqdzEvcHJnUWFYemt3MW0yU1l6enZ5c0ZOK3hy?=
 =?utf-8?B?ZmZqWTgyT3ZFVG1zS3pNTzBsamxNY3cwMzRmTVpSOG9vSHMydStoOWp3OGd6?=
 =?utf-8?B?QWx5VWVSUERkbFp0d0tHWHpZQmltWFEwbCtFbWZUWVY1czlEUFJtMUVWUko2?=
 =?utf-8?B?UDM3Y2JOL1BrTDlJZ1I1Zm5iVktlODljdXZ6NkRpMTBvQW9PMGZUYVFSdE16?=
 =?utf-8?B?ZkVuRnRabkxuaWhEY1JEZ0ErVS84RGNjNmgzenNIR0hoemxGRUs4MWRGS0Ry?=
 =?utf-8?B?SnJnMDZ5cEVwT3RhaDRJSjVteEdqV0VZR0hkSnNPZ0FlbzRYN29TcWFZcVVz?=
 =?utf-8?B?NUpNa2tmeDlrMVI2WkZ4MDRuVTN5OHJ2aDdsS1ppckZ0cDhxV1VaV2RBZkVJ?=
 =?utf-8?B?VHBHN1hWQ01nVTYzWTVOL0EwN2tGWXJGejVzUjNSTXpDcnAvRmhOVUFjZnRU?=
 =?utf-8?B?RnRBRnFFSmo0MURUaldKV21lbFJqVUY0MW03cGpHNHA0QUlESmNsbmhsS211?=
 =?utf-8?B?QnRBMS82WHJIdVVid1l6SkM4RXlNbzdkV0d4Sms2NVRZNlg0SHh6Um9PWjRm?=
 =?utf-8?B?NWlWcWJVK0ZyckpQYSt6Q2lUTElkK0JyQ2ZYQ0ZXWitIa3gyaVdsRWtOVEZK?=
 =?utf-8?B?MDc2TWZnc0ZGYk1UOWRyUmpNdmhNTms2aVZpZ0JiSitEZHU2aVFvMDlnRUtK?=
 =?utf-8?B?ekQxRFFkNmhnOGpkcnFkazVRdGlNN3pYdk5wTkZ2dzhHTlE0aUlDeGtVelJ4?=
 =?utf-8?B?ZUtDTE1XUGhmdGFJdU9TR2VXM2xjazNkNUZiR2Y5eENoMHZDMFJXSnlFUnpq?=
 =?utf-8?B?QWM0SDR0bGI4aXAyeVJBVDlmbjI0c3pMYXZzeXpTc29zclFDMXdpT1QrMURu?=
 =?utf-8?B?S0NaNDh5V1JlV0x2ajBiYzNPSFhER3ZpekRwWjZZRTNQaUl2UkJyZlAvaXl3?=
 =?utf-8?B?VlovWFFKSDUzc0sraWxTdUk5SjYrRlptVzk0QXJUNFhYUzRkdW0rZTcwMUdj?=
 =?utf-8?B?UWd0M1RNM0p2TS91cUtuMVBxeDVMY24vaGMyYXkxc0hObHcvWVNxY1NKZnFs?=
 =?utf-8?B?eTdDUHp1Njk4ZWhPeVpuTTgyOWxWWnU2bVZybkZKeGY3NmorT3orelVOVTRY?=
 =?utf-8?B?OGlqKzRXYjVzSjNVNDJlTkd6VDVtQ24vVVNtZU5DOHF2RldiUGZtRm5PMUoz?=
 =?utf-8?B?cVVVUFR2TDdYdVpsbXFMY2U5aEFxY1hsZUdudk9NYWEzbXhZU0ErUXg1N1V0?=
 =?utf-8?B?dHFkRTY0Y2tobWlYSnIxbnBHcE1SNlI3MGtOTDdsTTNyOTI3MHhEUnZDU1VD?=
 =?utf-8?Q?YwJ29E5d2ClyPF/wxZi+M04bL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0cd01e-2006-4e59-4358-08de3d69c236
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:42:37.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GcSA55eGtOnJL/s1NPFE/DGKzLE1gaikhfm+oXHe0jTzENWN3L+x37bEmOzCQc70JAw71YDDReVVOUaLT1XnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508

From: Peng Fan <peng.fan@nxp.com>

Use device-managed APi to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx9.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index b46d22cf0212c3f40f61ec5be85ca11e5d3207ac..0b1c59c7ddb244549bfeedc47ae6e8d83c20b39b 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -18,6 +18,7 @@
 
 static int imx9_soc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct soc_device_attribute *attr;
 	struct arm_smccc_res res;
 	struct soc_device *sdev;
@@ -25,17 +26,17 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	u64 uid127_64, uid63_0;
 	int err;
 
-	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	attr = devm_kzalloc(dev, sizeof(*attr), GFP_KERNEL);
 	if (!attr)
 		return -ENOMEM;
 
 	err = of_property_read_string(of_root, "model", &attr->machine);
 	if (err) {
 		pr_err("%s: missing model property: %d\n", __func__, err);
-		goto attr;
+		return err;
 	}
 
-	attr->family = kasprintf(GFP_KERNEL, "Freescale i.MX");
+	attr->family = devm_kasprintf(dev, GFP_KERNEL, "Freescale i.MX");
 
 	/*
 	 * Retrieve the soc id, rev & uid info:
@@ -47,39 +48,28 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
 	if (res.a0 != SMCCC_RET_SUCCESS) {
 		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
-		err = -EINVAL;
-		goto family;
+		return -EINVAL;
 	}
 
 	soc_id = SOC_ID(res.a1);
 	rev_major = SOC_REV_MAJOR(res.a1);
 	rev_minor = SOC_REV_MINOR(res.a1);
 
-	attr->soc_id = kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
-	attr->revision = kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
+	attr->soc_id = devm_kasprintf(dev, GFP_KERNEL, "i.MX%2x", soc_id);
+	attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d", rev_major, rev_minor);
 
 	uid127_64 = res.a2;
 	uid63_0 = res.a3;
-	attr->serial_number = kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
+	attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
 
 	sdev = soc_device_register(attr);
 	if (IS_ERR(sdev)) {
 		err = PTR_ERR(sdev);
 		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
-		goto serial_number;
+		return err;
 	}
 
 	return 0;
-
-serial_number:
-	kfree(attr->serial_number);
-	kfree(attr->revision);
-	kfree(attr->soc_id);
-family:
-	kfree(attr->family);
-attr:
-	kfree(attr);
-	return err;
 }
 
 static __maybe_unused const struct of_device_id imx9_soc_match[] = {

-- 
2.37.1

