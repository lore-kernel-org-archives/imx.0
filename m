Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832031;
	b=OJRUBgg44jhCy1JK9ib3+/EfhXlywM92wvufFxVsap/dbeKse/pjzqlpE2MKfOSRnjvq
	 Zx18crZ5DRpRtZFqkyJla3ZSjlrlPdVhr5LaHGNf52SPJz0BvMW7S7SUSgWOfDYWkHg8z
	 vVZtFDS3veV9jUMRpTUQgo39BX9SILrS4kcH+VB54ECiWS+dLJK5lgn9gppAGz2Dm+SyZ
	 MJM/HedVPJl+6OxXE1P8QkAH0ZpGXv8jQFtezZOmcosFanVN84LLOEvEGvWeDJbzhi7G3
	 cJRIxC2NMetmB3PyKcw7ypulkuCHRZqxmShkg87f2+CvxCNBJwB5bW3XmHSbCSqrNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
	b=H8o52/yeOs5b9mCNGJ32neeqp4WPUq8HAr1KLvf8NmrkAuJKExaoCUXk73XQfOVe20wi
	 8MnVkQ2Zk2EfYmwUYmEoPAEj1qpQxbtN+e7z97Zy5iIoXuDxY7sYRwwxOb+2biwZieSoZ
	 etghqr7xWfOKR7focPvl6tIHRirLaU5kegBoYCA3atXnQ6611NNEyY9U9W4v77STIsBUi
	 pGLI3zROsn+GHOSekg3yycOMDr/EwfX8uM8YigZA7O2gEAgbCF0zwKUObyvsWoYy3QUsX
	 sqOqYMknURtHeAn37GAUvWA043rVgM1S83NKOeJ3/qn13aCx4GIfkn+2XZsZuDVVcLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sSE+5RQL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E31606A331
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E31606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sSE+5RQL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb606491faso9929795e9.3
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832029; x=1795436829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=sSE+5RQL5DEdgZhjL745CO9zhq4Q+BDJtPsKH6R+GmoHrPbiJ2gV/yYfxEzb+3jj/9
         O54oXH2Z/9GdQkExMsxGOZU3pr+eFFrdKEkE2pnBOIyRaSFBcm4IwoCUcy1bHl2+hHaN
         k2EKM6GyjXshRpAj1ypj2GrT+pQlEljh8vu+qhCeR2s5EpsH9npgMP8ElGJLEmKPg2vD
         Vr1VCQZmk09aXxMLpzq8BY5AC0GkrZIpbYSnot6anJ6O7ufwO24k9UxyRWOevVMopmCQ
         j8tIBPHH1mAd1vMuTW8JdpJV0g/lqdvhtEKT+hfLumKnlOmXmLN7kfxNKDX+An5TDbgi
         IWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832029; x=1795436829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYiKs2zOREczoUXWCfabA4P+kj5kMFUufjVpxMQWxLc=;
        b=JvxgxMAcn6P8vk/qFm9AR6w0lugDf4VEVkxXxRcR0xHH34CRh54XpiCSuaHPINZtO7
         XCVhwz6Lq+cA+yb6hl9w2Z06osDYNsHJalm9pxfykPJF1Y3IyDs/vhLPC0ojcM6Oo0y6
         igGXAdWXdRReUuSYGhs5Y5K8xOytuhMicaC/65HUpwJHu3Eh78q09Slm8iOlQ4tO1M23
         7fYce5JoO+/vSGcheYJ/yJwW06hg+6Y+G3bjPMz2zCmnDjqKoztE9oNS4lce97jyLhyf
         S0x3kVsLVOlVBuBDJkYT5th9E6VXBDJ9Fuh6+BBJFHl8YE4FC0bFT9Bq/KpFWD9b0knS
         PGpg==
X-Forwarded-Encrypted: i=1; AL+hErHGWxSQqERlfEiwoR4pX/I5Kv2DpgcEW1E1anTt3y4KNWSwZtptoac12zIo3Iq+jFIDSr0=@lists.linux.dev
X-Gm-Message-State: APuU4Z93UXMw+raIVsABrddpvhGTvHpr8kNF3/D7OoqQ7JZHUj/ghx/F
	mH2d9hw/LuZEM4YU5tTstKW6yzW0Z7XC2IxVk6Xvjk5Yzr9c6T89rDBn
X-Gm-Gg: AYBFou2zXz+kdOiBEqpol4zvOgMNJzujGWDm/IUx0P8i7q1cDzfF9NH4fpZglqdZ8HE
	DsoL+ye78I3hpEZsNe54wvVAs7GI9v8QB+tpmQ84+IFhj4JkE+Fv6gl9wVunDtb0jDVejiUmbIr
	t9zCDULw59WUpeU1GrHFK3ggoQkNnFS5DWFnIBJ/JwgLUHj8c5jyL/+vsqsg30kaCby65AMEcEg
	oXnc1Q6k5TaH5CBBCJl7sKkmLBsOEODCR3iAXXSod13PxO5srRUgU3Wetv5AJ4zznJb1BwAya8d
	+jRsSqE0o2uBOD8wpbWBF5jDM0RzWPy8k+vsDUaLdy//0BRl04Qkti3J8ZCzuGzUEqAY8vOnGkr
	LMpIW/9ojYdpqnQBpAv1/Doay++YnZ3CVcJqF1JHGuYCB0GfNxD/OKLbv84EPUmsgxMU4w37T8m
	Iy76I7nPoAAGd5wzFAQQSZVw/dj5OKXkTLdT0GUP5ZxCbMCDZDhZmTvChXYuB/l1qg7e23lRFAt
	K+Dim8iE5UTUBj77FEyu3UQ0sW+5rEw9ha/7A7oZYjV7r+whDq03HFiD360kLruMAlckNrYn6e7
	gdDXsDVCpsOQ7X+8TYNkv1NrrKBPJ6e8Njo=
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr82826765e9.29.1794832028780;
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm171999685e9.2.2026.11.16.04.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:27:08 -0800 (PST)
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
Subject: [PATCH] i2c: imx: acknowledge the count byte of an atomic block read
Date: Mon, 16 Nov 2026 13:27:06 +0100
Message-ID: <20261116122707.1349139-1-mehmet.fide@gmail.com>
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

i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
I2CR_TXAK only for a message longer than one byte, so the atomic read
does not acknowledge the count byte. The target stops sending, the rest
of the block is read as 0xff and the transfer reports success.

The test for I2C_M_RECV_LEN was dropped when the read was split into
i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
fix emulated smbus block read") added it back to the interrupt driven
read only. The DMA read never gets an I2C_M_RECV_LEN message.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Reported by the Sashiko review of "i2c: imx: test the block read flag of
    the message that is read":
    https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
    
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
    the M41T0 RTC at 0x68. The core takes the atomic path only after
    SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
    disabled, with the two messages that i2c_smbus_xfer_emulated() builds
    for a block read. Register 0x04 (0x13) as count byte: without the patch
    0x13 and then 0xff (50 of 50, return 2); with it the next registers,
    the same bytes as the interrupt driven read (50 of 50). With a count
    byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..1a3fc245d6ba 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
 	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
 	 * length is unknown
 	 */
-	if (msgs->len - 1)
+	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 	if (use_dma)
 		temp |= I2CR_DMAEN;

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

