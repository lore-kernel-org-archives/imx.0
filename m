Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023079.outbound.protection.outlook.com [40.107.162.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA739EF2E
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.79
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425949; cv=fail; b=hDCMrujn2nnjs8Kf5xXe8oeofgVkvGZqy54i/MY8WjB3k14sAAhFKRnxme4OhUhU3TidVXTe3xuwtVtTqHiHz7SeLQBwcXjP71qciEk7UlTa9b9wn2Ckn5ymc5Z0O4SWh1JykhUgF519BEy3bPfL6VnJIQVarIRAiTc3PC3gGsQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425949; c=relaxed/simple;
	bh=tViz19iz3RssNeE052VduAK2g0qWzA/P8H6UJHBCk2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uEnOOQBw5oTggMvjHMTn7Bhw9gQA13+W7v3M2BrcLVy7XWFY3SjjSDFyhOh9HR75AgZZUvLHl4qOgsiWnxKvUXCn0gEtC63PtnNdwlX/162lBjn+eTP41letQLpI4E5iFvkOcl0ix9fIudKVld2fbiu0ELXf8rQs6wsq6iyV8ew=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wUqENV62; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wUqENV62; arc=fail smtp.client-ip=40.107.162.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wUqENV62";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wUqENV62"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oTYXl6PNigJhpsXUzg9GrEv7PfTEIL1CvgQz2wBvBtVN/coD4W3fpCcBernUp2iwljxWgieTxKPqoW+JypS0Te2XJj35qwN+ibh9yM5vul4osjWPhTO7FICoObQpgTt8IRQozOD0az2epGGalyhlih9nozGBrX4GRcQcuE6Th+uqxyG8pQ30EVd0TiMDPLiGO4jiRPY/dnWyQmOQrgtj8VMqUpRi/qzwMzsRm2pyasBY4Rns0walfKI3Gs2ETDZ/PtMkqTyvf6rBXlnFo6iq2cMNx3xvcIDnRQOm7tWuDDe/3xxtACWEf2oxEONM7IxOEU7gSFgKDOsioS7vM7ZIzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=OyAP/UvsFxgJDDXTbthSZX0EX8T43lIJgztZ1cpH4tAgD04hymVuPl8hYZYeJhLpGkNp47zI93XTN6kUxbRNoOVZWJzgTouKitbbNjuWhWlGQQZTudNyhPwrk7+MjtXPPkQ45sW/MEhQexRhyMc/ya0aMhlWh5JtFj8Xuy2QC8lMhlLIvtriJKOlxcAqOr3iyjWDdx5GuzkmF7uLJ3gw7ICn2Rl3zp1JbGKUGgq+9v9e4dcYLWxhinWDwgb816gTjQOW3tS5FMWrfZjOjmk+/oEi/MFWILRsW4QoW0Fgj3GNnUCikV1TBF+YNOhm9oW2IJGLJQ4pFWjSlr3d8xRAkA==
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
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=wUqENV62oKjGojKzREBkY5Uymwdsqx+7rCk7Yy6zaEADPOEJXqeSACrRqotiUgbt6BHUWNuGTlAecf2OmN6cigeVDintlCDs6t9HRTfU5WBS5J4Z/kE9O1JQJCX3nh3NDgycoyhPSUFopRocXskhCu3HyG2YWBU1+D8yMWwxSRVnHA9EaXzftFueP1JtsTqNrddJsW4rCodnF7MrFtwLPfZA99jpEukT3zKiSho55N0Szg2Ld98RJ8OjeU+jbYWnK0dj2N88u6rwgIbxfoIdTUsnMAxFRzF3EAy+hTZcom/hR//Gf1r2KIkf+YVxQpwXWytYy2Hx+WB/tUNcR5E/mA==
Received: from CW1P123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::7)
 by AMDPR04MB11583.eurprd04.prod.outlook.com (2603:10a6:20b:718::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Sun, 10 May
 2026 15:12:24 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:400:293:cafe::5) by CW1P123CA0011.outlook.office365.com
 (2603:10a6:400:293::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:23 +0000
Received: from emails-6537907-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A6F7C805BC;
	Sun, 10 May 2026 15:12:23 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:17 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0j7SyI1obBnZP+ImxeEWqLQlE7eGOH4obKzMdJprYsFgGSQLwNgT7kVjYXJBTBGL8q0kZZpgmp/k1UJqwGuOATyUktVf4FX49FHMSwjnUQO8Jo2cjqJhtnZ8BYytILtZSrxdFybJAm3WvnbXMNDoTUOUIH2l/ObA2H60TzRENqnv8CM6bjB0Nqsg5r1Nr7DzHToBMUVzDChhgUinq7gYOZFv7bY01R1EFXhifzMVgkIkr4IW2BXIgqRl8Ak1peQCOE9H0X1qQ6DaGMbUcYh9JFry9eMatyRKjV2WY037rN/l5nqsOuI1y3NDzE9glBWidaH45cAK7fYYhJoXm1v5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=Txb2UaedgEM6of/vCgQp5Yq+yVXyiaI/zBl3ihqlGvv/rU60zuwbTGMk9spQjGDK6O0kisRdSg8or75ywII4VKWok6B9dDgWdPn67BK/z2GqCmWEPzPI3ZKKz+vhUQ00YOrV8RU8U+nZzZ4c4FmRfVoSzty+w5QpLZDhwzQNjEtKWS5oRzX4P19qwdv/EDby50dLTOocpsgLiWKCY6fqPLRMuEKZoy8LMjnEsIEYOsVtcIJrz5Uw/cNoOwpYLopzu/ExYUP3SGpr2OxCRlV8WqdmopG4oCj70EAEqjicCfeb7jxWXuUR6H8yu2Zx0Wn1Vb5vdMQYMVmAZr36ahxuzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=wUqENV62oKjGojKzREBkY5Uymwdsqx+7rCk7Yy6zaEADPOEJXqeSACrRqotiUgbt6BHUWNuGTlAecf2OmN6cigeVDintlCDs6t9HRTfU5WBS5J4Z/kE9O1JQJCX3nh3NDgycoyhPSUFopRocXskhCu3HyG2YWBU1+D8yMWwxSRVnHA9EaXzftFueP1JtsTqNrddJsW4rCodnF7MrFtwLPfZA99jpEukT3zKiSho55N0Szg2Ld98RJ8OjeU+jbYWnK0dj2N88u6rwgIbxfoIdTUsnMAxFRzF3EAy+hTZcom/hR//Gf1r2KIkf+YVxQpwXWytYy2Hx+WB/tUNcR5E/mA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:11 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:07 +0200
Subject: [PATCH v5 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a twins
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-5-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
In-Reply-To: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|AMS0EPF000001B0:EE_|AMDPR04MB11583:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b64098-3661-4fdd-aab1-08deaea68a3c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 7F+5+iwqe19UdLEWwQgaqbYrXBAGgtnzM6VcLwLC5K7JCxBcI0gDMawvzZY1Oiie47Yq6BsjY66JsKS34gF6qX0duW6pTifHWYytpJShZYW/AKH06Y3uSNom8UUwEwOc4PzRZJ5XbSJpSlgv9ZO3mE1uOmUN46XmWf4LAcInZMFNpPVinWDgbk0vADAv1qaqKz6oN+rOOs1nAED+9iAKVyL6sXrFpTLtdgTk2aZNGcYe2W1u4ob/7+L3/Y7dLFESh9epjM8tRUCTOE9LLWQODeQjlLgwfCFUSD7bDLR2tYq8qpRLLSNEm47B4iw1nYmqMZGCGchheuz6V/T9mERukUz5z2KHgKyhI0chLrd6ARmVmDVr17k9+ypBzIllDg7m9wv8Ch3ABDIBRfVpgsqgnkHeC8osXJbtvG+tX9JLnpDClDqFHQaaaNpACFNOcxO35ZArTHYCuYsobEf0m1/qbQMzVe57em3SgfwwrwiKQQUu7Z8XA+WIzLZqL8SGb3rSpgC5FOT9U1Iw5OLRkwBS1ZE6eF0mJ92BqRPVXn45dNuZDSaulyQQifrcSF63HO6VnPeJ9qc0eflAyQ1AYGurnCfdFYIQKqH/sT9SXLk7WHb/TCzwmmVkC0Fiq0+nDN4M4/Q0A2yWpS3znqd83JY1jTinFts5d3JMfT4hK44igtfPIUCe2YiIoYreji1krToQR1noKMSxkgfH+HylNZBxtc2vs0C6OVAzv0t4nflrIXQW3/DzRR2JA1TNVNdo8qyrkLPK2/2uga7xoGrlEYkvnA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 W9j8O+IkmBYh09C+GzPaZxb/hAekUmO30z0tF7LBaQz/WegmZ6dTnJS3IcupJAkfkY2L6T04qWOgQQvuDwEnSCYSWI7etix0fsSAPVQBYW62447JOX1i3Z2dMp9dE1Dj6lQmwFEXhHxAikuCBgrWlAcWGiqaYGRCCBDRP3Vqs4PJv7aOBJzKkFl1grvhIRgE6d83N99WxjCIzcfls1REOdYt7BLewbYaehC9tsqauO6QnhQf7pr4MKVMPq7jobjHWirmqryO9fN26U3tgFjwK6fZYuzLtWClI674c0lhZtMdY0Nr89iC/PxRtl9NsS1zaVYeU/PZB3W1jHWIet782A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e682216458a347d3a171a0ea856715d8:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8adb2bf9-13c4-4e66-7262-08deaea682a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|35042699022|7416014|36860700016|82310400026|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YiCrdn6T1kPric4ddyhiOntKWA3DONZ47xtOFvPKTdEL7lh4Qyb1cKLN33taNEvacrbjbslSo1oJ/nFYZEeSUpqIP426HlNnoTc4+LRc1h1iYpzqcUdO8XKPlCI2wvQcoQpUUTPCQjy676Ay4AzdBD1a8GA4KUbroQ7uLI7cMGZyQcPqBjyMuqjGakNpGQ5k2KFZ1oIN9Yyh/X9srXzhNtM7o0wDf+Xkd8HavEkLboq/yW6XfBsiq9iCz54R12wIMHTUJYU6xW+YRWebLn/5lUlK++glEGKjQuuBht1sJB46yIO6YpMYGjt0ROyyJBW35mdtuumhh/pRzS1JYcSVoMCqi54QZuMnOLbfYpfDhcpW5Jdf4udGQ4usz33PpzYO9au2PeSjk4JfLn+EshTDWB/optpTB1sz3A/k8KtpUutu58NXyXJevIVBU7YUC086T6pOwgGYhqpSUngb1mZAKYTpJbkOW9SHHhDAarJ0EhEVTHqNqCvZ5FsUWXNZ/maDAIoedyRd0VyycAforWzn93ugbrh2G5OBbnnd5mpdvvpRDQqOaxzmix4T8jRMxMIW+RWSQ5peiziJhUuVQAZ/HQYk8ml3VPTYgnEFdpYam8dVE1xDvg1pMjjvG/IRiJhMNWGuu1tpTnt/nghS/aDFUT358uJR+kf3o24D4AVr4+pr+ESjLR0jhUBtXUq3WC4yC35NfrjdH9cYLf/Dfc0XUNFPVw71Y3dz67OaOeC8JmxPygIW8308XmdHlGSTxPsTBJzAcg/fGI2J/5Yfm4g6cA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(35042699022)(7416014)(36860700016)(82310400026)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KVOCqxmMoXDHojTetJUzYSPHkekOg5rXqMr3bLxMoh2/ihC1QnKd5A8Yyje2v8KI/2fDvdxULSIGA+YcmAMkRDvjFbDVnospaDFhl6kP8Ni2J4lkIh6fifwrWBwUWVimwkpf0ijw2Iavh+ezm2koZDW4yiPpSWcIkoMWSeGADRPSeLu0QKwyQDFSbn4w0nVWOdOr2o8NqmZ6Kklm6wnu9sLW5WNykKAMOKkEvlrQB1Td3KRPChjPUMBht221EfoWsxEN+baBaAo4Q2lfWemdDKiDRcm74KjN8qlqDWIoz6ioSoepYujeeUPO11RNtXOPh7AjNPJyTiuJBSZRtEgPCLLmHV60j/yLmhZt4vB92HcoPb6WfO+mVrSQcfaEM3lBeFdUDCLF0qMbFZdkA8pH9Nig0hfc0GhXrEgLwn02EmzNZzfjHJuAiMEE4UWggb/d
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:23.9207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b64098-3661-4fdd-aab1-08deaea68a3c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11583

The SolidRun LX2160A Twins board supports two configurations, one with
with a sinle CEX-7 module, and one with two (dual).

The dual configuration was not yet tested.

Add binding for the single variant only.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0023cd1268075..1f11c1208c248 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1868,6 +1868,7 @@ properties:
           - enum:
               - solidrun,clearfog-cx
               - solidrun,honeycomb
+              - solidrun,twins-single
           - const: solidrun,lx2160a-cex7
           - const: fsl,lx2160a
 

-- 
2.51.0

