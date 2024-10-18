Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8A18786A
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729279444; cv=fail; b=FmSQo9qgTW3Z0QKAs97h98td+deVS7Yur01zfWCPuZ4V364JXU8qXEIVYC2ZLhIrJeGVUxXWNG2VErz2bIZH2QjzbEEzfR6BzRmpsXRL6fDGPoqucOqBFhyBQn0UO+ZCj3ypywhDZoaQq08umq7kWnKOYjeB/Hw5RQEcTslD0cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729279444; c=relaxed/simple;
	bh=PJ3IjaLL0bIL9eyyam11pRQKe3j3msygyj7WQ8+nROk=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=tKX+NDZNDu6de9AtWv/t+2OSJ33U+nO/kI8EDanW37dYfwnnd4t39UWTJ8D1cHghdtqKit01VPJCdOZkUFNj0SDWX0HroN6FKXBadRRb9oKGjfsINZc+2nBlIuMvjuVJQkEv7TymT16owuVQbySuJ8/NnTxQ0ut4gPmC/ns4tD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SYy5xusd; arc=fail smtp.client-ip=40.107.241.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SYy5xusd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8wBHzuN7J4hbvjMFIL+BPRZav2AjDPdCGPkDJB17hlWt74VSJNAogG8g/jx5wxdu8AuOPye0cqEENY+tLHYluXoNBGIPwDUZVStQQSCJwiIIQXA9o23gnOIqdsaUQHRRbaOZ/YFv8lbV5WFkfejme9zVUbdXi8X2sAK3oZf9iCgyrdjl1ewMXaalZ3+7wBGynagkEUQrof3Ux6JqIwnVOTvH4DPdBgpBUVJBaM3cIAqN5h8CUruIfl6T+j9sWqcAALvvPu1oPxmX/+x8CBZO1GiMq0IX+qx+eRe7SNTFVzbLp/hrbMmd7m79bvkKWXFikVFCOca9ImB14jYUfatsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXw2Vrc7yrMUWpT05MlL+qQLAcfFO7kWm1yJWyXTLPI=;
 b=vanMIxRgWb+Jm/zTi9PXSnCUrPAbWtX8lElo8rTw6Jr9jfg6s0Eib8LRvdc+1w+WHqmTwlL7D5ZDnwEyt6iitm1ODMtHQWGwYjKrSQZMkrktLSABc3VBLxTrAFlwg2Hp3GKc/8fZD2nbYmmIOkYncbG7ep2qeLQMLZAHI7ladhDVEh7XueAscE9kkBHc5TZH1CfB0AJdEi+jR7L9ZDHAAIE8vdIL7ZcZ9fBJL0g0ZIh+wwWqdYnD5DcS2PMh5eY9OrI7mXNs5QJI+jPpnRjDr2B1dLO/fIEtstEWeH3K8Yhg3VGvyq/XNfv/6akBLnfHMQCMky0DqpvLrX9AUDvzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXw2Vrc7yrMUWpT05MlL+qQLAcfFO7kWm1yJWyXTLPI=;
 b=SYy5xusduuXUIy3kfQ7NAR80p4N47/KLmKc/TJILhXMtFKyPLhTqy3nxOV4V03JY3j51T6MnEjBBe7T/6U1wgh+usrhZ7wwXyy/K9kdRZkSaD1aYmHj69wQtGW/j6ZwxskXnM1rQoKRHrhdftf0CsvyfRMh3e0Jcry/zexQ7LPhKAlUIXBoO98IHuKLeuVhuxVU16FOWVASsekQ5nch4hsH3wHD9IasTUAjQy0HxqwCRE1LflvXQd6R+DLdkpfbbZxc4z2T3t1UrkJ2+qz7cFZNnoKiAcL1av6Fd4ykZQldiy6ii4mHcr7HXKJoaMV6xJksSieXEAqNs5SbGjbxaMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9683.eurprd04.prod.outlook.com (2603:10a6:20b:473::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 19:23:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:23:57 +0000
Date: Fri, 18 Oct 2024 15:23:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: marcel.ziswiler@toradex.com, imx@lists.linux.dev
Subject: panel-lvds for imx8mm-verdin boards
Message-ID: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ae5e75-b146-49c8-cb11-08dcefaa69bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5G71Afh0/+TbFhLgI+bTcGUD+z+IiSy5GMiASu3NGnWEegP5BKZDVvBlgk+m?=
 =?us-ascii?Q?7qr1Dyp5Iz6qul62gAYuZzJ36TzbvqNNAIHw/tEhpHb6Zs7v9mXU32lBayE3?=
 =?us-ascii?Q?Uj4H+isiahC0IP3xlPgLJ6iEPX9H08zTlaq3vxkIsI+9CkWqgI2voeo8D5Kw?=
 =?us-ascii?Q?g4uiL7aTCoRrGwmapziziIK6pD6ITn+UFsv9f+eZcgSoHsuRKj21sgOZlS4T?=
 =?us-ascii?Q?BoeLftQBZnxA7wvWVzh7kZiJYoc63J+V90PDAVOnvpWTJHXaIey1ygTKmLxc?=
 =?us-ascii?Q?it0urgE/HWNmACPIliXyIB5JfzX7JRZnaM6c2L7wPI8r+F+7n6wc4rBOyKc2?=
 =?us-ascii?Q?yjIjRv+5rNsSmTWglyyfYrjDq2rLuyVH+medYMwztWcPZO6imDMY0L0qojRY?=
 =?us-ascii?Q?NxXCGHb8daqihLdzhG85zmc2kDWhlUq3TkGRwKma7nLnCHbdzMocppDTnEFT?=
 =?us-ascii?Q?dk14z2Rk6fHw6bntlfcvbW/f8tKNbiIY/XQRrvUmDRGBNQfv6Z8Lnastn9if?=
 =?us-ascii?Q?XHoJEnUm7xLzGsnMupVjPJ5M/sBIS15TX9ubDMBrRHTqP+t6ghILE8a8e0uN?=
 =?us-ascii?Q?LZ12JrDGeD44C7kh9V2MViNxHg8x/p+B4g47PN8DWcNV/oVrZtOO1LNUqxV6?=
 =?us-ascii?Q?eKn1R7jA+RWUuXZGIjnk43l9pT0TGMQ+YjwufGgryR1ktS3xTjFL5KmIQryW?=
 =?us-ascii?Q?t48/P6PtaIjOk1oWBsaddqMOURXz3/tcgyXbtZ5iq1PLM2d3LH4cYYVcKuiQ?=
 =?us-ascii?Q?SyV0qmGBo+8VjNxbHxHcWUF23a6WZdvdH8EJU2fNPnFp7VSs2xGezU663Ugm?=
 =?us-ascii?Q?KDy4h4nfcKe+MKbl51pOr4rxL1oGGgDc8uGuRW/AqY/gqhnzztYfAGsxzLN1?=
 =?us-ascii?Q?AudPfKk+fik8ORygZG+rozH/gWxjGq3y+KV3QUEBa9VZ+SnwkLNeLGKehIQa?=
 =?us-ascii?Q?eEGh62p00a+bau+AgZV+nKFbB3mAi7bsg9V/gvDd81Zs5QMnICQKLeEaghoL?=
 =?us-ascii?Q?oaxG06UbjJWPakiDvKNZKYHshtZhvzUl21I9pd7jGPXkUycI879wIm9JV9iJ?=
 =?us-ascii?Q?4J2VumZLlIa3ofFJTzaVrYBC1nWQF50kouKjrn1moB7hQrEbN5XruigvKX2i?=
 =?us-ascii?Q?MXQxDAJW0Mr0XbIXH3F4iXEEvxUpYFBLNrwdEhFkQ/O4XnS0RpWZ+lHy5RoW?=
 =?us-ascii?Q?wMG9jGrZ/lm8aPlFs7ZmRlzxdZu6Pob5CzxiISiNotyWSxrHEg9KCmpdqST5?=
 =?us-ascii?Q?UV5+9gLk+lz/tfWHrY06K8W1apD0wHFVEBIOH5ZxMXz7LpmL5Ogn1Bao3u/3?=
 =?us-ascii?Q?oHnzSn1CqUmfrCltbm4YI+4IKDB5eV5hgPsQveXhLo5y9dmUn+EEs1V4nBT1?=
 =?us-ascii?Q?0BQ+FfY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?m7TPImjx3hID4Uw1iiEt1TamI5GVc1E2ReFpiZ19FSbfouEXEg8loG3ZzfYl?=
 =?us-ascii?Q?94QFfWwhOQvJcrY4TfUfwp+zXUC77sRcHZdHSCMVbipFAAqOjtluYx1+o3T3?=
 =?us-ascii?Q?Rpt0YN8tIlOyobpNUmfUmQP/DR/sAqqrr/aiqlyN3uFbI4N2Rmw4bqdfi+WE?=
 =?us-ascii?Q?R9FDDhuRjIVg63OZ4mkCM1+Ceeq9r1UdQ6qKhGx3N56oiUFEYlhPfjWjQMCU?=
 =?us-ascii?Q?zpwLM4kg7IMuJw1bM6EypUZsHim7Qli9w9WTeE8JdICk1G2V6xkI2KpG6J0P?=
 =?us-ascii?Q?e4JM/dE0ZY/SVe6D5VIDqkNUIp6qfPrDTiYvWhc359nZZogCbVO393BsXUUX?=
 =?us-ascii?Q?+x/khbVyYnfrqD81xfchkBG9Ij7hheI72S77JMlvusm0MQI1PAsXPcpG7H9w?=
 =?us-ascii?Q?MD9OlGBOv2EcmfCIn+CjjK46m01fBBuyDk/red6QxfVCTgfXXhtzzsCyQtv1?=
 =?us-ascii?Q?1wXF+ls/if8ZVHYI+0lEoxQIKi0Kwzhc+kdB31gB86McYvpCHiijMj5MFFgc?=
 =?us-ascii?Q?J3V1e8tKn0POMLXAaPLwSYmtegx4KI9nrBW++KzvDHli0Gb0p4XICrwCkoax?=
 =?us-ascii?Q?H+PIXBrKH6okPGtopNv4stovVxy2rSSKEIp922U56fys4JpcTn4Zmn38OjxD?=
 =?us-ascii?Q?cR6zxZpCP48kkEjCMZTYLiVimAZdyT2ESoKL4gB1vWy65UC3bG2XnP78FDeW?=
 =?us-ascii?Q?nDjnSmPl7JcDwZ0vT9h0L8NJnOycNF1PCml5OzekKkzNnMZXfT3ISKuT9BnB?=
 =?us-ascii?Q?L7h5w7z2K+0/eNU9gbySI20c88WVsYTaMJOaNNNaqnOm/WoJ02v/0ixlfBeo?=
 =?us-ascii?Q?+LPEo09qa98HSfRwrZ4zHqWzk+yNvNAOKXNbK59TKq3JfIIJEQvQ08TP1flV?=
 =?us-ascii?Q?2y0PyVacoE+i4SMTlmhacvAsOZVX4cYS31+SPBSrWGKUbpaw2A7lsYBa0M3/?=
 =?us-ascii?Q?hmBrBS+sY02xVX6RODsr9/9LolgreurtAz9AlrVDaEs2cL255PeSHf+ryUx2?=
 =?us-ascii?Q?CLjt165j/ul3oDJph7Ic7fGuM76Hy8sRDXJWFflLPLMw8HYf8/YyOacZmc3U?=
 =?us-ascii?Q?6AHXTqv6ert6IBMNHBFXByPFj0VNYlqoVrd8B2msmnznzzGv9XnfVQgz9RNV?=
 =?us-ascii?Q?BEJwx9bYq714De0ItyAXXLcNe6Xx/JdYgbf6GbgBZZTnHRsrYiQWurIANify?=
 =?us-ascii?Q?iYn4R9+i/k+1JnmUNmoqJasx4LhGWD3kHlJD4YiL6t9XNMMnTmL4pXCHQVnd?=
 =?us-ascii?Q?TEip7o8+t0iPY5VWd0xyfSIadknCjKwJywcumiFbB4BD2DZe30p6BP14eLgC?=
 =?us-ascii?Q?cKbY0CoaReOvgk7qsGS/kZaV7Se6IlxvvnDMD6kd3xFyoG5dJWYe1pDiOZnJ?=
 =?us-ascii?Q?azFKIZ/JWxcLEC5izfiJxGYZX4L2pBnCbT84OkJ/LiLQgzcmY5cumoNCbapm?=
 =?us-ascii?Q?a2JpZLOKCfvFu6A6AigxCZAYomuSihts2k7P+Fs7DMWUPxAzhi5/BhpVpk3U?=
 =?us-ascii?Q?w3dhkH/IlExQyRdt04VvQNOBy/BQqRzc0ZkHlyjGefLwBrcg6x12egvRtWv3?=
 =?us-ascii?Q?6E/2Moj/QU0iWrojI3uTA3cy/BmZ+pBfs4DDsEqO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ae5e75-b146-49c8-cb11-08dcefaa69bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:23:57.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it+WhwH1IAE0plVovOodSdS8D46syNPnKT4HOp1mCaR++9DLuzMHza+Anlbo/WEtHClhajyolGY0tSidfktoLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9683

There are some dtb check warning

arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']

Can you help add actual pannel-lvds compatible string to clean up these
warning?

Over 50 lines warning related this one.

next-20241018, all warning under arm64 freescale is 814. My local tree
is about 138 line.

If you can help fix this warning,  It should reduce to below to 100 line
warnings.

Frank
