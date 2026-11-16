Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833080;
	b=SYqJVYxsdW6IhiXFo4Axx0ToZlzvviSD0WdOWlw2DSrME7jqsu+b/6Jq62HFOU9rAF97
	 WzMro2BrUGOagl/Ip/Cu1pdQgi+WZ0ZaZkG3gcEiXLsyCTvYaFXW3GX2urjIdhQKiZPTY
	 JNQbSkJImCB5Ml+WswSSHlKlk0AINqxAMZHgq0Na8iFSTaZUp46qzEvsUbstWQfvZ8JjQ
	 M9nWtBsRGZab6UR2sWGrptJYTddOxinY6uHk+woGrTcDLTqqdAAjX/D0TAZgq8hAHZ0or
	 DzMj77yFIvHHjTA5V7G0HO/4SF6bY1dpEqfRg5fMNoSAH1MhTp6s45Tmn1+2DZay1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
	b=bJ/1SKWM2N5FejFZL3zlTwphIgiGDuVNYSBypV7uy0YDoofEbQGLnzOa+aGBDQ60e9wb
	 Ec2lRX38KNZa3b6M3IyHkKu/GrWtsOZcjSTjInn6kYJSQV2/vfKN0qLpNtw0sFJWpXGSB
	 HshhXsMeCvbiBaidHs25GXsKoE8jZ3Y5xl28NEXCv5EFTWhUXpaV9yyThKhrAf5uxTzux
	 I3KS4OzLjuR/Sx7EFgJe0ARO9NGMAYfl9UcXI45GSUe6mK2qV4HnHKIY9OTC8Rn9OQl1B
	 zXoNKDnZZwwbNi6BvCEP4GqKp48DMXhs5C5Eho3xI31gqeeMZc1sfhsETIuRVWQ4r4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma3rg9fc;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385F606A32A
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2385F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma3rg9fc
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14470729eso2837083e87.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833078; x=1795437878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=ma3rg9fcIvrGUvpSw2Kk/ylMjHZ1YgWTfeJmawJEiDw/KY4R1jHzNzo8Sk6VGAyzl+
         m+KTjZGdZBCMfRwoOUvPOLuPU9yId2ZBi+xPpo/ZqScV1wl9PThb5sj/zxLkt1iShTzx
         kkt0tLcydOj8o5V7mdTGC8n28r5Dv0pt/iNsyxZasJ14p+v1bWMMcOLU/6vbzX81OEjT
         b2+Vv8jQkwi4NlBeTg1UDFS6SIy8dEtVBHvWGYnv4XQrl0K8/oKY5UfAIgzO2df2ZQgs
         /IC6wRlNtitjFYhnjcuJkSp8eZQaU0hlDo69K5rJS4RJvcKU+frdPiWQLUy99PtAsShv
         rUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833078; x=1795437878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=SrwUfT3OkwgihByAC1+nbZm+kLpRaPlvETdL/J2ptj7p3d6a1ENtJ8xwKwAEpztIX+
         ZaqcVGrEAdXAAftk4tK4Og0JLnXHn4bGnT1zhD+OfHWYLlJFl5uJm005uzCYUx7mHDyp
         Q/4H1zA8ePHRar4B/2Xt4uu87o+Gmfy8p5cXtBLi/nI2Nl6A/8QPSaUJTtjxXKU8gsmN
         P+gCS0jY+J0wfqJ59VRpM2YUJ/OS6tF0dfyHo6gTCeThMG1z/+fGny6c+gwPMaoex7mK
         DNuB3k6wL4PQS5OWjVrNvB4vxGYqrJ3uzZgLXBo/F9fWBCdkqhgkL1eYiYACAPkbjap0
         sbNw==
X-Forwarded-Encrypted: i=1; AL+hErE+DD5bEnXEjA/G94jhL399qaPb8OsTF6bhFTrRyQBwOs4bTuZTHLBopOj5n218HbPtTMQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8r17AX7OdRBctQhU7SblrAzuLleNNNqf3Z7iUSIMU3DhMdCbdQ
	wUbgc7i+NiFTtDdGmTUWrpomDcm930ExT41vkR3NPadypICObS2hAKaP
X-Gm-Gg: AYBFou1vqOKyPbmSsFdoeZ9Sa9wo5XLAevVTl1JmbzQ2CItM8szbMfc6TmO03yqdIEm
	JshM+TGESvuhZ/Q3ADnGWLlC6XgjWN25RZ9wS9in/rB9VLiUB+9UYYTNLqtRvJCH2vfGW9veoLm
	EaUzBxjSghFDLJW4B780EVI3ZdwmkPbiOJ1bAhBqQffRYC2OM/7GuqjgDgp07/Brxh8iH9MzxYf
	U5iYgWao2AL0xYoGh69o9/ax2Ea0PI3Q5OAnTiI6WVojris6UBSyA45k2v3pQNGbbJ26SosCAWD
	vI5rflwPjAbTopY4GzN1GC9IIDLw1ySoObdPf8Tc9KL/yZdGwe9DSZRVyL0hWncqUJZ0vA88RRN
	AQuFP1OkvVVF9twfkdopDuJmWpw07r09in5kY49p+aON6ag9o4SrSLEEnmlBieK1TEOX0leh5iM
	dRbqla1PPm3sBRjg8sd0NLh9/XnxRIooAyORTW5Ug9zS03nM8t/Xh+3jFVr+zKAOc9sVbwmb/TK
	MW1ERb4nETp0znU+H4LKPVWjnZXixbRfj+3WM4YHlGWReOglnw5UE54lcuTOZhYZsGKhqZ6+tF0
	SyJx2O+HWj17eiLwaDm8r8JI5ccolLcXjTA=
X-Received: by 2002:a05:6512:3a8a:b0:5c1:5715:bd00 with SMTP id 2adb3069b0e04-5c170b1c313mr3742145e87.18.1794833078067;
        Mon, 16 Nov 2026 04:44:38 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348078sm3201870e87.57.2026.11.16.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:44:37 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 13:44:30 +0100
Message-ID: <20261116124430.1358948-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In the interrupt driven read, the read of I2DR that takes the count byte
of an SMBus block read starts the reception of the next byte. With a
count of 1 that byte is the last one, but I2CR_TXAK is only set in
i2c_imx_isr_read_continue() for the byte after it, so the last byte is
acknowledged and the target goes on sending. The read fails with
-ETIMEDOUT, the bus stays busy and the following transfers on it fail
too.

Set I2CR_TXAK after taking a count of 1, as the read before the
interrupt driven state machine did and the atomic read still does.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read", with the
    M41T0 RTC at 0x68. A test-only hook passed the messages that
    i2c_smbus_xfer_emulated() builds for a block read to the adapter, alone
    and followed by a one byte read. Register 0x05 (0x01) as count byte:
    without the patch 40 of 40 failed (35 -ETIMEDOUT, 2 -EAGAIN, 3 -EINVAL),
    after which the RTC driver could not read the time any more; with it
    01 01 and, in the second case, the byte after it, 200 of 200. A count
    of 0x13 (register 0x04) reads the same bytes as before.

 drivers/i2c/busses/i2c-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..0a59ebe70eb0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
+
+	if (len == 1) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

