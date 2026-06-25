Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAC3594A
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403355; cv=none; b=eiGYKyc0WQnfI+FWCCTbJ9dUktb5VFb/23W3vVNDHFRX+iKAUNFdgixVhEtgWQebH6Z2LQpQyVgo81S/7YHfcGPb9oVWc9cwrVPEb4SPrMnt8IFAkeCq1+Qu9ew/c29mtVe0EWP8BbHsSavrmKMsHCH04/GtTVJjzOSNP2EL87M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403355; c=relaxed/simple;
	bh=L9c5Szdgt8qF07KpP6DJofk4aMPG49dmybsPbBc1Q4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiEbPR/6Pd/VtVH1AkqJII+0rXo57QocG8Zm1Zan/cSmFyfGPAAhxr+b4VV27J3OB4NJ+BsANyQ9TotEBCz6GDOWc5xtBBQEFJzX5OixL8rSOjrwFVprNY/NbLuFM/E3f0Oo1xPvQiymHLF8RNAcHLy1n2crKTTcNMBfoPGdfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4d6Vd1J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4d6Vd1J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso1090825ad.1
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403353; x=1783008153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uBKJbZacR7qpAxgkxKTYuFWT8lf0EijVUm+JTDcFsE=;
        b=W4d6Vd1JkL735iU//Bx16D+5zuTFv35mzNPHEBZtPTS6fYbifcFAjniAOy6SkeJHH6
         TU01yox/U3gabzVldcnmhTwGSakqjAlRRNkFWd8+ZUoVYma5oUPWDJR9HjTVI58kDOF1
         6YKczwSkW6+fh8gDRgLSS03wUq8VwaDjUxVFUHhmtqf5CH5SClfi4iXLAieKPbZfzOj9
         1e7xOpbsCm87BHYc5ARPfzvC383WPjcSA3Gsn4hVG7fXG2RpSxE7qRyMGyVUjwuzIA0G
         fadKSQWUJ5tPSfIEqe9V1bDnxFNI0XrpOWfJpjpniW/+Y352udomKpfEHRrTb37RdKnm
         R4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403353; x=1783008153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uBKJbZacR7qpAxgkxKTYuFWT8lf0EijVUm+JTDcFsE=;
        b=jojZsi+HGyIlrxbrhRE5O4YoYbMD0snuV35BlVQ+J55amPz8qPM8gxyPvgMfosBzh+
         nBc39owoAT/jOJoG2n1xZHKoekDiRvZF32tGw5ddiaGPDBhmE+p8kqjlkWoLhtfmYIzT
         vROJs4HxWHeVLHnrdba0AuZ9QoalwqSjyQYfSjHSv89+2eWrTVBpyeBPIuYXoUav+CBj
         bDYPJmLF1E8pXMP02kez2R58x1y0pQ9xMvms2hOb5rwTHEMEh00KCx0U08P2oveUauIH
         RHY9JgkbFXyS0qpn+3Gvgb7hifrC3XNxJ6F2+D/QxKq/ppbciO+ocCofrvssVUVOgQN4
         gs3g==
X-Forwarded-Encrypted: i=1; AHgh+RoxbzfkCDWvwL2/9FGTvWMPBPDdvRZGLV1N4BghSp9AODaHbjTDgXsCfGkoIUiVkjymQRc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFRSRUwYpW130HdTeSNQKRcwW0UH8s2PuFB0UlTwri5GeXNahi
	WiN0jfW2leD95+IOFiR6FSeD/da6pGPfkD+biONZlsiAncnJtW9cfVGI
X-Gm-Gg: AfdE7cmGuEvQSfhIn9a4DEGwL/JGq5C+ahonXAtqHWba1gMOal+pLWByvH1INDeQUfu
	C6SyyTs2x8ifvWDambbYDVrrZ2kf/zoFxb/JWlFC3Vzkz8ZlqteBHMjb96ohHjy8EAS7wTVKMmq
	EaaDu+1b2m0Euxc26pu/nxLhFR0Jm+UMsZ7c74QmCGOhLyFMUNEtqtBDkajRf68IyZGYH0DEesT
	TXNfFtjjJMCGTBZKIydnJYtLilBr2AelBd0eU0SPs/P5N4B78XiWOtSdQnguiFgXkYHbXTnA97O
	aaPizzAhLCwYE29goPMyKKGjm1UpwqKoU2FJahLdGL575EnuKlq0YJNS+uOen/gDQ4DnbjhtYMZ
	BoO6lYl6jLU6TR9ZxhGE5LZAcOYQIanLVPw63GSMP+ZS4cCzmJBUayJVBLTe05sOwxNBqwfXYYN
	GQ+7hogcDHhIs9Y1WhidsRRIUwh9sC24drBze0
X-Received: by 2002:a17:902:d483:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c7fc708aa6mr35566035ad.8.1782403352803;
        Thu, 25 Jun 2026 09:02:32 -0700 (PDT)
Received: from liem-TUF-Gaming-FX505GM-FX86FM ([240e:39b:ee0:1b70:943:8348:4ae1:4072])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac88cfsm24127925ad.2.2026.06.25.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:02:32 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Biwen Li <biwen.li@nxp.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH v2] i2c: imx: Fix slave registration error path and missing timer cleanup
Date: Fri, 26 Jun 2026 00:02:19 +0800
Message-ID: <20260625160219.55116-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625071130.93544-1-liem16213@gmail.com>
References: <20260625071130.93544-1-liem16213@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two issues that affect the i2c-imx slave handling:

1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
   and the function returns -EBUSY if it is non-NULL.  If
   pm_runtime_resume_and_get() fails later, the error path returns
   without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
   attempts to register a slave will then immediately fail with
   -EBUSY, making it impossible to register the slave again.  Fix
   by setting i2c_imx->slave = NULL on the error path.

2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
   disabling interrupts.  However, a pending interrupt might already
   have started the hrtimer (i2c_imx_slave_timeout) before the pointer
   was cleared.  If the hrtimer fires after i2c_imx->slave is set to
   NULL, the timer callback i2c_imx_slave_finish_op() will call
   i2c_imx_slave_event() with a NULL slave pointer, and the
   last_slave_event check loop in i2c_imx_slave_finish_op() may cause
   a system hang because last_slave_event is no longer updated.  Fix
   by canceling the hrtimer and waiting for it to complete after
   disabling interrupts, before clearing the slave pointer.

Both issues can trigger a kernel oops, system hang, or permanent
slave registration failure under certain race conditions.  Add the
missing NULL assignment and the missing hrtimer cleanup to harden
the slave path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
v1 -> v2:
  - Instead of adding a NULL check in i2c_imx_slave_event(), cancel
    the hrtimer and wait for it to finish in i2c_imx_unreg_slave()
    after disabling interrupts, as suggested by <Carlos Song>.
    This avoids a potential hang in the last_slave_event loop in
    i2c_imx_slave_finish_op().
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..04ffb927aba9 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
@@ -957,7 +958,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
 
 	i2c_imx_reset_regs(i2c_imx);
-
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.53.0

