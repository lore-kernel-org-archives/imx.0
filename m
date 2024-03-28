Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627BB13A3EC
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657432; cv=none; b=DS+R+7PpfM4Lbfw+ty1CA3jLzb2/43148aJp1S7OvdKgxVL35HLf+l12O7KlXT2uXdITTCMTqQa9+de6dBjWAFIbyedoPK9yKN+PfKoOqRQqg1kQ5nTjx2DxXbQgAFa6is0ylEpi7VkwCED3Off1SkfxCz2xi7ragB3Hzau2Nco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657432; c=relaxed/simple;
	bh=QXXWL87/5lJNB0b9xDTTEtAz9RJ4R2qc7NHzCCO2Vgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpVFaFGzLYcvMQBO2icn2kuVC8HnDfsKHo86xXf0Gcr+qtklFjSjxpFAOn+8KpoA4YCfcRtqJh1U20+Oq5ka9IxdDP2AWMOSC15ARjbmM9IcmXZ6Dp0Xho7i92x+w8afXvkdDdublacv7qQj66yU3/HhuDJi3s6ee1cGOKB1lt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvGqz65F; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvGqz65F"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34005b5927eso941732f8f.1
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 13:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657429; x=1712262229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57aFB1eNPYGC7lvg7sDQU/upxZe1OvMdYbKrKwBcY7k=;
        b=QvGqz65FCVr/3hXz2xIQS5Qwdj3qVg0v6HFqTdy/DOIx40iCmlLCL99jiy50obDDeB
         +xnfjW49KFk/M/8KSCGgJJnQdZKkHox7OWZKoI+HWMDJ1+zNWFz/U119lj1g+y2lUGIU
         W+Fg5Op7ou+Xbv37Fojav6M4hGiOvk0KGtlqhj2eG3kCLRFdMIIOcHxfXgO3bdhT6J/k
         bPDyC8x/ygEqmT8LS6tXp7jsYkcib5AyUYz6aE4f7ecuRLKsJ7txA28KhwXvQdKNydPS
         H4Fo64hxK4JSKZBwmN4wrEZ9t/5GfBVw7iFL2rPYyLqit0F5HGxsDM8IMsz5qRFHnDx5
         K30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657429; x=1712262229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57aFB1eNPYGC7lvg7sDQU/upxZe1OvMdYbKrKwBcY7k=;
        b=wZGvjA2wy6rUx9lSYI4QhACKSBvJ4SVOXCB+8tvYlY29DLlzGdbE6DUHB/mtUaTO66
         /Pg0KvR8KL9ahKa92QliMYDmuWHfaPTP/QlLkDVa8Y1cSZeyyrhmYRXXxFZZ0HzK6vDj
         cA7mLHZNQMxp34lRx9FCV4RoEdAOjV+A0ngY2vDm2qbGAuNA0NMgXlmcd5k++6xlbUMD
         Md6V7v08Zu66+MJm8fEMhO2Wd8/jm/AbKBg2SD7fzOC4nmGukD02Srescf/vuJEqSmGe
         wl9sdE+5Z6/skMnHICW0UIZ4QwGb92GMOB+utUacIAGju5JD0jmP1ErAyOQgjVPMb8Y8
         stbw==
X-Forwarded-Encrypted: i=1; AJvYcCXeEMDhLURf933GdvbLkv8Q6kO5hBbU/wv/Dq3BVA5/poC9ENKzgFBmVinznyClEvCoQe3/EvfR8F2mxnqCgHZDtvd4
X-Gm-Message-State: AOJu0Yy0EbW1YVkdpBlj/0jB8bSXwws1vHSOzMgLX9hjrclz3GhIDHpR
	bJ77Eq26sOY6FOQFhko+R139G8LJ0IASXfSfImccI9+7fdtSUWjT
X-Google-Smtp-Source: AGHT+IEF+7bL9YKjJD3uyLKpsEoQDj8QCAkJ9u/SEd87WdISjKyRgyt8uzBXbe8k8S+awRGI82m9Ew==
X-Received: by 2002:adf:a1dc:0:b0:33e:78c4:3738 with SMTP id v28-20020adfa1dc000000b0033e78c43738mr93995wrv.54.1711657428541;
        Thu, 28 Mar 2024 13:23:48 -0700 (PDT)
Received: from localhost.localdomain ([2605:59c8:6662:b310:26a7:2d64:79c1:dee4])
        by smtp.gmail.com with ESMTPSA id dp18-20020a0560000c9200b00341de138a2esm2538974wrb.94.2024.03.28.13.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:23:48 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
Date: Thu, 28 Mar 2024 16:23:19 -0400
Message-Id: <20240328202320.187596-3-gilles.talis@gmail.com>
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

Add DT compatible string for Emcraft NavQ+ kit based on
the i.MX8M Plus SoC from NXP

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0027201e19f8..cec1b31d0792 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1050,6 +1050,7 @@ properties:
           - enum:
               - beacon,imx8mp-beacon-kit  # i.MX8MP Beacon Development Kit
               - dmo,imx8mp-data-modul-edm-sbc # i.MX8MP eDM SBC
+              - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
-- 
2.39.2

