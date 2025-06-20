Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646E22A1F1
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406795; cv=none; b=q+2j8W3TWIudAqHOeySr7P57/KI6JtYN+kyBWYnFtakre806Kz6Mh/KdZygDWwjk0iSgIOrKOe3oUs5Djqd/oInQNuLA/YLWsHHhwr803OqFDTyYqF0cKqTHKpFB72Z9LtB7ooGjGvZDk2fCx2Od81wNEraj6D9Wk9D20O4vMSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406795; c=relaxed/simple;
	bh=2GMl15IcDzSLUs4dQKt3zl70qRcqD67Weh9prpPTYRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARVkMMfYpzDkxGDd9mJjccSf3Qp2VtTWd+IiBa8CsiYL1fOEMfal6zgi6tqXNLjWNyJhfAtGZnSG3RPqfyVSqE1x0MFFDtQTvXOE0iSzfHWyR1UBcJarBHKzCxDZ3Yct9edDA7wt4UVC3m+S5eYnEj3h6r5bgwD6K+A/JFU38gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TCJdh1mH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TCJdh1mH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so12076335e9.2
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406792; x=1751011592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=TCJdh1mHVPYuNCe9eVvJvdfyCecVqLHKQVfj6LIGnO0GT995ZUBgZQWzjLUNpIsYFj
         I5UzswZOgjkdH5N74043s0Rz58Lhf2+g/3iYNrbcxRnrWLTXLCI9h9W4y3Z43Dbf2LJF
         peFAtheBrIXJTl47vDuXGbi2jCA4aUf0/vvHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406792; x=1751011592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=DlpQKeo2WGgSGSbSaYTNY3d37cr1oBPLiGcvHUfHGr3v+i4sVMll6fuXP0ZMeuy15C
         TsVhXMqH88YnCfQcanWdwHSiZW54m21BES/1NBDEynxG99jt5ZyXdG2/voyWx4G3aIth
         zUa87Jj2EwC0Uieu5uGON9nHv2VY5kKImZEiCP57t1vS/q/01vpmASwENXgHxgVJZu2v
         TNpbKU7kNBJRaZl66WJAzUoEZnLsU7zkL6Kerim6RIMrtmYHFlvaBN6SP38Bs3SrUCZC
         1kRlNM01vM4xNAMyjq9guNHPZUVpPtx5tm4itIXNyt2noNGfv7nd46GL6ii3DgLO1/4P
         swXg==
X-Forwarded-Encrypted: i=1; AJvYcCXvu95e/lx3UZ2yVnCM4hMdSiKvgl9iM7n5xJO+KCUW/2AnH9+WYF0HMGPd2SOpcN2rd3w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNkIP3N0HJTp51Yx8FM+JqzlUuJOJYzmll1jyHtpuCfyX5qrBP
	MdM0hSVxfWPpRri52KnPWpuUXNZQiJY4jKxOMPF8HWR0Ivguas5r4IzGWhOoByysAYc=
X-Gm-Gg: ASbGnctNZDDoblfBs9N/cm6FbD9iDNxEIGMFFejAESb+qAk9GH95ZFavRlc4gQuTyD1
	xIxGAuoacNgdn/6Fbsw+0jJTcXLnUKDicKbWnyBeJpeptbgzvwrYkGpxLVgFrW8cACpZ6zAM4Ss
	ppPyhqsS3NS54a1db7iG91+NrKUjiCTZfODj35XH4+yWHoeGsX6UnMXUMHpm0nWsr/vD3+Mhifk
	IM2e82dpNBrQiyGTP9S9cm8Txg8l7bIOFL3l1YtmqNNbdCeeskI/R9jFSLtHwfx20afkFMhFf16
	wjmg9aWB4wrBLMTk1KMa/He+4+I8qG5pbFsHZuXELql2nlN7qj4mbh57wZgQpaf+oAiqd+Jyfxy
	3BFdBxlcSk/i0YXNWvUl5mJU+cBIsk4LK1OCbNBd/jv2VAHsL3x9+CZPBaoyQBlw=
X-Google-Smtp-Source: AGHT+IEvnp0x9nPi4w5DLvc1NncQW3DwrucsQPHAIzJHhVTF2FdHwkuDd/b3JKHhFP9x5StRdmgfuA==
X-Received: by 2002:a05:600c:5494:b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-45365a00582mr15702545e9.31.1750406792385;
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/5] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 20 Jun 2025 10:06:17 +0200
Message-ID: <20250620080626.3580397-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v5)

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

