Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B044206F12
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360683; cv=none; b=OopsMjPtFLRfiR/Tn6VuYs7A15og+ElQUGI5FVgZrcwaF+NfHWswv7tJEzI98Lmf8Or9i7z6kzdORmuM70niJ4esVQSK/Zs0CkGVoq0hOIe0ZJAYV6v89i3qXxdHuJLrhkiMqi7uV99A+zChp1hdZ68UFAsSw0V7VzcGTWGZi2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360683; c=relaxed/simple;
	bh=cWi8DmSi7C7RoYGebBs9V11KbEf0JwdrdWWSFkvT2/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WVMwBkIraI+/55B2SGFHam3XTzFp2G7nlLiYpLDbgA27QCL29Hl6heoSTJIGWUtUbN4Oq/rhlZ70lcQOoHNxe8LGtPa7ApoNEDXMH4+K8A6q2XDOUrc9h8mLrgYIhQT0AnRuK61IIhqt7IUwAQWdgaNafMlxiATqdXBfzV7CpjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su1xQCFG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su1xQCFG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso25872005e9.1
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 06:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360679; x=1734965479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=Su1xQCFG15Nccft1MsUkmwReCyXwLVsPJuOGwdLShtabOBtoI0XslGF4Ymls53qma+
         YBNUMGSYXtopFQsgp5uFi3dDkNeIFeweJHo9cB4ZipcCaBuJsMtxLkbVP3E8iWzqsMR0
         mswbx5vATeNM6CyPg7Ze4+FyMcVtNDx2IdCcUK36VpWYYtea7kid8d9cLY3bIJUlcNQO
         av17Txo/dWSuNytW9ndqQAXLwvJjVl4cRTJkZcdUrFQw5dsXzJDmx637mrYGbC0UlYII
         7GPMVQ7X+o3SR7QVsLUrD9MffRr9wE81RJ2jFTnDJNEKDN+9Sr/cxvKLgSTGQg3E4Ebi
         e25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360679; x=1734965479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=Z4y+RiKexBhEwRQHgQ12m+hGnV6RYwbCdQ+EUutmqjWgqy6WtWTA6GjWNh9+Cszq/o
         6Yrf37cPiHEhykbcARlCrKtQ3M+DKM7sXeN+9CJNoh6iCTRUieMxTg3cQvLPjv+tasG7
         ABweDSalMzlKF4kux1FKmIAojmeQVur9Uz8yP8diB+G/W375y2va1l5vqQbawSqzMZ4o
         7vvq1je85Z7/28pncjtXfCA42xHTddSrtZTI5RyoKETrY9uE68fb8sqSmjNJqfwnvkx0
         cGpXZ69n3+3b5Bhw+uafjYIqTCAArSkGngf1P+wig8ZD2UcciB3e77M57ivygayyDDiB
         waaA==
X-Forwarded-Encrypted: i=1; AJvYcCUXXwDXi+whpBak7kT+/a8k6s54jg56sEQNpfZLzrPPdAFZlUOn+pC1HgaGE2BSbgbPm/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5imbZR5/NO5KB46XCgkSH0Ag0fCrt0xuY4Mbr2SfRX92P82z0
	SGsWgUbVk0yQtpCES0KOq+UfsrC6WE4nOMWrLixFEY4SJX3+SvR0
X-Gm-Gg: ASbGnctVJOp4T+KEuXBtSCsizCRVtG+D6G6tzrf4UgrlwmLTVSPS4PcN1+vOlp4rSN7
	OVYpJdOO+VNQSw9MCQCb3aXIyS9+BuhCeC5VFAZ0LuECqiaVRfIRdBOv62hiAY8uZpS5NrKANVM
	bzWgaKCUfi8GCx7HY2SOMg06rsMykhI0K4OMVnMO0fQTyxEEthoB4Uk3zUnN2XbArfzJDkKwkLe
	WQ1Dyk2Mgtc73Yf/FVHbNiNht7aI8WMOOfMppaMhzHisXsKopxETQ8FTpvVGEI9t1dW98dMKRuF
	GFyWR2Ljw18iKLSo
X-Google-Smtp-Source: AGHT+IFA3RNClGg885yiYlISYsYOJeTw1Fd1eRv96uL8DaVCl3QiM+cW2wRgxshrWVj5DiQhXeuZ5w==
X-Received: by 2002:a05:600c:1c09:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-436230bfd93mr136287915e9.9.1734360679587;
        Mon, 16 Dec 2024 06:51:19 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:19 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Mon, 16 Dec 2024 09:50:37 -0500
Message-Id: <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1

