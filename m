Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154041F03C9
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322570; cv=fail; b=GLvVf94+ftGgYC7/JN5xDwA4D4uJegNmIlTubU4shFZ3FK/IwEEEZOd0+t0iG/1fO2TvBLP80TMn/9622fxZljVM/mYxU/kUluDPuWh90mZuoBv53nrTMf9Nm6GIRZqbkWrPxMePh6KP86jqhDZq8iHLVQkBv/P8mIIJXr36CW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322570; c=relaxed/simple;
	bh=0/L+u7vFzX4U3zfy2lwkSfGeb47qLGjBpwzS64tllag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IYitJnOTSkIq82elFqCWfUddRqmYlMRZXQScoj3p6Lvmogj/xx9EzCBIrKuH3HSLEQANkHSN0zW6h3PC0QNy9Hki+z1Y9Et3ByZcg7UdgWldQyFCnHYPmD3MDKxDXAmcCw7KlFWONCZadqfuHSWTqm+lyOQ6VhF22jAeIZ1XMxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d8NMyTR2; arc=fail smtp.client-ip=40.107.21.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d8NMyTR2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWl6UbXsdqpPPWdc41aIFxafHMZPSkaQsP95k1yoPEjCAQVpfySKI8QZeF8tOG0vCF6Gy4hQXTw1FZFYutNg8J4ShYVRx2YU1ive+/fgixkVx2PW8W/QicZhc9kEANyX5b8UaNPnsDMfitXN1Raom58ncHx/yV4cnvxwlo2ewZmLmE09um1DajunDv3kaKVbB2438ljlHNqx6GBlCt6DYkapQyl8rz2mph1t8U4ou09YJCF3ICFsLdqLsl1lWtmR3pGpaD0WeMwA8hSO4GPlDqtWw5TlGCVoS5Hdx6wGGLqqHyAYT8lOWA4BPqcLOdt05wnstEFj1TS/SWW7LQ+aWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+SC0787Igbs/uoYI40LihUyk+0EtOYBUPfCtsX3JLs=;
 b=xJKqjk2CZy2quRaNkYipOiOfdzkt7VNj5DJGCFohqCcQhsxt/8e+ZOjrHXpI+Pf+VUn9Lo65V05pdtebh1jCbhMJLHkMvXUhLDVUb/or8s/bY5H9FlH3NHOjXSxNr5lJKNlni08YawdImqJC+DEaYY7SuPXTtQWXAMIgLVLfnw2/pfs4NRZoWSdshH6epXNE/MWsGUsUAA9FnpJA6355053hrYBKuT5eopn6FEoF8Ldka+o5QmHyuBOHBVLmPmGJBvbpYFp1oAoqj+5bq7xuzGPDIS8WCdQU08aTIEYE8GOH32csdskJrtWOcLLXUqYWxao96S2xE4vtI4v0uqb+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+SC0787Igbs/uoYI40LihUyk+0EtOYBUPfCtsX3JLs=;
 b=d8NMyTR2qSvhGJ9XvE9Ghy54RPibjSakwhYmYarVcB6z+b9rvBnMtBflgyinMSQKGm6ZVl63MwdrkmOzO+qBOpjYgZ/MgeacIGZut1N7F1E4dQMuoRbPaFui1JBNiPiFfWb88orZbxd8hFIVALCxvHuSGF+CZh2N+vt1OtPkk/adH8q311XU0k7Pc5aNPLSKp85uQew8UvgSQPgp//quBqYP5zUpOh6HgZfljsJMULISwjUfQuMzHEZmFaXd3r8x25jBaBGgy4KQnCl4UQP6Y7FMFkR1w2xFZz1NKD+nrSJteXrjT4yNFxaSJV9qkMZVcJUkDVh8if/H0xLKbA7Iyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7736.eurprd04.prod.outlook.com (2603:10a6:20b:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 11:49:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 11:49:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 4/4] extcon: ptn5150: Support USB role switch via connector fwnode
Date: Tue, 22 Apr 2025 19:50:55 +0800
Message-Id: <20250422115055.575753-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422115055.575753-1-xu.yang_2@nxp.com>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6281c132-856e-476a-9abe-08dd8193b9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aUnDcqZ7JDjC3/4SKJ8T2WTGPwJOD8dDluOzSKbs2aUbtfI4fBcYj3f+yB7j?=
 =?us-ascii?Q?CHNOHOtYFFWKR4DVb6C4fl6QgASpr/s/oAHHuMEF1nIAYpEimE4IW/UmQkS0?=
 =?us-ascii?Q?4XHljQ90KKbHrz5Vdv+6g6y3HOuZ2eWO3bdse6UPBVgz7cUBE2TubUDD8IjF?=
 =?us-ascii?Q?2AnaOXhi/VC2re5k7zIuOthZM2uQnsoYTdbbPUzZ4IfoDPwO/nM2AF+/mXaK?=
 =?us-ascii?Q?g39DwJK6k15hT2XVfSvHjs2k0x86ySVKKzmZWEC4bYHUxK2eZWbGOWVF+eV9?=
 =?us-ascii?Q?YixxjfkcLvXMhU1bhqCsSDfXY6Roh1KJuS72iec34a46Oq1cKVXAqiysi6CA?=
 =?us-ascii?Q?p+IumbgF3T7X/MeJR3CBL2G5P/3U3wAL+NJWNtvwetTLDvoTjk6oJyYhmmGs?=
 =?us-ascii?Q?kldTUmGe6wu3g4zaAU4bxExwRvaA/ohZdjGlon1WkS1MZD7qULAriTGDtSGz?=
 =?us-ascii?Q?W6AE7SOET1n6i88sKQszZ1eVdjPygZTfaVYqkuwHnqcgrp5g7U3bhBtWxbi3?=
 =?us-ascii?Q?di0tq/5eoUCH4fRI2Pi9n7Jhctu5KWZ7euNYgQss+9F0taHMTVMMt9GBUhtj?=
 =?us-ascii?Q?7/1CwXinOxkXkswdofdDsq9mjGFKfMnz4EtkbHg6r2RyMZ2HmhWYxhZu3qqP?=
 =?us-ascii?Q?Artz/pOxYwS3rq8nfgqnUfjL9MrbFspw3pj7+i4hLs3wWmFdV1dc9e3Hz0O9?=
 =?us-ascii?Q?AFDOFpfJ1uKWOw5dQAN2w2hAF/wjZpfj0BOWn29Mrfj1EDma8BqbGHmmItpI?=
 =?us-ascii?Q?ilnD2gV+qes7sud/oibblCmjPynhzYoY4U7XDTX2czT1zPFCsWV3FODt06C8?=
 =?us-ascii?Q?jgDCxvR/LrWnA0eMx59NSCMm3Az3tEChKV0pIufeKfmD4MO7JXd7WkxMfiEf?=
 =?us-ascii?Q?Y8BkrkUXziLEEWG4Ridm+nPyNR/nthicGcZ4OnIHtgj03bVYxz7W5c/dCt9o?=
 =?us-ascii?Q?6BWsffou5IQHTNrQt6dvReLjQA28LuBbF4y4KqbLsQm7BAsm5x7v0CkFYcNh?=
 =?us-ascii?Q?9L2mrn69s7mY8vWasckkHayp0qf3aPDgmwXanCQ0y3F4YhY/sSvlMZqkVdun?=
 =?us-ascii?Q?j47e+WV0w9kRcf9wvGB5KC1pt5kpneNTuZ7KpuX2PPUpR+j/OWWhyYO2nuUw?=
 =?us-ascii?Q?4MaMwhPn0+4OXvhGf0Zjayv5Xb+Ogsi40RNCEc4hlwqin+ZS4MJncpJFRDer?=
 =?us-ascii?Q?8gxdDrnljKg95I6qI9jDvsL1j1ywvO3iII040oLwQqqUpAI5QbpR2fVAlqf9?=
 =?us-ascii?Q?vXJ4hDv5aKWEca9nqXUe+YeOEouCdniQtG8YsAprsMQVb4ZF4h72SSu8QwJw?=
 =?us-ascii?Q?Y1kAyiENm0YF+9irag+RXWLCwfeHGMaNkUkzgkuWT0cX9yujEcosB3Nk26Gw?=
 =?us-ascii?Q?jaHdk/OmXxHsvG2VJPoUyQkU5dMC/8+oHeZoD9KzTtNx/l+N30NLn7AeC14Z?=
 =?us-ascii?Q?aSoazlhomMc6plQyf5lWfib62EhCnnGU1WL9o1wfjb7SfMozWUFSsZNcTWyz?=
 =?us-ascii?Q?xGQSekZ0C9FcPhI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y2cfB8C0QZNcEknpGkonqitxBJU93XsUy7IY+qf+UgMTPmN6lVjF+eeRSU3U?=
 =?us-ascii?Q?Oc3M/Nj3+EzlOmMXBmH40FzDG/w8QDKe0JxUfsJRW8y/luU401kTZPGoQ3fX?=
 =?us-ascii?Q?ulXTNlPOhW6dzPjKrSJSpFRbxg7CT9I8qY/E0oP3keCQoiI0PB86T/bqUwTQ?=
 =?us-ascii?Q?VYqXc7IFB/hWTB2YlZ4vq8dqkuXWLAaVduqKfPbz4Cm6NGsBaj0pgrSxLv2i?=
 =?us-ascii?Q?heqUztxfSgUIyjGpnoem6A+IrY6dAUP08FAHc5glE8WtSWYt7p2Ca2CQcbtf?=
 =?us-ascii?Q?jMN5p8OIv1yEd9f7MkVQzMlREmb37ziTzrgSueQqXAftvUSZHblD5/BLYUgd?=
 =?us-ascii?Q?doI8rqOMWBMoDlL2vCKVwmaYvW7MEzRSUoJ7QYwCohB/KOUzqfnBpz+juaMI?=
 =?us-ascii?Q?kU0Som9geZdfwU0iNEc1rvcSfid3te/46YESNX4MYZkzRLcbbgz7tIAk4V3Q?=
 =?us-ascii?Q?dMfFBN2+tSW7ybNavNvhTws8E+g6IYeBG3kW56VLMSnP9JMIgjf1XJbF9YMT?=
 =?us-ascii?Q?BKkqRt6NlnJ8b0NbXvjuZ7pKJa+NqVdyL59ghk1LJVhzjAwLBzrylFyccbzS?=
 =?us-ascii?Q?tWnRHtrNC+nphJNHPWwXBjnJKSW8phMYLEKerqc6s4lfzgV9n5+qgTBkKWH6?=
 =?us-ascii?Q?+vg5QZ/caMnYKXGpRJNbwFxq+xxguTJcSPgK+ZGM0llO4lb8rYjFXPPsM3cl?=
 =?us-ascii?Q?Zm9iiA0gQ7ukBK3YCROi3HuWLg58Lv21heKePPL1LNhFMgXXYTh00xyqotqo?=
 =?us-ascii?Q?GUFZzHLYnOtH6Mruq0ug1DYkU3yEJoI6xtrvxN05Dh/j7yTUBUewr6OtbVwM?=
 =?us-ascii?Q?9d1CkGFGbRmkLtHZ1pJYvsY6MrXIXjfM+QldWOf+Pao27FZDTqMa2feBZNI8?=
 =?us-ascii?Q?I2dyBqAY8RI3rESsXvbAFOP+lVJXlUXBSoJHtQfe0FYkzT+1GC9I9gMksyeO?=
 =?us-ascii?Q?/M0GEZDgy2YmOGf9P8PoyPleyLHbO4uAmkN/CwnDkpGC4K2oKOpllLghVVuB?=
 =?us-ascii?Q?1B3AyzaKrwl7hWtcw8dUkOQLeCCFh3XH0AB+pSurZomSdzD/mMl/vii1DRi5?=
 =?us-ascii?Q?F3KYqov04KX7c1wqFdz/GTYPARyJbIRsp3S19cVAgfBezcFZ91U1912ZIzmz?=
 =?us-ascii?Q?Zd/CTM/r+LNqVim44268ZW/MO9gT0dGcPri+/5CBF7ZcjhImmEOTnaYQ0TEh?=
 =?us-ascii?Q?zw6Xc/B1LbzJ4UnOY8JbC/9X1m7lM7QPRY+dRAGZ0pPdUCKV+x3bV/W4b3CO?=
 =?us-ascii?Q?0S0x5dCSMEft8w0R/Z4kyqDankQhh31ifaa6L7cPbRnRmOhUecQTDD9drkkE?=
 =?us-ascii?Q?fbbvqzWXMQZezEGqNDG+PF7d+tJSlp8ZN2qKfXhf18BAU3dILH09jG+VQGLB?=
 =?us-ascii?Q?WvtIdTUrOwPHhuFcY2XORs6hzoSzzqEj5qQMhONCXtKiXhf6NvH6taMh6IXs?=
 =?us-ascii?Q?NftSbkIRZyqokGvheQpZme8QqRwEva6VQt3xVTLQ0dtoBZE3qa3gccPBWFft?=
 =?us-ascii?Q?A3I5bqzLygx1561Avcebwq/axb2B1jOJmR8JGX4/BKSqVxxOU0FJ4to5sxrY?=
 =?us-ascii?Q?TvmG1yn/Tjg0Jb1r0y5XB6TCkR9WuXqe4iwEaASt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6281c132-856e-476a-9abe-08dd8193b9fe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:49:24.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eu+VkjpQumcknSo76P/YEsWINEpHmK8tnBuc/XiVAiu4r1MQ4YAi7i4RfA6IZXUScNFYwhnf35gLlwMKC8ISDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

Since the PTN5150 is a Type-C chip, it's common to describe related
properties under the connector node. To align with this, the port
node will be located under the connector node in the future.

To support this layout, retrieve the USB role switch using the
connector's fwnode. For compatibility with existing device trees,
keep the usb_role_switch_get() function.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
---
 drivers/extcon/extcon-ptn5150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 768428d306ce..f33f80e103c2 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	}
 
 	info->role_sw = usb_role_switch_get(info->dev);
+	if (!info->role_sw && connector)
+		info->role_sw = fwnode_usb_role_switch_get(connector);
 	if (IS_ERR(info->role_sw))
 		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
 				     "failed to get role switch\n");
-- 
2.34.1

