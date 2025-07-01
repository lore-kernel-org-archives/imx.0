Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8F2701BF
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407387; cv=none; b=K4fgjliHqKCzGn0O2hi55ZwyJT59lgf6Bte8LRTiCHLvvqx73DehUmBeWmzKJiSr7sOln8L6BGX9U6Fr5Kco2dzGjYZZFv4SNSr+EYmQPuqo3Y8pBZrT+coDbDASu3QkVXuLc2uJRMHjsCmTy+AidnSe4e2c6w8N3KLj815eX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407387; c=relaxed/simple;
	bh=6u6DYp8XHiqMAtZhMlgpyQ1cp2/ZUdYKWCN5VTWJ8x4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E4NKIqEd8K8vDjOzRr+t1v2u+3mplHWoF2/9jRyYYFsJhdmxbYCxdM8xGUGvBdPisd1R1faVHini3XnrxgcZsPrPgEyEDgmuLQvlyT8ChdAR5wUo3DWnDxc0uWtKRs3JvaHhgrbqg9W73xYBOTY9WThn6I77RcorYEiSVdNyaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CY0XOjf7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CY0XOjf7"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b6532345so1377700866b.1
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751407384; x=1752012184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCH6UWaWdMtSV5w3YLUgKyRDkxeGFe8bXumroDH0Y/Y=;
        b=CY0XOjf7W6rzcZSCVNoqcLIt4LAEJG4fYYxZ9PALvfHXfZKlyRRGWk8q/C4VHQZHlV
         PDPa742+hXbJLqXfZkVP5MZQiBfxIgQJGSrhZId+ntVT5TcTO68BOePxTbn9IYpNSxw7
         2AWkBsEBWhQkVnMti1iy3nXe+f7RtKbcEreqP7IyNXjGTn7xE+GB+P4OribEB4nWV4SM
         lORglqdT0brupLUqIba2v3IyWBjXGl3Pbar32ulmnaEuik80bPANcKa88A/KWxEFmXFC
         UBpoJxoIpaxZk1rhx4Nrjzp1i0yYyu7NJKkXJWcjqkq4789kjycBz6ZuUqyMD2UxBtvd
         zFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751407384; x=1752012184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCH6UWaWdMtSV5w3YLUgKyRDkxeGFe8bXumroDH0Y/Y=;
        b=kOaTt8HVHR2gAhs+FNzIN5uB2vWTq+zgAy7SFvcszCeqWFUhnmpFmUcih+usQVZDM6
         GVPiGuz02Lg2SYk1rVqgr78inCEGGei8THby2g3C3C+VJ5GfFPWbP0Die1jPo7GfbyFA
         yg1UR94wFy7nn38ql2vBqfpx3VCAT1uw9YN8tFqZDjSzWf/S+2lUqC3YkxxTElDWAIvA
         qTwb5ZxCJi/LaJ14J3t5DWaMe01/MrkqQTWnBJgCk1sWmMpa2FN/dTOyPLLae3H6BBCR
         HyLYN0xqecj9v/jm+YIQgU+qnAkn1If6j6fncFQP4itHskxBZ9W45Bmv6YJ8/wkVLyrP
         UL4g==
X-Forwarded-Encrypted: i=1; AJvYcCX5VGIjlIaZQqp395yC1x/D92onq3iCQhN6K0kUgp758pJR+cTrdR5XDX7pLGBAX9oizDc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRbq7AEsLcI4STxtWkOTmr5bGTXupHG5ar6BmzQ8TWeqIwjZot
	eu5Sbs0xeT79zD6WjbbFYx/A143z7LXGsmvv76Gex1uHds87nvQuMKKw
X-Gm-Gg: ASbGncvqujkZPvPHlVXcWeFgmge/0EKPCtHu9OYjSrA3C8y+PySVMow9ucSpJOZxcXO
	psLbPOotsixfa2CuHAYFvfxZ8CwzFIVE/A2GqnZighx/2FDRC1MHKUs7p9kR6Ynd1UZmBF0dBHD
	9LSZp/TjDWqz6gsNYGDOk2N7AtZfMWpLIF2VNgNrdiWp3BxMaukft+XjlBmOzKfx8aXzrgn7spr
	DPGrnfbfZAp8cfGTOnxrTLGsMeHA0AeyKgFxE2vLR4E10ARLT3FC2pqF/1ZNq7q0xeGiBZIpXvU
	H82r53Sxipm7EBXZRtTsVZJhxKuw+ncF3CuNdl/CPbQ9RC+TyhbklCuCQShMMO6/sja92SfsI81
	WAPD73D4DCof4wfiM1U6RYjVeD22ZeDN8tw==
X-Google-Smtp-Source: AGHT+IGb0hSrbnoMf338DLIN4x8Shdh32qqzM9p3b8N6w2kChFiXV5nx4bbPUXJPHmioNc/LM3NIog==
X-Received: by 2002:a17:907:9448:b0:ae3:6dc7:1ac3 with SMTP id a640c23a62f3a-ae3c399eaf1mr20986466b.15.1751407383224;
        Tue, 01 Jul 2025 15:03:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a16asm959756266b.72.2025.07.01.15.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:03:02 -0700 (PDT)
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
Subject: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
Date: Tue,  1 Jul 2025 18:01:47 -0400
Message-Id: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..30f271826aed 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * VERY IMPORTANT: if CMOD is set to 0 then writing
+		 * MOD will NOT reset the value of the TPM counter.
+		 *
+		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
+		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
+		 * incorrect.
+		 *
+		 * To avoid this, we need to force a reset of the
+		 * counter before writing the new MOD value.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1

