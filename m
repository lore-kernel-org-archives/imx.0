Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023119.outbound.protection.outlook.com [52.101.83.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E790843E9E9
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.119
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123812; cv=fail; b=leOJ2l20yNcZQ9NSwG7IzBlS6nxW10vT4Yjr5+dpBa5ba6bJQWxr0ZRJpgRuQqkDoW+m9rwjaSuTA8Vf0vVRhYpu2OOhVMBNO3t2upFZlmSnVBC9spz7dWRAwLPgy1ynmcdTo/yAMriqV/NJBnYpC1bcqP2l3KjEY9uWp7F3VzI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123812; c=relaxed/simple;
	bh=SRmFx0QtLDZuUnAWPGWgLNercF2ivnukuL3p68NHaLQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AfRNlgtjAMV9XgG3AcK4n931dwBaUY0rULZ5d+NGhGa+klvUG28lz4EasbQqHUFpEv54KCr7tDQ0by4MLG9kehOygdC+3mOPeIdxK2fkXiI/no1sn08xm6y7Shm6iv1w7Nz2U6vKQMhNmRNMlrDexaH4nBofyUpE9Rj4snWqht8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=iYtpCID/; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=iYtpCID/; arc=fail smtp.client-ip=52.101.83.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="iYtpCID/";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="iYtpCID/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DCSMcgZb2PhpdVCgxaVBthtsVgLcy84+etZ5G84x4bdr/1ULGiRHBwboFu2HzoumcY1eQtkk1FClRcUI283UosXfHZbkwF/1lj7llvpIhl3C6WkzSneCfE+Gy6SLetz4RTdcaemVQHJ0X5/pBSKGmXlIa0OsI3v/xQyA9M17ZGKpfx+wPbemLMx/1D2zW+rsvl4W++uShsbaPcNmskIx2QNJsg8uYd8FkekUR5abAEAIMsLq9w40rhNpaf7ljw2GbkfFWIcx0WjMepjSLTYA1xSmB5lTd5cC0R3u/I6KUCt7rA0fc6HTfVw+xp5/kS0EHOV8iiJWQLA6Pc55OCHJTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwPS27pltrXxDEZlv9hVtR7ndByENZSXju56C3GiUyA=;
 b=l6N330ZJtVWFyQibb+zSbjZljenStUfbO3WsyOmjsNm9Oigzukqi4UDCx0Ed6wUonh2Q1OQNf8IwAUjyT50SPhXWbl8FrScJEeIw9OpOCn36lzipOu4IcJ7RAWBAOMcM9eDNoW0ayziI5PybgLxAVOJUtFvCe8mjX6EuANc/ID9ay8ziApDIZsiAwnboVHjgbydrIJniFgflhrp3E94O0/lOCioseE/pvQFzH2lVkq/ZRL2neXy279/WSFRPtJrm9foi+ECAwVE4T3stjrlxjRmK8Snkqk5R45UkKLvVD1TMk/Ns/neOa8lhdNtaNSKYaUGQI3HHEaULpD+vqksY3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwPS27pltrXxDEZlv9hVtR7ndByENZSXju56C3GiUyA=;
 b=iYtpCID/nXjY56+U1TNE3/hAG26nGwDfMc8URMyCFjDw7+IjbjpZQsvX5ZNtJB4b8aLn5ERrQOM4iWxW/OF1zHiwv04CFN0+FjfSWywDp6E9j7lsIMbR2FA/vVpPxaCa4uH1/Nf0d7Rl35JZTF5zPcatnLE4OU4SXUF5EMPbsfE=
Received: from DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) by AM0PR04MB6835.eurprd04.prod.outlook.com
 (2603:10a6:208:180::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:47 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::cb) by DU7PR01CA0041.outlook.office365.com
 (2603:10a6:10:50e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:36:47 +0000
Received: from emails-6509700-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1FCF280794;
	Thu, 26 Feb 2026 16:36:47 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:41 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXa/qpsuSUEVIpPrLgySXlU3OxSwg7udvbWT+t45IqfO7LS0Wg7suD02KJ6m8WkPeugN/n79HyrEnSpFuWQsX7zBB1/HzK1lQO/s8exkuTu/X1sBLD+5HczTVF7r4YuX82QX9dHJKHq0Y6WDYuCJj5zKTPZzguEsKMKTSfsUDjHTWj3xkGn3MhnbaEh0FKeh8MnAltX3PWTr5hsl4UeRdNck7kYZYEqbe9FH5HgH+GSNVawRZ7lxNjSwc+EI8ktI57EHP2VFxIJnol0CEZxXL2pYVwVbeif3vGbUKSTEylznVXJc6ez/46UoSUXsujFmZZ9Sb1o8TDpjCnJmJ2IEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwPS27pltrXxDEZlv9hVtR7ndByENZSXju56C3GiUyA=;
 b=ENopS50/76cnOpZt/7ygJNXEDD5dRXFPfCNHWgb8bARMbmX71Enn0WghcA/2S52NVRxAz1vmrjg7hPHRkbT/xlNBKyMwz3qEhr5yingwDmDKacR89+dPmuXS8f8HAY4i4H4oXhxuUNrybpZMbIct2su8bcbxx84Z6zUUKSQQaoeWHUq+NByRLabGKHifUVgcPVPKoMDTF5tO1B42bKzJMPuUVpRh2G89+GbwJ8BkbFkU/z+5T5mhIDoVdDUI8e5ZAZux/+SUKkQuXbjymJci8evDr7HlE6LWCzK9AHgfZdw963+1HMgQzbnaEWsbgL6Bnzl9WjOgFjWzdXKrsmubaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwPS27pltrXxDEZlv9hVtR7ndByENZSXju56C3GiUyA=;
 b=iYtpCID/nXjY56+U1TNE3/hAG26nGwDfMc8URMyCFjDw7+IjbjpZQsvX5ZNtJB4b8aLn5ERrQOM4iWxW/OF1zHiwv04CFN0+FjfSWywDp6E9j7lsIMbR2FA/vVpPxaCa4uH1/Nf0d7Rl35JZTF5zPcatnLE4OU4SXUF5EMPbsfE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:35 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:35 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v9 0/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Thu, 26 Feb 2026 18:36:29 +0200
Message-Id: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI52oGkC/6XQTWrDMBAF4KsErauiGVmylFXvUbqw/mpBbQU7N
 SnBd+84EGJid9XlG5iPx7uyMQ45jux4uLIhTnnMpadgXw7Mt03/GXkOlBkKVCBQ89xdTHfireM
 5lzNXqJyQLsZGI6On0xBTvtzA9w/KbR7PZfi5+RMs1ztVP1MTcMG1kcloqWoD5m0sXznw4bt/9
 aVjCzfhgwCxJZCIYFDKEIO1Nu4RckXAlpBEuARN5ZNKjdklqgeBAjZERYSSJATtEVzaI9Sd0AJ
 2CLW0kNo6jMKLepfQ/yfqFQFmQ9RExEQraQD7xxZmReCWMERYXelG0lo+Vc/EPM+/tOH+/oUCA
 AA=
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
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
	AM9PR04MB8747:EE_|AM9PR04MB8081:EE_|DU6PEPF0000B61B:EE_|AM0PR04MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 204c6db8-274c-4911-94ec-08de75553bfe
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 ZxYjD0CYf57SrJ55asvKzfMK1X0YICBHS3yIY/A5ZQ+Mc2gvQ0nXZJGFxzoUhEUC6vgLoea6HgZ4C9939X3Um3dkJRifkS1rFnARdN9HYBfDkcjJez1Pgw0OKu7zXF9EhaZUtujY4CB4SkPZUW0VI6jvq2gYYdfL42fSBOgj81nqMxksOqBw86enMYv7bZg7aYoCYVXQE/KKWXnoN1fubbfZizgsBJdmGeQBlls/QXK1pEDMK4jNmxXDLMGtvMIB3AZ8VXo935VWqNDUCb7UoOpSyulQ7SCkmLMlnGlIR74tq3QcqMZSiwa3sUdcLyu6jM2G/oTBhO+fo53CZDNJ3Dpw98VshV0L52ynBo7iXgZJv7kC8RpgnstLR/vZXJK+F8C/vPfR+VKWbCHRkMyTx/RZEmAzqniYdSQ2J0pnKbS8ywvQELYA7V+IHOmo88mm5oLXEvFAMS4z3iniVwEuiG4pTblFskbVeWwsWsoN/l2czb/ACtdwWVRkwQJxcZcsePNrsNH3A/n3Xp7Lze+K8XFSnellpRsLapkLmB2zTX09fHaxBUaO8vy2j88zixzp///+qqCsA7zWRt2l2JW4uyveszQED4voV7Yqlmq2KOL9h1bmFxWMiwOR5xk31eND9dF2ClhtTNGrT7485Ot8Ri6i33pRybpe+fRtMIttNryowf4Id8PbeBOPoH/49JY2sWQQZcZBUrH8RLy/poAf2ib1/4PrE2zi9k6hj6Gt19OjT/qm+s7GtoaA5P3xD+bI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d0b09068edf04cba8a65c912051bf7e6:solidrun,office365_emails,sent,inline:10942ff6038381d3ca8c2fa350b4a692
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	adca5c08-7f2c-4a01-2e98-08de755534e2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|36860700013|82310400026|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	PT0XZhPPh2MHnoYzNiFW6FYVxELQnhO0HVUBNnRgBIiAhKhmQO1ZXuCqiooPbPZX+3Z/Ux/W06fDTBpAJR6yfQk26Ih04CL9g1fXZbn0fLzlj3mbxYAhAXCaziCk5Hm0tqIBLybxRn5Do46XIUuN/10eTwLC/xKY1OXAi68VCjDMbaycHd2X97mvr3p9DcCBG6VNINmN/YNC4kD8IuZTxteG7T0rf28c0n/cmHYRlqI0UxqI5Gfx8j+Hlp0mhAJ6iZWR/b5GsluXLqf+W2V9rak4e8fBNT6N9bVz1Crod1d5VzP8mhFLCiRTYSHVE2d6331bD+aNLvlz8BrbCWKmqY4H8prNsSY1T8IC5PnAfmZRDIcpJiR0w378vQOqUXsD8nu8HZumc1NrZd6BKcBjTCpx3I8J70WjsTBseyshwr4tN8aeLi7CL5RRMG0PStx4p30xv6zh8zEWGNPx77bxfohgVNOS61zK+x7kd1bSmDosIl3KBlIITIwpOWpym+zwsHjTbr4qqeUvGPObW5LBCRHu5vSupiz75DZZ5dLjMPLBl8aZnyZjhjrUyj2juNA19BOF265PYFXDggABy784w7iJ95S6ntMVNOd/pg/2jUK4DtYvzOO0FoYrBKlzSZsZJlvDOkoXOy8QZlaa9fbPGqO7rBa6tfsNUIsiak4M/57LD152yXVWnpeyIP1/rLbfAIULdFeJuEZ75N5ctMoEOjUqFFtyLqC/7K8CKRYC+GaRcpEqBbGNPbH5xnduyiyX9rDvhGDpH18PFjR965pfaawFzRI/vfpfGvVjOEm0Jfk=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(36860700013)(82310400026)(14060799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Et9C6NDwk+BM12thsYhxeYRmeOU5HdjDbZrYc7Svjn2MMi3+It6mhbp7agtrKUQAQMXdUSkELj9kRZGpUFJrFd6vS6GdvGBTMlL3qsOk1GZyxUx2XMkcnSsV2p7a05OrC4C9nzSw+dsyUzI8u1hsxhhyzz1O/PhIE33QpjaE1V+J4gHceT34ctp05PEzMt8vKWxsM/ST9KVUcpVqVZypS2nF5nvkrtADLNUyZmMTgTrdE/B0KDwTmCMORMbSjzXQ6ne9j/5AIQvoVxWvR/yHyMGHXmwbKGYVkaoXFn5mDhQ4yobjnHDuUbWHmjPisyC02uzsXdNtXrjK34lEXpmlHu/Mx4erEIODsJE8u6Pg3VHnWvxDPTgO5cTQeqp2uMvZ7iaTvO/QtrvLSSVedp8WXOudEIPk6j5NOjOjlENFMJhv2vzC/JCEKF+0Mgun1tkd
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:47.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 204c6db8-274c-4911-94ec-08de75553bfe
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6835

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referencing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v9:
- rephrase mini-hdmi patch commit description.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- combined 2 gpio muxes for can-bus into single mux, as they are on the
  same electrical path and should be selected together.
- rebase on v7.0-rc1
- Link to v8: https://lore.kernel.org/r/20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com

Changes in v8:
- sorted most dt nodes by name.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded hb-iiot commit description.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- reworded commit description changing dtc-flags for imx8mp-sr-som based
  boards.
- set DTC_FLAGS before dtb in Makefiles.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- fixed spelling and missing paragraph separation for mini-hdmi patch.
  (Reported-by: Frank Li <Frank.li@nxp.com>)
- Link to v7: https://lore.kernel.org/r/20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com

Changes in v7:
- updated Makefile to apply each addon to the base dtb, for better
  coverage at build-time and dtbs_check.
  Fixes Rob Hering bot warnings.
- Fixed subject version prefix (v6 was prefixed with v5)
- Link to v6: https://lore.kernel.org/r/20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com

Changes in v6:
- imx8mm-hb-ripple: sorted i2c devices by address;
  removed unnecessary newline.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- hb-iiot dts: sorted aliases alphabetically;
  fixed gpio flags for vmmc regulator;
  specified led@3 reg field in hexadecimal.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- Link to v5: https://lore.kernel.org/r/20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com

Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (8):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for SolidRun i.MX8MP HummingBoard IIoT
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  23 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 712 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 13 files changed, 2539 insertions(+), 9 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

