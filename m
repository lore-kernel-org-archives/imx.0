Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189C32F763
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979122; cv=none; b=XDjT53lLKKSOLeJzpl4IqfY5GN1rYdFYnUk9LeK5V3IDaRJxbWKoMh3LR2qhOSSmq1n0PiRh5np3mVpX4WsPg+Ht+vnHY9EhautLu2dH2/2EhS9zRY+v92F4oV1xbdzjPsBYSq1LI+UWBIy5aFyPYEQNnp1OwbzsEW5xC/p7nWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979122; c=relaxed/simple;
	bh=gzZET6mP2OucMjDQ4thYViOeZ8/OsV2OQsQvxJj19l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7uOvOfzWuGpLe4Xlb+E5BDeJ+68zhU5Yl8U+wrv/7z9tq5569EbNR5whYo0JJH4Q6cD6eU5Mt1hSY1B2qbTcZNGoflPPHDQw5I31K6MwVR4x47hGogPcuB26BE1az6nfzIYMVylOgGKE5lIlIWS1Z3tbCdHCEZOXBaSna2YLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EznRoHsj; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EznRoHsj"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-940dbb1e343so44533139f.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979120; x=1761583920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=EznRoHsjkNVx6ju53WlqeR2fwma3bYPpYjKGaaDZPR0ZMEVuR0eH7wCv02RTqMlSXC
         ktba9Ro0m/XWDHxNLhVoRwvtCsGmUijhf+X/VQ6fFVTeNz25SWFDmrr62A3Fi4bhZPze
         4TNlxSXSugsPL49VrKKp0q0mR1U6MUEmZ7COppPFEQ2pAkKWZ2rep3UPj9plRWVW++xA
         IJB9is0CvRF0/uQTIU24oJKB0GDqoxbYsqUTeF9AN6VlK4oqa6ikS8XTkld2B+nwdVt8
         eTSf2PDaC359zCM7KSEh/Rc6XHyiKxt3Fu7sWyotVTBmhUqgjxuA0Z7QKVLp9pcQxO6i
         sc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979120; x=1761583920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAFHx5Fe28+JucgqjXAxBLPfwtGRK1k39/wAp21/umo=;
        b=svyhXlaLlkGuz9RCJqtE4zkXOI5xkOeGGRnKeif37PPoL0smwGC0ce9bLFWXxQNbN9
         EHOoNzH0QvpbLgevBHRAyP72zUcWuwkEqJXtSrheb+pqKYKpLBXw+E+Q7o0m0a2mX9k6
         xY4Xz5SMZ42eGXRNpW9IzPzeIyswUz5UPsk8nhVxzoMsyKsZO3LGyfSSrQ89JrqArwhT
         ZBcPz3xAQjXzJRrLlmPMSGmSvOlsOyxpZx795mvHMjV551ybPKgNBP1ry/RdeqcMESzg
         xWA07qOTYK5Rjc9GMKXG6URzUbENaDPobiLSOVGjSc9W61LSsrxWW4fak0UJtkhuHw4H
         SU3w==
X-Forwarded-Encrypted: i=1; AJvYcCXcYBE8/WDEkmGf/kIsf6WbA2kXM+6bN0fTbo25oEtaOxGkMniASWheOu5wbBObkblZedU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbkMsqKpRUJuSGGhHLlwe0HGd4J9TGgDbpWwCHeCpPFF6AvYS+
	Fl8tsBiaSD/4MYUYROsc6IOJzxL7ofYZ0MFM8Pwwjc1TsFitmlyXJ+zW4KOO7NWO5Jg=
X-Gm-Gg: ASbGncvhcH0VWY5zZVWrVEu3UidYtQhLoae9OpTTQ33IDoRWfiFX2SwmCjio0tb7rAm
	RWeobFxM1ddGmi69h7eJwqkuj0H3FyCyL1F+k4Yp3p9MCDUMpjnodFiqmWnKXlNkRG6VulyQwPL
	cmMetBN16Pa6p2qh5yEseYp9+0Tx7NhG07/weFK1i/8HQoNihT2EStxVEMgeOWCpfQ8W7rV8ouc
	HYDtBRKb1aLGPGmf36IEnApxC6JFc1UR8vSJA5DDIrL1kwOAh719Bn0d9bPhgUAUeCBv4wXbsoS
	5XGTY5hAwJWo1hCkvAxvgnaIG9WNbrLMP58rSyniGjyBQKAiZIVR28iTjzlE8IFgmzmHayIo7SS
	cncL5GShcgDwhWPmiU94elsMrY8OtqU2FZtep7rxW3xqwnI5N9W0b9rLbfKTT3dWVVgDcMPx+Sv
	LDCe27a7u4BsFeFFgZkymEeRgDJPDDJbJvOPFkP+pQ59loZ1omxtm8AQ==
X-Google-Smtp-Source: AGHT+IGrysi/n+6wy3sDQX5W8PX80X7sxp0qMRXdkSjXbUhQItP2k8/GDMxk0YCbp0Wy5FwbdhktFw==
X-Received: by 2002:a05:6e02:3e8e:b0:430:ce63:4180 with SMTP id e9e14a558f8ab-430ce6342cfmr168487305ab.8.1760979119873;
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 20 Oct 2025 11:51:45 -0500
Message-ID: <20251020165152.666221-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 0315a13fe319a..5bbda4bc33350 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1

