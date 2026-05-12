Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021075.outbound.protection.outlook.com [52.101.70.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4723C4B9A
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.75
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596771; cv=fail; b=DqQwFyE4Yof9WoiovWcCrwMa+UEPKIGJLkrdRdEb6Zm+ngEU96uSSsWDVIQtVFWBCmuMM/JM8N6OEUBHnJczXKqBuQFxh7fpBQKEfFpZ48qMcTksAae9Uf+9JYgO0OFgOT7y1dB88q6sJCFE20CdxuHFPtymf767auTw2+6qAys=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596771; c=relaxed/simple;
	bh=fWqUwfECAo0pbzJX8IZlFB3qdJ2DIULHwcoadTNlNrM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UUJZYmT+0BTwGi0G4MdeZZraxx2df5P+frH195x+to+b7AIuzyz3K72EKGVqOrpJj7thOqctdGaP8V/x8ZuaKTisq702w+50qcPpxJRK80PMdra/faeIFcKrveFktL3iT//PeZ5FSoX9TtiXPsLXhvZMQAgVTDMEtuzXPvTdGTA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=foNv9pxg; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=foNv9pxg; arc=fail smtp.client-ip=52.101.70.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="foNv9pxg";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="foNv9pxg"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NHJl9ZbPlXw7KnAkXLavQ7MG8p/zqGnH4650ifGn+7LmEEzHVFlBQzGAbOHOkN4aBv7+k+5hLzYBcHOqpichE0sENiTbOQyRZkgpgX2D3SIngW83yo1MwcmANXzkpok/pq33QzU9d9Y993MTjE2tVAs+r3TyEydgzASXv8YxgNy6PK7qyk7l4ipqcy0AihH9d4Y6g2UeKtKe/C9BhgawpzEs/ZE8Wwg6knWMOGMEr69G6E7vLYUX+TTsFfZX7i5gKJ0S27SE+/xJLkO6wzL84PHHdNNeePmZ2khq0qcdmyaTty/nUGcEJdBi2duk4YZYYS6Yc5OnM1JTNcZRTLXlTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=WIPa2nVP3JbY0e8KtojX3eOZcWf1ir5o9aeIiJCJ5WV9hueSttjl93mPPYH1/veiJprGxHhtt1xgi2YTQDxYvcPE41Fzl/f5PhjaX0ZvBdjpytVTU01GlfOofQ/UJay1It6jClSj1qaBZ0vLFbtaL4uHZm68VeK6/ev1wwLYOmfCmAdY+798TRqLjWCTyAUWcb88Tm5Q1xVx+B0MJ/QbuLcWXfyUvgSL96hcouZesMuxU/7tulR39MWcep7EIcTToQ1cTOTMjm803aZRAuvsswNdBXKBbGkBHY0M57tspuemSzUvp4o03qnoucA5miphYvoErn1FLZvjQC0dcIUp9Q==
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
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=foNv9pxggqJ/kh4NYNE4cpgKAOd4MT1706Nd2sMbSmi5aTPBEAddbSyYFV5rh41BG5crNLYcsMiBSL4KNWKJrySfZggB2EhwZGmq+oTH6nQpxyNukj4agGIiRhv8jKaeTkRzRi2UFycwFsc17QBQr6e+8+OD7rPIWWLc55Dhdwqjl3tHhsWfem20WgnUSECRm8fjSp4H2VYoW56p0O+Wy5GoQvtTeO2drmmrYCP5i5C0Fx7Sijc/DObZd3EnyEaxGjX84Ds7uwFNwi+I8qt1TmzPX/J8aPbrzEQSVzseFuw0NIsF8d7NWw3g4s1QHvG1wOHqG3aWF7filxpU0EtxhA==
Received: from DB8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:110::34)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:39:25 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::c8) by DB8PR04CA0024.outlook.office365.com
 (2603:10a6:10:110::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 12 May 2026 14:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13 via
 Frontend Transport; Tue, 12 May 2026 14:39:25 +0000
Received: from emails-9284629-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 281D57FCDC;
	Tue, 12 May 2026 14:39:25 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:11 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AstS/u8g+gDFl4n3kRWj8ywcyr4ghBi8B7szjR1pA8MCE8CoyNlontlE24vlOofW7px7fyv+JRZ+YkkWhVqGJUC4ncykv7M14WG1bBYnrvQnOHpVFFVR+JrFd55gJ1ifkoo9WJa0/wOVa0bZUpPa+Xk9f5UdJ20Gmn3kQRES8uzz5rweK7Bwro9oxURn0f78JPzr9KWrQYc5O2mPu6kxOpemcgpfucX/xZB9WnkDaUiZNLJmj+zyDr0x9e43wdB2NhKc3Zc54277GgwB7RcwDa6n/tPch5FtL/bbzlLEMIWAn6696oIy5cyevrT3E14oNZzOtYoXapX/I9jUXN95yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=jcSgx1vcdAtz/+n3NacVrqIT+/Y01P1B2Qg88DR3TWwRo/VbT/m8LL/or900pKbfdK601CjyFRbR6F9hK6CGjq5HsdZY2SMIZgp5XofcaTdZFMXqDjtZMRSJ6irckTRLl9IjktDv76DNSv9ce+JSPh6F/ibXEtUpeLnm6MkOkAyPaBEbLF5aI4otFdxIM6v5jii6+eOHPDzB92BrmUswznuzPO5sQVoAn2iVU4SSOZhp7h5xICCRx2oJmqu6nLA1yp04TZ+J57LHE40OqhNzlkS/MLEVrdOtLTxGAq35oEgiFZcLvCowO1JOUio3p2eN8S39R04Sk0tR3FkaSU4jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=foNv9pxggqJ/kh4NYNE4cpgKAOd4MT1706Nd2sMbSmi5aTPBEAddbSyYFV5rh41BG5crNLYcsMiBSL4KNWKJrySfZggB2EhwZGmq+oTH6nQpxyNukj4agGIiRhv8jKaeTkRzRi2UFycwFsc17QBQr6e+8+OD7rPIWWLc55Dhdwqjl3tHhsWfem20WgnUSECRm8fjSp4H2VYoW56p0O+Wy5GoQvtTeO2drmmrYCP5i5C0Fx7Sijc/DObZd3EnyEaxGjX84Ds7uwFNwi+I8qt1TmzPX/J8aPbrzEQSVzseFuw0NIsF8d7NWw3g4s1QHvG1wOHqG3aWF7filxpU0EtxhA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7629.eurprd04.prod.outlook.com
 (2603:10a6:102:f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:05 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:05 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:01 +0200
Subject: [PATCH v6 06/10] arm64: dts: lx2160a-clearfog-itx: remove
 redundant dts version tag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-6-d0ff72d3c983@solid-run.com>
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
	GVXPR04MB12057:EE_|PA4PR04MB7629:EE_|DU6PEPF0000A7DE:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ecac94-56f0-4887-7c63-08deb03443aa
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 4MasJqhkG4XKir2CzDIJ8ow/W5o2H2hgYMZ264K5O/+ldjeJwoq7eO3b91x062ciSiqsbg5f1JUotwwn6ppnF5B1qws3gUH5uTN/N+aPdvmcA+y5kGuS7hIp0lGIIWzzZVK+1TjePUnLtvYtQdVfNFR8RJ5P3aIJIP6iOXPe2tf0u6yQvISuaRN7YAu4/WZRdpkm5bMNF4XlQ3jXDC3xvUQo/zZmx/OvtRteDLUoQvM2n4xostRIS+dhgFiF4sWcaCjkmOXKdJmgQZvQpXCNGO2NRM7md35dq7GS2O3IyEqQSxbQ1mQu1+f5CZxgbuZyBOmLaOf5Wd6tnH4TH7xPn/blB6CJYz0Heua7PgZmEbBSdyUNFRnsjncCVQnBuMRS3Sp/DAvvIQkDpAP9VRaLE6TH0L8le4VWvkdC9R6GbfiZxNTe/fKVM+wwMpEfyaVuhYu2O6iTK9KEU6D7XiTBvJKjtQLBdIM47TfC66rDlRv9UkC3ErLgrZTKEltR4jAjfegkKH9Ynx6Za6unccryZ8EUZl5g2H6ombpJmmrGPobga54jhwQKi2Ux9Zf5+05KOlvl/vHSBIUla6njhfJU9m92V71HIrUfzyp/WFSehCWjPK38XIgH1J0X93ea7ldoV8lNWMsShI2MAFAweqAArmhLEINnzV9L2RY/JvvJScfv37aImTi9iFsqIkYb+y5tNcsb07t7RkJi4bgxToxx5IKgeZOO+hJqoX9d4g+GNIk7WObgSZ207dhoEth+rDDjAmfHlMMaNMMOHkn89ehNrg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 HwrA0MV//jxD3YHOap0ZS9pmwxxFSJOr9qwNrXfaP5YF6h2QQYKgDhM79NUKjBaOdo0nBYkxXccSmR3FKdupUZQNyap4AYbLrHtZZqC0+oiS+94kcJ4vamwcoRvjL0f9dmK0quhP8vO//+EU1r0INJdJwRE2GohpPF/riOqxotcPQFc/fT7aprfKMDTyVyzyD3sQMn31fxY3P7ensifeLrP+G2+YwARmxoNtty2LkAutsdqHNxpOY320uWKAg2ryNkIrj9mq3lMADfefnKgA8/VEMqa3wD4V9GdOyHLchaH/p0Zj4MFtJ7bA302i5WspCeDbohk3DgR9bDWMThkO4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 43cf15c747e044fca0a0c79f560c3161:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9285a204-3029-47d1-7c3d-08deb0343782
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|1800799024|14060799003|82310400026|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Qvc5BnccLaSb+c+0NuEiXCIuHdGTgj1uvIdryCMYLRIqF5Juv2n4XEcj3fFAblCA+hBhaxF2PlibiaFx2TSNhJ/VAREbb+6MAtaQ2mh9ySwr2VmFrUoHvnv1tuAzICXTu81MzrsbrciTxeBstaN3b1W2e7NWkTp3MsqtVIRxNoNYKZSWtoNr+gMCa89uCpDWsB4seyyopPWTFbcxFJD+wPO/0XlAbY7ydbcPSb/b//D+2wwo0v/Y7HvvAufwxYrkxO0oGoS1Ip2zlP5zBvfQBy5oTmwQyha6OM6Oo8Ep0N7NgqbgXWR5WTIOaoxlGkKvnP1FNWH636hhl78Mm8mx6sR5z0lTlvz+JuI2Wn21ewJTTzXCa4kuGh62brf2zm467uIdr7QDPRkeauwYYNR6E33o9wt+lYPDJrGk0KPahRCSCbzYVX/jNh0xGY0w3hCBe/o+6o3KGM6MdMlrhKiMmDVK0j5VHfJqVSZl3uGFyB3F0Qta8nsv8WJtirqJO+plaDluBU2OVMWz3NhailsO/Dx0a+Wevr1kfjGzWRM/SS3B1+immmPzlpJ7Nyo9Qo9m4hLjW65BmEUIJeH9ErFF91iJVz9yqPVZIXfCCS5iMgOQ14eYjbx+TJRirDbNPbj8+WQVh2EvUVHbD8AUyhvsEkAMT103h1ctGL3ibJKW/SCgdWfIxn+YD/XYa/7d+ITJjsVuZIy6V8pY8tG17s+hSshqF+x7yhhg+85BAWoUKpTZU5vK5BmrVRFJIezWA1ngdMByOdGAt11s+4GkCd89Bg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(1800799024)(14060799003)(82310400026)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hys6R8SpZL5WloZvP8Ke/i6aNClfQLKY6zJGl2njUlaV/IEp5ZG/Xya21p854+BOQezP6xHG1qQKFrxOCT6Sr9+6nyYhCasFE8hH0TXB0sm76Z7GqGmZQIaMPUnK0KEw6Be6C2I8nTw/ONWxSQCpYY6BwVhueW1ynh0RVq4m9Gzn7NbkBk8RnFJeNekVDo8FpArpnxKtkzTMhbxhUxaVkCWWXDLbnhEVkF2BFPZEKkyCQZjwYJqyuUygU2skp6EeGLeGWAbi3joRhFuWPX+005TUZj5oxhfgsbbjdh2PioHEA728fdWWCUHJrMFWaprmlUGOzSaWXwUR9yL8q3XrbP2LbsdS8aBVMBpktrs+Qz+PI6Ay9EbvQZ53lD/jitrBgPyNGsXmQ2GYecRddSEqgxBMM/DRuFFco31gdxK6DTQN4+yNz1ykT8mGLDUQPaFd
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:25.2796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ecac94-56f0-4887-7c63-08deb03443aa
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

The dts version tag should only appear in the top level dts file.

Since the cex-7 module and clearfog-itx are shared code intended for
inclusion, drop their dts version tags.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 90956ffb8ea9a..56b74837ddd48 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -4,8 +4,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-/dts-v1/;
-
 #include "fsl-lx2160a.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 580ee9b3026e3..6388bd60ffdf5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -5,8 +5,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-/dts-v1/;
-
 #include "fsl-lx2160a-cex7.dtsi"
 #include <dt-bindings/input/linux-event-codes.h>
 

-- 
2.51.0

