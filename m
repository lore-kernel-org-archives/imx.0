Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345822EBB86
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331001; cv=fail; b=cDgyYf6yk8xGH4wDN9VURdKv2OqBuKjNWnxPjg/T8t0LYMDPP0xQzDJc20tcI6mDILRUEOsF+h2EMEgnHZU9SDCv13ISgxS+TJ6ah7JlmDl0xbQQcyHQUjARJ1eJIYbkiqDCcMtrYLQYchX0uYxzVjpJq6gbPmKzlXatn8Tmn0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331001; c=relaxed/simple;
	bh=sTtPLawoldMcMlPOal6Mt+ipGxDl1qNFnOjbqwbE78I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zkp0riuFHDUJ+5qxND9EOzYtYUx/xFIBG08I258ugzv4kImXU5iKYhh/gin6jHzJ1BimNsbBKps3mlYZfJLsJ2znvViBuCtd7UlZJXzt1mpGVfsC2BSpWdSDtuYTLOyk0wrPVyiTYtmWbT9fuPOarDgYBBCk6id65f36b03LIUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EicsPZH/; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EicsPZH/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/VDdNgGwOTIM4hxk2fejI65LC6FXjWr+9LuIPqWv5GL9H6BRUQ2U2mFvtU02q+Jki2w3i1yvclaCIs7OCRmiQiX5b2e15dE1NDikIgF6DwQ74NKUKczaJuJJBw2pTBbFJayRRDhKEoXX6QxEMDGyHrjnY1SoivlOW6qvsljrIFgM3jdD7cu1sjgBfopJ3DsSIEOUMW8NGJ1n2Lt9smC5MlzJv8W1Cx83J7/VKv3g+zoABWFjVoummiFoZ7iaPhS//OPJqFIv+Peb2vbfnzkqRjuA4XHVSJlJDV64BjOlRQ0If/r9a4Lge3Ac0kebtuaFQPrlrW/fJrF+3LeVUaATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Xl7EBXDFyXHNRJwIdXCAJZwSACbkfYkLUkVZ2divY=;
 b=NFJzOiboo5AU7lvXWn6E/uiBihKl0bax2T8NfZGFhZdYAhKapRgB4dLDgoJijLIa2VznMGBPwd1sLbgU2TqK39MzpY5e0TWKqUOLn7iSMFMqKVpbReE6tDNvrUSFTV+rOfrb5vofbJnRVcvdyUfaxKfq9xz+N7Pez5WSREnBjqu7oE4JT2LXPl6OX4S99q8kiqRy728dxYSRTTMs4alwimAUWdOhQ/Sp7pKKiPsdGRKH+9pIxqkS+u8m2BIvZ/0aUHKZSJDA0JpAYuhg8KuCaOqX4ZwURCdWce9bqb8mLEblz/HxrlxqLYQIUZCuiHh6K4LSGbgrdK3EYcTt7MdVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8Xl7EBXDFyXHNRJwIdXCAJZwSACbkfYkLUkVZ2divY=;
 b=EicsPZH/v6fjZTAvsHdeAHcBC833ZIsQASJ14ASzUw/jKlUd7nNmbuvANYgmb6H2qzlkRSblOLZmCPcV6UvTakDKrC8qAINxvm2HTk13UpMSLptGBmGsSjlKC0yEXMDJidWUxNFkmxF/Fu5CBDNyayuYK/IBQ5oycTRVUqBIqX/hgSC6QuOfVl2C/Q50J3dyC6NuDlii6YDHOlPHHeRv7yvxLnR93f56LhJoGsqpRufGRpWSF/DNQDbC8kbvwIRdg6O21Izmlx/hQrY/T/KS6cWKpg16gX2+heRSE6fq3puvsCymkyBMAsv+eccZ9gCvKLu+lyTtqAiwI0u9q2POXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 16:23:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:23:16 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] firmware: imx: require IMX_MBOX for IMX_SEC_ENCLAVE under COMPILE_TEST
Date: Mon,  1 Jun 2026 12:23:09 -0400
Message-ID: <178033096075.4125440.17060475013162886375.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514090425.2186915-1-pankaj.gupta@nxp.com>
References: <20260514090425.2186915-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0181.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 453dfefd-e9d0-4aa8-fd3d-08debffa15f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|56012099006|5023799004|18002099003|22082099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tpN+gEkiG1tt2N23rT7+kV4FiGMJT70tr20CqtDcVtisrJV/hpNY2Iwiot+YZKt7eTeigNJYM78fHXde7foCagd3pPqwzwlVp6lPsLMVl9Hp7TdNTkRGxGxCJDiRwVPyFCf0e2iFib5ks4nXzlbAuuNC568SLZ13DVrLq+MvFIjAzT3jA3XdUqqIXE381b8kjpVCvXgHEqdXX0BbJfAZmcSO/gRSxXlMWtOiXsIC5D5Rr8ZguksoGAbmK0gDSoApoHHSb0SbMHTbqhR1eJGO3v6oTzjYVz4xh5euw36xDa9+3XD+9BLVmqz/GuVsPHM5ap3tRyR0DKW4SQRhLPf0t04EGsTxkcbCJ/92KFCjrr6pl+UZSp3IbIxWO1CSk5JhjqRHzDGCpaV/3b7/EQLsZtnMFw3pUZ+BRPXafjfBgo8DvBPhZtc4ZO/C9t1CVmHfEHvxy9GUZWpbyLxkpTHe+oSCFtRrZ3my+NDAkPy7PjNU3sRoiDl4tv8jxRwSwkCO2K3eJKEbYRnVqXyGWBe1p9bpM/NcUV9Ihu2bqV+sK1dacT0kKavFnppr+fCJakTj8jEzX/K2O+rkH3f9x9zZ+7Wv6+f2XueFDYrzxFLNpryLZKZkihlFA7tP0EU3eSUZsV4um7fYv69S7VN6WKr0ySswnVxlZFRSGVZWr5htm3qxynXL6AFGTCHgUt9FD07C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(56012099006)(5023799004)(18002099003)(22082099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RllhNUZFVy9hcXFLTE5aSkpJbXdORmNHRjhjclk0TWx2WjBHU3gwQU1maGpx?=
 =?utf-8?B?Q09pK3BFSUtNSUMwMGI4MmJZWlJ0YjJnYzV5NmxaQ0M5ekxvNTRjMTYvUWF0?=
 =?utf-8?B?QWswVm1CUkRMUThPNzhXek5wTXpjY3FXaW10dWEyaStwMzA3WlB3VDlsdFRC?=
 =?utf-8?B?dUtKenJ2SHVHVTN6QWJVUXVYYWZrOW1Yckp3Vk1Hc0VkSUd3NGpLTWZ4R3Fj?=
 =?utf-8?B?UmxTZ0psd3Z5Z3IvZ0g4YlNjMXJ3bHkvWWdJQk5aRjF5T0tXNnYyMVlFM25Z?=
 =?utf-8?B?U1FKUkwwWlRYdTdFVmo1RmNNL1VmRTlDQis1dE5QUXRubFViNm9OYUh6QUJ5?=
 =?utf-8?B?dHZiMVY3SjVpMWJtaHpUNi9TbWR5cC9MV3E3cnNXcCt0WUF5bktHZ2JFcUFY?=
 =?utf-8?B?OU11NkwvOUFjRDljSExnQUlwdjZJc2hKYlM2Qlo5YTZIMmM3NW5IZVFMQ2Zq?=
 =?utf-8?B?ay9NcjJwUWdDazQ4bjNOOVhMSHlISWtwWDlxT3pYdnFYb0JlN3ViNFJCWUEv?=
 =?utf-8?B?Z3FmZDAwUVhnZHc4V1ZXY2NzclRjaHlqTlh1aUtsNnUxQ1c2MVFVRmh0RXBF?=
 =?utf-8?B?SXBpbW9ISXhkdENaZm05cmh6cGxmMDQ5UlY1TU9ySUgxK0RndkhITGtOYjBu?=
 =?utf-8?B?TzFCYndUQUlJbjBReXJwd2JyT1FjaWJFZVdOMUtTQk1hb3FUVktNQm53Z3Bz?=
 =?utf-8?B?S2xXTGYzK1J4TTZoZGMrVjdNbCt3WmtRTGhNMnFuVkhjK2ZsWm51Q3pnTHBi?=
 =?utf-8?B?RTRkWXNvSmhyd084MVRYdkJvL256YTFRb1UzSW9PVkVyTXJaTGVmUmdGeHlG?=
 =?utf-8?B?U043d0Y0VWZBdmxUWlBxQ2tMa0x4UHZhcFFNZ1hleHZOYzErRTlSSWt4eWdx?=
 =?utf-8?B?UlpRbmpraXliTytJTndrVWRINGtKa3VmL2JMdTBHbjBJUVlEaUJVRndRa3Zo?=
 =?utf-8?B?VUhESnRMcE90a2dDUkFDT0RzQmthcDlkUGJKZHFzQ0ZNQUhHb1lvSXVzSFN3?=
 =?utf-8?B?WTU1YUlvd3hReStnWEtFUWFkU3ZJM0FVN0t3UDhvMGxjT29iclVMaGNmc3RP?=
 =?utf-8?B?K2JHTkhyVkxpNnJIeTllb29CYmRRYVRpZ0pUSlJUK3R2ck05amk0QU8vL0pJ?=
 =?utf-8?B?SUtLUEVOYmJhNjc1UFUvdTZUNExROEdNc3Z0TGt1OUxTODFnQ3VzUzQ0UmFr?=
 =?utf-8?B?TmJOT0N4SUppZ05aZGVOcWlmaUhuTlN2am5mRk1POElKcnFnN1dQMCtDMDZj?=
 =?utf-8?B?Y05ZdWRNc0JvbmlNdjVOSWgxV0pFZlBrTkdqUzFFUHdLR0Nhb1VpaXBpZjI2?=
 =?utf-8?B?NkhER3JGajEwM29iNzIwQjhMei9uOVE2Y2haWGwreVNJY1d2VkNxYUR1L3U4?=
 =?utf-8?B?ZUs5bFoyeHFSLzNESmZ3dG9zUUhCcmVtbDFtcWRMZGo3SXFJOTF0RU1lZHZH?=
 =?utf-8?B?c2tWL2hVem9hQU9EMGUzVWlDSHZicE9CVnlrZGpJdDVuejRsRjlleWMwVFR6?=
 =?utf-8?B?SXpXckR3RUFobTZic1ByZG1ORThrVjdMMmhNdDhnYkNiTDRsamNXRU52NHZP?=
 =?utf-8?B?OTZGNXliTVBaV3g1UzQrK1R2NGYxWWdubFRNVkptL0ZtblU2UjhWY1VKQVVh?=
 =?utf-8?B?TUVvVkJtK1ZOZGdFdUg4YmJHcE4xNlY3clFQbTVLV0RIbnZ6MGExK1hUNHht?=
 =?utf-8?B?Ry92eHExR2NIVEpVOFQycVkyUmdGYXV1RDNRZElxN3pzTmE4Uk9nSGJtejlF?=
 =?utf-8?B?UmJ1eEhtSy90dVc0REtZTEdLbTVNekNqWkJZOGU1ZkxHdzl2QUFMNEZiNTNr?=
 =?utf-8?B?c0tNU0RUOU1vOFNmeEswWG1wMnVoT1JFY1RPc25SRzJ3cnhNRFZ2ekNTZkxz?=
 =?utf-8?B?aitqMGVvOG9DWTk0MUlSbWxValhkK3NWNFhEaWphS2c2TXg1alhXSGIreGE2?=
 =?utf-8?B?K3NlY0FSeTZRaTEvQ0hCN2dnNFBWSnEwQVE5M25BSlVQZUk0RWZNMEZzQWJ4?=
 =?utf-8?B?QThpY0UxdHc3K1dMcWN0M3lXOFBDaHJVdnZRUmhxeEI2dHRtNDRtU3JYOTVM?=
 =?utf-8?B?eWkzaDU5UUFQSmNmK0kxYUVwQi81cGNYaG9zV2E1ZXNXSFlZM3lmcGo5Kzkx?=
 =?utf-8?B?NFEwdkhwZzlOb0dLV21Xb0ljWWpRYnNKd2pTcFVVQTdzQzNEV0pkMXhIdm9n?=
 =?utf-8?B?aVlqNXBPUnFQeDJ5clhyeEhwZHlna0xtblJpVEk4aWQ5OGlKakhpSTZKUlpl?=
 =?utf-8?B?eEI1c3NHbFM3dVloVWRycWdrTzdHSTFybWxiLzJ6WElQUisyQlJLRFBNUE9p?=
 =?utf-8?B?MlA2cGZhWmp5QnNoL3UrQzRSckY5YjUyUlNrTTh0c3dHc25jQW5UZ0lEdnhO?=
 =?utf-8?Q?wYsG/pVxtm+dqutX8mGoXSmrFfYyzGfYAy5UO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453dfefd-e9d0-4aa8-fd3d-08debffa15f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:23:16.6211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IULuzHxsDjbhWkAOwPh/SzyXRtuajUy1e8U02Mo3IHHzJ4RW0in/XDLqt64H3QZKLIKlhxPfsnH/xUKO1TGzNbSh6LPoO/xFacTvd/3Ceq/PLlhJ/SjfLQh8JnGn23/c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

From: Frank Li <Frank.Li@nxp.com>


On Thu, 14 May 2026 14:34:25 +0530, Pankaj Gupta wrote:
> Require IMX_MBOX unconditionally in Kconfig.
>
> The driver uses mailbox framework APIs such as
> mbox_request_channel_byname(), mbox_send_message(), and
> mbox_free_channel(). The previous dependency allowed
> COMPILE_TEST to bypass IMX_MBOX, which can lead to
> undefined references at link time when mailbox support
> is not enabled.
>
> [...]

Applied, thanks!

[1/1] firmware: imx: require IMX_MBOX for IMX_SEC_ENCLAVE under COMPILE_TEST
      commit: 454e06b6ddc851c88b78eec98cd883b03502f7af

squash to prevous commit.


Best regards,
--
Frank Li <Frank.Li@nxp.com>
