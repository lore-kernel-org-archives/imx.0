Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C61EDA0B
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043247; cv=none; b=gU0lXIfcUqlhD1SsHFiqmbvwXCvSKvWlqMRDHcXihphXOCRvOzFpMd2lLKYzsmXiUtCi/7YEhqBs7iqJb3rdgXSzp5zPk4TDXgHAGQJh27R/cdaj321yoAllyBxRATBBlG+zZQ3eOlI7ljLbpyWP2CEnU74Cowkl4AjWijAoATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043247; c=relaxed/simple;
	bh=BshHmlA8ttxolsOurdqseo8CCumiC32LYbngrBvTgbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5ccpKiohzv4pziDMdwvbtn30fyRII+/i+NDMf6bi0lVv56zmSxEIl7TNNrqXfqmgML1Se0L+C62qbd4ivLBRLunZp17j/N3tqpNTly1FWgpjG7sBnLJ/Ctv43CgRvYL96r/NEd94h0IWl3kbLSkL+hJ5JFDzgcN/5P/UHx4IWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/T5HhzN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/T5HhzN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so924736a12.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043244; x=1740648044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=F/T5HhzN1YblWOSPqB6iH3VSAg6Ffm/KTUVx+zpkE0moLCr+gmoNBDiHwB4PIuY5yo
         vXDxYilQm30AOdzEzlfrnJYZkdXFmWN1YVjwnfMtGUv6isoaCXqmp91lTwU2qEEaInSP
         0Jv8g2mWINrX4RhM9QDnf2e2pKei91MubQ0x5D2cesYxl2JKVu6YRJLY+Bnjs8Svwmc1
         jysDrh24zPBuGP9v3nnZS/Sb9M7dGgh6JeGe7IxZd0qYKYt2ex3yB7drl6YwGI+Nw3BK
         yG9Y+kMZTV3676+xm0NeiKJTTZcKSKKUpg5gnuNEAJWQcKfmUkpPQNUKQilv4p8WJFg0
         JGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043244; x=1740648044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhrXKQcf4GiiAnwrWHJFmicl2O1JAWaNA8sd6GgkbRA=;
        b=ihPZzHR8kt9VPeGemhKpo9h3UfFii5/nAGibW7drtIPf3BC9RmIPCVwmpFC1O4pw2X
         lNuv2jVCBxdiqZSPRloyhMQsoW+J3eL8KMDhXQJUukF5UvVToMFl7jVGbQ2ga2LClu1f
         C8yeQn0U6p2MNOqMoQUlvVZrf9lyqKjU2vUoV+bu9+s8M0VLZplMFgu5puBU9B5RjsVc
         iIzajZWbP8y5HFP4GYlvW+08Ih+P2X5ipp2LzVmM5PU9TcLGFjuIFxtl4dOtOJ2rccpD
         UN1yiHS+LDNLf/RJ/uTYBEWvQM6K8aJX3TySNN2NRVYmgAjuKa4h1QWucQc900SiHjPF
         JoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUkUW/nY2Cr5mAmmoJooHA7pDSu4Ul9IdROdUorXjbbYlRGV/Jxveyb9btokgoAHBZN+s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIR4R4egd/tLnShXiZoq3CKPd4UaStcqCxIpJgKWGR+a/y13Tx
	EhwxIRt52Ujdv8lx0XqkP/nWkbCV9Bfzr43LmkJjm201TiKcePVv
X-Gm-Gg: ASbGncumH9RUwsqce8E0DCSGOCIeL0IcLoHBhguEucbE9JfhKcZLToaWb4Guz+ZKJ+V
	/c42gdBJahmnDhNYjYZMZdkSyCzrbq/t7RVul2teGxGu/DjhdeW6dLJTjVzY1P0ERAN0dNWfnZs
	CRqUplbykr+zgFRALKajy9Y/efIC4Wz2M1jGdA/gmkm8NAha7Q+ycEG+ZL+UfsgA1kXZ/6OFyMm
	H2YjXdCUaV7E5i7ZQociBtvqKnaLnksuheKNxjfE4xWiGZrcIzX20K96LxyE68crukftpJh+KK7
	uPDh8Fay2VE8CFzm/LZ1OxC72r7e
X-Google-Smtp-Source: AGHT+IGELBAVHlT1FsAwAPLAfs/8eHa7w1H1BXAuCz31GVyau0LU+/O4GL+wfZn7+PcEvnxYdppSug==
X-Received: by 2002:a05:6402:1ecd:b0:5df:6a:54ea with SMTP id 4fb4d7f45d1cf-5e03602f764mr55679741a12.11.1740043243699;
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:43 -0800 (PST)
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
Subject: [PATCH v2 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:33 +0200
Message-ID: <20250220092036.6757-2-demonsingur@gmail.com>
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

Currently, the v4l2_subdev_state_xlate_streams() function is used
to translate streams from one pad to another.
This function takes the entire subdev state as argument, but only makes
use of the routing.

Introduce a v4l2_subdev_routing_xlate_streams() function which can be
used without the entire subdev state, to avoid passing the entire state
around when not needed.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++++---
 include/media/v4l2-subdev.h           | 20 +++++++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b150..91fa51259237e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2044,10 +2044,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
-u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
-				    u32 pad0, u32 pad1, u64 *streams)
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams)
 {
-	const struct v4l2_subdev_krouting *routing = &state->routing;
 	struct v4l2_subdev_route *route;
 	u64 streams0 = 0;
 	u64 streams1 = 0;
@@ -2068,6 +2067,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 	*streams = streams0;
 	return streams1;
 }
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_xlate_streams);
+
+u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
+				    u32 pad0, u32 pad1, u64 *streams)
+{
+	return v4l2_subdev_routing_xlate_streams(&state->routing, pad0, pad1, streams);
+}
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
 
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16c..e49dba3c59bd6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1584,9 +1584,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @routing: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1595,7 +1595,7 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  * the subdev state routing table. Stream numbers don't necessarily match on
  * the sink and source side of a route. This function translates stream numbers
  * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
- * on @pad1 using the routing table from the @state. It returns the stream mask
+ * on @pad1 using the routing table from @routing. It returns the stream mask
  * on @pad1, and updates @streams with the streams that have been found in the
  * routing table.
  *
@@ -1603,6 +1603,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
  *
  * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
  */
+u64 v4l2_subdev_routing_xlate_streams(const struct v4l2_subdev_krouting *routing,
+				      u32 pad0, u32 pad1, u64 *streams);
+
+/**
+ * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ *
+ * @state: Subdevice state
+ * @pad0: The first pad
+ * @pad1: The second pad
+ * @streams: Streams bitmask on the first pad
+ *
+ * This is the same as v4l2_subdev_routing_xlate_streams, but takes subdevice
+ * state as parameter
+ */
 u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
 				    u32 pad0, u32 pad1, u64 *streams);
 
-- 
2.48.1

