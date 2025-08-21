Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21D30DD0F
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773817; cv=none; b=KLI2LO/t8wvMNpg5fZqdxDHJ4aN2CZH6UUHtSa0LR3+mrNV1SVsiwWsdMpaw0pzIo+4/8qpqdX99m9ykRMxMx43jrlo4qm9csJZMwNmVIJmX+KEFQqpdmPrJWNF71Gq4C0+4lnzHWV3E6H5kY1HC/iY2JHdxw2dO8VXZIVQ03KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773817; c=relaxed/simple;
	bh=iaHOGptznAcaiLxedhi+fdj7JOV3h3QH9q5o9VE+Lqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3UkoQNlZ5cc1gG2c+2JF5wMj5AyKYSu2lJj1oUfGBKJFIiX4VndmmXPMqFVzTaxSKzZMWe+Te5CMWkCoF5nYY9ds5+mNdYeJWAMACr4mgMxFsEcU6oFxjPTua9QF30W7Py99fgCHs21hgpkxHUkuAEbz8BX/wsc84k3VQnU9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw4+cEuV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw4+cEuV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb73621fcso121939266b.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773814; x=1756378614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjhHptinaxWWJO0WWsGKsxwtJOMywvKfSlqr/lw9SPs=;
        b=Lw4+cEuVQcxBoQ/N6hdy0k/j0dIfkOTVz1yw9pamkkpl0PoTHitfU+a9ahq2fX1gub
         bD+rE4sT77Agy6vo5bqfxPuaQv7mgUfPdeQfCNJutKpU8eVpPzpJf+1JhQ2v6eY0Ipz3
         rFY+Pi9yjVQ1GVtgHXL7AVf3kRvewg62OgvDehkLJpJvhpexEbhTLb4m8g/jH7PESmPE
         TjzYjzEuqfs4SSOitteVQA9XLB/B7iP37aqly9EzMfwGO6o9xAmOPL8YPnv1hcEYhrZc
         5HAOkUT2hCqf2x3Rmbt1RpiwjuZBukid1zpVGIFkT1ousQWI0x6TuaEF1QJgKTMEi6Yr
         u7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773814; x=1756378614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjhHptinaxWWJO0WWsGKsxwtJOMywvKfSlqr/lw9SPs=;
        b=EUis3+TBqPSSenEXEw2wdVBES+f8CAHOXjIRLJgwIN1AZdzubyLksd1Q4AQzk552kc
         cQHEAorw2ek8KzDuA1kTKptFUcktUJk2mHbNpmsNX/Ysw4KjvCgbjw4bSf2RSbIvzgjt
         EDe6Axv8UYS+QnreX1F1H+FAJitoaJ9L++k7Y7Wl0HvNnvrYZwFv3XJK2g50vz5pF8HJ
         InqOAhn27NUsXTXG6a9xWDFuyjmMe3ofgX29pxFvAHqJBydS+RgQrFVpN4DBvFhY9Q5V
         t/ltCYZmZceshsNynA0eaGfdA+3KomaomKRbFwUeTyFt7s0UB0BaomFGmwaxEMLh/Eki
         3nUA==
X-Forwarded-Encrypted: i=1; AJvYcCXFS7p7KTgnjjWUgPT/MY+VRt0CX59hSv6NeBFabRk55+rpLm2Km3xnwwXniHNjYo9YVrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIR5oZjM4TlntWwl4nRXsJK+AAy2oRQbW6dPbMO7ZsP9XfOjYG
	8G4H9QNl1ItDAWoS+YFRJOWzXoUS/fT73//NM/JfLg4a07DSds2DwBl4ZvETd0/Y
X-Gm-Gg: ASbGnctHKA+X7/epye7w4aqNBTy9spWh0iQjFlUcZX5FUYUsOeszNlBOYEeyONXkHHY
	VdJvmEe8UaJpRxR+5Q1guBZQNxZ9vWNz0FnYG43jvuebilSB67uF2Smt8H26i5ifC17QonTZTp1
	ohrive11pbmMVYtzg3pA0IMbfiHLwMfBFqCfSrZUeM8qwbdqo0nqfmVaJ7rUoty6G3wEoXzwNRp
	0a5fI7B3SdBjQo6HBCnoBV1AC/fvHWOQsjj9B6S8+p31OoMLgHTFTTZBeKeZbec1cls62J9Qyqt
	3uCnvNlnKjgV3ubbQwyT/C/9dW5KUKdhoXClfmUX4yPX0IJn0DTpqy4y401I6B8BdkSfoT+u1de
	Ug5zELa2kTS3SegXWVtbIPv6K+OLOwLLOlinu79rXui2tXg9zMM7+
X-Google-Smtp-Source: AGHT+IFh9B4wg+Jo7EUBE7+NvFrwXNN/AeIRkW8yHoL/KgrlM8+Hu4y+F1NmIGfgsp2QuK8PovS6Lg==
X-Received: by 2002:a17:907:7fa4:b0:afd:eb4f:d5cf with SMTP id a640c23a62f3a-afe07d4c63amr191037866b.63.1755773814070;
        Thu, 21 Aug 2025 03:56:54 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Thu, 21 Aug 2025 13:56:34 +0300
Message-ID: <20250821105634.1893-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index afcd8c785cfd..841d155685ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2437,6 +2437,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

