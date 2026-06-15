Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9343DA7E0
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516449; cv=none; b=bdX++XCrjuAIyVaN7wWqO/3oby3fGiOkcrnIswGOf5nErEOLRNAg98hvgmIdkgtNMn+pt57EMOsGbaOEVGMIZgL5yiHZp1TCuoN2UX8RIImWFJlvS8p6cW7fxIyU3UJwtWGL+1mKbaFN8KNRjxBt0gtFdSuWwA39uPtKZ8SaTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516449; c=relaxed/simple;
	bh=uRKMa+0pM5/xNHpif3K5YMMQ7wGymJJ4S/rOeExb078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B23gpS9Tdqdg7oAdaAaB76O/itbvTEkavLkUKO6Tn/lQADy64j39fi0peqoh8BvBiKEIC9QaaHdvOPuzQAR17ZNE/ZObGGvbk1wHqJtncQDPAXlHla6q8KraZxuTZjcFqJWNAT7yEYNP216OVbxpmb1o/9zMbP2bZoRBMx1HAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW7lBdbs; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW7lBdbs"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1914444a91.3
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516448; x=1782121248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=YW7lBdbsn0E1O5BjTYJHT8VWcIWAFkf0BFRERDFUcRRFWSLxK25hAWp1qU8S/6eaAB
         d1P16RLrJyGAMTw3Z+8k46VIj0MKIFlgmyXbkUN0IAQ3pybsj9jkSgSgh6ylF8ik+0H3
         Ux9OuXSEr6eulmgsDC+3JQ8Y0vYebM19Ntbrqy3CM7t6KeuMK2hhxd5pyZBIyX3rZg2h
         4r+6pL1lHIp123ngZriNIZbdJDZl3nx8rgFON7mev9rIC/8JS13bpGOzBLf5JvNolqtr
         IZX+l6U4JHj8leI6nptrwTdc/4ydxT0BCfWn07Uu56Hjw43XYi2pkY3m1swE6aKhxIJZ
         AoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516448; x=1782121248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=MeT475TgoOPt8ZoqVBwElTzYpwTfEm1OtqHBEPRNAZzEbTJq15oV4AnT8609hdLtYm
         2KJiCahAFSgmFAaKJWbsWH7LSvM0bA1BY8KAgGnbqzktE6v2vyUxkKOF808kfbhq/ZQn
         K/UYV4XA9FhnOlI8hUZuCTtMgLnV2xvrjVOUGP22Kgs7ishece40vp1wWMaTSDSkB6Zm
         zFSQ8Yy0oALlL3WIVYEGY346RuHcLU9glUb3nfxVDEoNilJ2u+tTYs5zzP3UNEO+dQB+
         b1ghwfrMQn+i8dkU+EBQx//gnK+AKMZWtaxrLzl+rWGZzwC36vzw5V95C8aVPSO+npwH
         BoMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/J5u7jH5XZhozySHpyugrDrLsABEiKAFtheI6imoJKgpV+t91TWGjpy3SGtEAod0AEljE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT3HfpdILPOlM3zzZrsfYcZJwFRsg8zTjmMb7H1QhTha24EVlU
	o4hbPmURFs/y0Z/DeP2yTF2F4gf5jOUKNIsJbXyWlH8MJth/7rFMSfOG
X-Gm-Gg: Acq92OEiYyTWTsyMktqz4pB3b6qDiwGEOcpPNeDY+HV2TzH0FB/7SJ9LtzwJDi4fiU2
	avBtoooRajbJgGrWwpM/LUnA+XFqy6v+YXD2lTYrPXZcWd55LOSLr3PGCT87KTOjjaDivG/gg4r
	T2XDeHOMeBXq4yK2k0F6/brJrL5rOWxnVCMJpk476CL6/LuuMMVrxHVgh0LZor9XSzTshEOu9Hc
	9kvvahxaBCEFOilNDas2EGOoez7mAbUqRTJFQUepv5G0dzuRjeyLmWYb1SGdzIXIn9paTl+KSIA
	5h0pc+npr37X5nZ8v7hqNQM0xUmwT1TCYxfG0FtGkK1fYBmXJyEjY5G4+PVDrBQRgNVyHZyGfVr
	fTHQ2deIXZ3eyj/p+6P1lsC7XY0rhbDboDnrAMsZeKVt6k1vnLwCtKhvKIZdWSJxxLclLtus4N+
	FcmT1XIsNxXsJsC7PTUipPxPVlY5MMKo63g2FWAhWJFFoF4A8yut82FOxCHw==
X-Received: by 2002:a17:90b:5583:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37a01f2d31emr14079846a91.9.1781516447765;
        Mon, 15 Jun 2026 02:40:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:46 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:21 +0700
Message-ID: <20260615093824.115751-9-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 38aafb8954c7..b55dfbdb4502 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
 	struct rpmsg_info *info;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 
 	if (!rpmsg->rpmsg_pdev)
 		return 0;
@@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 		/* TYPE C is notification from M core */
 		switch (r_msg->header.cmd) {
 		case TX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[TX], flags);
-			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[TX];
-			spin_unlock_irqrestore(&info->lock[TX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+				msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			}
 			info->callback[TX](info->callback_param[TX]);
 			break;
 		case RX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[RX], flags);
-			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[1];
-			spin_unlock_irqrestore(&info->lock[RX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+				msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[1];
+			}
 			info->callback[RX](info->callback_param[RX]);
 			break;
 		default:
-- 
2.43.0

