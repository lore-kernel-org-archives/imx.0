Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA31E7660
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043246; cv=none; b=cEG6CfYPlX5KMNUPOj0is2AYdpUg2J1aNR0Ar/9ldvuGJXDqwVvO3abrjvtyEd5DN5uN5M/nNS0k51apTjtEWJF26p5i3bkt3wxaUdGY+quNDWSYoSp/Sr2U7eArPQzHN6Y6Ev7o/y5PcAU1iw83iwFnTdyXvQAL/DL5HISLBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043246; c=relaxed/simple;
	bh=KwTxzj8EU6mJ8ad9IUkHxV6TfA/e+UVoHR9+ftJvD74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PM/r8FXE09yVScttIUU3HD8LlbmhPnxvmmqA93OqzjCktqu88kq15Tb+tc3dprp5F30Xz4gHDw5i+DuSKBRf1jVfQ/UJY/DeRzKyJqNr9dhQ1kP2ataGbcke7ru4GRgC8uhNqPTYqtHu1d11Uzh6gdlpSqgYH4ZiT71ntnE/byI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJzW351k; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJzW351k"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso111608666b.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043242; x=1740648042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=QJzW351kinUit8fQzVTTmSZPD/jTRFjArZSOvrc6RFrH2BfX7GOaK0R2oQ6cBIVM4W
         jG4y+ab6uHbfAThfmQIPlDF574jqYg/ZBPCTy3/ty7wav3iVfQco8omoXaqmNxwqxosY
         L/dQnXqqS9hchXUbmOM5PZ/halt0sdPTxuL+aea6AHJa2c/AWS/eJwSBPMKvF/X0I02o
         DCJo4Opo2P3I9VAXiePp7lKDrTZcYFDelASILL30m4JQXihTNlxJnid2zSSS3QQzDjsc
         J5XCsKMsHpn7nwKbLhKKWuXLFhzNTxCQaUjhWXDA/Ff6ft3Ckc8Tvjxk06YaPDMPGwLq
         DGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043242; x=1740648042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJFLBjsE/w48uQWEE/sJf25WWFt47cr8Ziom4yxnO9I=;
        b=SlMDASgpY8HZRl1hVIbyi2Zv+nCk23rrbtvDC1s+sVLqPs8lO3n6pEmmGhXukcqG1/
         nWzMT7xPuNaCopLyT5+iPLGDiByCm9jdj77jLkjIhJ55wpqCskNYG3YIoM8iRjNLNj/e
         Mdax+cNI9BiTulG6nHaP/2oz4cm5FJRJBvU4cmKvLDYq2S34K/7B71seXKWzq+iCWLJL
         58FDElsfReDwhmw4MF9QrgN9XsMVgEXwaMvQBuFYYorvHSkXE3/IRm5Lm0//FeR/X67f
         ZUWig4MWoDHJu9z8lhvoj7AGGNjAHIN7qJne3lE8+JtCUoRIHaoFHzeBgNzSnEaGdtWe
         hLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGsERJhFTLftlvpw+OTYciHZP5wL7XMGg3vSiq4jUcqZ/J5LwtG21l+frfrxg90fltkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGKne9vHpHiesNE1Pif8EadIzrOZh9fghXvCw+HQIIoz5UVGwo
	hJbbQEtjV+ULh+xq5qQwZrw8qlfF3CgWwZDwIWesGsQkmUoLWVh6
X-Gm-Gg: ASbGncvaNJFXENtOt9pLposCRaP9xAX2FlTkomjLiZPsgAY9gzjqhpxfWJeKHwTP8KX
	jte80vx4rsUjE5f6uVDI68WUE2t8rV8tU7+LgZiE3ntRwlwAtmzI0SPhD5rR2xYoOIYYpCUfO3G
	UkWO0A+PnSXgyZqcGEMoGjKyUhnexigr8QF7S2w+V25KlMVfxpEj2F7+vshg5xksuBM7FyXXtYm
	IoEZnVKkIcEjh+dZGsTwyVkv73bfsxQJQTCLvJ2myTu6Yg5Kn5rsfdSAP1pMkdKmUIeJFYvzLGh
	yxgkHkhIFxwbN+ErIcPeoS7DKVNe
X-Google-Smtp-Source: AGHT+IFH77Toh5BLoa/DoGQILLeWN9qsNu4stk384IN/rlsikDaMIRUYzdJmJUURfmK0ptNDuRXjEA==
X-Received: by 2002:a17:907:930a:b0:ab7:e7c5:b373 with SMTP id a640c23a62f3a-abb70e3b378mr2010338266b.55.1740043241671;
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:41 -0800 (PST)
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
Subject: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:32 +0200
Message-ID: <20250220092036.6757-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Convert all usages of v4l2_subdev_state_xlate_streams() to
v4l2_subdev_routing_xlate_streams().

Remove v4l2_subdev_state_xlate_streams().

V2:
  * Fix description of parameters

Cosmin Tanislav (3):
  media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
  media: use v4l2_subdev_routing_xlate_streams()
  media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()

 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
 include/media/v4l2-subdev.h                   | 10 ++++----
 8 files changed, 53 insertions(+), 47 deletions(-)

-- 
2.48.1

