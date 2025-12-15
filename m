Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF12E92B3
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 20:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829352; cv=fail; b=HbIkPce6KR2x9vgSS0nqh+XyeguELYuSIWUpVjQuTH+GD92US5PfUeLh53Hu9Os4RFLyAU9LBS5J+n5FvK3yobLyyK5Qs6SkEZVJLzSBoSi4z8BepdNyt9E0MpXleO+8kZzONYUOfPOSc9gQvoO355JIrYy3A1uBcRwSxN35UVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829352; c=relaxed/simple;
	bh=k62cSmbj0D1XJjgWLkyWSvfmLE71lu9jyiC1u0msI3A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qnTpLbLZyKHPY76SyMEYc6Do1TMmVe1wpa+uQoXeiQXNYFXrmjaZU0c/XcZOO9Aw+kOFK72KP/aiVHxLbIFePVp5k3nISu4tvb071TN3tph39o4Zp1ardNRQyVeLE7IwhP0nveY1PAkiV1ScebTqIS4avyJOI50+maoBH+7u89o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jNuNMjGF; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jNuNMjGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1Ed9PWVx5QgDLRptm4DrZrYLi2QRx6PXkQsLJg2J2Ypr4A1wx0RhCY7bNOss2J/M6vyyhoIGDdq1LJ2A0VR/iEWNcVPCKZ/4E6JV/OxyATEGHXuWpPUQsnUHVJFt59tmz/XIgHZ3s96VBoxPgXoHbGWHI/BYayjXgNBy8yCYy4Iu90CHUf+nYC+CuUrH6gRuT0GNo81PvmiwiHsmuPRiHIZ5Sw65Yey/V6SapqqkWY76Q/+gePpJzf2DNbE6CVNTkrrYm8rRvsGccZnYIhcTyp3s0D+JeJfbNSVFeEAJGK6+KFu2MzgPyn5XByF1VKuNvMODYoVlQLVT23vVecHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91UDpuJJb7TUqvHulAXDAxGkl4UHSKc3a96fBx/cMOM=;
 b=hYkxBYl6KGX8paEiNamQULTS5dEmieHCuw0y8xwNaDkV9zH5K9yVbl0uwFbHpD9L28UgVNIiewfmlZ49/1DZPkmwHUDbsbWWNZ9D15ZFcTYjWf7TD8Tykg7sBLpSvv76PdYClpfzbYeat8kI+lS6PA4oUtbvRRxSOFkJi9xrQvo/8ppU56KeXLpBTlcDpCWRCocjb776e8EQ/MJwDRpP1JYLlyds5ps6hx4bg6R9elazAHbOh84EahpMZxqGeP8GnmLrn7BBr05uGCpZyz5fwW0ZYShrj+wN8Mx+pZqexSeYWMpM1hbKaVv/f9JCm2ZeGhtfqjtIMkg+jsscxHv6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91UDpuJJb7TUqvHulAXDAxGkl4UHSKc3a96fBx/cMOM=;
 b=jNuNMjGFxul5WDPtsAEZ3FXBKCPreniyc2raOusQDy+q8Ncl/0W0S/ZRpyCXnNkQWgiI2c1ylUBmRwRXM5Z833Sr6oYT6G3aWR0WCdXft6jsUFfVz9QKwJ+7PbzmsY6klABNGxEQ9PR/mTApJVp2KLA46iWNCdqpnQLkTjnq0/v6UDJx/EJQLwCeL788lrIcHtE1mY0qVTf4ktBDoDc15u84jzEsLYkSuIBiD5pFxx/1VKPfB+PV3LWX09dCjTRY9hfWBEJGrZD+kR/8fSTZE2tmuSbRop3upeMVGCSKQ9UFHKyM8/02tPAg5tZkgc5R0VR2A1DbzvnZXnf0x/eCMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 20:09:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 20:09:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
Date: Mon, 15 Dec 2025 15:08:51 -0500
Message-Id: <20251215200852.3079073-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:510:174::27) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB8PR04MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: d0587f8f-fa41-4b40-7da7-08de3c15ccea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZT36ru6mUOB+MG/eIiDoe5rpYAE0qFHefqkRxv267bA5IhrWeXXqomM1qoWG?=
 =?us-ascii?Q?a9rEfVOdUvZ7YvW5YkWoKAi3dj6vuwGfdJLnCjnoJy4SNbkYBiP9xmLHjibU?=
 =?us-ascii?Q?a9kdRKF74N894JeDg6SG0JjXRuL+o7KWOsTtEGYu/kIAL4A3FwBxppmzXlXf?=
 =?us-ascii?Q?4fDAdjQaX0jhzvWDkik+sAJylc45oiHPGbLiKwEQnYbh6oCqOtqKZid5iqA2?=
 =?us-ascii?Q?XxTrwfMNK+we4o40kK+aUmkrixW4e0ftt8wz1UTHfPyJjVniD70mOUU4fzca?=
 =?us-ascii?Q?yC550S7x98qZ6oM3QbXU6GqfKSVn26BWx4PwfRErgRAJ6wjnRdDmXr5Liu5J?=
 =?us-ascii?Q?2c8T+J3neodCl24LDiGq8G3dOYW1iG0pELp6GI6t00to0dEeNknQv2Rgjbmn?=
 =?us-ascii?Q?BCE2uzZ47zhldImtkFLKjMnHT7Qv886o666lpTWmpIQA09+ctgYE5ubE9RzM?=
 =?us-ascii?Q?9hSNyc1rSJmbFVxLkWmpQGieIdUPdA7ZwPimIIBHmWSxyeHCQ3OG1ZPq4MGK?=
 =?us-ascii?Q?e5QWVjooOtj9vFxRDk2qbxJuEuWTXVQsczMyAibWWNGJOd3OnYD2/MYqn7OP?=
 =?us-ascii?Q?OaNGEZykd1u6A1FemGmL59PRXTa3Cwp9zKzAsYvxX9pIY0YuQGptLPgjlCuk?=
 =?us-ascii?Q?J9v8Kw00nZ6FzciMOSzdraiCgLsfihPT4aXzImrn7346LwXm0YwF3u9ZfzES?=
 =?us-ascii?Q?sKaR9YLdpawOkleVgcHAx9U8SC8wEw6j//ZxyAjPH3s/dyyEywqtpWu0rPpG?=
 =?us-ascii?Q?+HzwN3nGPAIzF2T1tMX3FZuiw0K9hnkw/kDv9FAGv3ev4jgr+ObwmBsPeIAu?=
 =?us-ascii?Q?jin/WrTt9qYpPPcAG1KUFqkp4W3Lmlk+QiTJyCWdEVBVV/XhIalPdSOk+JQR?=
 =?us-ascii?Q?r3ViSTiYAykymk1u0W30abmzJGJiFZjE02aW5Y542hI/BO8SwyAm9OJNHTUb?=
 =?us-ascii?Q?32RIzHBvG1+8PHr9/vABcVzg/gyXPW3H++1hwDxFbwH/cMxnwP32PDwvClc8?=
 =?us-ascii?Q?1kWP7aytLZq/5mjVTumxks/sH+zzqonecx2PnUedpLsETjqpD5XeeynauS9W?=
 =?us-ascii?Q?h3uIIQzcFf88LBcTsYmnb8BdPZFIVai2AumH0mFGxti8OHYHvw1Fcx9YHpJP?=
 =?us-ascii?Q?nL1psNh/+XAmsMa4obZvdFQF2iFJP5x6L9VGgc9q6/vT6da4ugC8g56RnIp3?=
 =?us-ascii?Q?Wk0hrTNT3tXtX9gzAghXAynicAKzu6BVzDLoQvY3geYC/aakqXple1m8fEZY?=
 =?us-ascii?Q?tgri7dTLehrmPTk1oeTfl4OnLmFzIEbrBgTTHYMbgfs/f7kcvwO/xCLBjrg2?=
 =?us-ascii?Q?Rg6uiFsbKymuGjj28AqiCY1CLsM7JOmpei6pY2yDqf9L+2GY8cYdbBD+L5bj?=
 =?us-ascii?Q?Yx5uslGGwT/Qqv04PfJCNgISx9PD5vrylH/yJLHAbsToDaFkvfuOP3HFvtub?=
 =?us-ascii?Q?V+fC0fHTyZnKuWNAmxaX5lxlF87+11PQRXGY72jHFoOI/3ul115sDzNNu6Rv?=
 =?us-ascii?Q?FLAc/qSz1COx3BAM17tcjhbacfWlc7iuP/Kn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NUHFNulMvih9fZ4iix2psF5OhJtXQ3UFcWfMSCGep0u8yRfKW3UzvFGedTnS?=
 =?us-ascii?Q?4c1KEzwnetm4uE3aed+vBoQzjtfOtKyqeRfHnjw+4kXMcU757ugMpcUW1frg?=
 =?us-ascii?Q?HN1ZHMzuyVKcZSGcYGwKW7dNpFW2UaHOQPLZo53/nXGyFi4liv8kk3J2+9M2?=
 =?us-ascii?Q?3/BXq+HqmBIIw8draJfodvangx0rpaDsGv4B0XSZ5o7rFPzOPxvjpdlGRRjX?=
 =?us-ascii?Q?EoSHB5puGFqI7X/mm3HUlp+l1EM45au1suszQ9ILeo6DPsYrMynq4Tpiuez5?=
 =?us-ascii?Q?ce+drChJJ+hvVWLrfJ9IMKp/UgS8W19DyXFZiycQw0HguffyR4x+6AmTWjuV?=
 =?us-ascii?Q?AwmDIfJIyID/+OYRYs07tDEllbTXvZfEvPEUN4VxvcGASADroKtksq5bdZZp?=
 =?us-ascii?Q?4B0HJdxJj3euOqLi0gcWFMsXnBeJ2QwPqolZdHrH01EZOyK4ef1xAOKAwXRG?=
 =?us-ascii?Q?W+a2KDR7frPuievimbjBb2rc/yXeGzOdPTwvp2heFDVjNYZnfWh5q9ZWU3oO?=
 =?us-ascii?Q?8yaigzmKvaZqD3BpIn0DOw2CFRtk5rzCSyEIRAFHz/Q1NibZ8QXcrZhnt4TG?=
 =?us-ascii?Q?QS0Q8hIhNqHyTx67mG9gFACjMcUSBLwX43TpmhYSDn77MudiWIV/dqpvCrUb?=
 =?us-ascii?Q?m5YervjpwdckqKiLD5CFLfCwvdEPO2oSvnB9kHdfpl5SMj3xu9+Kx8MOxsFe?=
 =?us-ascii?Q?41dZ1eOpOR576iuTLY9/9FY1fPKwEReIYOdO12xOm5ATYjdWoC29AwuOud7u?=
 =?us-ascii?Q?hi+74rd4d8gU/S+XX1+gOciR/Hr/jfvFVHLc/Rw+R38odMcJJwd8M1Qlbc/r?=
 =?us-ascii?Q?JnyEIehTPLcpvgsrdCoYGPesfScSQlMko5y0A2PSceS3Qjyh+qbm32tTVLqQ?=
 =?us-ascii?Q?mXDXlZ4pW8gFXG45LV+uMe4cS0ijRCk01XTPbnf8SpSluklvH7jPsayT3xxc?=
 =?us-ascii?Q?5wrxkg2Pt5eVN0UBKULRjxEKB3tDVbhkEw3QoXiStL4rMgwlo0cWV2PKY02n?=
 =?us-ascii?Q?Ul44ZD+gdmY27pBGnfKLOulyhMMm5r4PMazD1QASpodvnVSNN42969cHcobk?=
 =?us-ascii?Q?d3nYq/FjJnFomiUpdP8YrwExVs7N2H7ffiZxdG/wpcLZ4uDOs3SMYVbptHZQ?=
 =?us-ascii?Q?+RsvE+UfhbQ1OCj+dkE/3vpHuBwtZb5naOWcgMB1Y/9M8JBP1kPpPJPXIrVp?=
 =?us-ascii?Q?FORVPTIEIUPDpMcQ6qzgnRcU9wEsaFbnxUQ/1TQkmGRMdRbiESz2WeSkYIoK?=
 =?us-ascii?Q?4HhZKo9ZuCYD+WLzHOOvb5P47nPPXP92B06m99FZnon7iMQmY9zltzsNwf0j?=
 =?us-ascii?Q?Y6QPf9Xlhopc0J7cNNT/ZMWEHNCAg+Y2BVB58pRe+yaQ19/FMOzO1NJ61Qpn?=
 =?us-ascii?Q?S4qxcBKvuh0Ii9xxbcO7qzMEdzmgMyUJfHwUSBgeLNjbYbjpC+P+uBxVi4Wp?=
 =?us-ascii?Q?nlGkPw05oEpDERb6FC0H9PLt2cs6f5OpMSBNk7fllq4FduTv/KX2venrU0Oo?=
 =?us-ascii?Q?o0eGLeOydug42yDBAju6Yk7/jjMg55jjB8GlPagyJHhAesQYA4DJWDIbJm19?=
 =?us-ascii?Q?NnD9ZYG4pZABEGCPpnnAq5jue6um/MVxRnCq+eCx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0587f8f-fa41-4b40-7da7-08de3c15ccea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 20:09:06.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q78f/wOSLLSSgh2iR+qij/jKdB9YkS9OZluOh/l6Wk+rLcW5QClo/vpH8BoaOQX0s8VKxkd593e0CzQu7NYzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857

Initialize the 'dev' pointer to NULL in svc_i3c_master_ibi_isr() and add
a NULL check in the error path.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202512131016.YCKIsDXM-lkp@intel.com/
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a62f22ff8b576..857504d36e186 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -533,8 +533,8 @@ static int svc_i3c_master_handle_ibi_won(struct svc_i3c_master *master, u32 msta
 static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 {
 	struct svc_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *dev = NULL;
 	unsigned int ibitype, ibiaddr;
-	struct i3c_dev_desc *dev;
 	u32 status, val;
 	int ret;
 
@@ -627,7 +627,7 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	 * for the slave to interrupt again.
 	 */
 	if (svc_i3c_master_error(master)) {
-		if (master->ibi.tbq_slot) {
+		if (master->ibi.tbq_slot && dev) {
 			data = i3c_dev_get_master_data(dev);
 			i3c_generic_ibi_recycle_slot(data->ibi_pool,
 						     master->ibi.tbq_slot);
-- 
2.34.1

