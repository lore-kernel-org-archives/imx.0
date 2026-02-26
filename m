Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021110.outbound.protection.outlook.com [40.107.130.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E147AF72
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.110
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123824; cv=fail; b=ilVFcOJVnw6dOdJLC8dn3SNrgR/mRDlIXcwL7tRJyHccP94y3bpJ3C9nUOaeHKBUOPv6j6vv0nKVyGxZf9hEnsG0Na3ayYlHAK9xU6Zw30wtlJMDrFMLK4b2o79kMcuOKIMT1IkBl3MnZmndwTpwaluzSaPCkANOlsk2UK5qqqA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123824; c=relaxed/simple;
	bh=yxQ9E7ChI38RrJIZNrhB5IolEFt6p+KTi3hZgtO3s1Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dsj4+KAAOwmqyd8ZzbFmF2UkrOPXRGJ4DC1TqwpcutmlfAGHGD3Di4fZCd2sh223Y9lk3VbkYq0HXzKSbw83csR6SGsZWNbO6P7ves7e4thIuxKG0pqOKsVxkbvlC3QT2pdd2mEWYyTqvFi8sfLgYeLTn86bvtZsd6KXtdwg7HY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=n/TDZCzU; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=n/TDZCzU; arc=fail smtp.client-ip=40.107.130.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="n/TDZCzU";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="n/TDZCzU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=adfak2E2hbaRIFp4ntx6KHOZIwJTLMSCsnePT2Yifz6av30RDn//Nm2P5K90yxj+LyochfuQYD5es3MhoI+JAiNNu30zcwDySPCMK0AE15W1Fp8MBHVZjycnBgyWYhyN9ymV67EJgGtTaMmFGrCPjStYziHoI2hpKk66HcXOH3SykKZ7v7RbXODRHdzrPO3JEiyOUsfbLyuX/MgrRPqKVpRRGCtXweA5MQcteGCtzv17TClg0HdvcnYW+d/Sso8QObPDBl1+kFM4+JFNud4bjuuyNiQtvDJv9bZNS7futezdok/hW1ufYerbswlUuh8IRDOeWAL4XLipMMdvnF5O+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elqLg7Q21U4SgVZirEzBhm5gIR759iW1/s9hkahKVII=;
 b=hWbHf23mzmG5BTRyDXYohK5r/kkxgXLFC7YQM7zJyvkLsMV64onkGnudvPX2dAomNzh0VgiFRuFLOYhZ98i+QFljFDMSRW8U4R2sjUCARUgOGXGQ2jkOC9w8D+UME2Ol1ausr/ZRtNhcuqjW2CGkV3AC4rckK2rAfXLWGKGSyjM3W/XIbT9WGcFokMLdaJQRpBZsoKeQe+FeIVp29ubl6c8R6mFvr4W31SGkfMCZzftPlkfrQYlRrTwJwKEwOHf0hopFZJOAA44Zc83baSOOyyp5e5kJn1SdzpdKnRRMBXFR4FqzMTjP3ya6hcgwPAG4hOkTjUYIAXs5SvpAk2ntAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=temperror action=none header.from=solid-run.com; dkim=pass (signature
 was verified) header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elqLg7Q21U4SgVZirEzBhm5gIR759iW1/s9hkahKVII=;
 b=n/TDZCzUVeMvN7YTeFr5BYaEAmvEh6UfiBW6Xg6wBBVi5PLVqVijlk+mxhRh5TJ7R4Z9tRhDO4/iweTIWqBTtDYLlJSujZsPOqbgq92MW0LLS58X9EDW3P8vNonCn7qymMB6yk3Ix26ECPagra+DiKxizdzPAuArgUGe4FnflS0=
Received: from AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::36)
 by DB9PR04MB11626.eurprd04.prod.outlook.com (2603:10a6:10:605::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 16:36:58 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::cc) by AM0PR10CA0026.outlook.office365.com
 (2603:10a6:208:17c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=temperror action=none
 header.from=solid-run.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of solid-run.com: DNS Timeout)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:36:56 +0000
Received: from emails-8215955-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B678A8083F;
	Thu, 26 Feb 2026 16:36:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:49 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6xCYA56FEn5wb/eJp/p18s/mmwspjSjW9Ev8wYRYKlAiAxwnjFCE1JwmpWpTMyznbIryWrkn+nAcs3vFD0ExKSqDbKuWLx6WOSAY86TjlF/WYDqbR1K6/hf+Z7ZS0wXbLt8CwL8AtQph4XjzvueAQwVhqxHlinCwChawtyB4Ra1/4JC1tLololQVI515u3fWjRGx8Sbl424H5+bWkLdCAPR9Bou+hKyd/Uga1fDK10kYmZDtQ9oNo4fodYIF7O38gneO9kPTo2+fWxc+TDSjrTujeK3BNGLVtGzmxnEJy5ovMH2EK5RHSUPZa0jTKf9pYakT/o8j6/EzWus8dJWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elqLg7Q21U4SgVZirEzBhm5gIR759iW1/s9hkahKVII=;
 b=kXtT/ORaLTs1Fkf6FFO3fgmhlnIbNkB6P1dWxAqkV/M4ZN2y9LsXDiX1SAQPp1c/FGGcr8gYt+fQuwh4jALjXrTefOaKIvnmVj3Xcl9FSJU4x6KYR6En4FgUjeu+wswXDsF+OpngHZFMLSv04cbPLBiAcDJuSt4K3mHavL9p6oW2M/F/bb48hk0FekF8emJkgKR0+sLX0xzL0Q899cqBFKVkUEm1CMhhFQ9I1BXLLbPMP8ww7FcsWVRWKg8tiR63LI1Immlcl6oqa6pmcJHulBEEQFRQZcs0Ktpi8T88wTrVLNYh9d1iO7IL2/8vsKMNY+VaAyL4E1zGCSpJY6ZBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elqLg7Q21U4SgVZirEzBhm5gIR759iW1/s9hkahKVII=;
 b=n/TDZCzUVeMvN7YTeFr5BYaEAmvEh6UfiBW6Xg6wBBVi5PLVqVijlk+mxhRh5TJ7R4Z9tRhDO4/iweTIWqBTtDYLlJSujZsPOqbgq92MW0LLS58X9EDW3P8vNonCn7qymMB6yk3Ix26ECPagra+DiKxizdzPAuArgUGe4FnflS0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by DU4PR04MB10767.eurprd04.prod.outlook.com (2603:10a6:10:580::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:43 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:43 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:34 +0200
Subject: [PATCH v9 5/8] arm64: dts: add description for SolidRun i.MX8MP
 HummingBoard IIoT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-5-4533235eeb34@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To AM9PR04MB8747.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8747:EE_|DU4PR04MB10767:EE_|AM4PEPF00027A67:EE_|DB9PR04MB11626:EE_
X-MS-Office365-Filtering-Correlation-Id: affb6855-8b94-443a-5daa-08de755541dc
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 KZldg+OujNGpf7kWfk1ri8rQymxOBgwz0oz+YL8K1jg/K30aZCOrIZUSGNV+BDraCjp5BKX3Dg1JkSw0ivTK72TJP8Fl+So67ake4Gh+8NJ4qLfZ/Pi6A5wkZ/AgAy6F443/did4ATuhXuiDWezIjHMExoFyjO2fZnUA9Q9CD16wQEQefBsL60zbDRFA9HtN2kYYcsBKgbYu1PtBSTQRDt5hO6Yxh+kd/ld0UhMVi7K3LZcRna+cFgR3Ks4Uz9UuqkmwD7WK46VoRb86aiUGf570/1AA4OaqEaCeAnBSjapisIGX5MM0SQGAVLcG3ZpgaiwoHj5HYEop20HQhwe9xSql24MTR/KSdYM8OqY+vwpMIYu3BWeTISmkjXmunsPJ8RLqkyUw9k30goshZzEo4PwlDL6rZeeyYlQc4CGdaYbgkWBEYnX5kLWIpCfjPliZWnsiidkBdYPIpbhrSgA/ZkY574DOAYYKcRfIg+fWvX2gLyWIQWZ1p1w0KRtK4so910iP3W7weNftpAVnJEC4cYh38lBhYsgpkRBfZqnpUf5kgTutmqBqNW9mApS6pW2/b1D3XiDByNBdeaaHM22RbrJTvAYiAfkJ5KkUPonWCT3rzVeQHuUzi38PFBHmANXzjTngjsUR6H+fOw5hLJcncUg2fglYM1nTRtn+MA7ZbnJPpgUd3lm4gXgzJIhgZHoUHvoxoJjeiSSRpf6+5U5l44y5hNADrH0RltltVRdXfI9TsFtcTjAVpwHjSglzW2usLBtXyNtMk5zGxTbOdBI/6c3aSpN5qtjZ097guqjS2PA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10767
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6b11d764dff145d5b799176e4d231bc0:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce894ab7-9819-46a3-304d-08de75553925
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|7416014|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	5zqZw18nuehXYxFfrGZ042Ijkdu8PMpEefeTWIzGplc30KMCVMNbI+tqpQghv/4QU7ehGOF+IMw9q8nE1nRPmckDhiUou41XP4ABtIryKXxGBbof887wpzOysuYoTAx//kNdD2Q9DsrayMw7juGmkEdLov5CRNAQC3xM8bh8dDPSk4mTTJYvk8HjhbUfIlRM6h+HvhDgqctgkIZPKUDCWargiqFxdxd0ApTyPPumSEeqHx1Nj3WzHsmLJrPT3twztiQZeeRza3cTZZPO08XHtPLTHLP49l97JWNe7hwaRgoknwklPmUYZX3jCpirBFuElxy2MPVtiIlkltGIfUxgpL/7luN1FzMtWnJy+R3zD89ZfEmck4syMeTW41Ug8ZQPYAY9qqDST8oh+yhgHEzZ0HNXtGEYhQmF94irywt83UyZv2864paLC9Gs2sRdbTTRZBy9JM27Upy3yxoz31ONxwl9ShMZc8rlCR4mbem3DRwRHpwnFK/0y/72P1RBF1QKs6L9pstQgy9gGxwcFKhaN+cYeiWq6TBGtbK4QK3oc7FrhumclotdgAZg09XT9BwDqNAft/8SFCbNdKqJd5fK2YXY++ds/yyUbt7vGewWQRu6upaF+u3asy2G2MCCnIHi8FZaL/WS/vmb3xNuWgmleYJWwz7RCj+9tfcqcz+NHWvoemTConpX9pjqXYf7XOVVFRuMPkL6m+FxBBSNjlRd9jCSzffPaxwRbpBamTH8/CD1lsUELrR6lCmy/cDFIWliIxEvPXGDt1zDqBKEaW6KkgVytxJy6qaGOfM46frhhzfOCQ8Y7dOEPeYkbCuU7tF2cXNOGtv3+0oKaQwu/xyKVg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(7416014)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Aw1NrccZS41ttXbHpMH7tOdQ6PsI131SLS678oJZK7bJlXThmXLtNFrhH8qKfYdMIcTXnLBgcibkYWIBdKga6XTqZBeYvjURzF0wMAO7lxpts+ALo93ZeBRR5uo4wmVgKo5GUbJutjxOLgCw80YKVwjCV/L7vaS/FXiwiqC5e51ri8sl6enISCI+Aj9IQ3tWRgOzgNuisCi6/gOjuwHavEuDRa4SExWCE78+pLIX1byWdZzQfJzQS1l0Jd94Hs/3Y8lxzT7jOw5EQWdzLdbemQvhqzz14YBGhNCsiFcAcQLXaRzSOht7rv2sfDu6XYx4tZv7uY97CTrOkyNnwlguPiIyylYYl9Rl93AsLr00y7SnBTL8YcJBrSFi58agZor1Rs4LUHdSwqlwCztVvA12lEaLWpC37iJbtoCv69N85NjL/Up15O8Oa25MkNt8JQMM
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:56.9790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affb6855-8b94-443a-5daa-08de755541dc
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11626

Introduce support for the SolidRun i.MX8MP HummingBoard IIoT platform.
This board is a new design based on the i.MX8MP System on Module and
does not share much hardware with previous HummingBoard variants.

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
to this b2b connector, or a terminal block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb overlays.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 712 +++++++++++++++++++++
 2 files changed, 714 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index baf71afdc466..01f6742932fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -235,6 +235,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-pro := -@
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 000000000000..58985b69de95
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,712 @@
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
+
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux routes CAN bus signals between SoM connector pins,
+		 * expansion connector (J22) and on-board transceivers using
+		 * two GPIO:
+		 * - IO3: 0 = on-board transceivers, 1 expansion connector
+		 * - IO4: 0 = J9-55/57/59/61, 1 = J7-12/16 & J9-54/56
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>,
+			    <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		/* default J7-12/16 & J9-54/56 to on-board transceivers */
+		idle-state = <2>;
+		#mux-control-cells = <0>;
+	};
+
+	spi_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "1v2";
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <11200000>;
+		regulator-min-microvolt = <11200000>;
+		regulator-name = "dsi-panel";
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "m2-b";
+		enable-active-high;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "m2-m";
+		enable-active-high;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&vmmc_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vmmc";
+		startup-delay-us = <250>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+		label = "m2-b gnss";
+		radio-type = "gps";
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+		label = "m2-b radio";
+		radio-type = "wwan";
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
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
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
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
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
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy1 {
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

