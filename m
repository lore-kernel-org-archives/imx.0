Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020137.outbound.protection.outlook.com [52.101.69.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11C39F172
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.137
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425949; cv=fail; b=syEToOcE+p7eAAvYAwCqyEtfJyGOQD0lpFg1R0DFkdBsiK9zxkYTHTHOQhTAGWtS0rlpd1dUXvC6TGHzTN5smrUHr1EXersHlxngtbJ9WYmr0VSer4ei+xwWQjDakTBegDOu4KBCogkvo297b8Sw2vQu2/Gw70SobiLWEDAmNzM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425949; c=relaxed/simple;
	bh=FUytqX845VCtWNQ8ptAQ0EvOD6VLKY3ENd4zJC+KEEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=om7yzuMkTMGzIsM6Mh30w5xHkklRE5XUofAbGYJ0ElAYWL47n9xoo+nkLS7hRBrwCb/ieFeLayRgnqSk6XleZezRE9xqWbO7tU0nSxWqQqHbk4h3U3na0lqi1hkLejmz/PyYJ8aFtWj0YtAIWIWlCsYWXyQ5yXoRCLAdW53Aa3s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=EBNG4Gqc; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=EBNG4Gqc; arc=fail smtp.client-ip=52.101.69.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="EBNG4Gqc";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="EBNG4Gqc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sTlB9YUXD0xl4mSHbMevgETAHF7ffW8hr5C7vftmPluaNXENwfNNReugiFVC23cJdGDdKc/vnufW8EjdsIMYBzHGX9065mq6nkHWT+e2EQ/pABpywlJ8nSUu/RpeqxJlA0sUBU5y/UmINqZNhLOgDLhzo2TCtaGDilVXrvxg2XO/oTSJ0GY3/xsrGbNJymDqWvwzpwnsz6p5aWdYTjhPAhIzqyOuGVOCbeWva5zjcsrVSs67I5XjcG+PJuuDhKQ6FOGAaP22ZDSCQT109UL0wck34Fq+pjP1UgdkoEGcE0NMMJl9B5DPC+MXKdoL/y/HjCRi7ZV5WZssG4yT0Ax+Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=RclIsBN4qMRuoTO4fBWLEg5bZMGE3U8bu4OxGAzaL1iX1oU7FDBtSQq6iUXaAQIMoP2ESAGpK3Xyv3LiipuaFRI5nEXUMkZ2XplMjzDukRQInbWBlXQQpWXcFAgLPndpkXTerXfMPyZgA1twWyUdrTyT60bYD/WHjAwKWz+b5dicOXcMrnx/jiwrZlQa52cyFS/b3FT33k90qrPIdPh1rteIf9pwsJloTVooKECmzmm7S6ZkpdpckcsQSjH2DEnqiQi0MA545XEZnYI3r8Z7n6TpLNpVDDa7UMlE7qLiiR1HsSH7lBAC7jDmYEQ1/9xI/T6s+GhgGK/ksd4hGk+ebA==
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
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=EBNG4Gqc9TzfbdXpwbHnHd995xCnjfs7D7pe38fbkMci80+7r45rOd7vsmpZw7w4Z2yKum6NKU/wB2rwvBOR/umxgWjDRkittxRn1HYDeGTxyQAb7itHXd+h4c9v04l/fWXsITn0aGmEc/+gXX3PQWFO3emid4OHGoxUBncZcue8oANdjo/Dj+R/GrYnotdCw7EIfgdU2Il3Rv3jLqjsVybXF0V1pTwrHcfsfymJnq8qeA9maFPth9m/X0MAhSJHU4t+onn0SPtskhcrWuHwOwv9Q+IwOFYY/IApxUkzyfiZ7DC8nEmWT5/lKju5lHkiAlSmj/StzDbl8FYWo1hIPg==
Received: from DU7P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::10)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:24 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::e5) by DU7P250CA0021.outlook.office365.com
 (2603:10a6:10:54f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sun, 10 May 2026 15:12:23 +0000
Received: from emails-404593-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 938C97FF1D;
	Sun, 10 May 2026 15:12:23 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:16 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INz1von442KKFQyPiAgLjBjjqTVEzBXDkwpdzS+aUlPSPZ85p4JCeV+TYybfd2orhUA3yN36UTfNdNiKklnf6iyaucVkmUwol0zcdz8b1JNpHecGvVN28hPBxQrpWdAH6ldUHSbVmCiyP4B+f3Vfip49TajjKYxMRIoBKOSwPK43VeUWLNR9j/H9OhiswUKoZR37i1QB66aJOuF9DL8mZPxBxl4qiLYwJOhxR9Ibaw/VgbTTjETydpsddOTvc5BX/I5Vb0p8DoSo8ECN6lyjkDnDdTCMtZ4LhPCvP92Fc6CV4W+80o+IBGpfSiE8xD3Z3ZHySkw3le6G912PWwZrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=oJRDdPWs18R+sLxd3GWq3uVYcP1mDqhRYqG5xK95kk/hgfIZ1R84nwUXnfAhb6AeIW+w2B60mClVI+GAQaKMeTYbs5XYFQ4kWFmQxaLyEUqh7RqophiWaX2U8o85T6x7FPsJlw5veyFrx63Zk7dgurzSMDn5zgNNo6OQaeFEj66Gav6ljO0J3MSXKTVVuJ04MAM2ICFSqHUwNc8DOGtMJqZ3ZPVX+N6wAKhH2vrs4nZayGfg1EiSqDEizfPu6DRrFzLrmoVRpa/COX3Kuls2ef7cjGzs23UV0xJTIFaBjikfqD2iPf2WD9wz0hzfkepv8SrT+jicwOlrmcCE/ihzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=EBNG4Gqc9TzfbdXpwbHnHd995xCnjfs7D7pe38fbkMci80+7r45rOd7vsmpZw7w4Z2yKum6NKU/wB2rwvBOR/umxgWjDRkittxRn1HYDeGTxyQAb7itHXd+h4c9v04l/fWXsITn0aGmEc/+gXX3PQWFO3emid4OHGoxUBncZcue8oANdjo/Dj+R/GrYnotdCw7EIfgdU2Il3Rv3jLqjsVybXF0V1pTwrHcfsfymJnq8qeA9maFPth9m/X0MAhSJHU4t+onn0SPtskhcrWuHwOwv9Q+IwOFYY/IApxUkzyfiZ7DC8nEmWT5/lKju5lHkiAlSmj/StzDbl8FYWo1hIPg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:10 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:06 +0200
Subject: [PATCH v5 04/10] arm64: dts: lx2162a-clearfog: specify sfp ports
 led colour and function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-4-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|DU2PEPF00028D05:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 065efd19-2602-48c1-c84e-08deaea68a0e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 g73/oXP1xxJ9M384DPS3C+srYXHKDiIbE/FGx0cKkCLnA5hRY2f3DyV9J16Ay1zZCQDUgjpIRfKoPbX9Ez+dyKvj88zGY/FelCHz6WNzOtMyD7elriN/tVUXIgXdrfUdwbrq+wLhwXn+VMF8q25NmZ6d49/qOPm4/1o+qh6MvGlSH8j+kOwTX0rR2Xgu4OHdhcfRzkUdhVerH/Ir2P7QnuS88B0wjdqLLDy0qdTL/7uG69sInGzooQrsTCeiWGnKf0oUjiNl/bEVl3jGveo+oSoZJaYj9LwbFiJjnFiaUsIlK9ulRoSn6F8KF4R1CCBWl/X11zDnIHFdqmY/1a58hlHWCkj+cf2DWx2CRQ04/BGzuKiKznIVySTWDOt4cDHAuHBqOf8VDWBCNT8xd9pB5CV0HwEeVleo8EM74YRYUiZW1/mp6UBZZGQQ43X+TPNLtPXIefYiZEizAinDG3VEm+v1sPYJUHlmaDiIADVx+Xp7maP4M0o+7rcbW72q+I0LcUwiN001hGMb6+LTeEVVgh8tVhnUTSoXiXhn6meFLYgSFT8FZlYCx/9PDzrCYt/is9IUu/vwmX/qojABN7j+t/cp8B+5PtN62ByBhnWjOCA7nPhV2mE+WemUkIo8tb7Oj+ZtwVeCJ0w6iBbx0fm5vpXQieSqDn5Xy5OtsMddh3wKfdgKe9nwb3WC5pYzmlBFthSua6umjZOwg4kRl5uxBwkoa6kuXZ4IfScZtbaY/Us/RUiH4nNg9lRrJfc1lB/CwMOhfb1/WjIskvzCw3notA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 oCvfYIawZ5qunJ4Xtz21GvMfFUFiSpvofi7AAboe11X5+fnPeX/7mwiG7gE00xK2Pc+mFWBcQeWykdFQ/P9aVuOpJlaS6WQv7cC7OTTNbVByG3AnfIF4QNZUlGtw7uAAUEQP8TdlpDe0j2SoM1Q0SqI9+urctDC2DG7DiAN7mS8apGT6tsa+m/7/c2ByRUlwncE0mf5XAXvvHvh3/wjQ3ALs5zZu1Q6FUKStVJjKZAAUgSh3a3MHPloZs6a+Hkp3xBny14GaUMApf3h6PtZAeD0NevA1ug7FIEGcBOlR/bmFEGU5ROsyiZUerHtiROkRG6fwM1pi0/NxXd06hf/jOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 510a4df3fe934c5e831acfb512dc7e20:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2df62fb7-c5d9-4b6b-68ef-08deaea68233
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|7416014|36860700016|376014|14060799003|1800799024|56012099003|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	PEn6G7AKf+ttfJha/YrmmsR76bgmdto3g1pSbRviZcWtlOv9rq83sN1sUXRJNAyLz8tUHJa2N4H/L59ZQoZRTsiqtTKYZjlxuEhrjZyp5KcIqcRs3BsVdXmrl1Qj/rLD2EKavlsWIADyDObBXbKKSOljCq8G9NV69qgG3eBYMqcvKJ/U4C/Dvkhg9h62uve+Bdq0oNx0fU7yDFJhjIvGp9X9ZCYhcebiJKigzOyNyvS1GN5tSEtdn6m/RmMubFdGtB7Fz60OIBryl2agNQTvHgdb6lUTIcVMCpSINRmEMo0qrB058angg/py/QtDp4wUCV/AIRqhT952h3NilzZmo8bkVvYmGRVtIWZno+QQeKfrtL7V61MZW5sKOZ8yWDBOyMA5+LK/8iHlp5tCjivF1UMLo1dJhgx4723km0sYTdFNm2JkoIUjQqq1eZRuvBUP8zu+THjRYAXwshmssbw1cjajM2/CP1w8EPjJqSoDeCV0Euj0hQ+F24Ao/fWIxfJ3au4QaVnesNrNanJCX2cdwVyFeYawPaW2jqye26To6IDToGv+3S/ZgLv1NuXnip7mSlCEzrPHRZZdeKEZVateOEyDd+sd/x0qbz5Tl6xtP+5nto0hHZUbWK0XfknHP86wnNq+JwjzIj3GgXYQsoutZq/PAdF0oOB+AA6RCaGovT5ybOsBWngIdXFMN5JIJOiGmjDzJrtFUpWddMkGvFoipNsStJq5gmqB9XCZU6rzGGNfIyFI8ocC+0q+KvU67Per/UwpZgi9Xvg6xNeOX0l3mA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(7416014)(36860700016)(376014)(14060799003)(1800799024)(56012099003)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iUysct+94OxcOxlVZuoSrAWYgIm4CgW1hjwjc5YwEOqrfeJF7m/jiQEmHIymWwasJ5fXtHt+hbK5+IhCMrR1Fz33314LEux/QdUZmeX3yuudbt/oGR5QTDGreV7OfBBiX3ASAZ6QOneHsktOwJWZcj9RVAskhOqbO4C+q6oX4lMNUFAyb2C0k7yvZLokydqU/ktqytvDwgOHMHxl4Kbw6fYtvMLN9cpqWhjXUZQEYsA+E8Cl47es6E8855r2eqo4O+xdbHbe6Ycx9I2iQiRPTqClMXec4Bw21z/ZZ7hYBINVqfVhpqQut6UB+qkTfOn+IKaazbrGK8sn4Ua6N/2+JT5ps6BM3N28WlQ56xYVzv67adCTPStvp9s2EwhtLkOwPGO5sIk86kp0rBhIdLnb1kclyFVlhe6tMYHYYulSmZTqYGVCkasdUjb7eexzyQy2
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:23.6797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065efd19-2602-48c1-c84e-08deaea68a0e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046

The LX2162A Clearfog board has a green LED on each of four SFP ports.

Describe in device-tree that their colour is green and function "lan".

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 6fd85a5cac94e..99ee2b1c0f13b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
+
 #include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
@@ -38,6 +40,9 @@ leds {
 		compatible = "gpio-leds";
 
 		led_sfp_at: led-sfp-at {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -45,6 +50,9 @@ led_sfp_at: led-sfp-at {
 		};
 
 		led_sfp_ab: led-sfp-ab {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -52,6 +60,9 @@ led_sfp_ab: led-sfp-ab {
 		};
 
 		led_sfp_bt: led-sfp-bt {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -59,6 +70,9 @@ led_sfp_bt: led-sfp-bt {
 		};
 
 		led_sfp_bb: led-sfp-bb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";

-- 
2.51.0

