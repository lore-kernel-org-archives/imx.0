Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023082.outbound.protection.outlook.com [52.101.83.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B221CA13
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.82
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279965; cv=fail; b=e9GYhME6sv8iTlkVrg6VCh/y4HpSTVngJV6uGCPCDNjfg+l+CJ8Bt/ylTcpKxj3SmQnSYZkEhTK5fMJmtzuNQ6ZGj9tDTAIagpVmZVj8/KrDwmhzTxH839fDLoHA31vqVbeJLSJJy4zGjkW71tWo0mymNCBp3sAswb27BnLMBts=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279965; c=relaxed/simple;
	bh=Yj2tRsJwdZe7De7NpiDTEyPWMzZOqIqxlnL/7r2vHfQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JYEHkeGYtT0zytOFxyokAOuPDopSKc9FmvC+1NdxAakv4gw7cqsaQXZsQ3AW/JfRcMs4ZbhGBp3HjpQpa4m2AiQfAwEaJ6KjfGwiVDoxyf6ijYNEW6pPVeIfQOciqSuSiznLpuZEfKI6iynDQ+GYNm8fbJOWAZaDLwfLnh6nxQY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=mc6AiXJO; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=mc6AiXJO; arc=fail smtp.client-ip=52.101.83.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mc6AiXJO";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mc6AiXJO"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PGea8v7hNaOgd25G/9Zu1MlxTNwmXPx1f8YhpZMNm5t/0B445GtBI82UmJSa9MXZC1ZKywQUmElJ+LrXv2WbGvu6WAZ8EdyhlDe94JfTKQLnfk8q4IVgCBBAz0c/6ZeqTEeVb1FyxbWzmgJrPBjku2hb9RUzZQKSyMfCVSJ5VI9+rpdFW+hvqPn1czonHMIuqg1ut7nOiNrYkLaUNv0eXlmXSrgk4QlRtl4+nhDIKlmlvjWnnCMZOQuGoeJ1OoPbYCJrHaev5F9toH4dp4/GWeIC/UnlQuBgZrzlNOiN3agivQDc0sZDyuhWVrB/4v240KPvhikI4yEkolD0Z64Omw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEqfJyo3s98B+H7hhja+0U+6AcAav8kAcqOZvxUyorY=;
 b=xeFqTV2Wv9qW5cKHRY+H+45FBtMwFet4wBEe2zxIvqnN3V8hYPgppsPJx1GZ21bH3YB0DX/NWLPc+FYDm5s+M+qGN4j6UBCeiq4uGAfVYIXnoPnpxeaHMVGqMYeJj4EwTaPXFspmuKhDRgZTsgzBRr0WgOkR3oITCSQz9/om1MGdV6K7tYnyPxVLr4wKC9IRxv/uUM9glw0lbAJiD9iLP9YxlVBQPwvjFLXChdD1QtnAgw+HgsJFGQsD4omOAjGeTRM4LZCqgvyD4xoszbS689m5oerJc8qYtA4m7ixrttOiaPf5VwQIUaKVGwctYp3r//sB2XYE0VV4VPNl4FQTag==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEqfJyo3s98B+H7hhja+0U+6AcAav8kAcqOZvxUyorY=;
 b=mc6AiXJOdUn1f0J9jrkJHzoV2qtVzRbVNI0/VNNulNQZCjtLgv3ia5k49lyMBkJem8LxWkeEZiaCFKaCsWHTpUfuoZnRHjtYP8G+tZ463NB/2OF/lJrE6TPrURDkk9WtPe8Q7FzQPFOPEwQb0unY+Ug9Ywc2NX+OAVrjeHRSJpg=
Received: from DUZPR01CA0230.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::7) by AM0PR04MB7076.eurprd04.prod.outlook.com
 (2603:10a6:208:19a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:00 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::6a) by DUZPR01CA0230.outlook.office365.com
 (2603:10a6:10:4b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:06:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via
 Frontend Transport; Thu, 1 Jan 2026 15:06:00 +0000
Received: from emails-3322220-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-24.eu-west-1.compute.internal [10.20.5.24])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 35FFA800D2;
	Thu,  1 Jan 2026 15:06:00 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279960; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=CEqfJyo3s98B+H7hhja+0U+6AcAav8kAcqOZvxUyorY=;
 b=lc3gvtmTLiyB6TFXjcm9A67EzV0OG8zGlEo5j8AjjouTApkw4JTNoimq6pq0pE6DE8Y/F
 xM9vOR4KHRfYHbQUMCptSqLwiIzCVTN0t+OUhj1BxHBSV1gZooLXonMGoczdjx9VnAi/1hA
 rlMgFg+HwdF5APFzmoTfra4VVIAxblg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279960;
 b=GPOV0fKo4IFV6OQmQxJFYbrBDD3ZlIOEcBaLlLXpDl1okj+g8Wm77VlVfKTvpdFORjzAN
 tXzf+jhBVzR8p0MZI1/I1YK/YPPL8JPIwRw7hSH4Qx+AejK/KM37vfN7WlRk/YsNHfZ+aez
 pzEGMsl/OELX+zwm0RLBvFrx4ztQR1s=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5AwQSieNOKpkU1QLkRSMRpQ/NGUiiZU0vnOl2plBzI1/RtcrJeHomk4bqE3X8yM7fKbX7T7BLVSjQU4andLGKw7YqDYLn/dk3hSkBnF5mwzWvzmDOve1gdmIKMEvVdzj2Ze1Bg50BmXJfiU6yqPFy9W8IUHbglP5wJRO/ymd9CGa7AAS2WUi20ZTUahEWyM/lHhSmP61X9LMDPbdmpFC/AdW6fJU8EflDgjJWJN+fBdgRHqJX4iQSktqnNYfi3Pr9tpTperuNZroHvZliqarEoXii7TG1LcQNgiDQmFM11z26BwGfvCaCSTzF0cjdYLKQJbg3ujR4Zc5fuEAJgPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEqfJyo3s98B+H7hhja+0U+6AcAav8kAcqOZvxUyorY=;
 b=yHVO1d6MRl5zn3oqk12DRmau8nNQS+heYczUV6p2mTWMkCQcIXRW31flwplwwERe6lCoPTDQYaG8oSHsPPwT9/Ic02wK4jFEUv7WGwVioZQfJZLmjiHtty21wUq7CCpULMLGiCwfXXIt4IxkqoEd+SjmsAZJv0s4jrciwM4KhSXNSwp/BME/Kuf2UEKIeHK/PCAkryF3fRtj7AAdQW6fYTszwl8HGCu/YTvY0Ed6/UCfJUpbOChC7Hyb5WxYWbGqw2807jD1eAABw1aFSiZkjl5q1WUhY6ZdI8H5Of+IaFVevtDgie3QZAyR2OQHkru0uf9o4I5Kt/6PGhlskWplcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEqfJyo3s98B+H7hhja+0U+6AcAav8kAcqOZvxUyorY=;
 b=mc6AiXJOdUn1f0J9jrkJHzoV2qtVzRbVNI0/VNNulNQZCjtLgv3ia5k49lyMBkJem8LxWkeEZiaCFKaCsWHTpUfuoZnRHjtYP8G+tZ463NB/2OF/lJrE6TPrURDkk9WtPe8Q7FzQPFOPEwQb0unY+Ug9Ywc2NX+OAVrjeHRSJpg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:50 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:50 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Thu, 01 Jan 2026 17:05:40 +0200
Message-Id: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAESNVmkC/23MQW7CMBCF4asgr2vkGcfGYdV7VF3E8ZiM1MTIp
 hEVyt1rkBCIsPyf9L6LKJSZithvLiLTzIXTVMN8bEQ/dNOBJIfaAhUaUGglj2c3HuXgJXM6SYP
 GK+2JOouino6ZIp9v4Nd37YHLKeW/mz/Ddb1Tu1dqBqmkdTo6q83Ogfss6YeDzL/Ttk+juHIzP
 ghQawIrERxqHSi0bUvvCP1EwJrQlfARuqaPJnbuLdE8CFSwIppKGF2FYHsEH1+JZVn+AQjlaod
 5AQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|DU2PEPF0001E9C4:EE_|AM0PR04MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: c115f6f5-e33a-4e23-db9e-08de4947464a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SGVNeE5IZlBvN3dJL3hPSnBLQzlzL0o3KytMTkpDU01HbG1nN1dDMnNySjdM?=
 =?utf-8?B?YlFmcWV4TmI5NHZiTGRkbytwOXM3TTh1RGVzMVMweFM2VUNGMk1rRU04cXV4?=
 =?utf-8?B?QVpXYWJBdlJPSU5nRlBBRUMxMVVYUzdobnhWb0NRbVZRYlUrNVhsOCt6em9j?=
 =?utf-8?B?QjBaZURnMTZubCtVZFI5QXVTOG5saFhuR2p4UjJ0ZkdqN2lhRW1HS0d3M1Zv?=
 =?utf-8?B?QlNGei95L2sxUEZBeFJYTE51RmV2YTBmN1hUYWFUYTYwMHNnZUZwVldOaWpn?=
 =?utf-8?B?djJsWEJwYWxuTTIyUFpnQkZXZEZLQTRSUHliOTVJYW10N2JLUUFQOHZBZlhP?=
 =?utf-8?B?c0xCZUhSZE15SXNlVGU1OEhpNTh1dFdJTlNJTU9ZemdFS1lIWjJoQ2l5Vzc5?=
 =?utf-8?B?LzhGMVVPR09JaklPR1BTQU1VdExPUnZQSkwzQXVZSTJVeXFCVmxuZ1NyMDc1?=
 =?utf-8?B?NTVmOVV1TjI3MEVsVEpFcmdaR2ZEaEUzNVNhRlV0TkxIS01CcG1uL0JKOGpX?=
 =?utf-8?B?NUdRZWltUUdSNVZkVThSNkVmVTM0M0JKVUVPMnB1WUF5NlVkNjdSUGFWS3Vw?=
 =?utf-8?B?Vy9ZdHBUQjlwUXBqdUcvcnlCWEJzQkZDQVl0SDBRUnhoMks0a1JxazVzN251?=
 =?utf-8?B?UWRieGVBekU1dFYyTzlPa1RHSmpHeGdrZUpnSUZoOFZpNElmOUkzUGZVTWRl?=
 =?utf-8?B?MXg3RkRHVEdGajdQZllKQUlrQnZ1a0UxMVN2TVcwQ3hGbTM1OStFeDdBcXhj?=
 =?utf-8?B?cHh2UjlMTWhYcnhUY1RscFRnb3FpVXoyaTZJYTlMVFNsVGpQMVpwa1d0em16?=
 =?utf-8?B?a0RyYVNPSVkzK2c5UWpZS0JUTGhTR2YyNWV1QmV1T1JuYnNqME9yZC81RER2?=
 =?utf-8?B?OXlOczQ1NVh4b3VQT2xSWTEyOGdnajllK0Z4MkJjcWNRK2c5dytWekU3citw?=
 =?utf-8?B?UVNUR09SeTlYejdLSWlvOVI1VUUreThzd050WmJJelJZOXIwQjVPLzB5cG9O?=
 =?utf-8?B?blBoalRpZy85QitreGUyd0RFZ2JhWHpHQTlyQzdZcHRjNDFTQzI4a2RuVUZZ?=
 =?utf-8?B?QUpjNmhXOFVQU1grYkdBTDc3cXJWalZEWXNUMndRV3AzSHdHblhRcENqa2xs?=
 =?utf-8?B?RjA3RXFmQ1pIR3V1NGxSdkhSWkIvQzFVeHhSMkhYNE1Ydk10TjE0dGVoVTJL?=
 =?utf-8?B?SUpPSWYvZWliL0ZNTThPbHhicWxrMXVpcm9GQS8rUFkzcDREUDRCejM2eENz?=
 =?utf-8?B?a0NwM1dvOXhYU1M4NWVkRnFjZXhQb25WNWlMUk55dTBGdkI2WU5jcnVlN3NY?=
 =?utf-8?B?N05YQUF6V1IvZm14b3pBWnZhL0RsSnN4NXF2eUU5UEVQZGF5VmtoYkpzMCtE?=
 =?utf-8?B?RCtQM0k1Nm1GcXlvbUxZS2k4K1lGUXYzS3BaVk56Y0llZjBCYjZOZHdTWnVR?=
 =?utf-8?B?VXlDbFlpcnBpR0hhdEhQc3FpVTZuOTZVOUttYXVJOWkyUTlKNU5BQ3BrbEhN?=
 =?utf-8?B?MXN5a3BrNTBNNGhoaXdWeGYzSHhJZkNMTXlTT2FDTHh5UTBRTEVEVzgzSzRq?=
 =?utf-8?B?WGFFMG9MSjdHMGkyL0FCUjMzcWtnbnVHWGs4d0cyaS8vQU85UzhsakYyaXNi?=
 =?utf-8?B?aGhjLzZONXlCREdJTmdia2x0VFFHODR1aXR2emp0dDlaaVY1QW5McW1pbkRZ?=
 =?utf-8?B?eFJBWC9BRzdybnZXcWljVmE0dFdxemxVa1ZDbURhMG9RVVdKZjRMR1czNk5S?=
 =?utf-8?B?QzNJbHVtaWlLZHZGZmlabE1DRHNhZEY2b2dOUVliNEhjNmtFSkpUYTQvaHBV?=
 =?utf-8?B?UFNxMll2RUF4d204NGtWR2pBZlVhb2VEVzFZN0xMS2I1YnpaWjVDMVVXYUpr?=
 =?utf-8?B?U3NmUlNQYm9iOVhUK1FRN0FXNGVoY2JhN2F6dkJrZHhwQnJtaFNZTzRtLzhK?=
 =?utf-8?B?SjFSOGh1b3ZXVVlwbUljSkNGYi8vR3JOU3dIZVVLSGRQMFE5N3I1YndHL0Ft?=
 =?utf-8?B?UXZyeUV2WUloNHp0OFN2Q2thaUZOSlhDSmVoU1JnNitUa2tHS0dBMHYyLzJY?=
 =?utf-8?Q?WvIrD6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7135705297884b13b19e084c5be5731a:solidrun,office365_emails,sent,inline:26930c0537ba504e631f24a22efeedcb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4474994c-52ab-486f-19b2-08de4947401d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3hvWHhzK3hXVzB4UTZxU1lFVmlxZFRreEZoMWt3c2IzcnVySUVHc0hXSnBu?=
 =?utf-8?B?dkwwVzBvSHgwWDdMWDkra1lISDFPNGo2eEpDazVsa1I1ay9kTHVLcDlUeUJi?=
 =?utf-8?B?dzRQd0tLVTl5YnhCZWtsYTZCYTM3UitXb2E1THF3Q3dxRTQ1NHhPbHdQdjlU?=
 =?utf-8?B?VWlFeWVZWU95TXhzNzZiT00vU2g2dTNGWHhSNWp2YUJFRldOYnprajVhaWtz?=
 =?utf-8?B?d21sTFpHMVJOWDRGRlJuZlpxV1RMNHA0M3JPOFNkd0RnNVZqWjJBcEc0OEE1?=
 =?utf-8?B?NkFHaGlBMXVQZzg5bDRzU21pSEpVRURtVGJYV3FMWFVmckdPZ1Z0OU9ZRW1t?=
 =?utf-8?B?Yk04cHZWTFNZazFDOUdIZzRMaEdRN05KNEVLb2xYdjY2bnlYVDRmYVl3RW0r?=
 =?utf-8?B?OVNERGxNWk5zM0I5cUJXVVNvVmYzV1NRWkpOdzZhdzhhNkllSkcrZ29SRmhH?=
 =?utf-8?B?bnRSM1J6dzg4dkgyTTJTTE82ekxWaG0rc1JlNS9BdUM1WGxCTFM5TGtVN2lx?=
 =?utf-8?B?SCs1WngrZGdYeXdWSTRKNlhzNlpOYkR5TFJRMXhNN1hEeW1Qam1SQVhhamhH?=
 =?utf-8?B?K1EvTS9KdVM2UFdKRCt3R2NmUWduOE9tUUswcEFWVHBTSmxpaXpTd09EWktP?=
 =?utf-8?B?QjFOMXh0SWEraVJqbXRuVFhTOE4yc09FZDFFUFNPREsxclRidTRNVmVIVC9Q?=
 =?utf-8?B?UFBjby9DbXhtRkJ3NHUxWUg2SGllWmI3VzVWaDhNanNuUTZwcGhwRFpHWjRy?=
 =?utf-8?B?bTdrTHFtVnA0M3MzRjB0cWJySm5TdlVUTTF6aEtBMjFockFVSmRBTGRwZFZH?=
 =?utf-8?B?bGNFUlg4WEE3Mng2TVdtOGNMbGk0cHVqMGxkNE9wcy96YlVMU3FXbjVxbmxv?=
 =?utf-8?B?clN4cjBJNEZnY0IvQU9qVVViS2w1SzQ4ZmlNR1NPWWR5UGhjakhreTJHTlVF?=
 =?utf-8?B?YTRJRjJldWtwd0J2d0VxN0xnZHBIeG1CdGlkSWlKWFVXY2xGNUVDbXRGaVhJ?=
 =?utf-8?B?cExXMDVqUG5keEJ4bkExelVSMTlkQnAxb25vUmx3d3k1dVlIOU9TNGdYOHFH?=
 =?utf-8?B?ckhiQnNEVjFoM0NGZTBuNzhUK1dUcmxxYkRYYW8xUkErVkZnMm9RbHdTQ1Js?=
 =?utf-8?B?SzFzRU0yMHdDODR6SG40eFdGZEUxZXpmRTRGdy9jWDU3ejlIOTY5bEtxNm9a?=
 =?utf-8?B?WkY0aWNXK0ZJYkRuSlMwSUZMdGZ5ZXRYZFFNY291bFFKOVd5WitUaFFlcEty?=
 =?utf-8?B?dUtHUURrZnNyQm1rcXRSQlpQYXFQSk5hR3RjWnY5eFQvYXkvcWd3b3RWV21S?=
 =?utf-8?B?MkxKS2t6eVAwKzhYdnU1ajNXUjlLOFpNdWdzSjcrV3hFK3dXSHQ4UkZGVmlt?=
 =?utf-8?B?ZmdEREpKWDVJeEdxS3R4N1dKVzYyOUxxNk02dG1IREpUWWdGSmtPR2N3REJz?=
 =?utf-8?B?eENETVl2RjVydVNvSWJoWGVNTG5OeVFkTHNkTEJwMml1YVM4d0hzSkhIeTZD?=
 =?utf-8?B?RG1UVEttbmd0Q3V5QUdLOXppV3lvUHlZWUZBV1NYREdhRnJiNEd6d3AwOEpa?=
 =?utf-8?B?Y2FzMUQ1RlI2Sk9wRzBNZzB3YWYvR3Z2Wld6M2c2TkJxNmZUZTVmSHdFOGYz?=
 =?utf-8?B?dERIaXEvR215TjZ3c0NKbEU5MkZrWUdLSDhLcm4zdFhqZVE0QkQ4ekpLdE5a?=
 =?utf-8?B?VDdwTUVab2hDdUVFdFliVWl1Uk0rY1dBdTV5V3lzUG1EMjczVmxjWFZaWXNN?=
 =?utf-8?B?UzZrbHBsbHRkNUlnbzlVMXcxOGhQMWR1ZnlVNlBCT1I4clArYWQ5ZkFBVVM4?=
 =?utf-8?B?NlJFeE9UNG5uVkVUa0tEbEhBc0dwaHZZdDhrWlpjTGduTzNRTlZUcG9MRmlF?=
 =?utf-8?B?Y25ham1vVGtmY21zM2NuQ3gzZXl4dzNEMFZlOURlVUxJMmpadE9pQU4wejFB?=
 =?utf-8?B?VGNUSU41aFhDWDZpVWdHaHVXanJDeXR0M0pnQWxHakRiUU1BMjdCc0I3N0Z2?=
 =?utf-8?B?cGRGa3JMSHE5N24xQ1Q4amx1TTh5MGhUa1ovTzFpOEZUbTNielJoeTlvdW1R?=
 =?utf-8?B?WUk0S3RxNlI5dUJXdlJGdWh4T1R4QUNYM25FNVNkcDJEOFgzSnlyblpoRHVQ?=
 =?utf-8?Q?bj2g=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:00.3558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c115f6f5-e33a-4e23-db9e-08de4947464a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7076

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Josua Mayer <josua@solid-run.com>

Changes in v6:
- imx8mm-hb-ripple: sorted i2c devices by address;
  removed unnecessary newline.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- hb-iiot dts: sorted aliases alphabetically;
  fixed gpio flags for vmmc regulator;
  specified led@3 reg field in hexadecimal.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)

Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (7):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 13 files changed, 2538 insertions(+), 9 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


