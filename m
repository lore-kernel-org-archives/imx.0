Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1492246781
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932986; cv=fail; b=opXLQDQ1H3Oh7jDvodf8AvoBNZ2uL/2zNkxkdE/VbeVEXuYGP9toAhtOhpUKkYnebB3Wk/NkqFtCjJ9o00ygHZxfih2WvP1ASOrTl+51IOnnKrRhfH5fqknEpUvjyTX45wEZMIqWlnM6FpeKH1r6PKxtOV6S8lqF5DmLHFrmlaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932986; c=relaxed/simple;
	bh=ktLO2U3RgdPt5lYhIRMfCrvwwRjAYIu/aZvbbj31e3I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GnetlEeY3tFgHJeB6g+dbYJMrau8I7y6NcqiEWlDbOYI7UVCHScw4y0gO/UC9mnJ1Ya8vkigthA1YBhm/geoF2BhyvupeEs6uKHTv1CjdNiGn2q8evoRTdUQvUnTQY21iQhAE0WhMdoAEaO44Jvo9KdyTIi43VCpo7suKBgWxxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tm8yY2fb; arc=fail smtp.client-ip=52.101.66.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tm8yY2fb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r43dpvfd1ni3rOqF68+Ytp2KJH002wrcMrch6C52YU2fEAOTWNErXy0lGwTvPISeql4TIih2FIX8Eir4xFPgqOR5X1m46KE7IXB2HEWrWjTnTUPR3UM+BNYzEQH6i4ZxHdH1JRwZst/wlEtiiBgrzqmmPB3czb4Xeb6BRWCvpUO+x97UYXdS/cjHgubfhfqhM5itzxuwiQJgr1UI5yVkA3F11dGSI386bFTTLF323RQ2J3rPEEgkNF2OVVJPLFmf1OaSEF6cV0SlOHtF0cvsbBiHk4a3qTTzT6Mo6eBWd3s1ungqRuTvsAAS2SPKQJ5JmHG+yLI0FHZr6gI33vQQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fYMwvjzbZh4vaDbXgmd3oHIh2PbxySYQQ0iF6v8rsQ=;
 b=nRG9JtLytfMr63ovGgryiesNfgjsr+sg3/CYl5JBrhisbFzA/pB2ncnzI+GUQS18xpwhEi331DXld9y8pEihTA5srAYJQHlk10qNkZ3G22t29F82tlkZIHTkTjF1aKt84OtGAlcHcKXFKWilHxV0XtkhW20R4CDMX0xQqsKmtNwu38tPdHUcgeOcBL1TOL5FRyICmnSnK05TTNY5tlwS/hE/9mnUMFsJGLKOOvhuZuAkQJOeaTPcSfe4Y/7RAuAYZp/8CUpo3MeUJlNTE5pw3nK/HauZ6Q08S6J3cUIbErHwkjiovWGkAreToPIflXskoRMkQpfwRcExCoD16dGnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fYMwvjzbZh4vaDbXgmd3oHIh2PbxySYQQ0iF6v8rsQ=;
 b=tm8yY2fbu9JfVz3MBi4U3+7d+K6vrV+eRuME2xt7aKKf+5SGaXCEze0hiaAOwjH/e49B3QNCCS+bCjPFKMUCOmeZ4MWl0kFax02OIrbfOCVbhULFZwU2arlWG7LAMhgVWXBcbsbRxsF+b/5yzjpZhNZ2wKS0zJd+w5oJ8PEZRAwtJOdGxQwRB5IY82Kmoa1EvrWf5+B7zq80v7Pf1JCZvC3KV8Vud3+jSmy5i+pJJZuuYLE6CQyWFLaqSQnZW2CJsv8Cq6Plm72UxyIy9/kaC58/E9JTcKXq45ft6ufLNL2XI9w0y16GzZTpXiTfW2ZyiGua98ZXyDrKuhT9kJPRRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:36:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:36:21 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX arm64 defconfig change for v7.2
Date: Mon,  8 Jun 2026 11:36:13 -0400
Message-ID: <20260608153615.2274186-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:806:d2::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: dac0dc55-6fa0-4cd8-af52-08dec573b0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rOJvN/xJQG7nI1+SQLvsEQw5gzdRtjj7KbKCPu+g58vlKR+v+VqsBEBP1HuPq2aOlR0nYpEM7Q4d3zid8QV4Z85uYpc7Gdtf9WXYJF/QEHPSlt0WCyLGz5QdDcPWd5Sf+DdUhlW3ZtGPmWum82B9YSjB62KxJLb7pyOtAmwxdMcPL0VLm0EMt8JGRIabQM9PCG6ERZoowcMY+idLFEQeyBJaIMIxgtDiRSLIQta175a8DOidAVtjBaP23H35CxdUvhdLArEKMu34TbiHSiyTaK9Mo6BVPLDkvUNfr1gdESEDiwcgTRiqv2nrsSRsTw9Oj56ydnAMWSwB1niQvUlUWj+fc0oilwPW9eyVt+XkWHkd8XXp5T1p2unmIVIFSP5iJIQtumwM95nzEZ/zvQXSXL4XfPEBSr6vzFSR73FSXibB+qL62ioijjhVtRBoRiO0d7LBad96nFLZjcgKb81RKK7MRlEo/dMVy4A89oqQMQgzdJP5+a6iqDM2kbfwSQBfj4hel5nGHXJQ8GQITsq19gGX0RxCnV342U+PEoZ0LRij1rT73M99b2YK/Z3L8j6Qh1Ym5z6qafnPUAHM8vY3gVLHxOZ6wekFldrctEaQod87UbO+DBM410vNfc29gSnnkQLnwZd2RoDGo69+WH4zr8eL9RD5lVYN42oiUl0kadSXQ0RCSNiaFeEPowgTP0q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZHafqIJtoc75mpf/Zna6Nu3u4Vtmc06FqAJMsq3OIKIyHOsPysvmTHQTYCmn?=
 =?us-ascii?Q?HK3hyuIKEatsT88VhjCLWqiVgitgkNEP8G68QOxR50yTIrspmJ3ppi7EFpwL?=
 =?us-ascii?Q?admQMn2rUZO5a+TmtPDxFechCFFi7ZsuWlR1gNz10e9TleorTS5ROrfZyQ2C?=
 =?us-ascii?Q?SXZYNBxriDy3nkdr33Isop+qYDUYWmSpnk/WoK/nrc7bw+dFaOzbWFfYo0O1?=
 =?us-ascii?Q?LsuChHl+alLg0/p/cjxy8nldZf9ET5BPcokWq4XOpCiDxlVZH28S+5NlAqBs?=
 =?us-ascii?Q?NoS2yG/Gt6BHOV9qDVPg+R4llQZ/Z+Jlg6VotddeCbh1YNsc7G7dGTxDJjx5?=
 =?us-ascii?Q?RU7rcaERt3kinrGpQsCBk8XC2apj+PLXvAka7IMYUStb6EFIzL8IoZ0XzJ4E?=
 =?us-ascii?Q?nr2Dfsllt5OQ+3OORr1GeeGPLZM16xzgExfoqJaoiZ3OdLfFAqPnkjGx/KBW?=
 =?us-ascii?Q?8sTxZgQON/sKxpgBFIKNlf5F6LLd7r9iAXUcRuKKANk1XVuWrhfwsvPpI+89?=
 =?us-ascii?Q?iriVkhqffRPXT0Jw0rsZg+s/PxU6bZenW7b6gqOKYQrcQeM2bwm5nQq1C3QB?=
 =?us-ascii?Q?xKP4gbmM/ET6w6yQjEil5o3AhrA3rmNhiAzxvPRkFfHaJ8/HLPhxAD53DYds?=
 =?us-ascii?Q?YeV8scM0LOo4YGHDyv6O6yG/sGuRNRj2hS1iCiwY+B7Ko08D5gDpSGDZ9Tum?=
 =?us-ascii?Q?5d59VZMYjCVctd9ImjOEeN9h8oD5hucOu8bZs1nkBsz0GZHfOngJy3YvHT/L?=
 =?us-ascii?Q?jlcGQHsboCaohoG/SZFwG6N5ewwRGN5A/kRF+ViYXe6LCM3Z2M8tDwDFDtEb?=
 =?us-ascii?Q?mfZFjM0Nh5LYpJCH5uO3Iv3/3xI1fYYZDG3dAqsg3KiaNW3Tdn+sljeANgeU?=
 =?us-ascii?Q?IqmKrsl0fvzSi/8VBXX8FIUVeXdnx6VqKNE6kd5HfXly3LjIEP64agKo9vfk?=
 =?us-ascii?Q?8mr/DuzB5783ddmBbs0+ejQv9p2BeuSgJTR4GO4BZOYyQ1M3SAAzKmdgyt3/?=
 =?us-ascii?Q?x+ydQZOruXj99/Eh49Zi+UIzdtR0xwuoTuCR+ZjW6jCejmmM4BKDFzz36/3o?=
 =?us-ascii?Q?lkKL4N3LwKcGayguMuozCeT2npu4kjfimuYLsSj+TXBhp2rSBu4pdPioNfuT?=
 =?us-ascii?Q?fIlHFlhkA+77HTXERmuTZGPZEojfD1E4eHV4eK2iEOwN91fWNgVkR6XEzI2E?=
 =?us-ascii?Q?72aGg3G+p2AdLtE9wj/678ZYQsaGIRawnXyjD2jzNPgpEo7oUjYbQtKYdnNc?=
 =?us-ascii?Q?P2MjD2U+8tFtrgLFtigCt1zWzt0xKIZx3HAsAM/w54mIqMI+hBPfpgxRzuGb?=
 =?us-ascii?Q?RRCAjlNF5c7LvvquJZxXr3vEREnSZSzmS/ngr+ZGbjHD/vJgOxwjnyX0G7A9?=
 =?us-ascii?Q?e0yqV+c5y3cpb9Kf+uzWsAaYlboTVYXeIVlpZAmpoF6SpuWypVXQ/WMLJ+Do?=
 =?us-ascii?Q?gRnOd9zY8EXHPoEQlaW7gN4Bq1tOa3PleIro0BB0ZwuCA8WGDlh7t6bYawT1?=
 =?us-ascii?Q?cvyLtlRk4YnT/lfM87M/qRmm7NEmCNJhdIxrFnErDo9kYbtQs2+N40aHKR9q?=
 =?us-ascii?Q?MCkAGi2PfT0pCgP23R/pjTWrl5dsA17c/hWaobk6hSjySm3Zb8X2EOA2sqcm?=
 =?us-ascii?Q?wVdVfHTJ9Ec8iNdISgL+GeOK1Oq6M2vxmq8D3CHC9zc013W91td9W+R/C5Iq?=
 =?us-ascii?Q?sUMO3ZXe6yFKlkY97bN3svwlUBaB3rYniRWtLJKyOJ1luvZYsosxlNgqC/UF?=
 =?us-ascii?Q?hYIiNbcADRj7B+Ecx1F/ZJn2igmi5R1KJoEFvacAWoipA2JxaLdv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac0dc55-6fa0-4cd8-af52-08dec573b0db
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:36:21.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQYx0IK5HgtT40+SjNYNQp53YuoJfyLdHKelJ4Ri0csTUoddo4K9s2LKHHiJ5ZuHBB524fYy7tC7g1wV6z5Z+RP3farI/ZVkL1g/JSVgG88tp+0+PEchiepWOSr8mCjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-defconfig-7.2

for you to fetch changes up to 27b93b1a2857586bc422994bf1b9f986841edeb3:

  arm64: defconfig: Enable DP83822 PHY driver (2026-06-05 13:25:31 -0400)

----------------------------------------------------------------
i.MX arm64 defconfig for v7.2

- Enable DP83822 PHY driver.

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: Enable DP83822 PHY driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
