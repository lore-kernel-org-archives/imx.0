Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673492;
	b=3tTrWSm0LS0Yvz/ZAAVY6YzbWkc4lQ69Rji0CkvgvR6AF1cNZmmwOyUeFsrMx4gXtclM
	 tq4thTjo6Om39fvKTlZIMd311adn7Aze4sSBq2iqOYxfNoeBD3bpR/muhgisF52lLWmRU
	 BWy9n/swTWUZxN3H/4sqtbE+kw+VS9f/PlHghUX7VZfIc/MPAAlf57JeEiwf0LWv76HnW
	 lIUtpgXRgIwU8JSeMSmWfv+KcEOP10/WVfKl9qNSZPI/kazBXWF7iPGItIVV2iXMTY9/s
	 bShnzcww6qXrnvzaF/V6Nzj0euAKN/oPN5zz2H1Nwye1tRaVbhflfH+nZd5zSuuzNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer;
	bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
	b=hAYqSWd0Ah5BnJDgXpzNUnIvrKAUjreLvlWq9OivCs9m/1hIsN2EvlF1ORu4JkgCt7hv
	 NQ8KXc7nRusa/8n+UwjzRJBlArBIwVrckAARwjkjNCanOKQkpeM2RTd64qJ97hrB84skH
	 RGlx4MvIQr1GmFcLaOYYJ2ZXcayfDuALtPGCoA1wkNuukbio2RA9AchBy9ZAjQ196pLYq
	 6eEdlPEoNdJACVgKpyq/K4uqXS2Tsry7Fhq79qSxLpR5c13Wk1+yWl+hlT8pAccFjhVYJ
	 2WVnoxXkBVrazXsZitFF53i7nGH9CyMICJiLRndEIbMu+rQpO+Ab/orp1qx7CYnroGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nDkTo1ES;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8C606A31A
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nDkTo1ES
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df146015so14298275e9.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673489; x=1793278289; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=nDkTo1ESR4MmBG3LBs5fpImz7uqPKabzYkZMpyR7yDxAI6biGJnhVYjWoY+mo+DpFz
         3zoym2QbJtWM77Tf1kLvbv3QHTp6246kCXilZ67jBPpMXmXphnfrEUlVWJcIR4ww7gkR
         vvLOmDWyGDEvd9ovo8GA7Lt7mECdxR68ow4/bNO/2aQV04asLNObWiaGeJcuhFN6XfIo
         SucTKVkXr0ABGWVobhhidSa0/6Er2e1Cwkt2XfHsbtZDf2lltbGHAbj91t1+WyjQBoFV
         8m/2b2cHi0Wtx6PQ+9jCtCVPikLWgrjnRa2AGkOObKnv7ol4k2foyV7hRWVnpIqmN0NX
         sS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673489; x=1793278289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=psaTz6aCn59jl9cfqI8R7n1wuh+3wIyTI41jyFBdeuSD9R10yBqfDMvvTVa1pWvHR7
         hY8PD34olYKRh4EkubZRTlpE4JzlmX6ag915gGF8Odk3RzEWO4wZut8GYoT3qzY8Mll5
         SxTC/WdiVdyokyhjW14c0ORqIi/Ad61SWffsWce59aFuxzmG0x6GqrmAMBew1a4gax1v
         FYteHa9HgsiYt1n3CQZ1mRxOGChz4p8ASYR40HsjgkoH79slxr+8GEIgcxkXSvqlc2zW
         KrD78up2uNjbSBZSKOb6VxHRb5k/5DbEIdq9Mr1P61fJpnAqypqd+j7DFKFBFnMM24VB
         wFsQ==
X-Gm-Message-State: AFq9FYLiRwW0PGh30l8kEqjLJK+0eFD9JQh6zN7RRBYbmkqIGOltcuqb
	ngmfyUf1C49PdsxCcEQkx49Ho82jdX9hdAQIyHa7mgxABRfOW1LBW0zy
X-Gm-Gg: AYBFou1K/M0yGz+KqSYpd1+/njr4grHYqAJhnChY/Eq7iNceHEYLcLnoWvbzfJjgYUA
	hQxLovhmhroqOMV2VewQdo+WkxDFwRv69U/Kpgm4hBkFowj4qGj+jssXif6AmyPc60OcKsVEq8I
	bHCzlwVmuJog6VCrxX8VB4lZOPgfK8S9b/ftFtsZ0G+0qQ/MUNDDC2nfv1veOKyKi7hNApQmjyL
	BxHfH4rSRmwkzFEh4vxoyOTESWIQcd7PxSqpvsQIq3qVCnudH3B/QwoYtRK3TcuZo4o5BwYI0r+
	LRkVdG5vjMh09rV7jJWgCJhCkm0sCEuL4fCTcEU/5pcRlfWFX0Tu+iY/qMeedICokxKSdM2jSQ8
	iyO/wsdrNYrexKqIKicGxSXTd1ZGqzhVwZiLZm/y830ROAV2nZgcQk2PS/mwhNT7E/Xek02T6xu
	LXmnWxlQBzDeI+opUzUtvEPnNdCdQLniat0LAzudbrqmOPSvR4wy6DYA8KD/VHpUWey2KdRdbpT
	iZWiZTQF+9lVZXsBK0L73f4kMaSwVn+tVEO3EirXsCndce15HiPTeZljHGnnoDWYKEHaKQWm9C8
	bcuhqZ/WapIBWdPcH9GHtSQ3i+oRF+mxHqF5xYDZaETxNYEP3NJRv+c=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr127894895e9.5.1792673488922;
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex NAU8822
 BTL overlay
Date: Thu, 22 Oct 2026 14:51:04 +0200
Message-Id: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIALgG2moC/x2NQQ6DIBREr9Kw7m/g2yh01Xs0LhC+lUTBgCUa4
 92LLt9M5s3OEkVHib1uO4uUXXLBF8D7jZlB+y+Bs4UZcqwFRwFuWsHrn5SI0C0jWFJYYyW6vpG
 srOZIvVsv46ctPLi0hLhdB1mc6eXiijeQKVrnT6WcZvDBg9ETRQ2hNKPeEkTSdoMsgJeKm7oyq
 NSzfxeltrQ+TJhYexzHH0xT9a3IAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

The NAU8822 audio codec on the Toradex Verdin Development Board and
Apalis Evaluation Board V1.2 can combine its two loudspeaker outputs
into a Bridge Tied Load (BTL) output. The overlay selecting this mode
only sets a property on the codec node, which both boards label
nau8822_1a independent of the module.

Instead of adding identical overlays for every module, rename the
merged Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso and combine it
with the Verdin iMX8M Plus, Verdin iMX95, Lino iMX91, Lino iMX93 and
Apalis iMX8 device trees. The combined Verdin iMX8M Mini DTB keeps its
name.

To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Changes in v2:
- Split the BTL patch out of the Verdin iMX8M Plus overlay series, whose
  display overlays are deferred
- Share one overlay instead of adding an iMX8M Plus copy (Frank)
- Also replace the Verdin iMX95 and Apalis iMX8 BTL overlays posted in
  https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com
  https://lore.kernel.org/r/20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com
- Add Lino iMX91/iMX93 combinations
- Link to v1: https://lore.kernel.org/r/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the NAU8822 BTL overlay
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822 Bridge Tied Load

 arch/arm64/boot/dts/freescale/Makefile                 | 18 ++++++++++++++++--
 ...n-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} |  5 +++--
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261021-imx-nau8822-btl-de926231bf78

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

