Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266381;
	b=0LY3o2bQAPmM/ngHqh1dHRzhDbGVIYBfqQTyCkiUcJJzrb9ci77AFEvHWHYdoZlNFkGJ
	 G9uO7MQziMSNeIbij4T9cxWsQr6m9JhzoavrAWh4GwmsDW17rzUwPzl0NqLfnxuV1GxH+
	 I12guolBgdsbU7PV/olg7hOJy2PQ7x/v06kOPldfXyQPA5sE9yx9JxgMk8mTdf0aVqWJ9
	 zpKtlw7Z/3vHe+HS9WA122S+g8PH9ZX82Z54wL4GDlYhh5cMDVjVAFCA42m6fwFGsiweW
	 el+Dfp7wZHzc3cHykZUnbenkqCKzBW/+t2P73EjfjrFTvhemUpuXnDICv7Ny36D4rcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=;
	b=0sKj7hVFyujui3Xf17geFhozPxJrQBRBp27y8x/6L4h8wQmpCVFWN88G1ZN0vmDCCus0
	 BLCQ7HAFJBnbRKdll2vw4QiXPBb4SVtJNNxW9xpsQTMKVHgUF1pKKznSMPFUwj0mda2ZS
	 FHVAsQbVYHiSesKewVwwh7yzab8Nvq/Q0QXDOmpCTqYBJfbX0ICtvfESpVvq4u8J14xTu
	 ueWs7jqXx+67Nmn5edqteys/8SnNbuJvJxuJsJhi//Ih2/aL9W9aG0vIitbqHrrlXJ9cl
	 wXjNQ3AJh1RkEkkvejLVa34lmB9TF2s6PeJFNVnh5SKAo4PxoE6AP2x3akuWmUlNzoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PwMIp+nS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB8606A330
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 13:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFB8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PwMIp+nS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so15442395e9.2
        for <imx@lists.linux.dev>; Sat, 21 Nov 2026 05:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266379; x=1795871179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=;
        b=PwMIp+nS5DIY/nyjADTOhfwdBP3jo3fNNbLRBBFDh3JlgVOgIJna79v2pgwYqMvDvU
         Oxe+KH0TTD3MURroC1Xc6qnkcfloYADUxoY7KIy5Ejed2g4rjmWKrC3WrD30pvKfb3QO
         DjV73KRH+UTR4oH7VstOnetkcnU3OndmJpknQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266379; x=1795871179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGBvMhcJS11wtjrVJLfPo1Rw7P07wLWwQE89UszjvXk=;
        b=LgwAQYnD7NuqcUxwvNzmIeasclFaA/n+z8YMzzkES8BPi54axeeUfhkB8yoiM/w4dJ
         1xkLspqcWH/UAgN3JdPuKlkZ/Vp1XaGhpe6kIEJ8ty5Rs37ugGWKQIe17ObKhAp2vUkW
         3ktGTXnGb0SwgzILC+BOFSq/z/NXt0VDaEOaPGqyo0FZeYCaH51efWnux+uHWBNGbt4z
         kI1ccshFBBG7IrllwlHj8DZMParHF3McUuVQn+U2gt7u+bq4IxLeAKPZbWRBR+/fkQfY
         h7DrR8vxQPiC1EHRwAD64okoth7CTLZAUz+HxBKfQzCgcm9kuDwVgcS9xfyq1gCtaYtj
         ssPQ==
X-Forwarded-Encrypted: i=1; AL+hErEAGCEBGI1BjpAVxcOgofK/tFq1RQNHakwmQ2ndPWkU88jNKQhdv9A4QecEexLZv09u6gs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9N5tQgt9QNiglXa7BRgzYiV/krXIsXHl4kjbxU/E06e3Z/WWJC
	ZJvwCICyTNXmjlWDUTS9vspiQojN0H9J0w+/DC9dMecS/ObXHeyZNWdbXv44X5FpFUo=
X-Gm-Gg: AZFdTZcUvl/CsYLIAHH35DrjwcRzcsnkG8fhEDyZJ82tE3rOO6Y4hYJnnxnfJrJzSLF
	C7rKTiO5vcNhmZTYDuhq8ti+ofndMguPsh8ELjPi49bwoOLhNTUGN3dpZhxoQ3H7QYsto+6w48O
	8pavfqkGnLdUsJpktupAXuphkaZ8CO+o6DYiMRIH9iQn5u/4X30O+v5soVqZTkkddLDF0VsOLmj
	7iM8mq+N/S+WE71JKOQZ4kpxHY3kAwdHXsiAgrKrGKDxK19PL4tafFL08jCurOnN+fyilyuPsTy
	P5MhsC+pxPQKS7p4SxobPdjHI2PpnjXn8x/2sJwlJm8nW8dr0gvmQjaqB2IOzxZXf3JURS9kexV
	NX1wQd2SULhf0lUpFEzVdojqKSJZ/bWpHjkS7KjtCdKeOXAm4aoiPriQfdOX4BRM/ozaqCu4fxm
	Tt8+f1nH1OmY4Yp1pYXrgkHmHxk58AYSKWVUP3dwT6IFAjOxbD6XVBBxF9ECkt/UCJ1mOmqP83Q
	eThDd1K+sa46KnXaLs3JDosly5rXD/rdhpA9dW0Vu527d8AJE6Q9rCReETXvCgPqYJBXERh2fjE
	ENiNHoepaBdvyt69I2pXtIukoXXAXkg/Bc0xyPEDvuxs7DgitknvpvO8gU15DKe+hF64JW0QjsF
	TeNcCLlbG+EU0AjJzTxH9cxM0D9LGNr1y1lkJfOP4zYQP62aPTviTTbkZBcHixd1tt0M9k9345c
	OK520V4oGfOzf8ASIsBTSvpSOqF71vc4KW+kUkvDejxxNVyeI=
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr139372685e9.5.1795266379055;
        Sat, 21 Nov 2026 05:06:19 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/3] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:07 +0100
Message-ID: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M power domain drivers register all their domains as off.
A domain left on by the bootloader, e.g. to show a splash screen, is
then powered up again by its first consumer, which on the i.MX8MN
turns the display off and hangs the system.

This series reads the state of the domains from the hardware, so that
the ones left on are kept on until their consumers have probed.

Tested on i.MX8MN (BSH SMM S2 PRO) and i.MX8MP (Engicam i.Core MX8M
Plus Fast Ethernet C.TOUCH 2.0).


Dario Binacchi (3):
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  61 +++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 115 +++++++++++++++++++++++++-
 2 files changed, 173 insertions(+), 3 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on

-- 
2.43.0

