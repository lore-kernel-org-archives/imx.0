Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A547C
	for <imx@lists.linux.dev>; Sun, 28 May 2023 14:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHBrI6x3527fH7J1F6qDyfjWaYuo1gFegfj1QoOO69QE7PBPCuMO6gyhmnVxAWFb9eK15Zi/LuBFS+UVzIYBIN2DvufXMsvgDtqmCkgPX74Dz1YK6rEe60qQXTLB9OYM0n0VGyUqLwZ1wi2QFg+XCzPZEKW4UgeZTb9ngxKBIPcbwEorGuquIwUQbArdNjag28/wDo+asGlIRVKgpfhPbacVl6CR1ZgaIzelquY/l5UmBGKZ+LXagf+LwZ7Yn35MeS3TC3IA/G8NoqeO4V6lmhdzLZtAtk/cPNWZqFLPErmcHVYu1xDuu0qaxy3uPaGp4B4HXixBBZ+3CKrBU/xhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bywu8CZt2P99Lf7tBuJzj3TCmW1/lYCpRMR0cCz51A=;
 b=nEjYRkCpx11cTEzPja8BpxzUT/ZCUXloUNIf5l2OuNi0HrfBwlMIHQzrehIAJl4Cuqn/h7ujloiCTExBf3gApXt6MeXAkzL+MfGBuU/FaJCJgT3dyof8LSErnLTiY2C7D92fSDekHx1kKyedb3o8mWxPiLtl5v1xd3/E9Nj2aM7wLDmHUX1yUsryQlV6Y42QsgUKaW8e2/gfkybrSRDYTZJmMPUZD8IAcGR/EhIfx4hrMpFwoEA2q1SvvLvkoDk63qL0hlhyg5Bggc/jDlWPdXls9lz/zTSGBGRk8QYM6qcCjyny8uV4sVWZqvHjNv4+EaDoGNQlFBTXgMTKZyLxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bywu8CZt2P99Lf7tBuJzj3TCmW1/lYCpRMR0cCz51A=;
 b=VIn3+wUVqHhXv+cT2ds33hFiRrjt3kGx8mnM1lAvpKS/Yzk0nepA2Nbj9/klkS8mbmxXWVbLujwpJknMaPJrYBVqA8XQ5nXcUzZ1/3eUGBoE44JaQSemAb0eZbxzS5hS6laWC2lcBX8K5aM8QTwHtZkR04xs1ge4a785kmHDAKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7856.eurprd04.prod.outlook.com (2603:10a6:102:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Sun, 28 May
 2023 14:33:59 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6433.020; Sun, 28 May 2023
 14:33:59 +0000
Date: Sun, 28 May 2023 10:33:47 -0400
From: lizhi <Frank.li@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate
 for lpuarts
Message-ID: <ZHNmSy6x6KIn5QvM@lizhi-Precision-Tower-5810>
References: <PAXPR04MB9185B83E1AFF35F1CED8857089479@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B83E1AFF35F1CED8857089479@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: b12725f1-b000-4933-a79f-08db5f8892f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iUZe7ymyQRDExYSRilWIPMaoNssSDqaqjHaPRuivENIYTxKCaH0DbyDDQbzR0OBLas5+YcHHKs2/vh/FPd8AK4FCo/qw0gd4ncOjcYeNmc8MONe8eNP8yL1P6BDlZXrRU0osNOkX9EbdF4NGYhOUgGXd52DnoguX2K8VoSgvlpZ0wRPuodmHRwCk/NSQcvoAYaqSWrFStZwEEl/IUo0KaECTMCcHNgreME1/7ErL6v+Hg1KJrwz0BhCYF1ypBOBL7ZzZ5ltGa55zF7s+BNA+06BdrJuxzYRDiloDtF7/1EaDNHjF2A0eXEKeR7oNwudwN5R22mc3XWDVY7ANbT66T0I3oDVLhxE2CT8+qeCXzdMVKjQwy+9BXRXpRspAopPA+peOOSR+SgktISSEGJ4Xs/vIxgX3YT8f7MJQH9jClvfMhLok4WGn7hgg8avEYDj2ySHvwYPxQa42kmRHtLwC1o0L3LrWFbz29jbSwoYsZGlTWa+6JVBCxMIa3+k7Xh0xlwz3374H4A3q56iooZWfCQ6Qh4MOK9DAY+aGmh98eSL7K96+VJ+w6K5KfZAaPrxiXOAqrvdXii7mhFfG9agKzbYQbMMJ54eUQZ0x7chc5N9I6NwdMJBpOqoQn8/VXsAvlKnVKXq6WCPsqP2N9imqgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(6506007)(6512007)(9686003)(186003)(2906002)(478600001)(26005)(86362001)(52116002)(38350700002)(6486002)(6862004)(8676002)(33716001)(41300700001)(38100700002)(8936002)(558084003)(5660300002)(66946007)(66476007)(66556008)(316002)(6666004)(4326008)(6636002)(43062005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cUhcv+WwuRh843NOiGkobHB2qbxZ6rAysJ0WszEeGd+E6LcEKbz5LAA9aoC8?=
 =?us-ascii?Q?a4h8wgfEEAqa1QkUmHfq4vMzHOPlqsDwJrTel1C/dw7O3avlttDhpa3tWLOH?=
 =?us-ascii?Q?7hJUP7lltd2GXQEb8n8cAbuczStjjxVi8Kwt//FCXFKLrDIyQsV2rfvTa5WH?=
 =?us-ascii?Q?NA6//OoMSKwc14rDqVHsA5i3NW1CMAuN+pAeg+CJA4Z5YecyXKb5uppex+Tj?=
 =?us-ascii?Q?X1ZY+3mil+r4FOqw1/2bs61P7OXu2ErjkyMVnbGaHSHbRXsAM+uziN33W3PX?=
 =?us-ascii?Q?7Z/Vj5w+24NNucHqxXOct8V5IxOEYs639MrJ4jpTQEF3u3UM9BNXAwJCmnpa?=
 =?us-ascii?Q?UgleyCoZQz1Pj0+IWY4/grJK4VuTD2jgl2+KtQtXMIlsk5bfXZsBpMFAyoII?=
 =?us-ascii?Q?USnYaf75AaF/risKDPGtDWo4XSXZSUI6BB/tIAw2oK+DPlciHjXQr1C+2FTv?=
 =?us-ascii?Q?xQhINCEuLmatXx60yzgajTA7j+GEMONFwgzl/ZIfV0n9pWOzL9W9O/GjkF3D?=
 =?us-ascii?Q?+WGrPq6UFtsVc3UM6YwexEYLfhBOpsZfNLbuL6WXA0dBQxjABgpwljWJ6gkk?=
 =?us-ascii?Q?csyaRXsSb0CFHAanlIULuIXljSm+UQRoo9hj2ty1Uo0eQ6Fx6BKN9XQA1Znh?=
 =?us-ascii?Q?YzTYLIXPFTqN1RDKpw8C70zVysgeBKPxEaJ8eT/m3dQ56OpCNazxZd8UjKKq?=
 =?us-ascii?Q?xxXHeD1lT3+7IzXefcCZhBZ4HHa0f/DB0UDA7nt0j7kL3s6fFPVJApGQxHdu?=
 =?us-ascii?Q?xiFy3eRiOIPJARLYEIGCpeNyqKlRAAMocmtOt2ercSDo3yUANgohQcIPXJQ6?=
 =?us-ascii?Q?EHYegtQgmQLgJgCe1hd4+05nFy/RJT1yQBrlewzJG58WoaZKLhJpfKakPvkI?=
 =?us-ascii?Q?OLhafnwiG+R8WrN4zeVhX7WuSaH/f1865eRduPrCaF7jqSdargZU88sQEb5o?=
 =?us-ascii?Q?1zBLsnrxaQxwDN0oIrf1uGTAwc7ZZuUU4GXVgBs9BP0HLiYW8e8TzW71UrvQ?=
 =?us-ascii?Q?fkWJafCD2teFiLEPdzziQ5Rm63coEGE0Gmuc3zlpTFOMvSza50/sc8YA+Ttu?=
 =?us-ascii?Q?ZxMMaiMaTcA+mkbOeXUf+jwzTGBjdkJqwdJv1ZF3mB6PkBIu1zzldl9QOvHD?=
 =?us-ascii?Q?5xjfotIbhJuwtt7YiaIv0w5gfPSxgqR4Za7+FXvJPd0HU2MSFQxlU6942wIc?=
 =?us-ascii?Q?RWeMFYCBCTtb5v1DoAhC0OKcmpTpnpOHqM3pDo9Z8OxyiwO271H9LjScwJ4R?=
 =?us-ascii?Q?n8VveZMHXnZU78s5zy0eBbTLBGLCRf7D3ld5CaVUT0go+Pkw9JZoBtifp06l?=
 =?us-ascii?Q?Y5S6OEs7BqbubbY465myr/iIO5QVITtmAIj88WZQ2eENy66atYcz8G+93IQB?=
 =?us-ascii?Q?toyK0uOZ24mce+ML6QalwoT2oEgdAzP2qHxyVYZ+sm9E0ScUyPjsSxyvJhes?=
 =?us-ascii?Q?StqUEO4h1VY27yuzgLou8Y+BgemJO32LtQAbJV459gLYfMLpRToKx34qE+TU?=
 =?us-ascii?Q?9GzdNuBYiMl1K9tJ3IkQ/0GavexB0Y9xvyg9vmIbHYNqHV6Ozzxdc+Dqq+VK?=
 =?us-ascii?Q?tPSxoDvXNlhiQutMIH0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12725f1-b000-4933-a79f-08db5f8892f6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2023 14:33:59.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/VlHFRWFcRTChNmbknN9q8BIH/q2lHfVD89U78itufv/ZehhksSg/tlVNI1EI07VSwIjD5Fal3mXKCrZOVm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7856

On Fri, May 26, 2023 at 04:27:23PM +0000, Shenwei Wang wrote:
> Test mail.

Test mutt include maillist

