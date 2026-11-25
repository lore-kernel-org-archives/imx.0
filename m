Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591268;
	b=FS+Y9pkhmIjSn+PzHQE21CJcVDmuAqSFhksbGQM0lQykQYyNrn1G6sVs+cezGrDqFYzl
	 3zafGrGHU7XiIL1aURvcplGt1oNorR0KTbiVQz1/PkkuaahbuAll6r3VRAZHCL/x2Hve1
	 nczBqOo3Kdk5kvtGKXwv/T/6ujADn5/78SPp8tuwJMCWusSmXko9/X3rR3TloWDDNv1Gu
	 YN15c9V6UZzSl0G/Smm7sFwalSU7aAL5sjOlLm/xISXC+vggOh5zuRpCw5v66KKZ3efcW
	 J0Z/avaSEtlypTh97QyaCHNlDJQYPJWk1Jd8SBg58UHme6EkgeUt4oOsc1xhqALrjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
	b=BTVbqvns+u757nv+DyDYLNFl6o57QUjHYk7b6sDxzWOQr2s0c6LPpRyeqMr57uIyMnGo
	 CP7bXDtpwyRoj9HtaAdKIdDqzilCC/9M69tW8op7sUw5WGcjpJcpJJD/1agGn1b1BD+dy
	 e//H2hE6Ez5WqOIKt1x2qTl1+JWS0UVfhPKisLQc6jaL8W1lJaD6jeuWzAFem32Tql3Ei
	 1QhCzSKXOEfA4LHR03n/iAFcUT3NJWVD1Pa7JEHPsE8BcBIbM9kikH/v9OjImhq36wZjL
	 9bMQYfMJVIlPAKlyX3ZTx8/hoZ18Zw2GbUYsYnNcKtEuUKLaOUxAkoAFfjs85mhabuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgbHuHrS;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29128606A329
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29128606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgbHuHrS
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so9102158c88.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591267; x=1796196067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=MgbHuHrSS1ICUAHZfBZClTuNg3ahChJKWlhV2zawAhYeZomb+DEaa+XkLXzzex9kVv
         zIJzyFD99qH9A0OFqF11fXhOu2nGFxnktfvLffnptS+N0emhKvXqXSmDqA9wvxLUoq8N
         RJUMg8s+4RZMKxtc12Wpdhg0cZJHc0VY+IasOiWLghw6zzBUMk2zioW/Tqem1OxQpq2Z
         0EdzKeXaSTub43QKda++g9d3ihSfbNHch3PopM5rMdJpIeoPCHCpINFwFBii4CviRUk1
         q04JYnv5DhISlOklxTFEYh2H2X1jqOs9SIajftVUrfRhI1Kn1CIlut1IjhER7fICcurK
         CsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591267; x=1796196067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcFff7HY6eDo+GTRdfvS1BQ2GmIPXiVD/xQ1R+6xH7Q=;
        b=dlh4hC74SzuhuPTpNdp/T16ksdrJ+Yj/KMQOCbZ58Pqns9MHxb+NhV311bZOsFQZiZ
         z6o2QeTTJ8YPBEwh8/8iSv9UpnX4BATTr6fEkESLRIgKr2J14SQKeQaM+XhZvd2f35o4
         3h+fffeLDXpkOalOef6puvs1TfvRzQWzIPJs8Cts08x7b0E5mjdpuw8xGmQnPGL/3NZZ
         wkp6ALIrqZCVVbgPrJNGZMjfu1Als5aAYmSKxNsLrqScVCDtrFnoxrLhtj8XVAWAtiRN
         3Z+6AoU6wsUeQ6yM6/PTjZlUQC2Iag939Et78C86AqS5EpaZAjM0MXshc7unGf5dHMel
         GdJg==
X-Forwarded-Encrypted: i=1; AL+hErEErHGOjKri90kY6qLxUuPZiyn/3lTzD+7EUz9j+YnpOS1tEaV7scAG9Ni7ycvU2xYq52w=@lists.linux.dev
X-Gm-Message-State: APuU4Z99cnms++0zm3jkjRAO9P5v0Cl5olTIIDgeLcBPOWblFGEijGBS
	x0eH5OGjpDgakTLO3UAY9j2Q2uieGMlwrY9oUWlslwsxMOKc+ImHqoou
X-Gm-Gg: AZFdTZfsn0u4udGeyJxfgREd24L0IoaAVTATQ1yYnNJGu0DP09DY00B7d/yUcZUpzgP
	cSik2QjYNEaxgd18PGsuqYbILlKJqcOMLN3CLXx/JMO1qf+xoCC9qDSjeLbo5QHxpzVdm0mqPt7
	CBTS3ZadSMqgLX2BRvcb9QlMgic9EivRYuK7mOwPRuFuaBfZ1RXTg41rUn6Q9/yE3xYZ3Zk2stR
	PgCrW0Txf6wNAJEVUF9wisFIOfxMkT+Ux2k1dOSOOgq8tlmsFXNF2ksy5cqVilKJdt1JyW7h7Rk
	dIbG/ZXBezDp55sMuJrz/uWZDxZFJlRaLu2Pgk94snk5oAEYdLP+LQwZKKBDyhaa78sW25Ayess
	shLYFAMkah6copll7pcwAVacFMDcwg1zKcfPDINTdrp9lNdQgTK0RKJgF9zSeeEqYMmUQn1Wb3R
	n5JzmIGKhss7J7A2/1YlmjKIiu4vHbDwB3ke4yNf3pmN+/J25mDrYrybGYJoInGM9RTPIHa8O1O
	M4TkTYOT79wXteTiJkzLPrmkuAwFtvVPHsvscxBAr5ws9WVF2T+ej9QLl58hSyhXL2ISMOVNic3
	jeVKB8FU8df5QgeeYOtENdpqky+t6c4YzOcVrz7Pk2qonHQNDxU8p3ZSQplCJYW+
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr17934967eec.33.1795591267072;
        Tue, 24 Nov 2026 23:21:07 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:06 -0800 (PST)
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
Subject: [PATCH 10/12] rtc: pcf8523: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:24 +0900
Message-Id: <20261125072026.2997493-11-prasanth.r@lineo.co.jp>
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
IRQ, warns "wake irq already initialized" and returns -EEXIST.

Use the device-managed variants so both are released on unbind.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 13e37b7fb75d ("rtc: pcf8523: add alarm support")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-pcf8523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index bbd42358a..df70a374e 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -484,12 +484,12 @@ static int pcf8523_probe(struct i2c_client *client)
 		if (err)
 			return err;
 
-		dev_pm_set_wake_irq(&client->dev, client->irq);
+		devm_pm_set_wake_irq(&client->dev, client->irq);
 	}
 
 	wakeup_source = of_property_read_bool(client->dev.of_node, "wakeup-source");
 	if (client->irq > 0 || wakeup_source)
-		device_init_wakeup(&client->dev, true);
+		devm_device_init_wakeup(&client->dev);
 
 	return devm_rtc_register_device(rtc);
 }
-- 
2.43.0

