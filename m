Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB71EF08D
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043251; cv=none; b=tP2lYZtK3epAA9Lz5bk0LQdVt2vU+6q7rRzaHAT0i06ucIOeSExI1vwyrkGIDkSSM1S+UIkeQkfIw7TJffKIm10bm8Jr6iZQVlLcBaOG0qRYm+qTn0ZCR3FnIEI4RDjGzO2K+uf9OILqrgTCtqQ4+AiFwIfz9bcJaAWx37bQRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043251; c=relaxed/simple;
	bh=Di0pc8+mVoIIZUxrN5rf1K7d3PKUOyY+l/aCtguTkgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5x0ANBjpmmlMFgxsi1LCTKP5uu8cGUY/sFLVyYaGWqCEn+gxvUbg9Bgep4AE//w02rvyjhGW5MxT7C1BjoxwDa8+DNMAihl25VDLBi6LO9Mxz3j8+knV45hfR2wwRvrkAh2Ak2bBr/8usR2o6/nYJt8vNIPud/c5PY+/8XHMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBrgUIdz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBrgUIdz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso6184275e9.2
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 01:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043248; x=1740648048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=nBrgUIdzsd0KaOLfAWD4MUc/HNhP8C7T65lm7+xp54ARb4ti69PV/8U8qFQhbPmrF4
         9+vgUgGMQ0lpbiPwcQm6zXO+zs6GqMNGrgfQVWCnrfp50DeBIN81sM5208gxGvLkhBJC
         1c26BL9H+PwNBeEHjSQe5CohBW8EM+KHPfxICRnvof2Vj7bLQ/H9oSGl97csEMrUI+yD
         XzV00LntgwLMGLrl8Ebh9LPh/9mUwNoVgMQRY32vWL22XJnD9qdBZOelEb0NoIjFcf6f
         g2h6db16W781ti1Tc8jejWvcTekAgdvck6f+JJ9p5gRAiuc5SFBhJrtZ7VcO/3Eon+lz
         fz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043248; x=1740648048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIvWg4Gn9o+G9evf8cWLdDcl8No09as61/YnZypW0HQ=;
        b=GUsWL9jYaQ5cYZjBebYcndOEdbT/25n7Qh7MwAhZ1s3WF3K2hc/8szkrYxldoDfG5s
         sU2KAI5ydTiYMI2kmtaSZJiL/1wfAuJQAAfoulhth4ca3meh6Q1pbsM75HBb1PYl+nFB
         ADwf51yAcWAjBKaZ1EifbZ0t0apkWgTtAdu4wlGyvp6QxzoYYzUXyAty3EYYi11pTSUN
         /mIf9vUT6GohSP8D7mQrVB7e+D449EwaRgjS/f54it7bPcIFJn1IKwPaIHjOf9GYlSS7
         d+ib5LzqGoksYCKdoFwczQ9UlHwDTSmU2ySahJ9shCJs/nJyi1u9R6CIlV51uB3wPhBh
         bjfA==
X-Forwarded-Encrypted: i=1; AJvYcCVotqrKMBSeF31r2UBd4PFjZpq2OGgrfWYWdGe5IyfO7Ema75fYl/c4aMZiQCW3jvPJRtc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZh1uUs51NQvYl6/SjfbzOd0q7Tdj6gmMvg0bGoUlGktP21aBE
	1jIesO3Lvxy83ywOz9c1uY2pj6lw7mWDplgkIVDPF6nAVliYifZh
X-Gm-Gg: ASbGncsr9OxwEWHH7mYAN3cD0m9ce8hxIAAXSGFfRkIckJopBCoeHCryOKholLW7egw
	XEYZt046IHrM1DxUWHrsGSYluvYST1ceUrfQhkWUnhWGIItq0lf9Nsu2xfCZeMZbYw8UJ7D0dHp
	tPbXb0f8CW4Vu8swmUjGCj1FczLGpG3wxdWSt8Czq5RjoWQ+iXPO0R4ZHvUxeS4jX6S8Y7ETaM9
	GwyTshCN9cTYkM7PVNaO8NDDHl4KNkVFIb3g3965NUa07tcF1y6Tudp+czOBV8e5zTcEUuvPWEm
	CcblI+r/0MY2us3fTJdBjCEETtY3
X-Google-Smtp-Source: AGHT+IFUfAy/nA4NjDORyka7i757ce3BhJX0W1jdcc9Lq8KT042PAkdLHvg8+1RRG5/LjvlPDzql7Q==
X-Received: by 2002:adf:e709:0:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38f33f51157mr22341024f8f.35.1740043247411;
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:47 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <panikiel@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:35 +0200
Message-ID: <20250220092036.6757-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All usages of v4l2_subdev_state_xlate_streams() have been replaced with
v4l2_subdev_routing_xlate_streams(), remove it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  7 -------
 include/media/v4l2-subdev.h           | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 91fa51259237e..985d30c22acae 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2069,13 +2069,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
-{
-	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
-}
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
-
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e49dba3c59bd6..0fa732e6dd55d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1606,20 +1606,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
 				      u32 pad0, u32 pad1, u64 *streams);
 
-/**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
- *
- * @state: Subdevice state
- * @pad0: The first pad
- * @pad1: The second pad
- * @streams: Streams bitmask on the first pad
- *
- * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
- * state as parameter
- */
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams);
-
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.48.1

