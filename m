Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795591665;
	b=U57G/gef1qWX4bzg035fGTTnmyg2HOnZMsFXn2tpoZRJ1q52/JashgPoJE9uPiR3Ytei
	 6OmS0f2kGRP957crg1oJJc82K7Udj9yM1pynit37mESbgmdC4lEExvMvNHyLa6GhT6x5E
	 7NWB36K36aQTaYDbpwWykHM4/rRIFWwr1lwZYOuV7/NwrKBOBUXcHE6jiprJVVRSPUd2/
	 NpDUjX7fpCC9jqIvb2eGjgCyiQJDwWjt2DfCUjFN9PHGq/eYij/+9sbO1ErPs9wg+5xIB
	 owW/qkZJlm/GUur1SVXAjaMRifO/GdH89D75KV2tfrQgEjlHAe/tnikUJBg+BIGwkGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591665;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NV0v1XcURvhAqJBd4bpCHaDLATAzQIS671OmPc01GLw=;
	b=ScjvrkD8R3cKm0rOCXWWlW4x9/ZG5FW1HKN2rbS142dVhdPOO0IROSh8/+E2b1kBt24S
	 Oc4c5M/5hpyCws9ZyWKLvERWRnr6JyFWTlE+2pitUaxfszGvyDjkYb+9m9WVns2sY6LNJ
	 wH0x7x3DxXjy6Ts84cojX+NiGsp0fVRvN6BcvND88ZXB+nSIHD5c+M27bbH62wM26oRrD
	 KYX0McYUIB8JNDZf1BlTLZsCbDwg6wrQhWmPOrW8Fm52tbz6Kjia2vP+0tVF/qGpUYUFb
	 PToIhgbP9cbwwjE5vctLAEUQ2EKiIuAonRNwAADoHwXH6hGA/nsxaK3eGe47iHdy/iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="j2bGT+v/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC9606A329
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FC9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=j2bGT+v/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA6Xx9sSa3tsmGolIPeY8/9z3gIdZbZvJaemYP7HJmzRNIileRTn09FAG+7avBiQCq/H7hr/GhsCy1KqicSBMwaCcXnvAbI/BDhbziGrkq/XalA5hAYETr/3KZnarmUX1bw5N7jjQz23xGvltkl/TXX20V/jRT3Tp25kE+S9s64lyLPJCZj/rPaICiVjAP5VBcLWKOiTXsJ63CsY1y5wB08rcjruMuD7HuB+HiXFfKrcghDDE0blvM0Lf2/cNzf3qAyd2UumTnpw3lV5tdmIZ0SId1PwKLjSpRZEzS0q95IL+Ozar8T/t8k/nLwqRlxUM5LYM0we5RLkXy9QHGQDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV0v1XcURvhAqJBd4bpCHaDLATAzQIS671OmPc01GLw=;
 b=KZztme0NwleXX2XyNyc/vA/3qp7i3cJ7YWD/UgRjyyY/k/ZNTOPCRaGC7Xe5CaaDV44Mv5UBA2fPKeA6nkNGLjDhuiMXSjtELzqwHcV10eO9GRLn9HwQKgYODgV0DadM9Yc4s0OgjBMAerIYoDWRmXaAcqVAGiFF4s0MHdAjcgD5UuJ8sjs+9X5i0IVmZlJTYMQVInAwsQx1KoK46LjQKkHoWwrIlnWDSi19AKwLDTgcyit+7t9ncXFK8m/gS09idrug2ssKn6J8UVpm7FScGSNJoDtKQT8Zxepqlul2x7pANXv/+zXMdts6IZThA4XsTKBfxJaf4KPbw9pNL08jTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV0v1XcURvhAqJBd4bpCHaDLATAzQIS671OmPc01GLw=;
 b=j2bGT+v/0VXHgjRAlEbX08w0Z4IDEewM5rpXQyPbm2MFkjxl6ZDxRXolQ8ctT5uav7ygW9qt2dwuCjHmKmv5d6GtIHBhPPwzu/3ZH2MV1iWgm0RwweiEFFAhOpgZ5Q0mNHGNno1JbpDtNMBpyrG6Dy4Z/9/dPxOWc9XuOnUoGPP8LhGnlFtoZFimxL7CHKIZC58W+DyibBYnC+XDdf0uA5sDkm7/Erp2ZENs996jG97ZIq6d4tO3+4ULzn757yzpAl7lv70t+U50lRj/ow/mZ9Lh6FHVtBT8V6TZ0u8tvZNKtEUUWNRTrF3ytKjIs6GxwefZg0giLV49DsyoJ1oq6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 07:27:42 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0639.010; Wed, 25 Nov 2026
 07:27:42 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Christian Eggers <ceggers@arri.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
Date: Wed, 25 Nov 2026 09:27:36 +0200
Message-ID: <20261125072736.769516-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d33ab6e-8016-4dfe-08d7-08df4ac5976e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261022075727099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aWYBNLSfSxLcgjsW4VIlreZMRqMOXu3AJMNHxSP2GOBI+veTE3qYbfn1Btwmj7D1jRQwbE3KE8GMQThWoiuHLQBfStphjuCW0Ezwq7P6iGqq6TfHozaHqWRb9obdjPbVhI7pUTeO1yg58fqIMq/JYp6VYI8brVEt1TZ7dmUjzqx2URvl5IKm3xiMnwwJ2VVJwrgP5xxSLHRtnI9py3bCfhGUMO16B0bRFrqPvYNlBKVtEv/7OaMiEUjBhPEDbydVqC9k/d/o4WtYI0V9CPqC3sHO5CbgZ0Sz3BVzZW9/qvm3nhkX20qEeqieZxwg9HKJugYjYTPPPacb+spOwW5tQH2/Dwi3D2KWObUPyKjF2kOSD9Nd3NZ90KquZToS7fxTcie5ooc3f3lYiAWBhD02Z/RGmqILOCbSOs+P0/0kofLyTG1pzgN46mUDdNzxNWxzqrRT7PYUtFeFgLUFnVjj1OTcyuaVUBVYIz5pSnQUKvVu3UOkr2hjTge57p7/QRrLr2QXqEfKF/6I1OkwVTU0gKuNKhVDrDwOZP/CUbAN+AqpHIpl1QuZOxIZUfAa3y0uNoo2rq+dhZ7q6KZpW63lg9lX+mVhTKKVE+Jqos50u/n90CkDQS2ws+LEo4N/xi214ZgYlFgOwYw6YyKGwg+AWF5sizYbq0V53Ax0vUi2Ox4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HA6987avAgzsjryd14bSA3Fvecyj/6YRdveAsa0qxFT4ei8Nftf76A+rGQay?=
 =?us-ascii?Q?L7fXy1aSRWLyLbIpARBxm00CR99dGuYFpZpXGOf+kFcIaKD0CriNwbOu0WLh?=
 =?us-ascii?Q?4wdVbUklEONJUPJiROt0oSskDzDFzY+k6Wp7pGWQPQ/EVxukIh7QaS7kBIPs?=
 =?us-ascii?Q?dAdV6/4InhXip2QvJC2DyW29vbgA5VsZ9LZoG4kamS98AgE0gRN5N7kdi4W0?=
 =?us-ascii?Q?HWlRjpv/UqxidlvhmYbma4OmUIaaXTxbmlGu4baD+J1igcQ58lr/K4V0tEMq?=
 =?us-ascii?Q?1X3CHOAMSADqM9lOEURJfVqSERRT9+5P8eXaatwCKxz0ELkcj+1KLB6e8pM8?=
 =?us-ascii?Q?apJ7zslsAy8V25gxU2ej51c+YESLvW3oXhm5b6VRB6dei8CVf75iowdZc9vf?=
 =?us-ascii?Q?QpznNPWmkwd5e1dAEeyn3FsEZScKyoSETbGQwU5SXeXASx8Wsz5MWWFYLRwK?=
 =?us-ascii?Q?yrMY6OF15aTEYdW27Tq82sRTnbkrJaQvshV7epONXoaf0LobOA6hBdm6ity3?=
 =?us-ascii?Q?UZc7lGQgnY5nLYZF2arFb1stvWpGe0jNmSQTqQJTNrPoGpokfEfjMm4REed3?=
 =?us-ascii?Q?Bn7Q7xx+AUQ3M/xb3FD8wEGe6/PLsMHENJgy1bjcYNzDiLrIDMlv+4V17KJJ?=
 =?us-ascii?Q?1QrWmHv4gm8gcBk5cicuyAawvVTHuGMN0a5/U1qIVQEk41rtqhNeLSMYx8uf?=
 =?us-ascii?Q?mXxdM7V7o21ohfJAU4mOU452Nd+9nk1HEZvlOuDM0CdvEgWRnP+vvwQWqk8v?=
 =?us-ascii?Q?vlPf3jMhjVylCcAY3zlTcwsnzD/JnkzgavoBbFZX4I9fhvRpOsNQpwRr2y1e?=
 =?us-ascii?Q?PnrWahH07a+4UvHK5OhPUuLHbks+QAw+VJXcTM3FoTNvl5yEs+rNaiORn8YG?=
 =?us-ascii?Q?mxEOte577FO7NHHiLLfLMpgy71x5Nt4RXgqnghRiyvXKGdetlmC1/c2p7I8G?=
 =?us-ascii?Q?OLmgvVJfscbeUOtCbV/29mJe4bp3b1C9E+TOVkO0Bu7MJrmgbYl2RFDHgb04?=
 =?us-ascii?Q?Ha/rG2+AJ6IpIadUKh+UgapMxXINycMnbDK06lXvgq16wD/kZrxOdCIaVY5R?=
 =?us-ascii?Q?/ypN+NOm+rvwtVrKn+pWQcXgrokz+ijIdM9MkQeLvRsXLN7A22DAadJbLOtw?=
 =?us-ascii?Q?1cWwQZucDQX/fIOKO3FVY3hnrd47uUlx127wzpObpxJWP+eXLGkpO5ZEO3RU?=
 =?us-ascii?Q?5Knb0CY01LwxhLnS4DLDLvX5M8pzS1TJ7ed8HaTcEbatCKhabuxJyq4yJvF7?=
 =?us-ascii?Q?ovX8O3tVf37+Tc9toN4XYuunKxmL4eQDrh6lJm9CR3LCAsi4Y86MyqKrlsfn?=
 =?us-ascii?Q?o+h3ITfSQGg34YU88VZbc1hVeHxmO3Y7G+ugpZ4SFoL32GJcqNHZ1mff34Tn?=
 =?us-ascii?Q?LHvj3DiXwqhQUhxNeFUtYXxXLw6FDcplkrgSfkSFE5eGMR57mRcmhw92Mn7n?=
 =?us-ascii?Q?RhpKQ/UPFIAVkfgvOHlJOaGmyAMudpn6xJLZ1OIVNbJCndoyIH/8LDZz8Dmi?=
 =?us-ascii?Q?AJdLp2jQ0iNEO7dyWmYbdcYLppakNWFbR4oSClRRyxMKWeiQDhp8cFatRXmd?=
 =?us-ascii?Q?uIdIdDYStwSGn9luq84lRbnUNWIkdBOse92Cq48298gzJwjqy7lTgLoHr5xQ?=
 =?us-ascii?Q?XBbJme6JZv3QBpUpzgqv1cQsZedyxuNECrbloO3rHAjVDHPrZVgf4MBjBfl7?=
 =?us-ascii?Q?HfGM11G02xkOF1yqmQOXl2dBRSu9TIGQjlQ9KUgPwNPte/MXo7avZuQt55j9?=
 =?us-ascii?Q?U3zcXqkTng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d33ab6e-8016-4dfe-08d7-08df4ac5976e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:27:42.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GZ8btODMKgwmhfizuu3Bq4Pan1Y48fJOQwKbg53i1d5rtlD8zPvWNiJFLwwSpay91wC+Qb9LqRjAjOYY+U5gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

Avoid getting error messages at startup like the following on i.MX8QXP,
i.MX8QM and i.MX8DXL, printed once for each MAC address cell:

nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4

The same was already done for imx-ocotp and imx-ocotp-ele by commit
48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
SCU based driver was not covered.

This shouldn't cause any functional change as this alignment would
otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/nvmem/imx-ocotp-scu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index 20312fba22d23..80f78bcf3841e 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -218,6 +218,12 @@ static int imx_scu_ocotp_write(void *context, unsigned int offset,
 	return res.a0;
 }
 
+static void imx_scu_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					     struct nvmem_cell_info *cell)
+{
+	cell->raw_len = round_up(cell->bytes, 4);
+}
+
 static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.name = "imx-scu-ocotp",
 	.add_legacy_fixed_of_cells = true,
@@ -227,6 +233,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.owner = THIS_MODULE,
 	.reg_read = imx_scu_ocotp_read,
 	.reg_write = imx_scu_ocotp_write,
+	.fixup_dt_cell_info = imx_scu_ocotp_fixup_dt_cell_info,
 };
 
 static const struct of_device_id imx_scu_ocotp_dt_ids[] = {
-- 
2.53.0

