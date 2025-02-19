Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548C21CC41
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992319; cv=none; b=e3KDs9JC5rvHLRXx24JgeNiY5pwYqfgwQTmjp44LvnBFGrlMmlCu8cAi8vVp5k4EWoIZp/dfYGJnoZ84HLjlQvulV+wef6Yf6Q+WlWqruemy0Hl96mhMoOC0V1mwduxWu2v2If85PanulL80Q9pXbQLQQPjkqtu3d7tImnWu/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992319; c=relaxed/simple;
	bh=2qxO7sp4fQZHW4yc/WU6++oB4+ROKixIPdfhd+lJVwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPQe6ipPVsbv0cqdA3tlgSoM8tmlYktaT5ELcDbeIk5RajxF9Q10VatCt3HwDRdAnVoY04tDWMl2wFgN4Nl5RT53lQhUwuhtxBGcbFdSfO3eGW+2qi4xA+209Yk5FaMg8PAuJaf5qKfsj5hDdq2Qhckv9fFO1crzp1EupPLxgic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQMaaL29; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQMaaL29"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso32958266b.0
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992316; x=1740597116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=LQMaaL29jI5apt9WRLOzM1XfTjIKinZIb9NRaJsnohJoTpuD079UqF0tK6HybB0Xk2
         s5WTdMHXynw5dIpeGwSiT34pLkkzBURaiTJCqo1mSwVq+wMADoBwatneJFI3qoBIC+iF
         4qmPjDk12VbdYD648a6AmhP5RJW3Y2xNUhUhQCiUfY4CdkRwvgNceyqzgHdqA87DBAEj
         mXOtdBvTDQ3WLzYub4o5h9MryrmTfNWAFt3pyxh64UgjZZj+ETH7NCtuOYILCRNEFdON
         EghBToEwvhHOF56+eKO86i3mXlLN7TCWAA8uBU47ojU6UUKoau9iU+7W0ePSrW9OrFRd
         VdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992316; x=1740597116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwHvox6WJGQYQEIxf5WT1th5ef4Nf6RAE7x7WQqDiYU=;
        b=tntdPTSeQRBzsgo2d7vElit2dpb2EjI8o96KOmHC/1TL8fJhjkZqBHRcSyZvP2WEpf
         NTUhQG9Jx59EyZ/l//D9z++yH6EiZd/nJBLNoQ5KRwBLIlkjNRO7DZ17OXfiHUECQTbO
         ALlZiRMQXTDK7lmZ9ovOItu6l/3FZSvtoqprKAITT/jjBu0lg+a2L6cITar8nbpEt4Xx
         5ShTYmuez8JvBhnZtLkUidxSUuM+RZhEq3F+anfKeMnz9L8BMF8NK2TjWkLSE/vhhsEJ
         0CjwWhLIoS/EWPmHBfB3EGydgYofZPJvqpntiZmHQmgC7x/vudDwdC1GuEnVZCNPymzD
         Dh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUa5EvzBd9GpnT2ZUrDV9qlmRd36WYspDq6qPoH9SOVC8j/B3jbmTgoAbat7YmewqcmbDM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJjo7zeBnZSkH2YG1Z8fzPcOL6HV5fbO+JTU/BL/stmOD8kc8l
	6yIo6cWs3VMfH9GuOGOTKt48aUf5AJbEg2ia+fYciMEvSqGVO4mR
X-Gm-Gg: ASbGncvoQopuz0xP0quvCtrpx669pssh5KmkROGl4Uwh5MYPLYc8VqbU3yWwveBR5Cx
	VT/wPrXpxqXJ5OGh3cXwzrbtPBHgJQdTBGjZCM1wamFN+o0RuNgo0Pe3dpxLGiJRdXmYzMdz5kF
	e6FJxOQxZ7ChATx9mtL0JjWJ90cqcGUG2S3nxjZ03sJcivotkLtUxkAEexj3uL/jnGHHgZrglGN
	yqs9ADKdh31mdCFjIdt2FtqznUJA5GoKxUJhUMvwqBtOoQvg4Wybr9HEXgqp9YkGaj/54PnA5QN
	Tzkh2eaKkX3M9qpA2FVSjDPvbti0
X-Google-Smtp-Source: AGHT+IFyOBwXGTpSYagOOpkWDMhkVuORfStvj5grnxd98RQN2N6gtL61zwIr20Bcm+RaMlN8QO+yKQ==
X-Received: by 2002:a17:907:7815:b0:ab7:d06d:b4bf with SMTP id a640c23a62f3a-abbcd059bf2mr461138366b.39.1739992315757;
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:55 -0800 (PST)
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
Subject: [PATCH 3/3] media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:32 +0200
Message-ID: <20250219191136.215151-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219191136.215151-1-demonsingur@gmail.com>
References: <20250219191136.215151-1-demonsingur@gmail.com>
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
index d1581f1036487..1fb413bb337a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2067,13 +2067,6 @@ u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing
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
index 90d08e13e016b..3781d6d8465bd 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1604,20 +1604,6 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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

