Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3922C21FE
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 03:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763523221; cv=fail; b=tG2LyU+Xv7y0cM2+tOD1iqUean+4EEcwPD3PIniIoykqol+Hi6q0GxaVec+3K1dL7T9ROT04CiT/xVajELL8JwTIQQk6Q+9mduODQtVk7uH/O9BYO9mOpAzfiE6C50U5+E48UcB8ltg5KsANtB86PV1q+TPAhDXyqU3lAzk3QtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763523221; c=relaxed/simple;
	bh=eS4E8734U8u59BQZUmtewvLzX+gvM5dJv4xKtWpGRgI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=eIV+4j7+CeEn+1tNqVPLNDOemrOesyKmwtwqlINLC2AsiUAWQA+OyrVHt4V6wdRgVa1DppEl2+M1Khs9k+2kXkVLk3zYxbcIiKqTHBW5FkWOqtF8TbXpuIV7JIgyUfoRwPa//F7lk0cAlmYszWZF1YgpAKXbVIX4K+WZ00ZwA84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=il+vL+EY; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="il+vL+EY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWS2DFZPHfOpbTKXg1wfmI+xFlykDxIAZESrzLr/3udXZwgoKoFatq366A3iRYWmgnul7NLGHaJhjpHWLypj6rBIVdVpET6lzmCwmcZf7gZYwfbNazKP2/hr1HoCKUnYKsRMFN0iWxWQNNRBtEspqYsC+lgf7IjrhhdCBDN8FsGbIs4QWb4LeKieQ7Ey90VZrJpmU28KeC/MRtr8KNldvMpXGz15p2Km+O6RvrsFyyu6stIcxT0rJT274tURVlBYv4Rad1KxJFzSRevMbSFjSArWXprNeAzDPTJY8Yh6eShpkBaK0K7E8o2zu9gYJvMhQpjNmpSLiCQX2OWSvV/fNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMfATfr471ExeFvbMIkG0Z17czFPpT6809xU//MbSa4=;
 b=rRrTl1+k/4+4cK73Yb0Mrv+NT2aEtOofU8iEKkhk2vxbVXD+r5MjwqhEBKLlD9c1hRefS2MSkns23OdLT/OjwA/Q5a2J57AbYWTxHGBYs1NDdCFAiiI9eFwxEUJ9DJKGhMPe26ZySJGjM8ZH2hLELJ/xXYnG93BxRf8PN78FraPCLFwXzRjVRKcc4Rmnr2dmGk1DJIkg6Jk1MdVGf3KqG+DOKWT2L+EdjEu3oDfBlaMOSGHacQQ6wU5Y/7ATsX9oTxzT5AFpgLAJBm1gOi7xbnIdqh61AvNs8bfqriN2oDaym0VUyrghzcudF6p4koJuO+m3G+2Fm/hqwfM40SBKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMfATfr471ExeFvbMIkG0Z17czFPpT6809xU//MbSa4=;
 b=il+vL+EY+2fDWcH7co+EPu6Ts8H85WcdPJkcoYxnzVWldxxOqKyP61vjzvVFhLxrm5jUZj3Wy/WS0Ih/k+ZV9ANOeb10+RUQq/nd+i46K9D8kIjNHm+OvJA0kvsZt/nRXWPNjxvHXJs+SOHZDJV1CcwkwJSh6lENCKwh/UGgL5jsPbVTByOaHPgoScsXKPq9iWni9DiiXWEn2bQV3qpSYytNpQEbTXiE4tiB9yPBJu8rxya+Xlo82as4s/Z0Rn1kH0BHvQEexjI3B1EdR4Jwsn+6KttTbGFKaJ2QJ4NnvOsTK15JTAngcE1M691YtPnY1h0NZNyE+8lS7mPRppKUKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS5PR04MB11417.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:33:36 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:33:36 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 19 Nov 2025 11:34:18 +0800
Subject: [PATCH v2] arm64: dts: imx943-evk: add flexcan support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-dts-v2-1-e8f8d91280dd@nxp.com>
X-B4-Tracking: v=1; b=H4sIALk6HWkC/1WMQQ7CIBBFr9LMWoxDoKmuvEfTBWXAzkJooCE1D
 XcXu3P5fv57B2SX2GV4dAckVzhzDA3kpQO7mPBygqkxyJvUiDgI2rIwpGZSnoylHtpzTc7zflb
 GqfHCeYvpc0YL/tZ/v6BAMeDcS3X3Smv/DPt6tfENU631C3D6O+SUAAAA
X-Change-ID: 20251118-dts-ad4bd4fdacd6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 frank.li@nxp.com, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763523275; l=2291;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=eS4E8734U8u59BQZUmtewvLzX+gvM5dJv4xKtWpGRgI=;
 b=mVolpUL+r3Eupg7RBvWyvUPIDyEO/0aKD9+y1njq7kxm/ziKkspZsl7IxoH6Tb3OyIoNbtyq4
 6s272FHsPoECXn13Ir2PlmMQRbWfuzR+gZnvd8xtQgKAGMY/ir2X5J9
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS5PR04MB11417:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf02d8f-1aed-44a6-0116-08de271c6c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnJReEVJVWZWNnR4RmV2eDJNY0FmU2UySE5sL09EaHRZYTZmOHpOaUtFWEVE?=
 =?utf-8?B?dDJha0o5TXphRjNTM1FVYWJGdm5LYWdlMU5UcUZFWkRiaXg1NkZ5aTJDMmZa?=
 =?utf-8?B?djRHdnVCV2pxUDNsaThFUHE5WHRzLzdoZGhVUDk2Y3gyeGt3WE1JNUxPZ1I3?=
 =?utf-8?B?VU9yaDNsb3FaRXJJODE0d0xFTDdSWHF3OXNkMnNwYjJvaFQxUDA3UGw3N2hw?=
 =?utf-8?B?SGJNRGwwK1hFUXZ0Mk9iQTdvQW1Pd3RHSGE1cmFBUnh5YzdHWjUzTzR2aFFX?=
 =?utf-8?B?YXJyaGhGYkhrZmErWWx5ZHZrc2t2S05KNEN2YzF3b0IybTU3RlcyS0NldGNX?=
 =?utf-8?B?d1JRclgwN01rSDVTK0lXVkZlMVVUK1JPbkhQVGRPeEFoWTcyQVp4eitqNmF4?=
 =?utf-8?B?bjV1R1pwZzYvN2RiZ3BuRlZYeHJaakVvaU13TVJEcEtjNFJhQWV3cUxsUm5K?=
 =?utf-8?B?ZlgzZWxiWE4wYUR3M25SODhBUkozaVJnRXZtT2s0bmdVcC96Y3FsRW5aUm9i?=
 =?utf-8?B?dzRLMmdqdXBqeXV1cDdtdUo2N2ZETlg0d2tPdDcySjVVbFc2TlNEOU9lemZ6?=
 =?utf-8?B?SHM2R0kyWDljUWFOZ3NhZEUzeGNlTkhtbU9WWnVHSDArbGYzN29NZXV2MHc1?=
 =?utf-8?B?SWVDRlBSc1htc3hLbkRKb2w3QTJ1cTEyOTMzSE5yckp4VFl2ZFhCemtlUkFT?=
 =?utf-8?B?NWlIWGs2bURpei80aWtVa08vbmpQc2dSdEtUcTRhOUZPUWhXbnZMWXNsY2hT?=
 =?utf-8?B?cmpKYzFlay9NNkVzUkVnMC9teFZ4Qk9GeXd0Mk9VaE5kYUpZSU01amNxQ3NN?=
 =?utf-8?B?K0wwWXFMT0IzTk9CRDAyZWpyNmIyN1F2VjNoTGNxTzA5Yk1mQzUxbDRoNC9j?=
 =?utf-8?B?U0tSL0psZkRtU2l6WFUxbTZMTjRIcjU2T2V3TjgwOHpTRzdGWUxFMjBUNm4x?=
 =?utf-8?B?SFIzVnBwSTh3TGlXNkQ2d05PWTNoa1VKaEd5OFlvQUJwQ3cyRG1wMi9iNGls?=
 =?utf-8?B?OUw2ek1MTFRUNjAwZC9EUlZRbXpIbDdSd0E1RXBkeFpFRGtqOEs5bHYrd085?=
 =?utf-8?B?UmEzYjFORHF0dFM5YjhtOFl5OEptMTUrOGk4d2dPOWx4WFdrQVlpNVhIK3pC?=
 =?utf-8?B?cDNLUnY1aXNNMWgweW9ia3FwZ3VvZGZTQm95ZkdkTFhvdUdZMEl6ZDFwU0Qr?=
 =?utf-8?B?QlYvb0o2dFhvZm5VNlAzbW44azhFRGJZNENlVVRNUzFXOEN6MkhOUG4xczZW?=
 =?utf-8?B?NlJGZzRkUDdzdUl3bVdKVnIrVWFhTUt4TVFUMlB2S2hvdXUrTmhDYjcwRHRw?=
 =?utf-8?B?RFEzb1M1em5ES0pPU0xlaXY5bHFrZkVhdmZJUGsvT0t1UDdYbTM3RTliSk5U?=
 =?utf-8?B?SGpzV1M3c3FraXFzdDA4S0Y2bXc4U01YeWdYQ1JGVmJiZHI0RnN1U0FqWWdK?=
 =?utf-8?B?SW1hZHI5dHVCZWdGd1gzZDk4am1WMTZhcmhSWEkvRG9mcUtaWHI5VS95ZG9E?=
 =?utf-8?B?cEt4WE5YRjVtMndVOWxQRjhPL05za0lkYTNiUjN1UFhCNnBRVXY5NS9uYVRK?=
 =?utf-8?B?QTB2dy8rSE5wV1dqZTE0bGhsV2N2S0ZhYmJ5dHZORDBSWnZhOEVDK1VKekNr?=
 =?utf-8?B?aXR6NEhJSXh4ckVmK05qL3V5Sis4WGVYNVBaK0tybFRVZzBYVVYrT1pObmVK?=
 =?utf-8?B?NWZtVStHY245WHdabWZZa1NmVVF6MFprWEZXVWNBWFFjSmxaZnBvekFtdXBB?=
 =?utf-8?B?Ukg4Vm14RjFDMGZPWDlJZzZ5b2ZvK3lEWFVxeFZZR0Z1SVRQa0h0Qk1VeFJa?=
 =?utf-8?B?ZGJnTkVGKzd5WFpKMU1OZmVwd0wzdWZ2eE4xTzh1alBiNFRyU0lyVlZuWmJW?=
 =?utf-8?B?UXdDOVVzM0h5dlpkYmZSSUVlUkJmQUMvRDZjeGFmNlFJaHQ1enJIOStWdDJy?=
 =?utf-8?B?TzRVQ0RjTFhwNEZlUkFKNUFPQ2lBZGJGV2d3d1NpZWc2ZGFqNTZWTlBZMUpl?=
 =?utf-8?B?NzlvZjJsaU1Yb2RvNVlCR0svZHpDUlJyOEVGVnMrVDlORUhkWUV4aDgwZFZV?=
 =?utf-8?Q?2nnT+9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RitULzU4MjA5RHRaKzlNMjhJWEhKREtRQVlhcFBvR1c1YUxwcGpJT3cvQmZT?=
 =?utf-8?B?OXdSalhnMlBHSkY2cy9xS3dHWXBicnFZTStMMWd0eHV2UExCcTNVVFJzVkVo?=
 =?utf-8?B?RXJzMDcxT1VsVmFQQjdTdmJrVjl2T2poKzVqeUN0bUtmMDBnK2dHNVpzSFNT?=
 =?utf-8?B?WkdDTEd3dm9LZW1uSFNjSEhnYXQyMVJGZ1g5eUcxaXduNmxhU0VQS3lCd1FY?=
 =?utf-8?B?QUNJeU9GODBDS3grTmNQRW11OWFxd3lFeFRLZVJCSDhNSi9ZVlNGMFV0VVo5?=
 =?utf-8?B?VGdneHJ2MEhsU0NlQm9NQVZVOVRBUDlUWWx4Y2tTbDUzYTlpaUkzUEVXZnR0?=
 =?utf-8?B?TllGOFVaNmt6RnJYR1dqZ1FtRFhCM0JWVUZkUEdvM2tNeTlpR1pxNW4vcnhX?=
 =?utf-8?B?VkM3Vlp4MlNRQ3VwcjBuMXdKVkRpeUtjRXNTdjB0dFNKcDlOMllQQzZvUjBS?=
 =?utf-8?B?U1NSL3dNa3BJS09NTlNILzAzcFFJeW5kNjNSbmM3WTM2UzNaNHVMSzlUb3U5?=
 =?utf-8?B?VFh4TFVkRTROaWo3VkRjVm1mamdMK1cwK2pJcnFkcDNadWt2aXprMFd3bDMr?=
 =?utf-8?B?VmU5L3k2ejViZWtGVFlZMURyQkd3L0hoaGtmWm1GKzQyZmdneUtPM2QwUFM3?=
 =?utf-8?B?QTBnRGxueEp0SWJpRCtBZFZQbjhBQkZEcTNBaU5Gemo4VlQxL0VNaExlVURz?=
 =?utf-8?B?M1NsSUlmRUVYOGJkZzB1NlNRYjRyL3ZSRnE3MFZkdkZON1BkOFBTWFpUMzIw?=
 =?utf-8?B?eEtCUnFycEpuNVZwTjliMEdCSFhGV1NUT2ljeFd6d0NTOXdXV1UrUTdjTUlr?=
 =?utf-8?B?UHFpMzl6THZKTDU2Tys1bUttckFndjdCNVFQV1hyRDgyU05HRlJ1ODkxZ1NH?=
 =?utf-8?B?UjhROGlqcHNpeFRMTWlteWJRVkJPcXo5UjVZYTFGcEJmMHJzMUR4KzRPZzZp?=
 =?utf-8?B?OHJXUEhyYkowRzU4QVc3TUlvTWtFbTJPYWZVRzJCTURUalc0UkQvN09HR2Zj?=
 =?utf-8?B?aTBZVWR1TlFkR3pYN0NRL0hOTk1EZHViOFNLOWFHSEQzdTJVWldpVnlxYUhO?=
 =?utf-8?B?Uk5DL0xlb1kxMldFTzhacXA4QVN3d05OR2loRXJBR1FkZFY4ZHhrVHcwbTBP?=
 =?utf-8?B?Y2EzM2d6WEtBZ0FzTDZiaWFIZlBMMVphd09xZUxxbXo3VnZOT240YTdjblQx?=
 =?utf-8?B?bTdocHBjZUNyc2JrYWtiQVdQUUE3R1Z5azBML01rL25uWSt3R2dZWGVPNFRp?=
 =?utf-8?B?elEvQUIvZEJFa1RCNjVZd2JPckRFREd3eTQ1ZjZYbUEzMWlIdDlaSXJiMUR3?=
 =?utf-8?B?NURLUmdGWUNFV1JKTU9pS3BYN3NwRmJPZFA0eE9EUUYyaVRHYUhONThiVG5H?=
 =?utf-8?B?RnVZR3pMNXVObmo4VCtBbmpnVTEvZ3pQVVRqMXUrOVNRV0k2NkRDYzlUMCtX?=
 =?utf-8?B?QWwrOWxubVpJYk84dWg4R1hiSUFvVnd6TU1XcjBHNnE0ZGVUZUdRR0JzaSsx?=
 =?utf-8?B?VUx5dXhjenNHUUpDYXlMTytES2gzbzA3V0lwRXQ3dVMrTUVWTG5LSDhyZnVs?=
 =?utf-8?B?QVJiRndIOTI0Ui95bG1oQXJqY0RhK0QzUDIwVkkzRXRLbUMrQmZrSjJuY1FO?=
 =?utf-8?B?SzFOL01tNkdrWjVMQy8veXBxSzZjSWM1R2Z0RFhnWmtNSkFCV2czNm5CM01p?=
 =?utf-8?B?RUY4aG90eFRuQ1JNcXFSQUQzK0JnZDgvamJNdVRrdnIwWXg4Znh1RnJRVFdL?=
 =?utf-8?B?dWFBSE96eEpvZXJsM0xOUlEwVzYzdWIyZ1FqTTJPZyt5dDdSZTRtK0RJTi90?=
 =?utf-8?B?aER4N1ZudHBpVC96ZEo3K1BHRW1SRXhnZnlVbHAvU1hZa3BabUxDaURiWWpD?=
 =?utf-8?B?UWRKdUQ2SHJISTNzODdna2dndGZ1U2xrZ2RvYllwVEhYRGY5Z1BKdW9pZlAr?=
 =?utf-8?B?bWRZVWpOS3JpZTdta3V3N1RJaW5ibzFKRUNwclh4VE8rRXFpSnozZFlmQnRV?=
 =?utf-8?B?QnVFUndGQnZlbVRzdUpRanRwejJsQWh6RTBTV29nODhYR0UxQjB6bjRoS0Er?=
 =?utf-8?B?WmFTQklZRGFUbDEzL0RmZ1lzZHVJWmpyUUpQT09jeFdvcWQzVVhDSDRyMEpw?=
 =?utf-8?Q?O8qvXXLi+Kpc4Q5c7/UPIlULn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf02d8f-1aed-44a6-0116-08de271c6c49
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:33:36.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GXOChnlZ46LXYoOJNHePQo9n6W6FdLw2l8hQNUqy1AM9Qx6bY3fVyFjZ9SpOJr2CmRMMdUzAee7Xz5/AssqKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11417

Add flexcan2 and flexcan4, and related phys support.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- move the can-phy0/1 before dmic, use nodename order. 
- Link to v1: https://lore.kernel.org/r/20251118-dts-v1-1-81b6249f455f@nxp.com
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..c87cf331a36ba5bcfe8a6a42b5e3b235a2614376 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -29,6 +29,22 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	flexcan2_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&pcal6416_i2c6_u50 3 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&pcal6416_i2c6_u50 4 GPIO_ACTIVE_LOW>;
+	};
+
+	flexcan4_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		enable-gpios = <&pcal6416_i2c3_u171 0 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&pcal6416_i2c3_u171 1 GPIO_ACTIVE_LOW>;
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -127,6 +143,20 @@ memory@80000000 {
 	};
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan2_phy>;
+	status = "okay";
+};
+
+&flexcan4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan4>;
+	phys = <&flexcan4_phy>;
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
@@ -431,6 +461,19 @@ &sai3 {
 };
 
 &scmi_iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO34__CAN2_TX		0x39e
+			IMX94_PAD_GPIO_IO35__CAN2_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan4: flexcan4grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO36__CAN4_TX		0x39e
+			IMX94_PAD_GPIO_IO37__CAN4_RX		0x39e
+		>;
+	};
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
 		fsl,pins = <

---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-ad4bd4fdacd6

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

