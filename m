Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C637F013
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 04:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598419; cv=fail; b=o1ZXIcOReGYLznSh7f5l2JA0WCm+2/qIMG2MF+9YcPGcyU3J3Rewqij0Qq4OWXpeOj6mmtsfvB4qJH8/z4kxuLbqra6pMK5kixt/f7s1/qXxVTWWo7kO+fHdTWZoRt0il5AZ0hCSIgUxUnb7WDBt3UPQiDL4yXZuCNHBwbZ1q8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598419; c=relaxed/simple;
	bh=YcK61fp9XC47VQugFR0rpnQZy3ISh8bYdW1oeYqV1lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YXBkE7YjddxlpT0272mVbwTIVAtEC81O9+YfufO5r4dp614s3IzGf0MwTT/wfPKTd+IFAyxnCmvH+KxsBD9D07SxQ1bRd+pnaCs2DHT2U9jKC+fxm1+sYAKs/NnNPwUsPmEVB+S8BsjDbNyWmxPgk57CMaVvygK0627B7W65D3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Tpv1M1V7; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Tpv1M1V7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6Slju3sjgYB4W2Bygqsw+i3L3JRo7ykxuTYNXwPE2DAIH/TLXip7mGayQfvXLX+cTb54uCL0lfTVTiAxi/2xsGB4hXpyiPeYbGuvwrvK2SZEn8JEwrQSHwlIYoRPZee+1owNNhxOKAIofuy4LGErNUuEOXKMu/p3zuD9jtPqq2Ug2PQWhdtrGX8/dKcp48RftoLqpMiTczJDNJRZRwGlO3c2V2xqePS3+20MOQUgDNYPqFmZW1uhpBjGV7KqdZqGmgUcx+I87QzQL0SISDEgh4fS0RK7juzNuzDZIvprFLwEjww+vGhDkhKqbjUlTAV2+ZDfp7YNJyVam4KQnNvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcK61fp9XC47VQugFR0rpnQZy3ISh8bYdW1oeYqV1lU=;
 b=jF/GB1Lwt9qt7SoUiHEJCCTX5x8Jng2+DOMHdcK1zFB5kuibaqa34zlZu+fi8VhR3gXRGm+LTyKeGNfBOJFZ1uQvAn7HXfDjGS+GhTxBjnkmM10aweKPcdfIsbbHiLSzwPb6RYPUaCC1b9hLqI3Huzw8o2LJ//zkSD1YIq1KecvvKUG4IlKIfuzuUi3cwy/Z9mRtyzMdLkzlgTvvyhJxmW8ZGhBt8Ng0RJhRIpB+P1Dk00volHJW65dRUIyC54a9AFTHYub4Yk0nOmGcGuCUAH+/jKqkj5VZYKYFeUSV1/AR7YR4la7GdGtInj0mhoz7aTTUe5P23tQf+BDI8QX9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcK61fp9XC47VQugFR0rpnQZy3ISh8bYdW1oeYqV1lU=;
 b=Tpv1M1V7tNUJ2E+ywatGKKbUQtTWL8+Q2UmFt12dtNcrai0sPimI+ySQ/b/V8WH76iS+nwHGwNMS3vGn85Y/tbKQXDc7r8w0fniMRZ4qBSqhQxjdbczVXBdV0jXIHMfOKnT7uy3xvcmp+CbNObclvlEzowTJDiMQWEGbPUFsl8srwlnZwsQkbeIH5ue4ZWzpuFsP9r8BtwPE11RoBGNQclgYTJ2WloN7D7Hl/iv47sDTWN+K71veWn6OiqTpQ/rxVZfdVQA4tZBuiBFMzPmZbLx+iY4ZVGhmNNdoyT2yKXHVqslhWs8bKXWQp6b2Sp/3TaAoUh+uYt4v4DiBWv6Ipw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB11612.eurprd04.prod.outlook.com (2603:10a6:102:512::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 04:26:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Wed, 4 Mar 2026
 04:26:51 +0000
Date: Tue, 3 Mar 2026 23:26:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com, jstultz@google.com,
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v3 0/4] clocksource: Add module support for timer drivers
Message-ID: <aae0g0NngmSDsbYF@lizhi-Precision-Tower-5810>
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
X-ClientProxiedBy: SN6PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:805:de::48) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB11612:EE_
X-MS-Office365-Filtering-Correlation-Id: 368ab594-8301-4b10-4085-08de79a641f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	E+EYiXLfPHqPQv9yw8k7fEZYgcYuqdCR0s7hflkmk3dPiTWHwuA+tkOAwAspyQleZb6e+LswJA8dXCs/zX+f1KsO8iL28FwtGfXU6eai53Fdbt6JV3I4wMLe5fuEaO5TG60BXYR4eECRrY/CZqUeJWA3WQQq8h4PM5AR6U+Y+MNLyDMzP/zTzWZkQpXpMA89ioo23k/4oWQK0CH6c6CyBCgpKbuUtdWGt/fYS2U3D/4hrYUZxDPpYlI7Gy1xIuob8Pl6mez1snul/Vby1JRVSXUdNI1Z2GrT5pdolJ+M9fbOUhaGf9zftbJLROIPQpDNUWYaxKLHepVuW3JyVYy1xHZAkx87uJFHSaIKFeOOy44dv7K7ThoKFAReUMe1NMQaYm9jqWN10z8e406NTt7rDnQOZzqu9S8HpOehgy1Pt5h5LDbGq/O0ZOgJa//ccO8aIAUQN5ZijAVEhH9qmu82O6XT4NABRDCUtQomB6fYYb3dEvNKKPCc2Q7uWtOuL6LMIWwOGMKbW+2KwstaUQliqxevuQO/U2d24wdPuoS3Rb0angdsCVxB6A+KFn3mZ3KqlTWC+GoLAJ+ZvFlHWqaw2/tPBiM7rHxg+5h6KdTSPaBbqkMM8Q8yl+qyPIC8O5FtsMGkpx7EM5zNhPw8vuMGKFXj0LhdMWd/fL/smnqC5/ijEsF/TI3h5LIVgnlaGczBFex3LEgw0Ln1SqoJFs5x4VuiM6TFhX8VkjgMDyXrrrsvUJVciRqrn0IcmU2AiaWPRZRC9T8r+LZonZ97X301Lpk/ZhGD5EjIfWDZC1Q7ydw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRnZvBvx9n/Yh5Vrsxcnz67hz7/13Czf0MvF7ILY95SnBbJdnYrcWt4ht+j0?=
 =?us-ascii?Q?+3gB4zejQWyvn6MENtUuPQncFvemfpXtYsCESDxZJ3RvuvTTr0FuCJGhhfwV?=
 =?us-ascii?Q?xUSgXR9evQ63S6MAFIgxAlO3sGg4Z9hC/Jydny12/UBN688SspaPpFc9+FoE?=
 =?us-ascii?Q?MjCLcrCYLJxgxGgY4lWmcIdDFoKZ1MpIM7UrLPIyPTl1YR0cm1O22Yeoe7Hk?=
 =?us-ascii?Q?5WILesSSUZWqjma4dt78bi6QfG9lKsDj6t59c/f9MXs4BD48EtId3LwynWRz?=
 =?us-ascii?Q?3oD6FaDBM1hdpFpour7R6Z0Uh4aAbdYEHxzYuztLpm5SpwhDzU9gNIUI3P1E?=
 =?us-ascii?Q?XzEVpn4hEicbt/O0FsWK0ml6Am5FFaTSh8evvPoqNyxwCDw8ozjTfu2oLxSE?=
 =?us-ascii?Q?2Kaqi29EIWLJ8BBTVR0UQCYuWXdg6MovruXMhZyoKgTk6AeHSK0hL+2CovVt?=
 =?us-ascii?Q?XVeE0qqk9tvgQdaVuc8nxnJl/ndNiOghL4vYMEdljIgRNodXtdGx+GvkLykB?=
 =?us-ascii?Q?MbmkYwQwtRXj1OMLIvUwJjMuKcEw36xfhfs2wi2BQUfChk5DOdMKSn5EpVb3?=
 =?us-ascii?Q?snkrlVMnmpjvev4LTWCYftiCEMDB6ocATmbTOGgw4rQnoPX/64wh2O2ZJaIi?=
 =?us-ascii?Q?gV5T0QxAq5VNGdkTzyJHVydYNY2tVcqKJLyudasewSD9jaCorZwmzOQlyA6E?=
 =?us-ascii?Q?DxyjEjeIsbqOl9O5ixl9MF9DSnv334hf1n1R0WWc54YyrFiecq0Q7aG9fQbM?=
 =?us-ascii?Q?zzsn7s4jeIsLPdZIPKYbjb4tDw9pL2I7J8Vcn4YaqVUqZfUuor6qQWflAxqC?=
 =?us-ascii?Q?asuAdMw5BsOGA44dUKqS56tIEnX/vB+KqGXi+CpZrYOGTn5crKaw6z1tx1rO?=
 =?us-ascii?Q?wHzrhfyzJa1FKeFhnXXkQIsPgU0P39CDlP9qIkYFHHaKLQp0EDOUTR6RhZxe?=
 =?us-ascii?Q?lWSS/chYYzpsg79aVliGy/Rfrc1rtw1ttza6p0f4Xd1oQqIbUPjTEKMHR4gU?=
 =?us-ascii?Q?723LKkvQ6B5z+8l0G+hKo5IsJuyxnKr0CYzgdZlEzKUgPH3a151WSDSnmpqy?=
 =?us-ascii?Q?Xll+VEGzmGZk0yYB0NQC4+xlz0RoWOr9+aM2eNxyCbVeqidFGzmKU3XIUl6W?=
 =?us-ascii?Q?5L/BxpeItUl06yirBXZKWsF2GrmWwcb4Cyer9YA2SzclNr2ojRS744Ryqkzw?=
 =?us-ascii?Q?T9X/hnITVZsY0paruaGaLfNuEiCK2jo8BmuL3MOjO+6fZXlsEytdQ54kfH9G?=
 =?us-ascii?Q?55NG2KtqJFgRCAHVnRGi5g0UpwHKlnlHR6gZsu64EK852zZEFjiH4BXT4YTY?=
 =?us-ascii?Q?ly7gpDT/z4BpfFwNVSOW38Gg+1/RNyFHN4LzfH5cF9X/1hzVfjYenz/xbNNB?=
 =?us-ascii?Q?SELDHZa2RxU/0W21cdTOfysZ+3L928Sy0wOSeHK2ADIWFBUHTJdVxO+ouwqQ?=
 =?us-ascii?Q?x1mY7rvIgcw/UhWt+kIu/3w9iETyD29FfE6I8hwsMi1cAAuAlLfoWa0J4eMO?=
 =?us-ascii?Q?Gld0zcj5Cqe3Dn0eQ396I5Z+1iRqWKw988wIcPZJnLX8LYLCWdmyxLGmU8cy?=
 =?us-ascii?Q?6FvhIwW3SCr4aD1plb15dqoYeOzj7CrQSQXHEgjLloc9JS+/yHGOLht9Qy2z?=
 =?us-ascii?Q?C4ucCIGugWb/94agr4E/mHViMBBZ4DIu2s39mhxwygKI4NrUI0XiX7qXf48z?=
 =?us-ascii?Q?N0QSQFlS4OQGp4blYCJ5gWtKgEfc189xALIPQDh1pNS6NjtuSS8sEQn2VSQi?=
 =?us-ascii?Q?sr9fmdnVFg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ab594-8301-4b10-4085-08de79a641f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 04:26:51.2737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PWzTSzJorkkIwvLnxCWWqhyr71VJ3mpbSRjeoJVgIuXxP+B390FhbQ/SJDSBHDInXcpIYjmycPkyN5ftAsWXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11612

On Wed, Mar 04, 2026 at 11:57:16AM +0900, Zhipeng Wang wrote:
> This patch series enables clocksource timer drivers to be built as
> loadable kernel modules, which is particularly useful for GKI
> (Generic Kernel Image) configurations.
>
> This series is based on the previous MediaTek timer modularization work:
> Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> The series includes:
> 1. Export necessary functions from clocksource/mmio
> 2. Remove __init markings from timer-of to support modules
> 3. Convert MediaTek timer driver to support module build
> 4. Convert i.MX TPM timer driver to support module build
>
...

