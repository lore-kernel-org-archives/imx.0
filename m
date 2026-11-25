Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591248;
	b=teI4g0RmxS492PD4LFm6kkCwdRn0hOijWkkLtVv3EUtuKbQ9HbZARiUlJONCdkeX/ka/
	 viOpMwzVqeAHdoi5wtdgFwMa/YyXTm7xB3rnwk8f5YbWvOGNXaQnZandi4PIh027IUyOH
	 yL+ckm4lGvFDDy/CSyf9HvBxGG+2XwvlqVEnC4Bcq9PdR10UVupEKLbnI7pfYukhgr2aQ
	 I8tvcBtfmb+AWpRa5ZseSIclMCZJdZkVhE3gUbSGSKKRbikQI/nrBO3aCkn5KErxLXR2F
	 2rscQAM9f/75Yc6+nL6Ik7xJf8JVccSvaz/r+INFC4u2E2dsXLpXIKjs/24OJOIfDnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
	b=bvlrfrH4VIkhwXQN30E8kKzQAjyK36ky4qCfBDv2lC5w2wJX/1z+SlG9ogCDyVOn9XHh
	 WufoG2XxIgWnYk117122/Yw1U19pPSRmND5/jrZov3WHwnqAibhcWp0AKOK/CfHfijPM2
	 S/2O1zyM+XxqdVDsUrGB9Y3ttg7axxUOQvPcHMTXNw0AIZT7o/BGt7uBNeLjuQckYCQ6O
	 H7CWaT/wQLdS0wwbw+obvK1Ka58Z4Ba4poOI+gXQ0ZbtUqWLghvmAR5VlHFxXDCsnKP+B
	 ZA7vkZvMBXsSi8VbBAIJXGVWqs4K/RXW9UXZGxW/Y3v6ZutLTOu2//prAQFfrVmXrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X6THH/nY";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02D606A680
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F02D606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6THH/nY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386bd881d39so3832875eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591245; x=1796196045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=X6THH/nYktmwHIytqNOqGGPbW+iJYzRF7HyGJAEHu97sRpfE5z3B5hejHr/JssETm9
         sEEwMKp2AR49r4j66i/F+Cj156/7+b0zthEcFO3J/3xX4vHU+ZlP7ja91sCnSd0FHPgQ
         F/BiID/ZlGYa8M7bWaqoQiGO6GNrXAJs8yV/OlBY9ebcLQnphMFjxqh46LXpz6kLcBbq
         gaEND8ttxYCNDGLMHyoaR8CBd1dl2X9uJSJzuiC3gLYtPETFUw70D27z0X+fkc5PSD7Y
         Ens40pEoUiHG4jddF0SDnJ2BpL/y25975GWfHVnLXJsfBaUFYZ0huxsTt1KqtaUEhJed
         rxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591245; x=1796196045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KKnP52JX79Zys90VqZLV9ybW1ETyKOn8HIAm5soPhQ=;
        b=OO6b6QXvUV4YVoCH6/k1L7tp8ZMe+rckwqjo+uW2IjHoLUA3eP/OQaaoyEf2M4gljI
         6SwbltheXiwaSHchbVaPKSJXdh/QrNolmqdNg+pKcSF4+CFt8skKCWCpTNYVXURLaNPA
         P+vVldeyWtXwvp/8hN6v3j8/QVsFBgDse1+ba1q/+1iwK/yaN8Ar9Z7TyuQWTdA/na9r
         PZ08t88+fXKDYbgmytVQbnn3NZuK69boxGy9JfeAvk8ulPPlJH/0nhxAbIR2eaPb28Ie
         Zbq8qAcSExICa+Q2ZeZqaXeWuYR0Z97RdADZCAuw5lCtPtHpXd/bun23LFHObR9BU0lV
         9Hag==
X-Forwarded-Encrypted: i=1; AL+hErH3OiLdgvyASz4BhKSww1WofogFw0lkmgAqCTut3yvht/uZ819zME52BTyRCrr4T2IXw9U=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TPiO3lzfTvwJjA6OIFvh+AvtFXtHcNihCwewUuo5m/9fIMv6J
	ELrLfT8pErnbnQ3JFvQsI/G21bl7bJRDDTS4yXJI+X18PA8GaS3mib6l
X-Gm-Gg: AZFdTZeUvDYFIcSFsnX0mJOmVP55k4SxgPVrbGbt3xcCnDF2g3DqkTO7Gk/3RHxA2kT
	ZfpO5f7u8gqBLmnfQ0k7ja6BBWWmrN0vaqAYD825c9XM8WqbUyQ/UPIlCNQWWnblgqPMQ/vKZog
	5uRFzfT5s/VuGvtgAPmsLiygFqzza/pI4fkGpEjRFNCyDFO88qZpdBH/H6BQ5B8MSrMSSI4dvtU
	CZ/CzZFCPYPEvLSFBKVa16pvtV+X+uElepJavtBnvNEJdmlaBDoB3DQD4XciI23dxgY3F99Sn0L
	PL86XlakYumHRIBoIxFbjoZ8fi8Cf1Oi/Bbz/0JSDhrtILjUASxodozYcxRVMLba7jflkrK0E/L
	Hus0SBrSBrwQ0LaH/EWOaFZSDCU6S4NZCijDKP9LDGUQ/kO2LYgUiss2xB97B0xSq+awf8/OOKZ
	cUvxMbD4Sq4FOquAdOQa02299nA2J8zo766mKtv/k8JcC7KkFazHgmO+lFNtElNzYBfOkuBIZri
	7pWnaj7KUbyHbeCFcj0rKFx6pxVvHx+UTq1BhipvE67SP0VplJayIrVVrG97XAgc8y91UmyYPFv
	yzzuN2BoceBiu7EAGQAasPGSdfyPXH3lkjjOXlRwAEdTAFOBDnNpngg0ExakOF6tfBtenfIZlYK
	fWR8tJ+N6Lg==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr28249889eec.38.1795591245029;
        Tue, 24 Nov 2026 23:20:45 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:44 -0800 (PST)
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
Subject: [PATCH 02/12] rtc: mxc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:16 +0900
Message-Id: <20261125072026.2997493-3-prasanth.r@lineo.co.jp>
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

When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
IRQ, warns "wake irq already initialized" and returns -EEXIST, so the
driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: bc0e731fc289 ("rtc: mxc: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index f91b0994b..90b383896 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -377,8 +377,8 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->irq >= 0) {
-		device_init_wakeup(&pdev->dev, true);
-		ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+		devm_device_init_wakeup(&pdev->dev);
+		ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 		if (ret)
 			dev_err(&pdev->dev, "failed to enable irq wake\n");
 	}
-- 
2.43.0

