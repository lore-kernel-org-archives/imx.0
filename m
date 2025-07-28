Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359AB22A4F6
	for <imx@lists.linux.dev>; Mon, 28 Jul 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753731908; cv=none; b=TySbeLsG0gGsbfhrwyA2dqKu5U83tN6M8m2f1XyYtUBwg6DK0ZNjAePjL/9sEUwcMAfLSDT3D5VNIApb3l/X7lGtnJ6FKrgo9tCPQobWtArHiOB4a3R4D4xAwr7HD4Uyi0OVt7EI+zQf20PSgMzrdKaZNOF/uKibmAM5D0D2S74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753731908; c=relaxed/simple;
	bh=iSnMayTNAdVLOEv9GHe6rkFBQgdCPQFk6qNpzYFxc/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jjF19zRxjE5XJ4J/574/7aZVfwJym01YdlRTtV1ibZRmL1DZ1jRorXBQHJEC4NzqynHQ1OfJEZkxXuDm2sXtZceKyYzmfneng4Vi38cl3iNFs/6yNZdFs6qMpj2dR7eQ4lyO1Q/9mrmbGlpNn/6hX6Lzcm2SeElZ20WxGoho6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZDjaw/h; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZDjaw/h"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7848df30cso131768f8f.0
        for <imx@lists.linux.dev>; Mon, 28 Jul 2025 12:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753731905; x=1754336705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItkzBZe1xNWTDxJw3YTXp/blm8WuT8V/aqN+K06Qllw=;
        b=FZDjaw/h+JHMlESM65z8UUhe726DgxdF858AqjqxkreUSz25PYvcXcfn78vGRJ2eLO
         ump8wbEwsvU4RAgbbU/We/oo7zXL6q8T+q3NcU0ZYrnP/t2ccJDYKtOCxiRX+PiDKmRk
         XS2ULkklp4btyfNiP8/wPsqo380S1kea0ZYICjwKB9+YnY3uN0xU04uyCSAzNkodebyC
         A8imugmva8X5hXZUtZrmRjaWTYrZiCeq15ooKvea34sQ2X/Xf+j3CGyKoXCGqkIb1kiQ
         GL49m4PoCMpnNe5G3AKIbqGUdclFe1tI7Ff75vUPB1Y6k6fqjLuXcH/5rzNjNx004uPy
         41Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753731905; x=1754336705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItkzBZe1xNWTDxJw3YTXp/blm8WuT8V/aqN+K06Qllw=;
        b=DdYvQUzk39qo9+D0rrXRc/8/FHyJQ90AlCZLH010AtXK0TjJxTJFtpfbVcvKdznJLy
         cx9MRH/QAuFBnfLQRARnBDrrRFgmLYUcG6Zxkm6z/dhDKC1yt+bmJPZ9vRiTxORKcOaj
         0Ef1dGc7CPuGm5M6+jZnttZ0dXct13aRbHDJ9XR2xE6resLQ6CkI8ofosBjV7rcJL50f
         fsR++cnC9qho+HIHXGnRgRG7nIcVBqaxh9CHcvwPt2PQqDny1pjX6LS9QGLxnZzsrpEd
         urj66ymoH7FeaBQevw7LF+dC/lGs4MxbfpjDyBBOp/6eUBCvHHrntxYEoU4YMwlXkjbl
         61JA==
X-Forwarded-Encrypted: i=1; AJvYcCXxDDnCT4uUAs6qC+LugkxbhXMcDZzVqiaXTjn5yLyWQhZ8inaGre6wcokaKwK95IHjDtU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOJWaFguj22xNqdFChZVYOZO8n1RwFsqo03jcfNuC/+0IqbVay
	N7TSrRh3CFDGybbjUroXD1r7jq1tn0CFQDe40FlsKbqXTGgW96hYSdyT
X-Gm-Gg: ASbGncsVFksiiVoXCSd2FPUu3OwiA9z54CPnNSOGwaYli/onv+dlpgDPhBxCq/iG/bx
	JjI6tDW8TQ1MfDRQMCz0hcdcUX9WogqPueLoMmBlMk8rLGLlzsRAyK9h2VWqb2JiCU+Xpaj/znJ
	WHPGmtN5icdSrVdDIS7rfaoR9nZvpcYjXuaEGlVb1fnJy+wdqZz9Dg4nhe/eVrizDpAtPMgRChi
	fYlFv1fuvnPNPwvjf/bbVDRBzFT4B81M7A/OceWh4ZlWDwQrGNaumCvAE1LF41Rk8tu4sDv7wtA
	JIub4qUEThTHgQFgMLaRBQyIF0lJziPs/5ypyMIDVnz0jnijhjyUGgSXp0GWmTNIXYqb8NpW8+V
	g4V14zHflwtf8PcGa4RwrOTKvsfr1Et4vPW5aFmTt/n/ruPa4I+0Kk4RGmAtGO/+9V9p62w==
X-Google-Smtp-Source: AGHT+IHY8hLa8p8y5iQ7pp/OFOj7bim/OIX1NELu4CwTPhxkimsWDOt02B6vAdwiG9TIVZN04Lvssg==
X-Received: by 2002:a05:6000:2a08:b0:3a5:3993:3427 with SMTP id ffacd0b85a97d-3b78e60fbf0mr426846f8f.26.1753731905198;
        Mon, 28 Jul 2025 12:45:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f0c477sm9547837f8f.58.2025.07.28.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 12:45:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pwm: imx-tpm: reset counter if CMOD is 0
Date: Mon, 28 Jul 2025 15:41:44 -0400
Message-Id: <20250728194144.22884-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
of the TPM counter does NOT get updated when writing MOD.MOD unless
SC.CMOD != 0. Therefore, with the current code, assuming the following
sequence:

	1) pwm_disable()
	2) pwm_apply_might_sleep() /* period is changed here */
	3) pwm_enable()

and assuming only one channel is active, if CNT.COUNT is higher than the
MOD.MOD value written during the pwm_apply_might_sleep() call then, when
re-enabling the PWM during pwm_enable(), the counter will end up resetting
after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
normally expected.

Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
written.

Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v3:
  - added Fixes and Cc tags
  - rephrased the newly introduced comment such that the bit is understandable
  w/o having to check the TRM.
  - Link to v2: https://lore.kernel.org/lkml/20250714123634.6442-1-laurentiumihalcea111@gmail.com/

Changes in v2:
  - dropped the "VERY IMPORTANT" bit as per Uwe's suggestion.
  - Link to v1: https://lore.kernel.org/lkml/20250701220147.1007786-1-laurentiumihalcea111@gmail.com/

 drivers/pwm/pwm-imx-tpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..5b399de16d60 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,15 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * if the counter is disabled (CMOD == 0), programming the new
+		 * period length (MOD) will not reset the counter (CNT). If
+		 * CNT.COUNT happens to be bigger than the new MOD value then
+		 * the counter will end up being reset way too late. Therefore,
+		 * manually reset it to 0.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1

