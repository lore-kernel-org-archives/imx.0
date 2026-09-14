Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125C41DDF0
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377358; cv=none; b=XL5wR0OYrq8ELLFRLmFx9sAVEwySAQ/nagmbkOuClpX3WEkJ1eO6RxxD4bDIyYLisHQ79kN3/fC2+qHQdRc6PgwmwVyBBq254gYOb4oCR7d0XgghnT/YjK8Urp63KgHEy7bLqWSgB6iqmJJHjlTQGjU0rOO6jmNKn/+8hfeKuGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377358; c=relaxed/simple;
	bh=MEXHfGz4HzaBznx53art+ix5nkCHygSVvo4IcvkNi3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=geO4quI+MIE6s/634Uue+6bxYBXKMqYxX+uACdg2Jf3uur3Hm89StUcmEE200F8R/BsZjiIPLnVBugqTlz3grlTMt/feWRgJRTgIsvsoZZ2jR+uDdSnMqADpFQT6tT/RBpIyNQbd0E9ImnIWFSVh3gYXmRZuoh+vFsGdCdhIGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxWwTjbG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxWwTjbG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8692be1cda4so2429996b3a.1
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377356; x=1789982156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=AxWwTjbGRKaKdiad32mw0+/nIaEHuniCFK/pd4QQgEeYIiYtA+th7GZPbCRJEyLA8U
         XUZgjFLriS6Qpi8kZDFoEL92hPrXW9f8aHBxiYMeYSrof2HKHzf42NiSpq8yBQ4LUoj1
         +qQoWysMSxoeB+UvcGZDB3nlLk+Vj60wevsYDGVYz6u7pUfnV1kyO4YSNYn9hasl0fKu
         Kz4LLUu7u5bNIkjqCS9tBkY13Cljm+gkMursRP1ky5n/ztGmAbFcfgHbDezIFF0zAhH/
         jI+P8d8gjX6DuqS6JcI9BtOFterJ/ZMNA/Xo5uaeRZ6n+aum6/1aDLHu4jjdR+PRFRlL
         rRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377356; x=1789982156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=iMKWujZS5hmG008K0cFkA4VPdVGlnjgjQ6oNas8h/FuwrUtVjkiiEh3yN5Ykw6lgwe
         RMVsGsiV4krSU7SK727Ul8xHJImL+HU+qna71AzXUV3Bt7pHbQjy6ENaNuTOcANfXFg+
         5OzDGJja06JDiPgqK6S9NUno9IG8Q+FkE3g8CDkh+QtQSvWH8Xf2QvVWMke827cLijVb
         ZPs+DR8jdCkNWBy3OLNNeXx97KN1ofj2sVHXCyHFTkiwhKT1nFvO2HdLeII239UwYXQk
         G1lQU7WSL3aWYkAhTT5J3VQXjbRHC1HtOdnjT3tmhD36sJGJTNzwBU+0C83cHSR4v/hm
         SZgg==
X-Forwarded-Encrypted: i=1; AKwUvByyjC+Mv1Wn3q7dRfr7Zze5wyok2yAmIFH5lXjswfdVU/RD5c8n6tIWvmZNL1h56HXmrG8=@lists.linux.dev
X-Gm-Message-State: AFuF++kOBz/NyajPM6gnvXO+1fMRo84t0iy3Z/gVQ6YUGjCl39V/L1KH
	5IRRDv47wb9UmAeRCL6jC4/X3YEySaTm5LDorV5gNn4fIgo+1INg0+6X
X-Gm-Gg: AYBFou3/tc9Fnlwfm6k4HYyFTVzbcWeEtPOe5XbZbVVOgPxZb/OY4Az4ZaTEt9kdGX9
	9TbCKIAeTHkoA9qn+ku03LhvVBOAdF/1acbya6znMir020GEla3BxB5+JfLc7c8yST1HTYEZOIL
	+H+RdkssWJRZ9Zo/YyjmsmCi7f/XkHydXu2oZmCgzopjPduQyRAG25QL9cnpycp9qsqsRiMkAEr
	twpUGbXsLjaAkFOqAW/NcMDp2vFqLzoCV6h5VkT1wFAZrFdv+mMK3b4AbeR7XtYtnZtsI3aUsqy
	C3CLKa50Sa2+OBYbyR15K2JDdMKeLK+VL5a50pUUIw/8v/1PKKuUGdWevx2dO18qNuEnJsIEnzh
	hF2rhnLHCImEb48+sDsVF3y47qA4ds64fREk6+8wrBAITOB4iFQmLyB394hPe8/nb7ZcqXzzy2D
	i3UOT/4PRGPIIGiAHxjMlrrELmo7Lda2TuofQONDWxodb5Hzme5sypBQ==
X-Received: by 2002:a05:6a00:4288:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-86f83346552mr3922964b3a.1.1789377355574;
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c0762sm4480614b3a.13.2026.09.14.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Gao Pan <b54642@freescale.com>,
	Fugang Duan <B38611@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: disable autosuspend on remove
Date: Mon, 14 Sep 2026 17:15:44 +0800
Message-ID: <20260914091544.1667137-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_imx_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the performance")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00af..4dc3df6a41a4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1920,6 +1920,7 @@ static void i2c_imx_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int i2c_imx_runtime_suspend(struct device *dev)
-- 
2.43.0

