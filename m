Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023090.outbound.protection.outlook.com [52.101.83.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C154418C4
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.90
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123815; cv=fail; b=Tm5s6Nj5+Wgux4YhRQGokXOL5MyBHdKipdybJFvaHKE9H7gdY5uhJECV+0FZtgat+iNa53e+t5LSqtYTy0Bj5k6WHj81mnhS19dSsATwa4hGLvzUSbnH79DJwRW47tG/1qJweU+iNV2SQx8jagyRJVI9HlyUbYWzCN8XRBIpyhM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123815; c=relaxed/simple;
	bh=p7r22/G6fSdXKOnDC3dKGistMcvc61lw/MbexClZIcI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y7m+UQ8bCbgrzkTgfnMGIvEeXCTjj+yVEb8uiy1ZaD9bpcrfIgCJlzP1wkNziaVcIj5qX0OwQCuBqk4/IQ0ryAG/eMmV8ivFAPx1auK81hgNdP3lHwrDpUPa64qNG/S0BzBmBxyK8SM6mJlYralZYOvAc8MPX0hKroJRHDQs5EI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fGrzZDx4; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fGrzZDx4; arc=fail smtp.client-ip=52.101.83.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fGrzZDx4";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fGrzZDx4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U4PgLaGWou1l1mJI1eHSmH8ecq7QUBYFUMlDG7fy7IjXpPVSiDCguSeQa52rwzzkMLbGFZLyxiOqLv9WS94u8Gkaa8U9ccmEyxhB+8N9p7vINJvkJ8/mzr9GT2s9LUFcyThvn7HqxU6SOOmrb1zI/uDgWY8v6kUpJ3FdfQAmeGHxcBQ5XMfjKhFjw+V28ikjWtaaEgW5A1gG297evvp8ci3BzBzY5Uss82Cl05fu5acQbXbjfoopGGVZREM/ZTj0FqI9TJ5Vot/tyRLu3b8NgrnDatlaHHsdqR0KVh88tbapgKSl2b1vvhzlyBl59Z8Zg4zijxaTNa9rJIl2KpJYpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3eFax5NfVWRTgjLta0/Kay+rKhrAEPGo4bG8FAQJ84=;
 b=WUjW1fPAakgyeHryBQGhTIoStmJsmuxH/3eltrdDxVKgDdxXG4YhJjXSfLj1XycGjWL26geqxDZUINJdMRLSjf40WSUEUTfKmGmh/9lRIcIgvBJP9JncqLf0vFeuRmtRptSIAl7J1REeT5YmZnOO43bsBjkiyF0fZuxQb4FLWuSgLHTsOIt3XiltL7yjfuk88g4YctDdamGvJNOzAR1RlrS27ldi3afjye6jS7Xz05wHCqXnPl8Qkxezr5uwo/0PaXwxa1SOh+VYNUDpvQdkhRTDSl8DsBGzfk7+PXqdFAAjFHh+1faqIt1/Mzqo+IQSDdNSR8F6DIuk3lu6CLTdIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3eFax5NfVWRTgjLta0/Kay+rKhrAEPGo4bG8FAQJ84=;
 b=fGrzZDx4eZ+ArWKO9dcRkldJoWogcb2lszKzA0ys3iEkJ/LO54YkgJbZepvbLgLWLd+2w5U+0LfiO78nmvtBWUPpsF55xD88YsPqDPHyYxMYv8I2pQpaiGEmT561iClpts7Q4Q+lXQI65gzT56O8uHEEpil7mowwZ48YES+vccg=
Received: from DU2PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:10:234::21)
 by PA4PR04MB9662.eurprd04.prod.outlook.com (2603:10a6:102:260::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:46 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::dd) by DU2PR04CA0046.outlook.office365.com
 (2603:10a6:10:234::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Thu, 26 Feb 2026 16:36:46 +0000
Received: from emails-6509700-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E03B2807A3;
	Thu, 26 Feb 2026 16:36:45 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:41 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaqnqfZRpeCz3WukOPoIc00RggEwH6mwytpvEpBk6KRg71m78C1u2wk6riyDoQCD3gKCY4DpYWNnoyNUnNpuykrJDQQQtqCcOOfp/vWNVZHhEsHDy3p6lBVgDY1MJ6wm5MFDiiAN6XSDzuvdeApBnH3NwwMmsWMmlcfxD+3s0s2E5FMv96W5QVh3Xs/ZWW7xVUcagTFc7wBEyJuxaZ/2MkNZQ6F5Jcu52SzT8/TaZNtBpbT4h/sYcNOUVJfU1PecLdZc3vmFl+oWUWC/2art4MPAtiGTJdIDekG1SUUwrsLd4ZnXjMwFZjP1RHYZazJwZPUyMLwRDE+XWFdwTu3C3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3eFax5NfVWRTgjLta0/Kay+rKhrAEPGo4bG8FAQJ84=;
 b=gAWNZuA1p4fMjTrE35sVy/6EGBvLI+mUZpj1k6NVtjPz/vGp4FjKyqzRKr+T3RAZH2RspbGZ5ZbzSxC5sLSWuCzxpTM61+6hbbrsyqvrmhLF6/BgTrTGaNLx73+jBaiTa/5pVoI6U2hHgyjzVW4ol6K/m7tnpf0qZ89gNfhhcCz9nY5pw9mHlw985rcJM2wXWEhnSgvzpWMK0y4akrrgPjN8oM7KKjofRNpH//XhrW9IyPOhtVy5QisUkGDrn+P5WqjOU0+E7tSp+vmPEWLEdq8sFvAZCl/Y4ayRN8b4/XYZ4K4fveT6p/FAlhG56Zw3mfoDABsUnzjektSTgDfJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3eFax5NfVWRTgjLta0/Kay+rKhrAEPGo4bG8FAQJ84=;
 b=fGrzZDx4eZ+ArWKO9dcRkldJoWogcb2lszKzA0ys3iEkJ/LO54YkgJbZepvbLgLWLd+2w5U+0LfiO78nmvtBWUPpsF55xD88YsPqDPHyYxMYv8I2pQpaiGEmT561iClpts7Q4Q+lXQI65gzT56O8uHEEpil7mowwZ48YES+vccg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:38 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:30 +0200
Subject: [PATCH v9 1/8] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-1-4533235eeb34@solid-run.com>
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
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
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
	AM9PR04MB8747:EE_|AM9PR04MB8081:EE_|DU6PEPF0000A7E1:EE_|PA4PR04MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b613450-b028-42aa-d7fb-08de75553b4a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 G3VBqoXRNfBBLlZi9hStjLWhLU4q9ls+PPpl1ybwzHfp6iBCFrzrOK/9wmk/hdAtetLjg9xpkmDofwmEXuKySAygIJcWHByshFU6OsHO4jWzRQwn1r+vkIXbA9Hn6Cy1kIAGzmRwsed3zzsR6VqlqSMri3lTXSxfJG49Eo1qHPtv8p2RWE6ZG/4zRFCtgYmO5c/rr6GJwBOnF61PSWxnd0wzjzC8Z5PYFgj8qo+NgPJrOz42npz7sp4GzGJ7ioMKPvV3VeXTtkJibFoq+j1wUWOINEWQ2M1HAG4pHTxB1lAN82E6R6DW3a1nUjM5TkJskTAKQSwJEDDe4HY34LheN5DjEIPZDIG6BZ8sVVv2J8kLGLuyNtEDlaMvxijfrME3r8zoauLEMDQRBz0Dtq8mZziljb5gwzQDLjZiEKND+cVUeKqT2yqRdXR8e/dLsee7hBW5ZEz+Hvd8kygDiiFN/e3mxg8IXunKIV/1nScx76vD+QxqzJRiBbDXauZP0TAeUr56ulKrp5zVS3fyr6PMgyns6g0VJjNi7j6BcwH2bt7Bmls/kvb7b2ZDDSCgzTuBcXizW/dgEcca5oqE/fNt+4MzSaon69LkoNhpSMARMIiXqmYEVB24ITTn+H3x6RDld5DXDnVZo+GRV0ykkEFglhxNnN+WNj+yAYLKKNXLDv1T+GhLU+xUxKBImPjaZn41O36h8eOzFLXcRBnfqolXJNFiPJvAnXgPt9nbOcX0f4korispfkz8C9rsom4zsGdFxT48uO77TsIHjgr1pswj/kKBOjm8bezzkJD+eIPz6Tc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3bb7377997bd41c29bebf566d7204d47:solidrun,office365_emails,sent,inline:10942ff6038381d3ca8c2fa350b4a692
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	327013b4-513f-439f-6079-08de755535c9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|14060799003|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	WXkFQPFgtVSMMjzuGml0obcgclzEu1Yedj8DAdvzeJxNKd99qDvyC8Mc34eFC+nT7WXCQVk3/rHZUVB+KqL1ySPdnqFuM0T8Is0gReg5/cwJijorL3DiNCu5f+iDKcMf/mCwGMoLBCTW+2i1fD6JSrnURbOc6Qi/veqMn0yEJn2oNk7aLLtFT7NHgDaa+Y3FDj5vo7F868VtbhDElZCNPOOyRkrxuFpXMrn5xXl9UkSg9UykMJ7pcq3PK41b9WAmJnYI3LTd3C/eOP0P0IHsjFU+2Mb2zs0k1Q2f5Xspwt8nhluUeNNnIG1cM7KXmozAMKYJFnw7qabjiOKjxbpJEQLdNIHgC/TF9wmG9YS7ZErNqUDkDu1yxrobibWWy3PaMdrkzP4q0FMrwFwTmKx1FMb7ppxBS7dRX0lxt0tEZoWQovtDF1YpIqpQs+sG3jdHmD2TUEyDVsrxaLfm3OV2pKweIA0XMYmKEzAUE0o0qfb/CVWY0v7gm+yqEaJiGUzLT21SGKPfcosM2pSoflLgPtQzNk0TMfMvqNxFdYcG1DUSJBT1aFS4M08+ljN7MNj7dXqMyVf400736LzW40uJZK5U5/YG1JQ6mxJ4la4MLSvy6BUiS/TMNdCEIS0xNRa+o9qZrAvvEvmOa6uor6GbkPC2pTT66DIq9k54c35odUMTwe/8jJ9jiVgjkjeuigwEbqh7dQim/hkV1Y2cPTxUffFKH/J96a5but+9r5DOLYmkoM0jLSNFxNvjYAB33kDz7JzQBXJzvVkygsEaPd2WcNxTgKbQpLXQls/ulCyy6/mBBbs05dvHwNZC/3e2JMws
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U6K6dIofV8VlXdYTtwrKWS+SwC6b19XEyZbyKTz5cownVLxGsWEBtSZXh5KZi6OAgxB7CMfbvcEVRe7+LjA8b+sn0DFIbM2IcrtjtqPTaHqCf2UT5wGd5WYhXFtTSUxAPGbSQYYK45awuPoub2rRrKjmH79SUtmo49JW4jc5lDo86s2YZewgyFWafHH57lLrcsrSX465VURCsoLgPlaLIVALPW4JDzEmK3GCBadpesg0xHQ5vfg4+tekWFqRMMChxxGpHTCACod/zz80IkEUXFdxvi4vtvOKjxcPHRb58pnY4ExCe2pDB2gKJEERkXI1sDLMmFA+u65995YXeDsqnWiyw54z7ImmC/f7VAjeuhY4KwGC16g+oq3w/sOOVa7FNBdkhNGEchXWlIC+9ccP0PpY2Am4UAOV3auPonQfqEPF8WiorUzKBmn2vmQ573oQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:46.0180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b613450-b028-42aa-d7fb-08de75553b4a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9662

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..8789dacd3f1a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: ifm i.MX8MN VHIP4 based boards
@@ -1225,6 +1233,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.43.0

