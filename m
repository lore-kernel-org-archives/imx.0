Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20230D407
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331237; cv=fail; b=OCIe2Mx67fmfE/cFgCKlw4yDFNuDPMenPohAvOuLfleykUU5+wcJz9xesZmkDqp6S0mR2r6a1GnozB5oIF5WS+7AbPWxGflnIdYTA/Q7qFBcBydnSL0Hw7/LCB95Nk6g+67fGNB7234WvegNEmHWPXoH3VYRioSg1v8wMIqcpEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331237; c=relaxed/simple;
	bh=6g6jQpflnjiww3ESVwrE+YmwlRKKaIXf8zUmrhByBHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fMaVP6qhh4MOizMSmsDFSjsOB38E35aVyDxz/BYHduGqEza40S/WeQ60mkpMVLNo608hmImjSkNm8r0P+pDL6BwSwxRK8K2tiV99NpHP7jCfOHZSYVUt1n277ArB+mbjV4iuk+4Li/fFZcCw905OfZcPqgWrqhANYyfRMAw40vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=an23tn8l; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="an23tn8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkXHWBuWyYmPJuPB5pnRtb2f7j01p1u8T8aEHv8lo9p8m64EOM3v7gVHj6zeeGjRZCIh10W3/P5Nu2eQ/lduom5DnuAZj1d4MAfkh9s+Qm1q2m7dp68jdvNl1AKZ9Qq65d5Py4BSQ6u4tewS/OULjk7AxptQ3oNGpUlUvAucJ6tRq0F8MXtfv4hBwMNy28/AEG4yJshbXSUJt6P9H7Ue0oWn/2iYWZNy24wnUgZSNvkvAAPEhDpDaUVgjAKb7I8LJ/50CfOcWZDNcsSizua+kB+X4Hx5u2z8MXh5989LO1ujKY4KQehiGRMz5eNZkR48NY4wMRXjSFQAU73oOCv4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bu+qqFGnsavsr8Dsix1lUpDD01X4QpG2alzAFyr5NU=;
 b=uAovDaRRvWEO48kLgS7kVf3ZbuCRPkDrtlxCV3Z1Dto8SHoXuwuwT7NTxVUxjmjUbrIzZunIPhqheVz73llCSTpiCaroPWWSdol68ItW/duCl78ytdwpeScuLLhQIyAk3vtewzJNagqw1itpvk0bHPODno4HjH7+MB22vkQYD7h9kvsk0XgsK0tjq1BLqG6jZesrVCcwZ8zSr8CG+qKs8k3wZP4nS5wPu+msEBbpV/8sqkEI6H3XJbQ4/UdvuAs+dZxiRpMdOblE2JaFAYIqb20DKZTkiA5umn5NIPxr5ZkVxFz64rE4d5lG2ol6AlqlSyMC1GNcxMb6wysHiDciCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bu+qqFGnsavsr8Dsix1lUpDD01X4QpG2alzAFyr5NU=;
 b=an23tn8l0H7vtXqF6HjVtVT/Z/Efo0+g3wlyyfDqpYkzWG7t6gGnajqK7rNebhliUc9qWh50MCRcdYOK1rdrow9b0e+2TIfd90uNibo4tR/7sLK2RFlcHdDnHwh8az4855W9eeUqRJQbekXNM/igKfnNgfcSaTd9Yq6A6D9vpOx3Xol5PAdxTwfzSr6+KgeiMjUqZmL5Xm9uWFksUnQ0XPkTwAWn5vx9Mujjh4/wNZEw1dxQjtAeEk6vWR22g4IEbQA8up3lMZiYk+Ef9R3ErnWKXglLn2XosuU3rJ5tnZGluxvguRDJt9E8PbWaN5tgaAjsiChBQ30N0+yuLn8/Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6919.eurprd04.prod.outlook.com (2603:10a6:20b:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:53:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 16:53:42 +0000
Date: Fri, 21 Aug 2026 12:53:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v40 5/7] firmware: imx: adds miscdev
Message-ID: <aoiCjv7jo7Z4Kjs6@lizhi-Precision-Tower-5810>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-5-74fbce2f2f95@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822-imx-se-if-v40-5-74fbce2f2f95@nxp.com>
X-ClientProxiedBy: SA0PR11CA0153.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e624961-dd76-43a4-ee72-08deffa4c1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|7136999003|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|11062099010|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zMuy7/+bXRSEDfe0x6KqActSJpr04UmwpdS+g8nUm6wOnPyrXCj6XCpMDssSg/zUVbyeCzdA7ccpFh04otEew8VG27uGmXouhyR3OhJoxebEIhXIfQt3XBGA/TNh7bbrjItKkTiVaB3q5KtVbVrVvsCD9o5QlWIxWEfOUoaZnpE0hyEAN8jTk9h063p9+JBBJNSncayzrugLNhARxZiZdd2IxyvixhPROvHWmccdy0QhMTIuBPVeNKHI+SWho+n8OZf/ZzgIYqKrspZsd9+Oqr5TzFkVns4xu0Pc4dbb6s4P0Ns2cNwRiVaFkSrLPy++N+k6jmSZfafBAKskAnxJDaKQZmgpGzsbIhC9OMuTTZk6BfXuxxbH+6UnaONqwNmMUCYWY8iS5tDKtgfpryqgQ6U3phKXibjhHAb2KrkdmhgxjD4UqpohJNRg8yo1qIEwcTTY0SgKLm9U7bNori9b/olMPjJ/N4MjSSqWKnb9H7meOTS8+FiMCNKIgnCCIhc052YI2X99WkenILvBEcXD+zwvdx+xZBaxMaqnCeI4EiNJSBVJRxv30bFOwxkUxaSFucehvi1X3pa777AE1Y4jjaFoRTp90hRGR4h52L+c/TrFMNw8wcUalkaGPXGMjNQue3oQUrnsxH4SZR9L7einjBYgXr0Mjyzrf4himWGHnUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(7136999003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(11062099010)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mxbWzJPZb0nLGph+bnzsOiSEIUjJ8FM1+Uf1Co+woLMRESyYZavzChuA6de2?=
 =?us-ascii?Q?rS6em0A4SjWOGBczFv1DAHYI2WJJ/mLrovKQY3b/Qb8V9sTu6ySNA1D2JE9l?=
 =?us-ascii?Q?TwcnRouQvdpUstHdgV2cwVTJLfm7nqcjNIKODvmWUWfQwnPfv7H5HjP1d9e9?=
 =?us-ascii?Q?Q29xYLLZyF2u5P0hM8PO1uJG0vm++0Pa/EAEoxAuUI2zLyt+ZSX1bHRjVe/I?=
 =?us-ascii?Q?97JaW/7gI8eVy7y4QUyqVW5pnjblHBtgs8J6fv4kWqo8bS258p8w2Aak0DkU?=
 =?us-ascii?Q?3TGpMU9KFXkrpobKCjhkr9apCDB3rowujhLgezyKsxm0I2Cbv9Nvshk6dej4?=
 =?us-ascii?Q?0yfImsyYb1wbBixbB3UseLTzfKnYsSqFfRWJJ6L/snt642ZYJlEfgtuiQIRW?=
 =?us-ascii?Q?upusvUZOpWe0HNCo7b2lieFaDwnNyVdmE+pPoIBj9Yvkytmp1RsCxAhYZdSv?=
 =?us-ascii?Q?ckx7iljZxvnVJmPAhtQiIU4r04Ix5lg/EeLaH1nmO9TH/lmTAT5+JTdO3aC/?=
 =?us-ascii?Q?6XRpzEVVbn6Qv1HhTPnpUFi1NBRCAYXXK+hm9CCtmFGtx2f2qtayZyprj0SW?=
 =?us-ascii?Q?L/ETUL5hIQ7CNe7aZ1COa4vSBymIHY3uTt1FA/jFudKm2mxxxURJnjrkqLR0?=
 =?us-ascii?Q?fxymmQAcUzrgEd4a/S2WZzkVGb05ueVi/EPkIqflURNd/jYTBt527SsK50jz?=
 =?us-ascii?Q?y9CIgvMFURPsqD97Yrj9b9T3bnmhJ20PDwncnwylTJQwQhV587415Huo2YU8?=
 =?us-ascii?Q?LRbxmQk1sY7jNCOC87ApF052d8DD5K/WkERbkcl92n+l9T03a5tYgAvbLaXs?=
 =?us-ascii?Q?/85loaMUUmDlHM4QbEKSQblfIcT01YekznyScS/x2rWRuSDpgjdIRRGcW1gy?=
 =?us-ascii?Q?3MNVFlJE3GlbkKBdX9viyzxgAY9jdDMS1o9TKtG8maqr4X+tQ3Ge3XyV4IfE?=
 =?us-ascii?Q?SCvxN9CtmAw0WZtwSZtDwxuYrL49H+cFcRI5vYwKIj3QhyHwy7TzUSP/tfm+?=
 =?us-ascii?Q?sl7yqR6ITmQjGiFShbg0H3o2kX7n3Qm5r08ASE5UKiod5Cuv1XEXUzN0n5Ny?=
 =?us-ascii?Q?7xJgzPpqZVgsOv3n8yY9fb4f7ZZOMXoN0Hd9fC6d0pY8q3kjgqRthU6gnXH1?=
 =?us-ascii?Q?MbtuKk5AW4PzLzoFgixmuepWTT1BfCEq3tWJsmKu6G2IszQPsZ/n7kllc5XU?=
 =?us-ascii?Q?vxIDL+CEzuy1nKbHE7K+cuKR9tGDalylFcUtIY7N6uocSuOofuUgxTbdO6NV?=
 =?us-ascii?Q?00mzdMmYntHn7JPEhbli3aCZYmxjhZi/qeugePEaFNpVVrLB8QhRrGDpSham?=
 =?us-ascii?Q?WzdhMRBwD4UOCUoUqfkCpZZzDcSBldUZwI1pYYy9hONgm2gAUMWvLz/vsKt6?=
 =?us-ascii?Q?BHRzKkKC3P/psU2c3l8mw9DknZoPlxjQzCZkpF0dgxcx8YfPLS3lKrnnVPxk?=
 =?us-ascii?Q?pE5avFFHrOVmVykLmYK25ZmuDGM1JXNNo3KCodpFGiJm/7aWAdaRAfNzT+Lz?=
 =?us-ascii?Q?sBeVWO4da4sh1gn63P3tpL8XQM/qEXwQaItQwi5LTJ3USeTA/Z1hUexlkdWe?=
 =?us-ascii?Q?zDqreAdb1flg1pwCiUnbbOomZ7rwsRrvtUIlm3sCYsqTuHPC5XTAHLaeDz41?=
 =?us-ascii?Q?VRTQcD0huhQEOfPP6+Vp5s9hJ9B3ma8FnwrApYGq+8pgTs/fkFoq1TZ0JnuR?=
 =?us-ascii?Q?Z6xMFdQZXkspVi4O9IZ9U+NRCR0TU5QizMBTb+Lvx6v2eYXgw0/XuCsO8Cqg?=
 =?us-ascii?Q?xpATCKXL2/fudG6maw+jx3qimVydyBYMR3Qn641kMaf8SpD4LSTS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e624961-dd76-43a4-ee72-08deffa4c1c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:53:42.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hb05m5HlhGMz7275PpWdBB2dfKu79Z/TbMdY4TnTjbdcsBGylOWR+cIhKuZ0qinhXEf4sS9pzDFdOIaJjIXCa2xtX1PRJ+TwUcykTljDhFEPzxP3FWjoWcs6nhKFlnfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6919

On Sat, Aug 22, 2026 at 12:06:12AM +0530, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> Adds the driver for communication interface to secure-enclave, that
> enables exchanging messages with NXP secure enclave HW IP(s)
> like EdgeLock Enclave, from:
> - User-Space Applications via character driver.
>
> ABI documentation for the NXP secure-enclave driver.
>
> User-space library using this driver:
> - i.MX Secure Enclave library:
>   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> - i.MX Secure Middle-Ware:
>   -- URL: https://github.com/nxp-imx/imx-smw.git
>
> Following checks are performed on the incoming msg-header,
> to block exchanging invalid arbitrary commands:
> - maximum allowed words,
> - check if command-tag & response-tag are valid
> - version,
> - command id validation check, to allow limited base-line API(s)
>   and restrict following:
>   - exchanging power management commands.
>   - reset requests.
>   - BBSM configuration requests.
>   - re-initializing the FW.
>   - RNG init
>   - CAAM resource release management
>   - SE's internal memory management.
> from user-space.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---

...
>
> +/*
> + * A number of ELE commands carry DMA physical addresses inside their message
> + * payload. se_val_cmd_addrs() range-checks each such address against the
> + * calling context's shared-memory window before the message reaches firmware.
> + *
> + * data[] index = message WORD index - 1, because the 4-byte se_msg_hdr is
> + * message WORD 0 and se_api_msg.data[0] is message WORD 1.
> + *
> + * struct se_cmd_addr_field describes one address embedded in the payload:
> + *   lsb_idx          - data[] index of the low 32 bits of the address
> + *   msb_idx          - data[] index of the high 32 bits, valid only when
> + *                      has_msb is set. Some base-API commands split the
> + *                      address into two words; FW-API commands do not.
> + *   has_msb          - true when the address occupies two words (lsb + msb)
> + *   flag_idx         - data[] index of the flag word that selects whether
> + *                      data[lsb_idx] is a DMA address or an integer key
> + *                      identifier; SE_CMD_ADDR_ALWAYS when the word is always
> + *                      a DMA address
> + *   flag_mask        - the selecting flag bit, already shifted to its position
> + *                      inside the 32-bit little-endian flag word
> + *   is_addr_when_set - true when the word is a DMA address if the flag bit is
> + *                      set; false when it is an address if the bit is clear
> + *                      (inverse polarity, e.g. VERIFY_SIGN OPAQUE_KEY)
> + *   size_idx         - data[] index of the word carrying the length in bytes
> + *                      of the buffer at this address. se_val_cmd_addrs() uses
> + *                      it to confirm the whole buffer [addr, addr + len) fits
> + *                      inside the shared-memory window, not just its start.
> + *                      SE_CMD_ADDR_NO_SIZE when the message carries no length
> + *                      for this buffer.
> + *   size_shift       - right shift applied to the size word before masking,
> + *                      for a length packed into the high half of a word
> + *   size_mask        - bitmask applied after the shift to extract the length
> + *                      from the message word (0xFFFFFFFF for a full 32-bit
> + *                      length, 0xFFFF for a u16, 0xFF for a u8). Used only
> + *                      when size_idx != SE_CMD_ADDR_NO_SIZE; zero otherwise.
> + *   buf_size         - literal byte count used when size_idx ==
> + *                      SE_CMD_ADDR_NO_SIZE and buf_size != 0: the whole
> + *                      buffer [addr, addr + buf_size) must fit inside the
> + *                      shared-memory window. Use this for buffers whose size
> + *                      is a firmware-defined constant not carried in the
> + *                      message. Zero means no end-bound check (start-address
> + *                      check only; see comments at each descriptor entry for
> + *                      the accepted exception rationale).
> + *                      When size_idx == SE_CMD_RCVR_ADDR_VAR_SIZE the size
> + *                      is taken from se_if_priv.cmd_rcvr_var_size, which the
> + *                      command-receiver path writes before calling
> + *                      se_val_cmd_addrs(). Use this for export-response
> + *                      buffers whose size was supplied in the preceding FW
> + *                      command and must be stored per SE interface.
> + */

Please use kdoc format to document field.

> +struct se_cmd_addr_field {
> +	u8 lsb_idx;
> +	u8 msb_idx;
> +	bool has_msb;
> +	u8 flag_idx;
> +	u32 flag_mask;
> +	bool is_addr_when_set;
> +	u8 size_idx;
> +	u8 size_shift;
> +	u32 size_mask;
> +	u32 buf_size;
> +};
> +
> +
>  static void se_if_probe_cleanup(void *plat_dev)
>  {
>  	struct platform_device *pdev = plat_dev;
> +	struct se_if_device_ctx *dev_ctx;
>  	struct device *dev = &pdev->dev;
>  	struct se_if_priv *priv;
>
> @@ -339,31 +709,148 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	if (!priv)
>  		return;
>
> +	/*
> +	 * Announce teardown, then wake any in-flight waiter. going_away makes
> +	 * ele_msg_send_rcv() bail out instead of arming a new transaction and
> +	 * lets ele_msg_rcv() tell a teardown-forced completion apart from a
> +	 * real response; it must be set before complete_all().
> +	 *
> +	 * Set it under clbk_rx_lock, not se_if_cmd_lock: se_if_cmd_lock is held
> +	 * across the whole blocking transaction, so taking it here would stall
> +	 * unbind for a full receive-timeout. clbk_rx_lock is the short spinlock
> +	 * ele_msg_send_rcv() holds while arming, so this closes the lost-wakeup
> +	 * window - the sender either sees going_away and bails before arming, or
> +	 * armed first and this store (and complete_all()) is ordered after its
> +	 * reinit_completion() - and supplies the ordering the relaxed atomics do
> +	 * not.
> +	 */
> +	scoped_guard(spinlock_irqsave, &priv->waiting_rsp_clbk_hdl.clbk_rx_lock)
> +		atomic_set(&priv->going_away, 1);
> +	/*
> +	 * Wake the waiter before iterating the device-context list. It sleeps on
> +	 * this completion holding dev_ctx->fops_lock, which cleanup_dev_ctx()
> +	 * below also takes, so completing first avoids an unbind hang. Runs
> +	 * outside clbk_rx_lock; the going_away store above already orders it
> +	 * against the arming path.
> +	 */
> +	complete_all(&priv->waiting_rsp_clbk_hdl.done);
> +
> +	/*
> +	 * Mark the private device context as cleanup_done first.
> +	 * This prevents new device contexts from being created in open().
> +	 */
> +	if (priv->priv_dev_ctx) {
> +		/*
> +		 * Mark cleanup_done under fops_lock so that se_if_fops_open(),
> +		 * which checks cleanup_done while holding fops_lock, cannot
> +		 * race past this and add a new device context after teardown.
> +		 */
> +		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
> +			priv->priv_dev_ctx->cleanup_done = true;
> +
> +		if (priv->open_gate) {
> +			scoped_guard(mutex, &priv->open_gate->lock) {
> +				priv->open_gate->dying = true;
> +				priv->open_gate->priv = NULL;
> +			}
> +		}
> +
> +		/*
> +		 * misc_register() is deferred to the end of probe, so the
> +		 * device may have a miscdev set up but never registered if
> +		 * probe failed before se_if_misc_register(). Only deregister
> +		 * when registration actually succeeded.
> +		 */
> +		if (priv->open_gate && priv->open_gate->registered &&
> +		    priv->priv_dev_ctx->miscdev)
> +			misc_deregister(priv->priv_dev_ctx->miscdev);
> +	}
> +
> +	while (true) {
> +		dev_ctx = NULL;
> +
> +		scoped_guard(mutex, &priv->modify_lock) {
> +			if (list_empty(&priv->dev_ctx_list))
> +				goto out_done;
> +
> +			dev_ctx = list_first_entry(&priv->dev_ctx_list,
> +						   struct se_if_device_ctx, link);
> +
> +			/* pin this context so close() cannot free it under us */
> +			kref_get(&dev_ctx->refcount);
> +			dlink_dev_ctx(dev_ctx);
> +		}
> +
> +		/*
> +		 * Local cleanup outside the global lock avoids ABBA deadlock
> +		 * with paths that already take dev_ctx->fops_lock first.
> +		 */
> +		cleanup_dev_ctx(dev_ctx, false);
> +		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +	}
> +out_done:
> +
> +	/*
> +	 * Drain any in-flight synchronous sender before releasing the mailbox
> +	 * channels. ele_msg_send_rcv() holds se_if_cmd_lock across the entire
> +	 * transaction, including ele_msg_send()'s mbox_send_message() on
> +	 * priv->tx_chan. going_away is checked and the transaction armed under
> +	 * clbk_rx_lock, but the mbox_send_message() itself runs after that
> +	 * spinlock is dropped, so a sender that passed the going_away check
> +	 * just before teardown set it could still be about to touch tx_chan
> +	 * when we free it here - a use-after-free in the mailbox layer.
> +	 *
> +	 * Acquire and immediately release se_if_cmd_lock as a barrier: it waits
> +	 * for such a sender to finish its transaction and drop the lock. This
> +	 * cannot stall unbind for a full receive timeout - going_away is
> +	 * already set and complete_all() has already woken any waiter, so an
> +	 * in-flight transaction only unwinds to -ENODEV before releasing the
> +	 * lock. It also cannot deadlock: the dev_ctx_list loop above has
> +	 * finished (teardown holds no se_if_cmd_lock of its own here) and a
> +	 * racing userspace close, which takes fops_lock then se_if_cmd_lock,
> +	 * bails out of ele_msg_send_rcv() with -ENODEV without waiting. After
> +	 * this barrier no sender can enter or remain inside mbox_send_message(),
> +	 * so freeing the channels below cannot race it.
> +	 */
> +	scoped_guard(mutex, &priv->se_if_cmd_lock) {
> +		;

look like doesn't work., maybe you need set busy heer, make sure no
new request queued.

	or move
free mbox_free_channel() here. and set priv->rx_chan to NULL.

> +	}
> +
> +	/*
> +	 * Free the rx mailbox channel before cancelling fw_busy_work.
> +	 * se_if_rx_callback() runs from the rx channel and can schedule
> +	 * fw_busy_work when a late response arrives. If the channel were still
> +	 * live after cancel_work_sync(), a callback could re-arm the work and
> +	 * later dereference priv after it has been freed. Releasing the rx
> +	 * channel first guarantees no further callbacks, so the subsequent
> +	 * cancel_work_sync() is final.
> +	 */
>  	if (priv->rx_chan)
>  		mbox_free_channel(priv->rx_chan);
>  	if (priv->tx_chan)
>  		mbox_free_channel(priv->tx_chan);
>
>  	/*
> -	 * Being device managed buffer, no need to free the buffer allocated
> -	 * in se probe to store encrypted IMEM.
> +	 * A timed-out synchronous command may have retained a dev_ctx through
> +	 * priv->fw_busy_dev_ctx even after the fd was closed and the context was
> +	 * removed from dev_ctx_list. If no late response arrived, release that
> +	 * retained context during driver teardown.
> +	 *
> +	 * se_clear_fw_busy() is idempotent and internally checks
> +	 * priv->fw_busy_dev_ctx under fw_busy_lock.
>  	 */
> +	se_clear_fw_busy(priv);
> +	cancel_work_sync(&priv->fw_busy_work);

Most like cancel_work_sync should be before free mbox chan.

>
>  	/*
> -	 * No need to check, if reserved memory is allocated
> -	 * before calling for its release. Or clearing the
> -	 * un-set bit.
> +	 * Being device managed buffer, no need to free the buffer allocated
> +	 * in se probe to store encrypted IMEM.
>  	 */
> -	of_reserved_mem_device_release(dev);
>
>  	dev_set_drvdata(dev, NULL);
>
> -	if (priv->priv_dev_ctx) {
> -		kfree(priv->priv_dev_ctx->devname);
> -		kfree(priv->priv_dev_ctx);
> -	}
> -
> -	kfree(priv);
> +	/* Drop the initial reference - priv will be freed when last fd closes */
> +	kref_put(&priv->refcount, se_if_priv_release);
>  }
>
>  static int se_if_probe(struct platform_device *pdev)
> @@ -386,15 +873,30 @@ static int se_if_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	priv->dev = dev;
> +	/*
> +	 * Pin the parent device for the lifetime of priv. A file descriptor may
> +	 * stay open after the device is unbound; close() then still passes
> +	 * priv->dev to dma_free_coherent()/dev_warn(). Without this reference
> +	 * the struct device could be freed while priv->dev still points at it,
> +	 * so the reference is dropped in se_if_priv_release() via put_device().
> +	 */
> +	get_device(priv->dev);
> +	kref_init(&priv->refcount);
>  	priv->if_defs = &if_node->if_defs;
>  	dev_set_drvdata(dev, priv);
>
>  	mutex_init(&priv->se_if_cmd_lock);
> +	mutex_init(&priv->modify_lock);

In probe funciton, should use devm_mutex_init()

>  	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
>  	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
>  	atomic_set(&priv->fw_busy, 0);
> +	spin_lock_init(&priv->fw_busy_lock);
> +	priv->fw_busy_dev_ctx = NULL;
> +	INIT_WORK(&priv->fw_busy_work, se_fw_busy_work);
> +
>  	init_completion(&priv->waiting_rsp_clbk_hdl.done);
>  	init_completion(&priv->cmd_receiver_clbk_hdl.done);
> +	INIT_LIST_HEAD(&priv->dev_ctx_list);
>
>  	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
>  	if (ret)
> @@ -460,7 +962,7 @@ static int se_if_probe(struct platform_device *pdev)
>  		load_fw->imem_mgmt = true;
>  	}
>
> -	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",
> @@ -472,12 +974,1178 @@ static int se_if_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
>  	}
>
> +	/*
> +	 * All probe-time initialization is complete; expose the
> +	 * interface to userspace last so that an open()/ioctl cannot
> +	 * race against a not-yet-initialized device.
> +	 */
> +	ret = se_if_misc_register(priv);
> +	if (ret)
> +		return ret;
> +
>  	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
>  		 get_se_if_name(priv->if_defs->se_if_type));
>
>  	return ret;
>  }
>
> +/*
> + * Expose the interface to userspace. Deferred until the end of probe so
> + * the device node only becomes openable after SoC info has been fetched
> + * and, on SoCs with IMEM management, the encrypted-IMEM buffer has been
> + * allocated. This prevents userspace from opening the node and issuing
> + * commands against a partially initialized interface.
> + */
> +static int se_if_misc_register(struct se_if_priv *priv)
> +{
> +	int ret;
> +
> +	ret = misc_register(priv->priv_dev_ctx->miscdev);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to register misc device.");
> +
> +	priv->open_gate->registered = true;
> +
> +	return 0;
> +}
> +
> +static void se_if_priv_release(struct kref *kref)
> +{
> +	struct se_if_priv *priv = container_of(kref, struct se_if_priv, refcount);
> +
> +	/* Free priv_dev_ctx if it exists */
> +	if (priv->priv_dev_ctx) {
> +		/*
> +		 * miscdev storage belongs to open_gate, not directly to
> +		 * priv_dev_ctx. The gate should already have been detached
> +		 * from priv during teardown.
> +		 *
> +		 * Reclaim the internal context's shared memory directly here
> +		 * instead of through cleanup_dev_ctx(). Teardown already set
> +		 * cleanup_done on priv_dev_ctx, so cleanup_dev_ctx() would
> +		 * short-circuit and leak the host descriptors and the coherent
> +		 * buffer. By this point the device is fully unbound; if this
> +		 * context ever armed the firmware-busy breaker, se_clear_fw_busy()
> +		 * has already run with reclaim=false and freed the host
> +		 * descriptors, emptied the pool list and cleared
> +		 * non_secure_mem.ptr. A reclaim=true pass here is therefore both
> +		 * safe and idempotent: it releases the buffers for a normal
> +		 * context and is a no-op for the abandoned firmware-busy one.
> +		 */
> +		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
> +			cleanup_se_shared_mem(priv->priv_dev_ctx, true);
> +
> +		kfree(priv->priv_dev_ctx->devname);
> +		kfree(priv->priv_dev_ctx);
> +		priv->priv_dev_ctx = NULL;
> +	}
> +	/*
> +	 * No need to check, if reserved memory is allocated
> +	 * before calling for its release. Or clearing the
> +	 * un-set bit.
> +	 */
> +	of_reserved_mem_device_release(priv->dev);
> +
> +	/*
> +	 * Be defensive: if teardown did not already drop the device-owned
> +	 * gate reference for some reason, release it here.
> +	 */
> +	if (priv->open_gate) {
> +		se_if_open_gate_put(priv->open_gate);
> +		priv->open_gate = NULL;
> +	}
> +
> +	/*
> +	 * Drop the reference on priv->dev taken in se_if_probe(). The device was
> +	 * pinned so that a file descriptor closed after device unbind can still
> +	 * safely pass priv->dev to dma_free_coherent()/dev_warn().
> +	 */
> +	put_device(priv->dev);
> +
> +	/* Free any remaining resources that weren't devm-managed */
> +	kfree(priv);
> +}
> +
> +static void se_if_dev_ctx_release(struct kref *kref)
> +{
> +	struct se_if_device_ctx *dev_ctx =
> +		container_of(kref, struct se_if_device_ctx, refcount);
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	kfree(dev_ctx);
> +
> +	/* drop the priv reference owned by this device context */
> +	kref_put(&priv->refcount, se_if_priv_release);
> +}
> +
> +static void se_clear_fw_busy(struct se_if_priv *priv)
> +{
> +	struct se_if_device_ctx *dev_ctx = NULL;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->fw_busy_lock, flags);
> +	dev_ctx = priv->fw_busy_dev_ctx;
> +	priv->fw_busy_dev_ctx = NULL;
> +	atomic_set(&priv->fw_busy, 0);
> +	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
> +
> +	if (!dev_ctx)
> +		return;
> +
> +	/*
> +	 * The circuit breaker is cleared from two places, which need opposite
> +	 * memory-reclaim policies:
> +	 *
> +	 *   1. se_fw_busy_work(): a late firmware response actually arrived.
> +	 *      going_away is not set and the enclave has finished with the
> +	 *      buffer, so a full reclaim (reclaim=true) is safe. This includes
> +	 *      priv_dev_ctx, which has no close() path between a timeout and
> +	 *      module unload: cleanup_done is only set at unbind, so the
> +	 *      previous "else if (cleanup_done)" would permanently leak the
> +	 *      128 KB shared-memory slot for priv_dev_ctx after a late response.
> +	 *      Reclaim unconditionally here instead; for userspace contexts
> +	 *      se_dev_ctx_shared_mem_cleanup() is idempotent when pos is
> +	 *      already reset by the normal close() path.
> +	 *
> +	 *   2. se_if_probe_cleanup(): teardown. going_away is set and no
> +	 *      response has been confirmed, so the enclave may still be
> +	 *      DMA-writing into the shared buffer. Freeing it here would be a
> +	 *      DMA-after-free. Pass reclaim=false so cleanup_se_shared_mem()
> +	 *      frees only the host-side descriptors and deliberately leaks the
> +	 *      DMA buffer that the enclave might still touch.
> +	 */
> +	scoped_guard(mutex, &dev_ctx->fops_lock) {
> +		if (atomic_read(&priv->going_away)) {
> +			/*
> +			 * Fatal, but deliberately non-panic: the enclave is
> +			 * unresponsive at unbind with a transaction still in
> +			 * flight. Both the coherent staging buffer and any
> +			 * gen_pool buffers this context owns are abandoned
> +			 * (host descriptors freed, DMA-visible memory leaked)
> +			 * to avoid a DMA-after-free while the enclave may still
> +			 * be writing. Emit one headline error here rather than
> +			 * per-buffer so the count of faulted contexts is clear.
> +			 * Do not use WARN/BUG: this path is recoverable and
> +			 * panic_on_warn kernels must not be brought down by it.
> +			 */
> +			dev_err(priv->dev,
> +				"%s: FATAL: enclave stuck at unbind, DMA leaked.\n",
> +				dev_ctx->devname);
> +			cleanup_se_shared_mem(dev_ctx, false);
> +		} else {
> +			/*
> +			 * Late response arrived after going_away is clear.
> +			 * fw_busy has already been cleared atomically above;
> +			 * reclaim the shared-memory slot now. For priv_dev_ctx
> +			 * this is the only reclaim site (no close() path). For
> +			 * userspace contexts cleanup_se_shared_mem() is a
> +			 * safe no-op if the close() path already reset pos.
> +			 */
> +			cleanup_se_shared_mem(dev_ctx, true);
> +		}
> +	}
> +
> +	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +}
> +
> +void unset_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_api_msg *old_rx_msg = NULL;
> +	struct se_clbk_handle *se_clbk_hdl;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&priv->modify_lock);
> +
> +	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
> +
> +	if (se_clbk_hdl->dev_ctx == dev_ctx) {
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		old_rx_msg = se_clbk_hdl->rx_msg;
> +		se_clbk_hdl->dev_ctx = NULL;
> +		se_clbk_hdl->rx_msg = NULL;
> +		se_clbk_hdl->rx_msg_sz = 0;
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +
> +		kfree(old_rx_msg);
> +		complete_all(&se_clbk_hdl->done);
> +	}
> +}
> +
> +int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx, bool is_ioctl)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_api_msg *new_rx_msg = NULL;
> +	struct se_clbk_handle *se_clbk_hdl;
> +	unsigned long flags;
> +
> +	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
> +	guard(mutex)(&priv->modify_lock);
> +	if (se_clbk_hdl->dev_ctx == dev_ctx)
> +		return 0;
> +
> +	if (se_clbk_hdl->dev_ctx)
> +		return -EBUSY;
> +
> +	if (!dev_ctx->strg_hdl)
> +		return -EINVAL;
> +
> +	if (is_ioctl)
> +		return -ENOMEM;
> +
> +	if (!se_clbk_hdl->rx_msg) {
> +		new_rx_msg = kzalloc(MAX_NVM_MSG_LEN, GFP_KERNEL);
> +		if (!new_rx_msg)
> +			return -ENOMEM;
> +	}
> +	spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +	if (new_rx_msg)
> +		se_clbk_hdl->rx_msg = new_rx_msg;
> +	reinit_completion(&se_clbk_hdl->done);
> +	se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
> +	se_clbk_hdl->dev_ctx = dev_ctx;
> +	dev_ctx->rcv_msg_timeout_jiffies = MAX_SCHEDULE_TIMEOUT;
> +	spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +
> +	return 0;
> +}
> +
> +static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	unset_dev_ctx_as_command_receiver(dev_ctx);
> +
> +	if (!list_empty(&dev_ctx->link)) {
> +		list_del_init(&dev_ctx->link);
> +		priv->active_devctx_count--;
> +	}
> +}
> +
> +bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	unsigned long flags;
> +	bool match;
> +
> +	spin_lock_irqsave(&priv->fw_busy_lock, flags);
> +	match = priv->fw_busy_dev_ctx == dev_ctx;
> +	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
> +
> +	return match;
> +}
> +
> +static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> +{
> +	bool already_done;
> +
> +	scoped_guard(mutex, &dev_ctx->fops_lock) {
> +		already_done = dev_ctx->cleanup_done;
> +		if (!already_done) {
> +			/*
> +			 * Ask FW to drop this context's session and storage so
> +			 * the kernel and FW stay in sync. Done here, under this
> +			 * context's fops_lock only (not the global modify_lock),
> +			 * because both close requests block on a firmware
> +			 * round-trip; issuing them while modify_lock was held
> +			 * would stall every other context for the FW timeout.
> +			 *
> +			 * Skip the round-trips once the FW path is marked busy.
> +			 * fw_busy is armed when a synchronous transaction times
> +			 * out; while it is set ele_msg_send_rcv() rejects further
> +			 * commands with -EBUSY without waiting. It is only cleared
> +			 * by se_clear_fw_busy(), which during unbind runs once
> +			 * after this loop (or earlier from fw_busy_work only if a
> +			 * genuine late FW response arrives). On a hung FW no late
> +			 * response comes, so the breaker stays set for the rest of
> +			 * the loop and the remaining closes would just return
> +			 * -EBUSY and log spurious "failed to close" errors. Skip
> +			 * them and emit a single warning instead.
> +			 */
> +			if (atomic_read(&dev_ctx->priv->fw_busy)) {
> +				if (dev_ctx->strg_hdl || dev_ctx->sess_hdl)
> +					dev_warn(dev_ctx->priv->dev,
> +						 "%s: skipping session/storage close, FW is busy\n",
> +						 dev_ctx->devname);
> +			} else {
> +				/*
> +				 * Pick the context that carries the close messages.
> +				 *
> +				 * fclose (is_fclose): a userspace close() may race
> +				 * driver unbind. Send on the caller's own dev_ctx so
> +				 * ele_msg_send_rcv()'s going_away check rejects the
> +				 * transmission with -ENODEV if unbind has begun (and
> +				 * may have freed priv->tx_chan), instead of touching a
> +				 * freed mailbox channel.
> +				 *
> +				 * Teardown (!is_fclose): going_away is already set, but
> +				 * priv->tx_chan is still live at this point in
> +				 * se_if_probe_cleanup(). Send on priv_dev_ctx, the only
> +				 * context ele_msg_send_rcv() lets through going_away for
> +				 * teardown-close messages, so the kernel can still
> +				 * resynchronise session/storage state with FW.
> +				 */
> +				struct se_if_device_ctx *tx_ctx = is_fclose ? dev_ctx :
> +							dev_ctx->priv->priv_dev_ctx;
> +
> +				if (dev_ctx->strg_hdl && se_close_storage(tx_ctx,
> +									  dev_ctx->strg_hdl))
> +					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
> +				if (dev_ctx->sess_hdl && se_close_session(tx_ctx,
> +									  dev_ctx->sess_hdl))
> +					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
> +			}
> +			/*
> +			 * fw_busy is caused by one timed-out synchronous transaction.
> +			 * Only that transaction's dev_ctx may still have coherent
> +			 * memory referenced by FW. Do not skip cleanup for unrelated
> +			 * contexts while fw_busy is set.
> +			 */
> +			if (se_is_fw_busy_ctx(dev_ctx))
> +				dev_warn(dev_ctx->priv->dev,
> +					 "%s: deferring shared memory cleanup while FW is busy\n",
> +					 dev_ctx->devname);
> +			else
> +				cleanup_se_shared_mem(dev_ctx, true);
> +
> +			kfree(dev_ctx->devname);
> +			dev_ctx->devname = NULL;
> +			dev_ctx->cleanup_done = true;
> +		}
> +	}
> +
> +	if (is_fclose)
> +		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +}
> +
> +static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	if (is_fclose) {
> +		scoped_guard(mutex, &priv->modify_lock)
> +			dlink_dev_ctx(dev_ctx);
> +	}
> +
> +	cleanup_dev_ctx(dev_ctx, is_fclose);
> +}
> +
> +static int init_device_context(struct se_if_priv *priv, int ch_id,
> +			       struct se_if_device_ctx **new_dev_ctx)
> +{
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret = 0;
> +
> +	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return -ENOMEM;
> +
> +	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
> +				     get_se_if_name(priv->if_defs->se_if_type),
> +				     ch_id);
> +	if (!dev_ctx->devname) {
> +		kfree(dev_ctx);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&dev_ctx->fops_lock);
> +	kref_init(&dev_ctx->refcount);
> +	dev_ctx->priv = priv;
> +	dev_ctx->cleanup_done = false;
> +	INIT_LIST_HEAD(&dev_ctx->link);
> +	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_LONG_TIMEOUT_MS);
> +	*new_dev_ctx = dev_ctx;
> +
> +	ret = init_se_shared_mem(dev_ctx);
> +	if (ret < 0) {
> +		kfree(dev_ctx->devname);
> +		kfree(dev_ctx);
> +		*new_dev_ctx = NULL;
> +
> +		return ret;
> +	}
> +
> +	/* Take a reference to priv for this device context */
> +	kref_get(&priv->refcount);
> +
> +	scoped_guard(mutex, &priv->modify_lock) {
> +		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
> +		priv->active_devctx_count++;
> +	}
> +
> +	return ret;
> +}
> +
> +static int se_ioctl_cmd_snd_rcv_cleanup(struct se_if_device_ctx *dev_ctx, void __user *uarg,
> +					struct se_ioctl_cmd_snd_rcv_rsp_info *cmd_snd_rcv_rsp_info)
> +{
> +	/* shared memory is allocated before this IOCTL */
> +	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +	if (cmd_snd_rcv_rsp_info->rx_buf_sz &&
> +	    copy_to_user(uarg, cmd_snd_rcv_rsp_info, sizeof(*cmd_snd_rcv_rsp_info))) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info to user.",
> +			dev_ctx->devname);
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> +					    void __user *uarg)
> +{
> +	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int rsp_status_err = 0;
> +	int cleanup_err = 0;
> +	int err = 0;
> +
> +	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
> +			   sizeof(cmd_snd_rcv_rsp_info))) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
> +			dev_ctx->devname);
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -EFAULT;
> +	}
> +
> +	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ||
> +	    cmd_snd_rcv_rsp_info.tx_buf_sz > MAX_ALLOWED_TX_MSG_SZ) {
> +		dev_err(priv->dev, "%s: User buffer too small/large(%d < %d)",
> +			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz,
> +			cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
> +								MAX_ALLOWED_TX_MSG_SZ);
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -ENOSPC;
> +	}
> +
> +	struct se_api_msg *tx_msg __free(kfree) =
> +		memdup_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf),
> +			    cmd_snd_rcv_rsp_info.tx_buf_sz);
> +	if (IS_ERR(tx_msg)) {
> +		err = PTR_ERR(tx_msg);
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return err;
> +	}
> +
> +	err = se_chk_tx_cmd_msg_hdr(dev_ctx, &tx_msg->header,
> +				    cmd_snd_rcv_rsp_info.tx_buf_sz,
> +				    cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return err;
> +	}
> +
> +	if (cmd_snd_rcv_rsp_info.rx_buf_sz < SE_MU_HDR_SZ ||
> +	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -EINVAL;
> +	}
> +
> +	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -EINVAL;
> +	}
> +
> +	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
> +	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
> +		err = se_load_firmware(priv);
> +		if (err) {
> +			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
> +			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +			return -EPERM;
> +		}
> +	}
> +
> +	struct se_api_msg *rx_msg __free(kfree) =
> +		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> +	if (!rx_msg) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -ENOMEM;
> +	}
> +
> +	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
> +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err < 0) {
> +		/*
> +		 * -ERESTARTSYS here means the wait was interrupted by a signal
> +		 * after the command had already been handed to - and executed
> +		 * by - the firmware, with its response delivered into rx_msg
> +		 * (ele_msg_send_rcv() converts only a positive, i.e. successfully
> +		 * received, result to -ERESTARTSYS). If that response carried a
> +		 * freshly allocated session/storage handle, record it now via
> +		 * fw_api_specific_ops(): the handle is already live in firmware,
> +		 * so leaving it untracked would stop cleanup_dev_ctx() from ever
> +		 * closing it and leak the firmware resource. Validate the
> +		 * delivered response first, using its own declared length bounded
> +		 * by the caller's buffer, so a truncated or malformed reply is
> +		 * not acted upon.
> +		 */
> +		if (err == -ERESTARTSYS) {
> +			u32 rsp_sz = rx_msg->header.size << 2;
> +
> +			if (rsp_sz && rsp_sz <= cmd_snd_rcv_rsp_info.rx_buf_sz &&
> +			    !se_val_rsp_hdr_n_status(priv, rx_msg,
> +						     tx_msg->header.command, rsp_sz,
> +						     tx_msg->header.ver ==
> +						     priv->if_defs->base_api_ver)) {
> +				se_dev_ctx_cpy_out_data(dev_ctx);
> +				fw_api_specific_ops(dev_ctx, rx_msg, true);
> +			}
> +			/*
> +			 * Returning -ERESTARTSYS would let the VFS transparently restart
> +			 * the ioctl, which would re-run the command with the just
> +			 * cleaned-up (zeroed) shared input buffers. Report -EINTR instead
> +			 * so the syscall is not auto-restarted; userspace enters its
> +			 * signal handler and can decide whether to reissue the command.
> +			 */
> +			err = -EINTR;
> +		}
> +
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +
> +		return err;
> +	}
> +
> +	/*
> +	 * ele_msg_send_rcv() returns a positive received-message size on
> +	 * success. Returning that raw size as the ioctl result would make a
> +	 * successful transaction look like a positive (non-zero) return value
> +	 * to userspace. Record the actual received size in rx_buf_sz for the
> +	 * response copied back to userspace, then normalise err to 0 so the
> +	 * ioctl reports plain success; the firmware status is conveyed to
> +	 * userspace inside the response buffer itself.
> +	 */
> +	cmd_snd_rcv_rsp_info.rx_buf_sz = err;
> +	err = 0;
> +
> +	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
> +		"message received, start transmit to user");
> +
> +	rsp_status_err =
> +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					cmd_snd_rcv_rsp_info.rx_buf_sz,
> +					tx_msg->header.ver == priv->if_defs->base_api_ver);
> +
> +	if (!rsp_status_err) {
> +		/*
> +		 * The response is well formed and fully fits the caller's
> +		 * buffer, so any FW-allocated session/storage handle it carries
> +		 * (data[1]) has been delivered. Record it now, before the
> +		 * copy-out steps below. The FW has already committed the handle;
> +		 * running fw_api_specific_ops() only after a successful
> +		 * se_dev_ctx_cpy_out_data()/copy_to_user() would leave the
> +		 * handle untracked - and so never closed on teardown, leaking it
> +		 * in FW - whenever the caller supplied a bad output pointer.
> +		 */
> +		fw_api_specific_ops(dev_ctx, rx_msg, false);
> +
> +		err = se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0) {
> +			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +			return err;
> +		}
> +	}
> +
> +	/* Copy data from the buffer */
> +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
> +			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
> +
> +	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf), rx_msg,
> +			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
> +		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +
> +	if (cleanup_err && !err)
> +		err = cleanup_err;
> +
> +	return err;
> +}
> +
> +static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
> +				void __user *uarg)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_ioctl_get_if_info if_info;
> +	struct se_if_node *if_node;
> +	int err = 0;
> +
> +	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
> +
> +	if_info.se_if_id = 0;
> +	if_info.interrupt_idx = 0;
> +	if_info.tz = 0;
> +	if_info.did = 0;
> +	if_info.cmd_tag = priv->if_defs->cmd_tag;
> +	if_info.rsp_tag = priv->if_defs->rsp_tag;
> +	if_info.success_tag = priv->if_defs->success_tag;
> +	if_info.base_api_ver = priv->if_defs->base_api_ver;
> +	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
> +
> +	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
> +		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
> +		if_info.did);
> +
> +	if (copy_to_user(uarg, &if_info, sizeof(if_info))) {
> +		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +static void rollback_shared_mem_pos(struct se_if_device_ctx *dev_ctx, u32 length)
> +{
> +	struct se_shared_mem *shared_mem = NULL;
> +
> +	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
> +
> +	if (WARN_ON_ONCE(length > shared_mem->pos)) {
> +		shared_mem->pos = 0;
> +		return;
> +	}
> +
> +	shared_mem->pos -= length;
> +}
> +
> +int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
> +			u32 *length, dma_addr_t *ele_dma_addr, void **ptr)
> +{
> +	struct se_shared_mem *shared_mem = NULL;
> +	bool is_fw_busy_dev_ctx;
> +	size_t aligned_len = 0;
> +	u32 pos;
> +
> +	/*
> +	 * If this context is the one that caused a firmware timeout the shared
> +	 * DMA buffers may still be actively read/written by the firmware.
> +	 */
> +	is_fw_busy_dev_ctx = se_is_fw_busy_ctx(dev_ctx);
> +	if (is_fw_busy_dev_ctx)
> +		return -EBUSY;
> +
> +	aligned_len = round_up((size_t)*length, 8);
> +	if (aligned_len < *length) {
> +		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
> +			dev_ctx->devname);
> +		return -EINVAL;
> +	}
> +
> +	/* No specific requirement for this buffer. */
> +	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
> +
> +	/* Check there is enough space in the shared memory. */
> +	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
> +		dev_ctx->devname, aligned_len, shared_mem->size,
> +		shared_mem->pos);
> +
> +	if (shared_mem->size < shared_mem->pos ||
> +	    aligned_len > (shared_mem->size - shared_mem->pos)) {
> +		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
> +			dev_ctx->devname);
> +		return -ENOMEM;
> +	}
> +
> +	/* Allocate space in shared memory. 8 bytes aligned. */
> +	pos = shared_mem->pos;
> +	shared_mem->pos += aligned_len;
> +	*ele_dma_addr = (u64)shared_mem->dma_addr + pos;
> +	*ptr = shared_mem->ptr + pos;
> +	*length = aligned_len;
> +
> +	memset(shared_mem->ptr + pos, 0, aligned_len);
> +
> +	return 0;
> +}
> +
> +/*
> + * Copy a buffer of data to/from the user and return the address to use in
> + * messages
> + */
> +static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
> +					void __user *uarg)
> +{
> +	struct se_ioctl_setup_iobuf io = {0};
> +	struct se_buf_desc *b_desc = NULL;
> +	void *dma_buf_ptr = NULL;
> +	dma_addr_t ele_dma_addr;
> +	u32 aligned_len = 0;
> +	int err = 0;
> +
> +	if (copy_from_user(&io, uarg, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
> +			dev_ctx->devname);
> +		return -EFAULT;
> +	}
> +
> +	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
> +		u64_to_user_ptr(io.user_buf), io.length, io.flags);
> +
> +	if (io.length == 0 || !io.user_buf) {
> +		/*
> +		 * Accept NULL pointers since some buffers are optional
> +		 * in FW commands. In this case we should return 0 as
> +		 * pointer to be embedded into the message.
> +		 * Skip all data copy part of code below.
> +		 */
> +		io.ele_addr = 0;
> +		goto copy;
> +	}
> +
> +	aligned_len = io.length;
> +	err = get_shared_mem_slot(dev_ctx, &aligned_len, &ele_dma_addr, &dma_buf_ptr);
> +	if (err)
> +		return err;
> +
> +	io.ele_addr = ele_dma_addr;
> +	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
> +	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
> +		/*
> +		 * buffer is input:
> +		 * copy data from user space to this allocated buffer.
> +		 */
> +		if (copy_from_user(dma_buf_ptr, u64_to_user_ptr(io.user_buf),
> +				   io.length)) {
> +			dev_err(dev_ctx->priv->dev,
> +				"%s: Failed copy data to shared memory.",
> +				dev_ctx->devname);
> +			err = -EFAULT;
> +			goto rollback;
> +		}
> +	}
> +
> +	b_desc = add_b_desc_to_pending_list(dma_buf_ptr, &io, dev_ctx);
> +	if (IS_ERR(b_desc)) {
> +		err = PTR_ERR(b_desc);
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
> +			dev_ctx->devname);
> +		goto rollback;
> +	}
> +
> +copy:
> +	/* Provide the EdgeLock Enclave address to user space only if success.*/
> +	if (copy_to_user(uarg, &io, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +		goto rollback;
> +	}
> +	return err;
> +
> +rollback:
> +	if (!IS_ERR_OR_NULL(b_desc)) {
> +		list_del(&b_desc->link);
> +		kfree(b_desc);
> +	}
> +
> +	if (dma_buf_ptr && aligned_len) {
> +		memset(dma_buf_ptr, 0, aligned_len);
> +		rollback_shared_mem_pos(dev_ctx, aligned_len);
> +	}
> +
> +	return err;
> +}
> +
> +/* IOCTL to provide SoC information */
> +static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
> +					    void __user *uarg)
> +{
> +	struct se_ioctl_get_soc_info soc_info;
> +	int err = -EINVAL;
> +
> +	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
> +	soc_info.soc_rev = var_se_info.soc_rev;
> +
> +	err = copy_to_user(uarg, (u8 *)(&soc_info), sizeof(soc_info));
> +	if (err) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/*
> + * File operations for user-space
> + */
> +
> +/* Write a message to the MU. */
> +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv;
> +	int err;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
> +		if (dev_ctx->cleanup_done)
> +			return -ENODEV;
> +
> +		priv = dev_ctx->priv;
> +
> +		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
> +			buf, size, ((ppos) ? *ppos : 0));
> +
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +			se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +			return -EINVAL;
> +		}
> +
> +		if (size < SE_MU_HDR_SZ || size > MAX_ALLOWED_TX_MSG_SZ) {
> +			dev_err(priv->dev, "%s: User buffer too small/large(%zu < %d)",
> +				dev_ctx->devname, size,
> +				size < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
> +								MAX_ALLOWED_TX_MSG_SZ);
> +			return -ENOSPC;
> +		}
> +
> +		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
> +		if (IS_ERR(tx_msg))
> +			return PTR_ERR(tx_msg);
> +
> +		err = se_chk_tx_rsp_msg_hdr(dev_ctx, &tx_msg->header, size);
> +		if (err)
> +			return err;
> +
> +		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     tx_msg, size, false);
> +
> +		err = ele_msg_send(dev_ctx, tx_msg, size);
> +
> +		return err;
> +	}
> +}
> +
> +/*
> + * Read a message from the MU.
> + * Blocking until a message is available.
> + */
> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
> +			       loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	u8 rx_msg_snap[MAX_NVM_MSG_LEN] = {};
> +	struct se_if_priv *priv;
> +	unsigned long flags;
> +	size_t copy_len;
> +	int err;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
> +		priv = dev_ctx->priv;
> +
> +		if (dev_ctx->cleanup_done)
> +			return -ENODEV;
> +
> +		dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
> +			buf, size, ((ppos) ? *ppos : 0));
> +
> +		mutex_lock(&priv->modify_lock);
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +			mutex_unlock(&priv->modify_lock);
> +			se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +			return -EINVAL;
> +		}
> +		mutex_unlock(&priv->modify_lock);
> +	}
> +
> +	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
> +	if (err < 0) {
> +		if (err != -ERESTARTSYS)
> +			dev_err(priv->dev,
> +				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
> +				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
> +		return err;
> +	}
> +
> +	/*
> +	 * Reacquire fops_lock before touching any dev_ctx state (pending lists,
> +	 * rx_msg) after the blocking wait. fops_lock was dropped before calling
> +	 * ele_msg_rcv(). If cleanup_dev_ctx() ran concurrently it could have
> +	 * freed the DMA buffers and the pending lists, leading to UAF and list
> +	 * corruption. Re-checking cleanup_done under fops_lock prevents that.
> +	 */
> +	mutex_lock(&dev_ctx->fops_lock);
> +
> +	if (dev_ctx->cleanup_done) {
> +		mutex_unlock(&dev_ctx->fops_lock);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Snapshot the full rx_msg buffer under modify_lock + clbk_rx_lock.
> +	 * Always copy the full received message (not just copy_len bytes) so
> +	 * fw_api_specific_ops() reads complete data words. copy_len is the
> +	 * amount the caller asked for and is used only for copy_to_user().
> +	 * fw_api_specific_ops() must be called OUTSIDE modify_lock: for
> +	 * ELE_STORAGE_OPEN_REQ it calls set_dev_ctx_as_command_receiver(),
> +	 * which takes modify_lock itself. Calling it while modify_lock is
> +	 * already held would deadlock.
> +	 */
> +	scoped_guard(mutex, &priv->modify_lock) {
> +		spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> +		if (priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx ||
> +		    !priv->cmd_receiver_clbk_hdl.rx_msg ||
> +		    !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
> +			spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> +			mutex_unlock(&dev_ctx->fops_lock);
> +			return -ENODEV;
> +		}
> +		/*
> +		 * Snapshot the whole received message, not just copy_len bytes.
> +		 * fw_api_specific_ops() reads data words (e.g. strg_hdl at
> +		 * data[1]) that may lie beyond the userspace read() size.
> +		 * Truncating the copy here would zero-pad those words and cause
> +		 * fw_api_specific_ops() to record a zero handle, losing it.
> +		 */
> +		copy_len = min(size, (size_t)priv->cmd_receiver_clbk_hdl.rx_msg_sz);
> +		memcpy(rx_msg_snap, priv->cmd_receiver_clbk_hdl.rx_msg,
> +		       priv->cmd_receiver_clbk_hdl.rx_msg_sz);
> +		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> +		spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> +
> +		/* We may need to copy the output data to user before
> +		 * delivering the completion message.
> +		 */
> +		err = se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0) {
> +			se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +			mutex_unlock(&dev_ctx->fops_lock);
> +			return err;
> +		}
> +	}
> +
> +	/* fw_api_specific_ops() runs outside modify_lock; see comment above. */
> +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> +			     rx_msg_snap, copy_len, false);
> +
> +	cmd_receiver_specific_ops(dev_ctx, (struct se_api_msg *)rx_msg_snap);
> +	err = copy_len;
> +	if (copy_to_user(buf, rx_msg_snap, copy_len))
> +		err = -EFAULT;
> +
> +	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +	mutex_unlock(&dev_ctx->fops_lock);
> +
> +	return err;
> +}
> +
> +/* Open a character device. */
> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
> +	struct miscdevice *miscdev = fp->private_data;
> +	struct se_if_open_gate *gate;
> +	struct se_if_device_ctx *misc_dev_ctx;
> +	struct se_if_device_ctx *dev_ctx;
> +	struct se_if_priv *priv;
> +	int err = 0;
> +
> +	gate = container_of(miscdev, struct se_if_open_gate, miscdev);
> +
> +	if (!se_if_open_gate_get(gate))
> +		return -ENODEV;
> +
> +	if (mutex_lock_interruptible(&gate->lock)) {
> +		se_if_open_gate_put(gate);
> +		return -ERESTARTSYS;

		err = -ERESTARTSYS;
		then goto
> +	}
> +
> +	if (gate->dying || !gate->priv ||
> +	    !kref_get_unless_zero(&gate->priv->refcount)) {
> +		err = -ENODEV;
> +		goto out_unlock_gate;
> +	}
> +
> +	priv = gate->priv;
> +	mutex_unlock(&gate->lock);
> +
> +	misc_dev_ctx = priv->priv_dev_ctx;
> +
> +	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
> +		err = -ERESTARTSYS;
> +		goto out_put_priv;
> +	}

Is ACQUIRE(mutex_intr, l)(&misc_dev_ctx->fops_lock); make code simpler?

> +
> +	if (misc_dev_ctx->cleanup_done) {
> +		err = -ENODEV;
> +		goto out_unlock_misc;
> +	}
> +
> +	priv->dev_ctx_mono_count++;
> +	err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
> +	if (err) {
> +		dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
> +		goto out_unlock_misc;
> +	}
> +
> +	fp->private_data = dev_ctx;
> +
> +out_unlock_misc:
> +	mutex_unlock(&misc_dev_ctx->fops_lock);
> +out_put_priv:
> +	kref_put(&priv->refcount, se_if_priv_release);
> +	se_if_open_gate_put(gate);
> +	return err;


> +out_unlock_gate:
> +	mutex_unlock(&gate->lock);
> +	se_if_open_gate_put(gate);
> +	return err;

why need two set error branch.

Frank
