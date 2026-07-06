Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34142CB09
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341697; cv=fail; b=jtuZXdWcXazmWTqV1F8z7g5siR8wxDE6rIY22gbpwZwJuvz/R5ZmurrQwGDlJNH4FwVfWNRwuOTs49Ji3CyNPeDORBdUgNIjLaiLWAIzICRe0/inwwPkPx2OG7splAT1G5QbI1jyiU+fbnYAJeQGF4COM+QuX7dHiLVLfeYsHp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341697; c=relaxed/simple;
	bh=6zZ7oo51Vw0O5sHDGZVuz3L5xmsbdUgMIpgxoLYg5yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gFhDQ7rWYU1i06jLAhXx+pDBzVJz4c3MiL0A70Z6xbwT4l8eq8/uM/C6j89WFGy4Ltr9vdBD4h8KAduznw1leA1+tdMbjK0hl/5CtUzRLpu/5aNkYRyn06oWW/Ej5JTxA92NqfJJg/YQbG5QezZ0uLyIoWDAMaiTqtAYzJn540Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ida3masv; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ida3masv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohtelR0HYI9iFU3JdjLuCBSg2gYOXFyyy+crEE+xxAeXect79vplng4jPOxFE0kHiOK4mUCez+srzL0rh8dFc1EXbFFFlpLRJyqb2KoXloepNrIRPVjSAVLnUByO0lgLUShi4rkdWljpOh40DDOQIocW3OpFcShULm9yovwZPKkLj2XIXYy8Q8WQUarswiJWCkMpqsEIdJNVgiyI3Rg+ub3Oa0Zen7LMi7oV/AVpOnpFZSmXxiJhTNNwdIT6gIQ3cvzPDg/AUXfw+UxkHAt8KyF+IdVV7F7u1vzHoJ/bhj+usluuijD5oMuzyNrXz/uyhVnZE/qjnbmUDzs92LHu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NiR+cW40Wu9Ryje74cEppEu9Fv0OkNfTQ0pJVC+uF8=;
 b=rPYlL7/F3DRbxcmVD+zgFDtr9VFvDU1iFTqGwMpeovPUsY+zGnp7HQT7d7Nvbpr6RD5T5Bugn2COLSCn/Jpb3CMG07OkZ312mir5Dj+wgBlFIYI0XFN2U093pE/AQ7Mv+lABp0QDKG6EOva+v+nMjdwNrssb5mU72UgHWH/ldmS5jlQhuU5n+PphIuEx9IkN/qh0xH7rl3fFYLhAQk7uVDguRJ4yBFKvQsj+/ebDkoNftcTRf88xRqJ2rWv0o36alAMjpZeB9CtWTkOOaZfQU0h5CM0oNijyqJfV6LDuYhP+EXZXTlqHMpe62hIbI5xkRCrsPgT0PN9zuVbVrlJmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NiR+cW40Wu9Ryje74cEppEu9Fv0OkNfTQ0pJVC+uF8=;
 b=ida3masvM9jtLZQDnW1NyykWKQWm/9Msn8/FXxdDr6CSC8uhBlxixnnj16nFDmwUVR504ExAkurueUmprxDAb/WfnVHerQIBtBD+MPQkZy5vIOT6jO1BDa2mYWpmfi944s+pMqH57rQgNP+07Mia6812eMQSAo2NHJPaOPAeYD5OjGPUwX1bhD9An0YjKMlvKsj+89PIn+2w+kdyxEOzmPhiBN9DFqBU4jVuCp8uZZR32MLPa2qCwSXcNxBaWSusYYFAR9WwgKZQJcaLv+edNusHCksDJHmeWHCCY6jdSYoR7ElOx7u2X+qlJG7ArddK1S8SlRhhzx2CuwMywqoMlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 12:41:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:41:27 +0000
Date: Mon, 6 Jul 2026 20:44:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8: Correct indentation and whitespace
Message-ID: <akujSDBEnb+c1HTO@shlinux89>
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: e607861f-aeec-42ab-cae8-08dedb5be5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Wsd3XTnb1jwc33lMr9SlB2brZ7lRZRx9qyexEgZMew2iI+xZBFhGRmqt1SVSv8IrIldCr/tNlz7TklouGv3kdhlwU9yDpjo6l7M2zC2qJCGKZaqxm+VY7g8HFbjqdlPlw5NianBFHftAm/DfuOVTbOhFdUNbVm788FxmoGLnDPrNaoTAkXgEEgGHgY6ssSdFp7rUwQSxdLvhcf29aXcdxzrlyR/H+M2YN6jSj1kTbhWHkad/o5LBBwUZVUnWN5ixhFPSHvvwel4awtTB96cfyG8V77mooEhYxOB0DZpSgKMbME+OqxrL4SXJTJFTBNUFbT0mnDe4PXxssIOyxaneaRpxBtgB6BYfqVQHfWUrwHVMba8Z7fwfQKM/pVaFqa+Cz804ki5J6fr0XG3KDTuSW4IW8au4wGh4XxbETiB2nVn7k5JtQ9V+c6VxShGCb77QJ3fBr56wAavfynY6Khu5Y2h7w2oWMzsYAojEAEq8YdqVKyxhh/MczdwDs9hRg0bKpaaVSfewZ8y9bPuxDEnuH5jzlHPSJeVHICTPjVGGc7dj/FCooeDcc5u5oXaMJq7hZXljarxJldRR08Xfkg816V6I+umqu2SA4+SUyjaefOQeaDWJVdwn/CYxpuyr2W5w+qvt9YA+r3Gprw6tbvBRpJTGhoVzFdKySUTVAFgmngA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9gwTGb0q/sVPqBYgRrNVOqpPvwp04EzywWg+3xE2BFXY2loa5L7fogJQni6?=
 =?us-ascii?Q?RcCzfefe0wwAgbqheyCXHQxlVBwNNGH2U5m9AohjdO9hE7FEUUuTxVJqGpO2?=
 =?us-ascii?Q?koXiic6Wrf4Vpac4VixlsdWhhsM5y+rwRxIVqipIar3BSDbIA9g0rqo3kZq+?=
 =?us-ascii?Q?caPbmqraMMbFhW//42+4lzYD3+q7VJxYABO9xpsRqN7hiQA2wG8YCkPqT8p7?=
 =?us-ascii?Q?otC78gRceeOSa63O2bFBfIHvu9QXuR2Yd5kIRKMFutGkx4vzButkBA6/sMX5?=
 =?us-ascii?Q?T4kkit9qRBwm/HeJVYkakrGrrUoJLBw9uMHzNhap0WEnm8H4Qr/Ozfks1VRy?=
 =?us-ascii?Q?ETsQcbQ7bYwObbTqPrPxpBOEHvLfEdC+AhFfnN0K5OK+0yN9R8FVqpXDbBRp?=
 =?us-ascii?Q?z4eg2ddyfJaR7sO577hkHPz7wjbjK4VFFY3ek3AAcGfpEQN6nc7Vxs2fwHPH?=
 =?us-ascii?Q?kmUkY7pBChqMnQRbo6c1mJYt7R5EFp2qUEQwBfIDp+KFAsflPeUPfTfSj+xx?=
 =?us-ascii?Q?NABgUh1ArOlu/1FGmbFO6WFQ63eUKou4V4JdP4WfEGARTih1BRunKiV1Nf8p?=
 =?us-ascii?Q?Gcpl5VHG90YGHv1IwrdMDfJP4jaQTPZpCLZjpKSs1j3Bdzmk2EwRw12H5os0?=
 =?us-ascii?Q?Sz8/aCAoiiEY8v6+IxZHXdIzmiQ6mxVfQN3EPDm8a1m6UMSt8cinLxqV9oO8?=
 =?us-ascii?Q?q4CM9nFPVSilZBCb+PiLP+8gV4070QVh9MmOPakmghZv1SJvlF2pzBw0e8Mu?=
 =?us-ascii?Q?sutSOiimaWZyc5ofnYVzbbcyAtmCebDZU5N0kSoWZxr8ZXnrl4DNwiJ+C/6X?=
 =?us-ascii?Q?vvxeyuYGirIKmhjKsmntGugseEZX44jeGdizaW0CdFYncpHEncHm2bUgnPi7?=
 =?us-ascii?Q?CPEvxPSPLnLpNmnZ/4FVSWTdbO8d7V6p7llaL9Cg1SeUpoBV8hqFFbfo+Y3X?=
 =?us-ascii?Q?7s8XfoxRRnsWrHBZQtU+Sof8AC9z30tHtMUrYF9KU1zwREzXVxx8x77FHMwF?=
 =?us-ascii?Q?aqHyVKiOh7VRu9gvaTUML7czWixaO0+Mshet7jbZBdr3Qc/mB8iIbbX7Eab8?=
 =?us-ascii?Q?WdN3iNzpHVF50+KXE6xBteOWgoHWfpzggEalLnN6BsqVWp5ljMU33MhsOqdA?=
 =?us-ascii?Q?ck9+bw3TrrzlKiDer0S5NVz/kZb/OtU3cASKZMsSKoCHs7WGks5qMIWvhcg9?=
 =?us-ascii?Q?1TjfWre7zREjgW6mf4ge4FqZ7ZU1APNgCv+xF4cypxA7o31adC/0Le3WmDWp?=
 =?us-ascii?Q?B6hUXjJbjfxZszl5EREh7/DaX1okdTHtvuGzkC4yGXi4LC2Qbucf8tbcPvg3?=
 =?us-ascii?Q?Nxw1QYxUZ3B/tEsGDB+XrB76brXaWuirlihEpmc41RFrp7sA7xdHR0C4qCQR?=
 =?us-ascii?Q?pXqAZsBRJi2WAoibAvYQeUE1leRRieG6myWmGEY4EusPkYWDDigl1Vqcy0Hu?=
 =?us-ascii?Q?iqmVO5iokcic9HnUW8iXTYAcYJlvPLY+mUoy5FXbbTlA568vktz0ss0MwHWQ?=
 =?us-ascii?Q?Y6lDcmLYGV/IWZPmf57iSIodgvisD1cQtZOKW2xFrdSoeZbduF9R93ENp1OX?=
 =?us-ascii?Q?4EnLpzjj7QiAPB4INH/+kpTb8V1OPpyijsG7C2I1Ly/i3AGnKmzTiVOoj1lu?=
 =?us-ascii?Q?42U/R9OkbkRUCjOFc7Fwf6qXDIqYOhudG7EAd/m9R8O5jfTbNUbiBU4uiJMR?=
 =?us-ascii?Q?gALkm2jGER9V+jwieNZu24h7P3d/Ae9zuq73NwIBYvH6oOv9/9+4OP5AsZOx?=
 =?us-ascii?Q?frZtontcliAuYAZXKfhysFE6d6UQc4Pqp20GOxDpSjF9UIvr4jn+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e607861f-aeec-42ab-cae8-08dedb5be5b8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:41:27.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQvH1FQ/oaE3vwbAoi0g4v9qw6cgBcVGInaaWEuAgM6+n2QgzzQ0ORcCkjhF6bBATx3Tnv/uoKnBe1rsgKd353s5m/jFI4DYpqS5uQTcw/FMyYafD+qpNqEFcjIuUa5O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171

On Mon, Jul 06, 2026 at 11:34:31AM +0200, Krzysztof Kozlowski wrote:
>Correct spaces or mix of tabs+spaces into proper tab-indented lines and
>remove other whitespace violations.  No functional impact (same DTB).
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
