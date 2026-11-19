Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095664;
	b=UAaruQDCW/yI319W39ZCRx6AzfVRPQko7CZLUkbc87UObkoSsi595+uSBE7m81ZEKStT
	 T5Ldu/T4sNG9wR+Z+tRw21PIKlgMtB59tawZDvJhItO46VxoBYFv9nugDRxQKuuUMtLts
	 Ur8Sx+gyeYCLcBN+LMZrCS4VvA6peH6hVR2xeX9fd8UDXPUhRWOQD2oKPVB/y/mN0Lg6M
	 ep1yQQA/Qv1QIh5dJeL4po4lv+pcSQcGOPYnF8y0cIC5Cw44Ok+fhQykvqYIBe+jHuQly
	 qv9vEB8hjZ3X7tRnn3FaW/WuvtfzB2DH27SxSCgZ1q37FU4wOlX8KyGIXAhITm5sOrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
	b=XO1zg1AQ4RUzgpNyqh9BvfF9TC8q/nZIXEK5JBwAm4oedCOCgsWMlxVlIKhblaN7ar/u
	 q6pAm5We4FUQZ/OfLOdaU72rs68xtm103mLx0KvSTGazCfXGX+AjELf2G4RKCYCY9tF3i
	 61Z/6olNXJpxEcegen1AMWOcVh4yTnkIH7KWwQ6MCduo3dosoQt+2/g8Sb4mVt2RQZo1a
	 3OO2rmlzs861SH37MsH1sUqDDerFQndUngU04DE+Jg8BNrEsE/LH3dTxZE3jZeu8Q7INc
	 eL8KJqCNYUweRvf95p1wWMXF/wlS/phpK3yUbSGKODHwvVFLFFaGqT8xrhBxF8e6P3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smnXGyMl;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300460A2601
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F300460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smnXGyMl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99ac154431bso442570241.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095663; x=1795700463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=smnXGyMlcvxkLan6yIn2xAk3kH5yd+r/Li2ul/T060AfrL6lDM8wD6HAu+hwGQmZ4R
         lup97KScseNHJrO1B82UmrfdJyILoCw7tiBxRAw5ee25gZJNJrhHZMQDxV21m0lO/dNW
         e1XFVt3lm6hqIJF4sfUYWT9/Gb4Pl2q27ATBjOxdq1xfZsayxqDkD67Hd5zRka4/6xRk
         iEtwOuE7f++vLHtlIu+sEVWUBnpSBbNwh2gRtbHOzl/heXvTYv64H0Mhxm3JVSNLYQsz
         DdJP6fnKkJAn512KbJvquZ3pgnsDQB1zHKajB8/pBhPFZLSHChzVnT53Fa5hZapEy/+s
         AYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095663; x=1795700463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=kLUZ8huKlLnz5AdhgzdyW68ik6jyEzolIFsUXo0a4ZwoTjTPqG3FtB3ibt/mDGvW4u
         J8vhrGx9LNOOs/XuhswVB/Ddk9VfzszMCdXwfXIpRlHDa+leoxxRoNsT3LDq2bdrX6CB
         NYep78XCuZQ3KBRH5A6I3n7YPzLAuh7QBllEI+ueCsVKZhffFjXSfrgpBlgHgpKFW7+j
         Icpi7JYMPnye3GhFiQyb4lb4fZWwoGOJhvBwlRe+Ua4a1034a4DxmPZsHI6vGqFE8TiM
         CwejhYXVISE3aFtfQOSXRsv+4CancJtqXgrVeuPOJarQx8IopyhPjlGb65jmRyIBlQRK
         RE7g==
X-Forwarded-Encrypted: i=1; AL+hErGu/5Gg+rpubVYSqunOCNhkmLiYWMgR/p3Z2Cs0nhTOFYUSzgBJt7ANRrMJrUW+asmMkJY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8U4uPBmOZm0kxYNmJz8FovypqG2s3zB8smESetwFt7jDqcoEee
	C1l9AafOsJfKJ9lKzr42Awdn7NMM2YbDlAXeEeTJ9uIYZ5Tmy24bFg2P
X-Gm-Gg: AYBFou1AfNlF/sttAiHdqO+T4JDqpF9qiapibiD0WNJYtuP/WdIo/tAk4CNBYpHyncb
	dbjPR6UTdCiMZb/aUF+XsDCX6A0TVVKToCsqkgjt+Gk5uPfT4Ft3bV0RQWp/PfgEv7FVPkxYF5U
	Rt60yhvCv3u87w+4DeZeHolPFxykknfcipgwQB08K0EKi2n4f3+CwuFfxUM/U4kejJr910F+z21
	bM4NHx5oL5DsstrlSyFEMPZtqvoSl5W7yru03JW/Do/QhSAYrpsJLLIEVvz2TwYLwL9x9fhkPP6
	aKLO6bDlDmRXbXRxSgfOe6IxAesYNalqbICGbKwYntKErkc/6qy26gVKUt8xoZ8Gc27AtJad9wq
	8Cd0G3JwtnK1vJelhXqpsMzJwKCGCR/Qi2pFPxaRBLtt+sWy5L+ApMjz0VEmXVMSiaKBfxypeOn
	/E3tv0b5B4XOJX6dHtoxNoe6JFziST75iJG9ioEdf8wJdZcifABJg22t/W0/hIaXmgNZPCkfBxx
	ZrXd+KPm1nTTIvNvSK+lb+v6sqU2SpUFUC+mpQ1VCPbcLe6FxH3e1whpyeLADAXaObUWPl2o/J+
	OV0FkCRSmsIDQ9Et3KoyGrhaxtN0x+ZgwUQjBlfJEuXn99ZbyFQeG7fx/LV7BOF/DGvvDi+LxMO
	B2JiqjFAKK4kD2N2fZXE=
X-Received: by 2002:a05:6102:54a8:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d6ba191168mr2215348137.5.1795095662707;
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
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
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Thu, 19 Nov 2026 10:40:39 -0300
Message-ID: <20261119134041.16611-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
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
Reviewed-by: Joshua Crofts <crofts@kernel.org>
---
Changes since v4:
- None. Only collected Joshua's tag.

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

