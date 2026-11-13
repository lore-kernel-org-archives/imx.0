Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585129;
	b=SU+ppzH8tqfW5E4VHVx7A5WxBNlqlUO9Ot/QysZWnRTrWWMrh/sbypVDnxCcDMNzKJKz
	 HOLzZ8LX3ov+7aUWIB+xkxSzXMwU7NeBPPx12Uw+Ms2WNHH4j97NNMZEM0+yOF8BpDEEw
	 GUTIJjl0vvfKx4h9a3u/ZSp3VU0FQcozrNyukwGKKzTixzgfKm4odC1+cjYSsX7VTNAC7
	 PGbkWKyZH6gQY/F3bzkF9i5C8Ladn5hcEGlOtzUpK3rdxX1ZZB/eC05bNBKx6d2h7YjCI
	 83W9e7mwZBesM1NfYLdTMkNUSZ3xkTskSQiVjdeBZggJuBsF+2j1uQTP+TNfeJkENOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
	b=ODn+XirLuw98XR9sKrBkCpeXwCeF+/PD8cu3Yktv74VZisoAwU5B9Xv4/ymcKsKwuNo/
	 yGvPe7L6iHVu8yDvWo1mpSRmQjvrZAEmv3cHf2peaeQPxilg+BngUjjKyyoeBGA6HpXSR
	 U4Ljn5Axpp+iTGaiOwoaWHlRle1882hRuswZmgU4UlawkQpUj6OOe7l+yGLAy+FcuG1BW
	 zx2z7m1QcD0bmdqVJvPMwqTY2z/i4Fl2cU3ngBsZ3TM0nMu1xWZsAIWTJ8wTBeftIeYSX
	 Ildwk2zbFpwgT+d3V/hk2ZQGnNLpUww9Dbd5qx3MP2+DjuyERyFe14YSfcfSSSkhKvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dcAFiE/S";
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C5606A32D
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 15:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8C5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcAFiE/S
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so274505137.3
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585127; x=1795189927; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=dcAFiE/SUdzFZIu7HIliMezEUhSwtqJdzO2rFbFoWC4Soxprb+FqTEG5m7zfaFNjdw
         WVxF63g9+66kqRLUr+NYmU4TTwOY4VBXfCFcTJCt9/EG94tFszuuLVM7Pb19Ira6hUEY
         cMeXzKqS7ZyiLgcflZzHvrcaj/v7BnsJ/BhQQaTr89hgTb/0LKTRje7z1XnXqJquIpfD
         HjpxcSBDWAVeE2RWgDA7OtTzdyy1OUnfuDnERPMK1qseYp7pL9nnu7TexcuJSCpng8CZ
         tCjTzpP3f+KwDbHBOM21S2ShkmqoXKxWmLLVHTL5AbEbCqpnlj05XW60Q+3ywhf1tOAh
         f6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585127; x=1795189927;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=Gxbgl7xH6qEelO+bDpd0GGf5cc68VP1RITh+o+cbo7vlSb6166ieqPsW6ZN2l8ibEo
         TxJePArHzZeFeMakG2n75FfNExwlViuX6zcChWcZJ0/T8G61gvTuEWfs5DH1IEC0IqOE
         kCWC8QK/7ISUYjChw0IAm9Hff+wk38bZa69mAaLk2CN5s0wBopczyd5lejBUDdzIbdwN
         2Xes8j8P8sto3hoHEyFNwjOcyR0fIkuMcacn+MaAd0s4kr60q/mOwEmA2p0L1qr1nxD2
         KlLLeq1KOwPiBn8F/eSw1cXgDc487Pn3+ghE+myXQwadnMgg2oA0qahPOP4Sq7z1rOdx
         juWQ==
X-Forwarded-Encrypted: i=1; AL+hErHM8Xs5Fr4VaJButRCjLQTldGL9Ed87CKmdL4+ZKoao8RSEqRKvHOWgA8OT9koLnJkiYa4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vkmeFggU0z5p/9/yS2+o4jt/obhSYJB7A500VPd1I50ovxTsk
	zSPPo+dvgsjtdMA2Qd+uaybRFUXozwJhcdveyCn1mVA3M5RVGXJdZjoC
X-Gm-Gg: AYBFou1bX+/Uqv3xX2xeakTcyyxNV0AhOLYXZIgvka/WoPO5RNjh0/gBdGNP0evfSLM
	IZPqioOfyzvYlHT7x1hqUt/UUiqVtUIOtQuAQPGuWX1nwvlwlpUAbFMGPkiBqn0SsgkGzjqR4kG
	fgN8MzjbacMnRUSkdg1rrybh1c9P9hqTEj6fTPkxXlP7JjV1ei6VH8xSRAvVBq2dKH4L73nmlS+
	ZEIwW7875meFDii/PPZpNgf4JIu81awhEv3+wZo/AZwAoyvNAdrJrQ2Lsx+eXmDGI0mcJr/PblC
	6UHUGPVPClw/fN7G0GTid0TC+4Prp9i5/XG2BfzCjrIwy+CB2kkRh4so0BdbnG2clgsoUIrxSeK
	KlAAKYJpSPb01xQEBLuve5/sZExMZHN1IdPcbqNLXtvJl+FhMMMJxGcjod0xICz1fw3tU11gj5c
	HXnVmASNexnZ3YJRvoOc5fhOkC1j9iw3RdOcKsSoY3Ii1xfDAuUZ4JokzJC64gWo9eIMOqtrHVO
	pFDuAYhtr4YG2WnuLyWXxsuSxwQror10Yn65jylBmcd6ILtp2sd2/to3T4BWRs67stiIs+7lGsu
	GhQzDs7v+GJ3qvB9i8nXiCuzELK/D7Z/
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr745103137.27.1794585127400;
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 13 Nov 2026 12:51:11 -0300
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAO8x92oC/y2OQQ7CIBBFr2JYOwZopOrKe5gukBmUpEjDVFJje
 nexYTdv8vP/+wqmHIjFZfcVmUrgkF4V9H4n3NO+HgQBKwsttVFSKygKbI6AM4PPROzsWDNxOcU
 J5pQt0gIcbXZgEWEsyICBp9F+GFKhvB1W9x2dJXmHKOrUlMmHZdO4DZWfgWvXZ7Mq6v9tAlK38
 rbYqoHf9xjmv5wEf+xPznT+bnpzbUoHl6IY1nX9AQyXlRHxAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=2798;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=1WzCApbm/N+lfLdjiZlJyPKQ+4AjAxmeXLq+NVpvXao=;
 b=yf3UBTTx8wHqJx9v3Stw00xASfc5loBUIuwai4kXTRF28vEGBey+xUGDbjXMB+7XoaGW8WThW
 ZmnAr1ndRq4Di9YRUlBeIFYVWcS6SaUNovwo2EBPH2mYxweV+v4/Vz1
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 10.1" LVDS V2

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS V1 and V2 overlays
were run-tested on SMARC iMX8MP with the SMARC Development Board.

This is the v2 for a series previously sent by Ernest Van Hoecke, and I
am taking it over on his behalf.

Changes in v2:
- Rename display overlays to use the "tdx-" prefix, and add the "-v1"
  suffix for the Toradex Capacitive Touch Display 10.1" LVDS overlay.
- Add the Toradex Capacitive Touch Display 10.1" LVDS V2 overlay
- Link to v1: https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

Leonardo Costa (1):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  20 ++++
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  80 +++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso |  98 ++++++++++++++++
 7 files changed, 555 insertions(+)
---
base-commit: 45327d3207619a05bfbd7e6f2e116285ef726933
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

