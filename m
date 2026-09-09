Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57935E956
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986460; cv=none; b=HLgjSYBY8YEvBUhOWcbIfwjLy8yrmlo5tzW4Xih90m+zJLuTGppIDO/d8/0BWS7lNS0bsY5T6+As9boFUdwr1guw3KOTkVuEI9XtOACVx25jRT2GHJNitye87NdDdFi53bhBrF+tfX+s+joPJJUoGcU6xU9tyi5H/db3g6xZwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986460; c=relaxed/simple;
	bh=V5JXF9xuhHcB9bSbIAWL384a9RlhtX4vE2mq3dg4miE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tuBw0xdicvS4s+E5CQyU2QOpMZXZO9xBXhyR+I3Yx07N3lqPWBoCDZUUP9F/cyKLig76/xbDE2KCjBjRAasJNoDh/kdWRZNdpMn4HWR4eAheSuxcxo3hCP4p3bg9qNSBwUC5vz54hokpOniYlaluKwg6KGvc/tR0Y8rVq6UZXAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGGyPInN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGGyPInN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso77268905e9.0
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986447; x=1789591247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=hGGyPInNAnpPXvXYIBI68VN07VK9QtccNRSSlvMgwQM6IVb6qAMqxas5zA7REuWo0H
         Zdx4UeJeXKRavOJdj6pYGxQVMj7dnAGPq401ZuTB5b9EpQSaQxiekxHktP1szvaTiDn+
         i3XOtqpvwGmREnQDBrL/CwRruJSxNDauJD2lMHJdIRb5neMun9oZ44kBxf0qY66uaD3F
         RxPszsKinE4zbWyFDPZM7R/vi/37hUn2Kvl8v0n0QsuFxe3SqZh49o8a415T7+Nk/mSy
         pd5oEFZchQqUqUShHlGVBBvek6fIRO93eu2yQNhQKwbtI4KJ2bFoveKPa7rQ27nkw1ak
         T6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986447; x=1789591247;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=Tpf/A8iirl7e/JHAXokrHGmaeirc13Kdw9i4vfsGzG4KiWFskE4QIDx7+oUgY9NNfC
         vmR0FWx90jOoJgy8ztJO7Dt0NqsyodP4uoGiUJK2job2ilQUCbUY4TFxM465kHbvo899
         nHoe2TaCEQPx41riQzVZxCSujMzxL6X+feYZ4gDFmsDsdqEfovKrRCL7VkkKHfAtCrQG
         iHn+esakj8QgJ7W+JcyBen7OpfXGH+sOsKTnL7/BDMehRCKEPr+ZdcXFr24dI0omiWdn
         5AqOM+kKKgxZAzIDOE/Sh/3xPyvYoxukrU48+GMMT2mYgVkigDS+6VcuKxpbQ1Po0Egz
         9Slw==
X-Forwarded-Encrypted: i=1; AKwUvBwhnVDCi/BLYkVQlRtlg1GsqykOfTqh7eA2+nE5Wj7S804shsCUMeixhlTf9om1kEL5ouE=@lists.linux.dev
X-Gm-Message-State: AFuF++lYMEcyBVvnufTUeWPp986v/wEjwdWIuZyClqWqGg7R9Ad9Mzuk
	iQJ3YRF9KCFIUbnlBYo5GrH7N6URL7siOl3PWn4jLrr6bJIS6QKA3J5r
X-Gm-Gg: AYBFou2EczTo9KsnXZkKlEqaeSHdZNT3ka0S2zCfY35eEcGewk7LimdAFScx6mg05ox
	5i5+ooCo4z+cZ/jWi53dHhAEfBqZky5Y83Vi5fOe4RVDv7MteDpRsFMZjN9Yu6tDcJvGdJGhm7r
	lU2vBvkYCRJDJKo4fCa++dOPAJi23z5PAQc1KhA/tZwMB88MfOxqLNM8IC2MUmJPzFez4alCURu
	0L6kzxHw4zqp1kAe1Hl1azZuUJOtsIPri8/gkz780U7fSrqsfixgyBSosR1tHiQ4YhqGUpWCTp0
	820DsW0mUPbVarRCh5Egghb7nuWl8rj+/QYyP5oIw6/1UTUsnPtx20yMl7iXZtYAr1q8lGjZ8kX
	3eQCiHVw+ydwz7JV4M7rKZEdSVp0TMiOBcChdn1O5oAQSr0QuYTjbquAhe9f61No3S6NVf0e4qt
	v4CZiXMRkAGnSwsWTPEejsJEU3bit6JGAjQ6ooKX8DFn3Z3q8GPCCUrkCO01L3rDXeyHdc4G5O8
	qp85Ze50o2mNENgPL5VcUxR69FoihdXy9SQ2eM7UELYm/5MosCjdBHNmoT5+xmUisqWI6Ww1neA
	2PDwkF08Bcw1aBjuL+aqB/Iksr4lDMrwqc+MUpfPvoqs2JIA5u4VGNX/m7dvcV07fpKlD6eUx5o
	+HDX8WmaPR5DfhWwz
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6c:be0b with SMTP id 5b1f17b1804b1-49cffd457a4mr279515695e9.17.1788986446464;
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
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
Subject: [PATCH] ASoC: SOF: Bound the panic filename print to its array size
Date: Wed,  9 Sep 2026 23:40:41 +0300
Message-ID: <20260909204042.46656-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
array, and include/sound/sof/trace.h documents that the "filename array
will not include null terminator if fully filled".

sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
that fills all 32 bytes leaves printk() with no terminator to stop at
within the array. It continues into the adjacent linenum field and, if
that holds no zero byte either, past the end of the structure into the
caller's stack frame, since every IPC3 dbg_dump callback passes a stack
allocated struct sof_ipc_panic_info.

Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
documented bound.

Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d394389c945..9b0850e87bf6 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
+	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
+		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
 		   panic_info->linenum);
 	sof_oops(sdev, level, oops);
 	sof_stack(sdev, level, oops, stack, stack_words);
-- 
2.53.0

