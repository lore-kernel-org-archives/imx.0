Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182C282F06
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488818; cv=fail; b=UOKfAhAvPX/25Pe0sCN+FqhPxw1NYKa15Dd+pdvDhasPXpVUiFkhED1nTPjz79v63Dc5591a6I/ZC5vqHvXUVO/BLCLiN38vOUA3UG1taT8BkYQVi2h7LyCwjnw0bmQqJz8sV/SU6OldtmPfB8sHrxICEndrDBq6AEcR+2e6XJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488818; c=relaxed/simple;
	bh=D+2U2vMjxLm/lAjNeD1N2z3vy76JVmrhqYlYMF2L9EA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YF4h62VRVwj5XOTQNqfmpWFdfzI6ilEwRigq18JNoprqjJ0jbmGAlt9va/yO8iXs1sqhjMpdeO5yXD7Xam72nGCoZuuyT8U7AOO0l9gFPEdLV+IhalqH5+3UbNXKqdtEhCuHubZN4cr5H+DGsuQHPEwidUpKaTZnxt2SuYo+d4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bH6z2/5s; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bH6z2/5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvyBkJEZOdhHuhyU11ecuV1CB7jcDOfdQHws3XO0SFMYquor9rgXsxFEPeL9Rkj7GD+zCgpYqHf2Y2ChaI9pZ2NeYLPuLS/PaJX0HaXe8eBUGyEcIKqtCJJYj6b5qZPaKTL+cQb5PcwApfEShMgnHxuquL5gazKr8WmfElXuzhrKx4tFvtQLl7QGawM0pEb/ncobAJ7cfNEa6X4BNyZRK9AjFKHToJMTgTfLr8xiBjI9s2H1HtDeqP5yzFUzIKxa6YJnMYuXOm7tuAaf6uhV42xhLnFx9tqhOm4zI3o6S5SwKqhbF2NVwwAYDBkrmd8E3v+9H4idzaPx7NYQHsu8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvIk2n7WY/lbvlcO7CQv5w5Wtb/aXOisZjY2S5zQySc=;
 b=MyXcNhEawkDeJnBz6M/TnzAtgLVyZuEfBt6HjO3I+CFJTmRE4vkkuDsYs/4qqI1jV/wqCdfY1M2VcMjhs3amItvgacMBYXkPCj5I/+2aJcyN11wTXWqSJJSeRP5CgpeBZ8Lq2LYRnIpww/6TTxcEJ+3/2N3nQ7yXhudB5aS2pRtCusU4BLRiNxS8TIq/W65rECwqt+3D1XkrrXQNgLwZQ1Lmf2It9tJJnjWvyrdZWI9W7x4g5hZR17yePaXxHSwIezzzsYnov6FzRStiS5/6dqOuqjG0x2V7ArnotTriDXi+7FefLGreqvjipYTRsThWKieAOWeyH735URtfM2gk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvIk2n7WY/lbvlcO7CQv5w5Wtb/aXOisZjY2S5zQySc=;
 b=bH6z2/5s4bIujWmUspLG2a/xnS+P+hpuvDYbKW8maZkYpja+O1zjgD0KLNT0wfuo+UXkjrQKgUgcR1Nzjd0N/6KOiniwvE2jmgcPYiNXgqiig8pUK6w5KicRriMHEDehGhXh9NOE2GMK98ho8+CcLrn+ZXGN51M3g2JoJzzZ2HXA6yf4tzrKn6JBpsYOqHV+J+4b0XzQzguYen7QKG4wajV7aJI+pS1w49dlpH39i0ltwF3/6FcNNwQ4RUokCJoVKGwmDVygm5DtU/pzvACBuGB8cjoWLkVYWAe1cYaEKez5Sycbqry3xbyBocHdZxUpvVWGD2OYCNHhkkLbch+wTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:00:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:00:13 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/1] dt-bindings: auxdisplay: ht16k33: Use unevaluatedProperties to fix common property warning
Date: Mon,  2 Mar 2026 16:59:55 -0500
Message-ID: <20260302215956.2418494-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f44119-4e88-4257-5b63-08de78a71469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	YSYYh7sxm0QAZBSdDgYg/++YUDoO/W9hebVGj0k/kzkTBY4kciCu0ZoavD3KfPDZCtOy0dueQ8y23bSH3yJUBSjd3QtAMuWnt9jf7ntG3TFp7yOS82UyAfJhQrZuYFjPqVy1XWoyMl2Zengs7CzvlFla75kSonora2CIjBqDjRqaZ0psJubFlMota9WxXu7TACmcZQyvi3OcELhheygEvS410d1Iynv3wDLqNm+rOPAKiziCxYXFtmVKgXolZBBiJU4OHWLZAy2dHKkebkicZ/Q5NEhDfSdT2TABjqYqCPPJEERunP/pI402RI+gK3wx9hhNi03crVinfHm3BfQKhxRht4Kf+G+hS/mJyBWSVXcFaZh7t5rViHD7z58OI9bNPqeqE+/kvnMDu1sY2XBJTbmIprMqRiDMtZr0ZnLQEqKZ8l3j6ykl/440j8dXfi0TQkQ5KlUjSaltDaE9riwCAf7JEPIa/twbDm6N5sWoe+U7M1W2l78moMPrw+hl+bAJ5iHS2xHz8kB5LdqaYvRzVoPxNulG1+APZyzG39VeUP0kmAjDdXHY157r/uL6ROorh2KK2RdZY8b6ligDtX96lty9GtQYupEHOKINKS0c4o9L8ccN2aO6W1GNAyo76Esk6TLJ6+C0Nvhh5W7bXDJyXa7AS9357bEy4zm39jSy+1ZCfuWBWP4RSgftzciMzkO2xWA6aN2GdOVukDMkRlXbIvzzeUd6LnMxb6djUI55Af0rMBPlSuUor7wJhDpYi6n/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g2o49DE1Tr9nt7PO2K+MfPhc5i+wJn8ggEIrfrduFxgRG+8w6h0/AC3LthkJ?=
 =?us-ascii?Q?GfxLz643sDe8RZHRFMX5IEuh26NyQOEquDI5Lo2gSSv+xepX4Xd6e3xfxGfA?=
 =?us-ascii?Q?I/9Vr+XTA+hK1BKAilD+wTUgbs5o4jCzdjVRFU+WZF0oty3R/WqtagG37M+F?=
 =?us-ascii?Q?pSpAvjrDgjBx5hcMIubAufKmF4S8JfIU+YIiDUuqkE3f5JjcPNaFZqHVPrlq?=
 =?us-ascii?Q?o8sRobp7KObWJ4maN0N/iLb8WwVS/AMWbDmM6hBa96g679os+q6UhXJi9mtc?=
 =?us-ascii?Q?rdF20r4uXcE6u0/wAAUO00J6ylXNmqYaS5JFg+0F+7cW7reibhA1m6LqFwGq?=
 =?us-ascii?Q?dlx1eRPlNU4uJjGFw/YN145DIw0zSAMkVCKAOnu1UeGPSyR07YZ4WHAMjyvM?=
 =?us-ascii?Q?BlsPjSa0vAr+yCPTtBjh4Rc2iTWvwyVnlHb5uLfZfMblaxel3thKl46LfTrS?=
 =?us-ascii?Q?Uxjx0AMWmpUfmx5P6hzEJcvDqd4iDzhUZkhHSvG7Q63LdeW8jc6Yb6JDKUqt?=
 =?us-ascii?Q?0QHIprnRWO6Rwv7ApEOBzxu0mQ1xOt3FeI8pCjRbLfL943/+2eHPz61v2oC7?=
 =?us-ascii?Q?Hiwco/gpn2w8s1unCA0WmIoo+H3Z+kllI3UJbuvBzgkYQ3hG6EG6QXcFs1Oa?=
 =?us-ascii?Q?+sI+QcJJNBzYGqXULoN097ckD9aRSI6ez5qmk4wJ6B7fhAreSwlho1nvDYps?=
 =?us-ascii?Q?avuf5IeOlma1oaFCKHDdBBq0xDPoc5HRfwFkJpi8TqFL8XRgVaqGSX3mf8OB?=
 =?us-ascii?Q?6vt1YWm1dccemkxzxtWywqLpbqWe0Ml7qqQxee53dyITJZ6JVH7MnP0aFPYo?=
 =?us-ascii?Q?jw/9pRpR6seJamEmbab1JUcvUuK4OppW6/pN1YwSX6ZTIjlbt6XRjcgtUOHh?=
 =?us-ascii?Q?z//ecKJn9AtwVXI/wQVXCp/1a1ipafrb9yYBAQ0loHCtSIqQoMmlyRhgU74t?=
 =?us-ascii?Q?dzZzJKQBL2vNTpvNAel2UUveKPJB0YeL9zwdxwsHb5LfwmAiq1kLXT4ZQjHX?=
 =?us-ascii?Q?n3I4AUte1eM1IIKqX8dEH97x3zP68yO/wGppS12mGbO4GTDz3futtfeoBjJE?=
 =?us-ascii?Q?hmieaAIvbmKsj9KTT8i6VkaVxWby7ZfKBInRu8uxVbByzTqz7AfblsvoiwZf?=
 =?us-ascii?Q?bNSSAiqUqcddIH1jG5vWh+njtg4l31kDN+A5M9pkDhTyErsfvG8wa9FUQQvZ?=
 =?us-ascii?Q?TKcWCKb7z4VGnTJiSA3917SR8ISeNQmMv7XyyWqy0B2uQ6nlJ7MhFdm2qYV0?=
 =?us-ascii?Q?Xb/bOBSffxiF5cHJ0YJ7zbl4Fd70ualaDS4O88iz1vwNTbLHkBQOjRScnkM8?=
 =?us-ascii?Q?OdiXK1iF9CNI7ujaHEVJpjYdxhfd0MfOHxBgKATvxswEs/UHIZq5z36yYr8J?=
 =?us-ascii?Q?Eb4Sw5h5EkMZ8piQL1LT5TeRvfPmTzlbDeMvln4L2I070TT+1aOXXQnSq1OQ?=
 =?us-ascii?Q?WtiVffqhzR9qHoSHMntKsNCWOwrm1SzoQYMqpGVm1kmp7AsPGM70fkY3EWMD?=
 =?us-ascii?Q?lfZ9EjYwT3Rvm00xNnXl3GZNWMBySe+fqXi92HDXVZZANX11HDmsnYAB/MTB?=
 =?us-ascii?Q?UBfSFFbzbVW+93WGprAn5TVBwhNZaZ5V3adm1SvVfCARn3ZtIkJBPvLPMwRW?=
 =?us-ascii?Q?xYOS2YkzMrQ63GmP2924pC87kbpinrEzNic+XL+HrsGYcjRh2OwzakWR8pe7?=
 =?us-ascii?Q?nNrAkZLQa0y8LPGcld/7BWYkkacfc36bvM6MrL7lUmGgkQo5zaR54AX8OUos?=
 =?us-ascii?Q?/EkRxpN1Mw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f44119-4e88-4257-5b63-08de78a71469
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:00:13.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7sx7VGSXZDGXyGiB4WvT8A4o+ZhLPUms/TAdU2TyYqlB4/K1TzdEDXL/Hmn6QwhwOCsep3qYDqV4gf0zY6zQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581

Change additionalProperties to unevaluatedProperties because it refs to
/schemas/input/matrix-keymap.yaml.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#

Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to json-schema")
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3
- Add Acked-by: Rob Herring (Arm) <robh@kernel.org> in commit message.
- add ht16k33 at subject

Change in v2
	- Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
	- Add fixes tags
---
 .../devicetree/bindings/auxdisplay/holtek,ht16k33.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index b90eec2077b4b..fe1272e86467e 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -66,7 +66,7 @@ then:
   required:
     - refresh-rate-hz
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0

