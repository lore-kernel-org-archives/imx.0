Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C39563288
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887268; cv=none; b=IB8SaZyCJLFf1So6MRnGxPOLcbVbHGhb6df9/mf9aPN0kIIZ4I6HiSyPf16J0SguPraF4HGEaEK+rNeTHLRb++NjDCkRLNznQ1HGxhr4hz5bq+T2CjUMTbrf0G4XosdKJwpitt6YcoUsn/Hx1JRDp90QnlCPikdtWTzBMaK5tNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887268; c=relaxed/simple;
	bh=dVKIiNAEgVbAcUmEZV6u+JTcPDwaNXloRQ0M0HcerBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NIn1l92YsjgEiplCVmnpH8fAuMjMKtIifBMCtrqILPNpzkXs1Z92XqDUsYrtgk5avkkDJzDNZIFw/WfJAuqatM5HIaMWIFAxafcmLvkZjEy4cl/CDoT9vSA5jVlQGqTZf8S26l8Zgstjj0VrXQqhw7R9j+4Mn6ESKxDa1A2iB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0BpWiDw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0BpWiDw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so647955e9.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887265; x=1789492065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=f0BpWiDwJVgPAOigl67MQEaewBuhdbyiIq++hoUlfIxtqy7Dd2Epz2kJ2khh6TfTTh
         TM/PEalBiJuckyLSUXD1Di8MYTfAztH0nfqNtidhi0DkWIgQy7npG9Luq+g1AxG0MHWe
         RC8s0C6m5OzyG+oR0z7v0OPgNkhG/3NMTuWAXFt74B/ZexxvN1F81zbUMYki1hHiAvDj
         zQJY9Q3PnIWiu0GuBqTiawgAWjK52w+KeeC3O5fXd4rG6uOw8ORysgPTGGI+PwxzZm++
         nJE2DTXyUuDIyJC1+JKkBP3g/59q0pZOt8wsKEfAar2jtjC3tOuj9lS328G9WnDWPHe0
         gt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887265; x=1789492065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=OY9mFpoIlQimevc1Yqn/DM+z2ASwdxDOFVNxuXoNzBBbic3KCGmrD+pT+axfZCYY8Y
         QGa+mGXRn+TI2FRKTAL+nMTDFV5lZt3YGa5uraI2vDY/KiOdFquZlV7kic2/ksYEWdsh
         WXbBTgYyIFPkfE+pzhxAsttjKEyRQBWzXtTwHm4OdgjrBsmwaR+tbYEIRAk1Rf1uLMH5
         t9PlRkXXmBblDEnz/RRtk/ZqjtvhF/N+Ys3nDrQwE4kSBgxnEK9IwhyoR23NIHeQHe/M
         aiTZyXxgy8uRjU0Ill4v5gWwH2DplBSrLeT712m+eH7ZFxa6s7lxO+Mj9NiElHLfIJhx
         565g==
X-Forwarded-Encrypted: i=1; AKwUvBy1jBwOxN4yn0Valn/5feWz/IAA0F6IOaMKaHWpfzO7ajPFLfGVax8BurTTpU/nT86IPlw=@lists.linux.dev
X-Gm-Message-State: AFuF++mbBR1H0gqyP/4fnngv14ml25qUGk20n2L74zoPnW9sfRgQbV6O
	73x5AvzoR2oyNeB1Pa5PJED2OHHJB1rgR3h/tqytB6liA7XymjmaMvv/
X-Gm-Gg: AYBFou1erD3q2irUqY8Wzvqd5FO+xMyHf4xj/O2QjQgFMpR/9INP/YaK1yuFTfg+nYW
	JbBKobj9RmJOE3S2JdG5xR1pv0TP/y1ZPWO4x289Cy/VU7727YOTNseDw4z+KWbu4JQZjRsl2/I
	eZ2L9FlMkCKGy6BaNs+wzPcNooULwcnOKUjOT1QcE/5F8+pHMIdIhVQ6MwSGzLtlWHUJgXdsoqA
	2QkuRZ8g7WGM9Pyg5scjX3j/T4cBcAjiF+ffp98UjDlAbjhqj8DUQ9ccn4ezNi0zUWbsy816fX7
	6gmlSuaR+CrvU87SMVppgXs3x/zsCkWxbApc5g9dgYdGKArbELGzUF2XQI5ip/SXd42JFANbqAP
	uZRj0pQusGP+pIO0HKLZIod79ZB5MwY7QQjpatAbcZEdIIvhRbhpz8SpOOr7Il8l50UADZ928oh
	UEZErCJNe2WBWqTwFnzfnKi0x+WK7KQQ8tFN0e2kLr6cy130Pg1lG09QiUBTbg9vxNV8vucCN1g
	fDH65HGAIpeKA/mw87sh6V8y7tagvsPFYJ665UtV8WZiCvl4we2ArZMrb6r/9MzVeoNfthk7hxN
	tIJHb9GETsiTKOKEHpppKE3PWR7apZqME+aHkpXRwoTLiVZt9WkS+4aQHobo6CgYwFcwHjHISW8
	Oa2d+cQ==
X-Received: by 2002:a05:600c:3f05:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49d1f223e83mr13800115e9.4.1788887264353;
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm304804615e9.4.2026.09.08.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
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
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Tue,  8 Sep 2026 20:07:40 +0300
Message-ID: <20260908170740.276800-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
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

