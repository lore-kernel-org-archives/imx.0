Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434D4B826B
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408724; cv=none; b=hPJgL6hmX7HB9oYVq7mcatN31HshdB2fbgexIZDxq6jzxDJJryagljW+RaW2cBifC8ym/LRJJWYd0UwT8rFUctp0gsYi5n8Jg043zUamwrDOovYboaSxY8KNUcNmGA6yhSmd5ZVRoXpXWTcaaNO+L0gAT8XRjVV8c6aUj4si7Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408724; c=relaxed/simple;
	bh=sibS6+PbzNU0PLhMfzlVYE7Xqoew+WZ9iiOgUjlOo0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ieXJ/RTF451vqeU0sTaYNLum410fpnixf0GyUUW9CPlE0aneqkG/WDeo4kcWLRaoa0Jv8BnwH47rvu240YYz0hTJAZziea+PiaSuzqFsEOegcNePNuVY7o4NMgPnmxrjjU9mb21jBa7zbR72YawwkOgzUs6/hgZ8l0w7Y/s0uTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf+9EtBd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf+9EtBd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so8199385e9.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408720; x=1793013520; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=mf+9EtBd5YmaGftiamLEHORyAPPH2Oi5HQDnHTSdnM/a3Z237kIvrSCu5jcF0c7b0e
         lpSekljEqaFtdaaMi7614DwLy+OzugUhpqXcwfM5b3TaRW9LOVqYpXwRmKsXnkxZtUpx
         5NsbNkI82Ogz42NNBhALuV046QWLXBORC3pGfq7Z6+Mi7sRSi8xRVhPgjXwbCJtISbw7
         0GjjPMtRs/c4NyoiXLjh8p2XYK8588+1TfJzJsvDL0Vkr6WVFlpX+opB65wLHD//FwQe
         NM8imjfAPQLgQeTy0sGPsFX5iLBCAUFCSESQH0Au/ARAg6LFQqVhuAlC5aC3eWFzAW6J
         4Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408720; x=1793013520;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=YeGNY70NZjF5P0cRYrvUBJDNXtd2Ifl4BtLQYowBr+uMS4nv297v3mD5B9q5YpMJJr
         yES0VjBol1mVxwlYWpyzXUjAQDlzHDkSwRVAdE1NcPI5XOlAYJbxY9gvkCxaVFOu/7vo
         yImd4INjrKhe/Oql8TmjISpxkk3M451+3O/tla4g36In0/a2kKO5sXw1vOjXRD0tSXZl
         NMb8qGBezbqZ7eqYgf/TBbwWSmhBSm5H7QaAkjxpDhJx2hdWopqPb6Th7GHcqDM/z4I+
         reoQAyyITAv2ZiHjH8LPg6ag7gIZIquGNqPrmhdKIOGg+5N/YwlbLYRjbBVfj6wk1XLZ
         WApw==
X-Forwarded-Encrypted: i=1; AKwUvByrRC3mJGBLJa93f42YVx33aX5+6A3NCS8jld0Y7zyDfErHjJiePX+NAv4jtRPWesuziTM=@lists.linux.dev
X-Gm-Message-State: AFq9FYKWVHTZVkesPoHTPEL56hZp8ZdAtpgPoUwS9/fpyqk5MrziNbYB
	/Mqekx1gA3erfsASsv8V4UfwfaBAWhDgY63u8kAcaJqgmpgO3f2TKoi4e5tGxA6F
X-Gm-Gg: AYBFou3DmNi17fSzfvU1ZfS1DWyU/c1uZwA0uyvFtdluYZJHF24SK29xWAgH0g5K6eR
	gCE10hBwumxM0tRM7/NzBDvSTeHIxaVkctU7BfvjjQFoxGi/5bAGpP9kgBTf9lSW+GY1EcDxVYC
	AWltgaCBJjzE4AkjFV/puk5Ju835IsxMXoWVdKm8bFg7tUo6FLeFG2KOMY7lUTT0GKiKrXMvICH
	HJQFwwBjfGCcPev17d9l26v6NGJ87TABTCwPxjMt7r0jmR+c/4jmkpln5/suWXaFYuKogUzExnA
	vOPyCDS8qmgA/JCVM4qJibyRCHGaOE/1Huzr3HpsJOoZ2D0c7z5WHMy+9++SIKSOJ6DZNKWB88v
	4VIw3KI9tk6t8ufcnlymVAtjYYJUefo6kwXJj0DILGduW5gTMx5HWYNHijLTBbfmnP++kOq+9am
	gYBQEV1aF1RqvRNtLb9tBTNAmS0uIN190UuKgOyDn7HXJmbRgG44zmR+Jpeo4J13l2gcvAD1KuU
	er9bBVgxAdw65ADH+CNc7v/z5PoHHAqbrepW2MUa3hslSOVHZzvIwPc3uvZTZEY+MW0af+mFEe5
	EP56yYnjuE894wVfBTD/Mw==
X-Received: by 2002:a05:600c:1f83:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a1d7612128mr156524285e9.16.1792408720439;
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH 0/5] ARM: dts: Add Colibri iMX6 overlays
Date: Mon, 19 Oct 2026 13:18:29 +0200
Message-Id: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZs0fq5irioNWpAraRQFPHuF
 pdvMfNAIGEK0GUPCEUO7I8ElWfgVnsshDwlgy60UYVq0fmNR2Hk/TLoI8lm74C2mmxT0jgrXUN
 qT6GZr//bD+/7AXR7kt5nAAAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=sibS6+PbzNU0PLhMfzlVYE7Xqoew+WZ9iiOgUjlOo0c=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qdvk9Gbh8e+i0/dPTuiabXL8+MPu7zneko6NZo6H
 ysSLHX07ShlYRDjYpAVU2TJeKIqyKcQIuvB0ZwMM4eVCWQIAxenAExkxg6G/3miV6822KTwsHi/
 N39z4Ihps1nPpVmfIizZXEQvOy1/sIuRYcshkQVL3rQvK9EX3+EabK0vOzHaqKks+vDdX4uZy4O
 YGAA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Antoine Gouby (5):
      ARM: dts: imx6dl-colibri: Add HDMI overlay
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso | 27 +++++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 303 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

