Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E343ACEEA
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105787; cv=none; b=Z90vLuzbXW8dNEn39D4zxyQGBkDZkwada6tb9nwtQvCGPUksbuTEDXWM2YAm+4cCxzjAjB8NX+4ZnVFMRMAk1Xu6hGVqIMssn/n1vrr5fahZFx0W2uUjZgIO90/ts3DC+Pj7strY39ly03moT96//pGU7U985Jx9LK5NUKpHXBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105787; c=relaxed/simple;
	bh=xmKKzjCAtL6wSzbj7b1CUTRGlabduq+pCSy4GjqEQz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4iUO0PThE5KTr2qABfCMiwQusUBc1kJlUQBagkQW7iOrivlu7SNkoeHF2OflhsEna3KTF+qwVitW1SfUytgi7xM85Z5mIW0i1p40Z/urrLEdUmu69vonT0zI84t+6LwGFc5KCQs/+JISRDmgIVsjsLOyi+pIgTKoQI2BI0VKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0Nf0Acp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0Nf0Acp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-853c947bfefso2009061b3a.0
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105784; x=1788710584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=U0Nf0Acp9P4zdqUwtluVV79p/ar3378HymYwC7gYGW28j6x/atzqzF4K/pvVz3CDYU
         hUXhxuBYbdChZbaN7s1bNrXfiPbxg3nnFw77lUofkInKSCy5NgJEQvv5/wUNJHiDw/V4
         EXegCGPZaDQl/6kDTItFE6HnNqzsXIuPvhFUJ0bK0oRvdTHI4yDtkooPnn4hIWeb8lOq
         HekbEUCUySNbwpEQtwIRqFhcV6PsiqzsdQg23dizZiYzH03gx8UUtW/oYxKSCvDwWEot
         xvoAO3St0uUjRjfjt+qERGAHA+y7/nNkpeE40YSNQrHWL5snz2y+4Buj/MEiPb5+UvkX
         KTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105784; x=1788710584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=I8aQbDtu+xZGugeq5I7AN1ncCnTVyHW04xxyFNrWyY4dCDHh06R7qq9/Tnq5FZBcCk
         Tt0p4ASuroW+tz39O1TuzUVeEC2UP6bvfh+QQM1Do6RWj19libbAe65oIYFcF4ldM65b
         MZyRXjOy0cy3OOZ4bwqL7zTvk9DTK4gI6nSh617deoWBkUqO+kmLX1ontSUpJ3p10m2H
         7O1tHK96YqX5FRTsaRF/wK+YsJcAtIgENlqnZWmYL1z35cVT3MVbYo05b3DgY+0k4Fe1
         cIqFxWGMGfoPyRWjYpt/ofLDyOVKrhSd34QvCIvODqoG/jq5wiq5hozTvgInsfIVJbIt
         vuVw==
X-Forwarded-Encrypted: i=1; AHgh+RrSlY13jztOkocUQXq85qGRQx6l65cNuI7g4uJmSy1UvYw/MUZgZs3iUnIEg2h+Wi+qv6A=@lists.linux.dev
X-Gm-Message-State: AFuF++mgVToA1qWeL2tO63I3sAtkW0adC29Y1Ww+/0/dFSROKmSceFmJ
	NlPoCqwq/uTVqHc4iGSsj5787CNYyuSG3r3ZeQtvVbD5vt9kg3jQZIBl
X-Gm-Gg: AR+sD10Ab6N8BJOKfKsRTNKr6j+yYT6K/n14dsBXohxdg4WnFaxKbjhJGnUfqiiKUAU
	epofrlEsIesDFr6iZTmkIA9fS/A0j115SzTzWqRwUGrp22weqxj6cd+3Si8RlrgCWs5cbQrf+mA
	3rdy1g1xMji7SYdSBtNrQGnNz6h07WnnTn1umLF/is1unWp/HGXE1Hc6KhajVmqb8s9rCluuV/U
	HG9+sF0JqJA1Nyn2tSlqXSgr/vYsj7ELfj5QVIwfvqkDTSmKxnoumEqgNpHMXp2mqc+3LqkKvem
	hDRP7Rd5SYXB5J12fRXUx7WURkDuFlp7E4yEfJnviVi3crUep3QvK+oNqSQbvKZ0YKZaJOMdUoG
	06olAGgFYeXNRjl3ZnRc1C29TT2R4sQfBHXJYsKzRW12C2IAuy6HWz1/1PeI2xJzhVTECAg9Cxa
	Q3mCBl6odjwpWP51OIQilOiA53GiHi/Sfznp8vdIWmFqnSBnQ67LnvZfMjhtVeC4CYkGEufNWMS
	wNhMVnGgZRlcuxmDe3FIwJSp+NM7Mvn8FaYmXlLs4txzBGlVBQP
X-Received: by 2002:a05:6a00:464e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85994f5cfb6mr2189880b3a.8.1788105784320;
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 3/5] media: hi846: Fix modes handling for different lane cases
Date: Mon, 31 Aug 2026 00:00:23 +0800
Message-ID: <20260830160025.211384-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to filter
out it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v6:
- Add link freq check in filter.
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 63 ++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 2f8624f9bdf3..648192521344 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1713,6 +1713,21 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_modes(const void *array, size_t index, const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+	bool valid_link_freq;
+	int freq_idx;
+
+	freq_idx = hi846_get_link_freq_index(hi846, mode);
+	valid_link_freq = freq_idx < 0 ? false : true;
+
+	return ((hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+		(hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs)) &&
+	       valid_link_freq;
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1736,20 +1751,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	if (hi846->nr_lanes == 2) {
-		if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 2 lanes\n");
-			return -EINVAL;
-		}
-	} else {
-		if (!hi846->cur_mode->reg_list_4lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 4 lanes\n");
-			return -EINVAL;
-		}
-	}
-
 	mutex_lock(&hi846->mutex);
 
 	if (hi846->streaming) {
@@ -1760,9 +1761,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_modes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1853,6 +1857,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1862,15 +1868,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_modes(&supported_modes[i], i, hi846))
+			continue;
+
+		if (count == fse->index) {
+			fse->min_width = supported_modes[i].width;
+			fse->max_width = fse->min_width;
+			fse->min_height = supported_modes[i].height;
+			fse->max_height = fse->min_height;
+			dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
+				fse->max_width, fse->max_height);
+			return 0;
+		}
 
-	dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
-		fse->max_width, fse->max_height);
+		count++;
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
-- 
2.55.0

