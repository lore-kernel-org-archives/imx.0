Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAE272908
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314245; cv=none; b=PrKaTbexceBFk//bsNtlgt4TGDomVnQqEIjoFXV1/nZ63Vw8Y8s3AESpOUHCFLUPPsfUAMKLVl4kkV9EStjpZKmNqhYE328DVuiashg1CJ3qcGmvKDjULvDm82SwLMcOEZP/8wwDzn4TeMBe2TfCwIRSWgADSXkhSIoo6FoYlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314245; c=relaxed/simple;
	bh=vd7etzFURvjt2qMQWdTlc/0nsCmROUouFpAkB6TyhSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=giokgzDz8mikonExINRlcfUwHRzDxrKv/yulEomAPG8duKEWMagSZZiJPGS6jX0zTL29WYKCmISGqPQzZklvJj2ZqWc4hLhFD+OdzL8eSI6lUPKzAbKHTM38uXf57cxmNck2/SndTEKVbWDW5XhR2dy5o+D91BO5fsSdPLDQQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYOzLfOU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYOzLfOU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7b80cc3d2so404366966b.3
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 14:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314242; x=1739919042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkJ255Nz05hMzwYP0ZFP3cQKnCDIXbUqK4zohkcWmek=;
        b=YYOzLfOUoQpf010Ar5xaot1HxHPEu+WuxZuGjp1H+iaxoPRwPijAW2IDjpXYigKpuL
         5IXKVXm2QMp3QZt4wMtz0cH+oAs2EggXibJB2cn6sOC0K0ELU8pNPrZGvdu6nkwAOJiL
         2+3DT+g/aTUY8vN95DUjRXGKKQWPUM1nlE3hSCiK4moH2U62/AW4rXrDl3UA2Rb1Fv0f
         buXeuGarThJA87yMZ86hlUyu9YfY3Z0hjPxfbKKxcqe90VSNACEDFF63EqDDivEXFMIY
         8XlVSh92O/MEubLDxlXFHzyRId02tkBG7owCEACgXQdu9JKbrHK8HFENmUYyq8RTsFRG
         Va/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314242; x=1739919042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkJ255Nz05hMzwYP0ZFP3cQKnCDIXbUqK4zohkcWmek=;
        b=RyziixsUAzUasdqrKAyE/rF/Gza9DXwlm7zdL+eqw0X2i8DUdaYYusuFoSLT3wzAWE
         BLw/M2FQ7/b+4iEfKpzk2/RRoyntWPicyD1PySAyKvWGkv/OoRv5euy/fK4DcFZ0Xc7K
         LU040shbwKyaNCAqcAyFBIR7ifj5qDLiG1m00qvof028cxBjd2aiNBoUN1WobmR1HLAA
         AVMeRpjsa0Lkuwcx2hINJfpeJPHs1gqvQYERcbEGEBXeFhuJp3i9EMkm+l74sX129/wV
         iQ0SfV5ykAceV1lnFetNkJwP6uSLXSi0JqmSB6MwLJ8cYDqlwSKg+f9roFrTdYgT1r6q
         dexg==
X-Gm-Message-State: AOJu0YzMZes/9BGJQqv0i/y7eclm8+KtX0yZ0cSkv5SHNkEjKbZdOP8j
	TtR3z6wtkS9BwFLSTcFhLSTkx6+cNTcmfVerjXJhv0zp4a9frcUN
X-Gm-Gg: ASbGncvHv/kMo7Yr4d1k7YC39n5ahyT7UVdEwr/Lo7OMWGv7+i/5lpY8G/zJGLxgQfv
	kNcLAyyn6DWpLrfTLxHPi6vCpOjicOuyYQga7J/g0GFrG+YemNHaH23aoaS99xccCrpj/bQ0+ZW
	PUBq3hPemg4kLD8Fnkyxll/CFoTSE8HD9WELdcPmX+E+/s6Xt0YOjrfQZSLpzoUYAMYT4gFrqeW
	DOsfUN51rxk4ySzrU/Bn/XblSusPnKCg4fy5yR6pCPO4BYZVVmKxpujz1Fw1yRQ55y/pK41/Cye
	NyauqCFFvUIG5onnYSxzB/83IVv6m3w8JI/2ghcFQa+/wkt7KR2YLA==
X-Google-Smtp-Source: AGHT+IFxHR7XFUlEo4fGWSQRitORCTM5qncC4QGfswuOZDj8v2uEOoaqSeMx1wpe0vdO9SFp/CqWwg==
X-Received: by 2002:a05:6402:27cc:b0:5d0:d818:559d with SMTP id 4fb4d7f45d1cf-5deadd7d39emr2174378a12.11.1739314241317;
        Tue, 11 Feb 2025 14:50:41 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c4316deasm468338866b.10.2025.02.11.14.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:50:40 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: imx@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx-common: set sdev->pdata->hw_pdata after common is alloc'd
Date: Tue, 11 Feb 2025 17:50:18 -0500
Message-Id: <20250211225018.2642-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

'imx_unregister_action' uses 'sdev->pdata->hw_pdata' to fetch the pointer
to the common data structure. As such, if 'sdev->pdata->hw_pdata' is not
set before adding 'imx_unregister_action' to the devres list, we risk
derefrencing a NULL pointer if any of the calls between
'devm_add_action_or_reset' and 'sdev->pdata->hw_pdata = common' fails.

Set 'sdev->pdata->hw_pdata' to point to 'common' as soon as 'common' is
allocated.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 82057af1436c..c3594815e60e 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -378,6 +378,7 @@ static int imx_probe(struct snd_sof_dev *sdev)
 	if (!common)
 		return dev_err_probe(sdev->dev, -ENOMEM,
 				     "failed to allocate common data\n");
+	sdev->pdata->hw_pdata = common;
 
 	common->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
 							PLATFORM_DEVID_NONE,
@@ -436,7 +437,6 @@ static int imx_probe(struct snd_sof_dev *sdev)
 	imx_dsp_set_data(common->ipc_handle, sdev);
 
 	sdev->num_cores = 1;
-	sdev->pdata->hw_pdata = common;
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
 	sdev->dsp_box.offset = get_chip_info(sdev)->ipc_info.boot_mbox_offset;
 
-- 
2.34.1

