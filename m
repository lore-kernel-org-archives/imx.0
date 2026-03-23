Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011066.outbound.protection.outlook.com [52.101.70.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70327384243
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 23:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307063; cv=fail; b=R3CA//yd9P0D7KOqznAXiY65GthokadGLND+Ea/1NMMiHe6lBTWypPy5Z4VElOAzmSoZuX0xJWcl052GfTsmSnqXZTaVrQQxAqTzxv/3CUxbyVzllcuNmVjOsLNWIXQJivKc/40HoFIilVAd3rejFwGkX05kUzZdDav29t+0igI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307063; c=relaxed/simple;
	bh=srssjNi7ZdxGZALgY7qcV7FUL2S1tCynJh838oYKZbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KKCkJu9/HdX7j689xNim82BHa52XkIOaU0WRT/OtG20P5vBautdh4Uhanj84qUqS8mj/vGuUmFjIJW2dy0bNgU/ARTZLNcjt6k4SuAZqPzJR6hUaaoYINkqPMFO+pdI436TemIaKxrQs5M1AyENfTlfu/KZLfyuqRSIklc9n5Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ef279bJV; arc=fail smtp.client-ip=52.101.70.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ef279bJV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA5dnot4bb5JcZIp4Yrrk5Dg2mlLH9H5hU4RnoL8M9DwKhLG95+L265g2bFtXbiHTOrF8c9pgj6Yk4+QE4G6rpkCc32t2uiD5goz2NpItfh2xbRsCc6iGUxB6FhPeeIlFRzKu6O0f26POZGS6N/qpzcApSUCEn5uQZH7OKxn52GPYoFakJBnc8GK75JzENk+i01ZaUwmYQkMBVda5ozxqJeMtMlgbSY20cVC1IrnzAggk3/GpdbHIhzj2IJOTmfl/x/bK7cT+H5KU8DE8pWITaXXut1vE1LU9oggvBjZkNI0j8/mobPX86C+5exz66UvfXYczgl3C+EKRUONbTdiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4uMInzq5NgkDWXHQnks9slhjJJ86gHcLkRkbnR911M=;
 b=QksWgBltUZNvABQRTnaT0Hg++gH7sM832JnMNg9JWnVEk3IlVjEi0eZ5y7Vajhp0ATSDLtrO9YeGTmx7Bj4SsHgHgzOZ0oWA5ao1iKJ9KsS269a+DVK0XlqQjwXdDWj9uj/khGaKS5dKgyShigl+uf8Bfh5u2LKfxis+FT/ys+8dd7x9lh24gDN41ow/NR6tclnbjosgoa708r7SJk273pBbBuCrr1efwF4BZYTqAiluSB8zOrZoDg0hXPYTBzzZVG0XLWNBB2SerI4LKcDNe3s4heHTOsFyt5DIP7rBQNaWlPveUb2gP2XewSmJ/7tAFU6kgPVN+obtEjDXnm14VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4uMInzq5NgkDWXHQnks9slhjJJ86gHcLkRkbnR911M=;
 b=Ef279bJVQZnBwl3CJzR4x+6l6XGLL86HsHshhBYlsfcuue8mBFdzvJPqHf2xbjAf1C+PGRH36keM3hd40QNXkrrrLdNHpYf71PNYiz5LGCHAcIMbPv7nNnqkFNTUi7MGAz+GU7FnH3HdEjNEAPmm2bDHHGI5HjXBN75jqTCKxrs+bCbfACR38K0+09IbTPg5rWqRK59gYsgTPTyL6LEF9EZnUtNOYmmoKCJngTb9ciufUOTo+ymPCVFv3RgI1q2JbbgZSPNiBnmwiGCIQ/5AC8mzWQl+dAHWPo0UnXCyW6ORFCUXQ/MadByQTvOab7U25jU9fw8XQWQjILF0ECNHMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Mon, 23 Mar
 2026 23:04:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 23:04:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Forrest Shi <xuelin.shi@nxp.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
Date: Mon, 23 Mar 2026 19:03:58 -0400
Message-ID: <177430687636.1464261.2364554085578692462.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306203103.3119790-1-robh@kernel.org>
References: <20260306203103.3119790-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8c4e79-9c05-4d8e-ef83-08de89307e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yUwClsqNCivBEPehDXaOP+Q5tjs1wHnbYEZiqGXLriJG+VgfYIFxx2uInaBkeESSHpd4wUG4OL0gbRprvNlrLsauHjhhPEi4pYxByEgGkuN6FTGAyew9B7GZB4/odBGbxIMNoG2XLjZv4Qp3eX1/UkhQJmaLAtvChdYTCLgCBpdyBBdjKt5S3s6RG8dKyGMqH/FtRKtpM1QvagvD2pCrk73u9qZZO/lArF9DD/5sFD188bSnCx3gu7ZbTn3qN6JxAmK+VpeBlE3BX66th79snON++DXE9IrWDrpltbhIrd7UMt+/5aDbvAOtzGKUpjV7rqYMQq1YO8VfQxsDLPMWDvR/1ZLCTjPgyzv5tMRzUY0XBUJwmqGowGSDSAy/TbMQWQAyIu5l+3C47srUXjwFV4FngBo8qGvAkbuotzvYzwXJv+54c/DTvs5fn7RKktZoyFnqzrxs1klmU4gaH4Ibmfl5jFOGr1fCFun7Nld3kR1Tr0bV5VaAEES5cGYVaLrhByjrZhISv2Z28B9Zs/OalezKZHLfizZh0ZxuKcTkaYrKvHz36hiclEeQrVW1oJ9LfPmdXiYKkvyQkUMeZGSDEcJ5U6Un7PBqx0aCyiuTm1/Ja58z3t06ZE9Ww3AS03lsYATxf+03PTHhVtkCDuKcoJdXdZbLAOmoraKU8QeHT/BypWp4IEloZCiq9cu3viRU8qfKnw7xdA/1qGakznaNiEdTPKMXds00E+hfxT0FCYBTNSJr2+fy24csTGMk/izMRILU8JqSfphTnwxhrwXS/0rOjdlyX7xOonwBhSnJlsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZtdGdxRWNZTE5nZUE0U09zZ3M0cG5CbGhIRFVuTlE5K0V2Tm1LUzFORlVx?=
 =?utf-8?B?WlN6QzA2TnEwZ1JlMjR3TUxPTDl6MVd1M3BWcE50ZjArYkdKYkV2bERFdnRE?=
 =?utf-8?B?TFlLOWVHMzJkTFJyRTcxd3g1WWNqeUFHQkxJYmJtR2t3WGVBVTcrT0EwbDdl?=
 =?utf-8?B?YXVTbFBkc3BGUmVxa1RYeGc0MDdwNTdVMDU3WnhVeW4zYWt5ZTNyR0RoNjdR?=
 =?utf-8?B?U3JaV3BqamJSbCtidXA1NE9mRnhJODFmMEpqNGQ0VllxUWJNajd3QTk3bzhp?=
 =?utf-8?B?WlBSbllUbEEvMDhQeHZjcVIyaGY1b0IyRFlDOXE4NmxiZ2ZHcmNGZE92Y2Vs?=
 =?utf-8?B?dmFGaC9xdVNRaFVFQlZjb1cvMVk1ak5CQTRITEQyNUhVMVNuL2VlZDJMWlVF?=
 =?utf-8?B?V1Y5QVVHNVMwOUppeDFZTzN3MmFadHI1alAvZkR1MmhhWEsxVUk4R2xGY0U5?=
 =?utf-8?B?VmorNHJna1NralprQzI1UWhKeGVUeHN6d3lKQ3FqZUlrcDVuNEVJZnpsRE1a?=
 =?utf-8?B?ZHNua25PamNXTTMxNVRLU1NVblhtYVJKdHZMOVJmUUNWbU9DMVNYZ2paTVZ1?=
 =?utf-8?B?UW1yMUV3QjhjY0xXdS93WW1sQkZWZkhWU2xvajZFdEp3dGFRRWpMblk4bTRZ?=
 =?utf-8?B?WWYyZTFvQSswUUMyL2dJMksvOWlMOXpTanVHR214VVFNM095aUViZktKNGx0?=
 =?utf-8?B?K2I0elhvODFpbWk3SnpXVUZEeERHdEJzYXlTVmtFNFAvRVBlNC9kY21IdDRl?=
 =?utf-8?B?c3VvekFOUVJLOE9tWjZWN2dIVjAvZFd3NU1oOFZGbk9vUlg0anJZcTJVOFk0?=
 =?utf-8?B?MUliRnV3RDk2NS9yb3JUNVBCeVphL015Q1NTQjZPekpaMlRPWFFWUnplQWtq?=
 =?utf-8?B?Z1REWUxLZ0dqbStnV3lEcHNOM1VyWUVDMFZOcXBEQlpOeUFNU1AySUxsUTVy?=
 =?utf-8?B?bmtJbDJIZHJ1N1FGY1RKMHNkYjJSRFBCbzFWK2VGQUdISlJsSWVVR2l6bk1I?=
 =?utf-8?B?OEZQNEE2UGVIaDBaby9Ib0x1SjB1ZWlnSkJhaklWWlNKRFIzRUhYdzVYM0ov?=
 =?utf-8?B?YnJ5TlJlcDVhQkxYaFl0SUY3MHNVRlNQNS90UzBibnJySXVYTE9PMG1wZkpB?=
 =?utf-8?B?MWZXdnR3RjA5b3RCRkEyRnhvdThZYzFtQlFsbU1RY3ZtZmtiZzAxSnRlWGpL?=
 =?utf-8?B?bU1xS2VVUVRSYVZRUmU0NjYzTlZxWXBTTlRpbHVFSklUQm9aUkhDL3FHdHox?=
 =?utf-8?B?ZGd0ZnlqMElSdjZ6UGVuM2xVcW0vWmJISzN4UHJVbUhDenNWbFdZbk1SemZh?=
 =?utf-8?B?VEVoQ1RQOUZpcVN1UFIxYjV2N2NMbUNvV1pmd3Y1WHVRcXNEbGtBS0lRSkZH?=
 =?utf-8?B?NXpsRGhGWDAxUWVjQlJFdWJXL3N1d0lNNTZmMXJZeFVIdkRJT2UvVEl5VUZl?=
 =?utf-8?B?Wk8vc3VybnZ2bzBmU29RZFdnY1VSdWEvdUlNYUJFK0RhYnlpakIxZ0pBeWNR?=
 =?utf-8?B?S2s3bzlyd0lvNXhycWYrZkk3bk50ZkxWczBmSjErMGtKWWw1aGsxUjVqUGNz?=
 =?utf-8?B?M241YXVRdjdoY0duZ0syM3dLeGtwOUU0dEVQdHlGbkM3SysreEVmdXNpSy9p?=
 =?utf-8?B?L0Y5U2ZHdTczSDJLdUIwT1p1aE5qNzFvbHRGTHA4aVdNMm43dE5LT3dWWlFE?=
 =?utf-8?B?T21kOFp4Y2NzZnVQSGZkbVZzYzREY2wvV2FWRmJjMmdyMWFYWVNOZ05PcFE1?=
 =?utf-8?B?bEthVFY0dEFFVzNZUVE2NEdQRVYvSzZiQ0gyQzJmaWRwSGMzT1VOWUNIc0h3?=
 =?utf-8?B?RStlVjNVV3VwM2phSFo3UnMzYmpUaEVBNEpzTDArMDJ1MEptMC9RcnVkZklI?=
 =?utf-8?B?NVJGMXE4WUF6c1lzTmpGZFZIYm5NMDM3WTRwL1dzaXQyOTBidStDRXJoby9E?=
 =?utf-8?B?YmpXb1ZNN0I0ay9EcWxUckYvY1pUQlF0b3lscG0zalI2a1NLbjFqbTFpS3Zk?=
 =?utf-8?B?WDJ0VmJudFBzcXhQZytpUGxNZWRGSkdqNUhVc0lId1FCMzk0NkR6NWJBSHpX?=
 =?utf-8?B?YnQ2aytqM3FISk5YZjV0VmQ0TEwzTXZMbkNveEsvVmd1V1hjT1VzQjdzR1ZR?=
 =?utf-8?B?eFFPRVlsZU9kWk5TR04wdjZzaG0zeVVUL2pUdkh4bGhXN0M4dS8xbnVENkV6?=
 =?utf-8?B?bSs3T2JjbjU1ZFI2TmI0YUdGcVBaU0pIbEFJR3JWZHdIM0h0c3hFNXlQYTVH?=
 =?utf-8?B?S0FkMmJFNWs2SWE5NTRHSzg2TFNhRHFQOUJTdmI1MVNsYlU1YTlnZGpLN0Z6?=
 =?utf-8?Q?zk6IOskqmfUarkjrZa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8c4e79-9c05-4d8e-ef83-08de89307e7f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 23:04:11.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFCXsY18kSq3FosapzWaYr4slaef6K+cuqZGq1r2k3JM/YEwItMY6KwCOdbtHr9DwYP7PLVuxITtLpAnCjpogA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990


On Fri, 06 Mar 2026 14:31:02 -0600, Rob Herring (Arm) wrote:
> i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
> temporary buffers. The SRAM is larger than 96KB, but that is all that is
> available to non-secure world.
>
>

Applied, thanks!

[1/1] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
      commit: c95a5c0b55664ff938371b058673f294ce01fe1b

Move sram@20480000 node after soc@0 because keep order by address
Fix line assigned-clock-parents to keep below 100 char to avoid checkpatch
warning.

About sram size discussion, we can fix later.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
