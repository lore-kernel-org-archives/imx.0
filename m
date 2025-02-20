Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B02673B9
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 23:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092935; cv=none; b=MIclYXQkRduwuiUh0g+3E+Sgm4MMbkhO1HVESWf7qtD084MDTnhKfM9fPfYjgsIB6+3dsCCU8GX4OMa0/bite4NQlRSud0fwQda7uwZ4lomLE0qFkcEgoUkNVWfwbcaKUcirblVSzZvov/3bF2NuGq3V1UrKgnmmA8IaSR2Clug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092935; c=relaxed/simple;
	bh=c2oJdhEAPkgZHieAm+Hz9dCi2VAJ3Im9nKjJmOfI5T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZKinQp4c2v4RpHcd2MruwOKMfrFbwDHZJ/N/vy/z2IU3Rmk7aTjZ/Hu8SFXl61eJ3n7MJmBV46J90EsvTFw9NSnFshEFXRLsYCB90k+zODcAwfaa+l/BeBoxvcAlLC4TRXduwzoWFjA8IvwbpvjEJqHcoFCg+/BLoofx468z6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0BajZ8u; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0BajZ8u"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so2751060a12.2
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092932; x=1740697732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=l0BajZ8u5H/ZqWw73c0GdgtnjbbKlIx9MtxW5YaJb9pjjX95ISU+S6r4Po7fM7VK2d
         +hZtHEWLeUF8LFrEmkjA9NIo8JjLRgzz2HA0CXsKIteQtak38/UjOidVe7h2ZVzSH6Pu
         DRPLwMQhvKP6GAO+kPdRsFu7AS1k6LupgaOuOQMoQM7x69Skr0SzzGCg44sg5gWF79Wr
         ypRtcZyU+2Oacmr7JaRLgj5snhwKKaTyOoAjVNqQxgCFO4KyJwmvLF6ZnO+J40Ghr5py
         bELS4IfsCdOGgF4+erVvOK0S62qidSLvBF4mVpafM2iM9uxVfbTqf6HMD/MTCE7dhIbi
         Wxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092932; x=1740697732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=Ch0/3WvxHKHaacXfHESTHRVFafrw2lXAFafkODWxWf/50aOjLzBFTKqKD7BGE6JvFA
         rtGKS/JDzfyFmGTMwfSV5B8ByedKAYl6l86dB2vllzcv345naqj2tDzqJG9CkrL/2t9Z
         t7qWmCtF283udvtN+THagUYk8C7AMKWo0aerqRFi4+qFChsZHaUA25exjnV1LbrmaSWP
         Jp/Tc3pbotAytxmbaSLkYNHkpSnzEw1verOHbGiKTESqi0dTwza81VQIFmQzOa33zvTB
         UdwC74Cp4UM+bkiPlSLbKqVIa9bssMSfex/uN5CvfF8LckRurzfXy8LtqaN5aH1Vm4Jx
         PlTw==
X-Forwarded-Encrypted: i=1; AJvYcCU00eg0vlI5XpVfzsb1tLY6qZgakEXZzEt/lPFmPuVryfsS32QZppJ95XMEWkiX7ViucH4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5CRGExCJJ4IK/bQvSkl2yf5oXZDcO050oM9tGBGDxC4Ca5Oib
	2u4Wv2tipEt7id8Z+MpdSCzzIOLXZvMmkn9tpt0YmpjeOzUyiyYu
X-Gm-Gg: ASbGnctRa26yuhMdKBErr/19sYjRJ6S1yhY5L0waHmnFQcS8MLUEEh2HRcEFE9aYgcf
	o1yy51TCNMp2c4JGXY5RT+zp9SKQ7ClSxPoS9ZeOn7Ohkt+Y4eFqN1RgkV3rwJcHtti8BNQgj7I
	uezwSlZgPsH2sBBMVe6YN+r28OhGN9LXgykF1EbTFIRBbVBc2Jx1rn2H2kqrXLh4EO58Z0TW7he
	VtVUZylpkWxePxsOMhSot/IewcXgMrw2op6neG8foa2FdClC9A7abpRWvHrYtkW/OsoVSpkPfoU
	TgfApxcsrH4yMYJawqNfIGm4ugkH
X-Google-Smtp-Source: AGHT+IFfE/1JdGnfUcNxpjJHL3/DYWaNKaOhzV3vJxEUOthUy2riBK/uCS6Yxc/sSSL3TdBg0rq7Nw==
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-abc0de19516mr43067066b.40.1740092932201;
        Thu, 20 Feb 2025 15:08:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:51 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Fri, 21 Feb 2025 01:08:13 +0200
Message-ID: <20250220230818.275262-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ad1965a91ae3c..4c4ebe54f191b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -990,6 +991,28 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -1000,6 +1023,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.48.1

