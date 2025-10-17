Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6937124DCE5
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 01:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760666239; cv=fail; b=j1pZyu9B+E0iSUBiwJVGREqOKC18hhA/W6+hE4NCKGGvuEVrg1DJKiQiwqzGplkWizkQ/OddtHW2eIeJbXk1A59fvlDSTIz8wIzCppZEo5RnptytxwD+K9vZ3cBMs4uZNmJtnK5co8Raola2f6jf5cMRX81VG4tY8BI9TIpMsCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760666239; c=relaxed/simple;
	bh=dvL6st6V1+veTm4/947p2uuigSrQJgvM0swCAj/U94s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DSxCd7p7WLqmMNCrLvN9/YRwHg7PGgrQjY68FdYSIBfWTIYOMuqhziG28TJkJSiahrYn7vwCQZLjPJBKF+NEublu6TO5qwmuDk/riTCatR3UoU5lXdUPUFJG696s/5igoB3GS/eSmwOPIsxDM/libVvAIxtQPKtH1g5wIvYMEPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EoOhvGFN; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EoOhvGFN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6+SFAapq2Rs8MUx27b+uCNK9zY65/j8kZ3MNBQ5SwUxAY/RJY9Fe85v52zK0Vxz+jnR0+hBuiwixYNpjUtItgOYymcBWLENcRaGMIBvNuMtZuHGBFfrfXE4hOkp6vnGIabsni7iZJavftpC3EXewJbc8rQkL92GFBHrsJEJ5I+2swxSeWU1rCWxY6aBEGkXrxpVMx7gBi0/ciLCYpqAurnKf63vd0IqDofmLlz372yh8QX5e35vUFdeHKGyuaBaCaALLCxDnLDi2+BakDNGzAWRI1aCKoWVEhDNAlWpsGr6LkuXcdAC2CFpGt1FmJfE5AwS8oMhxPzyofh46ZNH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfIqnZzp7Mifxw0d31FNnOYe63F47DWGjOLLufFUVsI=;
 b=eNcqV0W1aKA1Wba8GhdbYDh5xlIiDroXspox4mMh6K0r+SH/W5/SpG4NYPL6FUn9o+u/RNfwS7c+vIX0OlNevMLj6jx3rMWDGWoQswePMwqF9ky8aug0122CLHS5/etj7zlt1dyMrumCA1fClwPez2SpyIrB6iGyVUSEuyDTjptARIuwRc2ncuvC3YqC8vkDaiml7PHw0mWEix2GeANDPWXtQSxpYAu3+o01mCjEqW1amrN5MaAMxAnGO1XregpHwLNSl8p80fXvwZGvkFo8a9rzJtIQSx6f1NwvqO4flUZ78NxWK8lX5HGVA2GIteXqpWQYJ/6Y24BG7zxXPCG83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfIqnZzp7Mifxw0d31FNnOYe63F47DWGjOLLufFUVsI=;
 b=EoOhvGFN2YWcqqMB365FITchKwtZuPd6jftI78idTSo4ru3R2OH6psZsrfX0uGNCtGmGT5rBbAo8MGFKA9+MVhP6OUh6ug+EX6At7dLaJyHLj1eQsEgwqg/+PM2UCCKB1/tUMzR/GOn+y9N4wUVtnb7mnuaViH045W36tjsK29h85+brUmLmmVoi610focADKjt1A0Bl04+JsIjL/lPJnrMf4awhZGqS4kUwEX7yr0UiGr8p772OAxCXGAqnvIgDGpuceI9jiPSq8+4e9fGAb0JUIk+aQcluXIbJm6cmeqOYdRoTUVbbx2H/u30R+squT7oYKFug/CczVIXsLXj7Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7125.eurprd04.prod.outlook.com (2603:10a6:20b:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 17 Oct
 2025 01:57:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 01:57:14 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 17 Oct 2025 09:56:31 +0800
Subject: [PATCH v2 8/8] firmware: imx: scu: Use devm_mutex_init
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-imx-firmware-v2-8-b58f68ec2ea9@nxp.com>
References: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
In-Reply-To: <20251017-imx-firmware-v2-0-b58f68ec2ea9@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760666195; l=875;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=dvL6st6V1+veTm4/947p2uuigSrQJgvM0swCAj/U94s=;
 b=+Bv0JgZvFpyZzj8rnKRSw9ZqY3jy9drPSUfVRXihbb/zCOMX4VbWZfjhQRdC5aPCbZnQLGAqX
 8Ka9KPstOc+AXIcFXQ1L7/DrqIaRfUh1FEeBaHw1z7rVXhIM4o2Hsfi
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ead07c3-f9ee-4678-c303-08de0d207e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE5XKzFpMVgwTnp4cUFLNGRPWDFOaWwxb2Y5RjhBY1IyNytHaUVja0VXY05M?=
 =?utf-8?B?dWdwUjJIZWNTSEVLRlBTeS9GVDgydHBaNGtINEJpOWlDU3JRL0c4UVFYc29F?=
 =?utf-8?B?cy9CVnYwUHlaUUtkTjlucVN2YTRUMkFJZ3NmdWdNSTZyZE1FTUNCOEFscEZo?=
 =?utf-8?B?SHhvbnZPU240NzhMUm9QcW4yUWE1czcza3o3ckxhTlVqMVBwYTBEU2MwUmcz?=
 =?utf-8?B?c0Fmek8vSzNHNHYxc0JkQVpBU2tJRTRLTHh5SmJaZm0zcDhCYUNUT1dJM21v?=
 =?utf-8?B?MC81OWh5Y09VdFBsczA2NHVlMnlXWjNLbjdnaGFGelBhQlkwUUxUb0JGbnJX?=
 =?utf-8?B?VlNkczczdHhnbTAvbnNnZ216RjNydzdVTXNJby9wT0pKQkhZWGJjRGZQYTJB?=
 =?utf-8?B?MkJySkx0TkNhVytnbWVpdnN1dElZOHJGS1E4MklmT21PblhRK3JkOXNTT0ZB?=
 =?utf-8?B?VTIybmQvRXo2eWEzWGVxYlExRDFuZXIwbkFoZDcvZzk5VGdXdE5tVXVvSkI3?=
 =?utf-8?B?a3BZMUd6RU1iUDRzeUhIaTVITzVEdUJvKzBZSENhd1FubC81ME5nNXlMR2tZ?=
 =?utf-8?B?Mnc3L0JVMU1JR0k3NWJmTW1NNGEzajg0YnBHSW9RYm5sUllMWHl2M1ZqMUYw?=
 =?utf-8?B?SXU2dUFDeERNcmFNYTN4RDkycXV3aytmOFJVZVdlUG9iVTNHWEZiY3AzWDh1?=
 =?utf-8?B?UWI5REhqbGN0QXNpa0xmaGFXUzIvQzFwbW5TaEVwd2xZZCtReVRqWUI0MXp2?=
 =?utf-8?B?a2NYbjRpTmtyMzRoYmVmeTNQM3NablJXZ2NJUVdwN0ttZzg0N0tEVDNxNTdI?=
 =?utf-8?B?WmtNbEVKQS8rRlR3SEJNZHc5MDhINWRpRlYvMUdIUncxdVJXU240SXdPVWc1?=
 =?utf-8?B?d0pxRVV5cXBxVEQwZzMwOThFYVN4MVU5K3JvVitNRUlWaWxJQzVrRHM1Z0Zi?=
 =?utf-8?B?b2ZWYjVFdmRMUGN2eDlWaTY2MXJKRnJKVk9WTDdEam1MMHNhL3NtWDlMNXFZ?=
 =?utf-8?B?VE1xNndYdC83NTRtc0xPc0RBNjl3Wll1Z1kwcmYxcnJRM29LcnVHU1dZQjAz?=
 =?utf-8?B?c243c2R0bGZ6Um5GZm9qRTVzSU1teG5KS0h3clZwdmUrR1RsbnlmVnZ3cmdL?=
 =?utf-8?B?aDFGbmdaSTltcjh0cklUaXZTaTRzUDkvZTByMGtUeTlMc3RjVEkwZmcwbDd4?=
 =?utf-8?B?dTNuUmZCN0xGMUJUVTdnTTR5YWxBVWZlazI2U3hJZUx5ZVNwUk5CODZDSlho?=
 =?utf-8?B?SG1GMVR1clZqL3U3cEpvMFlRZ2tBOWVHRWNoYzlBUFoybmpzM0ZnQWRWR1o3?=
 =?utf-8?B?czdBYUpLWTRkT1dRWnFpT2dOSG9NNm9rck92d0E4N3VobXRGYWxTdVYvN3Zy?=
 =?utf-8?B?R29pU2RmSWFjUmVwVkZNV20xL1IwVExFTXl3YjhjYytYNnNsTy9WWGFzVWRS?=
 =?utf-8?B?MzRaWE9DZUxzajBQazdyK1lxb2MzQlgyUWxxNXVtRXVLNlp4K295OVU5dE1r?=
 =?utf-8?B?ejQ0eWRySFJSMWczTHVDaGN3cm45YWNQaXIybGltb3I3Tk1HTGRYSUc4T2lG?=
 =?utf-8?B?M2wzVG5WNnR3U3BGYW1RdDBvem9paW9Ib090ODVqeFZOb25uTlphR1pPVnJU?=
 =?utf-8?B?OGg2Q2xiOFVXR0ErNnQyS1F1VXE5NWd6VlFMOWhlY0RvaU16ODRDdHY3L0VX?=
 =?utf-8?B?VE1LR2l3V2hhZUpTbDFVL0hOLzJxWThacUxjajhrODJEYnUyZmV6T2lubDd6?=
 =?utf-8?B?QkdNTGl4TlNtajdBc3ZTdlpkSitLeXVVZHRZZEs3ZDlnSXJYNGZtbjNtWURI?=
 =?utf-8?B?aGw3OTBnOCtaRkJGNThiMmM1L1hrOUZnRUhOQ2o5a3h6MytQbmg5YUNiYlh1?=
 =?utf-8?B?VXhiQ3RhR0M0dGxoK21rN3hiVTBUR1FpRkltSkRNSWJVZzVuVFhUMklZejdp?=
 =?utf-8?B?dGp1S1YvZDVRdEpLbXpjb1pjVk5ISDZxdFZETnU1d3hSS011Ui9CMkQ2TmFP?=
 =?utf-8?B?Y3MxKzVVYmYwSkUyV1FHZExqVENZbGF2dGc4ZXVqZTgrVXNJNHNkTTFiRkVh?=
 =?utf-8?Q?QWbRxw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEpyTjF4MysrNzVUS3N0aHcxZmFiSmdSZUUxQU9EZHhEZ0c0NnZKNkNMNTU4?=
 =?utf-8?B?czh2cnA5ZTEvclJXR2ZFNlVUSXFta21GNlJabml1dHBGak5OMlp4alVOQVlF?=
 =?utf-8?B?MjN3Y1A3U0NlQXpCNEl4dXMvSHpZSnpKUStsVFZKMytDZWNuYTF6djg0MmQy?=
 =?utf-8?B?SXJ3amdpWUtCZFZ2a3NxODY1b2dydDluL05RZXJSaTRqbmRqZFF2Ni9Fakxq?=
 =?utf-8?B?NFRvdzMweTdLYUtnTjMrT0E1eEc3aE81Y0ZzYVV6eXBnWjNNUm4venFYaXZF?=
 =?utf-8?B?d2RlNHBzK3gxR1QwTVh3eURPaEY4K1Z0WXkrb2RZK0JZWDVqNGt2YWYvZXZY?=
 =?utf-8?B?SVQ5bW1JWk5ocXJ4MjlVZU9EK3V0TUtTeXQ3YkNsS09tQ2V1c0R2V0JUeGE1?=
 =?utf-8?B?TFlFb3VPNDkyOXgwT2x5YkZCWEY1Q0h5eUloZE9iL3ZCc2w3L3JDelNBL2dz?=
 =?utf-8?B?WWhReHpTQk1uMkpJUUFxOVc3MXo4VytFRy9LNGtORVV5THBkL2xUaWcrS0wx?=
 =?utf-8?B?ZzVONkVnS1RxSTNjeDAydWtKOFRFdmNMZEQwNzJxK2lWRmU3RFJCa2RONVlh?=
 =?utf-8?B?R1lNb3JmcHlwZXhETjVBaitYSTJaT2pSY01oTmxPQ1hEcitST3dKWWhkRGxK?=
 =?utf-8?B?ZkZFMi9JRnJITTZxVjIrb0VrWEV0QlV4TlFmbDNXaXlnb28rTTVkUHNCTEhS?=
 =?utf-8?B?dXhVbVQwbjA3dHVybHlOeHowa3BEQUt6Q3pJSC9vdTRQaS9aa2dzdEl6dmgy?=
 =?utf-8?B?eXV2M3l0cnkzeVZiZ0J1SEVrT2kzVDljTG5XYWtFSVBkVzdmdHNVTTEyakI2?=
 =?utf-8?B?SHhpb2pmUWhYVHM5bStRdTQxYTNxZWhGZ04xaStpQktReXF5cS9OS0lCNnRW?=
 =?utf-8?B?TkdYQnhwR1Q0bDJiM2F0Z1RuZ0JkZ3JXLzFYTXVSNkRkNTA0WCtWRWM5UkFL?=
 =?utf-8?B?UUltN2k4SVlkaEtRdzVFYjNyYlpIcjhGMDB4MWhBN1VOM2xlT1ZxaTg0Q015?=
 =?utf-8?B?NDZiRDVEV3FUQ1NnTUNwVlRsc0NuOERuZGxPL1NoYXg1RmQ5Szl1TG8xVGh0?=
 =?utf-8?B?dlNlWXJ6UWYyMWMvM1lDb05QMWpQd3dUcXNWUTJjVDZ5OGV4RnhITlkvbmdU?=
 =?utf-8?B?aC9uekNQWHF3bDBFZDExdEg4cDNqdTFUa0d6amRmcjRCTjhpbUQycktVRmN6?=
 =?utf-8?B?NHJRZXNuN2MxVDl5VnJ3U21rZ0cvLzFwakszRVZ4VzkvSWFodDh4SFdUazBj?=
 =?utf-8?B?OXZOWTFXdngwTjQ0UHh6VEh0ZE45bWc5dytmd05ReDJSZ0MwMmdWZXFBZ1Vw?=
 =?utf-8?B?aWZYTkRsL0VZeWFrZE9ObzRYUnJEdm0yNVVwTXlUSXZsSDhiNXYxNDUzT0M2?=
 =?utf-8?B?L2dHOFhiY1EyYWpwVXRpS1ZzUDF6RnJFditMRU5HM08wR3RjQ3hzY1lsZTM2?=
 =?utf-8?B?YzBndjRHVWtDb05LOEZwS2d3dEtmTzQ0TnQxN3NRUkd1Nmk1YzZtR1BCWnRH?=
 =?utf-8?B?VG9MT2NWSXBxVnJ3M21rOTJPT1F3QjN3ZnZRZmpIUEJYT3I0Vm44U0NVRDBW?=
 =?utf-8?B?YzVLRldtb0RiR2s5cURtSUFiRnBqM0w1YmtnWUg5ZXRuSjQ2ZXZFRnJnSTBO?=
 =?utf-8?B?cXUwbXV2akhOdXZIRlhacVpreHNlZjdwcS9LSkNLSjA3MVFxVFhwTXcvaktZ?=
 =?utf-8?B?K09ISHdIVFA1aDVaOGFMSTU0NlRTanBuMFllb29nN0hCbTNZYUxzRklwTHBo?=
 =?utf-8?B?V21BMWRieklwTzFhakpSVDVuUzdkWEYvMmt6bXhKM2xaeUlpcGRCbTJ4eFdR?=
 =?utf-8?B?a3dOMzdRd0h2WWFFeURPekNyaGpvUmhMOXBUekFMcXBoTFFjOGU2SXp4a3V4?=
 =?utf-8?B?VXljcm5vSGFXU0RBbjlVYXJFekJKQTZXbG9RVlk2VTl4d1JJckM3UFlHVW4v?=
 =?utf-8?B?ZHpST2Fta3YvNmovREtINEd4eWs3S1NSUklrdjZYVm1haWs4alA0TEMvWXhV?=
 =?utf-8?B?bytzYnB0c1dTMkRKbndNclk4YXhMcDQyZWlONm9UY01nMFlWaFBNaU1nUEdW?=
 =?utf-8?B?K2dYVDdUOER4Ujd1LzNVWVlzQ3RkaVlHOE1aTkJSY3VWaDE4ZUE1RHdJY2VL?=
 =?utf-8?Q?Ns685XiIKz+paIBMUWd/RztZJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ead07c3-f9ee-4678-c303-08de0d207e3b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:57:14.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfucO3aWm+yUeyesjJlS6yRp8bxrGfE1QEe4aszerm97BG2/8JB2zEqJIsWUHVDyUPz/RXWLOWfEsCIW3pIyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7125

In normal case, there is no need to invoke mutex_destroy in error path,
but it is useful when CONFIG_DEBUG_MUTEXES, so use devm_mutex_init().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/imx-scu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
index 630e3dba4db15961ae4d77273af6248be614145e..67b267a7408a12deed77d2c8f52d5f64b239a408 100644
--- a/drivers/firmware/imx/imx-scu.c
+++ b/drivers/firmware/imx/imx-scu.c
@@ -324,7 +324,9 @@ static int imx_scu_probe(struct platform_device *pdev)
 	}
 
 	sc_ipc->dev = dev;
-	mutex_init(&sc_ipc->lock);
+	ret = devm_mutex_init(dev, &sc_ipc->lock);
+	if (ret)
+		return ret;
 	init_completion(&sc_ipc->done);
 
 	imx_sc_ipc_handle = sc_ipc;

-- 
2.37.1

