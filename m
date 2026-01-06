Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A005195FE8
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708422; cv=fail; b=e/0ce892alKTYbqI2VzlHeHzffnnDfr7CwZasvsewLQ/KA2axHZQGndCfnN5Kh46Dn5QcexAMa/adzwlMNldJogdvTb4XjsLSqIw2jQGAY2a0BP2+arZarVxWUXjRfLGorCnPn4HaKM34eR6KzovYUOfIwnHtTHUvxL/m16X1Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708422; c=relaxed/simple;
	bh=+27oCZccDLxp1JOV97HYQjfC6OrSfAG85dUXrsmCB5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CBunRB2332V7v3xaKXrg/U7GEnB2DAUgCRvMKcrDanr8Bfv19pcdOhV46JE7uPb26OLWsSNTj7uEYbD1Hfd1BonvyrG2YcTzZl9IDbRUL9dw5q64ovadvxJp6wgPTindgs0TEY/lmx5M+9cJyRhi4tBWxBanrxHrT9DRPZW/+/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jPiiQ4dK; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jPiiQ4dK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iREk/dlnt1vOB6JkZKFvPu9gfwN/SU8PMGm+k9VibF9JvqDq/82SFrqLI4wlBjMcBLzkMmS6KusqLbxk6xRPYyW/Ci7tQjEueMSKSmpUhltQfoUIABrNr7KEzk1mHSmfY0ufbHPk/LbDDxR1diFd8iUtFpCcpfyDL3wsmNWE6ASOp7ySgUmAhTarS3HzOnbQMcs5XVrRvt8Aj0kQLhSZ/Fh2cpNg6CajtAP+tSkusNjugnvC91ROKLrCoNwNw3tP5ITsFFF4DMTrI7ktbaXhHld/VlPTA+Z380HEjMesuPEhFQysxFwn6GUOHQFK7WfHbByJZqs5Uy7h4vaoCikW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+27oCZccDLxp1JOV97HYQjfC6OrSfAG85dUXrsmCB5A=;
 b=fVtQywrJuadGHP+A2BEG8iahYt9RRevqOak6nKn7qqbdsE0EvOs+JS/VnfrTHnekjxYs7xVft24Jm8nrkpLTF5KdmSrGmba2zdN1+GuM+8B61dgAqaECf+tKyczZQbbiJh0ZRxapyaDPomU6Uo5g1+9+fZRXwc26FoNnxSfxoqXv50bjHzX7a6TRcXlpkRb8hN2qjfZdQ9AdVVRzMBiq9ndlhkDFjMNIlITry8JKkP1AYK00l6CXcb/ZsGllGu6vnTRBjE7ZjxtTGtcyEfOXyph8I+VcQGeUsRHzAdmSHsPIn9w5iphAjp7RHcoMczaHkuxNLnb2v9MwWzdtaJqDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+27oCZccDLxp1JOV97HYQjfC6OrSfAG85dUXrsmCB5A=;
 b=jPiiQ4dKw7wtddh0GZboe7gxOYkO4lyMQWcg7Ql5VVFz3agiq/E7wWGYJDqVii3tVtdTILYFm+gJcBUwk74n3/zZKR5y/NgkkBf/LsCrNz9nHKzWFDsKJj7SucV7QntLwCdnT3HjhwoCRyobbge6Cy3sKYoTXBkNuM7dTGtU1GbrnWXOwWzMnqUI+9jX/92y+F61MefaNkzvM1L2KmVrovh03OOSsAEBhcjNgmiJjTPHJqPuMwOHzNjlQ+qYQN5IhVeVBDyG8+kFDOkzmaMoriMm2ODDvwmTCZb9ZiNk6KBrOZJdk7IeZ+Z2dntyis1NKdf1e/2gAgC7Jzz0BLScCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:06:51 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:06:50 +0000
Date: Tue, 6 Jan 2026 22:08:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: imx8mn: Add SNVS LPGPR
Message-ID: <aV0XVJal5SxSNjPa@shlinux89>
References: <20251230213401.219808-1-marex@nabladev.com>
 <20251230213401.219808-3-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230213401.219808-3-marex@nabladev.com>
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae6482d-4e27-475a-3340-08de4d2cd67d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pGfrX9Oeh6hftnThupNBmII6gbNFOh/A8ec6pk5Hyxac6+rmFcw6SlIVYP0i?=
 =?us-ascii?Q?xyV9KRdOQ2QorMC1VN7ik7EAE2sAFS7MnyqiAKKdAnZXbSR1vGmeBQi7Iysk?=
 =?us-ascii?Q?OC8vS4rQNUyB5OBnD3hndtJlo9CqGb8Rj5ByZ/4p7Lx2pzvHHDeBN7dokSWZ?=
 =?us-ascii?Q?Ddj6wNFexWYcYfi1nMC/m7NYMFDv9MmmKu/9A9QhFayCVsis2NnNJmP7hBYn?=
 =?us-ascii?Q?5Q9gujZfwjr7TSevj+KiFzBNFdpkZthcaK4knxRulX032rvu0aYxAOOrdF2t?=
 =?us-ascii?Q?US5dLfXnmoLaS4JF+tHNH9ddNum73AIxWOAxozY73+a/WfQ2ynZ/9nL+F8Dj?=
 =?us-ascii?Q?ml2B20NSoTixhyUFdj2fTBmnjRnIxvCVFYZ9cTEpcXYXcKAxa5LWhYWbyUgo?=
 =?us-ascii?Q?D7kzTN28u5HC0G0qkXqObAsTkKcbKC5qCB48yqdII7Sj8iejMVEwZT1Yu9rr?=
 =?us-ascii?Q?1WkMpH2CS7ZvtCw3tdfpSmWlytcmFam0gjVjWYeTOc5vxvJCPmUFzhtGqTjj?=
 =?us-ascii?Q?2HM9ndjnm4qf9BjkSkLedBM9u4vQX6XPdJIH6WGrsqf6TFIXrza/mK6NJpf8?=
 =?us-ascii?Q?O8GMS7QaavnXsoYfhNdTnyhYUkDr0sJpZQTyBK0GsDpAP50dUgkBCrk7lsdc?=
 =?us-ascii?Q?7f1Mhj0g3xX6ez0FfXsLf+tKtLB2DV5zWUTuyjOm1BOtMQbAJKJFDl0LXFnK?=
 =?us-ascii?Q?8xI/5sAJvrwgvgKE68pTEkZpYjY5Zz96RgvW/IlG+5CIuNBz6XIkKPXN8/Zt?=
 =?us-ascii?Q?ekQThufnpd4el8+NRcwz+sS/0jAvhOBgF9lqZQ1HFNH1Unhi68HAblHGrj6c?=
 =?us-ascii?Q?40cAtsyw93F+v4VL7j5R6zTOv+wlnBWEjXoyVIeIjdZf9jx/lDi+rgIyYvOK?=
 =?us-ascii?Q?idbuwR53py8qLDy8j0SWQw2moIVGus4ko8YES1rCxnmMJeFx46o/bXt6wLyC?=
 =?us-ascii?Q?x39MdKZoFDrZx7wpwEYqJHdgXM9JeNo0zodfJuco1qnV5FzU0ubG7ljESFGS?=
 =?us-ascii?Q?YJNM78VwQyOtmAZmUzoHimEyH1afG6jD32Qge/kXRYZFGer+Jskz85OLAoyr?=
 =?us-ascii?Q?AdStDDdiDGx3bvCbIQE4ou9CTfRyvAzQtAO+OQ39obYVzJaph327J4q7Wpyl?=
 =?us-ascii?Q?MxaGWm7zMNYJ7oLGap1LMxR1u7bELmHfJ5CslFiQUfT5eR13I7zEuoNxoVJG?=
 =?us-ascii?Q?Om9e5zBeTI5p9BdI821WKUuOplgXNyYcibLwJep1APRVmPXlm96iOnu212Hd?=
 =?us-ascii?Q?8CBv+tDeCTcQrmT4P8cC7iJ4JWH9mxtAZIhzNA1gPXGUgzRqD3L6zqFBfRj+?=
 =?us-ascii?Q?VofMWDVDSRoO6rU0CSSIx4fT4IkTLMQ0No8fPk2/mzd38w5igdWIfoGhAJxL?=
 =?us-ascii?Q?xI8XH801OxRRXtERulwo+BfOFPtfddPWSCN1HE1oQ1o3gQ7CnnOu7S6/IRKc?=
 =?us-ascii?Q?ueBs4dDlaOWi3SxOGxzq1uQm8/CsTdJOPVA7HvarDu5Tt9bTZXIQcJMt9jn8?=
 =?us-ascii?Q?3yqXJ9uulmcNGMFAKFtgMfgP6kHTX7O2nuGV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O1He92XcB5u7J0p2zABmmxoEmuCtnXOJqhE3nxG3+7OZ/HIDABgSqWqF2Zvx?=
 =?us-ascii?Q?Oa5/dHCSWQGYIzJwQC5daHZBKhw+K7FxQ3gECjcHGtVTljA8Tt/GLphYsHyT?=
 =?us-ascii?Q?ClrJNPDGYnT+7vUZ13AveDP1Jv10K3TESpwMLqet9zGGoHiq9h9U3yNzY0iy?=
 =?us-ascii?Q?ehge9p73jPlqIhqQ7FAQdBkHBFt1EG0Cq9RyyLLN5JB3ocsmjkOnywdORP+C?=
 =?us-ascii?Q?kVq1+sA3MPPehsZzPf9hhzo1mnysHsUyPbIXeiUoL04voTDoZiyUDnckLInF?=
 =?us-ascii?Q?UacErQELybvh/ZooyM7ZB0A9/DtgJEMW5VCORCY5bh5JzafHiq9KvUp1M2b/?=
 =?us-ascii?Q?8CnhmQ1Y6PPNvJhWQcOuoXDb6uZgvsLv1GHyaS0/8SkbFnSiWmWxF6tJ479n?=
 =?us-ascii?Q?6UI3d/vEIeC33IQlnrTozN2GeONM2zAIP/J02s610BsCjitukdscv3Mwmvhe?=
 =?us-ascii?Q?5uUyaUZIoCcpEc28QRm6S65ZNxnB/syyamLTaiPjM4Z+4wDA2BDkjV209yys?=
 =?us-ascii?Q?tdPb0j9lcoqFqd9FFljNNYKMXeNV14vDnjIbEuXDm9Bn4XElr2H6PrANnQIu?=
 =?us-ascii?Q?ntdIuXsiFKyEu2OX2W1VkUcmDJIr1m1DyMI2ts1P5EjvW5eHiid9s1bH888E?=
 =?us-ascii?Q?ucfSnvYQsYQT4p3k+LAnWWBrSTPhOYq/ehsz5PMBFqx59T9XYuNjIyW88ZEZ?=
 =?us-ascii?Q?tR8fsnPWO8eSfZ92NzQ87JoXvIGgIYMozs0BSbFOlmE/LcGa8EXru2eYTb+0?=
 =?us-ascii?Q?S6lzDLZYiHhYIM7iXfWYpPQkf27jXsVvB5NhhC5idUfyWIGpp5UCkeUlgZpC?=
 =?us-ascii?Q?jlTj68OPwAzy/tDAEK8UZsDlyX30MYEVJrp1HXBrgL9t4MZ8Tk8z0uOr32MB?=
 =?us-ascii?Q?2Xvs4bapOGelQiOcs/pNGvUR+vfj4Q9cKaUDW5trW3nlbKRrhociiOZGL/jM?=
 =?us-ascii?Q?Y5BQqAqO6frrgfYVFHeYbHqqKJlHutBztYwBB71G12TR0lXTUKifB40KthtL?=
 =?us-ascii?Q?/HdfFsZlKKJAHHW1kzsbt2Dzi0uvH5d0XqWbrNlp0CWv3ov4IL9KauBTa6z/?=
 =?us-ascii?Q?HVMAHSg0Q2Cid2OApBGNqpAcudBqErCyvLMj562k3OQJpR2uXNZRC0IITyD7?=
 =?us-ascii?Q?ucRhVZ+LN+F8V19DO5MIpn52Pfxpb4ElF5Wuf6kUI0okoh9+YJoT55xk4XpU?=
 =?us-ascii?Q?uBGyFSyY07WvhQm5XHY3mtqln0EQur9vNViXRO6yum5BubKmCuczXOFmNKxJ?=
 =?us-ascii?Q?FP8CeGAIOhYLuJaEgNa/ZYa5DRcSX76xMiBw/TVH9exRyC/g7FOYM3WBLrIn?=
 =?us-ascii?Q?xu1w6MfDpIwhJCHesAnjoFVD4HSfq4ZzfCQSSoXCYnl/xHgkxWvtbXBGieU7?=
 =?us-ascii?Q?6BAuPWO899zNUARvScdWzitxVspnRlS1/APFUO9Du7Dkd1ejTAtPTx2ezqrE?=
 =?us-ascii?Q?qSUzYYUfHrxc0kzJ79dA3mRCB/8S2XSwSVljk9Pnna3ag6S+dTuvSTx8dC+i?=
 =?us-ascii?Q?j1fdKVNmE6iv4YL98YCbBqIyNBFxsLNJxAVa9f4UJGu0Aq/dRa04CF+LWpok?=
 =?us-ascii?Q?LVGkzsQ7gAV4su0cv75CAvQDx+EKfeFyazrtKsULH9Nl6mShU8UrtABF5VFo?=
 =?us-ascii?Q?lDPMEM0OcV3Blh/ize4P9UqPeF3tFnbdo19kI0bPh6ndnnx8IlKEvUvJ/1wf?=
 =?us-ascii?Q?KOUtkL3hK+nNKQW+cgIhcV2eodsY+n21R0SVC1OgH1I5n+jwcPvxrX16iGrB?=
 =?us-ascii?Q?fISlPjiOEA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae6482d-4e27-475a-3340-08de4d2cd67d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:06:50.7577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFSzbxhWHNtmVwhoeJ3lm0ROpeB+1RLD1izL+k9IGsrsCwGcvqIQ+TRxR0/0EByKspCAOWGThGufSSnkmlxlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443

On Tue, Dec 30, 2025 at 10:32:33PM +0100, Marek Vasut wrote:
>Add SNVS LPGPR bindings to MX8M Nano, the LPGPR is used to store
>boot counter.
>
>Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
