Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE92BE7CC
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581453; cv=none; b=AhxVR3vrinnQbMk2b8nenAUPc2iZCVAzU9JYyvAjZxxrlP/Ax1UXKcK5X8bsOfGHGvjGj4McP2h0s9VPBe/8ndKbELxLCF00K3K6SHqCUPEhGiFMnKmmRdkR/mWHMKB+CkPvxpWQoQspBNlK3jUnEIZftaEQsyagg53KXOegB2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581453; c=relaxed/simple;
	bh=cT+JbXkJCjUndBEl4/KvRhHpw6r6Ue8YLOgh13Ob7jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZwP9c+B7nFRpPpAs4OjDAhXBJwso/VmnTKvRMKsg2AqI+i71CCjsxrt7asjFxNVwD0X5nhyKHkxi2twyBc+sU+QFHDAbu9VtLK4vJdyWW6jDAJ/0klwuIuufdtP3qGYpvGfjTp8N3+YBzS6H9j7a5jkCfkaLa18etU6ANFtA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LwRqPXHr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LwRqPXHr"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso856416966b.2
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1761581450; x=1762186250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT3v2aN8EQq8AgHMNf1v3TkZG4Dh+2CDgf66x9dYHZg=;
        b=LwRqPXHr/4uq3D6BSSBO1lemTjlvk6NJLUlNqn7HXMm1NOC2z4ywofQS9zcQ0m9Aqe
         0z46vNxOHFRcweCvrO7Aqqq/TRoe6VtGuekoc1W02H0d9kOfvxnrSJaAViDN8Vzfjzlq
         Jcep1rk24Lckxes9ufGIF2uJgPHuncBhQLKvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581450; x=1762186250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kT3v2aN8EQq8AgHMNf1v3TkZG4Dh+2CDgf66x9dYHZg=;
        b=Ml7euKCwjBzzGx+RlLuhOQr0l+cMXmM/iGYuuzEa8cDKAo6GzfrIzMv5UbPy6Mf3gE
         lWQEkbpKQ/KeHXwa4MVezIsEmcnlKEj8bSVAUPdfd6vHYdVAl5O/6haSzBNSnN+vdmfT
         YUqPN1GN/0Ba6Yd7Xn0VAAjAh3tZUA2IzdkEO6J3TkIc6QhWwiZIzqpcjNV9rclNrz+e
         St2ko9DKGTjbMQFsFr9yOTzWY5PstPcXVLyb4U6HVqet+Yr0IWqvUV+Bac+722fETSyx
         48IiHFg6NhPEPctiY1+vDXURfkcqr/+debgjphJnuics/+ShJOaJouvbd4+7Svt7wMtk
         zIUA==
X-Forwarded-Encrypted: i=1; AJvYcCWjXsDLuCKN3Ur23cciRCbWBP0QfMub3StuiflYi/+/H1Je1J/Z5r+WyDnZonF/J7ZqeH8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcUSyVLA6Ysi5jUZilgJ5jA2L0Qjp7MBN5CESDodPHrDZlQZLX
	MYTsotbrd+xL2cQKqHMy2GzLxM3uGrMGi0jf7E2M51hc0Ipnjk4OaOqVEUjIAxoXmJs=
X-Gm-Gg: ASbGnct4OKf/KX0IWwSrpWbZwm0r5gzrhptL0UneWu0Li+2H1385sG45RrREH0SeLMy
	oF634rOhqXNCMI2Is49qPOOHPKmeX7LaXTPy74qobBeJF00wOXJ4/FrIMPBYeq3l0RYouXm+lz8
	Ko771LaAY8Ax8aHDRoTR8f9+ToDDRup92PgtB5Bv7pOQL/6KWVMMYMz3A7jWk6ZtOFX9Thv5geD
	3SIEYw/ewcZVbMohpB02ZrfV/8yi0kapN4bkrRUsBdIimLNbNb6DALKXzURGUudULF/rCtZO3uR
	4LFSKz0puJeiEZAaAriIVzFfWfZg+/yNeUWl3crXEll/WuzUH8c2vOsxS7d2BWd1/iIoB82XdID
	wri6y501cH1Nv18TGyx0+FXWuozS0c5Km2AtGZWTHsgloxElKfIQKo1Bj0CGKLTOmrj67iziDq1
	shKHqy/hf+7xylWtVQqw5IVKC+7HqLBKNST5+0pMVoEem1OsVrsWqAOqZMl55PiMm1mHCUPaWql
	NiZosEDuB/FzzhXh7Ra4S+d1bkqEM+pHOG22DFqtpp9940vP3lvjmY=
X-Google-Smtp-Source: AGHT+IGpgYAzuEZ5slMssED+lqV263t1SAtoTQLAQnIGqZGLNwmT1wHA5r73stv598+NcofTsL2dCA==
X-Received: by 2002:a17:906:4787:b0:afe:cbee:7660 with SMTP id a640c23a62f3a-b6dba487ad0mr49506766b.21.1761581450341;
        Mon, 27 Oct 2025 09:10:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm742437466b.45.2025.10.27.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:10:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Mon, 27 Oct 2025 17:10:24 +0100
Message-ID: <20251027161040.2020623-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
References: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop 1/3 patch "ASoC: mxs-saif: support usage with simple-audio-card"
  because merged in linux-next.

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
branch: imx28-amarula-rmm-audio
