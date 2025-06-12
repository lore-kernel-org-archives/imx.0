Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18922DF96
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719319; cv=none; b=kmgkYqehke8FnyJA+pabdlCpljgGjUFYHf6q58fvu5fRc2zC4bGBke/rhhdgRSCRu91ATi6TGCVOjUCdYK6ucNkRfbwMZoOUQqZeNhS2dddhoshMaOXPKCHDdtqiTVYpMHjkK7Gjugw4aAtdX/I6nBdsXnpyz5pBIO4+NFrdRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719319; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f88WzW4KAQgmfpMk+dpHfZhaaE22VZX6leUKyxrwyI2n/2HzfLLzEtDhcZ5jMgJNYFD2psDrRKsrVBpLIPQZiGPsLzuJlRq/sN0MLdOrpx94dWMizyD9c8mIhjsyIoQCxL2fbb7K8BhHIHU4AfGpMBAx5np2vub7jIYjiFs+R+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dm0Q/l9h; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dm0Q/l9h"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb4e36904bso138564466b.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719315; x=1750324115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=dm0Q/l9h5PWFZuRQpM74TCiBFLFYV+Xomecz6clDaXVBJG0s4Y/EM79VMb61OkVMzc
         9kvdM2irt8f3LW5VTpiBy4lIWz7B6lBLeMCsy5B3Pl9BdmSnHCD4pY8RNcywpdvwig7L
         2N7vXNFU+6rLDVf/K1RecfmOljvqABhYojBE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719315; x=1750324115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=AFn9aZ87SuFvWIyXqs1Yf2KF29yhTDDpssO7r+X/O7Nien4hVvp8tVvz3fnHQtdxcB
         CWpPaYOhVYMllE55bT1L8Ka9uZS9LW768nJIkV6R64qt65WSXZww/7mZMpX/l6ijAb9v
         aVa/6LdLJ2gDOXq4zWy914MvlYAVlMs/4m+dK4OPyLJpa4TSjmhwbjxRRbjrba7r1d/+
         oplDdasaGLEu2p8qrFLf3IAwg3PyTqFazO80loKTQmO7PZbWaN5p7XFemstReedl+8KG
         /1CacbFAoS4berDih9lLpNtENyzljkaM98ft/myWON5RWKjW9c5Qv6GlNTvzEqmCZwWm
         vvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCViqIzL8EbH1neeiAOEmI9GqHDw6/7RQbwFAVqfBR7qASAOQXegB9s5BhQV2mtLJTTWs9o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9nh1DIQMK9m+hxh0CvwshGJly5DAgiTEO4C7yb/I0md2C8JTj
	glqfpsMrIEDhlCWR8yLd/I2h8glH3NKymQrizU6MjZlW1FF+ag/scXgUp7Gxilaf3rs=
X-Gm-Gg: ASbGncs/WSkdfSw22gSA7kDzyoxx7hTIinDbiXXjTBiVRvvaz+doOSkr88YdUV7wM1r
	YlFUXb5qTjp45SKDlzOGzA84VfQ8Zy9UyJOzBxuF+AcCX5TcrlKyLTpvgwpne9YRg9KmGARWuwy
	o9IdtEsvX8FJhLJnWGUAjH8vSY5d2Pj9GJ/KkeQM2bi/vcLbXSw50hfO0dVm7p9XdIdb1CK6dFU
	9E3rtCxzGBwZngFPc27R+B7yM9aBOtZAOtXrAHw4q9xqozrNihvg+X3DpROUu8hJ8Mazux5mEEr
	Jc/qVOXB8WzgZDSTyqzsUKlyrTZ07n73QR5gJM2siB3d2Jp+AqrNNOs9mSlkBiq7wUSxvzm/9I1
	NItH4qTwt4BOk/DYmgbwAmaMYSQ==
X-Google-Smtp-Source: AGHT+IHw+40tHRpT0a1pb4c5L8hi+hHN6rjyVSOULz4Jjlr+LKsqnaDwCLiI3mpNwIAMKOAJoxYTlQ==
X-Received: by 2002:a17:907:986:b0:ad8:88f6:a7d with SMTP id a640c23a62f3a-adea3809b1dmr281579466b.58.1749719314703;
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Thu, 12 Jun 2025 11:07:50 +0200
Message-ID: <20250612090823.2519183-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0

