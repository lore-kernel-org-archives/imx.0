Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023085.outbound.protection.outlook.com [52.101.83.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8743C818D
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.85
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596780; cv=fail; b=nCXbK4G9I21yN4tu8D1hlPJ2gs6FOTL9SlAoA57p0uB3ziEnaoxCAFiIPrPxOy8Yrj7BIjjWqS1FjwIyTdVgnl3EM5IVNNK4jWPP+L53bmn/xz+7koeM9C7uGC6smdAKTUYR7p1oq4ZcucfMdyqKqBIba/qskYvPIPCTBFANw5M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596780; c=relaxed/simple;
	bh=acCcqgKKVTjzFWJAo3qV2PbUHeVfVY4AlQNgUjcWunU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JNSsm+X/1nRZRIBlzHAolNefoY1Y03vd4Gy+s65rM/08GrDRz2SQz8MMtKlFqPsy64VhHYOJjpOu3YSi+NipLMRd4lyoczJMdphLfkxK2WKmdV+jnt7LuF1lrNJxmaYXA4p6ENmLb4yqp4rW+8iGzJOrp3zLRnEOzvJLHbTuPu8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=QDhPCKpA; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=QDhPCKpA; arc=fail smtp.client-ip=52.101.83.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="QDhPCKpA";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="QDhPCKpA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I67K5j8/SsPuY3Oen0iSDJh1UVVKAKyNLhEpMEE1VPm5QPk0vQoduSFEof4VHa4tfTK44xjanzJ0UcKoWRbR5WX5mvvn0ARaNDjCWvITLGZXVqEKnktlJUiR8/4meth9DxItacukVGdxhPO3ccFSdCDdDrMvY5yBZBvbxzPxhphZ7d5z59DtPtkLZB2VUkjuZK+L0vKo/EjC1verSwpcoo2m+6TpFRHV0PB3us6gVr3p3yH6dfklS8hqFm9q4YSb4SBt3GSsAbUOWT+DmTdHME1NMWKL4hDmloWmHKZrzMU/Kroz4lQvxCTMve6IP+nM9/8ltK/6at+WXfmgL/KJIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=txyxcPGrMkj9kLbE31D1GNJTdMFVTfrvUOglSGecBx9FnfecjpSDSxOkz54z3EpZXT66Ti/J0USBbzLZ4r99Sb5SSFLAd2wI5FzfJKUoNPyWQbd1Dn7gBzrtB2R9gPvgD3t0xlNfgXeBl+idYdwhKmM/s3FVRbYUjzp0Br0lUIG5Pe40W0O0ksXaWbOGJCwLn19ezLqZ8Ui7SaXQuC0ARRr1ZSogZ7IRqnU8p+gHgyFEElk1YZd80Wt9pWEWT2xCbVuO2peo4tMgxTkMaLeN3PFhA/4Wh4pYL6EHDtMfa20r7EqXkQ/hOvC0DQpZrZBdwNv5K0k9qGCLs/Rs9x4nvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=QDhPCKpAyU7L+3VuNGtAHSlKKXalxWKS/f1WUHIiv7ZPkX4LKuJLnVPKRnpNQ2HMXRzip7EIlIwfTjdZAg1krkQegx3yZ9ceDeaNEKO7I+wGFKwV8mmkYCenRncoZzTOZB2Yj7Cz0EM85699WoZRQLV7s+eGw1Mli8pW55qnF0b0ZP3FydWd1XHL7esOYursII+IXP2EpzmnaB/otOgkbE4rUaBj50UamwhnMVKUaafVYrMwP85vhetlYmtrngUOnlSUMh+Zq9Z2aRQdlYGXs8Dm3irC5ja76PfaFOoMh3d8CHvsE0JKTv9j1JZbUTtnCwtoG7tiDLdvUgtEuTu33Q==
Received: from CWLP123CA0078.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::18)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:39:32 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:401:5b:cafe::66) by CWLP123CA0078.outlook.office365.com
 (2603:10a6:401:5b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:32 +0000
Received: from emails-1780369-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1A16E7FCE1;
	Tue, 12 May 2026 14:39:32 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXfiM01Ab7yhCe6P4WJuXl16f4IGE+A93WcnOGTW+FJHdwVvDJl8XO7qJJDpvFj1qNZKgQ6al2g/3LtaoIfc5nNP4QvPe+lfVmapewRyw+Z58pHs9q65PdK4+VI93+jK56yGeJTwRKxK/jzSomlHElWy31pizoAxdtLIrezZzAxRdgI0zvCmJBc4ivqxDsyw42gYKDxi6ZTu9ksJWT1IOkMWau2HZ0eHYyvdDE1DEonU/ELqlfyRkVtAXZct9NnwtOxhpV9DemW0DAbgiiwwJNuC92S3CZnc0Ln1FbgEFYUnPgcDXrYqFQ4MZoedGugqP6iyQlKX7UgEGIY3P64KMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=Vho99Y/ZVXEj69GgVHLd6rcGx3UZTElrUYHDzjvtUWHA0GjiWc1KWbZ7TTGJjDdxpgEB2iEKJm1Iu4E9lBvn5UfY6qWKfkyhYICC8J0S9peE+4wrkzMnznWoBQjpX56UqlZLrlhUAKqDPwmoy9dbc1kzs64aDJpdYzYWYc9We4rdmnWp9NwnMomYFzKGqdtqMJODMcmaVf1DurNAAOS3MfkgHVMus6/3TcwftdNteki/DjCOPIOR7zCn8ORdkE4kGVUUqurQ9tunnEsCXzdxlHTTDi2X9iLeiLEGj5BmOkYlpPkxY1stgnpffkGgL7umpGNDHR899t5heYpZETRQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=QDhPCKpAyU7L+3VuNGtAHSlKKXalxWKS/f1WUHIiv7ZPkX4LKuJLnVPKRnpNQ2HMXRzip7EIlIwfTjdZAg1krkQegx3yZ9ceDeaNEKO7I+wGFKwV8mmkYCenRncoZzTOZB2Yj7Cz0EM85699WoZRQLV7s+eGw1Mli8pW55qnF0b0ZP3FydWd1XHL7esOYursII+IXP2EpzmnaB/otOgkbE4rUaBj50UamwhnMVKUaafVYrMwP85vhetlYmtrngUOnlSUMh+Zq9Z2aRQdlYGXs8Dm3irC5ja76PfaFOoMh3d8CHvsE0JKTv9j1JZbUTtnCwtoG7tiDLdvUgtEuTu33Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:06 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:06 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:03 +0200
Subject: [PATCH v6 08/10] arm64: dts: lx2160a: add labels to thermal
 trip-point nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-lx2160-pci-v6-8-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|AM1PEPF000252DF:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 59084474-1665-4d4d-4f1d-08deb03447e5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 0seMJZmJYodOFlaBmreApss8uu7onXj9pnD51bqhnHAFPTcifzP7zXSzTU9tOrHPLjbBGUVei+lly+VIZqEafzU3WSmeRrqdkdvt+ZXJXnK+S+rvAYEefP0WPSaEyne5TYbl/tRBdkj8Rbu+JIiQwggvXGLabnhOy5D8/pHShOfOpbrdBzmD91mNe+aXGTJzUMfCaBvkgLsv61Ee6teT28t4XFLRix1YjjCrIGRwF0pSynfl1JTJ2zsn6dSOHphSlvwCXomNcUNWkWWHSGxchhNKaXoXCI5yRLUuz0Px5T/yV2+3Bqcofw2kDQpYv62uuA6Vq9fYhnhS+b7GceB5KC97Z5q78YTcCfuizVj6UsE/Pc52Bscp7l8yNxaiCeurSntN1XaVUhnRr2fNilZgpK71zf4k4Z8VQzVPapjYA63S3AVUAlBhlD+rjuGqDbyE4b/ak5mA37uth5vsiF1LfEK4bQsCVh5ryJ/9nsH2fRSmT6f2u1NJYyUMs1PNudgjJ+oluBpRGoPswl4MI0sWvVW9BEHX+usEDxd7lUO2mdIaiVkD6F3rjmS1MIdp6v6J30av8YqisTX0wLFWvLAIwDfqPVN/ViVXJmIRchhq04saqbUcfQaVdwEB7eBpCrc5OBHzQylljWhAPdHKFrp5BM/qpjROx+pupn5DFNM3GmkBzLchLWSoVk2hdiBOhlPZE5YKH7tkIA689G7Moh0FijgRZjjMKeUUzUNlU6UFXFAD/DG0Zv4g8xIRKXoOpYZRsfOeu7pMbQPP6mazE3K5xQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 HZw1/dg1VfHJtdyqoH5mmZ4Ml2x4/6isp4FYgUdJRvktp56khdQ6H+Lqg1+9ibpPeVMmNKX0lZW7ufF9DO2Gd5Kx27kxqEKEBF8/XRy09ePrP77TBBZXdK5TYWwsqfxQ+Mezi7MXZMxszhQRg4FKYJT7YLavH1rorVA396twrearfq8L7QHz/tvkQUeIrWCoNddBeV/eCqAUxSFbKU88nuSlDAzzLt1/bmP1IAR0uP6gYGbF6Xt7yh1hMnfTbpT0hvLfs50lDBsJfeMuK8zmjb4ReLyNEEOE3szqtiTzWTqi3p3njm+Bm5//PYynEX8FqO4EA7SfhKR4IP4/v24m/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 07bd1ec7247a44968cf394c9cac7c7d8:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f04b8bb-1139-493a-cd27-08deb034386d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|82310400026|35042699022|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rnToxH0WjdoGtp3hHM0ZcrNoOj02rJlr0AI+adGNNGZ9Ran1va5xMvxA7i9v8woLmTY1vasymkSYnQ883sFB9kVFYoo1MXsNgHwJ7zrj+h80q00U6E8tIAZwRTJ92PcL2NiTp7YIDQa3wG+yFx7yU2NwVXi+N0ak55QdarFbvjHmtQsZwJBw6/0di7eFz68jrhh3ShAVsSQC2/jM65NYnIGauYGnUEoGcrNd0HOF9CR2bxZEZBQxjHpmDp/oKch7+T901XQbPkiNg38KKwuILY5FkWgZuaike4sN4YPAowmkhnUXSE66CA8n6GBgofwkpCBi+xcrSbdM/owHckGUCXtYjf24icIqiUsm2vCz8WTBUUa3uV/TEMa5eGg3A6rldbQYreupiVA0Bq9mwSn4JaCsi5VHwZy34e1XYVxQ0pVKkiK8ypy3Ze5VupxsE/rqvmDUdC9S8z0X7DIeDhBZZDoby+cWZxr805sSSJrxHlPJVliv97kd4VAAk/TqvYKdsKrAL4ieoxS+vYqE72TIdtSo0k6TgOOZ0OJSe5Z2u5BJdk+tfSFmmtXvamygu2+3/0f0i7xOM89J9xnymP//fWvbv8e6dbwVqmKn5zykVOmKoxU5hlsxLZozZ821N5wdNG6ju7c669R5tHVyoDM1I1fjQETuJg081OEWkOEvzbPAUl8e4USKCSvdosXztbExgsCqFlUfnP7R6GBCJkAa6/85K9l5dMRo4nq+CM5z5itjnNox5f9EsjQ9nyRwoN8QPmEWyuE72sfUhvv0nyBAkg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(82310400026)(35042699022)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yw/g1eA9AEAnWXhqASVRfjAuA0pnqHdlLrgnR7j85b3HyKyaRq0Tqgts8XoyNjtn2ILW71gLoJ0Ab/mNbsgBeKUV2FyYZfBgSwG6xCe7zqy7WWlCOPeHD3za1wN6KE7821nDYbezqz5zd18d38FLaHgMslPSbU7lBeQ+TiezTo2EeS+21CreAW8cun1x+1Rldt7mft+pVuhnSGyMVVY92YJcTVJyXrWe2CCW47/hjs6apvLht5qhwu5LNJ96WGc1NvG/TNZ7amRcVC/TsY/je8slsnykAxHpAuCCr10lewd/9thZtR6mH8KFQ7sTNYULpgrcMFFZunmZPqk3LhSLb4IlcERc0GXp/sbXD8hPR8jAHYO2O1k+7JZ7eWl74ZRKm5Bpa71AZS1v9epuj56d6EaYciDawP7Iuf5R9JF/EqPnBqmXyn+QgPW8LhzXRavM
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:32.3176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59084474-1665-4d4d-4f1d-08deb03447e5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884

LX2160A SoC dtsi defines rather conservative thermal trip points,
alert at 85°C and critical at 95°C.

This is okay for most boards, however the SoC maximum junction
temperature is 105°C in both commercial and industrial version.

Industrial grade boards need to change the thresholds to avoid premature
thermal shutdown in high-temeprature environments.

Add labels to all thermal trip point nodes, enabling board dts to
reference them and modify properties.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 3f63fbf2485e5..e2de7e596d2b6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -499,13 +499,13 @@ ddr-ctrl5-thermal {
 			thermal-sensors = <&tmu 1>;
 
 			trips {
-				ddr-cluster5-alert {
+				cluster5_alert: ddr-cluster5-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				ddr-cluster5-crit {
+				cluster5_crit: ddr-cluster5-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -519,13 +519,13 @@ wriop-thermal {
 			thermal-sensors = <&tmu 2>;
 
 			trips {
-				wriop-alert {
+				wriop_alert: wriop-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				wriop-crit {
+				wriop_crit: wriop-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -539,13 +539,13 @@ dce-thermal {
 			thermal-sensors = <&tmu 3>;
 
 			trips {
-				dce-qbman-alert {
+				dce_qbman_alert: dce-qbman-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				dce-qbman-crit {
+				dce_qbman_crit: dce-qbman-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -559,13 +559,13 @@ ccn-thermal {
 			thermal-sensors = <&tmu 4>;
 
 			trips {
-				ccn-dpaa-alert {
+				ccn_dpaa_alert: ccn-dpaa-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				ccn-dpaa-crit {
+				ccn_dpaa_crit: ccn-dpaa-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -579,13 +579,13 @@ cluster4-thermal {
 			thermal-sensors = <&tmu 5>;
 
 			trips {
-				clust4-hsio3-alert {
+				cluster4_alert: clust4-hsio3-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				clust4-hsio3-crit {
+				cluster4_crit: clust4-hsio3-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -599,13 +599,13 @@ cluster2-3-thermal {
 			thermal-sensors = <&tmu 6>;
 
 			trips {
-				cluster2-3-alert {
+				cluster2_3_alert: cluster2-3-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cluster2-3-crit {
+				cluster2_3_crit: cluster2-3-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";

-- 
2.51.0

