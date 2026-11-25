Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591245;
	b=xmX13f8rboQj/62UnQLi1KySSz9+dlYITGysM8ngQeL0mSGR9Q0KJ2bmnuvoLag6drLT
	 2G1whaD24zBuBDsr+Iq/To3AYEgWOKxhK9l84hMuLS2ildstBBTUcJAC88GGzX90e987a
	 KHaGhMER7WlGZNsKLQm8xHejJYdVbTr3J6WDbaY6JhGDvexM3KX2GJd3tKC0QnjifmGCu
	 R8yKddIluzSlnj0HyvwpucJ7RlA+zVvEv6iuleGyhQ6fOLyCw67bBkIBrGK3+8Y0IWunF
	 xouM76vCKQ1JJ6x3jhoznwBrMaigUKWdTd0v6tBwKvitQM61dq7HCLHYtVG6rktZB0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
	b=pEFgjMi6hS5pKhmDDZYd9MjMuXkwmk1QCN3Hafl7WsC4rbh9PWfVb19J70n3fIEqYUsX
	 ww/Xm8M8X6niApNjGvOhFJLvEA7nv+L3JOQQtv1Zz4ccBPHXvIy+To71sEEGXnWnzAApN
	 1FeqjpnsiG5AgXR+6wMlbrZyq6m67t2CGvx/HuZD6iUyAnfWWEY/CMHZS3ChJnjS9wNXG
	 WWI4SMuBjI4G4sZTRMtEnmS3i6e7liIcErrpewHDLBILHHqBAzVZEJOYvbZiGV1iTdpY0
	 B/esO3wwVaR0TIjVkPYCAzDPgvJBwnOnX1S26qmL9Xlr+QxAmjFPfQAL5kwGSzNtLEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aIAD2Lc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5BC606A339
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5BC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aIAD2Lc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso4665561eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591242; x=1796196042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=0aIAD2LcwX3Y7SwlPvDhMUXmJHXs1+SYMG8BKGQLAV9qTSpCZvDJQ+hzhkcpRVPlxU
         l1SUiYbhcziKFn3TKEzAFYF39AlEQ0R2WBNLiC5Pxgr51BYcyrRaxb8UgFIwJda8HVYl
         qfo7r5KOHu9q6V8LFEG2iaT3Es2AXnxA5SNhwLAemHi+spIpdLKJsvB5/CEha9gjU306
         t10bsGkzE0CYb2T4DMnbjSiAGGO2IL+jjn0j+YtEPaMHlLt5BPZ3wA/7SzUrpB+488tq
         oE9jVEyjAvf2O5Cs4n+Vub5h0RsLfWe/mpPREWzvZ/sQ3cNIEaQILuXDiQqbGeDqLfye
         JmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591242; x=1796196042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=bPU7h0fAYmNXrcezu+AkCtnvMxNH8UORdtTgzVCYRfEr1hKNGYtSlSrTxh/uNxa4eO
         qWAEptfBI3vG8wpsCneC/F8TDLaGqtQn/6LIeV7YxfkwDG46tMZ1B/39e+Xb19ys0fLd
         TPyvqjXY0+MzQtVIx1uK33KyoE5d4ml8FrVy+Lzcy1fAc1RFAQj0sbp/0pH7sS/zd0YU
         fs1tXPOAnBoGryeoCfhfCbtcVZ/XX3yazIdnS5dG8cfPEPfP/eQwocy9SE+1hQx1MFJL
         gYp/emY5b4MCBIhLUeWD3iQwFL8wJ7sNNsD+DXUl1jAsfzZN9gcV1crUKGvZP8k/MnJO
         qOJQ==
X-Forwarded-Encrypted: i=1; AL+hErHPOFsjvl0DgMPwywLuj6fRcp1ShbO92L4hpFeWTATQ0k1wpmRgW3kopQ0f+FeSd29+OxM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/nJ4FhHoUKXrl0eoVeLowio6Mv7qjz+y5yihrvhPg4S+vp44Mq
	ufKGCMtWv0TiynnYim6XWWHZGX4eUAmIdJPj8A8eaRMSolA6yV0pS0Ap
X-Gm-Gg: AZFdTZfKKcqp4bTYXzS9K1Y7K9ZCkO42VclW84YqiWPekhc/1uZ2vPP/WAZtJC1sNZz
	6tgQOav/b1wdlqZXKIzKtAL/NKfd/SPMi2+QKe+guIpaFNRrWr5d0q4tcbI5+krvMbNbTwh6ITP
	sMJPHu8/LUtl8LwfipIat5oEVP86131bo0sRme1t5MGXs8Arh8rlzAat1ktlSZkYw5wj2aZ+e/m
	uQMrx38Wj6yOwnBbs/MPXMZXFqHKE9QIm1hSTBaINZfHJr/1CdGjCqa2I9POLbpURCFoIkBc1u6
	2MZrMJZUC2rugSp7pa0WQQfizFD14mUOTvnAUbxy1Glf8JTNUroS0AqFhqqrlZvA9423QnaP9Ef
	U2YZgRt+tLDqbzf73rrSDOf9vEJdUA+g/MZl+is94wmEOzqchsxrk4Z3dLoz5QCzgtLp+CNVnP2
	iXjj3ULQLm53LMLtNeUJ+gX5Mmrp8ak7CC39+4ObdwCBB9psMkVpWU1Wf3Efs0j0Mj/m9uF9Yj8
	RSWafFu9xCkFigubmBlVekwxwb/fHzAL7hAgEMMvaAjQfCs++FgggxcxUDp+96Q6RzFfPwlQu+d
	jxqju4Ca3YBEmhn+vw/mzS9udKO+bwfSE1P13+J76mqLL/yXntBJroCWU4Gr4cZh
X-Received: by 2002:a05:7301:7309:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-384b3e788a3mr19263978eec.13.1795591242157;
        Tue, 24 Nov 2026 23:20:42 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:41 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:15 +0900
Message-Id: <20261125072026.2997493-2-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old
wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
the driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
through sysfs.

I used an AI assistant (Claude) to find this and write the change.

Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-snvs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index d99a352d6..647952dcd 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, data->irq);
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
+
+	ret = devm_pm_set_wake_irq(&pdev->dev, data->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0

