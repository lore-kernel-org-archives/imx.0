Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408072;
	b=ACWes3umQQfIFr+E5sWUCzCMwiRTIccjvDl2/QrIO18r5XYjRWjgFCThFM0LmDZKAynC
	 1DQGwnj2OEcGr/4d99s4Cdx8D4+puuuuqsQxyi0rlsDkg9gLIW+gXlMHRHANFuQ/8alQV
	 b+CLjJcqlP36THul0Pqn9IMLkZiOP/R0XqXLYhTsK+QDxYFrctjL9uNEKJ8z/ReEE6ReH
	 DVTZ2km7O1Fcmg1jd1dXskZ7kZaG+pND8SFoNqyNJmt0vr+V6NxcK1Z7CSoRZPaTUTtKC
	 ZYB3hwtOXajM7P6bjLQoW6eyyzbjqLkRXCXKugZYR7bbD+7712JelbaXbQNiPXWtOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
	b=uiSpMCc+tNShiMv/xBG4vKwjZkOQDdfbNs3xz49iDEMBwL9hr6RhULEzekhwDA3dwtU9
	 Lw7EIdNL0XP3q2kXR36ncULTZppCrPmNIvlLN1TEYpdylStGse2sQcr4/alFAjOX+ly5E
	 u+k+0y3yioLbjXUrSbum3p+gIJoxWxOQwowBz/DRJYg9y7D9u3lCJUgEi3ErMaVK6kNgE
	 /TByfedSpfyAj7iqoUg4JvjMnv0McN0P3VhyE3bIQpo0S4nrjWfV+HWYyzh2wHUfN+u3k
	 gYcQt59IwM5L+IGLfcasws+ujxcPl11pbsa5RZiBpMDfmYskD3qSUqFE14mkLik+Wcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZBBZNUI;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5E606A31C
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 00:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZBBZNUI
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1167735c88.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408071; x=1794012871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=zZBBZNUIHZ2LilsyQIGTNT10lqrHC45WFpRZJDvv7dNz+rIZ7Q/nXxauo341Fst7Dm
         +NX0jqRby4w0XJkz2eYXuXRKSGAXF1z/8x8myTZCBmDv6pESw1krcfhNuUL/PIcovgSE
         l7xIbbZnXZYLABcSfsiJxdgbY41aqI+ZO2oR/XHYa19u94UPNaOdfTaf4GrzCon3KSxh
         zvUinLwHR/3Fn8sF+V1ZkWfljKkW3N6QnjjmH2+HsutlEozs5g3VZ+w2F8zs433ngqyU
         YiEvi3iiPJtga/Zr75DLXsGrz78tF8g8jwB6AHGCXecfO1Buu0Ok9zbNDBEd1Tf90LVX
         q6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408071; x=1794012871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnjjH1kwd237jiTTP+/EE2SALRkAPRbhV6DYx2q6Y98=;
        b=X8S40DQyFagiM9hJgq1mY8mOkAln+94Y1u9E/K//PAGGSFJ8pmbLKUIR4MpQy1rUX7
         itPv0Y9Cmz+a8WcsUC22CzhaUjln19JV20qQ6vq8lo83Ol4dJylQ/gu7D8OzuIJTfAGm
         mXJAyepwr4BsbgYvf28kFlbRNiFGRNbnD9ky8tgkoJParHkSIQZ+/2c+qM1fKtkaDmE0
         L8oXuhuv2VTV7fgLaxkR5FbCjPULqEFjuMdiI0g08a2JigXtUb9EFh6KegMWHUQzuGjt
         nd/viDkf/TkQYONcYDw50NOuprqZeAms61ZJzn+zUAX6TZtGUtVaiFqt6c5CK0sr/Qrx
         a7uw==
X-Forwarded-Encrypted: i=1; AKwUvBzQqaxXoYGKgpLIuc34mlYf6AnFQ7z3dDu9vIzZc8MsMleRNQC+ragRgFHLVTD/TrsfjtE=@lists.linux.dev
X-Gm-Message-State: AFq9FYI449AJViGEZN7Ywn9YYi+4ouITTF9GR9K71Ckyp3TDLbB26VWm
	/jH2selshnuHY4NofHla/YhLtJFiP+VyYjASmXJzbBfkWnzITTw4iLe9
X-Gm-Gg: AYBFou2LJKn0fgSVCSFAmdPbDNsj7xWGheODrTeByEQosFVHAeLU2OOnCKrU+MhXcyx
	GaZKk5bLbdRsE/5x6J/8i9M4iMnhGSuoSp90kzXL8KkViVlgzpjGJdc8K0H55jt66kfAa6mHWBs
	6v/DX9M9YaChbYEn0OrWePwo7HW4FHx6MFHnfuVTyl3CtJ9oT3+QBhE20Ak7gmI4Ss/6gjzxvCY
	yX7/r4imokPHYQQ3+DnQ6qIhid0mmw3GZz2cg1ug4gEmfxJz+qdkWqLSL97bL4MqIgy2upoRFYX
	rvg8iofWrhaeXXCvOe8mPPNSMjJIsB7JcZmDTZ/guhEKLeTCqbteD7vBzCeZVNS/QQoRAX2Pv7/
	grqq4HZ1bR71QDW0kwePA7dhZpYiPhrMLiUJ39Zssuii92KmFCz0a0PChJXaGawZamxY1Yk+A2E
	kP3GGOhj/0CfdGED22syj13Xhnwkr7A4EZY30NNv6/Qmg3MFk/evCwQhCatrFvBSs2DyxhOn+so
	ICCgoAPZxqBFpYIO1875r/vnpOqKaOxtsaUMmqZzvwMpdvN4FdytDsu8MQMFnWwzleJ5/7x22oF
	yiqdcLNBfRttXYw+2/Pu8VOKLuIEEgsQTQsIRoARsvx5T02xxL3f0zH15cd+FFyaqvLmKPx82Ef
	gPHshY56EkeAm8s9vUkrprVNvA4mzVKUmu0NVmbD1Zgwy2iREFsF5hQKrtSJR/7SZn7T17B/Mnw
	9ObT5/a7MS60gScqzpDYI21v1+/gONbB3PUpE=
X-Received: by 2002:a05:701b:4187:10b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1ac5e322fb7mr5663288c88.20.1793408071289;
        Fri, 30 Oct 2026 17:54:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm1419862c88.12.2026.10.30.17.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:54:30 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: amba-pl011, imx, fsl_lpuart: ->flush_buffer() unmaps the TX DMA buffer before the transfer has stopped
Date: Sat, 31 Oct 2026 00:54:25 +0000
Message-Id: <20261031005425.3351240-1-samarth.colleges@gmail.com>
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

Hi,

I found three serial drivers that unmap their TX DMA buffers in
->flush_buffer() without first ensuring that the outstanding DMA
transfer has stopped. Line numbers refer to mainline at 83f32c773255.

uart_flush_buffer() invokes ->flush_buffer() under the port lock.
The path is reachable through TCFLSH(TCOFLUSH), hangup, and close, so a
userspace process with access to the port can trigger it while TX DMA
is active.

Because the port lock is held, the flush hook cannot use
dmaengine_terminate_sync(). However, dmaengine_terminate_async() only
requests termination; it does not guarantee that DMA has stopped or
that its completion callback has finished. The DMAengine API requires
synchronization before memory still accessible to the descriptor is
released (include/linux/dmaengine.h and
Documentation/driver-api/dmaengine/client.rst).

I found the following cases:

1. amba-pl011

pl011_dma_flush_buffer() (lines 858-877) calls
dmaengine_terminate_async() and immediately unmaps dmatx.buf.

The unmap can therefore occur before the DMA transfer and its callback
have finished.

2. imx

imx_uart_flush_buffer() (lines 1716-1739) calls the deprecated
dmaengine_terminate_all() and, when dma_is_txing is set, immediately
unmaps tx_sgl at line 1729.

The imx-sdma termination path disables the channel but defers descriptor
cleanup to a worker that sleeps for 1-2 ms because the SDMA core may
still be running. Consequently, termination does not establish that
the controller has stopped accessing the mapping when the unmap occurs.

There is also a separate callback race. imx_uart_dma_tx_callback()
unconditionally unmaps tx_sgl at line 595. If the callback is already
running when the flush begins, for example while waiting to acquire
the port lock, it can subsequently unmap the same scatterlist again
and may attempt to start another transfer.

3. fsl_lpuart

lpuart_flush_buffer() (lines 601-614) unmaps tx_sgl at line 609
before calling dmaengine_terminate_async() at line 613.

In this case, the mapping is released before termination has even
been requested, while eDMA may still be reading the buffer.

Potential consequences

These paths can release a DMA mapping while the previous transfer
may still retain read access to its backing storage.

Without an IOMMU or SWIOTLB, a late read can race with subsequent
modification or reuse of the buffer. With an IOMMU, an unmapped IOVA
may subsequently be reassigned. With SWIOTLB bouncing, a released
bounce slot may be reused by another mapping. If the old transfer
continues reading after such reuse, data belonging to a different
operation could be transmitted over the serial interface.

LS1028A is one configuration worth examining for the SWIOTLB case:
fsl-edma uses a 32-bit DMA mask without FSL_EDMA_DRV_TCD64, while
supported systems may have RAM above 4 GiB. Whether the affected TX
buffers actually use bouncing, and whether a late read occurs after
slot reuse, still needs to be established.

A related issue in qcom-geni was fixed by e3c04834ae1a
("serial: qcom-geni: fix TX DMA buffer flush"), associated with
CVE-2026-74655.

Possible fix

Since ->flush_buffer() runs under the port lock and cannot sleep,
one approach would be to:

- request asynchronous termination and mark the current TX operation
  as flushing, without immediately unmapping its buffer;
- defer synchronization and mapping teardown to a sleepable context;
- ensure that a completion callback for the flushed operation cannot
  unmap the buffer again, advance stale TX state, or restart DMA; and
- ensure that shutdown, and suspend where applicable, drain the deferred
  cleanup before releasing the associated resources.

The callback and worker would need to coordinate ownership of the
mapping, and any work draining would need to occur outside locks
required by the callback.

I have compile-tested candidate patches for amba-pl011 and
fsl_lpuart using this general approach. I can send them for review,
or adapt them if the maintainers prefer a different synchronization
strategy.

These cases were identified using a research static analyzer for DMA
lifecycle ordering and subsequently reviewed against the driver
source. They are source-level lifetime concerns, not demonstrated
hardware exploits.

Regards,
Samarth Narang
