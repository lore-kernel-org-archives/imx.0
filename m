Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540615;
	b=OvwlOFvh8zcxJF4znAuh+7yJ6C8EzujC2P2VwgGQgn3QA4mnYUNTcLjiAybiywnco/Z7
	 wlM4aA4NLmBba92dpn2LokcOf72vFMpgUk4UWuFKqfpUa/foooS9CXws5rcKbEFf4Bfg3
	 e74YQ+xJbxVbN5i+6upeEQ0GIkft5MDlpqeZEEio1S7lIIEScsosvXRu0Q4HLcdk7nsFT
	 IBMrXyYkL1EuSIY1g+7cTdQU3vT+ogYl89tEEbh48h/WGoqNurzSynJ+A4ulZ4EkHTFDk
	 QN7bxi31YfsvcIp/USMPEPNRk4IIUXYTm5MCjL9kAly9b6cKsHJzVQXpIUjsdDSkraQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540615;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=veBGWXq8mVCh/DhUjBV74gzOj1Qacucshwj4hHh6ASg=;
	b=ZeEJjY7wIaN+imDeyt/nYy1cqyQzIMLLVLsmySlN4cxMMDxvD31OyPZnqA4yDoVTMNS9
	 yFY8+74AQ/wOHwMOlGpPD6jNOnJR8Vlxv+6O5jy7TF7XY16exbDQ27zuDEAsPAt3/ImKj
	 9nkf1C1uCwCfdZVCWSrjh/iGQk6SwiH1rRw6m2yABBB2ZWiYBbM/BF+kIydi5+gDfGErX
	 Dx1Au1enoCdZ+L9r7TLEkt5qodAxgxOCMb9BCc/9kPHjjSW0SuZ3G99TnpqkrY7Ae/Eir
	 4kHrqzZG0yoQ+eNA7Md/oAoergyMRCK3QgIMlGIXbYmM4tIZhOilTblFxjLZQsQcFaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IWlTTCgC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.29
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF0606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 17:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IWlTTCgC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8EiY8XLa31HGoLSvQryn+M0wTWEgk0mKvtQ+UTAQUmKYQ21L0ANN6yBqsPTRYiTxuBvRujYFfgTOT475dimZUFjbrrw0CJQRCLjA8khEqHBBsSNnMPY4ImX4BxSsFuzLchK7aC1JWw4vq78GrHCOOjhrwnB+WAiPwTmS9txT/JZCUajsFnmQ4AS7n/k3txQ18cLap0tIWkKXsccP3Ki1BRXVN/K2EisXbva8SX34UkQ9dJG/glIyWISsXlWhJXLktaUXz8BYdH/DULdeA1eXJ5ea1QiMI2rwfhXKGuxcpd4eUxIHQCNROaefSTiXs9eK2spwILR2d1EDHvRanS+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veBGWXq8mVCh/DhUjBV74gzOj1Qacucshwj4hHh6ASg=;
 b=FxGtIYqbmQU//eLToJW2HGfeUumfSwwV3T/RL0pMBps7gWOM29Tz7NRq0CwZsJletwf4anGWreIdHhmS0N5aTnC86cZ/GQ02TB+woq0/P6SJee/Lf//iIkW1NORaGhxWGJjK0YgvGohr85IMkaZMqkB2IPcIdWF8A6tIefle91lB30qSBmVqWcoFy2L+gHMEPKLVNhUhCWrNNV5DhkzaSa7iRbanFXLNUKei5PNIktePK/mrfCKaorjAMJvQN6RIbshTuDiynCL6nmSzX9Xg64a0un6BQCyzpecv0a2pnpaPxkfZ7hNKSphT2WVUEifANY+gS7G14l+SS69rtcMwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veBGWXq8mVCh/DhUjBV74gzOj1Qacucshwj4hHh6ASg=;
 b=IWlTTCgCd23UqgqqE17BcrmOgiZ+asVL3EkOkJVMxZrqc3VnC7VzntzpE7kxufqvHj8n0kxzDaTeDf5eGEgni1VuTv05ZM5P0ow0QxqSJsSWnPbKpl9PnPI9ZKc+ZTMOgEbWl5fs3qg1phwEYbyXiEh4vrwUQ+qXiAvd6BW0vTZW6/WMJSDwfCL1M1gNvu6g4i8p0BcR5IGX545cZI8FPyvIer9k0Y1ms1fcTQq03A/+a70ACT39Ivg7Q6nhpKsREEF5D8XOlKjW78TNV2Xb0mDeY/GYVcF4/lAAlGV90hd3RHKHwtbgZctGx7QTnriun570LquAVdcS2owj5ma/Ig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by GVXPR04MB11692.eurprd04.prod.outlook.com
 (2603:10a6:150:2e5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:16:48 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:16:48 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	francesco.dolcini@toradex.com
Subject: [GIT PULL] MAINTAINERS: imx: update for 7.5
Date: Tue, 24 Nov 2026 12:16:37 -0500
Message-ID: <20261124171640.715928-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:510:4::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|GVXPR04MB11692:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d107097-0937-4d93-f07d-08df4a4eb8a2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|18002099003|261009223027099003|261026121527099003|10067099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	NX+qfAs9/EISAxQ5D0XxNtGW0mX+ubJJmPrHr92PTSJc19RTJrLt+/HmSGlWOgNM7czbcpWATXjuXzEJeYJx7PDfIeGOqt/YKjvdDpLsoW0xHb+cUNwrNCXoJZWY5pBnYWZevYT4fVxqLjMXSk7eklXvrCjaoW7F/GV81pPaxnJja8uLSOWsQSk/mf+PRbXa14lEax/kRIXrhzhUwUhOJyit91MZmVkiC+NrNK14gJb8POI5sU1MHQxdN08v2RW8rzLd0jv13DnJDKBLlx6pKZNVIBKj7PXUVZXA3R6HK3Up70ddfxealfFpR5jnKHvTfOXiz+CWE29JQEgzgwJC8vMdNIRSiTRdEU2eLMRBseFXc2CuYCNhPhQ8V+9pqRjSWqAKrQbn63ffdfhX9NPEaQ7QodTjwFlPePVI4gd9u/pjKF5+haoIxQcYcY6IykhKzhn8I919g4Vo+LAKaqBRS1GHCXnz/tyM3wT3TA5pSwbmKmj4B0IRggCXMa4/ZdOhFW1Y+tp1wXP7fX2m0WkquLAyEk6xzLa8kpyzgkHc7EJz9X/mse+vsJ7K7pzo7/O+7ADFtjHzNRFpA12MyYxSg0S5rnXl8j9iBLnfR5zT0LzFGBa+YtoypcUgektnjvtO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(18002099003)(261009223027099003)(261026121527099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3yzhZeHdBlFk26NNMG7664Ag9ki1hf8PjS+3PEFuLv4f7qYs61mikRXzb0MJ?=
 =?us-ascii?Q?Gzwc2nk5nRpYlEuvHApv4BWS+8yym4Er/xXbSY4SThwA9xpu/InQPlc9hZJR?=
 =?us-ascii?Q?VRDTu8ATQpjwRD8Xgj4dq7m6hNWG/SKNruSHhCTcOIanz26Hy/z+pmoZIdx8?=
 =?us-ascii?Q?Z16ZXp4FiM2QZdHNfLEaUlm2GbS6ZDQZP4yRdULRg6zzz7Kuxdsr/A5P9OU6?=
 =?us-ascii?Q?oebMiJ2jdLoNh3/12/Ijwh+fzvZuYoRlD7V8xHsWGnZ9q3CoW47JahPrE56x?=
 =?us-ascii?Q?e6QmjZI8r1/xru4J63hMqNd8XbKsZgsNCqF+VQrxYMjaeEqQ93RNwGzHbkni?=
 =?us-ascii?Q?ol4GYtCdoJixrpRDSNoxNcyDMCW0ZIsxHYywUJkgS5oSpRcqc/BhoCG9wvgG?=
 =?us-ascii?Q?pZ4/yZr7RaDOIgnG/4SHY/hVZScDAAC/vAq9Zm/IL2YradolzmdTeXM8g61m?=
 =?us-ascii?Q?TUzMgm/hWnMw1cCVhdd1wAhmu57cyQDWmgNN29mw1FrzUvxDNrYEySOvpXVB?=
 =?us-ascii?Q?QKtLRvbU+jwqgN2JFaaIgIzVuAI/4QuAVebcNmtuBzZioBnxvwmF08t7uuNB?=
 =?us-ascii?Q?rI6CnDSqUA5pB7PV5ltUzs4skzdyilL1jYkyQ1w0ci+nliqZ18qpdCqpk7Ut?=
 =?us-ascii?Q?tjcycU+3iSDxxNirbdQndng4N9fXHF91SfpdhD/sA+DytLWJu/LFfvm9/49F?=
 =?us-ascii?Q?61wHDPjvx5apTREPmeXdSKAKk9wZcHeGQAoZDD7TCyL/KHR113+gx0SlnMgD?=
 =?us-ascii?Q?ZL1g/LXv7tkTa/EhuIqcqjPr78CfnpH8xlCcC/6jMshH+nDFD+e83LbJsSEb?=
 =?us-ascii?Q?9VTLs1JaYQsxsghA8rk6K6M2BiCadLhL9pqlXGx19a7FcD1TuB0gF6COcJKK?=
 =?us-ascii?Q?nKrrKsJ4oE9/2O/M5Ihnt6YicQvhZk8oW+H+IhmAu+pC4MWerSbiaQS3pRPI?=
 =?us-ascii?Q?XNtORbPOKb0WHOr/8EszrByaR2P4DEljU6n/fwi8MC0i87tNwooT6/ii7EZp?=
 =?us-ascii?Q?t8R81TVdcF9Gx5fS9b4EZ7Zh2fBCNYeteShSKs+RyBgTifzlSfZh4EOmvZ5+?=
 =?us-ascii?Q?uss0V/cxR2M/snuSPnVtoVVeqxunDzY7p0aUUb+cBbaGeEfHDsQvYWQ2/bZQ?=
 =?us-ascii?Q?5Md1k6wKdu5pHpvnqwKTaqC5rtO2piqGXiRupnzOjIIINWxk3TJG9EJcQ56n?=
 =?us-ascii?Q?o1uJu0l2P+0EHCpzC2hZM45UpvPfD9x1zGx6RLc1KB+BVEX2eLipoJqZ9xTc?=
 =?us-ascii?Q?xsqDcl3pKjmasGJf/MtVMzx9VCGaWwC8NqzMycOBESNb147X2b8jXR2m5Zsn?=
 =?us-ascii?Q?IyrySNWBoTsBdQG+vY2CiecEHJUcvrz/MtIE+SmLGpI0H1nSEZlYwDqTZvFn?=
 =?us-ascii?Q?1VZAI7KBODDbsDIaqNMS+KMpJ+nPNb5lRt5Y/SHXq1znmRrlg76TNqmtMqQV?=
 =?us-ascii?Q?guAoD09wsDM5Am7zJf86dRVVUuOcyv7x5hpxODBXefri8dsk7s/L9puRtvJO?=
 =?us-ascii?Q?lubiGtokVqSdechRtvg+be/vE1YGoncfPIhn+RBuugGgVW8FNqzmFUn9cftW?=
 =?us-ascii?Q?cOnwH4N4IkjoFKsY5hghRyFq1x+A//thw0DzrU7sWbPffxXhT7IdeJZhGWGo?=
 =?us-ascii?Q?nDx4R1JLLjwSu8Z805JJIBjTarABXwyP+rciUYtHpfFOY3iN0MmqGeJkw/bl?=
 =?us-ascii?Q?jSs1r4rQhCbtICp7jn5YHh1bcus1PFG2CPY3OWF1oyloicbGosqcZswAB3zw?=
 =?us-ascii?Q?TJ58pn24pbN16o4CgnHTVuJgdlfNBObQfFSpA7eAy6Isug5HARn8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d107097-0937-4d93-f07d-08df4a4eb8a2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:16:48.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyDrQTHJXP0PLFirKImDcFSwFxKXltpscthXQSsGD2rEnyeI2uvPtqhfXp2T2ux5QmWIK/vI31JKszLA+FBh7uiz/gLi4cJni6pE434ebI8J13Fm/gIi2wGGivlhlikq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11692

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-maintainers-7.5

for you to fetch changes up to eaff1feb58b6241c7a6ac4db441ca26fdcfe359d:

  MAINTAINERS: Add entry for Toradex boards (2026-11-05 14:49:42 -0500)

----------------------------------------------------------------
MAINTAINERS: imx: update for 7.5

Add entry for Toradex boards

----------------------------------------------------------------
Francesco Dolcini (1):
      MAINTAINERS: Add entry for Toradex boards

 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
