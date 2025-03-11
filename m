Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FE3594E
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710861; cv=none; b=CinCfi1tOC2oxFwwOqfvaQTMRuxTVnhaEsXyQ8PyzUN8YYtahBVp/GHnb+rlnBbovvnjKJX5r+6xmCG07SP2yEvT3ZTTgjFHEeo9p+LnNK5XSExPF0oDmKkf+nmc53RPQ8iGy3Ar22AqGQrvLXf5aNM0fa8QDMTGnJsPv1I2dEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710861; c=relaxed/simple;
	bh=XpWGcgDN8sRh4sREnYbb6i78j2YmB02D/7tcOiVP59k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aGAWjbv8XFqOsR+dnWOkSlvrshJ1uDSF6Hbs3cjxoRVTHh+lUoWMPkRtEq7BPdQ7jikARqUgHIvqpfJ7G90OAaM+vu03WLkwGXtGKxSVF3yVy5/rG9JiG19HwzV9mIocHbTZ/nO2bu9XSfrJKy4kq6e4BAQUqI3okoF9z2ehSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRgNz6/h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRgNz6/h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so15951035e9.2
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710858; x=1742315658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=BRgNz6/hK0kT/L1mcW1SLHaE1NmHML1WmmshzDoFT643VmewfCh15fdPXLmrylsYIt
         pxjPvZjzMV1trwFjMKBcfZkWpXTFlq2nXTWO5ZfBj1gQg+mTnoADubEh2znCR2Tf5i61
         1LXPECuZe2xuIcIBg3WzaRyLfvL8xHJvDMRSKauxeGkS03cuVq/HCGWaQR2guzi8xod5
         bwXv0VbTapOYbXeOAm9a1e7ggwuHlk68LFzaN4gauWoGuI01Sn1wqKacgmISoWKphOKk
         hYe/S90b4Ag+aIcLyqCsnyZbfcJduXUIZEajVkqiOFq3eazl45QBhSVHQ3WzUf8OCQmB
         QvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710858; x=1742315658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=qKHMHMXUqNmCWR9nVmIjSxglKgKwv39+OGkNCcTjNqS1ndKKRhJoCxhjYU02hBm9pL
         MzKVI3fgcr50noY8Vlb0sNrIKOtRaYrOIpnzrdUrMNkIcovrve5G1/NyCQOSihd7f1D9
         6IR4EmywjJ5MHlMFbMNDxsX0aFEEs+VJKxnX0Kx3v/ZADs7DOHZz24YwmS6gOEfkgVVg
         yGZLtrhm9sBcCbDRdxTojDnaWa7xFuM5tYu3J1tlvRobmH8pFuYPrz+ZCKR8Maszenti
         eBukJVtJMANB3WOcm0FQWmVV9APRI1aV98imdpa7Q+GfAmuRRfd4y+2XKAFVfLuxj9Oa
         081A==
X-Forwarded-Encrypted: i=1; AJvYcCXb9EsNr7h6Z+OZy9+M1gyhlXn3qp7A1r3EWB4ebguPmpSMXWWhuGoKDGOynNYlbmtcbaQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkJDERmZk1CF/63TsV7gFCJTWnFFPwIYUugN08Ip7/4kOX69Vx
	vqY7xHSfv6ejaMYnCD79cLgkUSja2K0ci2Ebjc2rb0TAXdeowWT4hrNLR7jJ/Ww=
X-Gm-Gg: ASbGncuOpQAFExE0lqXzTmLXJC49cudH/bUiIdpq56o7seXMUJXZfJrTAZS8zUj9/98
	ghftNRJvjofpGZClZlU8bBc6O52jVFduiGaMEsCv9DgwbDs1PD1+etRJW7qhpIIkekVpx6COZqd
	tp2ygjKNOYTJACvMFgz2UTLkGN67m0UCeonSrh5IVV36lyXNCTpLgJ2G+c6yMBIocnoXfQkSmra
	qaERoO+q1NfSyR1haPSW0u+sGdKB4UuBOOhilTK+P/Q9QDzHf17iHBo3MeY85LAaPlzaa9Xstk3
	533VZatbhI/UEAfQJ6Jw6ncDFT6hy+y154ndAk84DGn38fpE+kF0QmMwtAdoGfpETzrHFuoP+pU
	eHIC67Ys=
X-Google-Smtp-Source: AGHT+IHdsDUwn7BuB7/yHC+hyJsD9u0HfbePtL8M8V5c5UicG8UQVf8a0J+pTxBUDdadzKyEwrdEnA==
X-Received: by 2002:a05:600c:4ecb:b0:43c:eeee:b6e8 with SMTP id 5b1f17b1804b1-43ceeeeb9fbmr90756515e9.21.1741710858030;
        Tue, 11 Mar 2025 09:34:18 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] add sof support on imx95
Date: Tue, 11 Mar 2025 12:32:52 -0400
Message-Id: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

---
Changes in v5:
- added comment in the DTS regarding the reserved DMA channels.
- addressed Frank's comment regarding the widgets/routing properties.
- changed codec and CPU EP names to include SAI3/WM8962 in their naming.
Previous naming was too generic.
- picked up some more R-b's
- change soundcard DT node name to the more generic "sof-sound" as the
soundcard might support additional DAI-CODEC links in the future.
- change the soundcard label to "audio". Same rationale as above. The
SOF core will append to it the "sof-" prefix, thus the resulting name will
be "sof-audio".
- Link to v4: https://lore.kernel.org/lkml/20250211225808.3050-1-laurentiumihalcea111@gmail.com/

Changes in v4:
- addressed Frank's comments regarding the DTS.
- squashed commits for common and imx95 bindings.
- dropped patch introducing driver. This was already handled via
https://lore.kernel.org/all/20250207162246.3104-1-laurentiumihalcea111@gmail.com/
- introduced two new properties: 'reg-names' and 'memory-region-names',
which are now needed by the driver to work properly. Because of this, 'reg'
and 'memory-region' properties had to be moved from the common binding as
'reg-names' and 'memory-region-names' depend on them (you'd get a failure
when running the binding check otherwise).
- added missing 'bitclock-master' and 'frame-master' properties to codec EP.
- addressed Krzysztof's comments regarding the imx95 binding
- added Krzysztof's Acked-by
- Link to v3: https://lore.kernel.org/lkml/20241216145039.3074-1-laurentiumihalcea111@gmail.com/

Changes in v3:
- Ordered DT nodes alphabetically
- Removed 'cpu' and 'cpu_ep' labels from binding example
- Some small changes to the binding commit messages/titles.
- Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
- "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
- Removed extra empty spaces from DTS as suggested by Frank
- Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
placed inside / is kept the same for readability
- Ordered driver header files includes alphabetically as suggested by Frank
- Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
driver as an offset to the start of the SRAM region.
- Added new binding with properties required by all NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).
- Various driver adjustments made to accomodate the DT changes + some bug fixing related
to the mboxes not being requested/free'd on resume/suspend.
- Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
other way around.
- Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (3):
  ASoC: dt-bindings: support imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |  4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 ++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

-- 
2.34.1

