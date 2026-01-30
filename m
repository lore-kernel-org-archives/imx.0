Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC5349AEA
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765854; cv=fail; b=pgsoAhvOyIBgJs9rjK17XttvwdeuFfCamHb8+PZob3UzE1TO/oBP/Lq5emms83DYHocDADtQpbliy8a7oF+J6oNahKBhWzaiTkBMxLr2Hmo/BkYTI1HFZro8wqE4KNHGBpxYD3M8cQR0HDdSmMJdA8gwX3Td1BVcHqIoKg2hiwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765854; c=relaxed/simple;
	bh=/ABkB7nHn+ee4g5BEUneuRRR6P8Ey6pN0fDMu2zd3q8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dFBTFckQeT/GDYhmJKkOEc/hp4ks+TjM/+bCOE5set3B0j+LAjSkPw5PrldiEkOTUwoSo4O1QsbWfm9lN/+P263OMJKhhNzuACPynorrExGxs8tRygvMvc5+tryYMkjZaQUEziMkQLS3Gzj4PlVX0qPARuEOi6BlWlRERKOkg0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j5q8OjKw; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j5q8OjKw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJNLiJpKcd4O412QXMMk7OAtIfiji8e0f43KdNhbv2nG7WzaUcJJfdPnJHlz0lnO2IMLhCcqGOKE5JWAVahRZIIAeU0IMHTPYREvndYo2+Op5AwwKCNLY/PTEPwH8C6OeqaoXy3zeYmq/qEWHbojJCJG8WK3aCfcnLXGCYJskUITURXhKF5RoUikrnaJBnwLfT0RKIRuQfX9Zxw8eInRajO3+N2bLdPzKI8UG9q5nFTAIieVAKbdaL2I88kEdvzdHusMSMGkYPO6LUS+0vv0yoWWE5jsfZ2FCHqfrJ5LPwdq/ayTn2r4pMSgC6O+ub6Ph5iqe0cS7qD0iXNXES8Y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07lMtei0UDDIcRC+IpYNWHGXekxhpQAlqBOQizdb6PE=;
 b=rdEGtKco0SECkFIbzEavR1mSQN65K7vazkQNKROw26IaSi5JpzZSfE+mmQ8/x/BJS5ysGEBNWGEB1GD5OVfulah8LIPdVnXsJgZC1Bo4I/WMkDJrt5+vymqWhXatOK5jo1vgy1ZkagbDvCanQpr177W0annikDx694hG2nsjb5Bcr4+Y17kzWGWnMLXuXEoQShhGyP1C5BJiMu89r+uU9nYwvHC+/3fX8wG9VAng88/xoRCseUPxz04scjJ1ZbjDYhgdSZLN1PUTo2dCNmwLvIq6aCPvkauRiCgsayysJJucXOovLk+Y+JII133RwWJF5ZQMdhLrWhkgMmrgfBlE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07lMtei0UDDIcRC+IpYNWHGXekxhpQAlqBOQizdb6PE=;
 b=j5q8OjKw5UrsvHW49dddb9/P+lPXKWF1ibJs8t4VIYf+kOp6H6a8T9NhVeCydD90aMvSYm6M98o0UA8+mICMRkvrZrDtmdEicfccGRTS7BFsdNRSs8+EDjAC4VGVlpf9uDb3x6jel1PIOfT7pIYGp8nVHCWmEzFn1HYSWpastQO9RMtsYHWDMvZFST/lMEAoH107Dvup1zVHwwgQt6A6rEpJXxT660EsqvkqLVRxysk8vLLbK2SWExt6L4MQTQxJBAwSQZ7beciyYLQwIIjoGhhMiwSSKCHYv0NRLxeZ3yPmc3daih2RnmLTEr+qdTTCvfmcUuKyNRNOuyFeF7HZ6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV1PR04MB11038.eurprd04.prod.outlook.com (2603:10a6:150:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 09:37:27 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 09:37:26 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v3 0/2] Reserve eDMA channels 0-1 for V2X
Date: Fri, 30 Jan 2026 17:36:26 +0800
Message-Id: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJp7fGkC/42Ouw6DMAxFfwVlbirbkJB06n9UHUgIJQMPQRVRI
 f69gaFdKKo8XVvnXM9sdIN3I7skMxtc8KPv2hjSU8JsXbQPx30ZMyMgCUjATcZ9M2nBA008dYA
 2N1YqhSwi/eAqP2262z3m2o/Pbnht9oDr9ocoII8jFZYCjUWkazv1Z9s1q/UAEWTiVRjKC/gga
 3OgozaKaCFSCxpA7LelO4gRlNsqK5XU+k8EMp0XWmEmpfo+uCzLG+9JpEt6AQAA
X-Change-ID: 20260120-b4-imx95-v2x-3e01c7bc6881
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
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV1PR04MB11038:EE_
X-MS-Office365-Filtering-Correlation-Id: 058f0bbc-a9b3-45e5-d72a-08de5fe32d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1ZSRjlKZEZIZURqV0pmdXFXbmJKMTk1bkQraG9JNE1TTWlHNGdPVUthZ09t?=
 =?utf-8?B?V2djWEs5Nys3bXZ2VnNvUGlZV1V6Wm0xU0hBZE9sanBjRGc5cEdxNGRFcWls?=
 =?utf-8?B?UStqbGdVcHNCazZkSHB5bUdPOU5iTHFwTTI2T01xeUhIZGpJemVTOXk3WnBw?=
 =?utf-8?B?dmlFbU4wVmhodEFWVXc2bmFFbHVKU2xvWElEb1VEZVVTbzQyaG5UOWhmcHZB?=
 =?utf-8?B?OWFGdVVOczlUYzB2ajBkTDRjb3BqNVlkYVRRS0lnWmhhRFh4WHcvcHFMVk9X?=
 =?utf-8?B?MzVBMXEwNEZScGt2eTlEQjV2WXJ4V2JVdmhVLy80dUJJZ25XZ1YvSm1UWkhQ?=
 =?utf-8?B?SksxbWh4S3NxeHp0Q2dWSWxmOHVqeGFEY0t1eDBWemNpMkUxR0xRR3Q5ZnA3?=
 =?utf-8?B?bXNmTmpBdU12RTlFTXcyb1V2UVpFd1ZIU3paZmZNSWh2a2hUTDNBazNYS2xC?=
 =?utf-8?B?QmYrb0ExeGpWemdKcUtFSEw1V1ZyK2pwem9reDllMjI2bHNiSCt6bUtKOVF4?=
 =?utf-8?B?eHZFckdwNittNUM1VmxsbVNZdWhvbDRLSVVnb2E0MUYrV0hDdUZEaGVacFlv?=
 =?utf-8?B?Y05rM0lKQzJXSVRQcFNaQWF6amdQdnN6T3VOSEU3QVRiUFFTWEVvRXdORk4v?=
 =?utf-8?B?aUJ0ekRYSVJncFZXMStnWW43bWpwOFBaRHNUTHZQMzkyeWtPS1IraHJkUlJI?=
 =?utf-8?B?UkVDMGF2WmswZlROR3JJSzFuY2h1SERSVXVxcm9XL3V5cUpLZ1pWdTBIdEEx?=
 =?utf-8?B?VElSRE50QUVoQlk4WmdXOU1KSTdyMHExdVRBNkVjOXQvdWNJR2JSaXMyK2Ry?=
 =?utf-8?B?WVErTnZNQm9kWFBYWENCb2lWZ2xoYXZuc1ArbmNNTmoxYUdGVWoxS0ZMZ2hu?=
 =?utf-8?B?MjFWcm1KSDF4a1N4c3FvVDJjQ3ZiU0MvMUJHaGo2b3RicXIxZEdPMnZEYlRy?=
 =?utf-8?B?SWpsN1ZycXJZMnYwNkd3VllwL1NibjI5bTdKV0NGRTNjek9PNDd0bXVxdVhF?=
 =?utf-8?B?WDBLMGd2QXF4ZFBpZ3NqeHRxSzNFMWRnbkcrK2ZDd1JPQ3lIbDdCdFQzREJK?=
 =?utf-8?B?dnFXZE8vYStobHBQc25ZVFVBWmtNckU3RWx3SGVVMGU5VElyTzFqd1o2ejJM?=
 =?utf-8?B?Yjk5a052dWFRODZHakdWN3FpZGlHMkp6NHM4UTlvOVJxeW55cEQzL1RZMnpn?=
 =?utf-8?B?NDh2Z0hpRGNwT0p0ZEl6bG5GMEU0MEpRS0h0R0Nva0F2dGZOSkVhTkk3OU1C?=
 =?utf-8?B?K2dEUjM5TDM1NWJ4YnZSekFHbkxJOU5La1U5NE9aWVJ6K0dHYVdxYTJQKyt2?=
 =?utf-8?B?SWY1T1N4L2N3ajZWM1RtbkNBanRCOWhESS9UdHVKTzRaY2hvdnE0dkdsQzJm?=
 =?utf-8?B?M0RiNEN6dTZCRnVnQXFFMDIza0JjSHJqaURqWWF0L3hYaEk0QkFnZk9SUUJT?=
 =?utf-8?B?ZUtvb3ZwcExLbGdreTFKc2YyOEVnSHVIcTdYWG1MbXpocjIyUmNnK1E5TWt2?=
 =?utf-8?B?Vnp0MnJFOFNSZjJnZi9abFFIcnFhNk10dmFIK1cxZW15a1hPdTU3TVhUb3Rw?=
 =?utf-8?B?V3RjTmduNzVuUndnN2NjN0dRdzdBQXNEYVp2NWxIc2VabTFwbnZxTHpFUlpo?=
 =?utf-8?B?MzBOS3ZjeExETFZkeDhZTFI1MWwvNVBFN1kvaTJHUVVrQ0xVMWpaSmZNMW1H?=
 =?utf-8?B?NG44N1lmcGxJRkxWcHlKOHNkdkFCN1d5c3lnT1ZlQUlxQ3NVUEdlOTZ3NUw4?=
 =?utf-8?B?RGM0YW8zSTh0L3VBNGErQmowbThkS1VyU1dhK1lhUGVnK3lERHN4aWJKV0s5?=
 =?utf-8?B?cEpIYTZOdFUyQXRiVTRIZ1BDV3BIbitmbDB6dHdlTnlNMSszaFhQbHZBMmRm?=
 =?utf-8?B?eVVPMTBxOW95cElhQTZrWmtHaE41djF5UGxPTnhZbDRqM2lkbklkSHRuRDJr?=
 =?utf-8?B?Um1nYkVoNlZncDFQV1IxZGNXckdoOGZJczEwSUhYWklUVnN3TXVyYW1lcUt4?=
 =?utf-8?B?aU9OdzJPeHdrM3UxTjRzWUUyMGdicVFwaURVbWpvSVo4NktTL3Uxbzg2Ui91?=
 =?utf-8?B?WmpqSGxXYzBiTlBOeWhaZ21OU2NPMlJuYnZ1U2lHVTBYNUMyMmI2MDQvUndN?=
 =?utf-8?B?QXkxT1dlM1ltV0RScEtQa0lmMEVkQ21kWWF0MWlHZnhpditCVTFPUndjaG01?=
 =?utf-8?Q?4b0NP722+d8XTKwB/bkFFh3iwsaV34iUqzIWFQK/X/0O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T25La0pBaU8rN3FkK1h3V3BDMHlrRXNDbmtkK2QzTVZyWkhneGEzcmI4RURR?=
 =?utf-8?B?alhXR2ZqaEJSOGdReS9OWWZNNzlOd05HZWw0Y0IyNFgwaFhHeE1HTDlHbXFM?=
 =?utf-8?B?WCtnaXc2MnRSVEhzRDN3c0ZXdllBNFNkVDY1SFM3TmFUMzF6WllBbUhSOHhK?=
 =?utf-8?B?L0F0RTBIbVVrRVhHeC9NQVo3dzc5TDM2b3hxcWRlOVpLS1IyUkM4aVp0dWh4?=
 =?utf-8?B?YUp4T3M1MUV4U2wzNTVNaVREWjhrTk1LcjRzL3k5K3Q5ajhtbzltV3BSREt0?=
 =?utf-8?B?NSt1SmhpU3pQSDVZT1ViVXZTZXRIM1RQMy9jWG11S0lOKytic3Nub0lESnF1?=
 =?utf-8?B?QzgvelRCdkxJS3B3VUF4OEF5eU80dXdEQmxXUXlmQ1AvUTd0RHo0TzBUT0sw?=
 =?utf-8?B?eHg5SWVaT21WcmtTcHozQjJKZ2hqU0FiWm1PYThHeVFlMDl4TXpzVy94bTZx?=
 =?utf-8?B?bTNrNzRoYWNIN3BpUFhDQStZdEtUZ3Fubml1djYzcUVvMXFDRko3YUFHKy9t?=
 =?utf-8?B?N2cveTdYQyt2OHRGSHZ6YUo1bzJpMG5TT3dma2Zqdk1Zc01PTEZnNE5EZnF4?=
 =?utf-8?B?MVEwOEZhTEszMDlOeG1sRHNyQXlyRUlFVnk5a0g1L2R6Zy9UMmlGM1loSFk0?=
 =?utf-8?B?TlN3NzNYY0Jwc25zdFNOenpHZFpLQlg0c1l1OHl6YmRrTTFWUnhqc0lWUnYv?=
 =?utf-8?B?VHpZS1UxMDJ4TFJ0N1dKUWRVZm9kY3VwSzJBMGJUc0lYOVhqRDhVemxKYldC?=
 =?utf-8?B?ZmNTVnVTYSsrTWhXR3laUC9GRm1kWG5yQUp0ZFJSeXplS3FNZVZnamY1Nm5q?=
 =?utf-8?B?VW1NNWxVa2NVYmMzaEZwb0VtRURhTi9pRmxWVERXZDRQNWdZUmd5UFd5M05C?=
 =?utf-8?B?emNmektVMW5lVzRoUnJsektlMXJDR0phQXVmL2VISVU0akdjSDdTUTdYK29Z?=
 =?utf-8?B?WVorSTd1TDN3WHdrYjdjQmRxODcrYnVIaGhJb0dLSGdhOWI0aGZnZTFhTmZm?=
 =?utf-8?B?V2NiWDhudkd6aThNWTRQRVlwNkV2aXBxTjNOeWY1bVd5ZUpyekRCenBsVzdy?=
 =?utf-8?B?ODlyR3NFSFo3MHF1SmM1cUhHKzJROVZ2UlMzL0tScE5HZi9BSHRjeGZUaS9K?=
 =?utf-8?B?SXdiQWJFSnlRZnFrU0Y4RlB2b0t6S24wV2ptM3BjMEZoTGtjK2d0Tm9iZ3JY?=
 =?utf-8?B?bElCVkJYc3RaRWRtTUw3MmExSnhYQjlHZEpSZXlGbFRRUEdqWnQxSk85bndr?=
 =?utf-8?B?QkVnM3owR3kxWjQwdFF6THFvbGtXTHV1aC8rNWdoZWNJamczZ2QzZGxTSjJv?=
 =?utf-8?B?ZkMwenZtKyt2RGtvYlpyVVg1ZlJiSTNMOHdCK3RuVktxaDhNZHlHVDVuVkZZ?=
 =?utf-8?B?OHJUNmRuajRaS0UvY2U5SHU3Qm5NWmYxNHBWKzVKQ1NBVXRac3NTbFVrU093?=
 =?utf-8?B?MkZ4ejI5dzdGUHBuQmFCb21pVHZ1VnpGMVE0L3I2MFZxekJ5eUQvcmVDSFQ3?=
 =?utf-8?B?NURkTXBzR0JHS1F0dkFTTEJlckhPQ0tFV2VTSW9VQlo5WmJYMWZRb0syU3kz?=
 =?utf-8?B?cnFtNTluNklyVUw5anN4RW9XNDBTZFFOYkxlbjBiWEx3bEZHYVlKT1ZtZ0RP?=
 =?utf-8?B?ZWoyd0tHcWFVQXJhd0syYmMxRXc3ZnZxMFNuMHRsbXl4QStyczFlZWVMeVBo?=
 =?utf-8?B?VEYzOStSV0plWDNpUzlHZU9yTTVMNWZEWFZ4NFV1emJDcmFzM2ozN2FUQUJF?=
 =?utf-8?B?alJSSnFwc3BTd0JqamhHM2Y3UjJoRGw2akc1cklJaktNRS9lU05xM3FMa0NH?=
 =?utf-8?B?aThyTTZxQ2ZFa2pGdFBiQytVNU1pQzNEYVR2eGVtRUtDVTV4a1V1M1dicmFP?=
 =?utf-8?B?eWMxQ0hSdVhLYzFoS2hDZ2ppY3pVN0dKbnB6RDZRb0R2ZHVMVUdmb2kxSnVw?=
 =?utf-8?B?QnNLZktNdnJmSnNsalpuakxOcTZZTkxTRkE5ZGVJaVBaejkwZUFxUTc4N0N3?=
 =?utf-8?B?M2Q1QVZtc3R4MjhmdjRsVlJDbFlUZno5NlhJT3V3eTY1U2lkNE93S2E0TFlT?=
 =?utf-8?B?OFYvRmw0SklmWUxYSVFTQ2orRk1WSHhFYUhhazd2c1BlUnU5Z3hlSHFoei9M?=
 =?utf-8?B?R0ZCcEZsbVluMU5MSUJHaWgvL0FrdFJYYzRWbk9GYjJBbk1BV3RWa0xLMUkr?=
 =?utf-8?B?SmFRSVFaYUJ1cFc3YmlxaUdyNW1MSHc1dXZINkYvRDNqVHNjSUN4QnRTRVd1?=
 =?utf-8?B?YjN4L2N0cWFFb040Nm9DS2lrQk90N09palowZ00zS1V4eWFiVVBFOExGSWpq?=
 =?utf-8?Q?k0tke2LhLU5WU1cM44?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058f0bbc-a9b3-45e5-d72a-08de5fe32d7b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 09:37:25.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRp+6B4IR4TQOm0pNDKkNivbzToo7zNmZRXZZm0S+K4EuYPuet4LtJsJwlgDiGtv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11038


---
Changes in v3:
- extract the imx95-19x19-evk-sof.dts changes into a separate patch.
- Link to v2: https://lore.kernel.org/r/20260123-b4-imx95-v2x-v2-1-0497a9814668@nxp.com

Changes in v2:
- modify imx95-19x19-evk-sof.dts dma-channel-mask property.
- add comments for mask channel.
- add Reviewed-by and Tested-by tag, tested on MX95-15x15-FRDM, MX95-19x19-EVK.
- Link to v1: https://lore.kernel.org/r/20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com

---
Joy Zou (2):
      arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
      arm64: dts: imx95-evk: update the dma-channel-mask property

 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi              | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)
---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-b4-imx95-v2x-3e01c7bc6881

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

