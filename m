Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53C345CBE
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521932; cv=none; b=gA+yKA1MtyeXdNZFyv+MWsrDYOUaZG+iARoxuyVVW4wt60gF3sszcmbwDN5U9M/NwkjKc32W5pnzqKzhqZHUsME5kVmWOvWBDGQSS4BacIl8OwSm5tiB7qzG45ibj0E7ZmZLtuhrxqNEXP2ckSO+P26kYMr5oINHyzyGhP31BuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521932; c=relaxed/simple;
	bh=tA36+oaDcrqq1ErWQWvZt75nn5c0v28h/EegCzrkJ8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7wzLt068v2Km9Rxqp9E+DpGGABoJvR6H59MLCZ2gnKJ9GxwFfUEBib9pXQGqheMuqgR3EWoQlh4lfwNBJPYqbBsR0E6wELEtTWUDjOjluRHgfO+8MUYtQcq65voyfNy+I7u8VacnFGgqAtZ1F01rkZmX2ewAPwr+M+2NRX737U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWRpxHZW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWRpxHZW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47362928f65so1312104f8f.2
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521930; x=1786126730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBCM5Nh2Z+pyL6wOrSHgIaBsinADA485LhOFyzTIsjs=;
        b=sWRpxHZW7Hxk9Lzb9mUFTuTlMufmAws0K9cLEsXdus4dHOxdgMYdjHYvtui//cuXmk
         7HvTrGXyLaxWTFifeUr2b4xVptC4DO7fHDFA5/L1lM+Qqc/f8QFwLKSbIbng3A6NrQR+
         6jHLN9U+k312a9Y54Ormlj9OCHaUf6HtJnFByTva+A2yC7Bzub2tLrc9yuxl2Fm2lEpo
         H7pmw2gAfBpSo1vm90h96dRVXvD3j0JjeQxYkyIqZ3Y0paLPVDwGAqm68k9tmirDHq5d
         TO6OdMX118NQHMNtQLC+uFacVu9EYjpZHCpS9sObi7ZAQEz6Ws9dHJAjZHIOcgeTri81
         gx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521930; x=1786126730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBCM5Nh2Z+pyL6wOrSHgIaBsinADA485LhOFyzTIsjs=;
        b=O5R/MVB4He0EQD+03sfGx4Xe0i6EDrIUJnWWbu5oX15iFIBxxr73aRoch2Dy4YJZ2+
         6/3Lh8n8nmOAdA6ymjZdGG+TbY+36bBjAduEonb+8rhw5L0nLU0zelrRdbuy4cYvc0zP
         KMYqZmsQSqS/wb9g77Byxnx2ALyEPdCUZg26JEK5fuMv744ZS555Rwz10welO2S2/Pe2
         LkT32IHrSG2APZ5jLL0MF3cZ2W+C+epJKDIJxBvEjCC2JvZf1LHyVi3jbQRQeZgHrSnj
         CfrqrOXVQAqyg4pX+8NvH7dSFLBPOaXTKwXYtPeuW7nDfuTqyfMpNZVHnu1ltT3FvaXD
         98Fg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6226/tgXFzcg6WF/a/YxvobWowpSePMdRt9MaOrkvxCPONCmwzAAbZOXr1rkpzY0qzzg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9D4CFK5zZLay7HFHxoPYlbvF8T0l5jFm/p0XrGZdnJE3tieit
	dlSjKx/RDAwK7D508OIQtkJf3scIRSPijy4Z3i9kbS1Uhi+U2eTuFfnF
X-Gm-Gg: AR+sD12tSr5rdukkXIzwFULNj6c9C9Owu0SQHMA/3PF2TeSVr9s1thvh+1nWahviv+k
	2aiK3uKxr63EV7l21SaEAN3/oZ92XvOFEeBhzb+N6CtuTJNuI4O+Q6scuZRac4+5O8WCgwxMAae
	XP/5ZPESrGk1ZRrxDIkWiAwvahohc7RXnqv8jV2pTVARaOjyHnDfuM5WnESCKJ8leTfFIZf8Jzi
	l1SRpiGZJpGL31jW6woqax6p8/gq2wmHVV5wwJIcX5e/k+HgJBgnZogLeSHgjfbWGkx6Entr5an
	Aur5ZMfxltW/bwOnRcvcApM0b8yQeBgXEDvXQrjcSh6SVlhpG9+xFIo/+judOTSsKMXIiRQliw4
	wRI+neP/QReK8vsglApeAI2b0msB3DdaRm81UuxBIwEyYgL//QN1DCD2Ue+6l3pzzCDYtmBpwgN
	c/KNyKbfZB87zyEAGkcJZlyDLpZPCbsr4yfck553+i+i9TeeIubfvfO9PwWea1VXU8EI1iaTpqM
	q/rYMAb5aNQbPMgpqkuwuqpCyfhnCMslB6t7wvFI2HQbgkXFL3UvCSoiT+RVnJQgAGCOnQnoF5E
	gRZmJk2J4Gv2lLJpdRuEo1mdPknUao8Puu7kuwfV6p6vG6xhASxuCIQpvEMj3fMnhf9+
X-Received: by 2002:a05:6000:c90:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-47fd72db353mr1079198f8f.21.1785521929339;
        Fri, 31 Jul 2026 11:18:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm7293694f8f.4.2026.07.31.11.18.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:18:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/5] serial: fix console lifetime bugs on failed bind and removal
Date: Fri, 31 Jul 2026 20:18:39 +0200
Message-Id: <20260731181844.11330-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes four serial/tty error-path bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-4 fix shared serial/tty core code. They move fallible allocations
before console registration, clear pointers after uart_driver registration
fails, and make a non-NULL tty cdev slot mean that the cdev is live.

Patch 5 clears i.MX's devm-allocated port-table entry after failed probe and
removal. It keeps the entry valid through console unregistration, rejects
duplicate lines and serializes table updates against other port probes.

Validation includes fail-nth sweeps on both boards. The i.MX tests also
cover the sibling-probe race, sequential unbind/rebind and
CONFIG_PROVE_LOCKING=y.

Changes in v4:
- No code changes. v3 was accidentally sent as individual mails.
  Resending as a single thread.

Changes in v3:
- Drop Cc: stable from patches 1-4.
- Patch 1: remove redundant uport->name clearing and credit Sashiko's report
  with Reported-by and Closes trailers.
- Split v2 patch 3 into two patches with corresponding Fixes tags.
- Shorten the changelogs.
- Patch 5: use scoped guards, reject occupied slots, remove the unnecessary
  line variable, document the console-callback locking constraint and add a
  backport note.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v3: https://lore.kernel.org/r/20260731180343.10818-1-kmehltretter@gmail.com
v2: https://lore.kernel.org/r/20260719221014.44354-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: skip cdev_del() when no cdev is registered
  tty: clear cdev pointer after cdev_add() failure
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 20 +++++++++++++++++---
 drivers/tty/serial/serial_core.c | 32 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.53.0
