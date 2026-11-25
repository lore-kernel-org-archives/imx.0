Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591262;
	b=oKJCoCqPRFct2g2zrVFbPy4Ec2jOFN7x9hVUa/NdlF9atV62q2iIRBEQBxIZwj5UjR58
	 mO1fTSNKl2RJ/IWWjtT5fdStSDNQXzBE/ctiDg5Gxuszbu9nVL9jx+ofcWPm3A2yXI9Gx
	 0eAq0msN4JQ7g/nJTbxAh3jQEIGmjk5ZxNuYhkB/RaoJ6PBRWnt8oCaqg3hfG5aC0DwJz
	 9V/XyQTW63lxAUwC+n7aTYmPxmm1Hl/dmeIu/rwYm4vflEhlODYKWWJ2pPxF8XmABbZtw
	 JvOIPBxutcEWCFj+ENmv9WhVqvK5IqUz+xKi0dr3hjg+KDrAN1ahr/Cq4+7NABFHD/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
	b=tDZCN0ldHBB1CQXStErfFSgKYBVE4AHv5Z+o+9nQZ12p0ByJAOJwvbXN3U8W/pM0Jaui
	 IsFjcwJnbjRkS61SXR4cHeq8mcMO/5jqy1EyNlqV3aqAEgdwzP/J+DRripTBMIakTZsQ2
	 0QStzPCgWFk0FL+r+g9ZeNyb3SCLi8zwJhZ3DNC79lN4wnkkQ7ui9tFviDkaVPf3mpW3u
	 cYEQEUpwWrmkY3VUw9JndhM7e1RsvyQ8K66VVlNGHm5YrCg7mFjWWc2mFzEOKh+kPjljv
	 kDcyBjx72uD6EtAiJ0TWaJ+IaksH40kgHLRj/fp8PXk8bHJDRHiPWpJ/KYkMYdLut6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIJ0Lip8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8632D606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8632D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HIJ0Lip8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2471943eec.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591262; x=1796196062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=HIJ0Lip8O0edkERvPtn6D+YRbQ+mQjAGTX//BpnMGp6RcrRJZmwaXmnud5TgIEz6Gr
         OknE0XQjDRC/4kXtcVzxzYfF38VXEf92kiLaLu07z0YBY4GtuZ24uraHUqj3WwirzjGg
         DNTMJVbXj0hwIFVnBeShHm1WAF9sYxXVKY3QAH8T0X2F89/T8X4gZsML2sWvQlrENDrJ
         XIZkj0oglAGr1Rw1+b433wur0ixQ9CstaicuU2OVJdQwEmEIlbXzYbXwz6j34BcF4DRE
         /4AmniwJZsfkiR/YdxILEjx1QS6Tf3o3WDTUsqffXM7pO1CLJLkHhD6r+arh6xHFdm3c
         Bfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591262; x=1796196062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtVSmu/GGPVuhZAgkgs5kn9m+hoaQiyFsreDAgh6jZo=;
        b=fonZOKqyEJrPoImcYoPf9mezOKru/EB6ddV3HU3ru7LAi3GDcPWxxLSwbxJ4y/75xa
         X0czmrgS5e/zZ50meqs14m904J1bcNON2HkkB6Pp9SjcdEdD+c5nalInpUrlN2n1OLdk
         gocpmpHx8H4AAP3l2uoqOZSveKR0cgo7hmUPYv2aZhkVrb3xI7xtFH7pDc62fEjHu2OQ
         PqqSkves5UItCokNuh7ayORagRGIiMXREcRsHhafL5PqD5PKOKmYQSfoFgkSCUn4hE8F
         Kp7p17M9Ab839S+qtqXpYt7T2OymwXLdh+WkUoAtkERmHcuka/YIclDFxc2ttzesGLvb
         minw==
X-Forwarded-Encrypted: i=1; AL+hErHnRa8R9tDuy7GtJ2JVhj6FTAbsOvfg7NYTP/u+FaAflpOqL7U2GEv7xMv5GXtcNB5Ftt8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8UFGUOvoThpoCkx2rT1ianiIUhajnBX1fWbreA72PL/vWUvxa8
	opCmp6JBRS+HoFCVcaTKQ6NzN2zk5pArGL4EPvzPy53WqwvB/wCQC5p5
X-Gm-Gg: AZFdTZewlEn1THsdm1cnQdXHWLmKWEZputVVmizFU1znvrWYC5Wh+4koK/f9ZCR1W3i
	dKz/MLTUX20VA+4chWv4Z5dt+usc71yJeODSw0+cg23/wjx1bPqrNACRzOJCF32oFfTTtAUA25h
	sDl7bZIgIfXpsxdLhJ4uTgg47H5FZF+pVOZUvBm2Wo/Wkr1kkjHs0a2NR+PS7L5W/KY9DPqR0em
	okzCiwCfXt9/3Fig2WsJ/mUZoF05UjbrnlDqvictYI0A9//UExWBZ5qzZs4BkWIO8ExuB6Kfz5Y
	fDvGhS/784RMT3cBnRR9tcyuA9J3J4HC/sD1n58uU+clW/ZbRUZuqSBj6Cu6GIvESDcWQTn/JyK
	j7cbzFjofCtFvP26p/+YDYr9Wyt4kCk6iYj0dGr+r0JshXBdpmFu228dHL7hRpVf+vVtl4MrV9X
	73pYgYDhQyRnRZ5BHRUe+mKvUHzSa6JHO2w8+va7hVV8cpYpzVemOm7yf37WOA6jv+zrAzza2fs
	hlM5tMsEXrHUiEFo2eyA272eFvovLlFrhsSbMR0H0zrVdR3j//CDfFWq/kiSTVmeRr9QKPmU9F/
	RLCY9TGU7mAKXcd3YA/mgqzURcaKNMLhNMJ7Q1EPEudeJGoRzh1nxC7z8j1ABWfNtB8VAP8w1tv
	bqrzj8rhdgA==
X-Received: by 2002:a05:7300:f68e:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-3857015357fmr17092295eec.25.1795591261375;
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:01 -0800 (PST)
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
Subject: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:22 +0900
Message-Id: <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
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
IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
fails with "Failed to set wake irq" and the RTC cannot be bound again.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 3b2dc19ff9a1 ("rtc: jz4740: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-jz4740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 32c331f3f..41501c9ed 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -367,9 +367,9 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc);
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 
-	ret = dev_pm_set_wake_irq(dev, irq);
+	ret = devm_pm_set_wake_irq(dev, irq);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set wake irq\n");
 
-- 
2.43.0

