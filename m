Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37358B6B7
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986475; cv=none; b=eiMr3duqVk5RHeAfgr90YtEjTfFUUIifzvX5k4L5h5AKBrZYosLZVzkTGsnnsNz57OZgNcAsSr5K6jb1mC+w2SEu5gyOSqT6bZxyEZURQCkdkVKimIgRQTHLONkU8tPMxQDMXuhEOFoGqpM/FhbjsDYS0m51RZz9ceC1IqzoqdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986475; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nia5fk35MTaLCXhz9gKLPtai2o4Ad+pTbwVjdmvLIzyDWLW1mfhqQmjPVdYwrsexsC94NDFB14jxZkZCNGNoic9LdNR4jF0GE7M1lMlvc+gje6imqDO4HJv3jtfpJoR8jeSHqDaJ6K+eXdjOSyIqayR1402uwk7qQ1diDmmad5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ4VDuYH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ4VDuYH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so9655175e9.2
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986451; x=1789591251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=eZ4VDuYHxcBvv9E7CG/G/SXwYBZhb6NwZz/31DNafV9ddNvvMW5ekE36XvEuSnMoC9
         CixoRlW7vzVDVWsMI+yVJdLZzt0FvAY4QBam89RmGrFO2urhybKZryuG45VhyQr1emuL
         LmzaPu+s8bPVtnehEF2jHNc7yHlSg4/PGU11s65HkNL0UUfo0tjz72eCL0c6cCpiHtZz
         Z56X9pqOjZQJzhHF7JJKxZxRsj+qqN5G2kBC5j3e6s4EJWHmhlZJPtRnCVJ0cXYgAcqC
         EL0kMm0C4aQPqa6fl71cCz09rfTbkNCMzWh10WAzpk76W3oEOAURpxzve+Yfa1UisZTY
         Lkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986451; x=1789591251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=rC46iPcirQrzhALbbfMUysRGwvPX7Hirz1eSh2E7GyxL6swhqZSlTMEMaZP3WTlCxx
         q+67NXNwzP7XVp50dk2YrzedRsUA14O+5VDFFbCphegcig3LZvCloBFJtwuQgct7zqbQ
         GbBRBu49tGRDKA9Gw9g7jFdTDkGKmo7+w/OH1W7SD6Q7FNJEbZmWZ2Ulj+BNGTXdCSjR
         iN3TEi0L109ykHxAI5DzcMmELq7ojjXwrWNwKAKRwD/Mga/5Cz4Cj0RQhkOvv33puqdV
         01fBuNjA+SD0Y2+M6jqeSZj1GDMuGStexBywUWCCs5FdaUJ39zw31BJ0RCkYUNlZQjce
         NSAA==
X-Forwarded-Encrypted: i=1; AKwUvBx7KG+BZmrqF72i/xE3KEQ7onTgLe5RxxMmix3lfBYxe+1kStTmS9fuCsm3MZnIavhe8wA=@lists.linux.dev
X-Gm-Message-State: AFuF++lhn75nfEhP+r5+r+XmyKR60l+nbcIC0HxOa6DTcojn6gf8zYjb
	ZAEwsKh80KQpnNDqV+GsUHmTNcB7NvZ8BokTk6kebDJYJUl1e3B8ONH/
X-Gm-Gg: AYBFou19ivRtZEelXqk9el5B5nsddc5Y/RnVLhtnanyEfgMBy/BytL9nL3bsZCh4qiT
	oK+135Xcmzso6zZCg40myNKCh2DinWtuTNGlWDxnrWD3TU25TL0ZGQpncEQQOlpZsiyb1SAMqJf
	uNMFhiy0iPsU12PXTF2uwtjyrayvRg/sYMH5wrXJ4lpz4JQjyPuF3uYehw7YV3pN135yKle20VX
	INPDJAzDpdn104gEcaxmJ0qmcaD2O7VEJg2l6pJs67VVwKQIif0lz22kSr2zruUphDochor9SDz
	ezdBVT9KpgWrspKd43AZi31mxMicSIAHDd6rZl6EnQMPn6yHrDywjo9zLzssmZBSkTjjJ5ao9or
	Z4qY2Nj5csw6nAmKZI0B8X9mJoEEdWIOG2NvzS0KhdPvbxWFZDLMW1s8EIU6vFLkE6HczgHRlTG
	aQKPZK6gkMTPvoDeJUAuvOQWIEWBLd6nm+c1Qk6RcJhQQK6gnYBYbK4fanYg32c2PtU436w6CBT
	T7hSzfLRjq/atqEOJtQqcovg2iDSIkN8IMWbTn0/PSr2o/xxw9hED3sA6LSeHcRUnK08L1OKqHQ
	8cyw1tDK08sp29AtlSTHLXDyzvRpgjCfx/CXjOuPxJQNZhizBSAmK8unupJQUawWdgVVcGi//sY
	TDFNnG6kIeHR6hE8h
X-Received: by 2002:a05:600c:34c9:b0:49d:1deb:a629 with SMTP id 5b1f17b1804b1-49d1f21ae8dmr155804825e9.2.1788986450686;
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:50 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Wed,  9 Sep 2026 23:40:42 +0300
Message-ID: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a shared Xtensa helper that iterates over a flexible
array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

While Intel IPC4 allocates dynamic storage for the AR block, the i.MX
IPC3 path reads the oops message into a stack-allocated struct without
backing storage for `ar[]`, while leaving `numaregs` unvalidated. This
causes a stack out-of-bounds read when printing a DSP panic.

Clear `numaregs` to 0 on i.MX since the AR block is not fetched or
supported on this platform, preventing unsafe out-of-bounds memory
accesses in the shared Xtensa helper.

Fixes: 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore call stack")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..436fe49246ba 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 	/* first read registers */
 	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+	xoops->plat_hdr.numaregs = 0;
 
 	/* then get panic info */
 	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
-- 
2.53.0

