Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072.outbound.protection.outlook.com [40.107.113.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C25473F
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713413724; cv=fail; b=gyY8bbMGsIu3tYRJQoKiQB9bg9C0YxHXHprZVkdzhpcMhsDNfKPJGjUs8Q8PwOK++fnTVWn5QXsU9dJven93r6yHqpOhiSSoPvLsw+eGWIs3j8BweiDa1XLDbyxvDUX+FRi9G/7ToLJ7hh1nUyat1crYnddsr2sKuJW/zaQWYQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713413724; c=relaxed/simple;
	bh=LlmqsnNQQOEp3fF/iwiBkctVgtQXIkrh19OIwqkeM2M=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=iRxyYiDskTQ9OnIycHYPgFGOhC9UkS9B3AxkLcsmnOXQGSbkmVLCHV+UOXAWkU1kvB7ojJeos1s+DD+0yDcXom1Xko9zcsPHE2y9zwA1kxA+9TTYy/xb4uInuogoP5dDFL9Ry0wmKI1msnUwi9w/nXdbz4t7CShwCTR/sZpPdx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TOVtr344; arc=fail smtp.client-ip=40.107.113.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TOVtr344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiCJ3QoZxD4oXzhygIKoYShgj1E0ajQu598SoYhwvG+0iHIZQBJgmqHTRQx+e/IQz0Q0MBdVXXbZrvoyQlfHGttzFUjSKxIg7xFKuVHJpmXfJnWiKOFzaUTWPfs2A8Tb8hkwMz1s/RUgjdFqcaSNbgSoVqJr3mGzuQ6OqEgymYkR/OWc6DcPnMTVOHqpAYHv9cOIGr5uU9S7e3lTgSnETvXMWH0VmGqhvQoX/MWi/hEuK9owYZS26FX3YUFKeBZH0i54flmLunJazGCAWH6114wfzak98axDFu8lqFAekJfQv/C13pu4o2IMLBV7c2HM06d1wzkdFmHWO0mH/tTFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+oJA1X/01OXatMVyFj5GewHkYkvWPE4j23i9nFKVGg=;
 b=i5JExYBGLujyvwTz0oxPDGTdSTxW7rlznNx9GFdi38vHwhlBuqX6ZURGu7S1Klfq7Zca1A6l4HK1K+1QH2ceSljLpdnq5o0BE1WKtiZG+pPHIEGgUJuGY+AyA4b3rltYNPE2jupXIkiz+O59Vy/IRoKdSPj/v378RMElvfMDBQs/gsLNgArkK/GUvXenbjN5SMEsM1wOsgUrzvNEROb/oPv1sNP3maGB1Sp6sWu6jXcPqbIHD9F42Dyb30LMOWNH3+yicHk6gzgpt6wHFqU822Q7G4T9mwK7rDrsqoxC9kpCi/ND9h7PjCpfOcC68ENUqsE/EtcwG96Ar0BOUAN8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+oJA1X/01OXatMVyFj5GewHkYkvWPE4j23i9nFKVGg=;
 b=TOVtr344IxfeC5S4y/oh5iTN72MvpxkGGxxrlZa9mInf3prIQCcvjFMk4ipArIqlTEQa2hlWzh0zZj0jF3mZTou74sg7x51JAM20Q2lrK6GIX1eAh8+ai3B0XmINOmezMTY1j5MFMV46WTNxUGM6ODNJHnnaACl0FXzipCq4rQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:20 +0000
Message-ID: <87o7a771d4.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/23] ASoC: samsung: Replace playback/capture_only to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:20 +0000
X-ClientProxiedBy: TY2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:404:42::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de798ed-9ddd-4d41-adee-08dc5f5e294c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eYoFoY1aZpSYFdjZ+YAzJeCyTokRhyQ4wgDXjAW4jVD1Mgv7tM/MZ7Uu9LoMGc1EW2RYnELLhnl3BZbglXf0c0TtfQR0xBQIUuco0yo3Uyo6WjVN1MFJsgQ9aGcJRyKQjkkRf4gRunJbEI+lZtmhCychg+eY82D1HK+uUBA0TM5bSuCeKwTJklAey201XffxleHJXXU7JWOF/zC5M/38cA5Z9EudWMikB9LtXtz/5WbDphsDLaBA8DMmf88lJ+izRoIk0l2/+kxNxtSAkvI5XxNLRxG1wmNeo75lu/4wvdHkBh3OG5C5QXFtyAAXf+COW8o225nndf4WtmyfJ5DsQXANy/0WQP05o1Ocj+fNX8Di6UgzqiPFMkxOGZL57gC00XC71UcbhpVXtysMbRZo1wQtEROovptMmuB63ET0TcKtFAu3pe6NXhZBEcvXV6Lly754NNzd5qaeI4Mwpc3XZaSNjZI1rqy3MUF7LmBhZF+dtR2i+Db7JLzqKpsfdzSD0O0doTIVZl/aVAUuXRFBnU4TDb2zd5VaYJJ+1USEk75MTWIt/ec9isTpyhrxrWlEkY4KmKBdeKU9tc+qNAa9jKafkeIJIHLJj1nDGmh3qJ19YoO90+cfmSl/diMC8acg989cwdmcv1Dq5OBcDHO8b8nalw4VYQInQsjcZumpZi8FXs7knMKbAr3fA0wcS2BZDisT/c5Di8/ZtPOJnOl6ZFeMuQ8iCVz1v0hJoykGHY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OP6t7IHuCJW5wQjylEabbWXS121fDYt91F6pmO+uVL0ZYUFPsBG6sbTX84yj?=
 =?us-ascii?Q?kmOZbNGil61lKbajf2s0qr21SQHhfI2xLGXZAnUBMS2kUf5biVHMWtLHgjFm?=
 =?us-ascii?Q?Sq1ZY1h2g/T+kX8jv1BMttWPo0dHRI1awM/LX6Ze8wa1dTNpsHwUOHfjGcvo?=
 =?us-ascii?Q?uB2g3ulrIXixkP2+/lpZj+vixcr3cqlQd6T9o1BkicsB5wMkDvwZN2PZbISJ?=
 =?us-ascii?Q?XMIvbZMultxODZeHXHFyC9QlvHNXSc22Nb75vCxnPMxJNRK4ElYYvGwlZLQD?=
 =?us-ascii?Q?CcPIv9FrkC4cDDMawjug4JmRrtlyUHhMCYTk1QSnHzLS8Ez76Iu4KvhIOQvN?=
 =?us-ascii?Q?B5ydevKqQ6nosFk8+dekb9MOZMPKjbEOdqNUSjcrdNhspap27VlWzRWYjalc?=
 =?us-ascii?Q?jQwcKyw6b0dYTUfPvvn7CFwgNQMMsfNusfglcVqnY4oJJ9VfUZLFlHizF1IX?=
 =?us-ascii?Q?NLy49LPkDnuiB4sKHw3P60sxXfJru5oH1D1C8gZDnPm41n/mdhYbzWJcI58Y?=
 =?us-ascii?Q?PZEdgxZHT1dG1c6yl+QTXxW8RkdIyJmBYgUtqhYBt08pvZLfwqAht8cn+0pb?=
 =?us-ascii?Q?iWg1/9qOSv6BfFC2tBBvjR+VOiflcyzOFdJIbbiZ7WoTQW92aXOG/xy7utCs?=
 =?us-ascii?Q?1ytI4bKXzLlgRaCUt0knMUL3Rv0jCr3QujZwZfrZxD3U7ap/3BLOtHfrjp8U?=
 =?us-ascii?Q?dpmYa8H+2FU1cLYU0kZjoH3v+Nl752vqkc+Bfz2qOkMyiFwGTlY7NQvGBWqK?=
 =?us-ascii?Q?yA0+UhKoPiXsHBX/uw02LaN3A7v0veyyXadiRA2Fky0/5mmaQQfmB6C5SbhN?=
 =?us-ascii?Q?xlvy0zUR/S8PydNtlTwpQaRfEO5F4xzhPrFmnUtHi6m+UzYJfqhjz3orx64X?=
 =?us-ascii?Q?mjqrAp0prUfDFl4g9iUV/njecpvgwLnN1zhPVG5CYkoQMfUZ9WrOKsCo6JfD?=
 =?us-ascii?Q?RoofxKLnqGyDYhpnR6ALKcoIc7aghWnX/WdTVldzVcb+FpkI+mt1sblGjUm+?=
 =?us-ascii?Q?DSLa6FQeT4GnEGL+aWcEWsgbQ8jnMrnEsQg00p2lE4Q9iSVDGGMRVKR2+vc7?=
 =?us-ascii?Q?JLxLc+ddoTyG7FqaY+c5dFZwb34JubkmtcJIm9tsSfS3tht1H45z2H4GQYp5?=
 =?us-ascii?Q?iXrPjGSigXcScYDIA8ZrKxnyWzfGkUoalRf7iEdkUEGY5qb0qjeloEPeHbxU?=
 =?us-ascii?Q?cPZSP3tz92OJ8JJ5slyfEfkgDf2vn+y3ot7T0kXv9q7KNbmFmI6zLkBBASbb?=
 =?us-ascii?Q?nuRZzpdyZ+Oy9tSwVdc2zOaN5VgThMXqxG8KRXt01LxPw+3fKkagVb7sSHOG?=
 =?us-ascii?Q?Kqjv9izy0wSGR/5PqlNDWFKNjnE08Cqm6JvkJ82WZYiQitikPJHv6Wxt8IMD?=
 =?us-ascii?Q?lXHStZ+8s0v821IgwmltjdMUBKLtnuiLq3jDzKCMVe060o1dHDHA/2j9qbZB?=
 =?us-ascii?Q?caNM8wZBEG6LjkWH0Q0RIjsb7M6VPxXuHWdiObxRm6r+Zi2GI7d830Lgq+03?=
 =?us-ascii?Q?dEn/ycQtDO9rOeW6AyZejB6fULvhyhQSFy974Rk1jlqeSOemtxOX5hRpU6Y1?=
 =?us-ascii?Q?BIgGzu9iZyr2ioj592nVJ7A07KTWh2nqGwvAjjHCnUu9njzm1cAKZUt+rsxz?=
 =?us-ascii?Q?K8WXtNUlhx/gxBy3KYMj7z0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de798ed-9ddd-4d41-adee-08dc5f5e294c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:20.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl2HHbxQvCwkOfBQ2YXswq/G4mtSbzpQnnnuHTg01rzudXKlq+avT0OLVTGqI3cu/pnn/9c1v2dGpshtakNipnNJl++ruZ7I52uxZxVX1OiNrN8n64H+TjBFLbdrxGRH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 35b284897d85..6370122b0310 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -184,7 +184,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		SND_SOC_DAILINK_REG(mixer),
 	}, {
 		/* Secondary FE <-> BE link */
-		.playback_only = 1,
+		.playback_assertion = 1,
 		.ops = &odroid_card_fe_ops,
 		.name = "Secondary",
 		.stream_name = "Secondary",
-- 
2.25.1

