Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E448D254845
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464214; cv=none; b=U7RBQf7SGHDafsHLw/1F0hGskJNwCp/xJzWL86IVcs9QPYcRa5VkoJuUYGiGIiadYjY5YaSTaUHDxYnMRAt86jDkwNmVwv5zoEFN6JkYXu6MWdVKW+JPXCUWtobAYvSkaiuxGI/t8Xe04v+kGc1R3kTUbOth7vvINJCk5Zn81N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464214; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTEDsazwPkZRedpvXhEpAqy/ofDQDDOSJs/1Sa5F2WISgsUvo5BFWjDUPkxycHizaiiKhl+Nu0H4noL76HlOtdKtkAUQLycQaz1Fs2a6WyOQsaTp7jIOjGUtXV8hDJAJs1awo5/DrPWy7i7QXv+Wp44BHJpCQhreikxtbF88RJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=S7i0P3gQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S7i0P3gQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso667560766b.2
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464211; x=1750069011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=S7i0P3gQIwV5UHU/CqKm+uGMxXWx55fbZQThkCz400H63hTOLeIdiv+UB4do9WCy/P
         WYf4hKPaSgDXQdnlf9LSOTpmvwbWjeF9fbryKCni//PRSfHhCPLQzCCpKbzbcnqmSO9v
         IdHFnlfiAih2MAhIvDiH5lNoNkq3ravhP7X8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464211; x=1750069011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=TpXHGLZFrQ8fvk3zttfT1DZElSeKruYnQsJEogR7/x7vd9s2sEykOE8yc/eie7sMDy
         OFkvUHx7x108GnomoCb2XKVvz82MUcthOw2FfaYQWFVP5TMPE8awIYf7hGqd7jqX+/Nn
         K/vQe6x5isL+gauSzuOjsRLLzYSH3u0eSq7yMNtZrfyIeCSOSVRbGlbZwu8Mr9w4GEwJ
         luVIIgTDJSSGjPkX3YCV7CR3lRtZXx+n/LCKiNttprVSaHLBjP34qUaAA9Hl9+olz4o8
         XGk4JqcPHm0F0YjZW96+MqOHxCs8s/lqK7wVJ/yaFix3QiV47As1uZ2w0q+UVUs5FWIz
         Zv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5n/I2dDUwhvZNqJlKIMCRRDV/xz1JJ7BXCakJyKG3E+iNUaMBU/1QkMlVRGHhyrLLYQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz35DfvkcUwKURKe4INDAQwPjUTCdFfZI+r4aMy9GJaAApX/OQz
	sZrMIMnYn1Ab7XryJ2yQiHEVWso1PlmOoPWC55lcbl+cMVU0eGRxS88RAliEBxwN2q8=
X-Gm-Gg: ASbGncuQdQbZUe7YiEgmddKqdbiYABWX2XYxRBI6OkCtI6npyeFQfRamHQhaIDoHmme
	qbclAEhR1vwIIuiAkhuC4Ry7LK6ESNeUYCpydCDKyuXoOcFpHFkVUqfqBSTPGyoKZA/IXsqOQle
	m2O7haiUJGFJOCto8rHub55GEeYYj3MOvXRIKugSR81UcFnh7pjwO4qeQr5bcbJ1kN4x5eQZr0T
	SiOOFdBkgtH6nh9Znks/ktgd4iSQyMGU+nX73s8z5vyjEZl/mKpMLseXV3ihc8Ql8ZP5l/qSPc/
	svCWyg8SO2yA/jjohumj8hYhDYn8Wu3HxX7NIi10LwnKJrrnJcgzXwSdf20Q4ug220KWtJA447T
	2LpGxnJXQkCzhFFI2GYCThCuReXYMs3mMPMI4A8ULVoerW48cKTU=
X-Google-Smtp-Source: AGHT+IHVur4mTo1DAOmuoShYKnP3X3CWsYNLx4FXLXqZkGHw2GltIvMQnVbilsvCUXJISjKKmcuYsQ==
X-Received: by 2002:a17:906:6952:b0:ade:37da:2183 with SMTP id a640c23a62f3a-ade37da236fmr647331466b.45.1749464211252;
        Mon, 09 Jun 2025 03:16:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Mon,  9 Jun 2025 12:15:38 +0200
Message-ID: <20250609101637.2322809-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0

