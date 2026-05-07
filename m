Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33A3939D2
	for <imx@lists.linux.dev>; Thu,  7 May 2026 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164800; cv=fail; b=UB/U6wi/KxHfsd5xPfr94CiRHOicZpV4EsKhIzTdu5oonhqDG5zLbdGgIkDdrWoPtfi9VfvyOUN6rBJ6nzMSAS5jnvHc2ng+49a+uawGJ6JXoSJUjv49fzAu+wqt10zUv8tAIgOYu7+r9UXMMmwBPGqBUGCy/O3pdHZ0Ejm7gS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164800; c=relaxed/simple;
	bh=dm2tTJ/ZqP4Uz64U8BPA2jyD4IMAME9Nep3GQmfzvhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qL7iH2225Hkv0FG6xyV6UgjnNQTdvYEmsYuKQdGnureQL9Vbv1jyk5At2YCjkzxapGtEJ4Zgo37AsjbJY2EmAPMLxFoSy87j0QKMJ2mcUVA1DnXKCuJYt56PYgrEgRjN5fkG/CzX1wcF1j4S3f/I+8ye8qBxrxCzNlpP10UiHFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ctUUkcLA; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ctUUkcLA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7FrtlDS9qLYqJpJonQtJcRBokljFUn7C5KXOr/MXdwgJSv7pd0jxhblHJdkUJaNp3ikeTkqLh/rK/Ajmu4D+AyfmPhssQfaez+4L+CrLoRHBnovBB4WrtxotSuQLyiR7lXYvk9iJCyBf6REXGR+fAMB3jil3Z0ShzHgAVkBfOexxPbaLqpkP4mURcA65p28AN3YuTb143ooRZtdTheLLS/xppHc4OObR3Q+Y4C5yepHE0ZYoV6e265F2KOOTVhVtgv0sUY2CocsUbgSWR/RLTZH1X70EuWV/hipZrQtaXQARmVZ+Ti+stRV5dmjvbTKA6pj+0qDAerhxhefPdWgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm2tTJ/ZqP4Uz64U8BPA2jyD4IMAME9Nep3GQmfzvhM=;
 b=j2FMxXR8h92nkm02ObxTMbOy655hATSfwlZzOvVEcu1OWy5S9XJzUeB0fd4snO6YIhYNv0voh3h2kvZ0nIPK5+n/OoyFMhJIetAxWBWg6R68iQyb1gm8DpJ5kpPf+SS4/rXKSUnfRJ44R81mOCWxTtdhO/I+9q1V5/QQMFa/z9XEinVdKoRkukicwZ+WyC3MrqWHgr1IxUREaiBqlGl8hLs71v/5SsSY6BW6HmseAytlpLOvFMMBz1Kbx3DQNepi63RLhKnwLcMSdrRskLRnnnbk9hs/bn/h1oo8XhJ79FElN/QSUEOiJfpeFP9sm2wLX0bRsgk5EvGRG3tfRdZRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm2tTJ/ZqP4Uz64U8BPA2jyD4IMAME9Nep3GQmfzvhM=;
 b=ctUUkcLAMYzMvNifP+6fws4kXz+To8cmiK2JW+CB/hVEWR9ir63DEHoAVioAuCxBmkmhL4JYwmqsgQBAQJX2deKyQLMvODADLWup+4sRIHM+1chX7R/DY9Pl18BDNkjJVr9bNY7ltuOmDvzcXWoIWwzWPnWhEU7uLiuqPYIXk8dfaI5MxR321xMXPw9WqbeWP/xLvYU1EgtxnWO7lLHwwbPEAQSD6TjlYHpbUe4OsjvgmA7ghYbNWNfmuqYdLh6wc89oRYKutIp8x8TQImqRAjdcNfh2iyc3H21MwSNxm0zuB0iokhmyaTLCI3YxujdA3BiWkcl/DQ+RmqZiY59mWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7473.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 14:39:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 14:39:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	imx@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/firmware: clean up other_interfaces.rst
Date: Thu,  7 May 2026 10:39:40 -0400
Message-ID: <177816473465.138900.17957626897365478178.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507020446.370101-1-rdunlap@infradead.org>
References: <20260507020446.370101-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0130.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c41357b-d5cf-4231-db4a-08deac4681b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G0Lmff1nH4TsluZsjaw+stuH/YhVYR6wVl83G9tn9n2aTBLetz0D7x2UZrRbBSLGOyOKi4v6IIABdBbeGYYQ9VaiWMLlDyFr0GTDHbYuLOmmb8fHJd9v0L00wFbxH1HaJgTSQSCxAa6ea86/X18yxknsOOyr7R04JynO69JaR8ueEKWO00LuNQwI8bv4zrqOSsiN1vufgP545EfxUuQhlUO9uH6dUu37CZrNn+nIVTJsePrqI/pKkncT4WH2QRhyJdRBAcQVnViDVBP3dV3I40aOUe4PuVRgZCQKH7Z8U2bEMe/GMHLgSWSvFG3RTR3j6q1BV4gZbl+8GNJd2cQxfjpQavR+LTVQNDG39DlcTgzQDYD1Qrxn1lWXdHw2XNgZZXIYvSTO8k2a6w6rs1c2FmKB6YyBxq7w5ErRJK0kKWzXysgAqkzK7KJ9g9Hhhs+NtY6jS9FiLDtOgqBw3rsZKms36HOedUr0eu1/m0Ahx0OGYrY3srZtMWV2s6C0zDeO7n0UsWVjVFaobP6mST3CPce2gwk5yk2CSOtoilmz5bcr1WM0YOo6Z1H5SjTC1E9dN7jDWfM7KoKbpm6i6fR3prbPbaDYnfLe6JiOQyjekeZfR8EdljdpBbwa5r5lmIB/80vRaVKiyRNocjFFVjI7TqF34voUsITt8gkopduAnXShT83UD+vAH2xP8zfbpKhzoExgV5BYenvNiTwaTWuXeXw20taA2fFqHxIPJC97Td8ykavgWXbNU+ULv4XXE2Jw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkNrYTdkcmdFUm56NGpWd0NZOCt0bTZNemM3SkdKb0hOMTRvcG5iVCtaMW5v?=
 =?utf-8?B?SkEyYTc3SktlNldCMm5LcUJHSVpoM3FUNWJqK0pNcE55U3VJeU4vV0RwcnMx?=
 =?utf-8?B?N2RobkwwcitqVmtSbTRoZVdocDFxM3hQSlIrUHF0azlOOFJxT1U5RVFFTDUz?=
 =?utf-8?B?VjR2YTRzTU1ZWEg3NVh1MkRuOUM0Y0pQVmN1ZHBTLzMyaERHYkdtaVVlUUs3?=
 =?utf-8?B?aUpKYi9WRXUyWlZFbXNpZys3NmNvVnpJQnF4MWF0MVQ3QkdvZG1rdGMyd05K?=
 =?utf-8?B?ODVhOVZKTjVCRm14VCsxTmFnQ05ZWThFeHpRaXNROGJ0VlZ0WEtoYVRaZFpR?=
 =?utf-8?B?MnFmUi83eHp3c0RsRjg4d2NvUVVoY0VmdjZ4UG42aHI3aW1SY1h2UGVUMHFZ?=
 =?utf-8?B?a0xWd2c4Z0hSbTRYTnE5L1l0RHhXRUE3YkY3ZGVhTE9CYVJiVXR1c3BlSmxE?=
 =?utf-8?B?QVBaeXZFRVNPd0lxdzVKdGNVeEJhRXg5Zy9QRXJJWm1PSkx3TVhpZUQ2U3lW?=
 =?utf-8?B?Q3o1cmlTOURXdFR3OHduaGYxR1cvbzgzR090L2FWSHptaklxd25HWElLVGpm?=
 =?utf-8?B?T0tJcU5vd2dZbzZ6Rm4vZUFtSTZYZ2FCVTZyQUc5ZHBzQ1hlZ3Ryc0IwenpC?=
 =?utf-8?B?VXdxMHJGZ1RUeXErOEVYQy9OMGtRaHdQT0dva1lHaUgySHFjL1plNVBGL0Na?=
 =?utf-8?B?NmlhcnZYeDVXaDA3Q3JES25YcWk2anV6enRVMUlUUUFMTFpqcEw3NjRHSXV3?=
 =?utf-8?B?L2FhVmU2akJGT2RwUkI0Q0V6T0IyOTd2Tnk5ZGYzRkl1RDdNV1QyclJHVHlm?=
 =?utf-8?B?a3BVUTdHQUVRZHJ0VFR3bEFzejZoaUhoS0hWRkpjRlBleVVBSFRLTCtyRCtC?=
 =?utf-8?B?SVBGUmhIbS9LT210MUJjc3ptR1VXN0dYSFowZjlHL2VCVDBYODQ5bUYzQ2ZP?=
 =?utf-8?B?MGN0RTNCQi9BdE5Ibjg1TTdOS2ZDWVdVY1hORHhrb2o3QTBuakN0UUlOclZJ?=
 =?utf-8?B?OWl5TFRHWmcrYUFvTTZiQTR5TnJnMjJnR2JkdFhrb3AyZmExVElrSnVoS3M2?=
 =?utf-8?B?Yy9hbUdkYVZtajRwbmgzRHBab2pGNFhlaU9CUGFQcmdBOElLSUJ3elh5ZzR3?=
 =?utf-8?B?cjhGL2RCREFDSU15dzhQajJOVndGZnV3bUhOYmtvTUdLVUVkVmQzM1dZMndn?=
 =?utf-8?B?aEZ6NzlkZlhUTlh2ZWxzdWx5cEZyTWgvemN4QmZidTlCMFV5OFg0ZDdYOE0x?=
 =?utf-8?B?UGF6RHMzd0k3MUNIZkg4L3pxT2lucys2dmlZYUVqeW14WUI0U2VNSXA3ZG5X?=
 =?utf-8?B?bFlhYXhTazR2azl2SzlnZnY2WDl2UUpmblZxVW8wczJVZVYyS0hYZWIvTnd1?=
 =?utf-8?B?ZXQzZVAvRG1FRHVjNnhxWUtwaFRFV2dJeHRkL0NITEk3Q3ZSVWk0eWgvUzNK?=
 =?utf-8?B?VlZ0Tjc3QnRUMUE3UmFnQklkRjhwOTYvN0tadFZBcUI5UFN2Ny9uWkVrcnBs?=
 =?utf-8?B?bk1rRVJ0TmVKVFlCNVRVSXJjUnZldk9FNUppRUdpYmRJQUZIMHpjVUFEZm0y?=
 =?utf-8?B?aisvM1NhYVRJS0lsS0xXcit4L1BvYVVBbkViTndiYTM1VkxPVkVRaGJhNzB6?=
 =?utf-8?B?RllBUURHRmxwOUI1bHpWNXlYTVhZK0ZQQUhWaDJja0RrWFo3N2NRYzVqRnpu?=
 =?utf-8?B?eWwrOC9Xa3BtQ1NmSVU2VlorM3gyczVLWkVxcTZsQ2Y0YjVwVEtWVFljeWJW?=
 =?utf-8?B?ZUczUGcxbEtZQzNuUGFtTGdmNFlPYXZhSG1hT3FzZFd5UG9jYlZCY3lObFRQ?=
 =?utf-8?B?ckxqZmh3WGVib1IvbTdvYkIyS0FiNFo2ZnJUZ0pYYUh6b0I3YTNwN3FxOVFF?=
 =?utf-8?B?V256Z0xycml4TVdRV1k5OHE2THpieVZOejJHR1VpSUhYaldYSWlPTTNqMGRJ?=
 =?utf-8?B?NGNydFplRFBZQlg3VjMvODVRbDRNMlZaT1FReWhXK1R5aHNSd0gxdnFzY0Jp?=
 =?utf-8?B?OWxSQ2R3cXU2WlA4R1NDSUs2MjBhc0syNjZNWExFZHB5WVpLa0UzeS9Kd0N1?=
 =?utf-8?B?N1NMSFFLQlBkemZULzFpSTNKMFFPb3pjbWwrTk81R1NvL3hkQXBVbkdBTFZ3?=
 =?utf-8?B?TGV0dWhZVnJ3Y2kxL1NoUVNTL1dvNnRRZThFUkRJekxQV0RmVEVsSEhEOWdD?=
 =?utf-8?B?a08yQk9YbmJHQzNPZHJnRjR3YmZvM2ZNbkF0VDRVd0lQR2k2Qy90R2NDZXdM?=
 =?utf-8?B?TDN6cnBtZjZtaFFRaDlSV1pKejY3WHJKRjZ0d2V4aVhEdm1RcUIxRkJMUXAz?=
 =?utf-8?Q?ZV8X7ScYO0mOeDqpVJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c41357b-d5cf-4231-db4a-08deac4681b2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:39:56.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo0x5tTHKHgwRdRM1vnCXYo96tvT6gv5fiyQ6BrpJu1IT+BtCdo7j2QxBl0wqSJWEF668ELYDjMEuzFfzgQt9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7473


On Wed, 06 May 2026 19:04:46 -0700, Randy Dunlap wrote:
> Fix bullet lists, grammar, punctuation, spelling, and literal block
> formatting. These changes eliminate several documentation build warnings
> make the documentation more readable, and render it cleanly.
>
> Documentation/driver-api/firmware/other_interfaces.rst:60: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/firmware/other_interfaces.rst:103: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/firmware/other_interfaces.rst:115: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank line required after table. [docutils]
> Documentation/driver-api/firmware/other_interfaces.rst:140: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
>
> [...]

Applied, thanks!

[1/1] Documentation/firmware: clean up other_interfaces.rst

squash to 3b4531c6e0f4 ("Documentation/firmware: add imx/se to other_interfaces")
any concern let me known.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
