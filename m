Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020138.outbound.protection.outlook.com [52.101.84.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9132C937
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.138
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740728; cv=fail; b=gkQIip2g0bscMRhLkZtHmY8MXpWiEBXS2EM/NfECQGEGR2Wq4OCKE+WmH8JK1WEniFi+eS2r70GwMIQiADS0K7K6SJSppfWBjlx1nldVSQm5KEZoqDpPtR58bQi+gnPKCIW+uonvl9DDIPaWodKWaS7Be5E2FGaCnbDnrDu4Pp4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740728; c=relaxed/simple;
	bh=y875jegYMVc4s1sjDbbrnV5ETzmGW5ssCdmRLTdklas=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z7lOBOD6b5w18k/YQZ2R0G6KM8jkZ9pqaBsb2mVFyAeCaPi7g4Nd+fUaiFuBTM2VdMYOfjPKn4vtrouC7NUWY3vsk8DgPcTQYTeCDRG5CLhJpl8K6tqUo0QOms5VZNSakIPtg4WAroU+22mFw7vnkNTBjwsirPKjjIpd1d+3su4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Zh7MOE7a; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Zh7MOE7a; arc=fail smtp.client-ip=52.101.84.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Zh7MOE7a";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Zh7MOE7a"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ah81bIcvXYEil1E8wSbMuCKBMiQVnwl6xXNWlfiAItOixHkLdQPUOxHwzi/ogAoJFSmaI4ueE3D5FDii5L2C2sSBPOMCoBbyNF6ZNuHnXEsYbbfDr2aCXnBAs77WkHv1B8Iyc6I6/IYKG/S+b9EM9NQF96s9YKXXa4Pv9x2ZyIiGMRlNT9ZG5b6SfOrOiVQ058rDEUl6DofPt3C5WqbqUOzyYwFuEG6lM9koVKF8A1k0nH62kwYeBg114MbzJcD+NpqNVnnXp3G1dpMaxTapWZIbWellhVZiZYaIQ1uIW7WM9HIgPqfbKhesmGVLuMWpSCX7Kjhob/TxSlciHgIhHA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3Br8uCl83oAaZOBidhHl4AYT+jRXOI5MwdWf9uvB1M=;
 b=zHGKJIwkIVNdRfeBudcHQRWD4qIKBT8kcIgQ1y+jqMPnjS+HNeZap4qI53QO/TH4ThBLXOI/v1/3v8TN69PaQoPaGnmuxTDKGX2AxyQcvpfFUU3vbH+GyWQK4yVmQ9pUFtIX8dqGnln9LIRtQlhw1ZvLQD7bTvhvaLpjrIyP2AhXsPjlL9TCAULIwlB4sLhDrOVqxBBYNzIhw82A6GsGBGr2wINEq+LanvlbaPYu4oALN2E8bq8S6HsKXt0dikxg/fO3Dn3fQpy2f7t3xUILkkWcf3G1/9A9WJkI29vEEGOxM6ABtUH2T/zVWBj/kwycvMBc9tfRa8p//qGscBzaMg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3Br8uCl83oAaZOBidhHl4AYT+jRXOI5MwdWf9uvB1M=;
 b=Zh7MOE7a3ja2e/P/OkTenWBX1tH0xIdRcXONEk6B2fWB2r0E+GzcsjhjC+1owjwhVeeMoB2MQNx846oO+D4WbJ5Vk46ZQ6ZT3yjWNRZH74tXTX8wnEx62TLY6vgMZx9n+zilOoz1GF3C3lB/UZYlhdBgsiaZ6wa9qE0e5GjYuVY=
Received: from DUZPR01CA0345.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::28) by VI0PR04MB10661.eurprd04.prod.outlook.com
 (2603:10a6:800:265::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 12:52:01 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::e0) by DUZPR01CA0345.outlook.office365.com
 (2603:10a6:10:4b8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 12:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Sun, 18 Jan 2026 12:52:00 +0000
Received: from emails-5544868-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BCE927FF4D;
	Sun, 18 Jan 2026 12:52:00 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740720; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=j3Br8uCl83oAaZOBidhHl4AYT+jRXOI5MwdWf9uvB1M=;
 b=jgq1mGFxsi0rSg9K/GWLeKsneVJIXbPqz3cQ3yUF8Z9fQ5SjqTKUjlcvyqWQRbWm54BEl
 FMsYuX+dDnF5J7kGjGtfUS2sy/7sxwJiRFszfON9uwnpJCr2V5EWG2itKG/hUiDnI4tZnAr
 Wi37JUBMpWlAaagUQidBjfyjRAG8Pa8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740720;
 b=J3yUTaVNKkOo8hK014H7C4bk22J/6zGc837tvi4JYAB9AUYjphl8nhzTR98ORvhucZ8/m
 p4KSvlNtZIN6pabe3CT1giNiFf9UcJjNrdhYKwITn1CN6LBOarV4lJdOFqMW1PU0yki3ynT
 XOpUePlj4tczq8hBt3UcWq8NN1FTyiw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr/H+nelbvwMTEMZwg73BFc5eXJFUGPNkacsK+humAVWiiCk6j9R/uifzDa8MpDo5O86BC3lWsJEjh+1DrPANuBSTcITUsj2NyUA7r1Rzuvca+bqT3/R4SREHbHH2kryWfC6seGCEuiOjrhv3T/jKoVh6NHfPdt+bhPp2I5iVk5GSFyO44Uq1V+oGrWyGisRVnIsdet+3wl+tY2Z+BqO5BceysQVyksZgihvyfX9IZ4BQ/mwLZXjZzYBj7aA0iQjCN4T6QDcfQ16+nXnr1k7DboMjwaKfL4iyHdnKRiY5NLvR07Lu5wguqsUSFaBMWSOhCplbCeoPS2hClCHRbYI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3Br8uCl83oAaZOBidhHl4AYT+jRXOI5MwdWf9uvB1M=;
 b=I/bQjXfZhpZZWY1NFb1eNM/mzxvutga90UVQSA+TmL3vyV5whQjwcwk5lgdbm/JdF5XpSIGirfDjT6JQ5LqkGBz1gfvsiCN46W6Ij8XWuMf0qCoqqBURzQui7Julvk0YsgFPYEFLA64f2ZFDcCjS4BGT+yvtxGY0MOgQS6GrydZwdC69kB4TznNnrWIFTP7/bl9D2yPGMB82byMPhxkTwlhwRxJQ2qBfL4lJSL5CC6+z6yWaCQeefnB8S3vHLm0s8Ul1pcjBMPOGjD7fa+PqEgwiiCS6BvA09hGZctw/CNIPJZIj5dZRTotSg5Qzqu826lhBTWP5hpSrsQWonq6toA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3Br8uCl83oAaZOBidhHl4AYT+jRXOI5MwdWf9uvB1M=;
 b=Zh7MOE7a3ja2e/P/OkTenWBX1tH0xIdRcXONEk6B2fWB2r0E+GzcsjhjC+1owjwhVeeMoB2MQNx846oO+D4WbJ5Vk46ZQ6ZT3yjWNRZH74tXTX8wnEx62TLY6vgMZx9n+zilOoz1GF3C3lB/UZYlhdBgsiaZ6wa9qE0e5GjYuVY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:48 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:48 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:42 +0200
Subject: [PATCH v7 5/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-5-ef1176119a8e@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|DU2PEPF0001E9C6:EE_|VI0PR04MB10661:EE_
X-MS-Office365-Filtering-Correlation-Id: 42904f4e-abbd-4544-df2b-08de56905f5e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?U0paSWtUbC8yVzZoSnNDaHZlVlo5ZDUwR1Y0aDZ3VWV1cU9JOGJXYlZoc1hX?=
 =?utf-8?B?Sk5sVHA2aFpFdWRaVFFXcWNjRVpmYlRiRHR5UHloblBacmNJN0wyTzhBSGtr?=
 =?utf-8?B?WXlPUjlFZ0ZFdlBEWG9NbllRQWR3K1lKdnVva1UxZUdZMmxWb1BieEp5QUE2?=
 =?utf-8?B?Nkh0cWo3U2JoZVhKOWxKVXI4eU43YkVlSFE3dERSbjFhZnl6OTNESWlCSzEz?=
 =?utf-8?B?MWRFS2phVTVKVEs1UkxWZ2N3ZnIyZ2ZvdkZyUCtMajZUbTRCaTVQOUk1Vmt0?=
 =?utf-8?B?MzdUYWFOUzN4YnQxdzR5Z0p3N21BTTEvN1RWaHhlc3BEUkNqQmNYSXA4UllC?=
 =?utf-8?B?Q2hsSGwzWWRCU1MwcFZVbWt3YVcvQUlRYTU3VFNHYUZqcUgrNERPeWd1dVcr?=
 =?utf-8?B?RU9ZNlVVQU5YSi95ZERqcUlnN1FROHc0VDVqS3RwS2o0Z3ZsSjJhQUE5amxC?=
 =?utf-8?B?MW9WUTVKUjdmVTJ6T01ZUmwyVzNWQSszbENUUTJPRnpZY1g4WmZoNWdYRDJI?=
 =?utf-8?B?K0dkUDNsc3ZON1YxU1FkY3Nkc0N4dXlKYVR3aG5GUGZQb2FadEl0WEg3dFgz?=
 =?utf-8?B?THB5aGtWeTdVTkhpWW5McTNJUWp4dkVZMDZPeUFMWTFZbmVJMWkxS2ZBTzk4?=
 =?utf-8?B?S0RLblV1VkZSbGU2RDdlV1NTcHVtRU0wSEk4Umk4YkkzM2VLbFpYZVlxUEFW?=
 =?utf-8?B?TnJIOW1MZWZJbUFzb1hmcnhVSUhXSTh5eW9wckVFWlNDSFFhYmszbHNjNVB5?=
 =?utf-8?B?NXpuZkVVRnl5SDFEMU1lY2RhR3E2cThMejMyL1JhWXh4bGt6WW50NFRtbU1Q?=
 =?utf-8?B?b2FoY2JKWC9YaWVKa3BJQmo3K0lEQWV1SWhjQnEvNGlnckVIVVpEV0tRQjY5?=
 =?utf-8?B?dFUzUW00UGdJWExuOHdMd1poQ1NCVDMwd1R3QmhDczZWdDc0MEFkOUFqZGVl?=
 =?utf-8?B?dWE4eFRsc281b3RZRTJpcUpLU1RFaXJtOUJLWjR2cE15dWpUcElackZYSXRB?=
 =?utf-8?B?SVhtSXBWUGYySmxkb3JlNXRoZjBRUVY0VVdhdjhCZDU2aU1lZDI0Q212SVp3?=
 =?utf-8?B?QW44ZS9VN1ZmWUlyV250aXR4SjVCZ1pRUjJBQTBJZEhyRzJEcEFQUE81bUFN?=
 =?utf-8?B?dXY1dEtERm1WclBlb1g4R0p3RHdoeVFDN3FBTXZWeEdaOTZhL1k1bVU0Ymlq?=
 =?utf-8?B?Zk5paDBNM2dpdU5NTjlheXF4TldiNjM0VzdOTDRLdXEyWjJMZ2VpMm9NL3lK?=
 =?utf-8?B?TFpjaEFTaFB0NHRuanB4WWQ2WE1QZ25ZOFFobkVzNzdOYUV4UGpDckNtejlx?=
 =?utf-8?B?UG5vTEdJMGxWMnV5QXBWaEQ5bGorZ1JhQ094UCtqUGdNYTVWZ2lMK0wxR2gy?=
 =?utf-8?B?T2JPVTQyVUVRME9yODVtamR6SkVOYUlDKzVkdTdiaVV5aVYzTWdxOURkZHZ6?=
 =?utf-8?B?K010dG85MWQzZGhlQ0w2aUVPcThkZmd2M3ZOVFNlR0RINmhONlgwU1NEMG5v?=
 =?utf-8?B?VlJnQyt5N2hVb1pudzVMZktQUnBHbkJHT0p0bWw5bmdTQWZ4UHphd2huRnZ4?=
 =?utf-8?B?ZWJuVmtZTVFEMmhnS1dzamVJclM4Z28zbitWYU02Yzh2MTNqc3ZYeTBwSDlk?=
 =?utf-8?B?eGxISzMxYTRuVlJ1dVhLdVNPVnVJWjRyY0JVR3ZqbVJWOHN1aW9CcEFWamtj?=
 =?utf-8?B?c042aFdlUUgxRjNXTUhyVjkvV3JPeWNxN2NSenVPYjRWZE1waW0rWmxIcGhm?=
 =?utf-8?B?bUhuNVZKcUVPaVVEMkNzaUswTHk1ejlTdmlvbllEMkh5WFBLR2x6bXZYQzR6?=
 =?utf-8?B?eUtPTGxWWDVibGk0V280aFcvQ1hBTDBwL0RhTXdvUGVRZzNJVk9FN3FIVjM2?=
 =?utf-8?B?SXEwbjhXSDFVdHBDNVJCNzV3R2c3ZjV5SDVLbnhXWHNJaEpqRGgwR2dSd095?=
 =?utf-8?B?UFExQ1gwZ3Z4N25lNDhVZlFFZGdmdExVZEE2VnRnVEFoZEg5YjI5RU1aVXpW?=
 =?utf-8?B?TmwvcGhmZWdPdWxqT1hyWVlOeFRlbUY2QTZwRjBLWHZtd3hUNGkrZHFnTEUv?=
 =?utf-8?B?azF0NFFZNktaUXRPb21iRXRUVHIzdUp2a2FCOU95QzVCKzQ4SWFqSEV3RXEr?=
 =?utf-8?B?YzI2NFpCbGwweVIxejlCM2xoVlNLcDl4OThwT3NYZGxIbTRramt4MHIwcEM4?=
 =?utf-8?Q?IzSeS4YNGcS5Fe4Kg3I8muk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b7d0ea81878d45309a15748c3443c5f9:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b01bf1e-479e-4220-119c-08de569057fb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0lCMk1ySUpkRmtoYnREOHpIdlBvZlJpQUJLSnU4UnNOalBxNlo1VkVVeVRq?=
 =?utf-8?B?czgrZnEzcXpUUmlMN3dNVm9JZzFnNVdKSEt5elNiWWVIUXhFL3F2RlNHUWdM?=
 =?utf-8?B?cjNab1dOUTdPOW5ueHZuYXM5cDMzNVFiZ0tvN0JzNTNBRUcyQlVpSjdJbnNC?=
 =?utf-8?B?VTlZY0F6NU1NOHpEcEFBSEdXZzczUG54U3M1ODRLeVpPMlp1MmFXSWNKK05h?=
 =?utf-8?B?OG82WjJwV0g1cDdFY3NPdVJ4a0Q5SThBajMzOUtuR1ZDTk1GSG1SYTJGTDYz?=
 =?utf-8?B?Tjl0cHIyczAwNVNqVmRtbmRNYW1lTVlSeVlwM2ExZ0s2eGUvRndvbWllamxy?=
 =?utf-8?B?Y1ByWnJob3NwcG1wTEpxbXAwenl5OXpmYnRkSGUyQWpidW9KUnBoMFdkODM4?=
 =?utf-8?B?dTIySDhuMG42QSs5b3QwRnBxK2hOcXB5b3NYczRQaEpsUU5jZEkwellqeWVP?=
 =?utf-8?B?cHJJVS92ZVJYTDRCTndDaU9tN01IbXRHa3RnY1V6NjdvREEyWElUY1RqQW1S?=
 =?utf-8?B?Vkh3N21FYnFaaWxZQUhjWmtlL1VxODF1NkN4dDlOR1dsUXZsWVhqRVZKQlIv?=
 =?utf-8?B?d1FjTy9jNUxscU1wN3VsdStINHd4TzFFdWFUWm9tU3lxZ0g0ZFIvem1hVkhT?=
 =?utf-8?B?UUVyT3Fnbm5mNlF0SnlhMGx6NGJ5bUhYdVlCdk52bW9NeGlmRmRvNjNoVkw2?=
 =?utf-8?B?UCtpK290cSt2TjJDSG1lZXRBSkp6NkFhSGJkbzQzTWFoU2J6MXhMSS9IYkZI?=
 =?utf-8?B?TDFyN05WaFNMQlkzSmRLdEFlbXhQcDZxWU1DVXhTK1ptMUsrWHIybUhmWW9z?=
 =?utf-8?B?TEZxRHJ2Z29lTWNSSjQ5NXpGNnYxbWtmRXZrMW92bktKV0pUK0FDcnFRWXBa?=
 =?utf-8?B?ejBRRW4rTHdlTjVVbjVPYkZNRDFqVTdEcGdBNVpvYzhtaWFRV3hyR2prL2c0?=
 =?utf-8?B?cmJTMDNKTEFPU2ZkSk5MNzUyTTRCWWM0MU1nUEdQVm4zdkFSMUxXa3lETEw3?=
 =?utf-8?B?Sk0xWGp2YkNSc3hyams3dENBT25yakN5b1hWTkNQbW5pM0srdkpnR2R1L0Za?=
 =?utf-8?B?a3Z0WmZmNTJEV3Uyb2tWQ0tpOGJBTzVFTmxPbDh1RElxN1pFMkRNQWFjUnJO?=
 =?utf-8?B?ZTlnNDZudE01dXJELysxR1FZQTZqdkhCSmFJWkdaMDZuWGg2aU13d1hyVE5W?=
 =?utf-8?B?eXZjeXdFME0rd2pxV2pnKzNRYkN0Y3IySHNsY2c4dUJoMUNjcUZBY2Erakhm?=
 =?utf-8?B?TEZZZXVicXZRQi9XS2tCc1A1WmlNem00MGJkV2E0NlF1eDFFRFp2cHk2cHEx?=
 =?utf-8?B?SnV5OStsaG5yVmFCQyt1V05WaVR6VEZicTg0eXBDb2FUQXFGalk4OU5HVEtm?=
 =?utf-8?B?MGlJYzI1VGlhUG40Z1UxYjZTcHhsR2w0RllpSVV4QTRIdHNRYWFUT0lLUDhE?=
 =?utf-8?B?b0NacVM3OFo0eVY2MkxhajlFTUZZNXU5U1ZXc25JdDJPeURnZzVGVWdGM0Vt?=
 =?utf-8?B?YWEvWTVwQytCdEowcnRNbGZ2V1Q4QUFXWVNLKzJkTlAwYWdqYU1ua2VjR0dq?=
 =?utf-8?B?K2xKWjYwSVp0RFVBZWoyTGl3TFY2ekZrcXhvTUFFZlVlcEVwZmZCQ3hveDZK?=
 =?utf-8?B?aDBUYnBHcS9jZThaRXpWVWZXUE1jWHNnTS8rNXBOY0NVM3lqQ1pJNS9MWENu?=
 =?utf-8?B?c0pnMjVnT0svWUtHdk9ZcjNsUTdPWE45MXFVRUhDNG1KZHZYS1lkK2NuYnY2?=
 =?utf-8?B?UTZIL2tGV2QvYm1wcldzSDNhMUVVOUp2SHord1hMMGlyaWUyOC9jTHRKbGRv?=
 =?utf-8?B?SVYyY1dNSEhXMGtDMWRvOWdhcTU4M1oxaGNVeWp4ZlYzdUVsbEtzNGZHc1Js?=
 =?utf-8?B?Vjd3U1BIT3dXMkFCWmxXaGRXN2dSNEwrWmdCekZITTl6YTNscWkwS2grdWlH?=
 =?utf-8?B?R2xuS3Q2YWZxaDc4ZlBkTzhpN1piS1JJbmZ3dGM1dEhxVjhRNWRZY3pOdS96?=
 =?utf-8?B?SHhFTnBPbXkyV3VIdTBtMWxEOUN4QmNVaFFlR0lmUGc4b3pmVThyOXBaRlI0?=
 =?utf-8?B?ajdFN0ViUXJJRWp2NE5RMllHTUEwV3VVN1F2eDZ3ZXZ3YXk2b0QzSW9BVTJY?=
 =?utf-8?B?K2U5S2laWXVHVTVVTXZlQ1FNS1gvVXh3enErd1JZcEw4MGdpTHBueVExVnBn?=
 =?utf-8?B?SGRRZTFLdkhvS2IweUtNdlh2UmF3R09VZ1NFZkF0WUdqL20zTmQ1NExXY1pl?=
 =?utf-8?B?a3hyckx1R3lyL0hOVVErbXE4aW13PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:52:00.8092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42904f4e-abbd-4544-df2b-08de56905f5e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10661

Add description for the SolidRun i.MX8MP HummingBoard IIoT.
The board is a new design around the i.MX8MP System on Module, not
sharing much with previous HummingBoards.

It comes with some common features:
- 3x USB-3.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 M-Key connector with PCI-E Gen. 3 x1
- 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
- 1x LVDS Display Connector
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

In addition there is a board-to-board expansion connector to support
custom daughter boards with access to SPI, a range of GPIOs and -
notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
to this b2b connector, or a termianl block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++++++
 2 files changed, 721 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c4c6fd6de963..80fb5bf084b3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -213,6 +213,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 000000000000..a85569052473
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,719 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard IIoT";
+	compatible = "solidrun,imx8mp-hummingboard-iiot",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos; /* J10 */
+		ethernet1 = &fec; /* J11 */
+		gpio5 = &tca6408_u48;
+		gpio6 = &tca6408_u37;
+		gpio7 = &tca6416_u20;
+		gpio8 = &tca6416_u21;
+		i2c6 = &i2c_exp;
+		i2c7 = &i2c_csi;
+		i2c8 = &i2c_dsi;
+		i2c9 = &i2c_lvds;
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		regulator-min-microvolt = <11200000>;
+		regulator-max-microvolt = <11200000>;
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <250>;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		label = "m2-b gnss";
+		radio-type = "gps";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		label = "m2-b radio";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both flexcan1 and flexcan2 tx/rx between
+		 * expansion connector (J22) and on-board transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches can bus between different SoM board-to-board
+		 * connector pins which is used to support different SoMs.
+		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
+		 */
+		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			label = "m2-m-wakeup";
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	num-cs = <1>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	ecspi2_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
+		spi-max-frequency = <166000000>;
+		mux-controls = <&spi_mux>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <43000000>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		/*
+		 * This reset is open drain,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+	clock-frequency = <400000>;
+
+	tca6416_u20: gpio@20 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "m2-b-reset";
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_u21_int_pins>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "rs232-shutdown";
+		};
+
+		lcd-i2c-reset-hog {
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			output-low;
+			line-name = "lcd-i2c-reset";
+		};
+
+		m2-m-clkreq-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			label = "D7";
+			color = <LED_COLOR_ID_RGB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <0x3>;
+			chan-name = "D8";
+			label = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupt-names = "INT1";
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		/*
+		 * AM1805 RTC used on this board has only nTIRQ pins wired,
+		 * which is for countdown timer irqs only.
+		 * Driver does not support this, disable for now.
+		 *
+		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+		 */
+	};
+};
+
+&iomuxc {
+	can1_pins: pinctrl-can1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+		>;
+	};
+
+	can2_pins: pinctrl-can2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
+		>;
+	};
+
+	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
+		>;
+	};
+
+	/* UARTA */
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
+		>;
+	};
+
+	/* UARTB */
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&pcie {
+	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* M.2 M-Key (J4) */
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};

-- 
2.43.0


