Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126617;
	b=vHAAIEJPD/C/E3JRZy1hiaqUzS+rsDaL5L7U3Sb6I9ug2alPfd0Odv6dCL9vFlh0Bpj6
	 jH7xZvY0kIo8mI7XcIcJoAQJ92qfynWPfv9JpsxAtqL3WxXvucO3P0oEqtuebhZ4MvhkA
	 jgS7ADPn0GGTeEC3XWCDQh+Iqo6r7MaB1fEtM7ATQmytWL1Hket/LVjS3UuHnBzCmkTz+
	 zOj8q3pZPFLU3jyGpv2jVGk969VFkKOL/gs6+9W20gDpxmypoOgbFM0TFmAyvjx06NJ/u
	 H4CNniWenTA09ENqgCIsCFaw6j3VGThktxXaTB/tZw8BnkEUNvc7WeOElErMPzLbd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
	b=B4mB4TPbxygPm0aX5eSu9nAyOeauoKNoTGDasMF7UcicOAko7uDFmR0QzqdxMwR/EDnr
	 5XDa7my9ToshUm/2HjwSUWZAe7VF9Eq2jbviUvOOOeIfjo1Z7X7BZDg08qhDxZZQyLGrS
	 ciCKJpPDwibnEzI+WGJAYxok1GQbb9Z1e1Wt4abnGfniIZfHnomBFNkcLc/yA+7+qc4T1
	 426azWkRSLE3QJYu7v37LLLboe6/nIFwubQ6BXDEZYjuqQHylvDPvVGqfUMgqtfr67+us
	 W3/NM64zKId5HAS9PPIShCzwsoH4rzdfUX0J020lsS23ALT8psNvTH9MRKw9GiLizqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdi14KdN;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E469606A321
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 18:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E469606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdi14KdN
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8490a7d6696so101558a34.3
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126616; x=1793731416; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=Wdi14KdNbv8bfCyIfrYwLjTXHVJd4AYxzsx9OQYupc9sDLj9T1ink6O483sdezsrfH
         vA4tIMssk5IiiMoFFzjkf4YyGAJ+Bcfwcl6TEjXlz9Ox5d5mElAWY4dgofUTrwhs5OC8
         Rf7NkhYO/v5opaKg/qlLkvhXtEM+cJpBakzLHfvyKZU1ucSENgd/riDu5dO3ApmExIw4
         f5y0uk4eNl3R+6CXByDq+eBHTp9D7/yv4/XFz93NpAKchKR8emAEagCCbREB18hqmcva
         K4uuVAqMMyQ/INIRZe43mISssUIFVMn/F7y8Og9XCoSeFEYss6MR9y9MOqPNvWi4Yh9O
         R1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126616; x=1793731416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=bjGIu3rEicLbKtQfJCt5QANLLbfQOGHHGCoPAjZVdb44eeBREVJJqV9/BwNO5KgKgS
         s3gtv3IVvMnnAaNTtS/ev54DTQS6wirsMQnk7JwO23r3qMK8xWztCtrab6TQngmwOTQN
         9VvWSOAYOuWh289nQav6dB6VkfkTFzA2iy3+jcjUDAiMTr2W4W72wfqkcbk2vksJP0RQ
         GHrjFT+qi6wgFfOvBpyqyLEkd2WXeDJ08VC/Y2lwwTN+YcUUfCWCEt2ygVjddvgutAh4
         BzKKRgOGfKX1TxwPvzAmhEEHAyIwBz/aW+n17KJKT/yI8v8Wfiq5VMTmc7pqlLL0kNHk
         FyDg==
X-Forwarded-Encrypted: i=1; AKwUvBzhLtlguG6Fy+oHyrV7TP2SQR3RGN2czmOysO/BG7VDwgEvNHcxMPvhW/mZRcioWFd9pdc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJaqjZQ3H4ZpRYcFdrPLSK34Rzi4zQl3+5I6U5um5fybN1Ra4GI
	16lcdK1fZhgr9W+eY3YPWlHaKx85tsK7KTcmbIiQJucIHI/DMpg/+OXx
X-Gm-Gg: AYBFou2b614TOxFOMAGRmHqPaS8pWFJ3NUxw+sj22xGYcRm9OKA0f809br2S8ZmrPEc
	scquN1keDesgVC/eBxtHNOeNVkdhgjszf1k3kZZ9Ht9P/OUkad8eBSwx/TIvd3brdajcJlNrfNV
	d7m7lE+QO59ko1DwtSO046aeJjjauNW/HmSKoIzYSyj4gLyRQs7LbFZMLWtnt8yzU158KK7uja0
	tI8zQXtWM5B4dHkrbFklsJQhOUwZV/0CiBNvmjsJlWC/gdId6Anf0F1gur75ykypJt3aEmqrT01
	+tT5/s9dQtthQBIQVeidFph2HYtZQa3bi2f4lQazC6ROg5dkMIpzodctKZ/cpWqx2fyQqmc0+jB
	XVPQBzVO6SJOEOeAcQpKA19gPjvcm1mY/Xu1BQG0SCIAIqitsZc52iJeFb9blTealx/37A8FKAp
	gHq76RF+u9D+Ux4r9qzdTYE6nrJxJGw++YQ8LE9w6ah5Ey0F/n+qWemkMpeZT/6kHOfqiNG2/eY
	/BjlFOs/dzlIYO2URJOd7m+R2YUEb9E/brhUUuX5i/GCSaAVfkv1sZNNhUwLFrvm8X6ZJcE4Zlc
	BsfSoVD4CAHPcByirgwqqBoOwBJbY68kCJb00BGOZgN5YtrdcnKglV4gGWw2uXcD4MqbufKATf9
	CKfUQNwFNEQD4aJ/iuLO11ihvc8F/FZltb7FaMwDCQvdhvyRkWBltBZO0wXjpWLgTrhFtgu+6cF
	frkTN3
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr404051a34.30.1793126615647;
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: share virt-dma synchronization and use
 it for UART APDMA
Date: Tue, 27 Oct 2026 12:22:25 -0600
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTRLCIAwF4Ks4rI0WWm3HlfdwXFAIbVSoA7Tjz
 /Tugm5c6vJlki/vyQJ6wsB2iyfzOFGgwaVQLhdM9dJ1CKRTZqIQW14IDmFsLUWw8Qyj9BG0lRD
 uTvV+cPRAmDjwTaOasijbTV2xBF09Grq9nxyOn5yUE6qY5bzRyoDQepmYPEomuo4crj93aaOnE
 Ad/f/eceJb+qpRbQWXqmjfKoKn4vrOSLis1WJYrTeKbFD+RIpFGSzQFCtR6+03O8/wC5PmkD1s
 BAAA=
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Provide a virt-dma synchronization helper with the DMAengine callback
signature and use it in drivers whose synchronization callbacks only
convert the channel and call vchan_synchronize().

Use the shared callback for MediaTek UART APDMA so clients can wait for
completion callbacks before reusing callback state or freeing DMA
buffers. The shared helper and existing-driver conversions form the
preparatory patch, followed by the UART APDMA fix.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v3:
- Split the shared helper and existing-driver conversions into a separate
  preparatory patch, leaving the UART APDMA callback assignment in the
  second patch, as requested by Frank Li [1].
- Replace 26 equivalent driver-local synchronization wrappers with the
  shared helper in the preparatory patch.
- Link to v2: https://patch.msgid.link/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
[1] https://lore.kernel.org/r/auDOqLln9_ra__hY@lizhi-Precision-Tower-5810/

---
James Hilliard (2):
      dmaengine: virt-dma: share the DMAengine synchronization callback
      dmaengine: mediatek: uart: synchronize completion callbacks

 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/mediatek/mtk-uart-apdma.c          |  1 +
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 28 files changed, 44 insertions(+), 205 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

