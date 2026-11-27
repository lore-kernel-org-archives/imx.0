Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765240;
	b=yofphcG5ZSTyTmnY0tzjeNLijyibvgr5cVbSfNX7Wk9UL28J0E+lL5i/ckXPEHqvr6wN
	 fzgzCJjGsT3dA9AZO02r98JckLjNZskt09YdknNgIZgg4uw6Up5FomthbRCIS3TpBwD7u
	 Z+yrt53KpO4xwKkoI9WoC8W4jtI6ipk/H2gnLFfGHiXPBVZGHO9H4QBTEpTmG3Cq477Ks
	 BCMyYe1k+LWYEcDKW3ADFVvZ2PYJmaLlhYXxjIyp3qvYcoGLjmf/U+L2lzQtRsZ4Vp4uO
	 htPE/ibPf0m37qdkx+x4R7vyOxfJ65dYLiQEP2+Su76zRsamTqMQEDiYnCxpo+kUmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765240;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oenDQMvJtH5OqPTegmH1kUWnZC5MSKR44tXNrTurGmg=;
	b=DZkx/f+A9OzjC2do/Qn1pLy/rRlewOMje8UQFBLpYOKokls2sac4Uy98E9yyb+KYAAAo
	 rn4ip0/D9Kg3czBijMYgv4gY+92mFgetGQ+7PtEbkgjfJXOj6FN9U1fbX0gKbtPckX86I
	 mut2T2qLSfLNau7w6G8qCN0VzzllE7yDnvZBoAJ3fY3fWp0D2s+oImvUF4vXgGBfvNygq
	 EgWlHIhgqZTJ/EnExSOvVk4QIEYfd0xz0WnXiaS8yguIIE7BhvKI+jadSgx2op/UreVPj
	 XA+s/cd+hm8bfE9Dc1r3jop+0Dv2+awf+5y2N91JSgMth++Wy2E8WGxfE72UKA0RvEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=DWneqQDg;
	arc=none smtp.remote-ip=115.124.28.220
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F905606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 07:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F905606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=DWneqQDg
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1795765230; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oenDQMvJtH5OqPTegmH1kUWnZC5MSKR44tXNrTurGmg=;
	b=DWneqQDgULl9Qj4m4hgedXr90R5Q8iRqTORDFHp7wUMsLeAbKX+h3lNacsv8VsnPCQB0C20EK696JB7d/QU1HdenB1pK4s3+jCTSIhgMH67MHlBaScSIXPrKoh/zqiYIzx7LZNF67vo222V/LcoTHdbP7USxLQkx3eRZtwoVFmnVNeg9y+7qfRCNdYqI3VtiIkYV4XGZeSEFjhAkWMGv/FfqP3wdnaQfoguWr9VbtlbZ3HrKmnpA5sgGj0jO6y3b5ocrExYihWCxacEty1Ntpq4s9YvwgCXr0aRYT3WRAGQdXwm2jZx4BGhoO4T93mps9LDXaSQl8dPYohpAg4A2Yg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09006236|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.134249-0.0353024-0.830449;FP=2663912962208220567|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.kBFougz_1795765228;
Received: from galx..(mailfrom:chunyuzhiqiang@yinhe.ht fp:SMTPD_---.kBFougz_1795765228 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 15:40:29 +0800
From: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [RFC PATCH v2 0/1] spi: fsl-lpspi: add atomic transfer support
Date: Fri, 27 Nov 2026 15:34:53 +0800
Message-ID: <20261127073454.351296-1-chunyuzhiqiang@yinhe.ht>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a resend of the fsl_lpspi follow-up to Heiko Stuebner's "spi:
Implement a atomic transfer as a last resort" series.  v1 was based on an
earlier revision of that series and no longer applied; this version is
based on current broonie/spi for-next, where Heiko's v4 is applied
(for-next 63083539d2bf).

The panic entry point and its pstore/NVMEM user are split into a
follow-up series, so this one only adds a second transfer_atomic()
implementation next to Rockchip's.

The callback uses PIO polling with DMA and interrupts disabled, resets the
controller before the message, handles chip select and delays through the
core helpers, and caches the per-clock rate because clk_get_rate() takes
the clock prepare lock.  Poweroff and restart prepare handlers
runtime-resume the controller before shutdown, matching Rockchip.

Only host mode registers the callback.

Changes in v2:
- rebased onto current for-next with Heiko's v4 applied;
- split spi_sync_atomic() and the pstore/NVMEM user into a separate
  series to keep this controller-only.

Testing: compile-tested on x86 with COMPILE_TEST and on arm64, including
against the for-next version of the driver.  Hardware validation on
i.MX8QXP is still pending.

This cover letter and the patch were prepared with AI assistance; the
submitter must review them before submission.

Thanks,
ChunYuZhiQiang

Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

ChunYuZhiQiang (1):
  spi: fsl-lpspi: add atomic transfer support

 drivers/spi/spi-fsl-lpspi.c | 171 ++++++++++++++++++++++++++++++++++--
 1 file changed, 163 insertions(+), 8 deletions(-)

base-commit: 63083539d2bf955ccf84042d4b044d1133752bed
-- 
2.47.3

