Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB232820A4
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692071; cv=none; b=RPQxY3NAk/M/rVClTuHXKLKx3y/sWsCjibLIhxNcHJ2Htqm/X15ebWH/HtUK4koN2Y2ejdpAccqWiQysFYzg1M1BeLWo+ZflSIlaUNET2miKDpB1HvAQWzodYHOhdZTlEel0Cux/FT/cY4Uqk6bm+Co42dx9Xe/BjO5OgYXMdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692071; c=relaxed/simple;
	bh=Q93r5XsVAYH01/IaXbrD/ulOS3CSAoNRbx5rmSy1IKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FRsPateH/69H+lcXZZNuzjqVkNpP9NDfHAgh2b39CIil6YqtLjGQKTh0hvxRVtrl7Ie1sVjqCrPbLGY0tV8dT0RCyS7Y0WHKjmcNEHpMKee5+iKpcCZJcCJeDdf0BjJMdOmQkSgJK9a7FCqzWL1CZOuEA/U7T5sMKLMxjo0ChDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLgYgf7G; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLgYgf7G"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2984dfae0acso87502695ad.0
        for <imx@lists.linux.dev>; Tue, 02 Dec 2025 08:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692068; x=1765296868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=jLgYgf7GnZr++sLr6VNA4pPB4CCSULpXEkjhFS2pwEvMkiy4uJvBlcd5cEjdpLU8jL
         MJs9OjF7Y+hPR4lpSlxzC/JXq4sF+W1NoByrJMyyXA1LxbtpYTFNrGKoz+Z4Iovis43o
         dMeCHjb2OJbXzE4OferI10TpkJNNZi5xDcqd1gky1EwP3BXOBGl0GzP80paMDOgIZUpK
         iPHTu498KIaV5AY8ZW4cOveB2JjTUjexr6Td3nWdA5NyDIufeGz4cp+Ovonf7Kvs13WS
         fiXRMiYCbQGDZSSp6TJFwvCPlJkSZYfUvo4bn+6qITfcMhdCKF83JTSsTPQwtsnIiHCW
         cwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692068; x=1765296868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=t0k9wbLKzvaJ/GA6UgcRI9DYK7BYisjqx3nAwWuD/LxSxioZeinTD3vQq8pUqq4m7P
         VVYXvGQLgHrlQ5TrggJlyi6YXwJuH9mocHGLUQ8YJwiKpxMlmA4e0Jkw8h34L5zcFDlO
         MS8t64N4gXHbHDcDojD7ycXZypxXDSdH8IMLSo4lIMYCGnCoAt9t5p49iqACgyVv6BKN
         wNsKMSXCUQ02oQagkVd2IGnTEoFAyWwDAgEfG51rarVbm8FAEJkNMVbC85CLjtJ6Eh9h
         QAn0/AuRqkWcZRoTtMKLhOFEazXGmVVqVvJiBBna0Mr+zcp3eLf+j/ZrYmWfy0exDNzV
         I8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUPSibRd9QfHnrwDMH730RY0/ldVs+1nogO+R5m5xA3yHgy7h8Tg3Dv9hUMG2a1Sy9Pqck=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+yCEv5v/hMKE9pW7O5oPkmpNJu+zGN8bJhtx0iejbEtg5a9xI
	CsCBozruQsiKmSHR2lbJb2+C1OWOYZMKooEA9oR2xAX0rhxzUi86HSpr+1H+1iZNiJBB3A==
X-Gm-Gg: ASbGncu8KrVP2RPzYQTihIbZ8/8W2RvvuPnbvKIK2WmKmoLsTHOHZNePx9DJnXOwOqS
	wInxC85baENQKJ+GF7O2lv75+2mcxsJf8HVHhv/mOioGBeaeQFKly7VQakFgqW4rqT5tHs9+E61
	LzQNYaNhKK3+xzWMK5h1C9oVqoxPoCDnQ4BR6n05aKioWk8PyQYdK1qnpO8xrZOyLTdxB7ztIJW
	SmhxJD66ZNAl7LNOsFPUW0+G/UQwdU1Vd6VD9GdCQwS0F6hWYJ7YsQM+hQFCDVcDdyttuNBiQQv
	fUmJLxqjukNol7UkFNY7/P5TEbrrRCThgmdFURzpBasoJR/JW1pdfe0C7ABz19cHDOAyEtiDG7W
	smjSd1s61F+OQiiH7UB4J8lz4zOaGrGTbTKMEhsMaIwbEWxSD4AZEJBmORfY969gWk4UXUAJAcP
	TXCOv8QrbpxzRmSaf782Yg0KBhCh8XQBgNBxU=
X-Google-Smtp-Source: AGHT+IHKFWblm5LnaQm2d8+shTmkcU+FDf+0H06eH8nxVUhcOjJfWxAnQTwqjA0T3qIJaqWoH98RSQ==
X-Received: by 2002:a17:903:244a:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29bab1ae07fmr312387985ad.47.1764692068151;
        Tue, 02 Dec 2025 08:14:28 -0800 (PST)
Received: from vivek-IdeaPad-Slim-5-16IAH8.. ([2405:201:c020:c865:ca9f:dff7:8120:8577])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44389bsm160814385ad.32.2025.12.02.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:14:27 -0800 (PST)
From: vivek yadav <y9.vivek@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vivek yadav <y9.vivek@gmail.com>
Subject: [PATCH] staging: media: imx: fix style issues
Date: Tue,  2 Dec 2025 21:44:13 +0530
Message-ID: <20251202161413.92230-1-y9.vivek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Applied checkpatch.pl recommendations:
- corrected whitespace
- fixed line length
- adjusted indentation

Signed-off-by: vivek yadav <y9.vivek@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 2 +-
 drivers/staging/media/imx/imx-media-vdic.c | 2 +-
 drivers/staging/media/imx/imx-media.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fd7e37d803e7..725478bc2026 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1509,7 +1509,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	}
 
 	imx_media_try_colorimetry(&sdformat->format,
-			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
+				  priv->active_output_pad == CSI_SRC_PAD_DIRECT);
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 86f2b30cb06c..58f1112e28e5 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -616,7 +616,7 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vdic_link_setup(struct media_entity *entity,
-			    const struct media_pad *local,
+			   const struct media_pad *local,
 			    const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..135daca7d55b 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -231,7 +231,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier);
 struct imx_media_dev *imx_media_dev_init(struct device *dev,
 					 const struct media_device_ops *ops);
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops);
+				    const struct v4l2_async_notifier_operations *ops);
 
 /* imx-media-fim.c */
 struct imx_media_fim;
-- 
2.43.0

