Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450277;
	b=SFf5T/uLL4R2OyXkjvRfpxcL859yUaanfF6UEy56z0soBCvSn1k31jcBtfxICU9V4TU9
	 qsSBJhDR3fvid6l0Yd8a8LMgQvUxnt3kTaTa+EuYsqQPgwNJBFqre8UflWlr3bzpXsIJK
	 /2gnac1aYF+8xz9z+SZHxlGpjyeg/0m1TovRFW2KQDtBW/GkjgV9MI7v015QppskO4nR+
	 ST/QqWSPWoa+96F6nBcAv18fpZGbs3I7QskkCXZfzppebboS6/RXE7dz0XCr4XMtsJJne
	 M1OeDamgRgGrJRyYdooqoJb8vs+xe0X4+1pohWVk9VSd5uYthTMZRWpQ1rxxcosx5wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
	b=y4tK3p/w85U1QFtKc0+OFSMq0dl3qYl7qh/oBRMDXwkv8M2nYDhniybJrz2PTnUrLnUz
	 1TErxqNGoCJfJzjHmIDQzoMB9yVuiCvaW6xge8oBgKvT75MaV24Zpld2pyuUfHbwl7K0z
	 7x9tzxKQ3M+mntYTa4rzYkCrKMKr4AyjnYEX5ejqrcm3z5LP+fvYcPTgmmW44Vzl2pvMp
	 jqZTNa4LOCzI78v5DkpG0D1hGfZN1L57FOehX2xqXFQsIXuUjbuOIzyXI04JXu8N9ncpf
	 D/jQ2GdgLVHVmtoK1vBPaQLC7qbGMlwDp4oXLF7LiLuJGGgCFCIp25b0O5Xh3hzZFag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lqs2N0fQ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F47606A31A
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lqs2N0fQ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so2077021c88.0
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450276; x=1794055076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=Lqs2N0fQHHEPR3VM6HXRpqdt8HCCZia9V+eWs2yHKIfeeo1s/cbneOcM8lGUDt3OYi
         uL0n+cQ7S1Odxyi4ekL9mSyzNFeejtY22+WX8SUjF3zGjjJ9FJXc4FpyrmCYOG4eKoMV
         bDS87xseIeiW0OX9gpsdCGGcf0Avguwey6N41vUUiUbxHr7YuRayq1Fd9rvN87d4JfEw
         5IXi4X/aIgEavlvTWdnis+DhiCV7YOdD+qBxLH9Y0yAIRoJdRixxR9RcZpdL8EBhz24l
         dizD/9mxEet5Uj6aPPNscCEOllekocZH6nWAJYgHtU2shkE2/rBpdMTCpCgRSM3ldkc0
         cXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450276; x=1794055076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PX/w5mj9R3qkptDA+QYolfzSb7nBXSDEWkIWU6gsyAI=;
        b=wJYV2AgJ4iY+qPQcoXXFbgZJxSUCW/+syoU7Anr8GCtgZ4vexTxQsxPbFbmIzVw/IC
         umGqBDB2WWPJbWFylcWv4j7x/9ZeZrNTvBIXcenwBPQ3bbAWK3gu/7hohZoFTdY8Zdpi
         LI2KoGSmffLgFxVNs4YbB1kxm8w8ed9iCcLJRNLNs54iN5fJaiPZZVygDU0KwxWhEDrT
         0KhXVxPFonOPWf8qmpUnzfrsJhV7SL2dNnFgClEtAuuWbYWONXB+jGeBvhDuRreDW8gF
         AhoEiqbNCazeJhXmIxY0VbtvMa7vgiN4t5rveDMyvgSyggaoeOEYzysKOrASy7TaN42N
         SJvA==
X-Forwarded-Encrypted: i=1; AKwUvBxgT4Gfr40jNrsEkg5memwe4M4RODoh21craOSn4O0F6jYGntDQKFdPTriC56Ty5Xe3OTs=@lists.linux.dev
X-Gm-Message-State: AFq9FYILfKAaopamVN3roFlXDBhbepTGPLnmZE9qlaFgfcPUdqO78wGS
	S6GcraqWi2pMWscDX9F6wJ6WsLBMQ3+kqE5IZaLJ6JYFvbxMV/H15Vmi
X-Gm-Gg: AYBFou2eOeKa9Ri9QiVWgj34RxPk5QM6Xg9Ahck42sHRjr/566YCEEoyPfws7qbi1Du
	bzjc1WzuzrX5K4adiuP8Tsg0yMAwUEM++0agEDozHzeJ+uRoyKCoQA+S8l1vkpplHuy6GgBRVoq
	yA8NyqXFNil+NE5BPxuMJRYeOKTC7faquVGu6+XjoHUGYD/V5X5dNE4hTh8k0ZjkMW4nMDXSKDr
	q7Z8kbDcpAHnnzgK0lJZf6xzYbd+yjgxaNO3JCyxKcxaBekyf4xmvUWUxEjM7WAzwbo9wFdzFm2
	0fi1ydRR8m06Iep8WHf5nxJ8aOv9ZGJlZjVszSCKCPNRGRoHfU1YyC6b7c/65cvXWFeHdym0SWm
	vYVOIP+qb824r+Ke1JljXm8HgiECohDadduBhEBuslTVpX5ghPqLJrwVXtb3hCM+vpSJZnNv6zj
	SZ0KKUB08zR9yV6L6NNhHiADZuOUt44N3sGJSSEDWbQiDehz435cC7O9xaWhox8mTSU6hWC1Qn2
	7KAm6HYT+W8MRiVfmcIVfNQXke/5cYg2HOfVt88l1Qb1jeTTcugtsw7Om6+n686lc1YS5NU/7te
	1PiCxTaKsTIvJkx2pdD2AZS676OAKbJqaC741NSHc0PiP0kTCY1KmjxO7FDQgKoqLpmWU7XxmuE
	jGk2Dk+rlz4491uu/Ok70mjXxH9+tFQjv4nyR28hGymjat+LQHw/rilbL9NYJii0txaNHSKCfK4
	klbnQ/c+QH3sXDXJOWmKKJ8RT3Cm6TQYqUnH8=
X-Received: by 2002:a05:701b:2094:10b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1ac5d69f68amr7196755c88.36.1793450275760;
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:37:55 -0700 (PDT)
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
Subject: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA has stopped
Date: Sat, 31 Oct 2026 12:37:47 +0000
Message-Id: <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031005425.3351240-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
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

This series addresses the DMA buffer lifetime issues in amba-pl011 and
fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
the TX buffer before the terminated DMA transfer is guaranteed to have
stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
termination is requested.

Since flush_buffer() runs under the port lock and cannot wait for DMA
termination, both patches request termination while holding the lock and
defer unmapping to a work item that first calls dmaengine_synchronize().
The TX completion callback leaves the cleanup of flushed transfers to
this work item, while shutdown, and suspend in the case of fsl_lpuart,
waits for the work to finish before releasing the TX DMA state.

Both patches have only been compile-tested with arm64 defconfig, the
relevant drivers enabled, and W=1, with no new warnings. I do not have
access to PL011 or LPUART hardware with DMA support, so testing by
someone with suitable hardware would be appreciated.

The imx driver also needs a fix for the issue reported in the same
thread, but requires a different approach because its TX completion
callback unmaps the scatterlist unconditionally. I will send that patch
separately.

Samarth Narang (2):
  serial: amba-pl011: keep the flushed TX buffer mapped until DMA stops
  tty: serial: fsl_lpuart: don't unmap TX buffer before DMA has stopped

 drivers/tty/serial/amba-pl011.c | 54 +++++++++++++++++++++++++++++++--
 drivers/tty/serial/fsl_lpuart.c | 53 ++++++++++++++++++++++++++++----
 2 files changed, 98 insertions(+), 9 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

