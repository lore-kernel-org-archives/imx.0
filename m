Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021112.outbound.protection.outlook.com [52.101.70.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B28399D08
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.112
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634513; cv=fail; b=LT+UIJ4Np4Qdr3UpbAbt/004r3ixtlX8jHeN9VNmjFTICUJ002/zyLTpuBCoPiIxcGm5ZVtAPxGJeKgFoL4g8RgVUA7cIO+IMOQtFmh43gqdoTIpTtAamgCsQA79/M+LqxpKospnfZssT0PfJKs16FeDiSnd+ZG2Y8b9NDLfOTs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634513; c=relaxed/simple;
	bh=o5xIApJNIyo839s9yL9p/yqKKyGjD3jP2ApYw5DJSAk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TGnM+khmgIuPE6l3B3US7+4vw0twuy3G8RWjh3VR4zww1VpjwgyQHC/naDR9fvGQ2rAi8XGNHp3dWzZuYrh8NKr0+587jDzM8RRGnqBKAiviQd+bVN+HoJb51Vn+LcyDI4Z/sI2HKBS9jpKsOL1bm52exTuzGRRNCw9wnDcySgU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OgWO0YLU; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OgWO0YLU; arc=fail smtp.client-ip=52.101.70.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OgWO0YLU";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OgWO0YLU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=LF2pwuoSi+3EPnpce6pUcQGd4BB5Gnb/zytePgHPUfwnDZ5U+uDIey9njdVZ3zr4cfAu8/HzJXpxUTjYzKCKqhRpr3jM8bJ7sG6m/SJK1I7CcM9uW11gFaf5fDlvfHBmKyv3BQ5Oqqi4DV2RQflr3ApxRrGZCmLMgS8EdypE2G7MQ9RxcT7Vehl7vZ6Ml0KzJa8vuSqbV4TG20ktBkNr6+UlZuO4ltvPQ3ThedsuXjcblqiXuCk/iPP0pmJYhszrmS6C0hnB4g9CnrJbUmKsGKQvXYOyoLneh/Ig//GPXUUdCdN5vQ/KmclbiqeSvfYFh4eEsgOisfOd7ptenOR5pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GDf4I6Wh2pVF1A/Sg4Zrr4QZrkOtmtXdQyojIwKCkE=;
 b=cPPBPLdTsM0AMC1wcpKnZvNb5Pg6sgpnqXL81PB3IgKkL8Ni/gYO0Y51NwnBvKza2J0hLmADbhW3kWWEQ5f0VYXsMnjjl8KGUwrMhFGrz0OTuzWQMol6vRWjrHJSqOqa6n8+jZ/8Iqf0oOp8I5Xg3VUfGyxVw3N9AoBe/DsouREiAWuatiynJn6Hzwhe/fEwMRX89rqunQdB9y4KzO9OBnNviNAd2BLzZte55wXMce7MATzkYCOCmPzjku+W7JUbcqYDgdKYUU7bVkugWixTiHVV3r2ODEqFMkBTvDJYuAgp/Z1Oi5LPX37pqEAo3sMZA2bUZlDDVuvBMfw6r9+IXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GDf4I6Wh2pVF1A/Sg4Zrr4QZrkOtmtXdQyojIwKCkE=;
 b=OgWO0YLUz2MLI1nfdcGnjx8lYJ4A2pBePKPfmW4AaXR2Czvqj8UFUTq8Lq5MYJBfUWHw+o9SGr+HhTAWGYs/zQOxLgFaDUH9PEWf44qGbbzCRSoVoW3FBK3RoAHfQP6SvWESAltO9Esle0jIJDhMQcCJ5w0texQOymGmLgpKDVn1dRO0gDR/7Mfek7pMuBz7qX67zhBnNK/AYbxn4yjWwt0N5hpoYrIXV887BWOImPlV/LxyOo9iXHayFHPBfFU8j7ZnCZ5P5g64yp2D2fg1o+8X5Ee047Ocv2JAxS8pHzoSdNu442t4uM3WZns2x/ixZ7vG9IuyE8qeZi3c9OuCiw==
Received: from CWLP123CA0214.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::14)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:55:00 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::46) by CWLP123CA0214.outlook.office365.com
 (2603:10a6:400:19d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:59 +0000
Received: from emails-4717192-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 648107FD6B;
	Sun, 24 May 2026 14:54:59 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:51 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMrlGB2rjssHMq1VKDfefk65BLL+8GdqnfFxKeEIVnjvzogBhcLLsAVxGVymHwV0xYNnqsLBU9AMKSmjKoQ0XQqsx65heUNgbOUAsD7n6E6yvse9YiT+MjEqFMle8xNsB7fmWHfEZcQ/yYVy8WJ9sbVEoG0qGeqfdhjefTkcVFqRB45mYZdNDg5ZZvFxUr8itmzkCeBNWjfP6UuvU3K6meHigb5EOBFl0LZNZ4REI6t0TRojAPCJE/fIY1vDWJLdgfzRzzhnTjhhvIArs7BobAEJpYWCpfSxiy7/UtJvAYvLP5LFTXX5l5L+4NHuTxwPULBT7qv7pUCnUoswv1CTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GDf4I6Wh2pVF1A/Sg4Zrr4QZrkOtmtXdQyojIwKCkE=;
 b=XDFUyj+1SkA2nIGYMzvtrycvFeUWSdkJtaCNv6DnxBKMjjrSS5o3hrjLCNmGqrePOkFtC1vzrU6eNVd1ZjzH/AAi8RAqehtlWD6qjFf9IZk5PIptvQqAtQuYA8/7ti4rgmQfUvbuSaTr+0FnS0TaeLenJ21tpD+hJ8KW85RpMGTCOc+5Wo61sNdMlUK+CZP4Q3JoKu8eLyK7eS0xs5U2spArGgoPh71Vq+Yjioe3vZSJFhoevomBoMfUfBXBzElnAblO1hk22prs4m1pLMyFdFglECIe2rSPvJcIhR4qWFGq6Z56eyeNar06yP8qwcxPzNKMq4OddgNlL0lSdRq+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GDf4I6Wh2pVF1A/Sg4Zrr4QZrkOtmtXdQyojIwKCkE=;
 b=OgWO0YLUz2MLI1nfdcGnjx8lYJ4A2pBePKPfmW4AaXR2Czvqj8UFUTq8Lq5MYJBfUWHw+o9SGr+HhTAWGYs/zQOxLgFaDUH9PEWf44qGbbzCRSoVoW3FBK3RoAHfQP6SvWESAltO9Esle0jIJDhMQcCJ5w0texQOymGmLgpKDVn1dRO0gDR/7Mfek7pMuBz7qX67zhBnNK/AYbxn4yjWwt0N5hpoYrIXV887BWOImPlV/LxyOo9iXHayFHPBfFU8j7ZnCZ5P5g64yp2D2fg1o+8X5Ee047Ocv2JAxS8pHzoSdNu442t4uM3WZns2x/ixZ7vG9IuyE8qeZi3c9OuCiw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:50 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:50 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:48 +0200
Subject: [PATCH v7 9/9] arm64: dts: Add support for LX2160 Twins board in
 single configuration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-lx2160-pci-v7-9-09370c23b952@solid-run.com>
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|AMS0EPF000001A9:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cafac9-8e07-4a48-d62a-08deb9a46d8e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 sjdFmSOw8hreX5hbZCFoo0upX4IA/V2+IeHTh7CSQ1r6x2cdzjGJ8RAjN8KXCu5y+shoC8aDoNoRi8sMYHHzSWtjEWmbe7gOMzEDHAf8B+LMOQ0Cxv93jT2MG3l9gD/AQKEw1hjkKdxvLO6rPUrSx282V4N9My3M3+nD9NLIK2BY3fnGA6XZv/0HDWVyjXAdDrrSQEMnwwWskB0hgzNngdd6eoBWPmiXHbYqL3PVHbY4fk+gDOF3CtAlMaQPQXoVlcp1iZXjnfcUw9jxJVORumiXXJIUqIB9HoMV7xLgbpcdnB3q4ldcnmjEhCe7ZZhEumBleJzbYTgwK7f8RlXa6pSEgpql+UIVCN1DPOWe/M3SnT/6a9kUY8JxMRszuYOJr147RgCRaa06k4oZVP9UKw9JR8ayRwkLaItijVPq1SAlCWcBYuyJiZDs9Yn3dDZC+9IKgAzWjAaghzD/DYKiPLMPjghxO2wth67+ReLZRbo9NqwiCf791NhQxAX+684VO2d1Ay9oAJuOOUgIABtiJg5K42M3HBFD6T7x6AxG0+h4M2GnwGxZiSAVibFJFTMuDIfSltR4NegMf6CZeyWTZ2KDp/06XuRUnAU/otkNlE5LMQwtfe1z4IyNk5Rn6QPlerV09BlQHWaGbSn6ZdyxEbN+9Lc7LXidSvVGv0Lv/MmwxcSP2n7fMa9+G1vwJJdMJX2TXQGr+wUFevwXkEFSj/fGJG90V7OaSSBTY7ktpzcFs94n/Tvs+znyPhxlLnDCi0ivWfv6V7f8dHX5JoNGxA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 b1LBXf8dJp/sRCzLhmntmD3aAJyaZU/HOd4v3BO6EGK+B944g+fuaVx2vm0oEUhdJmrOIuxRCruyMJFT5MGkztjtV7OrBSPPjNClh0NGsMu7S7P+z9xG0hWOHWzDUabP8CxuRlSnQNT4JXh73HiYjlZoOrlNCU7afQYEiMmNW4ssDLqBeVHHJIT8knBjKSjpGzU9sLdDNYyc1D471qlagxOTXV+YVmq7WkHjL+kwZAq8Do0AYiJSUhDtfmBEdna1Tld/x/FxeLxDdNmOv25vhryS4UDw/+odCGKD8z6YP0UqiKktbpdH68gg5O2hb2R6NMfuqky/4gW4HNYDSWHqfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 519335ab46b149779d6fe7fe053eb7ba:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62c708a5-b831-426e-6a62-08deb9a467b4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|7416014|35042699022|82310400026|376014|36860700016|921020|6133799003|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1bq2f//UgykcHgM/LzonQKgLadXFobkOabt8ZI9aj+4qBvpze43sE3DrUBU7R6Bmli6q+gHuwc8Ywk9JOPspCv4IA/5r5mQm5HFFtUjJ3M5TmQa+tGUOIykxgMRHMSa7/jNIOdk3qJJ6EVihsHInzP3saJCeNWYwyF1yrqmgN1XP8dANIX21a/EoPuX9jxKGAU7w924eavwE/HtgqaLU8CvDYR95T6MSfq/lcEyc76JhwEtLobT2t+3+B2pRwX5QvLhjHLuDJLkobzLF0FGaTGyCjyMNLYdZ0ZqKcMhCr7nvth8Eq2P8ETNkYMH/tL/JqykjVAbd/BVA8Vkw/g5lvyX+mQqS6HpRgUgfvL3/gFhguDUHUQQjqSlSWrUos0W7XMy/zjLMSrEKionRV1QYk9eqKiywpymJuih0PvtRgnF3tXnJheg3uVKNObpmJSSPPwPPyJz+m3+wHTldpxRzIf7r/B9UudUwn01LfudmnBNfzJL5vaA5y9+BCq4nDeWVXzZrqWWcpmsOl3wmttzLoWhLMSn1g7ImgLQBtj6xyedNTJ63iVmqIJtxySAj88LujjKcSmqXmk23VWCaekT0u7Bssd4wvAKb0pEykIwwu/ab1REwnp7mqEVmSCuc7QLHtZPaE45j5qdoTt4uAQn2QfmCUCIZdeJcy0lLE4+iPixcf4Qa+DzwccpY3W63jzdH1G37PyITfYdt2o8AuxV/x8pUs8l2DNDyTdOA0eug/WPt56EgPPy1OiA8vsUxJERCJdPPuhZH6a25BU75D9DT2Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(7416014)(35042699022)(82310400026)(376014)(36860700016)(921020)(6133799003)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W3AA1vnozduA72AQrVjOHpp/3xPRHY/0qgj0nq+QTQLFDarstBRIoKsoACgTCnudZNiCZrKYWAOElBM/3+aqLRxERLe+GnQnmjBFvaO1vnBDwt+7KH0dbDOXS4UP+Yo06LO7dBXI8KuUJeDzmOhcZJ73iMVHCbndm/F9MEYw4PCZLRtPuA5dQ8eCY/uv7O9HvlAmJDGBAg0MiE+OiH9YfrCX21FBT55vFqLM8HNsLgcP8Mhc01ScJnjy0npcjR+Hvz4W0D0mixYJ2DJtLo/LEMJdBKfaluc8vGV9QWUd0BETSaQNSd1O9J7MPBk+na/Hk/roh88JOaKnV+swA4SkR5SUwqEvANc6wejP9ncogsW3sDlT9mn9qAJQhQsnC29J8ZTXIzIrRhCYJ3RhnasbYph9WZB9MG5y1HLWrJ87hgk8uC9RVFuMMgqyVy7BvmeD
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:59.6227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cafac9-8e07-4a48-d62a-08deb9a46d8e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025

Add support for the SolidRun LX2160A Twins board in its single cpu
configuration.

The twins board is designed to host a pair of LX2160A CEX-7 modules,
sharing a single PCI-E connector in multi-host mode.

It may be assembled in two configurations (different assembly options
facilitating signal re-routing), with a single or with dual CEX-7
module. Their marketing names are:

- SolidWAN Single LX2160
- SolidWAN Dual LX2160

This patch adds the single configuration, featuring:
- 8x SFP (1Gbps)
- 8x SFP+ (1/10Gbps)
- PCI-E OCP card connector
- USB-3.0 front-panel header with single port
- microSD
- dual hot-swappable power supplies

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   8 +-
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 830 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  24 +-
 4 files changed, 848 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..59eee431562ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -51,6 +51,8 @@ DTC_FLAGS_fsl-lx2160a-bluebox3-rev-a := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-bluebox3-rev-a.dtb
 DTC_FLAGS_fsl-lx2160a-clearfog-cx := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
+DTC_FLAGS_fsl-lx2160a-half-twins := -Wno-interrupt_map
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-half-twins.dtb
 DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
 DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 2c86734c39ab2..16caa281ece02 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -65,7 +65,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 
-		i2c@0 {
+		ddr_i2c: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -91,7 +91,7 @@ eeprom@57 {
 			};
 		};
 
-		i2c@1 {
+		fan_i2c: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -102,7 +102,7 @@ fan-temperature-ctrlr@18 {
 			};
 		};
 
-		i2c@2 {
+		power_i2c: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -113,7 +113,7 @@ regulator@5c {
 			};
 		};
 
-		i2c@3 {
+		i2c_smb: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
new file mode 100644
index 0000000000000..d16e273072754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -0,0 +1,830 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for single LX2160A CEX-7 on Twins board.
+//
+// Copyright 2022 SolidRun Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
+
+/ {
+	compatible = "solidrun,twins-single", "solidrun,lx2160a-cex7", "fsl,lx2160a";
+	model = "SolidRun LX2160A SolidWAN Single";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &expander0;
+		gpio5 = &expander1;
+		gpio6 = &expander2;
+		gpio7 = &expander3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c2;
+		i2c2 = &i2c4;
+		i2c3 = &fan_i2c;
+		i2c4 = &power_i2c;
+		i2c5 = &i2c_smb;
+		i2c6 = &sfp0_i2c;
+		i2c7 = &sfp1_i2c;
+		i2c8 = &sfp2_i2c;
+		i2c9 = &sfp3_i2c;
+		i2c10 = &twins_sfp_c1_at_i2c;
+		i2c11 = &twins_sfp_c1_ab_i2c;
+		i2c12 = &twins_sfp_c1_bt_i2c;
+		i2c13 = &twins_sfp_c1_bb_i2c;
+		i2c14 = &twins_sfp_c2_at_i2c;
+		i2c15 = &twins_sfp_c2_ab_i2c;
+		i2c16 = &twins_sfp_c2_bt_i2c;
+		i2c17 = &twins_sfp_c2_bb_i2c;
+		i2c18 = &twins_sfp_c3_at_i2c;
+		i2c19 = &twins_sfp_c3_ab_i2c;
+		i2c20 = &twins_sfp_c3_bt_i2c;
+		i2c21 = &twins_sfp_c3_bb_i2c;
+		i2c22 = &htwins_sfp_c3_at_i2c;
+		i2c23 = &htwins_sfp_c3_ab_i2c;
+		i2c24 = &htwins_sfp_c3_bt_i2c;
+		i2c25 = &htwins_sfp_c3_bb_i2c;
+		i2c26 = &ddr_i2c;
+		mmc0 = &esdhc0;
+		mmc1 = &esdhc1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_ht_c3_bt: led-sfp-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&expander3 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac5>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_bb: led-sfp-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&expander3 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac15>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_at: led-sfp-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
+			gpios = <&expander3 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac6>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_ab: led-sfp-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
+			gpios = <&expander3 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac11>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bt: led-sfp-9 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <9>;
+			gpios = <&expander1 4 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac4>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bb: led-sfp-10 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <10>;
+			gpios = <&expander1 3 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac17>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_at: led-sfp-11 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <11>;
+			gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac3>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_ab: led-sfp-12 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <12>;
+			gpios = <&expander1 2 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac12>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bt: led-sfp-13 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <13>;
+			gpios = <&expander1 10 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac8>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bb: led-sfp-14 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <14>;
+			gpios = <&expander1 9 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac16>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_at: led-sfp-15 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <15>;
+			gpios = <&expander1 5 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac7>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_ab: led-sfp-16 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <16>;
+			gpios = <&expander1 6 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac18>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bt: led-sfp-17 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <17>;
+			gpios = <&expander1 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac10>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bb: led-sfp-18 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <18>;
+			gpios = <&expander1 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac14>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_at: led-sfp-19 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <19>;
+			gpios = <&expander1 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac9>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_ab: led-sfp-20 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <20>;
+			gpios = <&expander1 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac13>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-status {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <0>;
+			gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-status-twin {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led-fault {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <0>;
+			gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+			panic-indicator;
+		};
+
+		led-fault-twin {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <1>;
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * This gpio controlled mux can route the tacho signals of 6 PWM FAN connectors
+		 * to the tacho inputs of both CEX-7 modules (twins).
+		 *
+		 * The first twin controls this mux and monitors four fan connectors, two intended
+		 * for itself, and two for the OCP card.
+		 *
+		 * The second twin monitors only two fan connectors intended for itself.
+		 *
+		 * The table below maps selector GPIO states to monitored fan connector per twin:
+		 *
+		 * | SEL1 | SEL0 | Twin 1 | Twin 2 |
+		 * | ---: | ---: | :------| ------ |
+		 * |    0 |    0 | J10    |  J5024 |
+		 * |    0 |    1 | J5016  |  J5024 |
+		 * |    1 |    0 | J5026  |  J5025 |
+		 * |    1 |    1 | J5013  |  J5025 |
+		 */
+		mux-gpios = <&expander0 8 GPIO_ACTIVE_HIGH>, /* SEL0 */
+			    <&expander0 15 GPIO_ACTIVE_HIGH>; /* SEL1 */
+	};
+
+	ht_c3_bt_sfp: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 13 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_bb_sfp: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 14 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_at_sfp: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 11 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_ab_sfp: sfp-4 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 12 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bt_sfp: sfp-9 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 3 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bb_sfp: sfp-10 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 4 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_at_sfp: sfp-11 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_ab_sfp: sfp-12 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 2 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bt_sfp: sfp-13 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 9 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bb_sfp: sfp-14 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 10 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_at_sfp: sfp-15 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 5 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_ab_sfp: sfp-16 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 6 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bt_sfp: sfp-17 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 13 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bb_sfp: sfp-18 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_at_sfp: sfp-19 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 11 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_ab_sfp: sfp-20 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+	};
+};
+
+/*
+ * This board supports industrial grade temperatures,
+ * the LX2160A SoC maximum junction temperature is 105°C.
+ *
+ * Raise thermal thresholds to allow operation near maximum temperature.
+ */
+&ccn_dpaa_alert {
+	temperature = <100000>;
+};
+
+&ccn_dpaa_crit {
+	temperature = <105000>;
+};
+
+&cluster2_3_alert {
+	temperature = <100000>;
+};
+
+&cluster2_3_crit {
+	temperature = <105000>;
+};
+
+&cluster4_alert {
+	temperature = <100000>;
+};
+
+&cluster4_crit {
+	temperature = <105000>;
+};
+
+&cluster5_alert {
+	temperature = <100000>;
+};
+
+&cluster5_crit {
+	temperature = <105000>;
+};
+
+&cluster6_7_alert {
+	temperature = <100000>;
+};
+
+&cluster6_7_crit {
+	temperature = <105000>;
+};
+
+&dce_qbman_alert {
+	temperature = <100000>;
+};
+
+&dce_qbman_crit {
+	temperature = <105000>;
+};
+
+/* sfp port 11 */
+&dpmac3 {
+	managed = "in-band-status";
+	phys = <&serdes_1 7>;
+	sfp = <&c1_at_sfp>;
+};
+
+/* sfp port 9 */
+&dpmac4 {
+	managed = "in-band-status";
+	phys = <&serdes_1 6>;
+	sfp = <&c1_bt_sfp>;
+};
+
+/* sfp port 1 */
+&dpmac5 {
+	managed = "in-band-status";
+	phys = <&serdes_1 5>;
+	sfp = <&ht_c3_bt_sfp>;
+};
+
+/* sfp port 3 */
+&dpmac6 {
+	managed = "in-band-status";
+	phys = <&serdes_1 4>;
+	sfp = <&ht_c3_at_sfp>;
+};
+
+/* sfp port 15 */
+&dpmac7 {
+	managed = "in-band-status";
+	phys = <&serdes_1 3>;
+	sfp = <&c2_at_sfp>;
+};
+
+/* sfp port 13 */
+&dpmac8 {
+	managed = "in-band-status";
+	phys = <&serdes_1 2>;
+	sfp = <&c2_bt_sfp>;
+};
+
+/* sfp port 19 */
+&dpmac9 {
+	managed = "in-band-status";
+	phys = <&serdes_1 1>;
+	sfp = <&c3_at_sfp>;
+};
+
+/* sfp port 17 */
+&dpmac10 {
+	managed = "in-band-status";
+	phys = <&serdes_1 0>;
+	sfp = <&c3_bt_sfp>;
+};
+
+/* sfp port 4 */
+&dpmac11 {
+	managed = "in-band-status";
+	phys = <&serdes_2 0>;
+	sfp = <&ht_c3_ab_sfp>;
+};
+
+/* sfp port 12 */
+&dpmac12 {
+	managed = "in-band-status";
+	phys = <&serdes_2 1>;
+	sfp = <&c1_ab_sfp>;
+};
+
+/* sfp port 20 */
+&dpmac13 {
+	managed = "in-band-status";
+	phys = <&serdes_2 6>;
+	sfp = <&c3_ab_sfp>;
+};
+
+/* sfp port 18 */
+&dpmac14 {
+	managed = "in-band-status";
+	phys = <&serdes_2 7>;
+	sfp = <&c3_bb_sfp>;
+};
+
+/* sfp port 2 */
+&dpmac15 {
+	managed = "in-band-status";
+	phys = <&serdes_2 4>;
+	sfp = <&ht_c3_bb_sfp>;
+};
+
+/* sfp port 14 */
+&dpmac16 {
+	managed = "in-band-status";
+	phys = <&serdes_2 5>;
+	sfp = <&c2_bb_sfp>;
+};
+
+/* sfp port 10 */
+&dpmac17 {
+	/* override connection to on-COM phy */
+	/delete-property/ phy-handle;
+	/delete-property/ phy-connection-type;
+	managed = "in-band-status";
+	phys = <&serdes_2 2>;
+	sfp = <&c1_bb_sfp>;
+};
+
+/* sfp port 16 */
+&dpmac18 {
+	managed = "in-band-status";
+	phys = <&serdes_2 3>;
+	sfp = <&c2_ab_sfp>;
+};
+
+&esdhc0 {
+	pinctrl-0 = <&esdhc0_cd_wp_pins>, <&esdhc0_cmd_data30_clk_vsel_pins>;
+	pinctrl-names = "default";
+	/*
+	 * Disable 1.8V modes so that microsd state is same between
+	 * power-on-reset, u-boot and linux.
+	 * This avoids sporadic read errors after hard reset with some cards.
+	 */
+	no-1-8-v;
+	status = "okay";
+};
+
+&i2c2 {
+	expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	/* Half twins configuration; take over c3 from the other twin side */
+	i2c-mux@73 {
+		compatible = "nxp,pca9547";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		htwins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9547";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c1_at_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_ab_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bt_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bb_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_at_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_ab_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9547";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c2_bt_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_bb_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&pcie5 {
+	status = "okay";
+};
+
+&pcs_mdio3 {
+	status = "okay";
+};
+
+&pcs_mdio4 {
+	status = "okay";
+};
+
+&pcs_mdio5 {
+	status = "okay";
+};
+
+&pcs_mdio6 {
+	status = "okay";
+};
+
+&pcs_mdio7 {
+	status = "okay";
+};
+
+&pcs_mdio8 {
+	status = "okay";
+};
+
+&pcs_mdio9 {
+	status = "okay";
+};
+
+&pcs_mdio10 {
+	status = "okay";
+};
+
+&pcs_mdio11 {
+	status = "okay";
+};
+
+&pcs_mdio12 {
+	status = "okay";
+};
+
+&pcs_mdio13 {
+	status = "okay";
+};
+
+&pcs_mdio14 {
+	status = "okay";
+};
+
+&pcs_mdio15 {
+	status = "okay";
+};
+
+&pcs_mdio16 {
+	status = "okay";
+};
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
+&rgmii_phy1 {
+	/*
+	 * COM has a phy at address 1 connected to SoC Ethernet Controller 1.
+	 * It competes for WRIOP MAC17, and no connector has been wired.
+	 */
+	status = "disabled";
+};
+
+&serdes_2 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&wriop_alert {
+	temperature = <100000>;
+};
+
+&wriop_crit {
+	temperature = <105000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 479982948ee53..1d73abffa6b72 100644
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

