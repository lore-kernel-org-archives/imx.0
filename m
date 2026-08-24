Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023108.outbound.protection.outlook.com [52.101.83.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DD463B81
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.108
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588662; cv=fail; b=HueCn8i+gacRDNjxttLXUH+ntL9s/6FbfqZJ1BrJib1LSOfPtj+mAKGlwOdoiH2uIkRM4Fi1AasL1der0BbzjajZNbjDZYQFQtoygAX97Au2kGUL3JKwZaJ/CzrwsZ/fYhitq++ErKc3vKv23OSi4kVmNwN/DmTSsXiU7f+wkwI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588662; c=relaxed/simple;
	bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RDiUstjOk8hdQKVTO+KuFBpZ9zo0SRwGewdM0EzjKlRJnvs3TxGR2y0E/7ijxQtw1mhrExTqpikLCxeXPOixyrrBsN5ooMIiQvgPOFacr4OGS5ChQyBDC7ZpvM1QdRIGBB9GASTbg/2a7tZLHYnEHxY7Slrk5yvSl5cFHBCxNpE=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uX6jiE9U; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=uX6jiE9U; arc=fail smtp.client-ip=52.101.83.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uX6jiE9U";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="uX6jiE9U"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rignrY3I6sH1vsLPwyKC4vP9UhD7Ig3ATJ3LApqUvhh/p23zuGhNcRKZ1K5aL3VgOZ+bYtRcgQCHxXGCX2Ic4pbyH+Qy1fYKFl1C+OOnizgjZkF32IT8cvwxGyVD46wuvhi1ln8kGwd4wtzj8of/LZ3nlhwJdCRMFQ5Kk/NOfXTs65rqHQ/iphLWv0UZhsXec83ALBImO8J/WKrB9XOeA8158Kqcx8iF4sm5pdhm46nRUw1UjZ+t6oOtHKSEZfCeBqzSII8en/JtSrGMjuO8+s+SO6xxrHoYDgIZ2KMIlJpMiHD775oBcmzOfK2XNRmod7nc2NTJVjVerVM6mFyZ3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
 b=yuuD9REFTPC1Ymso3KZlakQi1vz+YEg9HL5QbQbelCZkkb0DLsBiB5g+RmOz7tBmSxOYdGk2+WHk07g9uBxUJqKKdsLOVXFSSKBuT2FC3NzPJZL2T1gcMgBFCianyLRZDWcp4nLlM8aZX1YfVH0I6AL6OHqooRea9SOF8LIe/msVCAL4mmJoGsMJiYeqUW9W6ZOExKBKqc2cWIxKUObxRu+mW9xBFFidlMiN8if0Do8FIqPX/sxRA8O+cOmplhKJWwf/T48w1rwch7hHjC9lfUp+s982kvtEOLvXMesKsNAhpsZstnRh6PCXWaOCRx8mdZJtnMtaSjN6KKkz2L/Lqg==
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
 bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
 b=uX6jiE9Up662UfiFoyQx0zkRjivIHvayejClfPj6+yESXwwAx+TywzHcqFytVmYwpTnF/3Gr641yB6+aTdcVj/T0ceZUn3ys6jWTmhsUb33M3GGsqqNDD/TIhD4yUyHrrpUcxiA3DywEDh2ouMFA+xwM7JSrk5sDHPQfEXFl6I0a/SBOWN56rjpuJ3o0loRLKI6f+ILPZVso50zM7ZhkvIhGa6bQSA7w6kt+1xUOIxnXETGIAX1SG/4vYDIdsSnBJ8neQrTfAVNFoxWEBfJGQUnxtQS0J0Hry8wWVFMhTJCYMLNANn0d4ZaS9RSfP/5Botpgk0mmi+/iog1ViBgRFQ==
Received: from DU2PR04CA0315.eurprd04.prod.outlook.com (2603:10a6:10:2b5::20)
 by MRWPR04MB11492.eurprd04.prod.outlook.com (2603:10a6:501:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:24:12 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::88) by DU2PR04CA0315.outlook.office365.com
 (2603:10a6:10:2b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 16:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 16:24:11 +0000
Received: from emails-1928565-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-140.eu-west-1.compute.internal [10.20.6.140])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 953507E96F;
	Mon, 24 Aug 2026 16:24:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1787588651;
 b=HZSd9q75icRk9Nor9UrK24kPQKUoe6T3mgoQBcd8rO7usEA14xA7SXO6pxhgSXVorQhft
 7MMSOfhrE47lwmhcpUHKKSpKSL/yXcncef18eER7Fn9NcHgmdVSdvS5+5TyvioSH/dlNq/h
 eB/WQdnG0MwV83m7wqZOt8ag1v68M2k=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1787588651; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
 b=ptLgXbi36gyZPOGHZGcnbSvEgutMNqyGMRkLAzcr/PTyjiGGiwpAc30UTkRAdsUJLUrvn
 x0scZSezSVQ1MTOA4cGPjxHCwLarmrvt3R2WjwR+x9lLsGcdcrGo8lCNoj/FDOdFy3HFn07
 8Z/k97oxoXlL2Jyi5S+kxCM5VvkH/Rg=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
 b=uX6jiE9Up662UfiFoyQx0zkRjivIHvayejClfPj6+yESXwwAx+TywzHcqFytVmYwpTnF/3Gr641yB6+aTdcVj/T0ceZUn3ys6jWTmhsUb33M3GGsqqNDD/TIhD4yUyHrrpUcxiA3DywEDh2ouMFA+xwM7JSrk5sDHPQfEXFl6I0a/SBOWN56rjpuJ3o0loRLKI6f+ILPZVso50zM7ZhkvIhGa6bQSA7w6kt+1xUOIxnXETGIAX1SG/4vYDIdsSnBJ8neQrTfAVNFoxWEBfJGQUnxtQS0J0Hry8wWVFMhTJCYMLNANn0d4ZaS9RSfP/5Botpgk0mmi+/iog1ViBgRFQ==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:24:00 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 16:24:00 +0000
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
Subject: Re: [PATCH v2 3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux
 offset and value
Thread-Topic: [PATCH v2 3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux
 offset and value
Thread-Index: AQHdM8o59PecM5rgEkajYYajdW3UWLatYlqA
Date: Mon, 24 Aug 2026 16:24:00 +0000
Message-ID: <a8175728-6218-4350-8605-e92def33a6f2@solid-run.com>
References:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-3-0a525d5f4cd5@free.fr>
In-Reply-To:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-3-0a525d5f4cd5@free.fr>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|VI2PR04MB10569:EE_|DB3PEPF0000885D:EE_|MRWPR04MB11492:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c4c838-1f8b-4a32-d1a9-08df01fc219b
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|6133799003|56012099006|10067099003|4143699003|18002099003|22082099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info-Original:
 6IvQRKEDRnCCSWnIYmJmeJXROrUQ/iDszyLtKA8OLeLX13dbmMeLmbSEgLH9oKNFkjvMJKhYQRfPchxLbf/UF8HirPb+Hy0D23xpnewQrJlLctdfLM1xUCxSueh8FFYaEIHJWN03iWaCvCtl+pOiL3aITRD+ZMMLzXApkuzzOSMKeKf28dPm+VRQFPUGdeT2uttJo4jfvIX4W22okWvtdmJtAJgY4xAKbVl7Tu2YIlKrgcMTWtjw7lhM9fDJO9hSf7jR+Yz/4V6bSxSCSwyrrY8EvtHkwRsgXcwL3hGykisC4tc+lfUneziYE5pSeA7xLfjw0ELH2dgp8JqHOduGYhfjWJlk57QnCrhIfZEr4kKM2ySgNwdMLnE3qcYFNuN3ZWyUhPhQCOWDgvHfzb9Rc791N3JwevTnNnsww+VjitJANXfKdKlWo8QJm2SDLijOCbqQdmFGLFs4Ki8yytXdmHljvaacdZUuNKXjrweFvxQ4OWxOHwWH4DXv1JyysqJyo3Wlk0ekqg6irELBziPRKzQ/+i6b+h9D4pl8qTPChXvAxbhmas5tTIadfYFu7cMkJ/KddPsE04/tgRGcgqzH2ekt4TPFfNy5XTAf+B/f4TKUauYCrhkYrDUgGSB+q9R7mTQ1yclKycc9gqn47RiqehGyGGbUrxzR1r0EhFmxmZvoZIsSyi5xkGlKyERGXi7zCSyIQPjbWLFHrLuCJvppitYtGz5WAn25Qh2eDOX7+CacIPXGo59vLkBeRCmDDaZhO9ooOVgEwWpCpwkItcUBYQDQUZ+45oupuVcrNDEITsY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(15866825006)(41080700001);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6791AAAC1A29D54591B56D7785EF112B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 H3LjyArzuowC5E5fIP9jDme/PYu15h5ENxNg2V04gtzyhNXA8xBvBD7U+5XrVsgGXcd/NzlUyLYS5oq4I3d+N90VSWBwhgWslRuOkq9ex31eoovfV+i77dUHjt9kwnhTFjAkaaBPPNneD/loJOyzG4ZhNn947iwJX8degkYTU55mxlFH71yIPSp+IGWwZl0D+biPBWQZRbwZocZGCJgFVhXLvFMDU88nawHlymkLyItrgT7cBhQjFNvOqw+9ixFG51renlr64cz0wgxG4KnUDDBy+uMwU0tZFy0M+ReBZW3y1h3S6AX5vMTocM3ZLO3vk8acgKaJqHDUzQRID1mvIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8fee4b7358e1420394a906e2f3ed1d6a:solidrun,office365_emails,sent,inline:1d5dc2100f085a568c1eeb485abea290
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCdiUf32pnpSElSO9q8NKNV9lnsUOWqWy6TdOq2efGs/3/c6CcZTZjsnONLK4eaD027TbvClJJ9ZNcsKIJ2PciWGZWk60EpL7Az37Mi31PI9jI/6SQseF1lPgWj9u5yvy/mAa6fwi3iKhyhC8+T9o5k2FnNDlvr2sNrvkgCEn2bXg//iigtiQlCDo/ZznD669GdgVAyi5o3xrNlB758cUWvSSITlx3rpLLlmORu9WkZd+lrSvlpCABZ/NRN2Ur8YRD4ITn2xvFgBfpsgyboX47d8/psq491Sna5ljQftddAKvQEnVDCBf9h8vUi2OxMBsL3qgvu+AvdA8rc9y/DipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwmlFwHeRisZZT3F5zFXXcvqYRIh+d9XK7eSaoBpCG4=;
 b=m+iLXgbhqzTYBFPrBsbVvj8Xs8KGu5c0YI0sh5Z5Wd7cLwtWia95iXlrW5rJNxzafzVgPL1z8WgmOc5NsS3oljNt57de7hbPj/q58nl8kTskf5kcDYvt06q47G543D0VFNTyNCq1OpgAVOMzhDxhJIlcPk+wG0RZDnCF1XKAdVFJ3VF0LpfBD3L8UsYA7x5PLOiZ9Pl0uYo3JShuoB76ZQJMn+KRh4dPAoVCYkiBivIEzSpj8snyI2mAcu64q36r59vX07J83zaf0Kq3a6+u+TpiIFA7GD1NwnprYE71fg+PQiHUdYDX0DGuhkdvhUQUb6HJvjc6TGOZvKQqee6d9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3a9ea69-13e3-4549-579e-08df01fc1ae6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|14060799003|36860700016|35042699022|82310400026|1800799024|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	g0dD8hzaOXN+hTr6erF1yTZffoS1uJhl1axHTOQcMPZxINfYGqpC1hS4Dg3TFjyhg7LEPhVXzivg5RJMqMopZOJ/KqLnpGlptHh8EAO6Znc4YNJ2geAaL401f5onWPoaJEWe/zYBkGEePIqppv+pP/Oo/KnE3QD980YoNKvQjTcAkHLy6jZoS2tOzyZjR0XsOeiAi7ODh7nqiHcSoWweVIbzJ27p78WiwFLKXKuqF38OFsTq8dKdh5xPUQTTDdPJ+nEjUT3Lk1V1K2irkTotq3zMoulQeQ0vYUvOKK4qVq1XGmYMzmXNbddT7p127bmZqzp/7h/Rf9RhykhLotzxViAwxFfZ3CjgN0oqdfgUdjZ7RUHEdqahgh5xwvmpMzhAWYsHY/lyTRSQrPwpWZ9SuSogj/mHDagk7/n+TSj1Y/JHjhJnvjpNs67FLxxWEFlPbXOw1rgc+1xR7iHWtJBTD7bJDvSLQbHsaiUbvEsJGk45074hwGV2vN9UVyXXEy2Y10NvQFUwoZw1Tb9lymK82RSXJUDgxz5jpcsp37tNpJqn4vivibAdd7bGQMcKQU1zb8Ipkog7zR2lF4s5yjKxwtYYh2nU4FLQjEUUYsaBZpT8m0Jbl3yEqc0k9bijkYzGzLzxahr/POI8Wl7IbmtdWW7UAhEJzNF6TBnuY0x0AP7uGnmGy3a4dS+hsH3Oyqd2Fgp1AAUuNZPnoczCVuf04aH5dDQKnn8IZalXrZWrBTbH9sVB3PhOIG46JGJVAgE7+04dNx8Y2vrxUz2UBkSel3SZga8g4O5r4VgNxzx1cHc=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(14060799003)(36860700016)(35042699022)(82310400026)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(15866825006)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G/nq8HWnCN0T4ZKXWuUtGA8yIMxqX0JH/ADgZVGs3j7R4uj4Kzh7tgoWeVMApBaUSCEOoAxYkoNt5paGWXunfSXv5ieAh9o9go22BmIw6Pajay+baA7t/IuI2EcUvmLNt+3BZ37T+n4phIGvDpBVsQRQ2B+WtCkl8yYd07rUglbmn0aIAmzfbuWT7/9FEJkyEoprdAjncRi7C+00KetxEWqJuc2OhNRZnwLWnskf5xzhS/8Rw3xK2UVsWDLGQgcozQxfTFPt/F6e2JnVf8PuoS41NH5kIiA8wm+M5q6fyKVkHi1TbbxN7yyuhG6gfWoQC4lQXqZ6mCJ/3QglP3O7hpv9n8FmlNM9Z5xSIIfE1nJGSGs52ww/kawkgQG1l+j0+BVFfvpML83EmSPCnIbvK2elA+ynxILQVU1XR2vkScXwIXLNukLaue5+Mgc3ds8V
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 16:24:11.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c4c838-1f8b-4a32-d1a9-08df01fc219b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11492

QW0gMjQuMDguMjYgdW0gMTU6MTIgc2NocmllYiBWaW5jZW50IEphcmRpbiB2aWEgQjQgUmVsYXk6
DQoNCj4gRnJvbTogVmluY2VudCBKYXJkaW4gPHZqYXJkaW5AZnJlZS5mcj4NCj4NCj4gVGhlIGlp
YzUtc3BpMy1waW5zIG5vZGUgaGFzIGJvdGggb2YgaXRzIGZpcnN0IHR3byBjZWxscyB3cm9uZy4N
Cj4NCj4gVGhlIG9mZnNldCBzZWxlY3RzIHRoZSByZWdpc3RlciB3aXRoaW4gdGhlIG5vZGUncyBy
ZWcgcmFuZ2UsIHdoZXJlOg0KPiAgIDB4MCBpcyBSQ1dTUjEyLA0KPiAgIDB4NCBpcyBSQ1dTUjEz
LA0KPiAgIDB4OCBpcyBSQ1dTUjE0Lg0KPg0KPiBBbiBvZmZzZXQgb2YgMHgzIGlzIG5vdCBvbmUg
b2YgdGhlbSBhbmQgaXMgbm90IGV2ZW4gYWxpZ25lZCBmb3IgdGhlDQo+IGRlY2xhcmVkIDMyIGJp
dCByZWdpc3RlciB3aWR0aC4gSXQgaXMgdGhlIG9ubHkgbm9kZSBpbiB0aGlzIHBpbm11eCB0aGF0
DQo+IGRvZXMgbm90IHVzZSAweDAsIDB4NCBuZWl0aGVyIDB4OC4NCj4NCj4gVGhlIHZhbHVlIGlz
IHdyb25nIHRvbzoNCj4gICBJSUM1X1BNVVggaXMgUkNXU1IxMlsxMTo5XSBhbmQgaXQgZW5jb2Rl
cyAwYjAwMCBmb3IgSUlDNSwNCj4gICAwYjAwMSBmb3IgR1BJT18xWzI1OjI0XSwNCj4gICAwYjAx
MCBmb3IgU0RIQzFfQ0xLX1NZTkNfT1VUL0lOLA0KPiAgIDBiMDExIGZvciB7SUlDNV9TQ0wsSUlD
NV9TREF9ID0ge1NQSTNfU09VVCxTUEkzX1NJTn0uDQo+DQo+IFRoaXMgbm9kZSBzZWxlY3RzIHRo
ZSBsYXN0IG9mIHRob3NlLCBzbyBpdCBuZWVkcyAweDMsIG5vdCB0aGUgMHgyLCB3aGljaA0KPiBp
cyB0aGUgdmFsdWUgb2YgdGhlIG5laWdoYm91cmluZyBzZGhjMSBjbG9jayBzeW5jIG5vZGUgaXQg
d2FzIGNvcGllZA0KPiBmcm9tLg0KPg0KPiBGaXhlczogMjg0YWQ3MDY0YWFhICgiYXJtNjQ6IGR0
czogbHgyMTYwYTogY29tcGxldGUgcGlubXV4IGZvciByY3dzcjEyIGNvbmZpZ3VyYXRpb24gd29y
ZCIpDQo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+DQo+
IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2eC5kdHNpIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kNCj4g
aW5kZXggZmFlNzA1ZGQwNzY2OS4uYmY1ZDliNjcxZDg1OCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2eC5kdHNpDQo+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNnguZHRzaQ0KPiBAQCAtMTYwMiw3ICsxNjAy
LDcgQEAgZXNkaGMwX2Nsa3N5bmNfcGluczogaWljNS1zZGhjLWNsay1waW5zIHsNCj4gIAkJCX07
DQo+ICANCj4gIAkJCWRzcGkyX21pc29fbW9zaV9waW5zOiBpaWM1LXNwaTMtcGlucyB7DQo+IC0J
CQkJcGluY3RybC1zaW5nbGUsYml0cyA9IDwweDMgKDB4MiA8PCA5KSAoMHg3IDw8IDkpPjsNCj4g
KwkJCQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPDB4MCAoMHgzIDw8IDkpICgweDcgPDwgOSk+Ow0K
PiAgCQkJfTsNCj4gIA0KPiAgCQkJaTJjNV9waW5zOiBpaWM2LWkyYy1waW5zIHsNCj4NClJldmll
d2VkLWJ5OiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCg0KVGhhbmtzIGZvciBj
aGVja2luZyBhbGwgdGhlc2UhDQo=
