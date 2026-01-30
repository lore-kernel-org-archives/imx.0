Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261081DE8AD
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769752541; cv=fail; b=i58QkEXbstOBtUVeT8HumNtvu3D+X2POX+zbGOCY0G5G+qfe9SpVbTGv86W0QzKZDPHPkhbQbhOEO2RU5hLDv7+wUrKceSGwBgh3JcSdph6QJnGvS4lv4Y9XsYAtJ+uHb7OS834IQ0aTgthJpIF4AvF40nuvQHEELisLeoUmBeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769752541; c=relaxed/simple;
	bh=6sxB8uy/e3HSnvfmCaF6udFuhUrjaWN7QTF5UeUF624=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DJo35TF+roaUL0pcNPKyHt68u/CiX9lkV08QsXqZEdy394If65GwqFkJGz8jtefQEmU21+ll7RToDwRs+ew1MzuCThJFKefokJ+UeJMW5SnQ9N5wo1bvzirWsJWdqKDW/v81X6tMaMCOx//YkS4ZuP9FFfVmS9AJ2Ppmm1S523Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mv1C5Jzm; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mv1C5Jzm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyTUQSpNuyg6eeB2Z4jI1EBgkulvTRB4ujwN1QQ10hWkpFDuY2qt0W4mK3om5A9s6f2kLyEaSHhzsd83puHtTQES+jdsyRjwq7H6Wsv/FPlCu69rpQTn6SVt7ImDiMtd0lMowchTiJfceGv1cAeh88UeHuy3wO8aEuTw/8Om99rk6B9oCxHhJ/Zp+j8HFe0Bvh8ItP5IpblReVUr2cZTF3kD/t5ftMBytI9upHjtQ3Ws1CDCer4TV9LbMz4Om0yejF2ZZISW6AhPDdoZE29NcJRFX9WyqYQqxda4tGrHbR+rzwHuapneRMeUPnKIlhel7qvlHlukUZ95sbFxoVLqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM8tQ+K4wGRJuxPKhSlT6YdGHmuCUgEA8I0NmacpuvU=;
 b=o3ee/Bn3Aln/lemFlaK+0AKifP9qgkgSvZ2kYeRxfA5Cti23ojlrHm7oyGh3wVb3jwRZV8yi6tadUhjxek8WGWIvkIaTKWyuuzAJiJLHyaIyzZnvQ2VpiRdlPegBz6+Cp2Wi9bjFUK8Hn8SPfeYR3hxIFUfY4LhqwQN2+Qzl3xlMgRJUdkeWu0VgtzH7nd2Dwh5UkT4i1RXd/Envlz2bAURR6a4sS8eWJIYbIHi3rV2YkhahUsCG4Emm+eHqsL2kyXlsz/JqmcL0sBq+qqZpPfKpe93PnGL2BYhDebSe20HHmr9qjKq2MCn3mHvjR/NteGjpx4aow3afWXxcKfsqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM8tQ+K4wGRJuxPKhSlT6YdGHmuCUgEA8I0NmacpuvU=;
 b=Mv1C5JzmN8bbKhYCHvSvA+tlyKQYAxzj4Nxx7hHV23wQeSpxX0DEZ1fnReJh9cFREV84mof4VBkeHoHdX+ToHyxS74RxJGX8Sgp7yfuSO4xiHfxvPJb6j9qY/e8wT4gEAqnBG1O4JxAayE8QYAITGRrku6VAwiJFLWj/pZK0CZ3Xg9XRQdKZBHFSDgIcNbGxJikMG+JjOQBkEO22unXJ79HaJe/Qp9eZVTmeZxyMB02IIbfxIpZm+qBw9Hpry+Xs5mNDo11tjxYNK4kS3zNdStRzWrlltLrh6aPKFqQGEvCjmEHsW/CsQtoXjz/yijWb9AcjjuLvLKCmd+RqrvpZew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 05:55:35 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:55:35 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: victor.liu@nxp.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
Date: Fri, 30 Jan 2026 13:55:08 +0800
Message-Id: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: e6eb5eb0-1e1c-4274-d9ac-08de5fc42f87
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vN/+4aYpii0QTPV7ET7dS5/8Rmcb4FZFNwK9/7fKSJCso9O60sAgeX1Wi+VK?=
 =?us-ascii?Q?mPrAvAsCcP5gaPbseUrbRTzdDlTBxp8k7Ek4CbXuPkFBCB4vr8K8DLLZyHWU?=
 =?us-ascii?Q?o6fbBNv1+fq/4XjDrhUopBKJ8Exdq5bCk1G+Bs4YB2vPm6j/Nv9DQl5jZa7U?=
 =?us-ascii?Q?CjVNf2vq+lGhPlJLi70aXCTv5V89sP8hhUeklSswP9xVKMccA6wFw+Wm3PRm?=
 =?us-ascii?Q?LeUpjtDZY5tTFrgjDy3tEN7VZQfOP4pFGzJl07xXh2z5jYEf23XfdmCmour3?=
 =?us-ascii?Q?LL3sjPsoNh+AeDht/92MIqk+K3WsJx0AiT5PZpJLmLhwDcLt+Qay9DqTudw7?=
 =?us-ascii?Q?AsNHuVfwPjFsD2soVjmRKmEQ7ly50ISeUrB2Ah4wE8t9Mc744HMcw9wiiPuW?=
 =?us-ascii?Q?YolKwVPHea+PkbEmWwQVDuBj0qnMI5R4baF6bHObrZsFHzOf4z9//zBagwfa?=
 =?us-ascii?Q?+2yXkXgIMQWfB/q0Uz5mHnGh7LQaiwuzAtAO/he6+bSw3CzzdELyCj6aU76u?=
 =?us-ascii?Q?CX2omK6By10x/rLXtCegkwG9Gw1uXhbPs/v0MZTQHQhmxRspi6gxD5hFdQ/K?=
 =?us-ascii?Q?7fgWYFXtcX7L8k28sBv2L/05onD6RDmANqIu2+T/br9vSpVKobaR90QziyBD?=
 =?us-ascii?Q?G6KgVqZamYS1gKFRdlocz3paM6st//jQ9/8bIl5Rh0upj0MJFIVVp6Id3ljF?=
 =?us-ascii?Q?S59o/hRp0EtKvGzgM/Igqh8aI+gHSfrKwwIxywgZaKcqkPxXxQTxf3y6KssT?=
 =?us-ascii?Q?iXXkZefbe5e995PNxklvfmO0kGIRsqBuVDIVyOOkNiqgr/N1iSCWmFmEDDlL?=
 =?us-ascii?Q?bhyaZWyEjoK2Q5T0EGsk8j7FF3/K7GQiUqX3n+WM2WrmYXBW5Se4MVbdPsMm?=
 =?us-ascii?Q?n+VVUZBhLits/APhn3259D+O0UxiBvfkagkRndH1N243ThC6TL2nJDmk2+Be?=
 =?us-ascii?Q?+4kRpc/NgQgGvE6ewDO6xIH/nYU+tj9e9EyHwuZsU10Ii/8dnWYmG/CPngFy?=
 =?us-ascii?Q?/vZ2e1cHUjvn9ZqINTzHTjxB3C770FN4FIpGOAwItMHsoLHHyWz+IC5M0CcZ?=
 =?us-ascii?Q?tJXZDSO4+OCRYkv2tbedkVt+ZjQxFf7p4IX7tF5sbLrX2UOuPT8L75Wbz3Za?=
 =?us-ascii?Q?RQI729aOhPOElWxS3EiYPmyP27hAdAvyoLEBSkNdjJpvPRXZtuNhWCKkgrYo?=
 =?us-ascii?Q?ynpCCZZ+YleUY+qntP+T7QX+xXEZwgknljCKvLdOuyej31GZQO128SeRlvlD?=
 =?us-ascii?Q?txaEa0p1AckgUIFlUAMks5mTiHt2OkB2Ndqr6RX5NcSKBmI+qjyKPoSoeoK3?=
 =?us-ascii?Q?BANWBZb0Hngkhkrlc709bCbr/wXuPdadIbXzHLoZKpV3+Do3Go3wFDs5WPa3?=
 =?us-ascii?Q?3STmzHjdW8W/pfH0CnYPhOfKDemwjv3oap+HLI0x+f+/YSPFLkdVTo+2bWgp?=
 =?us-ascii?Q?jKDA4xGledcs7Trcp2+EPveUMglo9a0Z1NGYklLUu592fRx+XprZhZ5qIfwp?=
 =?us-ascii?Q?isUB7uUyK2Pqga8+y/HcmXkPNcR+lceJQF4Vo7qwSM7pfbaU/23slFJSMc6K?=
 =?us-ascii?Q?kjpDT5k9bd1sLDeA5jyn3lh7C5f8YLDlJfwrDzz3sYEK78YmFTN4R0g/8OV9?=
 =?us-ascii?Q?C92grDSHbwQtFTYJYVthIWM28SVIytkFD09ScWzW6pyr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Nn0gIzm1nBn/ts+K071iOmEGZqDh8ok0twF98fFBLZlgMznJNcoGCkfLKGyE?=
 =?us-ascii?Q?cYC+9wHhaiVPYQbFJo5JwHuvPOggk8UIaG0Uv5jKIH0bq1yDKqHJD+/RL0G/?=
 =?us-ascii?Q?Ej9fZC+j4Y6MCwfIOH+KYMm06wg+He68fCQm9DpHZnFrLla9NMDV/9ItFeCo?=
 =?us-ascii?Q?MyaPr7Ui0wm8/KR2W4it8W/JbhlHs4ThMrjh+bdqscLwmAtoEsJYcpQpAMHp?=
 =?us-ascii?Q?oAAJNrp7zFPWo7qBPfRTZdMo0EYy6ncGQwgzKTU8YyCMnzCsLob0o8X9BxH6?=
 =?us-ascii?Q?8lCbqYURoR/oOeWdExkD1aau9g3tWMhXx3TmNuhkd6DHZFzbd7d/s5VV9kPT?=
 =?us-ascii?Q?4ICDtlGAMvkEtYvjto8SlebtjDYHbEYbS9+Hue94tl+qpa1V6IeCzp/Zt+Ij?=
 =?us-ascii?Q?bXutItIIbMJh2j0b48gsN1PPdsYMJYDQddKU5pIjH5GX2Qn5OLFo6fuONHcN?=
 =?us-ascii?Q?K6kQ/DLuLSICzm7y61BB23Ciqsh+dq4PE1hUvdYB89hF2GXSdiF+qdurdEw6?=
 =?us-ascii?Q?ei4A3Wr+VCPHBlKRhphATvO2/M+3t7AsGn7ZlTcmyl0XPEFc/3tMcUGj0xDC?=
 =?us-ascii?Q?Wj400g3+XpuZtwqRAXPpC9Jb9P+QDcDfo6QQfWegWsPpevTFCCzmRuAz2ZoT?=
 =?us-ascii?Q?iSq3bbJdLl4MoLEa+3TZRj5Zvqexyf9QG3SPpcxLNc28BXbSs8GBlfQEGIyY?=
 =?us-ascii?Q?TMzzVgU4ihA8oBfUUdMyYLqCp93oHSOFyIRjSKIr5Oaz8Dafl/43xgRPfDnW?=
 =?us-ascii?Q?e8rFmG5GtTOw3tmpYyzhzBqW5XBZeeLr71F24dRxFIe06VBsulinrlm/mpdi?=
 =?us-ascii?Q?XuLrJsj+PD/USeg18QXJk8RBDptQvOdWdsEWJslQe7A06/0b1bbGGPzzmqnU?=
 =?us-ascii?Q?0Z9RZ430zQ/ppIljJConOMVMeZJeBhWHTD0V9sS3K7EoJBcNFiqq5VrswGkC?=
 =?us-ascii?Q?lOBmt6DvJIkBtXatSsTlyhW8bcsEQEHTW5bo8WNr0pKui+SDXEMEIgJV2ov5?=
 =?us-ascii?Q?0iX6zgT+WAYdJ1dyPpyFC2L1nC8tpFHQZ76oNQlauDg40SysdN64rgcHRljo?=
 =?us-ascii?Q?tAQEfYS+ydneB6qoppnjRUJ8YQFrxTMLr3LYp0Uck4s3yTTvFBFQYQdsHGSY?=
 =?us-ascii?Q?NbRjo+YEWp+xrDCgzltUY55GCWkL11hGhcU5z+5lEhWE1DLr2xxEGai7umOb?=
 =?us-ascii?Q?XOXePlXrlDRsuYJC+OYDa7EqI4V2AzMRrc8ImSS6NSYTSzVoqbMQpO29nopF?=
 =?us-ascii?Q?CoEqcHoFAWKMYqxY9GGs8WaiNFpz4D/qi4G89TkAvPFUxnkCWCsHLOXUxTe8?=
 =?us-ascii?Q?qBa+4okEfR2AClyoLTwPY9C6R780iPeytUbc5hyO9echelXt8Xe8XL7lmR10?=
 =?us-ascii?Q?r7nOQ62E3MOI+56Y0wOriCI0Mok550pfWnImMYwfE0NB2UMQcKQ0lfDGP58n?=
 =?us-ascii?Q?HSOIIQomHPx1/K3G3ktI3+DE8VThkxgMfjKEj/azyQwY5H/pz9qdLir9eTmO?=
 =?us-ascii?Q?HYBTtzi06BNoGoyl1zueKnRK6/yUekIhZQhZ9KfTaKqeZjWu3N8hiRpX6KFu?=
 =?us-ascii?Q?NwmBzIQ+Nt/+VrTwgZqUwApfH9fL4e5N1q30MurKytSA58xnYVrwAtyhPgNP?=
 =?us-ascii?Q?ljI2DmQ0XLojZoxXmMXLslTI5ij5VYr9VQsVXxwOcEklqp4dZzaJ+MiAFQgW?=
 =?us-ascii?Q?jUjaaTC5/qcV1EfSGXb3R1NUrCcw144dRCbRsY2hTfTXsQZ86wzvaov25fEw?=
 =?us-ascii?Q?G0AEausffg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eb5eb0-1e1c-4274-d9ac-08de5fc42f87
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:55:35.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 324XTcIyRdbAqnuD9PU2pjWoTHrageQqshgS726q20dFJ9eAU+bO3qOwzWkAl/6/XBgQpT+TqTsbVCPuGzmp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017

There is an audio channel shift issue with multi channel case, first run
the channel order is correct, but second run the channel order is shifted.
The recovery method is to reset the pai interface.

The reset can be handled by pm runtime, so add the pm runtime function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
index 8d13a35b206a..1afc729da9b9 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <sound/asoundef.h>
@@ -33,6 +34,7 @@
 
 struct imx8mp_hdmi_pai {
 	struct regmap	*regmap;
+	struct device	*dev;
 };
 
 static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
@@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
 	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
 	int val;
 
+	if (pm_runtime_get_sync(hdmi_pai->dev) < 0)
+		return;
+
 	/* PAI set control extended */
 	val =  WTMK_HIGH(3) | WTMK_LOW(3);
 	val |= NUM_CH(channel);
@@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
 
 	/* Stop PAI */
 	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+
+	pm_runtime_put_sync(hdmi_pai->dev);
 }
 
 static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
@@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	struct imx8mp_hdmi_pai *hdmi_pai;
 	struct resource *res;
 	void __iomem *base;
+	int ret;
 
 	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
 	if (!hdmi_pai)
@@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void
 	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
 	plat_data->priv_audio = hdmi_pai;
 
+	hdmi_pai->dev = dev;
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable pm runtime: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

