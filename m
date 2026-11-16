Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833985;
	b=Wm4/MCUUeRMQlXT/Mb2Bxesg/UD7CbdxnJ0KnFOJ0PW1dLQxGgzbDrrcNeW6ylnL43No
	 yKFuSt56NoR5NzZrIwjdF6XwlpGVxpglclv376VUf3z1D5IfRBClIq+QsuDdpV4PX6YGp
	 TEhF0ckh8/+R8b+O/SKBuQfWDPVeF8welVpWuPL758e39UBwVBuFrBRQCzj7lU2v9T/HK
	 EYMcbnd29nzhV2t1AQsKFkjU74TkzHPswpUos0Eg1BA3aTh9wfjWOlXrF4l2HaKxrDZwZ
	 v5ymI6fqkSJsvJIj/wZxH5CPF0Oh3MDyQ+EBGbTk6xhJa5geBUXT109YwiQJ92qXjkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
	b=r9e0E5GkRaZzJLaTgZ4rgDbSbGvzAucz2FqYwGwqZSpWme9/lmQzThM4aOduCLxVO+R+
	 pNXCsNqGXzpo5W+10IBbg9+B6volBvrH/qHxUShofzJMY4Y/gtW5QAjI75xgCZFekHwRv
	 m2eTfWhBgwGKir7jKOxJw5f56Yv2SdDCEBVC0cop/j6nPClNU1IvkBKRFE+ZDm6OGK9xS
	 EsBMVlyN3AkOe0o+YDCebJO6HdJYDlZUyoENGldAahim388EMVmAPi04MgfUzFFWVUaCH
	 bhTl70BicWANAzG+b5t7rwvuqBsNzkEwef0Q5obz/rwt6fMUEROFg27DxBfMuOAPAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnyryPIG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD160A2624
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FD160A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnyryPIG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28157075e9.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833983; x=1795438783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=jnyryPIGDIXM1vJfS4hxHUr9BsH85M57ufNW4Ep5lKiyxchQ4J2JOi7zekzHajooFH
         WvKsGTVBGc3MThsbGuWudll5hTvRNnyGyUhg+JEkzXqchmknSp4Cf5G6lAEyTZrxfK+1
         ulJA07F5asKQttpgn8kvqorbEkbNfX2FipngrpafuYsHlCaaTtZE79TURu88+BlS0wB6
         aQLul+wm4YtlyuqoBeDlaKE7b4hEVeoUKCX3gxNXCIQbIdPVlXGJm8lNrLy2dk059C/5
         vvanvdJbrIucIudisDnRsjRkRLBuNYVzX+b9oIXTEjNU3Xi6qaEHFadztRcciUD5YhPL
         s9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833983; x=1795438783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcfNxQDKaTxKC3WY7d0/shn84qbuxfAl2J/mE8lsllI=;
        b=Bsg2MnKf3DygmaiK//QCOscdd5uwpUwWetmesBE6YnesK7rBpJ7ll9lGTrWnL73U9U
         3GVNd6UhVuEwGurfTQkpjFP86cP9Nz19vd+EdS5E0vhS/X2t3XmdgINOttecy3sx3BFw
         rrIN8jZyoW5s39BOgi1sPm4DK9f5YFfq92u/r/lG3fQU6NNsKTeWpXj9rVnwvZtyCiUY
         Ms4Acp5EGIlLhLrrlfPmL8xYwYsjsU2MYbgcTHrP2Xm1Z9RL9a/bQgO9UnjjDSNV8gUR
         d+1LqN0y0KA746NCUhdb+sN+KCKT2+1vA7GRAIn/CVdzNcl/R2l/f++Hn5L+5/e/GZCl
         L7Nw==
X-Forwarded-Encrypted: i=1; AL+hErEhW2DzQESlyTv0QOGfEKx5c7698YsWEYfQo+UBg7PHOSYXQKx1WY6gY15Uk1RBJHby4aA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+1xCb1MYFv20wH1BLmkE67/pY6hZ9PJpAqUi+C4xxUm7zFPVoI
	w+LNX4R+2whIVcIwO7Ut3GRxgDjN+Nr2wA5YIDztEpjHrrZfCXLdwmqJ
X-Gm-Gg: AYBFou2XdX0F4lePT1bPBoCPsOgqo9TpBwuIgPTZu8t6IPTayTwP22vJYEc93ygyxQ/
	wMRYYm+tiysTAwJYIfd8CrrdaMN57VZWxpCzU35QL3iN/8OQV/GXuzFuPk2H7HMoHTQ+tqgOBL6
	ApZV5wu5kOvkUcN+e+0Rdkx1AoU318/vFEEodTBtARSTl4YpNKSDbzefA3ifQHOkt570TGfwvfW
	HH9ld4uTbhoVoFrsM1f+kG2Nft6rrow+6nKcsi90lVwRg3124Yx8peu3csSfM5peHXbbSKugDUx
	9NFLGklK3gdsZHweXlC1Qaq9laNfP8pXas1OrE++N0TNOT8QH2zcftjzgyjt/Gj+otOnSOztUii
	F7qi/Y/y375PxoS/L7a9YCOO0/kZgiYJsJyTz9mHOV1fzacHTcCAYPNU5mNxrvemONjR5BADVRu
	4RDR0h6JStqAFJkHl4lRk1uJHZE1/bX6In7WNeOu52PcZP/pMvNNUfj5gSGxL+8Pa4oPZ1Tc1W0
	S0Vi/QGfcJo1MpJCoK4ZasQKk1gj0OZVI8HpydT/jR3kdVwExmPgG3UlFMkuKFC8iFXyVeHDn12
	u6nP0ShQbyqD2edtKXlBfUMRC2oIfRPxZwo=
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr231511055e9.12.1794833982968;
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm205471805e9.14.2026.11.16.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:59:42 -0800 (PST)
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
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: keep the error of a failed read
Date: Mon, 16 Nov 2026 13:59:40 +0100
Message-ID: <20261116125940.1368194-1-mehmet.fide@gmail.com>
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

When the count byte of an SMBus block read is larger than
I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
fails the read. The read of I2DR that took the count byte has started
the reception of one more byte, and its interrupt comes in while the
state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
that state, so the default case replaces -EPROTO with -EINVAL.

Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
returned.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read" and
    "i2c: imx: do not acknowledge the last byte of a block read of one
    byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
    that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
    alone and followed by a one byte read. Register 0x03 (0xae) as count
    byte: without the patch -EINVAL 40 of 40, and a print in the default
    case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
    -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
    0x13 read the same bytes as before, and the bus works after each
    failed read.

 drivers/i2c/busses/i2c-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..c7fef98934d4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 		wake_up(&i2c_imx->queue);
 		break;
 
+	case IMX_I2C_STATE_FAILED:
+		break;
+
 	default:
 		i2c_imx->i2csr = status;
 		i2c_imx->state = IMX_I2C_STATE_FAILED;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

