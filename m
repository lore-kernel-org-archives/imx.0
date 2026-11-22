Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341574;
	b=uHIRKrm4qa4azxcmAjY4SjRg/sriSLbUDX7MzK56rkN9le1anD3JKre6+cuKqsRK3Ur3
	 /8TSHKWeDxHaCuJrqxx608+mK06q2QoiIhJIGwXtMKDgO4yiBdQDc6yTVd1iX7tN09bPV
	 AplXhXUfXALrFg91xM7b9WqNOBQAsAygJdARQNgrJgoChi6NqIqs1Q13f8XTV4mmyijuX
	 NrIIfuAzM56ejMC0BtbFHuVmpiGEk2hbyHt+zDZ/yeQowcblD2yT+o1MvJYw/DF21XIzL
	 s4n/joUn4monJnW5G2imhuSq4F7ju+xC+1pk01y1n8c9WZ0bf/jJGoxUfMXDxiRBkdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=;
	b=WOHG6mTVCv9i8KzFNmfkjpaQrNhzomnPVaovzAiMWIkZo7roGI6h/OIfRHwdgiGBEjgq
	 KalC6bUYaHRMz983NgbScqDkOL0TI7nQ82LyL7oJgUsE5QTC6VKNKyI/7Xti9tJKgzFs2
	 0/+YVCi7dT4RmatlW1rmTKifXj1h3i2MEI6tV1BMl0kuFG9VmiDogZ4SEud7MpjRbBiGp
	 teYMCM/9ltfgb1a8KqhKfYfZMYG4Qpsn1TvCqz0tWn0IHXy2FnOasuzblqWUBYZopUs9o
	 sJjADAlAFMvybKnryWD5QiFa1zzctpdTenhKVtPYaJTv5rEph9EB3BN0Xj9Okx+s6GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lDJRmBHA;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56648606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 09:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56648606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lDJRmBHA
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1213152f8f.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 01:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341571; x=1795946371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=;
        b=lDJRmBHAEhWfg7GgeZy8A7UNf3dAomH4XKQemmQGvXmA+hG3lBUPnw6R+AkVy3ujRJ
         UryhzI/gZxy+vxhvT6tqL2aKbUx+Sn1KWYH8kcxXoHTstdl+RzVeuxxtcWeUpVlLs4ro
         SvLMYcyY2jV0x/CJ5ZFPZSXc+dV1rxaxAOlAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341571; x=1795946371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=;
        b=lU0oNZHKfISiN9yjw3N3+gyBV8aeOjo7dGRR6VApeF9/jdO36NznhFKIxJcg0Pm/ph
         oLctGs5exPtOZUpGXM6B5xhwTkJtlMxjwpkwlwsZHrV1nTMEcH8+uKA1OEOQxuw8cNjY
         pD5JNbdiMD9czECK7wXFlV3rML9BCpSyJcAKKZmcnFyo3Vhiyft5zZ229nhbSPqOel6V
         2qJPkvPLDKoAS5Mvl2YSLd3MZ9B2d71zW2596sOPYsvsnD6mwS9qIao9eGePFOMl03AV
         o257ZYEuxuDmLwv3ZpRSrbM8IZMzVlHW0L297qVrDOgtRLRxsIcbPqvadbrLKxXci8o4
         N7kw==
X-Forwarded-Encrypted: i=1; AL+hErFSoa5ZY+3KOJo4F9zbzo7RwWciPmTmhmO7YOmclUSZT8VPTaBPm0V8OusGn5JlqfxdADU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WlImuqNjU3LdhazMsza4+nfytcQEeWfOIpb2hDpAbsUg91y0t
	Li0Jb14fBaBdZfNA7gAWCBN7vY+HQz7oXIlwgl5STPbgb0U2TleWFtGOpOtOdaijhWo=
X-Gm-Gg: AZFdTZfrgElybDZX7EULbUcnYn/XBkfUyHvdhycNMF7J1t452Ngb6uIQSruwZ9KFDsE
	R9ExlLJs2hIrkLpkCizw/OyvJ/UUuSHnQn1LMk3MFmQRlMLPu5EKTfdv4Pq/0H7PGWMfMR1DSRH
	YafQ9gyRr/ExnAWedfDnxBtSEQ0ra+p7QBtoaAC1hI/+v5fVnAfCxAsw+XWzXeCuFef6D4/nvzD
	uas0T9kSoctTRlI+3OoxJ0XMlR1vsyG5xYtfsipilJvLzJpiAXQwj4Oeq++laVbp5YM62wiYBWp
	zCqBuwGjIWAOKWtsNxYRDWZYIOrejVrnE176Qgk4UZZkl9dJ3Zl3FtQPDMmEPapvCQ5dJbYO33J
	bneXlBizuFG0ZWVTWsd+x1CoO69Co6E20eHStM6JS0kAE7qT+kfPTgboUS98PUAqMqFm5ipK6Rm
	lNI62wCLo5CN+o26yXC1I0bQbLkclnXLKY2CKqiDJu8dgRcORxI27MHvCL42Y8ksh4d0rig+wsw
	5namkgaGb/sLc1a69QoOKQAmRT1mEX2etI+X8BYLCTX89soohd9Sz9t06nfnjE0sPdZa2wWkkUg
	5ysMqgineTqHfqGQHWDM/xbBHrS8dgs7W70Q1M5G/UVVLT4Dn32d4RJsiRgG9Merb5SAEnz50Cd
	p78T4mM3l7rosMU2WJONWEENhBuKdkqeKX0WnsgX1srFi+5n55uRgmXSKSz2J+dgR0u3JxZHnPj
	iObdQH2tKdkXNwUu01R35/rlvEJA==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr185327855e9.6.1795341571496;
        Sun, 22 Nov 2026 01:59:31 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 10:59:15 +0100
Message-ID: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
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

The first patch fixes an error path of the blk-ctrl probe. The clocks
held by the last patch are released at sync_state, so they stay on
until all the consumers of the blk-ctrl have probed.

Tested on i.MX8MN (BSH SMM S2 PRO) and i.MX8MP (Engicam i.Core MX8M
Plus Fast Ethernet C.TOUCH 2.0).

Changes in v2:
- New patch
- Release the resources of the domains left on when the driver is
  removed
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed
- Rebase on the changes of the previous patch

Dario Binacchi (4):
  pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 132 +++++++++++++++++++++++++-
 2 files changed, 204 insertions(+), 5 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v2

-- 
2.43.0

