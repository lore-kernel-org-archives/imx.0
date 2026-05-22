Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6213C9897
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445040; cv=none; b=Po5IHgui9v1AMhMqnyohFbA1D4QC3ff0ri52Eisg7nxSgAYrxlzOLzgg7064GJ7iF/M/cLV0WgpGrRJTroBsuX7spj42rxs4M6Q/knfF0NNDHiHNl3lIEsCAtaaKz4KJedEuhqdlsPzU1pXwlKKhgz+UeDWWpy3XsUoN/NERlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445040; c=relaxed/simple;
	bh=80baj4TeVCgqH2CoVHmRTCPvO8AbfrVTjiBdQikLsGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2X65jYAJ8xuZevMkT+Hhii8J3j+ikhDiF1gKhOaCuzBh0CvXnbeXTrAZFmGvGV5riDc0kqWhvlW9JWrntV++DHM7rL1LzKZvMYpsfLzknFjTEYHS12xG7gqmj/a19QudNQfAJtnR+mszgMzuoip22Rb1XCVesRmYzjQjc108Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E73A63700290
	for <imx@lists.linux.dev>; Fri, 22 May 2026 10:17:07 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 78B52B408CF; Fri, 22 May 2026 10:17:07 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id C43FAB408C9;
	Fri, 22 May 2026 10:16:56 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 01/14] media: h264: Add a more generic reflist builder init
Date: Fri, 22 May 2026 12:16:40 +0200
Message-ID: <20260522101653.2565125-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should become part of a larger reflist builder rework.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-h264.c | 69 +++++++++++++++++++++++++++++
 include/media/v4l2-h264.h           |  7 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index c00197d095e7..4e5a177ca2c7 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -105,6 +105,75 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
 
+void
+v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
+		const struct v4l2_ctrl_h264_sps *sps,
+		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
+		unsigned int pic_order_count, unsigned int frame_num, unsigned int fields)
+{
+	int cur_frame_num, max_frame_num;
+	unsigned int i;
+
+	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
+	cur_frame_num = frame_num;
+
+	memset(b, 0, sizeof(*b));
+	b->cur_pic_order_count = pic_order_count;
+	b->cur_pic_fields = fields;
+
+	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			b->refs[i].longterm = true;
+
+		/*
+		 * Handle frame_num wraparound as described in section
+		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
+		 * For long term references, frame_num is set to
+		 * long_term_frame_idx which requires no wrapping.
+		 */
+		if (!b->refs[i].longterm && dpb[i].frame_num > cur_frame_num)
+			b->refs[i].frame_num = (int)dpb[i].frame_num -
+					       max_frame_num;
+		else
+			b->refs[i].frame_num = dpb[i].frame_num;
+
+		b->refs[i].top_field_order_cnt = dpb[i].top_field_order_cnt;
+		b->refs[i].bottom_field_order_cnt = dpb[i].bottom_field_order_cnt;
+
+		if (b->cur_pic_fields == V4L2_H264_FRAME_REF) {
+			u8 fields = V4L2_H264_FRAME_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+			continue;
+		}
+
+		if (dpb[i].fields & V4L2_H264_TOP_FIELD_REF) {
+			u8 fields = V4L2_H264_TOP_FIELD_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+		}
+
+		if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF) {
+			u8 fields = V4L2_H264_BOTTOM_FIELD_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+		}
+	}
+
+	for (i = b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
+		b->unordered_reflist[i].index = i;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder_gen);
+
 static s32 v4l2_h264_get_poc(const struct v4l2_h264_reflist_builder *b,
 			     const struct v4l2_h264_reference *ref)
 {
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index 0d9eaa956123..1833c0556963 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -42,6 +42,7 @@ struct v4l2_h264_reflist_builder {
 	u8 cur_pic_fields;
 
 	struct v4l2_h264_reference unordered_reflist[V4L2_H264_REF_LIST_LEN];
+	/* FIXME: confusing with valid flag (active is checked). Proper terminology is "used" */
 	u8 num_valid;
 };
 
@@ -51,6 +52,12 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		const struct v4l2_ctrl_h264_sps *sps,
 		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
 
+void
+v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
+		const struct v4l2_ctrl_h264_sps *sps,
+		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
+		unsigned int pic_order_count, unsigned int frame_num, unsigned int fields);
+
 /**
  * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
  *
-- 
2.53.0

