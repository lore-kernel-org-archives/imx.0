Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF07C
	for <imx@lists.linux.dev>; Sun, 28 May 2023 14:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX91muaSGJnX8fdX6zBB3S06rqHVyQ8C7BNGbatXhXzdt4j2uNt8Q3sOcVH5EBS+s8vZlyo2ErGtJJKhhGi5hMuupk7ex46w3MskOHpXxfE4gm0TZDP/WW1lxIxtlUuAEqqTuMX4YrcRNZSjLxSADcRMZzDPyo5ZkVa3TgXs70n6hWxEIKMkTOlBtZT/8y/uuhJmVGJfVZMHhok6ZdxIHZbc/xFCXyK6d3gLx0T6bX/SFjbdDpfLb424wilImqQj/Cd9zmxwGMvxRN+4iU52iGaV5HGtnuxdgGT9FVlWEKkc5SjA5qQvB0EV9pSMkEdFuIxIL9N1KmK3CCGpeVJyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdwnYrJ0Yn+IZCDebUybJlO2qD//vVY1Rw+avop02KY=;
 b=bc4YA7/rsaxB5tfbaC/zJUoSN1YoJWfapzBoed4FveiitIQmD4Ef3hRkAoruFywt39eNFQPWEcBY44x0Du1CxmtyAwuY5qCEliHlW6PIiKSu+94Z3VY+hREmPk/CE99+FJo9r43Ce4Ho/TfDCzVVjfR18HsUbUNAK2j4XRFGwyuienGmKlBiw8PX5t62cg9u6nPB2EZWkVfqwvM4NvgXyMbZURxeuXLoIGLzL7owEVe7a/GmMpXyufMzDcstJ4pbPxD32QlLzfZtjXLAS0SaRq593mP1zn7qt7XEEMdvGA6wEClxzOPSoQkuK2wFiSynQXycJTVv1d0uVboepR4SFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdwnYrJ0Yn+IZCDebUybJlO2qD//vVY1Rw+avop02KY=;
 b=sjoQnqgyvPvfvp6YdOCMr9SvU6eyDQLNXc92EIGVsucr7TW5ONv2BwP1VvN/6cARghwrIX4HDmqT7Kc9X8AV1lRrdxRh3Uv0kh7GRvobS7ACK3P9iSD7bQa0EbzN/NfcwthKZelTREM9islV3+rmAUgydail0p0SzveklhX4tqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Sun, 28 May
 2023 14:44:46 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6433.020; Sun, 28 May 2023
 14:44:46 +0000
Date: Sun, 28 May 2023 10:44:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate
 for lpuarts
Message-ID: <ZHNo0kBUONQobdEN@lizhi-Precision-Tower-5810>
References: <PAXPR04MB9185B83E1AFF35F1CED8857089479@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B83E1AFF35F1CED8857089479@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f31c34-130e-4490-7045-08db5f8a14fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bHdmqjU//Rmth670uZge8Nuh2E+/lvflDTdKGbMdWJjbl4UXqcAD0t1f+nCgL+wOe1ur4uxIzhjKM3ooVV64Xw0J//qJB+MBNKVMeOvDXQtQJ1QK4qsHOCQghOkrWXOcbqXD9gbEp5KE229OY6QYTtHW+CJ5oq+cWMD3nmUP5xrkxk9Mhv5eu+QdRDqA4SRlNZWYVJfLrajUxQKusRI0/YDULZjg/mTmcDV4Y0lxXSTE0vYr5PvfsdK960hyeWFwHQHWok/uDesoskHvaPtzZfO68oKInyjzDt8++gfOeNLkjm04reReA6BLP4EVAXbsB/0STn654m1O4s/SrAc0UWN7FA4G/mUZdFOg62+HxKzXuDAjFn1GKEbJQqBc2Nll3YBnb9ee06qV6d34noR+LiVncJtJLk7JDrG8BtNkNtpjy0cyqWkWbMWRdSWSDW6jI+jiRU39+J/Sp02kvLDQOdRuXmXb2ByNnCaU0wNyn5rwdkyirScCS/JxTdVPPXLcnjbNdxo+3a6dL8yjrIc3+/EHIYlz3LvHbFcaZdHUCgeGrNhqYb6tgn0YOWI4wDXhqwbG4nVED+vavD5RCf3ucMk1PwDBddN9mR8ryFnf3N7jPveM0SHLmBAyjK4qvjkb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(6486002)(86362001)(52116002)(41300700001)(33716001)(478600001)(6636002)(4326008)(6666004)(316002)(558084003)(66476007)(66556008)(66946007)(5660300002)(186003)(2906002)(6506007)(6512007)(9686003)(26005)(38350700002)(6862004)(8676002)(8936002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OxVpKVZ7sp4ecLtevF5jdaumTCZd9R2vT4o+nejGp464w0c5MN3YqDI5zS28?=
 =?us-ascii?Q?AcaX1gmwZwm2v/PBEQiMV3VcNZc50hPnmVUQ8bce9yiW8m6b6FbMq1+q9inq?=
 =?us-ascii?Q?TUVIQ13hqWyAoJM+DYx4f7YPzICEg6n1Nlf60T+/xqFzF0+pJefSZDv3t/Vi?=
 =?us-ascii?Q?yjqfluZUyTch7cMMQ4X16pdM0AwzQneGm0L4ZJne1N+N2kzqfYal0ON9xIal?=
 =?us-ascii?Q?A3FEX57lTIaLVIVmhdD03GW2lyUDjgA7To5P8EJqCJ1YKnOWY54kDnRsAoI7?=
 =?us-ascii?Q?pHVXML68JDuVt3vYbzG7kCUhGRZh9Z91yl2FcbAzDf7euNCsbzcd4wmt7skc?=
 =?us-ascii?Q?napuK1rtKk7wyLIdpGqWHk0kg/frQSE2E6SUjGQia4M02NPb1EpZauaKGFrG?=
 =?us-ascii?Q?RHD9UTlQjqDiWo//crDGj1NzwEihMQ18S5ayBKiGLYWiUh6OCM2GhAWw+cba?=
 =?us-ascii?Q?6Y7Go+BAm1oaUUgmBk7c2m0gnK3+rInXNiTV/6TzCdrgs5okhMuP7PMGMwL8?=
 =?us-ascii?Q?oekCK/XNInQKKB18Plovf4o1yt7xl83l+jNkWiGb0qHmqGgxsmcj5hHizXEA?=
 =?us-ascii?Q?uOyYaLPMEyjyha2UUGUJqe8z+Iw06r98JR6eB5ADzA14rDf+hyGZqA7dkTM/?=
 =?us-ascii?Q?7EJ36jIqvCcwof+/5VTtNoQgOpCcYOd3T1zh5afR+bFRAlWFtpxlFLKSrU1j?=
 =?us-ascii?Q?vZmT9KPeC9tNtqfnjNpM63gqwLbGoBtY9NsTlJ8sstZlYBKS3o5x344DcIkV?=
 =?us-ascii?Q?h0XhADCe77+jt40Z/2kFQTCgdyM1NLYuFdsjwuVlopNm/lN0V8LEsUExLQ6p?=
 =?us-ascii?Q?dZa+v5wmSlKV7oDaRRYNxVA2kWZK6VIpwtfxe4mCbYYzWBYuqZBK45eXb+4a?=
 =?us-ascii?Q?Z/GsZYvnreTBF1JjGsEx1V90In5P1EX5YC8FL2o0Yb8n4CjY+P85V6YK5dRW?=
 =?us-ascii?Q?aWLBhL5EycOBmysMYoGNMvvGJz8p9IZd3FqeZjTNBHM87NJoeNv25MavZ1EZ?=
 =?us-ascii?Q?70xuPytqdABPuBIBrcVJg30NVwQGp0kYbYUd6SqKy542CuydpFDoi5AXK30p?=
 =?us-ascii?Q?7ydtnXcCySR1f8Vr4Fx+yIU3KbAeAigxahYP+GFaDEHv2wPi+7opLcw4UJ50?=
 =?us-ascii?Q?L0H1TS4PE/xjug91FOL3JwAQVv8r1FQ4+W7v6IQsPNKOzwmETiY9kBBUijcq?=
 =?us-ascii?Q?LL+Vm4devPE+mUj1kpTS0F4d3LyFyudKBn8NqUNcMfHsQNN8q5LC5bdawLGt?=
 =?us-ascii?Q?ChynVvySXjBt/SoFVUD19jUJixsODsHc55fDtkhnY7857hq2Z4iwoVEFTGsJ?=
 =?us-ascii?Q?3Hp+YBzs5cwjNgvTnjZiQXhDqWz9HHN326erwmAUwokfddF/G4r7EWPi3xuU?=
 =?us-ascii?Q?c+qReyJ0e28gh9Y4QpPKXS4nrVUxaOmh4dwJunvkSgum0sfUHd0i99AHQVyN?=
 =?us-ascii?Q?16/Q4kfjJMe88Wk38OctUumHKleh8XocUgIyB5msxrW1d5D2YPZ+1PUcvrl8?=
 =?us-ascii?Q?ySvkhFRtPePxEtkqT+Vq7KWMZYllTERfBgG0Bkm6OKpimQPgSfUqVduBXmQo?=
 =?us-ascii?Q?S3T2KhwyHDpfclRmnlCMZlhnba3PubObT44hy/mQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f31c34-130e-4490-7045-08db5f8a14fa
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2023 14:44:46.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JQ9PxJiY+VyDGqb83lHSCKu3uw2Gb7LBC4PoxIOPExckUQH1QxMl4+SNz7o425CRDeiSDOIIjpkdRLq1sZ/pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818

On Fri, May 26, 2023 at 04:27:23PM +0000, Shenwei Wang wrote:
> Test mail.
send email from mutt by fix from name
