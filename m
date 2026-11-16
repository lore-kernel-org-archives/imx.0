Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821884;
	b=cyTT45b7RRhGopBXNT4FXEYwQqmeEVvP1m2giy2DBNkE16DUPgFENAKQTztP2RSj/T54
	 a/OoZVqCyY9VYoEH/triWfrXlRSIT77XEa42xdrfOzla+i8DETsfmDYqo2Ryvy6j0gblk
	 V75B/lOzI5co8ASKIIdRizsguhYozk4gffax8PtPductTCRM6bZqhggbzcDgj70eHQimk
	 Cw/cWu+BJcU40ivCJ1nx6OkXCWYmpLGqklPeY356uirq4MxwmT4m6FV841VCYU7L/BWGD
	 kFBb8GLe0KN46JehhWExnjHknx+0/yFTXD0Jofx0xJOBywNAUTjfk+fVUq3GJjdUYcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821884;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SA2YrjXP63T7bidv6xhASdcGsaTCW2Z3NpgMI0Fokzg=;
	b=vzE6RSC9FJG6JG/I0q0aqI0LjQfvptH5ARtEGCopkcoHS/asdPtfdmoPvC32XfWhG8X3
	 fvo85hwNMtlr85f1rYhzKFlqUSpSEacfN9ldzwI9MicngeQKlgOUATVDaQER4yrR2yZSB
	 iZT3eqZlQkbMjvT9ovdl/2u4JYJXsKxI4flu3fWg0YCC7VP4FYXGMGgXImuvmGs7t0Gid
	 ZAbRkMyfRkuu6Y/VUljYbuZdwWKoLeeHaq9/gF9tQTFqiJxxuRNtH/FwCN6+eQAn2Fs9y
	 P6UNRTkzNGuQO8kVvzUlGKwhpfPKm+UwO1diZt7BQTCSzpubRrsS+ejJt/cjtwBZ11g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="fY0Se/+B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EE606A323
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fY0Se/+B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv2BsSW1twQVb20GED5iGWgtE3ErJ9UrYqx9VGPMsIq9LNfrjJkMnxD8tik8BjttiY0woDzJTZ4pmbIe88dSHZt33JJ2jU8dtigcJB0C308PNW94F9vmOdDaw7cp2FFS5Kw8lg3yUTCRZ2FNmOLq93qYt7uojuszlsNvfdtmMg6Vbn5a23/gFv2aj82J5lsVqxHwg36VWKZDDQLfN8zLXiNtUz/iqO1CvdP+Hnl4cH2j+3kJvQ8h2LrXRzfM5CiHe5M8ZUY0j8xQE8YN27pXcg3w7jE+i/Cg8uaCmcYIIXRE819YxeeXpUF45YwhHHseUy4vpUHzd/JP1NiqyuCrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA2YrjXP63T7bidv6xhASdcGsaTCW2Z3NpgMI0Fokzg=;
 b=yDnHUoMYE97V20kQRUkSd1mMlV4Vcv0P4bVx9Bqq3USScT9mMHa2ZCnMh+I4dCYmpgkRlX2p5E4CSGlb10ou2q9DssqfxyP0tO24J7DEqc7ku/V0UlSHuL2+nAEQd1ZqTLzNS1vBzs7H+3fnEMAumOXlCgabNXBNTOhElqAXi8fExdmRaVSLcJTzAfm1vEcUbSYr2ZJLc4K0AfqMz+TZ3aKnBcN5RgDAAWWn/gQYjc3SuwTdNFaqF8gr1r3vOm4oZ0D4l1KFoCtJfzjUI+Xx6qSsTHkcLZCQi7RrQ7w86Rz2MaFFDik6WBcuCETn6VmXVDaR4xHgT1wVQiDGD/3UNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA2YrjXP63T7bidv6xhASdcGsaTCW2Z3NpgMI0Fokzg=;
 b=fY0Se/+BtB6T+gitocWYkR3/iCjrv3Cu0WyxEQ5UmiSXKN3av/U+IGAODtZfcUMru9a/uzjpzqXzSA1chS2sZsCAcVBkWAFl/g6Yn8aqxrwRdlnr738JdYI4aAP/uFkg4zLlHhjVMkeMKgw7R4LzsV1tD+/0u2sBlYdaZQz0BH+vwBClZsRIbI3XW9WXeoZzavsQER8QF+Trm23oQ4eoAJbn2QKHgxqN8Zo1KS3QIsb0Gd0y7Glsfw4Tn1DKOWb07haa4rReMsY3ftKzcS9OK3ylFhqgt/0yvawtCRRwUqXl4GpTvsGJ3PXkb0dSkXLBXHYslpEKSqrJsqjkSNCDSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:37:59 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:37:58 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 2/5] ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
Date: Mon, 16 Nov 2026 11:37:48 +0200
Message-ID: <20261116093751.138455-3-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::18) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac8933f-8b23-4b64-68dd-08df43c54cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|261009223027099003|3023799007|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|5023799004|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	8F/t8i7AJye4RvAstOB/nQ7IHPfzuUOi7qH74WSgzeMg9l0j1W9LWooXOwYfzfYXLWKRJ14PskHuk7bo5oygbzLAAhw0Y33Ra0ePxabl2Nyssd4vnMZUnm9SrYmXAPnxC6VJa0ZWIBfhX22q7xMP3xQ/tjcTD1SggZEm/rvDghxkoX2Deb6Mq+5cHUb96CgsOAlNtXOzuZACwvFR3nZE+MQluABDHpDWT05nqCALXcPy2zYt1RZ5OWGGO39nlI4zVxvGZXWPSazXfIImq3YKhEXzalINly5ofEKS2F8ZvXInZXi8soT9fy2bB/LLDTvPfculjiaHoNIP1krNm5zfDi5w09hghPNd7Lk9rUbGYsHcWVticI3fS1MU0QmxlfRlB714YvvbrDlOQlzf3Qjdy/3BXAtMtoryjI7QvdoreUmSQTudfq4bNnP3NErKIT1aUHg5V/s6ZR67C25uR4ee4gbGiHzvyoxFj/v3oWws2qjpyNR2551+SUsDCvgWvJZuIRrzfjnFMbjmmV+/hbpcZwGlmKUS8XUR3C1m2agvApNMpAS3CoL4YOTojrDf0kQIswVrIAxGHVnchIdZfyqofsc1B66+YhkVNE91LBmYkBT84XBwB2EnsfLK0y0NK233a8WR77SXE6WVqaMmAbUg8PZD/cYAsZtHO3AS3vGmi9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(5023799004)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3gwNVYx3wjzrx4Y8vZxkUHD4P0/BRIgnWzLqIjjJqrb7VQdUroqKzKy91t1X?=
 =?us-ascii?Q?YVecXTzoBgbD0S6Lu9pJB7RxCQz/pcaFKCJidZq9m55ihSvmJNPjhJffFvXB?=
 =?us-ascii?Q?wTNrOTEvL48PJlz0AvmPTFHJzQJwn5CrE0VwUdna9Jn1ellZgv4CshU3+Rlz?=
 =?us-ascii?Q?dDvCRAPmQooXuzyEmDUkOZla7UPlwKzzBfxegQxnVavCN6LlnnvafU4K5lMF?=
 =?us-ascii?Q?fTNTOcBqkIFxKkHgV3BUT40tOSoMQPiLllyKRdch7UL/RrHDaGGJPQm+oyyh?=
 =?us-ascii?Q?YBfusw1lilKafSulw4k2KyjZAwevxQw42XKAv8T5q7j5w6M4ClJl5hMovjLk?=
 =?us-ascii?Q?nWdVLvinGxW+DaSZxD7+W2pEy7bhZqRTpaqussXtpVk2KAo2Lxrn/mfsWcR5?=
 =?us-ascii?Q?+pRQ668/YDwpfVOplnrEH4MzCM0nQIa50ogR4bGiNk6LG0lzASsLqQYqi4XN?=
 =?us-ascii?Q?jFjPEkOfa69hQRc5flBoolKQRVBZ/G8DKjlcBSY7/Od1reT6eXwHcUGUY+9b?=
 =?us-ascii?Q?L0NlrgiezSka6IILR8rvgfRC40NpQZCUFrPcHEje2NrY+cA/1gxAuU/K1MTh?=
 =?us-ascii?Q?srMxTbCTMDnE/t1D+8wLRDnYHCF+RDhGMeK1AR8xzaRh+S+XrFYfXVDxm3I5?=
 =?us-ascii?Q?UXffBS2NrBx/4DQxavu+T8nC0lbVjB/t81sxQwHKpelflU0YIWoNHZ9ilKTw?=
 =?us-ascii?Q?CyOhIMJoy2c5/f6lI4jSDPyAIfu5YD8/zqkfX2mgsEriBD6kSvME5ccS1qjr?=
 =?us-ascii?Q?F4ksTfTvobOwYft5KqQNZXYClZUffWgSlzWXH//D7DceIswPLgQF0T3wxaYs?=
 =?us-ascii?Q?E61ZWv+ZdLr5omBBtXMlAniADL5q08f8yb+DkuxeU6E010SUCa2LzmOxiqkz?=
 =?us-ascii?Q?O2mGl1v1IDqpf4f63Ri19TOTyffHwjeT5VN8LFUTiEEtrDJNuE/d2s/HTKme?=
 =?us-ascii?Q?Z5BDAeNU3M3MMMD7ST1vhyDLLTzmsGSqFcFRgeDKpQl14MDWI3HxhbCziZuv?=
 =?us-ascii?Q?rab3yzA1/sowKW4O7OYDfEqq9oY1ZLlI7Os1pYdg92Pq1YakDEzS+kfP6hEB?=
 =?us-ascii?Q?tYmmhDSw7g1fYHUEdwuXk8fsuQYR64SI75ty4hl5WcTkHhLbu+Gup6Z6ePf1?=
 =?us-ascii?Q?J8UJbgKggDVjIpjxgd83uB8C+oJ8soYG5HhScKQCuMIPicWE2d1Y79UTz2o0?=
 =?us-ascii?Q?zsWrlYA65xx+QEE7dIQ+CEo/oZ5/JtA7B+vXpLkzTdBjH85u7HmEYVEDy722?=
 =?us-ascii?Q?dGO8WfXEhSrjx13kfnCFdSIFPZiXhncWKeVhsTRsWuvGZ+BQaqOOzCHPOdhs?=
 =?us-ascii?Q?kfOM0/8FshmWecQQGw540K46fpQznfQuvmlwj4bPimxT63mULiOes6MHi7Qj?=
 =?us-ascii?Q?32d/03S52SSTtTtqAzFnnCpP3ZgU+Yv4QZrjRB3U6DlRhzqvlIoXW/GKBXec?=
 =?us-ascii?Q?7jxJJt2fNuRVrkHRGsUzXi8lcakdkVnN5y2RY/fvGNlxlOp29IX2UKoEI0eU?=
 =?us-ascii?Q?XmEcZeOD5G3pbFcYsMWhDwTGuVHFQEVthSxIgUrT7OKwygd55JUiccdlPyv6?=
 =?us-ascii?Q?FeuozgHe2vUqTihP9Bi3UAEaxIpBIuw4ZTKFtRMH9NOcQUdEXzATYKE9WOoi?=
 =?us-ascii?Q?22ybW4ymK0Ad+h1qpATAqxjftMAOKj9OM0CKOSq0ZPCvKkHeiOXkppNwJ990?=
 =?us-ascii?Q?LJaDpxDSL6CPBKAYfW4K7KAkg1iMXf6nUk9d34gftXf6in9fpHwMd0KjA8rE?=
 =?us-ascii?Q?+Gu6zfJCmw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac8933f-8b23-4b64-68dd-08df43c54cf0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:37:58.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i1kGHlMQo7FS6qkWtUY1LYt5by7vsjCxINltmlH1PGYo0YIxOpA+T53bgQ7v2XeaeHsx+XnuSRDbDe1rYnN/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

hw_params() can be called again without hw_free() in between, and
hw_free() is also called after a failed hw_params().

fsl_asrc_request_pair() always takes a new pair, so a second hw_params()
leaves the stream in two asrc->pair[] entries. Only one is released, and
after close the other points to freed memory, which is dereferenced by
fsl_asrc_isr() and fsl_asrc_m2m_suspend(). After a failed hw_params(),
fsl_asrc_release_pair() releases a stale index that may belong to
another running stream.

Keep the owned pair and only update its channels when it is requested
again, and ignore a pair the stream does not own on release.

Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index be33ad3e00ae..ea79bdae9cf5 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -216,6 +216,8 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
  * It assigns pair by the order of A->C->B because allocation of pair B,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
  * while pair A and pair C are comparatively independent.
+ *
+ * If @pair already owns a pair, it is kept and only its channels are updated.
  */
 static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 {
@@ -226,6 +228,19 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 
 	guard(spinlock_irqsave)(&asrc->lock);
 
+	if (asrc->pair[pair->index] == pair) {
+		if (asrc->channel_avail + pair->channels < channels) {
+			dev_err(dev, "can't afford required channels: %d\n", channels);
+			return -EINVAL;
+		}
+
+		asrc->channel_avail += pair->channels;
+		asrc->channel_avail -= channels;
+		pair->channels = channels;
+
+		return 0;
+	}
+
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
 			continue;
@@ -257,12 +272,19 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
  * @pair: pair to release
  *
  * It clears the resource from asrc and releases the occupied channels.
+ * Nothing is done if @pair does not own a pair.
  */
 static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
 
+	/* Only the owner clears its entry, so it cannot change after this check */
+	scoped_guard(spinlock_irqsave, &asrc->lock) {
+		if (asrc->pair[index] != pair)
+			return;
+	}
+
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
-- 
2.53.0

