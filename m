Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044521ADAB
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992317; cv=none; b=B47swkgz6CEe/MbR+B7KL0Vf7gwHbgIKdDf9LPO79I1XKdiRUddp3lIeELUwDO766seqIW+EzDX10KhyziAUcoHCzDhZBgGFVIvJdVqNCZu+UuskhdPnaN6JpBTWt7Uf5NSDtAOdFiBL16ThGB437OPiJO/aE5k8embYlGUkeq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992317; c=relaxed/simple;
	bh=jmA5+mv7y4YYnczHfeTR7YA2lkIzoroaa+RiRkCmeVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMLGPFoTJoEoHPtwV4HSlSvd0a7eS6hxxgFV8RfC2ccPymcBqJckkpJzkLwi315Kv0SNM98eCSxlKH56+0OkEuuFEpiPCaSoXPBrsCljmZ9vRkeut23TTxPNem8Uvu8+lNVvbWYBQs5njPJjR+guTbmv1trdLPRLb3ZZzDOSqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G37noaPG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G37noaPG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb90f68f8cso32406766b.3
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992313; x=1740597113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=G37noaPGXXBXG/HzYM7r9nF1G26+W6zZ6qXxkpi38ZsGTwDeQ4M7ORQV65Ta7N8cM6
         SazTcpDIRxDkAjX58Etco1WB+qIcKUzRW3AiuB4RmALd7DGM6VCq6geHL1q+MFzWMHDz
         LhO7FSkC+8Xyixzm3m0nvAG/zfr++RAW9cZ/ThJqLRIMFHNzRa4yN3jXyedPwilANW2Z
         WfgVA1ht5/M3JnRqwkiAm++WykvNzsNHwOM59FbOEADuMbjGu2gPyWPDG5GKYuQemsj+
         c5Gz4TnTdqe784qNH2pLvNCBXYmVqKO15PNpyxJjGwAkHEk9Iib4vEifr0HW8ps4cW5L
         nQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992313; x=1740597113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeWqo1HnQdE3Xew6TBWIe5frodF2RFwVLBqIU5l9vVU=;
        b=C1oeMHmAxelpuf9eX7fdVD/qzbGVrx6fg0zc4X3IpxokSfwhI6qL1bAFwgQPkir1RT
         KvSoPgpe5CGbKMETTF8Xco3Y3WYb0dxVKGZMCWNvpT2p/0xdkgUL1a2iZfylDzUC4Dzv
         p2qexTR2YPmv3IDFflUaLnxpwuIfcavvRnQO9d6ZvvryM832XdPxhJdS9Wxeyxa5Tvhx
         dUUAbxECDD/SvkHNJdCKeqaRBTFxkG5Q3eB2oX131v+td2d2GQSYjvYSvrNekbZO+z6V
         H1PpuN403b1wwx2XJsz8vV2ohXvWMNtvfTZxvtgO2+7UdIm1fPOT1Lbib+QqEN2vJ7dv
         uq2A==
X-Forwarded-Encrypted: i=1; AJvYcCURmp6ryiC5UUj6BfqVngTrDbHiyRYzfbsjRX1SdvEM40LSe6kRnXXgGeIw8kBOwLiCRA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnhEn5wB8B7NgFUQFpskHV2/CtmjHJ61uJXEI4cvLmFZpGynT2
	YMascBINQDGV3RpT/uE22X41hL5w2Zttx6RqXnMIV6FxRBj+UkU7
X-Gm-Gg: ASbGncuCIv+pwpbBGwHoHocNqKE5SjT+b6WcJwJQr0q6E1GwP9flIy83I29pUn4s37g
	PJbZDSmYq1mMbOPSxLHvyJi8omcHcPKUFCsYShADxPjpyNEqs4TBFnbM/k6fGKWKoLKFozjoRMM
	0Sfr9DeL03vyO2qfMzUklw+oo6W4w8OUqX29FEYjGEUtOXEEvEI4spTXTrIrF4SHjzvodbbr6/i
	n1jRXw823p6pTincWUUcgMWo8PwOGNbFWyullsIgYKl1Iyljh4VxULhO3ARyBWpBY3fornzvzRN
	JD+KinLLKSoyX8L5DoCDGivAQkoX
X-Google-Smtp-Source: AGHT+IEIElAhIncM7Zr/Vqckj3vDoXiYUCL9ogHbzv7UIans32TGHh2oeqc5N+BExx1k+LESN0G7ig==
X-Received: by 2002:a17:906:315b:b0:ab7:d179:249a with SMTP id a640c23a62f3a-abb70b1e782mr1529786166b.15.1739992313056;
        Wed, 19 Feb 2025 11:11:53 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe0d39f9csm127767866b.69.2025.02.19.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 11:11:52 -0800 (PST)
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
Subject: [PATCH 2/3] media: use v4l2_subdev_routing_xlate_streams()
Date: Wed, 19 Feb 2025 21:11:31 +0200
Message-ID: <20250219191136.215151-3-demonsingur@gmail.com>
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
index 051898ce53f43..c39c15709a170 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -360,9 +360,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -390,9 +391,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
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

