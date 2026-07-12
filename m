Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE603A4F26
	for <imx@lists.linux.dev>; Sun, 12 Jul 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857140; cv=none; b=bxgFnZmCmFJYk6+7cjihibPSt8DZFHmAJMew4gjpna04ANT8Awq1C9MV4Oswgc8dMhSlZNbkFNhmQ2kfggpDxHBq8jjj/CBfONH7eDad6Rar8YacW2E866Pyk2fdXG2OkJ/LH2fGOEaBzw6qXo0tJhpfpwCacpxamBFcQGuEFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857140; c=relaxed/simple;
	bh=ELSJMQXL8Zru1De6Jbuvh+FbhtE/z4ZYFGJkBObEBrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCYosVqjd+sG5hlYMzddAezoQhihOYc4ZadhBkWbsQu1H8HqCZn9ar/2UdNowI66e0SUKGdu3jiVnLmCmGDTnIdhJq3MCioS7hbSyAXcCmJwKP4RbUD2gonF6dX+qatRSVor8QFLNfOxsOrnKPQeMhXcLZGNobP2tatrXWxzJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/fYuE78; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/fYuE78"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacf197759so33609825ad.2
        for <imx@lists.linux.dev>; Sun, 12 Jul 2026 04:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857139; x=1784461939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=c/fYuE78hE5yiePwRSU3+FuNPxRBHklzVAX7TRhgkD/PRXmcrZXtHofYZwTU7swV/d
         z/K+GkWcu5fLFMJ36CyCYEs3lX13f+9j8fqPYD3axwwmjJahvnmfkiemifC79LSbpp/g
         CIWcZNKv87n0NWa+/5ZjIIIVA5d2ZgUxLpiGtXQJgL3A8FzZKvR1wLvsenLXUrm0jIm+
         ZjB18m1k0lQWOFjWF6GRiW0r6J8zZ7/I98wVgYRnlNLCFtbO4mU3PHZwFsy7Tt97zrN9
         5BDIgYhzyJMOrLRK7+VBNr00OCLdtTQ5lcOu/acw0Eyrngn01Wag3SAubp2EW3qlu+J8
         njNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857139; x=1784461939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=U1l7o2xVuD8sNPV+Or1cFibzwzQUYnemw/Uf2Np1qW9T/2/rbMRBbdtLkWqTsjy1HX
         /dIWRYZfUa1hPoB9E5RwJpGYmX0sIM3X4GIuGna5Xj5nu+4mzA2JNm+wC7MebFmd0MyB
         6ubsr0t1DtD+3AZgBF2MQ4hIcRwEtsk8Dc/SguQQHm5KygGU/6TTPVzX/rd6u272UmBQ
         A/JmwARPiJaIBryUUhv7lm/qiRRMsnmPTlQvFqzskj7hyHIOobRTWWM3VJ6jetfZZhXa
         toYd2SucqASgTcFnQ0FqVvWaOPkrpcqm5DuOi5h/EfO2ViV6tMixpxRdZDL2SBFntbOV
         LkSg==
X-Forwarded-Encrypted: i=1; AHgh+RrqfO18Y1UmSGjTWVdPRuNV8dHOmJdKGEuuzijNwsWL8wukQLxqqyKb1+tVo7JIRZRAZvs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjp07tneh4R7o6AlJUHfduvURNkgWfjy7HDtuqWLPNThBGI9x0
	eXJst+Wd7vJJzXRB/nh9/bcV0mzzeo6Zz/xk9BIfJosDpK7WkFsPConV
X-Gm-Gg: AfdE7cknS4mFvt9jFhcjuXLia1XTTK0pPeEC+YZPDktRGJWFXIdzoJqjUdntH/uicVI
	fhItH8KfOSI8z9hChO+MRKYadM8ntGuPKA9MQp3t/qKM8Qf2dl/KzitorpkCXBOrLiBp6VEVa6N
	Xv3uSsWmoWuuwfmPwnccgXaqtXDhOXKj81/jjcXlUM64QI1zNnmSryPvsEyb9ZiZ6EO3wNgw4t4
	5PeENm0cGP3T62VcgLDlu0RmnBpgy1tOLMj/Wxiq9GSd9LQr+0sQT6Apwi8+X6D6zOrQLNbf7UI
	1ajzVoczVjw8m32NM5gTNHyTlL1XJ42H3SQS5VhOzsvUlS6WMQF940VwGehzFtG//gLlSjB7cnO
	uamqhoGVEgb43G+tUsXsjUBT9qeojxpDGQxtij3rgLLIccTeKbzvLgKi/Px/bJWYbmayWAfz2q+
	JeKpmATkSr+WVSbARcsX3+unJanBXAk2NevszWTuY=
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr57706585ad.1.1783857138522;
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 3/5] media: hi846: Fix modes handling for different lane cases
Date: Sun, 12 Jul 2026 19:50:10 +0800
Message-ID: <20260712115012.91600-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to fix
it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 58 +++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 6bcd862aee30..1223567641c4 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1688,6 +1688,16 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_by_mipi_lanes(const void *array, size_t index,
+				 const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+
+	return (hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+	       (hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs);
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1710,20 +1720,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
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
@@ -1734,9 +1730,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_by_mipi_lanes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1819,6 +1818,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1828,15 +1829,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_by_mipi_lanes(&supported_modes[i], i, hi846))
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
2.54.0

