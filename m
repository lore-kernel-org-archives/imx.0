Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020123.outbound.protection.outlook.com [52.101.84.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B177397AF5
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.123
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634508; cv=fail; b=BbER1y6fHzSTIbHh5EtXbcL6wbUtir7/yRuUVXr+P/AcMbwzcsdrQnS+7XYY9V/KTQJwgJLM6Pb/qfmGjosoCaL7H0oYkRTwFuiqcRDcTL2XKDej3+PD8F/MmKfSIhofUEy78wpbgi/YrkTf9rCImV8qKxsIr5CF0S7uACcTbUs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634508; c=relaxed/simple;
	bh=Q+giHvi6Tl2QbR1mwMeRuZLclutHp+ti9027eUIAs8U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iLsT95aQYO46PbemBr2fH8BTvsx9Ohu24fMta/WAxnxiq/GRZaXrroT5hCFdN6GCgtxDSpyh39gomjRCIPR2xzXuygdFkjt7A2Dl1UgFfNA/JVqC2SCUj6qXAVSTF82xZnecyixvWkXA6r3gZREE+76EeB+tOUMS+hVkypTh6Mg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=E48t+wnr; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=E48t+wnr; arc=fail smtp.client-ip=52.101.84.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="E48t+wnr";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="E48t+wnr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=hmZRxiaFKYNS8wLzsBx94oY6PFZez5mUCFVIfs3lLyqMmaJ5gALwQvujjQmrc2o7WfIPkEoXSL6ME6HtzprkwDY+ujCyPDsan1fkEqX1l/sdOVY4wkDhqZQvWPNJtCb/engZCKH1IFvSRLiIzdI6WSzxu80LPCxyo3fSGoewLlb9GP/mEzztoypiGAHYb+nWi1cXINYojR/OowcT2EkTIhm2cr10wBjacBlslPPPKV761b+tLarqpF+26eyw0EGFsE3v3fgItdmMEPZErIsJvYO9vd2ZMRGWgwhsSZTs1lfwvuIDm9icrVWlV+tYrDtqtZjCNYmRjGG1tVlY+cm3NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPSRd4TqO9OiRVUBJrKLocuBcpGePr5/Y8DoZDLbYUE=;
 b=dEpbZaJ3r4rBZ/pnKWya5KIpIdSjo2gZpiycFEVDEDNWhNxUpbML3eLIqyMJy/lmoKeoiDHX6Skc59A6Y+i10nDrcw8sWetuitEOOS3zgqUSaAFV88qxZxLdZlUISrwOey1pzGxMLrEJrnC1/MawH1M/oH2GCLNEeQbRdx0okbEfoDnei1kSlw+OTcsYDixziBrN6h3kLtKsH2z+yEsNqDxpRGLrp9RJTZcO2M5/e50Y+ZvaAhDW/LwMpMBcZ7K1F9nlxEL4VGEGi2iUqGK+jP6l0wxNKe2hGnj2Mms+1npFjr0QEcelXcvin9ZOi7un45XzTj5J0D/peOWYnhVo0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPSRd4TqO9OiRVUBJrKLocuBcpGePr5/Y8DoZDLbYUE=;
 b=E48t+wnrD4GfYZ72/mf72vfOhBZKHiATSaQwglLYS9+Ac3UL25JL2o4IfVQ1RXPjBUwrZvKz67yA8oIYQELIGGeTKUPQpsxDh8ZgRay83v+wkx2OY6K5RaLWb9BUsW4GoLr9pOQQvo7u5DADYPa2HayX0Af9ou6o0PFh9xN5twnIrn8naa53GakzO0kKGUyfOHCkyi1kYVrmMqeKKndgt2WIJQSj1XwI53TJBjnCaQ+NK6pjso4k3WSEKPFkLUd70b/K2clt9OuWS2Xzcx041FscOJ4JcfhaEaRJAih/1uWFsnZ+YkC9pHgEGZc5AQkVmi36swUsUXTrk2WMHXPGsg==
Received: from CWLP123CA0100.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::16)
 by AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:55:00 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::a6) by CWLP123CA0100.outlook.office365.com
 (2603:10a6:401:5f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:55:00 +0000
Received: from emails-748404-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 51DE67FE4F;
	Sun, 24 May 2026 14:55:00 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:50 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyQNAnTVKfxBojAGXSg9xu8ZYGmtI6BEeqI1YCpSR6Iu+xOf9IWqck/gqzmce42X/LoXtJ6LVdbJLAmlwQ3pXf4VyXKLoGC8vt7lxnMkiuLynhk+A8bJ2aUiQABkD+BMrPCQHTdtBFrFuvWzqNLt3BdYGSe2HrgAf4iFX0oN2Nf32zHcFWAaLpSw2AYnfgaI41EFBNXaEouwKaOsql2pPyuv63rlCSD7sLY5Dkw5uqlurANjr2n6K/KHGeas+plkneNx3jDD/5sVP24wvR/9Tb4wY8o24N0xNGAMiuGAwLtuutSnilZHpJsMJi41j2OR+bDKc7cJbNytaI7bYTNwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPSRd4TqO9OiRVUBJrKLocuBcpGePr5/Y8DoZDLbYUE=;
 b=mEZHf//OJtPaIeZeAWPH7Ltfw1fheJ1xpx9QfJU0LQcug4PT/D6dHdUM/VBszYDTRSC1Bw5llet0TSZASiz9B9DiLuIptjii08s57JvnFheNfP96Vg5ZSTIfqf9kQG6qN8u+46VrJG7b/DFOOJajdwUi1YFO5yU2+sds69Xh+oebSNS+9ZOuDQG61J7mUNu9lvg72aZ2s3X9v+YcuD/fQgyT88K5BCMKG/jKa2jpWDS1RdcjACUhxCOnJxeh924Dz9sqtpAiEIxvLom6SIfFMuc182XlvyfhZCwqfLf/nn+1oYeCvJM+BgBFowrY14g9DYO135YnlLkt8ftCsdUO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPSRd4TqO9OiRVUBJrKLocuBcpGePr5/Y8DoZDLbYUE=;
 b=E48t+wnrD4GfYZ72/mf72vfOhBZKHiATSaQwglLYS9+Ac3UL25JL2o4IfVQ1RXPjBUwrZvKz67yA8oIYQELIGGeTKUPQpsxDh8ZgRay83v+wkx2OY6K5RaLWb9BUsW4GoLr9pOQQvo7u5DADYPa2HayX0Af9ou6o0PFh9xN5twnIrn8naa53GakzO0kKGUyfOHCkyi1kYVrmMqeKKndgt2WIJQSj1XwI53TJBjnCaQ+NK6pjso4k3WSEKPFkLUd70b/K2clt9OuWS2Xzcx041FscOJ4JcfhaEaRJAih/1uWFsnZ+YkC9pHgEGZc5AQkVmi36swUsUXTrk2WMHXPGsg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:49 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:49 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:47 +0200
Subject: [PATCH v7 8/9] arm64: dts: lx2160a-cex7: add usb hub
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-8-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
In-Reply-To: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To DB8PR04MB6859.eurprd04.prod.outlook.com
 (2603:10a6:10:119::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|AM3PEPF00009B9D:EE_|AM9PR04MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: d286613a-ff44-4d98-ad4b-08deb9a46e20
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 SFsxwettQkYZBXRlPDy52ZtPnKnEVQ0PzQ3W/+TGrRm+uJs/OJoADw5PSNEtL1I4P3muwK9jXygkG9HTHww4EqzAUFhHrGfwXHs6aicqbyjbrb70dr0a8X8OTOkIvGnOw+74gdNHruEDTgStKOkqIYAF3yNwU7sdjw29SpK+6XqHm9+94YmClk95sl1BCboej6yKGZygEJwBlV0Agx9yP4HkOP47DjcjvyGk7uMsNhBx1ZfM8k3PUQQtrC/UBsCNyPcBNMIJ5CBWoqpSsvfAE8qSXRZrnk7d8bnYh5tbgdjvS87s5s9dm/WdY5RNEoiHEQL+HjBTSJ/+pgeNMy2Ju9elbkGCviVtU5h9jQNAdFrC2fEO6GULIhrBobMcwKmjQ4lAFlEp8xxSyHA7xZifOBEDCt89oI3/jk9MlRI8Rsm4V4aKsipK4oCAFAaN7GoHwzCdEAR4u72Mcp1lloi4yJrnmFwbptGbleTPoUt6hsWCIkgnbFzLDzG1qwnYR74r7rc7B7xJ/JcLktYdYxwfwrfdv+UMCGFES5nWBtagXq5zbCm1lKid+XubfQTKjzzn4zoI4A6WieGhhsTngdpdaf56wiDvcslKPw04SMFqX6yVWLXTHJQhNFQt5xjxGi4kfHiZBXDe3aSmpXk57Wm4eksKuSTUdCDK+QTBZnbPmL5PahZIpycfly464vq+UG36Gjvmao1g2aptaXawVyMTEk+GDq2c8rnkUHhUiFOVc/HMJt6KYt9kAS1gi/1kYYEGWUn3hM8PZuzagNB5LKXY4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 BS+95M5EL6DUPhKUJHqTMNlY2BkrqzGiehrl3qyheL/GSTu6Ib1yhhER9JOeV7LjbxzMwk/urwJenjk0mveUoqaqmSy3oOmZ9wxSeWlpcyCSThoK9dBzF1EkAStEMZm7vbdGZpz8OZOxq/zusmVY2jWov5qYrhQRbryl2VkAWKe7rg0+a9GnMwVg0O2Ngh+OqJkZMHHQAvc/pD5ZbIKPhK2Sj78wHj0YFLZAmAFzw0LCm/YgGcikEHQPa4r9i4MSIlE+saw6sSG0dUhuuAp1p03vjQWW+wr8lJZsPJ8eZAT1etNEzAGyp3tR92CWIsqffbnYI5uGkodhNZWjHZOkfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a559ec74f146421fa87300d72036df27:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c90dc23b-6e50-4f5b-1c46-08deb9a46730
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|14060799003|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	vjuys5j4lNRz8dxbjO/jXmdN3q99S13zZlbpupXYFHbuVqhGIfUuyUmuh1pkbs9OSf3jtRGy/jjT5/DaVsl0Lbae+7RQID8ap/1XlzmRNT52pDII1kf1M0tQEmIr5e6JJG7tnAgA/L41BY5RBScPseNv32mQ4Wp+bz8hK+wPBXsBsev0xd6VDW2PYZT0WrzNeZT1oNjt8+89Qi7GX+VV/lnsFb35s+ALiG73yoJ8QkO8t7heeJsHaaJ4BjrJnhrmlOmvgCjmAdqkL0dxxPDZWWKSqfpp99G4/vYd2prurZZOXHKcW9Bh3gzFg+gw79AAFqWR35k2o77SjwwmZP6b49TnVd2fYH7fnrPlO2z6QrqVLs8gfa5pL7qzljpsgAN908pqzqQK7eJtEDwoU8RDLQXlE2dMeRMtHtWhEai6q6hAJc152Hrt5QOZY3CtskLAZylIsCkRhWN9sZK2qIoXM+k7LX1pkxVlgZGbMr9jk9ektLRHYroxOhagsX0o1AtNdvKe/OyfonTbTPAZEC4x6jPIvGNCAVEfQqF4oJYlgI5JZqg/XZAxWFxlRlQO//cWMM/CoeqpYkyI7nF1HffQ59HRg3He2kxMqx3KpIA7WDl0IgbXxP0nHRzcShDNtIyogUigU/cRcymWjDHorChUep+cp3qsEZ6LsARpEeGVnuLel0yRE0uvM08yBfABb2eZ2Bkcz0GILKFodBPhjw3fi/95ance03JrwPfES18ntM4V4U/pYhSUAA66wISs6nTnnWex4EScFeOGzVOvvm7tDg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(14060799003)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rZD1Z1pI97aGz+8fbHTtXPD9zbzLwhwqlza8nwvMPcEcToSrCSnZR7GzxyfL6qwz17t2IJ8iRF/kABwa5+dIVUUJf5uZSgMa5aw2EMc4N7Jat+a0vL9UkIPDg/p25Demx+sCve0oSgJ1PmY0CHC0uOZ/XvqWc55YgFD7nMxakTTi+YsSNoXyaczfAK6nvJbqYUv0VvQN/Pv6/Sld/FNxUtB3MJUas8cFa9oH8H4hA0buntCC8VkM9poEOKy4bHZVIMQobWtY3FfG9ZBGrYdUZRWpFVtQrNX+t7GP5HI8PdLNMbP1OMq1Z3djXB5NTqGwHAkY9jLrOehOn8UBbjfoDHoVGjTLUqUEC5M7SXgBRfJBSAidOUeER9mDiZU2wTiAWwwYbx7WiRp+jYNS09WIuZr7Ctp6AUz+U5z36d/7ydU3XSpNeOQwj2neNBjmD7pW
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:55:00.5591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d286613a-ff44-4d98-ad4b-08deb9a46e20
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8570

LX2160A CEX-7 module provides a total of 4 USB ports to the carrier
board, one from first usb controller, and 3 from a hub behind the second
controller.

Both controllers currently have their status set okay in the module's
dtsi file. However devices should be disabled by default when
incomplete.

The first USB controller is only completed by a carrier board featuring
a device or USB connector.

The second controller hosts a USB hub and should therefore be active.

Add description for the USB hub, and enable the first controller only in
the carrier board description.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 29 +++++++++++++++++++---
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |  4 +++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7df93bb37d13c..2c86734c39ab2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -13,6 +13,13 @@ aliases {
 		rtc0 = &com_rtc;
 	};
 
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+	};
+
 	sb_3v3: regulator-sb3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "RT7290";
@@ -181,10 +188,24 @@ &pinmux_i2crv {
 	pinctrl-0 = <&gpio0_14_12_pins>;
 };
 
-&usb0 {
-	status = "okay";
-};
-
 &usb1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	usb_hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&usb_hub_3_0>;
+		vdd2-supply = <&sb_3v3>;
+		vdd-supply = <&v_1_2>;
+	};
+
+	usb_hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&usb_hub_2_0>;
+		vdd2-supply = <&sb_3v3>;
+		vdd-supply = <&v_1_2>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 170e5b0034f19..4bc151d721ddf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -142,3 +142,7 @@ &uart0 {
 &uart1 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+};

-- 
2.51.0

