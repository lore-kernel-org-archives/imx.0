Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7D21B180
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992309; cv=none; b=sby8vuNqb+zct9IfO5WmVLhIAJkYG9G5/bLVnJLqsGMowGWV0IpdaFPbtEDsSKrg21RHPTEln6G+3df0B6CogT/6uTfMmql+PP9W9B+9KMQdfG3UAR601ANLak8Y66We6i81BFIzcNW82d3jQHCXPJWLuXnh7pFjRkRtnBrNfJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992309; c=relaxed/simple;
	bh=CxD10gBKhnBlBboDKHEiIi7FSS2bsuepkGgdDzeKRqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9Ps7G0+z7TFKbDdoQkBILXdXxbFvjh31V4XkiaSXsNT58pLD86lM1Nn8bfuC0AFHP3C1FmRLH34HfDXLop9nBcX5AL8VeJwT3E3JT7ePOQRDx0ZM+vAqnWbTPLDx+tAh4M1kYngVm6DJA4h6dojRWVIrLU+gBtaZM5i6atdiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYI4pZTZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYI4pZTZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb9709b5b5so31191066b.2
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992306; x=1740597106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=UYI4pZTZ63G//oPzLX56Vqar+4AFIbWrG1IwOaMXmRanbT8lx577BIR6hLoOCSpcP6
         cySwdaffWxK/j6n/fkSQfF+rqYAxz/HxV7VrgGpuIDcHAEDy1RCH5sEgy0SA+MEYsa5W
         0VrLtqsuBC+5d43iRmFhqSbapYLLWtXL4ESur7x4wHpgfJZ/dUShOODfGrQQ0CHN70XV
         dKigaJxhbgsYcEI2KpfbECeY5JbQO18+i72A4YmG18itGyYuGhthbfsSU76C3JeUhJtl
         jzxfb7CR1wexe3bARzdTHZ4JFAvjPHQf4jbBFt4//8BrdB9DOQW9m1+L72ACNW5hO15h
         IdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992306; x=1740597106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a262ZEBhq3D29Ca0JPQXcyDvoWYFO8pQujf9qH9htLg=;
        b=FSkXlQDxgupGhwM9nreZW4E8UCY1r3xgEGFdq06ziHFMRHtHf5evXSyGYerNe5eWzv
         zDF3Yplzcy+gDIgX0YxnHPPkwjv8/cbJjsCkoUZP4E/lfnU88LnSGAtaDyAyEX8o1rex
         w/WPC8Z7GUM2mv/OJiEfabE5Y2mKjIK7V10gt5Bt1DZstuH51Br9HJoPatenKi1IVRRC
         fJoXtxb9tlhInwh2andseQoF1LoFNjmjkOE+YvNeoJ2hMUhB/XCeLOkvhazcF7WbNMiG
         t1TDIubG/pdKp+piMbRfXEQOrwh4vFbOq+bFRWtiwJVq9dIp33W1aZAs4ift/pc1tHUB
         oV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaW9HYJT2elcyEcPHtHXjLqvoYI/UDFPmEwBvuEnubPFS07uOiw0twQQdGJ9ZCj7OWdWM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw98Y689mYAgzs+vh+QxU2QA/CTacE04UViWRizqN4/8SsBBOH3
	dE4g5dRfob4C/uad7w4G5IpYCkIKys2lGf0AjOAC25YRJxi0kSzG
X-Gm-Gg: ASbGncsWIq1UlSqds7MiEa3rXGAydDlKdSYGWOUPTSrMset1PbCq+B78xshye9kSQqK
	OdO6CJN+0joaz4w0W0QbEB+mmyXCOrQRTypkLXFbxVev0qYBOw7XURFlfZXxNhitzoxTSNKFMvY
	drayB+PNhweONwi6G0gbTv33pMcZnCUcMYqtTcuKgF0h75AIZsjXTEVIVDbVkhFnWaUYI21Tjls
	uAv7PK/qvdXjwctwaMkU6KenGOhaTlH46X9l7FwAuBZOoND2TM/ELMABXiXgLXjIxR4ryac2LPG
	ZHu2H5+MT0LdhMLtDr9HVCyj35SH
X-Google-Smtp-Source: AGHT+IGt33FKjogW2MeCmEg4l06p7Iw7k+Kx5sL28n3odtsZTl47FrANkRpgYS+18doFVosGl8reHA==
X-Received: by 2002:a17:907:2da0:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-abb71159ef2mr2192693566b.37.1739992305822;
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:45 -0800 (PST)
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
Subject: [PATCH 1/3] media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:30 +0200
Message-ID: <20250219191136.215151-2-demonsingur@gmail.com>
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
 include/media/v4l2-subdev.h           | 18 ++++++++++++++++--
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cde1774c9098d..d1581f1036487 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2042,10 +2042,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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
@@ -2066,6 +2065,13 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
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
index 2f2200875b038..90d08e13e016b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1582,9 +1582,9 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
 /**
- * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ * v4l2_subdev_routing_xlate_streams() - Translate streams from one pad to another
  *
- * @state: Subdevice state
+ * @state: Routing used to translate streams from one pad to another
  * @pad0: The first pad
  * @pad1: The second pad
  * @streams: Streams bitmask on the first pad
@@ -1601,6 +1601,20 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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

