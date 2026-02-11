Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D253346A5
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802147; cv=fail; b=b1GBMW6xywyVo33rL8OubIhJ5sTddSQdL7vHcvQ4lblh0wOZN9tD1R2FCka10NKm9L+IiFY9j3OpKPUUoeQVnrVH5fv0OF5eMhqfYITxiKJKT4k3VDSj+ykU47I2y1YuhdqSV9ij4MnHlJeolHQzVL/6brzWffnFBvcIRCpqc6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802147; c=relaxed/simple;
	bh=dd2EhMBnXpG4/X8jvrvOglWngy8n0m9OiZ9WCboeOWg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=td4+0FXC8/mjSc6iPxwKLgmrWhLfY+HyCcBrg9TRlNZ9cHZc9ny+TRIy06oCX1qJ8sOiyKNhiF/L+8BDbWe5MRP9KzpWbvCq4KyUYcEWB3L/Z16pZriMU6L7otnc9Ydd8dx7bHl0Fle8hYy+2bvhjgf8/k63QxtV+x1DZc7Ro3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j2C+cRVN; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j2C+cRVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9vFIG6eNXy09bPEJEkbPamCaKX3bsY5lepU/AHZ8DijGMHHrE5YfAl9ZgQkfVJUi85MUlB/q5mVakyWy87WmBSgbAG9kMSortvYATI1yJIIMN0dJdEF/faDBB4iwbULv/m5M3N231y6JUC1XjpHOKgEf2evERHJoUWg1CVezjvyO1TaOeeh+FOaXClw8kR8E+4eAK5qPrOyU2NrjKMOeAVPdSpRb21sP7Jy00v2gXwoLC6SObDx3/XB71i+5wmaGiC9FoyXTSRGHD0kuK0t7E4CVWhAm255OrDLEo67tokh/2LAEdZv7CFD2SnmTfv4zlQy0W4i4w+5jwiZZPlEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfxy7yWrnZwbELRdMLZT1TK4bsa9KfDkpM2UCWbqakc=;
 b=Ht/N3QyJddU3NkShPQkYPSXkHCvKucz271ytCZPWKmEZoKkyeDW9FkbuzJtRkj4PSkvduyODJ2VbLUkFLJV9VBUO8ZSASWN7lu+IMMdn187/i2NDGnnYzyyOeS58O1budRFz1z2ZhogysrL2Fxcop/jLYlwVThV+Gd+wN72Sc/0btYVLPmudDc9P5OsgsDm6lit/gbTzVaqYYaiRtel8BLCo2fiapRfSC2wN5WEGHHBw8+co8wq+KUvdhN6OykBg4HIT8uhqEpIQfO9yI5PsDgpcZQwBGJjZwaYaaD2RE/j1ChejCjgUxA236LAD9PjtGEpelt2CmQ3AWyWO4l0JVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfxy7yWrnZwbELRdMLZT1TK4bsa9KfDkpM2UCWbqakc=;
 b=j2C+cRVNsI2+/CQchZLcHG+oj+PX7P3Piny2FJEYlWM1jRCtYFOGrh14PnNJKXmNFS4PV2UBmV+mdcqCGIO+XCEdHiA86KBZWxzQInWXp9mOpji9Me2v87vSfMFALzy9TpeNbPKGIm07w1UunzF4SDVdcnbc/6twt+NWyjWyttkpS3zPBaFLn4tOwO7dw+iIf35p0F8D5F6WlJo4QMVgZYu1pet47hhBg4dTzWmOzg24Ws0ahA/g7CTfX6Z2QnMC1Ap0btTojK7kfJN2sIbZDgBvQ/qc45jqGuFaYnpsv34hIcW310NPNe8RMXlo0RoTns+tbccIkmFCY4X4GOUeIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV2PR04MB12020.eurprd04.prod.outlook.com (2603:10a6:150:304::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:27:51 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9564.016; Wed, 11 Feb 2026
 09:27:51 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Wed, 11 Feb 2026 17:28:25 +0800
Subject: [PATCH v4 2/3] arm64: dts: imx95: Reserve eDMA channels 0-1 for
 V2X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-b4-imx95-v2x-v4-2-10852754b267@nxp.com>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Joy Zou <joy.zou@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb3c9fc3-75eb-4808-58fe-08de694fd3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|921020|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnoxTEFla2dNRzRRelgyWU9tTW9JVUNiMHZEeDRybGNNbmc3Z2xTQVM1d1dh?=
 =?utf-8?B?MDZheEtXUXdCalE3cDBodzNCNXZqY3hUeUMzRkJEUGxuR243dnc3bmxVY0lk?=
 =?utf-8?B?ZEc3WEtIRG1WcVBVTHRKdTgwcWVZekluRU85MTNQamExNDJQU3FTK3RVZmQv?=
 =?utf-8?B?YlhIQXp2OTZySnNoRTI5MDdLVmQ4NUpCZnh0SzlxNEJpeG42S05wblltOUdD?=
 =?utf-8?B?bS9GeHRCSXlvSE1VK2haYmhPRlBydWdxUnFCdG5tOW5xVVBNN2FqY2xqQUp1?=
 =?utf-8?B?RmhmZkRaVkJCYlpCSUZmaTRTWUJxeDNtRlFPWmNLb3FKdWlCSjc1R0NjNEdG?=
 =?utf-8?B?K2VPRlltVzFGN2U2OEQ5aVM4anZQcGxrb05zbVovNVhXSitoUUUrR3lMbmxC?=
 =?utf-8?B?R3lIUUVsbk80eDZHVjh0VUhXTFNVOUlEb09jUWo3bW8vLzh5eUNTSm5LTmdU?=
 =?utf-8?B?YXhkQ0pyNHVDenpjZUVZd2VxeTNMSDBRTDFUK0hEWnFhSGowejJpc25YUS9V?=
 =?utf-8?B?NzczRC9Rd1djclBlNEd1Wm1uQXJwRHVPeXk2SzhjQndqMUh2ZytkVSszdHhD?=
 =?utf-8?B?eHB1UXJDalRvOG9IcCtTY2M4MFYxMHBKSjBwenZSbFZhMCtqMjNZZTV2RXQv?=
 =?utf-8?B?a2E3MjRidVBOdXRtSWo1eVV4OTZTYndQd0szNjFZWSthVWM4L1JvQ1U1aStk?=
 =?utf-8?B?S2pVUVhiVFJoNHBmOXM5YzNyVnJnTlh0cDg1dEhaRjBCV080YkxmUzZFSzF3?=
 =?utf-8?B?WjJYeHpkKythWGpzdzRIcjBERXFhb21OUEhIY0lVZVU5YkM0RTIzcVpNSHNT?=
 =?utf-8?B?elYvSjgzWlRUclZhZUphYjcxZFJQWWRvdk5OaDd5UTNmam0xelJFTkMvNUFp?=
 =?utf-8?B?d0tLS0pQNVgxNUdGdGUzTEdlbXpUYVVvVUdHTVVJQ2dmQ0ZUT3VaVEFGVSs1?=
 =?utf-8?B?RTJWK3BkQm92cXVtVEJkU1hJRmEyKzVKVlB6OVp6Y1RKSnVUWEdqK24ydUNN?=
 =?utf-8?B?SXdCU3NKL1IrVHdheUwwRnRQd2x4aWRDdXBKU1dReUg4eVhmQUdUYnVkdzNJ?=
 =?utf-8?B?RU1UdUpYRWhmanA3b0hDRnJ3OGNjSVViTjNXVURhWVMwWXE2SW5kNWhQbnMv?=
 =?utf-8?B?U2NWM3h3TlFEUEVpOFJTQ0NSK2l0d09iWjhaMVFJU05EVWJ0ZEFBaUhnYThx?=
 =?utf-8?B?c09EbE51U09MeHN6VW9hdEs3b014cHJMc0RoMlNjWWxTRzNzNmlrU2RxaWFw?=
 =?utf-8?B?SFpPMFQ4ZnROWE5TWTF4R2RWUnJPaWxiSWU1WFA3MjNCUWI2MHpkMVo4NzhW?=
 =?utf-8?B?aHZpRTBNUU5qL1hXa2cxOTdabGFKeHFpM2NwTzIwMWRyMEF6MjY4WisrTk9k?=
 =?utf-8?B?d2l1V0p0ckZ3STdtVEtmR1lqOEswZHZJMUNZSFdkZzNhQXVnVjB2TlAzdkcr?=
 =?utf-8?B?a1RmL1grOUxMRkZWNnRuRTFtaWNUY3J2NU5XblozODR2MnFKby9rSkdHV2wx?=
 =?utf-8?B?a3AvZGgrcStoK0I5eTZhZFo2TGo3a1c4UGk5Y0I2S0RZck5IaWk0RjR1V0I4?=
 =?utf-8?B?aGVyUzZwMXJWRzJKTFJlRnlGQWVNVW5RdVpySGVSNXVBSFFRWlBHUzBhZTZZ?=
 =?utf-8?B?OTl1MEI0bHZIbC81cXFnemhnSHhtTEV0ZmlzZHFOT2RyM0ZpVFkyODZtZDU3?=
 =?utf-8?B?N0E1WklvY2Z1YmVRcXpUNDJvZDdxYzdITmhTRy95TjZlczU3SGkxVDcrQTg3?=
 =?utf-8?B?SGdoUExvZElDUEhaRFU5T3RXY1dMUG03akRWbEZET0lITUhURnE3RUdIdWhS?=
 =?utf-8?B?dm5EVUVRcHVFU2dQRGRPNVR3MGFzTC9obU5SWkpCcGVJNXJ0eUlUdExTVm1x?=
 =?utf-8?B?SjBqYVhwaGFHOEZ3dG5oVXZjZmdRZU5Xekc5S2srTXJXaGhoc010VTQzMjNy?=
 =?utf-8?B?T0U1UWhyREMzemJSbEFncjdVTC9JYW1Gdk1TNHlMT1F5dHp3WUlONkpxR0F0?=
 =?utf-8?B?UFBLTGQ3QmhLYzhiMVBhWU0vdGttRllCcGkvbEVzeERZamFXVXF2WVZVOE5K?=
 =?utf-8?B?bHdsekMyTXY3dkh4NjhXc0lLdHJiU1d5aXUwaUFSSEp0dXJCbkNTN2tVMjlM?=
 =?utf-8?B?ZFpraFJXRGlPcXF5cldWMENkVitTN2s3TUV3ME1DZUQzS1pEbm5kczR1V3RZ?=
 =?utf-8?Q?YoEjm4fHPkAxJW1PGkeXN5ZD6lp7Ja6hMfu+h8+Ggw9I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZxd0YvRndTb3l3dkpzb3pBNHlRc3pVczNYVUhCdWhVNDBPNDhjeG5hbk5l?=
 =?utf-8?B?WERMclZFUWYvc2JNdDlLYzI4dE5pdCs0R0tNbWFvR0F6VG5vKzFqdUlaZ2Vi?=
 =?utf-8?B?ZUc2cTZZZVNlaTR5TFZ2clpSZlZLTHBqaHpMMjYxS3dFYkgzcG1ldVlNT1VC?=
 =?utf-8?B?WFVhRVdybStBMFdlaEdiRXJaeWI1eEFVTmNQTzNYQTN5UDZGOHNJc1lRWndk?=
 =?utf-8?B?allRaGE5MDdZNzhQeGlYWUE4WnVGaEdmMUc3UUpTUExxa0NQczlaUGpOTmdH?=
 =?utf-8?B?NUs3Z0s3cm5Pb2pOR0grRXhPUWQzTjMya0EzQWF6RkZhU0E2a3ZjelBiUVF1?=
 =?utf-8?B?bHZkSXNZblYya01KUStHS05aWjNncXVQbis0YnZDbEJ3UUsvUjBqL2JXSHhj?=
 =?utf-8?B?Y01TUUl1amhRTU8rNlUxVkxxV1FjTkhpRDcyZjhrcUpZTGsrR2hlQzBtbUVE?=
 =?utf-8?B?cHVTb2pBendOK2VWclFCNmtLUCsxQ1E2ZGMwV1kzOU1FSnNhN3FybU13N3dC?=
 =?utf-8?B?S0VTWEZ5MVJjYWR6dVBNaEtSTDB3K1NHZngzRk9DVXZhZms1ZldITzJMV2p4?=
 =?utf-8?B?a0hmYndZVGRlN3R6MTRDWnFqeW95VHN6TUNNN1lkckxJTHVTaDFLNGNyQlR5?=
 =?utf-8?B?T2ZJMEJTK2JEUW1EZnFUYzIyUE8zRE9YTTBwWUhYTDRqY2hYeDlkTCtmektx?=
 =?utf-8?B?TWdKanZtT1BWRG5BYWZOc2lPTlRKbU9VbzEvTkNnb0NvbGdRVVY5QXNkM1E3?=
 =?utf-8?B?djA2YlJRMXB1SHMzVkpuSCtZRDQ1WXIxM2EwbU1mcDlQVWdndjFQb1RnVmdw?=
 =?utf-8?B?N05tZGdrcjMwUUpNeHp3dnFOODVScHpKRDR3bU0xb3dTZnB3aCtGZGRkWThs?=
 =?utf-8?B?SjJUYWx3N2JqNzZ4L3R2ekJoT0FLbHZjNVVORGNZWXVvSVFsVytmZE5mZTZv?=
 =?utf-8?B?bkRNeFhrNHFCVkl5bkNPdDlkdFdjKzRrZ2w0R2llYkNZUGdEOWcrVVc2cWxC?=
 =?utf-8?B?Wk1VVXFuMzRBWnJFUzQvdGI1ditKNlVyVTdtTmRISi9odElWQXh5YzcxMndS?=
 =?utf-8?B?SGtZKzZtTGNFMStMWWJmdUtCNUpiSG9pZjZQSS9qaVpwdjdwa0tvbFZsYWJV?=
 =?utf-8?B?aUEreEwwTDVHeWx0U3dDTEkxU3haNm9PQnFJOXpBM0ZVdzBCVGdXWEpIMXVI?=
 =?utf-8?B?WTdhbTlLaFhQVll4a29XTldBamFsOU1KcHZBR2xDajJ2cVEwdUUyS0hZaUVR?=
 =?utf-8?B?N3B1R1hpZkw0L2lBaXh6bUpnWVNzZEV2SHZPTVhmZ0dkKzMrRVpENXdpcFNX?=
 =?utf-8?B?UEk1Y09iY2w3MHBVdERrWFIwRGV5U0sxcjlOKzBYUlRrQ1pHQUh1dHYycG5v?=
 =?utf-8?B?K3J4UHdNVGdPRDJ2SHNnTkJCVW95U0VYckxucTNGc1JGUlFMaVNZSzlCOTZt?=
 =?utf-8?B?c1BjVGtPQzFTVWJpTG1DdDJwYlhIc2lFTW5OUUsraGt2d09sNThrM2Y3WE9I?=
 =?utf-8?B?dGdBM2VmbHBYT3VjSzZtRG5XYk9ERGNMOFcyd2ViU2ZnY0pPaTVjVEhyK2Np?=
 =?utf-8?B?b0F3NnRSTWNnK24rd2dPZ1pIaVROcFNteUNQVnhwQ2ViaU43Y3lMQnFxSk9t?=
 =?utf-8?B?a0lQZFBabVV5c3BMdkE0UitVMUY2RDFZejJOVjFydEZSRlpaQm9XUldxNWh2?=
 =?utf-8?B?bnVubE1DWE90OW5wLzJxbklGY2ErR2JCaWZEUnIveXNxeDl6d0IrL1BJZ25W?=
 =?utf-8?B?dXNBSXAySG1leVIyU0UyZ1pLaEJENHR0MFk5ZWVmZVFQbTRVM25QK1ZRQmtk?=
 =?utf-8?B?alE4WkpQSzZZSGk1MGlTSjI1aUpTcWFIYWdTakMzYzBsTlMyN0JuVFprSFAz?=
 =?utf-8?B?VjYweTU2TTFScHh5dGIxcU5oVC9rUjdIMFNYdFROSEwwcjJBTUEveGFvOWxM?=
 =?utf-8?B?SlBta0dGYnFnaHBsSjM0T1pLOUJycFRoSVZQQ2htaldFUnEwZXBCcmdlME95?=
 =?utf-8?B?NTEveklUMkxYK3FkdjFhU0FGZEQ4c0kvNnNtdXVDYUFUdEJWcjVRZXVVUGRY?=
 =?utf-8?B?dUM5b29pNTdTOXIrNFlZekNBemFRN0E0V2lBd3hxZXFwSW4wQVJFVHk2WUtr?=
 =?utf-8?B?UlczMkhzcnBvOEwyWVJ6ai9uTFlxOHZ4ZTRkcjNXMDhxTHIxR3dHay9KN0E3?=
 =?utf-8?B?YUY3SDg0ektPRTNhZHcxemlOOHVSOE50QmkrWDNkS21kR3hiNnlMU2VWSnoy?=
 =?utf-8?B?VUNvd3UvcjRSbytDSHZCby85cmkyLzlhUGttbURRSnl4eitaSFBaUDRRSnhj?=
 =?utf-8?Q?fpXdLYW4JaToeF4BeR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c9fc3-75eb-4808-58fe-08de694fd3ee
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:27:51.6286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujVpgZGLWJeBFCj6tjmS9jkSe8mnLdtzppc22lFSsCyxm+VJQ/WVyAtWNXKnMjQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12020

Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
use by V2X (Vehicle-to-Everything) fast hash operations.

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
 				reg = <0x42000000 0x210000>;
 				#dma-cells = <3>;
 				dma-channels = <64>;
+				/* channels 0 and 1 reserved for V2X fast hash */
+				dma-channel-mask = <0x3>;
 				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.37.1

