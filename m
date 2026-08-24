Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023094.outbound.protection.outlook.com [52.101.83.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B4364EB0
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.94
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586767; cv=fail; b=CGft6RmdoRTnONS0RIhfYMRqvNItK33FF3KLVUcIN2NXINpNZaNiL95qc6JVMicZoBNhSXACXge5pDix22cJqq+5WW5nvRDCJjEErNbXEmFuCLDVzDu1lUnxe+wRbCDZa/gt40uJ1G7nv8n2alERLcy4Mt68A5ZfcB2Ete0toSc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586767; c=relaxed/simple;
	bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pMXQAQW8KqjCHqxgtcLAJ9IsSVevEmOVcEYWhM0n+w2ub3aPYITyyfj6IEaNYsmEm56riquGV+pONA1I0hgLZcZLseb4yOZe6bF59ugFWD+eIqixazrfvn3Z+Hc7283oCjokJFNVldryzG/6Xg9U8smIIpJ5Fqv3aB1fFwUp4sE=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GovN40Xu; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=GovN40Xu; arc=fail smtp.client-ip=52.101.83.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GovN40Xu";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="GovN40Xu"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iMr2RhBRYf19BIHHkB3qGlZTtYhTL9weLyFsqTgnbNu7Ubel2avXRWdHjxgDKh3pPR/QWCC+1k7QpffopEO36s38obWC73P1WzhVotBMzyBoxCFabhTKS5901WxsEsqMOLO7gm3aAIC7yG/EooFDFUP0+RLpneCvhknk9H4uxSaC8uwmqL8iwZlDsSKrtsMoIGGrf34Eo9xZQW2znc2Vu3palsDHGLoG4XQ8VEz8Pk1C5kgCU9mOKIr9pT+1rjHmwzJtKGust/qCftJV01kWN+YrUf/3Bbw4fn6GDEFFOD4eCIK14LwbkEJe29ocjHaAFXVNij8w4YPPodauRHzU+A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
 b=sEYXwr5/Tn7df/S0Zh20eU2weDoCsINbKdGe5wi9Oc9AYBGrLC/Cxbrq+2DlZWdgxyMXr7bEJghkT1mO6YYN84rWC0PkKyPXKtQ7TFt5apOV0tMIHt+aaARqlVK+zkuVWFHaGbWm3JQJjOkDIAcBF726DfQ+I4cLO6xzrVLSVnE/0rxlG51ynMiX2BGmjEsZSAWtQikoWkHn7SItii6ONpK5EbntmQUxFgZT7AhMY+xFfqGM5OJI3mtcmqCotpzVlvIoFfzXIFPbSiYMgxtRxWx6L6USZiUF1eNaPE9DBZGDuT7PHKGVWpBgK7thkJz66VZ7JZY3KeVHNZPwmP54Kg==
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
 bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
 b=GovN40Xu4DrNRWu8mM3e4laMnU4ON/dLU2y5lbdlE3j5uEVlxJmzlxz7gn6AnhubNLcaboy0pM0IOOumIrmgi6esipPY+skf/qh6xEnzeL0kWO3QCbtGE6wyudlk8259QlluddVGYGwKupjoxUHjZFXdQNzqO6ibXXrmio+O07qubZaujTBSVIBdJ8wk3sjmxxwIcVMxRT29rFdiw8i+AY05PRVOQFAjSK3xnk9Ik0okAVtcBgdg6wypriaPdOze0DhvuFZoy2wvjN7B9ZNj9Ii6zAfRoxLZ05JLJUUUI7GRdItAOyLfWTbQ38LZu93/It9PVy/UDWOt5dLn33gs7g==
Received: from DU7P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::28)
 by AS1PR04MB9654.eurprd04.prod.outlook.com (2603:10a6:20b:476::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:52:39 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::a6) by DU7P250CA0010.outlook.office365.com
 (2603:10a6:10:54f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 15:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 15:52:39 +0000
Received: from emails-5021402-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-140.eu-west-1.compute.internal [10.20.6.140])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EC0F380871;
	Mon, 24 Aug 2026 15:52:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1787586758;
 b=H08Xb5GGsuyfE9NlYWrxDCm1xO9KK3gwDqdDgiOWwPSECa2Gx6wyfNvpmACLyqWqfayy8
 GGN1S0Gfg1LOTkLP0bFwA5StnoGFGk7ZMA6pjfuV2JDNiQERqdlvGs3kZOaVLXVDnQ5bx8j
 nYYXkWB34Aw7giRQEpDpsFMBQ89yfCk=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1787586758; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
 b=p0xl5izO7/NGCeYYdzWIuyrGRz4Ed8tubRIWpYvqpZf1GvhW38i8v4Pamgs5hdEFrnRuS
 5bW/Zesgfl/HTSOyYhXbnEKZJJz9t1M1ptyhOMv2kd+ex8CeUS2837QmsvgmtT3NtDf+4l2
 YZn9jFEEh0wLov4U6BXxiSZtv0Pd2xE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
 b=GovN40Xu4DrNRWu8mM3e4laMnU4ON/dLU2y5lbdlE3j5uEVlxJmzlxz7gn6AnhubNLcaboy0pM0IOOumIrmgi6esipPY+skf/qh6xEnzeL0kWO3QCbtGE6wyudlk8259QlluddVGYGwKupjoxUHjZFXdQNzqO6ibXXrmio+O07qubZaujTBSVIBdJ8wk3sjmxxwIcVMxRT29rFdiw8i+AY05PRVOQFAjSK3xnk9Ik0okAVtcBgdg6wypriaPdOze0DhvuFZoy2wvjN7B9ZNj9Ii6zAfRoxLZ05JLJUUUI7GRdItAOyLfWTbQ38LZu93/It9PVy/UDWOt5dLn33gs7g==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AM9PR04MB7716.eurprd04.prod.outlook.com (2603:10a6:20b:280::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:52:32 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:52:32 +0000
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
Subject: Re: [PATCH v2 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Thread-Topic: [PATCH v2 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Thread-Index: AQHdM8o9r7KySEvM3UyHKzj5UP9Pu7atWY+A
Date: Mon, 24 Aug 2026 15:52:31 +0000
Message-ID: <e9a20a84-a20c-456b-bf17-0790d2aea633@solid-run.com>
References:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-2-0a525d5f4cd5@free.fr>
In-Reply-To:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-2-0a525d5f4cd5@free.fr>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|AM9PR04MB7716:EE_|DB5PEPF00014B8B:EE_|AS1PR04MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf3c9a7-9958-4361-cc8a-08df01f7b97e
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|56012099006|38070700021|6133799003|4143699003|10067099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info-Original:
 yVbsGrKC7+ygkM+PsIhw7aRCEr3Z3wP256MHW7vybtQ1Z7/zeECWUB2Yu+VhF6O2S7AvThnYXO1vk8ZohqsVgO69m/+REZ2Snexuy06cWlGdJFACPEc7EpZot3n5M83a9iARF5OTnBcCgsDFGWl/7xoxDs2VkpcIdNrgg9HipzuX6ACo0+qpKrjDH3P0eY4sAjMoi0Y9NynHsnrVHF7yor/em4wYM7NDr3UQMTbEwiKtfCzGvNSogOD6B6ETG1pqObTj0I3r5t9xpF9XXYytg1Me7yhJVrKZ2xB4gKE1cuY4QWOzEPfBKHDrx9ckm8K3OkHAEcv5vVQfvBlztCDy2M/uOmX/LPtFVKQqhsXLMNkr7FST0l+9An3OE8QOsGoRFGSRVmuYdcI4emNP3XA7/0oVo81i71/uSUH0r+Q/ePVVfbsLWY6+J6DJsb1OCvZjfZ7HOD+ntWH6qHX6uLKh5oT338gDq1yKtE63ipzMEdXt2P9eA0GYFlyT0oZSscwnMqq7zaqtCRc4flfpYZvdZChCQHtdjeZR9F1M5dJq0e/GZXetwk4UQUlFAn+8xzmYfcRqCbjHe2vVrSeSAXE9zuzvqhlSgTyl9pfjBeJEEiUWGBmg7m6fxXXe4j4lHr+GTn1LZS201B9c09FlWD4v0hqDIfhPioTE0g1WL9b0PYNGuZJ4WtGCVK5/Gf+yKQpkUQLslbdjdUY0yGfV1FgXvJIkfWHIVp95zLxr0VRUIMCdCM4NuXNQhjIGbLG3/qvzHfOADjSaO0OhD4xfMbP3Pwz6VrJ9px//x+hvR3GipIg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(4143699003)(10067099003)(41080700001)(15866825006);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AD0185BBA1FF049B1EF4E2E95EA2B2A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nHP+pZDNe1Uq5gsT7N/i6TVgJtCwfboJ0ZdzbYqOlWuInriVJK8pCrWSYeRrb1n0shBB5JuY5ZA5szzmmFK9ew0AKG3Sfa9owwJ8/iM3nVWhIsZ7EyYl3TnxEWhC1C/lMawL8NjD39Scpts0ZeVrTYytSylBdhqQ/p8oJFU2AZJ1CoZ3lSjAatfiV2/qYruhRAfTu4FMkdVUCmDRlkvC+jJ67XTbGYUPr1mB0cF1TCOjlzE70dyf1jbwyGnvGN4duQjgGWDt7uHdmKC2kRS8jv/+h05BaEGssgzPC57LysWBsPENbY/3pGdAeVy3+JXp6NKg5wh6bJq7ddWZJUhnRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7716
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 556bf852946c401e8188cd16a066775b:solidrun,office365_emails,sent,inline:1d5dc2100f085a568c1eeb485abea290
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGfuZ1M6dn7lkmtczd9uNLLZsB+MB/xrkT0Qk0JZyHvUCcYvdDquCO+ba35KXoAbhqV2aeH+cEX6Qt+7uy0myN4RRfgmbMEaDHOmeL72/lbsQgLBd537XPM1MS2KcC+NA+761zVru4xE6T/VX8THqnTxiwx1IVl8LGM+CF+zjeV0iQc9ABX4w1jcNbkQnnrh1Y9OYSW2TySxyAno55F4EfCz/bw2/EVTatDEi0AU1+wPbUBpJNvd8dNeD4K0mIEvfW5+Bf+Y3AZTBSlO2n3Ds6UezayA/Jpv8pdq1oF1SS/KgOfZv0L62md/iJOaCMl9QnGw5JZXlgocMLBqNS9NWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC4hpadGzldci/DiRwVeGaqznF6t1t07+qaooHn1dX0=;
 b=Fw2K8L/HO/NdKh2261AumW508MNxRRALGezHnEPAh9lMmfk9UM6tNDEsWAlBWxcYs7IbiCl5VhO+7C5ZZgpv3URukIgNmNMheEx47pEaX1qHnccDpZm8h/dfKSA1HM/DfLE6oY5q6v1m8BJxzgOB6tAX8x6iZrSmk1TAOLXRMiXymlnbaS4oDpbOsiE1y6xAQp5fsQ52tLFjIhcwNfm5YP1qniOfv8RgNRuDQwlNLf+jGukNkr5OartSbXMtBfiyPLb1L4jbrxwqeECBA3UrGOUmy4jf0jbolScspYeBq6XDq0wI8K853n6/oroMlO6tzrEEYU83Ge7x6vVYRp5yYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b0e34ce-4684-4d0d-949d-08df01f7b549
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|35042699022|14060799003|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	FBPx1IX4mM/vwaSf8/f/M2yCmXiF61rjGj0mhqQofplOgKPzAGagr+uEPqt+hUoV0547M5KioXe7Z+sefRe1GJULdGK43eRYyxKejM/qGzCXNC7X1Bky4gO9mqJH8hKuIQW7o9U88WK314rl/vgAoq35uA0kd93WD6n7AyqBxpD0U9irxztatcBze0s9veuhzeLUIv3ZpC3H9kaKF3JjaEmUzN1+GHmadGyYUUp1drvn/7oI10hoWJRTNYNt6Xt0fCJ4haSk2nlXUEQvfa8H5A9OFCqfdhcdpC+6+vs6b4p/8AHanIMC6prMJkXFsDsD++tkXQ1/clMzjNQFr7NSvRASm1gGMhtJKT68VVYJzsjs0A4QYNSkE9qdlmTeZxzBIHyENzmgEwFEtWpfZuwQ47e0uihxDIIA+Nrw4Mp1EFr1EIw6YWfhgypNLz7+GQJMCsMDbyqpbjeieWEVX/SVYE5eNY4tBbETiIBK+gtYqNuvGyI6UJLNMIa0QKlF39QVW8IwI9Nes3IX5Vr0i/YXEAe6ALmHqaTm53XAA+Q807rLy8NnierkGXisJTxTxvxPALTo9tkWMAeLWX51H3cmHJY66hL9D2e6C2STPuO566MG/bIuZ9m850NtqjkrCAg/LnUa1GRk4XdxyEN2gylrjPsCRW0133IsSXVXh5ajdY2hqZhXs0DJiJpCh9WkqqZ4Ai/riae1yknLSpuU+ftzp0NpDP4jZs2T1NODOQ7vrOTYO53kP1EWfRQ4oUzPlgoCOiDFiaYlyVBDkx+/hUSWZc4c4vH8ez/GbycnvHnJUus=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(35042699022)(14060799003)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(41080700001)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2BhTIFQAONjFw2VaQtncL5xsr/I7BMBAsfzhBLPaSoKJ0DQiup9NjFmfybC/BIeEpfHVumzEJ5AY+164BOozUpbRoOcdzwnqS6U7o0xCcLJOjxRfD4DBsboQz16YmF8TmF4af2r4COV2QPe5tXns+gTu54ntd3ejQnoNkx6MaFu2QIYWXj8L9P2kaIC6P7XAFDAKrKmCwy7bpnaKkGIlZaFNi++yo4aH5JzqrM4/5EHDU7bgiHqoa2otA/94QJvQ0nzD1TvOdOXV6tf2RPme0O89Zkvu25yk0uqeRSrjaG9LguX9VsBuo+xdDJEdBYjsrkLXyFT54nfm3Qo2f51B3DIQh3gnE6T7Lk6iLk6WyLy9mhXOIpdD9VtvD5UoJ36XVFVjulBC/ZalvEPn+siEA46+L3PhL7QXrQ3o7WTYxUiUH0dysGT/eO6IhIMpvPDQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:52:39.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf3c9a7-9958-4361-cc8a-08df01f7b97e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9654

QW0gMjQuMDguMjYgdW0gMTU6MTIgc2NocmllYiBWaW5jZW50IEphcmRpbiB2aWEgQjQgUmVsYXk6
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
b3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTZ4LmR0c2kNCj4gaW5kZXggZDQ1MjJhMTk0MDVh
OS4uZmFlNzA1ZGQwNzY2OSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvZnNsLWx4MjE2eC5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1seDIxNnguZHRzaQ0KPiBAQCAtMTY4OCwxMSArMTY4OCwxMSBAQCBpMmM2X2kyYzdf
cGluczogaWljOC1paWM3LWkyYy1waW5zIHsNCj4gIA0KPiAgCQkJLyogUkNXU1IxNCAqLw0KPiAg
CQkJaTJjMF9waW5zOiBpaWMxLWkyYy1waW5zIHsNCj4gLQkJCQlwaW5jdHJsLXNpbmdsZSxiaXRz
ID0gPDB4OCAweDAgKDB4MSA8PCAxMCk+Ow0KPiArCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8
MHg4IDB4MCAoMHg3IDw8IDEwKT47DQo+ICAJCQl9Ow0KPiAgDQo+ICAJCQlncGlvMF8zXzJfcGlu
czogaWljMS1ncGlvLXBpbnMgew0KPiAtCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8MHg4ICgw
eDEgPDwgMTApICgweDEgPDwgMTApPjsNCg0KUGVyaGFwcyBhZGQgYSBzaG9ydCBjb21tZW50IGhl
cmUgb24gcmVzZXJ2ZWQgYml0cywgZS5nLjoNCg0KPiBMWDIxNjBBIFJNIGRlc2NyaWJlcyBiaXRz
IDExIGFuZCAxMiBhcyByZXNlcnZlZCwgYnV0IHdyaXRpbmcgMCB0byB0aGVtIHdhcyBjb25maXJt
ZWQgaGFybWxlc3MuDQoNCkZlZWwgZnJlZSB0byByZXBocmFzZS4NCg0KPiArCQkJCXBpbmN0cmwt
c2luZ2xlLGJpdHMgPSA8MHg4ICgweDEgPDwgMTApICgweDcgPDwgMTApPjsNCj4gIAkJCX07DQo+
ICAJCX07DQo+ICANCg==
