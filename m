Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45977188704
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734124352; cv=fail; b=J+tjZahXkGolkEcnmNl5J2ZUNay2N0mv3H8tt7ZiOUT9FtChRgt1nd99gVnzSZCyFpgRMbTTfEtyVC22Ko5JGXqKic2/JbZYUHLrgzGDA9OlynMJ7VqyP3K5VEBVrYdgO0z3GAmDwUkdpd3E/clU/khTQAZyv9mIjOmDBjGBsFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734124352; c=relaxed/simple;
	bh=gjqeHJojhUcRjvze/y/8dzfzaph7zzO1Z4BUCrF/seI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lGDEmaNW5FyAzEF+2Hy+xnKenADrTk7x2if3vEri+Xwk+GPoUB0K0XIVNzns3U29fQXWq7CoHqCxON+SH19j5Ezhy8TMljWrbTPN+xIXNvlJCV/SWrlJmZopJlPsHDDQqf42036cfa1neNPJyQG/ekFTEhCdSGAQQMs/0/CnEjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XZAH0iCQ; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XZAH0iCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD4Ebl4UvB5SyAWQ2ywB+uAcFbSRRPdHIDCECdXbAADAMBCESlpo1CUCrZ4YeJPzR6DYBlZDqnkQQ2hCpCPuyGy8/AHwgMwtHlyd0Zci7Hd4dFcXsBcn6X7y1TWTHEZE2xhpugJFDvLXcaD5ws6/syjA9Dplakt6LOwWidT3AB9rZ7O90AlE8JZ75cwKGvEs2y8SOIpHrmn5zrIUMmNvYuZ+59dshYEvzLo2G6nD0jgp481tQEkISs6etFIGFcjYRbiuHqywf+MzhtE7cvp8XQekao5vZi7vpbwWpyewOWBcVeNr2He4fAcLjPKRM+68zl05EeP2NkTtomZ4PoPDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjqeHJojhUcRjvze/y/8dzfzaph7zzO1Z4BUCrF/seI=;
 b=u93Y/Vup6M78Im+yjdxNRsO8aNL5zyvCTGHUP/qBrSQg80Gq4tHYjxYpJwF0AubW/lSch3XWjNHqDr177ZiP76ePfIEISXzSkP1GZl/JBCvkAuGZ1xf5dmk9cpCSHdLMNNnsTVWupAy3YITyXOTKdnSG3+9RI4gU4dietp/i2vJH91oJrj8V0h809/oSaBiCWFlooiBp2C+mSYIYXCs4Glfa6Z27d1wvnX0Mzgc5DbXCz1MKDXDcSEqQ0gUZQ5NJwhaxA5r0a8DgWsQnBfnw26g7RH3eQ0bMRZ/l8PIohLE3SiHLJ93izBepQzlrlbx7OuQ2gr4aKpN8FZF0jqAxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjqeHJojhUcRjvze/y/8dzfzaph7zzO1Z4BUCrF/seI=;
 b=XZAH0iCQxKqQS7zv4Ubo3kz8j+tHwYkbqcAMno5W78ikJfbEBcKo9ttYxgDXQFRhQNJ5OuWxXjfZjc1+yDWeTCKs+LiFEP2IO/3ZjtVjnJMH6CHl6rE07fMBPn3o6yHFjiXyXgeY50vi2Abz2c8OHmWpp6buwJ7lHmUtlGUEl8r+ZoXhr0VhiT7NVjerpzZFUd2sWZH6Zn4nE9a2j56j2ZQ7VLcUGhRkB2dx/UBN7p2AsZCpyIrZ9dNMEXbvwoe5Xh1/4RThtJvjqZeYGCYVTP1gpN/uMrN8x6EmEVbD67Nt76J5dfvSBSuMgtSy+jk19KX0JkZduI2xYicBUsZ2Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 21:12:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 21:12:27 +0000
Date: Fri, 13 Dec 2024 16:12:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	marcel.ziswiler@toradex.com, imx@lists.linux.dev
Subject: Re: panel-lvds for imx8mm-verdin boards
Message-ID: <Z1yjNVtpkY0ElBwI@lizhi-Precision-Tower-5810>
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
 <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
 <CAOMZO5B+sJih9A24-NLUvKQXVkBrvFjf+9Fi2x1CFhRjD8EYsA@mail.gmail.com>
 <ZxawyXcHTJnDJPR4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxawyXcHTJnDJPR4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 2555e552-771f-4b50-2bcf-08dd1bbad8f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TTFlcDJ3dDJOdVhGMWhEdXNOQTZ1VmNCSGNlQU1CblBRei93ZEFobjhHcDEv?=
 =?utf-8?B?SlAwWVJWL0lWOFBidlJPK25nbk5sZkF6ZFphYVUyeERmU3JHTVRGOGZEeHZW?=
 =?utf-8?B?ZDExbEUzekk4U0Nia1RFMTlBemtmbUtnVE5uRi96OXJMaWw3bVNEM3lwTm9n?=
 =?utf-8?B?NHgvYjdwd0NCQ01OaTI0SGlJWEtkUmxZZHFPb3Ewc09ZMnNGOUNyQnczQ1pk?=
 =?utf-8?B?dnR3Wk14RUUyczN4c1BzWDlHSEJTN3ZDQjFSd1ZIZnRsTS9EYnY3QmN6K09I?=
 =?utf-8?B?eVZyRkhXNXFCcXdYZmRJclJpOXdIeW1XYU9idEptbzF6ejl6U2I5OGV4MDRj?=
 =?utf-8?B?Q3VyRUg1VW5QYTZZcTRoZUdKUXVJdFRKU0lIcWloWi9CQXVLRjNhM0xlc01J?=
 =?utf-8?B?NDRqNThPWHJjQXRoQ2NRRzF6ZGk1aUhJY3dlbi9wYnduRHRkQ2pSS1ZiWVdi?=
 =?utf-8?B?UW5Kb2srK1RIRUZ3Wlh3UUV1QzZ5WHBWVjZPV2JqTTF3d1BJTGdpalBXbUJO?=
 =?utf-8?B?c052bnNZbGxLblhja1FUN0ZLczduRmRPWUVuNmFuZzdNWmRlMHEzWXppWjZU?=
 =?utf-8?B?bGhmS05WSUFBRitnWTVGc3poZS80YXlBSVNoa3g3djdIcVlMM01qZ25IVEhE?=
 =?utf-8?B?L1F0clJRTzBVeEVpakpKckppdUZ0Rk9iaHRmdFdtc2l4N3J4aDVVVFBiOHVE?=
 =?utf-8?B?dHczcGhSalVFSmp2Y1Vla1diczE1enI0Qno2Nng2cHBNcDNDaloxM3JVdUxO?=
 =?utf-8?B?MlRycC9qZ1NVMVRwS3grNTMyWU5vWUFhMEVKdTlYRVZac3o2T0VMQWp0Z2wv?=
 =?utf-8?B?dE1WME5ad3dkblFhbEZQK2RXWG1GZ2p2TjQvUlh4YzVXZ3hveWpIV0NLM1FJ?=
 =?utf-8?B?c1l4YUtoN1Q2UDVhaFlscEJydHp5ejVIMFcwZ0xJK29ZOUFSQ1MvczNCQnh0?=
 =?utf-8?B?NE1kdjc4b0VMdU9rQ2gzMklvbHBISWVGVkR5dUhwNjNQWHRGSUMvOFpUdVRD?=
 =?utf-8?B?cXZ4Z2xRdk1KaXZhVFJ2S0NKSmZFVkRzY1djQ051Ukk5ZkV3ZTVhVFlHeHhy?=
 =?utf-8?B?azZ6ZnlVN3FIRmZnYzFScVdCNTFUVC8rVjFZMlgrWmFyU0Z2cjcwRzVVU0Y4?=
 =?utf-8?B?dHI2b1VxdWxvT0JjdWVkUStnTDd4bGdZbmZJd1JQc256TkdPaVFQakxaSWJs?=
 =?utf-8?B?aVJDNjhDVEo0K3FZS3gxSDI2QkViRHpIUUM4dUlLS3QvOTVBTGMwQ054RVRq?=
 =?utf-8?B?VWVkdDZCTEdDWG00YjNkelAyM1I2QzVUOXI2UlFyajFxNC9EQ1ZCUVRreFlC?=
 =?utf-8?B?eUlrdUlLREswbW40VHZPWk93dnhzbWJXQzQxMXVQei9pekY5NDNSbG9Mb3VK?=
 =?utf-8?B?c3VXc2s2U0UzSy9qL1NscXYvNWoxdkdlTlZTSXUxUXFaaEUzaHBveWt4Mm1R?=
 =?utf-8?B?YU9GeUoxZWEremhTcElDcW14TzhkSGl0RlI2dTNnNVFlRWxOS0U4bXlWSGxm?=
 =?utf-8?B?eVB4eEI1V1VkZ1FhTGEvUHBYV21aN1gwbU1sbVVjQlg5VnY4RFVFYitoWDFR?=
 =?utf-8?B?UWtwVC9TaG92K00wVW8reVcrOUVQOWxJTDdJQTFuTi9XcVhsSkZkQlVySFUz?=
 =?utf-8?B?bkd1R0Q3ZmFIZE5GZlRMZDB2QTNFSHFwaEtCOTZJLzlLd0o4c3B6NTNjaWg4?=
 =?utf-8?B?NGxIVXF4VWpidHlwbHFCWlJlTTF2MnhwWEhseUdPeUJUOXpBK2R1d2krbHR1?=
 =?utf-8?B?VU56TkxKckFPUWEwaUNHdnhFd2xrYnVDdFNlZi9TOU03eWI5MGlVNkovMVhK?=
 =?utf-8?B?M2VPckVLQldzdnkveFZqbWRKRmVFaU5kaEIzY0xjUTJhdDM2U29rSGZjWU94?=
 =?utf-8?B?TDJ3V0pIUkhnQ0hMVE5oeHRiY3IrdzZrb3BwY1I5TFpCWlE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cERLZkdPY3Awc0Z6eUJWc1Z2TkpxQUhEMzNqTmMwaS9BRGJtVmRWSjlmMGlM?=
 =?utf-8?B?QXNWQSt4aGtVelFyU3JOdlZENVdPbXRXT2ZwMlkxVGNoRXlXbFQ2UTlmbG94?=
 =?utf-8?B?cERKMVVFWEVESlF3VkRQNjd4YWlEeGJCNWZjQkFsYkdNM2tjaEtoSytrYk1C?=
 =?utf-8?B?dERGM1lMNkdNRXBSNEdMQk1pKzhYNWtyQ05wVjcwVG9xV1ZaYmQ1ZjN1elVj?=
 =?utf-8?B?Ni82RFJwc0taLzk2cHZKc0UvdTN1L3QyU3JhMzVvMndsR21ia2hteUE4cm8w?=
 =?utf-8?B?R1Z3VUZvTkUyYUdyOTFIVU80bmVzWnhGbG01QmlTTjMxMHY5MnJlT1dSdnFw?=
 =?utf-8?B?OFJSRklyUEtZejg2UTcxTFphWmJpMjV5VmJ3bFlZTTJmQ3pEU1h3cHJMaXB2?=
 =?utf-8?B?Y05MVDV0eDZtQ2lVTjNESThEUmo2dDczUWg5Q1RhNm9BdEpobDRkaFVBU2FZ?=
 =?utf-8?B?bElmQlU0VFlwK0NZYmx5MCtqMlJrZU0reGRtRkJMalJReUhZY0ttbXJxeUJX?=
 =?utf-8?B?cEFHNVdIRldCWG5Hc2FTdGZuNk9oSHk0YXRKbGN0azNhTU11R2dZSFNxYTFH?=
 =?utf-8?B?aVphWFd2ZlhvdHIvYmNyMGtMZ1ZwOWJvdlphTE5vbHJBbFJZRWhEaFpQNnBQ?=
 =?utf-8?B?MTZuZVRFRk9ldUZzNUFUM2h3dE15dkJ1aFR6Y1FveXRUcXN2TTRyejVLTXR3?=
 =?utf-8?B?L3dheXZTZ3lWdVRvL0FwWWovOE53a3RQUU5Lakg2a1VJekF0S1IzcUhsSFBu?=
 =?utf-8?B?VnJydnZCZUQxaXR0bkxYK0lkZ2NUclN2RHR4dDNwampZNW4vTXpsUEdaRnpi?=
 =?utf-8?B?NitnRWtwY2VEei9KZTZkVmZiSTBHQkZtcG5vanZJbDFMaWt6c0xuY2dCclNJ?=
 =?utf-8?B?aVN3aUhraFJGaCszVXcwMWNFam1FKzN0cDNyb2dSMy8wYXVGWUJTaXRrd29q?=
 =?utf-8?B?WVpSOExaWUE0bkIyK1pkakJNU1lDaFBVdlFCWmtDVVZnRDBVYUptSWI1S3BD?=
 =?utf-8?B?T1FZK0RJNmdEVXR6OVhlUTg1eCtOU1pyVVZwSkN2VGdseXhFZzY3VWR1UHBJ?=
 =?utf-8?B?cFVTNkJ3WVN5RDB2eWJUK2JBdW40c0F3TzMrV1hURnE4RzcyRnUwbGF4Y214?=
 =?utf-8?B?TW9HTWQrYjFtYXJUdlYvYlY2MDA3Kzlua1Vid2xMRStlZVZFYTIzQjMwNktm?=
 =?utf-8?B?Tjh0Qldhbmx6SlNkcWRBSGJUMEJWekYzZ3NvNjlPZkxzT0NrYmgzOVJBSENS?=
 =?utf-8?B?TEVPOGtxSkZrYVF0VjVhNjdGclE2ZERWWXk1bXR2RlltdU90b09LMjNIdzlY?=
 =?utf-8?B?Rmhncng2SmNibXJRajEveWF0MlJNdmJGNmhETjhLMzEwNXRtYzV2eWliN2Z1?=
 =?utf-8?B?ZzZZOU9FMmtrbHZ5dmI5SVZXajNpZHVINXdiemlGOWNuck4wREZtWnBEaEdo?=
 =?utf-8?B?MU1uUUxzUkZmSEhPUWljQzhjOVBvZk1DYnJibnVxK2dBbXJMU1o5Y0ViRFlK?=
 =?utf-8?B?MHpyTC8zSzVwNnNvVHJFRVVaQ3VpeW5yQlJGcVJjbVZsWDhCTTZsdUx3bnh2?=
 =?utf-8?B?djBZZkdLTUlrOU9hZWZQNUIxbFNVTHQ0SmNxeHhMU2tCUDNHVlNGUk9jRlE4?=
 =?utf-8?B?YWtySGlsd3VoeU5mTkFzc3cwSTJzU2xmL3N2SjRvckdvcFlxbWgxcDRTQU9p?=
 =?utf-8?B?WXNYbHF2ZG9XcklnS1dWY1FZa0Y1NDV4OXhHTGFHWS9jYSt5UDkzMlJsbE9r?=
 =?utf-8?B?NDByM0FOM3d2MXZUSkYzckpMSVB0cVBHRzUyVHVKRDcyemJSc2NiVEUrczRR?=
 =?utf-8?B?OEV0ZU03WkQyVWxOVndia2VVUDNzSytGQjNpSDZUcWdETFJhSkR0N0lBYS9O?=
 =?utf-8?B?N0RjNVYwTFhSNTVGRkJmU24rQSs5SG92ZXpjVGh5V3RTRWUrRW5CN1hIVzlW?=
 =?utf-8?B?V29yeXFJTUpmVzRDUVdic0R5Z1FmTC9tY0FaVXFCaWJLdnpxSU5XU3VTQzJl?=
 =?utf-8?B?RkV2VGVCeXpxZWxQa2VEckxpa2FMUUpsVVIrTGRabmhXaVB4ZzNBd29HbHUy?=
 =?utf-8?B?dFNWOGNBVzVxSHNsV2gvM0VXeFlTS1U1VkR4QVh6UXdaQm1jWGp4VUZaR2lq?=
 =?utf-8?Q?4JbLRig5S9sGt/NgrBdO9IJWG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2555e552-771f-4b50-2bcf-08dd1bbad8f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 21:12:27.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud9gD6lW6kHVZl5A9q+3uJWtkT3k/ua5AlFa0xEuMKzR/XGhv3AyW9tDkUe+hHPFRo56HMbsXaa/vOFUq1teYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

On Mon, Oct 21, 2024 at 03:51:37PM -0400, Frank Li wrote:
> On Sat, Oct 19, 2024 at 09:24:37AM -0300, Fabio Estevam wrote:
> > Hi Frank,
> >
> > On Fri, Oct 18, 2024 at 6:13 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Adding Francesco.
> > >
> > > On Fri, Oct 18, 2024 at 4:24 PM Frank Li <Frank.li@nxp.com> wrote:
> > > >
> > > > There are some dtb check warning
> > > >
> > > > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> > > >
> > > > Can you help add actual pannel-lvds compatible string to clean up these
> > > > warning?
> >
> > Would it make sense to change panel-lvds.yaml to allow a single
> > panel-lvds entry?

All toradex team:

Can you help check it?

Today, linux-next, there are only 157 line warning left under freescale.

imx8mm-verdin issues contribute at least 50 line warnings.

It is quite close to zero warnings.

Frank

>
> Not sure! there are bunch of compatible string in panel-lvds.yaml.
> Maybe device-tree team require a specific panel information for it.
>
> Frank
>
