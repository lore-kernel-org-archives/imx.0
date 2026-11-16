Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869300;
	b=nkBILbfSta2krdPm/OOKjyhNAzGkCpz9wGPY8bbDJjAfS92A9apGZWFbMix6d2G0u9J7
	 9mmW+aDId+rn2yBOJ+g15EcabHdD/a5SggDmx7E+ehEdPiw+h7mBfRbBBavRTPBhosrxU
	 wB+cwWqqB0wrwStVbcKXNBnVWjFr9QLkEU0l30XCLT5wwjpxv3zZVhYu19BqRnpKwtOCQ
	 tHIO12cnnHfZtwpybDphY9cG3CGn2QkeiidOv9P8sTVu5j1g07YvCbN0oV+7F85w9eGd2
	 ciKIt1WGQpsDJ4j94vThyb13B+Y4Bq2HAQFoCJSAlsZLV1dO+lBevdbbHtkZklECuJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
	b=vQ4zkQEoORecT9Fo0YoWDeuA3rmkwZteTTejhjTAYHUR1SfOp3axwf0dply2jdD86OSr
	 k3q7TXWDFZEdM8iMQRRTMpqyP92bf3SpO5l9sE91iwkmcpr6MPP4J7was40sAaKT46IE7
	 D87yufhNYuptNWFJB/rh4tRz5cY+fyh2T5u0qeinX3qtROlCvdG7SvYRR3Rj/uhO43kyc
	 ZLcjRgB96DX6W9lbw04z0xDdjDuxSeYRASARdU6Jvhtk2ZX0XSZ6HalOoPcq+dnctfIK6
	 qGdHY45Vc5vn2kn6tCty7UW/CPb7ct+7IM3wYoslGtZcPKncVClKHwLz4ElHfaymz3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vgq1tgXv;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D0606A32A
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 22:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vgq1tgXv
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67db8985419so2427238d50.1
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 14:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869298; x=1795474098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=Vgq1tgXvVTYlVxNlpd8JHP60+TCQNIhZAR7/Qie4z5jQUxaIf/Sss0JmyoPnqawK8Q
         bA+igC2pr+gJ1ZcVsdeGxkQ8If6VpVC6BEhUCMlico+lyQzchcpGAyAHlxN8Yvr8by4X
         +iWrNJEhjmWrC/WW8sWgc/MJDLTrbdg0D1/re+HfDU0yhXV5ageBTZHMKfXDzhU3eADz
         eVu6MgUx5VMQvUQSZDP8SUQlai0sFb2Zr1D0PVZETR/tVRh3w5YLTiWrke0k+5UC3mSE
         51HVOXV/36CdRRPU0QHaXWNDCURvd4EqOCzOolV+rKw9B5LaZKKTvaKgCNQbM6cBJXDa
         +Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869298; x=1795474098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=1Sf5SDWFUREiXVFOXnqILZ2HrB12mtu/1R1khoECHwb6ljdTq1H4wZbJYaYta3wGS1
         cuJKdq000U/B/1MKocYsX6VjvEQGIWZWU0yLTgXc2ndmGXzvzjKY2WQ1qLFaA4wyol+4
         9ybo4c+3xuSVaA6503Gn86R6/vsqaifLN9tyk82ApOG3QVZ7XzzEjbxq5CfZZykyfy5s
         neNXtrsv+xn8o1WVa//BHiuVBFkdA+n8KqglUxpCN+URLQroWwg3Cf8ygWsp+8HY9E07
         dLVExA9o/bSMBXUmTM+xAa7HRWJQBeuTqpazmHAvrb6RVsswpWwwy5E210yPwGmS5aYc
         FW7w==
X-Forwarded-Encrypted: i=1; AL+hErEZWblkjA7FiEvS3166+D4nP5mWrzbSKnrCbvLgZxXpu6z26/dPVIjUDtADLX8QqcpiOX0=@lists.linux.dev
X-Gm-Message-State: APuU4Z90B4iRephrKPYPpGnhYe9O0UwtYypqg3ijbf78I7HUJlnHPv//
	qY+Tl2n5DrDMkqiJ4PeMZSQmpQhkSE9QM5kJAFkkGJilj+NZ4mPQ1rfz
X-Gm-Gg: AZFdTZc+qvEYhtIXBB+N9dC1+mKwEs2kt4pomvn/d/nauqg4OJWZCnXuU7z9NjBzXkR
	yrlHXfyfHRcfTkQLPuodrZOEPRJJJ6HgZPXHFsXRYq0P4jLZaUruF+ivlCQWruaVQQs/xqbTtpx
	A5KP1eEwy1H3HtCllN5Sv/nHlVLJiv5w+MWxfnwgCrhNySMwO8Cy9z+VStx4gRBrrQL7c2NlTDa
	0u+HD9uQhtGlhiJLZdnCoLZlNCaLAZ7S2qTFsnx+DvjyfR6yiRrOG7Ze/g2sOoeJEAGpYIqmWYy
	oi1vwzQDTlqFlzr5H+2oblrCUttkEGpIW36LFVDog8y+HlzSe42zMvP9BbkAr4FWvqEoRBFowdU
	I7KpCiMA9Dd4g6VtE7q+1B48i8a6JSIrH7H2YwcmLqHocMuX69s+Fux2wZzfXReQMVkE2HNdqxa
	hYDBFrANLB+IyDrlumSukIzH6AfFtZ+OGOCVPDvwFVhnXeFyCvfFoTdnSMOD5zL3j1uHilrmmpj
	fagpCz9VkAI8XPiXxklVrFG/CjlQQTZHxhVvuGWu0+Aym3KmXdCUk8zF5r4QPyJ+84UqSIdsfht
	oVn2NaM7jKxZF9+jammyHsfp1GifBiHrGoPIrDJKE6q9BhNiuxrYPEpZh4iWlky03/x+EvdC5xv
	s2TQVktm+9jPc1z54PaJ16IM=
X-Received: by 2002:a05:690e:a49:b0:67d:a8db:2821 with SMTP id 956f58d0204a3-67da8db2967mr3475909d50.103.1794869297941;
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Mon, 16 Nov 2026 19:48:01 -0300
Message-ID: <20261116224803.61154-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC trigger is devm-allocated against the IIO device, but it is
manually unregistered after iio_device_unregister(). The latter deletes
the IIO device and releases its managed resources, freeing the trigger
before mxs_lradc_adc_trigger_remove() accesses it.

Since commit 699fb50d9903 ("drivers: base: Free devm resources when
unregistering a device"), device_del() releases managed resources.
Consequently, iio_device_unregister() drops the trigger's allocation
reference before the driver unregisters it.

On an i.MX28 EVK with KASAN enabled, unbinding the LRADC parent with:

  echo 80050000.lradc > /sys/bus/platform/drivers/mxs-lradc/unbind

reports a slab-use-after-free in device_release_driver_internal().

Allocate the managed trigger against the platform device instead. This
matches the trigger device's parent and keeps the allocation alive until
the platform driver's remove callback has unregistered the trigger.

Cc: stable@vger.kernel.org
Fixes: 699fb50d9903 ("drivers: base: Free devm resources when unregistering a device")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced. After Sashiko's feedback in v3:
https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?part=2
I ran KASAN and spotted this new issue.

 drivers/iio/adc/mxs-lradc-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..64dd3a9995ff 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -454,7 +454,7 @@ static int mxs_lradc_adc_trigger_init(struct iio_dev *iio)
 	struct iio_trigger *trig;
 	struct mxs_lradc_adc *adc = iio_priv(iio);
 
-	trig = devm_iio_trigger_alloc(&iio->dev, "%s-dev%i", iio->name,
+	trig = devm_iio_trigger_alloc(adc->dev, "%s-dev%i", iio->name,
 				      iio_device_id(iio));
 	if (!trig)
 		return -ENOMEM;
-- 
2.43.0

