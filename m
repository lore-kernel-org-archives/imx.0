Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448882FC005
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558014; cv=fail; b=cYZDmn43s6EnGUBp/YsDHWwn5UbL51ENOQZoydvURGyjJmNNrtpBAfVZQvqN/vvbNIaS4TOYXn96WPVxLCTiwmdEENRbGTYtpenKFQsRFk8RcQwzGzQlztSWqOf0uWHARcaU8i2rQwEt0K1cbf+bHeU1o2O36C77hUl9WNE0KwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558014; c=relaxed/simple;
	bh=a/sZ71pAsfEQCXmbrfV4nsQ3hOJNQo9tXU8eCNPfBUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BqnYMbA/jXqru3B3LQVT39W+KDZa1Dhllh6TfDIFkDjupsOwDXbYtl4o1wDjTxDmp9ZtvFMzvw7hMV/uyrU41ad3cKekQeT+LWzCohOD9/0J5UZ3fCZQdUmjZjKhK7RA4gBE2K0faGf4GBmgkaae7KasaIOUPpUTmT4n64ABlgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l+BjpKdi; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l+BjpKdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pbcu5ciqDyfg1izBBYJZ8YZ+XWk8jVNt5IUpTmMKrywQXfjM9F9INywwDpyqjINsDXHH4UGmLsShG7O4yKSvUIH8OiSjygJyqhAj/7nVqhbZphsmauNYDZO0eMDmar82FrqpI0uKRteToLHcuMNPSGqQvDU2st5VQNHAyjs2KimKVJgX34EIFG9VRqR1DHdCHw7Qt/aX6f20jZn61A8hI4wT7ryIQQkxJ81uv1AC8IKPpvxnq74289CvciHoSfC+Vu7E2oc7P3avGGZpz0mA/Rb16Q36213Qr0qrQV/UvWrJ2BOKDEbonH+K/EihC9PHGKbf7Y179gqapgM5w8Zxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtSFrsiqsInQhY8suA8ufd52mk3DH9DnLdnYcExkePc=;
 b=fwyLc1KDSMCh8VlcdK476XSEkN1jFtgNko7Aq5LA/a4FcneAOLLfrj6lBTAS7DIynGm4UBc6trFQg9jk8/9Ju+JnnqulomOws6LIFvR5IGz4ht8l21e4MpWurtBvBskr/ZR2+FLD295acT3/wwoujcraqn+mH8zVc+3ZdanCuvpvyu7bhFTIN0Cu/8jLVfsG9R/XTn66ZO5pzO0xrA1jOsJvys/5OmRmumyifGnf9XsKHf2n8v87aY/IudCR4nDUVk8Edxo09yZG2clryMS2sJ1QTezz9rDGOPQMVs3GnTMeojM4n9g0P+/IRyLQUhPIYyKWvI7j0l1H2583R5cwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtSFrsiqsInQhY8suA8ufd52mk3DH9DnLdnYcExkePc=;
 b=l+BjpKdipCg2B1ocKwcpX4kCtqTxFrjTbbg5M7yjqqDcxfJlnnKnYFYGWxdfc3wAG/E7rbXf5MMNb/wkrNLgcCK4phfafyzhaDPuYTqM9VncnGVNU28d9cbMJL2PWd88sVhNQi+KGh/0pUT2WGyxjOoyBZ8meRH7E3vUz8n0yuUdPFmLt29Axt9WzgC9o8DyeSpSu9PgGJ4Zx+4uPanyRETFImXC2i2It4plzCOT///itokzjZzuhazFV0SqPQ877VSsdyZzjbtmQT8xyC/IasXddwrZX2lZJ4ELTxvOWY5ujj3vuUngFtO3lT9rEj3OOuXRmlQEI6txYdbzWywauQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:46:48 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:46:48 +0000
Date: Fri, 12 Dec 2025 11:46:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 0/3] arm64: dts: freescale: Use phys to replace
 xceiver-supply
Message-ID: <aTxG7i44To0bYpdI@lizhi-Precision-Tower-5810>
References: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx9-can-phy-v1-0-a421d7023e13@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb968da-8cca-42d4-0e6b-08de399e0aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m0I+lWcCPpmZHLT0ubU6DPZuK3fsgoX2DoGXkSZ26e0gJhI5qr8+ZKQDHGN1?=
 =?us-ascii?Q?SJ0vth7pFvJ3Q4DWzh+uE0acIPGid2D6SqySoymlehUAEY8ACSEhJBef8TIq?=
 =?us-ascii?Q?n8J96Pfjl2qFVVbAcitwJarooK+1/61XwEH83RVcn+4I44oz/QTDsCr7/ucs?=
 =?us-ascii?Q?Id11G7gb45binHsHQeRmG3KVjyqqS32U6+0XF8UaEZwnls7YZT/yVSchYqFw?=
 =?us-ascii?Q?sUNSDHp3L8mrFTxZBGSG1zUINooXlIFVP1pOjtan1s4MiZhi6xNGMUe+La/m?=
 =?us-ascii?Q?IcQqUYmB6Wqb85mDVjW72zQxTYr730tKNGuxlPlJjmY+ZmT3ykXp8r45uZ2H?=
 =?us-ascii?Q?K0XYFdLyxPsN/0srAhxvA8FKd0qRQLdc+Tp7JZa8lyS+IF+omFgdIzB31VLP?=
 =?us-ascii?Q?k2b3vIFUr8boiNhSRIenOqlx5aXXJ4idVOdBqLdDjg6rH5DO2N4XXE3juuYB?=
 =?us-ascii?Q?vZR4v2/fRf/oJqi3Asvs3bByo7AQvz3Xj63J0CNkssVW4oZQW4kSf9Q+tlBF?=
 =?us-ascii?Q?EHRpFahTdmgraNqq4/0Hg3d+a/1klCTaDy5aHNXwPwKnE9/DlpYlCSMxjw8H?=
 =?us-ascii?Q?nXwRab3wAT7d7TxOZ9d1PiD0NFWQx+2bQPCmK1h0EwOaP8DOMj0e5jxQGmcb?=
 =?us-ascii?Q?qVgZT9uI5tgm2VLXpu38PA+uGC1GCCwlbOK8O/9W3lxfnnNWK45Vf3C0lnJL?=
 =?us-ascii?Q?vGmwteOjI9Ks2jD7EBuqF5rlDKtW6yEWluTub0xCfeLBd6TyTzyHUNL36Wic?=
 =?us-ascii?Q?aUeUfADOiortbMyS4rm8Mz+cdLdW8fIEJ6Kb2l3KkX+xflCQMUak3q0Yq3DZ?=
 =?us-ascii?Q?3o5tbeVITSxN0cJnMfDT/1nuzfa/IBjl+ec6w0ZVxFTWZojs/tLb5ISdxskq?=
 =?us-ascii?Q?7FzOuzKDs2gc+PwuHdHq9UIk2d4tL0XGVJf6LA6wy2WuHLlfU4+YAb/eO4je?=
 =?us-ascii?Q?XcR/SdAdk0ImFV+0EHANKYzxmQ0k4JqZThw56bh0woIc7ckB/5nlRq7HjfVW?=
 =?us-ascii?Q?fmm0mBk8YKCbxDo96NMtOf4cxzFy8NeRqzd2GuvT2qLAHLp14GzYfSg/BVSi?=
 =?us-ascii?Q?CrhqCcsyRkxoorXCd6+nuCjoo4EwqPPfFXRjR4Oiko0VmJ+BEQYYSsfNkceC?=
 =?us-ascii?Q?wHfBwFgxLtazSy+nHlRZblvko+Owws0vmjL02F5sJQ7cVhODlFlBi18WnKar?=
 =?us-ascii?Q?E3YwoLiJebLXI1eBJbT4wSechWAq0qfi9+FLQoX3QkdRiHvkd3FVO24ccXWo?=
 =?us-ascii?Q?TOCnDax9Tie45nT8GgAEckDn6vCpd8LKM4eXCqAEAq8HwDwhMUxa1FHkbXR7?=
 =?us-ascii?Q?iMLp876Fz1APZhB3Eq28qRHrWtQ3i3bUp/Z6/dlB5aeHaNcZfTQhdM2Cotkz?=
 =?us-ascii?Q?9DWNc1DdwHab/tr3tTLl4nUqO1M61JU7nBUlRrIyLcKucD2i5G3p6fAXzLWV?=
 =?us-ascii?Q?nX09GgjoO0FV2J4TDeQWG7f8VLFQ1NhIR+1I5ViEI3qcvynBiuDAQhqIMv5a?=
 =?us-ascii?Q?Msi6i5sDzDzAKR0K/Yczkkc+/ddW4oAvaBY6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bi6DPNNI7ns9mgiZ82VTTRZqvpg7tKqCARkC5do0EMhHJcQDuDbtnAG7LJv/?=
 =?us-ascii?Q?+xK/RsAuSxYHniK4TqsC56xxCLp4s837LPSmWhcfeXh5AmQkXf4xL8mzZuAx?=
 =?us-ascii?Q?90EXP1JnKG5qIh/hl7Z4R82CrdVuEd40hH8fqiyr5s7TWd4y69E0RAwKYrtu?=
 =?us-ascii?Q?6rGcvB8bI8iNcFM3oBwV1VLcyyKPwXKnH5rCHRPUOlU+wvk+I0D2zvaBHFMb?=
 =?us-ascii?Q?+PAU9IpfDHL/EW1y0YN/BbTeNB+tYIjdblPet/MkoBgNY7AeYG/2ji0pi391?=
 =?us-ascii?Q?wn0pRT5wY0nGhvqUq5+YUbEyvmb0e8lXIy6lk7yXggy8z5EUY/JlFFQrLzg6?=
 =?us-ascii?Q?mmNlfOU7Nl/BuKdQeUBluZIN9gGoxgA3gCSJlQkQUT8KASG+Qw6e0P/PUlVe?=
 =?us-ascii?Q?P9ahxEsU6w+Ym+NEMqLatWpBAgPS0TY0AiAQ95GGulbupuuSv3TRQp252qBJ?=
 =?us-ascii?Q?jixUPWunUeQXBEp4hcx0QJT9JhO13dJo3X4yPTUTiN8ZcxI/0vtxABttYXOY?=
 =?us-ascii?Q?BeJxA3fnGub3rTx2owyBvyXRjowii6nGe31KIuLjNpQuUGnm2uPjVXj1lb7Q?=
 =?us-ascii?Q?990ModX8d6Y3oGA1fILuj6vdDapi8DBLjla+tPCOqvqylevfXPYg9UkqJWJ+?=
 =?us-ascii?Q?PFNz6EdB1Yg5AwtYoSs+im6PWvI9NR85qCaujM9e+M+NwK9laDpfQBSDI4bs?=
 =?us-ascii?Q?O3M4pN0jzDwX7LuabVNYQtqlDfIB3y5D8NVck7dHV6/MHShiJOUYA1iT+78r?=
 =?us-ascii?Q?0UKlW9rJ86TFyceZ9OXouKJkz7oAcz97F1H38lLn0DFIqkjfZpudwYKroCra?=
 =?us-ascii?Q?TC5xyDcAoSSsTF660fEcfOJz5BI9L6efgfTrrlsGGg3Et70n5inkh2j4l7xO?=
 =?us-ascii?Q?6ghNfmoaMKSw1iGv4KOcIVSYrUGaCbHD6BaRfSyYRptafFeh7FrHst9DOkzX?=
 =?us-ascii?Q?lUFgd8Yn7Uu143PzDN9sFgcpoFG6ccoqV8f3vfnMRBShdJHssQ7ymo8kCIIa?=
 =?us-ascii?Q?3w+GLmul7qLEOrQVs5gI4drN5o9dkuvf1UI1mhQLTp+NgqSXWu3YYTXGU8fr?=
 =?us-ascii?Q?j2vhCktADii/NkQxW+gevSfq56LvqAKjMXnmYcvYYA8Ub2k6TfpeqPTDQBxJ?=
 =?us-ascii?Q?YXLz+g+9gkPlFisCzdbFIaFkQX5O0HwFRQHU0ZeQPSAP16GhsXeH9hy9yQRx?=
 =?us-ascii?Q?VB+RAasf81uasSBxvIZgyIJSXTLU4JuhUoUCeFdTQj8eBQ2InE/IPvpcy5L6?=
 =?us-ascii?Q?kPcvnYG7Ji9FATpRyeQRcybh3hdry3G1VfF3InxCjYJ3pKXqlvL4hH/VAWOc?=
 =?us-ascii?Q?7Fn9ywtql9Mn2/Yba763SYgGB7ol9988C3f25k5Jz1g8cA6183cE8/K5VSqH?=
 =?us-ascii?Q?qIVWIJ4/9NoHXHtx1WDKCWwBZWEPfv+Su3SOy0Kc3ypDJkNNMdb+pN2TUa8s?=
 =?us-ascii?Q?hso571KMx/oSTDh9Iak1SKe5ZZ2QnVJ1oLP/NdgnPddBSn7l0RViTTXM7LR1?=
 =?us-ascii?Q?aNST1XN+jIa/U0gVbMUFTzUQFSke/DJ7uaQl6/o4lL8UyJpagBKEy3+7lQlr?=
 =?us-ascii?Q?P+w3dpx7drAEBRff2A8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb968da-8cca-42d4-0e6b-08de399e0aa0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:46:48.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzDJDPSN223jnOz25afiCNNB25PmNg7L88Ma27tV1y3JwxQcS3GlKXXKvLi6K5/VJhkL1vJuPEj56wbbc595GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595

On Fri, Dec 12, 2025 at 05:57:18PM +0800, Peng Fan (OSS) wrote:
> This is a pick up of patch 6-8 from [1].
>
> The drivers changes have been picked in 6.18, just resend the dts changes.
>
> [1]https://lore.kernel.org/linux-phy/20251001-can-v7-0-fad29efc3884@nxp.com/

Please add 'resend' at subject next time.

Frank

>
> There are still some other device trees not converted to use phys,
> those will be converted later.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
>       arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts      | 43 +++++++----------------
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 17 +++++----
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 13 ++++---
>  3 files changed, 27 insertions(+), 46 deletions(-)
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251212-imx9-can-phy-328c2085afc7
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
