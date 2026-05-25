Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0757347BAF
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687431; cv=fail; b=brlCI/+sE4oVJ6n9TiTCZZDPGouJzP5y18NmO5MkZ6PSCWRepjx1iwj7RHukQNva9//kErMTWhb/Lnr+0lnHFsdRBv7d7vFMElppAvPIXCbTo53utle8tyHJcokz3Zq2/Mz/suteobUKIxz05Ohn2XUBct06FaFmedamAFMmTqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687431; c=relaxed/simple;
	bh=v2aceoeUXOfNd4ibWEtK6i/t34yUa5qsnNM9YCCwg5w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gYB2Ast40Ckn7hoMj7T93G9hXtBRO8aDDunozmQg0M0WFLUhCkMshA6CuBZmXz90AzkvySq2pWoCi98xvBjFV2cDSPnkGLrgED6GE+jyqqJZRgReE3xJF5WrrABMk28gyebW67jcniIpSP8FfIcYgPRNBYng/MiQspZrRBPCeFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PhbbPxeF; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PhbbPxeF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBSrx7MSCaGViXzC2q/KvR1EWpKlPToi7e/oAO1DzdQaaOxrgQ+gKK+6ZyqZ7CvV4Saoc/kuz/Sz96x3GwF7qLrrQFBngpDPOaPhoxo0WI39EUFZ9OBzsRQbrUA8CtyOiQdOGTHLG6BmYmgn9Od2u67m40t3bzkUI8bnA9Rlvf7uJsavcBZiSlFDLh/VfM+IXg8JxJskRgSYjLcuADxRMUHg2P+zVt+GhWmccpJInJ+Jw7OfErNUTp2cO2HYPBzfBPJILqHRKXR3JmXhEzhIuqSOA7eNIQkV8SpCwXLki4ccZ7rxcesUCCsYrRbeEnadmuwCoa6dW7GHwlR5uhduwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuX3JHX3hl/Anp7GzlRrL8rORqtJhUZKxN/IDWH9pio=;
 b=E3lz/vyv6+kvqWmZl3K37s5zs/OXgDFbnUyaFGOLcqDTqvsaLQxvBi+yP/YRM0HTp3OYLvcYmhiU31l46uT6Wn3OeJHXtXgziDWTO8n+St4QmsUAkmqe1REVQIVDB+fOlnfIQdDfupWE7v2ZqZ55vU+VgTYLQQL9N7iRqA50Rh/eJwuKzsh3LK/rdnlgu/C4EXBusrVD8f/3oWLxe1bxhS/v7Txn5ZJOeHYT00vWQ7eBXtITvnFNvbGWLSr0dpM4ANWN/y7oSz9+nYlx8qq5i2vHWPd0ZEtAyFltde7lqcZ1kvcF0XGIjlYD4fyyq2/BC2i5CvtTDmFVHMYw6vheWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuX3JHX3hl/Anp7GzlRrL8rORqtJhUZKxN/IDWH9pio=;
 b=PhbbPxeF8DaO+NO567dMWpgkldnW6Twinm05ZDhoWo9OMfHpZ0mbwEMA+5MizlRdIgltgZkEdnx0I89Nx5nM5WbUNJ9xAc7Yyjm9XaopckDljrnA7cq10IHoX5+vJsc+YMzMCrgiRdABtFwUyumZF/iJSqfFRHkgKwWPr1G/jVK6NbBcKAyhf52zp/S2PJQq8SnlSJq/IhciXUI6FfUxW44uCJAvUjJHKjXCcWYlphE/OVxmQvjYpROPU/QrZsttAmZSbMwz4Az5KoYpaEJoCU3j+3+G1mtl3oR4mkiNKr5v77NeJk3ENtJ/awvjeBhnJXKpxRGtIIu4vuCgzzdcMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 05:37:05 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] firmware: imx: ele: misc fixes
Date: Mon, 25 May 2026 13:39:23 +0800
Message-Id: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzgE2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNT3dScVN0yQ91Uw5REw7S0ZAsLo1QloOKCotS0zAqwQdGxtbUAJTc
 rm1gAAAA=
X-Change-ID: 20260525-ele-v1-e1da1ffc882e
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: ae271204-5c4c-40ef-91f4-08deba1fa79f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|18002099003|56012099003|38350700014|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	I+cPMFVsdiMKJaPACjaSOGEcgNHRHcaHsgu0pNcxlXdzJSsr8XA4syyj3NqI1WqUAaR9pAFEe3hUJSdsBv4ykbGVGYZn6MqMfLW+8EOuUJVY7+ApKwt4/3rFWwgRIxHxqm1avbkWUFdW9EAPQflC2EK9G11lBihT/yfOe3hcTYfyAEA0Hgx9HgMQaCjCbIHejm0syRoTQuqUpH5uJ7CtGzN+zr7Afwk34xNPFBPqzl6DMCBQnn582H/YVsQfDkYz+w+GXoAbEKLLv9d17XYpXIRcoSgNqBfOQYiY0L/c2cEFFFFUQESrtz03t660hswvrkd4exFChQ7A7djUJHEQUMSf2X73niikZCVnxm57Y7LK26LzoVZ+rrqZBrbNdzUrj81ha/WPe9mtAx3weirnmGAFGJjbBq+ZH2lcROcVKj+8XhTJY+5sCshaPzJg9nTMEQ53IGIjuztG8jucPQ11bYNmBVtlitqoBcXdT7tCp4rGlfiwqYDzVu99NQGEJ6nPzQQqwsu5IhugR9CJva73HOn0pWVCVBVBB3E2dWIjOCma+k6r58+6jYUzgLXwxsR1+1VJ6bAdhWnxZmjgKPXSn1NBttWui828r3y+cAOTKiBlw3JLFzmy+qDoMn0QGD9loskmB0bT75Pcxjec/qFN5AY9HQTNXDalHrlZ0JKCUObRaK2exr5tNPghojWW8MkIZlEXKb9DPtCvfQzZSmMOVaTuZNjT/BCLi+VCpciuLH+H50JRTk7IXdOyoPu6Ucx0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(18002099003)(56012099003)(38350700014)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzhBazAzQnVYcDJYYTlVQ0xLT1JKcVVBUGJnUFlhcVlucGxBWWRHSWY2UDJ3?=
 =?utf-8?B?R2RuMEdHT0FNemJVTG1FSXJqOVNvNXR6STlldFFMSmNRMWVvUEE2NFFWcE1B?=
 =?utf-8?B?dGZ2aGNuSUFpM0RXRVF4L2RZd2Y1VVltQ0RsOGV3bTdQdkJEdU1Xd2xrRkZ0?=
 =?utf-8?B?WFJ1b200Nlc5eitXYTFud1NUMlM2SW1YVUFlTDRoQ2lQMWFYWDdOTEljNnFJ?=
 =?utf-8?B?bXp5ZzZGdkh3RjQvdDF3eU9QY3N6ZXcxQ2dIUTFiTi9PbzY5TUl5Q25xQ0cw?=
 =?utf-8?B?TVFHZTdzSTRyRmR0ZGM2bS9QMGJlMlJjTG5DVmw5MUZSZXpEME40OGhmanhB?=
 =?utf-8?B?TWpsNnFYYUxYV21ETnBuRDBOaHBvQlZYdUhVMHZHQkhPV2ZSRXMyY01IWCtW?=
 =?utf-8?B?YmpFNDRudU9xc3A3VUJUd0pKUHY1S0ZFVUVHWnRDTm4vUnAyRU0vUXZ3aFpP?=
 =?utf-8?B?Q2VreG1PM21tNDZhYnY0Z0YzZi9sVGJuNVZzSU5NNDVOVVJXTlZ5ZWp0bXIx?=
 =?utf-8?B?UlY2anJwandTYy9JUkk4MldiTDVybHBwRSs5OUErTXJDYVQ0RHZKa2w4WFlN?=
 =?utf-8?B?M1BFMjF0WExvR0I1eG5Gd0VZMjgvSUVOWGxxc0Q2WnUxT21XNXFOeW9ycjU5?=
 =?utf-8?B?MVRDUllnUW4vbFZlNVgwWU1VVGpZeEwrNGtpUlpIY1FObzhWMXNOMzk0K2x0?=
 =?utf-8?B?cFRyVzNEVW1vTlplcHdoMFJKbnhKM0czcVZhL0pqaHpQSE56TlhOdDdhRXNV?=
 =?utf-8?B?Y2ZicGVUbWoxWk5nbWQ1ejYweDVsVkdsYkxNMjlWMVBwSVErWU9UR3lTYUZt?=
 =?utf-8?B?UzNlUHlKNjJoV2I4VGRTSFBuN1ptZlRSMW5JRFpocFk5R1BiSXcxZnd3YmlY?=
 =?utf-8?B?OUk5ZVZUL2dURDZIRWtHOUk3T09KNS9qWGhtM05rNld0NVpPTjB3ZUtudlkw?=
 =?utf-8?B?QXJ6OXd2RmZuQmJtK3NsdnNZc1hwOWhaNE5hSmozL242V2F2aHZYcnpSenVr?=
 =?utf-8?B?alc4cWZyaU9aVGhEMTlFM0ttMEhES3FDamNNNExIZVU3TjREUGx0WTZXWFli?=
 =?utf-8?B?MnlwK2Q5cC82c01xMHY1NmozYnQvblAvbk9zOXdrM3ozOHBrZzdxaSsvN0NS?=
 =?utf-8?B?Y2JlaHNHdDhIQlBHbzNQS0N2dXVoOTZETTlRQzdsQVpYcW1veCtaNmkvdVVk?=
 =?utf-8?B?Rk4wQnEvYlVuN1RuUHN4ZDl5VHF3Y2ZhYUMyNXp6Rnc2OGt4cGxReDk2RG83?=
 =?utf-8?B?ZFI5Q3l4V21hcXlnK1FMMDA0emtQSTdkaTZmeGszcyt2cXU3YmxLN0xaQjN6?=
 =?utf-8?B?WHdqd1BZblM5Wk1JUVRLQW42L2pKQ3UvRUZEeDd3UXl4YTY2NHpEYnh1ek90?=
 =?utf-8?B?N0JhVmZIaXJNbE5vU0RjNHFUVVBmZWp5NmtkdEpZam1TWHpncEljZGNjSERI?=
 =?utf-8?B?ZXdoNWpENTFrZGNrQ0UxMnNaMUdjZVcwczRSZ3o0K1VqN1lwMTYyOTFpeE5S?=
 =?utf-8?B?WHhFWUY1M0U1WEF1cWdmRW5uelUrT0F4KzUwYnRzWVgzRitUK2ZOcGZPZzR2?=
 =?utf-8?B?TUQzak5VVmpia0ZMdndkS2hnQWdGUXhpWnVNMjlxT3ZkSDlSdU1yaXVDQTNm?=
 =?utf-8?B?NnEzQ2pGSU9JbnNONmRXamdnVTQvTzErREVCWHlZN2JSZWhTa3ZCdGphM0JB?=
 =?utf-8?B?ZGRjV1FUL1NrRDNpRXNrUURNRUZtK2tHMmUwN3VyWDJzSzB1MHVFdUZUbE1q?=
 =?utf-8?B?M0hRM29LZ2hpOVlRZXh4bHBqSVVFRGw2MVB1KzJJMytjTFhXYjZ4WVA0UGcx?=
 =?utf-8?B?U3FZamozU2FTQWxxRlNKeWRUNmJrQmJiKzRXYmNVRmo3c2hDMmxkUzREUmhR?=
 =?utf-8?B?QyswZ3RTck5qbHhxUzdjVkZlSXk5NzVOOC9KWnNKZzF6YlkrblArZ3BLbk0y?=
 =?utf-8?B?YThRVWxTYlJDUHBPOWp5bzhjcENvMm5IRllZTzVlUmFSU21CZUtJbXpmcVp2?=
 =?utf-8?B?dG1XRHY3MnpGQlJrTkUzcWNGNVNhTDdZUk1qQ3ZTTGVlc1BmMmZJVzJJcTFq?=
 =?utf-8?B?RkJIaE5qOFQzOGFxSzFhV3czNm55Uk1mZ3c2UllpM2JmdU12d3g3ZEdQdU5j?=
 =?utf-8?B?TlM3VnpKeTJ2YndvdDFPd3oxZ2xGeXI4SWNHNlM2MDhMbmdiZmlleTlmUFZo?=
 =?utf-8?B?V0pUbEJQQVRraTFwTUlvWlFZc1V0UXRBMDB4Nmk3Rk9UZnVBNHRDOFAvWGRi?=
 =?utf-8?B?NnBJRVlici9QWTQ5REV5bGxuaWtpeGdXY1AxazRseFl2S0tpOGNQNjFhRFlX?=
 =?utf-8?B?YkVWSnNzbjhxbVVSRzVxVFozQUFYY3RkOU9OWWZ5ZWZWZllGUTFZdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae271204-5c4c-40ef-91f4-08deba1fa79f
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:05.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zv0R/kSG1PaE8t477sW/uEiD7L/EvRbuiFduet8g9my3FAs4/W0WceblUZOlkM42yLSZj75x4oonY8czFIbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

Misc fixes when reading the ele driver, including check condition, size
mismatch and etc. More information could be found in each patch commit
log.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      firmware: imx: ele: Correct check condition in se_if_rx_callback
      firmware: imx: ele: Correct ele_fw_authenticate API
      firmware: imx: ele: Bypass memcpy when ele_get_info() fails
      firmware: imx: ele: simplify SoC device registration
      firmware: imx: ele: Correct check_hdr_exception_for_sz
      firmware: imx: ele: Use dev_err for error report
      firmware: imx: ele: Fix debug dump size handling

 drivers/firmware/imx/ele_base_msg.c | 15 +++++++++++----
 drivers/firmware/imx/ele_common.c   |  4 ++--
 drivers/firmware/imx/se_ctrl.c      | 15 ++++-----------
 3 files changed, 17 insertions(+), 17 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-ele-v1-e1da1ffc882e

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

