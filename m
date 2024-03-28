Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F90139D03
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657430; cv=none; b=ElTnMqVaDUbEvi96zldNg7DGp5QN4FmjPUYf9FRaCnVUixpy3LGFZqDoJg/MWM7uJsaJekUosc0kqhIz5/RiOEJDEzUVusdyyVYeCGY5Y2vTTQCiFp60ryn4+sJ5S7BVGuuB6yYxOzG3ft+/+gwyxatq51DKNSVhmw+2Mg1Ccf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657430; c=relaxed/simple;
	bh=v5pJ2l7y5vuQsj+O71iggWX63IRu9bFDwoKCJogxB2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=igg13nwqD8BXryKNOu7HGBWGwE/+AuzDLcqsPSSI1U+AsQNtxI9wtRzDO/dV58jV2ld40T9iHF1VX1MT9LGQvcilRus9NjhG+hsKQCMo0myxS1We1Aiw19dy9wJJV9iRxN9OVmH8Kbu8W/dvUJMSPZPIrQn1tUzlyg91JsEoz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9kmdQ90; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9kmdQ90"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34261edaf7eso896485f8f.1
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657426; x=1712262226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBJeVB+IC/vthXWDL7D0a28Qd+NtXyAT7llp1tNQaMs=;
        b=A9kmdQ90sbJD3pCgbGSN0Cn+xGCkTSnyr4YbEQ21Vo7FLH9RALaiCjilzgeXf12G+M
         C7iWz4A8bO+GpR5CkQQ9MEVGv/dWJYRDkHiohF17BrXpgbgdNuYhxUe0OvfsX0mSapah
         DGjslefKqhD1O8QOcO1ohjaN+iykElNviA07IwCz+sFmt7GkxyP5QZxrYN72lVIs755H
         zJbyxgAfUNAqgjIOP59LwLuMUFj1J9mjH/nIxIlEuA+GOyvOJb1vxl1O+DCVolbo6mto
         nitdIJT5udSHCfMQqUQG4jVpKT0YsUb7uVGy5G3ovDLiJsc5uoOnsp/Zc6LpfQc/X6Wl
         B5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657426; x=1712262226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBJeVB+IC/vthXWDL7D0a28Qd+NtXyAT7llp1tNQaMs=;
        b=qxD5JPnmScXCLZVT2UVJt9XFhP8RZYQvHmlYerP9oIUO3Ytn72SCMwxXtqIjVDQDbT
         Bdy0V43NRtjw1S/gjt1C3tKSQsCkHHfgIG+2EE/Cm3918ZqwG+WfKsPMwxkUd4YPHfbs
         IUrMOU6WHshoTfdQcgtn2GuqbPoyRr8fIH+FLV+AO/oPkwgjPuMfGErx+A/9xiijM7NQ
         YZ4WM/8f8zQFSPxDTU617b8ki39MMZvXZoQG3IaYhWPVF+PeyyVUi6YHg6gJuM4gOBaE
         ozeS5fjPJ2uqmalAqo/AjHYlbijmqPBdKvLoUiKbL2CqS09pgvek8WZIYliezRQygoVC
         e+pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbmF4J7poCgTTuRwSkFU2dWgHV31mRsSy5bFv+5y1mNLnwZql9qkzLZYqzvmb8/8je/4kPATbc+DNC8GcXhNaUvAk8
X-Gm-Message-State: AOJu0YwsrCh9wXiXWG48xEjh2N5LCbpKAPO+xm4OKkFRGndNhDA4kZvk
	D6C+NI0XX39WS4iunuxH6tNXUabuiy6VmJtfZDo4MLJOHYNnCqiriAnwPvT8mBkHwg==
X-Google-Smtp-Source: AGHT+IEkBgZ/vPsNlsZxD2ghgv7JDyI4HH6i/p5wXFdra8vGixvwS8pTyCvn61SEvbefm3QDvM1Jrg==
X-Received: by 2002:a5d:480f:0:b0:33e:726d:e963 with SMTP id l15-20020a5d480f000000b0033e726de963mr89174wrq.17.1711657425926;
        Thu, 28 Mar 2024 13:23:45 -0700 (PDT)
Received: from localhost.localdomain ([2605:59c8:6662:b310:26a7:2d64:79c1:dee4])
        by smtp.gmail.com with ESMTPSA id dp18-20020a0560000c9200b00341de138a2esm2538974wrb.94.2024.03.28.13.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:23:45 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	festevam@gmail.com,
	alex@voxelbotics.com,
	Gilles Talis <gilles.talis@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Emcraft Systems
Date: Thu, 28 Mar 2024 16:23:18 -0400
Message-Id: <20240328202320.187596-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240328202320.187596-1-gilles.talis@gmail.com>
References: <20240328202320.187596-1-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for Emcraft Systems (https://www.emcraft.com/)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b97d298b3eb6..8b978c6f1dfd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -438,6 +438,8 @@ patternProperties:
     description: Dongguan EmbedFire Electronic Technology Co., Ltd.
   "^embest,.*":
     description: Shenzhen Embest Technology Co., Ltd.
+  "^emcraft,.*":
+    description: Emcraft Systems
   "^emlid,.*":
     description: Emlid, Ltd.
   "^emmicro,.*":
-- 
2.39.2

