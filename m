Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E728ECD8
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789703; cv=none; b=rkcB1X/oVcAx2vpk2PYoJPxsqoAIoM5+udZa3WWnq82b7m+SvshPeGDExBdPvLpsMLlRVY61qY74aN5v1w4wlt/GOGS1T4XsQEYGhAok46ZZiIikQ7+0zFk6QzFO6acaJ4xSSFypDVA2diNDDd3sLuk8zxz0Qlq6EbXITiPBDBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789703; c=relaxed/simple;
	bh=0BuO/miu0FNdGeIwKI4Igcv8UGoaQFfIol3GnMmPqqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekPPzkf76Jz0VM1hYakjyeKWm1MjJG8BJ4THg8D0sm9VfDmobte4cvOoIf7p1XekMj2nC9fxSULSAHSEmcJYq0mkM97wkGCpNp4Q8tlxq+j69vqc75yY0XSDl5sETsyfXfFZhCm2Wj+eo+EPU7b9BqHjn3aGj3x0Z74C9c9r9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lMn7kmo+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lMn7kmo+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1483035e9.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789700; x=1747394500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=lMn7kmo+w9ThP/Ffmw+dkShIdqOebmo+eUw731l7eMYEaI5jvUTyv2xrOeiHJm0NiQ
         p5NmVewWF1nXKOzT7BrEIuaGsNbsVm+XEIJeYz9mfEUf64ssbYiJ1q94fJUd8ItD9yRa
         wKCktFMLEAW9/EJi4c+gXVOMwfGCbiXG1ThFgFal1Dc/RFOBWpaIw4AU2+MGL3plC6Hg
         YQuc3JmUEX+pd6QLT6FRFpp5IPViJrXo51dpKHpjJrjUJZ+2K9JKckh9A5lUxWCKQT2w
         hlsvDF18lLoSgGMN6SZFvm98ian2Gnm57Ck42EvLZAErV5TEzyOVlyGMLuahyDMQ0d0T
         3cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789700; x=1747394500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=iYoVWwKgbNUn5wxckOHkgGWA6GPq2MTNMhdmsPahh+F9cqKX/g9FG+VtZwiQOxLg4G
         oCg7+fecsT6DjPdW7cQibf58e1Ub+e4sMPuExzbYA/bXin+LG42Gx2X8/36VPaWxhgy7
         KoAdqH2FpYgXDkgF3/mCNEGUU4JNhUkJTK15Bb6cQxTOYLZI9HbXmcoXWs3Yb+xdJ0vI
         9LfzSncIH8CxmWW2eVSBUpmWivrTXh/FshhrcJ6k/BlQ+1lydCXeMlRkld8f/kz6ty7a
         RYsXqUqRa8XP5tsrdNf/atgt8RdiE8zq0C9dsuCk+jMj3FqCQy/x/3l3qGFBzLmyeEPE
         ZR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeAYci8Tl9BshmApTgw+XQ1IVEM9dJ3NAoyq0C8Z5UHpmmcepB0QydBfF8zjc3aq6sRMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgVpkZ46ubfgegJPFNnYWeVWWIOaNzwy+lrgSSk3nuqxYuuWJk
	UI6Pl3g0m9XnVB2sMkekDJXDvOxNRiQ+ZHiCSzQWOJ+6UWas10w+zcc2zf4LrVE=
X-Gm-Gg: ASbGnctP4pQmbgxx2KMKH23ehoFNNEn/49LAQf1EgyW6W5YfePqF2nxoKeOwGZnYSkr
	eP1+i3GVMYHSUOwiCpE1qd4sU/oHeFINqGQWgUVkWeJBEAxDZU1+g9/dSWRwrvZ6Y9AqdyCdr6Y
	GJbiFHgGfC3/fv1+MFZQfdmOEcxJzj4VmhTwKM5GWc/M33fH/HblIUxa8PKUuwndft2vZ+qsEiO
	rQg9Wg/bdaKRBZlsZDebGCATNz7FPmP0O2xZZcBCa/Gm/Kt9xUCbfLjGRJTMpSh2U6tbrtP14zW
	ODyb3AQs+OHaSbusoX62fjlb2pv7EGJ42h7QdxBXNbBWp5T+Xg==
X-Google-Smtp-Source: AGHT+IEuDuBg93OxIQQoW+nylcXuRFPBeBathaUSkxBNEQ4jD3mR42Jzx1DI1Z0ON8bFZOIloNRtJQ==
X-Received: by 2002:a05:600c:1382:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-442d6dd5413mr8885805e9.5.1746789699803;
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm69946945e9.2.2025.05.09.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Drop unrelated nodes from DTS example
Date: Fri,  9 May 2025 13:21:32 +0200
Message-ID: <20250509112130.123462-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
References: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=869; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=0BuO/miu0FNdGeIwKI4Igcv8UGoaQFfIol3GnMmPqqQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHeU9Raekbf2tG03zWC6ko3skitxMRci9RwRJu
 8slhDM2iNaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB3lPQAKCRDBN2bmhouD
 14v3D/9iuwKe4zn277rUfVsmgt/II8fADdf1u/LFF8b+e1VT3f1aiSpH7QsV6sp6QMDJZT/Sjan
 EA5EpUVZRySb6x1OoQPqh9geb8YTnuzu+1mWMxtmBwBzSqNa/ip2dEhYZIkq+zUlobn5dkMP6/N
 z0P5+VQc/vFc6uFcTHXE4h3Ngj/l7NEMSlEJzaV5zdlAJh6LqF1L7x04TAc9S7KqAEwToyaJENd
 LX0+FVaiwpPNKbElXgizKP16egYtBw+RTrZjsUxgOfIccAbaCPDSWQbw5Dd2tsfLhlD56fuQ//U
 bkTV252AgvsA0CBs5BFD1CN7zHWsKzQF6SYkq+LlHWC8dTO8IViLSn09zJnknFgQCsUiYh8y5jE
 xav332eHokzZ/JmqqM1BjdCrVPnlsxrvgaHLhJLu8h3bW4bucGZCs3LNUC+U2deDOeYbrAXE6D6
 5jqPWdMYxx5FLKVIJkMSJyDtTPV0YiXrqDmFsPJKYUNJAnIZFKGpN0Wpk6VYWZ9rDtepU0781rB
 oO3zGPlWD4Snadvawz9PIqeEAueNplqWUjDezYjF3SvujhiPpmZpXkQ+Q1jV4stqNtnVPNXh3HW
 nSGGYwfk/aaVVWfKANaOQqz0C69xQIXbDORTrC1Ts5aDxeQa4LgzFEkrxuJ4aZyTW7vw1Crk4AP WWtlsOiCaLqiCxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Binding example should not contain other nodes, including other
providers like syscon, because this is redundant and only adds
unnecessary bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
index 4e0d391e1d69..c97bf48b56b4 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -59,8 +59,3 @@ examples:
         reg = <0>;
       };
     };
-
-    shm: syscon@c8001000 {
-      compatible = "nuvoton,wpcm450-shm", "syscon";
-      reg = <0xc8001000 0x1000>;
-    };
-- 
2.45.2

