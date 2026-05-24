Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020093.outbound.protection.outlook.com [52.101.69.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1EE56A
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.93
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634497; cv=fail; b=nvVQ+4qvlHAHeO96vzZRgn4MCDxbtWsVzOif/cBqsdEJAeKZ7t/ZTj3M9ETMOROSxgramTLouHDJAAq0FtHACaG3uH+OiT8dqB4htBeBNSmsiJMaIqDS7OWMaYyUC7ZW7uM95MIKHs/ZIfy96t3p9FkW+h/wJkFimNGRcYxlPOw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634497; c=relaxed/simple;
	bh=5hIK16Ilc9UNKms8bMngVkuZ0nODYEj14mTLei5DIyo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ue3r8BzP7rGfTNxT8gz3w4AXZV+K63Ko+SBuKU6K7qfXi32q3U6iYJULIoTkEYvO4RQJ5GpGZMl2XMiGvRzlRaCaGXwHxkLgLk5aM0PZY0OYA86q9ILGyQuaztqAnu2BLuV6GuV2XlGvsXanHxONopm1Mn6UIBTI3iXgEwU6me8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wT2IgUle; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wT2IgUle; arc=fail smtp.client-ip=52.101.69.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wT2IgUle";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wT2IgUle"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=UbSM6mq3i3yU2+8qfDzALr38uWmA51s2da5CmMB/tLxnlBNuacofy2+flENxMbUhDKPMXgfxLI3OCe41UVXtNOMjBCwJ74/SzpRg5CoZ9egwVxPuXvf4TmbyxCiLd5wLV4VMey/z7ZeTPfrpmcnagMi2Tyi2BcWjF5qF7TJJ80/3h09hxWWfYgIhNKDclRwEBB1t60RJf60huK4AUZSo6vRwBPms+fEgaalYZ4YzoVHphI2HMSakuLKO8T9v+Kiyr0M/x0tXs3N+zXZx3HvGpKRi9LKdMx4YLhtQgs5Ut65Q2snVunNmmXF/F3MJfBrxFwFBv1SK6xuXPtR2+VELVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p940wL+NZOsOQXGOnRgovQDgjFecZ9dHRIL5KNAgaHU=;
 b=QlvCZ2OPgfWdFSv5775fQh8yGWzj1AKZ/eQ3EBcaigxvxWOWuaXvhcLJTdTmLhFmCYfylqy8KgKgPRni/L1ySebh2a+uecjfq5lml7/8YeoNnJhEzE97VW9yjdeBJlWrJ2MIVpOc0iVeBuvcwvH8c21S8Sn8jaVTvvIXn8Cyf/DeEywOwwe2A0rZ7MDjlrR6AY8qa4wYO+zTXDGjZqK6iX1yTnmpbnFbgLxYL/EcIe/iK8r1TWNPQZihPVBrtzHQ2w3zfOC5rq+eglGE1+zCa7q+SrCASUtiErEaQ1+lZG6ZmqTW7RLGzYZ7rsC8lUXTkZI0tkMfPvVBZYxui3nazQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p940wL+NZOsOQXGOnRgovQDgjFecZ9dHRIL5KNAgaHU=;
 b=wT2IgUleyx/8xpiEwlmegGm+UCI09KYC1ZmRTQDl54zJ53R+ZqNDOv19cKLLsUEK1GKIR/22phXt1AOvGeGSxn9D9K+9lFKw/jrUGuluV4p5Gndcc/+SNoXDZGeZJeSkLOOJbTbeTv9IvitdUNm4aoOV8aVpZtUoDfmABoQRn2p4cWdoVvC2wifM3OAz0Tlxu9B45TD5b07hqLgEZMfET66+9ehqBtgVpLVuQSTwOjYyLNgll3EkdkAOl+e3xUxU6zgld5FyNu8ZsUaVQ2WUgMRD2T9YGQ1doswiOJQFoCIGD0Z6VrkFOgwhwvo4iEd1zfNjV4H3/Fr8wt7sBRvCJA==
Received: from DUZP191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::21)
 by AM9PR04MB7507.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:51 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::96) by DUZP191CA0025.outlook.office365.com
 (2603:10a6:10:4f8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:51 +0000
Received: from emails-3355260-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0BB2C7FD6B;
	Sun, 24 May 2026 14:54:51 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:44 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDDWOVjREmSEr/6LCW4wGZ4QM/urV+VMez0dCJdDbKW+Unh+uF2JitFSuoJL2Jots0FGUFbgun5tDUNEFSDISBrGZKnMlrHUd+nBiZavgZqku35JVLtOWICCo7epMYjEg5WVmnBtJQ7jCXr6bYLGo4VVZFQclKfA/2a3E4P/vso+yYErHpIMhZJTZfLND5qvztCQGv1jZj8vPMcOVkcl+pDPdNtxMKFO5W2D2FYh+WaCMaTqmAhu6JJ+eZTkD9UWhzILd0WhD/tMNUtB1GBnIOFOW4tD1ZSK1Da1jiLAhaKmba7UYjtbfV2wVAyVA5wmCCnHjYfnTcpkIy948DnpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p940wL+NZOsOQXGOnRgovQDgjFecZ9dHRIL5KNAgaHU=;
 b=B65WMv35YYnSCVMy8grMdW04F4gEGO5s6ls/j/bHiSxRMWENoZTSt0xDqKTVKelgo203j675u4FZTMCyOT3fa4WMZSk86fgc30EqSTREGa5V8X5w6KUruyrWUCpyqo85qfKuycrLk1c1fvxQff/BloBGUJ/1+d5ScU3da0V/CjOczsdWJMkkA4Xfkf2CPqWAkYV94q7zkk+NdnHZ4tr3R9T6gbg2HerYYoCc8Uoj2aSuzneZvw0xv2d62hywL/KFEAmxqxWHASa/4dbHYWnTz+1g1mhIOWy3XZvv2Mpb5brV20+oTbEDDhKYJ7A7y3KZHgayglCXa81EJwce3vy4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p940wL+NZOsOQXGOnRgovQDgjFecZ9dHRIL5KNAgaHU=;
 b=wT2IgUleyx/8xpiEwlmegGm+UCI09KYC1ZmRTQDl54zJ53R+ZqNDOv19cKLLsUEK1GKIR/22phXt1AOvGeGSxn9D9K+9lFKw/jrUGuluV4p5Gndcc/+SNoXDZGeZJeSkLOOJbTbeTv9IvitdUNm4aoOV8aVpZtUoDfmABoQRn2p4cWdoVvC2wifM3OAz0Tlxu9B45TD5b07hqLgEZMfET66+9ehqBtgVpLVuQSTwOjYyLNgll3EkdkAOl+e3xUxU6zgld5FyNu8ZsUaVQ2WUgMRD2T9YGQ1doswiOJQFoCIGD0Z6VrkFOgwhwvo4iEd1zfNjV4H3/Fr8wt7sBRvCJA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:42 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:42 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v7 0/9] arm64: dts: lx2160a: cleanups, add new board, large
 pci bars
Date: Sun, 24 May 2026 16:54:39 +0200
Message-Id: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8RE2oC/23PPU8DMQwG4L9SZSbIcRIn6QRiYWRgQwzNF41U7
 qocnIqq+++Ek6r2xI229by2z2xItaSBbTdnVtNYhtJ3rTB3Gxb2u+4j8RJbzRBQgRCWH04oCPg
 xFK589MJR0jZL1sCxplxOc9gbe3l8fXpm7629L8NXX3/mFaOYh3OaRHGbNgouuCQjDdhskqeHo
 T+UyOt3dx/6zzlqxCtX6BYcGxfeKW0oEpJc4/LCNTgwCy4b954oBCW8zW6NqwsnkIALrv6Oh52
 EGJRJYfV4feVawIJrDlwr8FZajYhmjdMtX26nxiPkbDDK4Oy/36dp+gUS72Tg6gEAAA==
X-Change-ID: 20240118-lx2160-pci-4bdb196e58f3
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DU6PEPF0000A7E0:EE_|AM9PR04MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: b3498901-a452-421e-a911-08deb9a46878
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 vWLdu2TIjJSoWBOncc1wzRo6C52e/+nBuA5lM2oJDejjkd4CGtR/rUiDw14/D7lzgjIxN/D6aXC706yA1hL7ncl/pOzWStEtrsfaXODGlkFDphidUtNSy4MfaRYcnj4TN0ZK5d8FcOx3W6UoTHuDz3BHeTWmEguh2pVcB0bV1nhFgrX807eOnN4eCJt3iyxdnlWtWEnk7g77PUbdlDtHUcIGhlo/aRuqif05mQ19KtSKzaQi3VfFTEEDsC64Ov5lLNEM4afzlbFMG79zXn5wS9K7xmx0qDKuwgT+XJ+bjuPZO8gv+QG5KSj/R0uexezcKqoJGs6p4bbYYozYQFS6ApdZ8RshnyxAHble6GvVr3OB5Rr/MxfZRiyOU9OBOj9h+a1K77AjO+kgu/Lgth6VCq7+PxA6j6lsDHWWKCdzAOK9c2UhECKTonAlHwO4mTZ0LTUGl5UrOkMoMTurf4KaVS7SiJpPAWjixnN33tydvUykfWH7ua7bsXwLVwW3L0CSBJG2cSF49svrs9ZW6mXgRqv0bl2igi7Uy7ut9squmbiLdbgzk6wuYoJy/OcMZzHq2NxIZ2tkslK+ptS0MXovcEWYgqQfXTK+ofqAL6W5HOKuo3e2JE5/TeK9om+WTG4bJX3+2x9FdYzC0tRKmxmSqeovnNVj4p+JC3fmNwp1ny0g7I1UMaWMDjm6H++C5aykRocgKi7FdYvloBAlOpdxMY3Cg1di01CXRoJnggn6TDyFs+2Zw0RqC0GD0ww4nFNfPowZyIqhbj951Ce6KAzGtQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 IqiaDqX1wyVDIIMGxZTCk2l+Nt3T/53mkLNiOr53mjBb3rp1tQ0+mJkVF8NXRQ2UmaEj0e7jWSHEYEM8eXM6GOcxL+M2z8Q0kmahZUDs9Qk9vkrXvS7TZhaszTFwasB5g01nN5mOZxG22tcBk90A3pt8PElbzWIfAXRDjc9LdE+arczbT+xIVWu7anYaUEu6no/hDJO7SieJqzh/woSE6+nZ602kfuBU/IZWK4C7VOQDaCxOEPFc4yFms270wKdGsnibduRDRAHdDNTcA6wM6txvWKGbM9Erd7Xl+ppT4hPz346wnlHYqmL9CbHdcsOvCwzdpW2TYwxkfY1fj/7P4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c5102b852ea145f18456117ec4046a59:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2dc7a765-933f-41fb-53c6-08deb9a4630d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|14060799003|1800799024|82310400026|35042699022|56012099003|18002099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	e26kFXyd8ma1EqsXxAdiTQaehqCfwqqo6TJJ7djs6yJSQR6GZOYhPx957YoWigy1bRH12y5rI4OR+bjcaCT8YTUmimVgRe4okDltVlALfsu/pqj/WVEm86XuqN1toBS/rbQLnQxfbN3MrrwIKSoealAzVb+rwvSYmmiy53OJettVymUxoa91VqOEnYJm4L3axZzkE4gRsP5IbGhDQgeHOklNcfMu81Ze9CCAyjVAYVxfSEUjAR92/IfSEqDg+bhhXeNkYOrbg7IVP/P7J6lHLErTCZWVWxxm88k0ACos8suA4FQgkfKgA1WbELLru7YHDOlKEXvIRfqb8C+rAMDsiYHBBM77icpcT3pMWXK7fnTAA44iCysR+dDGsxwf8Jk7ppWsh0/S4NC99KFqiAvetxS1vnLEkDP6luWFP439eXiECH+yssliblMbB7LKwy4g1W7ytW2p9I1kF8/ZmDTUMp9k3J6KWCZxNOIKCLj92r2Ivh/IDMOawTRABJFLKhkWxKmqwFNqOVug9L77DzhKh1zuezMkOYKRGMillnbyKSH38hlDQ6ZfdPZ9bM9mqdt0u0Vl2kOxV5l4q+4rQGwLysHH5Z/zYKxY8Y3k1Ok1ZGVQVVW4wu7uPGDMsF8cNWvvdW3TzB2j8KH6RexhCJf64b3ts6O0Zq5ZUHQGAYJdOmt1GkJ9xO8aysDbrhodNVTElx3fAbk/tuHATEYdSB5BiUyYi5GYc0QNWOeccxF/pGuFFDbxxhYdb1Azd4ZkI9aCwnghNTJQI8MoruNFhKj5XwRQYDfeFW0dy8O5Gdlc7MA=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(14060799003)(1800799024)(82310400026)(35042699022)(56012099003)(18002099003)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YyZEL1n+/tae6gh21mNUSjnGONFjvpWsARm5/+or4wEUIp7TmAgEyIvllXjz1uwRQMIOZuAZ1oV9bpIz1RPhRljKqWLwV/0jaLL6yK6NkUaVL+KkDwRQZ4a6EwJvHxojN9nBf1mzBEmHzMYCjdJ6HbV9OOu8lOIqcaCzKUizDzdgbYa+SJF1lsCV7qWNN9c0xlLQa23zCAoSbv/t+9cwXVHOOer8sTnyt9xvXz89vR7PFhvGa4SYoatFjHWxGoPJvZ2PjsJGpMRYhwfGkq7USN2caeq3jEfS8+7Dj3H4y/hQOo29yaEeOerpO/mom222wC7SUjoOVZu3/upXrGpey1fnOzHiPUAOascePVfgqwMkrUkrWM5uI0Xt+xKAGuAur0s8S2j7N1+WbuQssOPa+MWnZWxA1vy2V5Pvr5aqfjwI8y+OshnU9nXfE8otaBh0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:51.1299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3498901-a452-421e-a911-08deb9a46878
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7507

This patch-set is made of 3 parts:

1. Extend lx2160 pci node ranges to support 16-bit, and large 64-bit
   bars. LX2160A SoC has always supported this, and SolidRun carried it
   in vendor fork for several years now.

2. Cleanup some status properties in LX2162A Clearfog dts.

3. Add description for solidrun twins baord with single LX2160A CEX-7
   module.

There are no inter-dependencies between the parts and they may apply
individually if necessary.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v7:
- Dropped pcie silicon 1 changes because they add too much noise.
- Changed pcie range flags per sashiko feedback.
  This also fixed bootloader patching issues seen previously.
- Added CEX-7 module onboard USB Hub.
- Keep first usb controller disabled in cex-7 module.
- Added reasoning for adding nly single configuration binding to commit
  description.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Squashed DT label commits with their user (twins board dts).
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Link to v6: https://lore.kernel.org/r/20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com

Changes in v6:
- Add explanation why IORESOURCE_MEM_64 flag is not set.
- Fixed pci bar size 1GB/4GB typo in pcie4 node.
- Enable twins board pcie controller node.
- Fixed function-enumerator value for led-sfp-3.
- Reverted accidental change of clearfog-cx soc revision.
- Link to v5: https://lore.kernel.org/r/20260510-lx2160-pci-v5-0-540b83852227@solid-run.com

Changes in v5:
- add new board
- add cleanups to existing solidrun boards
- pci: extend to lx2160a-rev2 dtsi
- pci: remove non-standard flags to pass dtbs_check
- Link to v4: https://lore.kernel.org/r/20260302-lx2160-pci-v4-1-30a30dc47ec6@solid-run.com

Changes in v4
- dropped accidentally added empty line at top of file:
- actually drop RFC prefix
- rebased on v7.0-rc1 and re-tested on v7.0-rc2
- Link to v3: https://lore.kernel.org/r/20250907-lx2160-pci-v3-1-bb66cc41b8f9@solid-run.com

Changes in v3:
- dropped rfc label
- adjusted flags
- split 16GB area into 4x4GB sections.
- enhance commit description with details explanation
- Link to v2: https://lore.kernel.org/r/20240429-lx2160-pci-v2-1-1b94576d6263@solid-run.com

Changes in v2:
- adjusted flags to fix several errors during probe and bar allocation
- explicitly tested with 2 pci cards on Debian (Linux 6.1)
- still rfc because a limitation in designware pci driver
- Link to v1: https://lore.kernel.org/r/20240321-lx2160-pci-v1-1-3673708f7eb6@solid-run.com

---
Josua Mayer (9):
      arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci regions
      arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
      arm64: dts: lx2162a-clearfog: cleanup superfluous status properties
      arm64: dts: lx2162a-clearfog: specify sfp ports led colour and function
      dt-bindings: arm: fsl: Add solidrun lx2160a twins board
      arm64: dts: lx2160a-clearfog-itx: remove redundant dts version tag
      arm64: dts: lx2160a-clearfog-itx: move shared includes to dts
      arm64: dts: lx2160a-cex7: add usb hub
      arm64: dts: Add support for LX2160 Twins board in single configuration

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |  41 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |   7 +-
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 830 +++++++++++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |  30 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  24 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |  37 +-
 10 files changed, 915 insertions(+), 61 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20240118-lx2160-pci-4bdb196e58f3

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

