Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616625;
	b=xlfBL0NA4FWHJr9koEvJ+dBSvd1YfbxAC422mAg1eAlfqIytY4UsgHltgz4g2zpOc+m5
	 NIXb06anNHYlhtI4sRuSw6QdNCGWXx/fIhPBAQ2Zqw6+l5q4EyNqLz98jP9C19BIM4v6V
	 QatPb9xAdlfiprwirisa0iW8hjwjNGjmGw+e4aLybMSxa0nr/IwmgQKoBzgP6dXdxacev
	 MK8V3snirxsDp5ih12ZiChHCBqyRecJ4lFKUyFGZYkUHMFN9tI3I+gDSLx6KTm8y0dIAg
	 NhE5iHt2V+la6BvTMNEQgKuFUkzKJI4nq3Uhit3c6rpMvpajDyt7q7Ej7aVN3jP4oPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616625;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wLI3n7dT9jhrlDm7AKISWebGqJni218wwz7fppboSog=;
	b=TryE5ETygRfmUoCgUIDeBhRChOFI9wdrXiyj5iYIsXxALd08zAEyd4hs030aLqUwdH9D
	 +IzJpLvT7JNSc5RxJxz17nUmN378EB/RPS5V7l3ooF1WalaDQRWg4euLCOADDxh3+gpYq
	 c+jhjMtbwQHQL43BLC7D5pYlAxheba8O7v1ElrKBZArHiuyaM3v3qVuk+ribX/y7vOUfn
	 ag4KsJc2PUI0PTaGmD6MnHdxDqbq6JqhgKZTnC4eALwzpwjCJxNm29lAtx41CDGgXYKzX
	 sO5Ix9SZ230ZWu2vXThF73FTiYk7E8vhr/hEUUObjctoadn5wSCaMR4aA7ODUTyNmiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ENH9FpOe;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1C7606A324
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 10:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1C7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ENH9FpOe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ENH9FpOeuA591fFTlmdspBjtLKzeqHj4ycCM3nlnNCkNsFkCaGVR4YyEJa3+fsEe1j+hcPKx8iJ9g
	 Dyhz/F0TvuMO3qv1kxPzdoEH/qPZglTVksS/us34/SpP34qxhNjnWSnBMyqrIWjAUKe05luTK5tNdS
	 r60fAQ5vfSFgA5DM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46ae86adbc55-2956e;
	Mon, 02 Nov 2026 18:50:09 +0800 (CST)
X-RM-TRANSID:2ee46ae86adbc55-2956e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16ae86adfc73-cfa2a;
	Mon, 02 Nov 2026 18:50:08 +0800 (CST)
X-RM-TRANSID:2ee16ae86adfc73-cfa2a
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] pwm: mxs: Disable clock on invalid period error path
Date: Mon,  2 Nov 2026 18:50:05 +0800
Message-ID: <20261102105005.1007-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

mxs_pwm_apply() enables the clock when the PWM channel is currently
disabled, but when the requested period is too long to be represented
by the period divider it returns -EINVAL without disabling it again.

The PWM core does not roll back the hardware state when ->apply()
fails and pwm->state is only updated on success, so pwm_is_enabled()
still reports the old (disabled) state after the failed apply.  The
clock is shared by all channels of the chip and stays prepared and
enabled forever, and every further failed apply bumps the enable
count again.

Disable the clock on the error path, mirroring the condition used
when it was enabled.

Fixes: bf29c2ff82fd ("pwm: mxs: Implement ->apply()")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/pwm/pwm-mxs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
index e1a3df654..ece42da8e 100644
--- a/drivers/pwm/pwm-mxs.c
+++ b/drivers/pwm/pwm-mxs.c
@@ -78,8 +78,11 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (c < PERIOD_PERIOD_MAX)
 			break;
 		div++;
-		if (div >= PERIOD_CDIV_MAX)
+		if (div >= PERIOD_CDIV_MAX) {
+			if (!pwm_is_enabled(pwm))
+				clk_disable_unprepare(mxs->clk);
 			return -EINVAL;
+		}
 	}
 
 	period_cycles = c;


