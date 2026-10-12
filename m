Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462247F2E6
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814734; cv=none; b=MA/lnFSs3o5uk3OxVYHrynKa20fFST7+Cz9Frg1wDevaEhuClhoM8243UzQDj1ZzQDzg7FkhULrIsbh92vLj8gje+T5G2oJxehUM8lm3sC/nm2LW7w/77pG2CEsIkFYAT3NddXYGCWPx36+xjnT6FkQlkYDmQlbwSUnGQ5Bz0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814734; c=relaxed/simple;
	bh=WQ7XIboTR1vqgyYymKbjyKtfPl2jvwq3FcS6nVzEnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/Urfjfj9ohU0oOKyIgBDPgjuAIwe0IpYr8G9MuNMvmCG78NpwR3XlJAleKEu6SSbJu7ZJd5lM2f8YUJp/Ok870bopOXfPZpsNdeNN87XGOEiaxiixRDIIHihlVnJ3dXF/BjCRJMMgRqTxym2Amx5e9BgGO6bEboNYSX7XsqOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLUuBgsg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLUuBgsg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso14035925e9.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814731; x=1792419531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAnUXHOCv1N6NobyAvFYO3nNsMFXZ2Np3QhzZc1kV3Y=;
        b=OLUuBgsgKd0kZhGjsR6x8TkwZRKlw2vZhSTQYsdDjDcW5MPgqZqd0bww+VciRdlVbQ
         C5zV2TtXki5b/kjhMwJ+DVM8HjmKcZpG1btFEWMMajilbvyaeJiLqa+k1wEa9e5QbbGq
         9CpMjCz3nf5JF08NeJhsvx9diu0HCyyXU3iUUfRPNMHEkTo3EFC3KlUT/ByH/a01KOTs
         yy050l5wAshw/h3kelHinepa0fuhgfo0FIayNz9sdAAIwAvCh1IfyRf4JUuf2z2E3JOj
         NYXzFmjindWMXNfEEAbpVQinri27mfyVH+N6uHUp0IZUZL/zt65k53bxEXZ90jSEDKz/
         WFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814731; x=1792419531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAnUXHOCv1N6NobyAvFYO3nNsMFXZ2Np3QhzZc1kV3Y=;
        b=ZXA6xKkBBwhpzyX33tSuFC7dGHwl2wRWqakK8jB2HSuLJx6bLuLwOlIKFIpA+4XJRh
         yjA3+B/M2lS/OXuxxNnDl3gr23zHhkT58JPJIDTA2rIm0QtYUmFwaFyBX5qx657/xXny
         2EaUVryJVQd2pDr7aqgUcYoB+tQk9R9c+RcfAlzq2Y46YmWMfdTu94risKzFzmdvoy2W
         TAwHLAYxP03sE2T+/rlEggItfBPsgVAeSNLRJwE4Q42v2izJhg6axkKlsY8Gbw5vaGhO
         k6fvmzMYCxmJG/0I05BbLtJqaDv64v7Y2UWBBa3yxWzKk47h2I7ahqBX38qAHxLf/qKC
         gcvw==
X-Forwarded-Encrypted: i=1; AKwUvBxs8rmtW0CX8UQyJv2J6fGFBIf6awaF/WiXr0mKaAqAneS893uyUbe3e+msSWb4LBfMYBs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ4nVhgikWs3gRG3OY3234xzvtCWWJ8NjCKGmOa6iGp8NkGjWWx
	TyIhJUvNa/r6IGkHtaPTBeqtaqpOckisZ9qWqN4FkffNymASBGPxUZqX
X-Gm-Gg: AYBFou36cec3ULFQsNMIEFsMYZb/G/nUdo7Owv1vTM83/wktmUfL8eKqy+edZCqZ5vL
	N3DLJp0aGPJIUy3+oGPSx4K6bcEy1XnmtGkcEpO9D44vX28E9HbYIBuWWdvYm23FqU1V7bExCrq
	Dp9Y1BkHxks0mRJpEPN7Wp3XPFkQoGJTtZrU0oLpBCQ0vWtv9Vel7js33bDtD3TRMd8YuYTJokt
	4HGC2CzlntsoWiJF4ysWi9qfXPAGTIctXwQAPNb9P38gGCnni7o6iMCanv5ylcid5CmF5WqbOqB
	4LWMQ6maCdeFYqOtfR6vJWCNfB3oPz+eBo0iHCjapAoMxe8aL0Ytqvug8Kw6MNBtaIgHo3vae7x
	12sqlxB5npGkjnvYFptAC4y6vEy+Th2GFdZgcElKMirTOhrT6R+KGdEYATp4CDOCBNkhfoe2KkG
	zYJLBwy03Cwm+0i2uKHUSnlpqO91dse9nlKTCuriCQGvKWY/DTkx9x/VVh1zYSoGWNFWlL2H9u+
	qYx06GIL5XCKmVTPH+bF3fbxw==
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr183870185e9.25.1791814730914;
        Mon, 12 Oct 2026 07:18:50 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:da28:f29d:be73:9231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm257034665e9.5.2026.10.12.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:18:49 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	linux-media@vger.kernel.org
Cc: Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	imx@lists.linux.dev,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] media: imx-jpeg: propagate encoder command errors
Date: Mon, 12 Oct 2026 17:18:24 +0300
Message-ID: <20261012141824.497906-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_jpeg_encoder_cmd() returns success when
v4l2_m2m_ioctl_encoder_cmd() fails. When an encoder command is issued
while the mem2mem context is draining, the helper returns -EBUSY,
but userspace sees success.

Return the helper error, as mxc_jpeg_decoder_cmd() already does.
No obvious reason to clobber the error here.

Fixes: 4911c5acf935 ("media: imx-jpeg: Implement drain using v4l2-mem2mem helpers")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index e17085935435..5e466ea65a92 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1726,7 +1726,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	if (cmd->cmd == V4L2_ENC_CMD_STOP &&
 	    v4l2_m2m_has_stopped(fh->m2m_ctx))

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.43.0

