Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08773619A0
	for <imx@lists.linux.dev>; Fri,  1 Dec 2023 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="myCeoR6u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqGgZTTdb24LBybG1Lwmgxngz0YLE9O6+1XnH/tD4Qfv5oiQMmgxreDIU359A8/+9SIpE6+Ik7drvlK4/ScRH+BjXa0PkxP90NsyIP4dUnOxLUWVXXpg8loK0eNGUfL12lP/zv8IpCd5N3mKLpLsJmIIwGH5NXkU5wB69Trqx6bom9lpobKPrepVUSvfSDWbSzY9otcSuKEG/OeGwz6BzBJ6BrijWjnDKCATt3XyY0n4rKke8CgE0KjKjwsEuzgFIFsk3NRsElUCzO4WSPhIzMfPMSd9ONoVGI42Ez6oIj5cNqP3noRGoygYgJ8PG1KGWKA6Y0t6fuENUaCSZwl+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eFgQTzhXUgBBMD7TmRCXQdDklufsd2YTdrjcL195Qw=;
 b=kPNJwKuoeBpgguohAuUB3E+gjdNGRTEMn3q00rdp1vPAdeEbvhKJdJQH//HptrUcclDeMP+13/mC8lhZ7UdvGUYPoM9MyZMRk1IY41Fn5gTR1ONYFKiQs/yrIWTnPbI+r5IgmoTT7Dw6QpheKpssLD9o9EkWBTa8SNv1/YCsx0/Tusn354s5OHHsUu21On6o7yR1OSpqLunJO9OiSH2LBhGtTjQnLIKkfTGmXmDoTytIKB3tf/bTnWa7gTv9v8XEjsqpeU07CbJbnKGqAj/M3XkxMMZFS0/61/yrcp9gVxJmVxnE2UGnH1zgENgghI7lMS+r7yRdL+OkDHJ9Dsd8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eFgQTzhXUgBBMD7TmRCXQdDklufsd2YTdrjcL195Qw=;
 b=myCeoR6u0iP2kKCxLeCYwgD1I+OFCfzhgxjgq50qLrNTxbUDxmqeIJAkDUFJdqS66H8IscKwx+B4WDBiu8QBQfsGgDlbx1pt6ryTN8yaLg9wGJq1XggSjWHn4KJNbCPJf1uch6xmRpTSUzdZuy7uTaPiQDTN06M7tG0NGk6GIv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS4PR04MB9573.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 22:25:54 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.016; Fri, 1 Dec 2023
 22:25:54 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [v5 resend 0/6] i3c: master: some improvment for i3c master
Date: Fri,  1 Dec 2023 17:25:26 -0500
Message-Id: <20231201222532.2431484-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS4PR04MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e91613-960f-4baf-3a31-08dbf2bc7b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	stj4D0qR14wXPU0eYxG2PA4aQbLEX0oIP/sMnPALSQqDMSrOMheiz3ZnuzY1c7f+ECn8Og7PNHVBHW1/NYc0lqpgj2t3RrJYRGdaTuyDwL40P76TVC2wXXWUxLrJKAKYfugw/ZD9xnK6+dDydENwKjTzLRyKtsmHdy3B3dSPjMYjrrah1rC7WVy7AbaP02K2zy6uljXX3VtgRbMckmMx+zZssMv+rkQtLfMaqaNEea83kousypflPA6sFx4hPjFzfSMCKh0InmYZXJZjfC1jQ4Rwyhj57kfKgwUBLeXZ7sBd9Eoa5PrTpmn8Z+BIdyTTj88mzw66fOQonZnAPoJiVbfyg6kDYVLBFRQiFBJyM1JaGVVvxC+7uihmfm+Qei8BxHKNZ9jqIGoMvuDUsA/qWk55RFjsNTtk5Sod0MGYegxI2iQ8+esXoIaNZY+VzG0l3HVfMsLiJDNnfK/uJDOPoA1pC6c4DNWkuiRPIzD/8U3vgJ3e8E/BMtIKGzEocgxMkL+xscsXXJp1CSy4owoX1riaXY0qD5GlVc1tO2AVMO7wueWJiAYnU9hpBkoNMGUFC036ymFl6JCHzY4j+XQ3QdteeAB/IvyFLq/r2PVsZ/jaz+T+R/6CVFzG8boc0avNFxCSRScfwO46VK/Ud+I26Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(86362001)(6506007)(26005)(1076003)(6666004)(52116002)(2616005)(6512007)(41300700001)(5660300002)(8936002)(8676002)(6486002)(478600001)(4744005)(2906002)(4326008)(316002)(66556008)(6916009)(66476007)(36756003)(38100700002)(66946007)(38350700005)(42413004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlyOVhUeEV5ZjZzR3hUVGQ4cDh5S2hwNHN6ZEUvaC9OSkk1OFFCcXNJcmpN?=
 =?utf-8?B?MWdHSEV2TXQ4WHVZdEZES0xJZGw0blpjemxTQktCSG80UnprSjAzaDhoNVVy?=
 =?utf-8?B?c1dRZTBnV3huL3F2ZW5hZHg5bnMvT3IyTlJMdHdWM1ZSNHNEQlUrQk0vd29W?=
 =?utf-8?B?NFNlQUJSNm83Z2RyLzM4aDZHc2dJRU5DeDIxQjdIRGpTVlE2N0poVDlNcFdN?=
 =?utf-8?B?TE9QcHRPSEZ6QXNhZWxMN2NUOEhOT2l1TnpqVVBTcldYQWtCMXQyMFRYUmNX?=
 =?utf-8?B?WjhtZzFVOXRwSk4ralpvK0JqSXZtYm5GSXFtbm9XOFA1QVhIbWU1VVJJQ3NC?=
 =?utf-8?B?a2xUQU51ajNIZ01FbkJTWmxPMjk5cE1wQ25xWTJWL2x5RllTbjdVT1ZMZFZl?=
 =?utf-8?B?LzNkMCtidDJ1YVYveGtueHBSd2l5eUxzWEdBTTNMdWQ2WVJCWHk4RlhpYWtF?=
 =?utf-8?B?bmtHMS8xeDNsZUxzeVprMVYwT0Y2eVN4SHJtWXFvdFZqejBUNVRTenlZUGpp?=
 =?utf-8?B?Y3o2clI0WDVnTEV2dzZHWHhTN2YzSHk3UTl3TFBYTHRwV1hRUTZ4WnFyem1k?=
 =?utf-8?B?aGlqV0xHcDRmRWZvcWVTL0cxR2tjR3REaWk3NWNPUGNvT2o5WGZTZlVhbXM1?=
 =?utf-8?B?bFhRZUtSNHg4Mm1pcXRVcGpCVFhqREtKWkNjdExBNm94RnlYdlNLMmplSVdP?=
 =?utf-8?B?SUppQnNaaFMvQU1KSkpKLzk4TGxad1Ztd09CK3lkTWpVKzdBNWVHTG9mNjZB?=
 =?utf-8?B?M3ZtRU9BMGpSemQvZzBtNmovSmJ2QVpsbW1ZV00zc2ptdmdjSjkvSXFWUWFY?=
 =?utf-8?B?ZS9nMUdGeUVLdDJoaG82T2tmZ3ZvZk1KTmxZZWVibHg4V3V5N0tYK1JXZTdE?=
 =?utf-8?B?UUhPNkV1dFUwem1kYkxKODNOSGtUcmRHSk1DVDJRY0VEUHhkaHpmWHBSTE5r?=
 =?utf-8?B?cWhNZEpEK2xyOTBBSWZiWmJ0eGdVZExSZlFITDVFcy9iWmJ4WmVNckdrcXEy?=
 =?utf-8?B?bmxUMk9zMEJzTitiODI1MGpNNkRuK2JZZXZFUkd5VkZMWnVTeUVrZWJmOTNP?=
 =?utf-8?B?OGV2VmFVbVM0OEF2bzlvVHJ4cnJKYVpWRDlhT2w4QmFoRmRJL3dCYUNkK0Uy?=
 =?utf-8?B?T0ozWDFyM09ZLzU3T2FIWXRtSW1saldnUmhSbzRabXVYWExwa1NlY0xJRXdm?=
 =?utf-8?B?Q1RIUS9ic1ZLL3I1RkN6Q1J6dGFUaTlXVWxWSnZnOEtxZ1d3eWc2TWZqeTl6?=
 =?utf-8?B?dWNPWnk2anoyRVpKaDl3bHArVlN3ZkhHcmIvZ3dyaXQrUXVraGdYMndkMHFx?=
 =?utf-8?B?eXh1MHdDdjlxY0dtYmRiOHVTclB4ZGJJTUtkSFVQc0xXSzBTSDF5d2kxb2dC?=
 =?utf-8?B?c0xqWEcySEQvMDRGZWxUMkU3ZVh2b0FiZ1FJZ09xRlp4ZU5oREFPT0htaWg4?=
 =?utf-8?B?b0JLbGxKcUtHZk1jbzRlM2wrMVp3L09MWUc1WkdTQWdtNFNsd2dxOGVxZ2d5?=
 =?utf-8?B?TDJTWHBPSG9PVlBYMUZva3VuamZ2OVhPRzNBL0V1QVY4ZEErR1FlR1UwUHAy?=
 =?utf-8?B?WGNVNk9xOTlvMTU2RVVyWlNnR0l2cUY2UmxQM0p0ZHF2Sm1XSDJ6QzJGeW5i?=
 =?utf-8?B?eS9KZmZVbTk3dGtoVjNGZ3R5K1FiWjZYdndKNGpzemxHdUNJRXY1K0VFQ2dm?=
 =?utf-8?B?SlV3UVU5SkdnTTVrN25kUVhFeGlhK0U3ZkFQaUp1Mnl4OHpLUFhtZHZGaGs3?=
 =?utf-8?B?TlM4U3RNR3BIYm43WlV2RFBlcWgvOXMwZVlxbXMzbVBzNENmQTczRTdMc2px?=
 =?utf-8?B?NHNmUE1Ba1Z0bGlvdE8xY3UrMTdIVzRyaktvR1lBZ2FpS0pDU21lcTZXejdQ?=
 =?utf-8?B?SGxoRDh6MGY5UENoVkQ0aWhNaVkwYzFqRFNZdDZidnc3RmtFTVFJcEYrOTFz?=
 =?utf-8?B?SXlNTU5BaS9jTi9RYncvZVhmb1UwY0Q0eVVKWGx6OWZMYTEzMVRueDRMQkNz?=
 =?utf-8?B?SGR0cTVSOENZcVk1ZjNUaDhDejM0WUQ3YXkzL0I2ZmVrZC9KeEpEWHVNZS9n?=
 =?utf-8?B?TXdESm1GaUFwUHdMMWlwUWw4NlZTSjVVdHR5K0ljL1J2T2h6SUw0ME1uM3VP?=
 =?utf-8?Q?RsYIk1q7Oz0roMXr6/q6QvpZo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e91613-960f-4baf-3a31-08dbf2bc7b6d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 22:25:54.5257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BpkKVtYVRtY1FvNhFawj3bGEqDxXpPE2QzIjxb9WTnB7DbpNIP5mhcd9gb0u6xgtWmW1D6qVUDBxApYv9bmYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9573

There are three major improvement

1. Add actual size in i3c_transfer because i3c allow target early termiate
transfer.
2. Add API for i3c_dev_gettstatus_format1 for i3c comand GET_STATUS.
3. svc master support hotjoin

Change log see each patches

Frank Li (6):
  i3c: master: add enable(disable) hot join in sys entry
  i3c: master: svc: add hot join support
  i3c: add actual_len in i3c_priv_xfer
  i3c: master: svc: rename read_len as actual_len
  i3c: master: svc: return actual transfer data len
  i3c: add API i3c_dev_gettstatus_format1() to get target device status

 drivers/i3c/device.c                |  24 ++++++
 drivers/i3c/internals.h             |   1 +
 drivers/i3c/master.c                | 109 ++++++++++++++++++++++++++++
 drivers/i3c/master/svc-i3c-master.c |  95 +++++++++++++++++++-----
 include/linux/i3c/device.h          |   3 +
 include/linux/i3c/master.h          |   5 ++
 6 files changed, 220 insertions(+), 17 deletions(-)

-- 
2.34.1

