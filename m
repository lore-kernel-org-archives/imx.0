Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021106.outbound.protection.outlook.com [40.107.130.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDF277C96
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.106
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767598282; cv=fail; b=U8u9OT33XkvFNU4ap14USVsiCbDJ5W4FaEZ1oLPPRojCq1XrhIrFeKuUJ4qvdFiXvp9EEQw9DpFMc/V9HnlmgTZVBMs27CaZrfGnBIFJcouJIskx7Fqm00J+i7KSoHj7ueXtWveRlcPr+OWHCxXo3lmVCuVgDr9C0WTZ+f6HJdo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767598282; c=relaxed/simple;
	bh=6VfQTEavVV3SXH8Fn+En2qNMavkfEvZ+4a4J0Vf/G4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EDJz9tNfj6b+19cC6zHmioDwiqjpW6cCTi8FtM0uwyD3lUkfEYc0WMu6/dTHLMnD+rWdaS+0KXqTiWkdqLrDnfELmtTKI+1FqrzusqNXuRStZ6PSniBX6spF65l1w8zHgKPNIk0UYfOCU3vtgxuVr7yAbC6fVpHB6+S8LQpWFS0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hCzyNFkT; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hCzyNFkT; arc=fail smtp.client-ip=40.107.130.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hCzyNFkT";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hCzyNFkT"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kFjszRy20a0VxPNMOKCdvX67iURNBu/O9UY3PELpZGh3XJ+jid4B9aZZihXO7u9WTbOqOMoKL/fAKRkWl3HE1ymyNdnmeHpMQuGLd5TwP6hWKj5dtB+wJ799UASIHz57Ch1kKfxRJzrG3uBBSH7vwlwTK+INwbwRXZVGxHmjBrsLgbgr8+XOgqEo33zqnlaZgBjvgsFWMv4mcQ50d3vgjj8Nf44N6lDchBEZbS3ZiBTWF/GXS1Kq4AT4xYlVTNiflxb2KUUPQjQQPHZ2WqYfCy7G1TzG7+iXlKiODOTANQXmy3zK6UVxFpBEB/taIf5k08yCE+55fatb2Z+SDonNBQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyOyeHdyHseRJu4sjDKUCXFxzHeB8V0Ft2gd8mkR3RA=;
 b=QexSc6+Psd4GpHWFfNE1wNyYQ5oUrN5dnVZgqIx5r8wom0vyZlI2sqPk87Wa/2TiXa6NK6z+x95JpKaFJL55QY0x5PoD4D1wO0eDJPcRHkxtYQ3su0SdyZCYjS2i1Z2UbM5w/cc8gLEcm2g2NEz8A0TcGkXnbv33tFlJRdCPAphfuDmUX2eMFUrEnBuRXggtq861gs1gsiEZuGxzQIoXVosqUmtIr8HfRVZrpyI0ia1QGm8X12A171o2673ZKB2shnvrS6jIL+nFcSeL9rsFDMLbfBNS6c5nLzTUXXejixlEZhGLE72DWrufMvSz4WeWicnb+jabtBPZug55i2OY5A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyOyeHdyHseRJu4sjDKUCXFxzHeB8V0Ft2gd8mkR3RA=;
 b=hCzyNFkTvVXsqeBZeqvmLHclESBK0hfwF8+DPP+0b58NBt7TS/2kQ1+ealOZGXgM+4Hz0aYmoExDxPWq8GL8Q8djb1i/DmxKJfpdyn5gvcW2zAQLYQHKNFG2dmeH+3ZTFFqSqnSmGNMAHfz03Gjmpjx7Mwzr/eNIiHx6FzfzNEY=
Received: from CWLP265CA0278.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5c::26)
 by AS8PR04MB9110.eurprd04.prod.outlook.com (2603:10a6:20b:449::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:31:17 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:401:5c:cafe::52) by CWLP265CA0278.outlook.office365.com
 (2603:10a6:401:5c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 07:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Mon, 5 Jan 2026 07:31:17 +0000
Received: from emails-4901938-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-114.eu-west-1.compute.internal [10.20.6.114])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id AD4D77FFBE;
	Mon,  5 Jan 2026 07:31:16 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767598276; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iyOyeHdyHseRJu4sjDKUCXFxzHeB8V0Ft2gd8mkR3RA=;
 b=NTYFDS1nXSSZGxLFX6wWnDhabdkWiWuaWBEQySb+SqigTrRvq4QdY2Ny1M3QZDdII9UMo
 moW2qpZYqaBpy3h38Bpj5kIJXEJOf4lXDvvXys8Ux9DSq8RfXZ5l9WROBElwlvny9ouyEbk
 rFxVot6E9APIKTuS+oPUEN8d575pSFs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767598276;
 b=ovxndIxcJpzqkN4KE903zKZX/J+uY3xAOdFsdg7jcJsbWSrQgzb033sk1gYxdBqD8N6cP
 qdroH4yW8MnMyQGM8DTvJifDyKaywgNl1rJ08hVcPeHIGdzqCJ8nXYynZ/cNzJuIqBZupnH
 rtxJsSg7AmSV8/Lz3wksUhj9yYELBgc=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIMmypVi7JJnTnq62gbKXjbFgEmushBK25ghBoMFHtrPBF3BRkv6G6rwc/1D58y+pszyWd81etDqRYu3GJjvbiBsxvH8pASzh4OEv5Z/UWYfqqnJ9CiW/cLyi/KvQ+PczwyAO2rquARtDej6zg/n96ynLaoGLUcVuYBMsg/BhioPsdwQVLXL3u9PoUK3qb5sHGKeSIOfMMY8yBjQfogWty8y8LDa9Km2THXwtYzpVKk/tfMcUsuygZTNPNIIw+UsZ9hsOMV8BHMXQTP1207zGYrGR7Qdz4ChjVHZMtioMSWj3NfTdYGaEnP868g1G3egWeIUYMxbbIIfP/Yg7PWgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyOyeHdyHseRJu4sjDKUCXFxzHeB8V0Ft2gd8mkR3RA=;
 b=Z3YPiOl1H55bag8KZrkYj9995ErXVwQ+HgMxWZvMJ5Plxu+vUej6q290oVgrdNwURKnk/J15T6AmlPHzbEP6ZUvr9pbkXRpHFSZqnyO9T1ea5+NX4WJdu4sHiUSEAzuv3fEzpwKhw7K57n9zznWhXPOzdWq4wPY2g6tsmtZnA4KeGYwOCT9eY+ScGcWaTz8KG6HnOnUohtE2ED5egdDIsdO+2AWMfhTuCwguuMz8UvlZu3xHgkvuM1qbq7bB1Xm2JjG8T9o2de/j80gIEKHqbq31UoRF2ZigsxVCD1d5rghn90kVF8lRdoZ8+fgpgIkQkgdxojRdadpIS1wcQVqfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyOyeHdyHseRJu4sjDKUCXFxzHeB8V0Ft2gd8mkR3RA=;
 b=hCzyNFkTvVXsqeBZeqvmLHclESBK0hfwF8+DPP+0b58NBt7TS/2kQ1+ealOZGXgM+4Hz0aYmoExDxPWq8GL8Q8djb1i/DmxKJfpdyn5gvcW2zAQLYQHKNFG2dmeH+3ZTFFqSqnSmGNMAHfz03Gjmpjx7Mwzr/eNIiHx6FzfzNEY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7466.eurprd04.prod.outlook.com (2603:10a6:102:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:31:08 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 07:31:08 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
Subject: Re: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHcezAdo1YChS2uyEq5UXzwrg6V+LU+9fiAgAMU0QCAASQQAIAABUmA
Date: Mon, 5 Jan 2026 07:31:08 +0000
Message-ID: <1943543.tdWV9SEqCh@josua-pc>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
 <9369989.DvuYhMxLoT@josua-pc>
 <6e1d7e2e-9585-4b4e-8c82-004a613bdb39@kernel.org>
In-Reply-To: <6e1d7e2e-9585-4b4e-8c82-004a613bdb39@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PR3PR04MB7466:EE_|AM2PEPF0001C70B:EE_|AS8PR04MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f6b3cb-9a9f-4317-9c8d-08de4c2c69d7
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?B1Iw6TleK7F/RqoiUthFs2CKtSTzgJulf92g6uq1wucPuKt9UFKjg998R6U/?=
 =?us-ascii?Q?FGiHRej8ym0/5cPx8pJ17KYh1vp2qM4X1FvG93BP4ldWNyLCWueyHg90bGqu?=
 =?us-ascii?Q?q886n7iXCX3UeIobPNGCnRzhWGJ5F/x/qKVJKxEElgXOzuQns/nIl3+Uy1Xd?=
 =?us-ascii?Q?dwPI2aEGY9RW1Y75rczmYcz4uTNgCKND3Ic8HUzVvpuCogT7VilqzReq0s4w?=
 =?us-ascii?Q?IY+zekcj3wZOVdtJ2JMzxTNJdATVZspIcq+pHUYxQXpXbJY5RAuDI2aTmF6y?=
 =?us-ascii?Q?m9PW9Xm9cXoIm6fxyNwaOZ+JgPby2YNimbFAtlaZWf8NIrJ8oEwBfWnCgRUe?=
 =?us-ascii?Q?w+VnZqA5Z6g6mCo6WTwnGVKHSuV9wHvfr5bUSUX4eLXbRHPGgyAo3/ierkBa?=
 =?us-ascii?Q?wycd1GLSV4kaW/K2GoFYxtdtvT00y4c4J1r+5XRDUWH8jCJW9NsvEZaWQsxX?=
 =?us-ascii?Q?DAbhvBT0n+4tX1C6YTRMJt0mkIcYBo7wSJbAu7AYZRamlKhHl4TAK1uJ0qMZ?=
 =?us-ascii?Q?flWFYaNe5DWPXpQ3ZlhVLKd2uPN7mB3jnwnsLNj1kAF37xHGOngMc+SxFbWb?=
 =?us-ascii?Q?NlJF+jmFJ3d8D/8uPEilHmUueXoLlrHMvbWQXZepF7Lc5S42T2Jay2TfWH++?=
 =?us-ascii?Q?YUb+NcbrHfvZG7IpnWXkMvXmf5/E+ofnwqSajGbQecQtqB5tIomvsKw+w/SG?=
 =?us-ascii?Q?g9uoRmmSOSkmff4e5wpVXlHOlv1jNT65n73rSc6R5ru9hDU8gWlLPtZeyep8?=
 =?us-ascii?Q?/34b+V0oUZI25/hrWyHckhRjEf0OemEe80MituYI5H/foagYWaZulxUfxWNW?=
 =?us-ascii?Q?AEEXhl8HBNa8dQ+WO1oGhbGuUyD2ivbUpkxWOi5Nu7qOdxL9vjbKD76OERQ8?=
 =?us-ascii?Q?2u6vI9Lj3lOry/+8G81iJzKmPttZ3fEcj2xNKwEuTWh0MtgerZ+bd2p6Kb8n?=
 =?us-ascii?Q?0VVCbkh+dv8Mv670Sa7wkhucADChXOQAg6jJMNeQJy3bFpzcHW4dzT6kLtbC?=
 =?us-ascii?Q?48/DbdEDhCBY4HHbNh1Q2pZljI6xdcFEyABtI+Nvaf2noTWI30KaiGCCq1Vl?=
 =?us-ascii?Q?QmJGEwChpOS+hXOrBWhrAFb4O5YFVQ2A03UBmDEI4wQdbsj6/TFL9r2WBuOE?=
 =?us-ascii?Q?rjEtzTzxtdOGfuGdbMg8JsYCgrXJjfTFlBN2PLNGzhNOVNZCz0h1jquy1Ql0?=
 =?us-ascii?Q?7ima3fuZuPnSidiHtxjJq8X8TkYvYQrBn5/PBdbFLoLbKu0IXd4cZq86Gu31?=
 =?us-ascii?Q?O3NLU7Vn4kTeEk0q27FU+V9e+zh4/kDPGVFtjbBFhF1RLAhYcIjaIqS3lqoG?=
 =?us-ascii?Q?uM9WkyTvgVp9u5JYasomhGjNNGBfc119HKlgzn52dCDPiVw7bbHHzJxnAFF2?=
 =?us-ascii?Q?0YGX1l8V8tVTV289ELG/LJ9dWqdo4p6hGKZyfU5LEAhoOM61XPHDgDEgmrOm?=
 =?us-ascii?Q?1mYbZ4AyySfsO9C1f2VGI10IQvXPMZ0ljgUwbX4lUrYDdMfGIw7ExeR9+iW1?=
 =?us-ascii?Q?MczcPFih3C8r5U4eiVTnStkwomu4sqWRZ9IS?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F793E4AD98263C4F83550C40DBE60F88@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7466
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9a510072b2e34e17a9df0799381263db:solidrun,office365_emails,sent,inline:345725664433bfc7b586617ceb81e9e4
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36797b30-34f8-48d3-b355-08de4c2c64d0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|7416014|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3K8pWTi6Bt7Rh3u2QOyx1Kwh39GOMxTyQJA7bX1ksQWlWAIMH0kOsZJrYvgF?=
 =?us-ascii?Q?2Cmjc6w2CtYw9vpA7Snxm6NhAsjhX/2CPs392Iq3dA90Y6hQSWZVzVowEM3b?=
 =?us-ascii?Q?BOBxjTLUzXdBH0rWgnjlgowunnTT8DyWmLiaIi+NB3pUeJHFJU8UEogkCLvV?=
 =?us-ascii?Q?Ugnev7tFJutCGGU9KSVNzuhpe0F2ioG9FGOU57PhqA1MZCQuZEK/gN6+8S1W?=
 =?us-ascii?Q?lNhqUlGMk6VdrnOZEeY+Zo/cMy4SG2g72pcdYcMm9OAPkgEzrik4T8SAqqVj?=
 =?us-ascii?Q?hL+I/SLAFY5GRMtd3yyl5YRyHxMnGlavo63lZx5TybMaSn9vht5PpA7dYuzI?=
 =?us-ascii?Q?8YQa5j1tnnA9bIKm6Kj7J9kLV5jA065PTckwBNwLSeOUoJrDReIg/5OHuNJv?=
 =?us-ascii?Q?5AC9z3lGs/B6neLCC6/1fGrSUQOZEW0NMTwNinWQQLi9J51vNJhRShqpiE9+?=
 =?us-ascii?Q?4I6KDfKjspp+YDk1ekNRZv93DJ6+HaBRdpxlAdgwIN6puCDd2jJUU6mdytHi?=
 =?us-ascii?Q?D7THEEyM1npFiP2n4f5k7X6E1D1yTzfOFD1q9x7FlKLViUXvKThV6lMenumR?=
 =?us-ascii?Q?woZt2zyyoPcCDOXwO2FjnMNZCIVF2Z0W599KFHVlXf5QZkEMoXhHUZ0VlPts?=
 =?us-ascii?Q?pjoLzBm/7RxsySB8MUkU7xiSOuZ/dQebdJGMPW2i89X/OurZRXZGkoHCfVKJ?=
 =?us-ascii?Q?0kltVcRho+cZwL35O9Z6+wiqwt6GlbAr5WhTgaQX1+GVSlHDZSKbvOjLm+K+?=
 =?us-ascii?Q?1FrEXBC9XEt/CY9PL5lfijX0+QKKMrNLtFXGTmRe6/uyJbU2CU8nxWNnJdOj?=
 =?us-ascii?Q?3GYzKBLrSzIn6g7q3e2Re3JpMMX16+rjH7BFY+O3XDFiu9vQO0f7xf/GLEmc?=
 =?us-ascii?Q?S5Sohg0uubS5Bv5TratGmYMp2C2dYVstHQKJLSBis5c5uHNrmwkVRPUk5zLF?=
 =?us-ascii?Q?q7ir5x+iFXkEJ+nb8s+y0qQ+VNvHZ/KUND7vdp0uw42FRyL6NXWEUlWf3GCE?=
 =?us-ascii?Q?Ay0hLpFyZv+Bni1fmNJqltRVwmluOOX+7fY4HGCjfK36S4UakUXjY1tcBLtl?=
 =?us-ascii?Q?KQxnEr1S/geNtc+EaCE/kC/VXhvaK7G0UauXmG6KL0vXDU1Gke2wk8LxfAjq?=
 =?us-ascii?Q?6ThMk+XGxV/RtVi67BHm+90PIjvI7h+gEVy4y8DLWXql+rU9eqWP5j+BkxDF?=
 =?us-ascii?Q?fKR7rAc0MJ6V6BL5VzUH8cMc1vuBrnP0qSbEaJaM0x9VwGybQIpPtESfmzSa?=
 =?us-ascii?Q?aoBo5br/XcbWTNBMPpS+z9i7kcNaCNTfqEOQJ0YlexdOxIzul1l2yy0R7/v+?=
 =?us-ascii?Q?exds1KTmg/DHvqGRi4PpQw5P0AXodKvbqujw+jII0nuWCnxBbnxKjEIdxewu?=
 =?us-ascii?Q?nsugrF6Rj55givskUHBIrekBfuRGKh9q93u9fqn6IyklGDCHazgNDdsKqTbv?=
 =?us-ascii?Q?7msy4OINDTPm37L5uC3K2CteJV2gI4pQ1NfgzHT9ZfhXT9rVgGTNx8WuFLRo?=
 =?us-ascii?Q?b0b0oxgojzmLFaad4QvMgjxhVRlprW8O7ZTyyOJyj0w6Jxyi1chBvn4IBBgu?=
 =?us-ascii?Q?l/41nbG6kOSGPqqJdV0=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(7416014)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:31:17.0136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f6b3cb-9a9f-4317-9c8d-08de4c2c69d7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9110

On Monday, 5 January 2026 9:12:12 IST Krzysztof Kozlowski wrote:
> On 04/01/2026 14:46, Josua Mayer wrote:
> > On Friday, 2 January 2026 16:43:35 IST Rob Herring wrote:
> >> This patch series was applied (using b4) to base:
> >>  Base: 8f0b4cce4481fb22653697cced8d0d04027cb1e8 (use --merge-base to
> >>=20
> >> override)
> >>=20
> >> If this is not the correct base, please add 'base-commit' tag
> >> (or use b4 which does this automatically)
> >>=20
> >> New warnings running 'make CHECK_DTBS=3Dy for
> >> arch/arm64/boot/dts/freescale/'
> >> for 20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com:
> >>=20
> >> scripts/Makefile.dtbs:20: .dtbo is not applied to any base:
> >> imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
> >> imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
> >> imx8mp-hummingboard-iiot-rs485-a.dtbo
> >> imx8mp-hummingboard-iiot-rs485-b.dtbo
> >=20
> > These overlays are not applied to anything on purpose,
> > as we don't want to create a dtb for each possible combination.
In particular we want bootloader to load individual addons,
rather than a named dtb with a preapplied combination.
>=20
> But we want to validate applying DTB.
Reasonable.
>=20
> > Is there any advice what to do in this case?
>=20
> If you don't want to follow upstream rules, I think we cannot take that
> code, so don't upstream code...
My question is more technical nature.

Is it okay to add a few concatenated dtb names covering all overlays? I.e.:

imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-rs485-a.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA-rs485-b.dtb

Perhaps one dtb for each overlay?

imx8mp-hummingboard-iiot-rs485-a.dtb
imx8mp-hummingboard-iiot-rs485-b.dtb
imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA5.dtb

Or should we create all valid combinations?:

imx8mp-hummingboard-iiot-rs485-a.dtb
imx8mp-hummingboard-iiot-rs485-b.dtb
imx8mp-hummingboard-iiot-rs485-a-rs485-b.dtb
imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-rs485-a.dtb
imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-rs485-b.dtb
imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-rs485-a-rs485-b.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA5.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA5-rs485-a.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA5-rs485-b.dtb
imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA5-rs485-a-rs485-b.dtb

Note lvds and dsi are not currently combined due to HW design issues.

sincerely
Josua Mayer



