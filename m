Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020108.outbound.protection.outlook.com [52.101.84.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B63392C47
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.108
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634508; cv=fail; b=WvkMMQF3WezRFIXktLI418vtFTXlzA1L2bNVUyrB3kfUJaCNbn9skJRI8txgV7WPoGkknMe427N6mibvJ3BXLIkZzB1OqWRhJh41PyXdO0Kwt1xhTz4ysQ+KB21AamjuPt6Eb+4dAaTeDclAvK6CoETeOw1ZxVexZp7CCQXQ/EM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634508; c=relaxed/simple;
	bh=fWqUwfECAo0pbzJX8IZlFB3qdJ2DIULHwcoadTNlNrM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mXAnTSbYU85TEClBA7/9/jXKgi5BYD+UjVH+xRoULRd45nIo6i+wMIaAlVeSCImwVGnbrHmKhHiNG0e2MfgRPjZ0rMBPnFzGqCsVNzgzVCAEvb6bbGRKz+8LAhS0w9h39469LwkAeQEx/Y0w09HC9s4E0XZr1u1LY1gD1O+QgXo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jn88p/T7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jn88p/T7; arc=fail smtp.client-ip=52.101.84.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jn88p/T7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jn88p/T7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=QSL4JMnuSp2Mihudk25INv73/05tmx8COqSh6OZ8ZWdNj6kRsX/E9bb5uaLCWnh2bcdShH1me+R5J3NCx76Yo5fkbcMhFi2JbHV3uxfGM2DYXn8+lGipALHI80zH76gyvv22Ct2RdvVV1CCkwXjYevyN7LRdpX3w9xoY4Fr3YQc+Scn1xKlRAIK+NOm7kwcGHjcH+hdwiPi9TOePOlNBOgaznAxzrMqMK9AtxlUpn8Ok05aYznkMJG1pC7xpORw2yWfFVL4u8Cf0AWhA9B5r5AoXB5cKamaFSqGxtaGnV786ZZ4ySqY/ECpaKM6aYA9vMWwuQArkelV1lvx2Dx97Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=K6hmjVWnsTk3RD3pblKrAyVZh8AisJgVuy2b4EZFUfIaXKrIcFU7dLy9iQiycfd62KBfoq/2ComX7PEps/X8g9mWZ+gw4oTxQyvFnuMj1PoACC8T4S2ZrY9d6x2XdFRoQdFMYU2bN3oNQ7Sfb2gZuf1eCVM36n8CXDAzbj4j1JthpoU/zxs4EYwFG9vYric9FHZeRV7MR52vfRaNCV4QXAXus6QQETEMynJKYvh0LU6I0REFjxt24+Oe8i9f36XDqBYClatdVpvO2uPU1/BJxdy1pmpkPZJe2Nkgk3hi5927kr4IXp8ElMkDZFjKJoGTm+fggz0I+OE9pjfOTBZQIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=Jn88p/T7tpGMmmfUXiReavsCamMGO4r8FUG1ml4f4lLY2/OOPCpPI0pCsb012dJV7gglJpzyfFpGhwJz4qMg7PnjO2xU1h5mFKG3Hkvs+9QNSkikYyYbdrK0JyTCTYeGXwSSi/sxVLTS8u+qrV9PHHOOytnliyAd2aC5nTS9TRJ1zxoFGi0CZGv4Y/63n9ZvU10tL9eLDZkvpNCHY0amgViHvHFuziSB/R2tx88Fkgnu/DHTULTpUfAp4oInC/PeYXJpIbAC/HCl3UcqOyun89JfJpubPdDOhrOCWJAJi2+Cwq96E7vSf2TIgt5oJXDVjqGxkUohf6z0T+wWkmGVyA==
Received: from DUZPR01CA0310.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::10) by AM8PR04MB7283.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sun, 24 May
 2026 14:54:57 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::99) by DUZPR01CA0310.outlook.office365.com
 (2603:10a6:10:4ba::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:56 +0000
Received: from emails-8113075-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D51ED7FE4F;
	Sun, 24 May 2026 14:54:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:49 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW50Y35/DLanMEll0MiqVuKFszN3txHmBstI9qnRUYo3Z9704Yo2agXLXiguzt5xRKDBt+w68bCGwqrc45WA/y9f8oegY9SrgEg/xW0+3OQVO/S+09a6F6Sknnp8M2bv+VOtrkh9ZxTd1dxBtXxgFAdfdRgjyzJOJE7DCLtT19sMSrv4CK4g4ptbc8xdMJdunv32eexAmL0VksK5ZLyFlWzsNlky2cS0AO8XRW38G3L8el06FtwA7ufPY23dG0G47wjJ0w0+9t6B8lqUOAujer0nWC5xhv62YErbqf9ZhZoNy/YXNMezlAluVsoX2i2xrLE0bTd1X4EjdOUNSXNTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=lfjxkcot5uAVjPv9HgLmWLrXPKUtJt0kgLlIhwoVCS1IPFKB7HiZZvgnvRKb0WCpV/Q1dEZrCcmfzI/JCGIIjkVb+TepoZb5xPSm6im83xCfqqJ3l3gcd2Eib830nXpx7cSbnHOl5jL4Ao2VxIIfFg2rcKxWmCcAovHQ3g9kLeAmYk/ghJTqVc9k5pUhJ8Bq9vjSntz9EM4zNGI/OU9gLQWIXtkO7+pkh4KrkbodN7srmn/gpDnmSdQFkalsoT0i2ze5bnOdma6xOe2uOQRVDDRMGjQaYt3wF9dVONMZZVcYJfqdOY00dKb/haA6iF+JvVn0/MldXn1U7L0UiYA6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OnC3nh3iV6TV8oyTZW4BOTGc4m5eZ5+MPtnTQTYBlo=;
 b=Jn88p/T7tpGMmmfUXiReavsCamMGO4r8FUG1ml4f4lLY2/OOPCpPI0pCsb012dJV7gglJpzyfFpGhwJz4qMg7PnjO2xU1h5mFKG3Hkvs+9QNSkikYyYbdrK0JyTCTYeGXwSSi/sxVLTS8u+qrV9PHHOOytnliyAd2aC5nTS9TRJ1zxoFGi0CZGv4Y/63n9ZvU10tL9eLDZkvpNCHY0amgViHvHFuziSB/R2tx88Fkgnu/DHTULTpUfAp4oInC/PeYXJpIbAC/HCl3UcqOyun89JfJpubPdDOhrOCWJAJi2+Cwq96E7vSf2TIgt5oJXDVjqGxkUohf6z0T+wWkmGVyA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:47 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:47 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:45 +0200
Subject: [PATCH v7 6/9] arm64: dts: lx2160a-clearfog-itx: remove redundant
 dts version tag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-6-09370c23b952@solid-run.com>
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DB5PEPF00014B90:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f71eb5-109f-47f3-bc5d-08deb9a46bea
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 6G4Nk9SK+KPTFBED0IZ3i/isf8Sj3OlWHcHpBIrGm8jss5UASIUzJ4YACmy6yqbfkYmrovFwL9WKJfr9o2nO4p3cBvWDR0bvjm6oOhQXbysrg7ncIn+rKwejlDk8BDWEToME2ZQJT4ntUSPk9/f9R+UQRSsBQshkrHUdobWH9ElvX3/BjAlSEorIom0BDaRfpxCN/zT7n2Ne1bpvw/BWiWUHQIqqKQORoGphOnWHyVHDm6JE6rYl+bv5Ko7CO5SPQu5fN1gKkKw3cC6e7nuZdK1+WwsBa8E5H2z+QFEZ685LBSgO7oziNDBChxZYacPpCkwAw5aPxW8kjRujorddsg3AxI4Z7t3LAXTcnwf+hQUHFHjB1LaiZyA4DJyf1ynt/l9rTNQRkumdby1fYo9engdcUfHif+znHGB4U+EQrNwyLcL0wHVitmTkS5+1GlL/+DrQnaumPTLgrdRZ8DepvmFPQFBDuBBWHocS+9u+6hu70vaCdE48WEzRHm6EkROa4y93cqbP2E2uW4JJ+hAErvBCqEXYryk9yRLOlZCQARAgb9peN2kGNCfB4C+6/UZOF2VTLHs1CnO+1tw3qyAM6WJ+Z18V7wuux9CkjOeMaI57iIRbSuFFMouVgMIvwWipYvCiDgYUbPFed6/kk49LdC4YDcwg2ZXsUgsfeVgCoUPJ/HToItnKqmXX5v/FvvDquV6Cpk/HuG19SlQXHmXKrc4CCtk1QKZ0x64YYLhC5pBvujUnqcQKWZzZPOyTEQeX0Q78tNctT2StDKAm3ufs/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 JF+omoRMAIIoTCiv9Haa/iOQK4BjDMOetTNKsuZlSS98m7UYNapIjjshh7UyN3gZVfFeCPA5zw9lt5TgxZqHCr4tmQbJWVAyZjgR7j67cZE2lP3lFMuayOBy2136hqtc+cOzWhrlf/IVQc0sdpqNBh6HIImY4DNyaHh25Qar9WxL2EdpkzL4MHa0/utkUkfvTlurHHSB9JAJ0X+k1C5o/x+npsoYR2aEyDQ8MhAcfU8b3h5sfOprKjertAESPfmJx+8XfssLrgnQ1rFpD2IiKBg7ap1+LsQrdGG0tsWKGrUsokL/+9Ib5qLh4aZ5rHJh/WVeGF+g31uxZ0PVcv1TOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2881561d744449179b9beaaf8484b4e6:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4720ff45-76a4-43bf-74e9-08deb9a4662a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|14060799003|7416014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	XrKBOLFQ4/nVJp7/xGaficzCoXv/bEZAznnXXKc/oONu5Kvh7ZF2tBERNcW/ZqyaAaIJqQcQCjjz6VxCr/ZnTZnfaXNhdctVtaSAo7bNbpI2xb0gnlG5uPyLSgaLJL49oVGXlDAJWlxCo6eBuJIuhVRh98wp5xPn3mDmDJ69fWUNuWWmPG3QpbI3O0lHHI/jdZxBJ3A6XxaxFts+1YJ+ZUJqmKJq93Ni14IoyKcKP5AO1N5hphQy4mqJVNYhXTbJdvFHn8WLZE5rjLdOMqf1NVeNYP1PWtvB03Wa19gKfzKTSkVEcDGq40400HPvY+ZSGUuqRsmTrw25ql+1Vk0gOgA9wIFljJSg74b+u5sQmV+LpJ7S47m1dQSxEl06jpVT164GJfHl1c5qXOi1GwOhIhnMLVaqZpCNjD68cngWltDzr2C/D7tkYDh8w6y9e2fZA+3lwO2zUu+NzkQukwPu1NF4fldemIU+O/oUqud1a9b/ZDFTWvo1QEEmt99hA2OvbE/uUTl0LlbeWVgQw4ULWriNhiDgoSo2sB2K+3hano8mr2cZMhZ3pBSaxzGewF635mkYk8SesFD8wkSM22chYWikZ4eXi84Ktw/KDUoTjN3ddkB0H5RBUdlGk2Usn8TAh9LMnnhXmqZMpWM1TwtZ7O2OHwr4xrxP/Af+Pnf8bwjigo059WvkpCMZasdXPho2/dFIjMXJXsryKMGfPogjM99UE671MUdLRXG1jSom10HApdwefopixNWnqHijXSo/sH2JpQt80101qbMyPLlBcA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(7416014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sPBdnDP8gCTGmp8nMzPA9sjBhzRIeMm4rDIXqS6k9LosNpNOiRfih0v49aDnsfBpAQsG+wEBGgMVc8jkkFbTd8e+9OYT3YaHXEDYdRu+gigGs32t1kNhKhX0RuNy1jDz9ANjhBQ0umwRPkuBEQPH3b5T47OKVF7gaOTXE98+8NAw6R8lsi9mYoOD8sOrhWdGXwi5JbRdxPdaQ/oZvdBWITDE+qpZioejYDDWakwewaQV9Nw4mEhwnrx/PzjE+bhF8NyXwZayVi+07CL4d9MnKbMkPDJNPyWeD7i5v92V7+Itub/lx6Z5sNsU9qzbyQV/U+dFbfB8rJ4GM3ehVUPQcwyIvAMNHri0Zu5Ky05CYY+cODWqM4OIvATb7KfwQseTP92yJT9jvmcMzjy50tP0hM4C4hHNR5car+XipaPGYtaT4rYFTqGEpOgffiQCqVxX
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:56.9069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f71eb5-109f-47f3-bc5d-08deb9a46bea
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

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

