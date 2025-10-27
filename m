Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D681E832A
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571818; cv=none; b=uHX7X682HH9IL2OkDW5XQ8rao4o+Gq+VM84KbS3vmPmojSfVCyOaURYnd/uhkSZT0nHtePttITTnxWFvZIKfWd1c2odjyuBzqlg/P1gg+j8uJoZFLDbSn/Dz4LLCl6YhKBxAQqccM2+vFpbn87rm8mBuWJqGvgo3VJyZFlol6mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571818; c=relaxed/simple;
	bh=r/29WdZEJajnpJ//0j5XUaaOQFUOGpajFSIL6DbCOUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9ZS33j2snU9tbYRdK4U81pS/chnF0ZpEBpx5NK62LTMgI5JL4mnxUpgCCG3MK5/wCpQ3hQn3y/4hy+eiqau3r3UwQrB4odlaFfAWhEaB5XwlcKbv9lbjlMsOq0Lvxy3zdSjn7//q72enG9ZitW3nvH6EKhn7zDIRLKS7tbKwvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZOmGMH2I; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZOmGMH2I"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430c151ca28so20593545ab.2
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571815; x=1762176615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=ZOmGMH2IYLd5G3atMDMkElNC4V0xd6iJxq2hnTgibdM71q2PoWO83gTpq+lmjdRw3z
         uq3yrZFD9PHGikbzRZtCh722xuAMcnoVdoAsIbsuWRxsowVod1sw/eK1js5uehZ8iaW6
         NfVqu7bgHZx4S4NIUuA8TdRezTJXe9weXbEsx6I/kOctgtVy8fc2oE9xv4mVRhL0xOV8
         o8NRCmEWsBdEz1KSBLfYzN4J2CtGl9wn6K8/BjjsAMUNYOz1zSHjgtiTEkAFDhadklS2
         Ln7AMis86sdvN2jf7p+TahMhvr7fOSf7B3eRp39XwC82OThWdUQf8aKIxHZSaUFFcTjr
         t8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571815; x=1762176615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=b0uIwLY5NI7SEoYWgFNw5QJFAVx4u7o9KC++zdu6y1H7ULIWi31mpv9lhwXrONY3Y/
         nR/ZpzJ19MuLRe9BCA01kqrH0w4Vla7szqzxxhPCzYcEUgrj+3BZ+3Bl4dQZ0Rzzgqaf
         DL5vd/Pa9EseJt72hIYYS6MVca4IaqnzbZHdBxlcvP2wvc1dPgHMzDKD4moXiUBEzuDN
         1Wh3D1P7F+i1WDX7jdq07h8jCYvGVuOalpL/P4/V0nCMN6jXuj80jotzI4uYWz5mS9ew
         OLogOES/yBG9ivdj4KMX141QzOrgqodv6DiGIvot69z8fA9IZvTQNCAutFXDqB55o+c1
         oNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF62ShKIXcd0Sqx4GtZpbP1Yh1PA3ybqlmKxzOSXlhU20bR3StQzqLcf8H13Y2NxDEcHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsVjiSz+AhPtlzxZYu1i50RM6ZKWckyMjMyPVOH9fwjgrVL/Qz
	x0g2KO70RBOi/CDj43avNBN+gS4C6TUPFtUzlJ2pSbUKOUJLJ4BY+9xTnEfL3EXfBFWiVEsFwEH
	DqgWOI6w=
X-Gm-Gg: ASbGnctFa3YyukQb22YipOPiV/ct5LKv3oMdD7qFRHR0kse9cKZ/QpLEbYuIA9RdO7T
	ACCfcltpBlBhmwfGFfnGqN7XqJDpCT67KiqAaCmPMceYZjE2OMxnVX2Hsu/T5kdDehktBJwwb2p
	q+ao/tKrCvF2FOBhJKdlfhHl63kqKHTak9x6n3hK0SkMGaloUbCgaAKqUi+x3m+wkqLbonKuWAu
	8fB2uLUm0BiihF2dTIHaUVeiYP72MK73pv7k/sL/CWZdBfJD7PIxadTceO+cQ1vJN6DoHdtSmjS
	1oWOC9SgW5z9Ucq74+BBTcNiKCwi2wNLcZSoqkeVSPkA9247rC6PK4+kam15yPVRrpfIIH/lstW
	QWRb46HZpNlzNPvSzLN05u88NjOci13mQOx0FKVk5rkZ/Rq8FUASkwxJzuCnqcwRUcZwVPSbyMe
	oGf0mdTvhhbr0J2NboGRL4dwhNZdRLkYVaPt8Qi5//LkqU3NhOTV/J2Q==
X-Google-Smtp-Source: AGHT+IGIaa9c6711RS9OGQdRfQ7Rb3CKIGdpN5d0nvSIOXYlsYNxZJWsYmkF9NyaMUyPnxGqZ/xfcg==
X-Received: by 2002:a92:cd8d:0:b0:430:cfe4:6e61 with SMTP id e9e14a558f8ab-4320f7dcd73mr1143985ab.14.1761571815189;
        Mon, 27 Oct 2025 06:30:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 27 Oct 2025 08:29:59 -0500
Message-ID: <20251027133008.360237-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
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

