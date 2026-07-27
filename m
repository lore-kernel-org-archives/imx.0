Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131BA3ACF17
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149380; cv=none; b=NaMrWJhTsgDk6AZeGfmFqaS5pqmbztYF0GSyMVblArIy3i1I9U2qj1YHkUQSo1oC6vf70e4ifX9yvoYjBhMR3uw6sRbbaYSC5v7rF7bCachHr7y/oGqIxKAJjthSoWmTYj1XhHKfGCJWr9UXidAN0Uw7p1pwgPHE/4GldyiQJCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149380; c=relaxed/simple;
	bh=jStPYMXmFPqwTl0vq7UVe0m+/5Eqz8DD2z/KI52ZQo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TFdKr2Uy62GQpAhJJBZ6jqSNuReMvkIF05+tpS5UJsvAJCQPWm+bxFUau2YBL0jfzULjlFVyeWInuOUww9jHFPybUFaIwndyUN32Jy0R+d/oQZK3AmxtIWg8BGA0IoaX3qLq02tIFZ0H1MEkmjCzPoHnU3eM+1x9EnuLfWU39lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f02tkfDD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f02tkfDD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2282619a91.3
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149378; x=1785754178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=duRNht6et+Fl8R8XCxDZOkDs1DxWvcJnqfifU+vvHvo=;
        b=f02tkfDDpKqgEGNPDDV/XxWli5OS8mGfb64Gsy9fPnkzjXRihYjizmR1qi3/sTZ2QF
         BynxFDQFoPlBDAEJJUehun79o8QZbZ8M7GaTilwNHaa+X6VJoKJu051h1E27NDITkp02
         snsEKB72z9NGQKwj51aKrEIgMVdQt0i3DLTYYZvXqTLFBLqaq+3j81uGNRb8S9kf+2jI
         TPu+FEM/Izp9DTSJH6883gEyxhRwg0/ZoVFu5iK29uwLxGbz6lyZNIv4cVFCuDN1tyqj
         YrH1DTJwE3L2P6rM9lJ5aLrRin6Wuu6T2Mk/55+cKBTSGMFfC0PXcVrQj97Z3AuR8xMk
         peoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149378; x=1785754178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duRNht6et+Fl8R8XCxDZOkDs1DxWvcJnqfifU+vvHvo=;
        b=d1ecLlpb69aGSmg19Nhls9j46mksR6JQGe2DyM9LGugH/X1A6ff8VEdVSLlF7x2xCa
         rcGPbKg0XJnB3r+ZtIHdugupXuiknmzzS1L7MCovUPx1ye4BC6BvDmPhc3j+YTmIciPk
         izVBhzg9+eGmnb0r1CND67gme65R6MK0PtPCuoowABH7MfMH1WMd/6Tgu86GXcdM0gIQ
         QEPym9KqiSWMl8H1iG+ov5ZWt20hKpyjozHOc9Nv44ZG0+EOLsYfbRpHVvq/uk0Keiu2
         hMMm7jpraH3Ru2l0x9GfvHmeyK58U+xok3i+YMrPKzlY5nLBxl4R5ZQem3bOb4JBIxkQ
         /ChQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqevjae/NZmMheQjAfI4ocxzUqwHYowpZv9kq437v0S9fo+sn42Uzb9H1sducTmGOeUlOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkVqqag4e7dMF8AUredmsHwuWdWtBV4/3Icxkql0ALiN4VsBgc
	M9uJXt9DasE/E/w/qx4RsIpf17mJq2/FWkg+r3CHkti86zbR+dN6SuTq
X-Gm-Gg: AR+sD118h+3zjKeWRifV9aHXPYPbRxZxig5FzuQrRfyVtp57OgDoaNUm4jZkS7KcDWa
	ha8nO2lmFndxyk3oFiNRtBVfJ0RhBS3y/Q04eyqRsjRoKFrqHlYjoaQZETbj/4tqhI00josbK3o
	n2MbhkwI4r8FGJ5dpUrVl6YZLRPs/8YUm9BhkM1NU7sWNTiyULi4QMcpKa3C/y035UMMzO4JBYP
	CABPvzcvHPUHXiSC52laxVSwrryEUvk5ke3syMwvYaNV7dGJezk9rKUyUhvlLAdszHMa03WWUIW
	2MoBFOWT3QoRrwd8clw/DrJ832DoGxUdlCb/cdV1APJrZGXiQ8r5KZtwr0jkYePJpTZ60IbpJI+
	29EYTg+lWk/IplZO5kbvt5DAWqE0bXhJdZPHBWmYhaUAkqbRtYk9Gex65fW06b1mo4jLlf2IiU6
	9sERfdgB3TCYc0KHUdqy0=
X-Received: by 2002:a17:90b:554d:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-38f294ea1e4mr7649628a91.15.1785149378420;
        Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm31716481eec.19.2026.07.27.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:49:38 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error
Date: Mon, 27 Jul 2026 17:49:27 +0700
Message-Id: <20260727104927.520546-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_run() allocates an ipu_image_convert_run object and, on the
success path, hands it to the IPU image conversion core via
ipu_image_convert_queue(); the run object is then freed asynchronously
by the completion callback ipu_ic_pp_complete().

However, if ipu_image_convert_queue() fails, the core never takes
ownership of the run object and the completion callback is never
invoked. The "err" label finishes the mem2mem job and reports the
buffers as errored, but never frees the run object that was just
allocated, leaking it on every queue failure.

Free the run object in the error path. There is no risk of a double
free: the completion callback only runs after the object was
successfully queued, which is mutually exclusive with reaching the
error path. It is also safe for the earlier "goto err" on allocation
failure, since run is NULL there and kfree(NULL) is a no-op.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 00fcdd4d0487..359d973d297f 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -147,6 +147,7 @@ static void device_run(void *_ctx)
 	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	v4l2_m2m_job_finish(priv->m2m_dev, ctx->fh.m2m_ctx);
+	kfree(run);
 }
 
 /*
-- 
2.25.1

