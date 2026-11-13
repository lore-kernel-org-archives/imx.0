Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584688;
	b=KmxEHjfhqR8pGbiRQy29WMVKpRSJak6TCtJy0/3McvbTajYReol6Plt3DlQHxBK/ZGKb
	 A4/9gBiBg24QBj3OqXIksknsnxdbSFCPlnGAtQaAw1w4Zprv6KYV/s5FwsqtHQ4nWxYxh
	 WQY28SY5j7qOur5FQbkUL0zxxHrV2Qu6Dx0PwRAYk1RsLzRe1/PEDy/8CdHBRBBFfa8Gp
	 RmuG8TUdAIrd8DfsIgwIELkLUegHq4L+RxXQAS/yljBP5ENNmdnXNDLnAG5OgWbjPKMVi
	 31vUAkaia03KL+yPfRr+8yYDaimUs8oAflowFEzNxjdQ3nVSTixKqfbzA2rQYP4hVCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
	b=URAKd2mtFJm9qhi7JpZkxDpuby+N63PAqTHrmiX/M2TJtV0TQl02eaVnWptve2jJLAYw
	 ARBXx1MK6Vu6+tcwk2kMavn91cZTM6lhoxhkxR3vNA8/J+H5nxRHbVk9BG482gtfMvkU6
	 VU+ihbxVTe/gN3dd0eNXgZ/aTwdXdzmko6USeSlE7MhfP2Dr3xKRF4gaTQ7owLEFC+Mpj
	 5FicwBd7hsyBJtaZ3Xz5y0xrrzPtKocG+CHuvCTg8sbbR+Uu8yGxqRQFhZ87lClhGvGmK
	 A6WVTVJc6uiqeX9Y+q10i7bhmaE0QiuL9spZV2o+jfOR7fvv3rvpwGZZBOSJv/mRTKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPadXJnK;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0388606A33E
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0388606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPadXJnK
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4a2688f96so13818247b3.0
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584686; x=1795189486; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=SPadXJnKWtMo5HOVXid+VsmKQljDYIQ5xf0nyP1cnGoeKnHCL4+swishj7qYQrg4uu
         Ej0x9+jEQj3lGirV2zAFiZKDJ23+VEJB5bQhnV+UNINugsevwM9wI4NNYnSWW7VQ83V/
         oYuFc3U2YnIU5xx+TQ/4m9oYxvtvpriOAXvAbB0zloUrRpmX5vPvqM8UbY9EE+vboWQc
         0jluwirHZSZVNN56dJiB6mXzF1SyCY7C8GbzqOoFn5kMnFvIQgEVcF0VE46mx+dVlvGg
         dUktcm1U977/ZPkDAwXVewxLlc+yJz5OBIvZyRMxifEifCBuvORSz+iQQhrmzXfP547G
         3u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584686; x=1795189486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IlVBna1TtvWg7z53GTsHNVCmcCxandIEmUciwncBErA=;
        b=1Jif5Ghj8ismF7uOzGSzYNDioGiWcHHabbFaS8sf9h7S20O5fSSIPSX71Q/0wYKyI+
         /hNIXw9T4lpYXMRTtE0r/Y7Mhduod9T7pct5TxWqK5jwe85Ac3f8OEGj2O2c9glL2xiR
         LDD7ZvXWIvPVGL1+drxdLj9yuqaU1ToZghbMtgHoMEyoYlY9FZLCkPtKYq91WHsttcCm
         gLZ90rqVHuemqjYkMELelkpyzuxENEutrxOw3l94ZQUzfupWqQIQU5OtGFDwKBMvk+FL
         R+4NNj5Zfypf5k2b0bzxVR0eQztHNVy8bbT0u4dcpx+cdYMgPzANInbr0J7grhlosThn
         olLg==
X-Gm-Message-State: APuU4Z/mX89mgWFdbfQCoyqgVXQhA7kEegrOn5GJnVNbL9mUu3vA+teA
	tCnCbzNPLZbC3hPq7O3yF8r/kyM2tBxB1eHmpE2CdF034SieXYKBE/LB
X-Gm-Gg: AYBFou0CowHEGkuCjZmFy0l2aWmio1iJ7ZFmFHe06phu9OJ63i5bEcNRgyzLCup+4hZ
	tSFSF8+qqG3ba833/ffPJal9vdtxT4hatFS7GISULpHs+7zL0FjbJokqVp0gLiYjAQbQTF1TAnP
	NLUMvSoexKfkw6lce2NbLLSNCP08lS/f+yhe1ZKIXZeiT8cyKT5iI6bxb/pRviRMlqJoUGAxqci
	ufjzEHWlulmvi0IvbV4B4bA1EJWpp+XtEMtosQsPi4ZEUDjlShVEZx1Xcw6dmAJjR0cXFXeDIJe
	iz4vlZqBBUHpCsNb+vkoXDh72xkkzr9LrMyrpFbZjHZjqO3ntqalcZR2V2hcxJFvlo+y0E8CQgh
	Zx0a9b4YxvE6uBa0I/RQh+OzWqZSzCuPNxdzhSsDCFzyvUGXW4C2wgl7Ea0f28yXj4D1+WjpRV0
	OLqlCB+rcc7gBPyNuk1F0w9BKBfe9Cgvl1cdRIKvAE+Z7DwQnhq5IExukyhANArWGQA/BRMAxTf
	t5pPiZaEA5npmTYBQuveZAlpfABQLzwR3YwlmDlU5ZsaDaGYUHmBCOOIcqumEtLknRG7QI66OfU
	pKtXaxPWuIvMuXIef8+O4hoFDH/+zghn
X-Received: by 2002:a05:690c:c:b0:8b0:acc6:8e5c with SMTP id 00721157ae682-8b4aa0d010bmr18869707b3.9.1794584686400;
        Fri, 13 Nov 2026 07:44:46 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:45 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Fri, 13 Nov 2026 12:44:06 -0300
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEYw92oC/x2N0QqDMAxFf0XyvECtTmS/MvZQmrgF2irJKA7x3
 1d8u4d74BxgrMIGj+4A5Soma2ngbx3ETyhvRqHG4J2feufuWD0GzUhfw0WZLYbUnLzPecPKSlI
 wEGGqZEhiWwo/w7U913DDGAfH89hPBK2xKS+yX/3n6zz/kx2AHY8AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=2077;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Q2mTJ7efr148vCErD5HWpVyB0Hsq6rr3sJWLD+6PnOo=;
 b=vwPliPd0FIeZAo0T7lJ0fzGLYLA2vrxZUR15hNJE5V8Dv3HtNT1J36I0IQnXVen2qdujDfggD
 A7g9G3o0h54BRVOY8/FFs151oqWBfQUf+LD4RD6K2r/B8BQ0hV/Z0AQ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

Changes from v1:
  - Include 'tdx' in the display panel overlay names, to make it clear
    that these are Toradex products, and add 'v1' in the Toradex
    Capacitive Touch Display 10.1" LVDS overlay, similarly to how it's
    done with the V2 display.
  - Link to v1: https://lore.kernel.org/linux-devicetree/20260813133335.1941580-1-leoreis.costa@gmail.com/T/#t

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (6):
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  30 +++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  71 ++++++++++++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso |  94 +++++++++++++++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  95 +++++++++++++++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++
 7 files changed, 644 insertions(+)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261005-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-034c30e8416d

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

