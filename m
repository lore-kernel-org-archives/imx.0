Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021114.outbound.protection.outlook.com [52.101.65.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71599397E73
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.114
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634502; cv=fail; b=JgLRyvaQ5GmKYLVc2QwS/EGboJhjw3gtmkB91ShBJ8FF2nwaALbxiPBcHkX1EMB6ahV+XiERZ1iZk4uoESyVxMQF8j27KfoAc+Du5fGdyIcTdbQZLfj7Q9Pvs/kAVoIjcMrRvBJKzHYYwkOqzkUYvu52+Yk7O6Ygxjp9taaibvo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634502; c=relaxed/simple;
	bh=EiwPVMPlR/6PI3ee4I0nWPL+wLLQXu4YaQtH71uH0Gs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mj1ubi0aVoy1aOAEfRrBE3rbQaw0gfNE3oiqwkA3pg2ms1ipN+XAOrUNB60knOXp6tfAacXKO4zpcTWAAQAIci+kNeWL6XxW+ztE2HL1K+s2tSC3KN64Qom9DCFE9EWYffienSoXYveSLccLadpFLk4EEmO8s0zk1zME8uPBs04=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=h8A5rYp9; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=h8A5rYp9; arc=fail smtp.client-ip=52.101.65.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="h8A5rYp9";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="h8A5rYp9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=imBGTwrEL0FpbPPEe8Tt2Jsww85on/TeNPFOrPG8GNupd78i1Y+F7ybbuEF6osgSjF2po+P6UCMxV8FdALZqMcPC5lsZ6OCwG0eFWAaLMkVB5SnCgoSAZqJg6ggR9rFxFdsW8ZxEij4Fzz088Txwtpwjn9DdY+GoLR9thknSB4acDf3oHxRBHTTNwUFsZjdUmaOP41DT1MWssQ8hNAUDEQ/NQDniAfg0IQrvpx6nQyU6PxDp/6SvhxYJCLun/cS1cHCvA/DkGVlea+xZarBNTqHuxwoeO1SBiNv3Yqd4C3jAXr5x6FsWt8UuVEivr3SikLUuoxFMNXXF2mLobqx69Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=mNmut+QFrt5u8H+/RAUkAlxPYatyRwmviDsT8dcM9ooBt3qu98r9P4BjJifO1TRuWvZ0dUg6bRPU0W6TzRKfBq6mlgAz+8kzKKR52Q8uIUL6ws1qTtHewYmoh927dp0g80Xq2r4UVMv4YytGuAwOlYKh97q311qpnLN56byoEXDcJKaZqA3u/I77VJW2EHRI2JecnVJNi1YzHFUYEzWqCnoT57e0hL2ibcI1VjS5AKUWDjsygujRzypSTyWgZrqQ2n3URdCbzz9u75BK8XHuyzTiqVPU9dJ2j55eM/DkxwQjKo4AadU4/NarafzdX3+Wn2Y2NtiDiQJsJWQqA1x2Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=h8A5rYp9Uyz/iD04RkTiTQwN1B/5EoyFoLKAv/U69vpUsMwnpPYEd/pIs6kLRLEKRROvTruvgcbfsfDNDJf1/TOyHAOOUXZkUOaasnp6cBzQ6hwidGBZHWAcQ87r28cSjKg9JeJcfG79PKmBF+SQWevk9dEgZmWQrEEzNKsdLXnfxi4Lv6JUKDYaSflZ+JoJw4EmNTYO5K6DToKTAN8p3brU13AllyExDTHfddbh0tj5zvDpXw8Hi/15lKPozJHSqTGWgS7tpd5rPCAYsTi1/AvrXRShbjfyatC0XG403k4mBAf/L/jhoo9u1YPAD7gMkY8E5eRNk2+4ZnAQN0mnDA==
Received: from DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) by VI1PR04MB6928.eurprd04.prod.outlook.com
 (2603:10a6:803:12e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:56 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::61) by DUZPR01CA0001.outlook.office365.com
 (2603:10a6:10:3c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:55 +0000
Received: from emails-1172150-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7804E7FD6D;
	Sun, 24 May 2026 14:54:55 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:47 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKgZQyIslH0n4UQRGbSrtNOVT2WyZ/l2TOFINnsCGtNN+a+gFCRMbJtxLdVvZLWaAqIezSl5kfHmdsrsmD6LUtorU2fO7JrbI7Z/RXWD0JuVt73YXysQWlT+qFgJdxj0wbYuIL7xZVtbXFzdTOggg7kmevEfyfDwNQPXoPcq4SuXeKABbiJQBdkm0nyZ2pMH/vD7CI7nNbafcGfWdERzQ0mLnZs5aw0OwnokGAaNGkxmxcp0rATeaEATsqouIQZg85I3eUuyaNLu2YdjIlyj3T56DHWiuI74hwRpKUwtBnp5ltoc27rO855Qi50LKMFifYGgnzE7tXLV27kFo+jJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=P/29jtu0sQkKQ51x7yGzg83uWIUdSxQBEFYJ4vEDza/jjPgE3HgMLADYYzFZawgPrCPG6F1Rlx/Q1YCtqXP9JJZE1iu00Cmx3GHBj3sb2VDRLWIPo5IsPcgL0S1KALozhalcXS5UChcYTtOsLhBcIoK48/t3USpiW+yG3UzE+2svbjUafKdCdx03oHbJiI8uo4tDEUChT2SK21sFRaBI4Xof98zj4LJmcbujfs6bB43j47FzcnoDew1JXAGvsLEf84UbA6V8ep3Qs92kdfW3W4ij2jJpteZKVKaUlzds7AKeXzCsAwTe5+K/q29wrNTtQFy4SFR4sa/uriaoGH3ljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=h8A5rYp9Uyz/iD04RkTiTQwN1B/5EoyFoLKAv/U69vpUsMwnpPYEd/pIs6kLRLEKRROvTruvgcbfsfDNDJf1/TOyHAOOUXZkUOaasnp6cBzQ6hwidGBZHWAcQ87r28cSjKg9JeJcfG79PKmBF+SQWevk9dEgZmWQrEEzNKsdLXnfxi4Lv6JUKDYaSflZ+JoJw4EmNTYO5K6DToKTAN8p3brU13AllyExDTHfddbh0tj5zvDpXw8Hi/15lKPozJHSqTGWgS7tpd5rPCAYsTi1/AvrXRShbjfyatC0XG403k4mBAf/L/jhoo9u1YPAD7gMkY8E5eRNk2+4ZnAQN0mnDA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:44 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:44 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:42 +0200
Subject: [PATCH v7 3/9] arm64: dts: lx2162a-clearfog: cleanup superfluous
 status properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-3-09370c23b952@solid-run.com>
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
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|DB1PEPF0003922D:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 437a71e6-9d63-429e-21ef-08deb9a46b19
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 t2UuZX8T91V14+mgq+2mpTcIUuO3WM3Z2Qqc8oN20dt8wpb9Z7fxESxyzzAyM7AoNWrAl7Qw7wN5f1AKykEB7OjVAF9a5kZ9ht+0Cobvh9/9qOUxDPx/laE5v9JbKXT8ZFHb1TEgFu9bw8R8jFZOY1aGaqwsZp5H4vqB7pTYL1NfIAB0XdF855o2VY7IdHG6qNPaGQbf9YBqUF24qPdxsqhawmGtFF4wcK2ABujBDolT+HAq1sP25Hdvts2d7xWoD967bpzTiQFbju+IGpNwfr99mnmtvDAwZtqZWqYQcKd7DYZge4QVgg5T8HvlsA/kYvCIUYCTK78oll+u/9e4DYA+xaQB+K2/geBZH9zpzTisMTV1uFIghJdg3v+zQFsgB4rUKxhdfqXhGLi7JsncgTnbzQG3Q8cgK421jXDfhGqXL5aENq5XUzbabBZ2E2pVYkb5xzh3bNsx4yQQUNEILfRxK6Z1uujIsW4XH50D11KDsWGy4laoL7gP+iw4LO2i0aQSwQJPdBd9idioXfjP1WHKLkjiwuTCq/ElCMxqc+HPzfyboi2jygtnCft0rBV6Qn2dx5h3l1U78/1Xf93kjS8hmFZ7nvv5JYJoBmgZlvs9N4fAlbEW0nSJ/pi/zsWUHksC28jdSCZkTv2qArsTQas3SuBGePvq3HwjpGOIlETJHIAegBezM+egZYzjtjTV6E8/qmuBBwv3J8XsUQ7o6NKWmQKJ2N4sIbsXE1Ti6Q4OJo89CDoPr10iTFqciooBEXRQ/cNoxwM3bjlvGr1rVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ajcy5wgnChjXnyfxyRgRjHwTv2GVIjHZv6xtcJshrJRN5YvKDvy5AnzgQp8PJZWbR+hLubuDnz4Vx9BdIsLGSwENS9jtObqxFlVVmki3NJi1iiwa5I5bN3d/0DEAeBrTDIMTqBJU33KSHlbiChTuAKr/Dx6qnOxmGUvWyU5rqYWz3fSmdbP2Z1TOXHUo7LDB/o0ZkXgZOVe+Cci17wvTUm6pyPlZRZV0spb2Gw3PL+l9xPOclmMqemcVcQWPyVRoy+Qkv/HDUw6kPRaOCGUPn1i+BP2WKTgJs0EZcrqtfrE8i6wCYwICt7GAsl9m3oK93iSLHQHx+NuiM7z4U+H6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 60364840e77f4ddd883d2496012fba78:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c932c135-a7c8-444f-ca58-08deb9a464a3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|376014|7416014|35042699022|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	ot0y0vaoTPJRIOkauFwt6hPnrCd4efWlZbBMhp2+L8sWp5uP6JCUM/uxPkcUzIkJmdARdck/8nsuSt1FJ3CQYtWm6STUbIYpPZ7N+cNRm4Z4DGbO/GZuSqG2CWDR0Tcc2WoLYlseWIqYywpYXgTAorjPQCUA6wcp/9GiBzthwb9tjaxAXuJ+7cPg8z2K9BTQtFyc+vN23QbNpMtapmgr50jhUKRbEwPb9yJBILVIRjzWaeupYQEQy+0hDl6X6x7sX63dyvoeytrA5plSJc+Xk5ViF5SSVa84Nkjz/DBYhnr14l2qcigfpa5QCoPRH5h0Ri5gkv7detxxImQeiOvTf2LA+V419TkBdMeDlkfdrwcnmFjlaTnaRP7lZtJW7OCTcv8nLBTt2f47M5n4/KtP141N+ste8VAVbhzCmKr8lqeBWd3dRs5qS/W+/FmyEEBbYgBE037js4NhHIhkMSBy3QvJFfBHVzJTI3np+/dpZPHTxKK2e4vut6cyDTVDrIP9i5uWxqKEKonh+ubRX6riK2Fc4KlwwX2QbCEy1T/ufmPNWRSr6d8Dk53EJTVaES7o1KVM0BxX9cyL4fKfqZjDo9PlKfzM4+Nd6VtK3Bg5OSYX9kH5zgoZKUVoISWBU0F/nLjw1z5Ye54V6v9ehXpylUtSTiNjT27cv3wRC13QLDgAzEHv5ut66oHJAvTjMzTqTC7JVO7iIvSqH4Dd3v7L9/Q7rF4T4eMgfgDdl6S9cAIasUDTDrQbxTqxnvb/mtkdG0i+cLiYNT4YzhZPuDcm9Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(376014)(7416014)(35042699022)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KfXZjOAi6HM16OjSnD2kNQG7yynmmMmyGExwT8ZAbz5b3HNZhMP88NOva/y2rrbcn92MbE9oQ/osG0a6CDV7zZxP8qTTtMDDKgXGH/iWUO5fnh+zYxImDMOpSjexLPKbsJzZPzsdWkOGlk0x+YmJc/hs9UKE8TVLJlBlCu5lV0+0gZvhqnDvTBsSnpt0qrb6VXEOX6uLB07O01BL6sm6/erOEWZ0YqdEsSIeax4FpA82R8yzqAAA7HISyGdVQ+EKE6OYBG/8Yw/U3V2VqfGlD2WCT7KgwjIPoUptupdbpsp+DKT1JXBdBq8jKHh80hFtTr4WWoeZR+J5ZWXB2olAjEGhQx1/y/lf7rRAOOl31XK15i8qAEMe8Ro2FPNQEj0SOzWltStuIe2KHlSYOQ0K6YMYCeMkr7tv1y/gE1UqOAOzvtT2JTBZI86eL1AMqaUF
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:55.5316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 437a71e6-9d63-429e-21ef-08deb9a46b19
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928

The SoC dtsi has always enabled serdes block 1, enabled dpmac and
disabled pcie nodes.

Drop the superfluous status properties on these nodes.

Further drop crypto alias as SoM dtsi already set it.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts     | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index f95e9c19bfc75..6fd85a5cac94e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -14,7 +14,6 @@ / {
 	compatible = "solidrun,lx2162a-clearfog", "solidrun,lx2162a-som", "fsl,lx2160a";
 
 	aliases {
-		crypto = &crypto;
 		i2c0 = &i2c0;
 		i2c1 = &i2c2;
 		i2c2 = &i2c4;
@@ -124,42 +123,36 @@ &dpmac11 {
 	phys = <&serdes_2 0>;
 	phy-handle = <&ethernet_phy3>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac12 {
 	phys = <&serdes_2 1>;
 	phy-handle = <&ethernet_phy1>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac13 {
 	phys = <&serdes_2 6>;
 	phy-handle = <&ethernet_phy6>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac14 {
 	phys = <&serdes_2 7>;
 	phy-handle = <&ethernet_phy8>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac15 {
 	phys = <&serdes_2 4>;
 	phy-handle = <&ethernet_phy4>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac16 {
 	phys = <&serdes_2 5>;
 	phy-handle = <&ethernet_phy2>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac17 {
@@ -170,14 +163,12 @@ &dpmac17 {
 	phys = <&serdes_2 2>;
 	phy-handle = <&ethernet_phy5>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac18 {
 	phys = <&serdes_2 3>;
 	phy-handle = <&ethernet_phy7>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &emdio1 {
@@ -314,14 +305,6 @@ pcieclk_i2c: i2c@2 {
 	};
 };
 
-&pcie3 {
-	status = "disabled";
-};
-
-&pcie4 {
-	status = "disabled";
-};
-
 &pcs_mdio3 {
 	status = "okay";
 };
@@ -370,10 +353,6 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
-&serdes_1 {
-	status = "okay";
-};
-
 &serdes_2 {
 	status = "okay";
 };

-- 
2.51.0

