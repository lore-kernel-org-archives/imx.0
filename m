Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33413DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516456; cv=none; b=HOy1jEpYhKVfzhABXjxAg+vIaIYqRpXwq8KI6mFvD4bwM6EkcyqHtEiMqpKVD2j22J32VjT6n+jutGmAmuJ2Q/m47l5Eg2zOGms79WGJZJBaFn2u1/yYD43AeEhC13lx91TAGPCmnoid+pUakXrb2Yus0dSr9Ez4iMYh09Ulpr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516456; c=relaxed/simple;
	bh=uOa1yOQLFPb3K99MR8srx9ffJSwiq+AfyuufkKgrpzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAc7tXT9mCR724mrl6taiy01AQAwxkHwiII9KFi9X5A0VepeGo1usipu4T2oebrqecJi1MPZ4f4DfHDoJFJrfdLnI/s58phwDr/ta0EQzqwXf6SaPc9pi8/vG8LePMEYU2NrY2R6tMY5WzN4h8wsZcKuTxI5PlGL35Ssh2Ln2FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv1TRyKw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv1TRyKw"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36baec934b6so2122011a91.0
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516454; x=1782121254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=Bv1TRyKwZDclUKXU1zM7FXaDyZrRXuY5jGCqZ+1AoQlKf6keWuSxmtiOfJxcX74PbB
         IKGe86EpsGmZDWQYI8bJ95i8EwRDy6gzIPK0zFA9eeOmjyBd08KyZHTNYvYddKczVm3q
         mpI/kLAhYHR1cFCZWMXtGjoF4MgnjYafkLDi4Gmbmq8Lm+zVxCJkh93lnDls19Osag4C
         om/V0TOSTkk65Fov6uxAXH1vIwR6ZoJ0BHnRVFP9ACePwrc10eDxleDGAVrL9JsLL/UA
         OGGflCXTjCUzyV8otBpT8VOiSfraMe7PYNyFBbJ9dkgZLIN4OoEk0swhMs2TDP5o0aD9
         bNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516454; x=1782121254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5EUVrIUd9a5W03H8en3F5BUxu9fsoDVhajTiBFAwOuM=;
        b=r7NMmL6nsxQXdaxqmp8KgVi5iajKo81PWnaDdYSz2fseUhz8i0eWIcB2+sUsa9K6My
         TGYVEApy5RUcrobjVVs7DlDlMiAWaBn9l5wHVJIhaE87OIAwX7F5UUEwhznF0ztIHUpw
         ZTY2R2Ta5y4FwbJPWWizyPzqT5v34FNWNqhAbNHVhS36XAjPd9Hun5GWp4qD5rvRLJq6
         fQT2w9asEzywjJ/rV5QPOa64QOetfJ4HbFFCMb8+QKd664aiuvfKzeKcsYBJTMLkRSWF
         SZ7GwcEteAwxhH+JERurZjhA581D8phzTIMR9mPyruaKMeU8HUaQP8lRnW5bThoeK1fc
         mU4g==
X-Forwarded-Encrypted: i=1; AFNElJ/Ggsm7NtI0rdbObpxoN/o6WJuH2gAP2b741ngfSrXXUgSKowQLsalM+vcrDSKkyTrBeaQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkQJLo2/waUskwIZOINkmD4ovs87ySMx0ZvUWpulSuCELeQ4E
	egd4G7vDKL1dhH0POQm9Dhp4QE+KRoy11wNKa4WAM+ZZJKQIcsyDi1Ch
X-Gm-Gg: Acq92OEtBcObEltQ5l7MalQNBPBk6QwPp3wD3KCVrkMmc6q1G36FxH0Zfz/5ey8p3LL
	etdgWtm+HTSX1QDvNywOlvKbMQRBiP4FkU7IptL8tceCea6O0kpIWMgQuxZsfhANCkL2Jc7ZaCK
	+VZWZozme380YKfQWYOscAPX+eVsPqNitaP3PtJzMwr2bfBe9OqhL/Ch8CYA72XITUT1xLR+/B5
	0fJbELDz4wRLt4FSRD46H6qFMog6LVrsoumqCTFd9SwFzYsG290YFR0dA8fIOf1yUfkzgU4qNPM
	CUAN6bmsic97ww1KXdURb+Vk0x6qX0txrkpTK/cpEJYMj3kuInbhT/JGHTF/7gqSTVgrtKgetlC
	iWX9DK5hIc1fBPOoBR8jKJkP9bKB02CpCd1ty75877ddutc/OMt2hml7vp4WVL8Lu770uRyQ1G+
	ZffEDIsrQy3l62sX2vaFSCyhSJ66iF6yfa86BQVtlGchOw2w1a9uli/5DEAQ==
X-Received: by 2002:a17:90b:1dce:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-379ed8e27d2mr11149280a91.6.1781516454144;
        Mon, 15 Jun 2026 02:40:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/11] ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
Date: Mon, 15 Jun 2026 16:38:22 +0700
Message-ID: <20260615093824.115751-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 69 +++++++++++++++--------------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d..7210393dfa5d 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -39,10 +39,9 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	struct rpmsg_device *rpdev = info->rpdev;
 	int ret = 0;
 
-	mutex_lock(&info->msg_lock);
+	guard(mutex)(&info->msg_lock);
 	if (!rpdev) {
 		dev_err(info->dev, "rpmsg channel not ready\n");
-		mutex_unlock(&info->msg_lock);
 		return -EINVAL;
 	}
 
@@ -55,15 +54,12 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 			 sizeof(struct rpmsg_s_msg));
 	if (ret) {
 		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
-		mutex_unlock(&info->msg_lock);
 		return ret;
 	}
 
 	/* No receive msg for TYPE_C command */
-	if (msg->s_msg.header.type == MSG_TYPE_C) {
-		mutex_unlock(&info->msg_lock);
+	if (msg->s_msg.header.type == MSG_TYPE_C)
 		return 0;
-	}
 
 	/* wait response from rpmsg */
 	ret = wait_for_completion_timeout(&info->cmd_complete,
@@ -71,7 +67,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	if (!ret) {
 		dev_err(&rpdev->dev, "rpmsg_send cmd %d timeout!\n",
 			msg->s_msg.header.cmd);
-		mutex_unlock(&info->msg_lock);
 		return -ETIMEDOUT;
 	}
 
@@ -100,8 +95,6 @@ static int imx_rpmsg_pcm_send_message(struct rpmsg_msg *msg,
 	dev_dbg(&rpdev->dev, "cmd:%d, resp %d\n", msg->s_msg.header.cmd,
 		info->r_msg.param.resp);
 
-	mutex_unlock(&info->msg_lock);
-
 	return 0;
 }
 
@@ -109,14 +102,13 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 				      struct rpmsg_msg *msg,
 				      struct rpmsg_info *info)
 {
-	unsigned long flags;
 	int ret = 0;
 
 	/*
 	 * Queue the work to workqueue.
 	 * If the queue is full, drop the message.
 	 */
-	spin_lock_irqsave(&info->wq_lock, flags);
+	guard(spinlock_irqsave)(&info->wq_lock);
 	if (info->work_write_index != info->work_read_index) {
 		int index = info->work_write_index;
 
@@ -130,7 +122,6 @@ static int imx_rpmsg_insert_workqueue(struct snd_pcm_substream *substream,
 		info->msg_drop_count[substream->stream]++;
 		ret = -EPIPE;
 	}
-	spin_unlock_irqrestore(&info->wq_lock, flags);
 
 	return ret;
 }
@@ -523,7 +514,6 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	snd_pcm_sframes_t avail;
 	struct timer_list *timer;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 	int buffer_tail = 0;
 	int written_num;
 
@@ -553,11 +543,11 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 		msg->s_msg.param.buffer_tail = buffer_tail;
 
 		/* The notification message is updated to latest */
-		spin_lock_irqsave(&info->lock[substream->stream], flags);
-		memcpy(&info->notify[substream->stream], msg,
-		       sizeof(struct rpmsg_s_msg));
-		info->notify_updated[substream->stream] = true;
-		spin_unlock_irqrestore(&info->lock[substream->stream], flags);
+		scoped_guard(spinlock_irqsave, &info->lock[substream->stream]) {
+			memcpy(&info->notify[substream->stream], msg,
+			       sizeof(struct rpmsg_s_msg));
+			info->notify_updated[substream->stream] = true;
+		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			avail = snd_pcm_playback_hw_avail(runtime);
@@ -640,7 +630,7 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	bool is_notification = false;
 	struct rpmsg_info *info;
 	struct rpmsg_msg msg;
-	unsigned long flags;
+	bool updated;
 
 	work_of_rpmsg = container_of(work, struct work_of_rpmsg, work);
 	info = work_of_rpmsg->info;
@@ -651,25 +641,26 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 	 * enough data in M core side, need to let M core know
 	 * data is updated immediately.
 	 */
-	spin_lock_irqsave(&info->lock[TX], flags);
-	if (info->notify_updated[TX]) {
-		memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[TX] = false;
-		spin_unlock_irqrestore(&info->lock[TX], flags);
-		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[TX], flags);
+	scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+		updated = info->notify_updated[TX];
+		if (updated) {
+			memcpy(&msg, &info->notify[TX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[TX] = false;
+		}
 	}
-
-	spin_lock_irqsave(&info->lock[RX], flags);
-	if (info->notify_updated[RX]) {
-		memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
-		info->notify_updated[RX] = false;
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+	if (updated)
 		info->send_message(&msg, info);
-	} else {
-		spin_unlock_irqrestore(&info->lock[RX], flags);
+
+	scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+		updated = info->notify_updated[RX];
+		if (updated) {
+			memcpy(&msg, &info->notify[RX], sizeof(struct rpmsg_s_msg));
+			info->notify_updated[RX] = false;
+		}
 	}
+	if (updated)
+		info->send_message(&msg, info);
+
 
 	/* Skip the notification message for it has been processed above */
 	if (work_of_rpmsg->msg.s_msg.header.type == MSG_TYPE_C &&
@@ -681,10 +672,10 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 		info->send_message(&work_of_rpmsg->msg, info);
 
 	/* update read index */
-	spin_lock_irqsave(&info->wq_lock, flags);
-	info->work_read_index++;
-	info->work_read_index %= WORK_MAX_NUM;
-	spin_unlock_irqrestore(&info->wq_lock, flags);
+	scoped_guard(spinlock_irqsave, &info->wq_lock) {
+		info->work_read_index++;
+		info->work_read_index %= WORK_MAX_NUM;
+	}
 }
 
 static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
-- 
2.43.0

