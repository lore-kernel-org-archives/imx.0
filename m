Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B23E9F6C
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082688; cv=fail; b=Ui7QKb633L80oUhOrKS5dWnBLyZsS63yVyjZPo6pJWVj7m7Lid4VCPH9LP+S3vxuf3UuL7HoU/bZQ1UIHWL/6giIlk0BppeMnP1Sydf45unGP8b7FS+L2Fppmxcnb5h+dj3HDJuKyUpBqMyeJuNzNRyqp97h/opcP9CiG0qNZdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082688; c=relaxed/simple;
	bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rHbzjlXryjCVE+CqWfhRccbxQMHc+C4Cmcx5Avi3EBgKpV7iLLE1zOwsblpDFzDNnCd63it+V/Ip1GKooOju65X8buFFEzN1Z/Q5CVjLpRF+FsVe6jfDUFLCFH3DLmiZedaHFkiwOsOcDc7nlIeNcKWf/O33I46lTnl3RGXz9E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m/QR0+t3; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m/QR0+t3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSLr53j3xf3wKDhkMpmUtWg0NOfn9UJlqh4LA7SBLa++ImcvcSdt5latR7Mh1O6htL+JlC1+ErXTLusR/R4GoN+zi4c9JXAwnFyD54CIi4dsucQ80BjL5q69jYMtXEvAidxlwmZMFYv7A17xYSPHCiHfO7EN7aQ5AiEEpx46qcZohalWIIzq3Y3+XMSaOVDdyhJ1doRjh8b09Bx27hUD8DLth6aqJ7FOpIVDlMPN7c9LBSg+x1AVpmA1DB1gerYIwrQ+xBLZopF99a3We5cfzgLdj06IqEvPIEwwCdU/EK4N58VV2ExWJLiZZazJhyqPEW4PjZjoxzAUy+QwkPqMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=WCJMp1pHKz/u5+RqRicxu96wr3RTxSPI4cuCeabXCVYRbxPJ9NnhVQoxd+y4rAek30SEtFinQz4PCNGoeL5lC7YwE7IuQDH6a5cR4spyGGTiNow6fJb249mC7cgXw1nIiG0PSF4eSyCMamFeILuigBrlQBuWNWY6IgR5sO7TpMKr4oM0v8QvyO0YuefgMWDm9YwTCXCfQlJ7Ph9Kdi9ypYbwc0i5aXac/dLzmUK/jdWwsEdEOUxHsJiCs4VjN68R6XgkoIbRomp/SZqdj0nHSLbp2RnjF1uVjXABh1idkMs+DL0VUhzPpSwj1u29Sd2QCj2kMfu5PSou4dLFK/T12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=m/QR0+t3wBmN5d5KKUsxgGhVkHkYiFjQhrzbQuJkcAFw2PnVyEDeWH6ym1t5prn2JdiZYtV2XvArJ/vgyAHOfTQqHxCWRfmGhP9PGz6psVuUO1yysnF+/LiQaE+cCC7+1GLPudA4p8us64Cnt0VCLcRY7Wo9Yq9/eBqBJostR4e7FYWzgjGmu+0TYXuSPgX4zPrmd0KKVB1CRCI9kBvHoZ+OvhaPpY6KOwYS2NnaN1zY9vRUMZrf1yhQKlMzOuzP+iG4xQNA2x9sfNO/1gaJi8EwwmGZVyNFWAmQ+0MJAsM2FAuz0EyveZT+4f/ZRT1MRqZuRWHsoJ2O4otFKaj6Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:51:20 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Thu, 22 Jan 2026
 11:51:20 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 22 Jan 2026 17:19:18 +0530
Subject: [PATCH v25 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx-se-if-v25-6-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
In-Reply-To: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769082570; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=fPqwPPDi67fQdppN8uqgH+DvqqosoG4NhVRkwUKPP/ofXiHeFCnbcPMxR+cxiCQh0Qb1UoIY8
 dQ2DlO8tKxNBO8juXndi3Lj/o1gPlXOEfA4Lab78lenEcFetFHQr7mV
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GVXPR04MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: b37940fa-4865-44df-81df-08de59ac8ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tjkwa3V5TlovbUZjWVFySitiYmRtbVFtNFllRmtza0NVbXZsbFlibDdLaFBs?=
 =?utf-8?B?UldBYmljNzliTlVpNmE3SG5hc0FtODhVbDZsdlhiU2QvYUNJeGovQklMOEY2?=
 =?utf-8?B?RlR1NGh3R21ZMHJGOGVZUFRGaU1ZbEVWZ0g4TW5wR0tEdVJ6S3dTTTRydUpk?=
 =?utf-8?B?RG9UV1A3S1daN2IrZ1FUTysyYTlDZVhyU2k0S1cvN25xZ0VOdyt5dC9MbTcr?=
 =?utf-8?B?dFB3ZXZvVFVpSDh4bFZtZGxGZ1N1NVFvMEk5UThSSHE5ZWF3LzI2SVBNNGto?=
 =?utf-8?B?ZTZnVkFFKzF5NUlMMWFLK3NWb21CVzJOMjM4RW5EUlBQYThybERGOHd4NXJk?=
 =?utf-8?B?UVZBelJZSmhDQzNjbFpZdVpPK3hQMDBSMUlBV1ZuZUR5MUtVZmQ0R3Zxbi95?=
 =?utf-8?B?MzZuOWlWQS9lZSsydDRjVTVtbzl1dDZIaTBOTXhYWkppN1YwMW5kVy8wbDB6?=
 =?utf-8?B?eWdvR3piRWd3d3hSRTRsWVRXLzNUVkhRQXhFekM2cllkMGdITkNMNTFDVXpj?=
 =?utf-8?B?TnlpdHk0WDIySWVCd0pQQXFDNm9WNGk4eDI1bmp0K3lyNnRYQmlKVVQ4eU50?=
 =?utf-8?B?ZDZjSytUMXZFYWt4aGM1NHdCOGtZZUR1ZTFkR1JpKzJIYUFVZjlKT1lUNTQx?=
 =?utf-8?B?S1QvZVNCZ2Nzc3lyZnFJQTRESHhuUzRYS2hOdkw5NzduMFk2eVZ4UnhBZmVS?=
 =?utf-8?B?ZkRyTytlNk10ZXJpSWxlK1NSVFFHenVqNVhaZFdYL1ZmcGNkYVVyTlhCSmZa?=
 =?utf-8?B?ZzNIN1pRcmdQNFFEL3RkNytKclZ0Qnhmc3JRNDBOc3FvdFpiOGlLaE4xZ0d6?=
 =?utf-8?B?d0dDK2NWNExUUXl4MURtUDFoOXFNNDlNWDF1a3owZ2VzMGVBb25BQlZ3dGVN?=
 =?utf-8?B?U0NZckxOdS85ckFYWmgxUUt1OXU5KzViVlR2WTltVGFyUms0dzVodHU5TUdw?=
 =?utf-8?B?Zk14cWlXWkVaNi9vSnBXTENwcFFtOUgvbEllb1R2Z3VzTGo3dXg5UytZZnk2?=
 =?utf-8?B?eTZhM3FHUXJReXoya0drZXEwVDhBUGNhTGRaRWJ0cUxheU1JSmo4OENUaDRt?=
 =?utf-8?B?a0xhSmtETGpYOHpUQW0zWEw5YTBSNk9VMU02VzlPL3dLcFpOZXg4aHNrOUxj?=
 =?utf-8?B?UWc3M0t1RElnZE1FZitLL21hYkRYODZZRnptY2FFTFFrV1NrSW1zT2kwZWJ2?=
 =?utf-8?B?S2lwd210N1N6NEk0TUhrMG5TcGlQRHBPUWNKOFlxSEl2OTRoYS8zZFJKdFdL?=
 =?utf-8?B?Mk5YZDl2andQZitmSC9HNHQyZkR3dHVBeHdhNVVuZ1VOWjh2c3k3OE9TYjVm?=
 =?utf-8?B?aFUrMVkyN1VsUFcvWmFLaDRSRUJEOGlNSEtXZi9UMGpUUU9NWkduS052QUkz?=
 =?utf-8?B?Q1NXNENDNllhZ3pWOFRqU2tBejFFV1BsQjNTRXNwOEc3NzlIQjJFM3NNeXRI?=
 =?utf-8?B?Wm45d2JmMGg5elFYZTBzVXVPUzlMMW1vWk9Qay9zRmorVW0rYlN5R0RTcTl0?=
 =?utf-8?B?ejFlWk1PYmFsYzhXQ3djYytDRXgxRUVNQSt4MmF0aEJldldFWVViSXVYYVUv?=
 =?utf-8?B?Qi9KbHUzb0xQOTIySEowSkxjUlQrUmdyL21VWmRSeC9mT08rOENPMUVtZGlk?=
 =?utf-8?B?RXRkOWVMZnplTEdlRVdkZ3RiS1Jmd3VWbVRiYURzVGs3elNlTTBpUXUybU8r?=
 =?utf-8?B?ZU9jQkNCSEh6NmhFRDg3d3lkbXlHZ2dUbXVGTURnMkorT24yWGRIeGxmWkM0?=
 =?utf-8?B?KyszT3dHei84bllxMmNWVmxzQ3ZiNTgyYUNiWFpuYWVFc0JVRGtRSDVrbjN0?=
 =?utf-8?B?UVRIbWZEeVZKZERDWHhacnhIYTVId3FEZzVOZWl5WTI5REM3bHB5aDJGNkxl?=
 =?utf-8?B?bkFuditUVUVjK2pOR0RQY1MyZENrN2l5dXpvd1djTE5SOHBVMGQ2Z1l1REZq?=
 =?utf-8?B?ZWpwaDd0NFIvNW11SE1meCswTVU4Tkd6UFhtZzAzM0Y2Rkw5azBIK1NFTFlV?=
 =?utf-8?B?SERFZERxWUQ0TU0yYTZ6Vk1CUHZJaXJIT1E4bTJGVFpBTVlTWlJxV0NBUitC?=
 =?utf-8?B?dUdKZUVlMXFBZTMzU3hhNW0xNldlN3c0eStXV0dSQTM3NkNJZXZQcEt2OG1K?=
 =?utf-8?B?NERJYjdQa1E2SjM0MnozUzFHU3JPUFVpM25RQmZSZklOSjI5MTc1a0U4UjQy?=
 =?utf-8?Q?S1AvEHSR5hEkUs59rmuceCg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVSOERLcXpienV5NTIycnpvVm1XeWdFNlRHTkloRkhJMzBwNVlMWVlWOHVE?=
 =?utf-8?B?V0dHayt0cnptZnpXU2w4NkF0WkpZcTVVdFVqWUlOM0NxYVIvUjdrS3Z6MllV?=
 =?utf-8?B?bVl0VFRTQThZZ1dPaktaNHFNNG9YK3RIVTdSR1o5TU9HR1ZqWUhjTjJSaHlu?=
 =?utf-8?B?TFh5VHVQV0dCVGtNTCtmbWdPalg2YVNHNGcwODhQQ2p2amRwRWpUNXNPc0RJ?=
 =?utf-8?B?WVZ4UXNKQnd6bURUU0dnbElWbERlUW43U0pOTXRpQm5nNEJ5K2g5dXR6UmNs?=
 =?utf-8?B?NzJlMWNDdDkyTXpkKzMzUUhVY0piT09tWG5jRTBDaFZRSHIxOXhrUzV6MVNv?=
 =?utf-8?B?V0hrbjhYY2Nkb1ZDMlpiSk04Tm4wN0FwWUNhZmhWQkxGQXpwalFOY0Z6WWhu?=
 =?utf-8?B?TkZWZzRXRFdydVRQNkRzNUllSzVJR3BmOVpDMUdmR3hTakFrbC9JK0VGM2lp?=
 =?utf-8?B?VzFLWUxoazVXY2czTzc3aXI0Wng3Uzk0bXE5azFZaXZ2L0xKT1BkQU0ySFd6?=
 =?utf-8?B?bzJZZi9XSjB5eTBXc0c3NjkrdVpCdU5IdUxHTzV3TUI2S2doTnF2WDM4czha?=
 =?utf-8?B?MkFVaVZweWV1cUtBL0VpS25aNUlpSFpxYmZqWFc0NGNqZVNOci8wYkh1UWlB?=
 =?utf-8?B?MTBWbC9wRGxRMVJKN0ZLZXRvV1VibkhwejZGOXVRb0diQzhqOTFOdGszQXF1?=
 =?utf-8?B?K0NwVGYxMGJwVFRJREVzS3JzKzZZcVpZMnpKWHJ6S1lVYXNMU09CNkpkWmZW?=
 =?utf-8?B?K2NOQXNPZ21scTFzb255ZEd1c3N3MndmN1JMYkxnb3lLYjNPNmRSdVo0RTN3?=
 =?utf-8?B?U3NZdUZyaEdvK015MmhJTFRUOFlZWnVHRUNNclJXQlpFZUtyRG5Qb3pBMS9G?=
 =?utf-8?B?TExNRnpqWDhaK1QwbnhsYVJ1NlQyMmZXNzZuSnBFMHpEVW9mWWFNNWljL2RJ?=
 =?utf-8?B?MGJZUUpIWUF4NDNaZWNLeDlHTmR2YjdjSVhPVE9sZE5IcmpmalhveGdmd0Jx?=
 =?utf-8?B?ck5MSURNdGdxdExZSTNqV1FBY280b1BwQlBLVmRpeDQrUDVkZTRRQzlBWWYy?=
 =?utf-8?B?S1gvek9Hdy9Yc1JURmlsWEdMTElsV2c4d1dZMmpOaTVHMFdJOWpWditHd2Ra?=
 =?utf-8?B?TC9KVmdVc3ZpcWJOeCs1RkowTmVrYitQcXZEZlVVdTBzcldwenBzRUVIY0Y3?=
 =?utf-8?B?TWxUMW1BVjB4cGUraDRTVFVHWU5iWm5mcitRcFVvOW13S2trekZzdWVOelRx?=
 =?utf-8?B?dkQxTWpsM1loOW16V1pUQlg2c3E0bVVnNU9pNVFlT2d1TFFIOStMU1oxTHdF?=
 =?utf-8?B?V3BvU0VUcWdIRnRHeUVaRlpKdDFvNC91emFsNjBkT25EQUdwRHZBczhKdlIx?=
 =?utf-8?B?Tzk1TWxmVzAxc2NyVEhEWWlDYy9NTzFuNmpMMEJtS2V6KzFhRkFpQng0aDVi?=
 =?utf-8?B?WTJlendGMXREZTJGSVNxRGJURHBOVENielZLcVVkQmNVeFNsdTExSDM2UWlG?=
 =?utf-8?B?M1hYa0JOV1JYc0g1bnlKWVZkNi9uMHRPMTZsNDdhbnU0U2lqV1Z3dUZOS1l3?=
 =?utf-8?B?ZWFyZXdJSmZQMmZqNUVlSFVKWnRWdENwb0s2UFc1ZjFYWmx2NjF1TWtURDdW?=
 =?utf-8?B?OG03bk1PTlB1ZFc5RnNHTC9MWDRLdUIrYVpMUnQ4UnBINFJ3d2dScStGU1Nr?=
 =?utf-8?B?UzN2ckxpemc2WjhHU3pxZGdxQUx4Zm5mWU9aaWtyN0h1eElWNnRYS01IRldj?=
 =?utf-8?B?VkhJQmtKRHRGRThjZXhYbEs0TE1oZlQ1VFF6eW1ZWlZQMy91U1pKOVFyQzln?=
 =?utf-8?B?dkYvLzd4MGI5bGs0ZnVtVGU0ZWxQT0lZZ0F2UXpOd2lva2NzOWdyQTRXWkFP?=
 =?utf-8?B?aGRmTW9sNEZWaE5iM251UHp1KzdCeGVTa0JxY3JTbVNvelpkaXVaNEg2M2xF?=
 =?utf-8?B?SkRrY25STXVpTk9YUDhLTjllWU9oQVZISlg5ZlZYdlFTS1hPUjdBOHk2VlVz?=
 =?utf-8?B?bmhHbmYwSHA5ZE5yU1ArTGYrY2E1cXhhaDFiL3pvSlI2Qld3VUtHZ09VUUZI?=
 =?utf-8?B?WUVIcGFldllTRloxb0E0a2F3RjA5eThiTEJ4bEZWVngwaTVLVlNmcTZ6ZzZa?=
 =?utf-8?B?L1pJZzc1aDlrVzZRaWZlYkNTczhFSlgxd3lWYW5tVXRtd1FVQkovNFRGblJH?=
 =?utf-8?B?d2hoeCt5SDFMSFlSbDFLRW9uUFhJOS90NVc0azZsVERvdXVSNzNsdDF2Vmhv?=
 =?utf-8?B?Ym9qVmNheTdkL0ZwS3ZDMS9PcHFhQmZndmNKNmtkWjNzd1h0bDJVbG1nK1pz?=
 =?utf-8?B?M0o2d2ZZbStIN2VvTnRxekY0VjFLMG1LOW1GMkZ4V1lRZjBRcGtndz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37940fa-4865-44df-81df-08de59ac8ec3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:51:20.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PHfGoIpUTThhICA3C5bPj59vENtGxom7N2fpx8v8vm6J3TKj/NFK40huPnQ29slf8U1vX9j1ejXMFMJQnzqPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

