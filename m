Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9361214204
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920458; cv=none; b=U613dgVZG1pUMAGTVsseq3WIZ1PSiOoLArwH6gsU9l/gOmWSajnYFq3NXgUovbWP9GxRArSYr2lDclUr+HHXyx+JDWCVka0kRPme3/S2tNLLx+2tAWN7tsVTwPil66LUZ4zGaL4+BDU9vsSV2hKxG3E7s3OgKM4lmfnCBSKsFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920458; c=relaxed/simple;
	bh=D32owlGLOdlHqubNLaI9nkgZDRqlRnVWNbolwyy8jW4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aMX/EUudvajwyi7vv3UCazsbKfhTEcVLIddIY08y06ofuuLsQCyXMfsGvWsmi9hLYUzZruESdTBrjdcEhDUAUAQhd04E2e9qYgPQdgJ399Oub59h2qcyxcHOniAj/T3s7UdAsKB+B3zOd6SjEKfj5MTd1eGhbKh/CH4I/PDVh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J3yolgko; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3yolgko"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-617c64512a7so625264a12.3
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754920453; x=1755525253; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=J3yolgkoXAx58rRurlDM4FXHDBmNWJ/dbQ2MnhlIT+VEsJz8SgCqRoPEvLWV/56yx6
         cZZd6XC5JjpXKf991R/vyGzTIvjrsyrfXA1+e6Qf87b1FqnLdggwxQhN5zxY9RqZyv8J
         ZOKT3+VupiyozGQYtoyCyRm4HaWIUZYwQkEGihH/SCE+Vpte+iO0h8htwijZgBANUYbe
         gEc8qKjG53wWEeGA5iOwOb1BaXQbKupnfCZ9iSKK49yG/YxKc0zOcisJMIEv8Lj1W4RH
         6maZw5lSGVr10uSAMJIRtGTrek7+6CK5PCJO0VHLE4q1IsmLkF9YlswqvPWZAtgWnHDT
         e6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920453; x=1755525253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4E1w+hIQ4kce+iEv51gMOFHtMhwy1x6OT83N+mRbe4=;
        b=npptWOeghbPLLECj4rTJmym/zBaLbEPrhoEtaYZEpR1heLAtcMVRI2UXLZONn8KuJP
         CNDvFagUahV3e0uEnbSYI6d5WLCu2OfbETkug2ezRvJY1bndSIwiyk75X7jnvYE/snbl
         EM9EOWWy5ln9Z5u/kCBM5IRIvwgM3ZQtAJvkrTJFTp+pffDnDTk1Yh/Ya+Mx5GlcFeHz
         saUzt++7nAmU2R3ibwKxibWHrV6PKSHy51L7jcBYF15Zjw6LcluNdtyTICaLSwYLaiUN
         71U8bblVejt37+VmoQk0BVfliTYG+wU33AcPBZzaFmGXAyE78x5zLtT2afDngcDir5Nb
         jTKg==
X-Forwarded-Encrypted: i=1; AJvYcCUrm7lqX0IWakTw1cx+3ftbXZ2Z91q84wzHZjDmwP3EbHEINferzqjOe2r81fIgUq+apZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YynAezJsTlyCYQS1FYzIUx38QyGcFXClhAJBtV+FP/junvvq7yP
	yuF7RxKwCeLBdQrrXDwaUNbCh/9vYh3kdAykzK4uMyzbLRuIHD//VnomaJYqsxtgKz4=
X-Gm-Gg: ASbGncsPrs5J4HFXKXNziT5tGw0K7E/oPKcFgoHfifGl39xESNoJlvlvqjy4R35IDDX
	BWSTtawtEhWROLkz8kHojKCynJIj9EvLk+s2+BKjixDesgr9EbJFfKYa9RQ93LuRY7akBWbbpsn
	s6N0bSyf9WbD4pwzYWjjO/YcKyoupm71bPi9bbQ62Ek2ZVa2FBbK2PZ58yxahe8zu6oBQT79A7y
	4l96I/GxmlSJPN77gMIIOhF5DGdYVhEcX9W2vAVlZyz0vUIKwvsdOVX99PywIXLr5vlF0uQV5cC
	nccrprpJuorcijlxV75RcfL0E5kR796/IdMZ/ZCOHGQyo8BxHbqvlNjAnggCIu0XBJRgPi60wk8
	8DGq7bsgawYrUc+hfICOE5EOwTYZ6cyXXJq9vQXlFvVBIcOec6A==
X-Google-Smtp-Source: AGHT+IHeQhtn+GwAGxZiHen5xqVtV0k6a2xfnhqG8tq/SVPZOQOhdgU7YDXqOB3wSUZppQOTSjZ/QQ==
X-Received: by 2002:a17:906:c114:b0:ae0:bb1a:8c4 with SMTP id a640c23a62f3a-af9deaae559mr346505666b.1.1754920452931;
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm1179029866b.56.2025.08.11.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 0/2] dt-bindings: Drop 'db' suffix duplicating
 dtschema
Date: Mon, 11 Aug 2025 15:54:02 +0200
Message-Id: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr1mWgC/3WNMQvCMBCF/0q52ZNrJFacHOzqoKN0SJOzPSiJJ
 KUopf/dkN3xe4/3vRUSR+EE52qFyIskCT5DvavAjsYPjOIygyKl6agadDP24p34IaHr8XBiY4i
 0tY4gj96RX/Ipwifc20d7u0KX81HSHOK3/Cx1af8plxoJnbYNNcrYnvkyiTcx7EMcoNu27Qekh
 Yi0tQAAAA==
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D32owlGLOdlHqubNLaI9nkgZDRqlRnVWNbolwyy8jW4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomfYAbFp5nM0BuZDzZfSz7NhlghSfON8hIYWfU
 2/PI5axk4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJn2AAAKCRDBN2bmhouD
 171gD/9jmTBJd9weX4PdgWSBrNoi+OhK7XHL0dkfzxWr3gPih+Y1CUjQ92GvArexs7OSIVhb4um
 uOseVt8Dbup/XMM/MGDC1PpzpV8p8XdF4UAveq0pNbCcwYY+v2XYNGxnwnL4nr2wVEz4bperF8u
 dXljljLZlxUmioRkuVKfQKFeqFOtxTReuj30Aa1L9Jg/AM2lHWl/AmseQLt3bI04m81KnQk+6ZF
 /A+5PtOtF8JDNhBb2n9HXWyKslYnHGcIyYrxP5+zENqV+23fWNdCmQVV/fWzsxtgt89k8g5H6te
 uSi9CXUxJ3l+22rW4UIfWcMXIXV+mlAU/GpP8qc5TVPjGU77+0bOFKAR0MiClggadETQk6wUk9s
 e99hsxBC137+fpYgSjm1gZhF2MIA9Rr/f1DyY6NRlpJVod55+/W7eQis1d6OwEden9HaoGSqqIR
 gKnpWi6HkStV7dKm39wIzBWqty3KqqzAoFy+kQCGtY1A7Egt0bEEsRjlmyN7o2GDRdAAEH+FWTq
 r7/nf+NA90ybfUzoI/QgozgEPiLCljf+/hRtID3Xp+1rHHpIOhUDJRb5MdW2JW2TFpgx7aRDW7e
 5TiVtDmDj+sElyEwNNXEVSzWPxAIgbI6HY1IsRvzCTgAw01ZXRmBAhjO4Rt8MGOEF1hGglmN/VS
 7xnWoAozbu5jkoA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resending because all dependencies are merged.

Please take individual patches via respective subsystems (phy, leds).

Previously:
- Link to v1: https://lore.kernel.org/r/20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

