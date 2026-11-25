Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795592191;
	b=dZm/5etmOKnMixKTuaF2JIF9OlDJMuOkGzUlSdGNvGHzbHpzLC95U2sh4pYvSvGzQCGP
	 lgQYDsZXnNV2C/uw/9hz1Kg6lg/ubHNm4YQFc7iY8EeNCX1ebk7I08kmfvtIJ3WwbstqC
	 Cxki3jM3C5qg2vpqlr9qqkG4L3rmZ8fiMpsIAHaoktJwdyky2wsLz9vTSoun6nowy+AmZ
	 N67vLKXZyv3ecQCTya/PejrT6FOUC7VVx0obRWzEp/1GTC3gSEkn8/tFVUZpaFIEk4MEZ
	 gJDw1BTBU5Q3h/ACvKsOFhel3Fp7qs47m/RDqy6+UyfFi2IMuM4r/I0ZklOsRTiZetg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=I13tgjzOuBe1PKGk1IvE10wC+XTr+vhb3P6j8rtKV5A=;
	b=tCB5z32b+s0GE9MmU8IDXrhTPVE3yelK4wc85FNZcRdjLG5pwVnIN7zLftUAdhNCo9gU
	 HVX9No9+yJxvXRhzijHnCR3J6T2n8zzIhfugj5odyndjY3t847FsB+qXJIQicHy8vqaHO
	 d63UlfuqzKSUHGNvs0ZvFMipV8Xt7h1Qx/XJSc91C371N9GBCi041j4sTauoJi9iI4yCz
	 PsnXLQqNFSagTXvHhtRKB1olVXzlPEAk2DSn0ivpktEVfQn49idYSEAlGOY+mLZPk6WM4
	 tiUK8BGkeGzYJrMAo6WevCkrMMHYzUWrJTGlBrUJchCeNtQlCzIxpWFufM8+idqVrHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b2Zyw5j7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.40
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42324606A33D
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42324606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=b2Zyw5j7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNt+V73swQ1LtiTcGVF7wwiDlaa3hZM+4h3GF1gBSi8WenUPG8d+T0qjmu5MSTCHtgY+AIPHdA8KdwHD7XT38FCU0MSn9T3jGvZCmGzDFVTl5Z0slHrZjgpFMh/bljA0P0CWoC1G+fe9LJ9FHolJh4SWxwHCQNjcCtXPBGAhaJ8MYsgsDImKsw6kcKqzrN4T5t+HionNEQPc4e9m7AtOOjQEI+D2DleQ3P4zbceYHQtOh46SPLQxaE/KvRqudK9yeVryOoGOsoe4MN3me6ybXKV43uHbnEpPLtXR4+U1DSbgENlZ5NJtJvNLBZS0l+q9PjS5krqI6Uw+xkdbkFq2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I13tgjzOuBe1PKGk1IvE10wC+XTr+vhb3P6j8rtKV5A=;
 b=SMsZb9TO+sV2KtiOTObIpVcMZA1WiGlwPU1SoaZ49cQC4KwNEi5jxEiBCx4yc0o3DdhPnx0DyIZbqU7bv30qjIkhhYfgaXvdBwQ96SNyizlx2Oq7iMZI4oxMLC9YXTFVRwDvkHJuKXvBYmi0ml0kgljDKXvtZM8i4EI0W0jBAjnQrRlI2+uynKyA1AJPgF9xdWSEyI/5cN0NAd15btEE07Z3KKKlLH9QFjaNjipub+CMb8yr/jtzB0gVNt8DWm1mZMHNKppqTqTYHLl/Sf/OcuOf5KhgcKkX3LqcsA4gfuiWC3FtBeUIqLkmM5IdHTgf00WX25HAfPHeC5kx/K6xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I13tgjzOuBe1PKGk1IvE10wC+XTr+vhb3P6j8rtKV5A=;
 b=b2Zyw5j7dJEC6aWbJn9znTcfeUGapMDQElGT7PoFF7rDRdXrHaFBccXmU5hzguMqCjU/KuNwCyayAa2J19slV2hG7LgQUoBfFjRNFr97wdlq1SKFjuO8DGEeHwS24k/7bETKQSZR4ev/ckWeG54M3CUYAJ7IpbBRL0CwMJQasvG5DjIaxYm3MJUxxJ3Ef9Ox3GOzTgCZO9AOaph0NiI5ka1dlq5bcGIp0Tp/bs5fCivBCSGNTJcJXYx/FFRsHccCD15vZzbILb73trDkA+BBHhqSGmrHkUONCklw606RsKAJI9tK3Ofco2+GO7YngXCgJLGFKUvRMzImWo4ySiNoGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by VI0PR04MB797245.eurprd04.prod.outlook.com (2603:10a6:800:363::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 07:36:26 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 07:36:25 +0000
From: shengjiu.wang@oss.nxp.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
Date: Wed, 25 Nov 2026 15:38:57 +0800
Message-Id: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|VI0PR04MB797245:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f23f95-acdc-4738-0680-08df4ac6cf6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|20046099003|6133799003|921020|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NRUZagVz5QEt5k6MD91BQjcOVlkF9RgUv0jt9FgVLwWI2VISHARkK+l3oFaNMTUlZoEins1CLdnG5G22OQpVVgi23aWXfYC0O5nR2J9FkdQKK3o15EiaqbS3xY5OP1o+li15LIsoUWgVrgmhlKkZE5J2jr4oEz+LKPWGxZWkb2h82/fYrUdb0lfyGH1/X6/BAc70xd+dbY48d1tgKItaXhEvaA2+KLXl22f27EAfnvcUdxzWm5qCxRQiFKTTmR0TC7HljqKRGvJUTV8R3Q53nywsSoAF6aH7OGWW6By+TkYkTW8Ook9R+BzgtN5aexkH/G/3j6U6ZdlM+8yJXx6VHyXbjrrVq40Um2G9HtixveoGRnjH4op+4iMYHqoZdTJDuEx5b02Bq7SuoOzhZIir16yq4TDaWMEKrF/xKRVRaWgb2fPb/PjAVpPFCZV4yWspOtJav32UzRYlCVTHoqOUOfdi7fgvn4G3rIPi7oMxV/U2i6rr6Fzu+xqI/cgshqVuWuciOEae8iXRyogERzNKB7r33412HqZo/uwBqD7hA9JZ5ct6pcPYnq8w4yhtshnssIBtBBIu81HLx2RKyTXaLKP3A3+U6svFyz36uzO6zPyiQE77363ZtAFPbIPXYN3PXiq/1fs+vvICg/w08faiVbFGiF5WNdhbK3+OJRjPMoE3NC9sVNJbKD8VppRqD75LlpHcpt5hnbxUaUVhNeSv5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(20046099003)(6133799003)(921020)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BNC7wFHy6NUMnOggVk9uPkZR/0L8ftEB3OFu0U1c6V5jniAqu8o2HVRgFINW?=
 =?us-ascii?Q?hrAY7lzp0NDgaTMHhmN4FAaMgBVnrdgLgQkRAHVjtSIQXLZJsl88vsHrO6CE?=
 =?us-ascii?Q?bn1NkCGW1V96sagVqbZxy9DUSDP4qdoAAYyN8sf08KFV6Vip/ZNCvnqdVK/h?=
 =?us-ascii?Q?ewoEarnrXIjtCUS07kKqXy8gLYOLxKNOOzugwMJnFb0N7rS9iwN8QhFpN2w4?=
 =?us-ascii?Q?R79jB0gdRLg/XPOD16mscRL1jnVAUH7wjjzjcQRguuo3yRzaXetMwKreKuzO?=
 =?us-ascii?Q?q4Wvhl0/Qf/jEJwe2GQHewza9vz/iuE+L3sZS6JvCQEm3fKY2vdoRNq4ANps?=
 =?us-ascii?Q?mcA0mgzXusTWt3gXkWYjANN2Q44zfMhivMHON0NNisDcNn2Zb004y5ONumX1?=
 =?us-ascii?Q?SSc1/gWBG6QmF1fAAbk9a/CBAq5bcnVk4ovOss/UflFT43pORwR3FRW+d2H0?=
 =?us-ascii?Q?A2mg9ONTelJxOfqxElCGgciZRGt/2y9C/GGYKvDUj0yfg0tAyFJsdjtmKML5?=
 =?us-ascii?Q?4XrVR4HhxU5vxxOWRXULotIGohg8Z2bgRtMAG7+MrioLhD96UHnxoaVUqP6N?=
 =?us-ascii?Q?b3QV9/dtYxFNrjWPeoNmyZsFR2gaXpUug7gV4UMnSBNBgUM3J9nGibdP57DU?=
 =?us-ascii?Q?OfnMxiJzkKE9K3Apk2ts+IeYJFuLO3pKBHNq1Ddo8Xi/aNrr9y621mkf6Gb6?=
 =?us-ascii?Q?GinQNBfZNxqE6cJCIdA7K+hpQZE9lhKUbSZPWLR9FmkffRuraaU6L8Bwzauj?=
 =?us-ascii?Q?TqpXX4b8E9vSJFbvDE8YzDPdAnCxhuoUOejYGkVs+yyd+ZiA5dcZo1FD1QI+?=
 =?us-ascii?Q?kEjXV7zTkK6pC9MQlzgJLSwWpouSNeTtq2MeOQ0OUOgUXqvOAix4/zNZe/Kq?=
 =?us-ascii?Q?6OsoSn9rnzp8IByUpRCZlmLc6I2EtjP69E/IaHR92ezl/AIUieq1Obu/s5Ue?=
 =?us-ascii?Q?X+JY1NEKjGFyuH7+TiAfBeXuRXXz+6UxygA45Xw+YhBneu06zQsvPfI5WI9W?=
 =?us-ascii?Q?8kn3WE2u3mw1yfvel0N4JXy/zr8nOtR2QPw21rgBlo6VtGIsGa4gi8o4dqXf?=
 =?us-ascii?Q?jxdOMxPmoEOA7b5QMWUd+4DHDQIyfl0wpVWzMnHZq72UN16vxHIPa2w8SWjV?=
 =?us-ascii?Q?fcvWIIy+q2lgkpIDb0L0JxX5dFh9XLryJh4+5jotCjGKJQ8ePF0FZjnJKjGv?=
 =?us-ascii?Q?gLAlybl3Mdfak0RBot9SOG3aDHTfB9PL2amPK16i+xTKefoP33UAsyMXbylW?=
 =?us-ascii?Q?5yEf92LzgxBphwx9KGEAMKa1Q+0GzOWSzi8hgrsA3KVYrIo8z/m1JdDYh9ij?=
 =?us-ascii?Q?WSPDb9XI/sF8qLb1ChjVp7mfE8HP7Hg+IargX0LD58okPIlF2F0Dvh8diCv7?=
 =?us-ascii?Q?WIz9WSFVw1hruScxiBt5cr1R/lRp4PTP4XoerzlXZAX2AI8gzGkuh1uQPZM6?=
 =?us-ascii?Q?KLRJmOgUJgLRUkOekRlEFR0AgBUfsEYwN/gcKZejMrOtY0o2YC7GKeppKrri?=
 =?us-ascii?Q?NwY2xbKcLtibsmSUk77KM03znDBpYFwbn7TC0cAErFMDknA1V73fxmIA5MXL?=
 =?us-ascii?Q?fuOyRmV/Id0VDmFyRRmBHE+dRg0AbhwpPjE+iOlb1M2a2zNAQDjVc7vOudHL?=
 =?us-ascii?Q?SWSi2Np20/YIjo2MxKWK5+tqS7KLq4aR5PZrURijrubzGRlfRWkc4mWAOUE0?=
 =?us-ascii?Q?Ls4rVZQTBqtKSCGudEOxFJiKZuYyW5jjZN+FnMGkFWYiIksN3vRKZykYbMM1?=
 =?us-ascii?Q?1aTEdH1EaVzU2k63BftLxZ7M8aoetGpHiSnoeDWmR7wvHh4kRkYlc965zr7L?=
X-MS-Exchange-AntiSpam-MessageData-1: 16lJwsIU+B5Gjg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f23f95-acdc-4738-0680-08df4ac6cf6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:36:25.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O/24CqlPHVwHmX/JIM6OdHVRvbyNNBZFnLbOdF66FyxZ1VA0E5ZLi2iirYiY2lnoXI5Wy0NBI8r/xONT51EbabwqhuxTFR5H/kxjAtB+UbKga9rF/Y85TJJhfdcrvmJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB797245

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Replace syscon regmap-based DSP reset control with the kernel reset
controller framework for i.MX8ULP. The syscon approach requires direct
register access and creates tight coupling to the system controller,
while the reset framework provides a cleaner abstraction and proper
reset sequencing.

Three named reset controls are now consumed: runstall to stall/unstall
the DSP core, softreset for DSP core reset, and dbgreset for the debug
logic which is kept deasserted to allow external debug agent access.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 73 +++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 5cd3f44c90d2..6b01b9aa0528 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -26,19 +26,18 @@
 
 /* imx8ulp macros */
 #define FSL_SIP_HIFI_XRDC       0xc200000e
-#define SYSCTRL0                0x8
-#define EXECUTE_BIT             BIT(13)
-#define RESET_BIT               BIT(16)
-#define HIFI4_CLK_BIT           BIT(17)
-#define PB_CLK_BIT              BIT(18)
-#define PLAT_CLK_BIT            BIT(19)
-#define DEBUG_LOGIC_BIT         BIT(25)
 
 struct imx8m_chip_data {
 	void __iomem *dap;
 	struct reset_control *run_stall;
 };
 
+struct imx8ulp_chip_data {
+	struct reset_control *run_stall;
+	struct reset_control *soft_rst;
+	struct reset_control *dbg_rst;
+};
+
 static int imx8_shutdown(struct snd_sof_dev *sdev)
 {
 	int ret;
@@ -202,42 +201,32 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 
 static int imx8ulp_run(struct snd_sof_dev *sdev)
 {
-	struct regmap *regmap = get_chip_pdata(sdev);
+	struct imx8ulp_chip_data *chip = get_chip_pdata(sdev);
 
-	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
-	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
+	/* Controls the HiFi4 DSP Reset */
+	reset_control_deassert(chip->soft_rst);
 
-	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
-	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
+	/* Release HiFi4 DSP Debug logic */
+	reset_control_deassert(chip->dbg_rst);
 
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
-	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
+	/* Run HIFI4 DSP Execution */
+	reset_control_deassert(chip->run_stall);
 
 	return 0;
 }
 
 static int imx8ulp_reset(struct snd_sof_dev *sdev)
 {
+	struct imx8ulp_chip_data *chip = get_chip_pdata(sdev);
 	struct arm_smccc_res smc_res;
-	struct regmap *regmap;
-
-	regmap = get_chip_pdata(sdev);
-
-	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
 
-	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
-
-	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
-
-	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
+	reset_control_assert(chip->soft_rst);
 
 	usleep_range(1, 2);
 
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
-	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
+	/* Stall HIFI4 DSP Execution: */
+	reset_control_assert(chip->run_stall);
+
 	usleep_range(1, 2);
 
 	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
@@ -248,16 +237,30 @@ static int imx8ulp_reset(struct snd_sof_dev *sdev)
 static int imx8ulp_probe(struct snd_sof_dev *sdev)
 {
 	struct imx_common_data *common;
-	struct regmap *regmap;
+	struct imx8ulp_chip_data *chip;
+
+	chip = devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
 
 	common = sdev->pdata->hw_pdata;
 
-	regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(regmap))
-		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
-				     "failed to fetch dsp ctrl regmap\n");
+	chip->run_stall = devm_reset_control_get_exclusive(sdev->dev, "runstall");
+	if (IS_ERR(chip->run_stall))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->run_stall),
+				     "failed to get dsp runstall reset control\n");
+
+	chip->soft_rst = devm_reset_control_get_optional_exclusive(sdev->dev, "softreset");
+	if (IS_ERR(chip->soft_rst))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->soft_rst),
+				     "failed to get dsp softreset reset control\n");
 
-	common->chip_pdata = regmap;
+	chip->dbg_rst = devm_reset_control_get_optional_exclusive(sdev->dev, "dbgreset");
+	if (IS_ERR(chip->dbg_rst))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->dbg_rst),
+				     "failed to get dsp dbgreset reset control\n");
+
+	common->chip_pdata = chip;
 
 	return 0;
 }
-- 
2.34.1

