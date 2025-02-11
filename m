Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BB272905
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314721; cv=none; b=Rp1rptqOGOt9L2LTwdLUBeuw6xaMh4TRzmUL8M/qWGd/IV3aOiVAiqRgsUwOhL+gdzo8o/kvFq0fTobeaR6jkjMRAhTEAuf2xepsTOj2WDl1kKO9U5R4Xnx1r1zNvyakjndtPOYGLoTYtPJIbcyF3klKmLi4Q9kr/xc01jqbl9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314721; c=relaxed/simple;
	bh=z17XEyYa6XmOl6iA3JgMuK6paNd3sVdubTKxNieH85w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A59WQbvudzOq2V0vh9hI0XHYQ3+8mtNagRGCo1VdNhmDF7GR2bwsgIU5O1/tWf3ACEryKQwzmZLxH7ma9p3Fzwsu2K4Ujzm/LN8TUqMI2Wad6E1824JIvJlNuqFJp08RzBRJTH9UkWmRnZeU0sQFIHmx/ZjQaNzWuNXGDF/DmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKZpjk9s; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKZpjk9s"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7d7f0a2cfso259499066b.3
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314718; x=1739919518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS1Aa/IQ/IUlV5JxAaBTn62cmT2MDAhS4oWaHSnRKrY=;
        b=TKZpjk9snBMfpfp6fHU8mc1L6m4S9XxTNESaQQzaLEz2z/ggIPVPkNfyVQuElWbuIi
         sqdUw8Bxp2iOJhl1oGxBEPUKrIE4KloUtVKWpK8e4OUIZ2L2RsxsfVhbEBcnVc5H9Lfc
         stmx6+649KY/9WaapIiX26d1GcHWCKEhNFRR4AdieEfG2IIpHm6vDt/jR+29rMXIUh5t
         IrdMSnaj1xhB7mCl8jCZ/1/etk4X24ckGQZmQemHuqBMNIgT4PGxf3comAD/I7Z7pXrb
         UVdUm7fl52vrEeF1yWfCujnWEB6JT1NUL5xzYnQhOzDvoavIUA8+Jf7aViTAgWIzmnDn
         VraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314718; x=1739919518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS1Aa/IQ/IUlV5JxAaBTn62cmT2MDAhS4oWaHSnRKrY=;
        b=WXy6UG87uuRZRqVtKwXNljBOr+SiYTwfTq1m6e71ItkoC6vxwU1CUybqJhvqlLJb1J
         7riDe6naBgcX0i+sY0jk4HAbbuXMD3TsgD+scSOp9miFBZILpof538nceNtD3+UYo+mL
         oQCTDgRR84nFPKO7er9bdGeFYRBa7QbKNp+kR/uVIDE7Rdogkzbf1RfD7e53WPZpRJTP
         k8iLS4MIqMBmVKYi/qAsbWRz4mzUbXmH+69JwlSEmaBDkfjGNpWnfhP+aYR9H3Q6F1kq
         Z1+ZWW+KmC+k62tUGR80Ar3SWxexJwm78A0ltkm/ildH4fNTrZrrBwbP690F6cbGFyG0
         2wiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc2i+25bLOsqaDuK7gt+mXbzyrHpZUaxlrJf+XJ4pFOYCU2huYyKUKyv3a7tVdG589Wlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZgFejb7jq4mXjT/XLnJFtEXyIq8XrsXpLK7C78ORtKWdXUvih
	9ndBCRewh5WBNz7Qy2zfnfYMayUIga1KI94wAD7R16OHrtoSzFv47Gx+FMjG
X-Gm-Gg: ASbGncuCcoHBwcBBfwyjjpmnHJbDvLKhKUYp8912TN3S+xA1lp4mKRbUkK3ujd/WT8P
	FP0LS7x+DQIp32BD/u9N7e7K/XFTTdPCdYygLY6aTOYa4UsdToAXsP9OhOkkq7Frl5BJhB7LOOQ
	oy0RTWJ+jKadloDSauCg3LdTnknOLiUEWVC1aCH9IqfrRWlxyG4ehiXTfnN/+QkQDYu0ggJ9bU3
	By2YnEABAOH2EanoDwGG27uo6LDd/PpqIVmQ2/DtvGVfnYnCtxwj4WkVcgIfh3vNQoENlXVTwgD
	c11aqfaBBK4A8gng5Am/SOGo98K6YJ8mcz3Zdx6i5AiODh6lMnmYOA==
X-Google-Smtp-Source: AGHT+IFfDhnh48nyjrqJLvEAPlFmJ3fjs7mcyr23zd4vcVw6KZQK2okNE3vXrPxb5oT0oY2PyNoYLw==
X-Received: by 2002:a17:907:971c:b0:ab7:851d:4718 with SMTP id a640c23a62f3a-ab7f34aec59mr67103766b.36.1739314717302;
        Tue, 11 Feb 2025 14:58:37 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] add sof support on imx95
Date: Tue, 11 Feb 2025 17:58:05 -0500
Message-Id: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
 5 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

-- 
2.34.1

