Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D9B3CE0B8
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407480; cv=fail; b=I9ZAQEd8ZmHGWZX5vy+A02umCgN70uBUOUJQ91xCNBicBXswe+r5uPrI+xzrKD4mkyvnRArZOZNhpC4fMmjN7ezbxiJh+kSNcm3epWIhoYGrLFIIyNYKlps7nL35X2JCv+MV9ZWbQ6Gsv6UHF1NwWeB1h1myiVITLhpodsLwTC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407480; c=relaxed/simple;
	bh=A7qji7tkWWemxrxHQcK6iEfI0XoFc2npxMZLY+Eaxrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ui564iUdc1xVbY49f/84bXdCgKMdawHFlNGpHcTvWXuJUGCAgxD8F9vkTYwTyFi8I7C1+8gUVtSfOMb26gKyv2LZFu5SB6Y7uAhRBdP5zMt5lE2jm0Ta20fsDII89lccEKu5N3NO7TKZfM3P4bVxGJHsTf8/NYAFYVQMZmTwrbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mX1h0mQ5; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mX1h0mQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPBGXm72UmbEjs3aQaGJN5JvdtxPZj1iyf7QPCN7srUzxDpkVF9LovZbxuZcEDUJn+XrW/9HcDq1uOA6yzL+JkwBHwgBu2B6yexxHd164cCnEOX1RXzRbZbY/F/T2wMBpbh3Sx2boYyIisXly+Ky4eJiRlrO6LX3qDnY54aouyQJ9TbltGJFE5insCFVgt3n0FnOFP9hVCiUBxujBvu2aVpApL0RwcP5LflNm4mWIhmQ9RecedTMvgEyGJ4kx0YQZuridTVmYRh5rZbVGN+Ssw7QbOz1s7D2tlGfPxaenqxDqU946oVE87m56J7t0ELnmYCeVxVdNRFdwnlLlssK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A88ZSXA/CcXghW30GUtGD3wp1bvMMR3eqiWgX0T0ySs=;
 b=TI5pmBZ3p/QAgGBFBv9NhLfB25G01YIFFjn2zRVz7eaocHWDbTOV2IeYkxfviLMYmnNfTlymu4o4eWB8JM6JOAaSDnxKvkthCpcwP10SAffmmSs2NeVseo83JhROdxLG3rDymsermqeoLbHJZ6tEEKh481uJTUJUHhOD7ZHdGzi8lP8LO3LCWeXTDGMpWijBzSnyo6pIm3YoFZHm/P2r3c4qDFOhs6FfRLUurlWH9h7+1BYqUHvx5ASSofytQ3E0zeDM6N30+xeloR3nqkj5m8S9VXCYUn4BlEyaRaC9y5vBUsnzqNGKnvMNGG1bAILhPF97B9/gZe/AjS0dMkzAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A88ZSXA/CcXghW30GUtGD3wp1bvMMR3eqiWgX0T0ySs=;
 b=mX1h0mQ5K9JPWd7KQhuWfck2MVc7Tcb7R01WYylAOKIJ567nky1ki9iV+yv99xFO5mwfb170gvKdXPNmHSrEWcV2s1sw3eMmgszCh1Gkx+ckts87L76wlG1z4BSvebHiwGbLN/oLL4KG8lO0wC/L0KzldCJ0hFeKSikftDPntqHeI0dWzcFLoKCqpjT1bjmah3QbpvgMU3rKY5+hRDOXQLTVyULxbGxpnPckUI6kzxbmcIZb8bSTDjvgW/Ri9AWF7hGv8KZ5gQyo0FESF861m1hwaFyuX/1mdWXY+tAWpINczZgDKDBWbaSfbj2XQk0KUDyk6gKJp7DeLsic9U5VNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:54 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:53 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] ASoC: dt-bindings: dmic-codec: Add audio-graph port support
Date: Tue,  7 Jul 2026 15:57:22 +0900
Message-ID: <20260707065725.312450-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::21) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: cfedc191-f2ad-4327-8bbb-08dedbf510ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	oOjW8ND8XF+IWmUPeQmlyp0WT94m0jmFfR8fYCWpgAid9Tfc/QqZse8CRPZX2Wo1sRgE13mcqpux5bV0AJvKssvuSfFU/Iz34U4PHNL1niV3YKF4gzW9tw2vpS1QkTPvr0nXhIu3sclvwWVyM+UJziRp/mY3KQJrNcSsZBH9z9zHsXPWmaHAXf+WJA3HUYST/Tpg9uR/kkj5ItZUv7gb1HZsbg/HD1miQMiEpZZ+isOHZ9YZYHCO18+nkYMnxUff4TJPcXm0BIuh0gURwvCJyp/cW40Nxmep8cm3VXc4RHaI9x3QKSL9PcNDEBqxzSKxdyGWO9nd58mJ2hxuWuqFjrpWpsCsQEg/Jad9HjYwVJuM8BxUNAotpdbHB3AJmSy/hmqWJb4TA1B8BXR+YkfzsYwSY9sw0DVHql/IgOM6EIoTdGU1rEKDOX9PUJq4vTyURXz+kgBFiNGu8IWAOBktqo1x3XMhqp4RWorlaZhXUSLY8Bigu3M/fcBYNAO91xL7DxKcYym8k77ElZb4nBTVO2P74PajWAw/mQ/oEH/vlAnUQhNFMX55zOQbc0h7WR1Xfk4kIUbi50DDlcrHYkidH3A4vDNbk5OR3ON69DhVd16zCO8vbhMmiga9U4ke0+A4pEiQ6kmDW7++pbsvqcKIB7+YenhSmWlp3isrbZchE5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCe3IRTwunJRoSIjJ2PHeK0a5q+zcGRrGyz7WhCStwU3F/BDPIUz54ZYhRCI?=
 =?us-ascii?Q?wftV5xfr1CkS8vvUV1/oiAVn4fJa0b/Cmtnujc1JsOKc7CRURubZGkcX5KIN?=
 =?us-ascii?Q?oGpJK61cG0+Xxx8oD44xyDm9tkSCy2aYwT4mP0lpTcKEURyfKyk1DIeki/uD?=
 =?us-ascii?Q?15a34NU3E8VUWLFz9OLmu6L7Ui+VN5xR2kVTJWK7yFWjuXWx8hvr/Tjy45gM?=
 =?us-ascii?Q?eMDCJ3AdwD9cEAgiejicfLQgNX0Ey7SOISGZ1pre7CGdy9MsQdsW+kmaJ/Al?=
 =?us-ascii?Q?GpY41d/jthCOavxKyM0vl1Q5pE58TM0khRNdfKE/B9vz5h4Do9f3kXSo30TZ?=
 =?us-ascii?Q?ji94qi+5Dxzq0Yq9Gg+bbxTnlu1pAI6W5rSGbyOf5I947FX9GSwVycT0Bh55?=
 =?us-ascii?Q?5M15nD7ulm8M84Xvwl5TDP4wczEsznOmA/mBjEEzvfdOnT00YzJ3gcQbQ6MV?=
 =?us-ascii?Q?aM8u3/TsKHYdDySoAJCUcMrD+/hFgRfKdKUbfRDE82Uz7WX0h+T82oMSXe23?=
 =?us-ascii?Q?67a8euZpp/00z2wU6KejZqBVTKFI/EAv7gfKfh72riGkg9eKEo48/cxErLOm?=
 =?us-ascii?Q?MgInMXrsiUnMUCi+duvxXGMVjPHRif32A95VVztTQ9RlOcm6bewvRKzArOHP?=
 =?us-ascii?Q?ii/GZWMPCmB2sMcNkQmWoXbvR1z8k9tCLSoyfLRIcS9HvFOURbaIZNZsLWK+?=
 =?us-ascii?Q?5DrQSNX5D07vQZz4rITPQjSzBSSxzfcxjzdt6fJBY3O4w4UUZQGPD6NWDkwc?=
 =?us-ascii?Q?2fGOBf7RNInpbtjKxFsbfCuSmhYAvpdMy4yX7vg5546aOomjj8x/mAykZ5jd?=
 =?us-ascii?Q?MjCboGAXPuEy5WF6HjAYGHKDnMoqGXNMV/KwDLU8qsaR8gp90/OI5KbjMcOf?=
 =?us-ascii?Q?24x4fzNVsz22dyzqm7d5A/lh+oUrfsAfUMMAkEwivoRJRZcl3hfROSB+HUk1?=
 =?us-ascii?Q?gEOZHAtCoer4bGHVTAO22/aufZhX5PuQdh50Xg85aAYOTjeWV/Ux64qH4o1B?=
 =?us-ascii?Q?zemcznZ+ctTdtzrA/OS8j4PeAKC/o5VY/2uceFBCRb2jQJWVqexWQ+PU+Xuj?=
 =?us-ascii?Q?xB1jRlUDHvcY9iR5XrSWrbvUyaE3IdwInH95vqBiUMJ75tvWxEJoY6yDavDS?=
 =?us-ascii?Q?FwpZ3SKKiLxXXVE6A3CN1gsU2zwbWOD+ewUIMPP4t1GLWLwHN/YCcChuUP+d?=
 =?us-ascii?Q?XkpLbyisuGO64LfcfkeCg/BkmelVXOxfXnNY9WjTLmBkzwuNy8tvzkEy0kSg?=
 =?us-ascii?Q?T94LSdvVx6MlavlWA8X4H62luheKSBj6oFMODbY0sJKr0C8V9c+hHcCmSo7C?=
 =?us-ascii?Q?E5FUIkvCowXZKkTkESQy0uvmLnAM1fmpz0XMCyj29DxciewU8i4pDQXBUntP?=
 =?us-ascii?Q?wzgIB0k8dA+Jin1cpOyww1t2c3GWgZQrZwoQIBJgYKk3DDcase8XjW/rQtpE?=
 =?us-ascii?Q?X/sK/LisXAK5fW3n7WB2U67gxlwvTpg8aeCnG/qnsep4UwHZmaBpcvMHlEyS?=
 =?us-ascii?Q?CW7Xmvhp0JuH8Cuh3cd8x6r/VS3jNpnxGRI1VrTyzEzi0xRWZJeHE8Phm+Po?=
 =?us-ascii?Q?NOfAt/tcsU1ec/z4422P8kGwf+2oipjY2jGyLX+zZFhN42aSM9n4hIGuHRfz?=
 =?us-ascii?Q?vxTZ3SLzAC8bQZyk3zrFJ+RCI6HK5QeGsVnVWWft+lPo/H5d5mb161efpQ6T?=
 =?us-ascii?Q?VDdikMVCTIl42FAWB8d3vr6Ny7jJWNY/KYCbOGXvYsT98Uqbj6huU4Wx3oSy?=
 =?us-ascii?Q?fltRcwP4WCeJnjTVPzaArDezM/zJOxFaA3ydQUSkpuQHsrMmCHQk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedc191-f2ad-4327-8bbb-08dedbf510ea
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:53.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+0hYLCHTs+yu6E2qmOk6BIW7TJHZ6SflU91jSbVUecf2adEaMiQVbPmRfMxH1GZezD9FU6vI7zFpiUThqfE/NNM7FLr3pHXLOQzIaW+yP5pwOrKlugSbnt82Zmdo+aq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

From: Chancel Liu <chancel.liu@nxp.com>

Add port property referencing audio-graph-port.yaml to allow DMIC to be
used with audio-graph-card and audio-graph-card2.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/dmic-codec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
index cc3c84dd4c26..83c23e029ea4 100644
--- a/Documentation/devicetree/bindings/sound/dmic-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
@@ -39,6 +39,10 @@ properties:
   wakeup-delay-ms:
     description: Delay (in ms) after enabling the DMIC
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
-- 
2.50.1

