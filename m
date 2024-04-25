Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90367149DFA
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057419; cv=none; b=U+TfwVygC8LV9czXRDpY114T5XtRapOrXaMgIvXXCOPPtOymSnZLW8vP1ko6QBw46FNMbikzQTll6sMfNmxbGLmTj7cHahFJlBY8dCxrfaGIY/2QCFtfcg3EKpZcBg26BcLWkOiu3j/42llXjpkLS1mBiHMxgh38HwwnBhKXYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057419; c=relaxed/simple;
	bh=InEifnlaJ03rA8QgNLlhw6s+Q05Y2oXvccfChwmxIgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Olmdw8aJM1qwwpgK8LGNWHzaSoMzMhoFrbVzF1sFvbCDpfNKh+81MW/uaZ24BpZlffVLF+ar1E9o7ZjMUmzNCrmUqouM27nipdQmW1q3vHDsd4QyQ4zD4og8hx3LyZiEwSgCYbyBFmp/S9lyjwzJ4lvxGQq98+ar6mpIoHvZbMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Bina+rE8; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bina+rE8"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so602517fac.0
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714057417; x=1714662217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALDEBHn1/H2TDQekY233nOtWpDkhb+DBBbFG5htxIm8=;
        b=Bina+rE8IujWxbW6a33YOVCaEyftmIcUG/3gbdd6Z50gRbo3Q4spnYFnL/otVhyMhA
         SDUdbmwVp4aUwjQoIob+Hf+tZ7udSTQnLJiFcih+nvJ1XPURiZAk0W8u0Bkq8gqONbbh
         TFcUwRiUFH5Q0ZPG4VG7xzN1Cy1h8UsNqZPj2EqsOQ442FEmuZNoBIJA7CBnXm7avHxl
         ePXHXCetH7Ob5mbCAJSND4fdwtnyaeTpKig6DWHMNtDsFqZMMr5O30uQrv2m+gGeI72f
         CptFj1ZHCUx1gk0AYQWFz/Fm/W1Ce2MRZglGaHudOBNAUFMTdhZ6joXexuaepn8RBuOG
         SJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057417; x=1714662217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALDEBHn1/H2TDQekY233nOtWpDkhb+DBBbFG5htxIm8=;
        b=LIH5si83Z2x74pSZ7TmKAsZI90IGwgohE3XflbTTUKc5IRMea2OlC5Fems6gptxfC6
         VCajsniE2yeME5u5t7BCy1FCvUQ+wEMDr3TO0U5C2URlgkCLZah5NMRmhVPPAnigm+4v
         U9Hv+CmTBLl5g5mUYakeSW0E7u9+YTHF1zrCSmlzu9Zr9a62JCXQGdYrJb/zPA4oMkJT
         pYSvlEZjPRgNy5GbVf/V1PfoexVjqKqQPDykQWGY//TnXM70PwkZgwIfeCACq6uGoEQ0
         Bv5vRzqvMufAztRNO566gR9FhOig8cKz77glnEMC+pBGLlLkQqHqGPonRbZnpU8AULKL
         0vLA==
X-Forwarded-Encrypted: i=1; AJvYcCWaKOklRWggiF4SC/XdsIm5fGkz3aFOBGmejZXMWpxazCiHK7s+kTPQurQCllunTmB6TUeqeezns2wrJo6YaRn/FYh8
X-Gm-Message-State: AOJu0YzyCmXm3OpeEk2ighwsljr3/5MF33/1i4vxIE2LIfT6/KI6zVpZ
	C3zwmmDlP1OBN7H9wXfJ5UmZA9oeuH5zdBb4bFsEqSU4jV09zHfrf29K/7T6wLg=
X-Google-Smtp-Source: AGHT+IF+ytB1gMG5gdlzfQf5qI8kdu3jxsrVIZyaQCoI1mcDdWPMWQNB0NwCuMDh4O5EGMwTLzBV2A==
X-Received: by 2002:a05:6870:c394:b0:23b:8a59:f5b4 with SMTP id g20-20020a056870c39400b0023b8a59f5b4mr702248oao.2.1714057416777;
        Thu, 25 Apr 2024 08:03:36 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mp2-20020a056871328200b0023b6d4723edsm166739oac.14.2024.04.25.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:03:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] iio: buffer: initialize masklength accumulator to 0
Date: Thu, 25 Apr 2024 10:03:29 -0500
Message-ID: <20240425-b4-iio-masklength-cleanup-v1-3-d3d16318274d@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
References: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

Since masklength is marked as [INTERN], no drivers should assign it and
the value will always be 0. Therefore, the local ml accumulator variable
in iio_buffers_alloc_sysfs_and_mask() will always start out as 0.

This changes the code to explicitly set ml to 0 to make it clear that
drivers should not be trying to override the masklength field.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/industrialio-buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 1d950a3e153b..cec58a604d73 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1744,7 +1744,7 @@ int iio_buffers_alloc_sysfs_and_mask(struct iio_dev *indio_dev)
 
 	channels = indio_dev->channels;
 	if (channels) {
-		int ml = indio_dev->masklength;
+		int ml = 0;
 
 		for (i = 0; i < indio_dev->num_channels; i++)
 			ml = max(ml, channels[i].scan_index + 1);

-- 
2.43.2

