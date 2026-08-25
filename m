Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022135.outbound.protection.outlook.com [52.101.66.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3041E2614
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.135
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642903; cv=fail; b=IDXUourvjlu9s7ZeX42mnnETVgVXAhftAKzqOzH8ko0u7ZlozvmaKTiLPrPj9q4bZ/8We44KjeArDxyTdSBF4e4ZplLNitZMKTuXh4T5b303E4IFvabaUQCOHbWEOKcU0Kd1pRT0WfFjowimdVlNwQixsLIvk35+qyU/F+jaSlQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642903; c=relaxed/simple;
	bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IAtVYyTl8l3dXfiMo7GFCFjH2g/WqfDGk38L8Nlb8GS5e7BuTnQ3KakdER4auEVC6SqGUu/lmgbZ3yTPKYnbispb+FfFjIiWbtxauhQpR/cw71aZkjZLZpOK+5yR1A9WcBg8pzGzS2tnRvy87aJQaWj8slZ+0Ex7pIKkIh0zyGM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FxBIHBRz; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=FxBIHBRz; arc=fail smtp.client-ip=52.101.66.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FxBIHBRz";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="FxBIHBRz"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w/vrOy2XDVbe3breb2CjzkmXjAqxWUvf5Ls8hmeew2ZfC1LjNzaYrl50rAdhrb6buX3jlPl6WeLhWmuUD38hD526lINUbVakZ4wFFLyCnD4jFeqobDtzxQ5uA+dtl9nTfVr2zoiRXihOVN+8CszgoxaYCHDFMXsTFb8m7JCCG0ujHTfgcC4/ZajY+ctmAKrT7QN4ZNT1PlWpLndO0UvH7lVRBumJ9Iai8eNpRpnAz6s7r6c51BSmgZDXowcCYkej9L6j3ja2S1QQkopNHoeeLmUWzDPaj196o7t11SWQbGR0PjWT/elQIavL6hR9Z32Bc+jROBSS/dful/JSQvmceg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
 b=CnwutlMrSoELLXOi5NyVUx9vQwjxsNYLuWp0yy664rPz7j/l5m5n1yf1c41Mm0xTshKdDRzqHA/OVMwNNTlu6d/EPgbUUiS96jpUSmTK6p1cxgBshZ8adUQI0XNxkqtZ2mbO0egULbVsJBY1pxDvZvDUFTbVYPIO6Hr9nIdOkDF4u+/+QwJlwMXf0WVXX2BAkN/aV1m2RJWXymb3itXezHboFy7eSuIZFG3s6jqui+DCmEMDqNHUjAucUi07LWvCLFBiQMaC+WPYx9Al37P7s0iU8hJTWGcKMkXU6qnrwfA8Nbx4eeDBUruqHsDBUUFS0X5b036Qht7iFE4+sr2DWg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=free.fr smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
 b=FxBIHBRzhoHnfqcLYAoO+sDV8emYsAbm062xdeoAVrB/vswklx/7RSqmBD2Zb1qyHKj6JELzb5vP8fIKrEgEC9ty/QaCQMpZp6W4pK3idcvNhMiRjV1qXDPiC97n5Ef7nx1BeYE2n06g/rpm+66BnYGEbmBGdb2hAfECUnQnsFQY9lUwcjAPKdrLtHDFTsfPAgcaTiiS0ZHP+N/Rgr98dcu2pWN7w28irBKctqpnV60kJYWFCpJ6W930fAcj1ZEnYFyZNAgyVZXp1BEpqoHdPe2X1VGg9kYPp+iqhXFYusf+J59bNf2WPipvTlnFoqM6mhU4YGexi2QivniEebf09A==
Received: from AM0PR02CA0128.eurprd02.prod.outlook.com (2603:10a6:20b:28c::25)
 by FRWPR04MB11149.eurprd04.prod.outlook.com (2603:10a6:d10:174::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:28:13 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::8e) by AM0PR02CA0128.outlook.office365.com
 (2603:10a6:20b:28c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 07:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 07:28:13 +0000
Received: from emails-9769183-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-140.eu-west-1.compute.internal [10.20.6.140])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E705380B68;
	Tue, 25 Aug 2026 07:28:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1787642892;
 b=HhS6Ixn9DqZi3KwUQDZihgPzzKuVjxFKB930J58kRWT8JOmmaGjmjs+zBOAucfQGETz4g
 NcjmaWje9QOQ125OITgNIPjjuDY9s0SfiJQw/XFKVCByLHBc5c50qEC5tHm6hiSFpkwVmPE
 1152/zCaK9OyJeAzdBO/lfSu+j/s17w=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1787642892; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
 b=NjakxY4SIp9b3S+Uj5o8ueO0XZR7hpOEjtSZ30nhPf5OSW2m82ml6Hj2xbjx8BUlmZoUM
 MK0pIOMhqxYxaGR2hUxJEsBufOKKQHBUpDrpKzRR5NwjTStZG21VX83K83FfHuEpsLg6wNE
 1wgJ8xTHD55nUT7SzPTQCd1SIyuVjB8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
 b=FxBIHBRzhoHnfqcLYAoO+sDV8emYsAbm062xdeoAVrB/vswklx/7RSqmBD2Zb1qyHKj6JELzb5vP8fIKrEgEC9ty/QaCQMpZp6W4pK3idcvNhMiRjV1qXDPiC97n5Ef7nx1BeYE2n06g/rpm+66BnYGEbmBGdb2hAfECUnQnsFQY9lUwcjAPKdrLtHDFTsfPAgcaTiiS0ZHP+N/Rgr98dcu2pWN7w28irBKctqpnV60kJYWFCpJ6W930fAcj1ZEnYFyZNAgyVZXp1BEpqoHdPe2X1VGg9kYPp+iqhXFYusf+J59bNf2WPipvTlnFoqM6mhU4YGexi2QivniEebf09A==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by VI2PR04MB10739.eurprd04.prod.outlook.com (2603:10a6:800:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:28:04 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 07:28:04 +0000
From: Josua Mayer <josua@solid-run.com>
To: "vjardin@free.fr" <vjardin@free.fr>, Frank Li <Frank.Li@nxp.com>, Carlos
 Song <carlos.song@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Thibaut Collet <thbt.cllt@gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Thread-Topic: [PATCH v3 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Thread-Index: AQHdNA8r4tkmKjcDU0CMCcjabgQ3qLauXmiA
Date: Tue, 25 Aug 2026 07:28:04 +0000
Message-ID: <f758938d-a2e7-4d1d-8614-d0b559a9b51f@solid-run.com>
References:
 <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr>
In-Reply-To:
 <20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|VI2PR04MB10739:EE_|AMS0EPF000001A9:EE_|FRWPR04MB11149:EE_
X-MS-Office365-Filtering-Correlation-Id: 64af990f-bbce-4a2e-7e9d-08df027a6c1e
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info-Original:
 bHm6ZH98tLNsXDVul+IgUtrpC9feSS0xVARF+X5a8wXWHfVaBKKg/j3MFVAYLjc2znOn++DuJJ/zdTF5my6C1+KKkkAsN0allT7EY2NP6P+ty5bI3zqJA5SJZAPxVlFIF8lPb8+ZgeKn5c5yNu/7xgoif4/2c3mMvEy176/8LvDewAOz0rmlulL2d5+AEJTxPbesgAWkasr2qCUQCV1Aem5oynh/gZQzPXJrBIhRCHbbMhv+AGgst4aZd042vuGkABXjV7FTnYD2TCW7bw/rOd7VrmbEd9hwutOvGZoWyfUYfK2oeAyChnK8KQR2nwxV0Y/Ck8V26hGsl5N6sY8aqPZX88PfFgVxN6dc1ucbBZ2OHbSZHuwHUSxzwjTcup3+XvOPM0u3R4yvJZVmfdHrHCbea8a8gP8VTTZYAWdeaiZzx4AXBXdERdrHTept5GIQZbBWzMCalA4py8ahfuLXXCZv9jjNY/QMn2zQK0x7An4pJ3Z/gqexmNhygN5sVS4KrYI1e7qQoYU4Z12H2P3rOss42sVgRSIkFWia0uXCjb5EndmtYRilINIlz/rRN9Wyg85+1zOR+wxBfgFj00ZAq/jFD1OJnVMwJeQQmkCGImHJldfYYPxsyi6XGsEmC5brVO9xRXfI5tKpg+W1Wr09rW8OXexLoBMiix7Vfow6kAjIc36WCz5e6IeABXDxfv8/lwg4CvV4SsHVx3ehViH8Z7z2sA64sc/u6PrDUZb2vN4jUnNUAV+7nUEudyRjGJDDZO5Il+3kaN9zBTnNwHZiGC6VWguGr4BEyo8Bb07kmOk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(41080700001)(15866825006);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF651B349563CB40AB60F316F59FB43D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 3GyPLvdfSN/TDOFPR8W3JkkM6hGYhjcO4/YyHyK8iDaYSkyz6eWf6kwutO+JiOQICr5QiScoqh311ds1GHKjO1JvrmM/YP9vbMniiXy8NrZAhpmQkAyJ4TI8EdDCyfxdgAkHknnRBZuHt0Ij0U975U58zSiDpdB1AgiwfPvLC+FVQqrysDIy8vqhOTh1T8TUm2U0V0fyGLgrii/Th9+zUWczrhoYIlvwQ9n6JsPMaItvC2uUCPCSaG/uuL6dxrsJRnNluBM4nc39Qkenq/QoBV3yMMyhhRBIx1qWKLJkMmjmfAxSU3ev5vXZRwOW68bn9uytDcwtA3Y8RF5nAIiqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10739
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b7170af700d04f75a5219ff4e35218fa:solidrun,office365_emails,sent,inline:1d5dc2100f085a568c1eeb485abea290
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMctkIhcDG+H9bBr/Clth+jTNVuFn5yITEd2x3CByUvqoZeOLXFyfXc8JR4dw5TdHUovqhORm4HLpYOriXu9NjfCoCUnt31NE5OPQd4sM0EJ3Z7GQzPm8quEUn3wiBJzoAnHGtmw0X676O/8ThvFIXqYNSX0LvYd06lG9QfaPtC58P6wATAQRIPRvzZbUnk+F5g4Jq0xQn6AvMHEgACu40a/g7csZM/5355nYlwd53cEBiBPcwY7JjJ/vrZGpkyrB15PcmlhPOHJmDb9ILGjeRvpKCp9awOs1vi92aCU2EXaiN+CMNPT3oKFYqPECYlCPi52A2J2A+5Fn7gCKi8sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0njFcQNfY28OlWIceuHPbsDvuMzgebMX36IZz6mI984=;
 b=qGPzZHoaU1Eq2gKmd5bWBNBqp9/lZQlqpDFDLflcRmTiXmD9H2tUZhqq7bLs3Ht4LQJQ9GjC1CbKIqHlSL9dz2RfiaZ+jHzxB4f0Xyri/swueoTNjj+QX/9QBEkRNHcG0WGMB4KVvKfKG6p8fTLdHdHUhYKg72pEH9E39egc4+48Y4A1xoLpOc0sW7ZEqek5sKB+CAJ51h2pRvX7Ot3EDHaYoDRnNcMOy45VzedHNQ9s9MnURVjs/9kxrLgaThxk9g8oP9s4k0nBlGe13q92XVqwB1kSf3QDOUm3U7Y8FkuNhTK6/FeOySCph9fDOady86JHeKU7XkUmqxBWaKx6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a414a538-7e18-4c01-492b-08df027a66a1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|14060799003|23010399003|35042699022|1800799024|82310400026|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	Geiuk6DBlDr7VvtgJLLV4oI5fjFCwy7lCjxoXhIupmkKWD3Jh/rqRTx9XRcAQLXq5+0//58IOCo7WSGeB+LlwudLT3U1eS/24XcHQZzC0kjm0O5zBz6DgHKJ7M2sJusevZvSHfsFzDSYP322w9USny32/SawKfXJA0ko539wuxcMONDFCAIQ8fBVBcwUnrp4UAon2cNkH3UCrRq4iJ7cAR8gVxxAY793ZNRH2iC+czuVWrDJSRm78hQJUACx6MLsE1Ffk/oIFsF5xWbNUYeVdWj/ZlKO1Hz1+xMSGbg14FSPdDhOnpM6E8QZfehwKNacf4tnG+dIq/n493GCfxFarsKIBu8K6lrBiLNgHpxsHNemzXYuiCvGlyPkdUv3OeZepWD6Vn6t1pyhytrGUUkokfSsCRQaBfJQBs8EiACofND6qbpXj0NMvMA36FNS2IwZn1H1+RMiZ0dfMhhXyTcV/Da/q1RbPoqYSa/kFWuRJh/rpmyzISfn6/srV1S3EqLn3f3MgOWZqqgU86TxQgMUehHK0A7Wn4aism5joUileqLd2puRIxftwDIzlrSiF88h8Xc9tG3wmzgi8XnA0j4g1EzW95f7M43AbnlX5AXOs5NWkK6ha+L1b8sl7qxCiNXos//Nm/AmjTY0OB4B9zMlUEzVvwBclCVLepgcDWzaA/PxHnYJmwyZFhXnzTWZJG2N6CT/wNn4iqldIS7BR9VJ4OYcd775/X30mXZ+KgSkM9eVxb2ig8SGID5B3dyUH4i2818XvwTMW8AACASAKsJGWgMoAmIEIXLmkpyTqz7Tp9Q=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(14060799003)(23010399003)(35042699022)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(41080700001)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s7aElYyi5W3yuIp7UBQOa/SDIXBArb4rHxpzf6Eg4auDkscTph+TxgClkM4tun9TGgdu7irrLDNVz4sTFI9luCMPuHoN6yx5jAKREFHqrNd3//tnoTBicnvJx1F5JhGfkPM+gYAsB4CexUqhyexdFG8Ug+sSId6bITKT5cg3/MWcCJ0tCXoLmQrmSnVvVZLyEi4FsPmwPaGH9AX7f9WvKYlJaWogGuuXke/crBTTt1LoXIB4GfJ7IhkuPDUim8Cw3qbXnrj+jVJaGGGnvRA0Jv02WE6VNyjc6ke6pWz3wp3+7gNdgxZACysZc5IE2221v+hadXcqNG/JTvGpXE21TylZHPDHsf6LcM0MiyJorxdtoUt+q4ZVEw/9TL3AzilTHpGefEhqI7w8WAfAAJ2bOXz+h3CEOVFiD5ELilCIeZljPeDj27A2fjpOL2qW3scp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:28:13.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64af990f-bbce-4a2e-7e9d-08df027a6c1e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11149

QW0gMjQuMDguMjYgdW0gMjM6MjUgc2NocmllYiBWaW5jZW50IEphcmRpbiB2aWEgQjQgUmVsYXk6
DQo+IEZyb206IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+DQo+DQo+IElJQzFfUE1V
WCBpcyBhIHNpbmdsZSBiaXQgZmllbGQgYXQgUkNXU1IxNCBiaXQgMTAsIHNvIHRoZSBtYXNrIGZv
ciB0aGUNCj4gdHdvIGlpYzEgcGlubXV4IG5vZGVzIHdhcyBuYXJyb3dlZCBmcm9tIDB4NyB0byAw
eDEgdG8gYXZvaWQgd3JpdGluZyB0aGUNCj4gdHdvIHJlc2VydmVkIGJpdHMgbmV4dCB0byBpdC4N
Cj4NCj4gV2l0aCBwaW5jdHJsLXNpbmdsZSxiaXQtcGVyLW11eCB0aGUgZHJpdmVyIGRvZXMgbm90
IHRha2UgdGhlIHN1cHBsaWVkDQo+IG1hc2sgYXMgdGhlIGJpdHMgdG8gbW9kaWZ5LiBJdCBkZXJp
dmVzIHRoZSBmaWVsZCBmcm9tIHRoZSBub2RlJ3MNCj4gcGluY3RybC1zaW5nbGUsZnVuY3Rpb24t
bWFzaywgd2hpY2ggaXMgMHg3IGhlcmUsIGFuZCB0aGVuIHJlcXVpcmVzIHRoZQ0KPiBzdXBwbGll
ZCBtYXNrIHRvIG1hdGNoIGl0IGV4YWN0bHk6DQo+DQo+IAliaXRfcG9zID0gX19mZnMobWFzayk7
CQkJLyogMTAgKi8NCj4gCW1hc2tfcG9zID0gKChwY3MtPmZtYXNrKSA8PCBiaXRfcG9zKTsJLyog
MHg3IDw8IDEwID0gMHgxYzAwICovDQo+IAlzdWJtYXNrID0gbWFzayAmIG1hc2tfcG9zOwkJLyog
MHg0MDAgKi8NCj4gCS4uLg0KPiAJaWYgKHN1Ym1hc2sgIT0gbWFza19wb3MpIHsNCj4gCQlkZXZf
d2FybihwY3MtPmRldiwNCj4gCQkJICJJbnZhbGlkIHN1Ym1hc2sgMHgleCBmb3IgJXBPRm4gYXQg
MHgleFxuIiwNCj4gCQkJIHN1Ym1hc2ssIG5wLCBvZmZzZXQpOw0KPiAJCWNvbnRpbnVlOw0KPiAJ
fQ0KPg0KPiBBIG9uZSBiaXQgbWFzayBnaXZlcyBzdWJtYXNrIDB4NDAwIGFnYWluc3QgbWFza19w
b3MgMHgxYzAwLCBzbyBib3RoDQo+IG5vZGVzIGFyZSByZWplY3RlZCBhbmQgdGhlIHBpbnMgYXJl
IG5ldmVyIG11eGVkIHdpdGggdGhpcyBtZXNzYWdlOg0KPg0KPiAgIHBpbmN0cmwtc2luZ2xlIDcw
MDEwMDEyYy5waW5tdXg6IEludmFsaWQgc3VibWFzayAweDQwMCBmb3IgaWljMS1pMmMtcGlucw0K
PiAgIHBpbmN0cmwtc2luZ2xlIDcwMDEwMDEyYy5waW5tdXg6IEludmFsaWQgc3VibWFzayAweDQw
MCBmb3IgaWljMS1ncGlvLXBpbnMNCj4NCj4gVGhlIHZhbHVlcyBhcmUgbm90IGNoYW5nZWQ6DQo+
ICAgLSAweDAgc2VsZWN0cyBJSUMxDQo+ICAgLSAweDEgPDwgMTAgc2VsZWN0cyBHUElPXzFbMzoy
XS4NCj4NCj4gRml4ZXM6IDdhM2NjNDlhZDFmYyAoImFybTY0OiBkdHM6IGx4MjE2MGE6IGNoYW5n
ZSBpMmMwIChpaWMxKSBwaW5tdXggbWFzayB0byBvbmUgYml0IikNCj4gU2lnbmVkLW9mZi1ieTog
VmluY2VudCBKYXJkaW4gPHZqYXJkaW5AZnJlZS5mcj4NCj4gLS0tDQo+ICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kgfCAxMSArKysrKysrKystLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNnguZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNnguZHRzaQ0KPiBpbmRleCBkNDUy
MmExOTQwNWE5Li5kOWQ0NTAwYTQwNTEwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvZnNsLWx4MjE2eC5kdHNpDQo+IEBAIC0xNjg3LDEyICsxNjg3LDE5IEBAIGky
YzZfaTJjN19waW5zOiBpaWM4LWlpYzctaTJjLXBpbnMgew0KPiAgCQkJfTsNCj4gIA0KPiAgCQkJ
LyogUkNXU1IxNCAqLw0KPiArCQkJLyoNCj4gKwkJCSAqIElJQzFfUE1VWCBpcyBhIHNpbmdsZSBi
aXQgYXQgUkNXU1IxNFsxMF0sIGJ1dCBiaXQtcGVyLW11eA0KPiArCQkJICogdXNlcyB0aGUgbWFz
ayBmb3IgdGhlIGZpZWxkIHRvIGNsZWFyIGJlZm9yZSBhcHBseWluZyB0aGUNCj4gKwkJCSAqIHZh
bHVlLg0KPiArCQkJICogU28gYml0cyAxMSBhbmQgMTIsIHdoaWNoIGFyZSByZXNlcnZlZCwgYXJl
IHdyaXR0ZW4gYXMgMA0KPiArCQkJICogb24gZXZlcnkgbXV4IHN3aXRjaCwgaXQgaXMgaGFybWxl
c3MuDQo+ICsJCQkgKi8NCj4gIAkJCWkyYzBfcGluczogaWljMS1pMmMtcGlucyB7DQo+IC0JCQkJ
cGluY3RybC1zaW5nbGUsYml0cyA9IDwweDggMHgwICgweDEgPDwgMTApPjsNCj4gKwkJCQlwaW5j
dHJsLXNpbmdsZSxiaXRzID0gPDB4OCAweDAgKDB4NyA8PCAxMCk+Ow0KPiAgCQkJfTsNCj4gIA0K
PiAgCQkJZ3BpbzBfM18yX3BpbnM6IGlpYzEtZ3Bpby1waW5zIHsNCj4gLQkJCQlwaW5jdHJsLXNp
bmdsZSxiaXRzID0gPDB4OCAoMHgxIDw8IDEwKSAoMHgxIDw8IDEwKT47DQo+ICsJCQkJcGluY3Ry
bC1zaW5nbGUsYml0cyA9IDwweDggKDB4MSA8PCAxMCkgKDB4NyA8PCAxMCk+Ow0KPiAgCQkJfTsN
Cj4gIAkJfTsNCj4gIA0KPg0KUmV2aWV3ZWQtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1y
dW4uY29tPg==
