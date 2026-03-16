Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC374594A
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646196; cv=fail; b=O9JaNhi4kHmGgQtf93Ll3bzCKMAmu0AHm6d13btMMY74yubi9R4XImOHd0NinSV2BTG2t+eEegkUXk+dQyMzSC/RAY3AMjIV/wuP+dwU7XCeZy9j9xYJveedES26kBjb2A/lKBIdDYjnOMkPUBVWO4rPMdWyIsrVXLruoWF+wDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646196; c=relaxed/simple;
	bh=v0YihzDu5I+ROYzGiR3gqxAa80MvtQyHh+5e50/F0Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rTpSO0AUqKmFs/uW5w0dhaRLgnqCAl6uGizC7Q0YfqJX5mJF0uvmQq43ajM7lJyCbxEnE6lx2YkN4GmpX97BjUY2uuEFQBNcXspcrJETSMNNIGEbWzP0mvyToucqKhkv8atE3N2FMz48HEs7vfZAWsw3jgR8Vz3lv+4WL6/ZCB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bh6XNf36; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bh6XNf36"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pa4p+3nO+Ce/+J0DJ2VVBalDtSXXdJ9rIgu96HsEtsygpYZ4GkH0ewAxz1McfWDsBCwCUadDte2U/GaUY8GewzXwcUEb3YLLubbUgsV8AARJjH94eT2j8sBm5u5T737PpLLzx2sfZ4DZEvq2rfxmIJ9eiDNwkYnMOMTIHyg42PnjU2q0XltLK8wiPnISjMdoxsHFrnMICG432UFf0nRJm2Ue6JU+WW0c/YZI6p1TN8nRVNDeW48ztVyT4a6/5QMfe0zHURQ59c1dnkaO6+l3aW+AsA7T0FcE0HNdFQ2mXErlsSejJybFfHuUbtVk94CTB3hkvp6Q5VNHshHIXRr0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/sBAdc7UMNW5sgH+y53njAspkReQ9/w/DIxCsW1nh8=;
 b=YRhmXsPs57pSSXsLweV1Mvh1cbCh6yF0Oo4sXzjCoRuDBv5S9qe+UwhxlaoVT3Gq2ozg6EVCwtKQXSuwEp1tjghDk+hXtoBlUx3UMu8oJwfeRZaHFli2fdP39Z9BYrF4j7uIi1o2ugB4kPxnunSKrAAkVXFJDvwGudDVeClBZRMcbn10wIrbN9k1gR3X6L3K4MkJi4zjMlcjnCmxoviHDaGV0qf6iCqgpJKICnofwDxgc/Ne/qVP11/TdXEOCbiGVJVBdnBEgEfIq72oVRrpcbHDOro+FwP7I2/d06Nv4RZCLjlEtDAKsMBVRJoyqJ1fQ/ffpl8p0xxmQN3mJ/nICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/sBAdc7UMNW5sgH+y53njAspkReQ9/w/DIxCsW1nh8=;
 b=bh6XNf36UMqIDd7TaTcgThRl/o9PPiKTG7qCIfGXu+FYYqas6v857TJZtZYNNRqkGA273YX9iHUBPNLpEvQgXA30rct+uOMngJcztV8h8SEloI08n+jZ/fLDbK8/FVX7TvGFvGQzE5nAMr7He0hoP23Gs9tSP4Xk8PyvAqOS+A2Ut2Il/pLGRfYFkrCajculr3Si9aoKx9U6e32ajdcBvsBSfu/CB/QWb1SN6OrD5V6Y8j0lpNtMJxbsmAcdbQ6jhcP1YlIYa3UhnLd7Ep+LkZ01ga+RA7O4wSg2HdPql3NhBPUPk1/zi6Djzm+a9KwHMXtJHvKpG6hohc4FqIgNQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by GV1PR04MB10535.eurprd04.prod.outlook.com (2603:10a6:150:204::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 07:29:51 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 07:29:43 +0000
Date: Mon, 16 Mar 2026 15:31:25 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Message-ID: <20260316073125.GB3683539@shlinux88>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <f787e9c9-004b-4b34-a122-7b1cca3a2970@sirena.org.uk>
 <d57d9f4d-098a-4663-aa72-4d3104451aae@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d57d9f4d-098a-4663-aa72-4d3104451aae@sirena.org.uk>
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|GV1PR04MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c41b0a5-d1eb-422d-c93e-08de832dcaa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3DGEgdGPM33yW2TTHBXkeKn5BcxrR6vEJ2gMPR32Aie8BAkyB6WmzlGArJlUmzOEkBiQJCuGvpSzm3w7CWMs+oTr0hYkwN2wyu2KemRPog+0QgR1wUveAylvXreQo+OFPQLcF5PT/L3dcffZzYhjQ7zjxYwNECriy3PqFVl18mH+t1FYoqLkmxoGpwHUkzUkeMc6rJ4QdO3SFTtoSLmkj2xdfWShwl7y9nl68U7iq/RBwx8lmxS5u5O2WdqlsqgUL/Y8eG3Xc7p0ZHDrLLd1TQP/K/d/qtXLRcBb33Cs/XUXX5JTZtsKuU8HcvlICBPoTVDrCA6pwLGiqx6ph5Y+O22Ct8RrWXATkkXIU/EN4kqL7jIHsGN1bNITJmY81b1s+Mkk+wFSWClYNP/QS4zivAExamkU1Zs2tFhoAhXOQrY35qht415Pb4Xf6YYPzVEu0AUlxrrhIqn6c2Nx5yO4hbD63fc0HhwFmb88wPMY3zbiYPK/3nCc7c/gVVCSbcrYYXhSDRlNhk1bETPPYSOIkyhx1o++3vhFyRh+9DJoixkx9N3g5mSOYbsQhpt6EzcgQxaVhvAI0r2Hcg0TYDlgjdQ0zSNXdJnFS4wKtfQUlXdRnh32s9dWVv2EGbENe2Dw+KpvteLFAE0+AOpTyVZ9Nnuup7C7/y2q5BYIIPfgFi5FYAcBnnbGSkUPcRZGNWIaCb5XQj5HU9RU0WLRcsZ90pnWp9btoWR8O2vTeBe/EDwcv1WSRzFfnSZJjmD6Jz3RIDFpDwQSQKqaFiJ/71QQ4JuETQUJuZUP7Ml3EzudFCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pZ1iquTdbiz6Slf+Eqpl6d4gw0pMjmg466vu+jsJEPzBctCg+HO5zeOYxU5m?=
 =?us-ascii?Q?K86b8041/V2QKm+486QJWOLkcqEMyByaf6qut3QMRAonL3nr5/sBMJPZysd1?=
 =?us-ascii?Q?6vjnkcOxvytfcVRZdKfJyF8lCAh5VQo6mY15MrdHbGAIAGZ0Se/RIyduWIoD?=
 =?us-ascii?Q?hEMzXJSGr0s7N76S2yG16LMuWVXX6JlEuW8no4SRZYH6wKYpsYGUXKgvpVu5?=
 =?us-ascii?Q?1LrbvFdrmvhj8CkwwgJ5M5mq8ySq4dtt16PzAxF5HCkMtHcb3rwqN4vyQf79?=
 =?us-ascii?Q?9j52K1rRAGIJzoCJ2IfOtKNn9TQcqhZ3cx0h1d7ZkF+R0LGNBOOkoRAgGfpO?=
 =?us-ascii?Q?5LGgd6u7/ZSM8KQjenntGKUS7oXg4i0ppEHuQ8R7U5mNq79B63keyAOzGL3n?=
 =?us-ascii?Q?cKI5ylquIWuAbtFXOVbgnEA0X85aE08v6o3kHFZFWDaARFMVS208+lJ6rO9N?=
 =?us-ascii?Q?PQ6O+XpAuT1vR+cn7jqBygMbHdKbjDNNAvOEoM32J6r/X5PgbdpKKHtCjeAD?=
 =?us-ascii?Q?aA7QH9vlrG20VbtBzzwmxMaJtddij7TPGY6+JHHjUPacOFOfm/EZ/XriaWZr?=
 =?us-ascii?Q?dNJ88u/0w8lJFIss5Fr79qiXp8svtDkr4nzhB7uYEHbj1EPo0vHM8So4nAfr?=
 =?us-ascii?Q?9iz06rNc3nbh7zbpYPD3adcDkQddghef169bMfxeniNTUGNjDTj4x7+CuFOk?=
 =?us-ascii?Q?mbzrNN1o5GEu8ct4A32rPDnCY4SIGYFXRT/dE9OBpZKQXSOhbuaq4XzFbcVR?=
 =?us-ascii?Q?JJ+s7ZBhcWXfyD3ydcu/WhqlZj8z3ecLtYyGxW1SU56R6dGYrxHF3h+6sEE1?=
 =?us-ascii?Q?iql68mktSACAK+RNlwkBq1PvsNaKs1kkXBFyX8wA4+TKiRs6Vl2pSR/+mneE?=
 =?us-ascii?Q?1fBs/P7WDyn7QDRpLQepIb34skpNprQxZ4U87CeakHWyuSkEFsjNj7iwz8o4?=
 =?us-ascii?Q?Ibx8mvweRW+OP7i48+ozDFml/FKU2oeyl+BDEXE8j5btX6MZhJmE9CX/sCl3?=
 =?us-ascii?Q?2d+3Z4zG+0/Vx4+IIKYUspvNCyn32lLJKSrcK0jwChQPuRN5Kt5X3uM5LxmZ?=
 =?us-ascii?Q?jEgFF/VjYCgXKPU2JNbn5OiwcQPd6O2+sBqy2FXVUuqO1J/sC1r8eupBwOlV?=
 =?us-ascii?Q?qnO6HU8bFfn9I9aSfEYBMTEzVztUddYo6JBTSvRtMvbdqy5yB84UGaEfwITM?=
 =?us-ascii?Q?JhWwuqBh1SaRUqg+dJhdDW5NHQN5oJ+BvPz0ZqPaB0cQ8KRxxXcQ8EF4Z2PC?=
 =?us-ascii?Q?PwQUThISrlvopgCWyENGqlmTggEWEaWovNZvndBBs6iX7BUSPABmCseRQuJj?=
 =?us-ascii?Q?LQc0hGAxhNr77HVaWwNiNWAmzXf3W2X4e1soZsknD6QEascJkreUP5kZhkmC?=
 =?us-ascii?Q?+q4OsRey7iHmm6tuDpouAnutY5EQzBbI8aclmdQ4TTbz0ZQ9JdjUhylb1k3P?=
 =?us-ascii?Q?vjqv5SBKpwUQHCTM6cWMCEB8Ivc8wmjN13ycrAZLn418ejBxke/5EuHi2ln6?=
 =?us-ascii?Q?LPLeCp3gQN+oGIddn5pAEiKRf/cD0VQb/TxOi7P42om9UbmtJJjnjahxKHzU?=
 =?us-ascii?Q?gJZyDSLCqugDtgRUxOcnIME35GPJcW+U03lMVBZ8RmE4ndD3xDv0YUg9PpUv?=
 =?us-ascii?Q?qvP006yISZT41nD4e4HfC0blGVU0asAPM1Avy5150mVenzJwKJ7toSAqhGi9?=
 =?us-ascii?Q?pTXqjtt+4UG1E5xuNNPTYagykqEfglxIQWYWGWuoM+TTvaeFjLs3gLkwBBrI?=
 =?us-ascii?Q?aTSnjxs7xw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c41b0a5-d1eb-422d-c93e-08de832dcaa4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 07:29:43.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRYHFQeAU7T5cbH04mWI3KNZB+gesSWvaweGf90KVRylJDPhObeoCFBDAbSkMrE9F4n1vCXD7IwUqZ3JMWN60g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10535

On Fri, Mar 13, 2026 at 04:27:21PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 01:31:23PM +0000, Mark Brown wrote:
> > On Fri, Mar 13, 2026 at 09:31:00PM +0800, Robby Cai wrote:
> > > The FP9931 regulator requires a valid "vin" supply to operate correctly.
> > > Therefore, the driver should treat "vin" as a mandatory supply.
> 
> > > This patchset updates the binding documentation to mark vin-supply as a
> > > required property, and modifies the driver accordingly. As suggested in
> > > the reviews from Andreas and Mark, v2 switches to using
> > > devm_regulator_get() since the supply is mandatory.
> 
> > Please do not submit new versions of already applied patches, please
> > submit incremental updates to the existing code.  Modifying existing
> > commits creates problems for other users building on top of those
> > commits so it's best practice to only change pubished git commits if
> > absolutely essential.
> 
> Your v1 was at the tip of the branch so I did actually just drop it, but
> please don't do this.

Thanks for the clarification.

Just to confirm: since you already dropped the v1 from your tree,
does that mean I should wait and only send an incremental patch
when there is a further change needed?

Regards,
Robby
