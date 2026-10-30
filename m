Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377251;
	b=VUWL1ogueaVoEvhQha4cp9oL3xppSLP0wtflkdzRaRwd3e3GgXhslBG9LHNq7leIag/B
	 Cj5AODMEvdMhkpTtsvVKaiNk32V6unt1TyrxSZYqoUQP0fHsQaIbJaNOmw8qUv9GtEv+5
	 xlkICJ+8Io2nE+Bh6JyuITMCeBFf9dAVjgZGHSHdW2y8qizhc8AURhbcptf8OCiirx7W8
	 TnCFnC2EQtFj2d07E3Hy/tjKiE2Su2ld4qTK0t297qZelqzyH7GUNiQvclytHBia1i66W
	 +f9EUobTiyQS/MDK+h3SYhDHtoUYEOOJAHmQSZmNKvoAirnrUEKfhLOdLjk5T4Fe8EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
	b=BLdLThiqgISTlrCa9mi3LMj3xayMSWoHdnL40xAMwQH14CbfwSO8/BrlTtuwr/raX+nt
	 xGmYi3Np4rFBk1JpyzTLRoRfBlJic65gHE6NWq3FNMzr0pGkDs8/LRb1gbTp2BIDX5ZxU
	 Wz4gwy3HX8rue94KnWxpjrJOepDZQvpBJP7eznaQW5KDvbHAx34rD8fSu+HdNg5JsipaH
	 Dj0DeEEVN6SEDKOVYNtEMujuc2X1zgkE9jk+qcFPjHIVHMS6cN00/5RsQ2Q6x/sSzEcyW
	 LKc2xKRlCULacFlij8QCjgE+CMs51vl3fiTXues+FI75AQcnNDg7+3+LLDiBDj6pXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZVkMB6e;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D3606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D1D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZVkMB6e
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6ceebaso566486eaf.3
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377249; x=1793982049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=UZVkMB6ecrig6fcwBuO+UPF32ZJU++u52TsAiSxT2/xyfrBID2umgrTwqvYK9aGNqo
         W6yK+wkwgY0VCEGr22Rpb/vWeTOO/NQFnYyJYh5i1rhiFcS7g0JawSDOxF07Chs45NHI
         4GbHY7kCbi4Tu8svSsmsp/c677eEQkcyI+pa7iZ0A+aTIsTNTYVI67MsQKizY7GIErhE
         DfekxQlmYG+u1z9YTlB32wh+TXZy/s6AJ32fNnZOlCY0SjZMXkEGS30ClvvM0AfoF6Gv
         4ug6dfEGocoDjA94GVbhJ1XqG+dXE4jxWiq4lOnVEOvA8dafhxLLraDucx5Yeg5yZra1
         9ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377249; x=1793982049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=j0KIT9HwbviTclVI/1uEbE1r0nH+28ESrLzwogcwb27NqVEzqhHNFTzuicLcA2OW4g
         RXw1AXDpCCveTdmZsxdQ2YRkWcKhIdZgHb4LxQEw/5Dlva20ruE0dJcRBdbRv8VHWpoD
         uAa6c0iTdkYNQ5qSVQp3dLLkPuvS3nou5NWnBhF6ozCOVucHnywVeNGvHPEVFBKavFli
         3Uvq/bZZvO/kujXg8BwGm2+V7VEZoV8HxWAIQcitvjlC0c9lzdn04+W9BBBJhPQxv8P6
         TjmHQoz3lGFf+0pUDD1u4uWQztXNfE9hnu9Yux41I23SEo4rMI5GIPxe7aGzTPyM3uuZ
         XuDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxauklNXQOVik4LZhNPJa5VvyMWri2yiF1v9ai1NU55REmXuoaOzkTOv2kz0/XJlhKk040=@lists.linux.dev
X-Gm-Message-State: AFq9FYKla0S5pgkeGYeL12NURWMB7oiAoeslw+xU1J58RIwHYUD7+nMM
	YJcNXnjIClPKKQjKNiABncg1YhfuQri0iq4wJXZiIUjgkoZ6uYRRG/gK
X-Gm-Gg: AYBFou2UFpNt4S8yGaLa0lhPehH/VbjBBs7eGv+q+8BipwbILlkhW6m08goUY+HVCt2
	R/3ceWeH0aRsRpzutD2z3ErtjcYJI7vFApNbEzt98ihMIKDWhdNM8QYg6aoYWVXWlZfVUErQYrz
	7vVLQ/jXBHWYFscuc5V7J9Qc08cdpqjMfqw7pHvkiUSXg+8OsEBcIDSz9v7lsJf4uk0IQoySCNh
	yrrBPIyyuTD/EbDlcY2TylVNBGs+aw3guC73uoeLpTb81fVVy33NWVctAhU2Qj5n2lfXt+3nBJy
	PgX1d9DMamBC5Wg3NubRh4saAMH+0L7sEPYILY8R1/3tpu3tPHZ+pYQkKA8Abe0/WpjNKnabL/8
	KtszJ1HExusF+GH19lcCrMaBi0CuUKEk3lG0TOBMILv2MjpOXsCSHno2KcPT/ixn7Oz0VQdl9rA
	piTa9oHi1HjXjfjj9ygIUWDiy1IICAJ8RYTk5fKUswTskCggTD8KZx4rn2Sm7Iqnay10mB5hrqi
	P3R04ns6XRIvTA0x3BtpE/ww4CP2ps8ZnZsk6p6cQGwZrHXdf2AyK1DN0hmhWE/AsYQOU02O+G8
	4BfAfIcDLgDvH9FfUzsL1EoBhWxJ7d9j/7pNnc8KVfk4fx4reyQ/qQWN4iviNTMwpYm7ufA/LwI
	T72F8byJDD2mny5ojncxPk/XhE8EV1AhUYm8/ewW4zJH5Oifv6L7h8sOc4Vd6jp89QSxq6F5DdW
	oXv5/eH3hoJah94z8=
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1142319eaf.90.1793377249547;
        Fri, 30 Oct 2026 09:20:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:48 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 0/6] mtd: nand: stop DMA before unmapping on error and timeout paths
Date: Fri, 30 Oct 2026 16:20:35 +0000
Message-Id: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series addresses DMA lifecycle issues in six NAND drivers where
error or timeout paths may unmap buffers before the associated DMA
transfers have stopped. Some paths do not terminate the outstanding
transfers, while others use dmaengine_terminate_all(), which does not
guarantee that the channel has stopped before returning. The patches use
dmaengine_terminate_sync() to ensure that DMA has stopped before
releasing the mappings, and all affected functions already run in a
context where sleeping is permitted.

These issues were identified by a research static analyzer for DMA
lifecycle ordering and have not been validated on hardware. The patches
have only been compile-tested on arm64 with W=1.

Changes in v2:
- Combined the previously submitted patches into a single series, as
  requested by Miquel, and included three additional drivers with
  similar issues (omap2, marvell, and sh_flctl).
- Removed the code comment from the gpmi patch.
- Left qpic_common and stm32_fmc2 unchanged from their earlier
  submissions.

Two questions remain for the qpic_common patch. The BAM driver warns
that resetting a pipe while the attached engine is still active may
cause a fatal error, so it is unclear whether the NAND controller must
be stopped or reset before terminating the DMA channels. The success
path also assumes that completion of the final command descriptor
guarantees completion of the RX data descriptor, which may need
confirmation from the hardware maintainers.

v1:
https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150929.2944717-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150646.2942368-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030151843.2953269-1-samarth.colleges@gmail.com/

Samarth Narang (6):
  mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
  mtd: nand: qpic_common: terminate DMA channels on transfer timeout
  mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
  mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
  mtd: rawnand: marvell: stop DMA before unmapping on timeout
  mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout

 drivers/mtd/nand/qpic_common.c             | 11 +++++++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  1 +
 drivers/mtd/nand/raw/marvell_nand.c        |  9 +++++----
 drivers/mtd/nand/raw/omap2.c               |  4 +++-
 drivers/mtd/nand/raw/sh_flctl.c            |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c     | 13 ++++++++-----
 6 files changed, 27 insertions(+), 13 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1
