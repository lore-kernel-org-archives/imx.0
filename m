Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117235979
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 22:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499033; cv=none; b=sTFgRSa9FEYQtYaEB9cER0bzz6qDhKId3iHpc4OWlsNnR/3LUGsbz5XSM8Bx67cllX+fLwr+bdqfrD7u2i7OFljZIoGl0fTomMcCE0DhaqB/APo/4vn0N+MP0CeVdQxeuMGqdlG3+WbfWMQb93jbab3dDtURJruPASVuJYDtewM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499033; c=relaxed/simple;
	bh=WKG4aYWvJjBpvDHeWFwlKSa+4vrtqttZ1i+2fGHy390=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IWBYJ7w69iuXH8X8CiH7LShC0qZXaoCwRtlqow8yRNYItwtQhm0/CVKGuteM5qLEszVTBmdgjzxOzm3uvhKJDhseoBa/7QZKMilNEUU6AsSawh3sgTBgFsLUv4Vbh8uc57xSWlruR1wMjUTj8w34tN+4E1rhEv+8tILXnxSLTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMADNQb8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMADNQb8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f785467faso132311f8f.2
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784499030; x=1785103830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvinVPUoJhsV28WHeBTxSrSEvMvTNBW/BR+fiFjpbyw=;
        b=WMADNQb85KOU/Jz0uD0k0n5V6Jdv3oeNagZDxWtib4cKVrDKhmp9pM6XoUwbc99/Fe
         gB9j9y2Wn2c1pIMaBqzLbvh8NSOFSHyPGH1uF53gvlPfijZrufzdGedxN7k/+gyY3E3x
         OEiHdGLkpZCpyCy2/mVr2lGT2kJiSzfAR3kJsuAAuR1SzN+JVW9qM3OS1FXmip+qRSpW
         +7VQWPw2qeA3tmKTlqG0uHnVXZ1s8ZH1PxT7zIPX9a5dIYHYscntahxhoAL5ihuh7TY8
         7AyvNRswrFohtF7zS9muObb4uamaitmwfZW6n3UsFIfkBbhhco7ptLXitFsdDU7l3X8V
         JCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499030; x=1785103830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvinVPUoJhsV28WHeBTxSrSEvMvTNBW/BR+fiFjpbyw=;
        b=lxfh/xcQJKa5AKWZhL0XdxYax1ffyZpX5I7Bl3L4ud9WhmLu5aC1fqLqZ++GxeIbz5
         38W+CKz3TtxrRpniLnVBX/qc6n/AelcLb8GenHvWcIk9U0XfZtp7+P62HR1ljKW2EF1X
         HvrJrhJAVU37NNShIaa4dvr/8WicN30e3PyIx3Y0ZILScIcm9yMdES6NSJPDA/LBzhwG
         M7dyVtAx16uPs5oU67laTZFNX2mS3OLgM+/3jE16uuJ9mFWi/Q+uAxZAnXT5xDVz6VAd
         9HGOtviFJGVKNnK5tsvl8jnMvu6FaXhJ4p2QxMQG/VRaILl4ZRQN+FZMj/rnJquzxfwj
         B5sA==
X-Forwarded-Encrypted: i=1; AHgh+RpPOk84g7DU/CzJIMqOgv8Spc0PM6mxHeVVR0mHWtuL4zOe6HVuVO5EEWA6covHG/LGaGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMkdyXz+NTcga6L6m0yXx09qYRvWv7N2RU++KnERmIVokOfTOF
	/7zxMUsLZXOR5E+rW8RuUuAvzFPTpc4cJtpzwUY/ulESzOJvvwonP8CAXMJDJXRl
X-Gm-Gg: AfdE7clwPCY5iVFw75kJ2KrKGAX9lTHo/8J4zsXsSenpWXynMxKvhZQrD5rqRzzH70x
	2BbYjoWxlOZzxZmVFtFfUYitPp577gtWuIH9A0Gye64obVrgtrEtHmK3V1Wzoz820oSVKnuzCk+
	qW3uurNzHMKlrqzVt7v0T4o0vKawFEJ5O/u1FK5vO6MvYRsfIE2/oAunxJKqzkUCf2VWhsaPWOz
	jNqLTxZpCw417Kk/7UmIbxuI55C7NLIhwzmTSVw/jZClZR32om1ywa3x3cw8o7+HwBFUfvUfT9O
	XVEpOhVbtmH72P21awj2sx4CAgnxu3wV6bSnqPz8a9vF4ayFOJC+U6T9BPlG7qS/VA/ffqrieQK
	myoFCV+ar3oj/JGcM+/NCUwSJPp/oUV3JlqZb/HnerZx3s6lO1cHEZq7DpQPERHfi0+YG00pzcB
	VMZGGW8gNjLTkyQAA55NHPUraivDMHaQuq3tU0xpP5PhNZA49jggKILRxcRs3Dw8vK2TYfMdK6k
	r46xuS2nF+8oj4QLpfFO3DQtASnL3FZTsG4GQX5OheNbsxf1hVrksvC3N8fKS/fhNj7xSwSPADS
	Dwcc4qbLBEpbdsXexdvylltS
X-Received: by 2002:a05:600c:c117:b0:495:4b1d:915f with SMTP id 5b1f17b1804b1-4954b1d91ffmr117504925e9.23.1784499030391;
        Sun, 19 Jul 2026 15:10:30 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955370d78csm114492445e9.12.2026.07.19.15.10.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 15:10:29 -0700 (PDT)
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
Subject: [PATCH v2 0/4] serial: fix console lifetime bugs on failed bind and removal
Date: Mon, 20 Jul 2026 00:10:10 +0200
Message-Id: <20260719221014.44354-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three serial/tty bind-error bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-3 fix shared serial/tty core code. Patch 1 moves fallible serial
core allocations before console registration; patch 2 clears serial-core
pointers after uart_driver registration fails; and patch 3 makes a non-NULL
tty cdev slot mean that the cdev is live.

Patch 4 clears i.MX's devm-allocated port-table entry on probe failure and
removal. It keeps the entry valid through console unregistration and
serializes the table updates against sibling probes.

Backporting note: the probe-failure half of patch 4 relies on patch 1, which
ensures that uart_add_one_port() cannot fail after registering the console.
For complete coverage, patches 1 and 4 should be backported together.

Validation for patch 4 includes reproducing the sibling-probe race under
KASAN with and without the fix, a sequential unbind/rebind regression, and
the same test with CONFIG_PROVE_LOCKING=y. The fixed kernel keeps the
console unregistered and survives an explicit printk in each applicable run.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (4):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: don't oops in tty_unregister_device() when no cdev is registered
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 21 ++++++++++++++++++--
 drivers/tty/serial/serial_core.c | 33 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 42 insertions(+), 18 deletions(-)

-- 
2.53.0
