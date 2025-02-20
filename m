Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569721EEA37
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043250; cv=none; b=XGcF9fGKA/vq1XfrqqljoHf/PuTgdbIihyDuZZCYui5Z0ikwU2SdTVYHR5+//3N/j9l2ZdbIeFE2aEdgOngp5205UIx/66jMo1aio0bQ8krU+7N8SnDaZKdVa+taRz1BOF9iCw5/sylGigXPJwweb5h6YAoJsK8ziVez7db25S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043250; c=relaxed/simple;
	bh=w4d0D4WVsIinUPHtArcYQiWglj6W0S5nl0XEwnm4vjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+sut9mfSZFIIXxVXQPCa6G61GgJGkoX1vb+QODzBdafhY1GmzirCYn5Z4eOY3kKxzfILJ2z1Ng6c1Y1T40XnFpMXSwaDFBCs4Msw+XOCbrLWMPTBddhtVTuR1YvkgGfQspd7Pr3vMXwNhJKe/ScUXaLc7utaqHzJkzZjfOcsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1BpYkDa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1BpYkDa"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso3228866a12.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043246; x=1740648046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9t5ETeu0PXD9T03gr3t0rpnaMSHCppSAmRkHp3tbNs=;
        b=S1BpYkDaj+4alHoLrwLHZLJvSSd1QiZvNh6BJwhta8twg086abn8GGNIaBanNEh5Lr
         XgCUkRcX0gQH6ImO2a+wAwoGFCkJZWO4z75JZYYgYfZlRXZQeBkgecaTQyJRfQr3Dr2p
         AOKPUGt9Kfjw/Ioj06mhmw84Lt3b0L5aWBdMqFQ/vxYRS5aLUpOjFyBAtBQ+a9UybGCI
         BlZoXD6rIl+K95O7AV/ZN4G2tTAMYZdXXrzgCEiu4ZTxp6IlThJ2DKiw9vPhbmV7U17l
         9LnDCGsPq625ZdB+Lz1qwMLW4nfjpgnRJEsQmk8VeKWcfKDFP+xZG83mBSzG0aznYHju
         xdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043246; x=1740648046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9t5ETeu0PXD9T03gr3t0rpnaMSHCppSAmRkHp3tbNs=;
        b=qXM7FCHJnWGiZ6U1evyJt2qsd6R3okGlDDKY/IxbfeDDzvMpGYHHOBYIB7GtWTSa4x
         5gltATVhqheL4DeRAjF6WZRB7KNq/FSR4N0OfVhXi9JHT1knlRnGK/YvtqhjwTVDYp0v
         gzq7EXg7ifPinNZSUY5RQUkIGUsry9l073nji7C5bhtQgAon4Lr0J07+jQYjjHs6zv1y
         jl7PtEvv/dXJ41OSDCS4n/FdMfMS8QrobwqJJxgKQOph37LXyDyHkqrf6H96bD/rob4/
         6JYurlp19bXtFMmoD3m/8XsJAS/+V01Utjmg7TrS3VHYll1TVhoN5saZaAasxQanV4P6
         36IA==
X-Forwarded-Encrypted: i=1; AJvYcCX/LWAmcmJvc+t9bd2dATX5QgO/vqklfIGwITgzzbWfnjfTz86XrZCQvUKIpEgKwYG1qck=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN1SPKiCgxZZ+B0xfI2JjSvo5Z2X4+1kF3+uoqRk1e1Fz6Zoyw
	3xXGA/ggVXs+yZLEVg9EZ4KTQhoSb4LWUUjrHkzkLspA2MA6PISr
X-Gm-Gg: ASbGncsewqdKBBTos5amHsxBWtHmD83c2nenrV+JuIODqqD9Ufte9O3UGs1IqPWqGVQ
	z1pkECp5wj4p3F6HcCUZcsf2ZPQ8+tKfN1vYoP5j66w41XJF3UVng+vwI4LneBk6OTTulDrdbtr
	D8uomJPQYD0siQ6VeYObYY2VdEYnLuRAVlKTgYfdhS3V+IbAHTVYqZqi8UrB49zbjobJkcVkXgX
	l3WmZSddJkR1hwedCxT9+iMlDpqGIcuOyVr3ZLDUAHSMzJsJyD6i22M64hseLlnmmqn/dZscfei
	9bVWmWgaAJlqpcFMG7l80S8p248j
X-Google-Smtp-Source: AGHT+IEE28wc+KTqMadXPz0HUq5xegTrNkJUOB+B0TPRfEXrPgPkWCab8fU38OLa/faZdXdJ85ieJg==
X-Received: by 2002:a17:907:c48f:b0:ab7:b9b5:60ff with SMTP id a640c23a62f3a-abbedd31efbmr244293866b.2.1740043245586;
        Thu, 20 Feb 2025 01:20:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba358ec3asm665574866b.35.2025.02.20.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:45 -0800 (PST)
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
Subject: [PATCH v2 2/3] media: use v4l2_subdev_routing_xlate_streams()
Date: Thu, 20 Feb 2025 11:20:34 +0200
Message-ID: <20250220092036.6757-3-demonsingur@gmail.com>
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

Replace current usages of v4l2_subdev_state_xlate_streams() with
v4l2_subdev_routing_xlate_streams() in preperations for the removal of
v4l2_subdev_state_xlate_streams().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
 drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
 drivers/media/i2c/max96714.c                  | 16 ++++++-------
 drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
 6 files changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bfb..b8dfcf730baa2 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -252,9 +252,10 @@ static int ub913_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -274,9 +275,10 @@ static int ub913_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB913_PAD_SOURCE,
-						       UB913_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB913_PAD_SOURCE,
+							 UB913_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332d..c239ede968423 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -683,9 +683,10 @@ static int ub953_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
 					 sink_streams);
@@ -705,9 +706,10 @@ static int ub953_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 UB953_PAD_SOURCE,
+							 UB953_PAD_SINK,
+							 &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
 					  sink_streams);
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777c..c982bca708ff5 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -272,10 +272,10 @@ static int max96714_enable_streams(struct v4l2_subdev *sd,
 		}
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->rxport.source.sd,
 						 priv->rxport.source.pad,
@@ -306,10 +306,10 @@ static int max96714_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96714_PAD_SOURCE,
+							  MAX96714_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->rxport.source.sd,
 						  priv->rxport.source.pad,
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 9259d58ba734e..e18b07b3259c1 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -446,9 +446,10 @@ static int max96717_set_fmt(struct v4l2_subdev *sd,
 
 	stream_source_mask = BIT(format->stream);
 
-	return v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
-					       MAX96717_PAD_SINK,
-					       &stream_source_mask);
+	return v4l2_subdev_routing_xlate_streams(&state->routing,
+						 MAX96717_PAD_SOURCE,
+						 MAX96717_PAD_SINK,
+						 &stream_source_mask);
 }
 
 static int max96717_init_state(struct v4l2_subdev *sd,
@@ -508,10 +509,10 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 
 	if (!priv->pattern) {
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_enable_streams(priv->source_sd,
 						 priv->source_sd_pad,
@@ -551,10 +552,10 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
 		int ret;
 
 		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
+			v4l2_subdev_routing_xlate_streams(&state->routing,
+							  MAX96717_PAD_SOURCE,
+							  MAX96717_PAD_SINK,
+							  &streams_mask);
 
 		ret = v4l2_subdev_disable_streams(priv->source_sd,
 						  priv->source_sd_pad,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index da8581a37e220..31fcf1695cb7c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -354,9 +354,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
@@ -384,9 +385,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct media_pad *remote_pad;
 	u64 sink_streams;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
-						       CSI2_PAD_SINK,
-						       &streams_mask);
+	sink_streams = v4l2_subdev_routing_xlate_streams(&state->routing,
+							 CSI2_PAD_SRC,
+							 CSI2_PAD_SINK,
+							 &streams_mask);
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..8f61145435e32 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -141,7 +141,7 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	 * routing table are guaranteed to have the same sink pad.
 	 *
 	 * TODO: This is likely worth a helper function, it could perhaps be
-	 * supported by v4l2_subdev_state_xlate_streams() with pad1 set to -1.
+	 * supported by v4l2_subdev_routing_xlate_streams() with pad1 set to -1.
 	 */
 	for_each_active_route(&state->routing, route) {
 		if (route->source_pad != source_pad ||
-- 
2.48.1

