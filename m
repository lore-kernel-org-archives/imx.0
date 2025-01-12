Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C91B3921
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736685009; cv=none; b=XM1+ipPQWuVIojI16cxGHpE+pe4syz9VpPcuGoDpjnEpYL2zrlKeRl7LjFbIlMsYn8K4hzISOLRK75WPP+20qvyiP+wjMrjxGOJG8IVJ5KDTmLEUfDKerZklZQv2ROciTReD++Tlb99THPOCsKFs1p10COY0Z7zDBzcr0hfVYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736685009; c=relaxed/simple;
	bh=55SJtEopymqDLK9jEfPDJlSY2zUu3iFsgAynO+ND2xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oxVTefPvKwghZZnHcl6RivRAmVcNcl3+QzcxlZHpnWGL6C2085nhBSvCPnN1rhTaDMLP6J7rFWzxkTKrDS2jlISfjTz9kab6EkuEF/pm5whPXhrj1xpABy4Au+MB9Veey3T1VIX/x41Bt7zDQeTTfVPZaTdtgrJoPz87vGYNddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axYpwurT; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axYpwurT"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3eb8accbde3so2163157b6e.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 04:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685007; x=1737289807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxHvRU79mZPg7YVqFDPmYG/fyVRd96eq7pLfVRnFKlQ=;
        b=axYpwurT/V8DrRmycuW3O/jym3dUjKTr38zZVI1k+mo2FXvxkSTbHrig8PYd5wrOZb
         +RJHpxrhuS2JN3Vqo4W8y8ifz7AUJkTQwrgRKDfe+8QPfKQvOuxczxpnlvqSzjR2BEyX
         X1ycHjEcklJyqAhHYGD5H0k/yalEUqR3Vzh35WrlfdzOKsG5/AUzkM+TRbsydoscLskU
         zdUsf1yyO0ft6hEj+QVUAA9xG4KtTKQblXtPjJfyHvpgoCVYnJcH4b3CtHx5dG4e05zO
         e2zHwVf8mjLK6owiXwh5wgOg0CBxxcbRYQxcmGdIZLMjr7uDqU0rQfCDdlEAXeNkEIDl
         as8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685007; x=1737289807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxHvRU79mZPg7YVqFDPmYG/fyVRd96eq7pLfVRnFKlQ=;
        b=gN1lsGtt2/o8oULurIGKKapfC1E5Oiz4Q14wNZMEn/CzjVYMJiHPff3lV5apizxhmB
         Mt0YCNov2N6lNW9wti0Sfq95Z04nSsWIwuR8QuzAtkqhJ0sCHlgRInsD0JZmPfLHoTmP
         B58cigZ411yRgHY1LadsEONlzRkBx5iKfaGeZ3iRx0ipOZri0X0Mf++AAISphZ1q27eG
         hrNMlVE1HPIcE3mOBXxQk93waMhFqHzbRtcfa3+1SEd2CH7LwCfLPAEF5DmZxycNN7B7
         bH4ZnR2CAAKa7S4/Y34SHKLRduW1/sfMv4h0MLoABgCfccJ8xYsvHxArUjiIHsYreCUZ
         BOQg==
X-Forwarded-Encrypted: i=1; AJvYcCU83ZKSKQ5qREZNXuIcA8ZPNOz47GTV1jNcpBN0zMxLo1nLdnNtve2nZmCKQ9zu978u7Nc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5gxZYzSf3SBR+vQjKjsF4wgAD16I6H3G8xG5TbyaOXsJXH2d6
	BBQWJtKjLfxXzJ3gvYSehpefuYnmHrl4by4m7w9si2z1nHjNzrQO
X-Gm-Gg: ASbGncvm0DzBmflKmH1EhE4798FX13iOD0NYSo2P2GMLvgQgv9z6Z8eN4wqhCyVg8Kk
	UhOTHztzzSO94TrPVUf6rmVWmu3cqQAJBLw2YDCCrY0sJQK3AHQVqLLZlxjYvxLYpI9wEuCO77k
	bIRUnaVysr4h7ASC5o4fSfo8Ev2w+GbTc5toBbBFJRKbnefOnam47CNQQozJEmKjc3wTj8FkTD8
	cxCz8fvPVrrVPRO0S6Mwki8jnmLa61yinZMSAwF0AsFq1LUEGbkyP3uoD0F93FomFfDTw==
X-Google-Smtp-Source: AGHT+IHBEpxax2xMY9nJrTyjERREv7VKhbMGJmdVOS/eKfcaNST6ATYJ5Bmp1DZ6uORogDWU++riWw==
X-Received: by 2002:a05:6808:3945:b0:3e7:bd4e:5b98 with SMTP id 5614622812f47-3f038359e56mr5897262b6e.0.1736685007081;
        Sun, 12 Jan 2025 04:30:07 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f037653ff2sm2196609b6e.13.2025.01.12.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:30:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 09:29:39 -0300
Message-Id: <20250112122939.988309-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112122939.988309-1-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

Make the CCM nodes to follow this format.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 423c0142c1d3..ad03c0a13e64 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -46,13 +46,11 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/imx5-clock.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     clock-controller@53fd4000{
         compatible = "fsl,imx53-ccm";
         reg = <0x53fd4000 0x4000>;
-        interrupts = <0 71 IRQ_TYPE_LEVEL_HIGH>,
-                     <0 72 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <71 72>;
         #clock-cells = <1>;
     };
 ...
-- 
2.34.1

